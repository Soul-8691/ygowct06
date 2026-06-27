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

typedef struct Unk_0201E4D0
{
    u32 unk0:1;
    u32 unk0_1:7;
    u32 card_id:15;
    u32 unk4;
    u8 unk8;
    u8 fill9[0xC-0x9];
    u16 unkC;
    u8 fillE[0x10-0xE];
    u16 unk10;
    u8 unk12;
    u32 unk13_1:1;
    u32 unk13_2:8;
    u32 unk13_3:8;
    u32 unk13_4:8;
} Unk_0201E4D0;

typedef struct Unk_0201C4E0 {
    u8 fill0[0x1D40-0x0];
    s32 unk1D40;
    u8 fill1D44[0x1D68-0x1D44];
    u32 unk1D68;
    u32 unk1D6C;
    u32 unk1D70;
} Unk_0201C4E0;

typedef struct Unk_0201E2A0 {
    u8 fill0[0x8-0x0];
    s32 unk8[0]; // TODO: Unknown size
} Unk_0201E2A0;

#endif // GUARD_EFFECTS_H
