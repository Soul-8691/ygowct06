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
	@ldr r1, _RDMD_0804B81C_ID
	@cmp r0, r1
	@bne _RDMD_0804B81C_ORIG
	@movs r0, #6 @ new bucket: Red-Eyes Darkness Metal Dragon
	@b _RDMD_0804B81C_RET
_RDMD_0804B81C_ORIG:
	adds r0, r4, #0
	bl gEngineEffectSpecialSummon_0804B81C @ REAL: untouched original, unrelated cards fall through here
_RDMD_0804B81C_RET:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_RDMD_0804B81C_ID: .4byte 0x000017D0 @ KONAMI_GOBLIN_CALLIGRAPHER (6096)

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
	thumb_func_start gEngineEffectSpecialSummon_080A8C30_RDMD
gEngineEffectSpecialSummon_080A8C30_RDMD:
	push {lr}
	ldr r0, _RDMD_080A8C30_E4D0
	ldr r0, [r0]
	lsls r0, r0, #9
	lsrs r0, r0, #0x11 @ r0 = gUnk_0201E4D0.card_id
	ldr r1, _RDMD_080A8C30_ID
	cmp r0, r1
	bne _RDMD_080A8C30_ORIG
	@bl gEngineEffectRedEyesDarknessMetalDragon_BanishSummon @ src/new_code.c -- disabled, see header comment above
	@b _RDMD_080A8C30_RET
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

	.align 2
gEngNC_UsedEffectFlags: .space 8 @ 2 players * 2 effect slots, u16 each
