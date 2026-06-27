#include "card.h"
#include "effects.h"

extern Unk_0201C4E0 gUnk_0201C4E0;
extern Unk_0201E2A0 gUnk_0201E2A0;
extern Unk_0201E4D0 gUnk_0201E4D0;
extern s32 gEngineEffectSpecialSummonGraveyard_080A5AFC;

s32 sub_0801F2C4(s32*, s32, s32);
s32 sub_0801F338(s32*, s32*, s32);
s32 sub_0802FC90(u32, s32, s32);
s32 sub_08044970(u32, s32, s32);
s32 gEngineEffectBoostATKBoostDEF_08047A38(s32, s32, s32);
s32 sub_0804A76C(void);
s32 sub_0804A870(void);
s32 gEngineEffectSpecialSummon_08093390(u32, s32*);
s32 gEngineEffectDiscardDestroyAll_080941C4(u32, s32, u32, u32);
s32 sub_080945F4(u32);
s32 sub_08096A08(s32*);
s32 sub_08096B14(void);
s32 gEngineEffectSpecialSummonGraveyard_080A422C(u32);
s32 gEngineEffectSpecialSummonGraveyard_080B70AC(u32, u32, s32*);
s32 sub_080EECA8(void);
s32 sub_080EED50(s32);
s32 sub_080EEDF8(u32);
s32 sub_080EEE24(u32);

// Black Luster Soldier - Envoy of the Beginning
// Chaos Emperor Dragon - Envoy of the End
// Chaos Sorcerer
// Dark Necrofear
// Doom Dozer
// Megarock Dragon

s32 gEngineEffectSpecialSummonGraveyard_080A71E4(void)
{
    switch (gUnk_0201E4D0.unk13_2) {
        case 0: {
            sub_0804A76C();
            // Fallthrough
        }
        case 4: {
            s32 yep;
            s32 idk1[0x100/4];
            s32 idk2[0x100/4];
            s32 temp_r6 = gEngineEffectSpecialSummonGraveyard_080A422C(gUnk_0201E4D0.card_id);

            switch (gUnk_0201E4D0.card_id) {
                case KONAMI_DARK_NECROFEAR:
                case KONAMI_MEGAROCK_DRAGON:
                case KONAMI_DOOM_DOZER: {
                    sub_080EEDF8(gUnk_0201E4D0.card_id);
                    yep = sub_080EECA8();
                    break;
                }
                case KONAMI_CHAOS_SORCERER:
                case KONAMI_BLACK_LUSTER_SOLDIER_ENVOY_OF_THE_BEGINNING:
                case KONAMI_CHAOS_EMPEROR_DRAGON_ENVOY_OF_THE_END: {
                    s32 dudesrsly;

                    if (gUnk_0201E4D0.unk13_4 != 0)
                        dudesrsly = 2;
                    else
                        dudesrsly = 1;

                    yep = sub_080EED50(dudesrsly);
                    break;
                }
                default: {
                        yep = sub_080EED50(sub_080EEE24(gUnk_0201E4D0.card_id));
                    break;
                }
            }

            gUnk_0201E4D0.unk13_3 = temp_r6;
            if (sub_0802FC90(gUnk_0201E4D0.unk0, 11, 0x14A0) != 0) {
                if (temp_r6 > 1) {
                    sub_0801F2C4(idk2, 0xD6, yep);
                    sub_0801F338(idk1, idk2, temp_r6);
                }
                else {
                    sub_0801F2C4(idk1, 0xD8, yep);
                }

                gUnk_0201E4D0.unk13_2 = 5;
            }
            else {
                if (temp_r6 > 1) {
                    sub_0801F2C4(idk2, 0xD7, yep);
                    sub_0801F338(idk1, idk2, temp_r6);
                }
                else {
                    sub_0801F2C4(idk1, 0xD9, yep);
                }

                gUnk_0201E4D0.unk13_2 = 1;
            }

            if (gUnk_0201E2A0.unk8[gUnk_0201E4D0.unk0] != 1)
                gEngineEffectSpecialSummon_08093390(gUnk_0201E4D0.unk0, idk1);

            break;
        }
        case 1: {
            if (gUnk_0201E4D0.card_id == KONAMI_MEGAROCK_DRAGON) {
                gEngineEffectDiscardDestroyAll_080941C4(gUnk_0201E4D0.unk0, 0x47, gUnk_0201E4D0.card_id, gUnk_0201E4D0.unk13_4);
            }
            else {
                s32 a0 = gUnk_0201E4D0.unk0;
                s32 a1 = gUnk_0201E4D0.unk13_3;

                if (a1 > 32)
                    a1 = 32;

                gEngineEffectDiscardDestroyAll_080941C4(a0, a1 + 6, gUnk_0201E4D0.card_id, gUnk_0201E4D0.unk13_4);
            }

            gUnk_0201E4D0.unk13_2++;
            gUnk_0201E4D0.unk13_3 = 0;
            break;
        }
        case 2: {
            if (++gUnk_0201E4D0.unk13_3 <= gUnk_0201C4E0.unk1D40)
                sub_08044970(gUnk_0201E4D0.unk0, sub_080945F4(gUnk_0201E4D0.unk13_3), 0);
            else
                gUnk_0201E4D0.unk13_2++;

            break;
        }
        case 3: {
            switch (gUnk_0201E4D0.card_id) {
                case KONAMI_BLACK_LUSTER_SOLDIER_ENVOY_OF_THE_BEGINNING:
                case KONAMI_CHAOS_EMPEROR_DRAGON_ENVOY_OF_THE_END:
                case KONAMI_CHAOS_SORCERER: {
                    if (++gUnk_0201E4D0.unk13_4 == 1) {
                        gUnk_0201E4D0.unk13_2 = 4;
                        return 0;
                    }
                    break;
                }
                case KONAMI_MEGAROCK_DRAGON: {
                    gUnk_0201E4D0.unkC = gUnk_0201C4E0.unk1D40;
                    break;
                }
            }

            sub_0804A870();
            gUnk_0201E4D0.unk8 = 0;
            return 1;
        }
        case 5: {
            if (gUnk_0201E2A0.unk8[gUnk_0201E4D0.unk0] == 1)
                gEngineEffectSpecialSummonGraveyard_080B70AC(gUnk_0201E4D0.unk0, gUnk_0201E4D0.card_id, &gEngineEffectSpecialSummonGraveyard_080A5AFC);
            else
                sub_08096A08(&gEngineEffectSpecialSummonGraveyard_080A5AFC);

            gUnk_0201E4D0.unk13_2++;
            break;
        }
        case 6: {
            if (sub_08096B14() != 0) {
                gEngineEffectBoostATKBoostDEF_08047A38(gUnk_0201C4E0.unk1D68, gUnk_0201C4E0.unk1D6C + gUnk_0201C4E0.unk1D70, 0);

                if (--gUnk_0201E4D0.unk13_3 == 0) {
                    gUnk_0201E4D0.unk13_2 = 3;
                    break;
                }
            }

            gUnk_0201E4D0.unk13_2--;
            break;
        }
    }

    return 0;
}
