#include "card.h"
#include "effects.h"

// Red-Eyes Darkness Metal Dragon
// DARK / Dragon / Level 10 / ATK 2800 / DEF 2400
//
//   (1) You can Special Summon this card from your hand by removing from
//       play 1 face-up Dragon-Type monster you control. You can only use
//       this effect of "Red-Eyes Darkness Metal Dragon" once per turn.
//   (2) Once per turn, during your Main Phase, you can Special Summon 1
//       Dragon-Type monster from your hand or Graveyard, except
//       "Red-Eyes Darkness Metal Dragon".
//
// This card was never in ygowct06, so there's no original address to match
// against -- the function names below have no "_0812ABCD"-style suffix on
// purpose. It's slotted in as KONAMI_GOBLIN_CALLIGRAPHER: that's a vanilla
// 400/400 Fiend with no gEffects1/2/3 entry at all (see src/card.c, src/
// effects.c), which makes it a safe, otherwise-inert slot to overwrite.
//
// Everything below follows the state-machine convention used throughout
// engine_effects.c/_2.c/_3.c: gUnk_0201E4D0 is the engine's single
// in-progress-effect context (player, resolving card_id, and a small
// unk13_2-driven step counter), advanced one step per call until the
// function returns 1. gUnk_0201E2A0.unk8[player] == 1 is the same "skip
// the human selection prompt" branch used by every other engine effect
// that special summons something.
//
// The Engine* helpers below are implemented in asm/new_code.s. That file
// is split into a REAL section (EngineFindDragonInHandOrGY: a genuine
// Hand+Graveyard-by-Race scan, built from offsets and a race accessor
// confirmed by tracing the actual disassembly -- see that file's header for
// the citations) and a NEW section (field-zone scan/removal and the actual
// hand/GY->field placement, which have no confirmed equivalent anywhere in
// the original engine despite an extensive trace through
// gEngineEffectSpecialSummon_0804B81C, gEngineEffectSpecialSummonFusion_080A7B78,
// and gEngineEffectSpecialSummonDiscard_080A6630/_080A5F7C -- those all turned
// out to be per-card classifiers or post-removal bookkeeping, never the
// literal field array access). The once-per-turn tracking is similarly NEW:
// gUnk_0201E4D0 is just scratch space for whichever effect is currently
// resolving, not a persistent per-card/per-turn record, so this file invents
// its own small flag array instead.

extern Unk_0201E4D0 gUnk_0201E4D0;
extern Unk_0201E2A0 gUnk_0201E2A0;
extern s32 gEngineEffectSpecialSummon_080A5714;

// ---- Existing engine helpers (signatures as used in engine_effects.c/_2.c) ----
s32 sub_08096B14(void);                                            /* extern */
s32 gEngineEffectSpecialSummon_08093390(u32, s32);
s32 sub_080969C4(s32*);                                             /* extern */
s32 gEngineEffectSpecialSummonGraveyard_080B70AC(u32, u32, s32*);  /* extern */
s32 gEngineEffectSpecialSummon_0801EC9C(s32, s32, s32, s32);
s32 gEngineEffectSpecialSummonDiscard_080A5F7C(void);
s32 sub_0804A870(void);
// Cannon Soldier's real commit (gCardEffectTribute_080567A0) does nothing
// but this single call -- queues case 8 into the real action system
// (sub_080A1A00) and returns immediately, letting the queue handle
// highlighting/selection/animation asynchronously. Trying the same here.
void sub_080A1C78(u32 playerIdx, u32 arg1, u32 arg2);

// ---- Implemented in asm/new_code.s (see that file for REAL vs NEW) ----
// Field zone index of a face-up monster of "race" that "playerIdx" controls,
// or -1 if there isn't one.
s32 EngineFindFaceUpMonsterByRace(u32 playerIdx, u32 race);
// Removes the monster sitting in field zone "zoneIndex" from play (banish).
void EngineRemoveFieldMonsterFromPlay(u32 playerIdx, s32 zoneIndex);
// Special Summons the copy of "cardId" sitting in playerIdx's hand.
void EngineSpecialSummonFromHand(u32 playerIdx, u32 cardId);
// Hand first, then Graveyard, for a monster of "race" other than
// "excludeCardId". Returns an engine-defined packed location, or -1.
s32 EngineFindDragonInHandOrGY(u32 playerIdx, u32 race, u32 excludeCardId);
// Special Summons the monster at the packed "location" from the above.
void EngineSpecialSummonFromHandOrGY(u32 playerIdx, s32 location);
// Per-player/per-turn tracking for "once per turn" effects, keyed by the
// named card + which of its effect slots was used.
bool32 EngineUsedEffectThisTurn(u32 playerIdx, u32 cardId, u32 effectSlot);
void EngineMarkUsedEffectThisTurn(u32 playerIdx, u32 cardId, u32 effectSlot);
// Validation callback matching gEngineEffectSpecialSummon_080A7ACC's real
// shape (XYZ-Dragon Cannon) -- checked against field zones as the player
// indicates one, instead of a plain pending-selection pointer.
s32 EngineValidateDragonFieldZone(s32 playerIdx, s32 category, s32 index);
extern s32 gEngNC_LastValidatedDragonZone;

