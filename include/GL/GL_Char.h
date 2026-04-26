#ifndef GUARD_GL_CHAR_H
#define GUARD_GL_CHAR_H

#include "global.h"

s32 GL_Strncpy(u8 *src, u8 *dest, s32 maxChars);
s32 GL_Strcpy(u8 *src, u8 *dest);
s32 GL_Strcat(u8 *src, u8 *dest);
u8 *GL_AdvanceChars(u8 *str, s32 destIndex);
s32 GL_Strlen(u8 *str);
s32 GL_StrWidth(u8 *str, s32 charWidth);

#endif  // GUARD_GL_CHAR_H