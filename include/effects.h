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

typedef struct PlayerCards {
    u8 fill0[0x1D40-0x0];
    s32 unk1D40;
    u8 fill1D44[0x1D68-0x1D44];
    u32 unk1D68;
    u32 unk1D6C;
    u32 unk1D70;
} PlayerCards;

typedef struct Unk_0201E2A0 {
    u8 fill0[0x4-0x0];
    u32 unk4;
    s32 unk8[0]; // TODO: Unknown size
} Unk_0201E2A0;

struct Unk_0201FEC0 {
    u32 unk0;
    u32 unk4;
};

struct Unk_02020160 {
    u8 padding[0x2F51];
    u8 unk2F51;
};

struct Unk_02023110 {
    u8 padding[0x19];
    u8 unk19;
};

struct Unk_03000040 {
    u8 padding[0x23F];
    u8 unk23F;
};

struct Unk_0201F440 {
    u8 unk0;
};

struct Unk_0201C4E8 { // TODO: really?
    u32 unk0;
    u32 unk4;
    u8 pad4[0x868 - 0x8];
};

struct Unk_020230E8 {
    u32 unk0, unk4, unk8[0]; // TODO: IDK the size
};

struct Unk_02023130 {
    u8 pad0[0x4C - 0x0];
    u16 unk4C[2];
    u16 unk50[1][0x50];
};

#endif // GUARD_EFFECTS_H
