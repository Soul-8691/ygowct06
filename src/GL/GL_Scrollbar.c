#include "global.h"

struct ScrollBarInfo {
    u32 updateCursorVisualFlag:1;
    u32 unk_0_1:1;
    u32 unk_0_2:4;
    u32 baseXPos:9;
    u32 baseYPos:9;
    u32 unk_0_24:8;
    u16 scrollCursorIndex;
    u16 totalItems;
    u8 scrollLength; // in pixels
    u8 scrollCursorStartOffset;
    u8 scrollCursorEndOffset;
    u8 visibleItems;
    u32 unk_C_0:9; // unused, possibly scrollCursorXPos
    u32 scrollCursorYPos:9;
};

extern void OSi_Panic(u8 *, s32, u8 *, s32);

/**
 * @brief 15384 | Initialize scrollbar
 * 
 * @param pThis Pointer to scrollbar
 * @param baseXPos Base X position of scrollbar
 * @param baseYPos Base Y position of scrollbar
 * @param unk_0_24 Unknown
 * @param scrollLength Total length scroll cursor can travel in pixels
 * @param scrollCursorStartOffset Scroll cursor offset from start
 * @param scrollCursorEndOffset Scroll cursor offset from end
 * @param totalItems Total number of items in page
 * @param visibleItems Number of visible items at once
 */
void GL_InitScrollbar(struct ScrollBarInfo *pThis, s32 baseXPos, s32 baseYPos, s32 unk_0_24, s32 scrollLength, s32 scrollCursorStartOffset, s32 scrollCursorEndOffset, s32 totalItems, s32 visibleItems)
{
    CpuFill32(0, pThis, 0x10);
    pThis->baseXPos = baseXPos;
    pThis->baseYPos = baseYPos;
    pThis->unk_0_24 = unk_0_24;
    pThis->scrollLength = scrollLength;
    pThis->scrollCursorStartOffset = scrollCursorStartOffset;
    pThis->scrollCursorEndOffset = scrollCursorEndOffset;
    pThis->totalItems = totalItems;
    pThis->visibleItems = visibleItems;
    pThis->scrollCursorYPos = baseYPos + scrollCursorStartOffset;
    pThis->updateCursorVisualFlag = 1;
    pThis->unk_0_1 = 1;
}

/**
 * @brief 15424 | Get scroll cursor Y position
 * 
 * @param pThis Pointer to scrollbar
 * @return s32 Scroll cursor Y position
 */
s32 GL_GetScrollCursorYPosition(struct ScrollBarInfo *pThis)
{
    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x38, "pThis", 1);
    }

    return pThis->scrollCursorYPos;
}

/**
 * @brief 1544C | Calculates the scroll cursor Y position based off the scroll bar data
 * 
 * @param pThis Pointer to scrollbar
 * @return s32 Calculated scroll cursor Y position
 */
s32 GL_CalculateScrollCursorYPos(struct ScrollBarInfo *pThis)
{
    s32 scrollCursorStartPos;
    s32 scrollCursorUsableLength;
    s32 scrollPosOffset;

    scrollCursorStartPos = pThis->baseYPos + pThis->scrollCursorStartOffset;
    scrollCursorUsableLength = (pThis->scrollLength - (pThis->scrollCursorStartOffset * 2) - pThis->scrollCursorEndOffset);
    scrollPosOffset = (scrollCursorUsableLength * pThis->scrollCursorIndex) / (pThis->totalItems - pThis->visibleItems);
    return scrollCursorStartPos + scrollPosOffset;
}

// 15480
s32 sub_08015480(struct ScrollBarInfo *pThis)
{
    return pThis->unk_0_2;
}

/**
 * @brief 15488 | Get update cursor visual flag
 * 
 * @param pThis Pointer to scrollbar
 * @return s32 Update cursor visual flag
 */
s32 GL_GetUpdateCursorVisualFlag(struct ScrollBarInfo *pThis)
{
    return pThis->updateCursorVisualFlag;
}

/**
 * @brief 15490 | Set update cursor visual flag
 * 
 * @param pThis Pointer to scrollbar
 */
void GL_SetUpdateCursorVisualFlag(struct ScrollBarInfo *pThis, s32 flag)
{
    pThis->updateCursorVisualFlag = flag;
}

