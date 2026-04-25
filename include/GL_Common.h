#ifndef GUARD_GL_COMMON_H
#define GUARD_GL_COMMON_H

#include "global.h"

void GL_CpuCopy(void *src, void *dest, s32 size);
void sub_08014638(void);
void sub_0801469C(void);
void sub_080146CC(s32 bright);
void sub_080146FC(s32 arg0, s32 bright);
void sub_08014754(s32 arg0, s32 arg1, s32 blend1, s32 blend2);
void sub_080147D8(s32 arg0, s32 bright, s32 arg2);
void sub_08014838(s32 arg0, s32 arg1, s32 blend1, s32 blend2, s32 arg4);
void sub_080148D0(void);
void sub_080148E0(void);
s32 sub_080148F4(void);
void sub_08014914(void);
void* sub_08014A10(void);
void* sub_08014A30(void);
void* sub_08014A50(void);
void* sub_08014A70(void);
s32 sub_08014A90(void);
s32 sub_08014AA8(void);
s32 sub_08014AC0(void);
s32 sub_08014AD8(void);
s32 sub_08014AF0(s32 arg0, s32 arg1, s32 arg2);
void* sub_08014B8C(void);
void* sub_08014BAC(void);
void* sub_08014BCC(void);
void* sub_08014BEC(void);
void* sub_08014C0C(void);
void sub_08014C14(void *pSrc, s32 vramOffset, s32 size);
void sub_08014C54(void *pSrc, s32 vramOffset, s32 size);
void sub_08014C94(void *pSrc, s32 vramOffset, s32 size);
void sub_08014CD4(void *pSrc, s32 vramOffset, s32 size);
void sub_08014D14(void *pSrc, s32 vramOffset, s32 size);
void sub_08014D54(void *pSrc, s32 vramOffset, s32 size);
void sub_08014D94(void *pSrc, s32 vramOffset, s32 size);
void sub_08014DD4(void *pSrc, s32 vramOffset, s32 size);
void sub_08014E14(void *pSrc, s32 vramOffset, s32 size);

#endif  // GUARD_GL_COMMON_H