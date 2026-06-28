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

// ---- Existing engine helpers (signatures as used in engine_effects.c/_2.c) ----
s32 sub_08096B14(void);                                            /* extern */
s32 gEngineEffectSpecialSummon_08093390(u32, s32*);                /* extern */
s32 sub_080969C4(s32*);                                             /* extern */
s32 gEngineEffectSpecialSummonGraveyard_080B70AC(u32, u32, s32*);  /* extern */

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
                gEngineEffectSpecialSummon_08093390(gUnk_0201E4D0.unk0, NULL);
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
                gEngineEffectSpecialSummon_08093390(gUnk_0201E4D0.unk0, NULL);
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

// ---- gCardEffectXxx adapter wrappers ----
// struct CardEffects.effs[] entries are EffectFn (void(void)), not the
// s32-returning step functions above -- every other entry in the gEffects
// tables is a thin "gCardEffectXxx" trampoline around the matching
// "gEngineEffectXxx" state machine, so these follow suit.
//
// CURRENT STATUS (see asm/new_code.s's header for the full writeup):
//   - gCardEffectRedEyesDarknessMetalDragon_BanishSummon (effect 1) is
//     wired into the alt-summon-condition dispatch
//     (gEngineEffectSpecialSummon_080A8C30_RDMD in asm/new_code.s), but the
//     actual call into it is commented out there: it depends on
//     EngineFindFaceUpMonsterByRace/EngineRemoveFieldMonsterFromPlay, which
//     use an unconfirmed placeholder field-zone offset known to corrupt
//     state when exercised (same root cause documented below).
//   - gCardEffectRedEyesDarknessMetalDragon_SummonDragon (effect 2) is NOT
//     currently wired into gCardEffects3 at all. src/effects.c's
//     KONAMI_GOBLIN_CALLIGRAPHER row instead points slots 2/3 directly at
//     EngineCheckDragonInHand / EngineSummonDragonFromHandCommit
//     (asm/new_code.s) -- simpler functions that only search+remove from
//     hand (no field placement, no once-per-turn tracking) and were used to
//     debug the real gCardEffects3 calling/staging convention. This
//     gUnk_0201E4D0-based version is the intended end-state design (proper
//     check/wait/commit staging, hand+GY search, once-per-turn tracking) to
//     swap back in once the real field-monster-zone array and the real
//     hand-removal-with-UI-sync mechanism are found.
void gCardEffectRedEyesDarknessMetalDragon_BanishSummon(void)
{
    gEngineEffectRedEyesDarknessMetalDragon_BanishSummon();
}

void gCardEffectRedEyesDarknessMetalDragon_SummonDragon(void)
{
    gEngineEffectRedEyesDarknessMetalDragon_SummonDragon();
}

// ---- Already wired up (see src/effects.c, src/card.c, linker.ld): ----
//
// src/effects.c -- KONAMI_GOBLIN_CALLIGRAPHER has a gCardEffects3 row (see
// above for why it points at EngineCheckDragonInHand/Commit, not the
// gCardEffectXxx wrappers in this file). effects.o was moved to the
// 0x0-padded free-space gap in linker.ld so it could grow without shifting
// the rest of the ROM; its old slot is 0xFF-filled.
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
// This intentionally breaks byte-matching for src/card.c and src/effects.c
// against the original ROM -- expected on this ROM-hack branch, since
// Goblin Calligrapher's slot is being deliberately overwritten with new
// content.

extern s32 gPlayerCards[][0x21A];
s32 sub_080EEDF8(u32);
s32 sub_0808D88C(s32, s32, u32);

void gCardAISpecialSummonDragonFromHand(s32 arg0) {
    u32 i;
    u32 cardId;
    s32 var_0;
    s32 var_1;

    for (i = 0; i < gPlayerCards[(1 & arg0)][3]; i++) {
        cardId = ((struct PlayerCard *)(&gPlayerCards[(1 & arg0)][0x48 + i]))->card;
        if (sub_080EEDF8(cardId) == RACE_DRAGON) {
            sub_0808D88C(arg0, 0xB, i);
        }
    }
}
