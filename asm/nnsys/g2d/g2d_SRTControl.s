	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start NNSi_G2dSrtcSetTrans
NNSi_G2dSrtcSetTrans: @ 0x080EB8A8
	push {r4, lr}
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, [r3]
	cmp r0, #1
	bne _080EB8C8
	movs r0, #8
	ldrh r4, [r3, #0x12]
	orrs r0, r4
	strh r0, [r3, #0x12]
	strh r1, [r3, #0xc]
	strh r2, [r3, #0xe]
	b _080EB8D4
_080EB8C8:
	ldr r0, _080EB8DC @ =gUnk_09E4E91C
	ldr r2, _080EB8E0 @ =gUnk_09E4E938
	movs r1, #0x27
	movs r3, #1
	bl OSi_Panic
_080EB8D4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB8DC: .4byte gUnk_09E4E91C
_080EB8E0: .4byte gUnk_09E4E938

	thumb_func_start NNSi_G2dSrtcSetSRTRotZ
NNSi_G2dSrtcSetSRTRotZ: @ 0x080EB8E4
	push {lr}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r0, [r2]
	cmp r0, #1
	bne _080EB8FE
	movs r0, #4
	ldrh r3, [r2, #0x12]
	orrs r0, r3
	strh r0, [r2, #0x12]
	strh r1, [r2, #0x10]
	b _080EB90A
_080EB8FE:
	ldr r0, _080EB910 @ =gUnk_09E4E91C
	ldr r2, _080EB914 @ =gUnk_09E4E938
	movs r1, #0x45
	movs r3, #1
	bl OSi_Panic
_080EB90A:
	pop {r0}
	bx r0
	.align 2, 0
_080EB910: .4byte gUnk_09E4E91C
_080EB914: .4byte gUnk_09E4E938

	thumb_func_start NNSi_G2dSrtcSetSRTScale
NNSi_G2dSrtcSetSRTScale: @ 0x080EB918
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3]
	cmp r0, #1
	bne _080EB930
	movs r0, #2
	ldrh r4, [r3, #0x12]
	orrs r0, r4
	strh r0, [r3, #0x12]
	str r1, [r3, #4]
	str r2, [r3, #8]
	b _080EB93C
_080EB930:
	ldr r0, _080EB944 @ =gUnk_09E4E91C
	ldr r2, _080EB948 @ =gUnk_09E4E938
	movs r1, #0x62
	movs r3, #1
	bl OSi_Panic
_080EB93C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB944: .4byte gUnk_09E4E91C
_080EB948: .4byte gUnk_09E4E938

	thumb_func_start NNSi_G2dSrtcInitControl
NNSi_G2dSrtcInitControl: @ 0x080EB94C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080EB962
	ldr r0, _080EB970 @ =gUnk_09E4E91C
	ldr r2, _080EB974 @ =gUnk_09E4E93C
	movs r1, #0x77
	movs r3, #1
	bl OSi_Panic
_080EB962:
	str r5, [r4]
	adds r0, r4, #0
	bl NNSi_G2dSrtcSetInitialValue
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EB970: .4byte gUnk_09E4E91C
_080EB974: .4byte gUnk_09E4E93C

	thumb_func_start NNSi_G2dSrtcSetInitialValue
NNSi_G2dSrtcSetInitialValue: @ 0x080EB978
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	cmp r4, #0
	bne _080EB98E
	ldr r0, _080EB9C0 @ =gUnk_09E4E91C
	ldr r2, _080EB9C4 @ =gUnk_09E4E93C
	movs r1, #0x8f
	movs r3, #1
	bl OSi_Panic
_080EB98E:
	ldr r0, [r4]
	cmp r0, #1
	beq _080EB9A0
	ldr r0, _080EB9C0 @ =gUnk_09E4E91C
	ldr r2, _080EB9C8 @ =gUnk_09E4E944
	movs r1, #0x90
	movs r3, #1
	bl OSi_Panic
_080EB9A0:
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	adds r1, r4, #4
	ldr r2, _080EB9CC @ =0x0100000C
	mov r0, sp
	bl CpuSet
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r4, #4]
	str r0, [r4, #8]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB9C0: .4byte gUnk_09E4E91C
_080EB9C4: .4byte gUnk_09E4E93C
_080EB9C8: .4byte gUnk_09E4E944
_080EB9CC: .4byte 0x0100000C

	thumb_func_start NNSi_G2dSrtcBuildMatrixFromSRT_2D
NNSi_G2dSrtcBuildMatrixFromSRT_2D: @ 0x080EB9D0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _080EB9E6
	ldr r0, _080EBA60 @ =gUnk_09E4E91C
	ldr r2, _080EBA64 @ =gUnk_09E4E93C
	movs r1, #0xab
	movs r3, #1
	bl OSi_Panic
_080EB9E6:
	cmp r4, #0
	bne _080EB9F6
	ldr r0, _080EBA60 @ =gUnk_09E4E91C
	ldr r2, _080EBA68 @ =gUnk_09E4E974
	movs r1, #0xac
	movs r3, #1
	bl OSi_Panic
_080EB9F6:
	ldr r0, [r5]
	cmp r0, #1
	beq _080EBA08
	ldr r0, _080EBA60 @ =gUnk_09E4E91C
	ldr r2, _080EBA6C @ =gUnk_09E4E944
	movs r1, #0xad
	movs r3, #1
	bl OSi_Panic
_080EBA08:
	cmp r4, #0
	bne _080EBA18
	ldr r0, _080EBA70 @ =gUnk_09E4E8E4
	ldr r2, _080EBA74 @ =gUnk_09E4E8FC
	movs r1, #0x30
	movs r3, #1
	bl OSi_Panic
_080EBA18:
	adds r0, r4, #0
	bl MTX_Identity22_
	ldr r2, _080EBA78 @ =gUnk_09E399D0
	ldrb r1, [r5, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r7, [r0, r3]
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r0, #0
	ldrsh r6, [r1, r0]
	cmp r4, #0
	bne _080EBA44
	ldr r0, _080EBA70 @ =gUnk_09E4E8E4
	ldr r2, _080EBA74 @ =gUnk_09E4E8FC
	movs r1, #0x77
	movs r3, #1
	bl OSi_Panic
_080EBA44:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl MTX_Rot22_
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	adds r0, r4, #0
	adds r1, r4, #0
	bl MTX_ScaleApply22
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EBA60: .4byte gUnk_09E4E91C
_080EBA64: .4byte gUnk_09E4E93C
_080EBA68: .4byte gUnk_09E4E974
_080EBA6C: .4byte gUnk_09E4E944
_080EBA70: .4byte gUnk_09E4E8E4
_080EBA74: .4byte gUnk_09E4E8FC
_080EBA78: .4byte gUnk_09E399D0

	thumb_func_start NNSi_G2dSrtcBuildMatrixFromSRT_3D
NNSi_G2dSrtcBuildMatrixFromSRT_3D: @ 0x080EBA7C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080EBA92
	ldr r0, _080EBAF8 @ =gUnk_09E4E91C
	ldr r2, _080EBAFC @ =gUnk_09E4E93C
	movs r1, #0xca
	movs r3, #1
	bl OSi_Panic
_080EBA92:
	cmp r5, #0
	bne _080EBAA2
	ldr r0, _080EBAF8 @ =gUnk_09E4E91C
	ldr r2, _080EBB00 @ =gUnk_09E4E974
	movs r1, #0xcb
	movs r3, #1
	bl OSi_Panic
_080EBAA2:
	ldr r0, [r4]
	cmp r0, #1
	beq _080EBAB4
	ldr r0, _080EBAF8 @ =gUnk_09E4E91C
	ldr r2, _080EBB04 @ =gUnk_09E4E944
	movs r1, #0xcc
	movs r3, #1
	bl OSi_Panic
_080EBAB4:
	ldr r2, _080EBB08 @ =gUnk_09E399D0
	ldrb r1, [r4, #0x10]
	lsls r0, r1, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r7, [r0, r3]
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r0, #0
	ldrsh r6, [r1, r0]
	cmp r5, #0
	bne _080EBADA
	ldr r0, _080EBB0C @ =gUnk_09E4E8E4
	ldr r2, _080EBB10 @ =gUnk_09E4E8FC
	movs r1, #0x77
	movs r3, #1
	bl OSi_Panic
_080EBADA:
	adds r0, r5, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl MTX_Rot22_
	ldr r2, [r4, #4]
	ldr r3, [r4, #8]
	adds r0, r5, #0
	adds r1, r5, #0
	bl MTX_ScaleApply22
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EBAF8: .4byte gUnk_09E4E91C
_080EBAFC: .4byte gUnk_09E4E93C
_080EBB00: .4byte gUnk_09E4E974
_080EBB04: .4byte gUnk_09E4E944
_080EBB08: .4byte gUnk_09E399D0
_080EBB0C: .4byte gUnk_09E4E8E4
_080EBB10: .4byte gUnk_09E4E8FC
