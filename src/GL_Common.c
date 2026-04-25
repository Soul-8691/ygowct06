#include "global.h"
#include "GL_Common.h"

struct Unk_02023480_8 {
    u32 bldCntEffect:2; // BLDCNT Color Effect
    u32 unk_0_2:8;
    u32 unk_0_A:8;
};

struct Unk_02023480 {
    s8 unk_0;
    s8 unk_1;
    u8 bldCntTarget1; // 1st target pixel
    s8 unk_3;
    s8 unk_4;
    s8 unk_5;
    u8 bldCntTarget2; // 2nd target pixel
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

// 14600
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

// 14638
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

// 1469C
void sub_0801469C(void)
{
    gUnk_02023480.unk_8.bldCntEffect = 0;
    gUnk_02023480.unk_8.unk_0_2 = 0;
    gUnk_02023480.unk_8.unk_0_A = 1;
}

// 146CC
void sub_080146CC(s32 bright)
{
    if (gUnk_02023480.unk_1 >= 0)
    {
        if (gUnk_02023480.unk_0 >= 0)
        {
            gUnk_02023480.unk_8.bldCntEffect = BLDCNT_EFFECT_LIGHTEN >> 6;
        }
        else
        {
            gUnk_02023480.unk_8.bldCntEffect = BLDCNT_EFFECT_DARKEN >> 6;
        }
    }
    else
    {
        gUnk_02023480.unk_8.bldCntEffect = BLDCNT_EFFECT_DARKEN >> 6;
    }
}

// 146FC
void sub_080146FC(s32 arg0, s32 bright)
{
    struct Unk_02023480 *unk_02023480 = &gUnk_02023480;

    if (!(bright >= -16 && bright <= 16))
    {
        OSi_Panic("GL/GL_Common.c", 0xEA, "bright >= -16 && bright <= 16", 0);
    }

    unk_02023480->unk_1 = bright;
    unk_02023480->unk_0 = bright;
    unk_02023480->bldCntTarget1 = arg0;
    unk_02023480->unk_8.unk_0_2 = 0;
    unk_02023480->unk_8.unk_0_A = 1;
    sub_080146CC(bright);
}

// 14754
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
    unk_02023480->bldCntTarget1 = arg0;
    unk_02023480->unk_5 = blend2;
    unk_02023480->unk_4 = blend2;
    unk_02023480->bldCntTarget2 = arg1;
    unk_02023480->unk_8.unk_0_2 = 0;
    unk_02023480->unk_8.unk_0_A = 1;
    unk_02023480->unk_8.bldCntEffect = 1;
}

// 147D8
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
    unk_02023480->bldCntTarget1 = arg0;
    sub_080146CC(bright);
}

// 14838
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
    unk_02023480->bldCntTarget1 = arg0;
    unk_02023480->bldCntTarget2 = arg1;
    unk_02023480->unk_8.bldCntEffect = 1;
    unk_02023480->unk_8.unk_0_2 = 0;
    unk_02023480->unk_8.unk_0_A = arg4;
}

// 148D0
void sub_080148D0(void)
{
    sub_080147D8(0x3F, 0, 8);
}

// 148E0
void sub_080148E0(void)
{
    sub_080147D8(0x3F, -16, 8);
}

// 148F4
s32 sub_080148F4(void)
{
    if (gUnk_02023480.unk_8.unk_0_2 != gUnk_02023480.unk_8.unk_0_A)
    {
        return 1;
    }
    return 0;
}