enum {
    RDMD_EFFECT_BANISH_SUMMON = 0,
    RDMD_EFFECT_SUMMON_DRAGON = 1,
};

// sub_080969C4 takes an s32* "handle" for the pending selection -- every
// existing call site passes the address of a plain s32 global (e.g.
// gEngineEffectSpecialSummon_080A5714 in engine_effects.c), never a bitfield,
// so these stand in for unk13_3 while a selection is in flight.
s32 gEngineEffectRedEyesDarknessMetalDragon_PendingZone;
s32 gEngineEffectRedEyesDarknessMetalDragon_PendingLocation;

// Effect (1): remove a face-up Dragon you control from play to Special
// Summon this card from your hand.
s32 gEngineEffectRedEyesDarknessMetalDragon_BanishSummon(void)
{
    switch (gUnk_0201E4D0.unk13_2) {
        case 0: {
            s32 zoneIndex;

            if (EngineUsedEffectThisTurn(gUnk_0201E4D0.unk0, KONAMI_GOBLIN_CALLIGRAPHER, RDMD_EFFECT_BANISH_SUMMON))
                return -1;

            zoneIndex = EngineFindFaceUpMonsterByRace(gUnk_0201E4D0.unk0, RACE_DRAGON);
            if (zoneIndex < 0)
                return -1;

            gEngineEffectRedEyesDarknessMetalDragon_PendingZone = zoneIndex;

            if (gUnk_0201E2A0.unk8[gUnk_0201E4D0.unk0] == 1) {
                // CPU: no selection prompt needed, resolve immediately.
                gUnk_0201E4D0.unk13_2 = 2;
            }
            else {
                gEngineEffectSpecialSummon_08093390(gUnk_0201E4D0.unk0, 0);
                sub_080969C4(&gEngineEffectRedEyesDarknessMetalDragon_PendingZone);
                gUnk_0201E4D0.unk13_2 = 1;
            }

            return 0;
        }
        case 1: {
            if (sub_08096B14() == 0)
                return 0;

            gUnk_0201E4D0.unk13_2 = 2;
            // Fallthrough
        }
        case 2: {
            EngineRemoveFieldMonsterFromPlay(gUnk_0201E4D0.unk0, gEngineEffectRedEyesDarknessMetalDragon_PendingZone);
            EngineSpecialSummonFromHand(gUnk_0201E4D0.unk0, gUnk_0201E4D0.card_id);
            EngineMarkUsedEffectThisTurn(gUnk_0201E4D0.unk0, KONAMI_GOBLIN_CALLIGRAPHER, RDMD_EFFECT_BANISH_SUMMON);
            return 1;
        }
    }

    return 0;
}

// Effect (2): once per turn, during the Main Phase, Special Summon 1
// Dragon-Type monster from hand or Graveyard, except this card.
s32 gEngineEffectRedEyesDarknessMetalDragon_SummonDragon(void)
{
    switch (gUnk_0201E4D0.unk13_2) {
        case 0: {
            s32 location;

            if (EngineUsedEffectThisTurn(gUnk_0201E4D0.unk0, KONAMI_GOBLIN_CALLIGRAPHER, RDMD_EFFECT_SUMMON_DRAGON))
                return -1;

            location = EngineFindDragonInHandOrGY(gUnk_0201E4D0.unk0, RACE_DRAGON, KONAMI_GOBLIN_CALLIGRAPHER);
            if (location < 0)
                return -1;

            gEngineEffectRedEyesDarknessMetalDragon_PendingLocation = location;

            if (gUnk_0201E2A0.unk8[gUnk_0201E4D0.unk0] == 1) {
                gUnk_0201E4D0.unk13_2 = 2;
            }
            else {
                gEngineEffectSpecialSummon_08093390(gUnk_0201E4D0.unk0, 0);
                sub_080969C4(&gEngineEffectRedEyesDarknessMetalDragon_PendingLocation);
                gUnk_0201E4D0.unk13_2 = 1;
            }

            return 0;
        }
        case 1: {
            if (sub_08096B14() == 0)
                return 0;

            gUnk_0201E4D0.unk13_2 = 2;
            // Fallthrough
        }
        case 2: {
            EngineSpecialSummonFromHandOrGY(gUnk_0201E4D0.unk0, gEngineEffectRedEyesDarknessMetalDragon_PendingLocation);
            EngineMarkUsedEffectThisTurn(gUnk_0201E4D0.unk0, KONAMI_GOBLIN_CALLIGRAPHER, RDMD_EFFECT_SUMMON_DRAGON);
            return 1;
        }
    }

    return 0;
}

