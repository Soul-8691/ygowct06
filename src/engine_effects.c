#include "effects.h"

s32 gEngineEffectSpecialSummon_0801EC9C(s32, s32, s32, s32);
s32 gEngineEffectSpecialSummon_08093390(u32, s32);
s32 sub_080969C4(s32*);
s32 sub_08096B14(void);
s32 gEngineEffectSpecialSummonDiscard_080A5F7C(void);
s32 gEngineEffectSpecialSummonGraveyard_080B70AC(u32, u32, s32*);

extern PlayerCards gPlayerCards;
extern Unk_0201E2A0 gUnk_0201E2A0;
extern s32 gEngineEffectSpecialSummon_080A5714;
extern Unk_0201E4D0 gUnk_0201E4D0;

s32 gEngineEffectSpecialSummonDiscard_080A6630(void)
{
    if (!(gUnk_0201E4D0.unk12 & 2)) {
        return gEngineEffectSpecialSummonDiscard_080A5F7C();
    }
    else {
        u8 temp_r6 = gUnk_0201E4D0.unk13_2;
        switch (temp_r6) {
            case 0: {
                if (gUnk_0201E2A0.unk8[gUnk_0201E4D0.unk0] == 1) {
                    gEngineEffectSpecialSummonGraveyard_080B70AC(gUnk_0201E4D0.unk0, gUnk_0201E4D0.card_id, &gEngineEffectSpecialSummon_080A5714);
                } else {
                    gEngineEffectSpecialSummon_08093390(gUnk_0201E4D0.unk0, 18);
                    sub_080969C4(&gEngineEffectSpecialSummon_080A5714);
                }
    
                gUnk_0201E4D0.unk13_2++;
                return 0;
            }
            case 1: {
                if (sub_08096B14() != 0) {
                    s32 temp_r5 = gPlayerCards.unk1D68;
                    s32 temp_r4 = gPlayerCards.unk1D6C + gPlayerCards.unk1D70;
                    gEngineEffectSpecialSummon_0801EC9C(40, temp_r5, temp_r4, 0);
                    gUnk_0201E4D0.unk8 = temp_r6;
                    gUnk_0201E4D0.unkC = (u8)temp_r5; // Bitfield?
                    gUnk_0201E4D0.unkC |= (u8)temp_r4 << 8;
                    return 1;
                }
    
                return -1;
            }
            default: {
                return 0;
            }
        }
    }
}
