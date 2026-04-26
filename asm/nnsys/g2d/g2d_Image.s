	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start IsValid1DMappingType_
IsValid1DMappingType_: @ 0x080E99F0
	cmp r0, #1
	bls _080E99FC
	cmp r0, #2
	beq _080E9A06
	movs r0, #0
	b _080E9A16
_080E99FC:
	movs r2, #0
	subs r1, #0x10
	movs r0, #0xc0
	lsls r0, r0, #0xe
	b _080E9A0E
_080E9A06:
	movs r2, #0
	subs r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xe
_080E9A0E:
	cmp r1, r0
	bhi _080E9A14
	movs r2, #1
_080E9A14:
	adds r0, r2, #0
_080E9A16:
	bx lr

	thumb_func_start IsValidDataSize_
IsValidDataSize_: @ 0x080E9A18
	adds r2, r0, #0
	cmp r1, #0
	bne _080E9A22
	movs r0, #1
	b _080E9A90
_080E9A22:
	ldr r1, [r2, #8]
	ldr r0, _080E9A38 @ =0x00100010
	cmp r1, r0
	beq _080E9A68
	cmp r1, r0
	bhi _080E9A3C
	cmp r1, #0
	beq _080E9A54
	cmp r1, #0x10
	beq _080E9A5E
	b _080E9A8E
	.align 2, 0
_080E9A38: .4byte 0x00100010
_080E9A3C:
	ldr r0, _080E9A4C @ =0x00200010
	cmp r1, r0
	beq _080E9A72
	ldr r0, _080E9A50 @ =0x00300010
	cmp r1, r0
	beq _080E9A7C
	b _080E9A8E
	.align 2, 0
_080E9A4C: .4byte 0x00200010
_080E9A50: .4byte 0x00300010
_080E9A54:
	movs r3, #0
	ldr r1, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #8
	b _080E9A84
_080E9A5E:
	movs r3, #0
	ldr r1, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #8
	b _080E9A84
_080E9A68:
	movs r3, #0
	ldr r1, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #9
	b _080E9A84
_080E9A72:
	movs r3, #0
	ldr r1, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #0xa
	b _080E9A84
_080E9A7C:
	movs r3, #0
	ldr r1, [r2, #0x10]
	movs r0, #0x80
	lsls r0, r0, #0xb
_080E9A84:
	cmp r1, r0
	bhi _080E9A8A
	movs r3, #1
_080E9A8A:
	adds r0, r3, #0
	b _080E9A90
_080E9A8E:
	movs r0, #0
_080E9A90:
	bx lr
	.align 2, 0

	thumb_func_start NNS_G2dInitImageProxy
NNS_G2dInitImageProxy: @ 0x080E9A94
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080E9AA8
	ldr r0, _080E9AC0 @ =gUnk_09E4B61C
	ldr r1, _080E9AC4 @ =0x00000175
	ldr r2, _080E9AC8 @ =gUnk_09E4B7CC
	movs r3, #1
	bl OSi_Panic
_080E9AA8:
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	adds r0, #8
_080E9AB0:
	str r1, [r0]
	subs r0, #4
	cmp r0, r4
	bge _080E9AB0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E9AC0: .4byte gUnk_09E4B61C
_080E9AC4: .4byte 0x00000175
_080E9AC8: .4byte gUnk_09E4B7CC

	thumb_func_start NNS_G2dSetImageLocation
NNS_G2dSetImageLocation: @ 0x080E9ACC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r5, #0
	bne _080E9AE6
	ldr r0, _080E9B2C @ =gUnk_09E4B61C
	movs r1, #0xc4
	lsls r1, r1, #1
	ldr r2, _080E9B30 @ =gUnk_09E4B7CC
	movs r3, #1
	bl OSi_Panic
_080E9AE6:
	cmp r4, #2
	bls _080E9AF6
	ldr r0, _080E9B2C @ =gUnk_09E4B61C
	ldr r1, _080E9B34 @ =0x00000189
	ldr r2, _080E9B38 @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080E9AF6:
	cmp r5, #0
	bne _080E9B06
	ldr r0, _080E9B2C @ =gUnk_09E4B61C
	ldr r2, _080E9B3C @ =gUnk_09E4B634
	movs r1, #0x1f
	movs r3, #1
	bl OSi_Panic
_080E9B06:
	cmp r4, #2
	bls _080E9B16
	ldr r0, _080E9B2C @ =gUnk_09E4B61C
	ldr r2, _080E9B38 @ =gUnk_09E4B644
	movs r1, #0x20
	movs r3, #1
	bl OSi_Panic
_080E9B16:
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetVramLocation_
	lsls r0, r4, #2
	adds r0, r5, r0
	str r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9B2C: .4byte gUnk_09E4B61C
_080E9B30: .4byte gUnk_09E4B7CC
_080E9B34: .4byte 0x00000189
_080E9B38: .4byte gUnk_09E4B644
_080E9B3C: .4byte gUnk_09E4B634

	thumb_func_start NNS_G2dGetImageLocation
NNS_G2dGetImageLocation: @ 0x080E9B40
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _080E9B58
	ldr r0, _080E9B94 @ =gUnk_09E4B61C
	movs r1, #0xce
	lsls r1, r1, #1
	ldr r2, _080E9B98 @ =gUnk_09E4B7CC
	movs r3, #1
	bl OSi_Panic
_080E9B58:
	cmp r4, #2
	bls _080E9B68
	ldr r0, _080E9B94 @ =gUnk_09E4B61C
	ldr r1, _080E9B9C @ =0x0000019D
	ldr r2, _080E9BA0 @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080E9B68:
	cmp r5, #0
	bne _080E9B78
	ldr r0, _080E9B94 @ =gUnk_09E4B61C
	ldr r2, _080E9BA4 @ =gUnk_09E4B634
	movs r1, #0x2c
	movs r3, #1
	bl OSi_Panic
_080E9B78:
	cmp r4, #2
	bls _080E9B88
	ldr r0, _080E9B94 @ =gUnk_09E4B61C
	ldr r2, _080E9BA0 @ =gUnk_09E4B644
	movs r1, #0x2d
	movs r3, #1
	bl OSi_Panic
_080E9B88:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080E9B94: .4byte gUnk_09E4B61C
_080E9B98: .4byte gUnk_09E4B7CC
_080E9B9C: .4byte 0x0000019D
_080E9BA0: .4byte gUnk_09E4B644
_080E9BA4: .4byte gUnk_09E4B634

	thumb_func_start NNS_G2dIsImageReadyToUse
NNS_G2dIsImageReadyToUse: @ 0x080E9BA8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _080E9BBE
	ldr r0, _080E9C24 @ =gUnk_09E4B61C
	ldr r1, _080E9C28 @ =0x000001AF
	ldr r2, _080E9C2C @ =gUnk_09E4B7CC
	movs r3, #1
	bl OSi_Panic
_080E9BBE:
	cmp r4, #2
	bls _080E9BD0
	ldr r0, _080E9C24 @ =gUnk_09E4B61C
	movs r1, #0xd8
	lsls r1, r1, #1
	ldr r2, _080E9C30 @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080E9BD0:
	cmp r5, #0
	bne _080E9BE0
	ldr r0, _080E9C24 @ =gUnk_09E4B61C
	ldr r2, _080E9C34 @ =gUnk_09E4B634
	movs r1, #0x35
	movs r3, #1
	bl OSi_Panic
_080E9BE0:
	cmp r4, #2
	bls _080E9BF0
	ldr r0, _080E9C24 @ =gUnk_09E4B61C
	ldr r2, _080E9C30 @ =gUnk_09E4B644
	movs r1, #0x36
	movs r3, #1
	bl OSi_Panic
_080E9BF0:
	cmp r5, #0
	bne _080E9C00
	ldr r0, _080E9C24 @ =gUnk_09E4B61C
	ldr r2, _080E9C34 @ =gUnk_09E4B634
	movs r1, #0x2c
	movs r3, #1
	bl OSi_Panic
_080E9C00:
	cmp r4, #2
	bls _080E9C10
	ldr r0, _080E9C24 @ =gUnk_09E4B61C
	ldr r2, _080E9C30 @ =gUnk_09E4B644
	movs r1, #0x2d
	movs r3, #1
	bl OSi_Panic
_080E9C10:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r1, [r0]
	mvns r1, r1
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080E9C24: .4byte gUnk_09E4B61C
_080E9C28: .4byte 0x000001AF
_080E9C2C: .4byte gUnk_09E4B7CC
_080E9C30: .4byte gUnk_09E4B644
_080E9C34: .4byte gUnk_09E4B634

	thumb_func_start NNS_G2dInitImagePaletteProxy
NNS_G2dInitImagePaletteProxy: @ 0x080E9C38
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080E9C4C
	ldr r0, _080E9C68 @ =gUnk_09E4B61C
	ldr r1, _080E9C6C @ =0x000001C1
	ldr r2, _080E9C70 @ =gUnk_09E4B7CC
	movs r3, #1
	bl OSi_Panic
_080E9C4C:
	movs r2, #1
	rsbs r2, r2, #0
	movs r1, #2
	adds r0, r4, #0
	adds r0, #0x10
_080E9C56:
	str r2, [r0]
	subs r0, #4
	subs r1, #1
	cmp r1, #0
	bge _080E9C56
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E9C68: .4byte gUnk_09E4B61C
_080E9C6C: .4byte 0x000001C1
_080E9C70: .4byte gUnk_09E4B7CC

	thumb_func_start NNS_G2dSetImagePaletteLocation
NNS_G2dSetImagePaletteLocation: @ 0x080E9C74
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	cmp r4, #0
	bne _080E9C8E
	ldr r0, _080E9CD4 @ =gUnk_09E4B61C
	movs r1, #0xea
	lsls r1, r1, #1
	ldr r2, _080E9CD8 @ =gUnk_09E4B7CC
	movs r3, #1
	bl OSi_Panic
_080E9C8E:
	cmp r5, #2
	bls _080E9C9E
	ldr r0, _080E9CD4 @ =gUnk_09E4B61C
	ldr r1, _080E9CDC @ =0x000001D5
	ldr r2, _080E9CE0 @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080E9C9E:
	adds r4, #8
	cmp r4, #0
	bne _080E9CB0
	ldr r0, _080E9CD4 @ =gUnk_09E4B61C
	ldr r2, _080E9CE4 @ =gUnk_09E4B634
	movs r1, #0x1f
	movs r3, #1
	bl OSi_Panic
_080E9CB0:
	cmp r5, #2
	bls _080E9CC0
	ldr r0, _080E9CD4 @ =gUnk_09E4B61C
	ldr r2, _080E9CE0 @ =gUnk_09E4B644
	movs r1, #0x20
	movs r3, #1
	bl OSi_Panic
_080E9CC0:
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetVramLocation_
	lsls r0, r5, #2
	adds r0, r4, r0
	str r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9CD4: .4byte gUnk_09E4B61C
_080E9CD8: .4byte gUnk_09E4B7CC
_080E9CDC: .4byte 0x000001D5
_080E9CE0: .4byte gUnk_09E4B644
_080E9CE4: .4byte gUnk_09E4B634

	thumb_func_start NNS_G2dGetImagePaletteLocation
NNS_G2dGetImagePaletteLocation: @ 0x080E9CE8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _080E9D00
	ldr r0, _080E9D40 @ =gUnk_09E4B61C
	movs r1, #0xf4
	lsls r1, r1, #1
	ldr r2, _080E9D44 @ =gUnk_09E4B7CC
	movs r3, #1
	bl OSi_Panic
_080E9D00:
	cmp r4, #2
	bls _080E9D10
	ldr r0, _080E9D40 @ =gUnk_09E4B61C
	ldr r1, _080E9D48 @ =0x000001E9
	ldr r2, _080E9D4C @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080E9D10:
	adds r5, #8
	cmp r5, #0
	bne _080E9D22
	ldr r0, _080E9D40 @ =gUnk_09E4B61C
	ldr r2, _080E9D50 @ =gUnk_09E4B634
	movs r1, #0x2c
	movs r3, #1
	bl OSi_Panic
_080E9D22:
	cmp r4, #2
	bls _080E9D32
	ldr r0, _080E9D40 @ =gUnk_09E4B61C
	ldr r2, _080E9D4C @ =gUnk_09E4B644
	movs r1, #0x2d
	movs r3, #1
	bl OSi_Panic
_080E9D32:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080E9D40: .4byte gUnk_09E4B61C
_080E9D44: .4byte gUnk_09E4B7CC
_080E9D48: .4byte 0x000001E9
_080E9D4C: .4byte gUnk_09E4B644
_080E9D50: .4byte gUnk_09E4B634

	thumb_func_start NNS_G2dIsImagePaletteReadyToUse
NNS_G2dIsImagePaletteReadyToUse: @ 0x080E9D54
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080E9D6A
	ldr r0, _080E9DD4 @ =gUnk_09E4B61C
	ldr r1, _080E9DD8 @ =0x000001FB
	ldr r2, _080E9DDC @ =gUnk_09E4B7CC
	movs r3, #1
	bl OSi_Panic
_080E9D6A:
	cmp r5, #2
	bls _080E9D7C
	ldr r0, _080E9DD4 @ =gUnk_09E4B61C
	movs r1, #0xfe
	lsls r1, r1, #1
	ldr r2, _080E9DE0 @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080E9D7C:
	adds r4, #8
	cmp r4, #0
	bne _080E9D8E
	ldr r0, _080E9DD4 @ =gUnk_09E4B61C
	ldr r2, _080E9DE4 @ =gUnk_09E4B634
	movs r1, #0x35
	movs r3, #1
	bl OSi_Panic
_080E9D8E:
	cmp r5, #2
	bls _080E9D9E
	ldr r0, _080E9DD4 @ =gUnk_09E4B61C
	ldr r2, _080E9DE0 @ =gUnk_09E4B644
	movs r1, #0x36
	movs r3, #1
	bl OSi_Panic
_080E9D9E:
	cmp r4, #0
	bne _080E9DAE
	ldr r0, _080E9DD4 @ =gUnk_09E4B61C
	ldr r2, _080E9DE4 @ =gUnk_09E4B634
	movs r1, #0x2c
	movs r3, #1
	bl OSi_Panic
_080E9DAE:
	cmp r5, #2
	bls _080E9DBE
	ldr r0, _080E9DD4 @ =gUnk_09E4B61C
	ldr r2, _080E9DE0 @ =gUnk_09E4B644
	movs r1, #0x2d
	movs r3, #1
	bl OSi_Panic
_080E9DBE:
	lsls r0, r5, #2
	adds r0, r4, r0
	ldr r1, [r0]
	mvns r1, r1
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080E9DD4: .4byte gUnk_09E4B61C
_080E9DD8: .4byte 0x000001FB
_080E9DDC: .4byte gUnk_09E4B7CC
_080E9DE0: .4byte gUnk_09E4B644
_080E9DE4: .4byte gUnk_09E4B634

	thumb_func_start NNS_G2dLoadImage1DMapping
NNS_G2dLoadImage1DMapping: @ 0x080E9DE8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bne _080E9E06
	ldr r0, _080E9E84 @ =gUnk_09E4B61C
	ldr r1, _080E9E88 @ =0x00000221
	ldr r2, _080E9E8C @ =gUnk_09E4B790
	movs r3, #1
	bl OSi_Panic
_080E9E06:
	cmp r6, #0
	bne _080E9E16
	ldr r0, _080E9E84 @ =gUnk_09E4B61C
	ldr r1, _080E9E90 @ =0x00000222
	ldr r2, _080E9E94 @ =gUnk_09E4B610
	movs r3, #1
	bl OSi_Panic
_080E9E16:
	ldr r1, [r4, #8]
	adds r0, r7, #0
	bl IsValid1DMappingType_
	cmp r0, #0
	bne _080E9E30
	ldr r0, _080E9E84 @ =gUnk_09E4B61C
	movs r1, #0x89
	lsls r1, r1, #2
	ldr r2, _080E9E98 @ =gUnk_09E4B7D4
	movs r3, #1
	bl OSi_Panic
_080E9E30:
	adds r0, r4, #0
	adds r1, r7, #0
	bl IsValidDataSize_
	cmp r0, #0
	bne _080E9E48
	ldr r0, _080E9E84 @ =gUnk_09E4B61C
	ldr r1, _080E9E9C @ =0x00000226
	ldr r2, _080E9EA0 @ =gUnk_09E4B808
	movs r3, #1
	bl OSi_Panic
_080E9E48:
	ldr r0, [r4, #0xc]
	ldrb r5, [r4, #0xc]
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080E9E62
	ldr r0, _080E9E84 @ =gUnk_09E4B61C
	ldr r2, _080E9EA4 @ =gUnk_09E4B720
	movs r1, #0x88
	movs r3, #1
	bl OSi_Panic
_080E9E62:
	cmp r7, #1
	bne _080E9EAC
	cmp r5, #0
	beq _080E9E76
	ldr r0, _080E9E84 @ =gUnk_09E4B61C
	ldr r2, _080E9EA8 @ =gUnk_09E4B760
	movs r1, #0x9a
	movs r3, #1
	bl OSi_Panic
_080E9E76:
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x10]
	mov r1, r8
	bl GL_LoadObj
	b _080E9EB8
	.align 2, 0
_080E9E84: .4byte gUnk_09E4B61C
_080E9E88: .4byte 0x00000221
_080E9E8C: .4byte gUnk_09E4B790
_080E9E90: .4byte 0x00000222
_080E9E94: .4byte gUnk_09E4B610
_080E9E98: .4byte gUnk_09E4B7D4
_080E9E9C: .4byte 0x00000226
_080E9EA0: .4byte gUnk_09E4B808
_080E9EA4: .4byte gUnk_09E4B720
_080E9EA8: .4byte gUnk_09E4B760
_080E9EAC:
	ldr r0, _080E9EF8 @ =gUnk_09E4B61C
	ldr r2, _080E9EFC @ =gUnk_09E4B788
	movs r1, #0xa5
	movs r3, #1
	bl OSi_Panic
_080E9EB8:
	adds r5, r6, #0
	adds r5, #0xc
	cmp r4, #0
	bne _080E9ECC
	ldr r0, _080E9EF8 @ =gUnk_09E4B61C
	ldr r2, _080E9F00 @ =gUnk_09E4B6B8
	movs r1, #0x5d
	movs r3, #1
	bl OSi_Panic
_080E9ECC:
	cmp r5, #0
	bne _080E9EDC
	ldr r0, _080E9EF8 @ =gUnk_09E4B61C
	ldr r2, _080E9F04 @ =gUnk_09E4B6C0
	movs r1, #0x5e
	movs r3, #1
	bl OSi_Panic
_080E9EDC:
	ldr r2, [r4, #8]
	cmp r2, #0
	beq _080E9EE4
	b _080EA056
_080E9EE4:
	ldrh r0, [r4, #2]
	subs r0, #1
	cmp r0, #0x1f
	bhi _080E9FA0
	lsls r0, r0, #2
	ldr r1, _080E9F08 @ =_080E9F0C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E9EF8: .4byte gUnk_09E4B61C
_080E9EFC: .4byte gUnk_09E4B788
_080E9F00: .4byte gUnk_09E4B6B8
_080E9F04: .4byte gUnk_09E4B6C0
_080E9F08: .4byte _080E9F0C
_080E9F0C: @ jump table
	.4byte _080E9FA0 @ case 0
	.4byte _080E9F8C @ case 1
	.4byte _080E9FA0 @ case 2
	.4byte _080E9F90 @ case 3
	.4byte _080E9FA0 @ case 4
	.4byte _080E9FA0 @ case 5
	.4byte _080E9FA0 @ case 6
	.4byte _080E9F94 @ case 7
	.4byte _080E9FA0 @ case 8
	.4byte _080E9FA0 @ case 9
	.4byte _080E9FA0 @ case 10
	.4byte _080E9FA0 @ case 11
	.4byte _080E9FA0 @ case 12
	.4byte _080E9FA0 @ case 13
	.4byte _080E9FA0 @ case 14
	.4byte _080E9F98 @ case 15
	.4byte _080E9FA0 @ case 16
	.4byte _080E9FA0 @ case 17
	.4byte _080E9FA0 @ case 18
	.4byte _080E9FA0 @ case 19
	.4byte _080E9FA0 @ case 20
	.4byte _080E9FA0 @ case 21
	.4byte _080E9FA0 @ case 22
	.4byte _080E9FA0 @ case 23
	.4byte _080E9FA0 @ case 24
	.4byte _080E9FA0 @ case 25
	.4byte _080E9FA0 @ case 26
	.4byte _080E9FA0 @ case 27
	.4byte _080E9FA0 @ case 28
	.4byte _080E9FA0 @ case 29
	.4byte _080E9FA0 @ case 30
	.4byte _080E9F9C @ case 31
_080E9F8C:
	movs r0, #1
	b _080E9FA2
_080E9F90:
	movs r0, #2
	b _080E9FA2
_080E9F94:
	movs r0, #3
	b _080E9FA2
_080E9F98:
	movs r0, #4
	b _080E9FA2
_080E9F9C:
	movs r0, #5
	b _080E9FA2
_080E9FA0:
	movs r0, #0
_080E9FA2:
	str r0, [r5]
	ldrh r0, [r4]
	subs r0, #1
	cmp r0, #0x1f
	bhi _080EA050
	lsls r0, r0, #2
	ldr r1, _080E9FB8 @ =_080E9FBC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080E9FB8: .4byte _080E9FBC
_080E9FBC: @ jump table
	.4byte _080EA050 @ case 0
	.4byte _080EA03C @ case 1
	.4byte _080EA050 @ case 2
	.4byte _080EA040 @ case 3
	.4byte _080EA050 @ case 4
	.4byte _080EA050 @ case 5
	.4byte _080EA050 @ case 6
	.4byte _080EA044 @ case 7
	.4byte _080EA050 @ case 8
	.4byte _080EA050 @ case 9
	.4byte _080EA050 @ case 10
	.4byte _080EA050 @ case 11
	.4byte _080EA050 @ case 12
	.4byte _080EA050 @ case 13
	.4byte _080EA050 @ case 14
	.4byte _080EA048 @ case 15
	.4byte _080EA050 @ case 16
	.4byte _080EA050 @ case 17
	.4byte _080EA050 @ case 18
	.4byte _080EA050 @ case 19
	.4byte _080EA050 @ case 20
	.4byte _080EA050 @ case 21
	.4byte _080EA050 @ case 22
	.4byte _080EA050 @ case 23
	.4byte _080EA050 @ case 24
	.4byte _080EA050 @ case 25
	.4byte _080EA050 @ case 26
	.4byte _080EA050 @ case 27
	.4byte _080EA050 @ case 28
	.4byte _080EA050 @ case 29
	.4byte _080EA050 @ case 30
	.4byte _080EA04C @ case 31
_080EA03C:
	movs r0, #1
	b _080EA052
_080EA040:
	movs r0, #2
	b _080EA052
_080EA044:
	movs r0, #3
	b _080EA052
_080EA048:
	movs r0, #4
	b _080EA052
_080EA04C:
	movs r0, #5
	b _080EA052
_080EA050:
	movs r0, #0
_080EA052:
	str r0, [r5, #4]
	b _080EA076
_080EA056:
	ldr r1, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080EA06C
	ldr r0, _080EA098 @ =gUnk_09E4B61C
	ldr r2, _080EA09C @ =gUnk_09E4B6C8
	movs r1, #0x6d
	movs r3, #1
	bl OSi_Panic
_080EA06C:
	ldrh r0, [r4, #2]
	str r0, [r6, #0xc]
	ldrh r0, [r4]
	str r0, [r5, #4]
	ldr r2, [r4, #8]
_080EA076:
	ldr r0, [r4, #4]
	str r0, [r5, #8]
	movs r0, #0
	str r0, [r5, #0xc]
	movs r0, #1
	str r0, [r5, #0x10]
	str r2, [r5, #0x14]
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	bl NNS_G2dSetImageLocation
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA098: .4byte gUnk_09E4B61C
_080EA09C: .4byte gUnk_09E4B6C8

	thumb_func_start NNS_G2dLoadImage2DMapping
NNS_G2dLoadImage2DMapping: @ 0x080EA0A0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bne _080EA0BE
	ldr r0, _080EA134 @ =gUnk_09E4B61C
	ldr r1, _080EA138 @ =0x0000024D
	ldr r2, _080EA13C @ =gUnk_09E4B790
	movs r3, #1
	bl OSi_Panic
_080EA0BE:
	cmp r6, #0
	bne _080EA0CE
	ldr r0, _080EA134 @ =gUnk_09E4B61C
	ldr r1, _080EA140 @ =0x0000024E
	ldr r2, _080EA144 @ =gUnk_09E4B610
	movs r3, #1
	bl OSi_Panic
_080EA0CE:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _080EA0E0
	ldr r0, _080EA134 @ =gUnk_09E4B61C
	ldr r1, _080EA148 @ =0x0000024F
	ldr r2, _080EA14C @ =gUnk_09E4B82C
	movs r3, #1
	bl OSi_Panic
_080EA0E0:
	adds r0, r4, #0
	adds r1, r7, #0
	bl IsValidDataSize_
	cmp r0, #0
	bne _080EA0F8
	ldr r0, _080EA134 @ =gUnk_09E4B61C
	ldr r1, _080EA150 @ =0x00000251
	ldr r2, _080EA154 @ =gUnk_09E4B808
	movs r3, #1
	bl OSi_Panic
_080EA0F8:
	ldr r0, [r4, #0xc]
	ldrb r5, [r4, #0xc]
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080EA112
	ldr r0, _080EA134 @ =gUnk_09E4B61C
	ldr r2, _080EA158 @ =gUnk_09E4B720
	movs r1, #0x88
	movs r3, #1
	bl OSi_Panic
_080EA112:
	cmp r7, #1
	bne _080EA160
	cmp r5, #0
	beq _080EA126
	ldr r0, _080EA134 @ =gUnk_09E4B61C
	ldr r2, _080EA15C @ =gUnk_09E4B760
	movs r1, #0x9a
	movs r3, #1
	bl OSi_Panic
_080EA126:
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x10]
	mov r1, r8
	bl GL_LoadObj
	b _080EA16C
	.align 2, 0
_080EA134: .4byte gUnk_09E4B61C
_080EA138: .4byte 0x0000024D
_080EA13C: .4byte gUnk_09E4B790
_080EA140: .4byte 0x0000024E
_080EA144: .4byte gUnk_09E4B610
_080EA148: .4byte 0x0000024F
_080EA14C: .4byte gUnk_09E4B82C
_080EA150: .4byte 0x00000251
_080EA154: .4byte gUnk_09E4B808
_080EA158: .4byte gUnk_09E4B720
_080EA15C: .4byte gUnk_09E4B760
_080EA160:
	ldr r0, _080EA1AC @ =gUnk_09E4B61C
	ldr r2, _080EA1B0 @ =gUnk_09E4B788
	movs r1, #0xa5
	movs r3, #1
	bl OSi_Panic
_080EA16C:
	adds r5, r6, #0
	adds r5, #0xc
	cmp r4, #0
	bne _080EA180
	ldr r0, _080EA1AC @ =gUnk_09E4B61C
	ldr r2, _080EA1B4 @ =gUnk_09E4B6B8
	movs r1, #0x5d
	movs r3, #1
	bl OSi_Panic
_080EA180:
	cmp r5, #0
	bne _080EA190
	ldr r0, _080EA1AC @ =gUnk_09E4B61C
	ldr r2, _080EA1B8 @ =gUnk_09E4B6C0
	movs r1, #0x5e
	movs r3, #1
	bl OSi_Panic
_080EA190:
	ldr r2, [r4, #8]
	cmp r2, #0
	beq _080EA198
	b _080EA30A
_080EA198:
	ldrh r0, [r4, #2]
	subs r0, #1
	cmp r0, #0x1f
	bhi _080EA254
	lsls r0, r0, #2
	ldr r1, _080EA1BC @ =_080EA1C0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EA1AC: .4byte gUnk_09E4B61C
_080EA1B0: .4byte gUnk_09E4B788
_080EA1B4: .4byte gUnk_09E4B6B8
_080EA1B8: .4byte gUnk_09E4B6C0
_080EA1BC: .4byte _080EA1C0
_080EA1C0: @ jump table
	.4byte _080EA254 @ case 0
	.4byte _080EA240 @ case 1
	.4byte _080EA254 @ case 2
	.4byte _080EA244 @ case 3
	.4byte _080EA254 @ case 4
	.4byte _080EA254 @ case 5
	.4byte _080EA254 @ case 6
	.4byte _080EA248 @ case 7
	.4byte _080EA254 @ case 8
	.4byte _080EA254 @ case 9
	.4byte _080EA254 @ case 10
	.4byte _080EA254 @ case 11
	.4byte _080EA254 @ case 12
	.4byte _080EA254 @ case 13
	.4byte _080EA254 @ case 14
	.4byte _080EA24C @ case 15
	.4byte _080EA254 @ case 16
	.4byte _080EA254 @ case 17
	.4byte _080EA254 @ case 18
	.4byte _080EA254 @ case 19
	.4byte _080EA254 @ case 20
	.4byte _080EA254 @ case 21
	.4byte _080EA254 @ case 22
	.4byte _080EA254 @ case 23
	.4byte _080EA254 @ case 24
	.4byte _080EA254 @ case 25
	.4byte _080EA254 @ case 26
	.4byte _080EA254 @ case 27
	.4byte _080EA254 @ case 28
	.4byte _080EA254 @ case 29
	.4byte _080EA254 @ case 30
	.4byte _080EA250 @ case 31
_080EA240:
	movs r0, #1
	b _080EA256
_080EA244:
	movs r0, #2
	b _080EA256
_080EA248:
	movs r0, #3
	b _080EA256
_080EA24C:
	movs r0, #4
	b _080EA256
_080EA250:
	movs r0, #5
	b _080EA256
_080EA254:
	movs r0, #0
_080EA256:
	str r0, [r5]
	ldrh r0, [r4]
	subs r0, #1
	cmp r0, #0x1f
	bhi _080EA304
	lsls r0, r0, #2
	ldr r1, _080EA26C @ =_080EA270
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EA26C: .4byte _080EA270
_080EA270: @ jump table
	.4byte _080EA304 @ case 0
	.4byte _080EA2F0 @ case 1
	.4byte _080EA304 @ case 2
	.4byte _080EA2F4 @ case 3
	.4byte _080EA304 @ case 4
	.4byte _080EA304 @ case 5
	.4byte _080EA304 @ case 6
	.4byte _080EA2F8 @ case 7
	.4byte _080EA304 @ case 8
	.4byte _080EA304 @ case 9
	.4byte _080EA304 @ case 10
	.4byte _080EA304 @ case 11
	.4byte _080EA304 @ case 12
	.4byte _080EA304 @ case 13
	.4byte _080EA304 @ case 14
	.4byte _080EA2FC @ case 15
	.4byte _080EA304 @ case 16
	.4byte _080EA304 @ case 17
	.4byte _080EA304 @ case 18
	.4byte _080EA304 @ case 19
	.4byte _080EA304 @ case 20
	.4byte _080EA304 @ case 21
	.4byte _080EA304 @ case 22
	.4byte _080EA304 @ case 23
	.4byte _080EA304 @ case 24
	.4byte _080EA304 @ case 25
	.4byte _080EA304 @ case 26
	.4byte _080EA304 @ case 27
	.4byte _080EA304 @ case 28
	.4byte _080EA304 @ case 29
	.4byte _080EA304 @ case 30
	.4byte _080EA300 @ case 31
_080EA2F0:
	movs r0, #1
	b _080EA306
_080EA2F4:
	movs r0, #2
	b _080EA306
_080EA2F8:
	movs r0, #3
	b _080EA306
_080EA2FC:
	movs r0, #4
	b _080EA306
_080EA300:
	movs r0, #5
	b _080EA306
_080EA304:
	movs r0, #0
_080EA306:
	str r0, [r5, #4]
	b _080EA32A
_080EA30A:
	ldr r1, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080EA320
	ldr r0, _080EA34C @ =gUnk_09E4B61C
	ldr r2, _080EA350 @ =gUnk_09E4B6C8
	movs r1, #0x6d
	movs r3, #1
	bl OSi_Panic
_080EA320:
	ldrh r0, [r4, #2]
	str r0, [r6, #0xc]
	ldrh r0, [r4]
	str r0, [r5, #4]
	ldr r2, [r4, #8]
_080EA32A:
	ldr r0, [r4, #4]
	str r0, [r5, #8]
	movs r0, #0
	str r0, [r5, #0xc]
	movs r0, #1
	str r0, [r5, #0x10]
	str r2, [r5, #0x14]
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	bl NNS_G2dSetImageLocation
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA34C: .4byte gUnk_09E4B61C
_080EA350: .4byte gUnk_09E4B6C8

	thumb_func_start NNS_G2dLoadImageVramTransfer
NNS_G2dLoadImageVramTransfer: @ 0x080EA354
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	adds r6, r3, #0
	ldr r0, [r4, #0xc]
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080EA37C
	ldr r0, _080EA3BC @ =gUnk_09E4B61C
	movs r1, #0x9f
	lsls r1, r1, #2
	ldr r2, _080EA3C0 @ =gUnk_09E4B85C
	movs r3, #1
	bl OSi_Panic
_080EA37C:
	adds r5, r6, #0
	adds r5, #0xc
	cmp r4, #0
	bne _080EA390
	ldr r0, _080EA3BC @ =gUnk_09E4B61C
	ldr r2, _080EA3C4 @ =gUnk_09E4B6B8
	movs r1, #0x5d
	movs r3, #1
	bl OSi_Panic
_080EA390:
	cmp r5, #0
	bne _080EA3A0
	ldr r0, _080EA3BC @ =gUnk_09E4B61C
	ldr r2, _080EA3C8 @ =gUnk_09E4B6C0
	movs r1, #0x5e
	movs r3, #1
	bl OSi_Panic
_080EA3A0:
	ldr r2, [r4, #8]
	cmp r2, #0
	beq _080EA3A8
	b _080EA51A
_080EA3A8:
	ldrh r0, [r4, #2]
	subs r0, #1
	cmp r0, #0x1f
	bhi _080EA464
	lsls r0, r0, #2
	ldr r1, _080EA3CC @ =_080EA3D0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EA3BC: .4byte gUnk_09E4B61C
_080EA3C0: .4byte gUnk_09E4B85C
_080EA3C4: .4byte gUnk_09E4B6B8
_080EA3C8: .4byte gUnk_09E4B6C0
_080EA3CC: .4byte _080EA3D0
_080EA3D0: @ jump table
	.4byte _080EA464 @ case 0
	.4byte _080EA450 @ case 1
	.4byte _080EA464 @ case 2
	.4byte _080EA454 @ case 3
	.4byte _080EA464 @ case 4
	.4byte _080EA464 @ case 5
	.4byte _080EA464 @ case 6
	.4byte _080EA458 @ case 7
	.4byte _080EA464 @ case 8
	.4byte _080EA464 @ case 9
	.4byte _080EA464 @ case 10
	.4byte _080EA464 @ case 11
	.4byte _080EA464 @ case 12
	.4byte _080EA464 @ case 13
	.4byte _080EA464 @ case 14
	.4byte _080EA45C @ case 15
	.4byte _080EA464 @ case 16
	.4byte _080EA464 @ case 17
	.4byte _080EA464 @ case 18
	.4byte _080EA464 @ case 19
	.4byte _080EA464 @ case 20
	.4byte _080EA464 @ case 21
	.4byte _080EA464 @ case 22
	.4byte _080EA464 @ case 23
	.4byte _080EA464 @ case 24
	.4byte _080EA464 @ case 25
	.4byte _080EA464 @ case 26
	.4byte _080EA464 @ case 27
	.4byte _080EA464 @ case 28
	.4byte _080EA464 @ case 29
	.4byte _080EA464 @ case 30
	.4byte _080EA460 @ case 31
_080EA450:
	movs r0, #1
	b _080EA466
_080EA454:
	movs r0, #2
	b _080EA466
_080EA458:
	movs r0, #3
	b _080EA466
_080EA45C:
	movs r0, #4
	b _080EA466
_080EA460:
	movs r0, #5
	b _080EA466
_080EA464:
	movs r0, #0
_080EA466:
	str r0, [r5]
	ldrh r0, [r4]
	subs r0, #1
	cmp r0, #0x1f
	bhi _080EA514
	lsls r0, r0, #2
	ldr r1, _080EA47C @ =_080EA480
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EA47C: .4byte _080EA480
_080EA480: @ jump table
	.4byte _080EA514 @ case 0
	.4byte _080EA500 @ case 1
	.4byte _080EA514 @ case 2
	.4byte _080EA504 @ case 3
	.4byte _080EA514 @ case 4
	.4byte _080EA514 @ case 5
	.4byte _080EA514 @ case 6
	.4byte _080EA508 @ case 7
	.4byte _080EA514 @ case 8
	.4byte _080EA514 @ case 9
	.4byte _080EA514 @ case 10
	.4byte _080EA514 @ case 11
	.4byte _080EA514 @ case 12
	.4byte _080EA514 @ case 13
	.4byte _080EA514 @ case 14
	.4byte _080EA50C @ case 15
	.4byte _080EA514 @ case 16
	.4byte _080EA514 @ case 17
	.4byte _080EA514 @ case 18
	.4byte _080EA514 @ case 19
	.4byte _080EA514 @ case 20
	.4byte _080EA514 @ case 21
	.4byte _080EA514 @ case 22
	.4byte _080EA514 @ case 23
	.4byte _080EA514 @ case 24
	.4byte _080EA514 @ case 25
	.4byte _080EA514 @ case 26
	.4byte _080EA514 @ case 27
	.4byte _080EA514 @ case 28
	.4byte _080EA514 @ case 29
	.4byte _080EA514 @ case 30
	.4byte _080EA510 @ case 31
_080EA500:
	movs r0, #1
	b _080EA516
_080EA504:
	movs r0, #2
	b _080EA516
_080EA508:
	movs r0, #3
	b _080EA516
_080EA50C:
	movs r0, #4
	b _080EA516
_080EA510:
	movs r0, #5
	b _080EA516
_080EA514:
	movs r0, #0
_080EA516:
	str r0, [r5, #4]
	b _080EA53A
_080EA51A:
	ldr r1, [r4]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080EA530
	ldr r0, _080EA55C @ =gUnk_09E4B61C
	ldr r2, _080EA560 @ =gUnk_09E4B6C8
	movs r1, #0x6d
	movs r3, #1
	bl OSi_Panic
_080EA530:
	ldrh r0, [r4, #2]
	str r0, [r6, #0xc]
	ldrh r0, [r4]
	str r0, [r5, #4]
	ldr r2, [r4, #8]
_080EA53A:
	ldr r0, [r4, #4]
	str r0, [r5, #8]
	movs r0, #0
	str r0, [r5, #0xc]
	movs r0, #1
	str r0, [r5, #0x10]
	str r2, [r5, #0x14]
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	bl NNS_G2dSetImageLocation
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA55C: .4byte gUnk_09E4B61C
_080EA560: .4byte gUnk_09E4B6C8

	thumb_func_start NNS_G2dLoadPalette
NNS_G2dLoadPalette: @ 0x080EA564
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	mov r8, r1
	adds r7, r2, #0
	adds r5, r3, #0
	cmp r4, #0
	bne _080EA582
	ldr r0, _080EA5CC @ =gUnk_09E4B61C
	ldr r1, _080EA5D0 @ =0x0000029F
	ldr r2, _080EA5D4 @ =gUnk_09E4B790
	movs r3, #1
	bl OSi_Panic
_080EA582:
	cmp r7, #2
	bls _080EA594
	ldr r0, _080EA5CC @ =gUnk_09E4B61C
	movs r1, #0xa8
	lsls r1, r1, #2
	ldr r2, _080EA5D8 @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080EA594:
	cmp r5, #0
	bne _080EA5A4
	ldr r0, _080EA5CC @ =gUnk_09E4B61C
	ldr r1, _080EA5DC @ =0x000002A1
	ldr r2, _080EA5E0 @ =gUnk_09E4B898
	movs r3, #1
	bl OSi_Panic
_080EA5A4:
	ldr r6, [r4, #8]
	cmp r4, #0
	bne _080EA5B8
	ldr r0, _080EA5CC @ =gUnk_09E4B61C
	ldr r2, _080EA5D4 @ =gUnk_09E4B790
	movs r1, #0x8e
	lsls r1, r1, #1
	movs r3, #1
	bl OSi_Panic
_080EA5B8:
	ldr r0, [r4, #0xc]
	cmp r7, #1
	bne _080EA5E8
	ldr r1, _080EA5E4 @ =0x05000200
	add r1, r8
	lsls r2, r6, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	b _080EA5F6
	.align 2, 0
_080EA5CC: .4byte gUnk_09E4B61C
_080EA5D0: .4byte 0x0000029F
_080EA5D4: .4byte gUnk_09E4B790
_080EA5D8: .4byte gUnk_09E4B644
_080EA5DC: .4byte 0x000002A1
_080EA5E0: .4byte gUnk_09E4B898
_080EA5E4: .4byte 0x05000200
_080EA5E8:
	ldr r0, _080EA614 @ =gUnk_09E4B61C
	ldr r2, _080EA618 @ =gUnk_09E4B788
	movs r1, #0x94
	lsls r1, r1, #1
	movs r3, #1
	bl OSi_Panic
_080EA5F6:
	ldr r0, [r4]
	str r0, [r5]
	ldr r0, [r4, #4]
	str r0, [r5, #4]
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl NNS_G2dSetImagePaletteLocation
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA614: .4byte gUnk_09E4B61C
_080EA618: .4byte gUnk_09E4B788

	thumb_func_start NNS_G2dLoadPaletteEx
NNS_G2dLoadPaletteEx: @ 0x080EA61C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	str r2, [sp]
	mov sb, r3
	cmp r6, #0
	bne _080EA640
	ldr r0, _080EA6C8 @ =gUnk_09E4B61C
	ldr r1, _080EA6CC @ =0x000002C7
	ldr r2, _080EA6D0 @ =gUnk_09E4B790
	movs r3, #1
	bl OSi_Panic
_080EA640:
	cmp r7, #0
	bne _080EA652
	ldr r0, _080EA6C8 @ =gUnk_09E4B61C
	movs r1, #0xb2
	lsls r1, r1, #2
	ldr r2, _080EA6D4 @ =gUnk_09E4B7C0
	movs r3, #1
	bl OSi_Panic
_080EA652:
	mov r0, sb
	cmp r0, #2
	bls _080EA664
	ldr r0, _080EA6C8 @ =gUnk_09E4B61C
	ldr r1, _080EA6D8 @ =0x000002C9
	ldr r2, _080EA6DC @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080EA664:
	ldr r1, [sp, #0x24]
	cmp r1, #0
	bne _080EA676
	ldr r0, _080EA6C8 @ =gUnk_09E4B61C
	ldr r1, _080EA6E0 @ =0x000002CA
	ldr r2, _080EA6E4 @ =gUnk_09E4B898
	movs r3, #1
	bl OSi_Panic
_080EA676:
	cmp r6, #0
	bne _080EA686
	ldr r0, _080EA6C8 @ =gUnk_09E4B61C
	ldr r2, _080EA6D0 @ =gUnk_09E4B790
	ldr r1, _080EA6E8 @ =0x0000014F
	movs r3, #1
	bl OSi_Panic
_080EA686:
	cmp r7, #0
	bne _080EA698
	ldr r0, _080EA6C8 @ =gUnk_09E4B61C
	ldr r2, _080EA6D4 @ =gUnk_09E4B7C0
	movs r1, #0xa8
	lsls r1, r1, #1
	movs r3, #1
	bl OSi_Panic
_080EA698:
	mov r2, sb
	cmp r2, #2
	bls _080EA6AA
	ldr r0, _080EA6C8 @ =gUnk_09E4B61C
	ldr r2, _080EA6DC @ =gUnk_09E4B644
	ldr r1, _080EA6EC @ =0x00000151
	movs r3, #1
	bl OSi_Panic
_080EA6AA:
	cmp r6, #0
	bne _080EA6BA
	ldr r0, _080EA6C8 @ =gUnk_09E4B61C
	ldr r2, _080EA6D0 @ =gUnk_09E4B790
	ldr r1, _080EA6F0 @ =0x00000131
	movs r3, #1
	bl OSi_Panic
_080EA6BA:
	ldr r0, [r6]
	cmp r0, #3
	bne _080EA6F4
	movs r3, #0x20
	mov r8, r3
	b _080EA70C
	.align 2, 0
_080EA6C8: .4byte gUnk_09E4B61C
_080EA6CC: .4byte 0x000002C7
_080EA6D0: .4byte gUnk_09E4B790
_080EA6D4: .4byte gUnk_09E4B7C0
_080EA6D8: .4byte 0x000002C9
_080EA6DC: .4byte gUnk_09E4B644
_080EA6E0: .4byte 0x000002CA
_080EA6E4: .4byte gUnk_09E4B898
_080EA6E8: .4byte 0x0000014F
_080EA6EC: .4byte 0x00000151
_080EA6F0: .4byte 0x00000131
_080EA6F4:
	cmp r0, #4
	beq _080EA706
	ldr r0, _080EA75C @ =gUnk_09E4B61C
	ldr r2, _080EA760 @ =gUnk_09E4B79C
	movs r1, #0x9c
	lsls r1, r1, #1
	movs r3, #1
	bl OSi_Panic
_080EA706:
	movs r0, #0x80
	lsls r0, r0, #2
	mov r8, r0
_080EA70C:
	ldrh r5, [r7]
	movs r4, #0
	cmp r4, r5
	bhs _080EA788
	mov r1, r8
	lsrs r1, r1, #2
	mov sl, r1
_080EA71A:
	cmp r7, #0
	bne _080EA72C
	ldr r0, _080EA75C @ =gUnk_09E4B61C
	movs r1, #0xa0
	lsls r1, r1, #1
	ldr r2, _080EA764 @ =gUnk_09E4B7C0
	movs r3, #1
	bl OSi_Panic
_080EA72C:
	ldr r1, [r7, #4]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	mov r2, r8
	muls r2, r3, r2
	adds r0, r2, #0
	mov r1, r8
	muls r1, r4, r1
	ldr r3, [sp]
	adds r2, r3, r0
	ldr r0, [r6, #0xc]
	adds r0, r0, r1
	mov r1, sb
	cmp r1, #1
	bne _080EA770
	ldr r3, _080EA768 @ =0x05000200
	adds r1, r2, r3
	ldr r2, _080EA76C @ =0x001FFFFF
	mov r3, sl
	ands r2, r3
	bl CpuFastSet
	b _080EA77E
	.align 2, 0
_080EA75C: .4byte gUnk_09E4B61C
_080EA760: .4byte gUnk_09E4B79C
_080EA764: .4byte gUnk_09E4B7C0
_080EA768: .4byte 0x05000200
_080EA76C: .4byte 0x001FFFFF
_080EA770:
	ldr r0, _080EA7AC @ =gUnk_09E4B61C
	movs r1, #0x94
	lsls r1, r1, #1
	ldr r2, _080EA7B0 @ =gUnk_09E4B788
	movs r3, #1
	bl OSi_Panic
_080EA77E:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r5
	blo _080EA71A
_080EA788:
	ldr r0, [r6]
	ldr r1, [sp, #0x24]
	str r0, [r1]
	ldr r0, [r6, #4]
	str r0, [r1, #4]
	ldr r0, [sp, #0x24]
	mov r1, sb
	ldr r2, [sp]
	bl NNS_G2dSetImagePaletteLocation
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA7AC: .4byte gUnk_09E4B61C
_080EA7B0: .4byte gUnk_09E4B788

	thumb_func_start NNSi_G2dInitializeVRamLocation
NNSi_G2dInitializeVRamLocation: @ 0x080EA7B4
	movs r2, #1
	rsbs r2, r2, #0
	adds r1, r0, #0
	adds r1, #8
_080EA7BC:
	str r2, [r1]
	subs r1, #4
	cmp r1, r0
	bge _080EA7BC
	bx lr
	.align 2, 0

	thumb_func_start NNSi_G2dSetVramLocation
NNSi_G2dSetVramLocation: @ 0x080EA7C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r5, #0
	bne _080EA7E0
	ldr r0, _080EA824 @ =gUnk_09E4B61C
	ldr r1, _080EA828 @ =0x000002E9
	ldr r2, _080EA82C @ =gUnk_09E4B634
	movs r3, #1
	bl OSi_Panic
_080EA7E0:
	cmp r4, #2
	bls _080EA7F0
	ldr r0, _080EA824 @ =gUnk_09E4B61C
	ldr r1, _080EA830 @ =0x000002EA
	ldr r2, _080EA834 @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080EA7F0:
	cmp r5, #0
	bne _080EA800
	ldr r0, _080EA824 @ =gUnk_09E4B61C
	ldr r2, _080EA82C @ =gUnk_09E4B634
	movs r1, #0x1f
	movs r3, #1
	bl OSi_Panic
_080EA800:
	cmp r4, #2
	bls _080EA810
	ldr r0, _080EA824 @ =gUnk_09E4B61C
	ldr r2, _080EA834 @ =gUnk_09E4B644
	movs r1, #0x20
	movs r3, #1
	bl OSi_Panic
_080EA810:
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetVramLocation_
	lsls r0, r4, #2
	adds r0, r5, r0
	str r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080EA824: .4byte gUnk_09E4B61C
_080EA828: .4byte 0x000002E9
_080EA82C: .4byte gUnk_09E4B634
_080EA830: .4byte 0x000002EA
_080EA834: .4byte gUnk_09E4B644

	thumb_func_start NNSi_G2dGetVramLocation
NNSi_G2dGetVramLocation: @ 0x080EA838
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _080EA84E
	ldr r0, _080EA88C @ =gUnk_09E4B61C
	ldr r1, _080EA890 @ =0x000002F1
	ldr r2, _080EA894 @ =gUnk_09E4B634
	movs r3, #1
	bl OSi_Panic
_080EA84E:
	cmp r4, #2
	bls _080EA85E
	ldr r0, _080EA88C @ =gUnk_09E4B61C
	ldr r1, _080EA898 @ =0x000002F2
	ldr r2, _080EA89C @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080EA85E:
	cmp r5, #0
	bne _080EA86E
	ldr r0, _080EA88C @ =gUnk_09E4B61C
	ldr r2, _080EA894 @ =gUnk_09E4B634
	movs r1, #0x2c
	movs r3, #1
	bl OSi_Panic
_080EA86E:
	cmp r4, #2
	bls _080EA87E
	ldr r0, _080EA88C @ =gUnk_09E4B61C
	ldr r2, _080EA89C @ =gUnk_09E4B644
	movs r1, #0x2d
	movs r3, #1
	bl OSi_Panic
_080EA87E:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r0, [r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080EA88C: .4byte gUnk_09E4B61C
_080EA890: .4byte 0x000002F1
_080EA894: .4byte gUnk_09E4B634
_080EA898: .4byte 0x000002F2
_080EA89C: .4byte gUnk_09E4B644

	thumb_func_start NNSi_G2dIsVramLocationReadyToUse
NNSi_G2dIsVramLocationReadyToUse: @ 0x080EA8A0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _080EA8B6
	ldr r0, _080EA91C @ =gUnk_09E4B61C
	ldr r1, _080EA920 @ =0x000002FA
	ldr r2, _080EA924 @ =gUnk_09E4B634
	movs r3, #1
	bl OSi_Panic
_080EA8B6:
	cmp r4, #2
	bls _080EA8C6
	ldr r0, _080EA91C @ =gUnk_09E4B61C
	ldr r1, _080EA928 @ =0x000002FB
	ldr r2, _080EA92C @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080EA8C6:
	cmp r5, #0
	bne _080EA8D6
	ldr r0, _080EA91C @ =gUnk_09E4B61C
	ldr r2, _080EA924 @ =gUnk_09E4B634
	movs r1, #0x35
	movs r3, #1
	bl OSi_Panic
_080EA8D6:
	cmp r4, #2
	bls _080EA8E6
	ldr r0, _080EA91C @ =gUnk_09E4B61C
	ldr r2, _080EA92C @ =gUnk_09E4B644
	movs r1, #0x36
	movs r3, #1
	bl OSi_Panic
_080EA8E6:
	cmp r5, #0
	bne _080EA8F6
	ldr r0, _080EA91C @ =gUnk_09E4B61C
	ldr r2, _080EA924 @ =gUnk_09E4B634
	movs r1, #0x2c
	movs r3, #1
	bl OSi_Panic
_080EA8F6:
	cmp r4, #2
	bls _080EA906
	ldr r0, _080EA91C @ =gUnk_09E4B61C
	ldr r2, _080EA92C @ =gUnk_09E4B644
	movs r1, #0x2d
	movs r3, #1
	bl OSi_Panic
_080EA906:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r1, [r0]
	mvns r1, r1
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080EA91C: .4byte gUnk_09E4B61C
_080EA920: .4byte 0x000002FA
_080EA924: .4byte gUnk_09E4B634
_080EA928: .4byte 0x000002FB
_080EA92C: .4byte gUnk_09E4B644

	thumb_func_start NNSi_G2dDoImageLoadingToVram
NNSi_G2dDoImageLoadingToVram: @ 0x080EA930
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	cmp r4, #0
	bne _080EA948
	ldr r0, _080EA994 @ =gUnk_09E4B61C
	ldr r1, _080EA998 @ =0x00000309
	ldr r2, _080EA99C @ =gUnk_09E4B790
	movs r3, #1
	bl OSi_Panic
_080EA948:
	cmp r6, #2
	bls _080EA958
	ldr r0, _080EA994 @ =gUnk_09E4B61C
	ldr r1, _080EA9A0 @ =0x0000030A
	ldr r2, _080EA9A4 @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080EA958:
	ldr r0, [r4, #0xc]
	ldrb r5, [r4, #0xc]
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080EA972
	ldr r0, _080EA994 @ =gUnk_09E4B61C
	ldr r2, _080EA9A8 @ =gUnk_09E4B720
	movs r1, #0x88
	movs r3, #1
	bl OSi_Panic
_080EA972:
	cmp r6, #1
	bne _080EA9B0
	cmp r5, #0
	beq _080EA986
	ldr r0, _080EA994 @ =gUnk_09E4B61C
	ldr r2, _080EA9AC @ =gUnk_09E4B760
	movs r1, #0x9a
	movs r3, #1
	bl OSi_Panic
_080EA986:
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x10]
	adds r1, r7, #0
	bl GL_LoadObj
	b _080EA9BC
	.align 2, 0
_080EA994: .4byte gUnk_09E4B61C
_080EA998: .4byte 0x00000309
_080EA99C: .4byte gUnk_09E4B790
_080EA9A0: .4byte 0x0000030A
_080EA9A4: .4byte gUnk_09E4B644
_080EA9A8: .4byte gUnk_09E4B720
_080EA9AC: .4byte gUnk_09E4B760
_080EA9B0:
	ldr r0, _080EA9C4 @ =gUnk_09E4B61C
	ldr r2, _080EA9C8 @ =gUnk_09E4B788
	movs r1, #0xa5
	movs r3, #1
	bl OSi_Panic
_080EA9BC:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EA9C4: .4byte gUnk_09E4B61C
_080EA9C8: .4byte gUnk_09E4B788

	thumb_func_start NNSi_G2dSetupImageProxyPrams
NNSi_G2dSetupImageProxyPrams: @ 0x080EA9CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	mov r8, r1
	adds r7, r2, #0
	adds r6, r3, #0
	cmp r5, #0
	bne _080EA9EA
	ldr r0, _080EAA4C @ =gUnk_09E4B61C
	ldr r1, _080EAA50 @ =0x0000031A
	ldr r2, _080EAA54 @ =gUnk_09E4B790
	movs r3, #1
	bl OSi_Panic
_080EA9EA:
	cmp r7, #2
	bls _080EA9FA
	ldr r0, _080EAA4C @ =gUnk_09E4B61C
	ldr r1, _080EAA58 @ =0x0000031B
	ldr r2, _080EAA5C @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080EA9FA:
	cmp r6, #0
	bne _080EAA0C
	ldr r0, _080EAA4C @ =gUnk_09E4B61C
	movs r1, #0xc7
	lsls r1, r1, #2
	ldr r2, _080EAA60 @ =gUnk_09E4B610
	movs r3, #1
	bl OSi_Panic
_080EAA0C:
	adds r4, r6, #0
	adds r4, #0xc
	cmp r5, #0
	bne _080EAA20
	ldr r0, _080EAA4C @ =gUnk_09E4B61C
	ldr r2, _080EAA64 @ =gUnk_09E4B6B8
	movs r1, #0x5d
	movs r3, #1
	bl OSi_Panic
_080EAA20:
	cmp r4, #0
	bne _080EAA30
	ldr r0, _080EAA4C @ =gUnk_09E4B61C
	ldr r2, _080EAA68 @ =gUnk_09E4B6C0
	movs r1, #0x5e
	movs r3, #1
	bl OSi_Panic
_080EAA30:
	ldr r2, [r5, #8]
	cmp r2, #0
	beq _080EAA38
	b _080EABBA
_080EAA38:
	ldrh r0, [r5, #2]
	subs r0, #1
	cmp r0, #0x1f
	bhi _080EAB04
	lsls r0, r0, #2
	ldr r1, _080EAA6C @ =_080EAA70
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EAA4C: .4byte gUnk_09E4B61C
_080EAA50: .4byte 0x0000031A
_080EAA54: .4byte gUnk_09E4B790
_080EAA58: .4byte 0x0000031B
_080EAA5C: .4byte gUnk_09E4B644
_080EAA60: .4byte gUnk_09E4B610
_080EAA64: .4byte gUnk_09E4B6B8
_080EAA68: .4byte gUnk_09E4B6C0
_080EAA6C: .4byte _080EAA70
_080EAA70: @ jump table
	.4byte _080EAB04 @ case 0
	.4byte _080EAAF0 @ case 1
	.4byte _080EAB04 @ case 2
	.4byte _080EAAF4 @ case 3
	.4byte _080EAB04 @ case 4
	.4byte _080EAB04 @ case 5
	.4byte _080EAB04 @ case 6
	.4byte _080EAAF8 @ case 7
	.4byte _080EAB04 @ case 8
	.4byte _080EAB04 @ case 9
	.4byte _080EAB04 @ case 10
	.4byte _080EAB04 @ case 11
	.4byte _080EAB04 @ case 12
	.4byte _080EAB04 @ case 13
	.4byte _080EAB04 @ case 14
	.4byte _080EAAFC @ case 15
	.4byte _080EAB04 @ case 16
	.4byte _080EAB04 @ case 17
	.4byte _080EAB04 @ case 18
	.4byte _080EAB04 @ case 19
	.4byte _080EAB04 @ case 20
	.4byte _080EAB04 @ case 21
	.4byte _080EAB04 @ case 22
	.4byte _080EAB04 @ case 23
	.4byte _080EAB04 @ case 24
	.4byte _080EAB04 @ case 25
	.4byte _080EAB04 @ case 26
	.4byte _080EAB04 @ case 27
	.4byte _080EAB04 @ case 28
	.4byte _080EAB04 @ case 29
	.4byte _080EAB04 @ case 30
	.4byte _080EAB00 @ case 31
_080EAAF0:
	movs r0, #1
	b _080EAB06
_080EAAF4:
	movs r0, #2
	b _080EAB06
_080EAAF8:
	movs r0, #3
	b _080EAB06
_080EAAFC:
	movs r0, #4
	b _080EAB06
_080EAB00:
	movs r0, #5
	b _080EAB06
_080EAB04:
	movs r0, #0
_080EAB06:
	str r0, [r4]
	ldrh r0, [r5]
	subs r0, #1
	cmp r0, #0x1f
	bhi _080EABB4
	lsls r0, r0, #2
	ldr r1, _080EAB1C @ =_080EAB20
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080EAB1C: .4byte _080EAB20
_080EAB20: @ jump table
	.4byte _080EABB4 @ case 0
	.4byte _080EABA0 @ case 1
	.4byte _080EABB4 @ case 2
	.4byte _080EABA4 @ case 3
	.4byte _080EABB4 @ case 4
	.4byte _080EABB4 @ case 5
	.4byte _080EABB4 @ case 6
	.4byte _080EABA8 @ case 7
	.4byte _080EABB4 @ case 8
	.4byte _080EABB4 @ case 9
	.4byte _080EABB4 @ case 10
	.4byte _080EABB4 @ case 11
	.4byte _080EABB4 @ case 12
	.4byte _080EABB4 @ case 13
	.4byte _080EABB4 @ case 14
	.4byte _080EABAC @ case 15
	.4byte _080EABB4 @ case 16
	.4byte _080EABB4 @ case 17
	.4byte _080EABB4 @ case 18
	.4byte _080EABB4 @ case 19
	.4byte _080EABB4 @ case 20
	.4byte _080EABB4 @ case 21
	.4byte _080EABB4 @ case 22
	.4byte _080EABB4 @ case 23
	.4byte _080EABB4 @ case 24
	.4byte _080EABB4 @ case 25
	.4byte _080EABB4 @ case 26
	.4byte _080EABB4 @ case 27
	.4byte _080EABB4 @ case 28
	.4byte _080EABB4 @ case 29
	.4byte _080EABB4 @ case 30
	.4byte _080EABB0 @ case 31
_080EABA0:
	movs r0, #1
	b _080EABB6
_080EABA4:
	movs r0, #2
	b _080EABB6
_080EABA8:
	movs r0, #3
	b _080EABB6
_080EABAC:
	movs r0, #4
	b _080EABB6
_080EABB0:
	movs r0, #5
	b _080EABB6
_080EABB4:
	movs r0, #0
_080EABB6:
	str r0, [r4, #4]
	b _080EABDA
_080EABBA:
	ldr r1, [r5]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080EABD0
	ldr r0, _080EABFC @ =gUnk_09E4B61C
	ldr r2, _080EAC00 @ =gUnk_09E4B6C8
	movs r1, #0x6d
	movs r3, #1
	bl OSi_Panic
_080EABD0:
	ldrh r0, [r5, #2]
	str r0, [r6, #0xc]
	ldrh r0, [r5]
	str r0, [r4, #4]
	ldr r2, [r5, #8]
_080EABDA:
	ldr r0, [r5, #4]
	str r0, [r4, #8]
	movs r0, #0
	str r0, [r4, #0xc]
	movs r0, #1
	str r0, [r4, #0x10]
	str r2, [r4, #0x14]
	adds r0, r6, #0
	adds r1, r7, #0
	mov r2, r8
	bl NNS_G2dSetImageLocation
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EABFC: .4byte gUnk_09E4B61C
_080EAC00: .4byte gUnk_09E4B6C8

	thumb_func_start NNSi_G2dDoLoadingPaletteToVram
NNSi_G2dDoLoadingPaletteToVram: @ 0x080EAC04
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	cmp r4, #0
	bne _080EAC1C
	ldr r0, _080EAC54 @ =gUnk_09E4B61C
	ldr r1, _080EAC58 @ =0x0000032A
	ldr r2, _080EAC5C @ =gUnk_09E4B790
	movs r3, #1
	bl OSi_Panic
_080EAC1C:
	cmp r6, #2
	bls _080EAC2C
	ldr r0, _080EAC54 @ =gUnk_09E4B61C
	ldr r1, _080EAC60 @ =0x0000032B
	ldr r2, _080EAC64 @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080EAC2C:
	ldr r5, [r4, #8]
	cmp r4, #0
	bne _080EAC40
	ldr r0, _080EAC54 @ =gUnk_09E4B61C
	ldr r2, _080EAC5C @ =gUnk_09E4B790
	movs r1, #0x8e
	lsls r1, r1, #1
	movs r3, #1
	bl OSi_Panic
_080EAC40:
	ldr r0, [r4, #0xc]
	cmp r6, #1
	bne _080EAC6C
	ldr r2, _080EAC68 @ =0x05000200
	adds r1, r7, r2
	lsls r2, r5, #9
	lsrs r2, r2, #0xb
	bl CpuFastSet
	b _080EAC7A
	.align 2, 0
_080EAC54: .4byte gUnk_09E4B61C
_080EAC58: .4byte 0x0000032A
_080EAC5C: .4byte gUnk_09E4B790
_080EAC60: .4byte 0x0000032B
_080EAC64: .4byte gUnk_09E4B644
_080EAC68: .4byte 0x05000200
_080EAC6C:
	ldr r0, _080EAC80 @ =gUnk_09E4B61C
	ldr r2, _080EAC84 @ =gUnk_09E4B788
	movs r1, #0x94
	lsls r1, r1, #1
	movs r3, #1
	bl OSi_Panic
_080EAC7A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EAC80: .4byte gUnk_09E4B61C
_080EAC84: .4byte gUnk_09E4B788

	thumb_func_start NNSi_G2dDoLoadingPaletteToVramEx
NNSi_G2dDoLoadingPaletteToVramEx: @ 0x080EAC88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	adds r6, r1, #0
	str r2, [sp]
	mov sl, r3
	cmp r0, #0
	bne _080EACAE
	ldr r0, _080EAD24 @ =gUnk_09E4B61C
	movs r1, #0xcf
	lsls r1, r1, #2
	ldr r2, _080EAD28 @ =gUnk_09E4B790
	movs r3, #1
	bl OSi_Panic
_080EACAE:
	cmp r6, #0
	bne _080EACBE
	ldr r0, _080EAD24 @ =gUnk_09E4B61C
	ldr r1, _080EAD2C @ =0x0000033D
	ldr r2, _080EAD30 @ =gUnk_09E4B7C0
	movs r3, #1
	bl OSi_Panic
_080EACBE:
	mov r0, sl
	cmp r0, #2
	bls _080EACD0
	ldr r0, _080EAD24 @ =gUnk_09E4B61C
	ldr r1, _080EAD34 @ =0x0000033E
	ldr r2, _080EAD38 @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080EACD0:
	mov r1, r8
	cmp r1, #0
	bne _080EACE2
	ldr r0, _080EAD24 @ =gUnk_09E4B61C
	ldr r2, _080EAD28 @ =gUnk_09E4B790
	ldr r1, _080EAD3C @ =0x0000014F
	movs r3, #1
	bl OSi_Panic
_080EACE2:
	cmp r6, #0
	bne _080EACF4
	ldr r0, _080EAD24 @ =gUnk_09E4B61C
	ldr r2, _080EAD30 @ =gUnk_09E4B7C0
	movs r1, #0xa8
	lsls r1, r1, #1
	movs r3, #1
	bl OSi_Panic
_080EACF4:
	mov r3, sl
	cmp r3, #2
	bls _080EAD06
	ldr r0, _080EAD24 @ =gUnk_09E4B61C
	ldr r2, _080EAD38 @ =gUnk_09E4B644
	ldr r1, _080EAD40 @ =0x00000151
	movs r3, #1
	bl OSi_Panic
_080EAD06:
	mov r0, r8
	cmp r0, #0
	bne _080EAD18
	ldr r0, _080EAD24 @ =gUnk_09E4B61C
	ldr r2, _080EAD28 @ =gUnk_09E4B790
	ldr r1, _080EAD44 @ =0x00000131
	movs r3, #1
	bl OSi_Panic
_080EAD18:
	mov r1, r8
	ldr r0, [r1]
	cmp r0, #3
	bne _080EAD48
	movs r7, #0x20
	b _080EAD5E
	.align 2, 0
_080EAD24: .4byte gUnk_09E4B61C
_080EAD28: .4byte gUnk_09E4B790
_080EAD2C: .4byte 0x0000033D
_080EAD30: .4byte gUnk_09E4B7C0
_080EAD34: .4byte 0x0000033E
_080EAD38: .4byte gUnk_09E4B644
_080EAD3C: .4byte 0x0000014F
_080EAD40: .4byte 0x00000151
_080EAD44: .4byte 0x00000131
_080EAD48:
	cmp r0, #4
	beq _080EAD5A
	ldr r0, _080EADAC @ =gUnk_09E4B61C
	ldr r2, _080EADB0 @ =gUnk_09E4B79C
	movs r1, #0x9c
	lsls r1, r1, #1
	movs r3, #1
	bl OSi_Panic
_080EAD5A:
	movs r7, #0x80
	lsls r7, r7, #2
_080EAD5E:
	ldrh r5, [r6]
	movs r4, #0
	cmp r4, r5
	bhs _080EADD8
	lsrs r3, r7, #2
	mov sb, r3
_080EAD6A:
	cmp r6, #0
	bne _080EAD7C
	ldr r0, _080EADAC @ =gUnk_09E4B61C
	movs r1, #0xa0
	lsls r1, r1, #1
	ldr r2, _080EADB4 @ =gUnk_09E4B7C0
	movs r3, #1
	bl OSi_Panic
_080EAD7C:
	ldr r1, [r6, #4]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	muls r0, r7, r0
	adds r1, r7, #0
	muls r1, r4, r1
	ldr r3, [sp]
	adds r2, r3, r0
	mov r3, r8
	ldr r0, [r3, #0xc]
	adds r0, r0, r1
	mov r1, sl
	cmp r1, #1
	bne _080EADC0
	ldr r3, _080EADB8 @ =0x05000200
	adds r1, r2, r3
	ldr r2, _080EADBC @ =0x001FFFFF
	mov r3, sb
	ands r2, r3
	bl CpuFastSet
	b _080EADCE
	.align 2, 0
_080EADAC: .4byte gUnk_09E4B61C
_080EADB0: .4byte gUnk_09E4B79C
_080EADB4: .4byte gUnk_09E4B7C0
_080EADB8: .4byte 0x05000200
_080EADBC: .4byte 0x001FFFFF
_080EADC0:
	ldr r0, _080EADE8 @ =gUnk_09E4B61C
	movs r1, #0x94
	lsls r1, r1, #1
	ldr r2, _080EADEC @ =gUnk_09E4B788
	movs r3, #1
	bl OSi_Panic
_080EADCE:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, r5
	blo _080EAD6A
_080EADD8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EADE8: .4byte gUnk_09E4B61C
_080EADEC: .4byte gUnk_09E4B788

	thumb_func_start NNSi_G2dSetupPaletteProxyPrams
NNSi_G2dSetupPaletteProxyPrams: @ 0x080EADF0
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r6, r2, #0
	adds r4, r3, #0
	cmp r5, #0
	bne _080EAE0A
	ldr r0, _080EAE44 @ =gUnk_09E4B61C
	ldr r1, _080EAE48 @ =0x0000034E
	ldr r2, _080EAE4C @ =gUnk_09E4B790
	movs r3, #1
	bl OSi_Panic
_080EAE0A:
	cmp r6, #2
	bls _080EAE1A
	ldr r0, _080EAE44 @ =gUnk_09E4B61C
	ldr r1, _080EAE50 @ =0x0000034F
	ldr r2, _080EAE54 @ =gUnk_09E4B644
	movs r3, #1
	bl OSi_Panic
_080EAE1A:
	cmp r4, #0
	bne _080EAE2C
	ldr r0, _080EAE44 @ =gUnk_09E4B61C
	movs r1, #0xd4
	lsls r1, r1, #2
	ldr r2, _080EAE58 @ =gUnk_09E4B898
	movs r3, #1
	bl OSi_Panic
_080EAE2C:
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
_080EAE44: .4byte gUnk_09E4B61C
_080EAE48: .4byte 0x0000034E
_080EAE4C: .4byte gUnk_09E4B790
_080EAE50: .4byte 0x0000034F
_080EAE54: .4byte gUnk_09E4B644
_080EAE58: .4byte gUnk_09E4B898

	thumb_func_start SetVramLocation_
SetVramLocation_: @ 0x080EAE5C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _080EAE72
	ldr r0, _080EAEB8 @ =gUnk_09E4B61C
	ldr r2, _080EAEBC @ =gUnk_09E4B634
	movs r1, #0x35
	movs r3, #1
	bl OSi_Panic
_080EAE72:
	cmp r4, #2
	bls _080EAE82
	ldr r0, _080EAEB8 @ =gUnk_09E4B61C
	ldr r2, _080EAEC0 @ =gUnk_09E4B644
	movs r1, #0x36
	movs r3, #1
	bl OSi_Panic
_080EAE82:
	cmp r5, #0
	bne _080EAE92
	ldr r0, _080EAEB8 @ =gUnk_09E4B61C
	ldr r2, _080EAEBC @ =gUnk_09E4B634
	movs r1, #0x2c
	movs r3, #1
	bl OSi_Panic
_080EAE92:
	cmp r4, #2
	bls _080EAEA2
	ldr r0, _080EAEB8 @ =gUnk_09E4B61C
	ldr r2, _080EAEC0 @ =gUnk_09E4B644
	movs r1, #0x2d
	movs r3, #1
	bl OSi_Panic
_080EAEA2:
	lsls r0, r4, #2
	adds r0, r5, r0
	ldr r1, [r0]
	mvns r1, r1
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080EAEB8: .4byte gUnk_09E4B61C
_080EAEBC: .4byte gUnk_09E4B634
_080EAEC0: .4byte gUnk_09E4B644
