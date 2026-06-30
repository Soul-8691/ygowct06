	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_0801563C
sub_0801563C: @ 0x0801563C
	push {r4, lr}
	ldr r4, _08015664 @ =gUnk_03000BFC
	ldr r0, [r4]
	cmp r0, #1
	ble _08015652
	ldr r0, _08015668 @ =gUnk_09E3A488
	ldr r2, _0801566C @ =gUnk_09E3A498
	movs r1, #0x2f
	movs r3, #1
	bl OSi_Panic
_08015652:
	ldr r1, [r4]
	lsls r0, r1, #0xc
	ldr r2, _08015670 @ =gUnk_03000C08
	adds r0, r0, r2
	adds r1, #1
	str r1, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08015664: .4byte gUnk_03000BFC
_08015668: .4byte gUnk_09E3A488
_0801566C: .4byte gUnk_09E3A498
_08015670: .4byte gUnk_03000C08

	thumb_func_start sub_08015674
sub_08015674: @ 0x08015674
	push {r4, lr}
	ldr r4, _0801569C @ =gUnk_03000C00
	ldr r0, [r4]
	cmp r0, #1
	ble _0801568A
	ldr r0, _080156A0 @ =gUnk_09E3A488
	ldr r2, _080156A4 @ =gUnk_09E3A4B8
	movs r1, #0x34
	movs r3, #1
	bl OSi_Panic
_0801568A:
	ldr r1, [r4]
	lsls r0, r1, #0xc
	ldr r2, _080156A8 @ =gUnk_03002C08
	adds r0, r0, r2
	adds r1, #1
	str r1, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801569C: .4byte gUnk_03000C00
_080156A0: .4byte gUnk_09E3A488
_080156A4: .4byte gUnk_09E3A4B8
_080156A8: .4byte gUnk_03002C08

	thumb_func_start sub_080156AC
sub_080156AC: @ 0x080156AC
	ldr r0, _080156BC @ =gUnk_03000BF8
	movs r1, #0
	str r1, [r0]
	ldr r0, _080156C0 @ =gUnk_03000BFC
	str r1, [r0]
	ldr r0, _080156C4 @ =gUnk_03000C00
	str r1, [r0]
	bx lr
	.align 2, 0
_080156BC: .4byte gUnk_03000BF8
_080156C0: .4byte gUnk_03000BFC
_080156C4: .4byte gUnk_03000C00

	thumb_func_start sub_080156C8
sub_080156C8: @ 0x080156C8
	ldr r0, [r0, #8]
	bx lr

	thumb_func_start sub_080156CC
sub_080156CC: @ 0x080156CC
	str r1, [r0, #8]
	bx lr

	thumb_func_start sub_080156D0
sub_080156D0: @ 0x080156D0
	push {lr}
	bl NNS_G2dGetAnimCtrlCurrentFrame
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080156E0
sub_080156E0: @ 0x080156E0
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl NNS_G2dSetCellAnimationCurrentFrame
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080156F0
sub_080156F0: @ 0x080156F0
	str r1, [r0, #0xc]
	bx lr

	thumb_func_start sub_080156F4
sub_080156F4: @ 0x080156F4
	push {r4, lr}
	ldr r4, [r0, #0x18]
	cmp r4, #0
	bne _08015708
	ldr r0, _08015710 @ =gUnk_09E3A488
	ldr r2, _08015714 @ =gUnk_09E3A4D8
	movs r1, #0x65
	movs r3, #1
	bl OSi_Panic
_08015708:
	ldrh r0, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08015710: .4byte gUnk_09E3A488
_08015714: .4byte gUnk_09E3A4D8

	thumb_func_start sub_08015718
sub_08015718: @ 0x08015718
	ldrh r0, [r0]
	bx lr

	thumb_func_start sub_0801571C
sub_0801571C: @ 0x0801571C
	push {lr}
	bl NNS_G2dTickCellAnimation
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08015728
sub_08015728: @ 0x08015728
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	mov r8, r1
	adds r4, r2, #0
	mov sb, r3
	movs r5, #0x80
	lsls r5, r5, #0x11
	adds r0, r5, #0
	adds r1, r6, #0
	bl Div
	mov sl, r0
	adds r0, r5, #0
	mov r1, r8
	bl Div
	mov r8, r0
	ldr r5, _08015814 @ =GL_SinTable
	movs r0, #0xff
	ands r4, r0
	adds r0, r4, #0
	adds r0, #0x40
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	str r0, [sp]
	asrs r0, r0, #0x1f
	str r0, [sp, #4]
	mov r6, sl
	asrs r7, r6, #0x1f
	ldr r0, [sp]
	ldr r1, [sp, #4]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldi3
	ldr r2, _08015818 @ =0x00000800
	ldr r3, _0801581C @ =0x00000000
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	mov r3, sb
	str r0, [r3]
	lsls r4, r4, #1
	adds r4, r4, r5
	movs r0, #0
	ldrsh r4, [r4, r0]
	lsls r4, r4, #4
	asrs r5, r4, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldi3
	ldr r2, _08015818 @ =0x00000800
	ldr r3, _0801581C @ =0x00000000
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	mov r3, sb
	str r0, [r3, #4]
	mov r6, r8
	asrs r7, r6, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldi3
	ldr r2, _08015818 @ =0x00000800
	ldr r3, _0801581C @ =0x00000000
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	rsbs r0, r0, #0
	mov r3, sb
	str r0, [r3, #8]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldi3
	ldr r2, _08015818 @ =0x00000800
	ldr r3, _0801581C @ =0x00000000
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	mov r3, sb
	str r0, [r3, #0xc]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015814: .4byte GL_SinTable
_08015818: .4byte 0x00000800
_0801581C: .4byte 0x00000000

	thumb_func_start sub_08015820
sub_08015820: @ 0x08015820
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r6, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r4, [sp, #0x18]
	bl GL_GetAffineObject
	adds r5, r0, #0
	adds r0, r6, #0
	mov r1, r8
	mov r2, sb
	adds r3, r4, #0
	bl sub_08015728
	ldr r0, [r4]
	asrs r0, r0, #4
	strh r0, [r5, #6]
	ldr r0, [r4, #4]
	asrs r0, r0, #4
	strh r0, [r5, #0xe]
	ldr r0, [r4, #8]
	asrs r0, r0, #4
	strh r0, [r5, #0x16]
	ldr r0, [r4, #0xc]
	asrs r0, r0, #4
	strh r0, [r5, #0x1e]
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08015868
sub_08015868: @ 0x08015868
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r1, #0
	mov r8, r2
	mov sb, r3
	ldr r5, [sp, #0x2c]
	subs r6, r0, #2
	lsls r7, r6, #3
	cmp r6, #1
	bls _0801588C
	ldr r0, _08015914 @ =gUnk_09E3A488
	ldr r2, _08015918 @ =gUnk_09E3A4E4
	movs r1, #0xab
	movs r3, #1
	bl OSi_Panic
_0801588C:
	adds r0, r4, #0
	mov r1, r8
	mov r2, sb
	adds r3, r5, #0
	bl sub_08015728
	ldr r4, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	subs r4, r4, r0
	ldr r0, [r5]
	muls r0, r4, r0
	ldr r3, [sp, #0x28]
	ldr r1, [sp, #0x20]
	subs r3, r3, r1
	ldr r1, [r5, #4]
	muls r1, r3, r1
	adds r0, r0, r1
	ldr r2, [sp, #0x1c]
	lsls r1, r2, #0xc
	adds r0, r0, r1
	asrs r0, r0, #4
	lsls r2, r7, #1
	ldr r7, _0801591C @ =0x04000028
	adds r1, r2, r7
	str r0, [r1]
	ldr r0, [r5, #8]
	muls r0, r4, r0
	ldr r1, [r5, #0xc]
	muls r1, r3, r1
	adds r0, r0, r1
	ldr r3, [sp, #0x20]
	lsls r1, r3, #0xc
	adds r0, r0, r1
	asrs r0, r0, #4
	adds r7, #4
	adds r2, r2, r7
	str r0, [r2]
	ldr r0, [r5]
	lsls r0, r0, #0xc
	asrs r0, r0, #0x10
	lsls r2, r6, #4
	ldr r3, _08015920 @ =0x04000020
	adds r1, r2, r3
	strh r0, [r1]
	ldr r0, [r5, #4]
	lsls r0, r0, #0xc
	asrs r0, r0, #0x10
	subs r7, #0xa
	adds r1, r2, r7
	strh r0, [r1]
	ldr r0, [r5, #8]
	lsls r0, r0, #0xc
	asrs r0, r0, #0x10
	adds r3, #4
	adds r1, r2, r3
	strh r0, [r1]
	ldr r0, [r5, #0xc]
	lsls r0, r0, #0xc
	asrs r0, r0, #0x10
	adds r7, #4
	adds r2, r2, r7
	strh r0, [r2]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015914: .4byte gUnk_09E3A488
_08015918: .4byte gUnk_09E3A4E4
_0801591C: .4byte 0x04000028
_08015920: .4byte 0x04000020

	thumb_func_start sub_08015924
sub_08015924: @ 0x08015924
	push {lr}
	cmp r0, #1
	beq _08015948
	cmp r0, #2
	beq _0801594C
	ldr r0, _08015940 @ =gUnk_09E3A488
	ldr r2, _08015944 @ =gUnk_09E3A4F8
	movs r1, #0xc0
	movs r3, #1
	bl OSi_Panic
	movs r0, #0
	b _0801594E
	.align 2, 0
_08015940: .4byte gUnk_09E3A488
_08015944: .4byte gUnk_09E3A4F8
_08015948:
	movs r0, #4
	b _0801594E
_0801594C:
	movs r0, #9
_0801594E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08015954
sub_08015954: @ 0x08015954
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x54]
	mov r8, r1
	ldr r5, [sp, #0x58]
	ldr r7, [sp, #0x60]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	movs r4, #0
	bl sub_08015924
	bl sub_08016108
	adds r0, #5
	mov r2, r8
	asrs r2, r0
	mov r8, r2
	ldr r0, _08015A74 @ =0x000001FF
	asrs r1, r5, #5
	mov sb, r1
	cmp r5, r0
	ble _08015994
	asrs r5, r5, #9
	mov sb, r5
_08015994:
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _080159A6
	ldr r0, _08015A78 @ =gUnk_09E3A488
	ldr r2, _08015A7C @ =gUnk_09E3A4FC
	movs r1, #0xe3
	movs r3, #1
	bl OSi_Panic
_080159A6:
	ldr r0, [sp, #0x10]
	str r0, [sp]
	mov r1, sl
	str r1, [sp, #4]
	ldr r0, [sp, #0x44]
	str r0, [sp, #8]
	ldr r0, _08015A80 @ =gUnk_030007F8
	movs r1, #0x80
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x48]
	bl NNS_G2dMakeCellToOams
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r4, r2
	bge _08015A60
	movs r0, #3
	mov sl, r0
	mov r1, sl
	ands r6, r1
	lsls r6, r6, #2
	str r6, [sp, #0x14]
	movs r3, #0xd
	rsbs r3, r3, #0
	ldr r0, [sp, #0x64]
	ands r1, r0
	str r1, [sp, #0x18]
	lsls r1, r2, #3
	ldr r0, _08015A80 @ =gUnk_030007F8
	subs r0, #8
	adds r6, r1, r0
	movs r0, #1
	ands r7, r0
	lsls r0, r7, #4
	str r0, [sp, #0x20]
	adds r5, r2, #0
_080159EE:
	ldr r0, [sp, #0x4c]
	str r3, [sp, #0x1c]
	bl GL_CreateNewObject
	adds r4, r0, #0
	ldr r0, [r6]
	ldr r1, [r6, #4]
	str r0, [r4]
	str r1, [r4, #4]
	ldrh r2, [r4, #4]
	lsls r0, r2, #0x16
	lsrs r0, r0, #0x16
	add r0, r8
	ldr r7, _08015A84 @ =0x000003FF
	adds r1, r7, #0
	ands r0, r1
	ldr r7, _08015A88 @ =0xFFFFFC00
	adds r1, r7, #0
	ands r2, r1
	orrs r2, r0
	strh r2, [r4, #4]
	ldrb r2, [r4, #5]
	lsrs r1, r2, #4
	add r1, sb
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	ldr r3, [sp, #0x1c]
	ands r0, r3
	ldr r1, [sp, #0x14]
	orrs r0, r1
	strb r0, [r4, #5]
	movs r2, #0x11
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r7, [r4, #1]
	ands r0, r7
	ldr r1, [sp, #0x20]
	orrs r0, r1
	ldr r1, [sp, #0x5c]
	mov r2, sl
	ands r1, r2
	lsls r1, r1, #2
	ands r0, r3
	orrs r0, r1
	movs r7, #4
	rsbs r7, r7, #0
	adds r1, r7, #0
	ands r0, r1
	ldr r1, [sp, #0x18]
	orrs r0, r1
	strb r0, [r4, #1]
	subs r6, #8
	subs r5, #1
	cmp r5, #0
	bne _080159EE
_08015A60:
	adds r0, r4, #0
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015A74: .4byte 0x000001FF
_08015A78: .4byte gUnk_09E3A488
_08015A7C: .4byte gUnk_09E3A4FC
_08015A80: .4byte gUnk_030007F8
_08015A84: .4byte 0x000003FF
_08015A88: .4byte 0xFFFFFC00

	thumb_func_start sub_08015A8C
sub_08015A8C: @ 0x08015A8C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r4, [sp, #0x38]
	ldr r5, [sp, #0x3c]
	ldr r6, [sp, #0x40]
	ldr r7, [sp, #0x44]
	str r7, [sp, #0xc]
	ldr r7, [sp, #0x48]
	str r7, [sp, #0x10]
	ldr r7, [sp, #0x4c]
	str r7, [sp, #0x14]
	ldr r7, [sp, #0x50]
	str r7, [sp, #0x18]
	ldr r7, [sp, #0x54]
	str r7, [sp, #0x1c]
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	str r4, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r4, #0
	str r4, [sp, #0x20]
	bl sub_08015954
	add sp, #0x24
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08015AC4
sub_08015AC4: @ 0x08015AC4
	push {r4, lr}
	ldr r4, _08015AF0 @ =gUnk_03000BF8
	ldr r0, [r4]
	cmp r0, #0x3f
	bls _08015ADA
	ldr r0, _08015AF4 @ =gUnk_09E3A488
	ldr r1, _08015AF8 @ =0x00000127
	ldr r2, _08015AFC @ =gUnk_09E3A510
	movs r3, #1
	bl OSi_Panic
_08015ADA:
	ldr r2, [r4]
	movs r0, #0x54
	muls r0, r2, r0
	ldr r1, _08015B00 @ =gUnk_02027D40
	adds r0, r0, r1
	adds r2, #1
	str r2, [r4]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08015AF0: .4byte gUnk_03000BF8
_08015AF4: .4byte gUnk_09E3A488
_08015AF8: .4byte 0x00000127
_08015AFC: .4byte gUnk_09E3A510
_08015B00: .4byte gUnk_02027D40

	thumb_func_start sub_08015B04
sub_08015B04: @ 0x08015B04
	push {lr}
	bl GL_OpenFile
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08015B10
sub_08015B10: @ 0x08015B10
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _08015B28
	ldr r0, _08015B58 @ =gUnk_09E3A488
	movs r1, #0xcc
	lsls r1, r1, #1
	ldr r2, _08015B5C @ =gUnk_09E3A534
	movs r3, #1
	bl OSi_Panic
_08015B28:
	cmp r4, #0
	bne _08015B38
	ldr r0, _08015B58 @ =gUnk_09E3A488
	ldr r1, _08015B60 @ =0x00000199
	ldr r2, _08015B64 @ =gUnk_09E3A54C
	movs r3, #1
	bl OSi_Panic
_08015B38:
	bl sub_0801563C
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08015B04
	adds r4, r0, #0
	cmp r4, #0
	beq _08015B68
	adds r1, r5, #0
	bl NNS_G2dGetUnpackedCellBank
	cmp r0, #0
	beq _08015B68
	adds r0, r4, #0
	b _08015B6A
	.align 2, 0
_08015B58: .4byte gUnk_09E3A488
_08015B5C: .4byte gUnk_09E3A534
_08015B60: .4byte 0x00000199
_08015B64: .4byte gUnk_09E3A54C
_08015B68:
	movs r0, #0
_08015B6A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08015B70
sub_08015B70: @ 0x08015B70
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _08015B86
	ldr r0, _08015BB8 @ =gUnk_09E3A488
	ldr r1, _08015BBC @ =0x000001C1
	ldr r2, _08015BC0 @ =gUnk_09E3A560
	movs r3, #1
	bl OSi_Panic
_08015B86:
	cmp r4, #0
	bne _08015B98
	ldr r0, _08015BB8 @ =gUnk_09E3A488
	movs r1, #0xe1
	lsls r1, r1, #1
	ldr r2, _08015BC4 @ =gUnk_09E3A54C
	movs r3, #1
	bl OSi_Panic
_08015B98:
	bl sub_08015674
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08015B04
	adds r4, r0, #0
	cmp r4, #0
	beq _08015BC8
	adds r1, r5, #0
	bl NNS_G2dGetUnpackedAnimBank
	cmp r0, #0
	beq _08015BC8
	adds r0, r4, #0
	b _08015BCA
	.align 2, 0
_08015BB8: .4byte gUnk_09E3A488
_08015BBC: .4byte 0x000001C1
_08015BC0: .4byte gUnk_09E3A560
_08015BC4: .4byte gUnk_09E3A54C
_08015BC8:
	movs r0, #0
_08015BCA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08015BD0
sub_08015BD0: @ 0x08015BD0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _08015BE6
	ldr r0, _08015C14 @ =gUnk_09E3A488
	ldr r1, _08015C18 @ =0x0000023E
	ldr r2, _08015C1C @ =gUnk_09E3A578
	movs r3, #1
	bl OSi_Panic
_08015BE6:
	cmp r4, #0
	bne _08015BF6
	ldr r0, _08015C14 @ =gUnk_09E3A488
	ldr r1, _08015C20 @ =0x0000023F
	ldr r2, _08015C24 @ =gUnk_09E3A54C
	movs r3, #1
	bl OSi_Panic
_08015BF6:
	adds r0, r4, #0
	movs r1, #0
	bl sub_08015B04
	adds r4, r0, #0
	cmp r4, #0
	beq _08015C28
	adds r1, r5, #0
	bl NNS_G2dGetUnpackedCharacterData
	cmp r0, #0
	beq _08015C28
	adds r0, r4, #0
	b _08015C2A
	.align 2, 0
_08015C14: .4byte gUnk_09E3A488
_08015C18: .4byte 0x0000023E
_08015C1C: .4byte gUnk_09E3A578
_08015C20: .4byte 0x0000023F
_08015C24: .4byte gUnk_09E3A54C
_08015C28:
	movs r0, #0
_08015C2A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08015C30
sub_08015C30: @ 0x08015C30
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _08015C46
	ldr r0, _08015C74 @ =gUnk_09E3A488
	ldr r1, _08015C78 @ =0x00000266
	ldr r2, _08015C7C @ =gUnk_09E3A590
	movs r3, #1
	bl OSi_Panic
_08015C46:
	cmp r4, #0
	bne _08015C56
	ldr r0, _08015C74 @ =gUnk_09E3A488
	ldr r1, _08015C80 @ =0x00000267
	ldr r2, _08015C84 @ =gUnk_09E3A54C
	movs r3, #1
	bl OSi_Panic
_08015C56:
	adds r0, r4, #0
	movs r1, #0
	bl sub_08015B04
	adds r4, r0, #0
	cmp r4, #0
	beq _08015C88
	adds r1, r5, #0
	bl NNS_G2dGetUnpackedPaletteData
	cmp r0, #0
	beq _08015C88
	adds r0, r4, #0
	b _08015C8A
	.align 2, 0
_08015C74: .4byte gUnk_09E3A488
_08015C78: .4byte 0x00000266
_08015C7C: .4byte gUnk_09E3A590
_08015C80: .4byte 0x00000267
_08015C84: .4byte gUnk_09E3A54C
_08015C88:
	movs r0, #0
_08015C8A:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08015C90
sub_08015C90: @ 0x08015C90
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r4, r3, #0
	cmp r5, #0
	bne _08015CAA
	ldr r0, _08015CD0 @ =gUnk_09E3A488
	ldr r1, _08015CD4 @ =0x000002D9
	ldr r2, _08015CD8 @ =gUnk_09E3A5A8
	movs r3, #1
	bl OSi_Panic
_08015CAA:
	cmp r4, #0
	bne _08015CBA
	ldr r0, _08015CD0 @ =gUnk_09E3A488
	ldr r1, _08015CDC @ =0x000002DA
	ldr r2, _08015CE0 @ =gUnk_09E3A5B4
	movs r3, #1
	bl OSi_Panic
_08015CBA:
	cmp r6, #1
	bne _08015CE8
	ldr r0, [r5, #0xc]
	ldr r2, _08015CE4 @ =0x05000200
	adds r1, r7, r2
	ldr r2, [sp, #0x14]
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	b _08015CF4
	.align 2, 0
_08015CD0: .4byte gUnk_09E3A488
_08015CD4: .4byte 0x000002D9
_08015CD8: .4byte gUnk_09E3A5A8
_08015CDC: .4byte 0x000002DA
_08015CE0: .4byte gUnk_09E3A5B4
_08015CE4: .4byte 0x05000200
_08015CE8:
	ldr r0, _08015D0C @ =gUnk_09E3A488
	ldr r1, _08015D10 @ =0x000002E3
	ldr r2, _08015D14 @ =gUnk_09E3A5C0
	movs r3, #1
	bl OSi_Panic
_08015CF4:
	ldr r0, [r5]
	str r0, [r4]
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl NNS_G2dSetImagePaletteLocation
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015D0C: .4byte gUnk_09E3A488
_08015D10: .4byte 0x000002E3
_08015D14: .4byte gUnk_09E3A5C0

	thumb_func_start sub_08015D18
sub_08015D18: @ 0x08015D18
	cmp r0, #4
	beq _08015D24
	cmp r0, #9
	beq _08015D28
	movs r0, #3
	b _08015D2A
_08015D24:
	movs r0, #1
	b _08015D2A
_08015D28:
	movs r0, #2
_08015D2A:
	bx lr

	thumb_func_start nullsub_16
nullsub_16: @ 0x08015D2C
	bx lr
	.align 2, 0

	thumb_func_start sub_08015D30
sub_08015D30: @ 0x08015D30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	adds r6, r0, #0
	mov sb, r1
	mov r8, r2
	str r3, [sp, #0x44]
	ldr r0, [sp, #0x70]
	mov sl, r0
	add r0, sp, #4
	bl NNS_G2dInitImageProxy
	add r4, sp, #0x28
	adds r0, r4, #0
	bl NNS_G2dInitImagePaletteProxy
	mov r2, sl
	ldr r1, [r2]
	cmp r1, #0
	beq _08015E08
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _08015E08
	mov r0, sb
	bl sub_08015B10
	cmp r0, #0
	bne _08015D7A
	ldr r0, _08015E74 @ =gUnk_09E3A488
	ldr r1, _08015E78 @ =0x0000032D
	ldr r2, _08015E7C @ =gUnk_09E3A5C8
	movs r3, #1
	bl OSi_Panic
_08015D7A:
	mov r0, sl
	ldr r1, [r0, #4]
	adds r0, r6, #0
	bl sub_08015B70
	cmp r0, #0
	bne _08015D94
	ldr r0, _08015E74 @ =gUnk_09E3A488
	ldr r1, _08015E80 @ =0x00000331
	ldr r2, _08015E7C @ =gUnk_09E3A5C8
	movs r3, #1
	bl OSi_Panic
_08015D94:
	ldr r0, [r6]
	ldrh r0, [r0]
	cmp r0, #0
	bne _08015DA8
	ldr r0, _08015E74 @ =gUnk_09E3A488
	ldr r1, _08015E84 @ =0x0000033A
	ldr r2, _08015E88 @ =gUnk_09E3A5DC
	movs r3, #1
	bl OSi_Panic
_08015DA8:
	ldr r0, [r6]
	movs r5, #0
	ldrh r0, [r0]
	cmp r5, r0
	bge _08015E08
	mov r7, r8
_08015DB4:
	movs r0, #1
	bl sub_08015AC4
	str r0, [r7]
	mov r1, r8
	ldr r0, [r1]
	cmp r0, #0
	bne _08015DD0
	ldr r0, _08015E74 @ =gUnk_09E3A488
	ldr r1, _08015E8C @ =0x0000033F
	ldr r2, _08015E90 @ =gUnk_09E3A600
	movs r3, #1
	bl OSi_Panic
_08015DD0:
	ldr r0, [r6]
	lsls r1, r5, #4
	ldr r0, [r0, #4]
	cmn r0, r1
	bne _08015DE6
	ldr r0, _08015E74 @ =gUnk_09E3A488
	ldr r1, _08015E94 @ =0x00000341
	ldr r2, _08015E98 @ =gUnk_09E3A618
	movs r3, #1
	bl OSi_Panic
_08015DE6:
	ldm r7!, {r4}
	ldr r0, [r6]
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	bl NNS_G2dGetAnimSequenceByIdx
	adds r1, r0, #0
	mov r0, sb
	ldr r2, [r0]
	adds r0, r4, #0
	bl NNS_G2dInitCellAnimation
	adds r5, #1
	ldr r0, [r6]
	ldrh r0, [r0]
	cmp r5, r0
	blt _08015DB4
_08015E08:
	mov r2, sl
	ldr r1, [r2, #8]
	cmp r1, #0
	beq _08015E32
	add r0, sp, #0x3c
	bl sub_08015BD0
	cmp r0, #0
	bne _08015E26
	ldr r0, _08015E74 @ =gUnk_09E3A488
	ldr r1, _08015E9C @ =0x00000355
	ldr r2, _08015E7C @ =gUnk_09E3A5C8
	movs r3, #1
	bl OSi_Panic
_08015E26:
	ldr r0, [sp, #0x3c]
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x6c]
	add r3, sp, #4
	bl NNS_G2dLoadImage1DMapping
_08015E32:
	mov r0, sl
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _08015E64
	add r0, sp, #0x40
	bl sub_08015C30
	cmp r0, #0
	bne _08015E50
	ldr r0, _08015E74 @ =gUnk_09E3A488
	ldr r1, _08015EA0 @ =0x0000036A
	ldr r2, _08015E7C @ =gUnk_09E3A5C8
	movs r3, #1
	bl OSi_Panic
_08015E50:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x74]
	str r1, [r0, #4]
	ldr r1, [sp, #0x78]
	str r1, [sp]
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x6c]
	add r3, sp, #0x28
	bl sub_08015C90
_08015E64:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08015E74: .4byte gUnk_09E3A488
_08015E78: .4byte 0x0000032D
_08015E7C: .4byte gUnk_09E3A5C8
_08015E80: .4byte 0x00000331
_08015E84: .4byte 0x0000033A
_08015E88: .4byte gUnk_09E3A5DC
_08015E8C: .4byte 0x0000033F
_08015E90: .4byte gUnk_09E3A600
_08015E94: .4byte 0x00000341
_08015E98: .4byte gUnk_09E3A618
_08015E9C: .4byte 0x00000355
_08015EA0: .4byte 0x0000036A

	thumb_func_start sub_08015EA4
sub_08015EA4: @ 0x08015EA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	str r0, [sp, #0x28]
	mov sb, r1
	mov sl, r2
	adds r7, r3, #0
	ldr r0, [sp, #0x50]
	mov r8, r0
	ldr r5, [sp, #0x5c]
	adds r4, r7, #0
	subs r1, r5, #1
	ldr r2, [sp, #0x58]
	adds r0, r2, #0
	muls r0, r1, r0
	lsls r0, r0, #0xc
	add r8, r0
	cmp r4, #0
	beq _08015F58
	ldr r0, [sp, #0x60]
	orrs r4, r0
	cmp r4, #0
	beq _08015FB6
	adds r5, r1, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _08015FB6
	mov r1, sp
	adds r1, #0x20
	str r1, [sp, #0x2c]
	movs r6, #0
_08015EEA:
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	adds r4, r0, #0
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	adds r7, r0, #0
	mov r2, r8
	str r2, [sp, #0x20]
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x2c]
	str r0, [r1, #4]
	mov r2, sl
	adds r1, r2, r4
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r0, sb
	bl NNS_G2dSetCellAnimationCurrentFrame
	mov r0, sb
	ldr r1, [r0, #0x2c]
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	ldr r2, [sp, #0x64]
	str r2, [sp, #0x10]
	ldr r0, [sp, #0x68]
	str r0, [sp, #0x14]
	str r6, [sp, #0x18]
	str r6, [sp, #0x1c]
	ldr r0, [sp, #0x28]
	add r2, sp, #0x20
	movs r3, #0
	bl sub_08015A8C
	ldr r1, [sp, #0x58]
	lsls r0, r1, #0xc
	mov r2, r8
	subs r2, r2, r0
	mov r8, r2
	adds r0, r7, #0
	ldr r1, [sp, #0x60]
	orrs r0, r1
	cmp r0, #0
	beq _08015FB6
	subs r5, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08015EEA
	b _08015FB6
_08015F58:
	adds r5, r1, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	beq _08015FB6
	add r7, sp, #0x20
	mov r2, sl
	lsls r6, r2, #0x10
	movs r4, #0
_08015F6A:
	mov r0, r8
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x54]
	str r1, [r7, #4]
	mov r0, sb
	lsrs r1, r6, #0x10
	bl NNS_G2dSetCellAnimationCurrentFrame
	mov r2, sb
	ldr r1, [r2, #0x2c]
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	ldr r0, [sp, #0x64]
	str r0, [sp, #0x10]
	ldr r2, [sp, #0x68]
	str r2, [sp, #0x14]
	str r4, [sp, #0x18]
	str r4, [sp, #0x1c]
	movs r0, #2
	add r2, sp, #0x20
	movs r3, #0
	bl sub_08015A8C
	ldr r1, [sp, #0x58]
	lsls r0, r1, #0xc
	mov r2, r8
	subs r2, r2, r0
	mov r8, r2
	ldr r0, [sp, #0x60]
	cmp r0, #0
	beq _08015FB6
	subs r5, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08015F6A
_08015FB6:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08015FC8
sub_08015FC8: @ 0x08015FC8
	push {lr}
	sub sp, #4
	adds r1, r0, #0
	mov r2, sp
	movs r0, #0
	strh r0, [r2]
	ldr r2, _08015FE4 @ =0x01000012
	mov r0, sp
	bl CpuSet
	movs r0, #0
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_08015FE4: .4byte 0x01000012

	thumb_func_start sub_08015FE8
sub_08015FE8: @ 0x08015FE8
	cmp r0, #4
	ble _08015FFE
	subs r2, r0, #5
	adds r1, r2, #0
	cmp r2, #0
	bge _08015FF6
	subs r1, r0, #2
_08015FF6:
	asrs r1, r1, #2
	lsls r1, r1, #2
	subs r1, r2, r1
	b _0801600C
_08015FFE:
	adds r1, r0, #0
	cmp r0, #0
	bge _08016006
	adds r1, r0, #3
_08016006:
	asrs r1, r1, #2
	lsls r1, r1, #2
	subs r1, r0, r1
_0801600C:
	movs r0, #1
	lsls r0, r1
	bx lr
	.align 2, 0

	thumb_func_start sub_08016014
sub_08016014: @ 0x08016014
	push {lr}
	cmp r0, #1
	beq _08016034
	cmp r0, #1
	bgt _08016024
	cmp r0, #0
	beq _0801602E
	b _08016046
_08016024:
	cmp r0, #2
	beq _0801603A
	cmp r0, #3
	beq _08016040
	b _08016046
_0801602E:
	bl GL_GetBg0ScreenBasePtr
	b _08016048
_08016034:
	bl GL_GetBg1ScreenBasePtr
	b _08016048
_0801603A:
	bl GL_GetBg2ScreenBasePtr
	b _08016048
_08016040:
	bl GL_GetBg3ScreenBasePtr
	b _08016048
_08016046:
	movs r0, #0
_08016048:
	pop {r1}
	bx r1

	thumb_func_start sub_0801604C
sub_0801604C: @ 0x0801604C
	push {lr}
	cmp r0, #4
	bhi _08016092
	lsls r0, r0, #2
	ldr r1, _0801605C @ =_08016060
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801605C: .4byte _08016060
_08016060: @ jump table
	.4byte _08016074 @ case 0
	.4byte _0801607A @ case 1
	.4byte _08016080 @ case 2
	.4byte _08016086 @ case 3
	.4byte _0801608C @ case 4
_08016074:
	bl GL_GetBg0CharBasePtr
	b _08016094
_0801607A:
	bl GL_GetBg1CharBasePtr
	b _08016094
_08016080:
	bl GL_GetBg2CharBasePtr
	b _08016094
_08016086:
	bl GL_GetBg3CharBasePtr
	b _08016094
_0801608C:
	bl GL_GetObjCharPtr
	b _08016094
_08016092:
	movs r0, #0
_08016094:
	pop {r1}
	bx r1

	thumb_func_start sub_08016098
sub_08016098: @ 0x08016098
	push {lr}
	cmp r0, #4
	beq _080160B8
	cmp r0, #9
	beq _080160C0
	ldr r0, _080160B0 @ =gUnk_09E3A64C
	ldr r2, _080160B4 @ =gUnk_09E3A65C
	movs r1, #0x76
	movs r3, #1
	bl OSi_Panic
	b _080160C4
	.align 2, 0
_080160B0: .4byte gUnk_09E3A64C
_080160B4: .4byte gUnk_09E3A65C
_080160B8:
	ldr r0, _080160BC @ =gUnk_09E587E4
	b _080160C2
	.align 2, 0
_080160BC: .4byte gUnk_09E587E4
_080160C0:
	ldr r0, _080160C8 @ =gUnk_09E587E8
_080160C2:
	str r1, [r0]
_080160C4:
	pop {r0}
	bx r0
	.align 2, 0
_080160C8: .4byte gUnk_09E587E8

	thumb_func_start sub_080160CC
sub_080160CC: @ 0x080160CC
	push {lr}
	ldrb r0, [r0, #0x14]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #4
	beq _080160F4
	cmp r0, #9
	beq _080160FC
	ldr r0, _080160EC @ =gUnk_09E3A64C
	ldr r2, _080160F0 @ =gUnk_09E3A65C
	movs r1, #0x82
	movs r3, #1
	bl OSi_Panic
	movs r0, #0
	b _08016100
	.align 2, 0
_080160EC: .4byte gUnk_09E3A64C
_080160F0: .4byte gUnk_09E3A65C
_080160F4:
	ldr r0, _080160F8 @ =gUnk_09E587E4
	b _080160FE
	.align 2, 0
_080160F8: .4byte gUnk_09E587E4
_080160FC:
	ldr r0, _08016104 @ =gUnk_09E587E8
_080160FE:
	ldr r0, [r0]
_08016100:
	pop {r1}
	bx r1
	.align 2, 0
_08016104: .4byte gUnk_09E587E8

	thumb_func_start sub_08016108
sub_08016108: @ 0x08016108
	push {lr}
	cmp r0, #4
	beq _0801612C
	cmp r0, #9
	beq _08016134
	ldr r0, _08016124 @ =gUnk_09E3A64C
	ldr r2, _08016128 @ =gUnk_09E3A65C
	movs r1, #0x8c
	movs r3, #1
	bl OSi_Panic
	movs r0, #0
	b _08016138
	.align 2, 0
_08016124: .4byte gUnk_09E3A64C
_08016128: .4byte gUnk_09E3A65C
_0801612C:
	ldr r0, _08016130 @ =gUnk_09E587E4
	b _08016136
	.align 2, 0
_08016130: .4byte gUnk_09E587E4
_08016134:
	ldr r0, _0801613C @ =gUnk_09E587E8
_08016136:
	ldr r0, [r0]
_08016138:
	pop {r1}
	bx r1
	.align 2, 0
_0801613C: .4byte gUnk_09E587E8

	thumb_func_start sub_08016140
sub_08016140: @ 0x08016140
	push {r4, lr}
	adds r4, r1, #0
	ldrh r1, [r0, #0xe]
	ldrh r3, [r0, #0xc]
	adds r2, r3, r0
	movs r3, #0
	cmp r3, r1
	bge _08016164
_08016150:
	ldr r0, [r2]
	cmp r0, r4
	bne _0801615A
	adds r0, r2, #0
	b _08016166
_0801615A:
	ldr r0, [r2, #4]
	adds r2, r2, r0
	adds r3, #1
	cmp r3, r1
	blt _08016150
_08016164:
	movs r0, #0
_08016166:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0801616C
sub_0801616C: @ 0x0801616C
	push {lr}
	ldr r1, _08016184 @ =0x54444742
	bl sub_08016140
	movs r1, #0
	cmp r0, #0
	beq _0801617C
	ldr r1, [r0, #0xc]
_0801617C:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08016184: .4byte 0x54444742

	thumb_func_start sub_08016188
sub_08016188: @ 0x08016188
	push {lr}
	ldr r1, _080161A0 @ =0x54444742
	bl sub_08016140
	movs r1, #0
	cmp r0, #0
	beq _08016198
	ldr r1, [r0, #0x18]
_08016198:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_080161A0: .4byte 0x54444742

	thumb_func_start sub_080161A4
sub_080161A4: @ 0x080161A4
	push {lr}
	ldr r1, _080161BC @ =0x444A424F
	bl sub_08016140
	movs r1, #0
	cmp r0, #0
	beq _080161B4
	ldr r1, [r0, #0x1c]
_080161B4:
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_080161BC: .4byte 0x444A424F

	thumb_func_start sub_080161C0
sub_080161C0: @ 0x080161C0
	push {lr}
	ldr r1, _080161D4 @ =0x544C4150
	bl sub_08016140
	cmp r0, #0
	beq _080161D8
	ldr r0, [r0, #8]
	lsls r0, r0, #1
	b _080161DA
	.align 2, 0
_080161D4: .4byte 0x544C4150
_080161D8:
	movs r0, #0
_080161DA:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080161E0
sub_080161E0: @ 0x080161E0
	push {r4, r5, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, _08016200 @ =0x54444742
	bl sub_08016140
	ldrh r2, [r0, #0x10]
	lsls r1, r2, #3
	str r1, [r4]
	ldrh r0, [r0, #0x12]
	lsls r0, r0, #3
	str r0, [r5]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08016200: .4byte 0x54444742

	thumb_func_start sub_08016204
sub_08016204: @ 0x08016204
	push {lr}
	ldr r1, _08016214 @ =0x54444742
	bl sub_08016140
	adds r0, #0x1c
	pop {r1}
	bx r1
	.align 2, 0
_08016214: .4byte 0x54444742

	thumb_func_start sub_08016218
sub_08016218: @ 0x08016218
	push {lr}
	ldr r1, _08016234 @ =0x54444742
	bl sub_08016140
	adds r1, r0, #0
	adds r1, #0x1c
	ldr r0, [r0, #0xc]
	adds r0, #3
	asrs r0, r0, #2
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08016234: .4byte 0x54444742

	thumb_func_start sub_08016238
sub_08016238: @ 0x08016238
	push {lr}
	ldr r1, _08016254 @ =0x444A424F
	bl sub_08016140
	adds r1, r0, #0
	adds r1, #0x20
	ldr r0, [r0, #0xc]
	adds r0, #3
	lsrs r0, r0, #2
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_08016254: .4byte 0x444A424F

	thumb_func_start sub_08016258
sub_08016258: @ 0x08016258
	push {lr}
	ldr r1, _08016268 @ =0x444A424F
	bl sub_08016140
	adds r0, #0x20
	pop {r1}
	bx r1
	.align 2, 0
_08016268: .4byte 0x444A424F

	thumb_func_start sub_0801626C
sub_0801626C: @ 0x0801626C
	push {r4, lr}
	adds r3, r0, #0
	adds r4, r1, #0
	adds r4, #0xc
	ldr r0, [r3, #0x1c]
	cmp r0, #0
	beq _0801627E
	adds r2, r0, #0
	b _08016282
_0801627E:
	ldr r0, [r1, #8]
	lsls r2, r0, #1
_08016282:
	movs r1, #0x10
	ldrsh r0, [r3, r1]
	cmp r0, #0
	blt _080162D4
	ldr r0, [r3, #0x18]
	lsls r0, r0, #0xf
	cmp r0, #0
	blt _080162D4
	cmp r2, #0
	beq _080162D4
	ldrb r1, [r3, #0x14]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #0
	blt _080162D4
	cmp r0, #3
	ble _080162C0
	cmp r0, #4
	bne _080162D4
	movs r0, #0x10
	ldrsh r1, [r3, r0]
	ldr r0, _080162BC @ =0x05000200
	adds r1, r1, r0
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuFastSet
	b _080162D4
	.align 2, 0
_080162BC: .4byte 0x05000200
_080162C0:
	movs r0, #0x10
	ldrsh r1, [r3, r0]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	lsls r2, r2, #9
	lsrs r2, r2, #0xb
	adds r0, r4, #0
	bl CpuFastSet
_080162D4:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080162DC
sub_080162DC: @ 0x080162DC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	adds r2, r3, #0
	ldr r0, _080162FC @ =0xFFF00000
	ands r0, r4
	cmp r0, #0
	beq _08016300
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	adds r0, r5, #0
	adds r1, r4, #0
	bl CpuSet
	b _0801633E
	.align 2, 0
_080162FC: .4byte 0xFFF00000
_08016300:
	cmp r1, #1
	beq _08016322
	cmp r1, #1
	bgt _0801630E
	cmp r1, #0
	beq _08016318
	b _0801633E
_0801630E:
	cmp r1, #2
	beq _0801632C
	cmp r1, #3
	beq _08016336
	b _0801633E
_08016318:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GL_LoadBg0Screen
	b _0801633E
_08016322:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GL_LoadBg1Screen
	b _0801633E
_0801632C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GL_LoadBg2Screen
	b _0801633E
_08016336:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GL_LoadBg3Screen
_0801633E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08016344
sub_08016344: @ 0x08016344
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	str r1, [sp]
	adds r0, r1, #0
	adds r0, #0x1c
	mov sb, r0
	ldr r1, _080163E0 @ =gUnk_02023D40
	mov sl, r1
	ldr r2, [sp]
	ldr r0, [r2, #0xc]
	cmp r0, #0
	bne _08016368
	b _080165AC
_08016368:
	ldrb r1, [r6, #0x15]
	movs r0, #2
	ands r0, r1
	movs r3, #5
	mov r8, r3
	cmp r0, #0
	beq _0801637A
	movs r7, #9
	mov r8, r7
_0801637A:
	lsls r1, r1, #0x1e
	lsrs r1, r1, #0x1f
	adds r1, #1
	lsls r1, r1, #5
	ldr r0, [r6, #0xc]
	bl __udivsi3
	adds r5, r0, #0
	ldrb r1, [r6, #0x1b]
	lsls r0, r1, #0x1d
	cmp r0, #0
	bge _080163E4
	movs r3, #0
	ldrb r2, [r6, #0x16]
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x19
	ldrh r7, [r6, #0x16]
	lsls r1, r7, #0x12
	lsrs r1, r1, #0x19
	muls r0, r1, r0
	adds r0, #1
	asrs r0, r0, #1
	cmp r3, r0
	bge _08016490
	mov r2, sb
	mov r4, sl
_080163AE:
	ldrb r0, [r2]
	adds r1, r0, r5
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	ldrb r7, [r2, #2]
	adds r0, r7, r5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	orrs r1, r0
	strh r1, [r4]
	adds r2, #4
	adds r4, #2
	adds r3, #1
	ldrb r0, [r6, #0x16]
	lsls r1, r0, #0x19
	lsrs r1, r1, #0x19
	ldrh r7, [r6, #0x16]
	lsls r0, r7, #0x12
	lsrs r0, r0, #0x19
	muls r0, r1, r0
	adds r0, #1
	asrs r0, r0, #1
	cmp r3, r0
	blt _080163AE
	b _08016490
	.align 2, 0
_080163E0: .4byte gUnk_02023D40
_080163E4:
	ldr r0, [sp]
	ldrb r0, [r0, #0xa]
	cmp r0, #4
	bne _08016444
	movs r3, #0
	ldrb r1, [r6, #0x16]
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	ldrh r2, [r6, #0x16]
	lsls r1, r2, #0x12
	lsrs r1, r1, #0x19
	muls r0, r1, r0
	cmp r3, r0
	bge _08016490
	mov r4, sl
_08016402:
	mov r7, sb
	adds r7, #4
	mov sb, r7
	subs r7, #4
	ldm r7!, {r2}
	adds r1, r2, r5
	ldr r7, _08016440 @ =0x000003FF
	adds r0, r7, #0
	ands r1, r0
	lsrs r2, r2, #0x10
	orrs r1, r2
	movs r2, #0x10
	ldrsh r0, [r6, r2]
	mov r7, r8
	asrs r0, r7
	lsls r0, r0, #0xc
	adds r1, r1, r0
	strh r1, [r4]
	adds r4, #2
	adds r3, #1
	ldrb r0, [r6, #0x16]
	lsls r1, r0, #0x19
	lsrs r1, r1, #0x19
	ldrh r2, [r6, #0x16]
	lsls r0, r2, #0x12
	lsrs r0, r0, #0x19
	muls r0, r1, r0
	cmp r3, r0
	blt _08016402
	b _08016490
	.align 2, 0
_08016440: .4byte 0x000003FF
_08016444:
	movs r3, #0x10
	ldrsh r0, [r6, r3]
	orrs r0, r5
	cmp r0, #0
	beq _08016492
	movs r3, #0
	ldrb r7, [r6, #0x16]
	lsls r0, r7, #0x19
	lsrs r0, r0, #0x19
	ldrh r2, [r6, #0x16]
	lsls r1, r2, #0x12
	lsrs r1, r1, #0x19
	muls r0, r1, r0
	cmp r3, r0
	bge _08016490
	mov r2, sb
	mov r4, sl
_08016466:
	ldrh r7, [r2]
	adds r1, r7, r5
	movs r7, #0x10
	ldrsh r0, [r6, r7]
	mov r7, r8
	asrs r0, r7
	lsls r0, r0, #0xc
	adds r1, r1, r0
	strh r1, [r4]
	adds r2, #2
	adds r4, #2
	adds r3, #1
	ldrb r0, [r6, #0x16]
	lsls r1, r0, #0x19
	lsrs r1, r1, #0x19
	ldrh r7, [r6, #0x16]
	lsls r0, r7, #0x12
	lsrs r0, r0, #0x19
	muls r0, r1, r0
	cmp r3, r0
	blt _08016466
_08016490:
	mov sb, sl
_08016492:
	movs r0, #0x40
	ldrb r1, [r6, #0x17]
	ands r0, r1
	cmp r0, #0
	bne _080164B2
	ldrb r2, [r6, #0x16]
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x19
	adds r1, r6, #0
	adds r1, #0x22
	strb r0, [r1]
	ldrh r3, [r6, #0x16]
	lsls r0, r3, #0x12
	lsrs r0, r0, #0x19
	adds r1, #1
	strb r0, [r1]
_080164B2:
	ldrh r4, [r6, #0x16]
	ldr r0, _080164DC @ =0x0000407F
	ands r0, r4
	cmp r0, #0x20
	bne _080164E0
	ldrb r7, [r6, #0x14]
	lsls r1, r7, #0x1c
	lsrs r1, r1, #0x1c
	ldr r2, [r6, #8]
	ldrb r6, [r6, #0x16]
	lsls r3, r6, #0x19
	lsrs r3, r3, #0x19
	lsls r0, r4, #0x12
	lsrs r0, r0, #0x19
	lsls r0, r0, #1
	muls r3, r0, r3
	mov r0, sb
	bl sub_080162DC
	b _080165AC
	.align 2, 0
_080164DC: .4byte 0x0000407F
_080164E0:
	movs r0, #2
	mov sl, r0
	movs r1, #0x20
	str r1, [sp, #4]
	ldrb r2, [r6, #0x1b]
	lsls r0, r2, #0x1d
	cmp r0, #0
	bge _08016534
	movs r4, #0
	movs r3, #1
	mov sl, r3
	ldrb r7, [r6, #0x14]
	lsls r0, r7, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #2
	beq _0801651C
	cmp r0, #3
	beq _08016522
	ldr r0, _08016510 @ =gUnk_09E3A64C
	ldr r1, _08016514 @ =0x0000016B
	ldr r2, _08016518 @ =gUnk_09E3A65C
	bl OSi_Panic
	b _08016528
	.align 2, 0
_08016510: .4byte gUnk_09E3A64C
_08016514: .4byte 0x0000016B
_08016518: .4byte gUnk_09E3A65C
_0801651C:
	bl GL_GetBg2ScreenSize
	b _08016526
_08016522:
	bl GL_GetBg3ScreenSize
_08016526:
	adds r4, r0, #0
_08016528:
	movs r0, #0x20
	str r0, [sp, #4]
	cmp r4, #0
	bne _08016534
	movs r1, #0x10
	str r1, [sp, #4]
_08016534:
	movs r7, #0
	adds r0, r6, #0
	adds r0, #0x23
	adds r5, r6, #0
	adds r5, #0x21
	ldrb r2, [r0]
	ldrb r3, [r5]
	subs r1, r2, r3
	str r0, [sp, #8]
	cmp r7, r1
	bge _080165AC
_0801654A:
	ldrb r1, [r5]
	adds r0, r1, r7
	ldr r2, [sp]
	ldrh r2, [r2, #0x10]
	adds r1, r2, #0
	muls r1, r0, r1
	adds r0, r6, #0
	adds r0, #0x20
	ldrb r4, [r0]
	adds r1, r1, r4
	mov r0, sl
	muls r0, r1, r0
	add r0, sb
	ldrb r3, [r6, #0x14]
	lsls r1, r3, #0x1c
	lsrs r1, r1, #0x1c
	ldrh r3, [r6, #0x18]
	lsls r2, r3, #0x12
	lsrs r2, r2, #0x19
	adds r2, r2, r7
	mov ip, r2
	ldr r3, [sp, #4]
	mov r2, ip
	muls r2, r3, r2
	mov ip, r2
	ldrb r3, [r6, #0x18]
	lsls r2, r3, #0x19
	lsrs r2, r2, #0x19
	add ip, r2
	mov r2, ip
	mov r3, sl
	muls r3, r2, r3
	ldr r2, [r6, #8]
	adds r2, r2, r3
	adds r3, r6, #0
	adds r3, #0x22
	ldrb r3, [r3]
	subs r4, r3, r4
	mov r3, sl
	muls r3, r4, r3
	bl sub_080162DC
	adds r7, #1
	ldr r3, [sp, #8]
	ldrb r3, [r3]
	ldrb r1, [r5]
	subs r0, r3, r1
	cmp r7, r0
	blt _0801654A
_080165AC:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080165BC
sub_080165BC: @ 0x080165BC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x54
	adds r5, r0, #0
	adds r6, r1, #0
	adds r1, #0x1c
	ldr r0, [r6, #0xc]
	adds r0, #3
	asrs r0, r0, #2
	lsls r0, r0, #2
	adds r1, r1, r0
	str r1, [sp, #0x48]
	movs r1, #3
	ldrb r0, [r6, #8]
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r2, [r5, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #0x14]
	movs r1, #3
	ldrb r3, [r6, #9]
	ands r1, r3
	lsls r1, r1, #7
	ldr r0, _08016634 @ =0xFFFFFE7F
	ldrh r4, [r5, #0x14]
	ands r0, r4
	orrs r0, r1
	strh r0, [r5, #0x14]
	movs r1, #0x7f
	ldrb r7, [r6, #0x10]
	ands r1, r7
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r2, [r5, #0x16]
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #0x16]
	movs r1, #0x7f
	ldrb r3, [r6, #0x12]
	ands r1, r3
	lsls r1, r1, #7
	ldr r0, _08016638 @ =0xFFFFC07F
	ldrh r4, [r5, #0x16]
	ands r0, r4
	orrs r0, r1
	strh r0, [r5, #0x16]
	ldrb r0, [r6, #8]
	cmp r0, #0
	beq _0801663C
	movs r0, #2
	ldrb r7, [r5, #0x15]
	orrs r0, r7
	b _08016644
	.align 2, 0
_08016634: .4byte 0xFFFFFE7F
_08016638: .4byte 0xFFFFC07F
_0801663C:
	movs r0, #3
	rsbs r0, r0, #0
	ldrb r1, [r5, #0x15]
	ands r0, r1
_08016644:
	strb r0, [r5, #0x15]
	ldr r1, [r5, #8]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08016652
	b _08016898
_08016652:
	ldrb r1, [r5, #0x18]
	lsls r0, r1, #0x19
	lsrs r2, r0, #0x19
	mov r8, r1
	cmp r2, #0x1f
	bgt _08016674
	adds r1, r5, #0
	adds r1, #0x22
	adds r0, r5, #0
	adds r0, #0x20
	ldrb r1, [r1]
	ldrb r0, [r0]
	subs r0, r1, r0
	adds r0, r2, r0
	ldrh r4, [r5, #0x18]
	cmp r0, #0x1f
	bgt _08016698
_08016674:
	ldrh r1, [r5, #0x18]
	lsls r0, r1, #0x12
	lsrs r2, r0, #0x19
	adds r4, r1, #0
	cmp r2, #0x1f
	ble _08016682
	b _08016830
_08016682:
	adds r0, r5, #0
	adds r0, #0x23
	adds r1, r5, #0
	adds r1, #0x21
	ldrb r0, [r0]
	ldrb r1, [r1]
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, #0x1f
	bgt _08016698
	b _08016830
_08016698:
	mov r1, sp
	adds r0, r5, #0
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	movs r0, #0
	str r0, [sp, #0x4c]
	mov sl, r0
	mov r1, r8
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x19
	mov ip, r0
	adds r0, r5, #0
	adds r0, #0x22
	adds r2, r5, #0
	adds r2, #0x20
	ldrb r3, [r2]
	ldrb r0, [r0]
	subs r0, r0, r3
	add r0, ip
	mov sb, r0
	lsls r1, r4, #0x12
	lsrs r1, r1, #0x19
	adds r0, r5, #0
	adds r0, #0x23
	adds r4, r5, #0
	adds r4, #0x21
	ldrb r0, [r0]
	ldrb r7, [r4]
	subs r0, r0, r7
	adds r1, r1, r0
	mov r8, r1
	str r2, [sp, #0x50]
	mov r0, sb
	cmp r0, #0x1f
	ble _080166F6
	mov r0, ip
	subs r0, #0x20
	subs r0, r3, r0
	mov r1, sp
	adds r1, #0x22
	strb r0, [r1]
	ldrb r1, [r1]
	str r1, [sp, #0x4c]
_080166F6:
	mov r1, r8
	cmp r1, #0x1f
	ble _08016712
	ldrh r2, [r5, #0x18]
	lsls r0, r2, #0x12
	lsrs r0, r0, #0x19
	subs r0, #0x20
	ldrb r3, [r4]
	subs r0, r3, r0
	mov r1, sp
	adds r1, #0x23
	strb r0, [r1]
	ldrb r1, [r1]
	mov sl, r1
_08016712:
	mov r0, sp
	adds r1, r6, #0
	bl sub_08016344
	mov r7, sb
	cmp r7, #0x1f
	ble _08016778
	mov r1, sp
	adds r0, r5, #0
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	add r0, sp, #0x20
	add r1, sp, #0x4c
	ldrb r1, [r1]
	strb r1, [r0]
	mov r1, sp
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x18]
	ands r0, r2
	strb r0, [r1, #0x18]
	mov r3, r8
	cmp r3, #0x1f
	ble _0801675A
	ldrh r7, [r5, #0x18]
	lsls r0, r7, #0x12
	lsrs r0, r0, #0x19
	subs r0, #0x20
	ldrb r4, [r4]
	subs r0, r4, r0
	adds r1, #0x23
	strb r0, [r1]
_0801675A:
	ldrb r1, [r5, #0x14]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1c
	mov r1, sp
	ldrh r1, [r1, #0x18]
	lsls r2, r1, #0x12
	lsrs r2, r2, #0x19
	movs r1, #0x20
	bl sub_08014AF0
	str r0, [sp, #8]
	mov r0, sp
	adds r1, r6, #0
	bl sub_08016344
_08016778:
	mov r2, r8
	cmp r2, #0x1f
	bgt _08016780
	b _08016898
_08016780:
	mov r1, sp
	adds r0, r5, #0
	ldm r0!, {r3, r4, r7}
	stm r1!, {r3, r4, r7}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	mov r4, sp
	adds r4, #0x21
	mov r7, sl
	strb r7, [r4]
	mov r1, sp
	movs r0, #0x80
	rsbs r0, r0, #0
	mov r8, r0
	ldrb r2, [r1, #0x18]
	ands r0, r2
	strb r0, [r1, #0x18]
	mov r3, sb
	cmp r3, #0x1f
	ble _080167C0
	ldrb r7, [r5, #0x18]
	lsls r0, r7, #0x19
	lsrs r0, r0, #0x19
	subs r0, #0x20
	ldr r1, [sp, #0x50]
	ldrb r1, [r1]
	subs r0, r1, r0
	mov r1, sp
	adds r1, #0x22
	strb r0, [r1]
_080167C0:
	ldrb r2, [r5, #0x14]
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1c
	mov r1, sp
	ldrb r1, [r1, #0x18]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r2, #0x20
	bl sub_08014AF0
	str r0, [sp, #8]
	mov r0, sp
	adds r1, r6, #0
	bl sub_08016344
	mov r3, sb
	cmp r3, #0x1f
	ble _08016898
	mov r1, sp
	adds r0, r5, #0
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	add r0, sp, #0x20
	add r7, sp, #0x4c
	ldrb r7, [r7]
	strb r7, [r0]
	mov r0, sl
	strb r0, [r4]
	mov r1, sp
	mov r0, r8
	ldrb r2, [r1, #0x18]
	ands r0, r2
	strb r0, [r1, #0x18]
	ldr r0, _0801682C @ =0xFFFFC07F
	ldrh r3, [r1, #0x18]
	ands r0, r3
	strh r0, [r1, #0x18]
	ldrb r4, [r5, #0x14]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1c
	movs r1, #0x20
	movs r2, #0x20
	bl sub_08014AF0
	str r0, [sp, #8]
	mov r0, sp
	adds r1, r6, #0
	bl sub_08016344
	b _08016898
	.align 2, 0
_0801682C: .4byte 0xFFFFC07F
_08016830:
	add r4, sp, #0x24
	adds r1, r4, #0
	adds r0, r5, #0
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldrb r7, [r5, #0x14]
	lsls r0, r7, #0x1c
	lsrs r0, r0, #0x1c
	ldrb r2, [r4, #0x18]
	lsls r1, r2, #0x19
	lsrs r1, r1, #0x19
	ldrh r3, [r4, #0x18]
	lsls r2, r3, #0x12
	lsrs r2, r2, #0x19
	bl sub_08014AF0
	str r0, [r4, #8]
	ldrb r2, [r4, #0x18]
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x19
	cmp r0, #0x1f
	ble _08016876
	adds r1, r0, #0
	subs r1, #0x20
	movs r0, #0x7f
	ands r1, r0
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0x18]
_08016876:
	ldrh r2, [r4, #0x18]
	lsls r0, r2, #0x12
	lsrs r0, r0, #0x19
	cmp r0, #0x1f
	ble _08016890
	subs r0, #0x20
	movs r1, #0x7f
	ands r0, r1
	lsls r0, r0, #7
	ldr r1, _080168C8 @ =0xFFFFC07F
	ands r1, r2
	orrs r1, r0
	strh r1, [r4, #0x18]
_08016890:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_08016344
_08016898:
	ldr r1, [r5, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080168F4
	movs r0, #0x80
	ldrb r4, [r5, #0x17]
	ands r0, r4
	cmp r0, #0
	bne _080168F4
	ldr r2, [r6, #0x18]
	cmp r2, #0
	beq _080168F4
	ldrb r5, [r5, #0x14]
	lsls r0, r5, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #1
	beq _080168DE
	cmp r0, #1
	bgt _080168CC
	cmp r0, #0
	beq _080168D6
	b _080168F4
	.align 2, 0
_080168C8: .4byte 0xFFFFC07F
_080168CC:
	cmp r0, #2
	beq _080168E6
	cmp r0, #3
	beq _080168EE
	b _080168F4
_080168D6:
	ldr r0, [sp, #0x48]
	bl GL_LoadBg0Char
	b _080168F4
_080168DE:
	ldr r0, [sp, #0x48]
	bl GL_LoadBg1Char
	b _080168F4
_080168E6:
	ldr r0, [sp, #0x48]
	bl GL_LoadBg2Char
	b _080168F4
_080168EE:
	ldr r0, [sp, #0x48]
	bl GL_LoadBg3Char
_080168F4:
	movs r0, #0
	add sp, #0x54
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08016908
sub_08016908: @ 0x08016908
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r4, [sp, #0x20]
	lsls r2, r2, #6
	adds r2, r0, r2
	lsls r1, r1, #1
	adds r0, r2, r1
	cmp r4, #0
	ble _0801694A
	mov r7, sp
	ldr r6, _08016958 @ =0x001FFFFF
	ands r6, r3
	adds r5, r0, #0
	movs r0, #0
	mov sb, r0
	movs r0, #0x80
	lsls r0, r0, #0x11
	mov r8, r0
_08016932:
	mov r0, sb
	strh r0, [r7]
	mov r0, sp
	adds r1, r5, #0
	mov r2, r8
	orrs r2, r6
	bl CpuSet
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bne _08016932
_0801694A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08016958: .4byte 0x001FFFFF

	thumb_func_start sub_0801695C
sub_0801695C: @ 0x0801695C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r1, #0x20
	ldr r2, [r5, #0xc]
	adds r0, r2, #3
	asrs r0, r0, #2
	lsls r0, r0, #2
	adds r6, r1, r0
	cmp r2, #0
	beq _080169AE
	str r1, [r4, #4]
	ldrb r1, [r5, #0xa]
	adds r0, r2, #0
	bl __udivsi3
	strh r0, [r4, #0x12]
	ldrb r0, [r5, #9]
	lsls r1, r0, #4
	movs r0, #0xf
	ldrb r2, [r4, #0x15]
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0x15]
	movs r1, #3
	ldrb r0, [r5, #8]
	ands r1, r0
	lsls r1, r1, #5
	movs r0, #0x61
	rsbs r0, r0, #0
	ldrb r2, [r4, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0x14]
	ldrh r0, [r5, #0x18]
	lsls r1, r0, #1
	movs r0, #1
	ldrb r2, [r4, #0x1a]
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #0x1a]
_080169AE:
	ldr r1, [r4, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080169CE
	ldr r2, [r5, #0x1c]
	cmp r2, #0
	beq _080169CE
	ldrb r4, [r4, #0x14]
	lsls r0, r4, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #4
	bne _080169CE
	adds r0, r6, #0
	bl GL_LoadObj
_080169CE:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080169D8
sub_080169D8: @ 0x080169D8
	adds r3, r1, #0
	ldrb r0, [r0, #0x15]
	lsrs r0, r0, #4
	cmp r0, #0xb
	bhi _08016A78
	lsls r0, r0, #2
	ldr r1, _080169EC @ =_080169F0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080169EC: .4byte _080169F0
_080169F0: @ jump table
	.4byte _08016A20 @ case 0
	.4byte _08016A26 @ case 1
	.4byte _08016A2C @ case 2
	.4byte _08016A32 @ case 3
	.4byte _08016A38 @ case 4
	.4byte _08016A40 @ case 5
	.4byte _08016A48 @ case 6
	.4byte _08016A50 @ case 7
	.4byte _08016A58 @ case 8
	.4byte _08016A60 @ case 9
	.4byte _08016A68 @ case 10
	.4byte _08016A70 @ case 11
_08016A20:
	movs r0, #8
	str r0, [r3]
	b _08016A76
_08016A26:
	movs r0, #0x10
	str r0, [r3]
	b _08016A76
_08016A2C:
	movs r0, #0x20
	str r0, [r3]
	b _08016A76
_08016A32:
	movs r0, #0x40
	str r0, [r3]
	b _08016A76
_08016A38:
	movs r0, #0x10
	str r0, [r3]
	movs r0, #8
	b _08016A76
_08016A40:
	movs r0, #0x20
	str r0, [r3]
	movs r0, #8
	b _08016A76
_08016A48:
	movs r0, #0x20
	str r0, [r3]
	movs r0, #0x10
	b _08016A76
_08016A50:
	movs r0, #0x40
	str r0, [r3]
	movs r0, #0x20
	b _08016A76
_08016A58:
	movs r0, #8
	str r0, [r3]
	movs r0, #0x10
	b _08016A76
_08016A60:
	movs r0, #8
	str r0, [r3]
	movs r0, #0x20
	b _08016A76
_08016A68:
	movs r0, #0x10
	str r0, [r3]
	movs r0, #0x20
	b _08016A76
_08016A70:
	movs r0, #0x20
	str r0, [r3]
	movs r0, #0x40
_08016A76:
	str r0, [r2]
_08016A78:
	bx lr
	.align 2, 0

	thumb_func_start sub_08016A7C
sub_08016A7C: @ 0x08016A7C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	ldr r0, [r5]
	ldrh r1, [r0, #0xe]
	ldrh r2, [r0, #0xc]
	adds r4, r2, r0
	cmp r1, #0
	beq _08016AEC
	ldr r7, _08016AAC @ =0x54444742
	movs r0, #1
	rsbs r0, r0, #0
	mov r8, r0
	adds r6, r1, #0
_08016A9A:
	ldr r1, [r4]
	cmp r1, r7
	beq _08016AD0
	cmp r1, r7
	bhi _08016AB4
	ldr r0, _08016AB0 @ =0x444A424F
	cmp r1, r0
	beq _08016ADA
	b _08016AE2
	.align 2, 0
_08016AAC: .4byte 0x54444742
_08016AB0: .4byte 0x444A424F
_08016AB4:
	ldr r0, _08016ACC @ =0x544C4150
	cmp r1, r0
	bne _08016AE2
	movs r1, #0x10
	ldrsh r0, [r5, r1]
	cmp r0, r8
	beq _08016AE2
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0801626C
	b _08016AE2
	.align 2, 0
_08016ACC: .4byte 0x544C4150
_08016AD0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_080165BC
	b _08016AE2
_08016ADA:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_0801695C
_08016AE2:
	ldr r0, [r4, #4]
	adds r4, r4, r0
	subs r6, #1
	cmp r6, #0
	bne _08016A9A
_08016AEC:
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_08016AF8
sub_08016AF8: @ 0x08016AF8
	movs r0, #0
	bx lr

	thumb_func_start sub_08016AFC
sub_08016AFC: @ 0x08016AFC
	push {r4, lr}
	ldr r1, _08016B48 @ =0x00000201
	adds r4, r0, r1
	ldrb r0, [r4]
	cmp r0, #0
	bne _08016B14
	ldr r0, _08016B4C @ =gUnk_09E3A770
	ldr r2, _08016B50 @ =gUnk_09E3A780
	movs r1, #0x26
	movs r3, #1
	bl OSi_Panic
_08016B14:
	ldrb r4, [r4]
	ldr r3, _08016B54 @ =0x00001072 (Mabarrel (None))
	adds r0, r4, r3
	bl GetInterfaceTextIdIndex
	ldr r2, _08016B58 @ =gInterfaceTextOffsets
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08016B5C @ =gUnk_02000000
	ldr r3, _08016B60 @ =0x00006C2C
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, _08016B64 @ =gInterfaceText
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08016B48: .4byte 0x00000201
_08016B4C: .4byte gUnk_09E3A770
_08016B50: .4byte gUnk_09E3A780
_08016B54: .4byte 0x00001072 @ Mabarrel (None)
_08016B58: .4byte gInterfaceTextOffsets
_08016B5C: .4byte gUnk_02000000
_08016B60: .4byte 0x00006C2C
_08016B64: .4byte gInterfaceText

	thumb_func_start sub_08016B68
sub_08016B68: @ 0x08016B68
	ldr r2, _08016B80 @ =0xFFFF7EB8
	adds r1, r0, r2
	movs r0, #0xa9
	lsls r0, r0, #1
	cmp r1, r0
	bls _08016B76
	b _080171D0
_08016B76:
	lsls r0, r1, #2
	ldr r1, _08016B84 @ =_08016B88
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08016B80: .4byte 0xFFFF7EB8
_08016B84: .4byte _08016B88
_08016B88: @ jump table
	.4byte _080171A4 @ case 0
	.4byte _080171A0 @ case 1
	.4byte _080171D0 @ case 2
	.4byte _080171D0 @ case 3
	.4byte _080171D0 @ case 4
	.4byte _080171D0 @ case 5
	.4byte _080171D0 @ case 6
	.4byte _080171D0 @ case 7
	.4byte _080171D0 @ case 8
	.4byte _080171D0 @ case 9
	.4byte _080171D0 @ case 10
	.4byte _080171D0 @ case 11
	.4byte _080171D0 @ case 12
	.4byte _080171D0 @ case 13
	.4byte _080171D0 @ case 14
	.4byte _080171D0 @ case 15
	.4byte _080171D0 @ case 16
	.4byte _080171D0 @ case 17
	.4byte _080171D0 @ case 18
	.4byte _080171D0 @ case 19
	.4byte _080171D0 @ case 20
	.4byte _080171D0 @ case 21
	.4byte _080171D0 @ case 22
	.4byte _080171D0 @ case 23
	.4byte _080171D0 @ case 24
	.4byte _080171D0 @ case 25
	.4byte _080171D0 @ case 26
	.4byte _080171D0 @ case 27
	.4byte _080171D0 @ case 28
	.4byte _080171D0 @ case 29
	.4byte _080171D0 @ case 30
	.4byte _080171D0 @ case 31
	.4byte _080171D0 @ case 32
	.4byte _080171D0 @ case 33
	.4byte _080171D0 @ case 34
	.4byte _080171D0 @ case 35
	.4byte _080171D0 @ case 36
	.4byte _080171D0 @ case 37
	.4byte _080171D0 @ case 38
	.4byte _080171D0 @ case 39
	.4byte _080171D0 @ case 40
	.4byte _080171D0 @ case 41
	.4byte _080171D0 @ case 42
	.4byte _080171D0 @ case 43
	.4byte _080171D0 @ case 44
	.4byte _080171D0 @ case 45
	.4byte _080171D0 @ case 46
	.4byte _080171D0 @ case 47
	.4byte _080171D0 @ case 48
	.4byte _080171D0 @ case 49
	.4byte _080171D0 @ case 50
	.4byte _080171A8 @ case 51
	.4byte _080171AC @ case 52
	.4byte _080171D0 @ case 53
	.4byte _080171D0 @ case 54
	.4byte _080171D0 @ case 55
	.4byte _080171B0 @ case 56
	.4byte _080171B4 @ case 57
	.4byte _080171D0 @ case 58
	.4byte _080171D0 @ case 59
	.4byte _080171D0 @ case 60
	.4byte _080171D0 @ case 61
	.4byte _080171D0 @ case 62
	.4byte _080171D0 @ case 63
	.4byte _080171D0 @ case 64
	.4byte _080171D0 @ case 65
	.4byte _080171D0 @ case 66
	.4byte _080171D0 @ case 67
	.4byte _080171D0 @ case 68
	.4byte _080171D0 @ case 69
	.4byte _080171D0 @ case 70
	.4byte _080171D0 @ case 71
	.4byte _080171D0 @ case 72
	.4byte _080171D0 @ case 73
	.4byte _080171D0 @ case 74
	.4byte _080171B8 @ case 75
	.4byte _0801719C @ case 76
	.4byte _08017198 @ case 77
	.4byte _080171D0 @ case 78
	.4byte _080171BC @ case 79
	.4byte _080171D0 @ case 80
	.4byte _080171D0 @ case 81
	.4byte _080171C0 @ case 82
	.4byte _080171D0 @ case 83
	.4byte _080171C4 @ case 84
	.4byte _080171D0 @ case 85
	.4byte _080171D0 @ case 86
	.4byte _080171D0 @ case 87
	.4byte _080171D0 @ case 88
	.4byte _080171CC @ case 89
	.4byte _080171D0 @ case 90
	.4byte _080171C8 @ case 91
	.4byte _080171D0 @ case 92
	.4byte _080171D0 @ case 93
	.4byte _080171D0 @ case 94
	.4byte _080171D0 @ case 95
	.4byte _080171D0 @ case 96
	.4byte _080171D0 @ case 97
	.4byte _080171D0 @ case 98
	.4byte _080171D0 @ case 99
	.4byte _080171D0 @ case 100
	.4byte _080171D0 @ case 101
	.4byte _080171D0 @ case 102
	.4byte _080171D0 @ case 103
	.4byte _080171D0 @ case 104
	.4byte _080171D0 @ case 105
	.4byte _080171D0 @ case 106
	.4byte _080171D0 @ case 107
	.4byte _080171D0 @ case 108
	.4byte _080171D0 @ case 109
	.4byte _080171D0 @ case 110
	.4byte _080171D0 @ case 111
	.4byte _080171D0 @ case 112
	.4byte _080171D0 @ case 113
	.4byte _080171D0 @ case 114
	.4byte _080171D0 @ case 115
	.4byte _080171D0 @ case 116
	.4byte _080171D0 @ case 117
	.4byte _080171D0 @ case 118
	.4byte _080171D0 @ case 119
	.4byte _080171D0 @ case 120
	.4byte _080171D0 @ case 121
	.4byte _080171D0 @ case 122
	.4byte _080171D0 @ case 123
	.4byte _080171D0 @ case 124
	.4byte _080171D0 @ case 125
	.4byte _080171D0 @ case 126
	.4byte _080171D0 @ case 127
	.4byte _080171D0 @ case 128
	.4byte _080171D0 @ case 129
	.4byte _080171D0 @ case 130
	.4byte _080171D0 @ case 131
	.4byte _080171D0 @ case 132
	.4byte _080171D0 @ case 133
	.4byte _080171D0 @ case 134
	.4byte _080171D0 @ case 135
	.4byte _080171D0 @ case 136
	.4byte _080171D0 @ case 137
	.4byte _080171D0 @ case 138
	.4byte _080171D0 @ case 139
	.4byte _080171D0 @ case 140
	.4byte _080171D0 @ case 141
	.4byte _080171D0 @ case 142
	.4byte _080171D0 @ case 143
	.4byte _080171D0 @ case 144
	.4byte _080171D0 @ case 145
	.4byte _080171D0 @ case 146
	.4byte _080171D0 @ case 147
	.4byte _080171D0 @ case 148
	.4byte _080171D0 @ case 149
	.4byte _080171D0 @ case 150
	.4byte _080171D0 @ case 151
	.4byte _080171D0 @ case 152
	.4byte _080171D0 @ case 153
	.4byte _080171D0 @ case 154
	.4byte _080171D0 @ case 155
	.4byte _080171D0 @ case 156
	.4byte _080171D0 @ case 157
	.4byte _080171D0 @ case 158
	.4byte _080171D0 @ case 159
	.4byte _080171D0 @ case 160
	.4byte _080171D0 @ case 161
	.4byte _080171D0 @ case 162
	.4byte _080171D0 @ case 163
	.4byte _080171D0 @ case 164
	.4byte _080171D0 @ case 165
	.4byte _080171D0 @ case 166
	.4byte _080171D0 @ case 167
	.4byte _080171D0 @ case 168
	.4byte _080171D0 @ case 169
	.4byte _080171D0 @ case 170
	.4byte _080171D0 @ case 171
	.4byte _080171D0 @ case 172
	.4byte _080171D0 @ case 173
	.4byte _080171D0 @ case 174
	.4byte _080171D0 @ case 175
	.4byte _080171D0 @ case 176
	.4byte _080171D0 @ case 177
	.4byte _080171D0 @ case 178
	.4byte _080171D0 @ case 179
	.4byte _080171D0 @ case 180
	.4byte _080171D0 @ case 181
	.4byte _080171D0 @ case 182
	.4byte _080171D0 @ case 183
	.4byte _080171D0 @ case 184
	.4byte _080171D0 @ case 185
	.4byte _080171D0 @ case 186
	.4byte _080171D0 @ case 187
	.4byte _080171D0 @ case 188
	.4byte _080171D0 @ case 189
	.4byte _080171D0 @ case 190
	.4byte _080171D0 @ case 191
	.4byte _080171D0 @ case 192
	.4byte _080171D0 @ case 193
	.4byte _080171D0 @ case 194
	.4byte _080171D0 @ case 195
	.4byte _080171D0 @ case 196
	.4byte _080171D0 @ case 197
	.4byte _080171D0 @ case 198
	.4byte _080171D0 @ case 199
	.4byte _080171D0 @ case 200
	.4byte _080171D0 @ case 201
	.4byte _080171D0 @ case 202
	.4byte _080171D0 @ case 203
	.4byte _080171D0 @ case 204
	.4byte _080171D0 @ case 205
	.4byte _080171D0 @ case 206
	.4byte _080171D0 @ case 207
	.4byte _080171D0 @ case 208
	.4byte _080171D0 @ case 209
	.4byte _080171D0 @ case 210
	.4byte _080171D0 @ case 211
	.4byte _080171D0 @ case 212
	.4byte _080171D0 @ case 213
	.4byte _080171D0 @ case 214
	.4byte _080171D0 @ case 215
	.4byte _080171D0 @ case 216
	.4byte _080171D0 @ case 217
	.4byte _080171D0 @ case 218
	.4byte _080171D0 @ case 219
	.4byte _080171D0 @ case 220
	.4byte _080171D0 @ case 221
	.4byte _080171D0 @ case 222
	.4byte _080171D0 @ case 223
	.4byte _080171D0 @ case 224
	.4byte _080171D0 @ case 225
	.4byte _080171D0 @ case 226
	.4byte _080171D0 @ case 227
	.4byte _080171D0 @ case 228
	.4byte _080171D0 @ case 229
	.4byte _080171D0 @ case 230
	.4byte _080171D0 @ case 231
	.4byte _080171D0 @ case 232
	.4byte _080171D0 @ case 233
	.4byte _080171D0 @ case 234
	.4byte _080171D0 @ case 235
	.4byte _080171D0 @ case 236
	.4byte _080171D0 @ case 237
	.4byte _080171D0 @ case 238
	.4byte _080171D0 @ case 239
	.4byte _080171D0 @ case 240
	.4byte _080171D0 @ case 241
	.4byte _080171D0 @ case 242
	.4byte _080171D0 @ case 243
	.4byte _080171D0 @ case 244
	.4byte _080171D0 @ case 245
	.4byte _080171D0 @ case 246
	.4byte _080171D0 @ case 247
	.4byte _080171D0 @ case 248
	.4byte _080171D0 @ case 249
	.4byte _080171D0 @ case 250
	.4byte _080171D0 @ case 251
	.4byte _080171D0 @ case 252
	.4byte _080171D0 @ case 253
	.4byte _080171D0 @ case 254
	.4byte _080171D0 @ case 255
	.4byte _080171D0 @ case 256
	.4byte _080171D0 @ case 257
	.4byte _080171D0 @ case 258
	.4byte _080171D0 @ case 259
	.4byte _080171D0 @ case 260
	.4byte _080171D0 @ case 261
	.4byte _080171D0 @ case 262
	.4byte _080171D0 @ case 263
	.4byte _080171D0 @ case 264
	.4byte _08017184 @ case 265
	.4byte _08017188 @ case 266
	.4byte _0801718C @ case 267
	.4byte _080171D0 @ case 268
	.4byte _080171D0 @ case 269
	.4byte _08017190 @ case 270
	.4byte _08017194 @ case 271
	.4byte _080171D0 @ case 272
	.4byte _080171D0 @ case 273
	.4byte _080171D0 @ case 274
	.4byte _080171D0 @ case 275
	.4byte _080171D0 @ case 276
	.4byte _080171D0 @ case 277
	.4byte _080171D0 @ case 278
	.4byte _080171D0 @ case 279
	.4byte _080171D0 @ case 280
	.4byte _080170D4 @ case 281
	.4byte _080170D8 @ case 282
	.4byte _080170DC @ case 283
	.4byte _080170E0 @ case 284
	.4byte _080170E4 @ case 285
	.4byte _080170E8 @ case 286
	.4byte _080170EC @ case 287
	.4byte _080171D0 @ case 288
	.4byte _080170F0 @ case 289
	.4byte _080170F4 @ case 290
	.4byte _080170F8 @ case 291
	.4byte _080170FC @ case 292
	.4byte _08017100 @ case 293
	.4byte _080171D0 @ case 294
	.4byte _08017104 @ case 295
	.4byte _08017108 @ case 296
	.4byte _0801710C @ case 297
	.4byte _080171D0 @ case 298
	.4byte _08017110 @ case 299
	.4byte _08017114 @ case 300
	.4byte _08017118 @ case 301
	.4byte _0801711C @ case 302
	.4byte _08017120 @ case 303
	.4byte _08017124 @ case 304
	.4byte _08017128 @ case 305
	.4byte _080171D0 @ case 306
	.4byte _080171D0 @ case 307
	.4byte _080171D0 @ case 308
	.4byte _080171D0 @ case 309
	.4byte _080171D0 @ case 310
	.4byte _080171D0 @ case 311
	.4byte _080171D0 @ case 312
	.4byte _0801712C @ case 313
	.4byte _080171D0 @ case 314
	.4byte _08017130 @ case 315
	.4byte _08017134 @ case 316
	.4byte _08017138 @ case 317
	.4byte _0801713C @ case 318
	.4byte _08017140 @ case 319
	.4byte _08017144 @ case 320
	.4byte _08017148 @ case 321
	.4byte _0801714C @ case 322
	.4byte _08017150 @ case 323
	.4byte _080171D0 @ case 324
	.4byte _08017154 @ case 325
	.4byte _08017158 @ case 326
	.4byte _080171D0 @ case 327
	.4byte _0801715C @ case 328
	.4byte _080171D0 @ case 329
	.4byte _08017160 @ case 330
	.4byte _08017164 @ case 331
	.4byte _08017168 @ case 332
	.4byte _0801716C @ case 333
	.4byte _08017170 @ case 334
	.4byte _08017174 @ case 335
	.4byte _08017178 @ case 336
	.4byte _0801717C @ case 337
	.4byte _08017180 @ case 338
_080170D4:
	movs r0, #1
	b _080171D2
_080170D8:
	movs r0, #2
	b _080171D2
_080170DC:
	movs r0, #3
	b _080171D2
_080170E0:
	movs r0, #4
	b _080171D2
_080170E4:
	movs r0, #5
	b _080171D2
_080170E8:
	movs r0, #6
	b _080171D2
_080170EC:
	movs r0, #7
	b _080171D2
_080170F0:
	movs r0, #8
	b _080171D2
_080170F4:
	movs r0, #9
	b _080171D2
_080170F8:
	movs r0, #0xa
	b _080171D2
_080170FC:
	movs r0, #0xb
	b _080171D2
_08017100:
	movs r0, #0xc
	b _080171D2
_08017104:
	movs r0, #0xd
	b _080171D2
_08017108:
	movs r0, #0xe
	b _080171D2
_0801710C:
	movs r0, #0xf
	b _080171D2
_08017110:
	movs r0, #0x10
	b _080171D2
_08017114:
	movs r0, #0x11
	b _080171D2
_08017118:
	movs r0, #0x12
	b _080171D2
_0801711C:
	movs r0, #0x13
	b _080171D2
_08017120:
	movs r0, #0x14
	b _080171D2
_08017124:
	movs r0, #0x15
	b _080171D2
_08017128:
	movs r0, #0x16
	b _080171D2
_0801712C:
	movs r0, #0x17
	b _080171D2
_08017130:
	movs r0, #0x18
	b _080171D2
_08017134:
	movs r0, #0x19
	b _080171D2
_08017138:
	movs r0, #0x1a
	b _080171D2
_0801713C:
	movs r0, #0x1b
	b _080171D2
_08017140:
	movs r0, #0x1c
	b _080171D2
_08017144:
	movs r0, #0x1d
	b _080171D2
_08017148:
	movs r0, #0x1e
	b _080171D2
_0801714C:
	movs r0, #0x1f
	b _080171D2
_08017150:
	movs r0, #0x20
	b _080171D2
_08017154:
	movs r0, #0x21
	b _080171D2
_08017158:
	movs r0, #0x22
	b _080171D2
_0801715C:
	movs r0, #0x23
	b _080171D2
_08017160:
	movs r0, #0x24
	b _080171D2
_08017164:
	movs r0, #0x25
	b _080171D2
_08017168:
	movs r0, #0x26
	b _080171D2
_0801716C:
	movs r0, #0x27
	b _080171D2
_08017170:
	movs r0, #0x28
	b _080171D2
_08017174:
	movs r0, #0x29
	b _080171D2
_08017178:
	movs r0, #0x2a
	b _080171D2
_0801717C:
	movs r0, #0x2b
	b _080171D2
_08017180:
	movs r0, #0x2c
	b _080171D2
_08017184:
	movs r0, #0x2d
	b _080171D2
_08017188:
	movs r0, #0x2e
	b _080171D2
_0801718C:
	movs r0, #0x2f
	b _080171D2
_08017190:
	movs r0, #0x30
	b _080171D2
_08017194:
	movs r0, #0x31
	b _080171D2
_08017198:
	movs r0, #0x32
	b _080171D2
_0801719C:
	movs r0, #0x33
	b _080171D2
_080171A0:
	movs r0, #0x34
	b _080171D2
_080171A4:
	movs r0, #0x35
	b _080171D2
_080171A8:
	movs r0, #0x36
	b _080171D2
_080171AC:
	movs r0, #0x37
	b _080171D2
_080171B0:
	movs r0, #0x38
	b _080171D2
_080171B4:
	movs r0, #0x39
	b _080171D2
_080171B8:
	movs r0, #0x3a
	b _080171D2
_080171BC:
	movs r0, #0x3b
	b _080171D2
_080171C0:
	movs r0, #0x3c
	b _080171D2
_080171C4:
	movs r0, #0x3d
	b _080171D2
_080171C8:
	movs r0, #0x3e
	b _080171D2
_080171CC:
	movs r0, #0x3f
	b _080171D2
_080171D0:
	movs r0, #0
_080171D2:
	bx lr

	thumb_func_start sub_080171D4
sub_080171D4: @ 0x080171D4
	adds r2, r0, #0
	cmp r1, #0
	ble _080171EA
	movs r3, #0x39
_080171DC:
	ldrb r0, [r2]
	eors r0, r3
	strb r0, [r2]
	adds r2, #1
	subs r1, #1
	cmp r1, #0
	bne _080171DC
_080171EA:
	bx lr

	thumb_func_start sub_080171EC
sub_080171EC: @ 0x080171EC
	push {r4, r5, r6, r7, lr}
	adds r6, r1, #0
	ldrb r7, [r0]
	movs r1, #0
	adds r4, r0, #1
	ldr r5, [r6]
	movs r2, #0
	subs r3, r5, #1
	cmp r1, r3
	bge _08017210
_08017200:
	adds r0, r4, r2
	ldrb r0, [r0]
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, #1
	cmp r2, r3
	blt _08017200
_08017210:
	subs r0, r5, #1
	str r0, [r6]
	mvns r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r7, r0
	beq _08017222
	movs r0, #0
	b _08017224
_08017222:
	adds r0, r4, #0
_08017224:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801722C
sub_0801722C: @ 0x0801722C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _08017264 @ =0xFFFFFA50
	add sp, r4
	mov sl, r2
	adds r7, r3, #0
	movs r2, #0
	mov sb, r2
	mov r8, r2
	ldr r3, _08017268 @ =0x000005A4
	add r3, sp
	movs r6, #0xb5
	lsls r6, r6, #3
	add r6, sp
	str r3, [r6]
	cmp r8, r1
	bge _0801728E
	mov r6, sp
	adds r5, r0, #0
	adds r4, r1, #0
_0801725A:
	cmp r7, #0
	beq _0801726C
	cmp r7, #1
	beq _08017270
	b _08017280
	.align 2, 0
_08017264: .4byte 0xFFFFFA50
_08017268: .4byte 0x000005A4
_0801726C:
	ldrh r0, [r5]
	b _0801727A
_08017270:
	ldrh r0, [r5]
	lsrs r1, r0, #8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x10
	orrs r0, r1
_0801727A:
	bl sub_08016B68
	strb r0, [r6]
_08017280:
	movs r0, #1
	add sb, r0
	adds r6, #1
	adds r5, #2
	subs r4, #1
	cmp r4, #0
	bne _0801725A
_0801728E:
	movs r0, #0xb4
	lsls r0, r0, #3
	add r0, sp
	movs r1, #0
	strh r1, [r0]
	add r4, sp, #0x2d0
	ldr r2, _080172D4 @ =0x01000168
	adds r1, r4, #0
	bl CpuSet
	mov r0, sp
	adds r1, r4, #0
	mov r2, sb
	movs r3, #0x40
	bl sub_080174E8
	adds r1, r0, #0
	ldr r5, _080172D8 @ =0x000005A4
	add r5, sp
	str r1, [r5]
	adds r0, r4, #0
	bl sub_080171D4
	adds r0, r4, #0
	movs r2, #0xb5
	lsls r2, r2, #3
	add r2, sp
	ldr r1, [r2]
	bl sub_080171EC
	adds r2, r0, #0
	cmp r2, #0
	bne _080172E0
	ldr r0, _080172DC @ =gUnk_09E3A790
	b _080172EC
	.align 2, 0
_080172D4: .4byte 0x01000168
_080172D8: .4byte 0x000005A4
_080172DC: .4byte gUnk_09E3A790
_080172E0:
	ldr r3, [r5]
	ldrb r6, [r5]
	ldrb r7, [r2]
	cmp r6, r7
	beq _080172FC
	ldr r0, _080172F8 @ =gUnk_09E3A7AC
_080172EC:
	bl OS_Printf
	movs r0, #1
	rsbs r0, r0, #0
	b _080173F6
	.align 2, 0
_080172F8: .4byte gUnk_09E3A7AC
_080172FC:
	adds r2, #1
	ldrb r1, [r2]
	ldr r0, _0801740C @ =0x00000201
	add r0, sl
	strb r1, [r0]
	subs r0, r3, #1
	str r0, [r5]
	adds r2, #1
	mov ip, r2
	movs r4, #0
	movs r0, #4
	rsbs r0, r0, #0
	mov sb, r0
	ldr r6, _08017410 @ =gUnk_09E3A660
	mov r1, r8
	lsls r0, r1, #1
	mov r2, sl
	adds r3, r0, r2
_08017320:
	asrs r0, r4, #2
	add r0, ip
	ldrb r1, [r0]
	adds r0, r4, #0
	cmp r4, #0
	bge _0801732E
	adds r0, r4, #3
_0801732E:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r4, r0
	lsls r0, r0, #1
	asrs r1, r0
	adds r0, r1, #0
	movs r5, #3
	ands r0, r5
	cmp r0, #0
	beq _08017366
	ldrh r2, [r6]
	subs r1, r0, #1
	movs r0, #3
	ands r1, r0
	mov r0, sb
	ldrb r7, [r3]
	ands r0, r7
	orrs r0, r1
	strb r0, [r3]
	lsls r2, r2, #2
	adds r0, r5, #0
	ldrh r1, [r3]
	ands r0, r1
	orrs r0, r2
	strh r0, [r3]
	adds r3, #2
	movs r2, #1
	add r8, r2
_08017366:
	adds r6, #2
	adds r4, #1
	cmp r4, #0x86
	bls _08017320
	movs r4, #0x22
	ldr r1, _08017414 @ =0x000005A4
	add r1, sp
	ldr r0, [r1]
	cmp r4, r0
	bge _080173EA
	ldr r5, _08017418 @ =0x000005A2
	add r5, sp
	movs r3, #4
	rsbs r3, r3, #0
	mov sb, r3
	ldr r6, _0801741C @ =0x000005AC
	add r6, sp
	str r1, [r6]
	mov r7, r8
	lsls r0, r7, #1
	mov r1, sl
	adds r3, r0, r1
_08017392:
	mov r2, ip
	adds r0, r2, r4
	movs r2, #1
	ands r2, r0
	lsls r2, r2, #3
	movs r1, #2
	rsbs r1, r1, #0
	ands r1, r0
	ldrh r6, [r1, #2]
	lsls r0, r6, #0x10
	ldrh r1, [r1]
	orrs r0, r1
	asrs r0, r2
	strh r0, [r5]
	ldr r1, [r5]
	lsls r2, r1, #0x14
	lsrs r2, r2, #0x12
	lsls r1, r1, #0x12
	lsrs r1, r1, #0x1e
	subs r1, #1
	adds r4, #2
	movs r0, #3
	ands r1, r0
	mov r0, sb
	ldrb r7, [r3]
	ands r0, r7
	orrs r0, r1
	strb r0, [r3]
	ldr r0, _08017420 @ =0x00003E9C
	adds r2, r2, r0
	movs r0, #3
	ldrh r1, [r3]
	ands r0, r1
	orrs r0, r2
	strh r0, [r3]
	adds r3, #2
	movs r2, #1
	add r8, r2
	ldr r6, _0801741C @ =0x000005AC
	add r6, sp
	ldr r6, [r6]
	ldr r0, [r6]
	cmp r4, r0
	blt _08017392
_080173EA:
	movs r0, #0x80
	lsls r0, r0, #2
	add r0, sl
	mov r7, r8
	strb r7, [r0]
	mov r0, r8
_080173F6:
	movs r3, #0xb6
	lsls r3, r3, #3
	add sp, r3
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801740C: .4byte 0x00000201
_08017410: .4byte gUnk_09E3A660
_08017414: .4byte 0x000005A4
_08017418: .4byte 0x000005A2
_0801741C: .4byte 0x000005AC
_08017420: .4byte 0x00003E9C

	thumb_func_start sub_08017424
sub_08017424: @ 0x08017424
	adds r2, r1, #0
	asrs r1, r2, #2
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r2, #0
	cmp r2, #0
	bge _08017434
	adds r0, r2, #3
_08017434:
	asrs r0, r0, #2
	lsls r0, r0, #2
	subs r0, r2, r0
	lsls r0, r0, #1
	asrs r1, r0
	movs r0, #3
	ands r1, r0
	adds r0, r1, #0
	bx lr
	.align 2, 0

	thumb_func_start sub_08017448
sub_08017448: @ 0x08017448
	movs r2, #1
	ands r2, r0
	lsls r2, r2, #3
	movs r1, #2
	rsbs r1, r1, #0
	ands r1, r0
	ldrh r3, [r1, #2]
	lsls r0, r3, #0x10
	ldrh r1, [r1]
	orrs r0, r1
	asrs r0, r2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr

	thumb_func_start sub_08017464
sub_08017464: @ 0x08017464
	movs r1, #0
	cmp r0, #0
	beq _08017472
_0801746A:
	asrs r0, r0, #1
	adds r1, #1
	cmp r0, #0
	bne _0801746A
_08017472:
	subs r0, r1, #1
	bx lr
	.align 2, 0

	thumb_func_start sub_08017478
sub_08017478: @ 0x08017478
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r7, r1, #0
	adds r4, r2, #0
	adds r0, r3, #0
	movs r5, #0
	subs r1, r0, #1
	mov r8, r1
	bl sub_08017464
	adds r6, r0, #0
	lsls r4, r4, #3
	adds r4, r4, r6
	subs r4, #1
	adds r0, r4, #0
	adds r1, r6, #0
	bl __divsi3
	adds r3, r0, #0
	muls r3, r6, r3
	cmp r5, r3
	bge _080174D2
	movs r4, #0xf
	mov ip, r4
_080174AE:
	asrs r0, r5, #4
	adds r2, r5, #0
	mov r1, ip
	ands r2, r1
	lsls r0, r0, #1
	add r0, sb
	ldrh r4, [r0, #2]
	lsls r1, r4, #0x10
	ldrh r0, [r0]
	orrs r1, r0
	asrs r1, r2
	mov r0, r8
	ands r1, r0
	strb r1, [r7]
	adds r7, #1
	adds r5, r5, r6
	cmp r5, r3
	blt _080174AE
_080174D2:
	adds r0, r5, #0
	adds r1, r6, #0
	bl __divsi3
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080174E8
sub_080174E8: @ 0x080174E8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	mov r8, r1
	adds r6, r2, #0
	adds r0, r3, #0
	movs r4, #0
	bl sub_08017464
	adds r7, r0, #0
	cmp r4, r6
	bge _08017532
	movs r0, #0xf
	mov ip, r0
	adds r3, r6, #0
_08017508:
	ldrb r2, [r5]
	adds r5, #1
	asrs r1, r4, #4
	adds r0, r4, #0
	mov r6, ip
	ands r0, r6
	lsls r1, r1, #1
	add r1, r8
	lsls r2, r0
	adds r0, r2, #0
	ldrh r6, [r1]
	orrs r0, r6
	strh r0, [r1]
	asrs r2, r2, #0x10
	ldrh r0, [r1, #2]
	orrs r2, r0
	strh r2, [r1, #2]
	adds r4, r4, r7
	subs r3, #1
	cmp r3, #0
	bne _08017508
_08017532:
	asrs r0, r4, #3
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08017540
sub_08017540: @ 0x08017540
	push {lr}
	sub sp, #0x14
	adds r2, r0, #0
	ldr r0, _08017570 @ =gUnk_02029250
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r0, r1
	movs r1, #0x52
	str r1, [sp]
	movs r1, #6
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	movs r1, #5
	str r1, [sp, #0x10]
	movs r1, #0xe0
	movs r2, #0x20
	movs r3, #8
	bl GL_InitScrollbar
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_08017570: .4byte gUnk_02029250

	thumb_func_start sub_08017574
sub_08017574: @ 0x08017574
	push {r4, lr}
	sub sp, #4
	ldr r1, _080175D8 @ =gUnk_02029250
	movs r4, #0
	str r4, [sp]
	ldr r2, _080175DC @ =0x050000C9
	mov r0, sp
	bl CpuSet
	bl sub_08014638
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0xfa
	lsls r0, r0, #5
	strh r0, [r1]
	adds r1, #8
	ldr r0, _080175E0 @ =0x00001C02
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080175E4 @ =0x00001D8C
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080175E8 @ =0x00001E8D
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080175EC @ =0x00001F8F
	strh r0, [r1]
	movs r1, #0x10
	rsbs r1, r1, #0
	movs r0, #0x3f
	bl sub_080146FC
	bl sub_080148D0
	bl GL_InitializeObjects
	bl sub_080156AC
	movs r0, #0
	bl sub_08019554
	ldr r0, _080175F0 @ =gUnk_0202348C
	strb r4, [r0]
	movs r0, #1
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080175D8: .4byte gUnk_02029250
_080175DC: .4byte 0x050000C9
_080175E0: .4byte 0x00001C02
_080175E4: .4byte 0x00001D8C
_080175E8: .4byte 0x00001E8D
_080175EC: .4byte 0x00001F8F
_080175F0: .4byte gUnk_0202348C

	thumb_func_start sub_080175F4
sub_080175F4: @ 0x080175F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov sb, r1
	mov sl, r2
	str r3, [sp]
	ldr r2, [sp, #0x24]
	ldr r0, [sp, #0x28]
	cmp r0, #0x20
	beq _08017616
	cmp r0, #0x80
	beq _0801762A
	b _0801769E
_08017616:
	mov r0, sb
	adds r0, #1
	mov r1, sl
	adds r1, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r3, r7, #0
	bl sub_080F2A7C
	b _0801769E
_0801762A:
	movs r0, #1
	rsbs r0, r0, #0
	add r0, sb
	mov r8, r0
	mov r5, sl
	subs r5, #1
	lsls r4, r2, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
	mov r0, sb
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
	mov r6, sb
	adds r6, #1
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
	mov r0, r8
	mov r1, sl
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
	adds r0, r6, #0
	mov r1, sl
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
	adds r5, #2
	mov r0, r8
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
	mov r0, sb
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
_0801769E:
	ldr r0, [sp]
	lsls r2, r0, #0x10
	lsrs r2, r2, #0x10
	mov r0, sb
	mov r1, sl
	adds r3, r7, #0
	bl sub_080F2A7C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080176C0
sub_080176C0: @ 0x080176C0
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x38
	mov sb, r0
	mov sl, r1
	adds r4, r2, #0
	ldr r5, _08017778 @ =gUnk_02029250
	add r0, sp, #0x24
	mov r8, r0
	mov r1, r8
	ldr r0, _0801777C @ =gUnk_09E3AFC8
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldr r0, [r0]
	str r0, [r1]
	add r6, sp, #0x34
	ldr r1, _08017780 @ =gUnk_09E3AFD8
	adds r0, r6, #0
	movs r2, #4
	bl memcpy
	mov r0, sp
	bl sub_08015FC8
	adds r5, #0x88
	ldr r0, [r5]
	str r0, [sp]
	mov r2, sp
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r1, [r2, #0x14]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #0x14]
	mov r1, sp
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x18]
	ands r0, r2
	strb r0, [r1, #0x18]
	add r6, sb
	ldrb r6, [r6]
	adds r4, r6, r4
	movs r0, #0x7f
	ands r4, r0
	lsls r4, r4, #7
	ldr r0, _08017784 @ =0xFFFFC07F
	ldrh r3, [r1, #0x18]
	ands r0, r3
	orrs r0, r4
	strh r0, [r1, #0x18]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x40
	ldrb r6, [r1, #0x17]
	orrs r0, r6
	strb r0, [r1, #0x17]
	mov r0, sb
	lsls r0, r0, #2
	mov sb, r0
	add r8, sb
	mov r1, r8
	ldr r0, [r1]
	str r0, [sp, #0x20]
	movs r0, #0xf4
	lsls r0, r0, #4
	str r0, [sp, #0xc]
	mov r1, sp
	mov r2, sl
	lsls r2, r2, #7
	movs r0, #0x7f
	ldrb r3, [r1, #0x17]
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #0x17]
	ldr r0, _08017788 @ =0x0000FFFF
	strh r0, [r1, #0x10]
	mov r0, sp
	bl sub_08016A7C
	add sp, #0x38
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08017778: .4byte gUnk_02029250
_0801777C: .4byte gUnk_09E3AFC8
_08017780: .4byte gUnk_09E3AFD8
_08017784: .4byte 0xFFFFC07F
_08017788: .4byte 0x0000FFFF

	thumb_func_start sub_0801778C
sub_0801778C: @ 0x0801778C
	push {lr}
	movs r2, #0
	bl sub_080176C0
	pop {r0}
	bx r0

	thumb_func_start sub_08017798
sub_08017798: @ 0x08017798
	push {lr}
	ldr r0, _080177D0 @ =0x06000020
	movs r1, #0x16
	movs r2, #0xc
	bl sub_080F42B4
	ldr r2, _080177D4 @ =gUnk_02006ED0
	movs r0, #0x20
	ldrb r1, [r2, #0x15]
	orrs r0, r1
	strb r0, [r2, #0x15]
	movs r1, #2
	ldrb r0, [r2, #8]
	orrs r1, r0
	strb r1, [r2, #8]
	ldr r3, _080177D8 @ =gUnk_09E5F854
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r2, #4]
	pop {r0}
	bx r0
	.align 2, 0
_080177D0: .4byte 0x06000020
_080177D4: .4byte gUnk_02006ED0
_080177D8: .4byte gUnk_09E5F854

	thumb_func_start sub_080177DC
sub_080177DC: @ 0x080177DC
	push {r4, lr}
	adds r4, r3, #0
	lsls r0, r0, #5
	ldr r3, _08017824 @ =0x06010000
	adds r0, r0, r3
	bl sub_080F42B4
	ldr r2, _08017828 @ =gUnk_02006ED0
	movs r0, #0x20
	ldrb r1, [r2, #0x15]
	orrs r0, r1
	strb r0, [r2, #0x15]
	movs r0, #1
	ands r4, r0
	lsls r4, r4, #1
	movs r0, #3
	rsbs r0, r0, #0
	ldrb r3, [r2, #8]
	ands r0, r3
	orrs r0, r4
	strb r0, [r2, #8]
	ldr r3, _0801782C @ =gUnk_09E5F854
	lsls r1, r0, #0x1e
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldr r0, [r1]
	str r0, [r2, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08017824: .4byte 0x06010000
_08017828: .4byte gUnk_02006ED0
_0801782C: .4byte gUnk_09E5F854

	thumb_func_start sub_08017830
sub_08017830: @ 0x08017830
	push {lr}
	sub sp, #0x14
	bl GL_GetBg0ScreenBasePtr
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0
	movs r1, #0
	movs r2, #0x16
	movs r3, #0xc
	bl sub_080F00CC
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801785C
sub_0801785C: @ 0x0801785C
	push {r4, r5, r6, r7, lr}
	mov r7, sp
	adds r5, r0, #0
	adds r4, r1, #0
	mov r6, sp
	bl GL_Strlen
	adds r1, r4, #0
	bl __modsi3
	adds r1, r0, #0
	cmp r1, #0
	beq _080178AC
	adds r0, r4, #1
	lsls r0, r0, #3
	lsrs r0, r0, #3
	adds r0, #3
	lsrs r0, r0, #2
	lsls r0, r0, #2
	mov r2, sp
	subs r2, r2, r0
	mov sp, r2
	mov r3, sp
	movs r2, #0
	subs r1, r4, r1
	cmp r2, r1
	bge _0801789E
	movs r4, #0x20
_08017894:
	adds r0, r3, r2
	strb r4, [r0]
	adds r2, #1
	cmp r2, r1
	blt _08017894
_0801789E:
	adds r1, r3, r2
	movs r0, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r1, r5, #0
	bl GL_Strcat
_080178AC:
	mov sp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	@ Crass Clown
	@ Crawling Dragon
	thumb_func_start gEngineEffectReturnToHandChangePosition_080178B4
gEngineEffectReturnToHandChangePosition_080178B4: @ 0x080178B4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r5, _08017930 @ =gUnk_02029250
	ldr r0, _08017934 @ =0x00001004 (Crawling Dragon (None))
	bl GetInterfaceTextIdIndex
	ldr r1, _08017938 @ =gInterfaceTextOffsets
	mov r8, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r4, _0801793C @ =gUnk_02000000
	ldr r2, _08017940 @ =0x00006C2C
	adds r4, r4, r2
	ldrb r2, [r4]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldr r0, [r1]
	ldr r6, _08017944 @ =gInterfaceText
	adds r0, r0, r6
	adds r5, #0x8d
	adds r1, r5, #0
	bl GL_Strcpy
	adds r0, r5, #0
	movs r1, #0xc
	bl sub_0801785C
	ldr r0, _08017948 @ =0x00001005 (Crass Clown)
	bl GetInterfaceTextIdIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrb r4, [r4]
	lsls r0, r4, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	adds r1, r5, #0
	bl GL_Strcat
	adds r0, r5, #0
	movs r1, #0xc
	bl sub_0801785C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08017930: .4byte gUnk_02029250
_08017934: .4byte 0x00001004 @ Crawling Dragon (None)
_08017938: .4byte gInterfaceTextOffsets
_0801793C: .4byte gUnk_02000000
_08017940: .4byte 0x00006C2C
_08017944: .4byte gInterfaceText
_08017948: .4byte 0x00001005 @ Crass Clown

	thumb_func_start sub_0801794C
sub_0801794C: @ 0x0801794C
	push {r4, lr}
	ldr r4, _08017990 @ =gUnk_02029250
	ldr r0, _08017994 @ =0x00001006 (Armored Zombie)
	bl GetInterfaceTextIdIndex
	ldr r2, _08017998 @ =gInterfaceTextOffsets
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801799C @ =gUnk_02000000
	ldr r3, _080179A0 @ =0x00006C2C
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, _080179A4 @ =gInterfaceText
	adds r0, r0, r1
	adds r4, #0x8d
	adds r1, r4, #0
	bl GL_Strcpy
	adds r0, r4, #0
	movs r1, #0xc
	bl sub_0801785C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08017990: .4byte gUnk_02029250
_08017994: .4byte 0x00001006 @ Armored Zombie
_08017998: .4byte gInterfaceTextOffsets
_0801799C: .4byte gUnk_02000000
_080179A0: .4byte 0x00006C2C
_080179A4: .4byte gInterfaceText

	thumb_func_start sub_080179A8
sub_080179A8: @ 0x080179A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	mov sb, r1
	mov sl, r2
	str r3, [sp, #8]
	ldr r5, [r2]
	ldr r7, [r3]
	lsls r6, r0, #0x10
	lsrs r0, r6, #0x10
	bl sub_080F0188
	cmp r0, #0
	beq _08017A06
	mov r4, sp
	mov r0, sp
	movs r1, #0
	movs r2, #3
	bl memset
	lsrs r0, r6, #0x18
	strb r0, [r4]
	mov r0, r8
	strb r0, [r4, #1]
	mov r0, sp
	mov r1, sb
	bl GL_Strcat
	adds r5, #1
	adds r7, #1
	cmp r5, #0xb
	bne _08017A06
	add r4, sp, #4
	ldr r1, _08017A20 @ =gUnk_09E3B2B4
	adds r0, r4, #0
	movs r2, #3
	bl memcpy
	adds r0, r4, #0
	mov r1, sb
	bl GL_Strcat
	movs r5, #0
_08017A06:
	mov r0, sl
	str r5, [r0]
	ldr r0, [sp, #8]
	str r7, [r0]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017A20: .4byte gUnk_09E3B2B4

	thumb_func_start sub_08017A24
sub_08017A24: @ 0x08017A24
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _08017A54 @ =gUnk_02029250
	adds r7, r1, #0
	adds r7, #0x8d
	movs r0, #0
	str r0, [sp]
	movs r2, #0xc5
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r2, r0, #0x1c
	ldr r0, _08017A58 @ =0x00000315
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r0, r1, #0x1a
	lsrs r3, r0, #0x1c
	cmp r2, #5
	ble _08017A5C
	subs r1, r2, #1
	lsls r0, r1, #2
	adds r0, r0, r1
	b _08017A60
	.align 2, 0
_08017A54: .4byte gUnk_02029250
_08017A58: .4byte 0x00000315
_08017A5C:
	lsls r0, r2, #2
	adds r0, r0, r2
_08017A60:
	adds r6, r0, r3
	ldr r1, _08017B14 @ =gUnk_09E587F0
	lsls r0, r6, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r7, #0
	bl GL_Strcpy
	str r0, [sp]
	lsls r0, r6, #1
	ldr r3, _08017B18 @ =gUnk_09E3B251
	adds r1, r0, #1
	adds r1, r1, r3
	adds r2, r0, r3
	ldrb r2, [r2]
	lsls r4, r2, #8
	ldrb r1, [r1]
	orrs r4, r1
	adds r1, r0, #3
	adds r1, r1, r3
	adds r0, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r5, r0, #8
	ldrb r1, [r1]
	orrs r5, r1
	movs r0, #0
	str r0, [sp, #4]
	cmp r4, r5
	bge _08017AAE
_08017A9C:
	adds r0, r4, #0
	adds r1, r7, #0
	mov r2, sp
	add r3, sp, #4
	bl sub_080179A8
	adds r4, #1
	cmp r4, r5
	blt _08017A9C
_08017AAE:
	cmp r6, #0x2d
	bne _08017ABE
	ldr r0, _08017B1C @ =0x0000E3A9
	add r3, sp, #4
	adds r1, r7, #0
	mov r2, sp
	bl sub_080179A8
_08017ABE:
	ldr r0, [sp, #4]
	adds r0, #0xb
	movs r1, #0xc
	bl __divsi3
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017B20 @ =0x00000117
	cmp r1, r0
	bls _08017AE0
	ldr r0, _08017B24 @ =gUnk_09E3B2B8
	ldr r1, _08017B28 @ =0x00000189
	ldr r2, _08017B2C @ =gUnk_09E3B2D0
	movs r3, #1
	bl OSi_Panic
_08017AE0:
	ldr r4, _08017B30 @ =gUnk_09E3B338
	ldr r0, [sp, #4]
	adds r0, #0xb
	movs r1, #0xc
	bl __divsi3
	lsls r2, r0, #1
	adds r2, r2, r0
	lsls r2, r2, #2
	movs r1, #0x8c
	lsls r1, r1, #1
	subs r1, r1, r2
	adds r0, r4, #0
	bl OS_Printf
	adds r0, r7, #0
	bl GL_Strlen
	cmp r0, #0x3b
	bgt _08017B34
	adds r0, r7, #0
	movs r1, #0x3c
	bl sub_0801785C
	b _08017B3C
	.align 2, 0
_08017B14: .4byte gUnk_09E587F0
_08017B18: .4byte gUnk_09E3B251
_08017B1C: .4byte 0x0000E3A9
_08017B20: .4byte 0x00000117
_08017B24: .4byte gUnk_09E3B2B8
_08017B28: .4byte 0x00000189
_08017B2C: .4byte gUnk_09E3B2D0
_08017B30: .4byte gUnk_09E3B338
_08017B34:
	adds r0, r7, #0
	movs r1, #0xc
	bl sub_0801785C
_08017B3C:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	@ Clown Zombie
	@ Dragon Zombie
	@ Mask of Darkness
	thumb_func_start gEngineEffectSearchGraveyard_08017B44
gEngineEffectSearchGraveyard_08017B44: @ 0x08017B44
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08017C54 @ =gUnk_02029250
	mov r8, r0
	ldr r0, _08017C58 @ =0x00001008 (Clown Zombie)
	bl GetInterfaceTextIdIndex
	ldr r7, _08017C5C @ =gInterfaceTextOffsets
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r6, _08017C60 @ =gUnk_02000000
	ldr r2, _08017C64 @ =0x00006C2C
	adds r6, r6, r2
	ldrb r2, [r6]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldr r4, [r1]
	ldr r0, _08017C68 @ =gInterfaceText
	mov sb, r0
	add r4, sb
	adds r0, r4, #0
	movs r1, #0xa
	bl GL_StrWidth
	ldr r1, _08017C6C @ =0x00000321
	add r1, r8
	movs r2, #0
	mov sl, r2
	strb r0, [r1]
	movs r5, #0xbe
	lsls r5, r5, #1
	adds r0, r5, #0
	movs r1, #0xc
	bl sub_08018400
	mov r0, sl
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #6
	movs r3, #2
	bl sub_080183D0
	ldr r0, _08017C70 @ =0x00001007 (Dragon Zombie)
	bl GetInterfaceTextIdIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrb r2, [r6]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldr r4, [r1]
	add r4, sb
	adds r0, r4, #0
	movs r1, #0xa
	bl GL_StrWidth
	movs r1, #0xc8
	lsls r1, r1, #2
	add r1, r8
	strb r0, [r1]
	subs r5, #0xc
	adds r0, r5, #0
	movs r1, #0xc
	bl sub_08018400
	mov r0, sl
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #6
	movs r3, #2
	bl sub_080183D0
	ldr r0, _08017C74 @ =0x0000100C (Mask of Darkness)
	bl GetInterfaceTextIdIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrb r6, [r6]
	lsls r0, r6, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldr r4, [r1]
	add r4, sb
	adds r0, r4, #0
	movs r1, #0xa
	bl GL_StrWidth
	ldr r1, _08017C78 @ =0x00000322
	add r8, r1
	mov r2, r8
	strb r0, [r2]
	adds r5, #0x18
	adds r0, r5, #0
	movs r1, #0xc
	bl sub_08018400
	mov r0, sl
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #6
	movs r3, #2
	bl sub_080183D0
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017C54: .4byte gUnk_02029250
_08017C58: .4byte 0x00001008 @ Clown Zombie
_08017C5C: .4byte gInterfaceTextOffsets
_08017C60: .4byte gUnk_02000000
_08017C64: .4byte 0x00006C2C
_08017C68: .4byte gInterfaceText
_08017C6C: .4byte 0x00000321
_08017C70: .4byte 0x00001007 @ Dragon Zombie
_08017C74: .4byte 0x0000100C @ Mask of Darkness
_08017C78: .4byte 0x00000322

	thumb_func_start gEngineEffectReturnToHandChangePosition_08017C7C
gEngineEffectReturnToHandChangePosition_08017C7C: @ 0x08017C7C
	push {lr}
	ldr r1, _08017C90 @ =gUnk_02029250
	cmp r0, #1
	beq _08017CB8
	cmp r0, #1
	bgt _08017C94
	cmp r0, #0
	beq _08017CB2
	b _08017CBC
	.align 2, 0
_08017C90: .4byte gUnk_02029250
_08017C94:
	cmp r0, #2
	beq _08017C9E
	cmp r0, #3
	beq _08017CAC
	b _08017CBC
_08017C9E:
	ldr r0, _08017CA8 @ =gUnk_09E3AFDC
	adds r1, #0x8d
	bl GL_Strcpy
	b _08017CBC
	.align 2, 0
_08017CA8: .4byte gUnk_09E3AFDC
_08017CAC:
	bl sub_08017A24
	b _08017CBC
_08017CB2:
	bl gEngineEffectReturnToHandChangePosition_080178B4
	b _08017CBC
_08017CB8:
	bl sub_0801794C
_08017CBC:
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08017CC4
sub_08017CC4: @ 0x08017CC4
	ldr r1, _08017CCC @ =0x04000012
	subs r0, #0x28
	strh r0, [r1]
	bx lr
	.align 2, 0
_08017CCC: .4byte 0x04000012

	thumb_func_start sub_08017CD0
sub_08017CD0: @ 0x08017CD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	mov sl, r2
	mov sb, r3
	ldr r0, [sp, #0x30]
	mov r8, r0
	movs r7, #0
	ldr r3, [sp, #0xc]
	ldr r5, [r3]
	ldrb r2, [r5]
	cmp r2, #0
	beq _08017D4E
	cmp r7, r8
	bge _08017D4E
	add r4, sp, #8
	adds r6, r1, #0
_08017CFA:
	movs r1, #7
	ldr r0, _08017D1C @ =gUnk_02006C2C
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _08017D20
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08017D20
	strb r2, [r4]
	ldrb r0, [r5, #1]
	strb r0, [r4, #1]
	strb r1, [r4, #2]
	movs r0, #2
	b _08017D2A
	.align 2, 0
_08017D1C: .4byte gUnk_02006C2C
_08017D20:
	ldrb r0, [r5]
	strb r0, [r4]
	movs r0, #0
	strb r0, [r4, #1]
	movs r0, #1
_08017D2A:
	adds r5, r5, r0
	movs r0, #8
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	add r0, sp, #8
	adds r1, r6, #0
	mov r2, sl
	movs r3, #7
	bl sub_080175F4
	add r6, sb
	adds r7, #1
	ldrb r2, [r5]
	cmp r2, #0
	beq _08017D4E
	cmp r7, r8
	blt _08017CFA
_08017D4E:
	ldr r3, [sp, #0xc]
	str r5, [r3]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start gEngineEffectReturnToHandChangePosition_08017D64
gEngineEffectReturnToHandChangePosition_08017D64: @ 0x08017D64
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x20
	ldr r1, _08017E34 @ =gUnk_02029250
	mov sb, r1
	movs r2, #0x8d
	add r2, sb
	mov r8, r2
	str r2, [sp, #0x1c]
	movs r5, #0
	movs r7, #0x10
	ldr r1, _08017E38 @ =gUnk_02000000
	ldr r2, _08017E3C @ =0x00006C2C
	adds r1, r1, r2
	movs r2, #7
	ldrb r1, [r1]
	ands r2, r1
	rsbs r1, r2, #0
	orrs r1, r2
	asrs r6, r1, #0x1f
	movs r1, #2
	ands r6, r1
	bl gEngineEffectReturnToHandChangePosition_08017C7C
	bl sub_08017798
	str r5, [sp, #0x14]
	bl GL_GetBg0ScreenBasePtr
	adds r1, r0, #0
	ldr r2, _08017E40 @ =0x01000200
	add r0, sp, #0x14
	bl CpuFastSet
	str r5, [sp, #0x18]
	add r4, sp, #0x18
	bl GL_GetBg0CharBasePtr
	adds r1, r0, #0
	ldr r2, _08017E44 @ =0x01001800
	adds r0, r4, #0
	bl CpuFastSet
	movs r4, #2
_08017DC0:
	ldr r0, [sp, #0x1c]
	ldrb r0, [r0]
	cmp r0, #0
	beq _08017DE0
	movs r0, #0xc
	str r0, [sp]
	add r0, sp, #0x1c
	adds r1, r6, #2
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_08017CD0
	adds r4, r4, r7
	adds r5, #1
	cmp r5, #5
	bne _08017DC0
_08017DE0:
	mov r0, r8
	str r0, [sp, #0x1c]
	bl GL_Strlen
	adds r0, #0xb
	movs r1, #0xc
	bl __divsi3
	movs r1, #0xc6
	lsls r1, r1, #2
	add r1, sb
	movs r4, #0
	strb r0, [r1]
	ldrb r0, [r1]
	bl sub_08017540
	movs r0, #0
	bl sub_08017CC4
	bl GL_GetBg0ScreenBasePtr
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0
	movs r1, #0
	movs r2, #0x16
	movs r3, #0xc
	bl sub_080F00CC
	add sp, #0x20
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017E34: .4byte gUnk_02029250
_08017E38: .4byte gUnk_02000000
_08017E3C: .4byte 0x00006C2C
_08017E40: .4byte 0x01000200
_08017E44: .4byte 0x01001800

	thumb_func_start sub_08017E48
sub_08017E48: @ 0x08017E48
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _08017E7C @ =gUnk_02029250
	adds r2, r0, #0
	adds r2, #0x8d
	ldr r0, _08017E80 @ =gUnk_02000000
	ldr r1, _08017E84 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	movs r4, #1
	cmp r1, #0
	bne _08017E66
	movs r4, #2
_08017E66:
	movs r1, #0
	ldrb r0, [r2]
	cmp r0, #0
	beq _08017E92
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r3, r0, #2
_08017E74:
	cmp r1, r3
	bne _08017E88
	adds r0, r2, #0
	b _08017E94
	.align 2, 0
_08017E7C: .4byte gUnk_02029250
_08017E80: .4byte gUnk_02000000
_08017E84: .4byte 0x00006C2C
_08017E88:
	adds r2, r2, r4
	adds r1, #1
	ldrb r0, [r2]
	cmp r0, #0
	bne _08017E74
_08017E92:
	movs r0, #0
_08017E94:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08017E9C
sub_08017E9C: @ 0x08017E9C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #4]
	movs r5, #2
	movs r0, #0x2c
	adds r1, r4, #0
	muls r1, r0, r1
	adds r1, #1
	lsls r1, r1, #5
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	ldr r2, _08017EF8 @ =0x05000160
	add r0, sp, #4
	bl CpuSet
	bl sub_08017798
	ldr r1, _08017EFC @ =gUnk_02000000
	ldr r0, _08017F00 @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	asrs r1, r1, #0x1f
	ands r1, r5
	adds r1, #2
	add r0, sp, #8
	lsls r4, r4, #4
	adds r4, #2
	movs r2, #0xc
	str r2, [sp]
	adds r2, r4, #0
	movs r3, #0x10
	bl sub_08017CD0
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08017EF8: .4byte 0x05000160
_08017EFC: .4byte gUnk_02000000
_08017F00: .4byte 0x00006C2C

	thumb_func_start sub_08017F04
sub_08017F04: @ 0x08017F04
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	adds r6, r0, #0
	ldr r0, _08017F88 @ =gUnk_02029250
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r0, r1
	bl GL_GetScrollCursorIndex
	adds r4, r0, #0
	movs r0, #0
	mov r8, r0
	subs r0, #1
	cmp r6, r0
	beq _08017F2C
	cmp r6, #1
	bne _08017F4E
	adds r4, #4
_08017F2C:
	adds r0, r4, #0
	bl sub_08017E48
	mov r8, r0
	adds r0, r4, #0
	movs r1, #6
	bl __modsi3
	adds r7, r0, #0
	lsls r4, r4, #1
	adds r0, r4, #0
	cmp r4, #0
	bge _08017F48
	adds r0, #0x1f
_08017F48:
	asrs r5, r0, #5
	lsls r0, r5, #5
	subs r5, r4, r0
_08017F4E:
	mov r1, r8
	cmp r1, #0
	beq _08017F7A
	mov r0, r8
	adds r1, r7, #0
	bl sub_08017E9C
	bl GL_GetBg0ScreenBasePtr
	lsls r1, r7, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	str r5, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0
	movs r2, #0x16
	movs r3, #2
	bl sub_080F00CC
_08017F7A:
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017F88: .4byte gUnk_02029250

	thumb_func_start sub_08017F8C
sub_08017F8C: @ 0x08017F8C
	ldr r0, _08017F9C @ =gUnk_02029250
	ldr r1, _08017FA0 @ =0x0000031A
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_08017F9C: .4byte gUnk_02029250
_08017FA0: .4byte 0x0000031A

	thumb_func_start sub_08017FA4
sub_08017FA4: @ 0x08017FA4
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08017FD4 @ =gUnk_02029250
	cmp r4, #1
	beq _08017FC4
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08017FC4
	ldr r0, _08017FD8 @ =gUnk_09E3B2B8
	movs r1, #0x92
	lsls r1, r1, #2
	ldr r2, _08017FDC @ =gUnk_09E3B348
	movs r3, #1
	bl OSi_Panic
_08017FC4:
	lsls r1, r4, #2
	ldr r2, _08017FE0 @ =0x0000031A
	adds r0, r5, r2
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08017FD4: .4byte gUnk_02029250
_08017FD8: .4byte gUnk_09E3B2B8
_08017FDC: .4byte gUnk_09E3B348
_08017FE0: .4byte 0x0000031A

	thumb_func_start sub_08017FE4
sub_08017FE4: @ 0x08017FE4
	push {r4, lr}
	ldr r4, _08018014 @ =gUnk_02029250
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r4, r1
	bl GL_GetScrollCursorIndex
	lsls r3, r0, #4
	ldr r0, _08018018 @ =0x0000031A
	adds r2, r4, r0
	ldrb r0, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	cmp r1, #0
	beq _0801803E
	cmp r1, #0
	ble _0801801C
	cmp r1, #0
	ble _0801801C
	subs r0, #1
	strb r0, [r2]
	movs r1, #1
	subs r3, #0x10
	b _08018026
	.align 2, 0
_08018014: .4byte gUnk_02029250
_08018018: .4byte 0x0000031A
_0801801C:
	adds r0, #1
	strb r0, [r2]
	movs r1, #1
	rsbs r1, r1, #0
	adds r3, #0x10
_08018026:
	ldr r2, _08018058 @ =0x0000031A
	adds r0, r4, r2
	movs r2, #0
	ldrsb r2, [r0, r2]
	cmp r2, #0
	bge _08018034
	rsbs r2, r2, #0
_08018034:
	movs r0, #4
	subs r0, r0, r2
	lsls r1, r1, #2
	muls r0, r1, r0
	adds r3, r3, r0
_0801803E:
	adds r0, r3, #0
	movs r1, #0xff
	bl __modsi3
	adds r4, r0, #0
	bl sub_08017CC4
	adds r0, r4, #0
	bl sub_08018248
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018058: .4byte 0x0000031A

	thumb_func_start sub_0801805C
sub_0801805C: @ 0x0801805C
	ldr r0, _0801807C @ =gUnk_02029250
	ldr r1, _08018080 @ =0x0000031F
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r1, _08018084 @ =gUnk_02000000
	ldr r0, _08018088 @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801808C
	movs r0, #0
	cmp r2, #7
	ble _08018094
	b _08018092
	.align 2, 0
_0801807C: .4byte gUnk_02029250
_08018080: .4byte 0x0000031F
_08018084: .4byte gUnk_02000000
_08018088: .4byte 0x00006C2C
_0801808C:
	movs r0, #0
	cmp r2, #0xe
	ble _08018094
_08018092:
	movs r0, #1
_08018094:
	bx lr
	.align 2, 0

	thumb_func_start sub_08018098
sub_08018098: @ 0x08018098
	push {lr}
	bl sub_0801805C
	movs r1, #0x48
	cmp r0, #0
	beq _080180A6
	movs r1, #0x34
_080180A6:
	adds r0, r1, #0
	pop {r1}
	bx r1

	thumb_func_start gEngineEffectSearchReturnToHand_080180AC
gEngineEffectSearchReturnToHand_080180AC: @ 0x080180AC
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x6c
	ldr r7, _08018190 @ =gUnk_02029250
	add r1, sp, #0x14
	ldr r0, _08018194 @ =gUnk_09E3B3D0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r7, #4
	adds r2, r7, #0
	adds r2, #8
	movs r0, #0
	mov sb, r0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	add r3, sp, #0x14
	str r3, [sp, #8]
	mov r4, sb
	str r4, [sp, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	adds r0, r7, #0
	movs r3, #0
	bl sub_08015D30
	add r4, sp, #0x24
	adds r0, r4, #0
	bl sub_08015FC8
	ldr r0, _08018198 @ =gUnk_09E3B3E0
	movs r1, #0
	bl GL_OpenFile
	str r0, [sp, #0x24]
	movs r5, #0x10
	rsbs r5, r5, #0
	adds r0, r5, #0
	ldrb r1, [r4, #0x14]
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x14]
	movs r2, #0x80
	rsbs r2, r2, #0
	mov r8, r2
	mov r0, r8
	ldrb r3, [r4, #0x18]
	ands r0, r3
	strb r0, [r4, #0x18]
	ldr r6, _0801819C @ =0xFFFFC07F
	adds r0, r6, #0
	ldrh r1, [r4, #0x18]
	ands r0, r1
	strh r0, [r4, #0x18]
	mov r2, sb
	str r2, [r4, #8]
	movs r0, #0xf8
	lsls r0, r0, #3
	str r0, [r4, #0xc]
	strh r2, [r4, #0x10]
	adds r0, r4, #0
	bl sub_08016A7C
	add r4, sp, #0x48
	adds r0, r4, #0
	bl sub_08015FC8
	ldr r0, _080181A0 @ =gUnk_09E3B3FC
	movs r1, #0
	bl GL_OpenFile
	str r0, [sp, #0x48]
	ldrb r3, [r4, #0x14]
	ands r5, r3
	movs r0, #2
	orrs r5, r0
	strb r5, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	mov r1, r8
	ands r0, r1
	strb r0, [r4, #0x18]
	ldrh r2, [r4, #0x18]
	ands r6, r2
	strh r6, [r4, #0x18]
	mov r3, sb
	str r3, [r4, #8]
	movs r0, #0x40
	str r0, [r4, #0xc]
	strh r3, [r4, #0x10]
	adds r0, r4, #0
	bl sub_08016A7C
	ldr r0, _080181A4 @ =gUnk_09E3B418
	movs r1, #0
	bl GL_OpenFile
	adds r1, r7, #0
	adds r1, #0x88
	str r0, [r1]
	bl sub_0801805C
	cmp r0, #0
	beq _080181A8
	movs r0, #1
	movs r1, #0
	bl sub_0801778C
	b _080181B0
	.align 2, 0
_08018190: .4byte gUnk_02029250
_08018194: .4byte gUnk_09E3B3D0
_08018198: .4byte gUnk_09E3B3E0
_0801819C: .4byte 0xFFFFC07F
_080181A0: .4byte gUnk_09E3B3FC
_080181A4: .4byte gUnk_09E3B418
_080181A8:
	movs r0, #0
	movs r1, #0
	bl sub_0801778C
_080181B0:
	movs r0, #2
	movs r1, #1
	bl sub_0801778C
	ldr r4, _08018228 @ =gUnk_09CCD290
	ldr r1, _0801822C @ =0x05000020
	ldr r5, _08018230 @ =0x04000008
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuSet
	ldr r1, _08018234 @ =0x05000220
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuSet
	bl sub_08017830
	ldr r1, _08018238 @ =gUnk_02000000
	ldr r4, _0801823C @ =0x00006C2C
	adds r1, r1, r4
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080181F8
	movs r1, #0xc5
	lsls r1, r1, #2
	adds r0, r7, r1
	movs r1, #0x39
	rsbs r1, r1, #0
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r0]
_080181F8:
	movs r3, #0xc5
	lsls r3, r3, #2
	adds r0, r7, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	bl gEngineEffectReturnToHandChangePosition_08017D64
	ldr r0, _08018240 @ =0x05000202
	ldr r4, _08018244 @ =0x000002BE
	adds r1, r7, r4
	movs r2, #2
	bl CpuSet
	bl gEngineEffectSearchGraveyard_08017B44
	movs r0, #1
	add sp, #0x6c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08018228: .4byte gUnk_09CCD290
_0801822C: .4byte 0x05000020
_08018230: .4byte 0x04000008
_08018234: .4byte 0x05000220
_08018238: .4byte gUnk_02000000
_0801823C: .4byte 0x00006C2C
_08018240: .4byte 0x05000202
_08018244: .4byte 0x000002BE

	thumb_func_start sub_08018248
sub_08018248: @ 0x08018248
	ldr r1, _08018250 @ =0x0400001E
	subs r0, #8
	strh r0, [r1]
	bx lr
	.align 2, 0
_08018250: .4byte 0x0400001E

	thumb_func_start sub_08018254
sub_08018254: @ 0x08018254
	ldr r1, _0801825C @ =0x04000016
	subs r0, #4
	strh r0, [r1]
	bx lr
	.align 2, 0
_0801825C: .4byte 0x04000016

	thumb_func_start sub_08018260
sub_08018260: @ 0x08018260
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r7, _080182AC @ =gUnk_02029250
	lsls r2, r2, #0xc
	str r2, [sp, #0x20]
	lsls r3, r3, #0xc
	str r3, [sp, #0x24]
	lsls r5, r4, #2
	adds r0, r5, r7
	ldr r0, [r0]
	bl sub_08015718
	cmp r4, r0
	blt _0801828E
	ldr r0, _080182B0 @ =gUnk_09E3B2B8
	movs r1, #0xb8
	lsls r1, r1, #2
	ldr r2, _080182B4 @ =gUnk_09E3B434
	movs r3, #1
	bl OSi_Panic
_0801828E:
	adds r0, r7, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _080182B8
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r4, #0
	bl sub_0801571C
	b _080182C2
	.align 2, 0
_080182AC: .4byte gUnk_02029250
_080182B0: .4byte gUnk_09E3B2B8
_080182B4: .4byte gUnk_09E3B434
_080182B8:
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_080156E0
_080182C2:
	ldr r1, [r4, #0x2c]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [sp, #0x40]
	str r0, [sp, #8]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	str r2, [sp, #0x18]
	str r2, [sp, #0x1c]
	movs r0, #1
	add r2, sp, #0x20
	movs r3, #0
	bl sub_08015A8C
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080182EC
sub_080182EC: @ 0x080182EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov sl, r1
	mov sb, r2
	str r3, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r6, #0
	b _080183B2
_08018308:
	ldr r4, [sp, #4]
	movs r5, #0
	adds r7, r6, #1
	mov r8, r7
	cmp r4, #0
	beq _080183B0
_08018314:
	ldr r0, [sp, #0x34]
	bl GL_CreateNewObject
	adds r3, r0, #0
	ldr r0, [sp]
	ldr r2, [sp, #8]
	adds r1, r0, r2
	ldr r7, _08018360 @ =0x000003FF
	adds r0, r7, #0
	ands r1, r0
	ldr r2, _08018364 @ =0xFFFFFC00
	adds r0, r2, #0
	ldrh r7, [r3, #4]
	ands r0, r7
	orrs r0, r1
	strh r0, [r3, #4]
	movs r2, #0xf
	ldrb r0, [r3, #5]
	ands r2, r0
	movs r0, #0x10
	orrs r2, r0
	movs r1, #3
	ldr r0, [sp, #0x30]
	ands r0, r1
	lsls r0, r0, #2
	movs r7, #0xd
	rsbs r7, r7, #0
	adds r1, r7, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r3, #5]
	cmp r4, #3
	ble _0801836C
	subs r4, #4
	movs r2, #4
	ldr r1, _08018368 @ =0x40004000
	b _08018380
	.align 2, 0
_08018360: .4byte 0x000003FF
_08018364: .4byte 0xFFFFFC00
_08018368: .4byte 0x40004000
_0801836C:
	cmp r4, #1
	ble _0801837A
	subs r4, #2
	movs r2, #2
	movs r1, #0x80
	lsls r1, r1, #7
	b _08018380
_0801837A:
	subs r4, #1
	movs r2, #1
	movs r1, #0
_08018380:
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	mov r0, sl
	adds r1, r0, r5
	ldr r7, _080183C8 @ =0x000001FF
	adds r0, r7, #0
	ands r1, r0
	ldr r7, _080183CC @ =0xFFFFFE00
	adds r0, r7, #0
	ldrh r7, [r3, #2]
	ands r0, r7
	orrs r0, r1
	strh r0, [r3, #2]
	lsls r0, r6, #3
	add r0, sb
	strb r0, [r3]
	ldr r0, [sp, #8]
	adds r0, r0, r2
	str r0, [sp, #8]
	lsls r0, r2, #3
	adds r5, r5, r0
	cmp r4, #0
	bne _08018314
_080183B0:
	mov r6, r8
_080183B2:
	ldr r2, [sp, #0x2c]
	cmp r6, r2
	blt _08018308
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080183C8: .4byte 0x000001FF
_080183CC: .4byte 0xFFFFFE00

	thumb_func_start sub_080183D0
sub_080183D0: @ 0x080183D0
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, [sp, #0x10]
	bl sub_080177DC
	movs r0, #8
	str r0, [sp]
	movs r0, #0x80
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #1
	movs r3, #7
	bl sub_080175F4
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08018400
sub_08018400: @ 0x08018400
	push {lr}
	sub sp, #4
	adds r3, r0, #0
	adds r2, r1, #0
	movs r0, #0
	str r0, [sp]
	lsls r3, r3, #5
	ldr r0, _0801842C @ =0x06010000
	adds r3, r3, r0
	lsls r2, r2, #3
	ldr r0, _08018430 @ =0x001FFFFF
	ands r2, r0
	movs r0, #0xa0
	lsls r0, r0, #0x13
	orrs r2, r0
	mov r0, sp
	adds r1, r3, #0
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0801842C: .4byte 0x06010000
_08018430: .4byte 0x001FFFFF

	thumb_func_start sub_08018434
sub_08018434: @ 0x08018434
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, _08018488 @ =gUnk_02029250
	movs r0, #0xc1
	lsls r0, r0, #2
	adds r5, r4, r0
	adds r0, r5, #0
	bl GL_UpdateScrollCursorYPosition
	movs r7, #0
	str r7, [sp]
	movs r6, #0x10
	str r6, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #0xe0
	movs r3, #0x20
	bl sub_08018260
	movs r1, #0xc6
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #5
	bls _0801847E
	adds r0, r5, #0
	bl GL_GetScrollCursorYPosition
	adds r3, r0, #0
	adds r3, #5
	str r7, [sp]
	str r6, [sp, #4]
	movs r0, #0
	movs r1, #1
	movs r2, #0xe1
	bl sub_08018260
_0801847E:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018488: .4byte gUnk_02029250

	thumb_func_start sub_0801848C
sub_0801848C: @ 0x0801848C
	push {r4, lr}
	ldr r4, _080184B8 @ =gUnk_02029250
	movs r1, #0xc5
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	adds r3, r0, #1
	ldr r1, _080184BC @ =gUnk_02000000
	ldr r0, _080184C0 @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080184C4
	cmp r3, #2
	bne _080184C4
	movs r3, #0
	b _080184CE
	.align 2, 0
_080184B8: .4byte gUnk_02029250
_080184BC: .4byte gUnk_02000000
_080184C0: .4byte 0x00006C2C
_080184C4:
	adds r0, r3, #0
	movs r1, #3
	bl __modsi3
	adds r3, r0, #0
_080184CE:
	movs r1, #0xc5
	lsls r1, r1, #2
	adds r2, r4, r1
	movs r0, #7
	ands r3, r0
	lsls r1, r3, #3
	movs r0, #0x39
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _080184F4 @ =0x0000031B
	adds r1, r4, r0
	movs r0, #8
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080184F4: .4byte 0x0000031B

	thumb_func_start sub_080184F8
sub_080184F8: @ 0x080184F8
	push {r4, lr}
	ldr r4, _08018548 @ =gUnk_02029250
	movs r1, #0xc5
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	subs r3, r0, #1
	cmp r0, #0
	bne _08018522
	ldr r0, _0801854C @ =gUnk_02000000
	ldr r3, _08018550 @ =0x00006C2C
	adds r0, r0, r3
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	movs r3, #2
	cmp r1, #0
	beq _08018522
	movs r3, #1
_08018522:
	movs r0, #0xc5
	lsls r0, r0, #2
	adds r2, r4, r0
	movs r0, #7
	ands r3, r0
	lsls r1, r3, #3
	movs r0, #0x39
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _08018554 @ =0x0000031B
	adds r1, r4, r0
	movs r0, #0xf8
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018548: .4byte gUnk_02029250
_0801854C: .4byte gUnk_02000000
_08018550: .4byte 0x00006C2C
_08018554: .4byte 0x0000031B

	thumb_func_start sub_08018558
sub_08018558: @ 0x08018558
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	ldr r0, _08018658 @ =gUnk_02029250
	mov r8, r0
	ldr r0, _0801865C @ =gUnk_02000000
	ldr r1, _08018660 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	mov sb, r0
	mov r5, sb
	ldr r0, _08018664 @ =0x0000031B
	add r0, r8
	movs r7, #0
	ldrsb r7, [r0, r7]
	cmp r7, #0
	bge _0801858C
	rsbs r7, r7, #0
_0801858C:
	ldr r1, _08018668 @ =gUnk_09E3B46F
	add r0, sp, #8
	movs r2, #0xc
	bl memcpy
	add r2, sp, #0x14
	adds r1, r2, #0
	ldr r0, _0801866C @ =gUnk_09E3B47C
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	ldm r0!, {r3, r4, r6}
	stm r1!, {r3, r4, r6}
	ldr r0, [r0]
	str r0, [r1]
	adds r6, r2, #0
	cmp r7, #0
	beq _08018670
	subs r7, #1
	movs r0, #8
	subs r0, r0, r7
	str r0, [sp, #0x3c]
	movs r4, #0
	mov sl, r6
_080185BE:
	movs r1, #1
	eors r1, r4
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r6, r0, #0x1f
	ldr r0, _08018664 @ =0x0000031B
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #1
	cmp r0, #0
	blt _080185DA
	subs r1, #2
_080185DA:
	movs r0, #0xc5
	lsls r0, r0, #2
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	subs r3, r4, r0
	adds r2, r4, r1
	cmp r2, #4
	bhi _0801863C
	lsls r5, r4, #3
	mov r1, sl
	adds r0, r1, r5
	ldr r1, [r0]
	lsls r0, r2, #3
	add r0, sl
	ldr r0, [r0]
	adds r2, r0, r6
	subs r1, r1, r0
	ldr r6, [sp, #0x3c]
	adds r0, r1, #0
	muls r0, r6, r0
	cmp r0, #0
	bge _0801860C
	adds r0, #7
_0801860C:
	asrs r0, r0, #3
	adds r2, r2, r0
	cmp r3, #0
	bge _08018616
	adds r3, #3
_08018616:
	mov r1, sb
	lsls r0, r1, #1
	add r0, sb
	lsls r0, r0, #1
	adds r0, r3, r0
	add r0, sp
	adds r0, #8
	ldrb r1, [r0]
	adds r1, #1
	add r0, sp, #0x18
	adds r0, r0, r5
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0
	bl sub_08018260
_0801863C:
	adds r4, #1
	cmp r4, #4
	ble _080185BE
	adds r2, r7, #0
	ldr r1, _08018664 @ =0x0000031B
	add r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08018652
	rsbs r2, r7, #0
_08018652:
	strb r2, [r1]
	b _080186BE
	.align 2, 0
_08018658: .4byte gUnk_02029250
_0801865C: .4byte gUnk_02000000
_08018660: .4byte 0x00006C2C
_08018664: .4byte 0x0000031B
_08018668: .4byte gUnk_09E3B46F
_0801866C: .4byte gUnk_09E3B47C
_08018670:
	movs r4, #0
	lsls r0, r5, #1
	add r7, sp, #0x18
	adds r0, r0, r5
	lsls r5, r0, #1
_0801867A:
	movs r0, #0xc5
	lsls r0, r0, #2
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	movs r1, #2
	cmp r0, #3
	beq _0801868E
	adds r1, r0, #0
_0801868E:
	subs r1, r4, r1
	adds r0, r1, #1
	cmp r0, #0
	bge _08018698
	adds r0, r1, #4
_08018698:
	adds r0, r0, r5
	add r0, sp
	adds r0, #8
	ldrb r1, [r0]
	adds r4, #1
	lsls r3, r4, #3
	adds r0, r6, r3
	ldr r2, [r0]
	adds r3, r7, r3
	ldr r3, [r3]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0
	bl sub_08018260
	cmp r4, #2
	ble _0801867A
_080186BE:
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080186D0
sub_080186D0: @ 0x080186D0
	ldr r0, _080186E8 @ =gUnk_02000000
	ldr r1, _080186EC @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	movs r0, #1
	cmp r1, #0
	bne _080186E4
	movs r0, #2
_080186E4:
	bx lr
	.align 2, 0
_080186E8: .4byte gUnk_02000000
_080186EC: .4byte 0x00006C2C

	thumb_func_start sub_080186F0
sub_080186F0: @ 0x080186F0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0801874C @ =gUnk_02029250
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r4, r1
	bl GL_GetScrollCursorIndex
	adds r3, r4, #0
	adds r3, #0x8d
	ldr r2, _08018750 @ =0x00000315
	adds r1, r4, r2
	ldrb r1, [r1]
	lsls r2, r1, #0x1a
	lsrs r2, r2, #0x1c
	adds r2, r2, r0
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	movs r2, #0xc5
	lsls r2, r2, #2
	adds r0, r4, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1c
	adds r1, r1, r0
	adds r0, r3, #0
	bl GL_AdvanceChars
	adds r2, r0, #0
	cmp r2, #0
	beq _0801876C
	ldr r1, _08018754 @ =gUnk_02000000
	ldr r0, _08018758 @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08018760
	ldrb r1, [r2]
	cmp r1, #0x20
	bne _08018760
	ldr r0, _0801875C @ =gUnk_09E3B2B4
	b _08018762
	.align 2, 0
_0801874C: .4byte gUnk_02029250
_08018750: .4byte 0x00000315
_08018754: .4byte gUnk_02000000
_08018758: .4byte 0x00006C2C
_0801875C: .4byte gUnk_09E3B2B4
_08018760:
	adds r0, r2, #0
_08018762:
	adds r1, r5, #0
	movs r2, #1
	bl GL_Strncpy
	b _0801876E
_0801876C:
	strb r2, [r5]
_0801876E:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_08018774
sub_08018774: @ 0x08018774
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	ldr r4, _080187D4 @ =gUnk_02029250
	ldr r1, _080187D8 @ =gUnk_09E587EC
	movs r0, #0xc5
	lsls r0, r0, #2
	adds r0, r0, r4
	mov r8, r0
	ldrb r2, [r0]
	lsls r0, r2, #0x1e
	lsrs r0, r0, #0x1e
	movs r5, #1
	eors r0, r5
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r6, [r0]
	ldr r3, _080187DC @ =0x000002C2
	adds r4, r4, r3
	adds r0, r6, #0
	movs r1, #0x22
	bl sub_08018400
	str r5, [sp]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0x11
	movs r3, #2
	bl sub_080183D0
	mov r0, r8
	ldrb r2, [r0]
	lsls r1, r2, #0x1e
	lsrs r1, r1, #0x1e
	eors r1, r5
	movs r0, #4
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	mov r1, r8
	strb r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080187D4: .4byte gUnk_02029250
_080187D8: .4byte gUnk_09E587EC
_080187DC: .4byte 0x000002C2

	thumb_func_start sub_080187E0
sub_080187E0: @ 0x080187E0
	push {r4, r5, lr}
	sub sp, #4
	ldr r4, _080187FC @ =gUnk_02029250
	ldr r0, _08018800 @ =0x0000031E
	adds r5, r4, r0
	ldr r1, _08018804 @ =0x0000031F
	adds r0, r4, r1
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	blo _08018808
	movs r0, #0
	b _0801882C
	.align 2, 0
_080187FC: .4byte gUnk_02029250
_08018800: .4byte 0x0000031E
_08018804: .4byte 0x0000031F
_08018808:
	mov r0, sp
	bl sub_080186F0
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801882A
	ldr r0, _08018834 @ =0x000002C2
	adds r1, r4, r0
	mov r0, sp
	bl GL_Strcat
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	bl sub_08018774
_0801882A:
	movs r0, #1
_0801882C:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08018834: .4byte 0x000002C2

	thumb_func_start sub_08018838
sub_08018838: @ 0x08018838
	push {r4, r5, lr}
	ldr r0, _08018850 @ =gUnk_02029250
	ldr r1, _08018854 @ =0x000002C2
	adds r2, r0, r1
	adds r1, #0x5c
	adds r5, r0, r1
	ldrb r0, [r5]
	cmp r0, #0
	bne _08018858
	movs r0, #0
	b _08018878
	.align 2, 0
_08018850: .4byte gUnk_02029250
_08018854: .4byte 0x000002C2
_08018858:
	ldr r4, _08018880 @ =gUnk_09E3B0B0
	ldrb r1, [r5]
	subs r1, #1
	adds r0, r2, #0
	bl GL_AdvanceChars
	adds r1, r0, #0
	adds r0, r4, #0
	bl GL_Strcpy
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	bl sub_08018774
	movs r0, #1
_08018878:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08018880: .4byte gUnk_09E3B0B0

	thumb_func_start gEngineEffectReturnToHandChangePosition_08018884
gEngineEffectReturnToHandChangePosition_08018884: @ 0x08018884
	push {lr}
	ldr r2, _080188C4 @ =gUnk_02029250
	movs r0, #0xc5
	lsls r0, r0, #2
	adds r3, r2, r0
	ldrh r1, [r3]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x1c
	cmp r0, #0xb
	bne _08018930
	ldr r1, _080188C8 @ =gUnk_03000040
	movs r0, #0xa4
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08018930
	ldr r1, _080188CC @ =0x00000315
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	cmp r0, #1
	beq _080188FC
	cmp r0, #1
	bgt _080188D0
	cmp r0, #0
	beq _080188DA
	b _08018930
	.align 2, 0
_080188C4: .4byte gUnk_02029250
_080188C8: .4byte gUnk_03000040
_080188CC: .4byte 0x00000315
_080188D0:
	cmp r0, #2
	beq _0801890A
	cmp r0, #4
	beq _08018912
	b _08018930
_080188DA:
	ldrb r1, [r3]
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x1d
	cmp r0, #3
	bne _08018930
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	bl gEngineEffectReturnToHandChangePosition_08017D64
	movs r0, #1
	b _08018924
_080188FC:
	movs r0, #1
	bl sub_08019554
	bl sub_08018E30
	movs r0, #1
	b _08018924
_0801890A:
	bl sub_08018838
	movs r0, #1
	b _08018924
_08018912:
	ldr r1, _0801892C @ =0x00000316
	adds r0, r2, r1
	movs r1, #0x3f
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	movs r0, #0x24
_08018924:
	bl sub_080F9AB4
	movs r0, #1
	b _08018932
	.align 2, 0
_0801892C: .4byte 0x00000316
_08018930:
	movs r0, #0
_08018932:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start gEngineEffectReturnToHandChangePosition_08018938
gEngineEffectReturnToHandChangePosition_08018938: @ 0x08018938
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r6, _0801898C @ =gUnk_02029250
	bl sub_08017F8C
	cmp r0, #0
	beq _08018948
	b _08018D20
_08018948:
	ldr r0, _08018990 @ =gUnk_03000040
	movs r1, #0xa4
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080189AC
	ldr r2, _08018994 @ =0x00000315
	adds r3, r6, r2
	ldrb r2, [r3]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1c
	cmp r0, #0
	bne _08018998
	movs r3, #0xc1
	lsls r3, r3, #2
	adds r0, r6, r3
	bl GL_DecreaseScrollCursorIndexByOne
	cmp r0, #0
	bne _08018978
	b _08018AC6
_08018978:
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	bl sub_08017F04
	adds r0, r4, #0
	bl sub_08017FA4
	b _08018AA0
	.align 2, 0
_0801898C: .4byte gUnk_02029250
_08018990: .4byte gUnk_03000040
_08018994: .4byte 0x00000315
_08018998:
	subs r0, #1
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #2
	movs r1, #0x3d
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
	b _08018AA0
_080189AC:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080189F8
	ldr r7, _080189D8 @ =0x00000315
	adds r3, r6, r7
	ldrb r2, [r3]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1c
	cmp r0, #3
	bgt _080189DC
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #2
	movs r1, #0x3d
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
	b _08018AA0
	.align 2, 0
_080189D8: .4byte 0x00000315
_080189DC:
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r6, r1
	bl GL_IncreaseScrollCursorIndexByOne
	cmp r0, #0
	beq _08018AC6
	movs r0, #1
	bl sub_08017F04
	movs r0, #1
	bl sub_08017FA4
	b _08018AA0
_080189F8:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08018A34
	movs r2, #0xc5
	lsls r2, r2, #2
	adds r3, r6, r2
	ldrh r2, [r3]
	lsls r0, r2, #0x16
	lsrs r0, r0, #0x1c
	cmp r0, #0xa
	bgt _08018A28
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _08018A24 @ =0xFFFFFC3F
	ands r1, r2
	orrs r1, r0
	strh r1, [r3]
	b _08018AA0
	.align 2, 0
_08018A24: .4byte 0xFFFFFC3F
_08018A28:
	ldr r0, _08018A30 @ =0xFFFFFC3F
	ands r0, r2
	strh r0, [r3]
	b _08018AA0
	.align 2, 0
_08018A30: .4byte 0xFFFFFC3F
_08018A34:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08018A78
	movs r7, #0xc5
	lsls r7, r7, #2
	adds r3, r6, r7
	ldrh r2, [r3]
	lsls r0, r2, #0x16
	lsrs r0, r0, #0x1c
	cmp r0, #0
	bne _08018A60
	ldr r0, _08018A5C @ =0xFFFFFC3F
	ands r0, r2
	movs r2, #0xb0
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3]
	b _08018AA0
	.align 2, 0
_08018A5C: .4byte 0xFFFFFC3F
_08018A60:
	subs r0, #1
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _08018A74 @ =0xFFFFFC3F
	ands r1, r2
	orrs r1, r0
	strh r1, [r3]
	b _08018AA0
	.align 2, 0
_08018A74: .4byte 0xFFFFFC3F
_08018A78:
	movs r3, #0xc5
	lsls r3, r3, #2
	adds r4, r6, r3
	ldrb r7, [r4]
	lsls r0, r7, #0x1a
	lsrs r0, r0, #0x1d
	cmp r0, #3
	beq _08018AC6
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08018AA8
	bl sub_0801848C
	ldrb r4, [r4]
	lsls r0, r4, #0x1a
	lsrs r0, r0, #0x1d
	bl gEngineEffectReturnToHandChangePosition_08017D64
_08018AA0:
	movs r0, #0
	bl sub_080F9AB4
	b _08018AC6
_08018AA8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08018AC6
	bl sub_080184F8
	ldrb r4, [r4]
	lsls r0, r4, #0x1a
	lsrs r0, r0, #0x1d
	bl gEngineEffectReturnToHandChangePosition_08017D64
	movs r0, #0
	bl sub_080F9AB4
_08018AC6:
	bl gEngineEffectReturnToHandChangePosition_08018884
	cmp r0, #0
	beq _08018AD0
	b _08018CAA
_08018AD0:
	movs r0, #0xc5
	lsls r0, r0, #2
	adds r4, r6, r0
	ldrb r2, [r4]
	lsls r0, r2, #0x1a
	lsrs r1, r0, #0x1d
	cmp r1, #2
	beq _08018B04
	cmp r1, #3
	beq _08018BCC
	ldr r0, _08018B00 @ =gUnk_03000040
	movs r1, #0xa4
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08018AF8
	b _08018C98
_08018AF8:
	bl sub_080187E0
	b _08018C24
	.align 2, 0
_08018B00: .4byte gUnk_03000040
_08018B04:
	ldr r0, _08018B3C @ =gUnk_03000040
	movs r2, #0xa4
	lsls r2, r2, #1
	adds r0, r0, r2
	ldrh r2, [r0]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08018BC0
	mov r0, sp
	bl sub_080186F0
	mov r0, sp
	ldrh r0, [r0]
	lsrs r1, r0, #8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x10
	orrs r2, r1
	ldr r0, _08018B40 @ =0x0000815B
	cmp r2, r0
	beq _08018B4A
	cmp r2, r0
	bgt _08018B44
	subs r0, #0x1b
	cmp r2, r0
	beq _08018B4A
	b _08018B54
	.align 2, 0
_08018B3C: .4byte gUnk_03000040
_08018B40: .4byte 0x0000815B
_08018B44:
	ldr r0, _08018B50 @ =0x00008160
	cmp r2, r0
	bne _08018B54
_08018B4A:
	bl sub_080187E0
	b _08018C24
	.align 2, 0
_08018B50: .4byte 0x00008160
_08018B54:
	movs r3, #0xc5
	lsls r3, r3, #2
	adds r4, r6, r3
	movs r0, #0x39
	rsbs r0, r0, #0
	ldrb r7, [r4]
	ands r0, r7
	movs r1, #0x18
	orrs r0, r1
	strb r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	bl gEngineEffectReturnToHandChangePosition_08017D64
	ldrh r0, [r4]
	lsls r1, r0, #0x16
	lsrs r1, r1, #0x1c
	lsls r1, r1, #0xe
	ldr r0, [r4]
	ldr r2, _08018BB0 @ =0xFFFC3FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r4]
	ldr r1, _08018BB4 @ =0x00000315
	adds r3, r6, r1
	ldr r2, _08018BB8 @ =0x00000316
	adds r5, r6, r2
	movs r1, #0x3c
	ldrb r7, [r3]
	ands r1, r7
	movs r2, #0x3d
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r7, [r5]
	ands r0, r7
	orrs r0, r1
	strb r0, [r5]
	ldr r0, _08018BBC @ =0xFFFFFC3F
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r7, [r3]
	ands r2, r7
	strb r2, [r3]
	b _08018C24
	.align 2, 0
_08018BB0: .4byte 0xFFFC3FFF
_08018BB4: .4byte 0x00000315
_08018BB8: .4byte 0x00000316
_08018BBC: .4byte 0xFFFFFC3F
_08018BC0:
	ands r1, r2
	cmp r1, #0
	beq _08018CAA
	bl sub_08018838
	b _08018C84
_08018BCC:
	ldr r0, _08018C2C @ =gUnk_03000040
	movs r1, #0xa4
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08018C3C
	bl sub_080187E0
	movs r0, #0x39
	rsbs r0, r0, #0
	ldrb r2, [r4]
	ands r0, r2
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	bl gEngineEffectReturnToHandChangePosition_08017D64
	ldr r0, [r4]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1c
	lsls r0, r0, #6
	ldr r1, _08018C30 @ =0xFFFFFC3F
	ldrh r3, [r4]
	ands r1, r3
	orrs r1, r0
	strh r1, [r4]
	ldr r7, _08018C34 @ =0x00000316
	adds r0, r6, r7
	ldr r1, _08018C38 @ =0x00000315
	adds r2, r6, r1
	movs r1, #0x3c
	ldrb r0, [r0]
	ands r1, r0
	movs r0, #0x3d
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
_08018C24:
	movs r0, #0x24
	bl sub_080F9AB4
	b _08018CAA
	.align 2, 0
_08018C2C: .4byte gUnk_03000040
_08018C30: .4byte 0xFFFFFC3F
_08018C34: .4byte 0x00000316
_08018C38: .4byte 0x00000315
_08018C3C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08018CAA
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r2
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	bl gEngineEffectReturnToHandChangePosition_08017D64
	ldr r0, [r4]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1c
	lsls r0, r0, #6
	ldr r1, _08018C8C @ =0xFFFFFC3F
	ldrh r7, [r4]
	ands r1, r7
	orrs r1, r0
	strh r1, [r4]
	ldr r1, _08018C90 @ =0x00000316
	adds r0, r6, r1
	ldr r3, _08018C94 @ =0x00000315
	adds r2, r6, r3
	movs r1, #0x3c
	ldrb r0, [r0]
	ands r1, r0
	movs r0, #0x3d
	rsbs r0, r0, #0
	ldrb r7, [r2]
	ands r0, r7
	orrs r0, r1
	strb r0, [r2]
_08018C84:
	movs r0, #1
	bl sub_080F9AB4
	b _08018CAA
	.align 2, 0
_08018C8C: .4byte 0xFFFFFC3F
_08018C90: .4byte 0x00000316
_08018C94: .4byte 0x00000315
_08018C98:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08018CAA
	bl sub_08018838
	movs r0, #1
	bl sub_080F9AB4
_08018CAA:
	ldr r1, _08018D28 @ =gUnk_03000040
	movs r0, #0xa4
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08018CF8
	ldr r2, _08018D2C @ =0x0000031E
	adds r1, r6, r2
	ldr r3, _08018D30 @ =0x0000031F
	adds r0, r6, r3
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	bne _08018CF8
	movs r7, #0xc5
	lsls r7, r7, #2
	adds r2, r6, r7
	ldr r0, _08018D34 @ =0xFFFFFC3F
	ldrh r1, [r2]
	ands r0, r1
	subs r3, #0x5f
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	adds r7, #1
	adds r2, r6, r7
	movs r0, #0x3d
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	movs r0, #2
	bl sub_080F9AB4
_08018CF8:
	ldr r1, _08018D28 @ =gUnk_03000040
	movs r2, #0xa4
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08018D20
	ldr r3, _08018D38 @ =0x00000316
	adds r0, r6, r3
	movs r1, #0x3f
	ldrb r7, [r0]
	ands r1, r7
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	movs r0, #0x24
	bl sub_080F9AB4
_08018D20:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018D28: .4byte gUnk_03000040
_08018D2C: .4byte 0x0000031E
_08018D30: .4byte 0x0000031F
_08018D34: .4byte 0xFFFFFC3F
_08018D38: .4byte 0x00000316

	thumb_func_start sub_08018D3C
sub_08018D3C: @ 0x08018D3C
	push {lr}
	ldr r3, _08018D54 @ =gUnk_02029250
	ldr r1, _08018D58 @ =0x000002BE
	adds r0, r3, r1
	ldr r1, _08018D5C @ =0x05000202
	adds r3, #0x8c
	movs r2, #2
	bl sub_080152B0
	pop {r0}
	bx r0
	.align 2, 0
_08018D54: .4byte gUnk_02029250
_08018D58: .4byte 0x000002BE
_08018D5C: .4byte 0x05000202

	thumb_func_start sub_08018D60
sub_08018D60: @ 0x08018D60
	push {r4, r5, lr}
	sub sp, #8
	ldr r3, _08018DB0 @ =gUnk_02029250
	movs r4, #0xc
	movs r1, #0
	movs r2, #0xc5
	lsls r2, r2, #2
	adds r0, r3, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1c
	cmp r0, #0xb
	bne _08018D7E
	movs r4, #0xd
	movs r1, #8
_08018D7E:
	lsls r2, r0, #4
	adds r2, #0x10
	ldr r5, _08018DB4 @ =0x00000315
	adds r0, r3, r5
	ldrb r0, [r0]
	lsls r3, r0, #0x1a
	lsrs r3, r3, #0x1c
	lsls r3, r3, #4
	adds r0, r1, #0
	adds r0, #0x20
	adds r3, r3, r0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r4, #0
	bl sub_08018260
	bl sub_08018D3C
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018DB0: .4byte gUnk_02029250
_08018DB4: .4byte 0x00000315

	thumb_func_start sub_08018DB8
sub_08018DB8: @ 0x08018DB8
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r1, _08018E1C @ =gUnk_02029250
	movs r5, #0xc
	ldr r0, _08018E20 @ =gUnk_02000000
	ldr r2, _08018E24 @ =0x00006C2C
	adds r6, r0, r2
	movs r7, #7
	adds r0, r7, #0
	ldrb r2, [r6]
	ands r0, r2
	cmp r0, #0
	beq _08018DD4
	movs r5, #6
_08018DD4:
	ldr r0, _08018E28 @ =0x0000031E
	adds r4, r1, r0
	ldr r2, _08018E2C @ =0x0000031F
	adds r0, r1, r2
	ldrb r1, [r4]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08018E14
	bl sub_08018098
	ldrb r4, [r4]
	adds r1, r4, #0
	muls r1, r5, r1
	subs r1, #1
	adds r2, r0, r1
	adds r0, r7, #0
	ldrb r6, [r6]
	ands r0, r6
	movs r3, #2
	cmp r0, #0
	bne _08018E00
	movs r3, #1
_08018E00:
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #0x19
	bl sub_08018260
_08018E14:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018E1C: .4byte gUnk_02029250
_08018E20: .4byte gUnk_02000000
_08018E24: .4byte 0x00006C2C
_08018E28: .4byte 0x0000031E
_08018E2C: .4byte 0x0000031F

	thumb_func_start sub_08018E30
sub_08018E30: @ 0x08018E30
	push {r4, lr}
	ldr r4, _08018E4C @ =gUnk_02029250
	bl sub_080148E0
	movs r0, #0xc5
	lsls r0, r0, #2
	adds r4, r4, r0
	movs r0, #4
	ldrb r1, [r4]
	orrs r0, r1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018E4C: .4byte gUnk_02029250

	thumb_func_start gEngineEffectReturnToHandChangePosition_08018E50
gEngineEffectReturnToHandChangePosition_08018E50: @ 0x08018E50
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r0, _08018F68 @ =gUnk_02029250
	mov r8, r0
	bl gEngineEffectReturnToHandChangePosition_08018938
	movs r0, #0
	bl sub_08018254
	bl sub_08017FE4
	ldr r0, _08018F6C @ =0x0000031B
	add r0, r8
	movs r5, #0
	ldrsb r5, [r0, r5]
	cmp r5, #0
	bne _08018E98
	str r5, [sp]
	movs r4, #0xf
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #4
	movs r2, #0
	movs r3, #0x82
	bl sub_08018260
	str r5, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #5
	movs r2, #0xd8
	movs r3, #0x82
	bl sub_08018260
_08018E98:
	movs r7, #0
	str r7, [sp]
	movs r0, #0xf
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #3
	movs r2, #0x68
	movs r3, #0x80
	bl sub_08018260
	movs r4, #0xc5
	lsls r4, r4, #2
	add r4, r8
	ldrb r1, [r4]
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x1d
	cmp r0, #3
	bne _08018ECE
	str r7, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #2
	movs r2, #0xc4
	movs r3, #0x28
	bl sub_08018260
_08018ECE:
	bl sub_08018DB8
	bl sub_08018098
	adds r1, r0, #0
	ldr r2, _08018F70 @ =gUnk_09E587EC
	ldrb r4, [r4]
	lsls r0, r4, #0x1e
	lsrs r0, r0, #0x1d
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r6, #2
	str r6, [sp]
	str r7, [sp, #4]
	movs r5, #0x10
	str r5, [sp, #8]
	movs r2, #0x10
	movs r3, #0x11
	bl sub_080182EC
	movs r0, #0xbe
	lsls r0, r0, #1
	ldr r1, _08018F74 @ =0x00000321
	add r1, r8
	ldrb r1, [r1]
	lsrs r1, r1, #1
	movs r4, #0xcc
	subs r1, r4, r1
	str r6, [sp]
	str r7, [sp, #4]
	str r5, [sp, #8]
	movs r2, #0x4a
	movs r3, #6
	bl sub_080182EC
	movs r0, #0xb8
	lsls r0, r0, #1
	movs r1, #0xc8
	lsls r1, r1, #2
	add r1, r8
	ldrb r1, [r1]
	lsrs r1, r1, #1
	subs r1, r4, r1
	str r6, [sp]
	str r7, [sp, #4]
	str r5, [sp, #8]
	movs r2, #0x6a
	movs r3, #6
	bl sub_080182EC
	movs r0, #0xc4
	lsls r0, r0, #1
	ldr r1, _08018F78 @ =0x00000322
	add r1, r8
	ldrb r1, [r1]
	lsrs r1, r1, #1
	subs r4, r4, r1
	str r6, [sp]
	str r7, [sp, #4]
	str r5, [sp, #8]
	adds r1, r4, #0
	movs r2, #0x3a
	movs r3, #6
	bl sub_080182EC
	bl sub_08018D60
	bl sub_08018434
	bl sub_08018558
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018F68: .4byte gUnk_02029250
_08018F6C: .4byte 0x0000031B
_08018F70: .4byte gUnk_09E587EC
_08018F74: .4byte 0x00000321
_08018F78: .4byte 0x00000322

	@ Battle Warrior
	@ Pumpking the King of Ghosts
	@ Wings of Wicked Flame
	thumb_func_start gEngineEffectBoostATKBoostDEF_08018F7C
gEngineEffectBoostATKBoostDEF_08018F7C: @ 0x08018F7C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	ldr r6, _08018FA4 @ =gUnk_02029250
	ldr r1, _08018FA8 @ =0x00000319
	adds r0, r6, r1
	ldrb r0, [r0]
	lsrs r0, r0, #4
	cmp r0, #7
	bls _08018F98
	b _08019436
_08018F98:
	lsls r0, r0, #2
	ldr r1, _08018FAC @ =_08018FB0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08018FA4: .4byte gUnk_02029250
_08018FA8: .4byte 0x00000319
_08018FAC: .4byte _08018FB0
_08018FB0: @ jump table
	.4byte _08018FD0 @ case 0
	.4byte _08019098 @ case 1
	.4byte _080190D8 @ case 2
	.4byte _08019244 @ case 3
	.4byte _08019436 @ case 4
	.4byte _0801931C @ case 5
	.4byte _08019380 @ case 6
	.4byte _080193DC @ case 7
_08018FD0:
	movs r4, #0
	str r4, [sp, #0x14]
	bl GL_GetBg1ScreenBasePtr
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #3
	adds r1, r1, r2
	ldr r2, _08019070 @ =0x01000020
	add r0, sp, #0x14
	bl CpuFastSet
	str r4, [sp, #0x18]
	add r4, sp, #0x18
	bl GL_GetBg0ScreenBasePtr
	adds r1, r0, #0
	ldr r2, _08019074 @ =0x01000200
	adds r0, r4, #0
	bl CpuFastSet
	ldr r2, _08019078 @ =0x04000008
	movs r4, #4
	rsbs r4, r4, #0
	ldrh r1, [r2]
	adds r0, r4, #0
	ands r0, r1
	movs r1, #0
	strh r0, [r2]
	ldr r3, _0801907C @ =0x0000031D
	adds r0, r6, r3
	strb r1, [r0]
	movs r0, #0x30
	rsbs r0, r0, #0
	bl sub_08017CC4
	movs r0, #0
	bl sub_08018248
	ldr r3, _08019080 @ =0x04000048
	movs r1, #0x20
	rsbs r1, r1, #0
	ldrh r2, [r3]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #0x3b
	orrs r0, r2
	strh r0, [r3]
	ldr r2, _08019084 @ =0x0400004A
	ldrh r0, [r2]
	ands r1, r0
	movs r0, #0x3f
	orrs r1, r0
	strh r1, [r2]
	ldr r1, _08019088 @ =0x04000040
	movs r0, #0xf0
	strh r0, [r1]
	adds r1, #4
	ldr r0, _0801908C @ =0x00002878
	strh r0, [r1]
	subs r2, #0x4a
	movs r3, #0x80
	lsls r3, r3, #6
	ldr r0, _08019090 @ =0xFFFF9FFF
	ldrh r1, [r2]
	ands r0, r1
	orrs r0, r3
	strh r0, [r2]
	movs r0, #0xc7
	lsls r0, r0, #2
	adds r1, r6, r0
	movs r0, #0x10
	strb r0, [r1]
	ldr r1, _08019094 @ =0x00000323
	adds r0, r6, r1
	ldrb r2, [r0]
	ands r4, r2
	strb r4, [r0]
	b _080193C0
	.align 2, 0
_08019070: .4byte 0x01000020
_08019074: .4byte 0x01000200
_08019078: .4byte 0x04000008
_0801907C: .4byte 0x0000031D
_08019080: .4byte 0x04000048
_08019084: .4byte 0x0400004A
_08019088: .4byte 0x04000040
_0801908C: .4byte 0x00002878
_08019090: .4byte 0xFFFF9FFF
_08019094: .4byte 0x00000323
_08019098:
	movs r1, #0xc7
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _080190A6
	b _080193C0
_080190A6:
	subs r1, #1
	strb r1, [r0]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0x10
	subs r0, r0, r1
	ldr r2, _080190D0 @ =GL_SinTable
	lsls r0, r0, #2
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	rsbs r0, r0, #0
	asrs r0, r0, #8
	ldr r3, _080190D4 @ =0x0000031D
	b _080193AE
	.align 2, 0
_080190D0: .4byte GL_SinTable
_080190D4: .4byte 0x0000031D
_080190D8:
	bl sub_08017798
	movs r2, #5
	rsbs r2, r2, #0
	movs r0, #3
	movs r1, #1
	bl sub_080176C0
	movs r1, #0
	str r1, [sp, #0x1c]
	add r0, sp, #0x1c
	ldr r1, _08019220 @ =0x06000020
	ldr r2, _08019224 @ =0x01000840
	bl CpuFastSet
	ldr r0, _08019228 @ =0x00001009 (Pumpking the King of Ghosts)
	bl GetInterfaceTextIdIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801922C @ =gUnk_02000000
	ldr r2, _08019230 @ =0x00006C2C
	adds r5, r0, r2
	ldrb r3, [r5]
	lsls r0, r3, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08019234 @ =gInterfaceTextOffsets
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _08019238 @ =gInterfaceText
	mov sb, r1
	add r0, sb
	adds r4, r0, #0
	bl GL_Strlen
	adds r1, r0, #0
	movs r2, #0xc
	movs r3, #7
	mov sl, r3
	mov r0, sl
	ldrb r3, [r5]
	ands r0, r3
	cmp r0, #0
	beq _0801913C
	movs r2, #6
_0801913C:
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #1
	movs r1, #0x48
	subs r1, r1, r0
	movs r0, #8
	mov r8, r0
	str r0, [sp]
	movs r7, #0x20
	str r7, [sp, #4]
	adds r0, r4, #0
	movs r2, #2
	movs r3, #7
	bl sub_080175F4
	ldr r0, _0801923C @ =0x0000100A (Battle Warrior)
	bl GetInterfaceTextIdIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrb r2, [r5]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r3, _08019234 @ =gInterfaceTextOffsets
	adds r1, r1, r3
	ldr r0, [r1]
	mov r1, sb
	adds r4, r0, r1
	adds r0, r4, #0
	bl GL_Strlen
	adds r1, r0, #0
	movs r2, #0xc
	mov r0, sl
	ldrb r3, [r5]
	ands r0, r3
	cmp r0, #0
	beq _08019194
	movs r2, #6
_08019194:
	muls r1, r2, r1
	asrs r1, r1, #1
	subs r1, r7, r1
	mov r0, r8
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x2e
	movs r3, #7
	bl sub_080175F4
	ldr r0, _08019240 @ =0x0000100B (Wings of Wicked Flame)
	bl GetInterfaceTextIdIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrb r2, [r5]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r3, _08019234 @ =gInterfaceTextOffsets
	adds r1, r1, r3
	ldr r0, [r1]
	mov r1, sb
	adds r4, r0, r1
	adds r0, r4, #0
	bl GL_Strlen
	adds r1, r0, #0
	movs r2, #0xc
	mov r0, sl
	ldrb r5, [r5]
	ands r0, r5
	cmp r0, #0
	beq _080191E4
	movs r2, #6
_080191E4:
	adds r0, r1, #0
	muls r0, r2, r0
	asrs r0, r0, #1
	movs r1, #0x70
	subs r1, r1, r0
	mov r2, r8
	str r2, [sp]
	str r7, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x2e
	movs r3, #7
	bl sub_080175F4
	bl GL_GetBg0ScreenBasePtr
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	movs r3, #0
	str r3, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0
	movs r1, #0
	movs r2, #0x16
	movs r3, #0xc
	bl sub_080F00CC
	b _080193C0
	.align 2, 0
_08019220: .4byte 0x06000020
_08019224: .4byte 0x01000840
_08019228: .4byte 0x00001009 @ Pumpking the King of Ghosts
_0801922C: .4byte gUnk_02000000
_08019230: .4byte 0x00006C2C
_08019234: .4byte gInterfaceTextOffsets
_08019238: .4byte gInterfaceText
_0801923C: .4byte 0x0000100A @ Battle Warrior
_08019240: .4byte 0x0000100B @ Wings of Wicked Flame
_08019244:
	add r4, sp, #0x20
	ldr r1, _080192A4 @ =gUnk_09E3B4A4
	adds r0, r4, #0
	movs r2, #4
	bl memcpy
	ldr r1, _080192A8 @ =0x00000323
	adds r5, r6, r1
	ldrb r2, [r5]
	lsls r1, r2, #0x1e
	lsrs r1, r1, #0x1d
	adds r4, r4, r1
	ldrb r2, [r4]
	mov r0, sp
	adds r0, #0x21
	adds r0, r0, r1
	ldrb r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #0xe
	bl sub_08018260
	ldr r0, _080192AC @ =gUnk_03000040
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r0, r0, r3
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080192B0
	ldrb r2, [r5]
	lsls r1, r2, #0x1e
	lsrs r1, r1, #0x1e
	movs r0, #1
	eors r1, r0
	subs r0, #5
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	movs r0, #0
	bl sub_080F9AB4
	b _08019436
	.align 2, 0
_080192A4: .4byte gUnk_09E3B4A4
_080192A8: .4byte 0x00000323
_080192AC: .4byte gUnk_03000040
_080192B0:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080192FC
	ldrb r5, [r5]
	lsls r0, r5, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #0
	beq _080192C8
	cmp r0, #1
	beq _080192DC
	b _080192F0
_080192C8:
	bl sub_08018E30
	ldr r0, _080192D8 @ =0x00000319
	adds r3, r6, r0
	ldrb r2, [r3]
	lsrs r1, r2, #4
	adds r1, #1
	b _080192E6
	.align 2, 0
_080192D8: .4byte 0x00000319
_080192DC:
	ldr r1, _080192F8 @ =0x00000319
	adds r3, r6, r1
	ldrb r2, [r3]
	lsrs r1, r2, #4
	adds r1, #2
_080192E6:
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080192F0:
	movs r0, #0x24
	bl sub_080F9AB4
	b _08019436
	.align 2, 0
_080192F8: .4byte 0x00000319
_080192FC:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _08019306
	b _08019436
_08019306:
	movs r0, #1
	bl sub_080F9AB4
	ldr r2, _08019318 @ =0x00000319
	adds r3, r6, r2
	ldrb r2, [r3]
	lsrs r1, r2, #4
	adds r1, #2
	b _080193CA
	.align 2, 0
_08019318: .4byte 0x00000319
_0801931C:
	movs r4, #0
	str r4, [sp, #0x24]
	add r0, sp, #0x24
	ldr r1, _08019370 @ =0x06000020
	ldr r2, _08019374 @ =0x01000840
	bl CpuFastSet
	str r4, [sp, #0x28]
	add r4, sp, #0x28
	bl GL_GetBg1ScreenBasePtr
	adds r1, r0, #0
	movs r3, #0xb0
	lsls r3, r3, #2
	adds r1, r1, r3
	ldr r2, _08019378 @ =0x01000040
	adds r0, r4, #0
	bl CpuFastSet
	movs r0, #0xc7
	lsls r0, r0, #2
	adds r1, r6, r0
	movs r0, #0x10
	strb r0, [r1]
	movs r1, #0xc5
	lsls r1, r1, #2
	adds r2, r6, r1
	ldrb r1, [r2]
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x1d
	cmp r0, #3
	bne _08019368
	movs r0, #0x39
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
_08019368:
	ldr r2, _0801937C @ =0x00000319
	adds r3, r6, r2
	b _080193C4
	.align 2, 0
_08019370: .4byte 0x06000020
_08019374: .4byte 0x01000840
_08019378: .4byte 0x01000040
_0801937C: .4byte 0x00000319
_08019380:
	movs r3, #0xc7
	lsls r3, r3, #2
	adds r1, r6, r3
	ldrb r0, [r1]
	cmp r0, #0
	beq _080193C0
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	ldr r2, _080193BC @ =GL_SinTable
	lsrs r0, r0, #0x16
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	rsbs r0, r0, #0
	asrs r0, r0, #8
	adds r3, #1
_080193AE:
	adds r1, r6, r3
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl sub_08018254
	b _08019436
	.align 2, 0
_080193BC: .4byte GL_SinTable
_080193C0:
	ldr r0, _080193D8 @ =0x00000319
	adds r3, r6, r0
_080193C4:
	ldrb r2, [r3]
	lsrs r1, r2, #4
	adds r1, #1
_080193CA:
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _08019436
	.align 2, 0
_080193D8: .4byte 0x00000319
_080193DC:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldr r0, _08019480 @ =0xFFFF9FFF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	movs r0, #0
	bl sub_08017CC4
	movs r0, #0
	bl sub_08018248
	ldr r2, _08019484 @ =0x04000008
	movs r0, #4
	rsbs r0, r0, #0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strh r0, [r2]
	movs r0, #2
	movs r1, #1
	movs r2, #0
	bl sub_080176C0
	movs r1, #0xc5
	lsls r1, r1, #2
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	bl gEngineEffectReturnToHandChangePosition_08017D64
	ldr r2, _08019488 @ =0x00000316
	adds r1, r6, r2
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	ldr r0, _0801948C @ =0x00000319
	adds r1, r6, r0
	movs r0, #0xf
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
_08019436:
	bl sub_08018098
	adds r1, r0, #0
	ldr r2, _08019490 @ =gUnk_09E587EC
	movs r3, #0xc5
	lsls r3, r3, #2
	adds r0, r6, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1d
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r3, #9
	adds r2, r6, r3
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r4, #0x10
	subs r2, r4, r2
	movs r3, #2
	str r3, [sp]
	movs r3, #0
	str r3, [sp, #4]
	str r4, [sp, #8]
	movs r3, #0x11
	bl sub_080182EC
	bl sub_08018D3C
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019480: .4byte 0xFFFF9FFF
_08019484: .4byte 0x04000008
_08019488: .4byte 0x00000316
_0801948C: .4byte 0x00000319
_08019490: .4byte gUnk_09E587EC

	thumb_func_start gEngineEffectReturnToHandBoostATK_08019494
gEngineEffectReturnToHandBoostATK_08019494: @ 0x08019494
	push {r4, lr}
	ldr r4, _080194AC @ =gUnk_02029250
	ldr r1, _080194B0 @ =0x00000316
	adds r0, r4, r1
	ldrb r0, [r0]
	lsrs r0, r0, #6
	cmp r0, #0
	beq _080194B4
	cmp r0, #1
	beq _080194BA
	b _080194BE
	.align 2, 0
_080194AC: .4byte gUnk_02029250
_080194B0: .4byte 0x00000316
_080194B4:
	bl gEngineEffectReturnToHandChangePosition_08018E50
	b _080194BE
_080194BA:
	bl gEngineEffectBoostATKBoostDEF_08018F7C
_080194BE:
	bl GL_SendObjectsToOam
	bl GL_ResetObjects
	bl sub_080148F4
	cmp r0, #0
	bne _080194E0
	movs r1, #0xc5
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _080194E0
	movs r0, #1
	b _080194E6
_080194E0:
	bl sub_08014914
	movs r0, #0
_080194E6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080194EC
sub_080194EC: @ 0x080194EC
	push {lr}
	ldr r0, _08019500 @ =gUnk_02029250
	ldr r1, _08019504 @ =0x000002C2
	adds r0, r0, r1
	ldr r1, _08019508 @ =gUnk_0300025A
	bl GL_Strcpy
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_08019500: .4byte gUnk_02029250
_08019504: .4byte 0x000002C2
_08019508: .4byte gUnk_0300025A

	thumb_func_start sub_0801950C
sub_0801950C: @ 0x0801950C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08019534 @ =gUnk_02029250
	ldr r0, _08019538 @ =0x000002C2
	adds r1, r4, r0
	adds r0, r5, #0
	bl GL_Strcpy
	adds r0, r5, #0
	bl GL_Strlen
	ldr r1, _0801953C @ =0x0000031E
	adds r4, r4, r1
	strb r0, [r4]
	bl sub_08018774
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08019534: .4byte gUnk_02029250
_08019538: .4byte 0x000002C2
_0801953C: .4byte 0x0000031E

	thumb_func_start sub_08019540
sub_08019540: @ 0x08019540
	push {lr}
	ldr r0, _08019550 @ =gUnk_09E3B4A8
	movs r1, #0xb
	bl sub_08019574
	pop {r1}
	bx r1
	.align 2, 0
_08019550: .4byte gUnk_09E3B4A8

	thumb_func_start sub_08019554
sub_08019554: @ 0x08019554
	ldr r2, _0801956C @ =gUnk_03000040
	ldr r1, _08019570 @ =0x0000023A
	adds r2, r2, r1
	movs r1, #1
	ands r0, r1
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r3, [r2]
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	bx lr
	.align 2, 0
_0801956C: .4byte gUnk_03000040
_08019570: .4byte 0x0000023A

	thumb_func_start sub_08019574
sub_08019574: @ 0x08019574
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r1, _080195D4 @ =gUnk_09E588B8
	ldr r0, _080195D8 @ =gUnk_03000040
	movs r2, #0x81
	lsls r2, r2, #2
	adds r4, r0, r2
	ldr r2, [r4]
	lsls r0, r2, #0xa
	lsrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080195E8
	bl _call_via_r0
	cmp r0, #0
	beq _080195CA
	ldr r0, [r4]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080195B4
	ldr r0, _080195DC @ =gUnk_02029250
	ldr r1, _080195E0 @ =0x0000031F
	adds r0, r0, r1
	strb r5, [r0]
	adds r0, r6, #0
	bl sub_0801950C
_080195B4:
	ldr r2, [r4]
	lsls r1, r2, #0xa
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #0xe
	ldr r0, _080195E4 @ =0xFFC03FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r4]
_080195CA:
	bl sub_080FA4D4
	movs r0, #0
	b _080195F0
	.align 2, 0
_080195D4: .4byte gUnk_09E588B8
_080195D8: .4byte gUnk_03000040
_080195DC: .4byte gUnk_02029250
_080195E0: .4byte 0x0000031F
_080195E4: .4byte 0xFFC03FFF
_080195E8:
	ldr r0, _080195F8 @ =0xFFC03FFF
	ands r2, r0
	str r2, [r4]
	movs r0, #1
_080195F0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080195F8: .4byte 0xFFC03FFF

	thumb_func_start sub_080195FC
sub_080195FC: @ 0x080195FC
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _08019628 @ =gUnk_02000000
	ldr r2, _0801962C @ =0x00006C2C
	adds r0, r0, r2
	movs r4, #7
	ldrb r0, [r0]
	ands r4, r0
	cmp r4, #0
	bne _08019630
	ldrb r2, [r3]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08019630
	strb r2, [r1]
	ldrb r0, [r3, #1]
	strb r0, [r1, #1]
	strb r4, [r1, #2]
	movs r0, #2
	b _0801963A
	.align 2, 0
_08019628: .4byte gUnk_02000000
_0801962C: .4byte 0x00006C2C
_08019630:
	ldrb r0, [r3]
	strb r0, [r1]
	movs r0, #0
	strb r0, [r1, #1]
	movs r0, #1
_0801963A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08019640
sub_08019640: @ 0x08019640
	ldr r0, _08019658 @ =gUnk_02000000
	ldr r1, _0801965C @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	asrs r0, r0, #0x1f
	movs r1, #2
	ands r0, r1
	bx lr
	.align 2, 0
_08019658: .4byte gUnk_02000000
_0801965C: .4byte 0x00006C2C

	thumb_func_start sub_08019660
sub_08019660: @ 0x08019660
	push {r4, lr}
	sub sp, #4
	ldr r4, _080196E4 @ =gUnk_02029810
	movs r0, #0
	str r0, [sp]
	ldr r2, _080196E8 @ =0x0500019E
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	bl sub_08014638
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0xfa
	lsls r0, r0, #5
	strh r0, [r1]
	adds r1, #8
	movs r0, #0xe0
	lsls r0, r0, #5
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080196EC @ =0x00001D0D
	strh r0, [r1]
	adds r1, #2
	adds r0, #0xf9
	strh r0, [r1]
	adds r1, #2
	ldr r0, _080196F0 @ =0x00001F0F
	strh r0, [r1]
	movs r1, #0x10
	rsbs r1, r1, #0
	movs r0, #0x3f
	bl sub_080146FC
	bl sub_080148D0
	bl GL_InitializeObjects
	bl sub_080156AC
	ldr r1, _080196F4 @ =gUnk_03000040
	ldr r0, _080196F8 @ =0x0000023A
	adds r2, r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	ldr r0, _080196FC @ =0x0000066E
	adds r4, r4, r0
	movs r0, #0xb4
	lsls r0, r0, #2
	strh r0, [r4]
	movs r3, #0xa8
	lsls r3, r3, #1
	adds r1, r1, r3
	movs r0, #0xfc
	lsls r0, r0, #2
	strh r0, [r1]
	movs r0, #1
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080196E4: .4byte gUnk_02029810
_080196E8: .4byte 0x0500019E
_080196EC: .4byte 0x00001D0D
_080196F0: .4byte 0x00001F0F
_080196F4: .4byte gUnk_03000040
_080196F8: .4byte 0x0000023A
_080196FC: .4byte 0x0000066E

	thumb_func_start sub_08019700
sub_08019700: @ 0x08019700
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov sb, r1
	mov sl, r2
	str r3, [sp]
	ldr r2, [sp, #0x24]
	ldr r0, [sp, #0x28]
	cmp r0, #0x20
	beq _08019722
	cmp r0, #0x80
	beq _08019736
	b _080197AA
_08019722:
	mov r0, sb
	adds r0, #1
	mov r1, sl
	adds r1, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r3, r7, #0
	bl sub_080F2A7C
	b _080197AA
_08019736:
	movs r0, #1
	rsbs r0, r0, #0
	add r0, sb
	mov r8, r0
	mov r5, sl
	subs r5, #1
	lsls r4, r2, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
	mov r0, sb
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
	mov r6, sb
	adds r6, #1
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
	mov r0, r8
	mov r1, sl
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
	adds r0, r6, #0
	mov r1, sl
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
	adds r5, #2
	mov r0, r8
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
	mov r0, sb
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_080F2A7C
_080197AA:
	ldr r0, [sp]
	lsls r2, r0, #0x10
	lsrs r2, r2, #0x10
	mov r0, sb
	mov r1, sl
	adds r3, r7, #0
	bl sub_080F2A7C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start nullsub_6
nullsub_6: @ 0x080197CC
	bx lr
	.align 2, 0

	thumb_func_start sub_080197D0
sub_080197D0: @ 0x080197D0
	push {lr}
	movs r2, #0
	bl nullsub_6
	pop {r0}
	bx r0

	thumb_func_start sub_080197DC
sub_080197DC: @ 0x080197DC
	push {lr}
	bl GL_GetBg2CharBasePtr
	adds r0, #0x20
	movs r1, #0x1b
	movs r2, #0x15
	bl sub_080F42B4
	ldr r2, _08019818 @ =gUnk_02006ED0
	movs r0, #0x20
	ldrb r1, [r2, #0x15]
	orrs r0, r1
	strb r0, [r2, #0x15]
	movs r0, #2
	ldrb r1, [r2, #8]
	orrs r0, r1
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #8]
	ldr r1, _0801981C @ =gUnk_09E5F854
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08019818: .4byte gUnk_02006ED0
_0801981C: .4byte gUnk_09E5F854

	thumb_func_start sub_08019820
sub_08019820: @ 0x08019820
	push {lr}
	ldr r0, _08019858 @ =0x06000020
	movs r1, #0x19
	movs r2, #0xb
	bl sub_080F42B4
	ldr r2, _0801985C @ =gUnk_02006ED0
	movs r0, #0x20
	ldrb r1, [r2, #0x15]
	orrs r0, r1
	strb r0, [r2, #0x15]
	movs r0, #2
	ldrb r1, [r2, #8]
	orrs r0, r1
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #8]
	ldr r1, _08019860 @ =gUnk_09E5F854
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08019858: .4byte 0x06000020
_0801985C: .4byte gUnk_02006ED0
_08019860: .4byte gUnk_09E5F854

	thumb_func_start sub_08019864
sub_08019864: @ 0x08019864
	push {r4, r5, lr}
	adds r4, r3, #0
	lsls r0, r0, #5
	ldr r3, _080198C4 @ =0x06010000
	adds r0, r0, r3
	bl sub_080F42B4
	ldr r3, _080198C8 @ =gUnk_02006ED0
	movs r0, #0x20
	ldrb r1, [r3, #0x15]
	orrs r0, r1
	strb r0, [r3, #0x15]
	movs r5, #1
	ands r4, r5
	lsls r4, r4, #1
	movs r1, #3
	rsbs r1, r1, #0
	ldrb r0, [r3, #8]
	ands r1, r0
	orrs r1, r4
	ldr r2, _080198CC @ =gUnk_02000000
	ldr r0, _080198D0 @ =0x00006C2C
	adds r2, r2, r0
	movs r0, #7
	ldrb r2, [r2]
	ands r0, r2
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	ands r0, r5
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #8]
	ldr r2, _080198D4 @ =gUnk_09E5F854
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r3, #4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080198C4: .4byte 0x06010000
_080198C8: .4byte gUnk_02006ED0
_080198CC: .4byte gUnk_02000000
_080198D0: .4byte 0x00006C2C
_080198D4: .4byte gUnk_09E5F854

	thumb_func_start sub_080198D8
sub_080198D8: @ 0x080198D8
	push {lr}
	sub sp, #0x14
	ldr r1, _08019908 @ =gUnk_0202348C
	movs r0, #1
	strb r0, [r1]
	bl GL_GetBg0ScreenBasePtr
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0
	movs r1, #0
	movs r2, #0x19
	movs r3, #0xb
	bl sub_080F00CC
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_08019908: .4byte gUnk_0202348C

	thumb_func_start sub_0801990C
sub_0801990C: @ 0x0801990C
	push {r4, r5, r6, r7, lr}
	mov r7, sp
	adds r5, r0, #0
	adds r4, r1, #0
	mov r6, sp
	bl GL_Strlen
	adds r1, r4, #0
	bl __modsi3
	adds r1, r0, #0
	cmp r1, #0
	beq _0801995C
	adds r0, r4, #1
	lsls r0, r0, #3
	lsrs r0, r0, #3
	adds r0, #3
	lsrs r0, r0, #2
	lsls r0, r0, #2
	mov r2, sp
	subs r2, r2, r0
	mov sp, r2
	mov r3, sp
	movs r2, #0
	subs r1, r4, r1
	cmp r2, r1
	bge _0801994E
	movs r4, #0x20
_08019944:
	adds r0, r3, r2
	strb r4, [r0]
	adds r2, #1
	cmp r2, r1
	blt _08019944
_0801994E:
	adds r1, r3, r2
	movs r0, #0
	strb r0, [r1]
	adds r0, r3, #0
	adds r1, r5, #0
	bl GL_Strcat
_0801995C:
	mov sp, r6
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08019964
sub_08019964: @ 0x08019964
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r5, _080199E0 @ =gUnk_02029810
	ldr r0, _080199E4 @ =0x00001036 (Djinn the Watcher of the Wind)
	bl GetInterfaceTextIdIndex
	ldr r1, _080199E8 @ =gInterfaceTextOffsets
	mov r8, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r4, _080199EC @ =gUnk_02000000
	ldr r2, _080199F0 @ =0x00006C2C
	adds r4, r4, r2
	ldrb r2, [r4]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldr r0, [r1]
	ldr r6, _080199F4 @ =gInterfaceText
	adds r0, r0, r6
	adds r1, r5, #0
	bl GL_Strcpy
	adds r0, r5, #0
	movs r1, #0xf
	bl sub_0801990C
	ldr r0, _080199F8 @ =0x00001037 (The Bewitching Phantom Thief)
	bl GetInterfaceTextIdIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrb r4, [r4]
	lsls r0, r4, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, r8
	ldr r0, [r1]
	adds r0, r0, r6
	adds r1, r5, #0
	bl GL_Strcat
	adds r0, r5, #0
	movs r1, #0xf
	bl sub_0801990C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080199E0: .4byte gUnk_02029810
_080199E4: .4byte 0x00001036 @ Djinn the Watcher of the Wind
_080199E8: .4byte gInterfaceTextOffsets
_080199EC: .4byte gUnk_02000000
_080199F0: .4byte 0x00006C2C
_080199F4: .4byte gInterfaceText
_080199F8: .4byte 0x00001037 @ The Bewitching Phantom Thief

	thumb_func_start sub_080199FC
sub_080199FC: @ 0x080199FC
	push {r4, lr}
	ldr r4, _08019A40 @ =gUnk_02029810
	ldr r0, _08019A44 @ =0x00001038 (Temple of Skulls)
	bl GetInterfaceTextIdIndex
	ldr r2, _08019A48 @ =gInterfaceTextOffsets
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _08019A4C @ =gUnk_02000000
	ldr r3, _08019A50 @ =0x00006C2C
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, _08019A54 @ =gInterfaceText
	adds r0, r0, r1
	adds r1, r4, #0
	bl GL_Strcpy
	adds r0, r4, #0
	movs r1, #0xf
	bl sub_0801990C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08019A40: .4byte gUnk_02029810
_08019A44: .4byte 0x00001038 @ Temple of Skulls
_08019A48: .4byte gInterfaceTextOffsets
_08019A4C: .4byte gUnk_02000000
_08019A50: .4byte 0x00006C2C
_08019A54: .4byte gInterfaceText

	thumb_func_start sub_08019A58
sub_08019A58: @ 0x08019A58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r0, _08019B20 @ =gUnk_02029810
	mov sl, r0
	movs r0, #0xcc
	lsls r0, r0, #3
	add r0, sl
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r1, r0, #0x1c
	ldr r0, _08019B24 @ =0x00000661
	add r0, sl
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r2, r0, #0x1c
	cmp r1, #5
	ble _08019A84
	subs r1, #1
_08019A84:
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r4, r0, r2
	ldr r1, _08019B28 @ =gUnk_09E588CC
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov r1, sl
	bl GL_Strcpy
	adds r6, r0, #0
	lsls r0, r4, #1
	ldr r3, _08019B2C @ =gUnk_09E3BFDD
	adds r1, r0, #1
	adds r1, r1, r3
	adds r2, r0, r3
	ldrb r2, [r2]
	lsls r5, r2, #8
	ldrb r1, [r1]
	orrs r5, r1
	adds r1, r0, #3
	adds r1, r1, r3
	adds r0, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r7, r0, #8
	ldrb r1, [r1]
	orrs r7, r1
	cmp r5, r7
	bge _08019B0C
	mov sb, sp
	add r1, sp, #4
	mov r8, r1
_08019AC6:
	lsls r4, r5, #0x10
	lsrs r0, r4, #0x10
	bl sub_080F0188
	cmp r0, #0
	beq _08019B06
	mov r0, sp
	movs r1, #0
	movs r2, #3
	bl memset
	lsrs r0, r4, #0x18
	mov r1, sb
	strb r0, [r1]
	strb r5, [r1, #1]
	mov r0, sp
	mov r1, sl
	bl GL_Strcat
	adds r6, #1
	cmp r6, #0xb
	bne _08019B06
	mov r0, r8
	ldr r1, _08019B30 @ =gUnk_09E3C040
	movs r2, #3
	bl memcpy
	mov r0, r8
	mov r1, sl
	bl GL_Strcat
	movs r6, #0
_08019B06:
	adds r5, #1
	cmp r5, r7
	blt _08019AC6
_08019B0C:
	mov r0, sl
	bl GL_Strlen
	cmp r0, #0x59
	bgt _08019B34
	mov r0, sl
	movs r1, #0x5a
	bl sub_0801990C
	b _08019B3C
	.align 2, 0
_08019B20: .4byte gUnk_02029810
_08019B24: .4byte 0x00000661
_08019B28: .4byte gUnk_09E588CC
_08019B2C: .4byte gUnk_09E3BFDD
_08019B30: .4byte gUnk_09E3C040
_08019B34:
	mov r0, sl
	movs r1, #0xf
	bl sub_0801990C
_08019B3C:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08019B4C
sub_08019B4C: @ 0x08019B4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r0, _08019C1C @ =gUnk_02029810
	mov r8, r0
	movs r0, #0
	ldr r1, _08019C20 @ =gUnk_0202348C
	strb r0, [r1]
	ldr r0, _08019C24 @ =0x00001038 (Temple of Skulls)
	bl GetInterfaceTextIdIndex
	ldr r7, _08019C28 @ =gInterfaceTextOffsets
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r6, _08019C2C @ =gUnk_02000000
	ldr r2, _08019C30 @ =0x00006C2C
	adds r6, r6, r2
	ldrb r2, [r6]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldr r4, [r1]
	ldr r0, _08019C34 @ =gInterfaceText
	mov sb, r0
	add r4, sb
	adds r0, r4, #0
	movs r1, #0xa
	bl GL_StrWidth
	ldr r1, _08019C38 @ =0x00000675
	add r1, r8
	movs r2, #0
	mov sl, r2
	strb r0, [r1]
	movs r5, #0x96
	lsls r5, r5, #1
	adds r0, r5, #0
	movs r1, #0xc
	bl sub_0801A6E4
	mov r0, sl
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #6
	movs r3, #2
	bl sub_0801A6B4
	ldr r0, _08019C3C @ =0x00001039 (Monster Egg)
	bl GetInterfaceTextIdIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrb r6, [r6]
	lsls r0, r6, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r7
	ldr r4, [r1]
	add r4, sb
	adds r0, r4, #0
	movs r1, #0xa
	bl GL_StrWidth
	ldr r1, _08019C40 @ =0x00000674
	add r8, r1
	mov r2, r8
	strb r0, [r2]
	adds r5, #0xc
	adds r0, r5, #0
	movs r1, #0xc
	bl sub_0801A6E4
	mov r0, sl
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #6
	movs r3, #2
	bl sub_0801A6B4
	movs r0, #1
	ldr r1, _08019C20 @ =gUnk_0202348C
	strb r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019C1C: .4byte gUnk_02029810
_08019C20: .4byte gUnk_0202348C
_08019C24: .4byte 0x00001038 @ Temple of Skulls
_08019C28: .4byte gInterfaceTextOffsets
_08019C2C: .4byte gUnk_02000000
_08019C30: .4byte 0x00006C2C
_08019C34: .4byte gInterfaceText
_08019C38: .4byte 0x00000675
_08019C3C: .4byte 0x00001039 @ Monster Egg
_08019C40: .4byte 0x00000674

	thumb_func_start sub_08019C44
sub_08019C44: @ 0x08019C44
	movs r0, #0
	bx lr

	thumb_func_start sub_08019C48
sub_08019C48: @ 0x08019C48
	push {r4, r5, r6, r7, lr}
	ldr r7, _08019C80 @ =0x0000029F
	ldr r3, _08019C84 @ =gUnk_02029810
	movs r4, #0
	ldr r2, _08019C88 @ =gUnk_09E3C044
	ldrh r1, [r2]
	lsrs r0, r1, #8
	strb r0, [r3]
	strb r1, [r3, #1]
	adds r3, #2
	ldr r6, _08019C8C @ =0x000005A2
	adds r5, r2, #0
_08019C60:
	adds r5, #2
	adds r4, #1
	cmp r4, r7
	bge _08019C78
	lsls r2, r4, #1
	ldrh r1, [r5]
	lsrs r0, r1, #8
	strb r0, [r3]
	strb r1, [r3, #1]
	adds r3, #2
	cmp r2, r6
	bls _08019C60
_08019C78:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019C80: .4byte 0x0000029F
_08019C84: .4byte gUnk_02029810
_08019C88: .4byte gUnk_09E3C044
_08019C8C: .4byte 0x000005A2

	thumb_func_start sub_08019C90
sub_08019C90: @ 0x08019C90
	ldr r1, _08019CA0 @ =0x0400001A
	subs r0, #0x10
	strh r0, [r1]
	subs r1, #2
	movs r0, #5
	rsbs r0, r0, #0
	strh r0, [r1]
	bx lr
	.align 2, 0
_08019CA0: .4byte 0x0400001A

	thumb_func_start sub_08019CA4
sub_08019CA4: @ 0x08019CA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sl, r0
	mov sb, r2
	mov r8, r3
	ldr r7, [sp, #0x2c]
	movs r6, #0
	ldr r4, [r0]
	ldrb r0, [r4]
	cmp r0, #0
	beq _08019CFE
	cmp r6, r7
	bge _08019CFE
	adds r5, r1, #0
_08019CC8:
	adds r0, r4, #0
	add r1, sp, #8
	movs r2, #1
	bl GL_Strncpy
	adds r0, r4, #0
	movs r1, #1
	bl GL_AdvanceChars
	adds r4, r0, #0
	movs r0, #8
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	add r0, sp, #8
	adds r1, r5, #0
	mov r2, sb
	movs r3, #7
	bl sub_08019700
	add r5, r8
	adds r6, #1
	ldrb r0, [r4]
	cmp r0, #0
	beq _08019CFE
	cmp r6, r7
	blt _08019CC8
_08019CFE:
	mov r0, sl
	str r4, [r0]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08019D14
sub_08019D14: @ 0x08019D14
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, _08019D98 @ =gUnk_09E3BCB1
	str r0, [sp, #0x1c]
	movs r6, #0
	movs r7, #0xe
	str r6, [sp, #0x14]
	bl GL_GetBg0ScreenBasePtr
	adds r1, r0, #0
	ldr r2, _08019D9C @ =0x01000200
	add r0, sp, #0x14
	bl CpuFastSet
	str r6, [sp, #0x18]
	add r4, sp, #0x18
	bl GL_GetBg0CharBasePtr
	adds r1, r0, #0
	adds r1, #0x20
	ldr r2, _08019DA0 @ =0x01000898
	adds r0, r4, #0
	bl CpuFastSet
	adds r0, r5, #0
	bl sub_08019C44
	bl sub_08019820
	movs r4, #3
_08019D52:
	ldr r0, [sp, #0x1c]
	ldrb r0, [r0]
	cmp r0, #0
	beq _08019D72
	movs r0, #0xf
	str r0, [sp]
	add r0, sp, #0x1c
	movs r1, #0
	adds r2, r4, #0
	adds r3, r7, #0
	bl sub_08019CA4
	adds r4, r4, r7
	adds r6, #1
	cmp r6, #6
	bne _08019D52
_08019D72:
	bl GL_GetBg0ScreenBasePtr
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #9
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	movs r0, #0
	movs r1, #0
	movs r2, #0x19
	movs r3, #0xb
	bl sub_080F00CC
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019D98: .4byte gUnk_09E3BCB1
_08019D9C: .4byte 0x01000200
_08019DA0: .4byte 0x01000898

	thumb_func_start sub_08019DA4
sub_08019DA4: @ 0x08019DA4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #0xc]
	mov sl, r2
	adds r7, r3, #0
	ldr r0, [sp, #0x30]
	mov sb, r0
	movs r5, #0
	ldr r0, [sp, #0xc]
	ldr r4, [r0]
	mov r8, r5
	ldrb r0, [r4]
	cmp r0, #0
	beq _08019E18
	cmp r5, sb
	bge _08019E18
	adds r6, r1, #0
_08019DCE:
	adds r0, r5, #0
	movs r1, #5
	bl __modsi3
	cmp r0, #0
	bne _08019DE0
	cmp r5, #0
	beq _08019DE0
	add r8, r7
_08019DE0:
	adds r0, r4, #0
	add r1, sp, #8
	movs r2, #1
	bl GL_Strncpy
	adds r0, r4, #0
	movs r1, #1
	bl GL_AdvanceChars
	adds r4, r0, #0
	mov r0, r8
	adds r1, r6, r0
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	add r0, sp, #8
	mov r2, sl
	movs r3, #7
	bl sub_08019700
	adds r6, r6, r7
	adds r5, #1
	ldrb r0, [r4]
	cmp r0, #0
	beq _08019E18
	cmp r5, sb
	blt _08019DCE
_08019E18:
	ldr r0, [sp, #0xc]
	str r4, [r0]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08019E2C
sub_08019E2C: @ 0x08019E2C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #0x1c
	mov sb, r0
	ldr r5, _08019EC4 @ =gUnk_02029810
	movs r4, #0xbd
	lsls r4, r4, #5
	movs r6, #0
	str r6, [sp, #0x14]
	bl GL_GetBg2ScreenBasePtr
	adds r1, r0, #0
	ldr r2, _08019EC8 @ =0x01000200
	add r0, sp, #0x14
	bl CpuFastSet
	str r6, [sp, #0x18]
	add r0, sp, #0x18
	mov r8, r0
	bl GL_GetBg2CharBasePtr
	adds r1, r0, #0
	mov r0, sb
	muls r0, r4, r0
	adds r0, #0x20
	adds r1, r1, r0
	asrs r4, r4, #2
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r4, r0
	mov r0, r8
	adds r2, r4, #0
	bl CpuFastSet
	ldr r1, _08019ECC @ =0x00000664
	adds r0, r5, r1
	strb r6, [r0]
	ldr r0, _08019ED0 @ =0x0000066E
	adds r5, r5, r0
	ldrh r0, [r5]
	adds r0, #0xe
	movs r1, #0xf
	bl __divsi3
	bl sub_0801A718
	movs r0, #0
	bl sub_08019C90
	movs r0, #0
	bl sub_0801A484
	bl GL_GetBg2ScreenBasePtr
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	str r6, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1b
	movs r3, #0x15
	bl sub_080F00CC
	add sp, #0x1c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08019EC4: .4byte gUnk_02029810
_08019EC8: .4byte 0x01000200
_08019ECC: .4byte 0x00000664
_08019ED0: .4byte 0x0000066E

	thumb_func_start sub_08019ED4
sub_08019ED4: @ 0x08019ED4
	push {r4, lr}
	adds r3, r0, #0
	ldr r2, _08019F04 @ =gUnk_02029810
	ldr r0, _08019F08 @ =gUnk_02000000
	ldr r1, _08019F0C @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	movs r4, #1
	cmp r1, #0
	bne _08019EEE
	movs r4, #2
_08019EEE:
	movs r1, #0
	ldrb r0, [r2]
	cmp r0, #0
	beq _08019F1A
	lsls r0, r3, #4
	subs r3, r0, r3
_08019EFA:
	cmp r1, r3
	bne _08019F10
	adds r0, r2, #0
	b _08019F1C
	.align 2, 0
_08019F04: .4byte gUnk_02029810
_08019F08: .4byte gUnk_02000000
_08019F0C: .4byte 0x00006C2C
_08019F10:
	adds r2, r2, r4
	adds r1, #1
	ldrb r0, [r2]
	cmp r0, #0
	bne _08019EFA
_08019F1A:
	movs r0, #0
_08019F1C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08019F24
sub_08019F24: @ 0x08019F24
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	adds r6, r1, #0
	movs r0, #0xc
	mov r8, r0
	movs r7, #0xe
	bl sub_080197DC
	adds r0, r6, #0
	muls r0, r7, r0
	mov sb, r0
	movs r5, #0
	movs r4, #0xe
_08019F46:
	adds r0, r5, #0
	adds r1, r6, #0
	muls r1, r7, r1
	bl sub_080F132C
	add r5, r8
	subs r4, #1
	cmp r4, #0
	bge _08019F46
	movs r0, #0xf
	str r0, [sp]
	add r0, sp, #4
	movs r1, #0
	mov r2, sb
	mov r3, r8
	bl sub_08019DA4
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_08019F78
sub_08019F78: @ 0x08019F78
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r1, #0
	movs r5, #0
	movs r1, #0xc
	mov r8, r1
	movs r7, #0xe
	str r0, [sp, #8]
	movs r4, #0xbd
	lsls r4, r4, #5
	str r5, [sp, #4]
	bl GL_GetBg2CharBasePtr
	adds r1, r0, #0
	adds r0, r6, #0
	muls r0, r4, r0
	adds r0, #0x20
	adds r1, r1, r0
	asrs r4, r4, #2
	movs r0, #0x80
	lsls r0, r0, #0x11
	orrs r4, r0
	add r0, sp, #4
	adds r2, r4, #0
	bl CpuFastSet
	bl sub_080197DC
_08019FB4:
	ldr r0, [sp, #8]
	ldrb r0, [r0]
	cmp r0, #0
	beq _08019FD8
	lsls r0, r6, #2
	adds r0, r0, r5
	adds r2, r7, #0
	muls r2, r0, r2
	movs r0, #0xf
	str r0, [sp]
	add r0, sp, #8
	movs r1, #0
	mov r3, r8
	bl sub_08019DA4
	adds r5, #1
	cmp r5, #4
	bne _08019FB4
_08019FD8:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_08019FE4
sub_08019FE4: @ 0x08019FE4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	ldr r7, _0801A00C @ =gUnk_02029810
	ldr r1, _0801A010 @ =0x0000064C
	adds r0, r7, r1
	bl GL_GetScrollCursorIndex
	adds r5, r0, #0
	mov sb, r7
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	beq _0801A014
	mov r2, r8
	cmp r2, #1
	beq _0801A098
	b _0801A142
	.align 2, 0
_0801A00C: .4byte gUnk_02029810
_0801A010: .4byte 0x0000064C
_0801A014:
	ldr r0, _0801A064 @ =0x00000663
	adds r6, r7, r0
	ldrb r1, [r6]
	lsls r0, r1, #0x1c
	lsrs r0, r0, #0x1c
	adds r0, #1
	movs r1, #3
	bl __modsi3
	adds r4, r0, #0
	cmp r4, #0
	bne _0801A068
	cmp r5, #0
	beq _0801A068
	subs r0, r5, #4
	lsls r1, r0, #4
	subs r1, r1, r0
	adds r0, r7, #0
	bl GL_AdvanceChars
	movs r1, #0
	bl sub_08019F78
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r2, [r6]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	strb r0, [r6]
	mov r0, r8
	bl sub_0801A16C
	bl sub_0801A1AC
	lsls r1, r5, #4
	subs r1, r1, r5
	adds r0, r7, #0
	b _0801A106
	.align 2, 0
_0801A064: .4byte 0x00000663
_0801A068:
	lsls r1, r5, #4
	subs r1, r1, r5
	mov r0, sb
	bl GL_AdvanceChars
	adds r1, r4, #0
	bl sub_08019F78
	ldr r0, _0801A094 @ =0x00000663
	adds r1, r7, r0
	movs r0, #0xf
	ands r4, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	mov r0, r8
	bl sub_0801A16C
	b _0801A142
	.align 2, 0
_0801A094: .4byte 0x00000663
_0801A098:
	ldr r0, _0801A0B0 @ =0x00000663
	adds r3, r7, r0
	ldrb r2, [r3]
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #0
	bne _0801A0B4
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r2
	movs r1, #2
	b _0801A0C0
	.align 2, 0
_0801A0B0: .4byte 0x00000663
_0801A0B4:
	subs r1, r0, #1
	movs r0, #0xf
	ands r1, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r2
_0801A0C0:
	orrs r0, r1
	strb r0, [r3]
	ldr r1, _0801A114 @ =0x00000663
	adds r6, r7, r1
	ldrb r2, [r6]
	lsls r0, r2, #0x1c
	lsrs r4, r0, #0x1c
	cmp r4, #2
	bne _0801A118
	cmp r5, #0
	beq _0801A118
	adds r0, r5, #4
	lsls r1, r0, #4
	subs r1, r1, r0
	mov r0, sb
	bl GL_AdvanceChars
	movs r1, #2
	bl sub_08019F78
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r1, [r6]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r6]
	mov r0, r8
	bl sub_0801A16C
	bl sub_0801A1AC
	lsls r1, r5, #4
	subs r1, r1, r5
	mov r0, sb
_0801A106:
	bl GL_AdvanceChars
	movs r1, #1
	bl sub_08019F78
	b _0801A142
	.align 2, 0
_0801A114: .4byte 0x00000663
_0801A118:
	lsls r1, r5, #4
	subs r1, r1, r5
	mov r0, sb
	bl GL_AdvanceChars
	adds r1, r4, #0
	bl sub_08019F78
	ldr r2, _0801A150 @ =0x00000663
	adds r1, r7, r2
	movs r0, #0xf
	ands r4, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	orrs r0, r4
	strb r0, [r1]
	mov r0, r8
	bl sub_0801A16C
_0801A142:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A150: .4byte 0x00000663

	thumb_func_start sub_0801A154
sub_0801A154: @ 0x0801A154
	ldr r0, _0801A164 @ =gUnk_02029810
	ldr r1, _0801A168 @ =0x00000666
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bx lr
	.align 2, 0
_0801A164: .4byte gUnk_02029810
_0801A168: .4byte 0x00000666

	thumb_func_start sub_0801A16C
sub_0801A16C: @ 0x0801A16C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0801A198 @ =gUnk_02029810
	cmp r4, #1
	beq _0801A18A
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0801A18A
	ldr r0, _0801A19C @ =gUnk_09E3C584
	ldr r1, _0801A1A0 @ =0x000002CD
	ldr r2, _0801A1A4 @ =gUnk_09E3C59C
	movs r3, #1
	bl OSi_Panic
_0801A18A:
	lsls r1, r4, #4
	ldr r2, _0801A1A8 @ =0x00000666
	adds r0, r5, r2
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801A198: .4byte gUnk_02029810
_0801A19C: .4byte gUnk_09E3C584
_0801A1A0: .4byte 0x000002CD
_0801A1A4: .4byte gUnk_09E3C59C
_0801A1A8: .4byte 0x00000666

	thumb_func_start sub_0801A1AC
sub_0801A1AC: @ 0x0801A1AC
	push {r4, lr}
	ldr r2, _0801A1E4 @ =gUnk_02029810
	ldr r1, _0801A1E8 @ =0x00000663
	adds r0, r2, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	movs r1, #0x38
	adds r3, r0, #0
	muls r3, r1, r3
	ldr r0, _0801A1EC @ =0x00000666
	adds r2, r2, r0
	ldrb r0, [r2]
	movs r1, #0
	ldrsb r1, [r2, r1]
	cmp r1, #0
	beq _0801A214
	cmp r1, #0
	ble _0801A1F0
	cmp r1, #0
	ble _0801A1F0
	subs r0, #1
	strb r0, [r2]
	adds r4, r1, #0
	movs r2, #1
	rsbs r2, r2, #0
	adds r3, #0x38
	b _0801A1FA
	.align 2, 0
_0801A1E4: .4byte gUnk_02029810
_0801A1E8: .4byte 0x00000663
_0801A1EC: .4byte 0x00000666
_0801A1F0:
	adds r0, #1
	strb r0, [r2]
	adds r4, r1, #0
	movs r2, #1
	subs r3, #0x38
_0801A1FA:
	movs r0, #0x38
	muls r2, r0, r2
	cmp r1, #0
	bge _0801A204
	rsbs r1, r4, #0
_0801A204:
	movs r0, #0x10
	subs r0, r0, r1
	muls r0, r2, r0
	cmp r0, #0
	bge _0801A210
	adds r0, #0xf
_0801A210:
	asrs r0, r0, #4
	adds r3, r3, r0
_0801A214:
	adds r0, r3, #0
	movs r1, #0xff
	bl __modsi3
	adds r4, r0, #0
	bl sub_08019C90
	adds r0, r4, #0
	bl sub_0801A484
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801A230
sub_0801A230: @ 0x0801A230
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x14
	ldr r0, _0801A308 @ =0x00001037 (The Bewitching Phantom Thief)
	bl GetInterfaceTextIdIndex
	ldr r3, _0801A30C @ =gInterfaceTextOffsets
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801A310 @ =gUnk_02000000
	ldr r2, _0801A314 @ =0x00006C2C
	adds r0, r0, r2
	ldrb r2, [r0]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	ldr r0, _0801A318 @ =gInterfaceText
	adds r7, r1, r0
	movs r0, #7
	mov r8, r0
	ands r0, r2
	movs r6, #0xc
	cmp r0, #0
	bne _0801A270
	movs r6, #0xa
_0801A270:
	rsbs r4, r0, #0
	orrs r4, r0
	lsrs r4, r4, #0x1f
	adds r0, r7, #0
	bl GL_Strlen
	adds r5, r0, #0
	adds r0, r6, #0
	bl sub_0801B77C
	muls r5, r0, r5
	ldr r0, _0801A31C @ =0x06002280
	movs r1, #0x18
	movs r2, #2
	bl sub_080F42B4
	ldr r2, _0801A320 @ =gUnk_02006ED0
	movs r0, #0x20
	ldrb r1, [r2, #0x15]
	orrs r0, r1
	strb r0, [r2, #0x15]
	lsls r4, r4, #1
	movs r0, #3
	rsbs r0, r0, #0
	ldrb r1, [r2, #8]
	ands r0, r1
	orrs r0, r4
	strb r0, [r2, #8]
	ldr r3, _0801A324 @ =gUnk_09E5F854
	lsls r1, r0, #0x1e
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldr r0, [r1]
	str r0, [r2, #4]
	lsrs r0, r5, #0x1f
	adds r5, r5, r0
	asrs r5, r5, #1
	movs r1, #0x61
	subs r1, r1, r5
	mov r2, r8
	str r2, [sp]
	movs r4, #0
	str r4, [sp, #4]
	adds r0, r7, #0
	movs r2, #3
	movs r3, #8
	bl sub_08019700
	bl GL_GetBg0ScreenBasePtr
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #0x8a
	lsls r0, r0, #1
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0
	movs r1, #0
	movs r2, #0x18
	movs r3, #2
	bl sub_080F00CC
	add sp, #0x14
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A308: .4byte 0x00001037 @ The Bewitching Phantom Thief
_0801A30C: .4byte gInterfaceTextOffsets
_0801A310: .4byte gUnk_02000000
_0801A314: .4byte 0x00006C2C
_0801A318: .4byte gInterfaceText
_0801A31C: .4byte 0x06002280
_0801A320: .4byte gUnk_02006ED0
_0801A324: .4byte gUnk_09E5F854

	thumb_func_start sub_0801A328
sub_0801A328: @ 0x0801A328
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x6c
	ldr r0, _0801A454 @ =gUnk_02029810
	mov sb, r0
	add r1, sp, #0x14
	ldr r0, _0801A458 @ =gUnk_09E3C624
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0801A45C @ =0x000005A4
	add r0, sb
	movs r1, #0xb5
	lsls r1, r1, #3
	add r1, sb
	ldr r2, _0801A460 @ =0x000005AC
	add r2, sb
	movs r3, #0
	mov sl, r3
	str r3, [sp]
	movs r3, #1
	str r3, [sp, #4]
	add r4, sp, #0x14
	str r4, [sp, #8]
	mov r3, sl
	str r3, [sp, #0xc]
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp, #0x10]
	movs r3, #0
	bl sub_08015D30
	add r4, sp, #0x24
	adds r0, r4, #0
	bl sub_08015FC8
	ldr r0, _0801A464 @ =gUnk_09E3C634
	movs r1, #0
	bl GL_OpenFile
	str r0, [sp, #0x24]
	movs r5, #0x10
	rsbs r5, r5, #0
	adds r0, r5, #0
	ldrb r1, [r4, #0x14]
	ands r0, r1
	movs r1, #1
	orrs r0, r1
	strb r0, [r4, #0x14]
	movs r2, #0x80
	rsbs r2, r2, #0
	mov r8, r2
	mov r0, r8
	ldrb r3, [r4, #0x18]
	ands r0, r3
	strb r0, [r4, #0x18]
	ldr r6, _0801A468 @ =0xFFFFC07F
	adds r0, r6, #0
	ldrh r1, [r4, #0x18]
	ands r0, r1
	strh r0, [r4, #0x18]
	mov r2, sl
	str r2, [r4, #8]
	movs r0, #0x40
	str r0, [r4, #0xc]
	strh r0, [r4, #0x10]
	adds r0, r4, #0
	bl sub_08016A7C
	add r4, sp, #0x48
	adds r0, r4, #0
	bl sub_08015FC8
	ldr r0, _0801A46C @ =gUnk_09E3C650
	movs r1, #0
	bl GL_OpenFile
	str r0, [sp, #0x48]
	ldrb r3, [r4, #0x14]
	ands r5, r3
	movs r0, #3
	orrs r5, r0
	strb r5, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	mov r1, r8
	ands r0, r1
	strb r0, [r4, #0x18]
	ldrh r2, [r4, #0x18]
	ands r6, r2
	strh r6, [r4, #0x18]
	mov r3, sl
	str r3, [r4, #8]
	movs r0, #0xcc
	lsls r0, r0, #4
	str r0, [r4, #0xc]
	strh r3, [r4, #0x10]
	adds r0, r4, #0
	bl sub_08016A7C
	ldr r4, _0801A470 @ =gUnk_09CCD290
	ldr r1, _0801A474 @ =0x05000020
	ldr r5, _0801A478 @ =0x04000008
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuSet
	ldr r1, _0801A47C @ =0x05000220
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuSet
	bl sub_080198D8
	movs r0, #0xcc
	lsls r0, r0, #3
	add r0, sb
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	bl sub_08019D14
	movs r0, #0
	movs r1, #0
	bl sub_08019E2C
	ldr r0, _0801A480 @ =0x05000202
	movs r4, #0xc6
	lsls r4, r4, #3
	add sb, r4
	mov r1, sb
	movs r2, #2
	bl CpuSet
	bl sub_08019B4C
	bl sub_0801A230
	movs r0, #1
	add sp, #0x6c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801A454: .4byte gUnk_02029810
_0801A458: .4byte gUnk_09E3C624
_0801A45C: .4byte 0x000005A4
_0801A460: .4byte 0x000005AC
_0801A464: .4byte gUnk_09E3C634
_0801A468: .4byte 0xFFFFC07F
_0801A46C: .4byte gUnk_09E3C650
_0801A470: .4byte gUnk_09CCD290
_0801A474: .4byte 0x05000020
_0801A478: .4byte 0x04000008
_0801A47C: .4byte 0x05000220
_0801A480: .4byte 0x05000202

	thumb_func_start sub_0801A484
sub_0801A484: @ 0x0801A484
	ldr r1, _0801A48C @ =0x0400001E
	subs r0, #0xe
	strh r0, [r1]
	bx lr
	.align 2, 0
_0801A48C: .4byte 0x0400001E

	thumb_func_start sub_0801A490
sub_0801A490: @ 0x0801A490
	ldr r1, _0801A498 @ =0x04000016
	subs r0, #4
	strh r0, [r1]
	bx lr
	.align 2, 0
_0801A498: .4byte 0x04000016

	thumb_func_start sub_0801A49C
sub_0801A49C: @ 0x0801A49C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r7, _0801A4E8 @ =gUnk_02029810
	lsls r2, r2, #0xc
	str r2, [sp, #0x24]
	lsls r3, r3, #0xc
	str r3, [sp, #0x28]
	lsls r5, r4, #2
	ldr r1, _0801A4EC @ =0x000005A4
	adds r0, r7, r1
	adds r0, r5, r0
	ldr r0, [r0]
	bl sub_08015718
	cmp r4, r0
	blt _0801A4CC
	ldr r0, _0801A4F0 @ =gUnk_09E3C584
	ldr r1, _0801A4F4 @ =0x0000036F
	ldr r2, _0801A4F8 @ =gUnk_09E3C670
	movs r3, #1
	bl OSi_Panic
_0801A4CC:
	ldr r1, _0801A4FC @ =0x000005AC
	adds r0, r7, r1
	adds r0, r5, r0
	ldr r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _0801A500
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r4, #0
	bl sub_0801571C
	b _0801A50A
	.align 2, 0
_0801A4E8: .4byte gUnk_02029810
_0801A4EC: .4byte 0x000005A4
_0801A4F0: .4byte gUnk_09E3C584
_0801A4F4: .4byte 0x0000036F
_0801A4F8: .4byte gUnk_09E3C670
_0801A4FC: .4byte 0x000005AC
_0801A500:
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_080156E0
_0801A50A:
	ldr r1, [r4, #0x2c]
	ldr r0, [sp, #0x48]
	lsls r3, r0, #0x10
	lsrs r3, r3, #0x10
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [sp, #0x44]
	str r0, [sp, #8]
	ldr r0, [sp, #0x40]
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	str r2, [sp, #0x1c]
	ldr r0, [sp, #0x48]
	str r0, [sp, #0x20]
	movs r0, #1
	add r2, sp, #0x24
	bl sub_08015954
	add sp, #0x2c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801A540
sub_0801A540: @ 0x0801A540
	push {r4, r5, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x1c]
	ldr r5, [sp, #0x20]
	str r4, [sp]
	str r5, [sp, #4]
	movs r4, #0
	str r4, [sp, #8]
	movs r4, #1
	str r4, [sp, #0xc]
	bl sub_0801A49C
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0801A560
sub_0801A560: @ 0x0801A560
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x1c]
	ldr r2, [sp, #0x40]
	cmp r1, r2
	bge _0801A676
_0801A582:
	ldr r4, [sp, #0xc]
	movs r6, #0
	ldr r7, [sp, #0x1c]
	adds r7, #1
	str r7, [sp, #0x18]
	cmp r4, #0
	beq _0801A66C
	movs r0, #3
	mov r8, r0
	ldr r0, [sp, #0x44]
	mov r1, r8
	ands r0, r1
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x54]
	ands r0, r1
	lsls r0, r0, #2
	str r0, [sp, #0x14]
	movs r2, #0xd
	rsbs r2, r2, #0
	mov sb, r2
_0801A5AC:
	ldr r0, [sp, #0x48]
	bl GL_CreateNewObject
	adds r3, r0, #0
	ldr r1, [sp]
	add r1, sl
	ldr r7, _0801A5EC @ =0x000003FF
	adds r0, r7, #0
	ands r1, r0
	ldr r2, _0801A5F0 @ =0xFFFFFC00
	adds r0, r2, #0
	ldrh r7, [r3, #4]
	ands r0, r7
	orrs r0, r1
	strh r0, [r3, #4]
	movs r0, #0xf
	ldrb r1, [r3, #5]
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	mov r2, sb
	ands r0, r2
	ldr r7, [sp, #0x10]
	orrs r0, r7
	strb r0, [r3, #5]
	cmp r4, #3
	ble _0801A5F8
	subs r4, #4
	movs r5, #4
	ldr r1, _0801A5F4 @ =0x40004000
	b _0801A60C
	.align 2, 0
_0801A5EC: .4byte 0x000003FF
_0801A5F0: .4byte 0xFFFFFC00
_0801A5F4: .4byte 0x40004000
_0801A5F8:
	cmp r4, #1
	ble _0801A606
	subs r4, #2
	movs r5, #2
	movs r1, #0x80
	lsls r1, r1, #7
	b _0801A60C
_0801A606:
	subs r4, #1
	movs r5, #1
	movs r1, #0
_0801A60C:
	ldr r0, [r3]
	orrs r0, r1
	str r0, [r3]
	ldr r0, [sp, #4]
	adds r1, r0, r6
	ldr r2, _0801A688 @ =0x000001FF
	adds r0, r2, #0
	ands r1, r0
	ldr r7, _0801A68C @ =0xFFFFFE00
	adds r0, r7, #0
	ldrh r2, [r3, #2]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #2]
	ldr r7, [sp, #0x1c]
	lsls r0, r7, #3
	ldr r1, [sp, #8]
	adds r0, r1, r0
	strb r0, [r3]
	ldr r0, [sp, #0x50]
	mov r2, r8
	ands r0, r2
	movs r7, #4
	rsbs r7, r7, #0
	adds r2, r7, #0
	ldrb r1, [r3, #1]
	ands r2, r1
	orrs r2, r0
	movs r0, #0x1f
	ldr r1, [sp, #0x4c]
	ands r1, r0
	lsls r1, r1, #1
	subs r7, #0x3b
	adds r0, r7, #0
	ldrb r7, [r3, #3]
	ands r0, r7
	orrs r0, r1
	strb r0, [r3, #3]
	mov r0, sb
	ands r2, r0
	ldr r1, [sp, #0x14]
	orrs r2, r1
	strb r2, [r3, #1]
	add sl, r5
	lsls r0, r5, #3
	adds r6, r6, r0
	cmp r4, #0
	bne _0801A5AC
_0801A66C:
	ldr r2, [sp, #0x18]
	str r2, [sp, #0x1c]
	ldr r7, [sp, #0x40]
	cmp r2, r7
	blt _0801A582
_0801A676:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A688: .4byte 0x000001FF
_0801A68C: .4byte 0xFFFFFE00

	thumb_func_start sub_0801A690
sub_0801A690: @ 0x0801A690
	push {r4, r5, r6, lr}
	sub sp, #0x18
	ldr r4, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	ldr r6, [sp, #0x30]
	str r4, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	bl sub_0801A560
	add sp, #0x18
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0801A6B4
sub_0801A6B4: @ 0x0801A6B4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, [sp, #0x10]
	bl sub_08019864
	movs r0, #8
	str r0, [sp]
	movs r0, #0x80
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #1
	movs r2, #1
	movs r3, #7
	bl sub_08019700
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801A6E4
sub_0801A6E4: @ 0x0801A6E4
	push {lr}
	sub sp, #4
	adds r3, r0, #0
	adds r2, r1, #0
	movs r0, #0
	str r0, [sp]
	lsls r3, r3, #5
	ldr r0, _0801A710 @ =0x06010000
	adds r3, r3, r0
	lsls r2, r2, #3
	ldr r0, _0801A714 @ =0x001FFFFF
	ands r2, r0
	movs r0, #0xa0
	lsls r0, r0, #0x13
	orrs r2, r0
	mov r0, sp
	adds r1, r3, #0
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0801A710: .4byte 0x06010000
_0801A714: .4byte 0x001FFFFF

	thumb_func_start sub_0801A718
sub_0801A718: @ 0x0801A718
	push {lr}
	sub sp, #0x14
	adds r2, r0, #0
	ldr r0, _0801A744 @ =gUnk_02029810
	ldr r1, _0801A748 @ =0x0000064C
	adds r0, r0, r1
	movs r1, #0x39
	str r1, [sp]
	movs r1, #6
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	movs r1, #4
	str r1, [sp, #0x10]
	movs r1, #0xe2
	movs r2, #0xe
	movs r3, #6
	bl GL_InitScrollbar
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_0801A744: .4byte gUnk_02029810
_0801A748: .4byte 0x0000064C

	thumb_func_start sub_0801A74C
sub_0801A74C: @ 0x0801A74C
	push {r4, r5, lr}
	ldr r0, _0801A768 @ =gUnk_02029810
	ldr r1, _0801A76C @ =0x0000064C
	adds r5, r0, r1
	movs r4, #3
_0801A756:
	adds r0, r5, #0
	bl GL_IncreaseScrollCursorIndexByOne
	subs r4, #1
	cmp r4, #0
	bge _0801A756
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801A768: .4byte gUnk_02029810
_0801A76C: .4byte 0x0000064C

	thumb_func_start sub_0801A770
sub_0801A770: @ 0x0801A770
	push {r4, r5, lr}
	ldr r0, _0801A78C @ =gUnk_02029810
	ldr r1, _0801A790 @ =0x0000064C
	adds r5, r0, r1
	movs r4, #3
_0801A77A:
	adds r0, r5, #0
	bl GL_DecreaseScrollCursorIndexByOne
	subs r4, #1
	cmp r4, #0
	bge _0801A77A
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801A78C: .4byte gUnk_02029810
_0801A790: .4byte 0x0000064C

	thumb_func_start sub_0801A794
sub_0801A794: @ 0x0801A794
	push {r4, lr}
	sub sp, #8
	ldr r4, _0801A7C8 @ =gUnk_02029810
	ldr r0, _0801A7CC @ =0x0000064C
	adds r4, r4, r0
	adds r0, r4, #0
	bl GL_UpdateScrollCursorYPosition
	adds r0, r4, #0
	bl GL_GetScrollCursorYPosition
	adds r3, r0, #0
	subs r3, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #2
	movs r2, #0xe0
	bl sub_0801A540
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A7C8: .4byte gUnk_02029810
_0801A7CC: .4byte 0x0000064C

	thumb_func_start sub_0801A7D0
sub_0801A7D0: @ 0x0801A7D0
	push {r4, lr}
	ldr r4, _0801A7FC @ =gUnk_02029810
	movs r1, #0xcc
	lsls r1, r1, #3
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	adds r3, r0, #1
	ldr r1, _0801A800 @ =gUnk_02000000
	ldr r0, _0801A804 @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801A808
	cmp r3, #2
	bne _0801A808
	movs r3, #0
	b _0801A812
	.align 2, 0
_0801A7FC: .4byte gUnk_02029810
_0801A800: .4byte gUnk_02000000
_0801A804: .4byte 0x00006C2C
_0801A808:
	adds r0, r3, #0
	movs r1, #3
	bl __modsi3
	adds r3, r0, #0
_0801A812:
	movs r1, #0xcc
	lsls r1, r1, #3
	adds r2, r4, r1
	movs r0, #7
	ands r3, r0
	lsls r1, r3, #3
	movs r0, #0x39
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0801A838 @ =0x00000667
	adds r1, r4, r0
	movs r0, #8
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A838: .4byte 0x00000667

	thumb_func_start sub_0801A83C
sub_0801A83C: @ 0x0801A83C
	push {r4, lr}
	ldr r4, _0801A88C @ =gUnk_02029810
	movs r1, #0xcc
	lsls r1, r1, #3
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1d
	subs r3, r0, #1
	cmp r0, #0
	bne _0801A866
	ldr r0, _0801A890 @ =gUnk_02000000
	ldr r3, _0801A894 @ =0x00006C2C
	adds r0, r0, r3
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	movs r3, #2
	cmp r1, #0
	beq _0801A866
	movs r3, #1
_0801A866:
	movs r0, #0xcc
	lsls r0, r0, #3
	adds r2, r4, r0
	movs r0, #7
	ands r3, r0
	lsls r1, r3, #3
	movs r0, #0x39
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0801A898 @ =0x00000667
	adds r1, r4, r0
	movs r0, #0xf8
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801A88C: .4byte gUnk_02029810
_0801A890: .4byte gUnk_02000000
_0801A894: .4byte 0x00006C2C
_0801A898: .4byte 0x00000667

	thumb_func_start sub_0801A89C
sub_0801A89C: @ 0x0801A89C
	ldr r0, _0801A8B4 @ =gUnk_02000000
	ldr r1, _0801A8B8 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	movs r0, #1
	cmp r1, #0
	bne _0801A8B0
	movs r0, #2
_0801A8B0:
	bx lr
	.align 2, 0
_0801A8B4: .4byte gUnk_02000000
_0801A8B8: .4byte 0x00006C2C

	thumb_func_start sub_0801A8BC
sub_0801A8BC: @ 0x0801A8BC
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, _0801A904 @ =gUnk_02029810
	ldr r0, _0801A908 @ =gUnk_09E3BCB1
	ldr r2, _0801A90C @ =0x00000661
	adds r1, r3, r2
	ldrb r1, [r1]
	lsls r2, r1, #0x1a
	lsrs r2, r2, #0x1c
	lsls r1, r2, #4
	subs r1, r1, r2
	movs r2, #0xcc
	lsls r2, r2, #3
	adds r3, r3, r2
	ldrh r3, [r3]
	lsls r2, r3, #0x16
	lsrs r2, r2, #0x1c
	adds r1, r1, r2
	bl GL_AdvanceChars
	adds r2, r0, #0
	cmp r2, #0
	beq _0801A928
	ldr r1, _0801A910 @ =gUnk_02000000
	ldr r0, _0801A914 @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801A91C
	ldrb r0, [r2]
	cmp r0, #0x20
	bne _0801A91C
	ldr r0, _0801A918 @ =gUnk_09E3C040
	b _0801A91E
	.align 2, 0
_0801A904: .4byte gUnk_02029810
_0801A908: .4byte gUnk_09E3BCB1
_0801A90C: .4byte 0x00000661
_0801A910: .4byte gUnk_02000000
_0801A914: .4byte 0x00006C2C
_0801A918: .4byte gUnk_09E3C040
_0801A91C:
	adds r0, r2, #0
_0801A91E:
	adds r1, r4, #0
	movs r2, #1
	bl GL_Strncpy
	b _0801A92A
_0801A928:
	strb r2, [r4]
_0801A92A:
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start sub_0801A930
sub_0801A930: @ 0x0801A930
	push {lr}
	ldr r0, _0801A948 @ =gUnk_02029810
	ldr r1, _0801A94C @ =0x0000064C
	adds r0, r0, r1
	bl GL_GetScrollCursorIndex
	adds r1, r0, #0
	lsls r0, r1, #4
	subs r0, r0, r1
	pop {r1}
	bx r1
	.align 2, 0
_0801A948: .4byte gUnk_02029810
_0801A94C: .4byte 0x0000064C

	thumb_func_start sub_0801A950
sub_0801A950: @ 0x0801A950
	push {r4, lr}
	ldr r4, _0801A97C @ =gUnk_02029810
	bl sub_0801A930
	ldr r2, _0801A980 @ =0x0000066A
	adds r1, r4, r2
	ldrh r1, [r1]
	lsls r1, r1, #0x17
	lsrs r1, r1, #0x19
	adds r0, r0, r1
	adds r2, #1
	adds r1, r4, r2
	ldrb r1, [r1]
	lsrs r2, r1, #1
	lsls r1, r2, #4
	subs r1, r1, r2
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801A97C: .4byte gUnk_02029810
_0801A980: .4byte 0x0000066A

	thumb_func_start sub_0801A984
sub_0801A984: @ 0x0801A984
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r4, r1, #0
	mov sb, r2
	ldr r5, _0801A9EC @ =gUnk_02029810
	movs r6, #0xc
	movs r0, #0xe
	mov r8, r0
	adds r0, r4, #0
	movs r1, #5
	bl __divsi3
	adds r4, r4, r0
	muls r4, r6, r4
	ldr r0, _0801A9F0 @ =0x00000663
	adds r5, r5, r0
	ldrb r5, [r5]
	lsls r0, r5, #0x1c
	lsrs r0, r0, #0x1a
	add r0, sb
	mov r5, r8
	muls r5, r0, r5
	bl sub_080197DC
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080F132C
	ldrb r0, [r7]
	cmp r0, #0
	beq _0801A9DE
	movs r0, #8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #7
	bl sub_08019700
_0801A9DE:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801A9EC: .4byte gUnk_02029810
_0801A9F0: .4byte 0x00000663

	thumb_func_start sub_0801A9F4
sub_0801A9F4: @ 0x0801A9F4
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r4, _0801AA14 @ =gUnk_02029810
	bl sub_0801A950
	adds r6, r0, #0
	ldr r1, _0801AA18 @ =0x0000066A
	adds r0, r4, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x17
	lsrs r5, r0, #0x19
	ldr r0, _0801AA1C @ =0x0000066B
	adds r4, r4, r0
	ldrb r4, [r4]
	lsrs r4, r4, #1
	b _0801AA40
	.align 2, 0
_0801AA14: .4byte gUnk_02029810
_0801AA18: .4byte 0x0000066A
_0801AA1C: .4byte 0x0000066B
_0801AA20:
	adds r0, r6, #0
	mov r1, sp
	movs r2, #1
	bl GL_Strncpy
	mov r0, sp
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0801A984
	adds r5, #1
	cmp r5, #0xf
	bne _0801AA3E
	movs r5, #0
	adds r4, #1
_0801AA3E:
	adds r6, #2
_0801AA40:
	ldrb r0, [r6]
	cmp r0, #0
	beq _0801AA4A
	cmp r4, #3
	ble _0801AA20
_0801AA4A:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801AA54
sub_0801AA54: @ 0x0801AA54
	push {r4, r5, r6, r7, lr}
	ldr r4, _0801AA74 @ =0xFFFFFA58
	add sp, r4
	ldr r6, _0801AA78 @ =gUnk_02029810
	movs r4, #0
	ldr r0, _0801AA7C @ =0x0000066C
	adds r5, r6, r0
	ldr r1, _0801AA80 @ =0x0000066E
	adds r7, r6, r1
	ldrh r2, [r5]
	ldrh r0, [r7]
	cmp r2, r0
	bls _0801AA84
	movs r0, #0
	b _0801AAEA
	.align 2, 0
_0801AA74: .4byte 0xFFFFFA58
_0801AA78: .4byte gUnk_02029810
_0801AA7C: .4byte 0x0000066C
_0801AA80: .4byte 0x0000066E
_0801AA84:
	mov r0, sp
	bl sub_0801A8BC
	mov r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801AAE8
	ldrh r0, [r5]
	ldrh r7, [r7]
	cmp r0, r7
	bne _0801AA9E
	movs r0, #4
	b _0801AAEA
_0801AA9E:
	adds r0, #1
	strh r0, [r5]
	add r4, sp, #4
	mov r0, sp
	adds r1, r4, #0
	bl GL_Strcpy
	bl sub_0801A950
	adds r1, r4, #0
	bl GL_Strcat
	bl sub_0801A950
	adds r1, r0, #0
	adds r0, r4, #0
	bl GL_Strcpy
	ldr r1, _0801AAF8 @ =0x0000066A
	adds r0, r6, r1
	ldrh r0, [r0]
	lsls r1, r0, #0x17
	lsrs r1, r1, #0x19
	ldr r2, _0801AAFC @ =0x0000066B
	adds r0, r6, r2
	ldrb r0, [r0]
	lsrs r2, r0, #1
	mov r0, sp
	bl sub_0801A984
	bl sub_0801AE0C
	adds r4, r0, #0
	cmp r4, #1
	bne _0801AAE8
	bl sub_0801A9F4
_0801AAE8:
	adds r0, r4, #0
_0801AAEA:
	movs r3, #0xb5
	lsls r3, r3, #3
	add sp, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801AAF8: .4byte 0x0000066A
_0801AAFC: .4byte 0x0000066B

	thumb_func_start sub_0801AB00
sub_0801AB00: @ 0x0801AB00
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r7, _0801ABA4 @ =gUnk_02029810
	ldr r1, _0801ABA8 @ =0x0000066A
	adds r0, r7, r1
	ldrh r0, [r0]
	lsls r2, r0, #0x17
	lsrs r2, r2, #0x19
	adds r1, #1
	adds r0, r7, r1
	ldrb r0, [r0]
	lsrs r1, r0, #1
	lsls r0, r1, #4
	subs r0, r0, r1
	adds r4, r2, r0
	movs r0, #0
	mov sb, r0
	ldr r1, _0801ABAC @ =0x0000066C
	adds r5, r7, r1
	ldrh r0, [r5]
	cmp r0, #0
	beq _0801ABDC
	ldrh r0, [r5]
	cmp r4, r0
	bgt _0801ABDC
	bl sub_0801A930
	movs r1, #0
	mov r8, r1
	ldrh r1, [r5]
	subs r0, r1, r0
	subs r0, #1
	cmp r0, r4
	bge _0801AB4C
	movs r0, #1
	mov r8, r0
_0801AB4C:
	bl sub_0801A930
	adds r4, r0, #0
	ldrh r5, [r5]
	subs r4, r5, r4
	subs r4, #1
	adds r0, r4, #0
	movs r1, #0xf
	bl __modsi3
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0xf
	bl __divsi3
	adds r4, r0, #0
	bl sub_0801A950
	adds r6, r0, #0
	cmp r5, #0xe
	bgt _0801AB84
	cmp r4, #3
	bgt _0801AB84
	ldr r0, _0801ABB0 @ =gUnk_09E3BE3C
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_0801A984
_0801AB84:
	mov r1, r8
	cmp r1, #0
	bne _0801ABB4
	adds r0, r6, #2
	adds r1, r6, #0
	bl GL_Strcpy
	ldr r0, _0801ABAC @ =0x0000066C
	adds r1, r7, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	bl sub_0801A9F4
	b _0801ABD2
	.align 2, 0
_0801ABA4: .4byte gUnk_02029810
_0801ABA8: .4byte 0x0000066A
_0801ABAC: .4byte 0x0000066C
_0801ABB0: .4byte gUnk_09E3BE3C
_0801ABB4:
	ldr r1, _0801ABD8 @ =0x0000066C
	adds r4, r7, r1
	ldrh r1, [r4]
	subs r1, #1
	adds r0, r7, #0
	bl GL_AdvanceChars
	movs r1, #0
	strb r1, [r0]
	bl sub_0801AEC8
	mov sb, r0
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
_0801ABD2:
	mov r0, sb
	b _0801ABDE
	.align 2, 0
_0801ABD8: .4byte 0x0000066C
_0801ABDC:
	movs r0, #0
_0801ABDE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801ABEC
sub_0801ABEC: @ 0x0801ABEC
	push {lr}
	ldr r0, _0801AC0C @ =gUnk_02029810
	ldr r1, _0801AC10 @ =0x0000066C
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801AC1C
	bl sub_0801AB00
	cmp r0, #3
	bne _0801AC14
	movs r0, #1
	bl sub_08019FE4
	b _0801AC22
	.align 2, 0
_0801AC0C: .4byte gUnk_02029810
_0801AC10: .4byte 0x0000066C
_0801AC14:
	movs r0, #1
	bl sub_080F9AB4
	b _0801AC22
_0801AC1C:
	movs r0, #2
	bl sub_080F9AB4
_0801AC22:
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801AC28
sub_0801AC28: @ 0x0801AC28
	push {r4, r5, r6, r7, lr}
	ldr r4, _0801AC58 @ =gUnk_02029810
	bl sub_0801A930
	ldr r1, _0801AC5C @ =0x0000066A
	adds r6, r4, r1
	ldrh r2, [r6]
	lsls r1, r2, #0x17
	lsrs r1, r1, #0x19
	adds r0, r0, r1
	ldr r1, _0801AC60 @ =0x0000066B
	adds r7, r4, r1
	ldrb r1, [r7]
	lsrs r2, r1, #1
	lsls r1, r2, #4
	subs r1, r1, r2
	adds r0, r0, r1
	ldr r2, _0801AC64 @ =0x0000066C
	adds r5, r4, r2
	ldrh r1, [r5]
	cmp r0, r1
	bgt _0801AC68
	movs r0, #0
	b _0801ACA0
	.align 2, 0
_0801AC58: .4byte gUnk_02029810
_0801AC5C: .4byte 0x0000066A
_0801AC60: .4byte 0x0000066B
_0801AC64: .4byte 0x0000066C
_0801AC68:
	bl sub_0801A930
	adds r4, r0, #0
	ldrh r5, [r5]
	subs r4, r5, r4
	adds r0, r4, #0
	movs r1, #0xf
	bl __modsi3
	movs r1, #0x7f
	ands r0, r1
	lsls r0, r0, #2
	ldr r1, _0801ACA8 @ =0xFFFFFE03
	ldrh r2, [r6]
	ands r1, r2
	orrs r1, r0
	strh r1, [r6]
	adds r0, r4, #0
	movs r1, #0xf
	bl __divsi3
	lsls r0, r0, #1
	movs r1, #1
	ldrb r2, [r7]
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	movs r0, #1
_0801ACA0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801ACA8: .4byte 0xFFFFFE03

	thumb_func_start sub_0801ACAC
sub_0801ACAC: @ 0x0801ACAC
	push {r4, r5, lr}
	ldr r5, _0801ACF0 @ =gUnk_02029810
	movs r1, #0xcc
	lsls r1, r1, #3
	adds r0, r5, r1
	ldrh r0, [r0]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1c
	cmp r0, #0xe
	beq _0801ACC2
	b _0801AE04
_0801ACC2:
	ldr r1, _0801ACF4 @ =gUnk_03000040
	movs r2, #0xa4
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801ACD6
	b _0801AE04
_0801ACD6:
	ldr r1, _0801ACF8 @ =0x00000661
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1c
	cmp r0, #5
	bls _0801ACE6
	b _0801AE04
_0801ACE6:
	lsls r0, r0, #2
	ldr r1, _0801ACFC @ =_0801AD00
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801ACF0: .4byte gUnk_02029810
_0801ACF4: .4byte gUnk_03000040
_0801ACF8: .4byte 0x00000661
_0801ACFC: .4byte _0801AD00
_0801AD00: @ jump table
	.4byte _0801AD18 @ case 0
	.4byte _0801AE04 @ case 1
	.4byte _0801AD20 @ case 2
	.4byte _0801AD4C @ case 3
	.4byte _0801AD94 @ case 4
	.4byte _0801ADE0 @ case 5
_0801AD18:
	bl sub_0801ABEC
_0801AD1C:
	movs r0, #1
	b _0801AE06
_0801AD20:
	ldr r2, _0801AD40 @ =0x0000064C
	adds r0, r5, r2
	bl sub_0801A770
	cmp r0, #0
	beq _0801AD44
	movs r0, #1
	bl sub_08019FE4
	bl sub_0801AC28
	movs r0, #0x24
	bl sub_080F9AB4
	b _0801AD1C
	.align 2, 0
_0801AD40: .4byte 0x0000064C
_0801AD44:
	movs r0, #2
	bl sub_080F9AB4
	b _0801AD1C
_0801AD4C:
	ldr r1, _0801AD7C @ =0x0000066C
	adds r0, r5, r1
	ldrh r4, [r0]
	bl sub_0801A930
	adds r0, #0x3c
	cmp r4, r0
	ble _0801AD8C
	ldr r2, _0801AD80 @ =0x0000064C
	adds r0, r5, r2
	bl sub_0801A74C
	cmp r0, #0
	beq _0801AD84
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_08019FE4
	bl sub_0801AC28
	movs r0, #0x24
	bl sub_080F9AB4
	b _0801AD1C
	.align 2, 0
_0801AD7C: .4byte 0x0000066C
_0801AD80: .4byte 0x0000064C
_0801AD84:
	movs r0, #2
	bl sub_080F9AB4
	b _0801AD1C
_0801AD8C:
	movs r0, #2
	bl sub_080F9AB4
	b _0801AD1C
_0801AD94:
	adds r0, r5, #0
	bl GL_Strlen
	adds r1, r0, #0
	ldr r2, _0801ADC0 @ =0x0000065C
	adds r0, r5, r2
	ldr r2, [r0]
	adds r0, r5, #0
	movs r3, #1
	bl sub_0801722C
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _0801ADC4
	movs r0, #0x24
	bl sub_080F9AB4
	bl sub_0801B264
	b _0801AD1C
	.align 2, 0
_0801ADC0: .4byte 0x0000065C
_0801ADC4:
	ldr r1, _0801ADDC @ =0x00000662
	adds r0, r5, r1
	movs r1, #0x3f
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	movs r0, #2
	bl sub_080F9AB4
	b _0801AD1C
	.align 2, 0
_0801ADDC: .4byte 0x00000662
_0801ADE0:
	bl sub_0801B264
	ldr r1, _0801ADFC @ =gUnk_03000040
	ldr r0, _0801AE00 @ =0x0000023A
	adds r1, r1, r0
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #0x24
	bl sub_080F9AB4
	b _0801AD1C
	.align 2, 0
_0801ADFC: .4byte gUnk_03000040
_0801AE00: .4byte 0x0000023A
_0801AE04:
	movs r0, #0
_0801AE06:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0801AE0C
sub_0801AE0C: @ 0x0801AE0C
	push {r4, r5, r6, r7, lr}
	ldr r5, _0801AE74 @ =gUnk_02029810
	ldr r0, _0801AE78 @ =0x0000066A
	adds r6, r5, r0
	ldrh r1, [r6]
	lsls r4, r1, #0x17
	lsrs r4, r4, #0x19
	ldr r2, _0801AE7C @ =0x0000066B
	adds r7, r5, r2
	ldrb r0, [r7]
	lsrs r1, r0, #1
	lsls r0, r1, #4
	subs r0, r0, r1
	adds r4, r4, r0
	bl sub_0801A930
	ldr r1, _0801AE80 @ =0x0000066C
	adds r1, r1, r5
	mov ip, r1
	ldrh r2, [r1]
	subs r0, r2, r0
	cmp r4, r0
	bge _0801AEBE
	ldrh r2, [r6]
	lsls r0, r2, #0x17
	lsrs r0, r0, #0x19
	adds r0, #1
	movs r1, #0x7f
	ands r0, r1
	lsls r0, r0, #2
	ldr r3, _0801AE84 @ =0xFFFFFE03
	adds r1, r3, #0
	ands r1, r2
	orrs r1, r0
	strh r1, [r6]
	lsls r0, r1, #0x17
	lsrs r0, r0, #0x19
	cmp r0, #0xf
	bne _0801AEBA
	ldr r4, _0801AE88 @ =0x0000066E
	adds r0, r5, r4
	mov r2, ip
	ldrh r2, [r2]
	ldrh r0, [r0]
	cmp r2, r0
	bne _0801AE8C
	ands r1, r3
	movs r0, #0x38
	orrs r1, r0
	strh r1, [r6]
	movs r0, #3
	b _0801AEC0
	.align 2, 0
_0801AE74: .4byte gUnk_02029810
_0801AE78: .4byte 0x0000066A
_0801AE7C: .4byte 0x0000066B
_0801AE80: .4byte 0x0000066C
_0801AE84: .4byte 0xFFFFFE03
_0801AE88: .4byte 0x0000066E
_0801AE8C:
	ands r1, r3
	strh r1, [r6]
	ldrb r2, [r7]
	lsrs r1, r2, #1
	adds r1, #1
	lsls r1, r1, #1
	movs r4, #1
	adds r0, r4, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	cmp r0, #4
	bne _0801AEBA
	bl sub_0801A74C
	adds r0, r4, #0
	ldrb r4, [r7]
	ands r0, r4
	strb r0, [r7]
	movs r0, #2
	b _0801AEC0
_0801AEBA:
	movs r0, #1
	b _0801AEC0
_0801AEBE:
	movs r0, #0
_0801AEC0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801AEC8
sub_0801AEC8: @ 0x0801AEC8
	push {r4, r5, lr}
	ldr r1, _0801AF04 @ =gUnk_02029810
	ldr r0, _0801AF08 @ =0x0000066A
	adds r4, r1, r0
	ldrh r3, [r4]
	lsls r0, r3, #0x17
	lsrs r2, r0, #0x19
	ldr r0, _0801AF0C @ =0x0000066B
	adds r5, r1, r0
	ldrb r0, [r5]
	lsrs r1, r0, #1
	lsls r0, r1, #4
	subs r0, r0, r1
	adds r0, r2, r0
	cmp r0, #0
	ble _0801AF3C
	cmp r2, #0
	bne _0801AF24
	ldr r0, _0801AF10 @ =0xFFFFFE03
	ands r0, r3
	movs r1, #0x38
	orrs r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	lsrs r1, r2, #1
	cmp r1, #0
	bne _0801AF14
	bl sub_0801A770
	b _0801AF20
	.align 2, 0
_0801AF04: .4byte gUnk_02029810
_0801AF08: .4byte 0x0000066A
_0801AF0C: .4byte 0x0000066B
_0801AF10: .4byte 0xFFFFFE03
_0801AF14:
	subs r1, #1
	lsls r1, r1, #1
	movs r0, #1
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
_0801AF20:
	movs r0, #2
	b _0801AF66
_0801AF24:
	subs r0, r2, #1
	movs r1, #0x7f
	ands r0, r1
	lsls r0, r0, #2
	ldr r1, _0801AF38 @ =0xFFFFFE03
	ands r1, r3
	orrs r1, r0
	strh r1, [r4]
	movs r0, #1
	b _0801AF66
	.align 2, 0
_0801AF38: .4byte 0xFFFFFE03
_0801AF3C:
	bl sub_0801A930
	cmp r0, #0
	bgt _0801AF48
	movs r0, #0
	b _0801AF66
_0801AF48:
	bl sub_0801A770
	ldr r0, _0801AF6C @ =0xFFFFFE03
	ldrh r1, [r4]
	ands r0, r1
	movs r1, #0x38
	orrs r0, r1
	strh r0, [r4]
	movs r0, #1
	ldrb r1, [r5]
	ands r0, r1
	movs r1, #6
	orrs r0, r1
	strb r0, [r5]
	movs r0, #3
_0801AF66:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0801AF6C: .4byte 0xFFFFFE03

	thumb_func_start sub_0801AF70
sub_0801AF70: @ 0x0801AF70
	push {r4, r5, lr}
	ldr r4, _0801AFAC @ =gUnk_02029810
	bl sub_0801A154
	cmp r0, #0
	beq _0801AF7E
	b _0801B168
_0801AF7E:
	ldr r0, _0801AFB0 @ =gUnk_03000040
	movs r1, #0xa4
	lsls r1, r1, #1
	adds r5, r0, r1
	ldrh r1, [r5]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0801AFCC
	ldr r3, _0801AFB4 @ =0x00000661
	adds r2, r4, r3
	ldrb r3, [r2]
	lsls r0, r3, #0x1a
	lsrs r0, r0, #0x1c
	cmp r0, #0
	bne _0801AFB8
	movs r0, #0x3d
	rsbs r0, r0, #0
	ands r0, r3
	movs r1, #0x14
	orrs r0, r1
	strb r0, [r2]
	b _0801B09C
	.align 2, 0
_0801AFAC: .4byte gUnk_02029810
_0801AFB0: .4byte gUnk_03000040
_0801AFB4: .4byte 0x00000661
_0801AFB8:
	subs r0, #1
_0801AFBA:
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #2
	movs r1, #0x3d
	rsbs r1, r1, #0
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	b _0801B09C
_0801AFCC:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0801AFF6
	ldr r0, _0801AFE8 @ =0x00000661
	adds r2, r4, r0
	ldrb r3, [r2]
	lsls r0, r3, #0x1a
	lsrs r0, r0, #0x1c
	cmp r0, #4
	bgt _0801AFEC
	adds r0, #1
	b _0801AFBA
	.align 2, 0
_0801AFE8: .4byte 0x00000661
_0801AFEC:
	movs r0, #0x3d
	rsbs r0, r0, #0
	ands r0, r3
	strb r0, [r2]
	b _0801B09C
_0801AFF6:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801B020
	movs r1, #0xcc
	lsls r1, r1, #3
	adds r2, r4, r1
	ldrh r3, [r2]
	lsls r0, r3, #0x16
	lsrs r0, r0, #0x1c
	cmp r0, #0xd
	bgt _0801B012
	adds r0, #1
	b _0801B04E
_0801B012:
	ldr r0, _0801B01C @ =0xFFFFFC3F
	ands r0, r3
	strh r0, [r2]
	b _0801B09C
	.align 2, 0
_0801B01C: .4byte 0xFFFFFC3F
_0801B020:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0801B064
	movs r3, #0xcc
	lsls r3, r3, #3
	adds r2, r4, r3
	ldrh r3, [r2]
	lsls r0, r3, #0x16
	lsrs r0, r0, #0x1c
	cmp r0, #0
	bne _0801B04C
	ldr r0, _0801B048 @ =0xFFFFFC3F
	ands r0, r3
	movs r3, #0xe0
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	b _0801B09C
	.align 2, 0
_0801B048: .4byte 0xFFFFFC3F
_0801B04C:
	subs r0, #1
_0801B04E:
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _0801B060 @ =0xFFFFFC3F
	ands r1, r3
	orrs r1, r0
	strh r1, [r2]
	b _0801B09C
	.align 2, 0
_0801B060: .4byte 0xFFFFFC3F
_0801B064:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801B080
	bl sub_0801AE0C
	cmp r0, #0
	beq _0801B168
	cmp r0, #2
	bne _0801B09C
	movs r0, #1
	rsbs r0, r0, #0
	b _0801B098
_0801B080:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801B0A4
	bl sub_0801AEC8
	cmp r0, #0
	beq _0801B168
	cmp r0, #3
	bne _0801B09C
	movs r0, #1
_0801B098:
	bl sub_08019FE4
_0801B09C:
	movs r0, #0
	bl sub_080F9AB4
	b _0801B168
_0801B0A4:
	bl sub_0801ACAC
	cmp r0, #0
	bne _0801B168
	ldrh r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801B124
	bl sub_0801AA54
	cmp r0, #2
	beq _0801B0CA
	cmp r0, #4
	bne _0801B0D2
	movs r0, #2
	bl sub_080F9AB4
	b _0801B168
_0801B0CA:
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_08019FE4
_0801B0D2:
	ldr r0, _0801B114 @ =0x0000066C
	adds r1, r4, r0
	ldr r2, _0801B118 @ =0x0000066E
	adds r0, r4, r2
	ldrh r1, [r1]
	ldrh r0, [r0]
	cmp r1, r0
	bne _0801B10A
	movs r3, #0xcc
	lsls r3, r3, #3
	adds r2, r4, r3
	ldr r0, _0801B11C @ =0xFFFFFC3F
	ldrh r1, [r2]
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0801B120 @ =0x00000661
	adds r2, r4, r0
	movs r0, #0x3d
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
_0801B10A:
	movs r0, #0x24
	bl sub_080F9AB4
	b _0801B168
	.align 2, 0
_0801B114: .4byte 0x0000066C
_0801B118: .4byte 0x0000066E
_0801B11C: .4byte 0xFFFFFC3F
_0801B120: .4byte 0x00000661
_0801B124:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801B132
	bl sub_0801ABEC
	b _0801B168
_0801B132:
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0801B168
	movs r3, #0xcc
	lsls r3, r3, #3
	adds r2, r4, r3
	ldr r0, _0801B170 @ =0xFFFFFC3F
	ldrh r1, [r2]
	ands r0, r1
	movs r3, #0xe0
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _0801B174 @ =0x00000661
	adds r2, r4, r0
	movs r0, #0x3d
	rsbs r0, r0, #0
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x24
	bl sub_080F9AB4
_0801B168:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801B170: .4byte 0xFFFFFC3F
_0801B174: .4byte 0x00000661

	thumb_func_start sub_0801B178
sub_0801B178: @ 0x0801B178
	push {lr}
	ldr r3, _0801B194 @ =gUnk_02029810
	movs r1, #0xc6
	lsls r1, r1, #3
	adds r0, r3, r1
	ldr r1, _0801B198 @ =0x05000202
	ldr r2, _0801B19C @ =0x00000676
	adds r3, r3, r2
	movs r2, #2
	bl sub_080152B0
	pop {r0}
	bx r0
	.align 2, 0
_0801B194: .4byte gUnk_02029810
_0801B198: .4byte 0x05000202
_0801B19C: .4byte 0x00000676

	thumb_func_start sub_0801B1A0
sub_0801B1A0: @ 0x0801B1A0
	push {r4, r5, lr}
	sub sp, #8
	ldr r1, _0801B1E0 @ =gUnk_02029810
	movs r5, #8
	movs r2, #0xcc
	lsls r2, r2, #3
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r2, r0, #0x16
	lsrs r2, r2, #0x1c
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r3, r0, #1
	ldr r0, _0801B1E4 @ =0x00000661
	adds r1, r1, r0
	ldrb r1, [r1]
	lsls r0, r1, #0x1a
	lsrs r1, r0, #0x1c
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r4, r0, #0
	adds r4, #0x48
	cmp r2, #0xe
	bne _0801B1EC
	cmp r1, #5
	bne _0801B1E8
	movs r5, #9
	movs r3, #0xc8
	movs r4, #0x90
	b _0801B1EC
	.align 2, 0
_0801B1E0: .4byte gUnk_02029810
_0801B1E4: .4byte 0x00000661
_0801B1E8:
	movs r5, #0xa
	adds r3, #4
_0801B1EC:
	movs r0, #0
	str r0, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r3, #0
	adds r3, r4, #0
	bl sub_0801A540
	bl sub_0801B178
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_0801B20C
sub_0801B20C: @ 0x0801B20C
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, _0801B25C @ =gUnk_02029810
	ldr r2, _0801B260 @ =0x0000066A
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x19
	adds r2, #1
	adds r1, r1, r2
	ldrb r1, [r1]
	lsrs r6, r1, #1
	movs r4, #0xc
	adds r5, r0, #0
	muls r5, r4, r5
	movs r1, #5
	bl __divsi3
	adds r2, r0, #0
	muls r2, r4, r2
	adds r2, r2, r5
	lsls r3, r6, #3
	subs r3, r3, r6
	lsls r3, r3, #1
	movs r1, #1
	rsbs r1, r1, #0
	adds r2, #0xc
	adds r3, #0x16
	movs r0, #0
	str r0, [sp]
	movs r0, #0xe
	str r0, [sp, #4]
	movs r0, #1
	bl sub_0801A540
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801B25C: .4byte gUnk_02029810
_0801B260: .4byte 0x0000066A

	thumb_func_start sub_0801B264
sub_0801B264: @ 0x0801B264
	push {r4, lr}
	ldr r4, _0801B280 @ =gUnk_02029810
	bl sub_080148E0
	movs r0, #0xcc
	lsls r0, r0, #3
	adds r4, r4, r0
	movs r0, #4
	ldrb r1, [r4]
	orrs r0, r1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801B280: .4byte gUnk_02029810

	thumb_func_start sub_0801B284
sub_0801B284: @ 0x0801B284
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	ldr r0, _0801B354 @ =gUnk_02029810
	mov r8, r0
	bl sub_0801AF70
	movs r6, #0
	str r6, [sp]
	movs r5, #0x10
	str r5, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl sub_0801A540
	str r6, [sp]
	str r5, [sp, #4]
	movs r0, #0
	movs r1, #1
	movs r2, #0xd8
	movs r3, #0
	bl sub_0801A540
	str r6, [sp]
	str r5, [sp, #4]
	movs r0, #0
	movs r1, #4
	movs r2, #0xd0
	movs r3, #0x68
	bl sub_0801A540
	str r6, [sp]
	str r5, [sp, #4]
	movs r0, #0
	movs r1, #5
	movs r2, #0xd0
	movs r3, #0x70
	bl sub_0801A540
	str r6, [sp]
	str r5, [sp, #4]
	movs r0, #0
	movs r1, #3
	movs r2, #0xd0
	movs r3, #0x90
	bl sub_0801A540
	movs r7, #0
	ldr r1, _0801B358 @ =gUnk_02000000
	ldr r0, _0801B35C @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801B2FC
	movs r7, #1
_0801B2FC:
	movs r0, #0x9c
	lsls r0, r0, #1
	ldr r1, _0801B360 @ =0x00000674
	add r1, r8
	ldrb r1, [r1]
	lsrs r1, r1, #1
	subs r1, #0xd9
	subs r1, r7, r1
	movs r4, #2
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r2, #0x82
	movs r3, #6
	bl sub_0801A690
	movs r0, #0x96
	lsls r0, r0, #1
	ldr r1, _0801B364 @ =0x00000675
	add r1, r8
	ldrb r1, [r1]
	lsrs r1, r1, #1
	subs r1, #0xd9
	subs r1, r7, r1
	str r4, [sp]
	str r6, [sp, #4]
	str r5, [sp, #8]
	movs r2, #0x4a
	movs r3, #6
	bl sub_0801A690
	bl sub_0801B1A0
	bl sub_0801B20C
	bl sub_0801A794
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B354: .4byte gUnk_02029810
_0801B358: .4byte gUnk_02000000
_0801B35C: .4byte 0x00006C2C
_0801B360: .4byte 0x00000674
_0801B364: .4byte 0x00000675

	thumb_func_start sub_0801B368
sub_0801B368: @ 0x0801B368
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r6, _0801B3B8 @ =gUnk_02029810
	movs r0, #0x14
	mov sl, r0
	ldr r0, _0801B3BC @ =gUnk_02000000
	ldr r1, _0801B3C0 @ =0x00006C2C
	adds r1, r1, r0
	mov r8, r1
	movs r7, #7
	adds r0, r7, #0
	ldrb r2, [r1]
	ands r0, r2
	movs r3, #3
	rsbs r3, r3, #0
	mov sb, r3
	cmp r0, #0
	bne _0801B398
	movs r0, #2
	mov sb, r0
_0801B398:
	ldr r1, _0801B3C4 @ =gUnk_09E3C6AB
	add r0, sp, #0x18
	movs r2, #6
	bl memcpy
	ldr r1, _0801B3C8 @ =0x00000665
	adds r3, r6, r1
	ldrb r2, [r3]
	lsrs r4, r2, #4
	cmp r4, #1
	beq _0801B49C
	cmp r4, #1
	bgt _0801B3CC
	cmp r4, #0
	beq _0801B3D4
	b _0801B5B6
	.align 2, 0
_0801B3B8: .4byte gUnk_02029810
_0801B3BC: .4byte gUnk_02000000
_0801B3C0: .4byte 0x00006C2C
_0801B3C4: .4byte gUnk_09E3C6AB
_0801B3C8: .4byte 0x00000665
_0801B3CC:
	cmp r4, #2
	bne _0801B3D2
	b _0801B538
_0801B3D2:
	b _0801B5B6
_0801B3D4:
	movs r0, #0xa2
	lsls r0, r0, #1
	movs r1, #0x90
	bl sub_0801A6E4
	ldr r0, _0801B428 @ =0x0000103A (The Shadow Who Controls the Dark)
	bl GetInterfaceTextIdIndex
	ldr r3, _0801B42C @ =gInterfaceTextOffsets
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	mov r0, r8
	ldrb r2, [r0]
	lsls r0, r2, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1]
	ldr r0, _0801B430 @ =gInterfaceText
	adds r5, r1, r0
	adds r0, r7, #0
	ands r0, r2
	cmp r0, #0
	bne _0801B44C
	adds r0, r5, #0
	bl GL_Strlen
	adds r1, r0, #0
	adds r0, r7, #0
	mov r2, r8
	ldrb r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _0801B434
	lsls r0, r1, #1
	adds r0, r0, r1
	b _0801B43A
	.align 2, 0
_0801B428: .4byte 0x0000103A @ The Shadow Who Controls the Dark
_0801B42C: .4byte gInterfaceTextOffsets
_0801B430: .4byte gInterfaceText
_0801B434:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #1
_0801B43A:
	movs r1, #0x5c
	subs r1, r1, r0
	ldr r3, _0801B448 @ =0x00000673
	adds r0, r6, r3
	strb r1, [r0]
	b _0801B452
	.align 2, 0
_0801B448: .4byte 0x00000673
_0801B44C:
	ldr r1, _0801B490 @ =0x00000673
	adds r0, r6, r1
	strb r4, [r0]
_0801B452:
	movs r1, #0xa2
	lsls r1, r1, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r2, #0x18
	movs r3, #6
	bl sub_0801A6B4
	ldr r2, _0801B494 @ =0x00000672
	adds r1, r6, r2
	movs r0, #8
	strb r0, [r1]
	movs r1, #8
	rsbs r1, r1, #0
	movs r0, #0x2f
	movs r2, #8
	bl sub_080147D8
	ldr r0, _0801B498 @ =0x00000665
	adds r3, r6, r0
	ldrb r2, [r3]
	lsrs r1, r2, #4
	adds r1, #1
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	b _0801B5B6
	.align 2, 0
_0801B490: .4byte 0x00000673
_0801B494: .4byte 0x00000672
_0801B498: .4byte 0x00000665
_0801B49C:
	movs r5, #0
	ldr r0, _0801B4C4 @ =0x00000672
	adds r1, r6, r0
	ldrb r0, [r1]
	cmp r0, #0
	beq _0801B4C8
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #5
	rsbs r0, r1, #0
	cmp r0, #0
	bge _0801B4BE
	adds r0, #7
_0801B4BE:
	asrs r5, r0, #3
	b _0801B4D2
	.align 2, 0
_0801B4C4: .4byte 0x00000672
_0801B4C8:
	movs r0, #0xf
	ands r0, r2
	movs r1, #0x20
	orrs r0, r1
	strb r0, [r3]
_0801B4D2:
	ldr r0, _0801B52C @ =gUnk_02000000
	ldr r1, _0801B530 @ =0x00006C2C
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	add r0, sp
	adds r0, #0x18
	ldrb r1, [r0]
	movs r2, #0x40
	adds r3, r2, r5
	movs r4, #0
	str r4, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0
	mov r2, sl
	bl sub_0801A49C
	movs r0, #0xa2
	lsls r0, r0, #1
	ldr r3, _0801B534 @ =0x00000673
	adds r1, r6, r3
	ldrb r1, [r1]
	adds r1, #8
	add r1, sl
	subs r1, #2
	adds r2, r5, #0
	adds r2, #9
	adds r2, #0x40
	add r2, sb
	movs r3, #6
	str r3, [sp]
	str r4, [sp, #4]
	movs r3, #9
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r3, #0x18
	bl sub_0801A560
	b _0801B5B6
	.align 2, 0
_0801B52C: .4byte gUnk_02000000
_0801B530: .4byte 0x00006C2C
_0801B534: .4byte 0x00000673
_0801B538:
	ldr r1, _0801B5C8 @ =gUnk_03000040
	movs r0, #0xa4
	lsls r0, r0, #1
	adds r1, r1, r0
	ldr r0, _0801B5CC @ =0x0000030F
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801B56C
	movs r0, #0xf
	ands r0, r2
	strb r0, [r3]
	ldr r2, _0801B5D0 @ =0x00000662
	adds r1, r6, r2
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	movs r0, #0x2f
	movs r1, #0
	movs r2, #8
	bl sub_080147D8
	movs r0, #0x24
	bl sub_080F9AB4
_0801B56C:
	mov r1, r8
	ldrb r1, [r1]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	add r0, sp
	adds r0, #0x18
	ldrb r1, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #0xa
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #0
	movs r2, #0x14
	movs r3, #0x40
	bl sub_0801A49C
	movs r0, #0xa2
	lsls r0, r0, #1
	ldr r2, _0801B5D4 @ =0x00000673
	adds r1, r6, r2
	ldrb r1, [r1]
	adds r1, #0x1a
	mov r2, sb
	adds r2, #0x49
	movs r3, #6
	str r3, [sp]
	str r4, [sp, #4]
	movs r3, #9
	str r3, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r3, #0x18
	bl sub_0801A560
_0801B5B6:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B5C8: .4byte gUnk_03000040
_0801B5CC: .4byte 0x0000030F
_0801B5D0: .4byte 0x00000662
_0801B5D4: .4byte 0x00000673

	thumb_func_start sub_0801B5D8
sub_0801B5D8: @ 0x0801B5D8
	push {r4, lr}
	ldr r4, _0801B5F0 @ =gUnk_02029810
	ldr r1, _0801B5F4 @ =0x00000662
	adds r0, r4, r1
	ldrb r0, [r0]
	lsrs r0, r0, #6
	cmp r0, #0
	beq _0801B5F8
	cmp r0, #1
	beq _0801B5FE
	b _0801B602
	.align 2, 0
_0801B5F0: .4byte gUnk_02029810
_0801B5F4: .4byte 0x00000662
_0801B5F8:
	bl sub_0801B284
	b _0801B602
_0801B5FE:
	bl sub_0801B368
_0801B602:
	bl sub_0801A1AC
	bl GL_SendObjectsToOam
	bl GL_ResetObjects
	bl sub_080148F4
	cmp r0, #0
	bne _0801B628
	movs r1, #0xcc
	lsls r1, r1, #3
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bge _0801B628
	movs r0, #1
	b _0801B62E
_0801B628:
	bl sub_08014914
	movs r0, #0
_0801B62E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0801B634
sub_0801B634: @ 0x0801B634
	push {r4, lr}
	ldr r1, _0801B678 @ =gUnk_09E58994
	ldr r2, _0801B67C @ =gUnk_03000040
	movs r0, #0x81
	lsls r0, r0, #2
	adds r4, r2, r0
	ldrh r3, [r4]
	lsls r0, r3, #0x12
	lsrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	beq _0801B684
	bl _call_via_r1
	cmp r0, #0
	beq _0801B66E
	ldrh r2, [r4]
	lsls r1, r2, #0x12
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #6
	ldr r0, _0801B680 @ =0xFFFFC03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r4]
_0801B66E:
	bl sub_080FA4D4
	movs r0, #0
	b _0801B694
	.align 2, 0
_0801B678: .4byte gUnk_09E58994
_0801B67C: .4byte gUnk_03000040
_0801B680: .4byte 0xFFFFC03F
_0801B684:
	ldr r0, _0801B69C @ =gUnk_0202348C
	strb r1, [r0]
	movs r0, #0xa8
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #0xf0
	strh r0, [r1]
	movs r0, #1
_0801B694:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801B69C: .4byte gUnk_0202348C

	thumb_func_start sub_0801B6A0
sub_0801B6A0: @ 0x0801B6A0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r1, _0801B704 @ =gUnk_09E58994
	ldr r0, _0801B708 @ =gUnk_03000040
	movs r2, #0x81
	lsls r2, r2, #2
	adds r5, r0, r2
	ldr r0, [r5]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r1, #0
	beq _0801B76C
	bl _call_via_r1
	cmp r0, #0
	beq _0801B74C
	ldr r6, _0801B70C @ =gUnk_02029810
	ldr r2, [r5]
	lsls r1, r2, #0xa
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #0xe
	ldr r0, _0801B710 @ =0xFFC03FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r5]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x18
	cmp r0, #2
	bne _0801B74C
	movs r0, #0xff
	lsls r0, r0, #0x18
	ands r0, r4
	cmp r0, #0
	beq _0801B718
	ldr r3, _0801B714 @ =0x00000663
	adds r0, r6, r3
	movs r1, #0xf
	ldrb r2, [r0]
	ands r1, r2
	strb r1, [r0]
	subs r3, #7
	adds r0, r6, r3
	str r4, [r0]
	b _0801B74C
	.align 2, 0
_0801B704: .4byte gUnk_09E58994
_0801B708: .4byte gUnk_03000040
_0801B70C: .4byte gUnk_02029810
_0801B710: .4byte 0xFFC03FFF
_0801B714: .4byte 0x00000663
_0801B718:
	cmp r4, #0xb
	bls _0801B728
	ldr r0, _0801B754 @ =gUnk_09E3C584
	ldr r1, _0801B758 @ =0x000006F5
	ldr r2, _0801B75C @ =gUnk_09E3C6B4
	movs r3, #1
	bl OSi_Panic
_0801B728:
	ldr r0, _0801B760 @ =0x00000663
	adds r2, r6, r0
	lsls r0, r4, #4
	movs r1, #0xf
	ldrb r3, [r2]
	ands r1, r3
	orrs r1, r0
	strb r1, [r2]
	ldr r0, _0801B764 @ =0x0000065C
	adds r2, r6, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x1c
	lsls r0, r1, #7
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _0801B768 @ =gUnk_020053F8
	adds r0, r0, r1
	str r0, [r2]
_0801B74C:
	bl sub_080FA4D4
	movs r0, #0
	b _0801B772
	.align 2, 0
_0801B754: .4byte gUnk_09E3C584
_0801B758: .4byte 0x000006F5
_0801B75C: .4byte gUnk_09E3C6B4
_0801B760: .4byte 0x00000663
_0801B764: .4byte 0x0000065C
_0801B768: .4byte gUnk_020053F8
_0801B76C:
	ldr r0, _0801B778 @ =gUnk_0202348C
	strb r1, [r0]
	movs r0, #1
_0801B772:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801B778: .4byte gUnk_0202348C

	thumb_func_start sub_0801B77C
sub_0801B77C: @ 0x0801B77C
	adds r2, r0, #0
	ldr r1, _0801B798 @ =gUnk_02000000
	ldr r0, _0801B79C @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801B794
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r2, r0, #1
_0801B794:
	adds r0, r2, #0
	bx lr
	.align 2, 0
_0801B798: .4byte gUnk_02000000
_0801B79C: .4byte 0x00006C2C

	thumb_func_start sub_0801B7A0
sub_0801B7A0: @ 0x0801B7A0
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _0801B7CC @ =gUnk_02000000
	ldr r2, _0801B7D0 @ =0x00006C2C
	adds r0, r0, r2
	movs r4, #7
	ldrb r0, [r0]
	ands r4, r0
	cmp r4, #0
	bne _0801B7D4
	ldrb r2, [r3]
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _0801B7D4
	strb r2, [r1]
	ldrb r0, [r3, #1]
	strb r0, [r1, #1]
	strb r4, [r1, #2]
	movs r0, #2
	b _0801B7DE
	.align 2, 0
_0801B7CC: .4byte gUnk_02000000
_0801B7D0: .4byte 0x00006C2C
_0801B7D4:
	ldrb r0, [r3]
	strb r0, [r1]
	movs r0, #0
	strb r0, [r1, #1]
	movs r0, #1
_0801B7DE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0801B7E4
sub_0801B7E4: @ 0x0801B7E4
	movs r0, #0
	bx lr

	thumb_func_start sub_0801B7E8
sub_0801B7E8: @ 0x0801B7E8
	push {lr}
	sub sp, #4
	ldr r1, _0801B83C @ =gUnk_02029EC0
	movs r0, #0
	str r0, [sp]
	ldr r2, _0801B840 @ =0x05000026
	mov r0, sp
	bl CpuSet
	bl sub_08014638
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0x40
	strh r0, [r1]
	adds r1, #8
	movs r0, #0xe8
	lsls r0, r0, #5
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0801B844 @ =0x00001E01
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0801B848 @ =0x00001F02
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0801B84C @ =0x00009B0B
	strh r0, [r1]
	movs r1, #0x10
	rsbs r1, r1, #0
	movs r0, #0x3f
	bl sub_080146FC
	bl GL_InitializeObjects
	bl sub_080156AC
	movs r0, #1
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_0801B83C: .4byte gUnk_02029EC0
_0801B840: .4byte 0x05000026
_0801B844: .4byte 0x00001E01
_0801B848: .4byte 0x00001F02
_0801B84C: .4byte 0x00009B0B

	thumb_func_start sub_0801B850
sub_0801B850: @ 0x0801B850
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #0x2c
	mov sb, r0
	mov sl, r1
	adds r5, r2, #0
	mov r8, r3
	ldr r6, [sp, #0x48]
	ldr r4, _0801B910 @ =gUnk_02029EC0
	ldr r0, _0801B914 @ =gUnk_09E3CEE8
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #0x24]
	str r1, [sp, #0x28]
	mov r0, sp
	bl sub_08015FC8
	adds r4, #0x88
	ldr r0, [r4]
	str r0, [sp]
	mov r1, sp
	movs r0, #0xf
	ands r5, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x14]
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, #0x14]
	movs r0, #0x7f
	mov r2, r8
	ands r2, r0
	mov r8, r2
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x18]
	ands r0, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1, #0x18]
	movs r0, #0x7f
	ands r6, r0
	lsls r6, r6, #7
	ldr r0, _0801B918 @ =0xFFFFC07F
	ldrh r2, [r1, #0x18]
	ands r0, r2
	orrs r0, r6
	strh r0, [r1, #0x18]
	movs r0, #0x40
	ldrb r2, [r1, #0x17]
	orrs r0, r2
	strb r0, [r1, #0x17]
	mov r0, sb
	lsls r0, r0, #2
	mov sb, r0
	add r0, sp, #0x24
	add sb, r0
	mov r1, sb
	ldr r0, [r1]
	str r0, [sp, #0x20]
	mov r1, sp
	mov r2, sl
	mvns r2, r2
	lsls r2, r2, #7
	mov sl, r2
	movs r0, #0x7f
	ldrb r2, [r1, #0x17]
	ands r0, r2
	mov r2, sl
	orrs r0, r2
	strb r0, [r1, #0x17]
	ldr r0, [sp, #0x18]
	movs r1, #0xe0
	lsls r1, r1, #9
	orrs r0, r1
	str r0, [sp, #0x18]
	movs r0, #0x40
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #8]
	mov r0, sp
	strh r1, [r0, #0x10]
	bl sub_08016A7C
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801B910: .4byte gUnk_02029EC0
_0801B914: .4byte gUnk_09E3CEE8
_0801B918: .4byte 0xFFFFC07F

	thumb_func_start sub_0801B91C
sub_0801B91C: @ 0x0801B91C
	push {lr}
	sub sp, #4
	cmp r0, #0
	bne _0801B934
	ldr r0, [sp, #0xc]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r3, [sp, #8]
	bl sub_0801B850
_0801B934:
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801B93C
sub_0801B93C: @ 0x0801B93C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r1, #0
	bl GL_OpenFile
	adds r7, r0, #0
	mov r0, sp
	bl sub_08015FC8
	str r7, [sp]
	mov r1, sp
	movs r5, #0x10
	rsbs r5, r5, #0
	adds r0, r5, #0
	ldrb r2, [r1, #0x14]
	ands r0, r2
	movs r2, #3
	mov sb, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r1, #0x14]
	movs r6, #0x80
	rsbs r6, r6, #0
	adds r0, r6, #0
	ldrb r2, [r1, #0x18]
	ands r0, r2
	strb r0, [r1, #0x18]
	ldr r4, _0801BA00 @ =0xFFFFC07F
	adds r0, r4, #0
	ldrh r2, [r1, #0x18]
	ands r0, r2
	strh r0, [r1, #0x18]
	movs r0, #0
	mov r8, r0
	str r0, [sp, #8]
	movs r1, #0x41
	mov sl, r1
	str r1, [sp, #0xc]
	mov r0, sp
	mov r2, r8
	strh r2, [r0, #0x10]
	bl sub_08016A7C
	mov r0, sp
	bl sub_08015FC8
	str r7, [sp]
	mov r0, sp
	ldrb r1, [r0, #0x14]
	ands r5, r1
	mov r2, sb
	orrs r5, r2
	strb r5, [r0, #0x14]
	ldrb r1, [r0, #0x18]
	ands r6, r1
	strb r6, [r0, #0x18]
	mov r1, sp
	ldrh r2, [r1, #0x18]
	ands r4, r2
	movs r2, #0xa0
	lsls r2, r2, #4
	adds r0, r2, #0
	orrs r4, r0
	strh r4, [r1, #0x18]
	mov r0, r8
	str r0, [sp, #8]
	movs r0, #0x80
	ldrb r2, [r1, #0x17]
	orrs r0, r2
	strb r0, [r1, #0x17]
	mov r0, sl
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	movs r1, #0xe0
	lsls r1, r1, #9
	orrs r0, r1
	str r0, [sp, #0x18]
	mov r0, sp
	mov r1, r8
	strh r1, [r0, #0x10]
	bl sub_08016A7C
	movs r0, #0xa0
	lsls r0, r0, #0x13
	mov r2, r8
	strh r2, [r0]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801BA00: .4byte 0xFFFFC07F

	thumb_func_start sub_0801BA04
sub_0801BA04: @ 0x0801BA04
	push {r4, r5, r6, lr}
	sub sp, #0x24
	ldr r4, _0801BA44 @ =gUnk_02029EC0
	add r2, sp, #0x14
	ldr r1, _0801BA48 @ =gUnk_09E3CF60
	ldm r1!, {r3, r5, r6}
	stm r2!, {r3, r5, r6}
	ldr r1, [r1]
	str r1, [r2]
	adds r1, r4, #4
	adds r2, r4, #0
	adds r2, #8
	movs r5, #0
	str r5, [sp]
	movs r3, #1
	str r3, [sp, #4]
	lsls r0, r0, #4
	add r0, sp
	adds r0, #0x14
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r3, #0
	bl sub_08015D30
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801BA44: .4byte gUnk_02029EC0
_0801BA48: .4byte gUnk_09E3CF60

	thumb_func_start sub_0801BA4C
sub_0801BA4C: @ 0x0801BA4C
	push {lr}
	movs r0, #0
	bl sub_0801BA04
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801BA5C
sub_0801BA5C: @ 0x0801BA5C
	ldr r3, _0801BA6C @ =0x000001FF
	ands r0, r3
	ldr r2, _0801BA70 @ =0x0400001C
	strh r0, [r2]
	ands r1, r3
	ldr r0, _0801BA74 @ =0x0400001E
	strh r1, [r0]
	bx lr
	.align 2, 0
_0801BA6C: .4byte 0x000001FF
_0801BA70: .4byte 0x0400001C
_0801BA74: .4byte 0x0400001E

	thumb_func_start sub_0801BA78
sub_0801BA78: @ 0x0801BA78
	push {r4, r5, lr}
	ldr r0, _0801BAC8 @ =gUnk_02029EC0
	adds r4, r0, #0
	adds r4, #0x8c
	ldrh r1, [r4]
	lsls r0, r1, #0x17
	lsrs r0, r0, #0x18
	movs r1, #0xa0
	bl __modsi3
	adds r1, r0, #0
	movs r0, #0
	bl sub_0801BA5C
	ldrh r1, [r4]
	lsls r0, r1, #0x17
	lsrs r0, r0, #0x18
	adds r0, #1
	movs r5, #0xff
	ands r0, r5
	lsls r0, r0, #1
	ldr r3, _0801BACC @ =0xFFFFFE01
	adds r2, r3, #0
	ands r2, r1
	orrs r2, r0
	strh r2, [r4]
	lsls r0, r2, #0x17
	lsrs r0, r0, #0x18
	cmp r0, #0xa0
	ble _0801BAC0
	subs r0, #0xa0
	ands r0, r5
	lsls r0, r0, #1
	ands r2, r3
	orrs r2, r0
	strh r2, [r4]
_0801BAC0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801BAC8: .4byte gUnk_02029EC0
_0801BACC: .4byte 0xFFFFFE01

	thumb_func_start sub_0801BAD0
sub_0801BAD0: @ 0x0801BAD0
	push {r4, r5, lr}
	ldr r0, _0801BB20 @ =gUnk_02029EC0
	adds r4, r0, #0
	adds r4, #0x8c
	ldrh r1, [r4]
	lsls r0, r1, #0x17
	lsrs r0, r0, #0x18
	movs r1, #0xf0
	bl __modsi3
	rsbs r0, r0, #0
	movs r1, #0
	bl sub_0801BA5C
	ldrh r1, [r4]
	lsls r0, r1, #0x17
	lsrs r0, r0, #0x18
	adds r0, #2
	movs r5, #0xff
	ands r0, r5
	lsls r0, r0, #1
	ldr r3, _0801BB24 @ =0xFFFFFE01
	adds r2, r3, #0
	ands r2, r1
	orrs r2, r0
	strh r2, [r4]
	lsls r0, r2, #0x17
	lsrs r0, r0, #0x18
	cmp r0, #0xf0
	ble _0801BB18
	subs r0, #0xf0
	ands r0, r5
	lsls r0, r0, #1
	ands r2, r3
	orrs r2, r0
	strh r2, [r4]
_0801BB18:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801BB20: .4byte gUnk_02029EC0
_0801BB24: .4byte 0xFFFFFE01

	thumb_func_start sub_0801BB28
sub_0801BB28: @ 0x0801BB28
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r7, _0801BB94 @ =gUnk_02029EC0
	lsls r2, r2, #0xc
	str r2, [sp, #0x20]
	lsls r3, r3, #0xc
	str r3, [sp, #0x24]
	lsls r4, r5, #2
	adds r0, r4, r7
	ldr r0, [r0]
	bl sub_08015718
	cmp r5, r0
	blt _0801BB54
	ldr r0, _0801BB98 @ =gUnk_09E3CF70
	ldr r2, _0801BB9C @ =gUnk_09E3CF84
	movs r1, #0xef
	movs r3, #1
	bl OSi_Panic
_0801BB54:
	adds r0, r7, #0
	adds r0, #8
	adds r0, r4, r0
	ldr r4, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r6, r0
	bne _0801BBA0
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r4, #0
	bl sub_0801571C
	adds r0, r4, #0
	bl sub_080156C8
	cmp r0, #0
	bne _0801BBAA
	movs r1, #2
	subs r0, r5, #5
	cmp r0, #0xa
	bhi _0801BB82
	movs r1, #1
_0801BB82:
	adds r0, r4, #0
	bl sub_080156E0
	adds r0, r4, #0
	movs r1, #1
	bl sub_080156CC
	b _0801BBAA
	.align 2, 0
_0801BB94: .4byte gUnk_02029EC0
_0801BB98: .4byte gUnk_09E3CF70
_0801BB9C: .4byte gUnk_09E3CF84
_0801BBA0:
	lsls r1, r6, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_080156E0
_0801BBAA:
	ldr r1, [r4, #0x2c]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [sp, #0x40]
	str r0, [sp, #8]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	str r2, [sp, #0x18]
	str r2, [sp, #0x1c]
	movs r0, #1
	add r2, sp, #0x20
	movs r3, #0
	bl sub_08015A8C
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0801BBD4
sub_0801BBD4: @ 0x0801BBD4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r4, r0, #0
	ldr r1, _0801BC24 @ =gUnk_09E3CFBF
	add r0, sp, #8
	movs r2, #0x28
	bl memcpy
	movs r5, #0
	adds r0, r4, #0
	movs r1, #0xb
	bl __divsi3
	adds r7, r0, #0
	add r4, sp, #8
	movs r6, #0
_0801BBF4:
	cmp r7, r5
	blt _0801BC12
	lsls r1, r5, #1
	ldrb r2, [r4]
	mov r0, sp
	adds r0, #9
	adds r0, r0, r1
	ldrb r3, [r0]
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_0801BB28
_0801BC12:
	adds r4, #2
	adds r5, #1
	cmp r5, #0x13
	ble _0801BBF4
	add sp, #0x30
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801BC24: .4byte gUnk_09E3CFBF

	thumb_func_start sub_0801BC28
sub_0801BC28: @ 0x0801BC28
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r0, r5, #2
	adds r0, r0, r5
	lsls r0, r0, #4
	bl __divsi3
	adds r6, r0, #0
	cmp r5, r4
	bne _0801BC8A
	ldr r3, _0801BCA8 @ =0x04000048
	movs r2, #0x20
	rsbs r2, r2, #0
	ldrh r1, [r3]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #0x3b
	orrs r0, r1
	strh r0, [r3]
	ldr r1, _0801BCAC @ =0x0400004A
	ldrh r0, [r1]
	ands r2, r0
	strh r2, [r1]
	subs r1, #0xa
	movs r0, #0xf0
	strh r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	movs r3, #0x80
	lsls r3, r3, #6
	ldr r0, _0801BCB0 @ =0xFFFF9FFF
	ldrh r1, [r2]
	ands r0, r1
	orrs r0, r3
	strh r0, [r2]
	movs r0, #0x3f
	movs r1, #0
	bl sub_080146FC
	movs r1, #0x10
	rsbs r1, r1, #0
	movs r0, #0x3f
	adds r2, r5, #0
	bl sub_080147D8
_0801BC8A:
	adds r0, r6, #0
	adds r0, #0x50
	lsls r0, r0, #0x18
	movs r1, #0x50
	subs r1, r1, r6
	lsls r1, r1, #0x18
	lsrs r0, r0, #8
	orrs r0, r1
	lsrs r0, r0, #0x10
	ldr r1, _0801BCB4 @ =0x04000044
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801BCA8: .4byte 0x04000048
_0801BCAC: .4byte 0x0400004A
_0801BCB0: .4byte 0xFFFF9FFF
_0801BCB4: .4byte 0x04000044

	thumb_func_start sub_0801BCB8
sub_0801BCB8: @ 0x0801BCB8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	subs r1, r4, r5
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r1, r4, #0
	bl __divsi3
	adds r1, r0, #0
	adds r1, #0x50
	lsls r1, r1, #0x18
	movs r2, #0x50
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r1, r1, #8
	orrs r1, r2
	lsrs r1, r1, #0x10
	ldr r0, _0801BD04 @ =0x04000044
	strh r1, [r0]
	cmp r5, r4
	bne _0801BCFE
	movs r1, #0x10
	rsbs r1, r1, #0
	movs r0, #0x3f
	bl sub_080146FC
	bl sub_08014914
	movs r0, #0x3f
	movs r1, #0
	adds r2, r5, #0
	bl sub_080147D8
_0801BCFE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801BD04: .4byte 0x04000044

	thumb_func_start sub_0801BD08
sub_0801BD08: @ 0x0801BD08
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r6, _0801BD30 @ =gUnk_02029EC0
	adds r0, r6, #0
	adds r0, #0x8c
	ldr r0, [r0]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x18
	cmp r0, #6
	bls _0801BD26
	b _0801C21C
_0801BD26:
	lsls r0, r0, #2
	ldr r1, _0801BD34 @ =_0801BD38
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801BD30: .4byte gUnk_02029EC0
_0801BD34: .4byte _0801BD38
_0801BD38: @ jump table
	.4byte _0801BD54 @ case 0
	.4byte _0801BDDC @ case 1
	.4byte _0801BE30 @ case 2
	.4byte _0801BF9C @ case 3
	.4byte _0801BFD8 @ case 4
	.4byte _0801C0C8 @ case 5
	.4byte _0801C208 @ case 6
_0801BD54:
	ldr r0, _0801BDCC @ =gUnk_09E3CFE8
	bl sub_0801B93C
	ldr r0, _0801BDD0 @ =gUnk_09E3D004
	movs r1, #0
	bl GL_OpenFile
	adds r1, r6, #0
	adds r1, #0x88
	str r0, [r1]
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801B91C
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #2
	bl sub_0801B91C
	bl sub_0801BA78
	movs r0, #0x28
	movs r1, #0
	movs r2, #0x3c
	bl sub_080147D8
	movs r2, #0x80
	lsls r2, r2, #0x13
	movs r3, #0xc0
	lsls r3, r3, #5
	ldr r0, _0801BDD4 @ =0xFFFFE0FF
	ldrh r1, [r2]
	ands r0, r1
	orrs r0, r3
	strh r0, [r2]
	movs r0, #3
	bl sub_080F9ADC
	adds r3, r6, #0
	adds r3, #0x8c
	ldr r2, [r3]
	lsls r1, r2, #0xf
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #9
	ldr r0, _0801BDD8 @ =0xFFFE01FF
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	b _0801C21C
	.align 2, 0
_0801BDCC: .4byte gUnk_09E3CFE8
_0801BDD0: .4byte gUnk_09E3D004
_0801BDD4: .4byte 0xFFFFE0FF
_0801BDD8: .4byte 0xFFFE01FF
_0801BDDC:
	bl sub_080148F4
	cmp r0, #0
	bne _0801BE20
	adds r1, r6, #0
	adds r1, #0x8e
	ldr r0, _0801BE28 @ =0xFFFFFE01
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	adds r1, #1
	movs r0, #1
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r3, r6, #0
	adds r3, #0x8c
	ldr r2, [r3]
	lsls r1, r2, #0xf
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #9
	ldr r0, _0801BE2C @ =0xFFFE01FF
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0801BE20:
	bl sub_0801BA78
	b _0801C21C
	.align 2, 0
_0801BE28: .4byte 0xFFFFFE01
_0801BE2C: .4byte 0xFFFE01FF
_0801BE30:
	ldr r1, _0801BE98 @ =gUnk_09E3D01F
	add r0, sp, #8
	movs r2, #3
	bl memcpy
	adds r1, r6, #0
	adds r1, #0x8e
	ldrh r2, [r1]
	lsls r0, r2, #0x17
	lsrs r0, r0, #0x18
	mov r8, r1
	cmp r0, #0x3c
	beq _0801BE4E
	cmp r0, #0x96
	bne _0801BE9C
_0801BE4E:
	movs r2, #0x80
	lsls r2, r2, #0x13
	movs r0, #0xa0
	lsls r0, r0, #4
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	movs r0, #2
	movs r1, #8
	movs r2, #0
	movs r3, #0x10
	bl sub_08014754
	adds r0, r6, #0
	adds r0, #0x8f
	ldrb r0, [r0]
	lsrs r2, r0, #1
	adds r1, r6, #0
	adds r1, #0x90
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	lsls r0, r0, #7
	orrs r0, r2
	add r0, sp
	adds r0, #8
	ldrb r2, [r0]
	movs r3, #0x10
	subs r3, r3, r2
	movs r0, #0xf
	str r0, [sp]
	movs r0, #2
	movs r1, #8
	bl sub_08014838
	b _0801BF70
	.align 2, 0
_0801BE98: .4byte gUnk_09E3D01F
_0801BE9C:
	cmp r0, #0x4b
	beq _0801BEA4
	cmp r0, #0xa5
	bne _0801BF0E
_0801BEA4:
	adds r7, r6, #0
	adds r7, #0x8f
	ldrb r0, [r7]
	lsrs r1, r0, #1
	adds r5, r6, #0
	adds r5, #0x90
	movs r4, #1
	adds r0, r4, #0
	ldrb r2, [r5]
	ands r0, r2
	lsls r0, r0, #7
	orrs r0, r1
	add r0, sp
	adds r0, #8
	ldrb r2, [r0]
	movs r3, #0x10
	subs r3, r3, r2
	movs r0, #2
	movs r1, #8
	bl sub_08014754
	movs r0, #0xf
	str r0, [sp]
	movs r0, #2
	movs r1, #8
	movs r2, #0
	movs r3, #0x10
	bl sub_08014838
	ldrb r3, [r7]
	lsrs r0, r3, #1
	adds r1, r4, #0
	ldrb r2, [r5]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	adds r0, r4, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r7]
	lsrs r1, r1, #7
	ands r1, r4
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r5]
	ands r0, r2
	orrs r0, r1
	strb r0, [r5]
	b _0801BF70
_0801BF0E:
	cmp r0, #0xe6
	bne _0801BF70
	movs r0, #2
	movs r1, #8
	movs r2, #0
	movs r3, #0x10
	bl sub_08014754
	movs r0, #0xf
	str r0, [sp]
	movs r0, #2
	movs r1, #8
	movs r2, #0x10
	movs r3, #0
	bl sub_08014838
	adds r1, r6, #0
	adds r1, #0x8f
	movs r0, #1
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	ldr r0, _0801BF94 @ =0xFFFFFE01
	mov r1, r8
	ldrh r1, [r1]
	ands r0, r1
	movs r1, #0x78
	orrs r0, r1
	mov r2, r8
	strh r0, [r2]
	adds r3, r6, #0
	adds r3, #0x8c
	ldr r2, [r3]
	lsls r1, r2, #0xf
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #9
	ldr r0, _0801BF98 @ =0xFFFE01FF
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0801BF70:
	mov r0, r8
	ldrh r2, [r0]
	lsls r1, r2, #0x17
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #1
	ldr r0, _0801BF94 @ =0xFFFFFE01
	ands r0, r2
	orrs r0, r1
	mov r1, r8
	strh r0, [r1]
	bl sub_0801BA78
	adds r2, r6, #0
	adds r2, #0x94
	b _0801C0A4
	.align 2, 0
_0801BF94: .4byte 0xFFFFFE01
_0801BF98: .4byte 0xFFFE01FF
_0801BF9C:
	bl sub_080148F4
	cmp r0, #0
	beq _0801BFA6
	b _0801C1EC
_0801BFA6:
	adds r1, r6, #0
	adds r1, #0x8e
	ldr r0, _0801BFD0 @ =0xFFFFFE01
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
_0801BFB2:
	adds r3, r6, #0
	adds r3, #0x8c
	ldr r2, [r3]
	lsls r1, r2, #0xf
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #9
	ldr r0, _0801BFD4 @ =0xFFFE01FF
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	b _0801C1EC
	.align 2, 0
_0801BFD0: .4byte 0xFFFFFE01
_0801BFD4: .4byte 0xFFFE01FF
_0801BFD8:
	add r5, sp, #0xc
	ldr r1, _0801C0B4 @ =gUnk_09E3D022
	adds r0, r5, #0
	movs r2, #6
	bl memcpy
	add r4, sp, #0x14
	ldr r1, _0801C0B8 @ =gUnk_09E3D028
	adds r0, r4, #0
	movs r2, #6
	bl memcpy
	movs r3, #0
	movs r0, #0x8e
	adds r0, r0, r6
	mov r8, r0
	adds r1, r6, #0
	adds r1, #0x94
	str r1, [sp, #0x1c]
	mov sl, r5
	mov sb, r4
	movs r7, #0x80
	lsls r7, r7, #0x13
	ldr r5, _0801C0BC @ =0xFFFFE0FF
	mov r4, r8
_0801C00A:
	ldrh r2, [r4]
	lsls r0, r2, #0x17
	lsrs r0, r0, #0x18
	mov r2, sb
	adds r1, r2, r3
	ldrb r1, [r1]
	cmp r0, r1
	bne _0801C036
	mov r1, sl
	adds r0, r1, r3
	ldrb r0, [r0]
	movs r2, #0xa0
	lsls r2, r2, #5
	cmp r0, #0
	bne _0801C02C
	movs r2, #0x90
	lsls r2, r2, #5
_0801C02C:
	ldrh r1, [r7]
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r7]
_0801C036:
	adds r3, #1
	cmp r3, #5
	bls _0801C00A
	mov r2, r8
	ldrh r1, [r2]
	lsls r0, r1, #0x17
	lsrs r0, r0, #0x18
	cmp r0, #0x78
	bne _0801C084
	ldr r0, _0801C0C0 @ =0xFFFFFE01
	ands r0, r1
	movs r1, #0x3c
	orrs r0, r1
	strh r0, [r2]
	adds r1, r6, #0
	adds r1, #0x8f
	movs r0, #1
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #1
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r3, r6, #0
	adds r3, #0x8c
	ldr r2, [r3]
	lsls r1, r2, #0xf
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #9
	ldr r0, _0801C0C4 @ =0xFFFE01FF
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0801C084:
	mov r0, r8
	ldrh r2, [r0]
	lsls r1, r2, #0x17
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #1
	ldr r0, _0801C0C0 @ =0xFFFFFE01
	ands r0, r2
	orrs r0, r1
	mov r1, r8
	strh r0, [r1]
	bl sub_0801BA78
	ldr r2, [sp, #0x1c]
_0801C0A4:
	ldr r1, [r2]
	adds r0, r1, #0
	adds r1, #1
	str r1, [r2]
	bl sub_0801BBD4
	b _0801C21C
	.align 2, 0
_0801C0B4: .4byte gUnk_09E3D022
_0801C0B8: .4byte gUnk_09E3D028
_0801C0BC: .4byte 0xFFFFE0FF
_0801C0C0: .4byte 0xFFFFFE01
_0801C0C4: .4byte 0xFFFE01FF
_0801C0C8:
	movs r0, #0x8e
	adds r0, r0, r6
	mov r8, r0
	ldrh r2, [r0]
	lsls r0, r2, #0x17
	lsrs r4, r0, #0x18
	cmp r4, #0
	beq _0801C0DA
	b _0801C1DA
_0801C0DA:
	bl sub_080148F4
	cmp r0, #0
	beq _0801C0E4
	b _0801C1EC
_0801C0E4:
	movs r1, #0x8f
	adds r1, r1, r6
	mov sb, r1
	ldrb r2, [r1]
	lsrs r1, r2, #1
	adds r7, r6, #0
	adds r7, #0x90
	movs r0, #1
	mov sl, r0
	ldrb r2, [r7]
	ands r0, r2
	lsls r5, r0, #7
	orrs r5, r1
	cmp r5, #1
	beq _0801C164
	cmp r5, #1
	bgt _0801C10C
	cmp r5, #0
	beq _0801C112
	b _0801C1EC
_0801C10C:
	cmp r5, #2
	beq _0801C1C4
	b _0801C1EC
_0801C112:
	movs r0, #0x3f
	movs r1, #0
	bl sub_080146FC
	movs r0, #0x3f
	movs r1, #0x10
	movs r2, #0x1e
	bl sub_080147D8
	ldr r0, _0801C160 @ =0xFFFFFE01
	mov r1, r8
	ldrh r1, [r1]
	ands r0, r1
	movs r1, #0xb4
	orrs r0, r1
	mov r2, r8
	strh r0, [r2]
	mov r0, sb
	ldrb r3, [r0]
	lsrs r0, r3, #1
	mov r1, sl
	ldrb r2, [r7]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	mov r0, sl
	ands r0, r3
	orrs r0, r2
	mov r2, sb
	strb r0, [r2]
	lsrs r1, r1, #7
	mov r0, sl
	ands r1, r0
	b _0801C1B2
	.align 2, 0
_0801C160: .4byte 0xFFFFFE01
_0801C164:
	movs r0, #0x3f
	movs r1, #0x10
	bl sub_080146FC
	movs r0, #0x3f
	movs r1, #0
	movs r2, #0x1e
	bl sub_080147D8
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldr r0, _0801C1C0 @ =0xFFFFE0FF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	strh r4, [r0]
	mov r0, sb
	ldrb r4, [r0]
	lsrs r0, r4, #1
	adds r1, r5, #0
	ldrb r2, [r7]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	movs r3, #1
	adds r0, r5, #0
	ands r0, r4
	orrs r0, r2
	mov r2, sb
	strb r0, [r2]
	lsrs r1, r1, #7
	ands r1, r5
	ands r1, r3
_0801C1B2:
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r7]
	ands r0, r2
	orrs r0, r1
	strb r0, [r7]
	b _0801C1EC
	.align 2, 0
_0801C1C0: .4byte 0xFFFFE0FF
_0801C1C4:
	movs r0, #0x3f
	movs r1, #0
	bl sub_080146FC
	movs r1, #0x10
	rsbs r1, r1, #0
	movs r0, #0x3f
	movs r2, #0x1e
	bl sub_080147D8
	b _0801BFB2
_0801C1DA:
	subs r0, r4, #1
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _0801C204 @ =0xFFFFFE01
	ands r1, r2
	orrs r1, r0
	mov r0, r8
	strh r1, [r0]
_0801C1EC:
	bl sub_0801BA78
	adds r1, r6, #0
	adds r1, #0x94
	ldr r2, [r1]
	adds r0, r2, #0
	adds r2, #1
	str r2, [r1]
	bl sub_0801BBD4
	b _0801C21C
	.align 2, 0
_0801C204: .4byte 0xFFFFFE01
_0801C208:
	bl sub_080148F4
	cmp r0, #0
	bne _0801C21C
	adds r1, r6, #0
	adds r1, #0x8c
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_0801C21C:
	bl GL_SendObjectsToOam
	bl GL_ResetObjects
	bl sub_080148F4
	cmp r0, #0
	bne _0801C23C
	adds r0, r6, #0
	adds r0, #0x8c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0801C23C
	movs r0, #1
	b _0801C242
_0801C23C:
	bl sub_08014914
	movs r0, #0
_0801C242:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801C254
sub_0801C254: @ 0x0801C254
	push {r4, lr}
	ldr r1, _0801C298 @ =gUnk_09E589A4
	ldr r0, _0801C29C @ =gUnk_03000040
	movs r2, #0x81
	lsls r2, r2, #2
	adds r4, r0, r2
	ldr r0, [r4]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0801C2A4
	bl _call_via_r0
	cmp r0, #0
	beq _0801C28E
	ldr r2, [r4]
	lsls r1, r2, #0xa
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #0xe
	ldr r0, _0801C2A0 @ =0xFFC03FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r4]
_0801C28E:
	bl sub_080FA4D4
	movs r0, #0
	b _0801C2A6
	.align 2, 0
_0801C298: .4byte gUnk_09E589A4
_0801C29C: .4byte gUnk_03000040
_0801C2A0: .4byte 0xFFC03FFF
_0801C2A4:
	movs r0, #1
_0801C2A6:
	pop {r4}
	pop {r1}
	bx r1

	@ The Agent of Creation - Venus
	thumb_func_start gEngineEffectSpecialSummonDamage_0801C2AC
gEngineEffectSpecialSummonDamage_0801C2AC: @ 0x0801C2AC
	push {lr}
	sub sp, #4
	ldr r1, _0801C2F8 @ =gUnk_02029EB0
	movs r0, #0
	str r0, [sp]
	ldr r2, _0801C2FC @ =0x05000030
	mov r0, sp
	bl CpuSet
	bl sub_08014638
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldr r0, _0801C300 @ =0x00001741 (The Agent of Creation - Venus)
	strh r0, [r1]
	adds r1, #8
	ldr r0, _0801C304 @ =0x00001D81
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0801C308 @ =0x00001E82
	strh r0, [r1]
	adds r1, #2
	ldr r0, _0801C30C @ =0x00001F8B
	strh r0, [r1]
	movs r1, #0x10
	rsbs r1, r1, #0
	movs r0, #0x3f
	bl sub_080146FC
	bl GL_InitializeObjects
	bl sub_080156AC
	movs r0, #1
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_0801C2F8: .4byte gUnk_02029EB0
_0801C2FC: .4byte 0x05000030
_0801C300: .4byte 0x00001741 @ The Agent of Creation - Venus
_0801C304: .4byte 0x00001D81
_0801C308: .4byte 0x00001E82
_0801C30C: .4byte 0x00001F8B

	thumb_func_start sub_0801C310
sub_0801C310: @ 0x0801C310
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x40
	adds r7, r0, #0
	str r1, [sp, #0x3c]
	mov sb, r2
	mov r8, r3
	ldr r4, [sp, #0x60]
	ldr r5, _0801C3E4 @ =gUnk_02029EB0
	add r0, sp, #0x24
	mov sl, r0
	mov r1, sl
	ldr r0, _0801C3E8 @ =gUnk_09E3D834
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldr r0, [r0]
	str r0, [r1]
	add r6, sp, #0x34
	ldr r1, _0801C3EC @ =gUnk_09E3D844
	adds r0, r6, #0
	movs r2, #8
	bl memcpy
	mov r0, sp
	bl sub_08015FC8
	adds r5, #0x88
	ldr r0, [r5]
	str r0, [sp]
	mov r1, sp
	movs r0, #0xf
	mov r2, sb
	ands r2, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r3, [r1, #0x14]
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #0x14]
	lsls r2, r7, #1
	adds r6, r6, r2
	ldrb r6, [r6]
	add r8, r6
	movs r0, #0x7f
	mov r6, r8
	ands r6, r0
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r3, [r1, #0x18]
	ands r0, r3
	orrs r0, r6
	strb r0, [r1, #0x18]
	mov r0, sp
	adds r0, #0x35
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r4, r0, r4
	movs r0, #0x7f
	ands r4, r0
	lsls r4, r4, #7
	ldr r0, _0801C3F0 @ =0xFFFFC07F
	ldrh r6, [r1, #0x18]
	ands r0, r6
	orrs r0, r4
	strh r0, [r1, #0x18]
	movs r0, #0x40
	ldrb r2, [r1, #0x17]
	orrs r0, r2
	strb r0, [r1, #0x17]
	lsls r0, r7, #2
	add sl, r0
	mov r3, sl
	ldr r0, [r3]
	str r0, [sp, #0x20]
	ldr r6, [sp, #0x3c]
	mvns r0, r6
	lsls r2, r0, #7
	movs r0, #0x7f
	ldrb r3, [r1, #0x17]
	ands r0, r3
	orrs r0, r2
	strb r0, [r1, #0x17]
	ldr r0, [sp, #0x18]
	movs r1, #0xe0
	lsls r1, r1, #9
	orrs r0, r1
	str r0, [sp, #0x18]
	movs r0, #0x40
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #8]
	mov r0, sp
	strh r1, [r0, #0x10]
	bl sub_08016A7C
	add sp, #0x40
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801C3E4: .4byte gUnk_02029EB0
_0801C3E8: .4byte gUnk_09E3D834
_0801C3EC: .4byte gUnk_09E3D844
_0801C3F0: .4byte 0xFFFFC07F

	thumb_func_start sub_0801C3F4
sub_0801C3F4: @ 0x0801C3F4
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r4, r2, #0
	adds r6, r3, #0
	ldr r5, [sp, #0x34]
	mov r0, sp
	bl sub_08015FC8
	ldr r0, _0801C478 @ =gUnk_09E3D84C
	movs r1, #0
	bl GL_OpenFile
	str r0, [sp]
	mov r1, sp
	movs r0, #0xf
	ands r4, r0
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x14]
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, #0x14]
	movs r0, #0x7f
	ands r6, r0
	movs r0, #0x80
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x18]
	ands r0, r2
	orrs r0, r6
	strb r0, [r1, #0x18]
	movs r0, #0x7f
	ands r5, r0
	lsls r5, r5, #7
	ldr r0, _0801C47C @ =0xFFFFC07F
	ldrh r2, [r1, #0x18]
	ands r0, r2
	orrs r0, r5
	strh r0, [r1, #0x18]
	movs r0, #0x41
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x17]
	ands r0, r2
	strb r0, [r1, #0x17]
	ldr r0, [sp, #0x18]
	ldr r1, _0801C480 @ =0xFFFE3FFF
	ands r0, r1
	str r0, [sp, #0x18]
	movs r0, #0x41
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #8]
	mov r0, sp
	strh r1, [r0, #0x10]
	mov r1, sp
	movs r0, #4
	ldrb r2, [r1, #0x1b]
	orrs r0, r2
	strb r0, [r1, #0x1b]
	mov r0, sp
	bl sub_08016A7C
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801C478: .4byte gUnk_09E3D84C
_0801C47C: .4byte 0xFFFFC07F
_0801C480: .4byte 0xFFFE3FFF

	thumb_func_start sub_0801C484
sub_0801C484: @ 0x0801C484
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r3, #0
	ldr r5, [sp, #0x10]
	ldr r3, [sp, #0x14]
	cmp r0, #0
	beq _0801C498
	cmp r0, #1
	beq _0801C4A8
	b _0801C4B6
_0801C498:
	str r3, [sp]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0801C310
	b _0801C4B6
_0801C4A8:
	str r3, [sp]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_0801C3F4
_0801C4B6:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801C4C0
sub_0801C4C0: @ 0x0801C4C0
	push {r4, r5, r6, lr}
	sub sp, #0x34
	ldr r4, _0801C504 @ =gUnk_02029EB0
	add r2, sp, #0x14
	ldr r1, _0801C508 @ =gUnk_09E3D964
	ldm r1!, {r3, r5, r6}
	stm r2!, {r3, r5, r6}
	ldm r1!, {r3, r5, r6}
	stm r2!, {r3, r5, r6}
	ldm r1!, {r3, r5}
	stm r2!, {r3, r5}
	adds r1, r4, #4
	adds r2, r4, #0
	adds r2, #8
	movs r5, #0
	str r5, [sp]
	movs r3, #1
	str r3, [sp, #4]
	lsls r0, r0, #4
	add r0, sp
	adds r0, #0x14
	str r0, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r3, #0
	bl sub_08015D30
	add sp, #0x34
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801C504: .4byte gUnk_02029EB0
_0801C508: .4byte gUnk_09E3D964

	thumb_func_start sub_0801C50C
sub_0801C50C: @ 0x0801C50C
	push {lr}
	movs r2, #0
	ldr r0, _0801C538 @ =0x080000AE
	ldrh r0, [r0]
	lsrs r0, r0, #8
	cmp r0, #0x4a
	bne _0801C52A
	ldr r1, _0801C53C @ =gUnk_02000000
	ldr r0, _0801C540 @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801C52C
_0801C52A:
	movs r2, #1
_0801C52C:
	adds r0, r2, #0
	bl sub_0801C4C0
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0801C538: .4byte 0x080000AE
_0801C53C: .4byte gUnk_02000000
_0801C540: .4byte 0x00006C2C

	thumb_func_start sub_0801C544
sub_0801C544: @ 0x0801C544
	ldr r3, _0801C554 @ =0x000001FF
	ands r0, r3
	ldr r2, _0801C558 @ =0x0400001C
	strh r0, [r2]
	ands r1, r3
	ldr r0, _0801C55C @ =0x0400001E
	strh r1, [r0]
	bx lr
	.align 2, 0
_0801C554: .4byte 0x000001FF
_0801C558: .4byte 0x0400001C
_0801C55C: .4byte 0x0400001E

	thumb_func_start sub_0801C560
sub_0801C560: @ 0x0801C560
	push {r4, lr}
	ldr r0, _0801C598 @ =gUnk_02029EB0
	adds r4, r0, #0
	adds r4, #0x8c
	ldrb r0, [r4]
	movs r1, #0xa0
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	bl sub_0801C544
	ldrb r1, [r4]
	adds r0, r1, #2
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xa0
	bls _0801C590
	adds r0, r1, #0
	adds r0, #0x62
	strb r0, [r4]
_0801C590:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C598: .4byte gUnk_02029EB0

	thumb_func_start sub_0801C59C
sub_0801C59C: @ 0x0801C59C
	push {r4, lr}
	ldr r0, _0801C5D4 @ =gUnk_02029EB0
	adds r4, r0, #0
	adds r4, #0x8c
	ldrb r0, [r4]
	movs r1, #0xf0
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	rsbs r0, r0, #0
	movs r1, #0
	bl sub_0801C544
	ldrb r1, [r4]
	adds r0, r1, #2
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf0
	bls _0801C5CC
	adds r0, r1, #0
	adds r0, #0x12
	strb r0, [r4]
_0801C5CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801C5D4: .4byte gUnk_02029EB0

	thumb_func_start sub_0801C5D8
sub_0801C5D8: @ 0x0801C5D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r7, _0801C628 @ =gUnk_02029EB0
	lsls r2, r2, #0xc
	str r2, [sp, #0x20]
	lsls r3, r3, #0xc
	str r3, [sp, #0x24]
	lsls r6, r4, #2
	adds r0, r6, r7
	ldr r0, [r0]
	bl sub_08015718
	cmp r4, r0
	blt _0801C604
	ldr r0, _0801C62C @ =gUnk_09E3D984
	ldr r2, _0801C630 @ =gUnk_09E3D994
	movs r1, #0xf2
	movs r3, #1
	bl OSi_Panic
_0801C604:
	adds r0, r7, #0
	adds r0, #8
	adds r0, r6, r0
	ldr r4, [r0]
	movs r0, #2
	rsbs r0, r0, #0
	cmp r5, r0
	beq _0801C63E
	adds r0, #1
	cmp r5, r0
	bne _0801C634
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r4, #0
	bl sub_0801571C
	b _0801C63E
	.align 2, 0
_0801C628: .4byte gUnk_02029EB0
_0801C62C: .4byte gUnk_09E3D984
_0801C630: .4byte gUnk_09E3D994
_0801C634:
	lsls r1, r5, #0x10
	lsrs r1, r1, #0x10
	adds r0, r4, #0
	bl sub_080156E0
_0801C63E:
	ldr r1, [r4, #0x2c]
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [sp, #0x40]
	str r0, [sp, #8]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	str r2, [sp, #0x18]
	str r2, [sp, #0x1c]
	movs r0, #1
	add r2, sp, #0x20
	movs r3, #0
	bl sub_08015A8C
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0801C668
sub_0801C668: @ 0x0801C668
	push {lr}
	sub sp, #0x24
	adds r3, r0, #0
	movs r2, #0x90
	lsls r2, r2, #6
	movs r0, #0x40
	str r0, [sp]
	str r0, [sp, #4]
	subs r0, #0x78
	str r0, [sp, #8]
	adds r0, #0x28
	str r0, [sp, #0xc]
	add r0, sp, #0x14
	str r0, [sp, #0x10]
	movs r0, #2
	adds r1, r2, #0
	bl sub_08015868
	add sp, #0x24
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801C694
sub_0801C694: @ 0x0801C694
	push {lr}
	ldr r1, _0801C6AC @ =gUnk_02029EB0
	adds r1, #0x90
	ldrb r0, [r1]
	adds r2, r0, #1
	strb r2, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl sub_0801C668
	pop {r0}
	bx r0
	.align 2, 0
_0801C6AC: .4byte gUnk_02029EB0

	thumb_func_start sub_0801C6B0
sub_0801C6B0: @ 0x0801C6B0
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r5, _0801C704 @ =gUnk_02029EB0
	movs r1, #0xd
	bl __modsi3
	adds r4, r0, #0
	cmp r4, #0
	bne _0801C6FA
	ldr r1, _0801C708 @ =gUnk_09E3D9CF
	add r0, sp, #8
	movs r2, #4
	bl memcpy
	adds r1, r5, #0
	adds r1, #0x91
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #3
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	add r0, sp
	adds r0, #8
	ldrb r1, [r0]
	adds r1, #1
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl sub_0801C484
	ldr r1, _0801C70C @ =0x04000012
	movs r0, #4
	strh r0, [r1]
_0801C6FA:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801C704: .4byte gUnk_02029EB0
_0801C708: .4byte gUnk_09E3D9CF
_0801C70C: .4byte 0x04000012

	thumb_func_start sub_0801C710
sub_0801C710: @ 0x0801C710
	push {lr}
	ldr r1, _0801C724 @ =gUnk_02029EB0
	lsls r0, r0, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_080156C8
	pop {r1}
	bx r1
	.align 2, 0
_0801C724: .4byte gUnk_02029EB0

	thumb_func_start sub_0801C728
sub_0801C728: @ 0x0801C728
	adds r2, r0, #0
	ldrb r0, [r2, #2]
	cmp r0, #7
	bne _0801C744
	ldrb r0, [r2, #3]
	adds r0, #1
	movs r1, #0
	strb r0, [r2, #3]
	movs r0, #3
	ldrb r3, [r2, #3]
	ands r0, r3
	strb r0, [r2, #3]
	strb r1, [r2, #2]
	b _0801C748
_0801C744:
	adds r0, #1
	strb r0, [r2, #2]
_0801C748:
	ldrb r0, [r2, #3]
	bx lr

	thumb_func_start sub_0801C74C
sub_0801C74C: @ 0x0801C74C
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #8
	mov r8, r0
	mov sb, r1
	adds r5, r2, #0
	adds r6, r3, #0
	subs r5, #0x10
	subs r6, #0x10
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #2
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_0801C5D8
	movs r0, #3
	add r8, r0
	str r4, [sp]
	str r4, [sp, #4]
	mov r0, r8
	mov r1, sb
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_0801C5D8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0801C794
sub_0801C794: @ 0x0801C794
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r7, r0, #0
	ldrb r1, [r7, #4]
	lsls r0, r1, #0x1d
	lsrs r0, r0, #0x1d
	mov r8, r0
	ldrb r0, [r7]
	cmp r0, #0x1e
	bls _0801C7B2
	b _0801CACC
_0801C7B2:
	lsls r0, r0, #2
	ldr r1, _0801C7BC @ =_0801C7C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801C7BC: .4byte _0801C7C0
_0801C7C0: @ jump table
	.4byte _0801CACC @ case 0
	.4byte _0801C83C @ case 1
	.4byte _0801C960 @ case 2
	.4byte _0801CA1E @ case 3
	.4byte _0801CA6C @ case 4
	.4byte _0801CAA4 @ case 5
	.4byte _0801CACC @ case 6
	.4byte _0801CACC @ case 7
	.4byte _0801CACC @ case 8
	.4byte _0801CACC @ case 9
	.4byte _0801C844 @ case 10
	.4byte _0801CACC @ case 11
	.4byte _0801CACC @ case 12
	.4byte _0801CACC @ case 13
	.4byte _0801CACC @ case 14
	.4byte _0801CACC @ case 15
	.4byte _0801CACC @ case 16
	.4byte _0801CACC @ case 17
	.4byte _0801CACC @ case 18
	.4byte _0801CACC @ case 19
	.4byte _0801CACC @ case 20
	.4byte _0801CACC @ case 21
	.4byte _0801CACC @ case 22
	.4byte _0801CACC @ case 23
	.4byte _0801CACC @ case 24
	.4byte _0801CACC @ case 25
	.4byte _0801CACC @ case 26
	.4byte _0801CACC @ case 27
	.4byte _0801CACC @ case 28
	.4byte _0801CACC @ case 29
	.4byte _0801CA24 @ case 30
_0801C83C:
	movs r0, #0x1e
	strb r0, [r7, #1]
	movs r0, #0xa
	strb r0, [r7]
_0801C844:
	movs r0, #0x1e
	ldrb r2, [r7, #1]
	subs r6, r0, r2
	adds r0, r6, #0
	movs r1, #6
	bl __divsi3
	mov sb, r0
	cmp r0, #4
	ble _0801C85C
	movs r0, #4
	mov sb, r0
_0801C85C:
	movs r1, #0x78
	mov sl, r1
	add r3, sp, #8
	movs r0, #0x2c
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	adds r2, #0x20
	ldrb r0, [r7]
	subs r0, #1
	cmp r0, #0x1d
	bhi _0801C904
	lsls r0, r0, #2
	ldr r1, _0801C880 @ =_0801C884
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801C880: .4byte _0801C884
_0801C884: @ jump table
	.4byte _0801C8FC @ case 0
	.4byte _0801C8FC @ case 1
	.4byte _0801C900 @ case 2
	.4byte _0801C904 @ case 3
	.4byte _0801C904 @ case 4
	.4byte _0801C904 @ case 5
	.4byte _0801C904 @ case 6
	.4byte _0801C904 @ case 7
	.4byte _0801C904 @ case 8
	.4byte _0801C8FC @ case 9
	.4byte _0801C904 @ case 10
	.4byte _0801C904 @ case 11
	.4byte _0801C904 @ case 12
	.4byte _0801C904 @ case 13
	.4byte _0801C904 @ case 14
	.4byte _0801C904 @ case 15
	.4byte _0801C904 @ case 16
	.4byte _0801C904 @ case 17
	.4byte _0801C904 @ case 18
	.4byte _0801C904 @ case 19
	.4byte _0801C904 @ case 20
	.4byte _0801C904 @ case 21
	.4byte _0801C904 @ case 22
	.4byte _0801C904 @ case 23
	.4byte _0801C904 @ case 24
	.4byte _0801C904 @ case 25
	.4byte _0801C904 @ case 26
	.4byte _0801C904 @ case 27
	.4byte _0801C904 @ case 28
	.4byte _0801C900 @ case 29
_0801C8FC:
	movs r0, #0x30
	b _0801C902
_0801C900:
	movs r0, #0x50
_0801C902:
	str r0, [r3]
_0801C904:
	mov r0, sl
	subs r5, r2, r0
	ldr r4, _0801C95C @ =GL_SinTable
	lsls r0, r6, #6
	movs r1, #0x1e
	bl __divsi3
	movs r1, #0xff
	ands r1, r0
	lsls r1, r1, #1
	adds r1, r1, r4
	movs r2, #0
	ldrsh r0, [r1, r2]
	adds r4, r5, #0
	muls r4, r0, r4
	asrs r4, r4, #8
	add r4, sl
	ldr r0, [sp, #8]
	movs r1, #0x60
	subs r0, r0, r1
	muls r0, r6, r0
	movs r1, #0x1e
	bl __divsi3
	adds r3, r0, #0
	adds r3, #0x60
	subs r4, #0x10
	subs r3, #0x10
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	mov r1, sb
	adds r2, r4, #0
	bl sub_0801C5D8
	ldrb r0, [r7, #1]
	cmp r0, #0
	beq _0801C954
	b _0801CA66
_0801C954:
	movs r0, #2
	strb r0, [r7]
	b _0801CACC
	.align 2, 0
_0801C95C: .4byte GL_SinTable
_0801C960:
	adds r0, r7, #0
	bl sub_0801C728
	adds r4, r0, #0
	add r3, sp, #0xc
	movs r0, #0x2c
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	adds r2, #0x20
	ldrb r0, [r7]
	subs r0, #1
	cmp r0, #0x1d
	bhi _0801CA0C
	lsls r0, r0, #2
	ldr r1, _0801C988 @ =_0801C98C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801C988: .4byte _0801C98C
_0801C98C: @ jump table
	.4byte _0801CA04 @ case 0
	.4byte _0801CA04 @ case 1
	.4byte _0801CA08 @ case 2
	.4byte _0801CA0C @ case 3
	.4byte _0801CA0C @ case 4
	.4byte _0801CA0C @ case 5
	.4byte _0801CA0C @ case 6
	.4byte _0801CA0C @ case 7
	.4byte _0801CA0C @ case 8
	.4byte _0801CA04 @ case 9
	.4byte _0801CA0C @ case 10
	.4byte _0801CA0C @ case 11
	.4byte _0801CA0C @ case 12
	.4byte _0801CA0C @ case 13
	.4byte _0801CA0C @ case 14
	.4byte _0801CA0C @ case 15
	.4byte _0801CA0C @ case 16
	.4byte _0801CA0C @ case 17
	.4byte _0801CA0C @ case 18
	.4byte _0801CA0C @ case 19
	.4byte _0801CA0C @ case 20
	.4byte _0801CA0C @ case 21
	.4byte _0801CA0C @ case 22
	.4byte _0801CA0C @ case 23
	.4byte _0801CA0C @ case 24
	.4byte _0801CA0C @ case 25
	.4byte _0801CA0C @ case 26
	.4byte _0801CA0C @ case 27
	.4byte _0801CA0C @ case 28
	.4byte _0801CA08 @ case 29
_0801CA04:
	movs r0, #0x30
	b _0801CA0A
_0801CA08:
	movs r0, #0x50
_0801CA0A:
	str r0, [r3]
_0801CA0C:
	ldr r3, [sp, #0xc]
	mov r0, r8
	adds r1, r4, #0
	bl sub_0801C74C
	ldrb r0, [r7, #1]
	adds r0, #1
	strb r0, [r7, #1]
	b _0801CACC
_0801CA1E:
	movs r0, #0x1e
	strb r0, [r7, #1]
	strb r0, [r7]
_0801CA24:
	movs r4, #0x1e
	ldrb r0, [r7, #1]
	subs r4, r4, r0
	adds r0, r7, #0
	bl sub_0801C728
	adds r6, r0, #0
	movs r0, #0x2c
	mov r5, r8
	muls r5, r0, r5
	adds r5, #0x20
	movs r0, #0x30
	str r0, [sp, #0x10]
	movs r0, #0x50
	str r0, [sp, #0x14]
	lsls r4, r4, #5
	adds r0, r4, #0
	movs r1, #0x1e
	bl __divsi3
	adds r3, r0, #0
	adds r3, #0x30
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_0801C74C
	ldrb r0, [r7, #1]
	cmp r0, #0
	bne _0801CA66
	movs r0, #4
	strb r0, [r7]
	b _0801CACC
_0801CA66:
	subs r0, #1
	strb r0, [r7, #1]
	b _0801CACC
_0801CA6C:
	ldrb r4, [r7, #1]
	adds r0, r7, #0
	bl sub_0801C728
	adds r1, r0, #0
	movs r0, #0x2c
	mov r2, r8
	muls r2, r0, r2
	adds r2, #0x20
	movs r0, #0x50
	str r0, [sp, #0x18]
	ldr r0, _0801CAA0 @ =GL_SinTable
	lsls r4, r4, #1
	adds r4, r4, r0
	movs r0, #0
	ldrsh r3, [r4, r0]
	asrs r3, r3, #5
	adds r3, #0x50
	mov r0, r8
	bl sub_0801C74C
	ldrb r0, [r7, #1]
	adds r0, #4
	strb r0, [r7, #1]
	b _0801CACC
	.align 2, 0
_0801CAA0: .4byte GL_SinTable
_0801CAA4:
	movs r4, #1
	rsbs r4, r4, #0
	movs r5, #0
	str r5, [sp]
	str r5, [sp, #4]
	movs r0, #2
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #0x50
	bl sub_0801C5D8
	mov r0, r8
	adds r0, #3
	str r5, [sp]
	str r5, [sp, #4]
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #0x50
	bl sub_0801C5D8
_0801CACC:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0801CADC
sub_0801CADC: @ 0x0801CADC
	push {r4, r5, lr}
	ldr r0, _0801CAFC @ =gUnk_02029EB0
	movs r5, #0
	adds r4, r0, #0
	adds r4, #0x98
_0801CAE6:
	adds r0, r4, #0
	bl sub_0801C794
	adds r4, #8
	adds r5, #1
	cmp r5, #4
	bls _0801CAE6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801CAFC: .4byte gUnk_02029EB0

	thumb_func_start sub_0801CB00
sub_0801CB00: @ 0x0801CB00
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r5, _0801CB1C @ =gUnk_02029EB0
	adds r0, r5, #0
	adds r0, #0x8d
	ldrb r0, [r0]
	cmp r0, #9
	bls _0801CB12
	b _0801CF44
_0801CB12:
	lsls r0, r0, #2
	ldr r1, _0801CB20 @ =_0801CB24
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801CB1C: .4byte gUnk_02029EB0
_0801CB20: .4byte _0801CB24
_0801CB24: @ jump table
	.4byte _0801CB4C @ case 0
	.4byte _0801CC08 @ case 1
	.4byte _0801CC5A @ case 2
	.4byte _0801CC7A @ case 3
	.4byte _0801CCDC @ case 4
	.4byte _0801CDA0 @ case 5
	.4byte _0801CE04 @ case 6
	.4byte _0801CE48 @ case 7
	.4byte _0801CEBC @ case 8
	.4byte _0801CF30 @ case 9
_0801CB4C:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #0
	movs r2, #1
	movs r3, #2
	bl sub_0801C484
	ldr r0, _0801CBF4 @ =gUnk_09E3DA08
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	movs r2, #0
	ldr r0, _0801CBF8 @ =0x080000AE
	ldrh r0, [r0]
	lsrs r0, r0, #8
	cmp r0, #0x4a
	bne _0801CB84
	ldr r1, _0801CBFC @ =gUnk_02000000
	ldr r0, _0801CC00 @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801CB86
_0801CB84:
	movs r2, #1
_0801CB86:
	lsls r0, r2, #2
	add r1, sp, #0x10
	adds r0, r0, r1
	ldr r0, [r0]
	movs r1, #0
	bl GL_OpenFile
	adds r1, r5, #0
	adds r1, #0x88
	str r0, [r1]
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl sub_0801C484
	str r4, [sp]
	str r4, [sp, #4]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl sub_0801C484
	movs r1, #0x10
	rsbs r1, r1, #0
	movs r0, #0x3f
	bl sub_080146FC
	movs r0, #0x3f
	movs r1, #0
	movs r2, #0x1e
	bl sub_080147D8
	movs r2, #0x80
	lsls r2, r2, #0x13
	movs r3, #0x80
	lsls r3, r3, #2
	ldr r0, _0801CC04 @ =0xFFFFE0FF
	ldrh r1, [r2]
	ands r0, r1
	orrs r0, r3
	strh r0, [r2]
	movs r0, #2
	bl sub_080F9ADC
	adds r1, r5, #0
	adds r1, #0x8d
	ldrb r0, [r1]
	adds r0, #1
	b _0801CF42
	.align 2, 0
_0801CBF4: .4byte gUnk_09E3DA08
_0801CBF8: .4byte 0x080000AE
_0801CBFC: .4byte gUnk_02000000
_0801CC00: .4byte 0x00006C2C
_0801CC04: .4byte 0xFFFFE0FF
_0801CC08:
	bl sub_080148F4
	adds r4, r0, #0
	cmp r4, #0
	beq _0801CC14
	b _0801CF44
_0801CC14:
	movs r0, #1
	movs r1, #2
	movs r2, #0
	movs r3, #0x10
	bl sub_08014754
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #1
	movs r1, #2
	movs r2, #0x10
	movs r3, #0
	bl sub_08014838
	movs r2, #0x80
	lsls r2, r2, #0x13
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r0, r5, #0
	adds r0, #0x93
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	subs r0, #3
	strb r4, [r0]
	subs r0, #3
	strb r4, [r0]
	adds r1, r5, #0
	adds r1, #0x8d
	ldrb r0, [r1]
	adds r0, #1
	b _0801CF42
_0801CC5A:
	bl sub_080148F4
	cmp r0, #0
	bne _0801CC7A
	movs r2, #0x80
	lsls r2, r2, #0x13
	movs r0, #0x80
	lsls r0, r0, #5
	ldrh r1, [r2]
	orrs r0, r1
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x8d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0801CC7A:
	adds r3, r5, #0
	adds r3, #0x93
	adds r2, r5, #0
	adds r2, #0x94
	ldrb r1, [r2]
	lsls r0, r1, #8
	ldrb r7, [r3]
	orrs r0, r7
	adds r1, r0, #1
	strb r1, [r3]
	lsrs r1, r1, #8
	strb r1, [r2]
	bl sub_0801C6B0
	adds r0, r5, #0
	adds r0, #0x8e
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0x3c
	bne _0801CCD4
	adds r1, r5, #0
	adds r1, #0x8d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0
	strb r0, [r4]
	movs r3, #0
	movs r6, #7
	movs r1, #8
	rsbs r1, r1, #0
	mov ip, r1
	adds r2, r5, #0
	adds r2, #0x9c
_0801CCBE:
	adds r1, r3, #0
	ands r1, r6
	mov r0, ip
	ldrb r7, [r2]
	ands r0, r7
	orrs r0, r1
	strb r0, [r2]
	adds r2, #8
	adds r3, #1
	cmp r3, #4
	bls _0801CCBE
_0801CCD4:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	b _0801CF44
_0801CCDC:
	adds r0, r5, #0
	adds r0, #0x8e
	movs r1, #0x97
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0x96
	bhi _0801CCEC
	ldrb r1, [r4]
_0801CCEC:
	adds r0, r1, #0
	movs r1, #0x1e
	bl __modsi3
	cmp r0, #0
	bne _0801CD0E
	adds r2, r5, #0
	adds r2, #0x8f
	ldrb r1, [r2]
	lsls r0, r1, #3
	adds r0, r5, r0
	adds r0, #0x98
	movs r1, #1
	strb r1, [r0]
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_0801CD0E:
	bl sub_0801CADC
	adds r3, r5, #0
	adds r3, #0x93
	adds r2, r5, #0
	adds r2, #0x94
	ldrb r7, [r2]
	lsls r0, r7, #8
	ldrb r1, [r3]
	orrs r0, r1
	adds r1, r0, #1
	strb r1, [r3]
	lsrs r1, r1, #8
	strb r1, [r2]
	bl sub_0801C6B0
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x5a
	bne _0801CD5A
	movs r0, #1
	movs r1, #2
	movs r2, #0x10
	movs r3, #0
	bl sub_08014754
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #1
	movs r1, #2
	movs r2, #0
	movs r3, #0x10
	bl sub_08014838
	b _0801CF44
_0801CD5A:
	cmp r0, #0x97
	beq _0801CD60
	b _0801CF44
_0801CD60:
	movs r0, #2
	movs r1, #4
	movs r2, #0x10
	movs r3, #0
	bl sub_08014754
	movs r0, #0x3c
	str r0, [sp]
	movs r0, #2
	movs r1, #4
	movs r2, #0
	movs r3, #0x10
	bl sub_08014838
	movs r2, #0x80
	lsls r2, r2, #0x13
	movs r3, #0xb0
	lsls r3, r3, #5
	ldr r0, _0801CD9C @ =0xFFFFE0FF
	ldrh r1, [r2]
	ands r0, r1
	orrs r0, r3
	strh r0, [r2]
	movs r0, #0
	strb r0, [r4]
	adds r1, r5, #0
	adds r1, #0x8d
	ldrb r0, [r1]
	adds r0, #1
	b _0801CF42
	.align 2, 0
_0801CD9C: .4byte 0xFFFFE0FF
_0801CDA0:
	bl sub_0801C694
	bl sub_080148F4
	cmp r0, #0
	beq _0801CDAE
	b _0801CEB6
_0801CDAE:
	ldr r1, _0801CE00 @ =gUnk_09E3DA10
	add r0, sp, #8
	movs r2, #5
	bl memcpy
	adds r6, r5, #0
	adds r6, #0x8e
	ldrb r4, [r6]
	adds r0, r4, #0
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801CDE8
	adds r0, r4, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	add r0, sp
	adds r0, #8
	ldrb r0, [r0]
	lsls r0, r0, #3
	adds r0, r5, r0
	adds r0, #0x98
	movs r1, #3
	strb r1, [r0]
_0801CDE8:
	ldrb r2, [r6]
	cmp r2, #0x28
	bne _0801CDF8
	adds r1, r5, #0
	adds r1, #0x8d
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0801CDF8:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	b _0801CEB6
	.align 2, 0
_0801CE00: .4byte gUnk_09E3DA10
_0801CE04:
	bl sub_0801C694
	adds r0, r5, #0
	adds r0, #0xb8
	ldrb r0, [r0]
	cmp r0, #4
	bne _0801CE40
	adds r1, r5, #0
	adds r1, #0x8e
	movs r0, #0
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #0x13
	movs r3, #0xa0
	lsls r3, r3, #5
	ldr r0, _0801CE3C @ =0xFFFFE0FF
	ldrh r1, [r2]
	ands r0, r1
	orrs r0, r3
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x8d
	ldrb r0, [r1]
	adds r0, #1
	b _0801CF2C
	.align 2, 0
_0801CE3C: .4byte 0xFFFFE0FF
_0801CE40:
	adds r1, r5, #0
	adds r1, #0x8e
	ldrb r0, [r1]
	b _0801CF2A
_0801CE48:
	bl sub_0801C694
	adds r0, r5, #0
	adds r0, #0x8e
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0x3c
	beq _0801CE5C
	cmp r1, #0x4b
	bne _0801CE6A
_0801CE5C:
	movs r0, #0x3f
	movs r1, #0
	bl sub_080146FC
	movs r0, #0x3f
	movs r1, #0x10
	b _0801CE7E
_0801CE6A:
	cmp r1, #0x41
	beq _0801CE72
	cmp r1, #0x50
	bne _0801CE86
_0801CE72:
	movs r0, #0x3f
	movs r1, #0x10
	bl sub_080146FC
	movs r0, #0x3f
	movs r1, #0
_0801CE7E:
	movs r2, #4
	bl sub_080147D8
	b _0801CEB0
_0801CE86:
	cmp r1, #0x8c
	bne _0801CEB0
	movs r0, #0x3f
	movs r1, #0
	bl sub_080146FC
	movs r0, #0x3f
	movs r1, #0x10
	movs r2, #0xf
	bl sub_080147D8
	adds r1, r5, #0
	adds r1, #0x8f
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x3c
	strb r0, [r4]
	subs r1, #2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_0801CEB0:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0801CEB6:
	bl sub_0801CADC
	b _0801CF44
_0801CEBC:
	bl sub_0801C694
	adds r1, r5, #0
	adds r1, #0x8e
	ldrb r0, [r1]
	cmp r0, #0
	bne _0801CF2A
	bl sub_080148F4
	cmp r0, #0
	bne _0801CEB6
	adds r6, r5, #0
	adds r6, #0x8f
	ldrb r4, [r6]
	cmp r4, #0
	beq _0801CEE2
	cmp r4, #1
	beq _0801CF0C
	b _0801CEB6
_0801CEE2:
	movs r0, #0x3f
	movs r1, #0x10
	bl sub_080146FC
	movs r0, #0x3f
	movs r1, #0
	movs r2, #0x1e
	bl sub_080147D8
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldr r0, _0801CF08 @ =0xFFFFE0FF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	movs r0, #0xa0
	lsls r0, r0, #0x13
	strh r4, [r0]
	b _0801CDF8
	.align 2, 0
_0801CF08: .4byte 0xFFFFE0FF
_0801CF0C:
	movs r0, #0x3f
	movs r1, #0
	bl sub_080146FC
	movs r1, #0x10
	rsbs r1, r1, #0
	movs r0, #0x3f
	movs r2, #0x1e
	bl sub_080147D8
	adds r1, r5, #0
	adds r1, #0x8d
	ldrb r0, [r1]
	adds r0, #1
	b _0801CF2C
_0801CF2A:
	subs r0, #1
_0801CF2C:
	strb r0, [r1]
	b _0801CEB6
_0801CF30:
	bl sub_080148F4
	cmp r0, #0
	bne _0801CF44
	adds r1, r5, #0
	adds r1, #0x92
	movs r0, #1
	ldrb r7, [r1]
	orrs r0, r7
_0801CF42:
	strb r0, [r1]
_0801CF44:
	bl GL_SendObjectsToOam
	bl GL_ResetObjects
	bl sub_080148F4
	cmp r0, #0
	bne _0801CF64
	adds r0, r5, #0
	adds r0, #0x92
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	beq _0801CF64
	movs r0, #1
	b _0801CF6A
_0801CF64:
	bl sub_08014914
	movs r0, #0
_0801CF6A:
	add sp, #0x18
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801CF74
sub_0801CF74: @ 0x0801CF74
	push {r4, lr}
	ldr r1, _0801CFB8 @ =gUnk_09E589B4
	ldr r0, _0801CFBC @ =gUnk_03000040
	movs r2, #0x81
	lsls r2, r2, #2
	adds r4, r0, r2
	ldr r0, [r4]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0801CFC4
	bl _call_via_r0
	cmp r0, #0
	beq _0801CFAE
	ldr r2, [r4]
	lsls r1, r2, #0xa
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #0xe
	ldr r0, _0801CFC0 @ =0xFFC03FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r4]
_0801CFAE:
	bl sub_080FA4D4
	movs r0, #0
	b _0801CFC6
	.align 2, 0
_0801CFB8: .4byte gUnk_09E589B4
_0801CFBC: .4byte gUnk_03000040
_0801CFC0: .4byte 0xFFC03FFF
_0801CFC4:
	movs r0, #1
_0801CFC6:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0801CFCC
sub_0801CFCC: @ 0x0801CFCC
	push {r4, lr}
	ldr r1, _0801D010 @ =gUnk_09E589B4
	ldr r0, _0801D014 @ =gUnk_03000040
	movs r2, #0x81
	lsls r2, r2, #2
	adds r4, r0, r2
	ldr r0, [r4]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _0801D01C
	bl _call_via_r0
	cmp r0, #0
	beq _0801D006
	ldr r2, [r4]
	lsls r1, r2, #0xa
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #0xe
	ldr r0, _0801D018 @ =0xFFC03FFF
	ands r0, r2
	orrs r0, r1
	str r0, [r4]
_0801D006:
	bl sub_080FA4D4
	movs r0, #0
	b _0801D01E
	.align 2, 0
_0801D010: .4byte gUnk_09E589B4
_0801D014: .4byte gUnk_03000040
_0801D018: .4byte 0xFFC03FFF
_0801D01C:
	movs r0, #1
_0801D01E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0801D024
sub_0801D024: @ 0x0801D024
	push {r4, lr}
	adds r4, r3, #0
	movs r3, #0x2c
	muls r1, r3, r1
	adds r1, #0x20
	str r1, [r2]
	subs r0, #1
	cmp r0, #0x1d
	bhi _0801D0C4
	lsls r0, r0, #2
	ldr r1, _0801D040 @ =_0801D044
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801D040: .4byte _0801D044
_0801D044: @ jump table
	.4byte _0801D0BC @ case 0
	.4byte _0801D0BC @ case 1
	.4byte _0801D0C0 @ case 2
	.4byte _0801D0C4 @ case 3
	.4byte _0801D0C4 @ case 4
	.4byte _0801D0C4 @ case 5
	.4byte _0801D0C4 @ case 6
	.4byte _0801D0C4 @ case 7
	.4byte _0801D0C4 @ case 8
	.4byte _0801D0BC @ case 9
	.4byte _0801D0C4 @ case 10
	.4byte _0801D0C4 @ case 11
	.4byte _0801D0C4 @ case 12
	.4byte _0801D0C4 @ case 13
	.4byte _0801D0C4 @ case 14
	.4byte _0801D0C4 @ case 15
	.4byte _0801D0C4 @ case 16
	.4byte _0801D0C4 @ case 17
	.4byte _0801D0C4 @ case 18
	.4byte _0801D0C4 @ case 19
	.4byte _0801D0C4 @ case 20
	.4byte _0801D0C4 @ case 21
	.4byte _0801D0C4 @ case 22
	.4byte _0801D0C4 @ case 23
	.4byte _0801D0C4 @ case 24
	.4byte _0801D0C4 @ case 25
	.4byte _0801D0C4 @ case 26
	.4byte _0801D0C4 @ case 27
	.4byte _0801D0C4 @ case 28
	.4byte _0801D0C0 @ case 29
_0801D0BC:
	movs r0, #0x30
	b _0801D0C2
_0801D0C0:
	movs r0, #0x50
_0801D0C2:
	str r0, [r4]
_0801D0C4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801D0CC
sub_0801D0CC: @ 0x0801D0CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r5, r3, #0x10
	lsrs r5, r5, #0x10
	lsrs r3, r3, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	lsls r4, r0, #0xd
	lsrs r4, r4, #0x10
	lsls r6, r1, #0xd
	lsrs r6, r6, #0x10
	movs r7, #7
	mov r8, r7
	mov r7, r8
	ands r0, r7
	lsls r0, r0, #0x10
	ands r1, r7
	lsls r4, r4, #1
	adds r5, r5, r4
	muls r3, r6, r3
	lsls r3, r3, #1
	adds r5, r5, r3
	lsls r5, r5, #5
	ldr r3, _0801D158 @ =0x06004000
	adds r5, r5, r3
	lsrs r3, r0, #0x12
	lsls r3, r3, #2
	adds r5, r5, r3
	lsls r1, r1, #3
	adds r5, r5, r1
	ldr r3, [r5]
	mov r1, sp
	strb r3, [r1]
	mov r4, sp
	lsls r1, r3, #0x10
	lsrs r1, r1, #0x18
	strb r1, [r4, #1]
	mov r1, sp
	lsrs r3, r3, #0x10
	strb r3, [r1, #2]
	lsrs r3, r3, #8
	strb r3, [r1, #3]
	movs r1, #0xc0
	lsls r1, r1, #0xa
	ands r1, r0
	lsrs r1, r1, #0x10
	mov r7, sp
	adds r0, r7, r1
	strb r2, [r0]
	mov r2, sp
	mov r0, sp
	ldrb r1, [r0, #1]
	lsls r1, r1, #8
	ldrb r2, [r2]
	orrs r1, r2
	ldrb r2, [r0, #2]
	ldrb r0, [r0, #3]
	lsls r0, r0, #8
	orrs r2, r0
	lsls r2, r2, #0x10
	orrs r1, r2
	str r1, [r5]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D158: .4byte 0x06004000

	thumb_func_start sub_0801D15C
sub_0801D15C: @ 0x0801D15C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x14
	lsls r0, r0, #5
	movs r2, #0xa0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	movs r2, #0x20
	bl MemoryCopyLarge
	pop {r0}
	bx r0

	thumb_func_start sub_0801D174
sub_0801D174: @ 0x0801D174
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r3, [sp, #4]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	lsrs r0, r0, #0x10
	mov sl, r0
	cmp r2, #0
	beq _0801D1F6
	movs r0, #0
	mov sb, r0
_0801D19A:
	movs r5, #0
	mov r1, sb
	adds r1, #1
	str r1, [sp, #0xc]
_0801D1A2:
	ldrh r6, [r2]
	movs r4, #0
	adds r7, r2, #2
	adds r0, r5, #1
	mov r8, r0
_0801D1AC:
	lsls r0, r4, #2
	adds r2, r6, #0
	asrs r2, r0
	movs r0, #0xf
	ands r2, r0
	cmp r2, #0
	beq _0801D1D4
	ldr r1, [sp, #8]
	adds r0, r1, r4
	lsls r1, r5, #2
	adds r0, r0, r1
	ldr r1, [sp]
	adds r2, r2, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r1, sl
	add r1, sb
	ldr r3, [sp, #4]
	bl sub_0801D0CC
_0801D1D4:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #3
	bls _0801D1AC
	adds r2, r7, #0
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #1
	bls _0801D1A2
	ldr r1, [sp, #0xc]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	cmp r0, #7
	bls _0801D19A
_0801D1F6:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801D208
sub_0801D208: @ 0x0801D208
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	mov sb, r2
	mov r8, r3
	ldr r1, [sp, #0x20]
	mov r0, sb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r4, r6, #0x10
	lsrs r4, r4, #0x10
	lsrs r6, r6, #0x10
	bl sub_0801D15C
	lsls r5, r6, #0x10
	adds r0, r4, #0
	orrs r0, r5
	mov r1, sb
	mov r2, r8
	adds r3, r7, #0
	bl sub_0801D174
	movs r0, #0x20
	add r8, r0
	movs r0, #8
	adds r0, r0, r4
	mov sl, r0
	orrs r5, r0
	adds r0, r5, #0
	mov r1, sb
	mov r2, r8
	adds r3, r7, #0
	bl sub_0801D174
	movs r0, #0x20
	add r8, r0
	adds r6, #8
	lsls r6, r6, #0x10
	orrs r4, r6
	adds r0, r4, #0
	mov r1, sb
	mov r2, r8
	adds r3, r7, #0
	bl sub_0801D174
	movs r0, #0x20
	add r8, r0
	mov r0, sl
	orrs r0, r6
	mov sl, r0
	mov r1, sb
	mov r2, r8
	adds r3, r7, #0
	bl sub_0801D174
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801D290
sub_0801D290: @ 0x0801D290
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [sp, #0x28]
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	lsls r3, r3, #0x10
	lsls r0, r0, #0x10
	lsrs r1, r1, #0xf
	adds r4, r4, r1
	movs r7, #0
	lsrs r5, r3, #0x11
	ldr r1, _0801D420 @ =gCardArtIndexes
	mov sb, r1
	lsrs r1, r0, #0x14
	mov ip, r1
	lsrs r2, r2, #0xf
	mov r8, r2
	lsrs r3, r3, #0xb
	mov sl, r3
	lsls r0, r0, #8
	str r0, [sp]
_0801D2C4:
	movs r3, #0
	adds r6, r4, #0
	adds r6, #0x40
_0801D2CA:
	lsls r2, r3, #1
	adds r2, r2, r4
	adds r1, r5, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	strh r1, [r2]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #9
	bls _0801D2CA
	adds r4, r6, #0
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #9
	bls _0801D2C4
	mov r2, ip
	lsls r1, r2, #5
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r4, r1, r0
	mov r5, sb
	mov r2, r8
	movs r3, #0
	ldr r0, _0801D424 @ =0x080000AE
	ldrh r0, [r0]
	lsrs r0, r0, #8
	cmp r0, #0x4a
	bne _0801D318
	ldr r1, _0801D428 @ =gUnk_02000000
	ldr r0, _0801D42C @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801D31A
_0801D318:
	movs r3, #1
_0801D31A:
	orrs r2, r3
	lsls r0, r2, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r1, r0, #7
	ldr r2, _0801D430 @ =gCardPalettesNone_0
	adds r1, r1, r2
	adds r0, r4, #0
	movs r2, #0x80
	bl MemoryCopyLarge
	ldr r4, _0801D420 @ =gCardArtIndexes
	mov r2, r8
	movs r3, #0
	ldr r0, _0801D424 @ =0x080000AE
	ldrh r0, [r0]
	lsrs r0, r0, #8
	cmp r0, #0x4a
	bne _0801D350
	ldr r1, _0801D428 @ =gUnk_02000000
	ldr r5, _0801D42C @ =0x00006C2C
	adds r1, r1, r5
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801D352
_0801D350:
	movs r3, #1
_0801D352:
	orrs r3, r2
	lsls r0, r3, #1
	adds r0, r4, r0
	ldrh r2, [r0]
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #6
	ldr r1, _0801D434 @ =gCardGraphicsNone_0
	adds r6, r0, r1
	ldr r5, _0801D438 @ =0x06004000
	add r5, sl
	movs r7, #0
	movs r4, #0x3f
	mov ip, r4
	movs r0, #0xfc
	lsls r0, r0, #4
	mov r8, r0
	ldr r1, _0801D43C @ =0x0000031F
	mov sb, r1
_0801D37C:
	ldrh r2, [r6]
	ldrh r3, [r6, #2]
	ldrh r4, [r6, #4]
	str r4, [sp, #4]
	adds r1, r2, #0
	mov r0, ip
	ands r1, r0
	adds r0, r2, #0
	mov r4, r8
	ands r0, r4
	lsls r0, r0, #2
	orrs r1, r0
	strh r1, [r5]
	lsrs r2, r2, #0xc
	movs r1, #3
	adds r0, r3, #0
	ands r0, r1
	lsls r0, r0, #4
	orrs r2, r0
	movs r0, #0xfc
	ands r0, r3
	lsls r0, r0, #6
	orrs r2, r0
	strh r2, [r5, #2]
	lsrs r3, r3, #8
	adds r2, r3, #0
	mov r0, ip
	ands r2, r0
	lsrs r3, r3, #6
	movs r1, #0xf
	ldr r0, [sp, #4]
	ands r0, r1
	lsls r0, r0, #2
	orrs r3, r0
	lsls r3, r3, #8
	orrs r2, r3
	strh r2, [r5, #4]
	ldr r1, [sp, #4]
	lsrs r4, r1, #4
	adds r0, r4, #0
	mov r2, ip
	ands r0, r2
	mov r1, r8
	ands r4, r1
	lsls r4, r4, #2
	orrs r0, r4
	strh r0, [r5, #6]
	adds r6, #6
	adds r5, #8
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, sb
	bls _0801D37C
	ldr r4, _0801D438 @ =0x06004000
	add r4, sl
	movs r7, #0
	ldr r3, _0801D440 @ =0x00003F3F
	ldr r2, [sp]
	lsrs r0, r2, #0x18
	lsls r1, r0, #8
	orrs r1, r0
	ldr r2, _0801D444 @ =0x00000C7F
_0801D3FA:
	adds r0, r3, #0
	ldrh r5, [r4]
	ands r0, r5
	adds r0, r0, r1
	strh r0, [r4]
	adds r4, #2
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	cmp r7, r2
	bls _0801D3FA
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D420: .4byte gCardArtIndexes
_0801D424: .4byte 0x080000AE
_0801D428: .4byte gUnk_02000000
_0801D42C: .4byte 0x00006C2C
_0801D430: .4byte gCardPalettesNone_0
_0801D434: .4byte gCardGraphicsNone_0
_0801D438: .4byte 0x06004000
_0801D43C: .4byte 0x0000031F
_0801D440: .4byte 0x00003F3F
_0801D444: .4byte 0x00000C7F

	thumb_func_start sub_0801D448
sub_0801D448: @ 0x0801D448
	push {lr}
	ldr r0, _0801D458 @ =gUnk_0201AFB0
	movs r1, #0x30
	bl MemoryClearHalfWord
	pop {r0}
	bx r0
	.align 2, 0
_0801D458: .4byte gUnk_0201AFB0

	thumb_func_start sub_0801D45C
sub_0801D45C: @ 0x0801D45C
	push {r4, lr}
	ldr r0, _0801D4E4 @ =gUnk_03000040
	movs r1, #0xba
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0x21
	strh r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0x40
	strh r0, [r1]
	ldr r0, _0801D4E8 @ =0x06004000
	movs r1, #0x80
	lsls r1, r1, #8
	bl MemoryClearHalfWord
	movs r0, #0xc0
	lsls r0, r0, #0x13
	movs r1, #0xa0
	lsls r1, r1, #6
	bl MemoryClearHalfWord
	ldr r4, _0801D4EC @ =gUnk_0201AFB0
	ldr r0, [r4, #0x28]
	bl sub_080F7674
	ldr r0, [r4, #0x2c]
	bl sub_080F42A0
	ldr r1, _0801D4F0 @ =0x04000008
	movs r0, #0x86
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0801D4F4 @ =0x00004104
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0801D4F8 @ =0x00000407
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _0801D4FC @ =0x00000305
	adds r0, r2, #0
	strh r0, [r1]
	bl sub_080F5A88
	movs r0, #0xa0
	lsls r0, r0, #0x13
	ldr r4, _0801D500 @ =gUnk_09CCD290
	adds r1, r4, #0
	movs r2, #0x20
	bl MemoryCopyHalfWord
	ldr r0, _0801D504 @ =0x050003E0
	adds r1, r4, #0
	movs r2, #0x20
	bl MemoryCopyHalfWord
	ldr r0, _0801D508 @ =0x05000200
	ldr r1, _0801D50C @ =gUnk_09E31614
	movs r2, #0x80
	lsls r2, r2, #1
	bl MemoryCopyHalfWord
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801D4E4: .4byte gUnk_03000040
_0801D4E8: .4byte 0x06004000
_0801D4EC: .4byte gUnk_0201AFB0
_0801D4F0: .4byte 0x04000008
_0801D4F4: .4byte 0x00004104
_0801D4F8: .4byte 0x00000407
_0801D4FC: .4byte 0x00000305
_0801D500: .4byte gUnk_09CCD290
_0801D504: .4byte 0x050003E0
_0801D508: .4byte 0x05000200
_0801D50C: .4byte gUnk_09E31614

	thumb_func_start sub_0801D510
sub_0801D510: @ 0x0801D510
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r0, #0xd
	mov sl, r0
	movs r1, #1
	mov sb, r1
	movs r6, #8
	str r6, [sp]
	ldr r1, _0801D5A4 @ =gCardStats
	movs r0, #0xb
	muls r0, r4, r0
	adds r0, #6
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0x17
	bgt _0801D546
	cmp r0, #0x16
	blt _0801D546
	movs r0, #7
	str r0, [sp]
_0801D546:
	ldr r5, _0801D5A8 @ =gUnk_02006ED0
	ldr r0, _0801D5AC @ =gUnk_02000000
	ldr r1, _0801D5B0 @ =0x00006C2C
	adds r0, r0, r1
	ldrb r3, [r0]
	movs r2, #7
	ands r2, r3
	rsbs r1, r2, #0
	lsrs r1, r1, #0x1f
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r6, [r5, #8]
	ands r0, r6
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r5, #8]
	ldr r1, _0801D5B4 @ =gUnk_09E5F854
	mov r8, r1
	lsls r1, r0, #0x1e
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	adds r1, r1, r0
	add r1, r8
	ldr r0, [r1]
	str r0, [r5, #4]
	adds r1, r3, #0
	cmp r2, #0
	bne _0801D60C
	ldr r0, _0801D5B8 @ =gUnk_0201AFB0
	ldrb r2, [r0]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	bne _0801D5BC
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0801D5BC
	adds r0, r4, #0
	bl sub_080EE988
	b _0801D5C6
	.align 2, 0
_0801D5A4: .4byte gCardStats
_0801D5A8: .4byte gUnk_02006ED0
_0801D5AC: .4byte gUnk_02000000
_0801D5B0: .4byte 0x00006C2C
_0801D5B4: .4byte gUnk_09E5F854
_0801D5B8: .4byte gUnk_0201AFB0
_0801D5BC:
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1d
	adds r0, r4, #0
	bl sub_080EE7AC
_0801D5C6:
	adds r6, r0, #0
	movs r7, #1
	ldrb r0, [r6]
	cmp r0, #0
	beq _0801D6A4
	ldr r4, [sp]
	lsls r4, r4, #0x10
	mov r8, r4
_0801D5D6:
	ldrb r0, [r6]
	lsls r4, r0, #8
	ldrb r1, [r6, #1]
	orrs r4, r1
	adds r0, r4, #0
	bl sub_080F0210
	mov r1, sl
	adds r5, r1, r0
	cmp r5, #0x5c
	bgt _0801D5FC
	adds r0, r4, #0
	mov r2, sb
	mov r4, r8
	lsrs r3, r4, #0x10
	bl sub_080F1884
	mov sl, r5
	b _0801D5FE
_0801D5FC:
	movs r7, #0
_0801D5FE:
	adds r6, #2
	ldrb r0, [r6]
	cmp r0, #0
	beq _0801D6A4
	cmp r7, #0
	bne _0801D5D6
	b _0801D6A4
_0801D60C:
	lsls r1, r3, #0x1d
	lsrs r1, r1, #0x1d
	adds r0, r4, #0
	bl sub_080EE7AC
	adds r6, r0, #0
	movs r0, #1
	str r0, [sp, #4]
	ldrb r0, [r6]
	cmp r0, #0
	beq _0801D6A4
	adds r7, r5, #0
_0801D624:
	ldrb r5, [r6]
	ldr r0, _0801D650 @ =gUnk_09E589C4
	adds r0, r5, r0
	ldrb r1, [r0]
	cmp r1, r5
	beq _0801D654
	ldrb r5, [r0]
	movs r4, #3
	rsbs r4, r4, #0
	adds r0, r4, #0
	ldrb r1, [r7, #8]
	ands r0, r1
	strb r0, [r7, #8]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	add r0, r8
	ldr r0, [r0]
	str r0, [r7, #4]
	movs r4, #2
	b _0801D672
	.align 2, 0
_0801D650: .4byte gUnk_09E589C4
_0801D654:
	movs r0, #2
	ldrb r1, [r7, #8]
	orrs r0, r1
	strb r0, [r7, #8]
	lsls r1, r0, #0x1e
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	adds r1, r1, r0
	add r1, r8
	ldr r0, [r1]
	str r0, [r7, #4]
	movs r4, #1
_0801D672:
	mov sb, r4
	bl sub_080F0200
	mov r1, sl
	adds r4, r1, r0
	cmp r4, #0x5c
	bgt _0801D692
	ldr r0, [sp]
	lsls r3, r0, #0x10
	adds r0, r5, #0
	mov r2, sb
	lsrs r3, r3, #0x10
	bl sub_080F19A4
	mov sl, r4
	b _0801D696
_0801D692:
	movs r1, #0
	str r1, [sp, #4]
_0801D696:
	adds r6, #1
	ldrb r0, [r6]
	cmp r0, #0
	beq _0801D6A4
	ldr r4, [sp, #4]
	cmp r4, #0
	bne _0801D624
_0801D6A4:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_0801D6B4
sub_0801D6B4: @ 0x0801D6B4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r6, _0801D704 @ =0x06001840
	movs r7, #0x84
	lsls r7, r7, #2
	movs r0, #0xe
	movs r1, #2
	bl sub_080F0BB4
	adds r0, r4, #0
	bl sub_0801D510
	ldr r0, _0801D708 @ =0x06008200
	movs r1, #0
	bl sub_080F2E4C
	movs r0, #0
_0801D6DA:
	adds r5, r6, #0
	adds r5, #0x40
	adds r4, r0, #1
	adds r2, r6, #0
	movs r3, #0xd
_0801D6E4:
	adds r1, r7, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	strh r1, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0801D6E4
	adds r6, r5, #0
	adds r0, r4, #0
	cmp r0, #1
	ble _0801D6DA
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D704: .4byte 0x06001840
_0801D708: .4byte 0x06008200

	thumb_func_start sub_0801D70C
sub_0801D70C: @ 0x0801D70C
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r4, _0801D7C8 @ =gUnk_0984F59C
	adds r0, r4, #0
	movs r1, #0x1a
	movs r2, #1
	movs r3, #8
	bl sub_080F1B0C
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x22
	movs r2, #1
	movs r3, #8
	bl sub_080F1B0C
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #0x40
	movs r2, #1
	movs r3, #8
	bl sub_080F1B0C
	adds r4, #0x18
	adds r0, r4, #0
	movs r1, #0x48
	movs r2, #1
	movs r3, #8
	bl sub_080F1B0C
	movs r4, #0
_0801D750:
	cmp r4, #0
	beq _0801D758
	cmp r5, #0
	beq _0801D776
_0801D758:
	adds r0, r5, #0
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	ldr r1, _0801D7CC @ =gUnk_0984F54C
	adds r0, r0, r1
	lsls r2, r4, #2
	movs r1, #0x36
	subs r1, r1, r2
	movs r2, #1
	movs r3, #8
	bl sub_080F1B0C
_0801D776:
	adds r0, r5, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, #1
	cmp r4, #3
	ble _0801D750
	movs r4, #0
_0801D78A:
	cmp r4, #0
	beq _0801D792
	cmp r6, #0
	beq _0801D7B0
_0801D792:
	adds r0, r6, #0
	movs r1, #0xa
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xd
	ldr r1, _0801D7CC @ =gUnk_0984F54C
	adds r0, r0, r1
	lsls r2, r4, #2
	movs r1, #0x5c
	subs r1, r1, r2
	movs r2, #1
	movs r3, #8
	bl sub_080F1B0C
_0801D7B0:
	adds r0, r6, #0
	movs r1, #0xa
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r4, #1
	cmp r4, #3
	ble _0801D78A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801D7C8: .4byte gUnk_0984F59C
_0801D7CC: .4byte gUnk_0984F54C

	thumb_func_start sub_0801D7D0
sub_0801D7D0: @ 0x0801D7D0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r6, _0801D828 @ =0x06001C00
	movs r7, #0x8b
	lsls r7, r7, #2
	movs r0, #0xe
	movs r1, #2
	bl sub_080F0BB4
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_0801D70C
	ldr r0, _0801D82C @ =0x06008580
	movs r1, #0
	bl sub_080F2E4C
	movs r0, #0
_0801D7FE:
	adds r5, r6, #0
	adds r5, #0x40
	adds r4, r0, #1
	adds r2, r6, #0
	movs r3, #0xd
_0801D808:
	adds r1, r7, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	strh r1, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0801D808
	adds r6, r5, #0
	adds r0, r4, #0
	cmp r0, #1
	ble _0801D7FE
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D828: .4byte 0x06001C00
_0801D82C: .4byte 0x06008580

	thumb_func_start sub_0801D830
sub_0801D830: @ 0x0801D830
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0801D89C @ =gUnk_0984F59C
	adds r0, r4, #0
	movs r1, #0x1a
	movs r2, #1
	movs r3, #8
	bl sub_080F1B0C
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x22
	movs r2, #1
	movs r3, #8
	bl sub_080F1B0C
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #0x40
	movs r2, #1
	movs r3, #8
	bl sub_080F1B0C
	adds r4, #0x18
	adds r0, r4, #0
	movs r1, #0x48
	movs r2, #1
	movs r3, #8
	bl sub_080F1B0C
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #2
	ldr r0, _0801D8A0 @ =gUnk_09E5F71E
	adds r4, r4, r0
	adds r0, r4, #0
	bl StringLength
	adds r6, r0, #0
	subs r0, r6, #1
	adds r4, r4, r0
	movs r5, #0
	cmp r5, r6
	bge _0801D8C6
_0801D888:
	ldrb r0, [r4]
	cmp r0, #0x3f
	beq _0801D8A4
	cmp r0, #0x58
	beq _0801D8A8
	subs r0, #0x30
	movs r1, #0xa
	bl __modsi3
	b _0801D8AA
	.align 2, 0
_0801D89C: .4byte gUnk_0984F59C
_0801D8A0: .4byte gUnk_09E5F71E
_0801D8A4:
	movs r0, #0xe
	b _0801D8AA
_0801D8A8:
	movs r0, #0xf
_0801D8AA:
	lsls r0, r0, #3
	ldr r1, _0801D8F8 @ =gUnk_0984F54C
	adds r0, r0, r1
	lsls r2, r5, #2
	movs r1, #0x36
	subs r1, r1, r2
	movs r2, #1
	movs r3, #8
	bl sub_080F1B0C
	subs r4, #1
	adds r5, #1
	cmp r5, r6
	blt _0801D888
_0801D8C6:
	lsls r4, r7, #2
	adds r4, r4, r7
	lsls r4, r4, #2
	ldr r0, _0801D8FC @ =gUnk_09E5F726
	adds r4, r4, r0
	adds r0, r4, #0
	bl StringLength
	adds r6, r0, #0
	subs r0, r6, #1
	adds r4, r4, r0
	adds r4, r4, r0
	movs r5, #0
	cmp r5, r6
	bge _0801D922
_0801D8E4:
	ldrb r0, [r4]
	cmp r0, #0x3f
	beq _0801D900
	cmp r0, #0x58
	beq _0801D904
	subs r0, #0x30
	movs r1, #0xa
	bl __modsi3
	b _0801D906
	.align 2, 0
_0801D8F8: .4byte gUnk_0984F54C
_0801D8FC: .4byte gUnk_09E5F726
_0801D900:
	movs r0, #0xe
	b _0801D906
_0801D904:
	movs r0, #0xf
_0801D906:
	lsls r0, r0, #3
	ldr r1, _0801D928 @ =gUnk_0984F54C
	adds r0, r0, r1
	lsls r2, r5, #2
	movs r1, #0x5c
	subs r1, r1, r2
	movs r2, #1
	movs r3, #8
	bl sub_080F1B0C
	subs r4, #1
	adds r5, #1
	cmp r5, r6
	blt _0801D8E4
_0801D922:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801D928: .4byte gUnk_0984F54C

	thumb_func_start sub_0801D92C
sub_0801D92C: @ 0x0801D92C
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r6, _0801D94C @ =0x06001C00
	movs r7, #0x8b
	lsls r7, r7, #2
	bl sub_080EF454
	adds r4, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _0801D950
	movs r0, #0
	b _0801D98E
	.align 2, 0
_0801D94C: .4byte 0x06001C00
_0801D950:
	movs r0, #0xe
	movs r1, #2
	bl sub_080F0BB4
	adds r0, r4, #0
	bl sub_0801D830
	ldr r0, _0801D994 @ =0x06008580
	movs r1, #0
	bl sub_080F2E4C
	movs r0, #0
_0801D968:
	adds r5, r6, #0
	adds r5, #0x40
	adds r4, r0, #1
	adds r2, r6, #0
	movs r3, #0xd
_0801D972:
	adds r1, r7, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	strh r1, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0801D972
	adds r6, r5, #0
	adds r0, r4, #0
	cmp r0, #1
	ble _0801D968
	movs r0, #1
_0801D98E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801D994: .4byte 0x06008580

	thumb_func_start sub_0801D998
sub_0801D998: @ 0x0801D998
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #4]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	ldr r2, _0801DA8C @ =gCardStats
	movs r0, #0xb
	adds r1, r5, #0
	muls r1, r0, r1
	adds r0, r1, #7
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	mov sl, r0
	adds r0, r1, #6
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r4, [r0]
	mov r8, r4
	adds r1, #9
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r7, [r1]
	mov sb, r7
	movs r6, #0x80
	lsls r6, r6, #5
	movs r2, #0x82
	lsls r2, r2, #2
	ldr r3, _0801DA90 @ =gUnk_0985004C
	adds r0, r6, #0
	movs r1, #0x80
	bl sub_080EE010
	movs r0, #0xc0
	lsls r0, r0, #4
	ldr r2, _0801DA94 @ =0x0000020E
	ldr r3, _0801DA98 @ =gUnk_09850934
	movs r1, #0x80
	bl sub_080EE010
	movs r0, #0xc0
	lsls r0, r0, #0x13
	movs r1, #0x10
	str r1, [sp]
	movs r1, #0x82
	adds r2, r5, #0
	movs r3, #2
	bl sub_0801D290
	cmp r4, #0x16
	bne _0801DA12
	b _0801DB34
_0801DA12:
	cmp r4, #0x16
	bgt _0801DABC
	cmp r4, #0x14
	ble _0801DA1C
	b _0801DBCA
_0801DA1C:
	cmp r4, #1
	bge _0801DA22
	b _0801DBCA
_0801DA22:
	ldr r3, _0801DA9C @ =gUnk_0984A3FC
	adds r0, r6, #0
	movs r1, #0x50
	movs r2, #0xca
	bl sub_080EE010
	ldr r4, _0801DAA0 @ =0x050000A0
	adds r0, r5, #0
	bl sub_080EF2CC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x20
	bl MemoryCopyHalfWord
	adds r0, r5, #0
	bl sub_0801D6B4
	ldr r0, _0801DAA4 @ =0x050003A0
	mov r4, sl
	subs r4, #1
	lsls r1, r4, #5
	ldr r2, _0801DAA8 @ =gAttributePalettes
	adds r1, r1, r2
	movs r2, #0x20
	bl MemoryCopyHalfWord
	ldr r0, _0801DAAC @ =0x06017440
	lsls r4, r4, #7
	ldr r1, _0801DAB0 @ =gAttributeIcons
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #0x80
	bl MemoryCopyHalfWord
	ldr r0, _0801DAB4 @ =0x06010020
	ldr r1, _0801DAB8 @ =gUnk_09CCD2D0
	movs r2, #0x20
	bl MemoryCopyHalfWord
	adds r0, r5, #0
	bl sub_080EF3BC
	cmp r0, #0
	bne _0801DA7E
	b _0801DBC2
_0801DA7E:
	adds r0, r5, #0
	bl sub_0801D92C
	cmp r0, #0
	beq _0801DA8A
	b _0801DBCA
_0801DA8A:
	b _0801DBB8
	.align 2, 0
_0801DA8C: .4byte gCardStats
_0801DA90: .4byte gUnk_0985004C
_0801DA94: .4byte 0x0000020E
_0801DA98: .4byte gUnk_09850934
_0801DA9C: .4byte gUnk_0984A3FC
_0801DAA0: .4byte 0x050000A0
_0801DAA4: .4byte 0x050003A0
_0801DAA8: .4byte gAttributePalettes
_0801DAAC: .4byte 0x06017440
_0801DAB0: .4byte gAttributeIcons
_0801DAB4: .4byte 0x06010020
_0801DAB8: .4byte gUnk_09CCD2D0
_0801DABC:
	mov r0, r8
	cmp r0, #0x17
	beq _0801DAC4
	b _0801DBCA
_0801DAC4:
	ldr r3, _0801DB10 @ =gUnk_0984B994
	adds r0, r6, #0
	movs r1, #0x50
	movs r2, #0xca
	bl sub_080EE010
	ldr r4, _0801DB14 @ =0x050000A0
	adds r0, r5, #0
	bl sub_080EF2CC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x20
	bl MemoryCopyHalfWord
	adds r0, r5, #0
	bl sub_0801D6B4
	ldr r0, _0801DB18 @ =0x050003A0
	ldr r1, _0801DB1C @ =gUnk_0984DE6C
	movs r2, #0x20
	bl MemoryCopyHalfWord
	ldr r0, _0801DB20 @ =0x06017440
	ldr r1, _0801DB24 @ =gUnk_0984DCEC
	movs r2, #0x80
	bl MemoryCopyHalfWord
	cmp r7, #0
	beq _0801DBCA
	ldr r0, _0801DB28 @ =0x050003C0
	ldr r1, _0801DB2C @ =gUnk_0984F52C
	movs r2, #0x20
	bl MemoryCopyHalfWord
	ldr r0, _0801DB30 @ =0x060174C0
	subs r1, r7, #1
	b _0801DB82
	.align 2, 0
_0801DB10: .4byte gUnk_0984B994
_0801DB14: .4byte 0x050000A0
_0801DB18: .4byte 0x050003A0
_0801DB1C: .4byte gUnk_0984DE6C
_0801DB20: .4byte 0x06017440
_0801DB24: .4byte gUnk_0984DCEC
_0801DB28: .4byte 0x050003C0
_0801DB2C: .4byte gUnk_0984F52C
_0801DB30: .4byte 0x060174C0
_0801DB34:
	ldr r3, _0801DB90 @ =gUnk_0984B994
	adds r0, r6, #0
	movs r1, #0x50
	movs r2, #0xca
	bl sub_080EE010
	ldr r4, _0801DB94 @ =0x050000A0
	adds r0, r5, #0
	bl sub_080EF2CC
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0x20
	bl MemoryCopyHalfWord
	adds r0, r5, #0
	bl sub_0801D6B4
	ldr r0, _0801DB98 @ =0x050003A0
	ldr r1, _0801DB9C @ =gUnk_0984DE4C
	movs r2, #0x20
	bl MemoryCopyHalfWord
	ldr r0, _0801DBA0 @ =0x06017440
	ldr r1, _0801DBA4 @ =gUnk_0984DC6C
	movs r2, #0x80
	bl MemoryCopyHalfWord
	mov r0, sb
	cmp r0, #0
	beq _0801DBCA
	ldr r0, _0801DBA8 @ =0x050003C0
	ldr r1, _0801DBAC @ =gUnk_0984F52C
	movs r2, #0x20
	bl MemoryCopyHalfWord
	ldr r0, _0801DBB0 @ =0x060174C0
	mov r1, sb
	subs r1, #1
_0801DB82:
	lsls r1, r1, #5
	ldr r2, _0801DBB4 @ =gUnk_0984F46C
	adds r1, r1, r2
	movs r2, #0x20
	bl MemoryCopyHalfWord
	b _0801DBCA
	.align 2, 0
_0801DB90: .4byte gUnk_0984B994
_0801DB94: .4byte 0x050000A0
_0801DB98: .4byte 0x050003A0
_0801DB9C: .4byte gUnk_0984DE4C
_0801DBA0: .4byte 0x06017440
_0801DBA4: .4byte gUnk_0984DC6C
_0801DBA8: .4byte 0x050003C0
_0801DBAC: .4byte gUnk_0984F52C
_0801DBB0: .4byte 0x060174C0
_0801DBB4: .4byte gUnk_0984F46C
_0801DBB8:
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl sub_0801D7D0
	b _0801DBCA
_0801DBC2:
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl sub_0801D7D0
_0801DBCA:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_0801DBDC
sub_0801DBDC: @ 0x0801DBDC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	movs r0, #0
	mov sb, r0
	movs r1, #2
	mov sl, r1
	movs r2, #0
	str r2, [sp]
	ldr r2, _0801DC28 @ =gUnk_02006ED0
	ldr r0, _0801DC2C @ =gUnk_02000000
	ldr r3, _0801DC30 @ =0x00006C2C
	adds r0, r0, r3
	ldrb r3, [r0]
	movs r0, #7
	ands r0, r3
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	subs r1, #4
	ldrb r4, [r2, #8]
	ands r1, r4
	orrs r1, r0
	strb r1, [r2, #8]
	ldr r1, _0801DC34 @ =gUnk_0201AFB0
	movs r0, #1
	ldrb r2, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0801DC38
	ldr r0, [r1]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x12
	bl sub_080EE988
	b _0801DC46
	.align 2, 0
_0801DC28: .4byte gUnk_02006ED0
_0801DC2C: .4byte gUnk_02000000
_0801DC30: .4byte 0x00006C2C
_0801DC34: .4byte gUnk_0201AFB0
_0801DC38:
	ldr r0, [r1]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x12
	lsls r1, r3, #0x1d
	lsrs r1, r1, #0x1d
	bl sub_080EE7AC
_0801DC46:
	adds r6, r0, #0
	ldr r0, _0801DC9C @ =gUnk_02000000
	ldr r3, _0801DCA0 @ =0x00006C2C
	adds r0, r0, r3
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0801DCAC
	adds r4, r6, #0
	ldr r2, _0801DCA4 @ =gUnk_02006ED0
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #8]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #8]
	ldr r1, _0801DCA8 @ =gUnk_09E5F854
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #4]
	movs r2, #0
	mov sb, r2
	ldrb r0, [r6]
	cmp r0, #0
	beq _0801DD40
_0801DC82:
	ldrb r3, [r4]
	lsls r0, r3, #8
	ldrb r1, [r4, #1]
	orrs r0, r1
	bl sub_080F0210
	add sb, r0
	adds r4, #2
	ldrb r0, [r4]
	cmp r0, #0
	bne _0801DC82
	b _0801DD40
	.align 2, 0
_0801DC9C: .4byte gUnk_02000000
_0801DCA0: .4byte 0x00006C2C
_0801DCA4: .4byte gUnk_02006ED0
_0801DCA8: .4byte gUnk_09E5F854
_0801DCAC:
	adds r5, r6, #0
	ldr r2, _0801DD04 @ =gUnk_02006ED0
	rsbs r1, r1, #0
	lsrs r1, r1, #0x1f
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r2, #8]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #8]
	ldr r3, _0801DD08 @ =gUnk_09E5F854
	lsls r1, r0, #0x1e
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldr r0, [r1]
	str r0, [r2, #4]
	ldrb r0, [r6]
	cmp r0, #0
	beq _0801DD40
	adds r4, r2, #0
	adds r7, r3, #0
_0801DCE0:
	ldrb r1, [r5]
	ldr r0, _0801DD0C @ =gUnk_09E589C4
	adds r0, r1, r0
	ldrb r0, [r0]
	cmp r0, r1
	beq _0801DD10
	movs r1, #3
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #8]
	ands r0, r2
	strb r0, [r4, #8]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	adds r0, r0, r7
	ldr r0, [r0]
	b _0801DD2A
	.align 2, 0
_0801DD04: .4byte gUnk_02006ED0
_0801DD08: .4byte gUnk_09E5F854
_0801DD0C: .4byte gUnk_09E589C4
_0801DD10:
	movs r0, #2
	ldrb r3, [r4, #8]
	orrs r0, r3
	strb r0, [r4, #8]
	lsls r1, r0, #0x1e
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r7
	ldr r0, [r1]
_0801DD2A:
	str r0, [r4, #4]
	bl sub_080F0200
	mov r1, sb
	adds r1, #1
	adds r1, r1, r0
	mov sb, r1
	adds r5, #1
	ldrb r0, [r5]
	cmp r0, #0
	bne _0801DCE0
_0801DD40:
	ldr r0, _0801DD90 @ =gUnk_0201AFB0
	mov r4, sb
	str r4, [r0, #0x14]
	ldr r1, _0801DD94 @ =gUnk_02000000
	ldr r0, _0801DD98 @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801DDF4
	adds r7, r6, #0
	ldr r2, _0801DD9C @ =gUnk_02006ED0
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #8]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #8]
	ldr r1, _0801DDA0 @ =gUnk_09E5F854
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r2, #4]
	cmp r4, #0xe8
	bgt _0801DDA4
	lsrs r0, r4, #0x1f
	add r0, sb
	asrs r0, r0, #1
	movs r1, #0x78
	subs r6, r1, r0
	movs r0, #0x20
	movs r1, #2
	bl sub_080F0BB4
	b _0801DDB2
	.align 2, 0
_0801DD90: .4byte gUnk_0201AFB0
_0801DD94: .4byte gUnk_02000000
_0801DD98: .4byte 0x00006C2C
_0801DD9C: .4byte gUnk_02006ED0
_0801DDA0: .4byte gUnk_09E5F854
_0801DDA4:
	movs r6, #4
	movs r0, #0x40
	movs r1, #2
	bl sub_080F0BB4
	movs r2, #1
	str r2, [sp]
_0801DDB2:
	ldrb r0, [r7]
	cmp r0, #0
	bne _0801DDBA
	b _0801DEDE
_0801DDBA:
	ldrb r3, [r7]
	lsls r4, r3, #8
	ldrb r0, [r7, #1]
	orrs r4, r0
	adds r0, r4, #0
	bl sub_080F0210
	adds r5, r0, #0
	adds r0, r4, #0
	adds r1, r6, #0
	mov r2, sl
	ldr r3, _0801DDF0 @ =0x00008008
	bl sub_080F1884
	adds r0, r4, #0
	adds r1, r6, #0
	mov r2, sl
	movs r3, #7
	bl sub_080F1884
	adds r6, r6, r5
	adds r7, #2
	ldrb r0, [r7]
	cmp r0, #0
	bne _0801DDBA
	b _0801DEDE
	.align 2, 0
_0801DDF0: .4byte 0x00008008
_0801DDF4:
	mov r8, r6
	ldr r2, _0801DE30 @ =gUnk_02006ED0
	movs r1, #2
	ldrb r3, [r2, #8]
	orrs r1, r3
	strb r1, [r2, #8]
	ldr r3, _0801DE34 @ =gUnk_09E5F854
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r2, #4]
	mov r4, sb
	cmp r4, #0xe8
	bgt _0801DE38
	lsrs r0, r4, #0x1f
	add r0, sb
	asrs r0, r0, #1
	movs r1, #0x78
	subs r6, r1, r0
	movs r0, #0x20
	movs r1, #2
	bl sub_080F0BB4
	b _0801DE46
	.align 2, 0
_0801DE30: .4byte gUnk_02006ED0
_0801DE34: .4byte gUnk_09E5F854
_0801DE38:
	movs r6, #4
	movs r0, #0x40
	movs r1, #2
	bl sub_080F0BB4
	movs r0, #1
	str r0, [sp]
_0801DE46:
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0
	beq _0801DEDE
	ldr r7, _0801DE84 @ =gUnk_02006ED0
	ldr r2, _0801DE88 @ =gUnk_09E5F854
	mov sb, r2
_0801DE54:
	mov r3, r8
	ldrb r5, [r3]
	ldr r0, _0801DE8C @ =gUnk_09E589C4
	adds r0, r5, r0
	ldrb r4, [r0]
	cmp r4, r5
	beq _0801DE90
	ldrb r5, [r0]
	movs r1, #3
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r7, #8]
	ands r0, r2
	strb r0, [r7, #8]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	add r0, sb
	ldr r0, [r0]
	str r0, [r7, #4]
	movs r3, #3
	mov sl, r3
	b _0801DEB0
	.align 2, 0
_0801DE84: .4byte gUnk_02006ED0
_0801DE88: .4byte gUnk_09E5F854
_0801DE8C: .4byte gUnk_09E589C4
_0801DE90:
	movs r0, #2
	ldrb r4, [r7, #8]
	orrs r0, r4
	strb r0, [r7, #8]
	lsls r1, r0, #0x1e
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	adds r1, r1, r0
	add r1, sb
	ldr r0, [r1]
	str r0, [r7, #4]
	movs r0, #2
	mov sl, r0
_0801DEB0:
	bl sub_080F0200
	adds r4, r0, #0
	adds r4, #1
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, sl
	ldr r3, _0801DF48 @ =0x00008008
	bl sub_080F19A4
	adds r0, r5, #0
	adds r1, r6, #0
	mov r2, sl
	movs r3, #7
	bl sub_080F19A4
	adds r6, r6, r4
	movs r1, #1
	add r8, r1
	mov r2, r8
	ldrb r0, [r2]
	cmp r0, #0
	bne _0801DE54
_0801DEDE:
	ldr r4, _0801DF4C @ =0x06007100
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r4, #0
	bl MemoryClearHalfWord
	adds r0, r4, #0
	movs r1, #0
	bl sub_080F2E4C
	ldr r3, [sp]
	cmp r3, #0
	beq _0801DF5C
	movs r4, #0xc4
	lsls r4, r4, #1
	movs r1, #0
	ldr r6, _0801DF50 @ =gUnk_0201AFB0
	ldr r7, _0801DF54 @ =gUnk_03000040
_0801DF02:
	adds r0, r1, #0
	adds r0, #0x12
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xa
	ldr r3, _0801DF58 @ =0x06000800
	adds r2, r0, r3
	adds r5, r1, #1
	movs r3, #0x1f
_0801DF12:
	adds r1, r4, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	strh r1, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0801DF12
	movs r0, #0xf8
	lsls r0, r0, #3
	adds r2, r2, r0
	movs r3, #0x1f
_0801DF2C:
	adds r1, r4, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	strh r1, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _0801DF2C
	adds r1, r5, #0
	cmp r1, #1
	ble _0801DF02
	b _0801DF76
	.align 2, 0
_0801DF48: .4byte 0x00008008
_0801DF4C: .4byte 0x06007100
_0801DF50: .4byte gUnk_0201AFB0
_0801DF54: .4byte gUnk_03000040
_0801DF58: .4byte 0x06000800
_0801DF5C:
	ldr r1, _0801DF94 @ =0x06000C80
	movs r3, #0
	ldr r6, _0801DF98 @ =gUnk_0201AFB0
	ldr r7, _0801DF9C @ =gUnk_03000040
	movs r4, #0xc4
	lsls r4, r4, #1
	adds r2, r4, #0
_0801DF6A:
	adds r0, r3, r2
	strh r0, [r1]
	adds r1, #2
	adds r3, #1
	cmp r3, #0x7f
	ble _0801DF6A
_0801DF76:
	movs r0, #0
	str r0, [r6, #0x18]
	str r0, [r6, #0x1c]
	movs r2, #0xf1
	lsls r2, r2, #1
	adds r1, r7, r2
	strh r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801DF94: .4byte 0x06000C80
_0801DF98: .4byte gUnk_0201AFB0
_0801DF9C: .4byte gUnk_03000040

	thumb_func_start sub_0801DFA0
sub_0801DFA0: @ 0x0801DFA0
	push {r4, lr}
	ldr r0, _0801DFD0 @ =gUnk_0201AFB0
	ldr r1, [r0, #0x14]
	adds r3, r0, #0
	cmp r1, #0xe8
	ble _0801DFF4
	adds r0, r1, #0
	subs r0, #0xe8
	lsls r4, r0, #1
	adds r1, r4, #0
	adds r1, #0xd2
	ldr r0, [r3, #0x1c]
	adds r0, #1
	str r0, [r3, #0x1c]
	cmp r0, r1
	blt _0801DFC4
	movs r0, #0
	str r0, [r3, #0x1c]
_0801DFC4:
	ldr r2, [r3, #0x1c]
	cmp r2, #0x5a
	bgt _0801DFD4
	movs r0, #0
	b _0801DFE6
	.align 2, 0
_0801DFD0: .4byte gUnk_0201AFB0
_0801DFD4:
	adds r0, r4, #0
	adds r0, #0x5a
	cmp r2, r0
	bgt _0801DFE8
	adds r0, r2, #0
	subs r0, #0x5a
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
_0801DFE6:
	str r0, [r3, #0x18]
_0801DFE8:
	ldr r0, _0801DFFC @ =gUnk_03000040
	ldr r1, [r3, #0x18]
	movs r2, #0xf1
	lsls r2, r2, #1
	adds r0, r0, r2
	strh r1, [r0]
_0801DFF4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801DFFC: .4byte gUnk_03000040

	thumb_func_start sub_0801E000
sub_0801E000: @ 0x0801E000
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	ldr r4, _0801E0E8 @ =gUnk_02006ED0
	ldr r0, _0801E0EC @ =gUnk_02000000
	ldr r1, _0801E0F0 @ =0x00006C2C
	adds r5, r0, r1
	movs r6, #7
	adds r1, r6, #0
	ldrb r2, [r5]
	ands r1, r2
	rsbs r1, r1, #0
	lsrs r1, r1, #0x1f
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r4, #8]
	ands r0, r2
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #8]
	ldr r1, _0801E0F4 @ =gUnk_09E5F854
	mov sb, r1
	lsls r1, r0, #0x1e
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	adds r1, r1, r0
	add r1, sb
	ldr r0, [r1]
	str r0, [r4, #4]
	movs r0, #0x10
	movs r1, #0x3a
	movs r2, #1
	movs r3, #1
	bl sub_080F0CC0
	movs r7, #0x40
	ldrb r0, [r4, #0x15]
	orrs r0, r7
	strb r0, [r4, #0x15]
	adds r0, r6, #0
	ldrb r2, [r5]
	ands r0, r2
	movs r1, #0
	cmp r0, #0
	bne _0801E068
	movs r1, #2
_0801E068:
	adds r0, r1, #0
	movs r1, #2
	movs r2, #7
	mov r3, r8
	bl sub_080F2A7C
	ldrh r0, [r4, #0xe]
	lsls r1, r0, #0x16
	movs r0, #0xe0
	lsls r0, r0, #0x17
	cmp r1, r0
	bls _0801E0C2
	movs r0, #3
	rsbs r0, r0, #0
	ldrb r1, [r4, #8]
	ands r0, r1
	strb r0, [r4, #8]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	add r0, sb
	ldr r0, [r0]
	str r0, [r4, #4]
	movs r0, #0x10
	movs r1, #0x3a
	movs r2, #1
	movs r3, #1
	bl sub_080F0CC0
	ldrb r0, [r4, #0x15]
	orrs r0, r7
	strb r0, [r4, #0x15]
	adds r0, r6, #0
	ldrb r5, [r5]
	ands r0, r5
	movs r1, #0
	cmp r0, #0
	bne _0801E0B6
	movs r1, #2
_0801E0B6:
	adds r0, r1, #0
	movs r1, #2
	movs r2, #7
	mov r3, r8
	bl sub_080F2A7C
_0801E0C2:
	ldr r1, _0801E0F8 @ =gUnk_0201AFB0
	ldr r0, _0801E0E8 @ =gUnk_02006ED0
	ldrh r0, [r0, #0xe]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x16
	adds r0, #2
	str r0, [r1, #0x24]
	movs r0, #0
	str r0, [r1, #0x20]
	ldr r0, _0801E0FC @ =0x06010040
	movs r1, #0
	bl sub_080F2E4C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E0E8: .4byte gUnk_02006ED0
_0801E0EC: .4byte gUnk_02000000
_0801E0F0: .4byte 0x00006C2C
_0801E0F4: .4byte gUnk_09E5F854
_0801E0F8: .4byte gUnk_0201AFB0
_0801E0FC: .4byte 0x06010040

	thumb_func_start sub_0801E100
sub_0801E100: @ 0x0801E100
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r3, _0801E18C @ =gCardStats
	movs r1, #0xb
	adds r2, r0, #0
	muls r2, r1, r2
	adds r1, r2, #7
	lsls r1, r1, #1
	adds r1, r1, r3
	ldrh r4, [r1]
	adds r1, r2, #6
	lsls r1, r1, #1
	adds r7, r1, r3
	ldrh r5, [r7]
	adds r2, #9
	lsls r2, r2, #1
	adds r2, r2, r3
	ldrh r6, [r2]
	movs r1, #0x16
	muls r0, r1, r0
	adds r0, r0, r3
	ldrh r0, [r0]
	mov sb, r0
	ldr r0, _0801E190 @ =gUnk_0201AFB0
	mov r8, r0
	movs r0, #0x3d
	rsbs r0, r0, #0
	mov r1, r8
	ldrb r1, [r1, #2]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	mov r2, r8
	strb r0, [r2, #2]
	cmp r4, #0
	bgt _0801E156
	b _0801E262
_0801E156:
	ldrh r1, [r7]
	cmp r1, #0x17
	bgt _0801E1A4
	cmp r1, #0x16
	blt _0801E1A4
	cmp r6, #0
	ble _0801E1D0
	subs r6, #1
	ldr r0, _0801E194 @ =0x05000380
	ldr r1, _0801E198 @ =gUnk_0984F3AC
	movs r2, #0x20
	bl MemoryCopyHalfWord
	ldr r0, _0801E19C @ =0x06017500
	lsls r1, r6, #7
	ldr r2, _0801E1A0 @ =gUnk_0984F0AC
	adds r1, r1, r2
	movs r2, #0x80
	bl MemoryCopyHalfWord
	movs r0, #2
	mov r3, r8
	ldrb r3, [r3, #2]
	orrs r0, r3
	mov r6, r8
	strb r0, [r6, #2]
	b _0801E1D0
	.align 2, 0
_0801E18C: .4byte gCardStats
_0801E190: .4byte gUnk_0201AFB0
_0801E194: .4byte 0x05000380
_0801E198: .4byte gUnk_0984F3AC
_0801E19C: .4byte 0x06017500
_0801E1A0: .4byte gUnk_0984F0AC
_0801E1A4:
	cmp r5, #0
	ble _0801E1D0
	subs r5, #1
	ldr r0, _0801E270 @ =0x05000380
	lsls r1, r5, #5
	ldr r2, _0801E274 @ =gRacePalettes
	adds r1, r1, r2
	movs r2, #0x20
	bl MemoryCopyHalfWord
	ldr r0, _0801E278 @ =0x06017500
	lsls r1, r5, #7
	ldr r2, _0801E27C @ =gRaceIcons
	adds r1, r1, r2
	movs r2, #0x80
	bl MemoryCopyHalfWord
	ldr r1, _0801E280 @ =gUnk_0201AFB0
	movs r0, #2
	ldrb r2, [r1, #2]
	orrs r0, r2
	strb r0, [r1, #2]
_0801E1D0:
	movs r5, #0
	mov r3, sb
	lsls r3, r3, #0x10
	mov sl, r3
	ldr r6, _0801E284 @ =gUnk_09E4F204
	mov sb, r6
	ldr r0, _0801E280 @ =gUnk_0201AFB0
	mov r8, r0
_0801E1E0:
	lsls r4, r5, #2
	mov r1, sb
	adds r0, r4, r1
	ldr r6, [r0]
	mov r2, sl
	lsrs r0, r2, #0x10
	adds r1, r6, #0
	bl sub_080EF4BC
	adds r7, r5, #1
	cmp r0, #0
	beq _0801E25C
	movs r3, #1
	rsbs r3, r3, #0
	movs r2, #0
	ldr r0, _0801E288 @ =gUnk_09E58AC4
	ldrh r1, [r0]
	adds r5, r0, #0
	cmp r1, r6
	beq _0801E25C
_0801E208:
	adds r2, #1
	cmp r2, #0x20
	bhi _0801E220
	lsls r0, r2, #1
	adds r0, r0, r5
	mov r6, sb
	adds r1, r4, r6
	ldrh r0, [r0]
	ldrh r1, [r1]
	cmp r0, r1
	bne _0801E208
	adds r3, r2, #0
_0801E220:
	cmp r3, #0
	ble _0801E25C
	mov r1, r8
	ldrb r1, [r1, #2]
	lsls r0, r1, #0x1a
	lsrs r0, r0, #0x1c
	lsls r0, r0, #8
	ldr r2, _0801E28C @ =0x06017580
	adds r0, r0, r2
	lsls r1, r3, #8
	ldr r2, _0801E290 @ =gUnk_09E2DDB4
	adds r1, r1, r2
	movs r2, #0x80
	lsls r2, r2, #1
	bl MemoryCopyHalfWord
	mov r3, r8
	ldrb r2, [r3, #2]
	lsls r0, r2, #0x1a
	lsrs r0, r0, #0x1c
	adds r0, #1
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #2
	movs r6, #0x3d
	rsbs r6, r6, #0
	adds r1, r6, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r3, #2]
_0801E25C:
	adds r5, r7, #0
	cmp r5, #0x1f
	ble _0801E1E0
_0801E262:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E270: .4byte 0x05000380
_0801E274: .4byte gRacePalettes
_0801E278: .4byte 0x06017500
_0801E27C: .4byte gRaceIcons
_0801E280: .4byte gUnk_0201AFB0
_0801E284: .4byte gUnk_09E4F204
_0801E288: .4byte gUnk_09E58AC4
_0801E28C: .4byte 0x06017580
_0801E290: .4byte gUnk_09E2DDB4

	thumb_func_start sub_0801E294
sub_0801E294: @ 0x0801E294
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r2, #0
	mov sb, r3
	ldr r1, [sp, #0x18]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r2, #0xc0
	lsls r2, r2, #0x13
	mov r8, r2
	lsls r6, r0, #0x1c
	lsrs r6, r6, #0x10
	lsls r0, r0, #5
	movs r2, #0xa0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	movs r2, #0x20
	bl MemoryCopyHalfWord
	lsls r0, r4, #5
	ldr r3, _0801E318 @ =0x06004000
	adds r0, r0, r3
	mov r1, sb
	movs r2, #0x80
	bl MemoryCopyHalfWord
	lsls r5, r5, #1
	add r8, r5
	adds r1, r4, #1
	lsls r1, r1, #0x10
	adds r4, r6, r4
	mov r0, r8
	strh r4, [r0]
	ldr r3, _0801E31C @ =0x06000002
	adds r2, r5, r3
	lsrs r0, r1, #0x10
	movs r3, #0x80
	lsls r3, r3, #9
	adds r1, r1, r3
	adds r0, r6, r0
	strh r0, [r2]
	ldr r0, _0801E320 @ =0x06000040
	adds r2, r5, r0
	lsrs r0, r1, #0x10
	adds r1, r1, r3
	lsrs r1, r1, #0x10
	adds r0, r6, r0
	strh r0, [r2]
	ldr r2, _0801E324 @ =0x06000042
	adds r5, r5, r2
	adds r6, r6, r1
	strh r6, [r5]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801E318: .4byte 0x06004000
_0801E31C: .4byte 0x06000002
_0801E320: .4byte 0x06000040
_0801E324: .4byte 0x06000042

	thumb_func_start sub_0801E328
sub_0801E328: @ 0x0801E328
	push {lr}
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #4
	bl sub_080F58B8
	pop {r1}
	bx r1

	thumb_func_start sub_0801E344
sub_0801E344: @ 0x0801E344
	push {lr}
	movs r0, #4
	bl sub_080F5840
	cmp r0, #0
	bne _0801E354
	movs r0, #0
	b _0801E362
_0801E354:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _0801E368 @ =0x0000E0FF
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
_0801E362:
	pop {r1}
	bx r1
	.align 2, 0
_0801E368: .4byte 0x0000E0FF

	thumb_func_start sub_0801E36C
sub_0801E36C: @ 0x0801E36C
	push {lr}
	ldr r2, _0801E38C @ =gUnk_03000040
	movs r0, #0xa4
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #3
	ldrh r1, [r1]
	ands r0, r1
	mov ip, r2
	cmp r0, #0
	beq _0801E390
	movs r0, #1
	bl sub_080F9AB4
	movs r0, #1
	b _0801E434
	.align 2, 0
_0801E38C: .4byte gUnk_03000040
_0801E390:
	ldr r0, _0801E3A8 @ =gUnk_0201AFB0
	ldrh r1, [r0, #6]
	adds r3, r0, #0
	cmp r1, #0
	beq _0801E3AC
	subs r0, r1, #1
	strh r0, [r3, #6]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0801E3AC
	movs r0, #1
	b _0801E434
	.align 2, 0
_0801E3A8: .4byte gUnk_0201AFB0
_0801E3AC:
	movs r1, #0xa3
	lsls r1, r1, #1
	add r1, ip
	movs r0, #0x80
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801E3D8
	ldr r1, [r3, #0x20]
	adds r0, r1, #0
	adds r0, #0x84
	ldr r2, [r3, #0x24]
	cmp r0, r2
	bge _0801E3CC
	adds r0, r1, #4
	b _0801E3D6
_0801E3CC:
	adds r0, r1, #0
	adds r0, #0x80
	cmp r0, r2
	bge _0801E3D8
	adds r0, r1, #1
_0801E3D6:
	str r0, [r3, #0x20]
_0801E3D8:
	movs r1, #0xa3
	lsls r1, r1, #1
	add r1, ip
	movs r0, #0x40
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801E3FA
	ldr r0, [r3, #0x20]
	cmp r0, #4
	ble _0801E3F2
	subs r0, #4
	b _0801E3F8
_0801E3F2:
	cmp r0, #0
	ble _0801E3FA
	subs r0, #1
_0801E3F8:
	str r0, [r3, #0x20]
_0801E3FA:
	movs r1, #0xa4
	lsls r1, r1, #1
	add r1, ip
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801E432
	ldr r1, _0801E438 @ =gUnk_02000000
	ldr r0, _0801E43C @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801E432
	ldrb r2, [r3]
	lsls r0, r2, #0x1f
	lsrs r0, r0, #0x1f
	movs r1, #1
	bics r1, r0
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	bl sub_0801DBDC
_0801E432:
	movs r0, #0
_0801E434:
	pop {r1}
	bx r1
	.align 2, 0
_0801E438: .4byte gUnk_02000000
_0801E43C: .4byte 0x00006C2C

	thumb_func_start sub_0801E440
sub_0801E440: @ 0x0801E440
	push {r4, lr}
	bl sub_0801D45C
	ldr r4, _0801E484 @ =gUnk_0201AFB0
	ldr r0, [r4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x12
	ldrh r1, [r4, #0xc]
	ldrh r2, [r4, #0x10]
	bl sub_0801D998
	bl sub_0801DBDC
	ldr r0, [r4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x12
	ldr r1, _0801E488 @ =gUnk_02000000
	ldr r2, _0801E48C @ =0x00006C2C
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1d
	bl sub_080EEB54
	bl sub_0801E000
	ldr r0, [r4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x12
	bl sub_0801E100
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E484: .4byte gUnk_0201AFB0
_0801E488: .4byte gUnk_02000000
_0801E48C: .4byte 0x00006C2C

	thumb_func_start sub_0801E490
sub_0801E490: @ 0x0801E490
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0801E4E0 @ =gCardStats
	movs r1, #0xb
	muls r1, r0, r1
	adds r0, r1, #6
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r4, [r0]
	adds r0, r1, #5
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r5, [r0]
	adds r1, #9
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r6, [r1]
	ldr r0, _0801E4E4 @ =0x00060056
	ldr r2, _0801E4E8 @ =0x0000D3A2
	movs r1, #0x40
	bl sub_080F616C
	cmp r4, #1
	blt _0801E538
	cmp r4, #0x14
	ble _0801E4F4
	cmp r4, #0x17
	bgt _0801E538
	cmp r4, #0x16
	blt _0801E538
	cmp r6, #0
	beq _0801E538
	ldr r0, _0801E4EC @ =0x00150058
	ldr r2, _0801E4F0 @ =0x0000E3A6
	movs r1, #0
	bl sub_080F616C
	b _0801E538
	.align 2, 0
_0801E4E0: .4byte gCardStats
_0801E4E4: .4byte 0x00060056
_0801E4E8: .4byte 0x0000D3A2
_0801E4EC: .4byte 0x00150058
_0801E4F0: .4byte 0x0000E3A6
_0801E4F4:
	movs r4, #0
	cmp r4, r5
	bge _0801E538
	movs r7, #0xb0
	lsls r7, r7, #0xd
	movs r6, #0
_0801E500:
	cmp r5, #9
	bhi _0801E51C
	lsls r1, r4, #3
	movs r0, #0x5c
	subs r0, r0, r1
	orrs r0, r7
	movs r1, #0
	ldr r2, _0801E518 @ =0x0000F001
	bl sub_080F616C
	b _0801E530
	.align 2, 0
_0801E518: .4byte 0x0000F001
_0801E51C:
	adds r0, r6, #0
	adds r1, r5, #0
	bl __divsi3
	adds r0, #0x14
	orrs r0, r7
	movs r1, #0
	ldr r2, _0801E55C @ =0x0000F001
	bl sub_080F616C
_0801E530:
	adds r6, #0x50
	adds r4, #1
	cmp r4, r5
	blt _0801E500
_0801E538:
	movs r5, #0x70
	ldr r6, _0801E560 @ =gUnk_0201AFB0
	movs r0, #2
	ldrb r1, [r6, #2]
	ands r0, r1
	cmp r0, #0
	beq _0801E552
	ldr r2, _0801E564 @ =0x0000C3A8
	movs r0, #0x70
	movs r1, #0x40
	bl sub_080F616C
	movs r5, #0x80
_0801E552:
	movs r4, #0
	ldrb r6, [r6, #2]
	lsls r0, r6, #0x1a
	b _0801E584
	.align 2, 0
_0801E55C: .4byte 0x0000F001
_0801E560: .4byte gUnk_0201AFB0
_0801E564: .4byte 0x0000C3A8
_0801E568:
	lsls r2, r4, #0x12
	movs r0, #0xeb
	lsls r0, r0, #0x11
	adds r2, r2, r0
	lsrs r2, r2, #0x10
	adds r0, r5, #0
	movs r1, #0x40
	bl sub_080F6450
	adds r5, #0x10
	adds r4, #1
	ldr r0, _0801E590 @ =gUnk_0201AFB0
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x1a
_0801E584:
	lsrs r0, r0, #0x1c
	cmp r4, r0
	blt _0801E568
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E590: .4byte gUnk_0201AFB0

	thumb_func_start sub_0801E594
sub_0801E594: @ 0x0801E594
	push {r4, r5, r6, r7, lr}
	adds r3, r0, #0
	cmp r3, #0
	bge _0801E59E
	adds r0, r3, #7
_0801E59E:
	asrs r2, r0, #3
	lsls r0, r2, #3
	subs r0, r3, r0
	movs r1, #0x10
	subs r6, r1, r0
	lsls r5, r2, #4
	adds r5, #2
	cmp r6, #0x8f
	bgt _0801E606
	ldr r7, _0801E60C @ =0x00004040
_0801E5B2:
	lsls r4, r6, #0x10
	movs r0, #0x70
	orrs r0, r4
	ldr r1, _0801E610 @ =0xFFFFF800
	adds r2, r5, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r1, r7, #0
	bl sub_080F616C
	movs r0, #0x90
	orrs r0, r4
	ldr r1, _0801E614 @ =0xFFFFF804
	adds r2, r5, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r1, r7, #0
	bl sub_080F616C
	movs r0, #0xb0
	orrs r0, r4
	ldr r1, _0801E618 @ =0xFFFFF808
	adds r2, r5, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r1, r7, #0
	bl sub_080F616C
	movs r0, #0xd0
	orrs r4, r0
	ldr r0, _0801E61C @ =0xFFFFF80C
	adds r2, r5, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_080F616C
	adds r6, #8
	adds r5, #0x10
	cmp r6, #0x8f
	ble _0801E5B2
_0801E606:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E60C: .4byte 0x00004040
_0801E610: .4byte 0xFFFFF800
_0801E614: .4byte 0xFFFFF804
_0801E618: .4byte 0xFFFFF808
_0801E61C: .4byte 0xFFFFF80C

	thumb_func_start sub_0801E620
sub_0801E620: @ 0x0801E620
	push {r4, lr}
	ldr r4, _0801E63C @ =gUnk_0201AFB0
	ldr r0, [r4]
	lsls r0, r0, #0xf
	lsrs r0, r0, #0x12
	bl sub_0801E490
	ldr r0, [r4, #0x20]
	bl sub_0801E594
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E63C: .4byte gUnk_0201AFB0

	thumb_func_start sub_0801E640
sub_0801E640: @ 0x0801E640
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	mov sb, r2
	mov r8, r3
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	bl sub_0801D448
	ldr r3, _0801E6B8 @ =gUnk_0201AFB0
	ldr r1, _0801E6BC @ =0x00003FFF
	ands r1, r4
	lsls r1, r1, #3
	ldr r0, [r3]
	ldr r2, _0801E6C0 @ =0xFFFE0007
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	ldr r5, _0801E6C4 @ =gCardStats
	movs r0, #0xb
	muls r4, r0, r4
	adds r0, r4, #3
	lsls r0, r0, #1
	adds r0, r0, r5
	ldr r2, _0801E6C8 @ =0x0000FFFF
	movs r1, #0
	ldrh r7, [r0]
	cmp r7, r2
	beq _0801E684
	ldrh r1, [r0]
_0801E684:
	str r1, [r3, #0xc]
	adds r0, r4, #4
	lsls r0, r0, #1
	adds r0, r0, r5
	movs r1, #0
	ldrh r4, [r0]
	cmp r4, r2
	beq _0801E696
	ldrh r1, [r0]
_0801E696:
	str r1, [r3, #0x10]
	strh r6, [r3, #6]
	mov r7, sb
	str r7, [r3, #0x28]
	mov r0, r8
	str r0, [r3, #0x2c]
	movs r0, #3
	rsbs r0, r0, #0
	ldrb r1, [r3]
	ands r0, r1
	strb r0, [r3]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E6B8: .4byte gUnk_0201AFB0
_0801E6BC: .4byte 0x00003FFF
_0801E6C0: .4byte 0xFFFE0007
_0801E6C4: .4byte gCardStats
_0801E6C8: .4byte 0x0000FFFF

	thumb_func_start sub_0801E6CC
sub_0801E6CC: @ 0x0801E6CC
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_080EE76C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_0801E640
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_0801E6F4
sub_0801E6F4: @ 0x0801E6F4
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_0801E640
	ldr r1, _0801E710 @ =gUnk_0201AFB0
	movs r0, #4
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0801E710: .4byte gUnk_0201AFB0

	thumb_func_start sub_0801E714
sub_0801E714: @ 0x0801E714
	push {r4, r5, lr}
	movs r5, #0
	ldr r1, _0801E744 @ =gUnk_0201AFB0
	movs r0, #4
	ldrb r2, [r1]
	ands r0, r2
	adds r4, r1, #0
	cmp r0, #0
	beq _0801E732
	ldr r0, _0801E748 @ =gUnk_02023130
	ldr r1, _0801E74C @ =0x00000222
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r5, r0, #0x1e
_0801E732:
	ldrh r0, [r4, #4]
	cmp r0, #1
	beq _0801E768
	cmp r0, #1
	bgt _0801E750
	cmp r0, #0
	beq _0801E75A
	b _0801E7A6
	.align 2, 0
_0801E744: .4byte gUnk_0201AFB0
_0801E748: .4byte gUnk_02023130
_0801E74C: .4byte 0x00000222
_0801E750:
	cmp r0, #2
	beq _0801E776
	cmp r0, #3
	beq _0801E78C
	b _0801E7A6
_0801E75A:
	movs r0, #0x80
	lsls r0, r0, #0x13
	ldrh r0, [r0]
	strh r0, [r4, #8]
	bl sub_0801E440
	b _0801E79C
_0801E768:
	bl sub_0801E620
	bl sub_0801DFA0
	bl sub_0801E328
	b _0801E798
_0801E776:
	bl sub_0801E620
	bl sub_0801DFA0
	bl sub_0801E36C
	cmp r0, #0
	bne _0801E79C
	cmp r5, #0
	beq _0801E7A2
	b _0801E79C
_0801E78C:
	bl sub_0801E620
	bl sub_0801DFA0
	bl sub_0801E344
_0801E798:
	cmp r0, #0
	beq _0801E7A2
_0801E79C:
	ldrh r0, [r4, #4]
	adds r0, #1
	strh r0, [r4, #4]
_0801E7A2:
	movs r0, #0
	b _0801E7B0
_0801E7A6:
	movs r1, #0x80
	lsls r1, r1, #0x13
	ldrh r0, [r4, #8]
	strh r0, [r1]
	movs r0, #1
_0801E7B0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801E7B8
sub_0801E7B8: @ 0x0801E7B8
	movs r0, #0x81
	bx lr

	thumb_func_start sub_0801E7BC
sub_0801E7BC: @ 0x0801E7BC
	ldr r1, _0801E7C8 @ =gUnk_09E58B08
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0801E7C8: .4byte gUnk_09E58B08

	thumb_func_start sub_0801E7CC
sub_0801E7CC: @ 0x0801E7CC
	push {r4, lr}
	lsls r2, r0, #5
	adds r2, r2, r0
	lsls r2, r2, #3
	ldr r0, _0801E84C @ =gUnk_0201E2B4
	adds r4, r2, r0
	adds r0, r1, #0
	movs r1, #0
	bl GL_OpenFile
	adds r1, r0, #0
	adds r1, #8
	ldrh r0, [r1]
	str r0, [r4]
	adds r1, #2
	movs r3, #0
	cmp r3, r0
	bhs _0801E804
	adds r2, r4, #0
	adds r2, #0xc
_0801E7F4:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	adds r2, #2
	adds r3, #1
	ldr r0, [r4]
	cmp r3, r0
	blo _0801E7F4
_0801E804:
	ldrh r0, [r1]
	str r0, [r4, #8]
	adds r1, #2
	movs r3, #0
	cmp r3, r0
	bhs _0801E824
	adds r2, r4, #0
	adds r2, #0xca
_0801E814:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	adds r2, #2
	adds r3, #1
	ldr r0, [r4, #8]
	cmp r3, r0
	blo _0801E814
_0801E824:
	ldrh r0, [r1]
	str r0, [r4, #4]
	adds r1, #2
	movs r3, #0
	cmp r3, r0
	bhs _0801E844
	adds r2, r4, #0
	adds r2, #0xac
_0801E834:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	adds r2, #2
	adds r3, #1
	ldr r0, [r4, #4]
	cmp r3, r0
	blo _0801E834
_0801E844:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801E84C: .4byte gUnk_0201E2B4

	thumb_func_start sub_0801E850
sub_0801E850: @ 0x0801E850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r6, r1, #0
	movs r0, #1
	mov sb, r0
	ldr r1, [sp]
	lsls r0, r1, #5
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, _0801E968 @ =gUnk_0201E2B4
	adds r0, r0, r1
	mov ip, r0
	movs r0, #0
	mov r2, ip
	str r0, [r2]
	str r0, [r2, #8]
	str r0, [r2, #4]
	movs r4, #0
	ldrb r3, [r6, #0x18]
	cmp r4, r3
	bge _0801E8CA
	ldr r5, _0801E96C @ =gCardStats
	mov r8, r5
	ldr r1, _0801E970 @ =gUnk_0201FF60
	ldr r7, [sp]
	lsls r0, r7, #1
	adds r0, r0, r1
	adds r5, r0, #4
_0801E892:
	mov r0, ip
	ldr r3, [r0]
	lsls r0, r3, #1
	mov r2, ip
	adds r2, #0xc
	adds r2, r2, r0
	lsls r0, r4, #1
	adds r1, r6, #0
	adds r1, #0x1c
	adds r1, r1, r0
	movs r0, #0x16
	ldrh r7, [r1]
	muls r0, r7, r0
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r2]
	adds r3, #1
	mov r0, ip
	str r3, [r0]
	ldrh r0, [r1]
	strh r0, [r5]
	adds r5, #4
	movs r1, #1
	add sb, r1
	adds r4, #1
	ldrb r2, [r6, #0x18]
	cmp r4, r2
	blt _0801E892
_0801E8CA:
	movs r4, #0
	ldrb r3, [r6, #0x19]
	cmp r4, r3
	bge _0801E90A
	mov r5, ip
	adds r5, #0xac
	str r5, [sp, #4]
	ldr r7, _0801E96C @ =gCardStats
	mov sl, r7
	movs r0, #0x16
	mov r8, r0
	adds r3, r6, #0
	adds r3, #0xbc
_0801E8E4:
	mov r1, ip
	ldr r2, [r1, #4]
	lsls r1, r2, #1
	ldr r5, [sp, #4]
	adds r1, r5, r1
	ldrh r7, [r3]
	mov r0, r8
	muls r0, r7, r0
	add r0, sl
	ldrh r0, [r0]
	strh r0, [r1]
	adds r2, #1
	mov r0, ip
	str r2, [r0, #4]
	adds r3, #2
	adds r4, #1
	ldrb r1, [r6, #0x19]
	cmp r4, r1
	blt _0801E8E4
_0801E90A:
	movs r4, #0
	ldrb r2, [r6, #0x1a]
	cmp r4, r2
	bge _0801E958
	ldr r3, _0801E96C @ =gCardStats
	mov r8, r3
	ldr r0, _0801E970 @ =gUnk_0201FF60
	mov r5, sb
	lsls r2, r5, #2
	ldr r7, [sp]
	lsls r1, r7, #1
	adds r1, r1, r0
	adds r5, r2, r1
_0801E924:
	mov r0, ip
	ldr r3, [r0, #8]
	lsls r0, r3, #1
	mov r2, ip
	adds r2, #0xca
	adds r2, r2, r0
	lsls r0, r4, #1
	adds r1, r6, #0
	adds r1, #0xda
	adds r1, r1, r0
	movs r0, #0x16
	ldrh r7, [r1]
	muls r0, r7, r0
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r2]
	adds r3, #1
	mov r0, ip
	str r3, [r0, #8]
	ldrh r0, [r1]
	strh r0, [r5]
	adds r5, #4
	adds r4, #1
	ldrb r1, [r6, #0x1a]
	cmp r4, r1
	blt _0801E924
_0801E958:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E968: .4byte gUnk_0201E2B4
_0801E96C: .4byte gCardStats
_0801E970: .4byte gUnk_0201FF60

	thumb_func_start sub_0801E974
sub_0801E974: @ 0x0801E974
	push {lr}
	ldr r1, _0801E980 @ =gUnk_02001138
	bl sub_0801E850
	pop {r0}
	bx r0
	.align 2, 0
_0801E980: .4byte gUnk_02001138

	thumb_func_start gEngineEffectBoostATKBoostDEF_0801E984
gEngineEffectBoostATKBoostDEF_0801E984: @ 0x0801E984
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, _0801E9EC @ =gUnk_02023130
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r2, r1
	ldr r0, [r0]
	movs r1, #0xff
	lsls r1, r1, #0xa
	ands r0, r1
	adds r4, r2, #0
	cmp r0, #0
	bne _0801EA4C
	ldr r2, _0801E9F0 @ =0x0000021E
	adds r1, r4, r2
	movs r2, #1
	adds r0, r2, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801EA4C
	ldr r0, _0801E9F4 @ =0x00000226
	adds r5, r4, r0
	ldrb r3, [r5]
	adds r0, r2, #0
	ands r0, r3
	cmp r0, #0
	bne _0801E9FC
	ldr r2, _0801E9F8 @ =gUnk_03000040
	movs r0, #0xa4
	lsls r0, r0, #1
	adds r1, r2, r0
	movs r0, #8
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801EA4C
	movs r1, #0xa3
	lsls r1, r1, #1
	adds r2, r2, r1
	movs r1, #0xc1
	lsls r1, r1, #2
	adds r0, r1, #0
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, r1
	bne _0801EA4C
	movs r0, #1
	orrs r0, r3
	strb r0, [r5]
	b _0801EB6C
	.align 2, 0
_0801E9EC: .4byte gUnk_02023130
_0801E9F0: .4byte 0x0000021E
_0801E9F4: .4byte 0x00000226
_0801E9F8: .4byte gUnk_03000040
_0801E9FC:
	movs r1, #0x87
	lsls r1, r1, #2
	adds r0, r4, r1
	ldrh r0, [r0]
	cmp r0, #0
	bne _0801EA18
	bl sub_080F9B40
	bl sub_080CCA5C
	cmp r0, #0
	bne _0801EA16
	b _0801EB70
_0801EA16:
	b _0801EC84
_0801EA18:
	ldr r1, _0801EA40 @ =gUnk_0201F440
	adds r0, r2, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801EA26
	b _0801EC2C
_0801EA26:
	ldr r1, _0801EA44 @ =gUnk_02020160
	ldr r4, _0801EA48 @ =0x00002F51
	adds r1, r1, r4
	adds r0, r2, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801EA38
	b _0801EC50
_0801EA38:
	bl gEngineEffectBoostATKBoostDEF_08094DAC
	b _0801EB70
	.align 2, 0
_0801EA40: .4byte gUnk_0201F440
_0801EA44: .4byte gUnk_02020160
_0801EA48: .4byte 0x00002F51
_0801EA4C:
	movs r0, #0x89
	lsls r0, r0, #2
	adds r6, r4, r0
	ldrh r0, [r6]
	cmp r0, #0
	beq _0801EA5C
	bl sub_080946F8
_0801EA5C:
	ldr r7, _0801EB1C @ =gPlayerCards
	ldr r1, _0801EB20 @ =0x00001D08
	adds r0, r7, r1
	ldr r0, [r0]
	cmp r0, #0
	bne _0801EA6A
	b _0801EC1A
_0801EA6A:
	ldr r2, _0801EB24 @ =gUnk_02023360
	adds r0, r2, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r5, r0, #0x19
	lsrs r1, r5, #0x1b
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	mov r8, r2
	cmp r1, #0
	bne _0801EA88
	b _0801EC1A
_0801EA88:
	ldr r2, _0801EB28 @ =0x00000222
	adds r0, r4, r2
	ldrb r4, [r0]
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	bne _0801EB80
	ldr r1, _0801EB2C @ =gUnk_02020160
	ldr r0, _0801EB30 @ =0x00002F51
	adds r1, r1, r0
	movs r2, #1
	adds r0, r2, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801EB80
	ldr r1, _0801EB34 @ =gUnk_0201FF30
	adds r0, r2, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801EB80
	ldr r1, _0801EB38 @ =gUnk_0201F440
	adds r0, r2, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801EB80
	ldr r1, _0801EB3C @ =gUnk_0201FEC0
	adds r0, r2, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801EB80
	mov r1, r8
	adds r1, #0x36
	movs r0, #0x40
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0801EB48
	ldr r0, _0801EB40 @ =gUnk_03000040
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0]
	lsls r0, r0, #1
	lsrs r0, r0, #1
	movs r1, #0x3c
	bl __divsi3
	lsrs r1, r5, #0x1b
	lsls r2, r1, #2
	adds r2, r2, r1
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	cmp r0, r1
	blt _0801EB48
	ldrh r0, [r6]
	cmp r0, #0
	bne _0801EB48
	movs r0, #0xc
	ands r0, r4
	cmp r0, #8
	beq _0801EB48
	ldr r2, _0801EB44 @ =0x00001CEC
	adds r0, r7, r2
	ldrh r0, [r0]
	adds r0, #1
	strh r0, [r6]
	bl sub_080946F8
	b _0801EB6C
	.align 2, 0
_0801EB1C: .4byte gPlayerCards
_0801EB20: .4byte 0x00001D08
_0801EB24: .4byte gUnk_02023360
_0801EB28: .4byte 0x00000222
_0801EB2C: .4byte gUnk_02020160
_0801EB30: .4byte 0x00002F51
_0801EB34: .4byte gUnk_0201FF30
_0801EB38: .4byte gUnk_0201F440
_0801EB3C: .4byte gUnk_0201FEC0
_0801EB40: .4byte gUnk_03000040
_0801EB44: .4byte 0x00001CEC
_0801EB48:
	ldr r0, _0801EB74 @ =gUnk_02023130
	ldr r4, _0801EB78 @ =0x00000222
	adds r2, r0, r4
	ldrb r1, [r2]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #4
	bne _0801EB80
	movs r0, #0xd
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r2]
	ldr r0, _0801EB7C @ =gUnk_0201E2A0
	ldr r0, [r0, #4]
	bl gEngineEffectBoostATKBoostDEF_08094750
_0801EB6C:
	bl gEngineEffectSpecialSummon_080CCDF4
_0801EB70:
	movs r0, #0
	b _0801EC86
	.align 2, 0
_0801EB74: .4byte gUnk_02023130
_0801EB78: .4byte 0x00000222
_0801EB7C: .4byte gUnk_0201E2A0
_0801EB80:
	ldr r4, _0801EBB8 @ =gUnk_03000040
	movs r1, #0x84
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #1
	lsrs r0, r0, #1
	movs r1, #0x3c
	bl __divsi3
	mov r1, r8
	adds r1, #0x37
	ldrb r1, [r1]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x1b
	lsls r2, r1, #2
	adds r2, r2, r1
	lsls r1, r2, #4
	subs r1, r1, r2
	lsls r1, r1, #2
	cmp r0, r1
	bgt _0801EBC0
	ldr r2, _0801EBBC @ =0x00000213
	adds r1, r4, r2
	movs r0, #0x80
	ldrb r4, [r1]
	orrs r0, r4
	b _0801EBCA
	.align 2, 0
_0801EBB8: .4byte gUnk_03000040
_0801EBBC: .4byte 0x00000213
_0801EBC0:
	ldr r0, _0801EBFC @ =0x00000213
	adds r1, r4, r0
	movs r0, #0x7f
	ldrb r2, [r1]
	ands r0, r2
_0801EBCA:
	strb r0, [r1]
	ldr r0, _0801EC00 @ =gUnk_0201E2A0
	ldr r0, [r0, #4]
	bl gEngineEffectSpecialSummon_0803BC58
	cmp r0, #0
	beq _0801EC0C
	ldr r4, _0801EC04 @ =gUnk_03000040
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r0, [r0]
	lsls r0, r0, #1
	lsrs r0, r0, #1
	movs r1, #0x3c
	bl __divsi3
	cmp r0, #0xb4
	bgt _0801EC0C
	ldr r2, _0801EC08 @ =0x00000217
	adds r1, r4, r2
	movs r0, #0x80
	ldrb r4, [r1]
	orrs r0, r4
	b _0801EC18
	.align 2, 0
_0801EBFC: .4byte 0x00000213
_0801EC00: .4byte gUnk_0201E2A0
_0801EC04: .4byte gUnk_03000040
_0801EC08: .4byte 0x00000217
_0801EC0C:
	ldr r1, _0801EC34 @ =gUnk_03000040
	ldr r0, _0801EC38 @ =0x00000217
	adds r1, r1, r0
	movs r0, #0x7f
	ldrb r2, [r1]
	ands r0, r2
_0801EC18:
	strb r0, [r1]
_0801EC1A:
	bl gEngineEffectSpecialSummon_080CCDF4
	ldr r1, _0801EC3C @ =gUnk_0201F440
	movs r2, #1
	adds r0, r2, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801EC40
_0801EC2C:
	bl sub_080C8688
	b _0801EB70
	.align 2, 0
_0801EC34: .4byte gUnk_03000040
_0801EC38: .4byte 0x00000217
_0801EC3C: .4byte gUnk_0201F440
_0801EC40:
	ldr r1, _0801EC58 @ =gUnk_02020160
	ldr r4, _0801EC5C @ =0x00002F51
	adds r1, r1, r4
	adds r0, r2, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0801EC60
_0801EC50:
	bl sub_080CC528
	b _0801EB70
	.align 2, 0
_0801EC58: .4byte gUnk_02020160
_0801EC5C: .4byte 0x00002F51
_0801EC60:
	bl gEngineEffectBoostATKBoostDEF_08094DAC
	cmp r0, #0
	bne _0801EC6A
	b _0801EB70
_0801EC6A:
	ldr r2, _0801EC90 @ =gUnk_03000040
	ldr r0, _0801EC94 @ =0x00000213
	adds r3, r2, r0
	movs r1, #0x7f
	adds r0, r1, #0
	ldrb r4, [r3]
	ands r0, r4
	strb r0, [r3]
	ldr r0, _0801EC98 @ =0x00000217
	adds r2, r2, r0
	ldrb r4, [r2]
	ands r1, r4
	strb r1, [r2]
_0801EC84:
	movs r0, #1
_0801EC86:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801EC90: .4byte gUnk_03000040
_0801EC94: .4byte 0x00000213
_0801EC98: .4byte 0x00000217

	thumb_func_start gEngineEffectSpecialSummon_0801EC9C
gEngineEffectSpecialSummon_0801EC9C: @ 0x0801EC9C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	subs r0, #1
	cmp r0, #0x3c
	bls _0801ECB4
	b _0801EF84
_0801ECB4:
	lsls r0, r0, #2
	ldr r1, _0801ECC0 @ =_0801ECC4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801ECC0: .4byte _0801ECC4
_0801ECC4: @ jump table
	.4byte _0801EF60 @ case 0
	.4byte _0801EF60 @ case 1
	.4byte _0801EE48 @ case 2
	.4byte _0801EF60 @ case 3
	.4byte _0801EF60 @ case 4
	.4byte _0801EEE4 @ case 5
	.4byte _0801EF42 @ case 6
	.4byte _0801EF84 @ case 7
	.4byte _0801EE06 @ case 8
	.4byte _0801EDC2 @ case 9
	.4byte _0801EE1E @ case 10
	.4byte _0801EE12 @ case 11
	.4byte _0801EE36 @ case 12
	.4byte _0801EF60 @ case 13
	.4byte _0801EF84 @ case 14
	.4byte _0801EF60 @ case 15
	.4byte _0801EEEC @ case 16
	.4byte _0801EF20 @ case 17
	.4byte _0801EF60 @ case 18
	.4byte _0801EDE6 @ case 19
	.4byte _0801EF60 @ case 20
	.4byte _0801EDE6 @ case 21
	.4byte _0801EF60 @ case 22
	.4byte _0801EDB8 @ case 23
	.4byte _0801EDC6 @ case 24
	.4byte _0801EDDC @ case 25
	.4byte _0801EDD0 @ case 26
	.4byte _0801EDC2 @ case 27
	.4byte _0801EDC2 @ case 28
	.4byte _0801EDC2 @ case 29
	.4byte _0801EDC2 @ case 30
	.4byte _0801EF60 @ case 31
	.4byte _0801EF38 @ case 32
	.4byte _0801EDC2 @ case 33
	.4byte _0801EF60 @ case 34
	.4byte _0801EF4E @ case 35
	.4byte _0801EF60 @ case 36
	.4byte _0801EF84 @ case 37
	.4byte _0801EDC2 @ case 38
	.4byte _0801EDC2 @ case 39
	.4byte _0801EDC2 @ case 40
	.4byte _0801EDC2 @ case 41
	.4byte _0801EDC2 @ case 42
	.4byte _0801EDC2 @ case 43
	.4byte _0801EDC2 @ case 44
	.4byte _0801EF60 @ case 45
	.4byte _0801EF60 @ case 46
	.4byte _0801EF60 @ case 47
	.4byte _0801EE2A @ case 48
	.4byte _0801EE40 @ case 49
	.4byte _0801EF60 @ case 50
	.4byte _0801EF60 @ case 51
	.4byte _0801EDC2 @ case 52
	.4byte _0801EF84 @ case 53
	.4byte _0801EF60 @ case 54
	.4byte _0801EF60 @ case 55
	.4byte _0801EDC2 @ case 56
	.4byte _0801EF60 @ case 57
	.4byte _0801EF60 @ case 58
	.4byte _0801EF60 @ case 59
	.4byte _0801EF60 @ case 60
_0801EDB8:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_080C40E0
_0801EDC2:
	movs r0, #1
	b _0801EF86
_0801EDC6:
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080C4EA0
	b _0801EDC2
_0801EDD0:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl gEngineEffectSpecialSummonDamage_080C412C
	b _0801EDC2
_0801EDDC:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_080C3D00
	b _0801EDC2
_0801EDE6:
	lsls r5, r6, #0x10
	lsrs r5, r5, #0x10
	lsls r4, r7, #0x10
	lsrs r4, r4, #0x10
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_08094678
	adds r2, r0, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl gEngineEffectSpecialSummonDamage_080C39FC
	b _0801EDC2
_0801EE06:
	bl gEngineEffectSpecialSummonPreventAttack_080C8BF0
	adds r0, r6, #0
	bl sub_080C2840
	b _0801EDC2
_0801EE12:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_080C291C
	b _0801EDC2
_0801EE1E:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_080C2880
	b _0801EDC2
_0801EE2A:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_080C7950
	b _0801EDC2
_0801EE36:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_080CA5F8
	b _0801EDC2
_0801EE40:
	adds r0, r7, #0
	bl gEngineEffectSpecialSummonBoostATK_080CBF58
	b _0801EF84
_0801EE48:
	bl sub_08096974
	cmp r0, #1
	bne _0801EE60
	ldr r0, _0801EE5C @ =gUnk_0201E2A0
	ldr r0, [r0, #4]
	movs r1, #0xd
	movs r2, #0
	b _0801EF48
	.align 2, 0
_0801EE5C: .4byte gUnk_0201E2A0
_0801EE60:
	movs r7, #0
	movs r0, #0x80
	lsls r0, r0, #4
	mov r8, r0
	movs r1, #1
	mov sl, r1
	ldr r2, _0801EED4 @ =gUnk_020230F0
	mov sb, r2
_0801EE70:
	ldr r0, _0801EED8 @ =gUnk_0201E2A0
	ldr r5, [r0, #4]
	eors r5, r7
	movs r4, #0
_0801EE78:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl gEngineEffectSpecialSummonSendToGY_08096B3C
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _0801EF6C
	adds r4, #1
	cmp r4, #0xa
	ble _0801EE78
	movs r4, #0
	adds r0, r5, #0
	mov r2, sl
	ands r0, r2
	ldr r1, _0801EEDC @ =0x00000868
	muls r1, r0, r1
	ldr r2, _0801EEE0 @ =gUnk_0201C4EC
	adds r0, r1, r2
	ldr r0, [r0]
	cmp r4, r0
	bhs _0801EEC4
	adds r0, r2, #0
	adds r6, r1, r0
_0801EEAA:
	adds r0, r5, #0
	movs r1, #0xb
	adds r2, r4, #0
	bl gEngineEffectSpecialSummonSendToGY_08096B3C
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	bne _0801EF74
	adds r4, #1
	ldr r0, [r6]
	cmp r4, r0
	blo _0801EEAA
_0801EEC4:
	lsls r0, r5, #2
	add r0, sb
	movs r1, #0
	str r1, [r0]
	adds r7, #1
	cmp r7, #1
	ble _0801EE70
	b _0801EDC2
	.align 2, 0
_0801EED4: .4byte gUnk_020230F0
_0801EED8: .4byte gUnk_0201E2A0
_0801EEDC: .4byte 0x00000868
_0801EEE0: .4byte gUnk_0201C4EC
_0801EEE4:
	adds r0, r6, #0
	bl gEngineEffectBoostATKBoostDEF_080C8F48
	b _0801EDC2
_0801EEEC:
	ldr r2, _0801EF1C @ =gUnk_02023130
	lsls r1, r7, #1
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #5
	adds r1, r1, r0
	adds r0, r2, #0
	adds r0, #0x50
	adds r1, r1, r0
	movs r0, #1
	strh r0, [r1]
	lsls r0, r6, #1
	adds r2, #0x4c
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r0, r6, #0
	bl gEngineEffectSpecialSummon_080C4220
	bl sub_080C678C
	bl gEngineEffectSpecialSummon_080CBF0C
	b _0801EF60
	.align 2, 0
_0801EF1C: .4byte gUnk_02023130
_0801EF20:
	ldr r0, _0801EF34 @ =gUnk_02023130
	lsls r1, r6, #1
	adds r0, #0x4c
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r6, #0
	bl gEngineEffectSpecialSummon_080C4220
	b _0801EDC2
	.align 2, 0
_0801EF34: .4byte gUnk_02023130
_0801EF38:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_080BC794
_0801EF42:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
_0801EF48:
	bl gEngineEffectSpecialSummon_080C6A20
	b _0801EDC2
_0801EF4E:
	bl gEngineEffectSpecialSummon_080CBF0C
	bl gEngineEffectSpecialSummonNegate_080C8D30
	bl gEngineEffectSpecialSummonPreventAttack_080C8BF0
	bl gEngineEffectSpecialSummon_080C8904
	b _0801EDC2
_0801EF60:
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r4, #0
	bl sub_080BC794
	b _0801EDC2
_0801EF6C:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	b _0801EF7A
_0801EF74:
	adds r0, r5, #0
	movs r1, #0xb
	adds r2, r4, #0
_0801EF7A:
	bl gEngineEffectSpecialSummon_080C6A20
	bl gEngineEffectSpecialSummonSendToGY_080C89E8
	b _0801EDC2
_0801EF84:
	movs r0, #0
_0801EF86:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
