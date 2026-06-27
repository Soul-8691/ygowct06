#include "card.h"
#include "effects.h"

s32 sub_0802FD60(s32, s32, s32, s32);               /* extern */
s32 gEngineEffectSpecialSummonSendToGY_0803BBA4(s32, u32, s32);                    /* extern */
s32 sub_0804AD48(u32);                              /* extern */
s32 gEngineEffectSpecialSummonFusionSummon_0804BB6C(u32);                              /* extern */
s32 gEngineEffectSpecialSummonFusion_0804BC58(u32);                              /* extern */
s32 sub_0808D88C(s32, s32, u32);                      /* extern */
extern s32 gPlayerCards[][0x21A];

// Cathedral of Nobles

void gCardAISearchSpecialSummon_08088B2C(s32 arg0) {
    u32 i;
    u32 cardId;
    s32 var_0;
    s32 var_1;

    for (i = 0; i < gPlayerCards[(1 & arg0)][3]; i++) {
        cardId = ((struct PlayerCard *)(&gPlayerCards[(1 & arg0)][0x48 + i]))->card;
        if ((sub_0804AD48(cardId) != 0) && (gEngineEffectSpecialSummonSendToGY_0803BBA4(arg0, cardId, 1) != 0)) {
            sub_0808D88C(arg0, 0xB, i);
        }
    }

    for (i = 0; i < gPlayerCards[(1 & arg0)][4]; i++)
    {
        cardId = ((struct PlayerCard *)(&gPlayerCards[(1 & arg0)][0x98 + i]))->card;
        if ((sub_0804AD48(cardId) != 0) && (gEngineEffectSpecialSummonSendToGY_0803BBA4(arg0, cardId, 1) != 0)) {
            var_0 = (((struct PlayerCard *)(&gPlayerCards[(1 & arg0)][0x98 + i]))->unk_23 * 2);
            var_1 = ((struct PlayerCard *)(&gPlayerCards[(1 & arg0)][0x98 + i]))->unk_14;
            if (sub_0802FD60(arg0, 0xB, KONAMI_PARASITE_PARACIDE, var_0 + var_1) == 0) {
                sub_0808D88C(arg0, 0xD, i);
            }
        }
    }

    for (i = 0; i < gPlayerCards[(1 & arg0)][6]; i++)
    {
        cardId = ((struct PlayerCard *)(&gPlayerCards[(1 & arg0)][0xE8 + i]))->card;
        if ((gEngineEffectSpecialSummonFusionSummon_0804BB6C(cardId) != 0) && (gEngineEffectSpecialSummonFusion_0804BC58(cardId) != 0)) {
            sub_0808D88C(arg0, 0xC, i);
        }
    }
}