// ---- gCardEffectXxx adapter wrappers (effect 1 and the OLD effect-2 design) ----
// struct CardEffects.effs[] entries are EffectFn (void(void)), not the
// s32-returning step functions above -- every other entry in the gEffects
// tables is a thin "gCardEffectXxx" trampoline around the matching
// "gEngineEffectXxx" state machine, so these follow suit.
//
// BREAKTHROUGH for effect (2): src/effects.c's KONAMI_GOBLIN_CALLIGRAPHER
// row is now King Dragun's *real, unmodified* gCardEffects3 row verbatim
// (gCardEffectSpecialSummon_080659E8 / _08062E1C / gCardEffectDestroySpecialSummon_080563A4).
// That alone didn't work (it found nothing, since King Dragun's own AI
// function populates the AI-candidate list, gUnk_0201E4F0, with Dragons
// from the *Deck*, not hand). The fix was adding gCardAISpecialSummonDragonFromHandOrGraveyard
// below to src/AI_2.c's table instead -- it populates the exact same
// candidate list with Dragons from *hand* (using the real sub_080EEDF8 race
// check and the real sub_0808D88C candidate-registration call, same as
// Cathedral of Nobles' gCardAISearchSpecialSummon_08088B2C in
// engine_effects_3.c). King Dragun's real execution chain then finds and
// resolves that hand candidate correctly on its own -- confirmed working
// end-to-end by hand, including real field placement, with no field-zone
// or hand-removal code of our own at all. This sidesteps every problem
// hit earlier (gUnk_0201C510 corruption, the stale hand-browse cursor,
// the unconfirmed action-queue dispatch) by using real engine code for the
// entire resolution instead of reimplementing any of it.
//
// gCardEffectRedEyesDarknessMetalDragon_SummonDragon below (and
// EngineCheckDragonInHand/EngineSummonDragonFromHandCommit in
// asm/new_code.s) are now SUPERSEDED by that for effect (2) -- left in
// place as a reference for the hand-only search/remove primitives, not
// wired into any table anymore.
//
// Effect (1) (banish a face-up Dragon you control to Special Summon this
// card from hand) hasn't had the same treatment yet, but the same idea
// likely applies: instead of EngineFindFaceUpMonsterByRace/
// EngineRemoveFieldMonsterFromPlay (which use an unconfirmed placeholder
// field-zone offset known to corrupt state), find or write a
// gCardAIXxx-style function that registers a face-up field Dragon as an
// AI candidate, and pair it with a real card's existing
// banish-a-monster-you-control-to-summon-from-hand execution chain (e.g.
// whichever of Dark Core/Chaos Sorcerer/VWXYZ-Dragon Catapult Cannon's real
// gEffects1 functions actually perform it), the same way King Dragun's
// chain got reused here. gEngineEffectSpecialSummon_080A8C30_RDMD's call
// into gEngineEffectRedEyesDarknessMetalDragon_BanishSummon is still
// commented out pending that.
void gCardEffectRedEyesDarknessMetalDragon_BanishSummon(void)
{
    gEngineEffectRedEyesDarknessMetalDragon_BanishSummon();
}

void gCardEffectRedEyesDarknessMetalDragon_SummonDragon(void)
{
    gEngineEffectRedEyesDarknessMetalDragon_SummonDragon();
}

