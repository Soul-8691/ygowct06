#include "global.h"
#include "GL/GL_File.h"
#include "constants/languages.h"

extern void OSi_Panic(u8 *, s32, u8 *, s32);
extern void GL_CpuCopy(void *src, void *dest, s32 size);

struct Unk_02000000_6C2C {
    u8 language:3;
};
struct Unk_02000000 {
    u8 pad_0[0x6C2C];
    struct Unk_02000000_6C2C unk_6C2C;
};
extern struct Unk_02000000 gUnk_02000000;

extern void gUnk_0200AF20;

struct Unk_09E61178 {
    s32 unk_0;
    s32 unk_4;
    s32 unk_8;
    s32 unk_C;
    s32 unk_10;
};
extern struct Unk_09E61178 gUnk_09E61178;

// 14EA0
static s32 GetStringLength(u8 *s)
{
    s32 length;

    for (length = 0; *s++ != 0; length++);
    return length;
}

// 14EB4
static s32 GetSubstringIndex(u8 *pSrc, u8 *pKey)
{
    s32 keyLength;
    s32 srcLength;
    s32 i;
    s32 j;
    s32 notFound;

    if (pSrc == NULL)
    {
        OSi_Panic("GL/GL_File.c", 0x26, "pSrc", 1);
    }

    if (pKey == NULL)
    {
        OSi_Panic("GL/GL_File.c", 0x27, "pKey", 1);
    }

    keyLength = GetStringLength(pKey);    
    srcLength = GetStringLength(pSrc);

    for (i = 0; i < (srcLength - keyLength + 1); i++)
    {
        if (pSrc[i] == pKey[0])
        {
            notFound = FALSE;
            for (j = 0; j < keyLength; j++)
            {
                if (pSrc[i + j] != pKey[j])
                {
                    notFound = TRUE;
                    break;
                }
            }
            if (!notFound)
            {
                return i;
            }
        }
    }
    return -1;
}

// 14F54
static s32 GetStringIndex(u8 *string, u8 *table, s32 size)
{
    s32 high;
    s32 low;
    s32 mid;
    s32 cmp;

    low = 0;
    high = size - 1;

    while (low <= high)
    {
        mid = (low + high) / 2;
        cmp = strcmp(table + (mid * 0x20), string);
        if (cmp == 0)
        {
            return mid;
        }

        if (cmp < 0)
        {
            low = mid + 1;
        }
        else
        {
            high = mid - 1;
        }
    }

    return -1;
}

// 14F9C
void* sub_08014F9C(u8* filePathString)
{
    return GL_OpenFile(filePathString, 0);
}

// 14FA8
void* GL_OpenFile(u8* filePathString, void *dest)
{
    u8 *lzCheck = ".LZ";
    u8 *poundCheck = "#";
    u8 *bangCheck = "!";
    u8* languageOptions[LANGUAGE_COUNT] = {
        [LANGUAGE_JAPANESE] = "j",
        [LANGUAGE_ENGLISH] = "e",
        [LANGUAGE_GERMAN] = "g",
        [LANGUAGE_FRENCH] = "f",
        [LANGUAGE_ITALIAN] = "i",
        [LANGUAGE_SPANISH] = "s"
    };
    u8 buf[0x40];
    u8* filePath;
    s32 *fileCount;
    u8* filePathsTable;
    s32* fileOffsetsTable;
    s32* fileSizesTable;
    void* fileDataTable;
    void* file;
    s32 checkIndex;
    s32 fileIndex;
    s32 compressed;
    u32* fileData;
    s32 fileSize;
    void* uncompBuf;
    u32* uncompFileData;

    filePath = filePathString;
    fileCount = (void*)&gUnk_09E61178.unk_0;
    filePathsTable = gUnk_09E61178.unk_4 + (void*)&gUnk_09E61178;
    fileOffsetsTable = gUnk_09E61178.unk_8 + (void*)&gUnk_09E61178;
    fileSizesTable = gUnk_09E61178.unk_C + (void*)&gUnk_09E61178;
    fileDataTable = gUnk_09E61178.unk_10 + (void*)&gUnk_09E61178;
    file = NULL;

    // when # is in the file path, replace it with the language
    checkIndex = GetSubstringIndex(filePath, poundCheck);
    if (checkIndex != -1)
    {
        strcpy(buf, filePath);
        buf[checkIndex] = *languageOptions[gUnk_02000000.unk_6C2C.language];
        filePath = buf;
    }

    // when ! is in the file path, replace it with the region
    checkIndex = GetSubstringIndex(filePath, bangCheck);
    if (checkIndex != -1)
    {
        strcpy(buf, filePath);
        buf[checkIndex] = *(u16* )0x080000AE >> 8; // game region
        filePath = buf;
    }

    fileIndex = GetStringIndex(filePath, filePathsTable, *fileCount);
    if (fileIndex != -1)
    {
        compressed = GetSubstringIndex(filePath, lzCheck);
        fileData = fileDataTable + fileOffsetsTable[fileIndex];
        fileSize = fileSizesTable[fileIndex];

        if (compressed != -1)
        {
            uncompBuf = (void*)&gUnk_0200AF20;
            if (dest >= (void*)BG_VRAM)
            {
                LZ77UnCompVram(fileData, dest);
            }
            else
            {
                if (((u8)*fileData >> 4) != 1)
                {
                    OSi_Panic("GL/GL_File.c", 0x91, "pHead->compType == 1", 1);
                }

                LZ77UnCompWram(fileData, uncompBuf);
                uncompFileData = uncompBuf + 4;
                if (dest != 0)
                {
                    if (dest != uncompBuf)
                    {
                        GL_CpuCopy(uncompFileData, dest, *fileData >> 8);
                    }
                    file = dest;
                }
                else
                {
                    file = uncompFileData;
                }
            }
        }
        else if (dest != 0)
        {
            GL_CpuCopy(fileData, dest, fileSize);
            file = dest;
        }
        else
        {
            file = fileData;
        }
    }

    return file;
}
