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
void* GL_GetBg0CharBasePtr(void);
void* GL_GetBg1CharBasePtr(void);
void* GL_GetBg2CharBasePtr(void);
void* GL_GetBg3CharBasePtr(void);
s32 GL_GetBg0ScreenSize(void);
s32 GL_GetBg1ScreenSize(void);
s32 GL_GetBg2ScreenSize(void);
s32 GL_GetBg3ScreenSize(void);
s32 sub_08014AF0(s32 bgNum, s32 arg1, s32 arg2);
void* GL_GetBg0ScreenBasePtr(void);
void* GL_GetBg1ScreenBasePtr(void);
void* GL_GetBg2ScreenBasePtr(void);
void* GL_GetBg3ScreenBasePtr(void);
void* GL_GetObjCharPtr(void);
void GL_LoadBg0Char(void *pSrc, s32 vramOffset, s32 size);
void GL_LoadBg1Char(void *pSrc, s32 vramOffset, s32 size);
void GL_LoadBg2Char(void *pSrc, s32 vramOffset, s32 size);
void GL_LoadBg3Char(void *pSrc, s32 vramOffset, s32 size);
void GL_LoadBg0Screen(void *pSrc, s32 vramOffset, s32 size);
void GL_LoadBg1Screen(void *pSrc, s32 vramOffset, s32 size);
void GL_LoadBg2Screen(void *pSrc, s32 vramOffset, s32 size);
void GL_LoadBg3Screen(void *pSrc, s32 vramOffset, s32 size);
void GL_LoadObj(void *pSrc, s32 vramOffset, s32 size);

#endif  // GUARD_GL_COMMON_H