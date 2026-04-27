#include "global.h"
#include "GL/GL_Oam.h"

union GL_OamData {
    OamData whole[4];
    struct {
        u32 part0;
        u16 part1;
        u16 part2;
    } part[4];
}; /* size = 0x20 */
struct Unk_02023490 {
    union GL_OamData affineBuffer[32];
    OamData spriteBuffer[128];
    s8 nextObject[128];
    s8 objectHeadList[32];
    u8 objectCount;
    u8 pad_8A1[0x8AC - 0x8A1];
}; /* size = 0x8AC */
extern struct Unk_02023490 gUnk_02023490;

extern void OSi_Panic(u8 *, s32, u8 *, s32);

// 1510C
union GL_OamData *GL_GetAffineObject(s32 num)
{
    struct Unk_02023490 *unk_02023490 = &gUnk_02023490;

    if (!(num < 32))
    {
        OSi_Panic("GL/GL_Oam.c", 0x1F, "num < 32", 1);
    }

    return &unk_02023490->affineBuffer[num];
}

// 15138
void GL_InitializeObjects(void)
{
    struct Unk_02023490 *unk_02023490 = &gUnk_02023490;

    CpuFill32(0, unk_02023490, sizeof(*unk_02023490));
    GL_ResetObjects();
}

// 1515C
void nullsub_15(void)
{
    return;
}

// 15160
void GL_ResetObjects(void)
{
    s32 headIndex;
    struct Unk_02023490 *unk_02023490 = &gUnk_02023490;

    for (headIndex = 0; headIndex < 32; headIndex++)
    {
        unk_02023490->objectHeadList[headIndex] = -1;
    }

    unk_02023490->objectCount = 0;
    GL_HideObjects();
}

// 15194
void GL_HideObjects(void)
{
    struct Unk_02023490 *unk_02023490 = &gUnk_02023490;

    CpuFill32(0xF0, unk_02023490->affineBuffer, sizeof(unk_02023490->affineBuffer));
}

// 151B4
void GL_AddObjectToGroup(s32 objectIndex, s32 headIndex)
{
    struct Unk_02023490 *unk_02023490 = &gUnk_02023490;

    unk_02023490->nextObject[objectIndex] = unk_02023490->objectHeadList[headIndex];
    unk_02023490->objectHeadList[headIndex] = objectIndex;
}

// 151D8
OamData *GL_CreateNewObject(s32 headIndex)
{
    OamData *unk_400;
    struct Unk_02023490 *unk_02023490 = &gUnk_02023490;

    if (unk_02023490->objectCount < 128)
    {
        GL_AddObjectToGroup(unk_02023490->objectCount, headIndex);
        unk_400 = (void*)&unk_02023490->spriteBuffer[unk_02023490->objectCount++];
        CpuFill32(0, unk_400, sizeof(*unk_400));
        return unk_400;
    }

    return NULL;
}

// 1522C
void GL_SendObjectsToOam(void)
{
    s32 headIndex;
    s32 affineObject;
    s32 spriteObject;
    struct Unk_02023490 *unk_02023490 = &gUnk_02023490;
    union GL_OamData *affineBuffer = (void*)&unk_02023490->affineBuffer;
    union GL_OamData *objectBuffer = (void*)&unk_02023490->spriteBuffer;

    affineObject = 0;
    for (headIndex = 0; headIndex < 32; headIndex++)
    {
        for (spriteObject = unk_02023490->objectHeadList[headIndex]; spriteObject != -1; spriteObject = unk_02023490->nextObject[spriteObject])
        {
            // TODO: better way to do this, since this is UB
            affineBuffer->part[affineObject].part0 = objectBuffer->part[spriteObject].part0;
            affineBuffer->part[affineObject].part1 = objectBuffer->part[spriteObject].part1;
            affineObject += 1;
        }
    }

    CpuFastCopy(unk_02023490->affineBuffer, (void *)OAM, OAM_SIZE);
}

// 152B0
#ifdef NON_MATCHING
s32 sub_080152B0(u16 *arg0, u16 *arg1, s32 arg2, u8 *arg3)
{
    // https://decomp.me/scratch/HvLvc

    u32 sp8;
    s32 temp_r0_3;
    s32 temp_r4;
    s32 temp_r5;
    s32 temp_r0_2;
    s32 temp_r2;
    s32 var_r7;
    s32 tmp = 0x1F;

    temp_r2 = *arg3;
    if (temp_r2 <= 0xF)
    {
        var_r7 = temp_r2;
    }
    else
    {
        var_r7 = 0x1E - temp_r2;
    }

    for (sp8 = 0; sp8 < arg2; sp8++)
    {
        temp_r0_2 = arg0[sp8];
        temp_r5 = temp_r0_2 & tmp;
        temp_r4 = (temp_r0_2 >> 5) & tmp;
        temp_r0_3 = (temp_r0_2 >> 10) & tmp;

        temp_r0_3 = ((((temp_r0_3 * (0xF - var_r7)) + (var_r7 * ((temp_r0_3 + 0x5D) >> 2))) / 15) & 0x1F) << 10;
        temp_r4 = ((((temp_r4 * (0xF - var_r7)) + (var_r7 * ((temp_r4 + 0x5D) >> 2))) / 15) & 0x1F) << 5;
        temp_r4 = temp_r4 | temp_r0_3;
        temp_r5 = temp_r4 | (((s32) ((temp_r5 * (0xF - var_r7)) + (var_r7 * ((temp_r5 + 0x5D) >> 2))) / 15) & 0x1F);

        arg1[sp8] = temp_r5;
    }

    temp_r2 += 1;
    if (temp_r2 > 0x1D)
    {
        temp_r2 = 0;
    }
    *arg3 = temp_r2;

    return 1;
}
#else
NAKED
s32 sub_080152B0(u16 *arg0, u16 *arg1, s32 arg2, u8 *arg3)
{
    asm_unified(".include \"asm/nonmatching/sub_080152B0.inc\"");
}
#endif