// 14914
void sub_08014914(void)
{
    s32 var_r5;
    s32 var_0;
    s32 var_2;
    s32 var_3;
    s32 bldCnt;
    s32 var_5;
    s32 var_6;
    struct Unk_02023480 *unk_02023480 = &gUnk_02023480;
    struct Unk_02023480 *unk_02023480_1 = &gUnk_02023480;

    var_r5 = 1;
    if (unk_02023480->unk_8.unk_0_2 == unk_02023480->unk_8.unk_0_A)
        return;

    unk_02023480->unk_8.unk_0_2 += 1;
    switch (unk_02023480->unk_8.bldCntEffect << 6)
    {
        case BLDCNT_EFFECT_NONE:
        case BLDCNT_EFFECT_BLEND:
            var_0 = (unk_02023480->unk_8.bldCntEffect << 6) | (unk_02023480_1->bldCntTarget1) | (unk_02023480_1->bldCntTarget2 << 8); // BLDCNT
            var_2 = ((-unk_02023480_1->unk_0 + unk_02023480_1->unk_1) * unk_02023480->unk_8.unk_0_2) / unk_02023480->unk_8.unk_0_A;
            var_0 |= (unk_02023480_1->unk_0 + var_2) << 0x10; // BLDALPHA EVA
            var_3 = ((-unk_02023480_1->unk_4 + unk_02023480_1->unk_5) * unk_02023480->unk_8.unk_0_2) / unk_02023480->unk_8.unk_0_A;
            var_0 |= (unk_02023480_1->unk_4 + var_3) << 0x18; // BLDALPHA EVB
            *(u32 *)REG_ADDR_BLDCNT = var_0;
            break;

        case BLDCNT_EFFECT_DARKEN:
            var_r5 = -1;
            /* fallthrough */
        case BLDCNT_EFFECT_LIGHTEN:
            bldCnt = (unk_02023480->unk_8.bldCntEffect << 6) | (unk_02023480_1->bldCntTarget1) | (unk_02023480_1->bldCntTarget2 << 8);
            *(u16 *)REG_ADDR_BLDCNT = bldCnt;
            var_5 = ((-unk_02023480_1->unk_0 + unk_02023480_1->unk_1) * unk_02023480->unk_8.unk_0_2) / unk_02023480->unk_8.unk_0_A;
            var_6 = var_r5 * (unk_02023480_1->unk_0 + var_5);
            *(vu16 *)REG_ADDR_BLDY = var_6;
            break;
    }
}

// 14E54
inline void* GL_GetBgCharBasePtr_Inline(u16 *bgCntAddr)
{
    u16 bgCnt = *bgCntAddr;
    return BG_CHAR_ADDR(((vBgCnt*)&bgCnt)->charBaseBlock);
}

// 14A10
void* GL_GetBg0CharBasePtr(void)
{
    return GL_GetBgCharBasePtr_Inline((void*)REG_ADDR_BG0CNT);
}

// 14A30
void* GL_GetBg1CharBasePtr(void)
{
    return GL_GetBgCharBasePtr_Inline((void*)REG_ADDR_BG1CNT);
}

// 14A50
void* GL_GetBg2CharBasePtr(void)
{
    return GL_GetBgCharBasePtr_Inline((void*)REG_ADDR_BG2CNT);
}

// 14A70
void* GL_GetBg3CharBasePtr(void)
{
    return GL_GetBgCharBasePtr_Inline((void*)REG_ADDR_BG3CNT);
}

// 14E70
inline s32 GL_GetBgScreenSize_Inline(u16* bgCntAddr)
{
    u16 bgCnt = *bgCntAddr;
    return ((vBgCnt*)&bgCnt)->screenSize;
}

// 14A90
s32 GL_GetBg0ScreenSize(void)
{
    return GL_GetBgScreenSize_Inline((void*)REG_ADDR_BG0CNT);
}

// 14AA8
s32 GL_GetBg1ScreenSize(void)
{
    return GL_GetBgScreenSize_Inline((void*)REG_ADDR_BG1CNT);
}

// 14AC0
s32 GL_GetBg2ScreenSize(void)
{
    return GL_GetBgScreenSize_Inline((void*)REG_ADDR_BG2CNT);
}

// 14AD8
s32 GL_GetBg3ScreenSize(void)
{
    return GL_GetBgScreenSize_Inline((void*)REG_ADDR_BG3CNT);
}

