#ifndef GUARD_AGB_SRAM_H
#define GUARD_AGB_SRAM_H

#include "global.h"

void SetSramFastFunc(void);
void WriteSramFast(const u8 *src, u8 *dest, u32 size);
u32 WriteAndVerifySramFast(void const * src, void * dest, u32 size);

extern void (*ReadSramFast)(void const * src, void * dest, u32 size);
extern u32 (*VerifySramFast)(void const * src, void * dest, u32 size);

#endif  // GUARD_AGB_SRAM_H
