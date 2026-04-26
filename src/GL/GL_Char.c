#include "global.h"
#include "GL/GL_Char.h"
#include "constants/languages.h"

struct Unk_02000000_6C2C {
    u8 language:3;
};
struct Unk_02000000 {
    u8 pad_0[0x6C2C];
    struct Unk_02000000_6C2C unk_6C2C;
};
extern struct Unk_02000000 gUnk_02000000;

extern u8 gUnk_0202348C;

/**
 * @brief 143F0 | Copy maxChars characters from src to dest
 * 
 * @param src Source string
 * @param dest Destination string
 * @param maxChars Max number of characters
 * @return s32 Number of characters copied
 */
s32 GL_Strncpy(u8 *src, u8 *dest, s32 maxChars)
{
    s32 initialMaxChars;

    initialMaxChars = maxChars;

    if ((gUnk_02000000.unk_6C2C.language == LANGUAGE_JAPANESE) || (gUnk_0202348C != 0))
    {
        // Japanese
        while ((*src != '\0') && (maxChars != 0))
        {
            // 0x80 indicates double-width character
            if (*src & 0x80)
            {
                *dest++ = *src++;
                *dest++ = *src++;
            }
            else
            {
                *dest++ = *src++;
            }
            maxChars -= 1;
        }
    }
    else
    {
        // Non-Japanese
        while ((*src != '\0') && (maxChars != 0))
        {
            *dest++ = *src++;
            maxChars -= 1;
        }
    }

    *dest = '\0';

    return initialMaxChars - maxChars;
}

/**
 * @brief 14470 | Copy src to dest
 * 
 * @param src Source string
 * @param dest Destination string
 * @return s32 Number of characters copied
 */
s32 GL_Strcpy(u8 *src, u8 *dest)
{
    return GL_Strncpy(src, dest, 99999999);
}

/**
 * @brief 14480 | Append src to dest
 * 
 * @param src Source string
 * @param dest Destination string
 * @return s32 Total character count of src and dest
 */
s32 GL_Strcat(u8 *src, u8 *dest)
{
    s32 destCharCount;

    destCharCount = 0;

    if ((gUnk_02000000.unk_6C2C.language == LANGUAGE_JAPANESE) || (gUnk_0202348C != 0))
    {
        // Japanese
        while (*dest != 0)
        {
            // 0x80 indicates double-width character
            if (*dest & 0x80)
            {
                dest += 2;
            }
            else
            {
                dest += 1;
            }
            destCharCount += 1;
        }
    }
    else
    {
        // Non-Japanese
        while (*dest != 0)
        {
            dest += 1;
            destCharCount += 1;
        }
    }

    return GL_Strcpy(src, dest) + destCharCount;
}

/**
 * @brief 144E8 | Advances the string to destIndex
 * 
 * @param str String
 * @param destIndex Destination character index
 * @return u8* Pointer to advanced string
 */
u8 *GL_AdvanceChars(u8 *str, s32 destIndex)
{
    s32 charIndex;

    charIndex = 0;

    if ((gUnk_02000000.unk_6C2C.language == LANGUAGE_JAPANESE) || (gUnk_0202348C != 0))
    {
        // Japanese
        while ((*str != 0) && (charIndex < destIndex))
        {
            // 0x80 indicates double-width character
            if (*str & 0x80)
            {
                str += 2;
            }
            else
            {
                str += 1;
            }
            charIndex += 1;
        }
    }
    else
    {
        // Non-Japanese
        while ((*str != 0) && (charIndex < destIndex))
        {
            str += 1;
            charIndex += 1;
        }
    }

    if (charIndex == destIndex)
    {
        return str;
    }

    return NULL;
}

/**
 * @brief 1455C | Calculates number of characters in string
 * 
 * @param str String
 * @return s32 Number of characters in string
 */
s32 GL_Strlen(u8 *str)
{
    s32 charCount;

    charCount = 0;

    if ((gUnk_02000000.unk_6C2C.language == LANGUAGE_JAPANESE) || (gUnk_0202348C != 0))
    {
        // Japanese
        while (*str != 0)
        {
            // 0x80 indicates double-width character
            if (*str & 0x80)
            {
                str += 2;
            }
            else
            {
                str += 1;
            }
            charCount += 1;
        }
    }
    else
    {
        // Non-Japanese
        while (*str != 0)
        {
            str += 1;
            charCount += 1;
        }
    }

    return charCount;
}

/**
 * @brief 145BC | Gets the width of the string
 * 
 * @param str String
 * @param charWidth Width of characters
 * @return s32 Total width of string
 */
s32 GL_StrWidth(u8 *str, s32 charWidth)
{
    s32 strCharCount;
    s32 halfCharWidth;

    strCharCount = GL_Strlen(str);
    halfCharWidth = charWidth >> 1;

    if ((gUnk_02000000.unk_6C2C.language == LANGUAGE_JAPANESE) || (gUnk_0202348C != 0))
    {
        return strCharCount * charWidth;
    }
    else
    {
        return strCharCount * halfCharWidth;
    }
}