// 14AF0
s32 sub_08014AF0(s32 bgNum, s32 arg1, s32 arg2)
{
    s32 bgScreenSize;
    s32 var_r5;

    bgScreenSize = 0;
    var_r5 = 0;

    switch (bgNum)
    {
        case 0:
            bgScreenSize = GL_GetBg0ScreenSize();
            break;

        case 1:
            bgScreenSize = GL_GetBg1ScreenSize();
            break;

        case 2:
            bgScreenSize = GL_GetBg2ScreenSize();
            break;

        case 3:
            bgScreenSize = GL_GetBg3ScreenSize();
            break;
    }

    switch (bgScreenSize)
    {
        case BGCNT_TXT256x256 >> 14:
            break;

        case BGCNT_TXT512x256 >> 14:
            if (arg1 > 0x1F)
            {
                var_r5 = 0x800;
            }
            break;

        case BGCNT_TXT256x512 >> 14:
            if (arg2 > 0x1F)
            {
                here:
                var_r5 = 0x800;
            }
            break;

        case BGCNT_TXT512x512 >> 14:
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
// 14B6C
void sub_08014B6C(s32 arg0, s32 arg1, s32 arg2)
{
    ((vu16 *)REG_ADDR_BG0HOFS)[arg0] = arg1;
    ((vu16 *)REG_ADDR_BG0VOFS)[arg0] = arg2;
}

// 14E84
inline void* GL_GetBgScreenBasePtr_Inline(u16 *bgCntAddr)
{
    u16 bgCnt = *bgCntAddr;
    return BG_SCREEN_ADDR(((vBgCnt*)&bgCnt)->screenBaseBlock);
}

// 14B8C
void* GL_GetBg0ScreenBasePtr(void)
{
    return GL_GetBgScreenBasePtr_Inline((void*)REG_ADDR_BG0CNT);
}

// 14BAC
void* GL_GetBg1ScreenBasePtr(void)
{
    return GL_GetBgScreenBasePtr_Inline((void*)REG_ADDR_BG1CNT);
}

// 14BCC
void* GL_GetBg2ScreenBasePtr(void)
{
    return GL_GetBgScreenBasePtr_Inline((void*)REG_ADDR_BG2CNT);
}

// 14BEC
void* GL_GetBg3ScreenBasePtr(void)
{
    return GL_GetBgScreenBasePtr_Inline((void*)REG_ADDR_BG3CNT);
}

// 14C0C
void* GL_GetObjCharPtr(void)
{
    return (void*)OBJ_VRAM0;
}

// 14C14
void GL_LoadBg0Char(void *pSrc, s32 vramOffset, s32 size)
{
    if (!(((u32)pSrc & 0x3) == 0))
    {
        OSi_Panic("GL/GL_Common.c", 0x1E2, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuFastCopy(pSrc, GL_GetBg0CharBasePtr() + vramOffset, (u32) size);
}

// 14C54
void GL_LoadBg1Char(void *pSrc, s32 vramOffset, s32 size)
{
    if (!(((u32)pSrc & 0x3) == 0))
    {
        OSi_Panic("GL/GL_Common.c", 0x1E7, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuFastCopy(pSrc, GL_GetBg1CharBasePtr() + vramOffset, (u32) size);
}

// 14C94
void GL_LoadBg2Char(void *pSrc, s32 vramOffset, s32 size)
{
    if (!(((u32)pSrc & 0x3) == 0))
    {
        OSi_Panic("GL/GL_Common.c", 0x1EC, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuFastCopy(pSrc, GL_GetBg2CharBasePtr() + vramOffset, (u32) size);
}

// 14CD4
void GL_LoadBg3Char(void *pSrc, s32 vramOffset, s32 size)
{
    if (!(((u32)pSrc & 0x3) == 0))
    {
        OSi_Panic("GL/GL_Common.c", 0x1F1, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuFastCopy(pSrc, GL_GetBg3CharBasePtr() + vramOffset, (u32) size);
}

// 14D14
void GL_LoadBg0Screen(void *pSrc, s32 vramOffset, s32 size)
{
    if (!(((u32)pSrc & 0x3) == 0))
    {
        OSi_Panic("GL/GL_Common.c", 0x1F7, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuCopy16(pSrc, GL_GetBg0ScreenBasePtr() + vramOffset, (u32) size);
}

// 14D54
void GL_LoadBg1Screen(void *pSrc, s32 vramOffset, s32 size)
{
    if (!(((u32)pSrc & 0x3) == 0))
    {
        OSi_Panic("GL/GL_Common.c", 0x1FC, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuCopy16(pSrc, GL_GetBg1ScreenBasePtr() + vramOffset, (u32) size);
}

// 14D94
void GL_LoadBg2Screen(void *pSrc, s32 vramOffset, s32 size)
{
    if (!(((u32)pSrc & 0x3) == 0))
    {
        OSi_Panic("GL/GL_Common.c", 0x201, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuCopy16(pSrc, GL_GetBg2ScreenBasePtr() + vramOffset, (u32) size);
}

// 14DD4
void GL_LoadBg3Screen(void *pSrc, s32 vramOffset, s32 size)
{
    if (!(((u32)pSrc & 0x3) == 0))
    {
        OSi_Panic("GL/GL_Common.c", 0x206, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuCopy16(pSrc, GL_GetBg3ScreenBasePtr() + vramOffset, (u32) size);
}

// 14E14
void GL_LoadObj(void *pSrc, s32 vramOffset, s32 size)
{
    if (!(((u32)pSrc & 0x3) == 0))
    {
        OSi_Panic("GL/GL_Common.c", 0x20C, "((u32)pSrc & 0x3) == 0", 1);
    }
    CpuCopy16(pSrc, GL_GetObjCharPtr() + vramOffset, (u32) size);
}

