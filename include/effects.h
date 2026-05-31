#ifndef GUARD_EFFECTS_H
#define GUARD_EFFECTS_H

#include "card.h"

// Effect function pointer type.
typedef void (*EffectFn)(void);

// One entry in an effects table.
struct CardEffects {
    /* 0x00 */ u16 konamiId; // Konami card ID
    /* 0x02 */ u16 pad;
    /* 0x04 */ EffectFn effs[5]; // effect slots 1-5
}; /* size = 0x18 */

extern const struct CardEffects gEffects1[];
extern const struct CardEffects gEffects2[];
extern const struct CardEffects gEffects3[];
extern const struct CardEffects gFlipEffects[];

#endif // GUARD_EFFECTS_H