/**
 * @brief 154A4 | Get scroll cursor index
 * 
 * @param pThis Pointer to scrollbar
 * @return s32 Scroll cursor index
 */
s32 GL_GetScrollCursorIndex(struct ScrollBarInfo *pThis)
{
    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x5A, "pThis", 1);
    }
    return pThis->scrollCursorIndex;
}

/**
 * @brief 154C8 | Set scroll cursor index
 * 
 * @param pThis Pointer to scrollbar
 */
void GL_SetScrollCursorIndex(struct ScrollBarInfo *pThis, s32 index)
{
    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x60, "pThis", 1);
    }
    pThis->scrollCursorIndex = index;
}

/**
 * @brief 154F0 | Check if the scroll cursor is not at the end
 * 
 * @param pThis Pointer to scrollbar
 * @return s32 Bool, scroll cursor is not at the end
 */
s32 GL_CheckScrollCursorNotAtEnd(struct ScrollBarInfo *pThis)
{
    return (pThis->scrollCursorIndex < (pThis->totalItems - pThis->visibleItems));
}

/**
 * @brief 1550C | Check if the scroll cursor is not at the beginning
 * 
 * @param pThis Pointer to scrollbar
 * @return s32 Bool, scroll cursor is not at the beginning
 */
s32 GL_CheckScrollCursorNotAtBeginning(struct ScrollBarInfo *pThis)
{
    return (pThis->scrollCursorIndex != 0);
}

/**
 * @brief 15518 | Increase scroll cursor index by one unit
 * 
 * @param pThis Pointer to scrollbar
 * @return s32 Bool, scroll cursor was able to increment
 */
s32 GL_IncreaseScrollCursorIndexByOne(struct ScrollBarInfo *pThis)
{
    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x75, "pThis", 1);
    }

    if (pThis->scrollCursorIndex < (pThis->totalItems - pThis->visibleItems))
    {
        pThis->scrollCursorIndex += 1;
        return 1;
    }

    return 0;
}

/**
 * @brief 15550 | Decrease scroll cursor index by one unit
 * 
 * @param pThis Pointer to scrollbar
 * @return s32 Bool, scroll cursor was able to decrement
 */
s32 GL_DecreaseScrollCursorIndexByOne(struct ScrollBarInfo *pThis)
{
    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x7F, "pThis", 1);
    }

    if (pThis->scrollCursorIndex != 0)
    {
        pThis->scrollCursorIndex -= 1;
        return 1;
    }

    return 0;
}

/**
 * @brief 15584 | Increase scroll cursor index by one page
 * 
 * @param pThis Pointer to scrollbar
 */
void GL_IncreaseScrollCursorIndexByPage(struct ScrollBarInfo *pThis)
{
    s32 maxScrollIndex;

    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x89, "pThis", 1);
    }

    pThis->scrollCursorIndex += pThis->visibleItems;
    maxScrollIndex = pThis->totalItems - pThis->visibleItems;
    if (pThis->scrollCursorIndex > maxScrollIndex)
    {
        if (maxScrollIndex < 0)
        {
            maxScrollIndex = 0;
        }
        pThis->scrollCursorIndex = maxScrollIndex;
    }
}

/**
 * @brief 155C0 | Decrease scroll cursor index by one page
 * 
 * @param pThis Pointer to scrollbar
 */
void GL_DecreaseScrollCursorIndexByPage(struct ScrollBarInfo *pThis)
{
    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x90, "pThis", 1);
    }

    if (pThis->scrollCursorIndex > pThis->visibleItems)
    {
        pThis->scrollCursorIndex -= pThis->visibleItems;
    }
    else
    {
        pThis->scrollCursorIndex = 0;
    }
}

/**
 * @brief 155F4 | Update the scroll cursor Y position
 * 
 * @param pThis Pointer to scrollbar
 */
void GL_UpdateScrollCursorYPosition(struct ScrollBarInfo *pThis)
{
    if (!(pThis))
    {
        OSi_Panic("GL/GL_Scrollbar.c", 0x9A, "pThis", 1);
    }

    if (pThis->updateCursorVisualFlag)
    {
        pThis->scrollCursorYPos = GL_CalculateScrollCursorYPos(pThis);
    }
}
