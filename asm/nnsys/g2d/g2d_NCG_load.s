	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start NNS_G2dGetUnpackedCharacterData
NNS_G2dGetUnpackedCharacterData: @ 0x080EB23C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080EB252
	ldr r0, _080EB2B8 @ =gUnk_09E4CFA4
	ldr r2, _080EB2BC @ =gUnk_09E4CFC0
	movs r1, #0x34
	movs r3, #1
	bl OSi_Panic
_080EB252:
	cmp r5, #0
	bne _080EB262
	ldr r0, _080EB2B8 @ =gUnk_09E4CFA4
	ldr r2, _080EB2C0 @ =gUnk_09E4CFCC
	movs r1, #0x35
	movs r3, #1
	bl OSi_Panic
_080EB262:
	movs r2, #0
	cmp r4, #0
	beq _080EB272
	ldr r1, [r4]
	ldr r0, _080EB2C4 @ =0x4E434752
	cmp r1, r0
	bne _080EB272
	movs r2, #1
_080EB272:
	cmp r2, #0
	bne _080EB282
	ldr r0, _080EB2B8 @ =gUnk_09E4CFA4
	ldr r2, _080EB2C8 @ =gUnk_09E4CFD8
	movs r1, #0x39
	movs r3, #1
	bl OSi_Panic
