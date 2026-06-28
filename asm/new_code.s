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

	.align 2
gEngNC_UsedEffectFlags: .space 8 @ 2 players * 2 effect slots, u16 each
