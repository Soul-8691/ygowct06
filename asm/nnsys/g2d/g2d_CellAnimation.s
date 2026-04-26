	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ApplyCurrentAnimResult_
ApplyCurrentAnimResult_: @ 0x080E9350
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	cmp r5, #0
	bne _080E9364
	ldr r0, _080E93C8 @ =gUnk_09E4AE60
	ldr r2, _080E93CC @ =gUnk_09E4AD64
	movs r1, #0x16
	movs r3, #1
	bl OSi_Panic
_080E9364:
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bne _080E9376
	ldr r0, _080E93C8 @ =gUnk_09E4AE60
	ldr r2, _080E93D0 @ =gUnk_09E4AE80
	movs r1, #0x17
	movs r3, #1
	bl OSi_Panic
_080E9376:
	ldr r0, [r5]
	ldrh r0, [r0, #4]
	cmp r0, #0
	beq _080E93F8
	adds r0, r5, #0
	bl NNS_G2dGetAnimCtrlCurrentElement
	adds r4, r0, #0
	ldr r0, [r5, #0x30]
	ldrh r1, [r4]
	bl NNS_G2dGetCellDataByIdx
	str r0, [r5, #0x2c]
	cmp r0, #0
	bne _080E93A0
	ldr r0, _080E93C8 @ =gUnk_09E4AE60
	ldr r2, _080E93D4 @ =gUnk_09E4AE9C
	movs r1, #0x2b
	movs r3, #1
	bl OSi_Panic
_080E93A0:
	ldr r0, [r5, #0x18]
	ldrb r6, [r0, #4]
	adds r5, #0x38
	adds r0, r5, #0
	movs r1, #1
	bl NNSi_G2dSrtcInitControl
	cmp r6, #0
	beq _080E93F8
	cmp r6, #2
	bne _080E93D8
	movs r0, #4
	ldrsh r1, [r4, r0]
	movs r0, #6
	ldrsh r2, [r4, r0]
	adds r0, r5, #0
	bl NNSi_G2dSrtcSetTrans
	b _080E93F8
	.align 2, 0
_080E93C8: .4byte gUnk_09E4AE60
_080E93CC: .4byte gUnk_09E4AD64
_080E93D0: .4byte gUnk_09E4AE80
_080E93D4: .4byte gUnk_09E4AE9C
_080E93D8:
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	adds r0, r5, #0
	bl NNSi_G2dSrtcSetSRTScale
	ldrh r1, [r4, #2]
	adds r0, r5, #0
	bl NNSi_G2dSrtcSetSRTRotZ
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #0xe
	ldrsh r2, [r4, r0]
	adds r0, r5, #0
	bl NNSi_G2dSrtcSetTrans
_080E93F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start NNS_G2dInitCellAnimation
NNS_G2dInitCellAnimation: @ 0x080E9400
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	cmp r4, #0
	bne _080E9418
	ldr r0, _080E9490 @ =gUnk_09E4AE60
	ldr r2, _080E9494 @ =gUnk_09E4AD64
	movs r1, #0x87
	movs r3, #1
	bl OSi_Panic
_080E9418:
	cmp r6, #0
	bne _080E9428
	ldr r0, _080E9490 @ =gUnk_09E4AE60
	ldr r2, _080E9498 @ =gUnk_09E4AEB4
	movs r1, #0x88
	movs r3, #1
	bl OSi_Panic
_080E9428:
	cmp r5, #0
	bne _080E9438
	ldr r0, _080E9490 @ =gUnk_09E4AE60
	ldr r2, _080E949C @ =gUnk_09E4AEC0
	movs r1, #0x89
	movs r3, #1
	bl OSi_Panic
_080E9438:
	cmp r4, #0
	bne _080E9448
	ldr r0, _080E9490 @ =gUnk_09E4AE60
	ldr r2, _080E9494 @ =gUnk_09E4AD64
	movs r1, #0x64
	movs r3, #1
	bl OSi_Panic
_080E9448:
	cmp r6, #0
	bne _080E9458
	ldr r0, _080E9490 @ =gUnk_09E4AE60
	ldr r2, _080E9498 @ =gUnk_09E4AEB4
	movs r1, #0x65
	movs r3, #1
	bl OSi_Panic
_080E9458:
	cmp r5, #0
	bne _080E9468
	ldr r0, _080E9490 @ =gUnk_09E4AE60
	ldr r2, _080E949C @ =gUnk_09E4AEC0
	movs r1, #0x66
	movs r3, #1
	bl OSi_Panic
_080E9468:
	str r5, [r4, #0x30]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #1
	bl NNSi_G2dSrtcInitControl
	adds r0, r4, #0
	bl NNS_G2dInitAnimCtrl
	adds r0, r4, #0
	adds r1, r6, #0
	bl NNS_G2dSetCellAnimationSequence
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080E9490: .4byte gUnk_09E4AE60
_080E9494: .4byte gUnk_09E4AD64
_080E9498: .4byte gUnk_09E4AEB4
_080E949C: .4byte gUnk_09E4AEC0

	thumb_func_start NNS_G2dInitCellAnimationVramTransfered
NNS_G2dInitCellAnimationVramTransfered: @ 0x080E94A0
	bx lr
	.align 2, 0

	thumb_func_start NNS_G2dSetCellAnimationSequence
NNS_G2dSetCellAnimationSequence: @ 0x080E94A4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	bne _080E94BA
	ldr r0, _080E94F0 @ =gUnk_09E4AE60
	ldr r2, _080E94F4 @ =gUnk_09E4AD64
	movs r1, #0xe5
	movs r3, #1
	bl OSi_Panic
_080E94BA:
	cmp r4, #0
	bne _080E94CA
	ldr r0, _080E94F0 @ =gUnk_09E4AE60
	ldr r2, _080E94F8 @ =gUnk_09E4AEB4
	movs r1, #0xe6
	movs r3, #1
	bl OSi_Panic
_080E94CA:
	ldrh r0, [r4, #6]
	cmp r0, #1
	beq _080E94DC
	ldr r0, _080E94F0 @ =gUnk_09E4AE60
	ldr r2, _080E94FC @ =gUnk_09E4AED0
	movs r1, #0xe8
	movs r3, #1
	bl OSi_Panic
_080E94DC:
	adds r0, r5, #0
	adds r1, r4, #0
	bl NNS_G2dBindAnimCtrl
	adds r0, r5, #0
	bl ApplyCurrentAnimResult_
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E94F0: .4byte gUnk_09E4AE60
_080E94F4: .4byte gUnk_09E4AD64
_080E94F8: .4byte gUnk_09E4AEB4
_080E94FC: .4byte gUnk_09E4AED0

	thumb_func_start NNS_G2dSetCellAnimationSequenceNoReset
NNS_G2dSetCellAnimationSequenceNoReset: @ 0x080E9500
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080E9518
	ldr r0, _080E9564 @ =gUnk_09E4AE60
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, _080E9568 @ =gUnk_09E4AD64
	movs r3, #1
	bl OSi_Panic
_080E9518:
	cmp r5, #0
	bne _080E9528
	ldr r0, _080E9564 @ =gUnk_09E4AE60
	ldr r1, _080E956C @ =0x00000101
	ldr r2, _080E9570 @ =gUnk_09E4AEB4
	movs r3, #1
	bl OSi_Panic
_080E9528:
	ldrh r0, [r5, #6]
	cmp r0, #1
	beq _080E953A
	ldr r0, _080E9564 @ =gUnk_09E4AE60
	ldr r1, _080E9574 @ =0x00000103
	ldr r2, _080E9578 @ =gUnk_09E4AED0
	movs r3, #1
	bl OSi_Panic
_080E953A:
	adds r0, r4, #0
	bl NNS_G2dGetAnimCtrlCurrentFrame
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r5, [r4, #0x18]
	adds r0, r4, #0
	bl NNS_G2dSetAnimCtrlCurrentFrameNoResetCurrentTime
	cmp r0, #0
	bne _080E9558
	adds r0, r4, #0
	bl NNS_G2dResetAnimCtrlState
_080E9558:
	adds r0, r4, #0
	bl ApplyCurrentAnimResult_
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E9564: .4byte gUnk_09E4AE60
_080E9568: .4byte gUnk_09E4AD64
_080E956C: .4byte 0x00000101
_080E9570: .4byte gUnk_09E4AEB4
_080E9574: .4byte 0x00000103
_080E9578: .4byte gUnk_09E4AED0

	thumb_func_start NNS_G2dTickCellAnimation
NNS_G2dTickCellAnimation: @ 0x080E957C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080E9594
	ldr r0, _080E95D4 @ =gUnk_09E4AE60
	movs r1, #0x91
	lsls r1, r1, #1
	ldr r2, _080E95D8 @ =gUnk_09E4AD64
	movs r3, #1
	bl OSi_Panic
_080E9594:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _080E95A6
	ldr r0, _080E95D4 @ =gUnk_09E4AE60
	ldr r1, _080E95DC @ =0x00000123
	ldr r2, _080E95E0 @ =gUnk_09E4AF1C
	movs r3, #1
	bl OSi_Panic
_080E95A6:
	ldr r0, [r4, #0x18]
	ldrh r0, [r0, #6]
	cmp r0, #1
	beq _080E95BA
	ldr r0, _080E95D4 @ =gUnk_09E4AE60
	ldr r1, _080E95E4 @ =0x00000125
	ldr r2, _080E95E8 @ =gUnk_09E4AF40
	movs r3, #1
	bl OSi_Panic
_080E95BA:
	adds r0, r4, #0
	adds r1, r5, #0
	bl NNS_G2dTickAnimCtrl
	cmp r0, #0
	beq _080E95CC
	adds r0, r4, #0
	bl ApplyCurrentAnimResult_
_080E95CC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E95D4: .4byte gUnk_09E4AE60
_080E95D8: .4byte gUnk_09E4AD64
_080E95DC: .4byte 0x00000123
_080E95E0: .4byte gUnk_09E4AF1C
_080E95E4: .4byte 0x00000125
_080E95E8: .4byte gUnk_09E4AF40

	thumb_func_start NNS_G2dSetCellAnimationCurrentFrame
NNS_G2dSetCellAnimationCurrentFrame: @ 0x080E95EC
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	cmp r4, #0
	bne _080E9606
	ldr r0, _080E9630 @ =gUnk_09E4AE60
	movs r1, #0xa1
	lsls r1, r1, #1
	ldr r2, _080E9634 @ =gUnk_09E4AD64
	movs r3, #1
	bl OSi_Panic
_080E9606:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _080E9618
	ldr r0, _080E9630 @ =gUnk_09E4AE60
	ldr r1, _080E9638 @ =0x00000143
	ldr r2, _080E963C @ =gUnk_09E4AF1C
	movs r3, #1
	bl OSi_Panic
_080E9618:
	adds r0, r4, #0
	adds r1, r5, #0
	bl NNS_G2dSetAnimCtrlCurrentFrame
	cmp r0, #0
	beq _080E962A
	adds r0, r4, #0
	bl ApplyCurrentAnimResult_
_080E962A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E9630: .4byte gUnk_09E4AE60
_080E9634: .4byte gUnk_09E4AD64
_080E9638: .4byte 0x00000143
_080E963C: .4byte gUnk_09E4AF1C

	thumb_func_start NNS_G2dSetCellAnimationSpeed
NNS_G2dSetCellAnimationSpeed: @ 0x080E9640
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0
	bne _080E9656
	ldr r0, _080E9684 @ =gUnk_09E4AE60
	ldr r1, _080E9688 @ =0x0000015F
	ldr r2, _080E968C @ =gUnk_09E4AD64
	movs r3, #1
	bl OSi_Panic
_080E9656:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _080E966A
	ldr r0, _080E9684 @ =gUnk_09E4AE60
	movs r1, #0xb0
	lsls r1, r1, #1
	ldr r2, _080E9690 @ =gUnk_09E4AF1C
	movs r3, #1
	bl OSi_Panic
_080E966A:
	cmp r4, #0
	bne _080E967A
	ldr r0, _080E9694 @ =gUnk_09E4ACDC
	ldr r2, _080E9698 @ =gUnk_09E4AD04
	movs r1, #0x5e
	movs r3, #1
	bl OSi_Panic
_080E967A:
	str r5, [r4, #0x10]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080E9684: .4byte gUnk_09E4AE60
_080E9688: .4byte 0x0000015F
_080E968C: .4byte gUnk_09E4AD64
_080E9690: .4byte gUnk_09E4AF1C
_080E9694: .4byte gUnk_09E4ACDC
_080E9698: .4byte gUnk_09E4AD04

	thumb_func_start NNS_G2dMakeCellToOams
NNS_G2dMakeCellToOams: @ 0x080E969C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	mov sb, r3
	ldr r0, [sp, #0x54]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp, #0x1c]
	ldrh r0, [r2]
	cmp r0, r1
	bls _080E96C6
	adds r0, r1, #0
_080E96C6:
	str r0, [sp, #0x20]
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	blo _080E96D0
	b _080E99C6
_080E96D0:
	mov r2, sp
	str r2, [sp, #0x28]
	mov r3, sp
	adds r3, #8
	str r3, [sp, #0x2c]
_080E96DA:
	ldr r4, [sp, #0x1c]
	lsls r0, r4, #3
	ldr r1, [sp, #0x10]
	adds r7, r1, r0
	cmp r7, #0
	bne _080E96F2
	ldr r0, _080E9770 @ =gUnk_09E4AC6C
	ldr r1, _080E9774 @ =0x000002AB
	ldr r2, _080E9778 @ =gUnk_09E4ACA4
	movs r3, #1
	bl OSi_Panic
_080E96F2:
	ldr r2, [sp, #0x1c]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r3, [sp, #0x14]
	ldr r1, [r3, #4]
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r7]
	ldrh r0, [r1, #2]
	strh r0, [r7, #2]
	ldrh r0, [r1, #4]
	strh r0, [r7, #4]
	mov r4, sb
	cmp r4, #0
	bne _080E971A
	ldr r0, [sp, #0x50]
	cmp r0, #0
	bne _080E971A
	b _080E99B4
_080E971A:
	ldr r1, _080E977C @ =0x000001FF
	ldrh r2, [r7, #2]
	ands r1, r2
	cmp r1, #0xff
	ble _080E972E
	ldr r3, _080E9780 @ =0xFFFFFF00
	adds r0, r3, #0
	orrs r1, r0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
_080E972E:
	lsls r0, r1, #0x10
	asrs r0, r0, #4
	str r0, [sp]
	ldrb r1, [r7]
	cmp r1, #0x7f
	ble _080E9744
	ldr r4, _080E9780 @ =0xFFFFFF00
	adds r0, r4, #0
	orrs r1, r0
	lsls r0, r1, #0x10
	lsrs r1, r0, #0x10
_080E9744:
	lsls r0, r1, #0x10
	asrs r0, r0, #4
	str r0, [sp, #4]
	mov r0, sb
	cmp r0, #0
	bne _080E9752
	b _080E9974
_080E9752:
	mov r4, sp
	ldr r2, [r7]
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r1, r2, #0
	ands r1, r3
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _080E976A
	cmp r1, r3
	bne _080E9784
_080E976A:
	adds r0, r1, #0
	b _080E978C
	.align 2, 0
_080E9770: .4byte gUnk_09E4AC6C
_080E9774: .4byte 0x000002AB
_080E9778: .4byte gUnk_09E4ACA4
_080E977C: .4byte 0x000001FF
_080E9780: .4byte 0xFFFFFF00
_080E9784:
	movs r0, #0xc0
	lsls r0, r0, #0x16
	ands r0, r2
	orrs r0, r1
_080E978C:
	movs r1, #0xc0
	lsls r1, r1, #2
	mov sl, r1
	cmp r0, sl
	bne _080E97C4
	ldr r0, [r7]
	ldr r1, _080E98D8 @ =0xC000C000
	ands r0, r1
	lsrs r2, r0, #0x1d
	movs r1, #0xc0
	lsls r1, r1, #8
	ands r0, r1
	lsrs r0, r0, #0xb
	adds r2, r2, r0
	ldr r3, _080E98DC @ =gUnk_09E4ACAA
	adds r0, r2, r3
	ldrh r0, [r0]
	lsls r1, r0, #0xb
	ldr r0, _080E98E0 @ =gUnk_09E4ACC2
	adds r2, r2, r0
	ldrh r2, [r2]
	lsls r2, r2, #0xb
	ldr r0, [r4]
	adds r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #4]
	adds r0, r0, r2
	str r0, [r4, #4]
_080E97C4:
	movs r4, #0x80
	lsls r4, r4, #1
	mov r8, r4
	ldr r0, [sp, #0x58]
	cmp r0, #0
	beq _080E97D2
	mov r8, sl
_080E97D2:
	movs r1, #0
	str r1, [sp, #0x24]
	cmp r8, sl
	bne _080E97DE
	movs r2, #1
	str r2, [sp, #0x24]
_080E97DE:
	mov r3, sb
	ldr r2, [r3]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	ldr r4, [sp]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r4, sb
	ldr r2, [r4, #8]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	ldr r2, [sp, #0x28]
	ldr r4, [r2, #4]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r3, _080E98E4 @ =0x00001000 (Gyakutenno Megami)
	ldr r4, _080E98E8 @ =0x00000000
	adds r0, r0, r3
	adcs r1, r4
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	str r0, [sp, #8]
	mov r4, sb
	ldr r2, [r4, #4]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	ldr r4, [sp]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	adds r6, r1, #0
	adds r5, r0, #0
	mov r0, sb
	ldr r2, [r0, #0xc]
	adds r0, r2, #0
	asrs r1, r2, #0x1f
	ldr r2, [sp, #0x28]
	ldr r4, [r2, #4]
	adds r2, r4, #0
	asrs r3, r4, #0x1f
	bl __muldi3
	ldr r3, _080E98E4 @ =0x00001000 (Gyakutenno Megami)
	ldr r4, _080E98E8 @ =0x00000000
	adds r0, r0, r3
	adcs r1, r4
	adds r0, r0, r5
	adcs r1, r6
	lsls r3, r1, #0x14
	lsrs r2, r0, #0xc
	adds r0, r3, #0
	orrs r0, r2
	ldr r4, [sp, #0x2c]
	str r0, [r4, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, r8
	cmp r0, #0
	beq _080E98A6
	movs r0, #0x80
	lsls r0, r0, #0x15
	cmp r8, r0
	beq _080E98A6
	movs r0, #0x80
	lsls r0, r0, #0x16
	cmp r8, r0
	beq _080E98A6
	movs r0, #0xc0
	lsls r0, r0, #0x16
	cmp r8, r0
	beq _080E98A6
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r8, r0
	beq _080E98A6
	movs r0, #0x80
	lsls r0, r0, #2
	cmp r8, r0
	beq _080E98A6
	cmp r8, sl
	beq _080E98A6
	ldr r0, _080E98EC @ =gUnk_09E4A5D4
	ldr r1, _080E98F0 @ =0x000001D5
	ldr r2, _080E98F4 @ =gUnk_09E4A6AC
	movs r3, #1
	bl OSi_Panic
_080E98A6:
	ldr r1, [sp, #0x18]
	cmp r1, #0x1f
	bls _080E98BA
	ldr r0, _080E98EC @ =gUnk_09E4A5D4
	movs r1, #0xeb
	lsls r1, r1, #1
	ldr r2, _080E98F8 @ =gUnk_09E4A7B0
	movs r3, #1
	bl OSi_Panic
_080E98BA:
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r8, r0
	beq _080E9900
	movs r0, #0xc0
	lsls r0, r0, #2
	cmp r8, r0
	beq _080E9900
	ldr r0, [r7]
	ldr r1, _080E98FC @ =0xC1FFFCFF
	ands r0, r1
	mov r2, r8
	orrs r0, r2
	b _080E9910
	.align 2, 0
_080E98D8: .4byte 0xC000C000
_080E98DC: .4byte gUnk_09E4ACAA
_080E98E0: .4byte gUnk_09E4ACC2
_080E98E4: .4byte 0x00001000 @ Gyakutenno Megami
_080E98E8: .4byte 0x00000000
_080E98EC: .4byte gUnk_09E4A5D4
_080E98F0: .4byte 0x000001D5
_080E98F4: .4byte gUnk_09E4A6AC
_080E98F8: .4byte gUnk_09E4A7B0
_080E98FC: .4byte 0xC1FFFCFF
_080E9900:
	ldr r0, [r7]
	ldr r1, _080E99D8 @ =0xC1FFFCFF
	ands r0, r1
	mov r3, r8
	orrs r0, r3
	ldr r4, [sp, #0x18]
	lsls r1, r4, #0x19
	orrs r0, r1
_080E9910:
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, _080E99DC @ =0xC000C000
	ands r0, r1
	lsrs r2, r0, #0x1d
	movs r1, #0xc0
	lsls r1, r1, #8
	ands r0, r1
	lsrs r0, r0, #0xb
	adds r2, r2, r0
	ldr r1, _080E99E0 @ =gUnk_09E4ACAA
	adds r0, r2, r1
	ldrh r0, [r0]
	lsrs r3, r0, #1
	ldr r0, _080E99E4 @ =gUnk_09E4ACC2
	adds r2, r2, r0
	ldrh r2, [r2]
	lsrs r2, r2, #1
	lsls r6, r3, #0xc
	mov r4, sb
	ldr r0, [r4]
	adds r1, r0, #0
	muls r1, r3, r1
	subs r1, r1, r6
	ldr r0, [r4, #8]
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r0, [sp]
	adds r4, r0, r1
	str r4, [sp]
	lsls r5, r2, #0xc
	mov r1, sb
	ldr r0, [r1, #4]
	adds r1, r0, #0
	muls r1, r3, r1
	subs r1, r1, r5
	mov r3, sb
	ldr r0, [r3, #0xc]
	muls r0, r2, r0
	adds r1, r1, r0
	ldr r0, [sp, #4]
	adds r1, r0, r1
	str r1, [sp, #4]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _080E9974
	subs r0, r4, r6
	str r0, [sp]
	subs r0, r1, r5
	str r0, [sp, #4]
_080E9974:
	ldr r1, [sp, #0x50]
	cmp r1, #0
	beq _080E998E
	ldr r0, [sp]
	ldr r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	ldr r2, [sp, #0x28]
	ldr r0, [r2, #4]
	ldr r3, [sp, #0x50]
	ldr r1, [r3, #4]
	adds r0, r0, r1
	str r0, [r2, #4]
_080E998E:
	ldr r3, [sp]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r3, r1
	ldr r4, [sp, #0x28]
	ldr r0, [r4, #4]
	adds r0, r0, r1
	asrs r0, r0, #0xc
	ldr r2, [r7]
	ldr r1, _080E99E8 @ =0xFE00FF00
	ands r2, r1
	movs r1, #0xff
	ands r0, r1
	orrs r2, r0
	lsls r3, r3, #0xb
	lsrs r3, r3, #0x17
	lsls r3, r3, #0x10
	orrs r2, r3
	str r2, [r7]
_080E99B4:
	ldr r0, [sp, #0x1c]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	cmp r0, r1
	bhs _080E99C6
	b _080E96DA
_080E99C6:
	ldr r0, [sp, #0x20]
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080E99D8: .4byte 0xC1FFFCFF
_080E99DC: .4byte 0xC000C000
_080E99E0: .4byte gUnk_09E4ACAA
_080E99E4: .4byte gUnk_09E4ACC2
_080E99E8: .4byte 0xFE00FF00

	thumb_func_start nullsub_20
nullsub_20: @ 0x080E99EC
	bx lr
	.align 2, 0
