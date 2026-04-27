#ifndef GUARD_GL_OAM_H
#define GUARD_GL_OAM_H

#include "global.h"

union GL_OamData *GL_GetAffineObject(s32 num);
void GL_InitializeObjects(void);
void nullsub_15(void);
void GL_ResetObjects(void);
void GL_HideObjects(void);
void GL_AddObjectToGroup(s32 objectIndex, s32 headIndex);
OamData *GL_CreateNewObject(s32 headIndex);
void GL_SendObjectsToOam(void);
s32 sub_080152B0(u16 *arg0, u16 *arg1, s32 arg2, u8 *arg3);

#endif // GUARD_GL_OAM_H