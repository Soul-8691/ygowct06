	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start GetUnpackedAnimBankImpl_
GetUnpackedAnimBankImpl_: @ 0x080EAF58
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080EAF6E
	ldr r0, _080EAF90 @ =gUnk_09E4C744
	ldr r2, _080EAF94 @ =gUnk_09E4C760
	movs r1, #0x26
	movs r3, #1
	bl OSi_Panic
_080EAF6E:
	cmp r5, #0
	bne _080EAF7E
	ldr r0, _080EAF90 @ =gUnk_09E4C744
	ldr r2, _080EAF98 @ =gUnk_09E4C76C
	movs r1, #0x27
	movs r3, #1
	bl OSi_Panic
_080EAF7E:
	ldr r1, _080EAF9C @ =0x41424E4B
	adds r0, r4, #0
	bl NNS_G2dFindBinaryBlock
	cmp r0, #0
	bne _080EAFA0
	str r0, [r5]
	movs r0, #0
	b _080EAFAE
	.align 2, 0
_080EAF90: .4byte gUnk_09E4C744
_080EAF94: .4byte gUnk_09E4C760
_080EAF98: .4byte gUnk_09E4C76C
_080EAF9C: .4byte 0x41424E4B
_080EAFA0:
	adds r4, r0, #0
	adds r4, #8
	adds r0, r4, #0
	bl NNS_G2dUnpackNAN
	str r4, [r5]
	movs r0, #1
