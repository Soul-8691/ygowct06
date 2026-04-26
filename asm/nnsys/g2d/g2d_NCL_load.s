	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start DumpPalette_
DumpPalette_: @ 0x080EB4D4
	push {r4, r5, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080EB4E8
	ldr r0, _080EB534 @ =gUnk_09E4D8F0
	ldr r2, _080EB538 @ =gUnk_09E4D90C
	movs r1, #0x19
	movs r3, #1
	bl OSi_Panic
_080EB4E8:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _080EB4FA
	ldr r0, _080EB534 @ =gUnk_09E4D8F0
	ldr r2, _080EB53C @ =gUnk_09E4D918
	movs r1, #0x1a
	movs r3, #1
	bl OSi_Panic
_080EB4FA:
	ldr r5, [r4, #0xc]
	ldr r0, _080EB540 @ =gUnk_09E4D92C
	bl OS_Printf
	movs r4, #0
_080EB504:
	movs r0, #0xf
	ands r0, r4
	cmp r0, #0
	bne _080EB512
	ldr r0, _080EB544 @ =gUnk_09E4D95C
	bl OS_Printf
_080EB512:
	lsls r0, r4, #1
	adds r0, r0, r5
	ldrh r1, [r0]
	ldr r0, _080EB548 @ =gUnk_09E4D960
	bl OS_Printf
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0xff
	bls _080EB504
	ldr r0, _080EB540 @ =gUnk_09E4D92C
	bl OS_Printf
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EB534: .4byte gUnk_09E4D8F0
_080EB538: .4byte gUnk_09E4D90C
_080EB53C: .4byte gUnk_09E4D918
_080EB540: .4byte gUnk_09E4D92C
_080EB544: .4byte gUnk_09E4D95C
_080EB548: .4byte gUnk_09E4D960

	thumb_func_start NNS_G2dGetUnpackedPaletteData
NNS_G2dGetUnpackedPaletteData: @ 0x080EB54C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080EB562
	ldr r0, _080EB5B8 @ =gUnk_09E4D8F0
	ldr r2, _080EB5BC @ =gUnk_09E4D968
	movs r1, #0x31
	movs r3, #1
	bl OSi_Panic
_080EB562:
	cmp r5, #0
	bne _080EB572
	ldr r0, _080EB5B8 @ =gUnk_09E4D8F0
	ldr r2, _080EB5C0 @ =gUnk_09E4D974
	movs r1, #0x32
	movs r3, #1
	bl OSi_Panic
_080EB572:
	ldr r1, [r4]
	ldr r0, _080EB5C4 @ =0x4E434C52
	cmp r1, r0
	beq _080EB58C
	ldr r0, _080EB5C8 @ =0x4E435052
	cmp r1, r0
	beq _080EB58C
	ldr r0, _080EB5B8 @ =gUnk_09E4D8F0
	ldr r2, _080EB5CC @ =gUnk_09E4D980
	movs r1, #0x3a
	movs r3, #1
	bl OSi_Panic
_080EB58C:
	movs r0, #0
	ldrh r1, [r4, #6]
	cmp r1, #0xff
	bls _080EB596
	movs r0, #1
_080EB596:
	cmp r0, #0
	bne _080EB5A6
	ldr r0, _080EB5B8 @ =gUnk_09E4D8F0
	ldr r2, _080EB5D0 @ =gUnk_09E4D9CC
	movs r1, #0x3f
	movs r3, #1
	bl OSi_Panic
_080EB5A6:
	ldr r1, _080EB5D4 @ =0x504C5454
	adds r0, r4, #0
	bl NNS_G2dFindBinaryBlock
	cmp r0, #0
	bne _080EB5D8
	str r0, [r5]
	movs r0, #0
	b _080EB5E6
	.align 2, 0
_080EB5B8: .4byte gUnk_09E4D8F0
_080EB5BC: .4byte gUnk_09E4D968
_080EB5C0: .4byte gUnk_09E4D974
_080EB5C4: .4byte 0x4E434C52
_080EB5C8: .4byte 0x4E435052
_080EB5CC: .4byte gUnk_09E4D980
_080EB5D0: .4byte gUnk_09E4D9CC
_080EB5D4: .4byte 0x504C5454
_080EB5D8:
	adds r4, r0, #0
	adds r4, #8
	adds r0, r4, #0
	bl NNS_G2dUnpackNCL
	str r4, [r5]
	movs r0, #1
_080EB5E6:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start NNS_G2dGetUnpackedPaletteCompressInfo
NNS_G2dGetUnpackedPaletteCompressInfo: @ 0x080EB5EC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080EB602
	ldr r0, _080EB658 @ =gUnk_09E4D8F0
	ldr r2, _080EB65C @ =gUnk_09E4D968
	movs r1, #0x5f
	movs r3, #1
	bl OSi_Panic
_080EB602:
	cmp r5, #0
	bne _080EB612
	ldr r0, _080EB658 @ =gUnk_09E4D8F0
	ldr r2, _080EB660 @ =gUnk_09E4DA20
	movs r1, #0x60
	movs r3, #1
	bl OSi_Panic
_080EB612:
	ldr r1, [r4]
	ldr r0, _080EB664 @ =0x4E434C52
	cmp r1, r0
	beq _080EB62C
	ldr r0, _080EB668 @ =0x4E435052
	cmp r1, r0
	beq _080EB62C
	ldr r0, _080EB658 @ =gUnk_09E4D8F0
	ldr r2, _080EB66C @ =gUnk_09E4D980
	movs r1, #0x68
	movs r3, #1
	bl OSi_Panic
_080EB62C:
	movs r0, #0
	ldrh r1, [r4, #6]
	cmp r1, #0xff
	bls _080EB636
	movs r0, #1
_080EB636:
	cmp r0, #0
	bne _080EB646
	ldr r0, _080EB658 @ =gUnk_09E4D8F0
	ldr r2, _080EB670 @ =gUnk_09E4D9CC
	movs r1, #0x6d
	movs r3, #1
	bl OSi_Panic
_080EB646:
	ldr r1, _080EB674 @ =0x50434D50
	adds r0, r4, #0
	bl NNS_G2dFindBinaryBlock
	cmp r0, #0
	bne _080EB678
	str r0, [r5]
	movs r0, #0
	b _080EB686
	.align 2, 0
_080EB658: .4byte gUnk_09E4D8F0
_080EB65C: .4byte gUnk_09E4D968
_080EB660: .4byte gUnk_09E4DA20
_080EB664: .4byte 0x4E434C52
_080EB668: .4byte 0x4E435052
_080EB66C: .4byte gUnk_09E4D980
_080EB670: .4byte gUnk_09E4D9CC
_080EB674: .4byte 0x50434D50
_080EB678:
	adds r4, r0, #0
	adds r4, #8
	adds r0, r4, #0
	bl NNSi_G2dUnpackNCLCmpInfo
	str r4, [r5]
	movs r0, #1
_080EB686:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start NNSi_G2dUnpackNCLCmpInfo
NNSi_G2dUnpackNCLCmpInfo: @ 0x080EB68C
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080EB6A0
	ldr r0, _080EB6AC @ =gUnk_09E4D8F0
	ldr r2, _080EB6B0 @ =gUnk_09E4DA30
	movs r1, #0x8c
	movs r3, #1
	bl OSi_Panic
_080EB6A0:
	ldr r0, [r4, #4]
	adds r0, r0, r4
	str r0, [r4, #4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB6AC: .4byte gUnk_09E4D8F0
_080EB6B0: .4byte gUnk_09E4DA30

	thumb_func_start NNS_G2dUnpackNCL
NNS_G2dUnpackNCL: @ 0x080EB6B4
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080EB6C8
	ldr r0, _080EB6D4 @ =gUnk_09E4D8F0
	ldr r2, _080EB6D8 @ =gUnk_09E4D90C
	movs r1, #0x97
	movs r3, #1
	bl OSi_Panic
_080EB6C8:
	ldr r0, [r4, #0xc]
	adds r0, r0, r4
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB6D4: .4byte gUnk_09E4D8F0
_080EB6D8: .4byte gUnk_09E4D90C
