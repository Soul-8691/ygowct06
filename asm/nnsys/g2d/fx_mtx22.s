	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start MTX_Identity22_
MTX_Identity22_: @ 0x080E84D4
	movs r2, #0x80
	lsls r2, r2, #5
	str r2, [r0]
	movs r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bx lr

	thumb_func_start MTX_Transpose22_
MTX_Transpose22_: @ 0x080E84E4
	ldr r2, [r0]
	str r2, [r1]
	ldr r2, [r1, #8]
	str r2, [r1, #4]
	ldr r0, [r0, #0xc]
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0

	thumb_func_start MTX_Scale22_
MTX_Scale22_: @ 0x080E84F4
	str r1, [r0]
	movs r1, #0
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bx lr

	thumb_func_start MTX_Rot22_
MTX_Rot22_: @ 0x080E8500
	str r2, [r0]
	str r1, [r0, #4]
	rsbs r1, r1, #0
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bx lr

	thumb_func_start MTX_ScaleApply22
MTX_ScaleApply22: @ 0x080E850C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	mov r8, r1
	adds r7, r2, #0
	mov sb, r3
	cmp r6, #0
	bne _080E852C
	ldr r0, _080E85B4 @ =gUnk_09E49D2C
	ldr r2, _080E85B8 @ =gUnk_09E49D1C
	movs r1, #0x70
	movs r3, #1
	bl OSi_Panic
_080E852C:
	mov r0, r8
	cmp r0, #0
	bne _080E853E
	ldr r0, _080E85B4 @ =gUnk_09E49D2C
	ldr r2, _080E85BC @ =gUnk_09E49D0C
	movs r1, #0x71
	movs r3, #1
	bl OSi_Panic
_080E853E:
	adds r4, r7, #0
	asrs r5, r7, #0x1f
	ldr r2, [r6]
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r8
	str r0, [r2]
	ldr r2, [r6, #4]
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r8
	str r0, [r2, #4]
	mov r4, sb
	asrs r5, r4, #0x1f
	ldr r2, [r6, #8]
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r8
	str r0, [r2, #8]
	ldr r2, [r6, #0xc]
	asrs r3, r2, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r8
	str r0, [r2, #0xc]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E85B4: .4byte gUnk_09E49D2C
_080E85B8: .4byte gUnk_09E49D1C
_080E85BC: .4byte gUnk_09E49D0C

	thumb_func_start MTX_Inverse22
MTX_Inverse22: @ 0x080E85C0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	mov sb, r1
	cmp r7, #0
	bne _080E85DE
	ldr r0, _080E863C @ =gUnk_09E49D2C
	ldr r2, _080E8640 @ =gUnk_09E49D1C
	movs r1, #0x8e
	movs r3, #1
	bl OSi_Panic
_080E85DE:
	mov r0, sb
	cmp r0, #0
	bne _080E85F0
	ldr r0, _080E863C @ =gUnk_09E49D2C
	ldr r2, _080E8644 @ =gUnk_09E49D0C
	movs r1, #0x8f
	movs r3, #1
	bl OSi_Panic
_080E85F0:
	mov r8, sb
	cmp r7, sb
	bne _080E85F8
	mov r8, sp
_080E85F8:
	ldr r2, [r7]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	ldr r4, [r7, #0xc]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r2, [r7, #4]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	ldr r6, [r7, #8]
	adds r2, r6, #0
	asrs r3, r6, #0x1f
	bl __muldi3
	subs r4, r4, r0
	sbcs r5, r1
	ldr r0, _080E8648 @ =0x00000800
	ldr r1, _080E864C @ =0x00000000
	adds r4, r4, r0
	adcs r5, r1
	lsls r1, r5, #0x14
	lsrs r0, r4, #0xc
	adds r2, r1, #0
	orrs r2, r0
	cmp r2, #0
	bne _080E8650
	movs r0, #1
	rsbs r0, r0, #0
	b _080E86DA
	.align 2, 0
_080E863C: .4byte gUnk_09E49D2C
_080E8640: .4byte gUnk_09E49D1C
_080E8644: .4byte gUnk_09E49D0C
_080E8648: .4byte 0x00000800
_080E864C: .4byte 0x00000000
_080E8650:
	movs r0, #0x80
	lsls r0, r0, #0x11
	adds r1, r2, #0
	bl Div
	adds r4, r0, #0
	asrs r5, r4, #0x1f
	ldr r0, [r7, #0xc]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r8
	str r0, [r2]
	ldr r0, [r7, #4]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	rsbs r0, r0, #0
	mov r1, r8
	str r0, [r1, #4]
	ldr r0, [r7, #8]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	rsbs r0, r0, #0
	mov r2, r8
	str r0, [r2, #8]
	ldr r0, [r7]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	mov r2, r8
	str r0, [r2, #0xc]
	cmp r8, sp
	bne _080E86D8
	ldr r2, _080E86E8 @ =0x04000004
	mov r0, sp
	mov r1, sb
	bl CpuSet
_080E86D8:
	movs r0, #0
_080E86DA:
	add sp, #0x10
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E86E8: .4byte 0x04000004

	thumb_func_start MTX_Concat22
MTX_Concat22: @ 0x080E86EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	mov sl, r0
	mov sb, r1
	str r2, [sp, #0x10]
	cmp r0, #0
	bne _080E870E
	ldr r0, _080E8858 @ =gUnk_09E49D2C
	ldr r2, _080E885C @ =gUnk_09E49D44
	movs r1, #0xcb
	movs r3, #1
	bl OSi_Panic
_080E870E:
	mov r0, sb
	cmp r0, #0
	bne _080E8720
	ldr r0, _080E8858 @ =gUnk_09E49D2C
	ldr r2, _080E8860 @ =gUnk_09E49D50
	movs r1, #0xcc
	movs r3, #1
	bl OSi_Panic
_080E8720:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	bne _080E8732
	ldr r0, _080E8858 @ =gUnk_09E49D2C
	ldr r2, _080E8864 @ =gUnk_09E49D5C
	movs r1, #0xcd
	movs r3, #1
	bl OSi_Panic
_080E8732:
	ldr r2, [sp, #0x10]
	str r2, [sp, #0x14]
	cmp r2, sb
	bne _080E873E
	mov r3, sp
	str r3, [sp, #0x14]
_080E873E:
	mov r4, sl
	ldr r0, [r4]
	ldr r1, [r4, #4]
	mov r8, r1
	adds r6, r0, #0
	asrs r7, r0, #0x1f
	mov r2, sb
	ldr r0, [r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r7, #0
	adds r0, r6, #0
	bl __muldi3
	str r0, [sp, #0x18]
	str r1, [sp, #0x1c]
	mov r4, r8
	asrs r5, r4, #0x1f
	mov r3, sb
	ldr r0, [r3, #8]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp, #0x14]
	str r0, [r3]
	mov r1, sb
	ldr r0, [r1, #4]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r7, #0
	adds r0, r6, #0
	bl __muldi3
	adds r7, r1, #0
	adds r6, r0, #0
	mov r2, sb
	ldr r0, [r2, #0xc]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r0, r0, r6
	adcs r1, r7
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp, #0x14]
	str r0, [r3, #4]
	mov r4, sl
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	mov r8, r1
	adds r6, r0, #0
	asrs r7, r0, #0x1f
	mov r2, sb
	ldr r0, [r2]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r7, #0
	adds r0, r6, #0
	bl __muldi3
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	mov r4, r8
	asrs r5, r4, #0x1f
	mov r3, sb
	ldr r0, [r3, #8]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp, #0x14]
	str r0, [r3, #8]
	mov r1, sb
	ldr r0, [r1, #4]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r7, #0
	adds r0, r6, #0
	bl __muldi3
	adds r7, r1, #0
	adds r6, r0, #0
	mov r2, sb
	ldr r0, [r2, #0xc]
	adds r2, r0, #0
	asrs r3, r0, #0x1f
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldi3
	adds r0, r0, r6
	adcs r1, r7
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	ldr r3, [sp, #0x14]
	str r0, [r3, #0xc]
	cmp r3, sp
	bne _080E8846
	ldr r0, [sp, #0x10]
	mov r1, sp
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldr r1, [r1]
	str r1, [r0]
_080E8846:
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E8858: .4byte gUnk_09E49D2C
_080E885C: .4byte gUnk_09E49D44
_080E8860: .4byte gUnk_09E49D50
_080E8864: .4byte gUnk_09E49D5C

	thumb_func_start mul64
mul64: @ 0x080E8868
	push {lr}
	asrs r3, r2, #0x1f
	bl __muldi3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	pop {r1}
	bx r1
