#include "global.h"

struct Unk_08015384 {
    u32 unk_0_0:1;
    u32 unk_0_1:1;
    u32 unk_0_2:4;
    u32 unk_0_6:9;
    u32 unk_0_15:9;
    u32 unk_0_24:8;
    u16 unk_4; // current scroll index
    u16 unk_6;
    u8 unk_8;
    u8 unk_9;
    u8 unk_A;
    u8 unk_B;
    u32 unk_C_0:9;
    u32 unk_C_9:9;
};

extern void OSi_Panic(u8 *, s32, u8 *, s32);

// 15384
void sub_08015384(struct Unk_08015384 *pThis, s32 arg1, s32 arg2, s32 arg3, s32 arg4, s32 arg5, s32 arg6, s32 arg7, s32 arg8)
{
    CpuFill32(0, pThis, 0x10);
    pThis->unk_0_6 = arg1; // 0xE0 (base xPos?)
    pThis->unk_0_15 = arg2; // 0x20 (base yPos)
    pThis->unk_0_24 = arg3; // 0x8
    pThis->unk_8 = arg4; // 0x52 (length of scroll in pixels)
    pThis->unk_9 = arg5; // 0x6 (y offset from base yPos)
    pThis->unk_A = arg6; // 0x6 (y offset from end of scroll)
    pThis->unk_6 = arg7; // 0xD (some kind of limiting factor? unk_6 - unk_B = number of scrolls)
    pThis->unk_B = arg8; // 0x5 (amount on screen to scroll by?)
    pThis->unk_C_9 = arg2 + arg5; // 0x20 + 0x6 = 0x26 (yPos on screen)
    pThis->unk_0_0 = 1; // update position on screen flag
    pThis->unk_0_1 = 1;
}

// 15424
s32 sub_08015424(struct Unk_08015384 *pThis)
{
    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x38, "pThis", 1);
    }
    return pThis->unk_C_9;
}

// 1544C
s32 sub_0801544C(struct Unk_08015384 *pThis)
{
    return pThis->unk_0_15 + pThis->unk_9 + (((pThis->unk_8 - (pThis->unk_9 * 2) - pThis->unk_A) * pThis->unk_4) / (pThis->unk_6 - pThis->unk_B));
}

// 15480
s32 sub_08015480(struct Unk_08015384 *pThis)
{
    return pThis->unk_0_2;
}

// 15488
s32 sub_08015488(struct Unk_08015384 *pThis)
{
    return pThis->unk_0_0;
}

// 15490
void sub_08015490(struct Unk_08015384 *pThis, s32 arg1)
{
    pThis->unk_0_0 = arg1;
}

// 154A4
s32 sub_080154A4(struct Unk_08015384 *pThis)
{
    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x5A, "pThis", 1);
    }
    return pThis->unk_4;
}

// 154C8
void sub_080154C8(struct Unk_08015384 *pThis, s32 arg1)
{
    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x60, "pThis", 1);
    }
    pThis->unk_4 = arg1;
}

// 154F0
s32 sub_080154F0(struct Unk_08015384 *pThis)
{
    return (pThis->unk_4 < (pThis->unk_6 - pThis->unk_B));
}

// 1550C
s32 sub_0801550C(struct Unk_08015384 *pThis)
{
    return (pThis->unk_4 != 0);
}

// 15518
s32 sub_08015518(struct Unk_08015384 *pThis)
{
    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x75, "pThis", 1);
    }

    if (pThis->unk_4 < (pThis->unk_6 - pThis->unk_B))
    {
        pThis->unk_4 += 1;
        return 1;
    }

    return 0;
}

// 15550
s32 sub_08015550(struct Unk_08015384 *pThis)
{
    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x7F, "pThis", 1);
    }

    if (pThis->unk_4 != 0)
    {
        pThis->unk_4 -= 1;
        return 1;
    }

    return 0;
}

// 15584
void sub_08015584(struct Unk_08015384 *pThis)
{
    s32 var_r0;

    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x89, "pThis", 1);
    }

    pThis->unk_4 += pThis->unk_B;
    var_r0 = pThis->unk_6 - pThis->unk_B;
    if (pThis->unk_4 > var_r0)
    {
        if (var_r0 < 0)
        {
            var_r0 = 0;
        }
        pThis->unk_4 = var_r0;
    }
}

// 155C0
void sub_080155C0(struct Unk_08015384 *pThis)
{
    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x90, "pThis", 1);
    }

    if (pThis->unk_4 > pThis->unk_B)
    {
        pThis->unk_4 -= pThis->unk_B;
    }
    else
    {
        pThis->unk_4 = 0;
    }
}

// 155F4
void sub_080155F4(struct Unk_08015384 *pThis)
{
    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x9A, "pThis", 1);
    }

    if (pThis->unk_0_0)
    {
        pThis->unk_C_9 = sub_0801544C(pThis);
    }
}
