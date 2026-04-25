#include "global.h"

struct Unk_02023480_8 {
    u32 unk_0_0:2; // BLDCNT Color Effect
    u32 unk_0_2:8;
    u32 unk_0_A:8;
};

struct Unk_02023480 {
    s8 unk_0;
    s8 unk_1;
    u8 unk_2; // 1st target pixel
    s8 unk_3;
    s8 unk_4;
    s8 unk_5;
    u8 unk_6; // 2nd target pixel
    s8 unk_7;
    struct Unk_02023480_8 unk_8;
};
extern struct Unk_02023480 gUnk_02023480;

struct Unk_03000040 {
    u8 pad_0[0x144 - 0x0];
    volatile u16 unk_144;
    u8 pad_146[0x174 - 0x146];
    u16 unk_174;
    u8 pad_176[0x1BC - 0x176];
    struct Unk_03000040_1BC *unk_1BC;
    u8 pad_1C0[0x1E0 - 0x1C0];
    u16 unk_1E0[8];
    void *unk_1F0;
    void *unk_1F4;
    void *unk_1F8;
    u8 pad_1FC[0x20C - 0x1FC];
    u16 unk_20C;
    u16 unk_20E;
    u32 unk_210_0:31;
    u32 unk_210_31:1;
    u32 unk_214_0:31;
    u32 unk_214_31:1;
    u8 pad_218[0x360 - 0x218];
}; /* size = 0x360 */
extern struct Unk_03000040 gUnk_03000040;

extern void OSi_Panic(u8 *, s32, u8 *, s32);

void GL_CpuCopy(void *src, void *dest, s32 size)
{
    s32 size16;

    if (size >= 0x20)
    {
        if (size < 0)
        {
            size16 = size + 3;
        }
        else
        {
            size16 = size;
        }
        CpuFastCopy(src, dest, (u32) size16);
    }
    else
    {
        if (size < 0)
        {
            size += 3;
        }
        CpuCopy32(src, dest, (u32) size);
    }
}

void sub_08014638(void)
{
    gUnk_03000040.unk_174 = 0;

    CpuFastFill16(0, (void *)VRAM, VRAM_SIZE);
    CpuFastFill16(0, (void *)PLTT, PLTT_SIZE);

    REG_BG0HOFS = 0;
    REG_BG1HOFS = 0;
    REG_BG2HOFS = 0;
    REG_BG3HOFS = 0;

    REG_BG0VOFS = 0;
    REG_BG1VOFS = 0;
    REG_BG2VOFS = 0;
    REG_BG3VOFS = 0;
}

void sub_0801469C(void)
{
    gUnk_02023480.unk_8.unk_0_0 = 0;
    gUnk_02023480.unk_8.unk_0_2 = 0;
    gUnk_02023480.unk_8.unk_0_A = 1;
}

void sub_080146CC(s32 bright)
{
    if (gUnk_02023480.unk_1 >= 0)
    {
        if (gUnk_02023480.unk_0 >= 0)
        {
            gUnk_02023480.unk_8.unk_0_0 = 2;
        }
        else
        {
            gUnk_02023480.unk_8.unk_0_0 = 3;
        }
    }
    else
    {
        gUnk_02023480.unk_8.unk_0_0 = 3;
    }
}

void sub_080146FC(s32 arg0, s32 bright)
{
    struct Unk_02023480 *unk_02023480 = &gUnk_02023480;

    if (!(bright >= -16 && bright <= 16))
    {
        OSi_Panic("GL/GL_Common.c", 0xEA, "bright >= -16 && bright <= 16", 0);
    }

    unk_02023480->unk_1 = bright;
    unk_02023480->unk_0 = bright;
    unk_02023480->unk_2 = arg0;
    unk_02023480->unk_8.unk_0_2 = 0;
    unk_02023480->unk_8.unk_0_A = 1;
    sub_080146CC(bright);
}

