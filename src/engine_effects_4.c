#include "card.h"
#include "effects.h"

extern u32 gEngineEffectSpecialSummonChangePosition_080BEFC0(); /* extern */
extern u32 gEngineEffectSpecialSummonChangePosition_080C0C70(); /* extern */
extern u32 gEngineEffectSpecialSummonChangePosition_080C1448(); /* extern */
extern u32 gEngineEffectSpecialSummonChangePosition_080C17D4(); /* extern */
extern u32 gEngineEffectSpecialSummonDamage_080BC880();    /* extern */
extern u32 gEngineEffectSpecialSummonDamage_080BC918();    /* extern */
extern u32 gEngineEffectSpecialSummonDamage_080BCBD4();    /* extern */
extern u32 gEngineEffectSpecialSummonDamage_080BEA94();    /* extern */
extern u32 gEngineEffectSpecialSummonDamage_080C1AD0();    /* extern */
extern u32 gEngineEffectSpecialSummonPreventAttack_080C3080(); /* extern */
extern u32 gEngineEffectSpecialSummon_080BF228();          /* extern */
extern u32 gEngineEffectSpecialSummon_080C0F38();          /* extern */
extern u32 gEngineEffectSpecialSummon_080C25AC();          /* extern */
extern u32 gEngineEffectSpecialSummon_080C2ACC();          /* extern */
extern u32 gEngineEffectSpecialSummon_080C3D20();          /* extern */
extern u32 gEngineEffectSpecialSummon_080C4350();          /* extern */
extern u32 gEngineEffectSpecialSummon_080C4EDC();          /* extern */
extern u32 gEngineEffectSpecialSummon_080CCA80();          /* extern */
extern u32 sub_080BD0A8();                                 /* extern */
extern u32 sub_080BD3F4();                                 /* extern */
extern u32 sub_080BD660();                                 /* extern */
extern u32 sub_080BD870();                                 /* extern */
extern u32 sub_080BDCFC();                                 /* extern */
extern u32 sub_080BDFAC();                                 /* extern */
extern u32 sub_080BE600();                                 /* extern */
extern u32 sub_080BF394();                                 /* extern */
extern u32 sub_080BF5A0();                                 /* extern */
extern u32 sub_080BF7F8();                                 /* extern */
extern u32 sub_080BFE0C();                                 /* extern */
extern u32 sub_080C07E4();                                 /* extern */
extern u32 sub_080C0A80();                                 /* extern */
extern u32 sub_080C1C60();                                 /* extern */
extern u32 sub_080C1E9C();                                 /* extern */
extern u32 sub_080C2544();                                 /* extern */
extern u32 sub_080C91E0();                                 /* extern */
extern struct Unk_0201F440 gUnk_0201F440;
extern struct Unk_0201FEC0 gUnk_0201FEC0;
extern struct Unk_02020160 gUnk_02020160;
extern struct Unk_02023110 gUnk_02023110;
extern struct Unk_03000040 gUnk_03000040;

u32 gEngineEffectSpecialSummon_0801EF94(u32 arg0) {
    switch (arg0) {                                 /* switch 1; irregular */
    case 0x0:                                       /* switch 1 */
    case 0x18:                                      /* switch 1 */
    case 0x19:                                      /* switch 1 */
        if (2 & gUnk_02023110.unk19) {
            return gEngineEffectSpecialSummon_080C4EDC();
        }
        if (!(1 & gUnk_02023110.unk19)) {     
            break;
        }
        return gEngineEffectSpecialSummon_080C4350();
    case 0x3:                                       /* switch 1 */
        return gEngineEffectSpecialSummon_080CCA80();
    case 0x15:                                      /* switch 1 */
        return gEngineEffectSpecialSummonDamage_080BEA94();
    case 0x10:                                      /* switch 1 */
        return gEngineEffectSpecialSummon_080C25AC();
    case 0x11:                                      /* switch 1 */
        return gEngineEffectSpecialSummon_080BF228();
    case 0x31:                                      /* switch 1 */
        {
            u32 something = gUnk_0201F440.unk0 << 0x1F;
            u32 something2 = gUnk_02020160.unk2F51 << 0x1F;
            return (u32) (something2 | something) >> 0x1F;
        }
    case 0x1A:                                      /* switch 1 */
        return gEngineEffectSpecialSummon_080C3D20();
    case 0xE:                                       /* switch 1 */
        return sub_080BF394();
    case 0x32:                                      /* switch 1 */
        return (u32) (gUnk_02020160.unk2F51 << 0x1F) >> 0x1F;
    case 0x6:                                       /* switch 1 */
        return sub_080C91E0();
    case 0x5:                                       /* switch 1 */
        return sub_080BFE0C();
    case 0x4:                                       /* switch 1 */
        return sub_080BDCFC();
    case 0x1:                                       /* switch 1 */
        if (1 & gUnk_03000040.unk23F) {
            return sub_080BDFAC();
        }
        return sub_080BE600();
    case 0x2:                                       /* switch 1 */
        if ((1 & gUnk_0201F440.unk0) || (1 & gUnk_02020160.unk2F51)) {
            return 1U;
        }
        switch ((s32)gUnk_0201FEC0.unk4) {               /* switch 2; irregular */
        case 1:                                     /* switch 2 */
            return sub_080BD0A8();
        case 2:                                     /* switch 2 */
            return sub_080BD3F4();
        case 3:                                     /* switch 2 */
            return sub_080BD660();
        }
        break;
    case 0x30:                                      /* switch 1 */
        return sub_080BD870();
    case 0x20:                                      /* switch 1 */
        return gEngineEffectSpecialSummonChangePosition_080C0C70();
    case 0x21:                                      /* switch 1 */
        return gEngineEffectSpecialSummon_080C0F38();
    case 0x23:                                      /* switch 1 */
        return gEngineEffectSpecialSummonChangePosition_080C17D4();
    case 0x25:                                      /* switch 1 */
        return gEngineEffectSpecialSummonChangePosition_080C1448();
    case 0x13:                                      /* switch 1 */
        return gEngineEffectSpecialSummonDamage_080C1AD0();
    case 0xC:                                       /* switch 1 */
        return gEngineEffectSpecialSummonPreventAttack_080C3080();
    case 0xB:                                       /* switch 1 */
        return gEngineEffectSpecialSummon_080C2ACC();
    case 0x33:                                      /* switch 1 */
        return sub_080C07E4();
    case 0x34:                                      /* switch 1 */
        return sub_080C0A80();
    case 0x37:                                      /* switch 1 */
        return sub_080BF7F8();
    case 0x38:                                      /* switch 1 */
        return sub_080BF5A0();
    case 0x3A:                                      /* switch 1 */
        return gEngineEffectSpecialSummonDamage_080BCBD4();
    case 0x3B:                                      /* switch 1 */
        return gEngineEffectSpecialSummonDamage_080BC918();
    case 0x3C:                                      /* switch 1 */
        return gEngineEffectSpecialSummonDamage_080BC880();
    case 0x17:                                      /* switch 1 */
        return gEngineEffectSpecialSummonChangePosition_080BEFC0();
    case 0x2F:                                      /* switch 1 */
        return sub_080C1E9C();
    case 0x2E:                                      /* switch 1 */
        return sub_080C1C60();
    case 0x3D:                                      /* switch 1 */
        return sub_080C2544();
    }
    return 0;
}
