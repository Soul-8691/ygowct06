#ifndef GUARD_GL_SCROLLBAR_H
#define GUARD_GL_SCROLLBAR_H

#include "global.h"

void GL_InitScrollbar(struct Unk_08015384 *pThis, s32 baseXPos, s32 baseYPos, s32 unk_0_24, s32 scrollLength, s32 scrollCursorStartOffset, s32 scrollCursorEndOffset, s32 totalItems, s32 visibleItems);
s32 GL_GetScrollCursorYPosition(struct Unk_08015384 *pThis);
s32 GL_CalculateScrollCursorYPos(struct Unk_08015384 *pThis);
s32 sub_08015480(struct Unk_08015384 *pThis);
s32 GL_GetUpdateCursorVisualFlag(struct Unk_08015384 *pThis);
void GL_SetUpdateCursorVisualFlag(struct Unk_08015384 *pThis, s32 flag);
s32 GL_GetScrollCursorIndex(struct Unk_08015384 *pThis);
void GL_SetScrollCursorIndex(struct Unk_08015384 *pThis, s32 index);
s32 GL_CheckScrollCursorNotAtEnd(struct Unk_08015384 *pThis);
s32 GL_CheckScrollCursorNotAtBeginning(struct Unk_08015384 *pThis);
s32 GL_IncreaseScrollCursorIndexByOne(struct Unk_08015384 *pThis);
s32 GL_DecreaseScrollCursorIndexByOne(struct Unk_08015384 *pThis);
void GL_IncreaseScrollCursorIndexByPage(struct Unk_08015384 *pThis);
void GL_DecreaseScrollCursorIndexByPage(struct Unk_08015384 *pThis);
void GL_UpdateScrollCursorYPosition(struct Unk_08015384 *pThis);

#endif // GUARD_GL_SCROLLBAR_H