void sub_08014754(s32 arg0, s32 arg1, s32 blend1, s32 blend2)
{
    struct Unk_02023480 *unk_02023480 = &gUnk_02023480;

    if (!(blend1 >= 0 && blend1 <= 16))
    {
        OSi_Panic("GL/GL_Common.c", 0xF8, "blend1 >= 0 && blend1 <= 16", 0);
    }
    if (!(blend2 >= 0 && blend2 <= 16))
    {
        OSi_Panic("GL/GL_Common.c", 0xF9, "blend2 >= 0 && blend2 <= 16", 0);
    }

    unk_02023480->unk_1 = blend1;
    unk_02023480->unk_0 = blend1;
    unk_02023480->unk_2 = arg0;
    unk_02023480->unk_5 = blend2;
    unk_02023480->unk_4 = blend2;
    unk_02023480->unk_6 = arg1;
    unk_02023480->unk_8.unk_0_2 = 0;
    unk_02023480->unk_8.unk_0_A = 1;
    unk_02023480->unk_8.unk_0_0 = 1;
}

void sub_080147D8(s32 arg0, s32 bright, s32 arg2)
{
    struct Unk_02023480 *unk_02023480 = &gUnk_02023480;

    if (!(bright >= -16 && bright <= 16))
    {
        OSi_Panic("GL/GL_Common.c", 0x10A, "bright >= -16 && bright <= 16", 0);
    }

    unk_02023480->unk_8.unk_0_2 = 0;
    unk_02023480->unk_8.unk_0_A = arg2;
    unk_02023480->unk_0 = unk_02023480->unk_1;
    unk_02023480->unk_1 = bright;
    unk_02023480->unk_2 = arg0;
    sub_080146CC(bright);
}

void sub_08014838(s32 arg0, s32 arg1, s32 blend1, s32 blend2, s32 arg4)
{
    struct Unk_02023480 *unk_02023480 = &gUnk_02023480;

    if (!(blend1 >= 0 && blend1 <= 16))
    {
        OSi_Panic("GL/GL_Common.c", 0x119, "blend1 >= 0 && blend1 <= 16", 0);
    }
    if (!(blend2 >= 0 && blend2 <= 16))
    {
        OSi_Panic("GL/GL_Common.c", 0x11A, "blend2 >= 0 && blend2 <= 16", 0);
    }

    unk_02023480->unk_0 = unk_02023480->unk_1;
    unk_02023480->unk_4 = unk_02023480->unk_5;
    unk_02023480->unk_1 = blend1;
    unk_02023480->unk_5 = blend2;
    unk_02023480->unk_2 = arg0;
    unk_02023480->unk_6 = arg1;
    unk_02023480->unk_8.unk_0_0 = 1;
    unk_02023480->unk_8.unk_0_2 = 0;
    unk_02023480->unk_8.unk_0_A = arg4;
}

void sub_080148D0(void)
{
    sub_080147D8(0x3F, 0, 8);
}

void sub_080148E0(void)
{
    sub_080147D8(0x3F, -16, 8);
}

s32 sub_080148F4(void)
{
    if (gUnk_02023480.unk_8.unk_0_2 != gUnk_02023480.unk_8.unk_0_A)
    {
        return 1;
    }
    return 0;
}

