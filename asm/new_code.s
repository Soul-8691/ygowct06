	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

@ ============================================================================
@ Support code for Red-Eyes Darkness Metal Dragon (src/new_code.c).
@ This card never existed in ygowct06, so none of this matches anything in
@ the original ROM -- there's nothing to disassemble against. Each function
@ below is marked REAL (built entirely from confirmed engine behavior, traced
@ from the existing disassembly) or NEW (invented, self-contained logic with
@ no confirmed equivalent anywhere in the original engine).
@
@ Confirmed from tracing the real disassembly this session:
@   - sub_080EEDF8(cardId) returns gCardStatsKonamiIDs[cardId-4007].race
@     (src/card.c:2105, KONAMI_BASE_ID=4007). Real, reused as-is.
@   - Hand zone:      gPlayerCards[player][0x48+i], count at index [3]
@   - Graveyard zone:  gPlayerCards[player][0x106+i], count at index [5]
@     (traced from gCardAIGraveyardSearch_0808724C @ 0x0808724C)
@   - struct PlayerCard's card:13 bitfield is extracted via
@     "lsls r0,r0,#0x13 / lsrs r0,r0,#0x13" everywhere in the real engine;
@     reused identically here.
@   - sub_0804A76C / sub_0804A870 bracket every GY-removal-as-cost sequence
@     (open/close a retry counter in gUnk_0201B290, trigger the removal
@     animation). Reused for symmetry, though their full internal behavior
@     beyond that wasn't pinned down.
@   - gCardEffects3 slot 2 is a READ-ONLY eligibility check, called
@     speculatively/repeatedly before the player ever confirms anything;
@     slot 3 is the real, once-only commit. Confirmed via Cannon Soldier's
@     real row (gCardEffectTributeDamage_0805C3EC / gCardEffectTribute_080567A0).
@     Mixing those up is what caused hand corruption on every summon, before
@     the player ever touched "Activate Effect".
@
@ CURRENT STATUS / KNOWN LIMITATIONS, as of this session:
@   - Effect (2) (Special Summon a Dragon from hand), simplified to
@     hand-only: EngineCheckDragonInHand (slot 2) / EngineSummonDragonFromHandCommit
@     (slot 3) correctly find and remove a Dragon-Type card from hand. They
@     do NOT place it anywhere yet, and the hand-browse cursor goes stale
@     after the removal (view a card and return to the duel to refresh it).
@     Both are symptoms of bypassing the real engine's action-queueing
@     system (sub_080A1A00 -> sub_080A1968 -> a dispatch on
@     gPlayerCards+0x1D90 -> per-card state machines) instead of going
@     through it; several attempts to find Tribute's specific dispatch case
@     this session were all wrong (gEngineEffectDrawSpecialSummon_080A2AD0,
@     gEngineEffectTakeControlDiscard_080A2ED0, and others), so the real
@     case is still unknown. The fully-staged version of this effect
@     (gEngineEffectRedEyesDarknessMetalDragon_SummonDragon in
@     src/new_code.c) is NOT currently wired into gCardEffects3 -- it's the
@     intended end-state design, kept for when the real removal mechanism is
@     found, but it depends on the same unconfirmed pieces.
@   - Effect (1) (banish a Dragon you control to Special Summon this card
@     from hand) is fully written (gEngineEffectRedEyesDarknessMetalDragon_BanishSummon,
@     src/new_code.c) and its dispatcher hooks are live
@     (gEngineEffectSpecialSummon_0804B81C_RDMD / _080A8C30_RDMD below), but
@     the actual call into it from _080A8C30_RDMD is commented out, since it
@     depends on the same placeholder field-zone offset (gUnk_0201C510 is
@     NOT the real field array -- writing to it corrupted unrelated state)
@     and would likely reproduce the same corruption.
@   - src/card.c currently has Goblin Calligrapher's Level set to 1, not the
@     real card's 10, so it can be Normal Summoned without 2 tributes for
@     testing. Restore to 10 once Normal Summon is no longer needed to get
@     it onto the field.
@ ============================================================================

	@ s32 EngineFindDragonInHandOrGY(u32 playerIdx, u32 race, u32 excludeCardId)
	@ REAL: scans the Hand zone then the Graveyard zone using the confirmed
	@ offsets above and the real race accessor. Returns a packed location
	@ (zone<<16 | index), zone 0=hand 1=GY, or -1 if nothing matches. The
	@ packing itself is just this file's own convention, consumed by
	@ EngineSpecialSummonFromHandOrGY below.
	thumb_func_start EngineFindDragonInHandOrGY