_080EB282:
	movs r1, #0
	cmp r4, #0
	beq _080EB294
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r2, [r4, #6]
	cmp r2, r0
	blo _080EB294
	movs r1, #1
_080EB294:
	cmp r1, #0
	bne _080EB2A4
	ldr r0, _080EB2B8 @ =gUnk_09E4CFA4
	ldr r2, _080EB2CC @ =gUnk_09E4D014
	movs r1, #0x3d
	movs r3, #1
	bl OSi_Panic
_080EB2A4:
	ldr r1, _080EB2D0 @ =0x43484152
	adds r0, r4, #0
	bl NNS_G2dFindBinaryBlock
	cmp r0, #0
	bne _080EB2D4
	str r0, [r5]
	movs r0, #0
	b _080EB2E2
	.align 2, 0
_080EB2B8: .4byte gUnk_09E4CFA4
_080EB2BC: .4byte gUnk_09E4CFC0
_080EB2C0: .4byte gUnk_09E4CFCC
_080EB2C4: .4byte 0x4E434752
_080EB2C8: .4byte gUnk_09E4CFD8
_080EB2CC: .4byte gUnk_09E4D014
_080EB2D0: .4byte 0x43484152
_080EB2D4:
	adds r4, r0, #0
	adds r4, #8
	adds r0, r4, #0
	bl NNS_G2dUnpackNCG
	str r4, [r5]
	movs r0, #1
_080EB2E2:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start NNS_G2dUnpackNCG
NNS_G2dUnpackNCG: @ 0x080EB2E8
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080EB2FC
	ldr r0, _080EB338 @ =gUnk_09E4CFA4
	ldr r2, _080EB33C @ =gUnk_09E4D068
	movs r1, #0x5c
	movs r3, #1
	bl OSi_Panic
_080EB2FC:
	ldr r0, [r4, #0x14]
	adds r0, r0, r4
	str r0, [r4, #0x14]
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _080EB330
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _080EB330
	ldr r0, [r4, #4]
	cmp r0, #3
	bne _080EB31A
	ldrh r1, [r4, #2]
	cmp r1, #0x20
	beq _080EB330
_080EB31A:
	cmp r0, #4
	bne _080EB324
	ldrh r4, [r4, #2]
	cmp r4, #0x10
	beq _080EB330
_080EB324:
	ldr r0, _080EB338 @ =gUnk_09E4CFA4
	ldr r2, _080EB340 @ =gUnk_09E4D074
	movs r1, #0x77
	movs r3, #1
	bl OSi_Panic
_080EB330:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB338: .4byte gUnk_09E4CFA4
_080EB33C: .4byte gUnk_09E4D068
_080EB340: .4byte gUnk_09E4D074

	thumb_func_start NNS_G2dGetUnpackedBGCharacterData
NNS_G2dGetUnpackedBGCharacterData: @ 0x080EB344
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080EB35A
	ldr r0, _080EB3C0 @ =gUnk_09E4CFA4
	ldr r2, _080EB3C4 @ =gUnk_09E4CFC0
	movs r1, #0x84
	movs r3, #1
	bl OSi_Panic
_080EB35A:
	cmp r5, #0
	bne _080EB36A
	ldr r0, _080EB3C0 @ =gUnk_09E4CFA4
	ldr r2, _080EB3C8 @ =gUnk_09E4CFCC
	movs r1, #0x85
	movs r3, #1
	bl OSi_Panic
_080EB36A:
	movs r2, #0
	cmp r4, #0
	beq _080EB37A
	ldr r1, [r4]
	ldr r0, _080EB3CC @ =0x4E434752
	cmp r1, r0
	bne _080EB37A
	movs r2, #1
_080EB37A:
	cmp r2, #0
	bne _080EB38A
	ldr r0, _080EB3C0 @ =gUnk_09E4CFA4
	ldr r2, _080EB3D0 @ =gUnk_09E4CFD8
	movs r1, #0x89
	movs r3, #1
	bl OSi_Panic
_080EB38A:
	movs r1, #0
	cmp r4, #0
	beq _080EB39C
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r2, [r4, #6]
	cmp r2, r0
	blo _080EB39C
	movs r1, #1
_080EB39C:
	cmp r1, #0
	bne _080EB3AC
	ldr r0, _080EB3C0 @ =gUnk_09E4CFA4
	ldr r2, _080EB3D4 @ =gUnk_09E4D014
	movs r1, #0x8d
	movs r3, #1
	bl OSi_Panic
_080EB3AC:
	ldr r1, _080EB3D8 @ =0x43484152
	adds r0, r4, #0
	bl NNS_G2dFindBinaryBlock
	cmp r0, #0
	bne _080EB3DC
	str r0, [r5]
	movs r0, #0
	b _080EB3EA
	.align 2, 0
_080EB3C0: .4byte gUnk_09E4CFA4
_080EB3C4: .4byte gUnk_09E4CFC0
_080EB3C8: .4byte gUnk_09E4CFCC
_080EB3CC: .4byte 0x4E434752
_080EB3D0: .4byte gUnk_09E4CFD8
_080EB3D4: .4byte gUnk_09E4D014
_080EB3D8: .4byte 0x43484152
_080EB3DC:
	adds r4, r0, #0
	adds r4, #8
	adds r0, r4, #0
	bl NNS_G2dUnpackBGNCG
	str r4, [r5]
	movs r0, #1
_080EB3EA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start NNS_G2dGetUnpackedCharacterPosInfo
NNS_G2dGetUnpackedCharacterPosInfo: @ 0x080EB3F0
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080EB406
	ldr r0, _080EB468 @ =gUnk_09E4CFA4
	ldr r2, _080EB46C @ =gUnk_09E4CFC0
	movs r1, #0xc3
	movs r3, #1
	bl OSi_Panic
_080EB406:
	cmp r5, #0
	bne _080EB416
	ldr r0, _080EB468 @ =gUnk_09E4CFA4
	ldr r2, _080EB470 @ =gUnk_09E4D0FC
	movs r1, #0xc4
	movs r3, #1
	bl OSi_Panic
_080EB416:
	movs r2, #0
	cmp r4, #0
	beq _080EB426
	ldr r1, [r4]
	ldr r0, _080EB474 @ =0x4E434752
	cmp r1, r0
	bne _080EB426
	movs r2, #1
_080EB426:
	cmp r2, #0
	bne _080EB436
	ldr r0, _080EB468 @ =gUnk_09E4CFA4
	ldr r2, _080EB478 @ =gUnk_09E4CFD8
	movs r1, #0xc8
	movs r3, #1
	bl OSi_Panic
_080EB436:
	movs r1, #0
	cmp r4, #0
	beq _080EB446
	ldr r0, _080EB47C @ =0x00000101
	ldrh r2, [r4, #6]
	cmp r2, r0
	blo _080EB446
	movs r1, #1
_080EB446:
	cmp r1, #0
	bne _080EB456
	ldr r0, _080EB468 @ =gUnk_09E4CFA4
	ldr r2, _080EB480 @ =gUnk_09E4D10C
	movs r1, #0xcc
	movs r3, #1
	bl OSi_Panic
_080EB456:
	ldr r1, _080EB484 @ =0x43504F53
	adds r0, r4, #0
	bl NNS_G2dFindBinaryBlock
	cmp r0, #0
	bne _080EB488
	str r0, [r5]
	movs r0, #0
	b _080EB48E
	.align 2, 0
_080EB468: .4byte gUnk_09E4CFA4
_080EB46C: .4byte gUnk_09E4CFC0
_080EB470: .4byte gUnk_09E4D0FC
_080EB474: .4byte 0x4E434752
_080EB478: .4byte gUnk_09E4CFD8
_080EB47C: .4byte 0x00000101
_080EB480: .4byte gUnk_09E4D10C
_080EB484: .4byte 0x43504F53
_080EB488:
	adds r0, #8
	str r0, [r5]
	movs r0, #1
_080EB48E:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start NNS_G2dUnpackBGNCG
NNS_G2dUnpackBGNCG: @ 0x080EB494
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080EB4A8
	ldr r0, _080EB4C8 @ =gUnk_09E4CFA4
	ldr r2, _080EB4CC @ =gUnk_09E4D068
	movs r1, #0xe6
	movs r3, #1
	bl OSi_Panic
_080EB4A8:
	ldr r0, [r4, #0x14]
	adds r0, r0, r4
	str r0, [r4, #0x14]
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _080EB4C0
	ldr r0, _080EB4C8 @ =gUnk_09E4CFA4
	ldr r2, _080EB4D0 @ =gUnk_09E4D160
	movs r1, #0xf6
	movs r3, #1
	bl OSi_Panic
_080EB4C0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB4C8: .4byte gUnk_09E4CFA4
_080EB4CC: .4byte gUnk_09E4D068
_080EB4D0: .4byte gUnk_09E4D160