void sub_08014914(void)
{
    s32 var_r5;
    s32 var_0;
    s32 var_2;
    s32 var_3;
    s32 var_4;
    s32 var_5;
    s32 var_6;
    struct Unk_02023480 *unk_02023480 = &gUnk_02023480;
    struct Unk_02023480 *unk_02023480_1 = &gUnk_02023480;

    var_r5 = 1;
    if (unk_02023480->unk_8.unk_0_2 == unk_02023480->unk_8.unk_0_A)
        return;

    unk_02023480->unk_8.unk_0_2 += 1;
    switch (unk_02023480->unk_8.unk_0_0 << 6)
    {
        case 0 << 6:
        case 1 << 6:
            var_0 = (unk_02023480->unk_8.unk_0_0 << 6) | (unk_02023480_1->unk_2) | (unk_02023480_1->unk_6 << 8);
            var_2 = ((-unk_02023480_1->unk_0 + unk_02023480_1->unk_1) * unk_02023480->unk_8.unk_0_2) / unk_02023480->unk_8.unk_0_A;
            var_0 |= (unk_02023480_1->unk_0 + var_2) << 0x10;
            var_3 = ((-unk_02023480_1->unk_4 + unk_02023480_1->unk_5) * unk_02023480->unk_8.unk_0_2) / unk_02023480->unk_8.unk_0_A;
            var_0 |= (unk_02023480_1->unk_4 + var_3) << 0x18;
            *(u32 *)0x04000050 = var_0;
            break;

        case (1 | 2) << 6:
            var_r5 = -1;
            /* fallthrough */
        case 2 << 6:
            var_4 = (unk_02023480->unk_8.unk_0_0 << 6) | (unk_02023480_1->unk_2) | (unk_02023480_1->unk_6 << 8);
            *(u16 *)0x04000050 = var_4;
            var_5 = ((-unk_02023480_1->unk_0 + unk_02023480_1->unk_1) * unk_02023480->unk_8.unk_0_2) / unk_02023480->unk_8.unk_0_A;
            var_6 = var_r5 * (unk_02023480_1->unk_0 + var_5);
            *(u16 *)0x04000054 = var_6;
            break;
    }
}

inline void* sub_08014E54(u16 *bgCntAddr)
{
    u16 bgCnt = *bgCntAddr;
    return (void*)0x06000000 + (((vBgCnt*)&bgCnt)->charBaseBlock * 0x4000);
}

void* sub_08014A10(void)
{
    return sub_08014E54((void*)REG_ADDR_BG0CNT);
}

void* sub_08014A30(void)
{
    return sub_08014E54((void*)REG_ADDR_BG1CNT);
}

void* sub_08014A50(void)
{
    return sub_08014E54((void*)REG_ADDR_BG2CNT);
}

void* sub_08014A70(void)
{
    return sub_08014E54((void*)REG_ADDR_BG3CNT);
}

inline s32 sub_08014E70(u16* bgCntAddr)
{
    u16 bgCnt = *bgCntAddr;
    return ((vBgCnt*)&bgCnt)->screenSize;
}

s32 sub_08014A90(void)
{
    return sub_08014E70((void*)REG_ADDR_BG0CNT);
}

s32 sub_08014AA8(void)
{
    return sub_08014E70((void*)REG_ADDR_BG1CNT);
}

s32 sub_08014AC0(void)
{
    return sub_08014E70((void*)REG_ADDR_BG2CNT);
}

s32 sub_08014AD8(void)
{
    return sub_08014E70((void*)REG_ADDR_BG3CNT);
}

s32 sub_08014AF0(s32 arg0, s32 arg1, s32 arg2)
{
    s32 var_r1;
    s32 var_r5;

    var_r1 = 0;
    var_r5 = 0;

    switch (arg0)
    {
        case 0:
            var_r1 = sub_08014A90();
            break;

        case 1:
            var_r1 = sub_08014AA8();
            break;

        case 2:
            var_r1 = sub_08014AC0();
            break;

        case 3:
            var_r1 = sub_08014AD8();
            break;
    }

    switch (var_r1)
    {
        case 0:
            break;

        case 1:
            if (arg1 > 0x1F)
            {
                var_r5 = 0x800;
            }
            break;

        case 2:
            if (arg2 > 0x1F)
            {
                here:
                var_r5 = 0x800;
            }
            break;

        case 3:
            if (arg1 > 0x1F)
            {
                if (arg2 > 0x1F)
                {
                    var_r5 = 0x1800;
                }
                else
                {
                    goto here; // TODO: get rid of goto
                    var_r5 = 0x800;
                }
            }
            else if (arg2 > 0x1F)
            {
                var_r5 = 0x1000;
            }
            break;
    }

    return var_r5;
}

