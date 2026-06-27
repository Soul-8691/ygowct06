#include "card.h"
#include "effects.h"

s32 sub_0802FD60(s32, s32, s32, s32);               /* extern */
s32 gEngineEffectSpecialSummonSendToGY_0803BBA4(s32, u32, s32);                    /* extern */
s32 sub_0804AD48(u32);                              /* extern */
s32 gEngineEffectSpecialSummonFusionSummon_0804BB6C(u32);                              /* extern */
s32 gEngineEffectSpecialSummonFusion_0804BC58(u32);                              /* extern */
s32 sub_0808D88C(s32, s32, u32);                      /* extern */
extern s32 gPlayerCards[][0x21A];
extern s32 gUnk_0201C600;
extern s32 gUnk_0201C740;
extern s32 gUnk_0201C880;
struct Unk_0201E4D0 *PlayerCard;

// Cathedral of Nobles

void gCardAISearchSpecialSummon_08088B2C(s32 arg0) {
    s32 temp_r0;
    s32 temp_r1_2;
    s32* temp_r5;
    u32 temp_r4_2;
    u32 temp_r4_3;
    u32 temp_r4_4;
    u32 var_r6;
    u32 var_r6_2;
    u32 var_r6_3;
    void* temp_r3;
    void* temp_r3_2;
    void* temp_r4;
    s32 var_0;
    s32 var_1;

    // var_r6 = 0;
    for (var_r6 = 0; var_r6 < gPlayerCards[(1 & arg0)][3]; var_r6++) {
        temp_r4_2 = ((struct PlayerCard *)(&gPlayerCards[(1 & arg0)][0x48 + var_r6]))->card;
        if ((sub_0804AD48(temp_r4_2) != 0) && (gEngineEffectSpecialSummonSendToGY_0803BBA4(arg0, temp_r4_2, 1) != 0)) {
            sub_0808D88C(arg0, 0xB, var_r6);
        }
    }
    // var_r6_2 = 0;
    
    for (var_r6 = 0; var_r6 < gPlayerCards[(1 & arg0)][4]; var_r6++)
    {
        temp_r4_3 = ((struct PlayerCard *)(&gPlayerCards[(1 & arg0)][0x98 + var_r6]))->card;
        if ((sub_0804AD48(temp_r4_3) != 0) && (gEngineEffectSpecialSummonSendToGY_0803BBA4(arg0, temp_r4_3, 1) != 0)) {
            // temp_r0 = *&gPlayerCards[(1 & arg0)][0x98 + var_r6];
            var_0 = (((struct PlayerCard *)(&gPlayerCards[(1 & arg0)][0x98 + var_r6]))->unk_23 * 2);
            var_1 = ((struct PlayerCard *)(&gPlayerCards[(1 & arg0)][0x98 + var_r6]))->unk_14;
            if (sub_0802FD60(arg0, 0xB, KONAMI_PARASITE_PARACIDE, var_0 + var_1) == 0) {
                sub_0808D88C(arg0, 0xD, var_r6);
            }
        }
    }
    // var_r6_3 = 0;
    for (var_r6 = 0; var_r6 < gPlayerCards[(1 & arg0)][6]; var_r6++)
    {
        temp_r4_4 = ((struct PlayerCard *)(&gPlayerCards[(1 & arg0)][0xE8 + var_r6]))->card;
        if ((gEngineEffectSpecialSummonFusionSummon_0804BB6C(temp_r4_4) != 0) && (gEngineEffectSpecialSummonFusion_0804BC58(temp_r4_4) != 0)) {
            sub_0808D88C(arg0, 0xC, var_r6);
        }
    }
}