// ---- Already wired up (see src/effects.c, src/AI_2.c, src/card.c, linker.ld): ----
//
// src/effects.c -- KONAMI_GOBLIN_CALLIGRAPHER's gCardEffects3 row is King
// Dragun's real row (see above). effects.o was moved to the 0x0-padded
// free-space gap in linker.ld so it could grow without shifting the rest
// of the ROM; its old slot is 0xFF-filled.
//
// src/AI_2.c -- KONAMI_GOBLIN_CALLIGRAPHER's AI-candidate-search table entry
// is gCardAISpecialSummonDragonFromHandOrGraveyard (below), the function that actually
// makes effect (2) work (see the breakthrough note above).
//
// src/card.c -- both CardInfo rows (CARD_GOBLIN_CALLIGRAPHER and the
// KONAMI_GOBLIN_CALLIGRAPHER-indexed one) are atk=2800/def=2400/
// race=RACE_DRAGON/type=TYPE_EFFECT (attribute was already ATTR_DARK).
// Level is currently 1, not the real card's 10 -- deliberately, so it can
// be Normal Summoned without 2 tributes while effect (1) is disabled.
// Restore to 10 once that's no longer needed for testing.
//
// Still not done: src/card_names_descriptions.c (in-game name/description
// text for CARD_GOBLIN_CALLIGRAPHER still reads "Goblin Calligrapher").
//
// This intentionally breaks byte-matching for src/card.c, src/effects.c,
// and src/AI_2.c against the original ROM -- expected on this ROM-hack
// branch, since Goblin Calligrapher's slot is being deliberately
// overwritten with new content.

extern s32 gPlayerCards[][0x21A];
extern s32 gUnk_0201C510[][0x21A];
s32 sub_080EEDF8(u32);
s32 sub_0808D88C(s32, s32, u32);

// AI-candidate registration for effect (2) (REAL primitives throughout --
// see the breakthrough note above): for each Dragon-Type monster
// (sub_080EEDF8, confirmed real this session) in hand or Graveyard,
// register it as a candidate via sub_0808D88C -- category 0xB for the Hand
// zone (offset 0x48, count [3]), category 0xE for the Graveyard zone
// (offset 0x106, count [5]). Both the call convention and these exact zone
// constants are confirmed directly from real AI search functions:
// Cathedral of Nobles' gCardAISearchSpecialSummon_08088B2C (engine_effects_3.c)
// for hand, and Skilled Dark Magician's shared
// gCardAISpecialSummonGraveyard_0808A010 (still asm-only) for Graveyard.
// Whatever real execution chain is wired to this card's gCardEffects3 slots
// then finds and resolves these candidates entirely on its own.
//
// Once-per-turn: King Dragun's real slots 0/2/3 (gCardEffectSpecialSummon_080659E8/
// _08062E1C, gCardEffectDestroySpecialSummon_080563A4) all turned out to be
// generic/shared utilities (an environment precondition check, a hand-scan
// boolean check, and an unrelated Time Wizard animation trigger reused by
// 40+ other cards) -- none of them track "once per turn" anywhere, and the
// "0" field in every single gCardEffects row (including King Dragun's own)
// is genuinely always zero, not a per-card flags field. The real mechanism
// wasn't found, so this reuses our own EngineUsedEffectThisTurn flag
// (NEW, self-contained -- see asm/new_code.s) instead: skip registering any
// candidates at all once already used this turn, which makes King Dragun's
// real slot-2 check correctly report "not eligible" on a repeat activation
// attempt. Paired with EngineRDMD_MarkSummonUsedThenAnimate (asm/new_code.s,
// wired into slot 3 instead of the bare real function) marking the flag.
void gCardAISpecialSummonDragonFromHandOrGraveyard(s32 arg0) {
    u32 i;
    u32 cardId;

    if (EngineUsedEffectThisTurn(1 & arg0, KONAMI_GOBLIN_CALLIGRAPHER, RDMD_EFFECT_SUMMON_DRAGON))
        return;

    for (i = 0; i < gPlayerCards[(1 & arg0)][3]; i++) {
        cardId = ((struct PlayerCard *)(&gPlayerCards[(1 & arg0)][0x48 + i]))->card;
        if (cardId != KONAMI_GOBLIN_CALLIGRAPHER && sub_080EEDF8(cardId) == RACE_DRAGON) {
            sub_0808D88C(arg0, 0xB, i);
        }
    }
    for (i = 0; i < gPlayerCards[(1 & arg0)][5]; i++)
    {
        cardId = ((struct PlayerCard *)(&gPlayerCards[(1 & arg0)][0x106 + i]))->card;
        if (cardId != KONAMI_GOBLIN_CALLIGRAPHER && sub_080EEDF8(cardId) == RACE_DRAGON) {
            sub_0808D88C(arg0, 0xE, i);
        }
    }
}