// unused?
void sub_08014B6C(s32 arg0, s32 arg1, s32 arg2)
{
    ((vu16 *)REG_ADDR_BG0HOFS)[arg0] = arg1;
    ((vu16 *)REG_ADDR_BG0VOFS)[arg0] = arg2;
}

inline void* sub_08014E84(u16 *bgCntAddr)
{
    u16 bgCnt = *bgCntAddr;
    return (void*)0x06000000 + (((vBgCnt*)&bgCnt)->screenBaseBlock * 0x800);
}

void* sub_08014B8C(void)
{
    return sub_08014E84((void*)REG_ADDR_BG0CNT);
}

void* sub_08014BAC(void)
{
    return sub_08014E84((void*)REG_ADDR_BG1CNT);
}

void* sub_08014BCC(void)
{
    return sub_08014E84((void*)REG_ADDR_BG2CNT);
}

void* sub_08014BEC(void)
{
    return sub_08014E84((void*)REG_ADDR_BG3CNT);
}

void* sub_08014C0C(void)
{
    return (void*)0x06010000;
}

void sub_08014C14(void *pSrc, s32 vramOffset, s32 size)
{
    if ((u32)pSrc & 3)
    {
        OSi_Panic("GL/GL_Common.c", 0x1E2, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuFastCopy(pSrc, sub_08014A10() + vramOffset, (u32) size);
}

void sub_08014C54(void *pSrc, s32 vramOffset, s32 size)
{
    if ((u32)pSrc & 3)
    {
        OSi_Panic("GL/GL_Common.c", 0x1E7, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuFastCopy(pSrc, sub_08014A30() + vramOffset, (u32) size);
}

void sub_08014C94(void *pSrc, s32 vramOffset, s32 size)
{
    if ((u32)pSrc & 3)
    {
        OSi_Panic("GL/GL_Common.c", 0x1EC, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuFastCopy(pSrc, sub_08014A50() + vramOffset, (u32) size);
}

void sub_08014CD4(void *pSrc, s32 vramOffset, s32 size)
{
    if ((u32)pSrc & 3)
    {
        OSi_Panic("GL/GL_Common.c", 0x1F1, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuFastCopy(pSrc, sub_08014A70() + vramOffset, (u32) size);
}

void sub_08014D14(void *pSrc, s32 vramOffset, s32 size)
{
    if ((u32)pSrc & 3)
    {
        OSi_Panic("GL/GL_Common.c", 0x1F7, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuCopy16(pSrc, sub_08014B8C() + vramOffset, (u32) size);
}

void sub_08014D54(void *pSrc, s32 vramOffset, s32 size)
{
    if ((u32)pSrc & 3)
    {
        OSi_Panic("GL/GL_Common.c", 0x1FC, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuCopy16(pSrc, sub_08014BAC() + vramOffset, (u32) size);
}

void sub_08014D94(void *pSrc, s32 vramOffset, s32 size)
{
    if ((u32)pSrc & 3)
    {
        OSi_Panic("GL/GL_Common.c", 0x201, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuCopy16(pSrc, sub_08014BCC() + vramOffset, (u32) size);
}

void sub_08014DD4(void *pSrc, s32 vramOffset, s32 size)
{
    if ((u32)pSrc & 3)
    {
        OSi_Panic("GL/GL_Common.c", 0x206, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuCopy16(pSrc, sub_08014BEC() + vramOffset, (u32) size);
}

void sub_08014E14(void *pSrc, s32 vramOffset, s32 size)
{
    if ((u32)pSrc & 3)
    {
        OSi_Panic("GL/GL_Common.c", 0x20C, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuCopy16(pSrc, sub_08014C0C() + vramOffset, (u32) size);
}

