	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start NNSi_G2dCallbackFuncHandling
NNSi_G2dCallbackFuncHandling: @ 0x080E887C
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r4, #0
	bne _080E8894
	ldr r0, _080E88A0 @ =gUnk_09E4A4A8
	ldr r2, _080E88A4 @ =gUnk_09E4A500
	movs r1, #0x75
	movs r3, #1
	bl OSi_Panic
_080E8894:
	ldr r0, [r4]
	cmp r0, #2
	beq _080E88A8
	cmp r0, #3
	beq _080E88BA
	b _080E88C4
	.align 2, 0
_080E88A0: .4byte gUnk_09E4A4A8
_080E88A4: .4byte gUnk_09E4A500
_080E88A8:
	ldrh r0, [r4, #0xc]
	cmp r5, r0
	bne _080E88C4
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	adds r1, r5, #0
	bl _call_via_r2
	b _080E88C4
_080E88BA:
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	adds r1, r5, #0
	bl _call_via_r2
_080E88C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start SequenceEdgeHandle_
SequenceEdgeHandle_: @ 0x080E88CC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	cmp r6, #0
	bne _080E88F0
	ldr r4, _080E89F4 @ =gUnk_09E4A4A8
	ldr r5, _080E89F8 @ =gUnk_09E4A49C
	adds r0, r4, #0
	movs r1, #0xf8
	adds r2, r5, #0
	movs r3, #1
	bl OSi_Panic
	adds r0, r4, #0
	movs r1, #0x4d
	adds r2, r5, #0
	movs r3, #1
	bl OSi_Panic
_080E88F0:
	ldr r0, [r6, #0x18]
	cmp r0, #0
	bne _080E8902
	ldr r0, _080E89F4 @ =gUnk_09E4A4A8
	ldr r2, _080E89FC @ =gUnk_09E4A4D0
	movs r1, #0x4e
	movs r3, #1
	bl OSi_Panic
_080E8902:
	cmp r6, #0
	bne _080E8912
	ldr r0, _080E89F4 @ =gUnk_09E4A4A8
	ldr r2, _080E89F8 @ =gUnk_09E4A49C
	movs r1, #0x2c
	movs r3, #1
	bl OSi_Panic
_080E8912:
	ldr r0, [r6, #0x18]
	cmp r0, #0
	bne _080E8924
	ldr r0, _080E89F4 @ =gUnk_09E4A4A8
	ldr r2, _080E89FC @ =gUnk_09E4A4D0
	movs r1, #0x2d
	movs r3, #1
	bl OSi_Panic
_080E8924:
	ldr r0, [r6, #0x14]
	cmp r0, #0
	bne _080E892E
	ldr r0, [r6, #0x18]
	ldr r0, [r0, #8]
_080E892E:
	movs r1, #0
	subs r0, #3
	cmp r0, #1
	bhi _080E8938
	movs r1, #1
_080E8938:
	cmp r1, #0
	beq _080E8A14
	cmp r6, #0
	bne _080E894C
	ldr r0, _080E89F4 @ =gUnk_09E4A4A8
	ldr r2, _080E89F8 @ =gUnk_09E4A49C
	movs r1, #0xd5
	movs r3, #1
	bl OSi_Panic
_080E894C:
	ldr r0, [r6, #4]
	movs r1, #1
	eors r0, r1
	str r0, [r6, #4]
	ldr r5, [r6]
	cmp r5, #0
	bne _080E8966
	ldr r0, _080E89F4 @ =gUnk_09E4A4A8
	ldr r2, _080E8A00 @ =gUnk_09E4A50C
	movs r1, #0x92
	movs r3, #1
	bl OSi_Panic
_080E8966:
	ldr r4, [r6, #0x18]
	cmp r4, #0
	bne _080E8978
	ldr r0, _080E89F4 @ =gUnk_09E4A4A8
	ldr r2, _080E8A04 @ =gUnk_09E4A4C4
	movs r1, #0x19
	movs r3, #1
	bl OSi_Panic
_080E8978:
	ldrh r0, [r4, #2]
	lsls r1, r0, #3
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	movs r1, #0
	subs r0, #8
	cmp r5, r0
	bhi _080E898A
	movs r1, #1
_080E898A:
	cmp r1, #0
	bne _080E8990
	b _080E8AE2
_080E8990:
	ldr r0, [r6, #0x1c]
	cmp r0, #1
	bne _080E89B2
	ldr r0, [r6, #0x24]
	cmp r0, #0
	bne _080E89A8
	ldr r0, _080E89F4 @ =gUnk_09E4A4A8
	ldr r2, _080E8A08 @ =gUnk_09E4A514
	movs r1, #0xc2
	movs r3, #1
	bl OSi_Panic
_080E89A8:
	ldr r0, [r6, #0x20]
	ldr r1, [r6, #0xc]
	ldr r2, [r6, #0x24]
	bl _call_via_r2
_080E89B2:
	ldr r0, [r6, #0x18]
	cmp r0, #0
	bne _080E89D6
	ldr r0, _080E89F4 @ =gUnk_09E4A4A8
	ldr r2, _080E89FC @ =gUnk_09E4A4D0
	movs r1, #0x3f
	movs r3, #1
	bl OSi_Panic
	ldr r0, [r6, #0x18]
	cmp r0, #0
	bne _080E89D6
	ldr r0, _080E89F4 @ =gUnk_09E4A4A8
	ldr r2, _080E89FC @ =gUnk_09E4A4D0
	movs r1, #0x2d
	movs r3, #1
	bl OSi_Panic
_080E89D6:
	ldr r0, [r6, #0x14]
	cmp r0, #0
	bne _080E89E0
	ldr r0, [r6, #0x18]
	ldr r0, [r0, #8]
_080E89E0:
	movs r1, #0
	cmp r0, #2
	beq _080E89EA
	cmp r0, #4
	bne _080E89EC
_080E89EA:
	movs r1, #1
_080E89EC:
	cmp r1, #0
	bne _080E8A0C
	str r1, [r6, #8]
	b _080E8AE2
	.align 2, 0
_080E89F4: .4byte gUnk_09E4A4A8
_080E89F8: .4byte gUnk_09E4A49C
_080E89FC: .4byte gUnk_09E4A4D0
_080E8A00: .4byte gUnk_09E4A50C
_080E8A04: .4byte gUnk_09E4A4C4
_080E8A08: .4byte gUnk_09E4A514
_080E8A0C:
	adds r0, r6, #0
	bl NNS_G2dResetAnimCtrlState
	b _080E8AE2
_080E8A14:
	cmp r6, #0
	bne _080E8A34
	ldr r4, _080E8AC8 @ =gUnk_09E4A4A8
	ldr r5, _080E8ACC @ =gUnk_09E4A49C
	adds r0, r4, #0
	movs r1, #0xe6
	adds r2, r5, #0
	movs r3, #1
	bl OSi_Panic
	adds r0, r4, #0
	movs r1, #0xba
	adds r2, r5, #0
	movs r3, #1
	bl OSi_Panic
_080E8A34:
	ldr r0, [r6, #0x1c]
	cmp r0, #1
	bne _080E8A56
	ldr r0, [r6, #0x24]
	cmp r0, #0
	bne _080E8A4C
	ldr r0, _080E8AC8 @ =gUnk_09E4A4A8
	ldr r2, _080E8AD0 @ =gUnk_09E4A514
	movs r1, #0xc2
	movs r3, #1
	bl OSi_Panic
_080E8A4C:
	ldr r0, [r6, #0x20]
	ldr r1, [r6, #0xc]
	ldr r2, [r6, #0x24]
	bl _call_via_r2
_080E8A56:
	cmp r6, #0
	bne _080E8A66
	ldr r0, _080E8AC8 @ =gUnk_09E4A4A8
	ldr r2, _080E8ACC @ =gUnk_09E4A49C
	movs r1, #0x3e
	movs r3, #1
	bl OSi_Panic
_080E8A66:
	ldr r0, [r6, #0x18]
	cmp r0, #0
	bne _080E8A78
	ldr r0, _080E8AC8 @ =gUnk_09E4A4A8
	ldr r2, _080E8AD4 @ =gUnk_09E4A4D0
	movs r1, #0x3f
	movs r3, #1
	bl OSi_Panic
_080E8A78:
	cmp r6, #0
	bne _080E8A88
	ldr r0, _080E8AC8 @ =gUnk_09E4A4A8
	ldr r2, _080E8ACC @ =gUnk_09E4A49C
	movs r1, #0x2c
	movs r3, #1
	bl OSi_Panic
_080E8A88:
	ldr r0, [r6, #0x18]
	cmp r0, #0
	bne _080E8A9A
	ldr r0, _080E8AC8 @ =gUnk_09E4A4A8
	ldr r2, _080E8AD4 @ =gUnk_09E4A4D0
	movs r1, #0x2d
	movs r3, #1
	bl OSi_Panic
_080E8A9A:
	ldr r0, [r6, #0x14]
	cmp r0, #0
	bne _080E8AA4
	ldr r0, [r6, #0x18]
	ldr r0, [r0, #8]
_080E8AA4:
	movs r4, #0
	cmp r0, #2
	beq _080E8AAE
	cmp r0, #4
	bne _080E8AB0
_080E8AAE:
	movs r4, #1
_080E8AB0:
	cmp r4, #0
	bne _080E8ADC
	cmp r6, #0
	bne _080E8AC4
	ldr r0, _080E8AD8 @ =gUnk_09E4A474
	ldr r2, _080E8ACC @ =gUnk_09E4A49C
	movs r1, #0x9d
	movs r3, #1
	bl OSi_Panic
_080E8AC4:
	str r4, [r6, #8]
	b _080E8AE2
	.align 2, 0
_080E8AC8: .4byte gUnk_09E4A4A8
_080E8ACC: .4byte gUnk_09E4A49C
_080E8AD0: .4byte gUnk_09E4A514
_080E8AD4: .4byte gUnk_09E4A4D0
_080E8AD8: .4byte gUnk_09E4A474
_080E8ADC:
	adds r0, r6, #0
	bl NNS_G2dResetAnimCtrlState
_080E8AE2:
	ldr r4, [r6, #0x18]
	cmp r4, #0
	bne _080E8AF4
	ldr r0, _080E8B24 @ =gUnk_09E4A4A8
	ldr r2, _080E8B28 @ =gUnk_09E4A4C4
	movs r1, #0x13
	movs r3, #1
	bl OSi_Panic
_080E8AF4:
	ldrh r1, [r4]
	lsls r0, r1, #3
	ldr r1, [r4, #0xc]
	adds r1, r1, r0
	subs r1, #8
	ldr r0, [r6]
	cmp r0, r1
	bls _080E8B2C
	ldr r4, [r6, #0x18]
	cmp r4, #0
	bne _080E8B16
	ldr r0, _080E8B24 @ =gUnk_09E4A4A8
	ldr r2, _080E8B28 @ =gUnk_09E4A4C4
	movs r1, #0x13
	movs r3, #1
	bl OSi_Panic
_080E8B16:
	ldrh r0, [r4]
	lsls r1, r0, #3
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	subs r0, #8
	b _080E8B5A
	.align 2, 0
_080E8B24: .4byte gUnk_09E4A4A8
_080E8B28: .4byte gUnk_09E4A4C4
_080E8B2C:
	ldr r4, [r6, #0x18]
	cmp r4, #0
	bne _080E8B3E
	ldr r0, _080E8B64 @ =gUnk_09E4A4A8
	ldr r2, _080E8B68 @ =gUnk_09E4A4C4
	movs r1, #0xd
	movs r3, #1
	bl OSi_Panic
_080E8B3E:
	ldr r1, [r4, #0xc]
	ldr r0, [r6]
	cmp r0, r1
	bhs _080E8B5C
	ldr r4, [r6, #0x18]
	cmp r4, #0
	bne _080E8B58
	ldr r0, _080E8B64 @ =gUnk_09E4A4A8
	ldr r2, _080E8B68 @ =gUnk_09E4A4C4
	movs r1, #0xd
	movs r3, #1
	bl OSi_Panic
_080E8B58:
	ldr r0, [r4, #0xc]
_080E8B5A:
	str r0, [r6]
_080E8B5C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E8B64: .4byte gUnk_09E4A4A8
_080E8B68: .4byte gUnk_09E4A4C4

	thumb_func_start SetAnimCtrlCurrentFrameImpl_
SetAnimCtrlCurrentFrameImpl_: @ 0x080E8B6C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	adds r6, r5, #0
	cmp r4, #0
	bne _080E8B88
	ldr r0, _080E8BA8 @ =gUnk_09E4A4A8
	movs r1, #0x88
	lsls r1, r1, #1
	ldr r2, _080E8BAC @ =gUnk_09E4A49C
	movs r3, #1
	bl OSi_Panic
_080E8B88:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _080E8B9A
	ldr r0, _080E8BA8 @ =gUnk_09E4A4A8
	ldr r1, _080E8BB0 @ =0x00000111
	ldr r2, _080E8BB4 @ =gUnk_09E4A4D0
	movs r3, #1
	bl OSi_Panic
_080E8B9A:
	ldr r0, [r4, #0x18]
	ldrh r1, [r0]
	cmp r5, r1
	blo _080E8BB8
	movs r0, #0
	b _080E8BC2
	.align 2, 0
_080E8BA8: .4byte gUnk_09E4A4A8
_080E8BAC: .4byte gUnk_09E4A49C
_080E8BB0: .4byte 0x00000111
_080E8BB4: .4byte gUnk_09E4A4D0
_080E8BB8:
	lsls r1, r6, #3
	ldr r0, [r0, #0xc]
	adds r0, r0, r1
	str r0, [r4]
	movs r0, #1
_080E8BC2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start NNS_G2dGetAnimCtrlCurrentElement
NNS_G2dGetAnimCtrlCurrentElement: @ 0x080E8BC8
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080E8BDC
	ldr r0, _080E8C10 @ =gUnk_09E4A4A8
	ldr r1, _080E8C14 @ =0x0000012F
	ldr r2, _080E8C18 @ =gUnk_09E4A49C
	movs r3, #1
	bl OSi_Panic
_080E8BDC:
	ldr r0, [r4]
	cmp r0, #0
	bne _080E8BF0
	ldr r0, _080E8C10 @ =gUnk_09E4A4A8
	movs r1, #0x98
	lsls r1, r1, #1
	ldr r2, _080E8C1C @ =gUnk_09E4A4EC
	movs r3, #1
	bl OSi_Panic
_080E8BF0:
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	bne _080E8C04
	ldr r0, _080E8C10 @ =gUnk_09E4A4A8
	ldr r1, _080E8C20 @ =0x00000131
	ldr r2, _080E8C24 @ =gUnk_09E4A538
	movs r3, #1
	bl OSi_Panic
_080E8C04:
	ldr r0, [r4]
	ldr r0, [r0]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E8C10: .4byte gUnk_09E4A4A8
_080E8C14: .4byte 0x0000012F
_080E8C18: .4byte gUnk_09E4A49C
_080E8C1C: .4byte gUnk_09E4A4EC
_080E8C20: .4byte 0x00000131
_080E8C24: .4byte gUnk_09E4A538

	thumb_func_start NNS_G2dGetAnimCtrlNextElement
NNS_G2dGetAnimCtrlNextElement: @ 0x080E8C28
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	cmp r6, #0
	bne _080E8C3E
	ldr r0, _080E8C64 @ =gUnk_09E4A4A8
	movs r1, #0x9c
	lsls r1, r1, #1
	ldr r2, _080E8C68 @ =gUnk_09E4A49C
	movs r3, #1
	bl OSi_Panic
_080E8C3E:
	cmp r6, #0
	bne _080E8C4E
	ldr r0, _080E8C64 @ =gUnk_09E4A4A8
	ldr r2, _080E8C68 @ =gUnk_09E4A49C
	movs r1, #0x5c
	movs r3, #1
	bl OSi_Panic
_080E8C4E:
	ldr r0, [r6, #0x10]
	cmp r0, #0
	ble _080E8C6C
	ldr r0, [r6, #4]
	movs r1, #1
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	b _080E8C74
	.align 2, 0
_080E8C64: .4byte gUnk_09E4A4A8
_080E8C68: .4byte gUnk_09E4A49C
_080E8C6C:
	ldr r1, [r6, #4]
	cmp r1, #0
	beq _080E8C74
	movs r1, #1
_080E8C74:
	cmp r1, #0
	beq _080E8C80
	ldr r0, [r6]
	adds r5, r0, #0
	adds r5, #8
	b _080E8C86
_080E8C80:
	ldr r0, [r6]
	adds r5, r0, #0
	subs r5, #8
_080E8C86:
	ldr r4, [r6, #0x18]
	cmp r4, #0
	bne _080E8C98
	ldr r0, _080E8CC8 @ =gUnk_09E4A4A8
	ldr r2, _080E8CCC @ =gUnk_09E4A4C4
	movs r1, #0x13
	movs r3, #1
	bl OSi_Panic
_080E8C98:
	ldrh r0, [r4]
	lsls r1, r0, #3
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	subs r0, #8
	cmp r5, r0
	bls _080E8CD0
	ldr r4, [r6, #0x18]
	cmp r4, #0
	bne _080E8CB8
	ldr r0, _080E8CC8 @ =gUnk_09E4A4A8
	ldr r2, _080E8CCC @ =gUnk_09E4A4C4
	movs r1, #0x13
	movs r3, #1
	bl OSi_Panic
_080E8CB8:
	ldrh r0, [r4]
	lsls r1, r0, #3
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	adds r5, r0, #0
	subs r5, #8
	b _080E8CFC
	.align 2, 0
_080E8CC8: .4byte gUnk_09E4A4A8
_080E8CCC: .4byte gUnk_09E4A4C4
_080E8CD0:
	ldr r4, [r6, #0x18]
	cmp r4, #0
	bne _080E8CE2
	ldr r0, _080E8D18 @ =gUnk_09E4A4A8
	ldr r2, _080E8D1C @ =gUnk_09E4A4C4
	movs r1, #0xd
	movs r3, #1
	bl OSi_Panic
_080E8CE2:
	ldr r0, [r4, #0xc]
	cmp r5, r0
	bhs _080E8CFC
	ldr r4, [r6, #0x18]
	cmp r4, #0
	bne _080E8CFA
	ldr r0, _080E8D18 @ =gUnk_09E4A4A8
	ldr r2, _080E8D1C @ =gUnk_09E4A4C4
	movs r1, #0xd
	movs r3, #1
	bl OSi_Panic
_080E8CFA:
	ldr r5, [r4, #0xc]
_080E8CFC:
	ldr r0, [r5]
	cmp r0, #0
	bne _080E8D10
	ldr r0, _080E8D18 @ =gUnk_09E4A4A8
	movs r1, #0xa2
	lsls r1, r1, #1
	ldr r2, _080E8D20 @ =gUnk_09E4A560
	movs r3, #1
	bl OSi_Panic
_080E8D10:
	ldr r0, [r5]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080E8D18: .4byte gUnk_09E4A4A8
_080E8D1C: .4byte gUnk_09E4A4C4
_080E8D20: .4byte gUnk_09E4A560

	thumb_func_start NNS_G2dGetAnimCtrlNormalizedTime
NNS_G2dGetAnimCtrlNormalizedTime: @ 0x080E8D24
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080E8D38
	ldr r0, _080E8D60 @ =gUnk_09E4A4A8
	ldr r1, _080E8D64 @ =0x00000157
	ldr r2, _080E8D68 @ =gUnk_09E4A49C
	movs r3, #1
	bl OSi_Panic
_080E8D38:
	ldr r0, [r4]
	cmp r0, #0
	bne _080E8D4C
	ldr r0, _080E8D60 @ =gUnk_09E4A4A8
	movs r1, #0xac
	lsls r1, r1, #1
	ldr r2, _080E8D6C @ =gUnk_09E4A4EC
	movs r3, #1
	bl OSi_Panic
_080E8D4C:
	ldr r0, [r4, #0xc]
	lsls r0, r0, #0xc
	ldr r1, [r4]
	ldrh r1, [r1, #4]
	lsls r1, r1, #0xc
	bl Div
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E8D60: .4byte gUnk_09E4A4A8
_080E8D64: .4byte 0x00000157
_080E8D68: .4byte gUnk_09E4A49C
_080E8D6C: .4byte gUnk_09E4A4EC

	thumb_func_start NNS_G2dTickAnimCtrl
NNS_G2dTickAnimCtrl: @ 0x080E8D70
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r7, #0
	cmp r5, #0
	bne _080E8D88
	ldr r0, _080E8DB8 @ =gUnk_09E4A4A8
	ldr r1, _080E8DBC @ =0x0000016D
	ldr r2, _080E8DC0 @ =gUnk_09E4A49C
	movs r3, #1
	bl OSi_Panic
_080E8D88:
	ldr r0, [r5]
	cmp r0, #0
	bne _080E8D9C
	ldr r0, _080E8DB8 @ =gUnk_09E4A4A8
	movs r1, #0xb7
	lsls r1, r1, #1
	ldr r2, _080E8DC4 @ =gUnk_09E4A4EC
	movs r3, #1
	bl OSi_Panic
_080E8D9C:
	cmp r4, #0
	bge _080E8DAC
	ldr r0, _080E8DB8 @ =gUnk_09E4A4A8
	ldr r1, _080E8DC8 @ =0x0000016F
	ldr r2, _080E8DCC @ =gUnk_09E4A570
	movs r3, #1
	bl OSi_Panic
_080E8DAC:
	ldr r0, [r5, #8]
	cmp r0, #1
	beq _080E8DD0
	movs r0, #0
	b _080E8F78
	.align 2, 0
_080E8DB8: .4byte gUnk_09E4A4A8
_080E8DBC: .4byte 0x0000016D
_080E8DC0: .4byte gUnk_09E4A49C
_080E8DC4: .4byte gUnk_09E4A4EC
_080E8DC8: .4byte 0x0000016F
_080E8DCC: .4byte gUnk_09E4A570
_080E8DD0:
	ldr r2, [r5, #0x10]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r3, _080E8E04 @ =0x00000000
	ldr r2, _080E8E00 @ =0x00000800
	adds r0, r0, r2
	adcs r1, r3
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	adds r2, r0, #0
	cmp r0, #0
	bge _080E8DF6
	rsbs r2, r2, #0
_080E8DF6:
	ldr r0, [r5, #0xc]
	adds r0, r0, r2
	str r0, [r5, #0xc]
	b _080E8F48
	.align 2, 0
_080E8E00: .4byte 0x00000800
_080E8E04: .4byte 0x00000000
_080E8E08:
	movs r7, #1
	ldr r0, [r5]
	ldrh r0, [r0, #4]
	lsls r1, r0, #0xc
	ldr r0, [r5, #0xc]
	subs r0, r0, r1
	str r0, [r5, #0xc]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	ble _080E8E28
	ldr r1, [r5, #4]
	eors r1, r7
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _080E8E30
_080E8E28:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _080E8E30
	movs r0, #1
_080E8E30:
	cmp r0, #0
	beq _080E8E3A
	ldr r0, [r5]
	adds r0, #8
	b _080E8E3E
_080E8E3A:
	ldr r0, [r5]
	subs r0, #8
_080E8E3E:
	str r0, [r5]
	ldr r6, [r5]
	cmp r6, #0
	bne _080E8E52
	ldr r0, _080E8E68 @ =gUnk_09E4A4A8
	movs r1, #0x9b
	ldr r2, _080E8E6C @ =gUnk_09E4A50C
	movs r3, #1
	bl OSi_Panic
_080E8E52:
	ldr r0, [r5, #0x10]
	cmp r0, #0
	ble _080E8E70
	ldr r1, [r5, #4]
	movs r0, #1
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _080E8E78
	.align 2, 0
_080E8E68: .4byte gUnk_09E4A4A8
_080E8E6C: .4byte gUnk_09E4A50C
_080E8E70:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _080E8E78
	movs r0, #1
_080E8E78:
	cmp r0, #0
	beq _080E8EA8
	ldr r4, [r5, #0x18]
	cmp r4, #0
	bne _080E8E8E
	ldr r0, _080E8EA0 @ =gUnk_09E4A4A8
	movs r1, #0x13
	ldr r2, _080E8EA4 @ =gUnk_09E4A4C4
	movs r3, #1
	bl OSi_Panic
_080E8E8E:
	ldrh r0, [r4]
	lsls r1, r0, #3
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	movs r1, #0
	cmp r6, r0
	blo _080E8EDC
	b _080E8EDA
	.align 2, 0
_080E8EA0: .4byte gUnk_09E4A4A8
_080E8EA4: .4byte gUnk_09E4A4C4
_080E8EA8:
	cmp r6, #0
	bne _080E8EB8
	ldr r0, _080E8F1C @ =gUnk_09E4A4A8
	movs r1, #0x92
	ldr r2, _080E8F20 @ =gUnk_09E4A50C
	movs r3, #1
	bl OSi_Panic
_080E8EB8:
	ldr r4, [r5, #0x18]
	cmp r4, #0
	bne _080E8ECA
	ldr r0, _080E8F1C @ =gUnk_09E4A4A8
	movs r1, #0x19
	ldr r2, _080E8F24 @ =gUnk_09E4A4C4
	movs r3, #1
	bl OSi_Panic
_080E8ECA:
	ldrh r0, [r4, #2]
	lsls r1, r0, #3
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	movs r1, #0
	subs r0, #8
	cmp r6, r0
	bhi _080E8EDC
_080E8EDA:
	movs r1, #1
_080E8EDC:
	adds r0, r1, #0
	cmp r0, #0
	beq _080E8EE8
	adds r0, r5, #0
	bl SequenceEdgeHandle_
_080E8EE8:
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _080E8F48
	ldr r0, [r5, #0x18]
	ldr r1, [r5]
	ldr r0, [r0, #0xc]
	subs r1, r1, r0
	lsls r1, r1, #0xd
	lsrs r6, r1, #0x10
	adds r4, r5, #0
	adds r4, #0x1c
	cmp r4, #0
	bne _080E8F0E
	ldr r0, _080E8F1C @ =gUnk_09E4A4A8
	movs r1, #0x75
	ldr r2, _080E8F28 @ =gUnk_09E4A500
	movs r3, #1
	bl OSi_Panic
_080E8F0E:
	ldr r0, [r5, #0x1c]
	cmp r0, #2
	beq _080E8F2C
	cmp r0, #3
	beq _080E8F3E
	b _080E8F48
	.align 2, 0
_080E8F1C: .4byte gUnk_09E4A4A8
_080E8F20: .4byte gUnk_09E4A50C
_080E8F24: .4byte gUnk_09E4A4C4
_080E8F28: .4byte gUnk_09E4A500
_080E8F2C:
	ldrh r0, [r4, #0xc]
	cmp r6, r0
	bne _080E8F48
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	adds r1, r6, #0
	bl _call_via_r2
	b _080E8F48
_080E8F3E:
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	adds r1, r6, #0
	bl _call_via_r2
_080E8F48:
	ldr r0, [r5]
	cmp r0, #0
	bne _080E8F5A
	ldr r0, _080E8F80 @ =gUnk_09E4A4A8
	movs r1, #0x67
	ldr r2, _080E8F84 @ =gUnk_09E4A4EC
	movs r3, #1
	bl OSi_Panic
_080E8F5A:
	ldr r0, [r5, #8]
	movs r2, #0
	cmp r0, #0
	beq _080E8F70
	ldr r0, [r5]
	ldrh r0, [r0, #4]
	lsls r1, r0, #0xc
	ldr r0, [r5, #0xc]
	cmp r0, r1
	blt _080E8F70
	movs r2, #1
_080E8F70:
	cmp r2, #0
	beq _080E8F76
	b _080E8E08
_080E8F76:
	adds r0, r7, #0
_080E8F78:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E8F80: .4byte gUnk_09E4A4A8
_080E8F84: .4byte gUnk_09E4A4EC

	thumb_func_start NNS_G2dSetAnimCtrlCurrentFrame
NNS_G2dSetAnimCtrlCurrentFrame: @ 0x080E8F88
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r4, #0
	bne _080E8FA0
	ldr r0, _080E8FD0 @ =gUnk_09E4A4A8
	ldr r1, _080E8FD4 @ =0x000001A9
	ldr r2, _080E8FD8 @ =gUnk_09E4A49C
	movs r3, #1
	bl OSi_Panic
_080E8FA0:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _080E8FB4
	ldr r0, _080E8FD0 @ =gUnk_09E4A4A8
	movs r1, #0xd5
	lsls r1, r1, #1
	ldr r2, _080E8FDC @ =gUnk_09E4A4D0
	movs r3, #1
	bl OSi_Panic
_080E8FB4:
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetAnimCtrlCurrentFrameImpl_
	adds r1, r0, #0
	cmp r1, #0
	beq _080E8FC6
	movs r0, #0
	str r0, [r4, #0xc]
_080E8FC6:
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080E8FD0: .4byte gUnk_09E4A4A8
_080E8FD4: .4byte 0x000001A9
_080E8FD8: .4byte gUnk_09E4A49C
_080E8FDC: .4byte gUnk_09E4A4D0

	thumb_func_start NNS_G2dSetAnimCtrlCurrentFrameNoResetCurrentTime
NNS_G2dSetAnimCtrlCurrentFrameNoResetCurrentTime: @ 0x080E8FE0
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r4, #0
	bne _080E8FF8
	ldr r0, _080E901C @ =gUnk_09E4A4A8
	ldr r1, _080E9020 @ =0x000001CF
	ldr r2, _080E9024 @ =gUnk_09E4A49C
	movs r3, #1
	bl OSi_Panic
_080E8FF8:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _080E900C
	ldr r0, _080E901C @ =gUnk_09E4A4A8
	movs r1, #0xe8
	lsls r1, r1, #1
	ldr r2, _080E9028 @ =gUnk_09E4A4D0
	movs r3, #1
	bl OSi_Panic
_080E900C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl SetAnimCtrlCurrentFrameImpl_
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080E901C: .4byte gUnk_09E4A4A8
_080E9020: .4byte 0x000001CF
_080E9024: .4byte gUnk_09E4A49C
_080E9028: .4byte gUnk_09E4A4D0

	thumb_func_start NNS_G2dGetAnimCtrlCurrentFrame
NNS_G2dGetAnimCtrlCurrentFrame: @ 0x080E902C
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080E9040
	ldr r0, _080E9054 @ =gUnk_09E4A4A8
	ldr r2, _080E9058 @ =gUnk_09E4A49C
	movs r1, #0x21
	movs r3, #1
	bl OSi_Panic
_080E9040:
	ldr r1, [r4, #0x18]
	ldr r0, [r4]
	ldr r1, [r1, #0xc]
	subs r0, r0, r1
	lsls r0, r0, #0xd
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E9054: .4byte gUnk_09E4A4A8
_080E9058: .4byte gUnk_09E4A49C

	thumb_func_start NNS_G2dInitAnimCtrl
NNS_G2dInitAnimCtrl: @ 0x080E905C
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080E9070
	ldr r0, _080E9094 @ =gUnk_09E4A4A8
	ldr r1, _080E9098 @ =0x000001F7
	ldr r2, _080E909C @ =gUnk_09E4A49C
	movs r3, #1
	bl OSi_Panic
_080E9070:
	adds r0, r4, #0
	adds r0, #0x1c
	bl NNS_G2dInitAnimCallBackFunctor
	movs r1, #0
	str r1, [r4]
	str r1, [r4, #4]
	movs r0, #1
	str r0, [r4, #8]
	str r1, [r4, #0xc]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [r4, #0x10]
	str r1, [r4, #0x14]
	str r1, [r4, #0x18]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E9094: .4byte gUnk_09E4A4A8
_080E9098: .4byte 0x000001F7
_080E909C: .4byte gUnk_09E4A49C

	thumb_func_start NNS_G2dInitAnimCtrlCallBackFunctor
NNS_G2dInitAnimCtrlCallBackFunctor: @ 0x080E90A0
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080E90B6
	ldr r0, _080E90C4 @ =gUnk_09E4A4A8
	movs r1, #0x85
	lsls r1, r1, #2
	ldr r2, _080E90C8 @ =gUnk_09E4A49C
	movs r3, #1
	bl OSi_Panic
_080E90B6:
	adds r0, r4, #0
	adds r0, #0x1c
	bl NNS_G2dInitAnimCallBackFunctor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E90C4: .4byte gUnk_09E4A4A8
_080E90C8: .4byte gUnk_09E4A49C

	thumb_func_start NNS_G2dInitAnimCallBackFunctor
NNS_G2dInitAnimCallBackFunctor: @ 0x080E90CC
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080E90E0
	ldr r0, _080E90F0 @ =gUnk_09E4A4A8
	ldr r1, _080E90F4 @ =0x00000225
	ldr r2, _080E90F8 @ =gUnk_09E4A57C
	movs r3, #1
	bl OSi_Panic
_080E90E0:
	movs r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	str r0, [r4, #8]
	strh r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080E90F0: .4byte gUnk_09E4A4A8
_080E90F4: .4byte 0x00000225
_080E90F8: .4byte gUnk_09E4A57C

	thumb_func_start NNS_G2dResetAnimCtrlState
NNS_G2dResetAnimCtrlState: @ 0x080E90FC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	cmp r6, #0
	bne _080E9120
	ldr r4, _080E9134 @ =gUnk_09E4A4A8
	ldr r1, _080E9138 @ =0x0000023B
	ldr r5, _080E913C @ =gUnk_09E4A49C
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #1
	bl OSi_Panic
	adds r0, r4, #0
	movs r1, #0x5c
	adds r2, r5, #0
	movs r3, #1
	bl OSi_Panic
_080E9120:
	ldr r0, [r6, #0x10]
	cmp r0, #0
	ble _080E9140
	ldr r0, [r6, #4]
	movs r1, #1
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	b _080E9148
	.align 2, 0
_080E9134: .4byte gUnk_09E4A4A8
_080E9138: .4byte 0x0000023B
_080E913C: .4byte gUnk_09E4A49C
_080E9140:
	ldr r1, [r6, #4]
	cmp r1, #0
	beq _080E9148
	movs r1, #1
_080E9148:
	cmp r1, #0
	beq _080E9170
	ldr r4, [r6, #0x18]
	cmp r4, #0
	bne _080E915E
	ldr r0, _080E9168 @ =gUnk_09E4A4A8
	ldr r2, _080E916C @ =gUnk_09E4A4C4
	movs r1, #0x19
	movs r3, #1
	bl OSi_Panic
_080E915E:
	ldrh r0, [r4, #2]
	lsls r1, r0, #3
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	b _080E918C
	.align 2, 0
_080E9168: .4byte gUnk_09E4A4A8
_080E916C: .4byte gUnk_09E4A4C4
_080E9170:
	ldr r4, [r6, #0x18]
	cmp r4, #0
	bne _080E9182
	ldr r0, _080E91A0 @ =gUnk_09E4A4A8
	ldr r2, _080E91A4 @ =gUnk_09E4A4C4
	movs r1, #0x13
	movs r3, #1
	bl OSi_Panic
_080E9182:
	ldrh r0, [r4]
	lsls r1, r0, #3
	ldr r0, [r4, #0xc]
	adds r0, r0, r1
	subs r0, #8
_080E918C:
	str r0, [r6]
	movs r0, #0
	str r0, [r6, #0xc]
	adds r0, r6, #0
	movs r1, #0
	bl NNS_G2dTickAnimCtrl
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E91A0: .4byte gUnk_09E4A4A8
_080E91A4: .4byte gUnk_09E4A4C4

	thumb_func_start NNS_G2dBindAnimCtrl
NNS_G2dBindAnimCtrl: @ 0x080E91A8
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080E91C0
	ldr r0, _080E91E0 @ =gUnk_09E4A4A8
	movs r1, #0x98
	lsls r1, r1, #2
	ldr r2, _080E91E4 @ =gUnk_09E4A49C
	movs r3, #1
	bl OSi_Panic
_080E91C0:
	cmp r5, #0
	bne _080E91D0
	ldr r0, _080E91E0 @ =gUnk_09E4A4A8
	ldr r1, _080E91E8 @ =0x00000261
	ldr r2, _080E91EC @ =gUnk_09E4A588
	movs r3, #1
	bl OSi_Panic
_080E91D0:
	str r5, [r4, #0x18]
	adds r0, r4, #0
	bl NNS_G2dResetAnimCtrlState
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E91E0: .4byte gUnk_09E4A4A8
_080E91E4: .4byte gUnk_09E4A49C
_080E91E8: .4byte 0x00000261
_080E91EC: .4byte gUnk_09E4A588

	thumb_func_start NNS_G2dSetAnimCtrlCallBackFunctor
NNS_G2dSetAnimCtrlCallBackFunctor: @ 0x080E91F0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	adds r5, r3, #0
	cmp r4, #0
	bne _080E920A
	ldr r0, _080E923C @ =gUnk_09E4A4A8
	ldr r1, _080E9240 @ =0x0000027F
	ldr r2, _080E9244 @ =gUnk_09E4A49C
	movs r3, #1
	bl OSi_Panic
_080E920A:
	cmp r5, #0
	bne _080E921C
	ldr r0, _080E923C @ =gUnk_09E4A4A8
	movs r1, #0xa0
	lsls r1, r1, #2
	ldr r2, _080E9248 @ =gUnk_09E4A598
	movs r3, #1
	bl OSi_Panic
_080E921C:
	cmp r6, #2
	bne _080E922C
	ldr r0, _080E923C @ =gUnk_09E4A4A8
	ldr r1, _080E924C @ =0x00000283
	ldr r2, _080E9250 @ =gUnk_09E4A5A8
	movs r3, #1
	bl OSi_Panic
_080E922C:
	str r5, [r4, #0x24]
	str r7, [r4, #0x20]
	str r6, [r4, #0x1c]
	movs r0, #0
	strh r0, [r4, #0x28]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E923C: .4byte gUnk_09E4A4A8
_080E9240: .4byte 0x0000027F
_080E9244: .4byte gUnk_09E4A49C
_080E9248: .4byte gUnk_09E4A598
_080E924C: .4byte 0x00000283
_080E9250: .4byte gUnk_09E4A5A8

	thumb_func_start NNS_G2dSetAnimCtrlCallBackFunctorAtAnimFrame
NNS_G2dSetAnimCtrlCallBackFunctorAtAnimFrame: @ 0x080E9254
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	lsls r3, r3, #0x10
	lsrs r6, r3, #0x10
	cmp r4, #0
	bne _080E9270
	ldr r0, _080E9290 @ =gUnk_09E4A4A8
	ldr r1, _080E9294 @ =0x000002A2
	ldr r2, _080E9298 @ =gUnk_09E4A49C
	movs r3, #1
	bl OSi_Panic
_080E9270:
	cmp r5, #0
	bne _080E9280
	ldr r0, _080E9290 @ =gUnk_09E4A4A8
	ldr r1, _080E929C @ =0x000002A3
	ldr r2, _080E92A0 @ =gUnk_09E4A598
	movs r3, #1
	bl OSi_Panic
_080E9280:
	movs r0, #2
	str r0, [r4, #0x1c]
	str r5, [r4, #0x24]
	str r7, [r4, #0x20]
	strh r6, [r4, #0x28]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080E9290: .4byte gUnk_09E4A4A8
_080E9294: .4byte 0x000002A2
_080E9298: .4byte gUnk_09E4A49C
_080E929C: .4byte 0x000002A3
_080E92A0: .4byte gUnk_09E4A598

	thumb_func_start NNSi_G2dIsAnimCtrlLoopAnim
NNSi_G2dIsAnimCtrlLoopAnim: @ 0x080E92A4
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _080E92B8
	ldr r0, _080E9330 @ =gUnk_09E4A4A8
	ldr r1, _080E9334 @ =0x000002BB
	ldr r2, _080E9338 @ =gUnk_09E4A49C
	movs r3, #1
	bl OSi_Panic
_080E92B8:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _080E92CC
	ldr r0, _080E9330 @ =gUnk_09E4A4A8
	movs r1, #0xaf
	lsls r1, r1, #2
	ldr r2, _080E933C @ =gUnk_09E4A4D0
	movs r3, #1
	bl OSi_Panic
_080E92CC:
	cmp r4, #0
	bne _080E92DC
	ldr r0, _080E9330 @ =gUnk_09E4A4A8
	ldr r2, _080E9338 @ =gUnk_09E4A49C
	movs r1, #0x3e
	movs r3, #1
	bl OSi_Panic
_080E92DC:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _080E92EE
	ldr r0, _080E9330 @ =gUnk_09E4A4A8
	ldr r2, _080E933C @ =gUnk_09E4A4D0
	movs r1, #0x3f
	movs r3, #1
	bl OSi_Panic
_080E92EE:
	cmp r4, #0
	bne _080E92FE
	ldr r0, _080E9330 @ =gUnk_09E4A4A8
	ldr r2, _080E9338 @ =gUnk_09E4A49C
	movs r1, #0x2c
	movs r3, #1
	bl OSi_Panic
_080E92FE:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _080E9310
	ldr r0, _080E9330 @ =gUnk_09E4A4A8
	ldr r2, _080E933C @ =gUnk_09E4A4D0
	movs r1, #0x2d
	movs r3, #1
	bl OSi_Panic
_080E9310:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _080E931A
	ldr r0, [r4, #0x18]
	ldr r0, [r0, #8]
_080E931A:
	movs r1, #0
	cmp r0, #2
	beq _080E9324
	cmp r0, #4
	bne _080E9326
_080E9324:
	movs r1, #1
_080E9326:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080E9330: .4byte gUnk_09E4A4A8
_080E9334: .4byte 0x000002BB
_080E9338: .4byte gUnk_09E4A49C
_080E933C: .4byte gUnk_09E4A4D0

	thumb_func_start sub_080E9340
sub_080E9340: @ 0x080E9340
	adds r1, r0, #0
	adds r1, #3
	movs r0, #0x80
	lsls r0, r0, #9
	lsls r0, r1
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