_080EAFAE:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start CheckAnimSequenceValidity_
CheckAnimSequenceValidity_: @ 0x080EAFB4
	movs r3, #0
	ldrh r1, [r0]
	cmp r3, r1
	bge _080EAFCE
	ldr r2, [r0, #0xc]
_080EAFBE:
	ldrh r0, [r2, #4]
	cmp r0, #0
	beq _080EAFC6
	movs r3, #1
_080EAFC6:
	adds r2, #8
	subs r1, #1
	cmp r1, #0
	bne _080EAFBE
_080EAFCE:
	adds r0, r3, #0
	bx lr
	.align 2, 0

	thumb_func_start NNS_G2dGetUnpackedAnimBank
NNS_G2dGetUnpackedAnimBank: @ 0x080EAFD4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080EAFEA
	ldr r0, _080EB04C @ =gUnk_09E4C744
	ldr r2, _080EB050 @ =gUnk_09E4C760
	movs r1, #0x5c
	movs r3, #1
	bl OSi_Panic
_080EAFEA:
	cmp r5, #0
	bne _080EAFFA
	ldr r0, _080EB04C @ =gUnk_09E4C744
	ldr r2, _080EB054 @ =gUnk_09E4C76C
	movs r1, #0x5d
	movs r3, #1
	bl OSi_Panic
_080EAFFA:
	movs r2, #0
	cmp r4, #0
	beq _080EB00A
	ldr r1, [r4]
	ldr r0, _080EB058 @ =0x4E414E52
	cmp r1, r0
	bne _080EB00A
	movs r2, #1
_080EB00A:
	cmp r2, #0
	bne _080EB01A
	ldr r0, _080EB04C @ =gUnk_09E4C744
	ldr r2, _080EB05C @ =gUnk_09E4C778
	movs r1, #0x63
	movs r3, #1
	bl OSi_Panic
_080EB01A:
	movs r1, #0
	cmp r4, #0
	beq _080EB02C
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r2, [r4, #6]
	cmp r2, r0
	blo _080EB02C
	movs r1, #1
_080EB02C:
	cmp r1, #0
	bne _080EB03C
	ldr r0, _080EB04C @ =gUnk_09E4C744
	ldr r2, _080EB060 @ =gUnk_09E4C7B4
	movs r1, #0x67
	movs r3, #1
	bl OSi_Panic
_080EB03C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetUnpackedAnimBankImpl_
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080EB04C: .4byte gUnk_09E4C744
_080EB050: .4byte gUnk_09E4C760
_080EB054: .4byte gUnk_09E4C76C
_080EB058: .4byte 0x4E414E52
_080EB05C: .4byte gUnk_09E4C778
_080EB060: .4byte gUnk_09E4C7B4

	thumb_func_start NNS_G2dGetUnpackedMCAnimBank
NNS_G2dGetUnpackedMCAnimBank: @ 0x080EB064
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080EB07A
	ldr r0, _080EB0DC @ =gUnk_09E4C744
	ldr r2, _080EB0E0 @ =gUnk_09E4C760
	movs r1, #0x6f
	movs r3, #1
	bl OSi_Panic
_080EB07A:
	cmp r5, #0
	bne _080EB08A
	ldr r0, _080EB0DC @ =gUnk_09E4C744
	ldr r2, _080EB0E4 @ =gUnk_09E4C76C
	movs r1, #0x70
	movs r3, #1
	bl OSi_Panic
_080EB08A:
	movs r2, #0
	cmp r4, #0
	beq _080EB09A
	ldr r1, [r4]
	ldr r0, _080EB0E8 @ =0x4E4D4152
	cmp r1, r0
	bne _080EB09A
	movs r2, #1
_080EB09A:
	cmp r2, #0
	bne _080EB0AA
	ldr r0, _080EB0DC @ =gUnk_09E4C744
	ldr r2, _080EB0EC @ =gUnk_09E4C800
	movs r1, #0x74
	movs r3, #1
	bl OSi_Panic
_080EB0AA:
	movs r1, #0
	cmp r4, #0
	beq _080EB0BC
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r2, [r4, #6]
	cmp r2, r0
	blo _080EB0BC
	movs r1, #1
_080EB0BC:
	cmp r1, #0
	bne _080EB0CC
	ldr r0, _080EB0DC @ =gUnk_09E4C744
	ldr r2, _080EB0F0 @ =gUnk_09E4C7B4
	movs r1, #0x78
	movs r3, #1
	bl OSi_Panic
_080EB0CC:
	adds r0, r4, #0
	adds r1, r5, #0
	bl GetUnpackedAnimBankImpl_
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080EB0DC: .4byte gUnk_09E4C744
_080EB0E0: .4byte gUnk_09E4C760
_080EB0E4: .4byte gUnk_09E4C76C
_080EB0E8: .4byte 0x4E4D4152
_080EB0EC: .4byte gUnk_09E4C800
_080EB0F0: .4byte gUnk_09E4C7B4

	thumb_func_start NNS_G2dUnpackNAN
NNS_G2dUnpackNAN: @ 0x080EB0F4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	cmp r5, #0
	bne _080EB110
	ldr r0, _080EB12C @ =gUnk_09E4C744
	ldr r2, _080EB130 @ =gUnk_09E4C83C
	movs r1, #0x82
	movs r3, #1
	bl OSi_Panic
_080EB110:
	ldr r2, [r5, #4]
	adds r2, r2, r5
	str r2, [r5, #4]
	ldr r1, [r5, #8]
	adds r1, r1, r5
	str r1, [r5, #8]
	ldr r0, [r5, #0xc]
	adds r0, r0, r5
	str r0, [r5, #0xc]
	adds r6, r2, #0
	mov sl, r1
	mov sb, r0
	movs r2, #0
	b _080EB182
	.align 2, 0
_080EB12C: .4byte gUnk_09E4C744
_080EB130: .4byte gUnk_09E4C83C
_080EB134:
	lsls r3, r2, #4
	adds r1, r3, r6
	ldr r0, [r1, #0xc]
	add r0, sl
	str r0, [r1, #0xc]
	movs r4, #0
	adds r7, r3, #0
	adds r2, #1
	mov r8, r2
	ldrh r1, [r1]
	cmp r4, r1
	bhs _080EB166
_080EB14C:
	adds r2, r3, r6
	ldr r0, [r2, #0xc]
	lsls r1, r4, #3
	adds r1, r1, r0
	ldr r0, [r1]
	add r0, sb
	str r0, [r1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldrh r2, [r2]
	cmp r4, r2
	blo _080EB14C
_080EB166:
	adds r0, r6, r7
	bl CheckAnimSequenceValidity_
	cmp r0, #0
	bne _080EB17C
	ldr r0, _080EB1EC @ =gUnk_09E4C744
	movs r1, #0x9a
	ldr r2, _080EB1F0 @ =gUnk_09E4C844
	movs r3, #1
	bl OSi_Panic
_080EB17C:
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r2, r0, #0x10
_080EB182:
	ldrh r0, [r5]
	cmp r2, r0
	blo _080EB134
	ldr r1, [r5, #0x14]
	cmp r1, #0
	beq _080EB1DE
	adds r1, r1, r5
	str r1, [r5, #0x14]
	movs r2, #0
	adds r4, r1, #0
	adds r4, #8
	ldr r0, [r4, #4]
	adds r0, r0, r4
	str r0, [r4, #4]
	ldrh r1, [r1, #8]
	cmp r2, r1
	bhs _080EB1DE
_080EB1A4:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, [r4, #4]
	adds r1, r1, r0
	ldr r0, [r1, #4]
	adds r0, r0, r4
	str r0, [r1, #4]
	ldr r0, [r1, #8]
	adds r0, r0, r4
	str r0, [r1, #8]
	movs r3, #0
	adds r5, r2, #1
	ldrh r2, [r1]
	cmp r3, r2
	bhs _080EB1D6
	adds r2, r0, #0
_080EB1C6:
	ldr r0, [r2]
	adds r0, r0, r4
	str r0, [r2]
	stm r2!, {r0}
	adds r3, #1
	ldrh r0, [r1]
	cmp r3, r0
	blo _080EB1C6
_080EB1D6:
	adds r2, r5, #0
	ldrh r1, [r4]
	cmp r2, r1
	blo _080EB1A4
_080EB1DE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EB1EC: .4byte gUnk_09E4C744
_080EB1F0: .4byte gUnk_09E4C844

	thumb_func_start NNS_G2dGetAnimSequenceByIdx
NNS_G2dGetAnimSequenceByIdx: @ 0x080EB1F4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	cmp r5, #0
	bne _080EB21A
	ldr r0, _080EB224 @ =gUnk_09E4C744
	ldr r4, _080EB228 @ =gUnk_09E4C738
	movs r1, #0xcb
	adds r2, r4, #0
	movs r3, #1
	bl OSi_Panic
	ldr r0, _080EB22C @ =gUnk_09E4C714
	movs r1, #0x15
	adds r2, r4, #0
	movs r3, #1
	bl OSi_Panic
_080EB21A:
	ldrh r0, [r5]
	cmp r0, r6
	bhi _080EB230
	movs r0, #0
	b _080EB236
	.align 2, 0
_080EB224: .4byte gUnk_09E4C744
_080EB228: .4byte gUnk_09E4C738
_080EB22C: .4byte gUnk_09E4C714
_080EB230:
	lsls r1, r6, #4
	ldr r0, [r5, #4]
	adds r0, r0, r1
_080EB236:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
