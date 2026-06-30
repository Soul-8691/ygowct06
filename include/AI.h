#ifndef GUARD_AI_H
#define GUARD_AI_H

#include "card.h"
#include "effects.h"  // for EffectFn

// One entry in an AI effect table.
struct CardAIEffect {
    /* 0x0 */ u16      konamiId; // Konami card ID
    /* 0x2 */ u16      pad;
    /* 0x4 */ EffectFn effect;
}; /* size = 0x8 */

extern const struct CardAIEffect gAISearcherCardEffects[308]; // searchers
extern const struct CardAIEffect gAIEffects[222]; // effects4
extern const struct CardAIEffect gAIEffects2[70]; // effects5
extern const struct CardAIEffect gAIEffects3[57]; // effects6
extern const struct CardAIEffect gAIEffects4[165]; // effects7
extern const struct CardAIEffect gAIEffects5[3]; // effects8
extern const struct CardAIEffect gAIEffects6[5]; // effects9
extern const struct CardAIEffect gAIEffects7[207]; // effects10
extern const struct CardAIEffect gAIEffects8[71]; // effects11

#endif // GUARD_AI_H