// gUnk_0201C510 confirmed safe to READ (not write -- writing to it earlier
// this session corrupted the deck-browsing UI) via Cannon Soldier's real
// tribute-target validator (gEngineEffectTributeSpecialSummon_08033730/
// gEngineEffectTribute_080339D8): 5 field zones per player, 20 bytes
// (5 s32 words) per zone, card:13 in the first word, base =
// gUnk_0201C510 + playerIdx*0x868.

// Matches XYZ-Dragon Cannon's real validation-callback shape
// (gEngineEffectSpecialSummon_080A7ACC) -- passed to sub_080969C4 to drive
// the announce/highlight UI when there's more than one valid Dragon to
// choose from, recording the player's choice into
// gEngNC_LastValidatedDragonZone.
s32 EngineValidateDragonFieldZone(s32 playerIdx, s32 category, s32 index);
extern s32 gEngNC_LastValidatedDragonZone;

// gEngineEffectBoostATKBoostDEF_08047A80(request, playerRelative, zoneIndex)
// is the exact real function Dark Core/Chaos Sorcerer/BLS's real "remove
// from play" cost calls (gCardEffectBanishSpecialSummon_08076DE0), hardcoded
// to destination 0xF (Banished) inside (confirmed by reading it directly --
// no need to pass 0xF ourselves). Confirmed working end-to-end: actually
// banishes the field monster, synchronously -- no async queue/wait hazard
// like sub_080A1C78's Tribute-style chain (which is what froze the game
// when we tried to move its GY result to Banished afterward).
//
// First param is a real gCardEffects3-style request pointer (not playerIdx
// -- an earlier bug: passing a raw 0/1 made a deeper call dereference an
// invalid address instead of failing loudly, so the monster silently never
// got removed). Built the same way gEngineEffectDrawDiscard_08047D28 builds
// its own request (zeroed buffer, byte[2] bit 0 = playerIdx).
//
// Second/third params: gEngineEffectBoostATKBoostDEF_08047724's loop tests
// bit position (playerRelative<<4)+zoneIndex against gPlayerCards+0x1CE8
// XOR'd with a 0/1 loop variable -- playerRelative=0 means "myself", so the
// field zone index belongs in the THIRD argument, not the second (had this
// backwards before).
s32 gEngineEffectBoostATKBoostDEF_08047A80(s32 *request, s32 playerRelative, s32 zoneIndex);

s32 gEngineEffectBanishToSpecialSummon(void)
{
    switch (gUnk_0201E4D0.unk13_2) {
        case 0: {
            u32 i;
            u32 cardId;
            u32 playerIdx = gUnk_0201E4D0.unk0;
            u32 dragonCount = 0;
            s32 onlyZone = -1;

            // _080A8C30_New intercepts card_id==KONAMI_GOBLIN_CALLIGRAPHER
            // unconditionally, including while REDMD is already on the
            // field (e.g. effect (2)'s "Activate Effect" availability is
            // being evaluated). Without this exclusion, the scan found
            // REDMD itself sitting on the field (it's RACE_DRAGON) and
            // acted on it every time that happened -- corrupting state and
            // breaking effect (2) regardless of turn/session, matching what
            // was observed. gCardAISpecialSummonDragonFromHandOrGraveyard
            // already excludes it the same way.
            for (i = 0; i < 5; i++) {
                cardId = ((struct PlayerCard *)(&gUnk_0201C510[(1 & playerIdx)][i * 5]))->card;
                if (cardId != 0 && cardId != KONAMI_GOBLIN_CALLIGRAPHER && sub_080EEDF8(cardId) == RACE_DRAGON) {
                    dragonCount++;
                    onlyZone = i;
                }
            }

            if (dragonCount == 0)
                return -1;

            if (dragonCount == 1 || gUnk_0201E2A0.unk8[playerIdx] == 1) {
                // Only one valid target, or CPU player: nothing to choose.
                s32 request[6] = {0};

                ((u8 *)request)[2] = (u8)playerIdx;
                gEngineEffectBoostATKBoostDEF_08047A80(request, 0, onlyZone);
                return 1;
            }

            gEngineEffectSpecialSummon_08093390(playerIdx, 0x46);
            sub_080969C4((s32 *)EngineValidateDragonFieldZone);
            gUnk_0201E4D0.unk13_2 = 1;
            return 0;
        }
        case 1: {
            s32 request[6] = {0};

            if (sub_08096B14() == 0)
                return 0;

            ((u8 *)request)[2] = (u8)gUnk_0201E4D0.unk0;
            gEngineEffectBoostATKBoostDEF_08047A80(request, 0, gEngNC_LastValidatedDragonZone);
            return 1;
        }
    }

    return 0;
}