EngineFindDragonInHandOrGY: @ r0=playerIdx, r1=race, r2=excludeCardId
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0 @ r4 = race
	adds r5, r2, #0 @ r5 = excludeCardId

	ldr r7, _ENGFD_PLAYERCARDS
	movs r1, #1
	ands r1, r0 @ r1 = playerIdx & 1
	ldr r2, _ENGFD_ROWSTRIDE
	muls r1, r2, r1
	adds r7, r7, r1 @ r7 = &gPlayerCards[player][0] (byte address)

	@ ---- Hand zone: offset 0x48 elems (0x120 bytes), count at index [3] ----
	movs r6, #0 @ r6 = loop index i
	ldr r0, [r7, #0xC] @ count = gPlayerCards[player][3]
_ENGFD_HAND_LOOP:
	cmp r6, r0
	bge _ENGFD_GY_SCAN
	lsls r1, r6, #2
	ldr r2, _ENGFD_HAND_OFS
	adds r1, r1, r2
	ldr r1, [r7, r1] @ r1 = raw PlayerCard entry
	lsls r2, r1, #0x13
	lsrs r2, r2, #0x13 @ r2 = card:13 bitfield (card ID)
	cmp r2, r5
	beq _ENGFD_HAND_NEXT @ skip if it's the excluded card (this card itself)
	adds r0, r2, #0
	bl sub_080EEDF8 @ r0 = race of that card
	cmp r0, r4
	bne _ENGFD_HAND_NEXT2
	adds r0, r6, #0 @ found: location = (0<<16)|i
	b _ENGFD_DONE
_ENGFD_HAND_NEXT:
	ldr r0, [r7, #0xC]
	b _ENGFD_HAND_INCR
_ENGFD_HAND_NEXT2:
	ldr r0, [r7, #0xC]
_ENGFD_HAND_INCR:
	adds r6, #1
	b _ENGFD_HAND_LOOP

	@ ---- Graveyard zone: offset 0x106 elems (0x418 bytes), count at [5] ----
_ENGFD_GY_SCAN:
	movs r6, #0
	ldr r0, [r7, #0x14] @ count = gPlayerCards[player][5]
_ENGFD_GY_LOOP:
	cmp r6, r0
	bge _ENGFD_NOTFOUND
	lsls r1, r6, #2
	ldr r2, _ENGFD_GY_OFS
	adds r1, r1, r2
	ldr r1, [r7, r1]
	lsls r2, r1, #0x13
	lsrs r2, r2, #0x13
	cmp r2, r5
	beq _ENGFD_GY_NEXT
	adds r0, r2, #0
	bl sub_080EEDF8
	cmp r0, r4
	bne _ENGFD_GY_NEXT2
	movs r0, #1
	lsls r0, r0, #16
	orrs r0, r6 @ found: location = (1<<16)|i
	b _ENGFD_DONE
_ENGFD_GY_NEXT:
	ldr r0, [r7, #0x14]
	b _ENGFD_GY_INCR
_ENGFD_GY_NEXT2:
	ldr r0, [r7, #0x14]
_ENGFD_GY_INCR:
	adds r6, #1
	b _ENGFD_GY_LOOP

_ENGFD_NOTFOUND:
	movs r0, #1
	rsbs r0, r0, #0 @ r0 = -1
_ENGFD_DONE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_ENGFD_PLAYERCARDS: .4byte gPlayerCards
_ENGFD_ROWSTRIDE: .4byte 0x00000868
_ENGFD_HAND_OFS: .4byte 0x00000120 @ 0x48 elems * 4
_ENGFD_GY_OFS: .4byte 0x00000418 @ 0x106 elems * 4

@ ----------------------------------------------------------------------------
@ Everything below is NEW: no confirmed equivalent was found in the original
@ engine despite an extensive trace (gEngineEffectSpecialSummon_0804B81C,
@ sub_0804A9DC, sub_080EEEA8, gEngineEffectSpecialSummonFusion_080A7B78, and
@ gEngineEffectSpecialSummonDiscard_080A6630/_080A5F7C all turned out to be
@ classifiers or post-removal bookkeeping, never the literal field-zone
@ array access). These are reasonable, self-contained implementations against
@ this file's own invented state, not a claim about how the real ROM does it.
@ ----------------------------------------------------------------------------

	@ s32 EngineFindFaceUpMonsterByRace(u32 playerIdx, u32 race)
	@ NEW. No confirmed field-monster-zone offset exists anywhere in the
	@ traced disassembly (sub_0808D88C's 5 zone categories are Hand/Deck/
	@ Extra Deck/Graveyard/Banished -- never Field). FIELD_ZONE_OFS below is
	@ an unverified placeholder; correct it once the real offset is found.
	thumb_func_start EngineFindFaceUpMonsterByRace
EngineFindFaceUpMonsterByRace: @ r0=playerIdx, r1=race
	push {r4, r5, r6, r7, lr}
	adds r4, r1, #0

	ldr r7, _ENGFU_PLAYERCARDS
	movs r1, #1
	ands r1, r0
	ldr r2, _ENGFU_ROWSTRIDE
	muls r1, r2, r1
	adds r7, r7, r1

	movs r6, #0
	movs r0, #5 @ placeholder field-zone monster count (max 5 monster zones)
_ENGFU_LOOP:
	cmp r6, r0
	bge _ENGFU_NOTFOUND
	lsls r1, r6, #2
	ldr r2, _ENGFU_ZONE_OFS
	adds r1, r1, r2
	ldr r1, [r7, r1]
	cmp r1, #0
	beq _ENGFU_NEXT @ 0 = empty zone slot
	lsls r2, r1, #0x13
	lsrs r2, r2, #0x13
	adds r0, r2, #0
	bl sub_080EEDF8
	cmp r0, r4
	bne _ENGFU_NEXT2
	adds r0, r6, #0
	b _ENGFU_DONE
_ENGFU_NEXT:
	movs r0, #5
	b _ENGFU_INCR
_ENGFU_NEXT2:
	movs r0, #5
_ENGFU_INCR:
	adds r6, #1
	b _ENGFU_LOOP
_ENGFU_NOTFOUND:
	movs r0, #1
	rsbs r0, r0, #0
_ENGFU_DONE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_ENGFU_PLAYERCARDS: .4byte gPlayerCards
_ENGFU_ROWSTRIDE: .4byte 0x00000868
_ENGFU_ZONE_OFS: .4byte 0x000001D0 @ UNVERIFIED placeholder field-zone offset

	@ void EngineRemoveFieldMonsterFromPlay(u32 playerIdx, s32 zoneIndex)
	@ NEW: clears the (placeholder) field zone slot, brackets the removal
	@ with the REAL open/close calls every GY-banish-cost card uses.
	thumb_func_start EngineRemoveFieldMonsterFromPlay
EngineRemoveFieldMonsterFromPlay: @ r0=playerIdx, r1=zoneIndex
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_0804A76C @ REAL: open the removal-as-cost sequence

	ldr r0, _ENGRM_PLAYERCARDS
	movs r1, #1
	ands r1, r4
	ldr r2, _ENGRM_ROWSTRIDE
	muls r1, r2, r1
	adds r0, r0, r1
	lsls r1, r5, #2
	ldr r2, _ENGRM_ZONE_OFS
	adds r1, r1, r2
	movs r2, #0
	str r2, [r0, r1] @ clear the slot (NEW: no shift/compaction modeled)

	bl sub_0804A870 @ REAL: close the removal-as-cost sequence
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_ENGRM_PLAYERCARDS: .4byte gPlayerCards
_ENGRM_ROWSTRIDE: .4byte 0x00000868
_ENGRM_ZONE_OFS: .4byte 0x000001D0 @ UNVERIFIED, must match EngineFindFaceUpMonsterByRace

	@ void EngineSpecialSummonFromHand(u32 playerIdx, u32 cardId)
	@ NEW: the actual hand->field placement is unconfirmed (see notes
	@ above), but the surrounding announce convention is REAL and matches
	@ gEngineEffectSpecialSummonDiscard_080A6630's case 0 exactly.
	thumb_func_start EngineSpecialSummonFromHand
EngineSpecialSummonFromHand: @ r0=playerIdx, r1=cardId
	push {lr}
	movs r1, #0
	bl gEngineEffectSpecialSummon_08093390 @ REAL: announce (no-op for CPU)
	pop {r1}
	bx r1
	.align 2, 0

	@ void EngineSpecialSummonFromHandOrGY(u32 playerIdx, s32 location)
	@ NEW for the same reason as above; location is this file's own
	@ (zone<<16 | index) packing from EngineFindDragonInHandOrGY.
	thumb_func_start EngineSpecialSummonFromHandOrGY
EngineSpecialSummonFromHandOrGY: @ r0=playerIdx, r1=location
	push {lr}
	movs r1, #0
	bl gEngineEffectSpecialSummon_08093390 @ REAL: announce (no-op for CPU)
	pop {r1}
	bx r1
	.align 2, 0

@ ----------------------------------------------------------------------------
@ Once-per-turn tracking. No equivalent was found anywhere (gUnk_0201E4D0
@ only tracks the single currently-resolving effect, not a persistent
@ per-card, per-turn record) -- fully NEW, self-contained state. NOTE:
@ nothing here is ever reset by a real turn-change event, so right now this
@ only suppresses a second use within the same call chain, not truly "once
@ per turn" -- it needs to be wired to a real turn-change event to behave
@ correctly.
@ ----------------------------------------------------------------------------

	@ bool32 EngineUsedEffectThisTurn(u32 playerIdx, u32 cardId, u32 effectSlot)
	thumb_func_start EngineUsedEffectThisTurn
EngineUsedEffectThisTurn: @ r0=playerIdx, r1=cardId, r2=effectSlot
	lsls r0, r0, #1
	adds r0, r0, r2 @ index = playerIdx*2 + effectSlot  (effectSlot is 0 or 1)
	ldr r1, _ENGUT_FLAGS
	lsls r2, r0, #1
	adds r1, r1, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _ENGUT_FALSE
	movs r0, #1
	b _ENGUT_RET
_ENGUT_FALSE:
	movs r0, #0
_ENGUT_RET:
	bx lr
	.align 2, 0
_ENGUT_FLAGS: .4byte gEngNC_UsedEffectFlags

	@ void EngineMarkUsedEffectThisTurn(u32 playerIdx, u32 cardId, u32 effectSlot)
	thumb_func_start EngineMarkUsedEffectThisTurn
EngineMarkUsedEffectThisTurn: @ r0=playerIdx, r1=cardId, r2=effectSlot
	lsls r0, r0, #1
	adds r0, r0, r2
	ldr r1, _ENGMT_FLAGS
	lsls r2, r0, #1
	adds r1, r1, r2
	movs r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_ENGMT_FLAGS: .4byte gEngNC_UsedEffectFlags

	@ Anteatereatingant
	@ Archlord Zerato
	@ Behemoth the King of All Animals
	@ Blue-Eyes Shining Dragon
	@ Chaos Sorcerer
	@ Dark Dreadroute
	@ Dark Necrofear
	@ Elemental HERO Bubbleman
	@ Fusilier Dragon, the Dual-Mode Beast
	@ Garuda the Wind Spirit
	@ Gilasaurus
	@ Guardian Exode
	@ Hamon, Lord of Striking Thunder
	@ Helios Tris Megiste
	@ King of Destruction - Xexex
	@ Lava Golem
	@ Master Monk
	@ Mazera DeVille
	@ Metalzoa
	@ Moisture Creature
	@ Ocean Dragon Lord - Neo-Daedalus
	@ Perfectly Ultimate Great Moth
	@ Red-Eyes Black Metal Dragon
	@ Swift Gaia the Fierce Knight
	@ The Fiend Megacyber
	@ Ulevo
	@ VWXYZ-Dragon Catapult Cannon
	@ Victory D.
	@ XY-Dragon Cannon
	@ XYZ-Dragon Cannon
	@ XZ-Tank Cannon
	thumb_func_start gEngineEffectSpecialSummon_080A8C30_New
gEngineEffectSpecialSummon_080A8C30_New: @ 0x080A8C30
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	ldr r1, _080A8C88 @ =gUnk_0201E4D0
	ldr r0, [r1]
	lsls r0, r0, #9
	lsrs r2, r0, #0x11
	ldr r0, _RDMD_0804B81C_ID
	adds r4, r1, #0
	cmp r2, r0
	bne next
	@ NOTE: tried gating this on gUnk_0201E4D0.unk12 & 2 (the flag confirmed
	@ needed in the now-dead gEngineEffectSpecialSummon_080A8C30_RDMD copy)
	@ to stop this firing outside the real alt-summon context -- that broke
	@ the legitimate case too (the banish stopped working even with exactly
	@ 1 Dragon on the field), so unk12&2 isn't reliably set at this specific
	@ call point. Reverted to unconditional; the real fix for the
	@ Activate-Effect interference needs a different signal.
	b _080A8F18_
next:
	ldr r0, _080A8C8C @ =0x000017C2 (Blue-Eyes Shining Dragon)
	adds r4, r1, #0
	cmp r2, r0
	bne _080A8C4A
	b _080A8F18
_080A8C4A:
	cmp r2, r0
	ble _080A8C50
	b _080A8DBC
_080A8C50:
	ldr r0, _080A8C90 @ =0x00001487 (Garuda the Wind Spirit)
	cmp r2, r0
	bgt _080A8D18
	subs r0, #4
	cmp r2, r0
	blt _080A8C5E
	b _080A8F36
_080A8C5E:
	ldr r0, _080A8C94 @ =0x00001299 (The Fiend Megacyber)
	cmp r2, r0
	bne _080A8C66
	b _080A8F1E
_080A8C66:
	cmp r2, r0
	bgt _080A8CC0
	ldr r0, _080A8C98 @ =0x00000FE9 (Perfectly Ultimate Great Moth)
	cmp r2, r0
	bne _080A8C72
	b _080A8F0C
_080A8C72:
	cmp r2, r0
	bgt _080A8C9C
	subs r0, #0xa
	cmp r2, r0
	ble _080A8C7E
	b _080A8F84
_080A8C7E:
	subs r0, #1
	cmp r2, r0
	bge _080A8C86
	b _080A8F84
_080A8C86:
	b _080A8F0C
	.align 2, 0
_080A8C88: .4byte gUnk_0201E4D0
_RDMD_0804B81C_ID: .4byte 0x000017D0 @ KONAMI_GOBLIN_CALLIGRAPHER (6096)
_080A8C8C: .4byte 0x000017C2 @ Blue-Eyes Shining Dragon
_080A8C90: .4byte 0x00001487 @ Garuda the Wind Spirit
_080A8C94: .4byte 0x00001299 @ The Fiend Megacyber
_080A8C98: .4byte 0x00000FE9 @ Perfectly Ultimate Great Moth
_080A8C9C:
	ldr r0, _080A8CB4 @ =0x0000112E (Metalzoa)
	cmp r2, r0
	bne _080A8CA4
	b _080A8F18
_080A8CA4:
	cmp r2, r0
	bgt _080A8CB8
	subs r0, #0x12
	cmp r2, r0
	bne _080A8CB0
	b _080A8F12
_080A8CB0:
	b _080A8F84
	.align 2, 0
_080A8CB4: .4byte 0x0000112E @ Metalzoa
_080A8CB8:
	ldr r0, _080A8CBC @ =0x0000128C (Red-Eyes Black Metal Dragon)
	b _080A8EB6
	.align 2, 0
_080A8CBC: .4byte 0x0000128C @ Red-Eyes Black Metal Dragon
_080A8CC0:
	ldr r0, _080A8CE8 @ =0x000013B5 (Moisture Creature)
	cmp r2, r0
	bne _080A8CC8
	b _080A8F54
_080A8CC8:
	cmp r2, r0
	bgt _080A8CEC
	subs r0, #0x2f
	cmp r2, r0
	bge _080A8CD4
	b _080A8F84
_080A8CD4:
	adds r0, #2
	cmp r2, r0
	bgt _080A8CDC
	b _080A8F7E
_080A8CDC:
	adds r0, #2
	cmp r2, r0
	bne _080A8CE4
	b _080A8F2A
_080A8CE4:
	b _080A8F84
	.align 2, 0
_080A8CE8: .4byte 0x000013B5 @ Moisture Creature
_080A8CEC:
	ldr r0, _080A8D04 @ =0x00001466 (Dark Necrofear)
	cmp r2, r0
	bne _080A8CF4
	b _080A8F36
_080A8CF4:
	cmp r2, r0
	bgt _080A8D08
	subs r0, #0x7d
	cmp r2, r0
	bne _080A8D00
	b _080A8F30
_080A8D00:
	b _080A8F84
	.align 2, 0
_080A8D04: .4byte 0x00001466 @ Dark Necrofear
_080A8D08:
	ldr r0, _080A8D14 @ =0x0000147B (Swift Gaia the Fierce Knight)
	cmp r2, r0
	bne _080A8D10
	b _080A8F3C
_080A8D10:
	b _080A8F84
	.align 2, 0
_080A8D14: .4byte 0x0000147B @ Swift Gaia the Fierce Knight
_080A8D18:
	ldr r0, _080A8D48 @ =0x000016C9 (Chaos Sorcerer)
	cmp r2, r0
	bgt _080A8D78
	subs r0, #4
	cmp r2, r0
	blt _080A8D26
	b _080A8F36
_080A8D26:
	ldr r0, _080A8D4C @ =0x000015B4 (XYZ-Dragon Cannon)
	cmp r2, r0
	bne _080A8D2E
	b _080A8F4E
_080A8D2E:
	cmp r2, r0
	bgt _080A8D60
	subs r0, #0x3c
	cmp r2, r0
	bne _080A8D3A
	b _080A8F48
_080A8D3A:
	cmp r2, r0
	bgt _080A8D50
	subs r0, #0x2d
	cmp r2, r0
	bne _080A8D46
	b _080A8F54
_080A8D46:
	b _080A8F84
	.align 2, 0
_080A8D48: .4byte 0x000016C9 @ Chaos Sorcerer
_080A8D4C: .4byte 0x000015B4 @ XYZ-Dragon Cannon
_080A8D50:
	ldr r0, _080A8D5C @ =0x000015B1 (XY-Dragon Cannon)
	cmp r2, r0
	bne _080A8D58
	b _080A8F4E
_080A8D58:
	b _080A8F84
	.align 2, 0
_080A8D5C: .4byte 0x000015B1 @ XY-Dragon Cannon
_080A8D60:
	ldr r0, _080A8D74 @ =0x000015F9 (XZ-Tank Cannon)
	cmp r2, r0
	bge _080A8D68
	b _080A8F84
_080A8D68:
	adds r0, #1
	cmp r2, r0
	bgt _080A8D70
	b _080A8F4E
_080A8D70:
	adds r0, #0x52
	b _080A8E5C
	.align 2, 0
_080A8D74: .4byte 0x000015F9 @ XZ-Tank Cannon
_080A8D78:
	ldr r0, _080A8D94 @ =0x00001725 (Ulevo (None))
	cmp r2, r0
	bne _080A8D80
	b _080A8F7E
_080A8D80:
	cmp r2, r0
	bgt _080A8DA0
	subs r0, #0x41
	cmp r2, r0
	bne _080A8D8C
	b _080A8F36
_080A8D8C:
	cmp r2, r0
	bgt _080A8D98
	subs r0, #0x19
	b _080A8EEC
	.align 2, 0
_080A8D94: .4byte 0x00001725 @ Ulevo (None)
_080A8D98:
	ldr r0, _080A8D9C @ =0x000016EC (Victory D.)
	b _080A8E6A
	.align 2, 0
_080A8D9C: .4byte 0x000016EC @ Victory D.
_080A8DA0:
	ldr r0, _080A8DB0 @ =0x00001758 (Archlord Zerato)
	cmp r2, r0
	bne _080A8DA8
	b _080A8F18
_080A8DA8:
	cmp r2, r0
	bgt _080A8DB4
	subs r0, #0x2f
	b _080A8E6A
	.align 2, 0
_080A8DB0: .4byte 0x00001758 @ Archlord Zerato
_080A8DB4:
	ldr r0, _080A8DB8 @ =0x0000176C (Mazera DeVille)
	b _080A8EB6
	.align 2, 0
_080A8DB8: .4byte 0x0000176C @ Mazera DeVille
_080A8DBC:
	ldr r0, _080A8DF0 @ =0x00001954 (VWXYZ-Dragon Catapult Cannon)
	cmp r2, r0
	bgt _080A8E78
	subs r0, #1
	cmp r2, r0
	blt _080A8DCA
	b _080A8F4E
_080A8DCA:
	subs r0, #0xbf
	cmp r2, r0
	bne _080A8DD2
	b _080A8F18
_080A8DD2:
	cmp r2, r0
	bgt _080A8E20
	subs r0, #0xcc
	cmp r2, r0
	bgt _080A8DF4
	subs r0, #1
	cmp r2, r0
	blt _080A8DE4
	b _080A8F60
_080A8DE4:
	subs r0, #1
	cmp r2, r0
	bne _080A8DEC
	b _080A8F5A
_080A8DEC:
	b _080A8F84
	.align 2, 0
_080A8DF0: .4byte 0x00001954 @ VWXYZ-Dragon Catapult Cannon
_080A8DF4:
	ldr r0, _080A8E0C @ =0x00001838 (Fusilier Dragon, the Dual-Mode Beast)
	cmp r2, r0
	bne _080A8DFC
	b _080A8F3C
_080A8DFC:
	cmp r2, r0
	bgt _080A8E10
	subs r0, #0x32
	cmp r2, r0
	bne _080A8E08
	b _080A8F72
_080A8E08:
	b _080A8F84
	.align 2, 0
_080A8E0C: .4byte 0x00001838 @ Fusilier Dragon, the Dual-Mode Beast
_080A8E10:
	ldr r0, _080A8E1C @ =0x00001864 (Behemoth the King of All Animals)
	cmp r2, r0
	bne _080A8E18
	b _080A8F42
_080A8E18:
	b _080A8F84
	.align 2, 0
_080A8E1C: .4byte 0x00001864 @ Behemoth the King of All Animals
_080A8E20:
	ldr r0, _080A8E44 @ =0x000018E8 (Ocean Dragon Lord - Neo-Daedalus)
	cmp r2, r0
	bne _080A8E28
	b _080A8F18
_080A8E28:
	cmp r2, r0
	bgt _080A8E50
	subs r0, #0x34
	cmp r2, r0
	bne _080A8E34
	b _080A8F36
_080A8E34:
	cmp r2, r0
	bgt _080A8E48
	subs r0, #0x1f
	cmp r2, r0
	bne _080A8E40
	b _080A8F6C
_080A8E40:
	b _080A8F84
	.align 2, 0
_080A8E44: .4byte 0x000018E8 @ Ocean Dragon Lord - Neo-Daedalus
_080A8E48:
	ldr r0, _080A8E4C @ =0x000018B9 (Master Monk)
	b _080A8EB6
	.align 2, 0
_080A8E4C: .4byte 0x000018B9 @ Master Monk
_080A8E50:
	ldr r0, _080A8E64 @ =0x000018F9 (Elemental Hero Bubbleman)
	cmp r2, r0
	beq _080A8F1E
	cmp r2, r0
	bgt _080A8E68
	subs r0, #3
_080A8E5C:
	cmp r2, r0
	beq _080A8F1E
	b _080A8F84
	.align 2, 0
_080A8E64: .4byte 0x000018F9 @ Elemental Hero Bubbleman
_080A8E68:
	ldr r0, _080A8E74 @ =0x00001905 (Dark Dreadroute)
_080A8E6A:
	cmp r2, r0
	bne _080A8E70
	b _080A8F7E
_080A8E70:
	b _080A8F84
	.align 2, 0
_080A8E74: .4byte 0x00001905 @ Dark Dreadroute
_080A8E78:
	ldr r0, _080A8EA4 @ =0x000019A4 (Hamon, Lord of Striking Thunder)
	cmp r2, r0
	bgt _080A8EC0
	subs r0, #1
	cmp r2, r0
	blt _080A8E86
	b _080A8F78
_080A8E86:
	subs r0, #0x21
	cmp r2, r0
	beq _080A8F18
	cmp r2, r0
	bgt _080A8EA8
	subs r0, #0x14
	cmp r2, r0
	bgt _080A8F84
	subs r0, #3
	cmp r2, r0
	blt _080A8F84
	bl gEngineEffectSpecialSummonDiscard_080A81FC
	b _080A8FB0
	.align 2, 0
_080A8EA4: .4byte 0x000019A4 @ Hamon, Lord of Striking Thunder
_080A8EA8:
	ldr r0, _080A8EBC @ =0x00001985 (King of Destruction - Xexex (None))
	cmp r2, r0
	blt _080A8F84
	adds r0, #1
	cmp r2, r0
	ble _080A8F7E
	adds r0, #6
_080A8EB6:
	cmp r2, r0
	beq _080A8F18
	b _080A8F84
	.align 2, 0
_080A8EBC: .4byte 0x00001985 @ King of Destruction - Xexex (None)
_080A8EC0:
	ldr r0, _080A8EDC @ =0x000019C8 (Anteatereatingant)
	cmp r2, r0
	beq _080A8F78
	cmp r2, r0
	bgt _080A8EE0
	subs r0, #0x22
	cmp r2, r0
	beq _080A8F66
	cmp r2, r0
	blt _080A8F5A
	adds r0, #4
	cmp r2, r0
	beq _080A8F24
	b _080A8F84
	.align 2, 0
_080A8EDC: .4byte 0x000019C8 @ Anteatereatingant
_080A8EE0:
	ldr r0, _080A8EF4 @ =0x000019F0 (Guardian Exode)
	cmp r2, r0
	beq _080A8F18
	cmp r2, r0
	bgt _080A8EF8
	subs r0, #0x26
_080A8EEC:
	cmp r2, r0
	beq _080A8F36
	b _080A8F84
	.align 2, 0
_080A8EF4: .4byte 0x000019F0 @ Guardian Exode
_080A8EF8:
	ldr r0, _080A8F08 @ =0x000019F8 (Helios Tris Megiste)
	cmp r2, r0
	bgt _080A8F84
	subs r0, #1
	cmp r2, r0
	blt _080A8F84
	b _080A8F18
	.align 2, 0
_080A8F08: .4byte 0x000019F8 @ Helios Tris Megiste
_080A8F0C:
	bl gEngineEffectSpecialSummonGraveyard_080A6508
	b _080A8FB0
_080A8F12:
	bl gEngineEffectSpecialSummonGraveyard_080A6B38
	b _080A8FB0
_080A8F18:
	bl gEngineEffectSpecialSummonDiscard_080A6630
	b _080A8FB0
_080A8F18_:
	bl gEngineEffectBanishToSpecialSummon
	cmp r0, #0
	blt _RDMD_8F18_FALLBACK @ not eligible -- see note below, don't route this through _080A8FB0
	b _080A8FB0
_RDMD_8F18_FALLBACK:
	@ _080A8F18_ is reached whenever gUnk_0201E4D0.card_id==KONAMI_GOBLIN_CALLIGRAPHER,
	@ unconditionally -- including while evaluating something unrelated (e.g.
	@ effect (2)'s "Activate Effect" availability), since that also sets
	@ card_id to ours. _080A8FB0 (the shared tail every other branch in this
	@ dispatcher also jumps to) has special handling for a negative result:
	@ it sets gUnk_0201E4D0.unk12 bit 3, queues message opcode 0x29, and
	@ returns +1 (not the original -1!) to our own caller, which in turn
	@ clears unk12 bit 1 -- real, confirmed mutation of shared state that
	@ happens every time we report "not eligible" here, breaking effect (2)
	@ whenever it's evaluated while no field Dragon (other than this card
	@ itself) exists. Falling through to the untouched original dispatch
	@ instead avoids ever feeding it a negative result for our card_id.
	bl gEngineEffectSpecialSummon_080A8C30
	b _080A8FB0
_080A8F1E:
	bl gEngineEffectSpecialSummonDiscard_080A7064
	b _080A8FB0
_080A8F24:
	bl gEngineEffectSpecialSummonDiscard_080A7084
	b _080A8FB0
_080A8F2A:
	bl gEngineEffectGraveyardDraw_080A6CC8
	b _080A8FB0
_080A8F30:
	bl gEngineEffectSpecialSummonGraveyard_080A6E74
	b _080A8FB0
_080A8F36:
	bl gEngineEffectSpecialSummonGraveyard_080A71E4
	b _080A8FB0
_080A8F3C:
	bl gEngineEffectSpecialSummonDiscard_080A7650
	b _080A8FB0
_080A8F42:
	bl gEngineEffectSpecialSummonDiscard_080A7788
	b _080A8FB0
_080A8F48:
	bl gEngineEffectSpecialSummonGraveyard_080A78DC
	b _080A8FB0
_080A8F4E:
	bl gEngineEffectSpecialSummonFusion_080A7B78
	b _080A8FB0
_080A8F54:
	bl gEngineEffectChangePosition_080A7F4C
	b _080A8FB0
_080A8F5A:
	bl gEngineEffectSpecialSummonNegate_080A672C
	b _080A8FB0
_080A8F60:
	bl gEngineEffectSpecialSummonDiscard_080A70AC
	b _080A8FB0
_080A8F66:
	bl gEngineEffectSpecialSummonFusion_080A689C
	b _080A8FB0
_080A8F6C:
	bl gEngineEffectSpecialSummonBoostATK_080A6A20
	b _080A8FB0
_080A8F72:
	bl gEngineEffectSpecialSummonBanish_080A70D8
	b _080A8FB0
_080A8F78:
	bl gEngineEffectSpecialSummonSendToGY_080A85D0
	b _080A8FB0
_080A8F7E:
	bl gEngineEffectSpecialSummonDiscard_080A6C8C
	b _080A8FB0
_080A8F84:
	ldr r0, [r4]
	lsls r0, r0, #9
	lsrs r0, r0, #0x11
	bl gEngineEffectSpecialSummonFusionSummon_0804B164
	cmp r0, #0
	beq _080A8F98
	bl gEngineEffectGraveyard_080A87EC
	b _080A8FB0
_080A8F98:
	ldr r0, [r4]
	lsls r0, r0, #9
	lsrs r0, r0, #0x11
	bl gEngineEffectSpecialSummonDiscard_0804B30C
	cmp r0, #0
	beq _080A8FAC
	bl gEngineEffectBoostATKTribute_080A89F8
	b _080A8FB0
_080A8FAC:
	bl gEngineEffectSpecialSummonDiscard_080A5F7C
_080A8FB0:
	adds r3, r0, #0
	cmp r3, #0
	bge _080A8FDC
	ldr r1, _080A8FD0 @ =gUnk_0201E4D0
	movs r0, #8
	ldrb r2, [r1, #0x12]
	orrs r0, r2
	strb r0, [r1, #0x12]
	movs r0, #0x29
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl gEngineEffectSpecialSummon_0801EC9C
_080A8FCC:
	movs r0, #1
	b _080A9126
	.align 2, 0
_080A8FD0: .4byte gUnk_0201E4D0
_080A8FD4:
	ldrh r4, [r4]
	lsrs r4, r4, #8
	mov r8, r4
	b _080A9032
_080A8FDC:
	cmp r3, #1
	beq _080A8FE2
	b _080A9124
_080A8FE2:
	ldr r4, _080A9048 @ =gUnk_0201E4D0
	ldrb r1, [r4]
	lsls r0, r1, #0x1f
	ldr r1, [r4]
	lsls r1, r1, #9
	lsrs r1, r1, #0x11
	ldr r2, _080A904C @ =0x00001578 (Lava Golem)
	lsrs r5, r0, #0x1f
	cmp r1, r2
	bne _080A8FF8
	eors r5, r3
_080A8FF8:
	adds r0, r5, #0
	bl gEngineEffectSpecialSummon_08033634
	mov r8, r0
	movs r6, #0
	adds r1, r4, #0
	ldrb r2, [r1, #8]
	cmp r6, r2
	bge _080A9032
_080A900A:
	lsls r0, r6, #1
	adds r7, r1, #0
	adds r7, #0xc
	adds r4, r0, r7
	ldrh r1, [r4]
	ldrb r0, [r4]
	cmp r0, r5
	bne _080A9026
	lsrs r1, r1, #8
	adds r0, r5, #0
	bl gEngineEffectSpecialSummon_080333AC
	cmp r0, #0
	bne _080A8FD4
_080A9026:
	adds r6, #1
	adds r1, r7, #0
	subs r1, #0xc
	ldrb r3, [r1, #8]
	cmp r6, r3
	blt _080A900A
_080A9032:
	mov r4, r8
	cmp r4, #0
	bge _080A9050
	movs r0, #0x29
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl gEngineEffectSpecialSummon_0801EC9C
	b _080A9098
	.align 2, 0
_080A9048: .4byte gUnk_0201E4D0
_080A904C: .4byte 0x00001578 @ Lava Golem
_080A9050:
	ldr r2, _080A9074 @ =gUnk_0201E4D0
	movs r0, #2
	ldrb r1, [r2, #0x12]
	ands r0, r1
	cmp r0, #0
	beq _080A9078
	ldrb r3, [r2]
	lsls r0, r3, #0x1f
	lsrs r0, r0, #0x1f
	ldrh r4, [r2, #2]
	lsrs r1, r4, #7
	lsrs r3, r3, #6
	ldrb r2, [r2, #8]
	str r2, [sp]
	mov r2, r8
	bl gEngineEffectSpecialSummonDamage_080ABE54
	b _080A9098
	.align 2, 0
_080A9074: .4byte gUnk_0201E4D0
_080A9078:
	ldrb r1, [r2]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	ldrh r3, [r2, #2]
	lsrs r4, r3, #7
	ldrb r3, [r2, #8]
	movs r2, #0
	lsrs r1, r1, #6
	cmp r1, #0
	bne _080A908E
	movs r2, #1
_080A908E:
	str r2, [sp]
	adds r1, r4, #0
	mov r2, r8
	bl gEngineEffectChangePosition_080ABBD8
_080A9098:
	ldr r4, _080A911C @ =gUnk_0201E4D0
	ldr r0, [r4]
	lsls r0, r0, #9
	lsrs r1, r0, #0x11
	ldr r0, _080A9120 @ =0x00001488 (Gilasaurus)
	cmp r1, r0
	bne _080A8FCC
	movs r0, #2
	ldrb r2, [r4, #0x12]
	ands r0, r2
	cmp r0, #0
	beq _080A8FCC
	ldrb r3, [r4]
	lsls r0, r3, #0x1f
	lsrs r0, r0, #0x1f
	movs r5, #1
	subs r0, r5, r0
	movs r2, #0
	bl sub_0808DAB0
	cmp r0, #0
	bne _080A90C6
	b _080A8FCC
_080A90C6:
	ldrb r1, [r4]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	subs r0, r5, r0
	bl gEngineEffectSpecialSummon_080335B8
	cmp r0, #0
	bgt _080A90D8
	b _080A8FCC
_080A90D8:
	ldrb r2, [r4]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	subs r0, r5, r0
	bl gEngineEffectSpecialSummonChangePosition_0803BB7C
	cmp r0, #0
	bne _080A90EA
	b _080A8FCC
_080A90EA:
	ldrb r3, [r4]
	lsls r0, r3, #0x1f
	lsrs r0, r0, #0x1f
	bl gEngineEffectSpecialSummon_08033634
	ldrb r1, [r4]
	lsls r2, r1, #0x1f
	lsls r0, r0, #0x10
	movs r1, #0xf8
	lsls r1, r1, #0xd
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	orrs r2, r0
	ldr r0, [r4]
	lsls r0, r0, #9
	lsrs r0, r0, #0x11
	orrs r2, r0
	ldrh r4, [r4, #2]
	lsrs r1, r4, #7
	adds r0, r2, #0
	bl sub_0804CC8C
	b _080A8FCC
	.align 2, 0
_080A911C: .4byte gUnk_0201E4D0
_080A9120: .4byte 0x00001488 @ Gilasaurus
_080A9124:
	movs r0, #0
_080A9126:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	@ Archlord Zerato
	@ Black Luster Soldier - Envoy of the Beginning
	@ Chaos Sorcerer
	@ Dark Eradicator Warlock
	@ Dark Necrofear
	@ Doom Dozer
	@ Elemental HERO Neo Bubbleman
	@ Fushioh Richie
	@ Gate Guardian
	@ Gearfried the Swordmaster
	@ Harpie Lady Sisters
	@ Horus the Black Flame Dragon LV8
	@ Lava Golem
	@ Machina Force
	@ Masked Beast Des Gardius
	@ Master Monk
	@ Metalzoa
	@ Perfectly Ultimate Great Moth
	@ Princess Pikeru
	@ Red-Eyes Black Metal Dragon
	@ Theinen the Great Sphinx
	@ Toon Dark Magician Girl
	@ Valkyrion the Magna Warrior
	@ Vampire Genesis
	@ Wall Shadow
	thumb_func_start gEngineEffectSpecialSummon_0804B81C_New
gEngineEffectSpecialSummon_0804B81C_New: @ 0x0804B81C
	adds r1, r0, #0
	@ldr r0, _RDMD_0804B81C_ID_
	@cmp r1, r0
	@bne next_
	@b _0804BA44
next_:
	ldr r0, _0804B85C @ =0x00001758 (Archlord Zerato)
	cmp r1, r0
	bne _0804B826
	b _0804BA44
_0804B826:
	cmp r1, r0
	ble _0804B82C
	b _0804B94C
_0804B82C:
	ldr r0, _0804B860 @ =0x00001466 (Dark Necrofear)
	cmp r1, r0
	bne _0804B834
	b _0804BA40
_0804B834:
	cmp r1, r0
	bgt _0804B8CC
	ldr r0, _0804B864 @ =0x0000112E (Metalzoa)
	cmp r1, r0
	bne _0804B840
	b _0804BA40
_0804B840:
	cmp r1, r0
	bgt _0804B88C
	ldr r0, _0804B868 @ =0x00000FE5 (Harpie Lady Sisters)
	cmp r1, r0
	bne _0804B84C
	b _0804BA48
_0804B84C:
	cmp r1, r0
	bgt _0804B86C
	subs r0, #6
	cmp r1, r0
	ble _0804B858
	b _0804BA54
_0804B858:
	subs r0, #1
	b _0804B8A2
	.align 2, 0
_RDMD_0804B81C_ID_: .4byte 0x000017D0 @ KONAMI_GOBLIN_CALLIGRAPHER (6096)
_0804B85C: .4byte 0x00001758 @ Archlord Zerato
_0804B860: .4byte 0x00001466 @ Dark Necrofear
_0804B864: .4byte 0x0000112E @ Metalzoa
_0804B868: .4byte 0x00000FE5 @ Harpie Lady Sisters
_0804B86C:
	ldr r0, _0804B87C @ =0x00001117 (Wall Shadow)
	cmp r1, r0
	bne _0804B874
	b _0804BA48
_0804B874:
	cmp r1, r0
	bgt _0804B884
	ldr r0, _0804B880 @ =0x00000FE9 (Perfectly Ultimate Great Moth)
	b _0804B93E
	.align 2, 0
_0804B87C: .4byte 0x00001117 @ Wall Shadow
_0804B880: .4byte 0x00000FE9 @ Perfectly Ultimate Great Moth
_0804B884:
	ldr r0, _0804B888 @ =0x0000111C (Gate Guardian)
	b _0804B93E
	.align 2, 0
_0804B888: .4byte 0x0000111C @ Gate Guardian
_0804B88C:
	ldr r0, _0804B8AC @ =0x0000128C (Red-Eyes Black Metal Dragon)
	cmp r1, r0
	bne _0804B894
	b _0804BA40
_0804B894:
	cmp r1, r0
	bgt _0804B8B0
	subs r0, #0xd
	cmp r1, r0
	ble _0804B8A0
	b _0804BA54
_0804B8A0:
	subs r0, #2
_0804B8A2:
	cmp r1, r0
	bge _0804B8A8
	b _0804BA54
_0804B8A8:
	b _0804BA40
	.align 2, 0
_0804B8AC: .4byte 0x0000128C @ Red-Eyes Black Metal Dragon
_0804B8B0:
	ldr r0, _0804B8C0 @ =0x0000138A (Valkyrion the Magna Warrior)
	cmp r1, r0
	bne _0804B8B8
	b _0804BA40
_0804B8B8:
	cmp r1, r0
	bgt _0804B8C4
	subs r0, #0xe5
	b _0804B93E
	.align 2, 0
_0804B8C0: .4byte 0x0000138A @ Valkyrion the Magna Warrior
_0804B8C4:
	ldr r0, _0804B8C8 @ =0x000013E9 (Masked Beast Des Gardius (None))
	b _0804B93E
	.align 2, 0
_0804B8C8: .4byte 0x000013E9 @ Masked Beast Des Gardius (None)
_0804B8CC:
	ldr r0, _0804B8EC @ =0x00001578 (Lava Golem)
	cmp r1, r0
	bne _0804B8D4
	b _0804BA40
_0804B8D4:
	cmp r1, r0
	bgt _0804B90C
	subs r0, #0xf1
	cmp r1, r0
	bgt _0804B8F0
	subs r0, #4
	cmp r1, r0
	blt _0804B8E6
	b _0804BA40
_0804B8E6:
	subs r0, #0x15
	b _0804B93E
	.align 2, 0
_0804B8EC: .4byte 0x00001578 @ Lava Golem
_0804B8F0:
	ldr r0, _0804B900 @ =0x00001534 (Fushioh Richie)
	cmp r1, r0
	bne _0804B8F8
	b _0804BA40
_0804B8F8:
	cmp r1, r0
	bgt _0804B904
	subs r0, #0x38
	b _0804B93E
	.align 2, 0
_0804B900: .4byte 0x00001534 @ Fushioh Richie
_0804B904:
	ldr r0, _0804B908 @ =0x0000154A (Toon Dark Magician Girl)
	b _0804B93E
	.align 2, 0
_0804B908: .4byte 0x0000154A @ Toon Dark Magician Girl
_0804B90C:
	ldr r0, _0804B930 @ =0x000016C9 (Chaos Sorcerer)
	cmp r1, r0
	bgt _0804B934
	subs r0, #4
	cmp r1, r0
	blt _0804B91A
	b _0804BA40
_0804B91A:
	subs r0, #0x82
	cmp r1, r0
	bge _0804B922
	b _0804BA54
_0804B922:
	adds r0, #2
	cmp r1, r0
	bgt _0804B92A
	b _0804BA4C
_0804B92A:
	adds r0, #0x37
	b _0804B9EE
	.align 2, 0
_0804B930: .4byte 0x000016C9 @ Chaos Sorcerer
_0804B934:
	ldr r0, _0804B948 @ =0x000016CB (Black Luster Soldier - Envoy of the Beginning)
	cmp r1, r0
	bne _0804B93C
	b _0804BA40
_0804B93C:
	adds r0, #0x19
_0804B93E:
	cmp r1, r0
	bne _0804B944
	b _0804BA40
_0804B944:
	b _0804BA54
	.align 2, 0
_0804B948: .4byte 0x000016CB @ Black Luster Soldier - Envoy of the Beginning
_0804B94C:
	ldr r0, _0804B978 @ =0x000018B9 (Master Monk)
	cmp r1, r0
	bne _0804B954
	b _0804BA44
_0804B954:
	cmp r1, r0
	bgt _0804B9D0
	subs r0, #0xde
	cmp r1, r0
	bne _0804B960
	b _0804BA4C
_0804B960:
	cmp r1, r0
	bgt _0804B998
	subs r0, #0x19
	cmp r1, r0
	beq _0804BA44
	cmp r1, r0
	bgt _0804B97C
	subs r0, #0x56
	cmp r1, r0
	beq _0804BA44
	adds r0, #0x1c
	b _0804B9EE
	.align 2, 0
_0804B978: .4byte 0x000018B9 @ Master Monk
_0804B97C:
	ldr r0, _0804B98C @ =0x000017C9 (Theinen the Great Sphinx)
	cmp r1, r0
	beq _0804BA50
	cmp r1, r0
	bgt _0804B990
	subs r0, #3
	b _0804BA36
	.align 2, 0
_0804B98C: .4byte 0x000017C9 @ Theinen the Great Sphinx
_0804B990:
	ldr r0, _0804B994 @ =0x000017D4 (Horus the Black Flame Dragon LV8)
	b _0804B9EE
	.align 2, 0
_0804B994: .4byte 0x000017D4 @ Horus the Black Flame Dragon LV8
_0804B998:
	ldr r0, _0804B9B4 @ =0x00001895 (Vampire Genesis)
	cmp r1, r0
	bgt _0804B9C0
	subs r0, #1
	cmp r1, r0
	bge _0804BA44
	subs r0, #0x7a
	cmp r1, r0
	beq _0804BA4C
	cmp r1, r0
	bgt _0804B9B8
	subs r0, #4
	b _0804B9EE
	.align 2, 0
_0804B9B4: .4byte 0x00001895 @ Vampire Genesis
_0804B9B8:
	ldr r0, _0804B9BC @ =0x0000186B (Gearfried the Swordmaster)
	b _0804B9EE
	.align 2, 0
_0804B9BC: .4byte 0x0000186B @ Gearfried the Swordmaster
_0804B9C0:
	ldr r0, _0804B9CC @ =0x000018A4 (Machina Force (None))
	cmp r1, r0
	beq _0804BA4C
	adds r0, #0x10
	b _0804BA36
	.align 2, 0
_0804B9CC: .4byte 0x000018A4 @ Machina Force (None)
_0804B9D0:
	ldr r0, _0804B9F4 @ =0x000019A6 (Elemental Hero Neo Bubbleman)
	cmp r1, r0
	bgt _0804BA08
	subs r0, #3
	cmp r1, r0
	bge _0804BA44
	subs r0, #0x52
	cmp r1, r0
	beq _0804BA4C
	cmp r1, r0
	bgt _0804B9F8
	subs r0, #0x69
	cmp r1, r0
	beq _0804BA44
	adds r0, #0x1e
_0804B9EE:
	cmp r1, r0
	beq _0804BA4C
	b _0804BA54
	.align 2, 0
_0804B9F4: .4byte 0x000019A6 @ Elemental Hero Neo Bubbleman
_0804B9F8:
	ldr r0, _0804BA04 @ =0x00001982 (Dark Eradicator Warlock)
	cmp r1, r0
	beq _0804BA44
	adds r0, #0xa
	b _0804BA36
	.align 2, 0
_0804BA04: .4byte 0x00001982 @ Dark Eradicator Warlock
_0804BA08:
	ldr r0, _0804BA24 @ =0x000019CA (Doom Dozer)
	cmp r1, r0
	beq _0804BA44
	cmp r1, r0
	bgt _0804BA28
	subs r0, #0x22
	cmp r1, r0
	blt _0804BA54
	adds r0, #1
	cmp r1, r0
	ble _0804BA4C
	adds r0, #0x1f
	b _0804BA36
	.align 2, 0
_0804BA24: .4byte 0x000019CA @ Doom Dozer
_0804BA28:
	ldr r0, _0804BA3C @ =0x000019CD (Princess Pikeru)
	cmp r1, r0
	blt _0804BA54
	adds r0, #1
	cmp r1, r0
	ble _0804BA4C
	adds r0, #0x22
_0804BA36:
	cmp r1, r0
	beq _0804BA44
	b _0804BA54
	.align 2, 0
_0804BA3C: .4byte 0x000019CD @ Princess Pikeru
_0804BA40:
	movs r0, #1
	b _0804BA56
_0804BA44:
	movs r0, #2
	b _0804BA56
_0804BA48:
	movs r0, #3
	b _0804BA56
_0804BA4C:
	movs r0, #4
	b _0804BA56
_0804BA50:
	movs r0, #5
	b _0804BA56
_0804BA54:
	movs r0, #0
_0804BA56:
	bx lr

@ ----------------------------------------------------------------------------
@ Hooking effect (1) into the real engine. The original engine has no idea
@ KONAMI_GOBLIN_CALLIGRAPHER's slot now means anything -- the two functions
@ below extend the two real dispatchers that gate/resolve a hand-based
@ alt-summon condition (REAL, traced this session): each checks for our
@ card_id first and handles it directly; for every other card they fall
@ straight through to the original, untouched function, so nothing else in
@ the game changes. The 4 call sites that fed into the originals are
@ repointed at these instead (see the asm/code_0801563C.s and
@ asm/code_080A7650.s edits).
@
@   gEngineEffectSpecialSummon_0804B81C(cardId) -> bucket 0-5: the
@   eligibility classifier consulted by gEngineEffectSpecialSummon_0804BA58/
@   _0804BAB8/_080A8C30 sub-callers (sub_0804AD48 etc.) before allowing a
@   hand alt-summon. Bucket 6 is new (the original only ever returns 0-5;
@   every consumer found just treats nonzero as "eligible").
@
@   gEngineEffectSpecialSummon_080A8C30(void) reads gUnk_0201E4D0.card_id
@   itself and resolves whichever specific card is actually being
@   alt-summoned (this is what Blue-Eyes Shining Dragon/Metalzoa/etc. land
@   in). Its sole caller is gEngineEffectSpecialSummon_080AB200.
@ ----------------------------------------------------------------------------

	@ s32 gEngineEffectSpecialSummon_0804B81C_RDMD(u32 cardId)
	thumb_func_start gEngineEffectSpecialSummon_0804B81C_RDMD
gEngineEffectSpecialSummon_0804B81C_RDMD: @ r0=cardId
push {r4, lr}
	adds r4, r0, #0
	ldr r1, _RDMD_0804B81C_ID__
	cmp r0, r1
	bne _RDMD_0804B81C_ORIG
	movs r0, #6 @ new bucket: Red-Eyes Darkness Metal Dragon
	b _RDMD_0804B81C_RET
_RDMD_0804B81C_ORIG:
	adds r0, r4, #0
	bl gEngineEffectSpecialSummon_0804B81C @ REAL: untouched original, unrelated cards fall through here
_RDMD_0804B81C_RET:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_RDMD_0804B81C_ID__: .4byte 0x000017D0 @ KONAMI_GOBLIN_CALLIGRAPHER (6096)

	@ s32 gEngineEffectSpecialSummon_080A8C30_RDMD(void)
	@ DELIBERATELY a no-op passthrough right now: the card_id check below is
	@ live, but the call into effect (1)'s state machine
	@ (gEngineEffectRedEyesDarknessMetalDragon_BanishSummon, src/new_code.c)
	@ is commented out. That state machine still depends on
	@ EngineFindFaceUpMonsterByRace/EngineRemoveFieldMonsterFromPlay, which
	@ use the same unconfirmed placeholder field-zone offset that caused the
	@ hand/deck corruption debugged for effect (2) this session (see
	@ EngineSummonDragonFromHandCommit's header above) -- enabling this
	@ would very likely reproduce the same class of bug for the alt-summon
	@ path. Re-enable the bl below once the real field-monster-zone array is
	@ confirmed (gUnk_0201C510 is NOT it -- see above).
	@ gEngineEffectSpecialSummonDiscard_080A6630 (Blue-Eyes Shining Dragon's
	@ real cost+summon chain, src/engine_effects.c:15) only behaves correctly
	@ when gUnk_0201E4D0.unk12 & 2 is set -- its own body checks this and
	@ falls back to the unrelated, generic 34-case
	@ gEngineEffectSpecialSummonDiscard_080A5F7C dispatcher otherwise, which
	@ mutates the same shared gUnk_0201E4D0 scratch struct. Intercepting our
	@ card's ID unconditionally (regardless of that flag) let this fire
	@ outside the real alt-summon-resolution context too -- e.g. during a
	@ plain Normal Summon -- corrupting state and blocking both Normal and
	@ Special Summon entirely. Gate on the same flag BESD's own function
	@ checks, so we only intercept when actually in that context and
	@ otherwise fall through to the untouched original, same as any other
	@ card.
	thumb_func_start gEngineEffectSpecialSummon_080A8C30_RDMD
gEngineEffectSpecialSummon_080A8C30_RDMD:
	push {lr}
	ldr r0, _RDMD_080A8C30_E4D0
	ldr r1, [r0]
	lsls r1, r1, #9
	lsrs r1, r1, #0x11 @ r1 = gUnk_0201E4D0.card_id
	ldr r2, _RDMD_080A8C30_ID
	cmp r1, r2
	bne _RDMD_080A8C30_ORIG
	ldrb r1, [r0, #0x12] @ r0 = &gUnk_0201E4D0 (still)
	movs r2, #2
	ands r1, r2
	beq _RDMD_080A8C30_ORIG @ not in the alt-summon-resolution context -- don't intercept
	bl gEngineEffectSpecialSummonDiscard_080A6630
	b _RDMD_080A8C30_RET
_RDMD_080A8C30_ORIG:
	bl gEngineEffectSpecialSummon_080A8C30 @ REAL: untouched original, unrelated cards fall through here
_RDMD_080A8C30_RET:
	pop {r1}
	bx r1
	.align 2, 0
_RDMD_080A8C30_E4D0: .4byte gUnk_0201E4D0
_RDMD_080A8C30_ID: .4byte 0x000017D0 @ KONAMI_GOBLIN_CALLIGRAPHER (6096)

@ ----------------------------------------------------------------------------
@ Effect (2) test, simplified to hand-only, split into a check/commit pair
@ matching the REAL protocol confirmed via Cannon Soldier this session:
@ slot 2 is called speculatively/repeatedly (every frame the activate icon
@ is being evaluated, before the player ever confirms anything) and must be
@ READ-ONLY -- gEngineEffectTribute_080339D8 (Cannon Soldier's slot 2) only
@ *counts* valid tribute targets via gEngineEffectTributeSpecialSummon_08033730,
@ never mutates. slot 3 is the real commit step, only reached once the
@ player actually activates -- gCardEffectTribute_080567A0 (Cannon Soldier's
@ slot 3) calls sub_080A1C78 -> sub_080A1A00, the real action-queueing
@ system. The original one-shot version of this function mutated on what
@ was actually a read-only check call, corrupting hand/deck state on every
@ summon. gUnk_0201E4D0-based state machines don't belong in these slots at
@ all -- that subsystem is for the alt-summon-condition dispatch
@ (gEngineEffectSpecialSummon_080A8C30 etc.), which uses a completely
@ different calling convention (global context, not a request pointer) and
@ either no-ops or hangs when called from here instead.
@ ----------------------------------------------------------------------------

	@ s32 EngineCheckDragonInHand(s32* request)
	@ slot 2: READ-ONLY. r0 = the same small request struct every
	@ gCardEffectXxx function gets; playerIdx is bit 0 of byte[2] (same
	@ extraction idiom as gCardEffectTribute_080567A0 etc). Returns 1 if a
	@ Dragon-Type monster (other than this card) is in hand, else 0. Never
	@ writes to gPlayerCards.
	thumb_func_start EngineCheckDragonInHand
EngineCheckDragonInHand: @ r0 = request ptr
	push {r4, r6, r7, lr}
	ldrb r1, [r0, #2]
	lsls r0, r1, #0x1f
	lsrs r6, r0, #0x1f @ r6 = playerIdx (0 or 1)
	bl EngineFindDragonInHandHelper @ r0 = 1 if found, 0 if not (r6 = playerIdx in)
	pop {r4, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	@ void EngineSummonDragonFromHandCommit(s32* request)
	@ slot 3: the real commit, only reached once the player activates.
	@ Re-scans (cheap, hand is small) and actually removes the Dragon from
	@ hand (shift + decrement count, both confirmed safe). Does NOT place
	@ it anywhere yet -- gUnk_0201C510 turned out to be transient
	@ scratch/cache (writing to it corrupted unrelated state), not the
	@ real persistent field-monster-zone storage, which hasn't been found.
	thumb_func_start EngineSummonDragonFromHandCommit
EngineSummonDragonFromHandCommit: @ r0 = request ptr
	push {r4, r5, r6, r7, lr}
	ldrb r1, [r0, #2]
	lsls r0, r1, #0x1f
	lsrs r6, r0, #0x1f @ r6 = playerIdx (0 or 1)
	bl EngineFindDragonInHandHelper
	cmp r0, #0
	beq _ESDFC_DONE @ nothing to do (shouldn't happen if slot 2 already said yes)

	@ r4 = found cardId, r5 = its hand index, r7 = hand row base (all set by the helper)
	ldr r0, [r7, #0xC] @ count
	subs r0, r0, #1 @ last valid index before removal
	adds r1, r5, #0 @ r1 = shift cursor, starting at the found index
_ESDFC_SHIFT:
	cmp r1, r0
	bge _ESDFC_SHIFTDONE
	lsls r2, r1, #2
	ldr r3, _ESDFC_HAND_OFS
	adds r2, r2, r3
	adds r2, r2, #4 @ offset of hand[i+1]
	ldr r3, [r7, r2]
	lsls r2, r1, #2
	ldr r5, _ESDFC_HAND_OFS
	adds r2, r2, r5
	str r3, [r7, r2] @ hand[i] = hand[i+1]
	adds r1, #1
	b _ESDFC_SHIFT
_ESDFC_SHIFTDONE:
	lsls r2, r0, #2
	ldr r3, _ESDFC_HAND_OFS
	adds r2, r2, r3
	movs r3, #0
	str r3, [r7, r2] @ zero the now-stale last hand slot
	ldr r1, [r7, #0xC]
	subs r1, r1, #1
	str r1, [r7, #0xC] @ count--
_ESDFC_DONE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_ESDFC_HAND_OFS: .4byte 0x00000120 @ 0x48 elems * 4

	@ s32 EngineFindDragonInHandHelper(void)
	@ Shared scan, used by both functions above. In: r6 = playerIdx.
	@ Out: r0 = 1/0 found, r4 = cardId, r5 = hand index, r7 = hand row base.
	@ Read-only -- only reads gPlayerCards, never writes.
	thumb_func_start EngineFindDragonInHandHelper
EngineFindDragonInHandHelper:
	push {lr}
	ldr r7, _ESDFHT_PLAYERCARDS
	movs r1, #1
	ands r1, r6
	ldr r2, _ESDFHT_ROWSTRIDE
	muls r1, r2, r1
	adds r7, r7, r1 @ r7 = &gPlayerCards[player][0]

	movs r5, #0 @ r5 = hand loop index i
	ldr r0, [r7, #0xC] @ count = gPlayerCards[player][3]
_ESDFHT_SCAN:
	cmp r5, r0
	bge _ESDFHT_FAIL
	lsls r1, r5, #2
	ldr r2, _ESDFHT_HAND_OFS
	adds r1, r1, r2
	ldr r3, [r7, r1] @ r3 = raw hand entry
	lsls r2, r3, #0x13
	lsrs r2, r2, #0x13 @ r2 = candidate card:13 ID
	adds r4, r2, #0 @ preserve across the upcoming bl
	ldr r1, _ESDFHT_SELFID
	cmp r2, r1
	beq _ESDFHT_NEXT @ skip the card itself (this card, mid-activation)
	adds r0, r2, #0
	bl sub_080EEDF8 @ REAL: r0 = race of that card
	movs r1, #1 @ RACE_DRAGON
	cmp r0, r1
	beq _ESDFHT_FOUND
_ESDFHT_NEXT:
	ldr r0, [r7, #0xC]
	adds r5, #1
	b _ESDFHT_SCAN

_ESDFHT_FOUND:
	movs r0, #1
	b _ESDFHT_DONE
_ESDFHT_FAIL:
	movs r0, #0
_ESDFHT_DONE:
	pop {r1}
	bx r1
	.align 2, 0
_ESDFHT_PLAYERCARDS: .4byte gPlayerCards
_ESDFHT_ROWSTRIDE: .4byte 0x00000868
_ESDFHT_HAND_OFS: .4byte 0x00000120 @ 0x48 elems * 4
_ESDFHT_SELFID: .4byte 0x000017D0 @ KONAMI_GOBLIN_CALLIGRAPHER (6096)

@ ----------------------------------------------------------------------------
@ Once-per-turn enforcement for effect (2)'s King Dragun-based row (see
@ gCardAISpecialSummonDragonFromHandOrGraveyard's header in src/new_code.c for why this
@ exists: none of King Dragun's real slot 0/2/3 functions track it, and the
@ real mechanism wasn't found). gCardAISpecialSummonDragonFromHandOrGraveyard checks
@ the same flag and skips registering any candidates once set, so this only
@ needs to mark it -- the real slot-2 check then naturally reports
@ "not eligible" on a repeat attempt within the same turn.
@ ----------------------------------------------------------------------------

	@ void EngineRDMD_MarkSummonUsedThenAnimate(s32* request)
	@ Wired into gCardEffects3 slot 3 instead of the bare real function.
	@ Marks the flag, then calls straight through to King Dragun's real
	@ slot 3 (gCardEffectDestroySpecialSummon_080563A4 -- confirmed this
	@ session to be a generic Time Wizard-themed animation/sound trigger
	@ shared by 40+ unrelated cards, not card-specific logic) so the real
	@ visual/audio behavior is unaffected.
	thumb_func_start EngineRDMD_MarkSummonUsedThenAnimate
EngineRDMD_MarkSummonUsedThenAnimate: @ r0 = request ptr
	push {r4, lr}
	adds r4, r0, #0 @ preserve the request ptr across both calls
	ldrb r1, [r0, #2]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f @ r0 = playerIdx
	ldr r1, _ERDMD_ID @ r1 = KONAMI_GOBLIN_CALLIGRAPHER
	movs r2, #1 @ r2 = RDMD_EFFECT_SUMMON_DRAGON
	bl EngineMarkUsedEffectThisTurn
	adds r0, r4, #0
	bl gCardEffectDestroySpecialSummon_080563A4 @ REAL: untouched, see header above
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_ERDMD_ID: .4byte 0x000017D0 @ KONAMI_GOBLIN_CALLIGRAPHER (6096)

@ ----------------------------------------------------------------------------
@ gEngineEffectSpecialSummon_080A7ACC (XYZ-Dragon Cannon's real alt-Fusion
@ path) is itself a validation CALLBACK, not a plain data pointer like BESD's
@ &gEngineEffectSpecialSummon_080A5714 -- sub_080969C4/gEngineEffectSpecialSummonGraveyard_080B70AC's
@ third arg is polymorphic depending on whether the real card needs to ask
@ the player to indicate a field zone. The real callback's signature is
@ (playerIdx, category, index), computing zoneIndex = category+index, then
@ checking gUnk_0201C510 at that zone against XYZ-Dragon Cannon's own
@ hardcoded material list (gUnk_0201B290+0x5AC). This is the same shape,
@ but checking RACE_DRAGON via the real sub_080EEDF8 instead.
@ ----------------------------------------------------------------------------

	@ s32 EngineValidateDragonFieldZone(s32 playerIdx, s32 category, s32 index)
	thumb_func_start EngineValidateDragonFieldZone
EngineValidateDragonFieldZone: @ r0=playerIdx, r1=category, r2=index
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0 @ r5 = playerIdx
	adds r4, r1, r2 @ r4 = zoneIndex = category+index
	cmp r4, #4
	bgt _EVDFZ_FAIL @ only the 5 monster zones (0-4)
	ldr r7, _EVDFZ_E4D0
	ldrb r1, [r7]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	cmp r5, r0
	bne _EVDFZ_FAIL @ must match the resolving player (mirrors the real callback)
	movs r2, #1
	ands r2, r5
	lsls r0, r4, #2
	adds r0, r0, r4
	lsls r0, r0, #2 @ r0 = zoneIndex*5*4 = zoneIndex*20
	ldr r1, _EVDFZ_0868
	muls r1, r2, r1
	adds r0, r0, r1
	ldr r1, _EVDFZ_C510
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #0x13
	lsrs r6, r0, #0x13 @ r6 = cardId at this zone
	cmp r6, #0
	beq _EVDFZ_FAIL
	adds r0, r6, #0
	bl sub_080EEDF8
	movs r1, #1 @ RACE_DRAGON
	cmp r0, r1
	bne _EVDFZ_FAIL
	ldr r0, _EVDFZ_LASTZONE @ record this zone -- no confirmed real removal
	str r4, [r0]             @ mechanism was found, so the caller (case 1 of
	movs r0, #1               @ gEngineEffectBanishToSpecialSummon) performs the
	lsls r0, r0, #0xb @ 0x800, matching the real callback's "valid" sentinel
	b _EVDFZ_DONE
_EVDFZ_FAIL:
	movs r0, #0
_EVDFZ_DONE:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_EVDFZ_E4D0: .4byte gUnk_0201E4D0
_EVDFZ_0868: .4byte 0x00000868
_EVDFZ_C510: .4byte gUnk_0201C510
_EVDFZ_LASTZONE: .4byte gEngNC_LastValidatedDragonZone

@ This whole file never switches out of .text (set at the top), so these
@ writable scratch globals were sitting in .text -- which the linker script
@ places in ROM, not EWRAM -- making every write to them a silent no-op.
@ Switching to .bss here routes them to EWRAM instead (asm/new_code.o(.bss)
@ is mapped there in linker.ld).
	.bss
	.align 2
	.global gEngNC_UsedEffectFlags
gEngNC_UsedEffectFlags: .space 8 @ 2 players * 2 effect slots, u16 each
	.global gEngNC_LastValidatedDragonZone
gEngNC_LastValidatedDragonZone: .space 4 @ NEW -- see EngineValidateDragonFieldZone header above
	.text
