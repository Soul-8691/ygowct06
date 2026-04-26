	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start GetPtrOamArrayHead_
GetPtrOamArrayHead_: @ 0x080EB6DC
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080EB6F0
	ldr r0, _080EB700 @ =gUnk_09E4E178
	ldr r2, _080EB704 @ =gUnk_09E4E0FC
	movs r1, #0xb
	movs r3, #1
	bl OSi_Panic
_080EB6F0:
	movs r0, #1
	ldrh r1, [r4, #2]
	ands r0, r1
	cmp r0, #0
	bne _080EB708
	ldrh r0, [r4]
	lsls r1, r0, #3
	b _080EB70C
	.align 2, 0
_080EB700: .4byte gUnk_09E4E178
_080EB704: .4byte gUnk_09E4E0FC
_080EB708:
	ldrh r0, [r4]
	lsls r1, r0, #4
_080EB70C:
	ldr r0, [r4, #4]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start UnPackExtendedData_
UnPackExtendedData_: @ 0x080EB718
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080EB72C
	ldr r0, _080EB73C @ =gUnk_09E4E178
	ldr r2, _080EB740 @ =gUnk_09E4E194
	movs r1, #0x1c
	movs r3, #1
	bl OSi_Panic
_080EB72C:
	adds r0, r4, #0
	adds r0, #8
	bl NNSi_G2dUnpackUserExCellAttrBank
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EB73C: .4byte gUnk_09E4E178
_080EB740: .4byte gUnk_09E4E194

	thumb_func_start NNS_G2dGetUnpackedCellBank
NNS_G2dGetUnpackedCellBank: @ 0x080EB744
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080EB75A
	ldr r0, _080EB7C0 @ =gUnk_09E4E178
	ldr r2, _080EB7C4 @ =gUnk_09E4E19C
	movs r1, #0x29
	movs r3, #1
	bl OSi_Panic
_080EB75A:
	cmp r5, #0
	bne _080EB76A
	ldr r0, _080EB7C0 @ =gUnk_09E4E178
	ldr r2, _080EB7C8 @ =gUnk_09E4E1A8
	movs r1, #0x2a
	movs r3, #1
	bl OSi_Panic
_080EB76A:
	movs r2, #0
	cmp r4, #0
	beq _080EB77A
	ldr r1, [r4]
	ldr r0, _080EB7CC @ =0x4E434552
	cmp r1, r0
	bne _080EB77A
	movs r2, #1
_080EB77A:
	cmp r2, #0
	bne _080EB78A
	ldr r0, _080EB7C0 @ =gUnk_09E4E178
	ldr r2, _080EB7D0 @ =gUnk_09E4E1B4
	movs r1, #0x2e
	movs r3, #1
	bl OSi_Panic
_080EB78A:
	movs r1, #0
	cmp r4, #0
	beq _080EB79C
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r2, [r4, #6]
	cmp r2, r0
	blo _080EB79C
	movs r1, #1
_080EB79C:
	cmp r1, #0
	bne _080EB7AC
	ldr r0, _080EB7C0 @ =gUnk_09E4E178
	ldr r2, _080EB7D4 @ =gUnk_09E4E1F0
	movs r1, #0x32
	movs r3, #1
	bl OSi_Panic
_080EB7AC:
	ldr r1, _080EB7D8 @ =0x4345424B
	adds r0, r4, #0
	bl NNS_G2dFindBinaryBlock
	cmp r0, #0
	bne _080EB7DC
	str r0, [r5]
	movs r0, #0
	b _080EB7EA
	.align 2, 0
_080EB7C0: .4byte gUnk_09E4E178
_080EB7C4: .4byte gUnk_09E4E19C
_080EB7C8: .4byte gUnk_09E4E1A8
_080EB7CC: .4byte 0x4E434552
_080EB7D0: .4byte gUnk_09E4E1B4
_080EB7D4: .4byte gUnk_09E4E1F0
_080EB7D8: .4byte 0x4345424B
_080EB7DC:
	adds r4, r0, #0
	adds r4, #8
	adds r0, r4, #0
	bl NNS_G2dUnpackNCE
	str r4, [r5]
	movs r0, #1
_080EB7EA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start NNS_G2dGetCellDataByIdx
NNS_G2dGetCellDataByIdx: @ 0x080EB7F0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r6, r5, #0
	cmp r4, #0
	bne _080EB80A
	ldr r0, _080EB814 @ =gUnk_09E4E178
	ldr r2, _080EB818 @ =gUnk_09E4E23C
	movs r1, #0x51
	movs r3, #1
	bl OSi_Panic
_080EB80A:
	ldrh r0, [r4]
	cmp r5, r0
	blo _080EB81C
	movs r0, #0
	b _080EB830
	.align 2, 0
_080EB814: .4byte gUnk_09E4E178
_080EB818: .4byte gUnk_09E4E23C
_080EB81C:
	movs r0, #1
	ldrh r1, [r4, #2]
	ands r0, r1
	cmp r0, #0
	bne _080EB82A
	lsls r1, r5, #3
	b _080EB82C
_080EB82A:
	lsls r1, r6, #4
_080EB82C:
	ldr r0, [r4, #4]
	adds r0, r0, r1
_080EB830:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start NNS_G2dUnpackNCE
NNS_G2dUnpackNCE: @ 0x080EB838
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080EB84C
	ldr r0, _080EB860 @ =gUnk_09E4E178
	ldr r2, _080EB864 @ =gUnk_09E4E23C
	movs r1, #0x6e
	movs r3, #1
	bl OSi_Panic
_080EB84C:
	ldr r0, [r4, #4]
	adds r0, r0, r4
	str r0, [r4, #4]
	adds r0, r4, #0
	bl GetPtrOamArrayHead_
	adds r6, r0, #0
	movs r5, #0
	b _080EB87C
	.align 2, 0
_080EB860: .4byte gUnk_09E4E178
_080EB864: .4byte gUnk_09E4E23C
_080EB868:
	adds r0, r4, #0
	adds r1, r5, #0
	bl NNS_G2dGetCellDataByIdx
	ldr r1, [r0, #4]
	adds r1, r1, r6
	str r1, [r0, #4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080EB87C:
	ldrh r0, [r4]
	cmp r5, r0
	blo _080EB868
	ldr r1, [r4, #0xc]
	cmp r1, #0
	beq _080EB892
	adds r1, r1, r4
	ldr r0, [r1, #4]
	adds r0, r0, r1
	str r0, [r1, #4]
	str r1, [r4, #0xc]
_080EB892:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _080EB8A0
	adds r0, r0, r4
	str r0, [r4, #0x14]
	bl UnPackExtendedData_
_080EB8A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
