	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.text

	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r4, r0, #0
	str r2, [sp]
	str r3, [sp, #4]
	ldrb r2, [r3]
	cmp r2, #0xf
	bgt _080152CC
	adds r7, r2, #0
	b _080152D0
_080152CC:
	movs r0, #0x1e
	subs r7, r0, r2
_080152D0:
	movs r0, #0
	str r0, [sp, #8]
	adds r2, #1
	str r2, [sp, #0xc]
	ldr r2, [sp]
	cmp r0, r2
	bge _08015366
	movs r0, #0xf
	subs r0, r0, r7
	mov sl, r0
	str r1, [sp, #0x10]
	mov sb, r4
_080152E8:
	mov r1, sb
	ldrh r0, [r1]
	adds r5, r0, #0
	movs r2, #0x1f
	ands r5, r2
	asrs r4, r0, #5
	ands r4, r2
	asrs r0, r0, #0xa
	ands r0, r2
	mov r2, sl
	muls r2, r0, r2
	adds r1, r0, #0
	adds r1, #0x5d
	asrs r0, r1, #2
	muls r0, r7, r0
	adds r0, r2, r0
	movs r1, #0xf
	bl __divsi3
	movs r1, #0x1f
	mov r8, r1
	mov r2, r8
	ands r0, r2
	lsls r6, r0, #0xa
	mov r1, sl
	muls r1, r4, r1
	adds r0, r4, #0
	adds r0, #0x5d
	asrs r0, r0, #2
	muls r0, r7, r0
	adds r0, r1, r0
	movs r1, #0xf
	bl __divsi3
	mov r1, r8
	ands r0, r1
	lsls r4, r0, #5
	orrs r4, r6
	mov r1, sl
	muls r1, r5, r1
	adds r0, r5, #0
	adds r0, #0x5d
	asrs r0, r0, #2
	muls r0, r7, r0
	adds r0, r1, r0
	movs r1, #0xf
	bl __divsi3
	mov r2, r8
	ands r0, r2
	orrs r4, r0
	ldr r0, [sp, #0x10]
	strh r4, [r0]
	adds r0, #2
	str r0, [sp, #0x10]
	movs r1, #2
	add sb, r1
	ldr r2, [sp, #8]
	adds r2, #1
	str r2, [sp, #8]
	ldr r0, [sp]
	cmp r2, r0
	blt _080152E8
_08015366:
	ldr r2, [sp, #0xc]
	cmp r2, #0x1d
	ble _0801536E
	movs r2, #0
_0801536E:
	ldr r1, [sp, #4]
	strb r2, [r1]
	movs r0, #1
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
