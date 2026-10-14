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
s32 gEngineEffectBoostATKBoostDEF_080C8F48(u32);      /* extern */
s32 gEngineEffectSpecialSummonBoostATK_080CBF58(u32); /* extern */
s32 gEngineEffectSpecialSummonDamage_080C39FC(u16, u16, u16); /* extern */
s32 gEngineEffectSpecialSummonDamage_080C412C(u32, u32, u32); /* extern */
s32 gEngineEffectSpecialSummonNegate_080C8D30();      /* extern */
s32 gEngineEffectSpecialSummonPreventAttack_080C8BF0(); /* extern */
s32 gEngineEffectSpecialSummonSendToGY_08096B3C(u32, s32, u32); /* extern */
s32 gEngineEffectSpecialSummonSendToGY_080C89E8();    /* extern */
s32 gEngineEffectSpecialSummon_080C4220(u32, u32);    /* extern */
s32 gEngineEffectSpecialSummon_080C6A20(u32, s32, u32); /* extern */
s32 gEngineEffectSpecialSummon_080C8904();            /* extern */
s32 gEngineEffectSpecialSummon_080CBF0C();            /* extern */
u16 sub_08094678(u32, u32);                         /* extern */
s32 sub_08096974();                                 /* extern */
s32 sub_080BC794(u32, u32, u32);                      /* extern */
s32 sub_080C2840(u32);                                /* extern */
s32 sub_080C2880(u32, u32, u32);                      /* extern */
s32 sub_080C291C(u32, u32, u32);                      /* extern */
s32 sub_080C3D00(u32, u32);                           /* extern */
s32 sub_080C40E0(u32, u32, u32);                      /* extern */
s32 sub_080C4EA0(u32, u32);                           /* extern */
s32 sub_080C678C();                                   /* extern */
s32 sub_080C7950(u32, u32, u32);                      /* extern */
s32 sub_080CA5F8(u32, u32);                           /* extern */
extern struct Unk_0201C4E8 gUnk_0201C4E8[];
extern struct Unk_0201E2A0 gUnk_0201E2A0;
extern struct Unk_020230E8 gUnk_020230E8;
extern struct Unk_02023130 gUnk_02023130;

s32 gEngineEffectSpecialSummon_0801EC9C(s32 arg0, s32 arg1, s32 arg2, s32 arg3)
{
    s32 var_r4;
    s32 var_r7;
    u32 temp_r5;

    switch (arg0 - 1)
    {
        case 0x17:
            sub_080C40E0(arg1, arg2, arg3);
            return 1;
    
        case 0x9:
        case 0x1B:
        case 0x1C:
        case 0x1D:
        case 0x1E:
        case 0x21:
        case 0x26:
        case 0x27:
        case 0x28:
        case 0x29:
        case 0x2A:
        case 0x2B:
        case 0x2C:
        case 0x34:
        case 0x38:
            return 1;
    
        case 0x18:
            sub_080C4EA0(arg2, arg3);
            return 1;
    
        case 0x1A:
            gEngineEffectSpecialSummonDamage_080C412C(arg1, arg2, arg3);
            return 1;
    
        case 0x19:
            sub_080C3D00(arg1, arg2);
            return 1;
    
        case 0x13:
        case 0x15:
            gEngineEffectSpecialSummonDamage_080C39FC(arg1, arg2, sub_08094678(arg1, arg2));
            return 1;
    
        case 0x8:
            gEngineEffectSpecialSummonPreventAttack_080C8BF0();
            sub_080C2840(arg1);
            return 1;
    
        case 0xB:
            sub_080C291C(arg1, arg2, arg3);
            return 1;
    
        case 0xA:
            sub_080C2880(arg1, arg2, arg3);
            return 1;
    
        case 0x30:
            sub_080C7950(arg1, arg2, arg3);
            return 1;
    
        case 0xC:
            sub_080CA5F8(arg1, arg2);
            return 1;
    
        case 0x31:
            gEngineEffectSpecialSummonBoostATK_080CBF58(arg2);
            return 0;
    
        case 0x2:
            if (sub_08096974() == 1)
            {
                gEngineEffectSpecialSummon_080C6A20(gUnk_0201E2A0.unk4, 0xD, 0);
            }
            else
            {
                for (var_r7 = 0; var_r7 < 2; var_r7++)
                {
                    temp_r5 = gUnk_0201E2A0.unk4 ^ var_r7;
                    for (var_r4 = 0; var_r4 <= 0xA; var_r4++)
                    {
                        if (gEngineEffectSpecialSummonSendToGY_08096B3C(temp_r5, var_r4, 0) & 0x800)
                        {
                            gEngineEffectSpecialSummon_080C6A20(temp_r5, var_r4, 0);
                            gEngineEffectSpecialSummonSendToGY_080C89E8();
                            return 1;
                        }
                    }
                    for (var_r4 = 0; var_r4 < gUnk_0201C4E8[temp_r5 & 1].unk4; var_r4++)
                    {
                        if (gEngineEffectSpecialSummonSendToGY_08096B3C(temp_r5, 0xB, var_r4) & 0x800)
                        {
                            gEngineEffectSpecialSummon_080C6A20(temp_r5, 0xB, var_r4);
                            gEngineEffectSpecialSummonSendToGY_080C89E8();
                            return 1;
                        }
                    }
                    gUnk_020230E8.unk8[temp_r5] = 0;
                }
            }
            return 1;
    
        case 0x5:
            gEngineEffectBoostATKBoostDEF_080C8F48(arg1);
            return 1;
    
        case 0x10:
            gUnk_02023130.unk50[arg1][arg2] = 1;
            gEngineEffectSpecialSummon_080C4220(arg1, gUnk_02023130.unk4C[arg1]);
            sub_080C678C();
            gEngineEffectSpecialSummon_080CBF0C();
            sub_080BC794(arg1, arg2, arg3);
            return 1;
    
        case 0x11:
            gEngineEffectSpecialSummon_080C4220(arg1, gUnk_02023130.unk4C[arg1]);
            return 1;
    
        case 0x20:
            sub_080BC794(arg1, arg2, arg3);
            gEngineEffectSpecialSummon_080C6A20(arg1, arg2, arg3);
            return 1;
    
        case 0x6:
            gEngineEffectSpecialSummon_080C6A20(arg1, arg2, arg3);
            return 1;
    
        case 0x23:
            gEngineEffectSpecialSummon_080CBF0C();
            gEngineEffectSpecialSummonNegate_080C8D30();
            gEngineEffectSpecialSummonPreventAttack_080C8BF0();
            gEngineEffectSpecialSummon_080C8904();
            return 1;
    
        case 0x0:
        case 0x1:
        case 0x3:
        case 0x4:
        case 0xD:
        case 0xF:
        case 0x12:
        case 0x14:
        case 0x16:
        case 0x1F:
        case 0x22:
        case 0x24:
        case 0x2D:
        case 0x2E:
        case 0x2F:
        case 0x32:
        case 0x33:
        case 0x36:
        case 0x37:
        case 0x39:
        case 0x3A:
        case 0x3B:
        case 0x3C:
            sub_080BC794(arg1, arg2, arg3);
            return 1;
    
        default:
            return 0;
    }
}

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
