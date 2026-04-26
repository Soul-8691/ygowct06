	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start NNS_G2dFindBinaryBlock
NNS_G2dFindBinaryBlock: @ 0x080EAEC4
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	cmp r6, #0
	bne _080EAEDA
	ldr r0, _080EAEE4 @ =gUnk_09E4BFDC
	ldr r2, _080EAEE8 @ =gUnk_09E4BFF4
	movs r1, #0xa
	movs r3, #1
	bl OSi_Panic
_080EAEDA:
	ldrh r0, [r6, #0xc]
	adds r4, r0, r6
	movs r5, #0
	b _080EAF1A
	.align 2, 0
_080EAEE4: .4byte gUnk_09E4BFDC
_080EAEE8: .4byte gUnk_09E4BFF4
_080EAEEC:
	cmp r4, #0
	bne _080EAEFC
	ldr r0, _080EAF08 @ =gUnk_09E4BFDC
	movs r1, #0x13
	ldr r2, _080EAF0C @ =gUnk_09E4C004
	movs r3, #1
	bl OSi_Panic
_080EAEFC:
	ldr r0, [r4]
	cmp r0, r7
	bne _080EAF10
	adds r0, r4, #0
	b _080EAF22
	.align 2, 0
_080EAF08: .4byte gUnk_09E4BFDC
_080EAF0C: .4byte gUnk_09E4C004
_080EAF10:
	ldr r0, [r4, #4]
	adds r4, r4, r0
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_080EAF1A:
	ldrh r0, [r6, #0xe]
	cmp r5, r0
	blo _080EAEEC
	movs r0, #0
_080EAF22:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start NNSi_G2dUnpackUserExCellAttrBank
NNSi_G2dUnpackUserExCellAttrBank: @ 0x080EAF28
	push {r4, lr}
	adds r2, r0, #0
	ldr r0, [r2, #4]
	adds r0, r0, r2
	str r0, [r2, #4]
	movs r3, #0
	ldrh r1, [r2]
	cmp r3, r1
	bhs _080EAF52
	adds r4, r0, #0
_080EAF3C:
	lsls r0, r3, #2
	adds r0, r0, r4
	ldr r1, [r0]
	adds r1, r1, r2
	str r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldrh r0, [r2]
	cmp r3, r0
	blo _080EAF3C
_080EAF52:
	pop {r4}
	pop {r0}
	bx r0
