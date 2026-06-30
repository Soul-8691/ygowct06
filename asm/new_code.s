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
	@ Real discriminator, found empirically via live memory dumps of
	@ gUnk_0201E4D0's first byte: 0x46 before pressing anything, 0x26 after
	@ pressing Normal Summon, 0xA6 after pressing Special Summon -- bit 7
	@ (0x80) is set only for a real Special Summon attempt. (unk12&2 was
	@ tried twice and was wrong both times -- this is a different bit, in
	@ the unk0_1 field, not unk12.)
	ldr r0, [r1]
	movs r2, #0x80
	ands r0, r2
	beq next @ bne to a far target is itself out of beq/bne range
	b _080A8F18_
_RDMD_NOT_REAL_SPSUMMON:
	@ Found via breakpoint tracing: gEngineEffectSpecialSummon_080AB200 only
	@ clears gUnk_0201E4D0.unk12 bit 0 (the "please resolve an alt-summon"
	@ trigger) when this function returns NONZERO. Returning 0 here left
	@ that bit set forever, so whatever periodically re-invokes _080AB200
	@ kept re-entering this exact pair of functions -- a real, confirmed
	@ infinite loop (not a crash), observed by alternating breakpoints on
	@ _080AB200/_080A8C30_New. Returning 1 directly via the function's own
	@ epilogue (bypassing _080A8FB0, whose extra logic is for negative/
	@ specific values we don't need here) clears the bit and ends the loop.
	movs r0, #1
	b _080A9126
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
	@ itself) exists.
	@ Originally tried falling through to the untouched original dispatch
	@ (gEngineEffectSpecialSummon_080A8C30) here, assuming it'd return a
	@ harmless default for our unrecognized card_id -- instead, since our
	@ card_id never matches anything in that dispatcher's real binary search,
	@ it falls all the way through to _080A8F84, its true default case,
	@ which calls gEngineEffectSpecialSummonDiscard_080A5F7C (a real "search
	@ the deck" style alt-summon resolver) -- reproducing exactly the
	@ deck-search corruption reported. _080A8FB0 only special-cases NEGATIVE
	@ results, so returning a plain 0 directly is enough to reach the same
	@ harmless "return 0" path (_080A8FDC -> _080A9124) without ever invoking
	@ the original dispatcher at all.
	movs r0, #0
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
	ldr r0, _RDMD_0804B81C_ID_
	cmp r1, r0
	bne next_
	b _0804BA44
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

	@ Anteatereatingant
	@ Archlord Zerato
	@ Armed Dragon LV10
	@ Black Luster Soldier - Envoy of the Beginning
	@ Blue-Eyes Toon Dragon
	@ Chain Energy
	@ Chaos Emperor Dragon - Envoy of the End
	@ Cyber Dragon
	@ Dark Necrofear
	@ Doom Dozer
	@ Elemental HERO Bubbleman
	@ Garuda the Wind Spirit
	@ Gate Guardian
	@ Gradius
	@ Gravity Axe - Grarl
	@ Guardian Exode
	@ Masked Beast Des Gardius
	@ Master Monk
	@ Metalzoa
	@ Perfectly Ultimate Great Moth
	@ Pyramid of Light
	@ Raviel, Lord of Phantasms
	@ Red-Eyes Black Metal Dragon
	@ Silpheed
	@ Sphinx Teleia
	@ Toon Summoned Skull
	@ VW-Tiger Catapult
	@ VWXYZ-Dragon Catapult Cannon
	@ XY-Dragon Cannon
	@ XYZ-Dragon Cannon
	@ YZ-Tank Dragon
	thumb_func_start gEngineEffectSpecialSummon_080A4AF4_New
gEngineEffectSpecialSummon_080A4AF4_New: @ 0x080A4AF4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	mov r8, r1
	ldr r7, _080A4B40 @ =gPlayerCards
	lsls r0, r1, #2
	adds r0, r0, r7
	movs r1, #0x87
	lsls r1, r1, #5
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x13
	lsrs r4, r0, #0x13
	movs r6, #0
	cmp r4, #0
	bne _080A4AF4_SKIP1
	b _080A4BFE @ out of beq range after the once-per-turn gate below was inserted
_080A4AF4_SKIP1:
	adds r0, r4, #0
	bl sub_0804AD48
	cmp r0, #0
	bne _080A4AF4_SKIP2
	b _080A4BFE @ out of beq range after the once-per-turn gate below was inserted
_080A4AF4_SKIP2:
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl gEngineEffectBoostATKBoostDEF_08034298
	cmp r0, #0
	beq _080A4B4C
	ldr r0, _080A4B44 @ =gUnk_0201E2A0
	ldr r0, [r0, #4]
	cmp r5, r0
	bne _080A4BFE
	ldr r2, _080A4B48 @ =0x00001D78
	adds r1, r7, r2
	movs r0, #0x10
	str r0, [r1]
	b _080A4BFE
	.align 2, 0
_080A4B40: .4byte gPlayerCards
_080A4B44: .4byte gUnk_0201E2A0
_080A4B48: .4byte 0x00001D78
_080A4B4C:
	adds r0, r5, #0
	bl gEngineEffectSpecialSummonChangePosition_0803BB7C
	cmp r0, #0
	bne _080A4B70
	ldr r0, _080A4B68 @ =gUnk_0201E2A0
	ldr r0, [r0, #4]
	cmp r5, r0
	bne _080A4BFE
	ldr r0, _080A4B6C @ =0x00001D78
	adds r1, r7, r0
	movs r0, #0x11
	str r0, [r1]
	b _080A4BFE
	.align 2, 0
_080A4B68: .4byte gUnk_0201E2A0
_080A4B6C: .4byte 0x00001D78
_080A4B70:
	ldr r0, _RDMD_0804B81C_ID___
	cmp r4, r0
	bne next__
	@ Once-per-turn gate: if effect (1) was already used this turn (Deck
	@ count unchanged since last use -- see src/new_code.c's
	@ gEngNC_BanishSummonDeckCountAtLastUse comment), don't treat REDMD as
	@ a valid alt-summon candidate here. Without this, the "Sp. Summon"
	@ option still gets offered for a second copy (this function doesn't
	@ know about our flag), the player picks it, and gEngineEffectBanishToSpecialSummon
	@ immediately returns -1 -- that mismatch (menu offered it, resolution
	@ refused it) froze the game.
	ldr r1, _RDMD_080A4B70_DECKCOUNT
	lsls r2, r5, #2
	ldr r0, [r1, r2]
	ldr r1, _RDMD_080A4B70_PLAYERCARDS
	ldr r2, _RDMD_080A4B70_ROWSTRIDE
	muls r2, r5, r2
	adds r1, r1, r2
	ldr r2, _RDMD_080A4B70_DECKOFS
	adds r1, r1, r2
	ldr r1, [r1]
	cmp r0, r1
	beq _RDMD_080A4B70_USED @ bne to a far target is itself out of beq/bne range
	b _080A50B0
_RDMD_080A4B70_USED:
	@ Already used this turn: return "not eligible" directly instead of
	@ falling through to the rest of the real card-ID chain below, which
	@ would pass REDMD's card_id into real functions (e.g.
	@ gEngineEffectSpecialSummonDamage_0803B910) that were never designed
	@ to receive an unrecognized ID -- a previously-unreachable path (since
	@ REDMD always matched here unconditionally before this gate existed)
	@ that froze the game once exposed.
	b _080A4BFE
	.align 2, 0
_RDMD_080A4B70_DECKCOUNT: .4byte gEngNC_BanishSummonDeckCountAtLastUse
_RDMD_080A4B70_PLAYERCARDS: .4byte gPlayerCards
_RDMD_080A4B70_ROWSTRIDE: .4byte 0x00000868
_RDMD_080A4B70_DECKOFS: .4byte 0x00000010
next__:
	ldr r0, _080A4B8C @ =0x000015FA (YZ-Tank Dragon)
	cmp r4, r0
	bgt _080A4BAC
	subs r0, #1
	cmp r4, r0
	bge _080A4BE4
	ldr r0, _080A4B90 @ =0x0000128C (Red-Eyes Black Metal Dragon)
	cmp r4, r0
	beq _080A4BE4
	cmp r4, r0
	bgt _080A4B98
	ldr r0, _080A4B94 @ =0x0000112E (Metalzoa)
	b _080A4BA0
	.align 2, 0
_RDMD_0804B81C_ID___: .4byte 0x000017D0 @ KONAMI_GOBLIN_CALLIGRAPHER (6096)
_080A4B8C: .4byte 0x000015FA @ YZ-Tank Dragon
_080A4B90: .4byte 0x0000128C @ Red-Eyes Black Metal Dragon
_080A4B94: .4byte 0x0000112E @ Metalzoa
_080A4B98:
	ldr r0, _080A4BA8 @ =0x000015B1 (XY-Dragon Cannon)
	cmp r4, r0
	beq _080A4BE4
	adds r0, #3
_080A4BA0:
	cmp r4, r0
	beq _080A4BE4
	b _080A4C10
	.align 2, 0
_080A4BA8: .4byte 0x000015B1 @ XY-Dragon Cannon
_080A4BAC:
	ldr r0, _080A4BDC @ =0x00001953 (VW-Tiger Catapult)
	cmp r4, r0
	blt _080A4C10
	adds r0, #1
	cmp r4, r0
	ble _080A4BE4
	adds r0, #0x1a
	cmp r4, r0
	bgt _080A4C10
	subs r0, #3
	cmp r4, r0
	blt _080A4C10
	adds r0, r5, #0
	mov r1, r8
	bl sub_080312EC
	cmp r0, #0
	bge _080A4C10
	ldr r1, _080A4BE0 @ =0x00001CF4
	adds r0, r7, r1
	ldr r0, [r0]
	adds r1, r7, #0
	b _080A4BEC
	.align 2, 0
_080A4BDC: .4byte 0x00001953 @ VW-Tiger Catapult
_080A4BE0: .4byte 0x00001CF4
_080A4BE4:
	ldr r1, _080A4C04 @ =gPlayerCards
	ldr r2, _080A4C08 @ =0x00001CF4
	adds r0, r1, r2
	ldr r0, [r0]
_080A4BEC:
	cmp r0, #2
	beq _080A4BF4
	cmp r0, #4
	bne _080A4BFE
_080A4BF4:
	ldr r2, _080A4C0C @ =0x00001CE8
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r0, r5
	beq _080A4C3C
_080A4BFE:
	movs r0, #0
	b _080A517E
	.align 2, 0
_080A4C04: .4byte gPlayerCards
_080A4C08: .4byte 0x00001CF4
_080A4C0C: .4byte 0x00001CE8
_080A4C10:
	adds r0, r5, #0
	adds r1, r4, #0
	bl gEngineEffectSpecialSummonDamage_0803B910
	cmp r0, #0
	bne _080A4C3C
	ldr r0, _080A4C30 @ =gUnk_0201E2A0
	ldr r0, [r0, #4]
	cmp r5, r0
	bne _080A4BFE
	ldr r0, _080A4C34 @ =gPlayerCards
	ldr r1, _080A4C38 @ =0x00001D78
	adds r0, r0, r1
	movs r1, #0x17
	str r1, [r0]
	b _080A4BFE
	.align 2, 0
_080A4C30: .4byte gUnk_0201E2A0
_080A4C34: .4byte gPlayerCards
_080A4C38: .4byte 0x00001D78
_080A4C3C:
	ldr r0, _080A4C84 @ =0x00001758 (Archlord Zerato)
	cmp r4, r0
	bne _080A4C44
	b _080A50B0
_080A4C44:
	cmp r4, r0
	ble _080A4C4A
	b _080A4D90
_080A4C4A:
	ldr r0, _080A4C88 @ =0x00001487 (Garuda the Wind Spirit)
	cmp r4, r0
	bgt _080A4CF4
	subs r0, #4
	cmp r4, r0
	blt _080A4C58
	b _080A505C
_080A4C58:
	ldr r0, _080A4C8C @ =0x0000127F (Toon Summoned Skull)
	cmp r4, r0
	bgt _080A4CAC
	subs r0, #2
	cmp r4, r0
	blt _080A4C66
	b _080A50D8
_080A4C66:
	ldr r0, _080A4C90 @ =0x00000FE9 (Perfectly Ultimate Great Moth)
	cmp r4, r0
	bne _080A4C6E
	b _080A502A
_080A4C6E:
	cmp r4, r0
	bgt _080A4C94
	subs r0, #0xa
	cmp r4, r0
	ble _080A4C7A
	b _080A517C
_080A4C7A:
	subs r0, #1
	cmp r4, r0
	bge _080A4C82
	b _080A517C
_080A4C82:
	b _080A502A
	.align 2, 0
_080A4C84: .4byte 0x00001758 @ Archlord Zerato
_080A4C88: .4byte 0x00001487 @ Garuda the Wind Spirit
_080A4C8C: .4byte 0x0000127F @ Toon Summoned Skull
_080A4C90: .4byte 0x00000FE9 @ Perfectly Ultimate Great Moth
_080A4C94:
	ldr r0, _080A4CA8 @ =0x0000111C (Gate Guardian)
	cmp r4, r0
	bne _080A4C9C
	b _080A504C
_080A4C9C:
	adds r0, #0x12
	cmp r4, r0
	bne _080A4CA4
	b _080A5034
_080A4CA4:
	b _080A517C
	.align 2, 0
_080A4CA8: .4byte 0x0000111C @ Gate Guardian
_080A4CAC:
	ldr r0, _080A4CCC @ =0x000012A5 (Blue-Eyes Toon Dragon)
	cmp r4, r0
	bne _080A4CB4
	b _080A50D8
_080A4CB4:
	cmp r4, r0
	bgt _080A4CD0
	subs r0, #0x19
	cmp r4, r0
	bne _080A4CC0
	b _080A5034
_080A4CC0:
	adds r0, #0xd
	cmp r4, r0
	bne _080A4CC8
	b _080A4EEC
_080A4CC8:
	b _080A517C
	.align 2, 0
_080A4CCC: .4byte 0x000012A5 @ Blue-Eyes Toon Dragon
_080A4CD0:
	ldr r0, _080A4CE8 @ =0x000013E9 (Masked Beast Des Gardius (None))
	cmp r4, r0
	bne _080A4CD8
	b _080A5070
_080A4CD8:
	cmp r4, r0
	bgt _080A4CEC
	subs r0, #0x5f
	cmp r4, r0
	bne _080A4CE4
	b _080A5054
_080A4CE4:
	b _080A517C
	.align 2, 0
_080A4CE8: .4byte 0x000013E9 @ Masked Beast Des Gardius (None)
_080A4CEC:
	ldr r0, _080A4CF0 @ =0x00001466 (Dark Necrofear)
	b _080A4DF6
	.align 2, 0
_080A4CF0: .4byte 0x00001466 @ Dark Necrofear
_080A4CF4:
	ldr r0, _080A4D20 @ =0x000015FA (YZ-Tank Dragon)
	cmp r4, r0
	bgt _080A4D50
	subs r0, #1
	cmp r4, r0
	blt _080A4D02
	b _080A50CE
_080A4D02:
	subs r0, #0xaf
	cmp r4, r0
	bne _080A4D0A
	b _080A50D8
_080A4D0A:
	cmp r4, r0
	bgt _080A4D24
	subs r0, #0xc2
	cmp r4, r0
	bne _080A4D16
	b _080A4EE4
_080A4D16:
	adds r0, #0x74
	cmp r4, r0
	bne _080A4D1E
	b _080A5078
_080A4D1E:
	b _080A517C
	.align 2, 0
_080A4D20: .4byte 0x000015FA @ YZ-Tank Dragon
_080A4D24:
	ldr r0, _080A4D3C @ =0x000015B1 (XY-Dragon Cannon)
	cmp r4, r0
	bne _080A4D2C
	b _080A50CE
_080A4D2C:
	cmp r4, r0
	bgt _080A4D40
	subs r0, #0x39
	cmp r4, r0
	bne _080A4D38
	b _080A5094
_080A4D38:
	b _080A517C
	.align 2, 0
_080A4D3C: .4byte 0x000015B1 @ XY-Dragon Cannon
_080A4D40:
	ldr r0, _080A4D4C @ =0x000015B4 (XYZ-Dragon Cannon)
	cmp r4, r0
	bne _080A4D48
	b _080A50CE
_080A4D48:
	b _080A517C
	.align 2, 0
_080A4D4C: .4byte 0x000015B4 @ XYZ-Dragon Cannon
_080A4D50:
	ldr r0, _080A4D68 @ =0x000016C8 (Silpheed)
	cmp r4, r0
	bgt _080A4D6C
	subs r0, #3
	cmp r4, r0
	blt _080A4D5E
	b _080A505C
_080A4D5E:
	subs r0, #0x79
	cmp r4, r0
	bne _080A4D66
	b _080A4F12
_080A4D66:
	b _080A517C
	.align 2, 0
_080A4D68: .4byte 0x000016C8 @ Silpheed
_080A4D6C:
	ldr r0, _080A4D7C @ =0x000016CB (Black Luster Soldier - Envoy of the Beginning)
	cmp r4, r0
	bne _080A4D74
	b _080A5066
_080A4D74:
	cmp r4, r0
	bgt _080A4D80
	subs r0, #2
	b _080A4D82
	.align 2, 0
_080A4D7C: .4byte 0x000016CB @ Black Luster Soldier - Envoy of the Beginning
_080A4D80:
	ldr r0, _080A4D8C @ =0x000016E4 (Chaos Emperor Dragon - Envoy of the End)
_080A4D82:
	cmp r4, r0
	bne _080A4D88
	b _080A5066
_080A4D88:
	b _080A517C
	.align 2, 0
_080A4D8C: .4byte 0x000016E4 @ Chaos Emperor Dragon - Envoy of the End
_080A4D90:
	ldr r0, _080A4DC4 @ =0x00001954 (VWXYZ-Dragon Catapult Cannon)
	cmp r4, r0
	bgt _080A4E30
	subs r0, #1
	cmp r4, r0
	blt _080A4D9E
	b _080A50CE
_080A4D9E:
	subs r0, #0xbf
	cmp r4, r0
	bne _080A4DA6
	b _080A50B0
_080A4DA6:
	cmp r4, r0
	bgt _080A4DE0
	subs r0, #0xce
	cmp r4, r0
	bne _080A4DB2
	b _080A50BA
_080A4DB2:
	cmp r4, r0
	bgt _080A4DC8
	subs r0, #0x5a
	cmp r4, r0
	bne _080A4DBE
	b _080A50B0
_080A4DBE:
	adds r0, #0x56
	b _080A4E12
	.align 2, 0
_080A4DC4: .4byte 0x00001954 @ VWXYZ-Dragon Catapult Cannon
_080A4DC8:
	ldr r0, _080A4DDC @ =0x000017C8 (Sphinx Teleia)
	cmp r4, r0
	bgt _080A4DD0
	b _080A4F4C
_080A4DD0:
	adds r0, #0x3e
	cmp r4, r0
	bne _080A4DD8
	b _080A4F98
_080A4DD8:
	b _080A517C
	.align 2, 0
_080A4DDC: .4byte 0x000017C8 @ Sphinx Teleia
_080A4DE0:
	ldr r0, _080A4E00 @ =0x000018B9 (Master Monk)
	cmp r4, r0
	bne _080A4DE8
	b _080A50B0
_080A4DE8:
	cmp r4, r0
	bgt _080A4E04
	subs r0, #0x24
	cmp r4, r0
	bne _080A4DF4
	b _080A50C4
_080A4DF4:
	adds r0, #0x1f
_080A4DF6:
	cmp r4, r0
	bne _080A4DFC
	b _080A505C
_080A4DFC:
	b _080A517C
	.align 2, 0
_080A4E00: .4byte 0x000018B9 @ Master Monk
_080A4E04:
	ldr r0, _080A4E1C @ =0x000018F6 (Cyber Dragon)
	cmp r4, r0
	bne _080A4E0C
	b _080A4FC4
_080A4E0C:
	cmp r4, r0
	bgt _080A4E20
	subs r0, #0xe
_080A4E12:
	cmp r4, r0
	bne _080A4E18
	b _080A50B0
_080A4E18:
	b _080A517C
	.align 2, 0
_080A4E1C: .4byte 0x000018F6 @ Cyber Dragon
_080A4E20:
	ldr r0, _080A4E2C @ =0x000018F9 (Elemental Hero Bubbleman)
	cmp r4, r0
	bne _080A4E28
	b _080A4FE6
_080A4E28:
	b _080A517C
	.align 2, 0
_080A4E2C: .4byte 0x000018F9 @ Elemental Hero Bubbleman
_080A4E30:
	ldr r0, _080A4E68 @ =0x000019A5 (Raviel, Lord of Phantasms)
	cmp r4, r0
	bne _080A4E38
	b _080A50BA
_080A4E38:
	cmp r4, r0
	bgt _080A4E88
	subs r0, #0x23
	cmp r4, r0
	bne _080A4E44
	b _080A50B0
_080A4E44:
	cmp r4, r0
	bgt _080A4E6C
	subs r0, #0x14
	cmp r4, r0
	ble _080A4E50
	b _080A517C
_080A4E50:
	subs r0, #3
	cmp r4, r0
	bge _080A4E58
	b _080A517C
_080A4E58:
	adds r0, r5, #0
	adds r1, r4, #0
	bl gEngineEffectTakeControlFlip_080A4058
_080A4E60:
	cmp r0, #0
	bne _080A4E66
	b _080A517C
_080A4E66:
	b _080A5178
	.align 2, 0
_080A4E68: .4byte 0x000019A5 @ Raviel, Lord of Phantasms
_080A4E6C:
	ldr r0, _080A4E84 @ =0x0000198C (Armed Dragon LV10)
	cmp r4, r0
	bne _080A4E74
	b _080A50B0
_080A4E74:
	cmp r4, r0
	bge _080A4E7A
	b _080A517C
_080A4E7A:
	adds r0, #0x17
	cmp r4, r0
	bge _080A4E82
	b _080A517C
_080A4E82:
	b _080A509C
	.align 2, 0
_080A4E84: .4byte 0x0000198C @ Armed Dragon LV10
_080A4E88:
	ldr r0, _080A4EAC @ =0x000019CA (Doom Dozer)
	cmp r4, r0
	bne _080A4E90
	b _080A505C
_080A4E90:
	cmp r4, r0
	bgt _080A4EC0
	subs r0, #0x20
	cmp r4, r0
	bne _080A4E9C
	b _080A5014
_080A4E9C:
	cmp r4, r0
	bgt _080A4EB0
	subs r0, #4
	cmp r4, r0
	bne _080A4EA8
	b _080A50A6
_080A4EA8:
	b _080A517C
	.align 2, 0
_080A4EAC: .4byte 0x000019CA @ Doom Dozer
_080A4EB0:
	ldr r0, _080A4EBC @ =0x000019C8 (Anteatereatingant)
	cmp r4, r0
	bne _080A4EB8
	b _080A509C
_080A4EB8:
	b _080A517C
	.align 2, 0
_080A4EBC: .4byte 0x000019C8 @ Anteatereatingant
_080A4EC0:
	ldr r0, _080A4EE0 @ =0x000019F0 (Guardian Exode)
	cmp r4, r0
	bne _080A4EC8
	b _080A50B0
_080A4EC8:
	cmp r4, r0
	bge _080A4ECE
	b _080A517C
_080A4ECE:
	adds r0, #8
	cmp r4, r0
	ble _080A4ED6
	b _080A517C
_080A4ED6:
	subs r0, #1
	cmp r4, r0
	bge _080A4EDE
	b _080A517C
_080A4EDE:
	b _080A50B0
	.align 2, 0
_080A4EE0: .4byte 0x000019F0 @ Guardian Exode
_080A4EE4:
	adds r0, r5, #0
	bl gEngineEffectSpecialSummon_080335B8
	b _080A4E60
_080A4EEC:
	adds r0, r5, #0
	bl gEngineEffectSpecialSummon_080335B8
	cmp r0, #0
	bne _080A4EF8
	b _080A517C
_080A4EF8:
	adds r0, r5, #0
	bl sub_08033188
	adds r4, r0, #0
	adds r4, #1
	movs r0, #1
	subs r0, r0, r5
	bl sub_08033188
	cmp r4, r0
	blt _080A4F10
	b _080A517C
_080A4F10:
	b _080A5178
_080A4F12:
	adds r0, r5, #0
	bl gEngineEffectSpecialSummon_080335B8
	cmp r0, #0
	bne _080A4F1E
	b _080A517C
_080A4F1E:
	ldr r2, _080A4F40 @ =gPlayerCards
	movs r0, #1
	ands r0, r5
	ldr r1, _080A4F44 @ =0x00000868
	muls r0, r1, r0
	adds r2, #0xc
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #1
	bls _080A4F34
	b _080A517C
_080A4F34:
	ldr r1, _080A4F48 @ =0x0000165E (Gravity Axe - Grarl)
	adds r0, r5, #0
	bl gEngineEffectSpecialSummonBoostATK_08032C94
	b _080A4E60
	.align 2, 0
_080A4F40: .4byte gPlayerCards
_080A4F44: .4byte 0x00000868
_080A4F48: .4byte 0x0000165E @ Gravity Axe - Grarl
_080A4F4C:
	ldr r0, _080A4F88 @ =0x000017BF (Pyramid of Light)
	bl gEngineEffectSpecialSummonBoostATK_08032CA4
	cmp r0, #0
	bne _080A4F58
	b _080A517C
_080A4F58:
	ldr r2, _080A4F8C @ =gPlayerCards
	movs r0, #1
	ands r0, r5
	ldr r1, _080A4F90 @ =0x00000868
	adds r4, r0, #0
	muls r4, r1, r4
	adds r4, r4, r2
	ldr r0, _080A4F94 @ =0x0000132C (Chain Energy)
	bl sub_0803279C
	lsls r1, r0, #5
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r1, r1, r2
	ldr r0, [r4]
	cmp r0, r1
	bgt _080A4F84
	b _080A517C
_080A4F84:
	b _080A5178
	.align 2, 0
_080A4F88: .4byte 0x000017BF @ Pyramid of Light
_080A4F8C: .4byte gPlayerCards
_080A4F90: .4byte 0x00000868
_080A4F94: .4byte 0x0000132C @ Chain Energy
_080A4F98:
	adds r0, r5, #0
	bl gEngineEffectSpecialSummon_080335B8
	cmp r0, #0
	bne _080A4FA4
	b _080A517C
_080A4FA4:
	ldr r2, _080A4FBC @ =gPlayerCards
	movs r0, #1
	ands r0, r5
	ldr r1, _080A4FC0 @ =0x00000868
	muls r0, r1, r0
	adds r2, #0xc
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #1
	bhi _080A4FBA
	b _080A517C
_080A4FBA:
	b _080A5178
	.align 2, 0
_080A4FBC: .4byte gPlayerCards
_080A4FC0: .4byte 0x00000868
_080A4FC4:
	adds r0, r5, #0
	bl gEngineEffectSpecialSummon_080335B8
	cmp r0, #0
	bne _080A4FD0
	b _080A517C
_080A4FD0:
	adds r0, r5, #0
	bl sub_08033188
	cmp r0, #0
	beq _080A4FDC
	b _080A517C
_080A4FDC:
	movs r0, #1
	subs r0, r0, r5
	bl sub_08033188
	b _080A4E60
_080A4FE6:
	adds r0, r5, #0
	bl gEngineEffectSpecialSummon_080335B8
	cmp r0, #0
	bne _080A4FF2
	b _080A517C
_080A4FF2:
	ldr r2, _080A500C @ =gPlayerCards
	movs r0, #1
	ands r0, r5
	ldr r1, _080A5010 @ =0x00000868
	muls r0, r1, r0
	adds r2, #0xc
	adds r0, r0, r2
	ldr r0, [r0]
	cmp r0, #1
	beq _080A5008
	b _080A517C
_080A5008:
	b _080A5178
	.align 2, 0
_080A500C: .4byte gPlayerCards
_080A5010: .4byte 0x00000868
_080A5014:
	adds r0, r5, #0
	bl gEngineEffectSpecialSummon_080335B8
	cmp r0, #0
	bne _080A5020
	b _080A517C
_080A5020:
	adds r0, r5, #0
	adds r1, r4, #0
	bl gEngineEffectSpecialSummonBoostATK_08032CCC
	b _080A4E60
_080A502A:
	adds r0, r5, #0
	adds r1, r4, #0
	bl gEngineEffectSpecialSummonEquip_080A3A80
	b _080A4E60
_080A5034:
	adds r0, r5, #0
	mov r1, r8
	bl sub_08031184
	cmp r0, #0
	bge _080A5042
	b _080A517C
_080A5042:
	adds r0, r5, #0
	adds r1, r4, #0
	bl gEngineEffectSpecialSummon_080A3AE8
	b _080A4E60
_080A504C:
	adds r0, r5, #0
	bl gEngineEffectTribute_080A3DAC
	b _080A4E60
_080A5054:
	adds r0, r5, #0
	bl gEngineEffectTribute_080A3EB4
	b _080A4E60
_080A505C:
	adds r1, r4, #0
	adds r0, r5, #0
	bl gEngineEffectSpecialSummonGraveyard_080A42B0
	b _080A4E60
_080A5066:
	adds r0, r5, #0
	adds r1, r4, #0
	bl gEngineEffectSpecialSummonChangePosition_080A43C8
	b _080A4E60
_080A5070:
	adds r0, r5, #0
	bl gEngineEffectTributeSpecialSummon_080A3FC8
	b _080A4E60
_080A5078:
	adds r0, r5, #0
	bl gEngineEffectSpecialSummon_080335B8
	cmp r0, #0
	bne _080A5084
	b _080A517C
_080A5084:
	ldr r1, _080A5090 @ =0x00001414 (Gradius)
	adds r0, r5, #0
	bl gEngineEffectSpecialSummonBoostATK_08032C94
	b _080A4E60
	.align 2, 0
_080A5090: .4byte 0x00001414 @ Gradius
_080A5094:
	adds r0, r5, #0
	bl gEngineEffectTribute_080A40BC
	b _080A4E60
_080A509C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl gEngineEffectSendToGYGraveyard_080A3C2C
	b _080A4E60
_080A50A6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl gEngineEffectSpecialSummonBanish_080A3D74
	b _080A4E60
_080A50B0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl gEngineEffectSpecialSummon_080A3AE8
	b _080A4E60
_080A50BA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl gEngineEffectSpecialSummon_080A3B74
	b _080A4E60
_080A50C4:
	adds r0, r5, #0
	adds r1, r4, #0
	bl gEngineEffectSpecialSummonGraveyard_080A3D0C
	b _080A4E60
_080A50CE:
	adds r0, r5, #0
	adds r1, r4, #0
	bl gEngineEffectSpecialSummonDestroy_080A4134
	b _080A4E60
_080A50D8:
	adds r0, r5, #0
	bl gEngineEffectDamage_08033088
	cmp r0, #0
	bne _080A50E4
	b _080A4BFE
_080A50E4:
	adds r0, r5, #0
	mov r1, r8
	bl gEngineEffectDiscardBoostATK_080377B0
	cmp r0, #0
	blt _080A511E
	cmp r0, #4
	ble _080A5108
	cmp r0, #6
	bgt _080A511E
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r5, #0
	bl gEngineEffectTribute_080339D8
	cmp r0, #0
	bgt _080A5114
	b _080A512C
_080A5108:
	adds r0, r5, #0
	bl gEngineEffectSpecialSummon_080335B8
_080A510E:
	cmp r0, #0
	beq _080A5158
	b _080A5178
_080A5114:
	adds r0, r5, #0
	movs r1, #1
	bl gEngineEffectSpecialSummonTribute_080A4648
	b _080A510E
_080A511E:
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r5, #0
	bl gEngineEffectTribute_080339D8
	cmp r0, #1
	bgt _080A514C
_080A512C:
	ldr r0, _080A5140 @ =gUnk_0201E2A0
	ldr r0, [r0, #4]
	cmp r5, r0
	bne _080A517C
	ldr r0, _080A5144 @ =gPlayerCards
	ldr r2, _080A5148 @ =0x00001D78
	adds r0, r0, r2
	movs r1, #0
	str r1, [r0]
	b _080A517C
	.align 2, 0
_080A5140: .4byte gUnk_0201E2A0
_080A5144: .4byte gPlayerCards
_080A5148: .4byte 0x00001D78
_080A514C:
	adds r0, r5, #0
	movs r1, #1
	bl gEngineEffectSpecialSummonTribute_080A4648
	cmp r0, #0
	bne _080A5178
_080A5158:
	ldr r0, _080A516C @ =gUnk_0201E2A0
	ldr r0, [r0, #4]
	cmp r5, r0
	bne _080A517C
	ldr r0, _080A5170 @ =gPlayerCards
	ldr r1, _080A5174 @ =0x00001D78
	adds r0, r0, r1
	movs r1, #0xb
	str r1, [r0]
	b _080A517C
	.align 2, 0
_080A516C: .4byte gUnk_0201E2A0
_080A5170: .4byte gPlayerCards
_080A5174: .4byte 0x00001D78
_080A5178:
	movs r0, #4
	orrs r6, r0
_080A517C:
	adds r0, r6, #0
_080A517E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	@ Archlord Zerato
	@ Armed Dragon LV10
	@ Armed Dragon LV7
	@ Blue-Eyes Ultimate Dragon
	@ Dark Magician
	@ Guardian Exode
	@ Helios Duo Megiste
	@ Helios Tris Megiste
	@ Levia-Dragon - Daedalus
	@ Master Monk
	@ Mazera DeVille
	@ Metalmorph
	@ Metalzoa
	@ Monk Fighter
	@ Pandemonium
	@ Raviel, Lord of Phantasms
	@ Red-Eyes B. Dragon
	@ Red-Eyes Black Metal Dragon
	@ Red-Eyes Darkness Dragon
	@ Sorcerer of Dark Magic
	@ The Ancient Sun Helios
	@ The Sanctuary in the Sky
	@ Warrior of Zera
	@ Zoa
	thumb_func_start gEngineEffectSpecialSummonDestroy_080A5498_New
gEngineEffectSpecialSummonDestroy_080A5498_New: @ 0x080A5498
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, r2
	cmp r5, #4
	ble _080A54A4
	b _080A570A
_080A54A4:
	ldr r4, _080A552C @ =gUnk_0201E4D0
	ldrb r1, [r4]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	adds r1, r6, #0
	adds r2, r5, #0
	bl gEngineEffectTributeSpecialSummon_08033730
	cmp r0, #0
	bne _080A54BA
	b _080A570A
_080A54BA:
	ldrb r4, [r4]
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	lsls r3, r5, #2
	ldr r4, _080A5530 @ =gUnk_0201C510
	cmp r0, r6
	beq _080A54E0
	movs r2, #1
	ands r2, r6
	adds r0, r3, r5
	lsls r0, r0, #2
	ldr r1, _080A5534 @ =0x00000868
	muls r1, r2, r1
	adds r0, r0, r1
	adds r0, r0, r4
	ldrh r0, [r0, #8]
	cmp r0, #0
	bne _080A54E0
	b _080A570A
_080A54E0:
	movs r2, #1
	ands r2, r6
	adds r0, r3, r5
	lsls r0, r0, #2
	ldr r1, _080A5534 @ =0x00000868
	muls r1, r2, r1
	adds r0, r0, r1
	adds r7, r0, r4
	ldr r0, [r7]
	lsls r0, r0, #0x13
	lsrs r4, r0, #0x13
	ldr r0, _080A552C @ =gUnk_0201E4D0
	ldr r0, [r0]
	lsls r0, r0, #9
	lsrs r2, r0, #0x11
	ldr r0, _RDMD_0804B81C_ID____
	cmp r2, r0
	bne next___
	@ Once-per-turn gate, matching gEngineEffectSpecialSummon_080A4AF4_New's
	@ gate above -- avoids the same UI/resolution mismatch freeze for this
	@ second real call site. r0/r1/r3 are free here (r3 is never restored
	@ at this function's epilogue); r2/r4/r5/r6/r7 are all still needed
	@ later and must not be touched.
	ldr r1, _RDMD_080A54_E4D0
	ldrb r1, [r1]
	lsls r1, r1, #0x1f
	lsrs r3, r1, #0x1f
	ldr r0, _RDMD_080A54_DECKCOUNT
	lsls r1, r3, #2
	ldr r0, [r0, r1]
	ldr r1, _RDMD_080A54_ROWSTRIDE
	muls r1, r3, r1
	ldr r3, _RDMD_080A54_PLAYERCARDS
	adds r1, r1, r3
	ldr r3, _RDMD_080A54_DECKOFS
	adds r1, r1, r3
	ldr r1, [r1]
	cmp r0, r1
	beq _RDMD_080A54_USED @ bne to a far target is itself out of beq/bne range
	b _080A564E
_RDMD_080A54_USED:
	@ Already used this turn: return "not eligible" directly instead of
	@ falling through to the rest of the real card-ID chain below, for the
	@ same reason as the gate in gEngineEffectSpecialSummon_080A4AF4_New.
	b _080A570A
	.align 2, 0
_RDMD_080A54_E4D0: .4byte gUnk_0201E4D0
_RDMD_080A54_DECKCOUNT: .4byte gEngNC_BanishSummonDeckCountAtLastUse
_RDMD_080A54_ROWSTRIDE: .4byte 0x00000868
_RDMD_080A54_PLAYERCARDS: .4byte gPlayerCards
_RDMD_080A54_DECKOFS: .4byte 0x00000010
next___:
	ldr r0, _080A5538 @ =0x000018B9 (Master Monk)
	cmp r2, r0
	bne _080A5506
	b _080A5698
_080A5506:
	cmp r2, r0
	bgt _080A5580
	ldr r0, _080A553C @ =0x0000176C (Mazera DeVille)
	cmp r2, r0
	bne _080A5512
	b _080A5638
_080A5512:
	cmp r2, r0
	bgt _080A5554
	ldr r0, _080A5540 @ =0x0000128C (Red-Eyes Black Metal Dragon)
	cmp r2, r0
	bne _080A551E
	b _080A560C
_080A551E:
	cmp r2, r0
	bgt _080A5548
	ldr r0, _080A5544 @ =0x0000112E (Metalzoa)
	cmp r2, r0
	beq _080A55E8
	b _080A570A
	.align 2, 0
_080A552C: .4byte gUnk_0201E4D0
_080A5530: .4byte gUnk_0201C510
_080A5534: .4byte 0x00000868
_RDMD_0804B81C_ID____: .4byte 0x000017D0 @ KONAMI_GOBLIN_CALLIGRAPHER (6096)
_080A5538: .4byte 0x000018B9 @ Master Monk
_080A553C: .4byte 0x0000176C @ Mazera DeVille
_080A5540: .4byte 0x0000128C @ Red-Eyes Black Metal Dragon
_080A5544: .4byte 0x0000112E @ Metalzoa
_080A5548:
	ldr r0, _080A5550 @ =0x00001758 (Archlord Zerato)
	cmp r2, r0
	beq _080A5630
	b _080A570A
	.align 2, 0
_080A5550: .4byte 0x00001758 @ Archlord Zerato
_080A5554:
	ldr r0, _080A556C @ =0x000017C6 (Sorcerer of Dark Magic)
	cmp r2, r0
	bne _080A555C
	b _080A566C
_080A555C:
	cmp r2, r0
	bgt _080A5570
	subs r0, #4
	cmp r2, r0
	bne _080A5568
	b _080A565C
_080A5568:
	b _080A570A
	.align 2, 0
_080A556C: .4byte 0x000017C6 @ Sorcerer of Dark Magic
_080A5570:
	ldr r0, _080A557C @ =0x00001894 (Red-Eyes Darkness Dragon)
	cmp r2, r0
	bne _080A5578
	b _080A568A
_080A5578:
	b _080A570A
	.align 2, 0
_080A557C: .4byte 0x00001894 @ Red-Eyes Darkness Dragon
_080A5580:
	ldr r0, _080A55A4 @ =0x000019A5 (Raviel, Lord of Phantasms)
	cmp r2, r0
	bne _080A5588
	b _080A56D8
_080A5588:
	cmp r2, r0
	bgt _080A55B8
	subs r0, #0x23
	cmp r2, r0
	bne _080A5594
	b _080A56B8
_080A5594:
	cmp r2, r0
	bgt _080A55A8
	subs r0, #0x9a
	cmp r2, r0
	bne _080A55A0
	b _080A56A8
_080A55A0:
	b _080A570A
	.align 2, 0
_080A55A4: .4byte 0x000019A5 @ Raviel, Lord of Phantasms
_080A55A8:
	ldr r0, _080A55B4 @ =0x0000198C (Armed Dragon LV10)
	cmp r2, r0
	bne _080A55B0
	b _080A56C8
_080A55B0:
	b _080A570A
	.align 2, 0
_080A55B4: .4byte 0x0000198C @ Armed Dragon LV10
_080A55B8:
	ldr r1, _080A55D0 @ =0x000019F7 (Helios Duo Megiste)
	cmp r2, r1
	bne _080A55C0
	b _080A56EA
_080A55C0:
	cmp r2, r1
	bgt _080A55D8
	ldr r0, _080A55D4 @ =0x000019F0 (Guardian Exode)
	cmp r2, r0
	bne _080A55CC
	b _080A5700
_080A55CC:
	b _080A570A
	.align 2, 0
_080A55D0: .4byte 0x000019F7 @ Helios Duo Megiste
_080A55D4: .4byte 0x000019F0 @ Guardian Exode
_080A55D8:
	ldr r0, _080A55E4 @ =0x000019F8 (Helios Tris Megiste)
	cmp r2, r0
	bne _080A55E0
	b _080A56F8
_080A55E0:
	b _080A570A
	.align 2, 0
_080A55E4: .4byte 0x000019F8 @ Helios Tris Megiste
_080A55E8:
	ldr r1, _080A5604 @ =0x0000112D (Zoa)
	adds r0, r4, #0
	bl gEngineEffectBoostATKBoostDEF_0804AB4C
	cmp r0, #0
	bne _080A55F6
	b _080A570A
_080A55F6:
	ldr r2, _080A5608 @ =0x00001238 (Metalmorph)
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0802F1F8
	b _080A5706
	.align 2, 0
_080A5604: .4byte 0x0000112D @ Zoa
_080A5608: .4byte 0x00001238 @ Metalmorph
_080A560C:
	ldr r1, _080A5628 @ =0x00000FF8 (Red-Eyes B. Dragon)
	adds r0, r4, #0
	bl gEngineEffectBoostATKBoostDEF_0804AB4C
	cmp r0, #0
	bne _080A561A
	b _080A570A
_080A561A:
	ldr r2, _080A562C @ =0x00001238 (Metalmorph)
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_0802F1F8
	b _080A5706
	.align 2, 0
_080A5628: .4byte 0x00000FF8 @ Red-Eyes B. Dragon
_080A562C: .4byte 0x00001238 @ Metalmorph
_080A5630:
	ldr r0, _080A5634 @ =0x0000175E (The Sanctuary in the Sky)
	b _080A563A
	.align 2, 0
_080A5634: .4byte 0x0000175E @ The Sanctuary in the Sky
_080A5638:
	ldr r0, _080A5654 @ =0x0000169F (Pandemonium)
_080A563A:
	bl gEngineEffectBoostATKBoostDEF_0803412C
	cmp r0, #0
	beq _080A570A
	ldrh r0, [r7, #8]
	cmp r0, #0
	beq _080A570A
	ldr r0, _080A5658 @ =0x0000173B (Warrior of Zera)
	cmp r4, r0
	bne _080A570A
_080A564E:
	movs r0, #0x80
	lsls r0, r0, #4
	b _080A570C
	.align 2, 0
_080A5654: .4byte 0x0000169F @ Pandemonium
_080A5658: .4byte 0x0000173B @ Warrior of Zera
_080A565C:
	ldr r1, _080A5668 @ =0x00001122 (Blue-Eyes Ultimate Dragon)
	adds r0, r4, #0
	bl gEngineEffectBoostATKBoostDEF_0804AB4C
	b _080A5706
	.align 2, 0
_080A5668: .4byte 0x00001122 @ Blue-Eyes Ultimate Dragon
_080A566C:
	adds r0, r6, #0
	adds r1, r5, #0
	bl gEngineEffectSpecialSummonChangePosition_0803A9A8
	cmp r0, #5
	ble _080A570A
	adds r0, r6, #0
	adds r1, r5, #0
	bl gEngineEffectSpecialSummonChangePosition_0803ABF0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x12
	bne _080A570A
	b _080A564E
_080A568A:
	ldr r1, _080A5694 @ =0x00000FF8 (Red-Eyes B. Dragon)
	adds r0, r4, #0
	bl gEngineEffectBoostATKBoostDEF_0804AB4C
	b _080A5706
	.align 2, 0
_080A5694: .4byte 0x00000FF8 @ Red-Eyes B. Dragon
_080A5698:
	ldr r1, _080A56A4 @ =0x000018B8 (Monk Fighter)
	adds r0, r4, #0
	bl gEngineEffectBoostATKBoostDEF_0804AB4C
	b _080A5706
	.align 2, 0
_080A56A4: .4byte 0x000018B8 @ Monk Fighter
_080A56A8:
	ldr r1, _080A56B4 @ =0x00001707 (Levia-Dragon - Daedalus)
	adds r0, r4, #0
	bl gEngineEffectBoostATKBoostDEF_0804AB4C
	b _080A5706
	.align 2, 0
_080A56B4: .4byte 0x00001707 @ Levia-Dragon - Daedalus
_080A56B8:
	ldr r1, _080A56C4 @ =0x00000FC9 (Dark Magician)
	adds r0, r4, #0
	bl gEngineEffectBoostATKBoostDEF_0804AB4C
	b _080A5706
	.align 2, 0
_080A56C4: .4byte 0x00000FC9 @ Dark Magician
_080A56C8:
	ldr r1, _080A56D4 @ =0x000017DB (Armed Dragon LV7)
	adds r0, r4, #0
	bl gEngineEffectBoostATKBoostDEF_0804AB4C
	b _080A5706
	.align 2, 0
_080A56D4: .4byte 0x000017DB @ Armed Dragon LV7
_080A56D8:
	adds r0, r6, #0
	adds r1, r5, #0
	bl gEngineEffectSpecialSummonChangePosition_0803ABF0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #3
	bne _080A570A
	b _080A564E
_080A56EA:
	ldr r1, _080A56F4 @ =0x000019F6 (The Ancient Sun Helios)
	adds r0, r4, #0
	bl gEngineEffectBoostATKBoostDEF_0804AB4C
	b _080A5706
	.align 2, 0
_080A56F4: .4byte 0x000019F6 @ The Ancient Sun Helios
_080A56F8:
	adds r0, r4, #0
	bl gEngineEffectBoostATKBoostDEF_0804AB4C
	b _080A5706
_080A5700:
	adds r0, r4, #0
	bl gEngineEffectReturnToHandSpecialSummon_0804B350
_080A5706:
	cmp r0, #0
	bne _080A564E
_080A570A:
	movs r0, #0
_080A570C:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

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

@ Placing these at gUnk_0203EEB0 + 0x404 (linker.ld) -- right after that
@ buffer's confirmed real usage (sub_080F5F28's 128-record sort buffer)
@ instead of at the very end of the whole gap, which got corrupted in
@ practice. If THIS placement also gets corrupted, the buffer's real reach
@ exceeds 0x404 bytes and this needs to move again.
	.bss
	.align 2
	.global gEngNC_UsedEffectFlags
gEngNC_UsedEffectFlags: .space 8 @ 2 players * 2 effect slots, u16 each
	.global gEngNC_LastValidatedDragonZone
gEngNC_LastValidatedDragonZone: .space 4 @ NEW -- see EngineValidateDragonFieldZone header above
	@ "Once per turn" for effect (1), without a real turn-change/reset event
	@ (none was found despite two separate searches -- see FINDINGS.md). The
	@ player's own Deck count (gPlayerCards[player][4]) only ever decreases,
	@ by exactly 1, during that player's own draw phase -- once per their own
	@ turn. Storing "deck count at last use" and comparing against the
	@ current count is a real, reliable per-player turn signal that needs no
	@ new engine hook: unchanged means no draw has happened yet (still the
	@ same turn), changed means at least one of the player's own turns has
	@ passed. .space zero-inits, so this starts at 0 -- harmless, since a
	@ real deck count of 0 at the start of any turn never happens in
	@ practice (the duel ends by deck-out long before that).
	.global gEngNC_BanishSummonDeckCountAtLastUse
gEngNC_BanishSummonDeckCountAtLastUse: .space 8 @ s32[2], one per player
	@ Same "deck count at last use" trick, for effect (2)'s own once-per-turn
	@ limit -- without this, a second copy of REDMD in hand could each
	@ Special Summon a Dragon from hand/GY in the same turn, since nothing
	@ tracked it per-player across activations.
	.global gEngNC_SummonDragonDeckCountAtLastUse
gEngNC_SummonDragonDeckCountAtLastUse: .space 8 @ s32[2], one per player
	.text

	@ Cathedral of Nobles
	thumb_func_start gCardEffectSearchSpecialSummon_0806FDEC_New
gCardEffectSearchSpecialSummon_0806FDEC_New: @ 0x0806FDEC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806FE0C @ =gUnk_0201B290
	movs r1, #0x94
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r0, [r0]
	subs r0, #0x64
	cmp r0, #0x1c
	bls _0806FE02
	b _0806FF46
_0806FE02:
	lsls r0, r0, #2
	ldr r1, _0806FE10 @ =_0806FE14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806FE0C: .4byte gUnk_0201B290
_0806FE10: .4byte _0806FE14
_0806FE14: @ jump table
	.4byte _0806FF3C @ case 0
	.4byte _0806FF46 @ case 1
	.4byte _0806FF46 @ case 2
	.4byte _0806FF46 @ case 3
	.4byte _0806FF46 @ case 4
	.4byte _0806FF46 @ case 5
	.4byte _0806FF46 @ case 6
	.4byte _0806FF46 @ case 7
	.4byte _0806FF2C @ case 8
	.4byte _0806FF1A @ case 9
	.4byte _0806FF0A @ case 10
	.4byte _0806FF46 @ case 11
	.4byte _0806FF46 @ case 12
	.4byte _0806FF46 @ case 13
	.4byte _0806FF46 @ case 14
	.4byte _0806FF46 @ case 15
	.4byte _0806FF46 @ case 16
	.4byte _0806FF46 @ case 17
	.4byte _0806FF46 @ case 18
	.4byte _0806FF46 @ case 19
	.4byte _0806FF46 @ case 20
	.4byte _0806FF46 @ case 21
	.4byte _0806FF46 @ case 22
	.4byte _0806FF46 @ case 23
	.4byte _0806FF46 @ case 24
	.4byte _0806FF46 @ case 25
	.4byte _0806FEF0 @ case 26
	.4byte _0806FEDC @ case 27
	.4byte _0806FE88 @ case 28
_0806FE88:
	ldrb r1, [r4, #2]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	bl gEngineEffectSpecialSummon_080335B8
	cmp r0, #0
	beq _0806FF46
	ldrb r1, [r4, #2]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	bl gEngineEffectSpecialSummonChangePosition_0803BB7C
	cmp r0, #0
	beq _0806FF46
	ldrb r1, [r4, #2]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	ldrh r1, [r4]
	movs r2, #0
	bl sub_0808DAB0
	cmp r0, #0
	bne _0806FEC6
	ldrb r4, [r4, #2]
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	movs r1, #0xd
	bl gEngineEffectSpecialSummon_08093390
	movs r0, #0x6e
	b _0806FF48
_0806FEC6:
	ldrb r4, [r4, #2]
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	ldr r1, _0806FED8 @ =0x0000011D
	bl gEngineEffectSpecialSummon_08093390
	movs r0, #0x7f
	b _0806FF48
	.align 2, 0
_0806FED8: .4byte 0x0000011D
_0806FEDC:
	ldrb r1, [r4, #2]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	ldrh r2, [r4]
	movs r1, #6
	movs r3, #0
	bl gEngineEffectDiscardDestroyAll_080941C4
	movs r0, #0x7e
	b _0806FF48
_0806FEF0:
	ldrb r4, [r4, #2]
	lsls r4, r4, #0x1f
	lsrs r4, r4, #0x1f
	bl sub_080942DC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0
	bl gEngineEffectChangePosition_080ABE40
	movs r0, #0x64
	b _0806FF48
_0806FF0A:
	ldrb r4, [r4, #2]
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	movs r1, #1
	bl gEngineEffectGainLPStandbyPhase_0804A4CC
	movs r0, #0x6d
	b _0806FF48
_0806FF1A:
	ldrb r4, [r4, #2]
	lsls r1, r4, #0x1f
	lsrs r1, r1, #0x1f
	movs r0, #1
	subs r0, r0, r1
	bl sub_080A1CD0
	movs r0, #0x6c
	b _0806FF48
_0806FF2C:
	ldrb r4, [r4, #2]
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	movs r1, #0
	bl gEngineEffectGainLPStandbyPhase_0804A4CC
	movs r0, #0x64
	b _0806FF48
_0806FF3C:
	@ Same "deck count at last use" trick as effect (1)'s
	@ gEngNC_BanishSummonDeckCountAtLastUse: record the player's current
	@ Deck count here, at the real commit point, so
	@ gCardAISpecialSummonDragonFromHandOrGraveyard can compare against it
	@ to enforce effect (2)'s own once-per-turn limit (previously a plain
	@ EngineMarkUsedEffectThisTurn flag, which permanently blocked
	@ candidate registration after the first use ever, with no reset).
	ldr r0, _ERDMD_PLAYERCARDS
	ldr r1, _ERDMD_ROWSTRIDE
	muls r1, r5, r1
	adds r0, r0, r1
	ldr r1, _ERDMD_DECKOFS
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r0, _ERDMD_DECKCOUNT
	lsls r2, r5, #2
	str r1, [r0, r2]
	.align 2, 0
_ERDMD_PLAYERCARDS: .4byte gPlayerCards
_ERDMD_ROWSTRIDE: .4byte 0x00000868
_ERDMD_DECKOFS: .4byte 0x00000010
_ERDMD_DECKCOUNT: .4byte gEngNC_SummonDragonDeckCountAtLastUse
_0806FF46:
	movs r0, #0
_0806FF48:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

@ My Body as a Shield - slot 0: negate + destroy the opponent's activated spell/trap.
@ Copied directly from gCardEffectNegateDestroy_08065698 (Magic Jammer's slot 0).
@ r0 = self (MBAS card struct), r1 = target (opponent's activated card struct)
	thumb_func_start gCardEffectMBaaS_NegateDestroy
gCardEffectMBaaS_NegateDestroy:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0
	beq _MBAAS_ND_End
	movs r0, #2
	ldrb r1, [r4, #4]
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r4, #4]
	ldrb r2, [r4, #2]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	lsls r1, r2, #0x1a
	lsrs r1, r1, #0x1b
	ldrh r3, [r4, #4]
	lsls r2, r3, #0x11
	lsrs r2, r2, #0x17
	bl gEngineEffectDestroyBoostATK_08044DCC
	ldrb r2, [r4, #2]
	lsls r1, r2, #0x1f
	lsrs r1, r1, #0x1f
	lsls r2, r2, #0x1a
	lsrs r2, r2, #0x1b
	adds r0, r5, #0
	bl gEngineEffectBoostATKBoostDEF_08047A14
_MBAAS_ND_End:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

@ My Body as a Shield - slot 3: pay 1500 LP.
@ Mirrors gCardEffectDamage_0805635C but hardcodes 1500 instead of going through
@ gEngineEffectDamage_08055930 (which is a switch table and doesn't know KONAMI_GIGOBYTE).
@ r0 = self (MBAS card struct)
	thumb_func_start gCardEffectMBaaS_PayLP1500
gCardEffectMBaaS_PayLP1500:
	push {r4, lr}
	ldrb r1, [r0, #2]
	lsls r4, r1, #0x1f
	lsrs r4, r4, #0x1f      @ r4 = activating player index (bit 0 of byte 2)
	ldr r1, _MBAAS_LP_COST  @ r1 = 1500
	adds r0, r4, #0          @ r0 = playerIdx
	bl sub_08048750          @ deduct LP from player
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_MBAAS_LP_COST: .4byte 0x000005DC  @ 1500
