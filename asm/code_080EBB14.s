	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start sub_080EBB14
sub_080EBB14: @ 0x080EBB14
	ldr r2, _080EBB28 @ =0x0400001E
	ldr r0, _080EBB2C @ =gUnk_03000040
	ldr r1, _080EBB30 @ =0x0000020E
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r1, r0, #1
	strh r1, [r2]
	ldr r0, _080EBB34 @ =0x0400001C
	strh r1, [r0]
	bx lr
	.align 2, 0
_080EBB28: .4byte 0x0400001E
_080EBB2C: .4byte gUnk_03000040
_080EBB30: .4byte 0x0000020E
_080EBB34: .4byte 0x0400001C

	thumb_func_start sub_080EBB38
sub_080EBB38: @ 0x080EBB38
	push {r4, lr}
	ldr r0, _080EBBC0 @ =gUnk_03000040
	movs r1, #0xba
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r2, #0
	movs r1, #1
	strh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x13
	strh r2, [r0]
	ldr r0, _080EBBC4 @ =gUnk_02029EB0
	bl sub_080F7674
	ldr r0, _080EBBC8 @ =gUnk_0202A2C0
	bl sub_080F42A0
	ldr r2, _080EBBCC @ =gUnk_020297E0
	ldr r0, _080EBBD0 @ =gUnk_02000000
	ldr r3, _080EBBD4 @ =0x00006C2C
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r1, r0, #0x1d
	lsrs r1, r1, #0x18
	ldr r0, _080EBBD8 @ =0xFFFFFE1F
	ldrh r3, [r2]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080EBBDC @ =0x04000008
	movs r0, #4
	strh r0, [r1]
	adds r1, #2
	ldr r2, _080EBBE0 @ =0x00000105
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _080EBBE4 @ =0x00000206
	adds r0, r3, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _080EBBE8 @ =0x00000307
	adds r0, r2, #0
	strh r0, [r1]
	bl sub_080F5A88
	bl sub_080F5A98
	ldr r0, _080EBBEC @ =0x06004000
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	bl MemoryClearHalfWord
	movs r0, #0xc0
	lsls r0, r0, #0x13
	movs r1, #0x80
	lsls r1, r1, #6
	bl MemoryClearHalfWord
	ldr r0, _080EBBF0 @ =0x06010000
	adds r1, r4, #0
	bl MemoryClearHalfWord
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EBBC0: .4byte gUnk_03000040
_080EBBC4: .4byte gUnk_02029EB0
_080EBBC8: .4byte gUnk_0202A2C0
_080EBBCC: .4byte gUnk_020297E0
_080EBBD0: .4byte gUnk_02000000
_080EBBD4: .4byte 0x00006C2C
_080EBBD8: .4byte 0xFFFFFE1F
_080EBBDC: .4byte 0x04000008
_080EBBE0: .4byte 0x00000105
_080EBBE4: .4byte 0x00000206
_080EBBE8: .4byte 0x00000307
_080EBBEC: .4byte 0x06004000
_080EBBF0: .4byte 0x06010000

	thumb_func_start sub_080EBBF4
sub_080EBBF4: @ 0x080EBBF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _080EBCB0 @ =0x080000AE
	ldrh r0, [r0]
	lsrs r0, r0, #8
	ldr r3, _080EBCB4 @ =0x0800B588
	cmp r0, #0x45
	bne _080EBC0C
	ldr r3, _080EBCB8 @ =0x0800AA10
_080EBC0C:
	movs r0, #0
	movs r1, #0x10
	movs r2, #2
	bl sub_080EE010
	movs r0, #0x80
	lsls r0, r0, #3
	ldr r3, _080EBCBC @ =0x0800C240
	movs r1, #0x20
	movs r2, #0x62
	bl sub_080EE010
	movs r0, #0xc0
	lsls r0, r0, #4
	ldr r3, _080EBCC0 @ =0x0800CD18
	movs r1, #0x30
	movs r2, #0x8a
	bl sub_080EE010
	ldr r0, _080EBCC4 @ =0x06010000
	movs r1, #0x80
	lsls r1, r1, #8
	bl MemoryClearHalfWord
	ldr r0, _080EBCC8 @ =0x05000220
	ldr r1, _080EBCCC @ =0x0800DD90
	movs r2, #0x20
	bl MemoryCopyHalfWord
	ldr r0, _080EBCD0 @ =0x06010800
	ldr r1, _080EBCD4 @ =0x0800DDB0
	movs r2, #0x80
	lsls r2, r2, #6
	bl MemoryCopyHalfWord
	movs r0, #0x18
	movs r1, #2
	bl sub_080F0BB4
	ldr r2, _080EBCD8 @ =gUnk_02006ED0
	ldr r0, _080EBCDC @ =gUnk_02000000
	ldr r1, _080EBCE0 @ =0x00006C2C
	adds r0, r0, r1
	movs r4, #7
	ldrb r0, [r0]
	ands r4, r0
	rsbs r1, r4, #0
	lsrs r1, r1, #0x1f
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r2, #8]
	ands r0, r3
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #8]
	ldr r3, _080EBCE4 @ =gUnk_09E5F854
	lsls r1, r0, #0x1e
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldr r0, [r1]
	str r0, [r2, #4]
	cmp r4, #1
	beq _080EBD08
	cmp r4, #2
	beq _080EBD00
	cmp r4, #3
	beq _080EBCF8
	cmp r4, #4
	beq _080EBCF0
	ldr r0, _080EBCE8 @ =gUnk_09DBFF7A
	cmp r4, #5
	bne _080EBD0A
	ldr r1, _080EBCEC @ =0x0003AB22
	adds r0, r0, r1
	b _080EBD0A
	.align 2, 0
_080EBCB0: .4byte 0x080000AE
_080EBCB4: .4byte 0x0800B588
_080EBCB8: .4byte 0x0800AA10
_080EBCBC: .4byte 0x0800C240
_080EBCC0: .4byte 0x0800CD18
_080EBCC4: .4byte 0x06010000
_080EBCC8: .4byte 0x05000220
_080EBCCC: .4byte 0x0800DD90
_080EBCD0: .4byte 0x06010800
_080EBCD4: .4byte 0x0800DDB0
_080EBCD8: .4byte gUnk_02006ED0
_080EBCDC: .4byte gUnk_02000000
_080EBCE0: .4byte 0x00006C2C
_080EBCE4: .4byte gUnk_09E5F854
_080EBCE8: .4byte gUnk_09DBFF7A
_080EBCEC: .4byte 0x0003AB22
_080EBCF0:
	ldr r0, _080EBCF4 @ =gUnk_09DEEED2
	b _080EBD0A
	.align 2, 0
_080EBCF4: .4byte gUnk_09DEEED2
_080EBCF8:
	ldr r0, _080EBCFC @ =gUnk_09DE2A1C
	b _080EBD0A
	.align 2, 0
_080EBCFC: .4byte gUnk_09DE2A1C
_080EBD00:
	ldr r0, _080EBD04 @ =gUnk_09DD6692
	b _080EBD0A
	.align 2, 0
_080EBD04: .4byte gUnk_09DD6692
_080EBD08:
	ldr r0, _080EBD40 @ =gUnk_09DCAD60
_080EBD0A:
	bl StringLength
	lsls r1, r0, #1
	adds r1, r1, r0
	movs r0, #0x60
	subs r5, r0, r1
	ldr r0, _080EBD44 @ =gUnk_02000000
	ldr r2, _080EBD48 @ =0x00006C2C
	adds r0, r0, r2
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EBD6C
	cmp r1, #2
	beq _080EBD64
	cmp r1, #3
	beq _080EBD5C
	cmp r1, #4
	beq _080EBD54
	ldr r3, _080EBD4C @ =gUnk_09DBFF7A
	cmp r1, #5
	bne _080EBD6E
	ldr r0, _080EBD50 @ =0x0003AB22
	adds r3, r3, r0
	b _080EBD6E
	.align 2, 0
_080EBD40: .4byte gUnk_09DCAD60
_080EBD44: .4byte gUnk_02000000
_080EBD48: .4byte 0x00006C2C
_080EBD4C: .4byte gUnk_09DBFF7A
_080EBD50: .4byte 0x0003AB22
_080EBD54:
	ldr r3, _080EBD58 @ =gUnk_09DEEED2
	b _080EBD6E
	.align 2, 0
_080EBD58: .4byte gUnk_09DEEED2
_080EBD5C:
	ldr r3, _080EBD60 @ =gUnk_09DE2A1C
	b _080EBD6E
	.align 2, 0
_080EBD60: .4byte gUnk_09DE2A1C
_080EBD64:
	ldr r3, _080EBD68 @ =gUnk_09DD6692
	b _080EBD6E
	.align 2, 0
_080EBD68: .4byte gUnk_09DD6692
_080EBD6C:
	ldr r3, _080EBDA0 @ =gUnk_09DCAD60
_080EBD6E:
	adds r0, r5, #0
	movs r1, #2
	ldr r2, _080EBDA4 @ =0x00008008
	bl sub_080F2A7C
	ldr r0, _080EBDA8 @ =gUnk_02000000
	ldr r1, _080EBDAC @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EBDD0
	cmp r1, #2
	beq _080EBDC8
	cmp r1, #3
	beq _080EBDC0
	cmp r1, #4
	beq _080EBDB8
	ldr r3, _080EBDB0 @ =gUnk_09DBFF7A
	cmp r1, #5
	bne _080EBDD2
	ldr r2, _080EBDB4 @ =0x0003AB22
	adds r3, r3, r2
	b _080EBDD2
	.align 2, 0
_080EBDA0: .4byte gUnk_09DCAD60
_080EBDA4: .4byte 0x00008008
_080EBDA8: .4byte gUnk_02000000
_080EBDAC: .4byte 0x00006C2C
_080EBDB0: .4byte gUnk_09DBFF7A
_080EBDB4: .4byte 0x0003AB22
_080EBDB8:
	ldr r3, _080EBDBC @ =gUnk_09DEEED2
	b _080EBDD2
	.align 2, 0
_080EBDBC: .4byte gUnk_09DEEED2
_080EBDC0:
	ldr r3, _080EBDC4 @ =gUnk_09DE2A1C
	b _080EBDD2
	.align 2, 0
_080EBDC4: .4byte gUnk_09DE2A1C
_080EBDC8:
	ldr r3, _080EBDCC @ =gUnk_09DD6692
	b _080EBDD2
	.align 2, 0
_080EBDCC: .4byte gUnk_09DD6692
_080EBDD0:
	ldr r3, _080EBE78 @ =gUnk_09DCAD60
_080EBDD2:
	adds r0, r5, #0
	movs r1, #2
	movs r2, #7
	bl sub_080F2A7C
	ldr r0, _080EBE7C @ =0x06010040
	movs r1, #0
	bl sub_080F37D4
	movs r0, #0xa
	movs r1, #0xc
	bl sub_080F0BB4
	movs r6, #0
	ldr r3, _080EBE80 @ =gInterfaceTextOffsets
	mov sl, r3
	ldr r0, _080EBE84 @ =gUnk_02006C2C
	mov sb, r0
	movs r1, #2
	mov r8, r1
	movs r7, #3
_080EBDFC:
	movs r2, #0xfa
	lsls r2, r2, #4
	adds r0, r6, r2
	bl GetInterfaceTextIdIndex
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	mov r3, sb
	ldrb r3, [r3]
	lsls r0, r3, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	add r1, sl
	ldr r4, [r1]
	ldr r0, _080EBE88 @ =gInterfaceText
	adds r4, r4, r0
	adds r0, r4, #0
	bl StringLength
	lsls r1, r0, #1
	adds r1, r1, r0
	movs r0, #0x28
	subs r5, r0, r1
	adds r0, r5, #1
	adds r1, r7, #0
	movs r2, #8
	adds r3, r4, #0
	bl sub_080F2A7C
	adds r0, r5, #0
	mov r1, r8
	movs r2, #7
	adds r3, r4, #0
	bl sub_080F2A7C
	movs r0, #0x10
	add r8, r0
	adds r7, #0x10
	adds r6, #1
	cmp r6, #5
	ble _080EBDFC
	ldr r0, _080EBE8C @ =0x06010A00
	movs r1, #0
	bl sub_080F37D4
	ldr r0, _080EBE90 @ =gUnk_03000040
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r1, _080EBE94 @ =sub_080EBB14
	str r1, [r0]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EBE78: .4byte gUnk_09DCAD60
_080EBE7C: .4byte 0x06010040
_080EBE80: .4byte gInterfaceTextOffsets
_080EBE84: .4byte gUnk_02006C2C
_080EBE88: .4byte gInterfaceText
_080EBE8C: .4byte 0x06010A00
_080EBE90: .4byte gUnk_03000040
_080EBE94: .4byte sub_080EBB14

	thumb_func_start sub_080EBE98
sub_080EBE98: @ 0x080EBE98
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r6, #0x80
	lsls r6, r6, #0xa
	movs r4, #0x18
	movs r5, #5
_080EBEA8:
	lsrs r2, r6, #0x10
	adds r0, r4, #0
	movs r1, #0x81
	lsls r1, r1, #7
	bl sub_080F616C
	movs r0, #0x80
	lsls r0, r0, #0xb
	adds r6, r6, r0
	adds r4, #0x20
	subs r5, #1
	cmp r5, #0
	bge _080EBEA8
	movs r5, #0
	movs r1, #0x81
	lsls r1, r1, #7
	mov sb, r1
	movs r0, #0xb0
	lsls r0, r0, #0xf
	mov r8, r0
	movs r7, #0xa8
	lsls r7, r7, #0xf
	movs r6, #0xa0
	lsls r6, r6, #0xf
_080EBED8:
	adds r0, r5, #0
	movs r1, #3
	bl __modsi3
	adds r4, r0, #0
	subs r0, r5, r4
	movs r1, #3
	bl __divsi3
	movs r1, #0x4e
	muls r4, r1, r4
	lsls r1, r0, #3
	subs r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r0
	adds r1, #1
	lsls r1, r1, #0x10
	orrs r4, r1
	movs r1, #0xf0
	lsls r1, r1, #0xe
	adds r0, r4, r1
	lsrs r2, r6, #0x10
	mov r1, sb
	bl sub_080F616C
	ldr r1, _080EBF98 @ =0x003C0020
	adds r0, r4, r1
	lsrs r2, r7, #0x10
	mov r1, sb
	bl sub_080F616C
	ldr r0, _080EBF9C @ =0x003C0040
	adds r4, r4, r0
	mov r1, r8
	lsrs r2, r1, #0x10
	adds r0, r4, #0
	movs r1, #0x40
	bl sub_080F616C
	movs r0, #0x80
	lsls r0, r0, #0xf
	add r8, r0
	adds r7, r7, r0
	adds r6, r6, r0
	adds r5, #1
	cmp r5, #5
	ble _080EBED8
	ldr r6, _080EBFA0 @ =gUnk_020297E0
	movs r0, #0x40
	ldrb r1, [r6, #1]
	ands r0, r1
	cmp r0, #0
	beq _080EBF8A
	ldr r4, _080EBFA4 @ =gUnk_09E5EE34
	ldr r0, [r6]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1c
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	movs r2, #0xa2
	lsls r2, r2, #5
	movs r1, #0xc0
	bl sub_080F61E4
	ldr r0, [r6]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1c
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	adds r0, #0x40
	ldr r5, _080EBFA8 @ =0x00008080
	ldr r2, _080EBFAC @ =0x00001448 (None)
	adds r1, r5, #0
	bl sub_080F61E4
	ldr r0, [r6]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1c
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080EBFB0 @ =0x00200040
	adds r0, r0, r1
	ldr r2, _080EBFB4 @ =0x000014C8 (Warrior Dai Grepher)
	adds r1, r5, #0
	bl sub_080F61E4
_080EBF8A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EBF98: .4byte 0x003C0020
_080EBF9C: .4byte 0x003C0040
_080EBFA0: .4byte gUnk_020297E0
_080EBFA4: .4byte gUnk_09E5EE34
_080EBFA8: .4byte 0x00008080
_080EBFAC: .4byte 0x00001448 @ None
_080EBFB0: .4byte 0x00200040
_080EBFB4: .4byte 0x000014C8 @ Warrior Dai Grepher

	thumb_func_start sub_080EBFB8
sub_080EBFB8: @ 0x080EBFB8
	push {r4, r5, r6, r7, lr}
	ldr r7, _080EBFD8 @ =gUnk_03000040
	movs r0, #0x81
	lsls r0, r0, #2
	adds r6, r7, r0
	ldrh r1, [r6]
	lsls r0, r1, #0x12
	lsrs r4, r0, #0x18
	adds r5, r7, #0
	cmp r4, #1
	beq _080EC004
	cmp r4, #1
	bgt _080EBFDC
	cmp r4, #0
	beq _080EBFE8
	b _080EC1E4
	.align 2, 0
_080EBFD8: .4byte gUnk_03000040
_080EBFDC:
	cmp r4, #2
	beq _080EC068
	cmp r4, #3
	bne _080EBFE6
	b _080EC1B8
_080EBFE6:
	b _080EC1E4
_080EBFE8:
	bl sub_080EBB38
	bl sub_080EBBF4
	ldr r1, _080EC000 @ =gUnk_020297E0
	movs r0, #0x41
	rsbs r0, r0, #0
	ldrb r2, [r1, #1]
	ands r0, r2
	strb r0, [r1, #1]
	b _080EC1C6
	.align 2, 0
_080EC000: .4byte gUnk_020297E0
_080EC004:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r3, #0xd8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	bl sub_080EBE98
	movs r0, #4
	bl sub_080F58B8
	cmp r0, #0
	bne _080EC024
	b _080EC1AC
_080EC024:
	ldrh r2, [r6]
	lsls r1, r2, #0x12
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #6
	ldr r0, _080EC058 @ =0xFFFFC03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r6]
	ldr r1, _080EC05C @ =0x04000050
	movs r2, #0xfd
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r3, _080EC060 @ =0x00001807 (Green Gadget)
	adds r0, r3, #0
	strh r0, [r1]
	ldr r1, _080EC064 @ =gUnk_020297E0
	movs r0, #0x40
	ldrb r2, [r1, #1]
	orrs r0, r2
	strb r0, [r1, #1]
	b _080EC1AC
	.align 2, 0
_080EC058: .4byte 0xFFFFC03F
_080EC05C: .4byte 0x04000050
_080EC060: .4byte 0x00001807 @ Green Gadget
_080EC064: .4byte gUnk_020297E0
_080EC068:
	bl sub_080EBE98
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r5, r5, r3
	movs r0, #0x40
	ldrh r1, [r5]
	ands r0, r1
	cmp r0, #0
	beq _080EC0A2
	movs r0, #0
	bl sub_080F9AB4
	ldr r2, _080EC154 @ =gUnk_020297E0
	ldr r1, _080EC158 @ =gUnk_09E5EE4C
	ldr r0, [r2]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1c
	lsls r0, r0, #4
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080EC15C @ =0xFFFFFE1F
	ldrh r3, [r2]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
_080EC0A2:
	movs r0, #0x80
	ldrh r1, [r5]
	ands r0, r1
	cmp r0, #0
	beq _080EC0D4
	movs r0, #0
	bl sub_080F9AB4
	ldr r2, _080EC154 @ =gUnk_020297E0
	ldr r1, _080EC158 @ =gUnk_09E5EE4C
	ldr r0, [r2]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1c
	lsls r0, r0, #4
	adds r1, #4
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080EC15C @ =0xFFFFFE1F
	ldrh r3, [r2]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
_080EC0D4:
	movs r0, #0x20
	ldrh r1, [r5]
	ands r0, r1
	cmp r0, #0
	beq _080EC106
	movs r0, #0
	bl sub_080F9AB4
	ldr r2, _080EC154 @ =gUnk_020297E0
	ldr r1, _080EC158 @ =gUnk_09E5EE4C
	ldr r0, [r2]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1c
	lsls r0, r0, #4
	adds r1, #8
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080EC15C @ =0xFFFFFE1F
	ldrh r3, [r2]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
_080EC106:
	movs r0, #0x10
	ldrh r1, [r5]
	ands r0, r1
	cmp r0, #0
	beq _080EC138
	movs r0, #0
	bl sub_080F9AB4
	ldr r2, _080EC154 @ =gUnk_020297E0
	ldr r1, _080EC158 @ =gUnk_09E5EE4C
	ldr r0, [r2]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1c
	lsls r0, r0, #4
	adds r1, #0xc
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #5
	ldr r0, _080EC15C @ =0xFFFFFE1F
	ldrh r3, [r2]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
_080EC138:
	ldrh r1, [r5]
	ands r4, r1
	cmp r4, #0
	beq _080EC160
	movs r0, #1
	bl sub_080F9AB4
	ldr r1, _080EC154 @ =gUnk_020297E0
	movs r0, #0x41
	rsbs r0, r0, #0
	ldrb r2, [r1, #1]
	ands r0, r2
	strb r0, [r1, #1]
	b _080EC1C6
	.align 2, 0
_080EC154: .4byte gUnk_020297E0
_080EC158: .4byte gUnk_09E5EE4C
_080EC15C: .4byte 0xFFFFFE1F
_080EC160:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080EC1AC
	movs r0, #0x24
	bl sub_080F9AB4
	ldr r4, _080EC1B0 @ =gUnk_020297E0
	ldr r0, [r4]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1c
	bl SetLanguage
	bl sub_080F9B98
	cmp r0, #0
	beq _080EC186
	bl sub_080F9C88
_080EC186:
	movs r0, #0x41
	rsbs r0, r0, #0
	ldrb r3, [r4, #1]
	ands r0, r3
	strb r0, [r4, #1]
	movs r0, #0x81
	lsls r0, r0, #2
	adds r3, r7, r0
	ldrh r2, [r3]
	lsls r1, r2, #0x12
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #6
	ldr r0, _080EC1B4 @ =0xFFFFC03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
_080EC1AC:
	movs r0, #0
	b _080EC1F8
	.align 2, 0
_080EC1B0: .4byte gUnk_020297E0
_080EC1B4: .4byte 0xFFFFC03F
_080EC1B8:
	bl sub_080EBE98
	movs r0, #4
	bl sub_080F5840
	cmp r0, #0
	beq _080EC1AC
_080EC1C6:
	ldrh r2, [r6]
	lsls r1, r2, #0x12
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #6
	ldr r0, _080EC1E0 @ =0xFFFFC03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r6]
	b _080EC1AC
	.align 2, 0
_080EC1E0: .4byte 0xFFFFC03F
_080EC1E4:
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	movs r2, #0xfa
	lsls r2, r2, #1
	adds r1, r5, r2
	movs r0, #0
	str r0, [r1]
	movs r0, #1
_080EC1F8:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080EC200
sub_080EC200: @ 0x080EC200
	push {r4, lr}
	ldr r0, _080EC270 @ =gUnk_03000040
	movs r1, #0xba
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r2, #0
	movs r1, #0x11
	strh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #0x13
	strh r2, [r0]
	ldr r0, _080EC274 @ =gUnk_02029EB0
	bl sub_080F7674
	ldr r0, _080EC278 @ =gUnk_0202A2C0
	bl sub_080F42A0
	ldr r1, _080EC27C @ =0x04000008
	movs r0, #4
	strh r0, [r1]
	adds r1, #2
	ldr r2, _080EC280 @ =0x00000105
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _080EC284 @ =0x00000206
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #2
	ldr r2, _080EC288 @ =0x00000307
	adds r0, r2, #0
	strh r0, [r1]
	bl sub_080F5A88
	bl sub_080F5A98
	ldr r0, _080EC28C @ =0x06004000
	movs r4, #0x80
	lsls r4, r4, #8
	adds r1, r4, #0
	bl MemoryClearHalfWord
	movs r0, #0xc0
	lsls r0, r0, #0x13
	movs r1, #0x80
	lsls r1, r1, #6
	bl MemoryClearHalfWord
	ldr r0, _080EC290 @ =0x06010000
	adds r1, r4, #0
	bl MemoryClearHalfWord
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC270: .4byte gUnk_03000040
_080EC274: .4byte gUnk_02029EB0
_080EC278: .4byte gUnk_0202A2C0
_080EC27C: .4byte 0x04000008
_080EC280: .4byte 0x00000105
_080EC284: .4byte 0x00000206
_080EC288: .4byte 0x00000307
_080EC28C: .4byte 0x06004000
_080EC290: .4byte 0x06010000

	thumb_func_start sub_080EC294
sub_080EC294: @ 0x080EC294
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080EC2C0 @ =0x05000240
	lsls r1, r4, #5
	ldr r2, _080EC2C4 @ =gIconPals
	adds r1, r1, r2
	movs r2, #0x20
	bl MemoryCopyWord
	ldr r0, _080EC2C8 @ =0x06011000
	lsls r1, r4, #3
	adds r1, r1, r4
	lsls r1, r1, #5
	ldr r2, _080EC2CC @ =gIconGraphics
	adds r1, r1, r2
	movs r2, #3
	movs r3, #3
	bl sub_080F74D4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EC2C0: .4byte 0x05000240
_080EC2C4: .4byte gIconPals
_080EC2C8: .4byte 0x06011000
_080EC2CC: .4byte gIconGraphics

	thumb_func_start sub_080EC2D0
sub_080EC2D0: @ 0x080EC2D0
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	movs r4, #0
	cmp r3, #0
	bne _080EC2E0
	movs r0, #0
	b _080EC30E
_080EC2E0:
	cmp r4, r3
	bge _080EC304
	ldr r0, _080EC314 @ =gUnk_02000000
	lsls r1, r2, #2
	ldr r2, _080EC318 @ =0x00006C3C
	adds r0, r0, r2
	adds r1, r1, r0
	adds r2, r3, #0
_080EC2F0:
	ldrb r5, [r1]
	lsls r0, r5, #0x1e
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _080EC2FC
	adds r4, #1
_080EC2FC:
	adds r1, #4
	subs r2, #1
	cmp r2, #0
	bne _080EC2F0
_080EC304:
	movs r0, #0x64
	muls r0, r4, r0
	adds r1, r3, #0
	bl __divsi3
_080EC30E:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080EC314: .4byte gUnk_02000000
_080EC318: .4byte 0x00006C3C

	thumb_func_start sub_080EC31C
sub_080EC31C: @ 0x080EC31C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	movs r0, #0x80
	lsls r0, r0, #3
	ldr r3, _080EC4B0 @ =0x0800FDB0
	movs r1, #0x10
	movs r2, #2
	bl sub_080EE010
	movs r0, #0xc0
	lsls r0, r0, #4
	ldr r3, _080EC4B4 @ =0x08010538
	movs r1, #0x10
	movs r2, #0x1c
	bl sub_080EE010
	movs r0, #0
_080EC346:
	movs r1, #0
	str r1, [sp]
	lsls r2, r0, #2
	adds r3, r0, #1
	str r3, [sp, #4]
	adds r1, r2, r0
	mov sl, r1
	adds r1, #9
	lsls r1, r1, #5
	adds r0, #2
	adds r6, r2, r0
	adds r1, #4
	mov sb, r1
	mov r2, sl
	lsls r0, r2, #3
	add r0, sl
	lsls r3, r0, #5
	mov r8, r3
	adds r3, r0, #0
	adds r3, #0x4e
	lsls r0, r6, #5
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r7, r0, r1
_080EC376:
	ldr r1, [sp]
	add r1, sl
	lsls r4, r3, #0x10
	lsrs r4, r4, #0x10
	mov r2, sb
	lsls r5, r2, #0x10
	lsrs r5, r5, #0x10
	lsls r1, r1, #5
	ldr r0, _080EC4B8 @ =gIconPals
	adds r1, r1, r0
	adds r0, r7, #0
	movs r2, #0x20
	str r3, [sp, #8]
	bl MemoryCopyHalfWord
	lsls r0, r4, #5
	ldr r1, _080EC4BC @ =0x06004000
	adds r0, r0, r1
	ldr r1, _080EC4C0 @ =gIconGraphics
	add r1, r8
	movs r2, #0x90
	lsls r2, r2, #1
	bl MemoryCopyHalfWord
	lsls r5, r5, #1
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r5, r2
	lsls r0, r6, #0xc
	adds r4, r4, r0
	strh r4, [r1]
	ldr r0, _080EC4C4 @ =0x06000002
	adds r1, r5, r0
	adds r0, r4, #1
	strh r0, [r1]
	adds r2, #4
	adds r1, r5, r2
	adds r0, r4, #2
	strh r0, [r1]
	ldr r0, _080EC4C8 @ =0x06000040
	adds r1, r5, r0
	adds r0, r4, #3
	strh r0, [r1]
	adds r2, #0x3e
	adds r1, r5, r2
	adds r0, r4, #4
	strh r0, [r1]
	ldr r0, _080EC4CC @ =0x06000044
	adds r1, r5, r0
	adds r0, r4, #5
	strh r0, [r1]
	adds r2, #0x3e
	adds r1, r5, r2
	adds r0, r4, #6
	strh r0, [r1]
	ldr r0, _080EC4D0 @ =0x06000082
	adds r1, r5, r0
	adds r0, r4, #7
	strh r0, [r1]
	ldr r1, _080EC4D4 @ =0x06000084
	adds r5, r5, r1
	adds r4, #8
	strh r4, [r5]
	adds r7, #0x20
	adds r6, #1
	movs r2, #5
	add sb, r2
	movs r0, #0x90
	lsls r0, r0, #1
	add r8, r0
	ldr r3, [sp, #8]
	adds r3, #9
	ldr r1, [sp]
	adds r1, #1
	str r1, [sp]
	cmp r1, #4
	ble _080EC376
	ldr r0, [sp, #4]
	cmp r0, #1
	ble _080EC346
	ldr r0, _080EC4D8 @ =gUnk_03000040
	movs r2, #0xf0
	lsls r2, r2, #1
	adds r0, r0, r2
	movs r1, #4
	strh r1, [r0]
	ldr r4, _080EC4DC @ =0x06010000
	movs r1, #0x80
	lsls r1, r1, #8
	adds r0, r4, #0
	bl MemoryClearHalfWord
	ldr r0, _080EC4E0 @ =0x05000220
	ldr r1, _080EC4E4 @ =0x080114F0
	movs r2, #0x20
	bl MemoryCopyHalfWord
	ldr r1, _080EC4E8 @ =0x08011510
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r4, #0
	bl MemoryCopyHalfWord
	ldr r4, _080EC4EC @ =gUnk_02000000
	ldr r3, _080EC4F0 @ =0x00006E57
	adds r0, r4, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1c
	bl sub_080EC294
	movs r0, #0x1e
	movs r1, #0x14
	bl sub_080F0BB4
	ldr r2, _080EC4F4 @ =gUnk_02006ED0
	ldr r0, _080EC4F8 @ =0x00006C2C
	adds r4, r4, r0
	movs r5, #7
	ldrb r4, [r4]
	ands r5, r4
	rsbs r1, r5, #0
	lsrs r1, r1, #0x1f
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r2, #8]
	ands r0, r3
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #8]
	ldr r3, _080EC4FC @ =gUnk_09E5F854
	lsls r1, r0, #0x1e
	lsrs r1, r1, #0x1f
	lsls r1, r1, #2
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	lsls r0, r0, #3
	adds r1, r1, r0
	adds r1, r1, r3
	ldr r0, [r1]
	str r0, [r2, #4]
	cmp r5, #1
	beq _080EC520
	cmp r5, #2
	beq _080EC518
	cmp r5, #3
	beq _080EC510
	cmp r5, #4
	beq _080EC508
	ldr r0, _080EC500 @ =gUnk_09DC011C
	cmp r5, #5
	bne _080EC522
	ldr r1, _080EC504 @ =0x0003AB58
	adds r0, r0, r1
	b _080EC522
	.align 2, 0
_080EC4B0: .4byte 0x0800FDB0
_080EC4B4: .4byte 0x08010538
_080EC4B8: .4byte gIconPals
_080EC4BC: .4byte 0x06004000
_080EC4C0: .4byte gIconGraphics
_080EC4C4: .4byte 0x06000002
_080EC4C8: .4byte 0x06000040
_080EC4CC: .4byte 0x06000044
_080EC4D0: .4byte 0x06000082
_080EC4D4: .4byte 0x06000084
_080EC4D8: .4byte gUnk_03000040
_080EC4DC: .4byte 0x06010000
_080EC4E0: .4byte 0x05000220
_080EC4E4: .4byte 0x080114F0
_080EC4E8: .4byte 0x08011510
_080EC4EC: .4byte gUnk_02000000
_080EC4F0: .4byte 0x00006E57
_080EC4F4: .4byte gUnk_02006ED0
_080EC4F8: .4byte 0x00006C2C
_080EC4FC: .4byte gUnk_09E5F854
_080EC500: .4byte gUnk_09DC011C
_080EC504: .4byte 0x0003AB58
_080EC508:
	ldr r0, _080EC50C @ =gUnk_09DEF0A8
	b _080EC522
	.align 2, 0
_080EC50C: .4byte gUnk_09DEF0A8
_080EC510:
	ldr r0, _080EC514 @ =gUnk_09DE2C0C
	b _080EC522
	.align 2, 0
_080EC514: .4byte gUnk_09DE2C0C
_080EC518:
	ldr r0, _080EC51C @ =gUnk_09DD6892
	b _080EC522
	.align 2, 0
_080EC51C: .4byte gUnk_09DD6892
_080EC520:
	ldr r0, _080EC558 @ =gUnk_09DCAEF0
_080EC522:
	bl StringLength
	lsls r1, r0, #1
	adds r1, r1, r0
	movs r0, #0x78
	subs r2, r0, r1
	ldr r0, _080EC55C @ =gUnk_02000000
	ldr r3, _080EC560 @ =0x00006C2C
	adds r0, r0, r3
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EC584
	cmp r1, #2
	beq _080EC57C
	cmp r1, #3
	beq _080EC574
	cmp r1, #4
	beq _080EC56C
	ldr r3, _080EC564 @ =gUnk_09DC011C
	cmp r1, #5
	bne _080EC586
	ldr r0, _080EC568 @ =0x0003AB58
	adds r3, r3, r0
	b _080EC586
	.align 2, 0
_080EC558: .4byte gUnk_09DCAEF0
_080EC55C: .4byte gUnk_02000000
_080EC560: .4byte 0x00006C2C
_080EC564: .4byte gUnk_09DC011C
_080EC568: .4byte 0x0003AB58
_080EC56C:
	ldr r3, _080EC570 @ =gUnk_09DEF0A8
	b _080EC586
	.align 2, 0
_080EC570: .4byte gUnk_09DEF0A8
_080EC574:
	ldr r3, _080EC578 @ =gUnk_09DE2C0C
	b _080EC586
	.align 2, 0
_080EC578: .4byte gUnk_09DE2C0C
_080EC57C:
	ldr r3, _080EC580 @ =gUnk_09DD6892
	b _080EC586
	.align 2, 0
_080EC580: .4byte gUnk_09DD6892
_080EC584:
	ldr r3, _080EC5C8 @ =gUnk_09DCAEF0
_080EC586:
	adds r0, r2, #0
	movs r1, #2
	movs r2, #1
	bl sub_080F2A7C
	ldr r4, _080EC5CC @ =gUnk_02000000
	ldr r1, _080EC5D0 @ =0x00006E57
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	cmp r0, #0
	bne _080EC5E0
	ldr r1, _080EC5D4 @ =gUnk_02006ED0
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1, #8]
	ands r0, r2
	strb r0, [r1, #8]
	ldr r2, _080EC5D8 @ =gUnk_09E5F854
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [r1, #4]
	ldr r0, _080EC5DC @ =0x00006E48
	adds r3, r4, r0
	movs r0, #0x3a
	movs r1, #0x12
	movs r2, #1
	bl sub_080F2C1C
	b _080EC60E
	.align 2, 0
_080EC5C8: .4byte gUnk_09DCAEF0
_080EC5CC: .4byte gUnk_02000000
_080EC5D0: .4byte 0x00006E57
_080EC5D4: .4byte gUnk_02006ED0
_080EC5D8: .4byte gUnk_09E5F854
_080EC5DC: .4byte 0x00006E48
_080EC5E0:
	ldr r2, _080EC6B8 @ =gUnk_02006ED0
	movs r1, #1
	ldrb r3, [r2, #8]
	orrs r1, r3
	strb r1, [r2, #8]
	ldr r3, _080EC6BC @ =gUnk_09E5F854
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r2, #4]
	ldr r0, _080EC6C0 @ =0x00006E48
	adds r3, r4, r0
	movs r0, #0x3a
	movs r1, #0x12
	movs r2, #1
	bl sub_080F2C2C
_080EC60E:
	ldr r2, _080EC6B8 @ =gUnk_02006ED0
	ldr r5, _080EC6C4 @ =gUnk_02000000
	ldr r1, _080EC6C8 @ =0x00006C2C
	adds r6, r5, r1
	movs r3, #7
	mov r8, r3
	mov r0, r8
	ldrb r1, [r6]
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r3, [r2, #8]
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #8]
	ldr r3, _080EC6BC @ =gUnk_09E5F854
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r2, #4]
	ldr r4, _080EC6CC @ =gUnk_09E5EEAC
	ldr r1, _080EC6D0 @ =0x00006C3C
	adds r0, r5, r1
	bl sub_080F9944
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	bl GetInterfaceTextIdIndex
	ldr r2, _080EC6D4 @ =gInterfaceTextOffsets
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrb r3, [r6]
	lsls r0, r3, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r3, [r1]
	ldr r4, _080EC6D8 @ =gInterfaceText
	adds r3, r3, r4
	movs r0, #0x3a
	movs r1, #0x22
	movs r2, #1
	bl sub_080F2A7C
	ldr r0, _080EC6DC @ =0x00006C38
	adds r5, r5, r0
	ldr r3, [r5]
	movs r0, #0xb6
	movs r1, #0x33
	movs r2, #1
	bl sub_080F2C8C
	mov r0, r8
	ldrb r6, [r6]
	ands r0, r6
	cmp r0, #1
	beq _080EC708
	cmp r0, #2
	beq _080EC6FC
	cmp r0, #3
	beq _080EC6F0
	cmp r0, #4
	beq _080EC6E8
	ldr r1, _080EC6E0 @ =0x0000654C
	adds r3, r4, r1
	cmp r0, #5
	bne _080EC70C
	ldr r2, _080EC6E4 @ =0x000410AE
	adds r3, r4, r2
	b _080EC70C
	.align 2, 0
_080EC6B8: .4byte gUnk_02006ED0
_080EC6BC: .4byte gUnk_09E5F854
_080EC6C0: .4byte 0x00006E48
_080EC6C4: .4byte gUnk_02000000
_080EC6C8: .4byte 0x00006C2C
_080EC6CC: .4byte gUnk_09E5EEAC
_080EC6D0: .4byte 0x00006C3C
_080EC6D4: .4byte gInterfaceTextOffsets
_080EC6D8: .4byte gInterfaceText
_080EC6DC: .4byte 0x00006C38
_080EC6E0: .4byte 0x0000654C
_080EC6E4: .4byte 0x000410AE
_080EC6E8:
	ldr r0, _080EC6EC @ =0x000354DE
	b _080EC70A
	.align 2, 0
_080EC6EC: .4byte 0x000354DE
_080EC6F0:
	ldr r1, _080EC6F8 @ =0x0002904E
	adds r3, r4, r1
	b _080EC70C
	.align 2, 0
_080EC6F8: .4byte 0x0002904E
_080EC6FC:
	ldr r2, _080EC704 @ =0x0001CCC8
	adds r3, r4, r2
	b _080EC70C
	.align 2, 0
_080EC704: .4byte 0x0001CCC8
_080EC708:
	ldr r0, _080EC740 @ =0x0001131C
_080EC70A:
	adds r3, r4, r0
_080EC70C:
	movs r0, #0xbc
	movs r1, #0x33
	movs r2, #1
	bl sub_080F2C1C
	ldr r0, _080EC744 @ =gUnk_02000000
	ldr r1, _080EC748 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EC76C
	cmp r1, #2
	beq _080EC764
	cmp r1, #3
	beq _080EC75C
	cmp r1, #4
	beq _080EC754
	ldr r3, _080EC74C @ =gUnk_09DBE758
	cmp r1, #5
	bne _080EC76E
	ldr r2, _080EC750 @ =0x0003AB1C
	adds r3, r3, r2
	b _080EC76E
	.align 2, 0
_080EC740: .4byte 0x0001131C
_080EC744: .4byte gUnk_02000000
_080EC748: .4byte 0x00006C2C
_080EC74C: .4byte gUnk_09DBE758
_080EC750: .4byte 0x0003AB1C
_080EC754:
	ldr r3, _080EC758 @ =gUnk_09DED5D6
	b _080EC76E
	.align 2, 0
_080EC758: .4byte gUnk_09DED5D6
_080EC75C:
	ldr r3, _080EC760 @ =gUnk_09DE113C
	b _080EC76E
	.align 2, 0
_080EC760: .4byte gUnk_09DE113C
_080EC764:
	ldr r3, _080EC768 @ =gUnk_09DD4EA8
	b _080EC76E
	.align 2, 0
_080EC768: .4byte gUnk_09DD4EA8
_080EC76C:
	ldr r3, _080EC7C8 @ =gUnk_09DC9810
_080EC76E:
	movs r0, #0x1c
	movs r1, #0x42
	movs r2, #1
	bl sub_080F2A7C
	bl sub_080E1788
	adds r4, r0, #0
	bl sub_080E3258
	adds r5, r0, #0
	bl sub_080E0FEC
	adds r4, r4, r5
	adds r4, r4, r0
	movs r0, #0
	adds r1, r4, #0
	bl sub_080EC2D0
	adds r3, r0, #0
	movs r0, #0xc2
	movs r1, #0x42
	movs r2, #1
	bl sub_080F2C8C
	ldr r0, _080EC7CC @ =gUnk_02000000
	ldr r3, _080EC7D0 @ =0x00006C2C
	adds r0, r0, r3
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EC7F4
	cmp r1, #2
	beq _080EC7EC
	cmp r1, #3
	beq _080EC7E4
	cmp r1, #4
	beq _080EC7DC
	ldr r3, _080EC7D4 @ =gUnk_09DC0158
	cmp r1, #5
	bne _080EC7F6
	ldr r0, _080EC7D8 @ =0x0003AB64
	adds r3, r3, r0
	b _080EC7F6
	.align 2, 0
_080EC7C8: .4byte gUnk_09DC9810
_080EC7CC: .4byte gUnk_02000000
_080EC7D0: .4byte 0x00006C2C
_080EC7D4: .4byte gUnk_09DC0158
_080EC7D8: .4byte 0x0003AB64
_080EC7DC:
	ldr r3, _080EC7E0 @ =gUnk_09DEF0EC
	b _080EC7F6
	.align 2, 0
_080EC7E0: .4byte gUnk_09DEF0EC
_080EC7E4:
	ldr r3, _080EC7E8 @ =gUnk_09DE2C5C
	b _080EC7F6
	.align 2, 0
_080EC7E8: .4byte gUnk_09DE2C5C
_080EC7EC:
	ldr r3, _080EC7F0 @ =gUnk_09DD68D6
	b _080EC7F6
	.align 2, 0
_080EC7F0: .4byte gUnk_09DD68D6
_080EC7F4:
	ldr r3, _080EC828 @ =gUnk_09DCAF2A
_080EC7F6:
	movs r0, #0xc8
	movs r1, #0x42
	movs r2, #1
	bl sub_080F2C1C
	ldr r0, _080EC82C @ =gUnk_02000000
	ldr r1, _080EC830 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EC854
	cmp r1, #2
	beq _080EC84C
	cmp r1, #3
	beq _080EC844
	cmp r1, #4
	beq _080EC83C
	ldr r3, _080EC834 @ =gUnk_09DBFFDA
	cmp r1, #5
	bne _080EC856
	ldr r2, _080EC838 @ =0x0003AB30
	adds r3, r3, r2
	b _080EC856
	.align 2, 0
_080EC828: .4byte gUnk_09DCAF2A
_080EC82C: .4byte gUnk_02000000
_080EC830: .4byte 0x00006C2C
_080EC834: .4byte gUnk_09DBFFDA
_080EC838: .4byte 0x0003AB30
_080EC83C:
	ldr r3, _080EC840 @ =gUnk_09DEEF46
	b _080EC856
	.align 2, 0
_080EC840: .4byte gUnk_09DEEF46
_080EC844:
	ldr r3, _080EC848 @ =gUnk_09DE2AA2
	b _080EC856
	.align 2, 0
_080EC848: .4byte gUnk_09DE2AA2
_080EC84C:
	ldr r3, _080EC850 @ =gUnk_09DD670E
	b _080EC856
	.align 2, 0
_080EC850: .4byte gUnk_09DD670E
_080EC854:
	ldr r3, _080EC8A0 @ =gUnk_09DCADC2
_080EC856:
	movs r0, #0x1c
	movs r1, #0x52
	movs r2, #1
	bl sub_080F2A7C
	bl sub_080E1788
	adds r1, r0, #0
	movs r0, #0
	bl sub_080EC2D0
	adds r3, r0, #0
	movs r0, #0xc2
	movs r1, #0x52
	movs r2, #1
	bl sub_080F2C8C
	ldr r0, _080EC8A4 @ =gUnk_02000000
	ldr r3, _080EC8A8 @ =0x00006C2C
	adds r0, r0, r3
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EC8CC
	cmp r1, #2
	beq _080EC8C4
	cmp r1, #3
	beq _080EC8BC
	cmp r1, #4
	beq _080EC8B4
	ldr r3, _080EC8AC @ =gUnk_09DC0158
	cmp r1, #5
	bne _080EC8CE
	ldr r0, _080EC8B0 @ =0x0003AB64
	adds r3, r3, r0
	b _080EC8CE
	.align 2, 0
_080EC8A0: .4byte gUnk_09DCADC2
_080EC8A4: .4byte gUnk_02000000
_080EC8A8: .4byte 0x00006C2C
_080EC8AC: .4byte gUnk_09DC0158
_080EC8B0: .4byte 0x0003AB64
_080EC8B4:
	ldr r3, _080EC8B8 @ =gUnk_09DEF0EC
	b _080EC8CE
	.align 2, 0
_080EC8B8: .4byte gUnk_09DEF0EC
_080EC8BC:
	ldr r3, _080EC8C0 @ =gUnk_09DE2C5C
	b _080EC8CE
	.align 2, 0
_080EC8C0: .4byte gUnk_09DE2C5C
_080EC8C4:
	ldr r3, _080EC8C8 @ =gUnk_09DD68D6
	b _080EC8CE
	.align 2, 0
_080EC8C8: .4byte gUnk_09DD68D6
_080EC8CC:
	ldr r3, _080EC900 @ =gUnk_09DCAF2A
_080EC8CE:
	movs r0, #0xc8
	movs r1, #0x52
	movs r2, #1
	bl sub_080F2C1C
	ldr r0, _080EC904 @ =gUnk_02000000
	ldr r1, _080EC908 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EC92C
	cmp r1, #2
	beq _080EC924
	cmp r1, #3
	beq _080EC91C
	cmp r1, #4
	beq _080EC914
	ldr r3, _080EC90C @ =gUnk_09DBFFE8
	cmp r1, #5
	bne _080EC92E
	ldr r2, _080EC910 @ =0x0003AB32
	adds r3, r3, r2
	b _080EC92E
	.align 2, 0
_080EC900: .4byte gUnk_09DCAF2A
_080EC904: .4byte gUnk_02000000
_080EC908: .4byte 0x00006C2C
_080EC90C: .4byte gUnk_09DBFFE8
_080EC910: .4byte 0x0003AB32
_080EC914:
	ldr r3, _080EC918 @ =gUnk_09DEEF54
	b _080EC92E
	.align 2, 0
_080EC918: .4byte gUnk_09DEEF54
_080EC91C:
	ldr r3, _080EC920 @ =gUnk_09DE2AAE
	b _080EC92E
	.align 2, 0
_080EC920: .4byte gUnk_09DE2AAE
_080EC924:
	ldr r3, _080EC928 @ =gUnk_09DD671A
	b _080EC92E
	.align 2, 0
_080EC928: .4byte gUnk_09DD671A
_080EC92C:
	ldr r3, _080EC980 @ =gUnk_09DCADCE
_080EC92E:
	movs r0, #0x1c
	movs r1, #0x62
	movs r2, #1
	bl sub_080F2A7C
	bl sub_080E1788
	adds r4, r0, #0
	bl sub_080E0FEC
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_080EC2D0
	adds r3, r0, #0
	movs r0, #0xc2
	movs r1, #0x62
	movs r2, #1
	bl sub_080F2C8C
	ldr r0, _080EC984 @ =gUnk_02000000
	ldr r3, _080EC988 @ =0x00006C2C
	adds r0, r0, r3
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EC9AC
	cmp r1, #2
	beq _080EC9A4
	cmp r1, #3
	beq _080EC99C
	cmp r1, #4
	beq _080EC994
	ldr r3, _080EC98C @ =gUnk_09DC0158
	cmp r1, #5
	bne _080EC9AE
	ldr r0, _080EC990 @ =0x0003AB64
	adds r3, r3, r0
	b _080EC9AE
	.align 2, 0
_080EC980: .4byte gUnk_09DCADCE
_080EC984: .4byte gUnk_02000000
_080EC988: .4byte 0x00006C2C
_080EC98C: .4byte gUnk_09DC0158
_080EC990: .4byte 0x0003AB64
_080EC994:
	ldr r3, _080EC998 @ =gUnk_09DEF0EC
	b _080EC9AE
	.align 2, 0
_080EC998: .4byte gUnk_09DEF0EC
_080EC99C:
	ldr r3, _080EC9A0 @ =gUnk_09DE2C5C
	b _080EC9AE
	.align 2, 0
_080EC9A0: .4byte gUnk_09DE2C5C
_080EC9A4:
	ldr r3, _080EC9A8 @ =gUnk_09DD68D6
	b _080EC9AE
	.align 2, 0
_080EC9A8: .4byte gUnk_09DD68D6
_080EC9AC:
	ldr r3, _080EC9E0 @ =gUnk_09DCAF2A
_080EC9AE:
	movs r0, #0xc8
	movs r1, #0x62
	movs r2, #1
	bl sub_080F2C1C
	ldr r0, _080EC9E4 @ =gUnk_02000000
	ldr r1, _080EC9E8 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080ECA0C
	cmp r1, #2
	beq _080ECA04
	cmp r1, #3
	beq _080EC9FC
	cmp r1, #4
	beq _080EC9F4
	ldr r3, _080EC9EC @ =gUnk_09DBFFF6
	cmp r1, #5
	bne _080ECA0E
	ldr r2, _080EC9F0 @ =0x0003AB34
	adds r3, r3, r2
	b _080ECA0E
	.align 2, 0
_080EC9E0: .4byte gUnk_09DCAF2A
_080EC9E4: .4byte gUnk_02000000
_080EC9E8: .4byte 0x00006C2C
_080EC9EC: .4byte gUnk_09DBFFF6
_080EC9F0: .4byte 0x0003AB34
_080EC9F4:
	ldr r3, _080EC9F8 @ =gUnk_09DEEF64
	b _080ECA0E
	.align 2, 0
_080EC9F8: .4byte gUnk_09DEEF64
_080EC9FC:
	ldr r3, _080ECA00 @ =gUnk_09DE2ABA
	b _080ECA0E
	.align 2, 0
_080ECA00: .4byte gUnk_09DE2ABA
_080ECA04:
	ldr r3, _080ECA08 @ =gUnk_09DD672C
	b _080ECA0E
	.align 2, 0
_080ECA08: .4byte gUnk_09DD672C
_080ECA0C:
	ldr r3, _080ECA64 @ =gUnk_09DCADDC
_080ECA0E:
	movs r0, #0x1c
	movs r1, #0x72
	movs r2, #1
	bl sub_080F2A7C
	bl sub_080E1788
	adds r4, r0, #0
	bl sub_080E0FEC
	adds r4, r4, r0
	bl sub_080E3258
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_080EC2D0
	adds r3, r0, #0
	movs r0, #0xc2
	movs r1, #0x72
	movs r2, #1
	bl sub_080F2C8C
	ldr r0, _080ECA68 @ =gUnk_02000000
	ldr r3, _080ECA6C @ =0x00006C2C
	adds r0, r0, r3
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080ECA90
	cmp r1, #2
	beq _080ECA88
	cmp r1, #3
	beq _080ECA80
	cmp r1, #4
	beq _080ECA78
	ldr r3, _080ECA70 @ =gUnk_09DC0158
	cmp r1, #5
	bne _080ECA92
	ldr r0, _080ECA74 @ =0x0003AB64
	adds r3, r3, r0
	b _080ECA92
	.align 2, 0
_080ECA64: .4byte gUnk_09DCADDC
_080ECA68: .4byte gUnk_02000000
_080ECA6C: .4byte 0x00006C2C
_080ECA70: .4byte gUnk_09DC0158
_080ECA74: .4byte 0x0003AB64
_080ECA78:
	ldr r3, _080ECA7C @ =gUnk_09DEF0EC
	b _080ECA92
	.align 2, 0
_080ECA7C: .4byte gUnk_09DEF0EC
_080ECA80:
	ldr r3, _080ECA84 @ =gUnk_09DE2C5C
	b _080ECA92
	.align 2, 0
_080ECA84: .4byte gUnk_09DE2C5C
_080ECA88:
	ldr r3, _080ECA8C @ =gUnk_09DD68D6
	b _080ECA92
	.align 2, 0
_080ECA8C: .4byte gUnk_09DD68D6
_080ECA90:
	ldr r3, _080ECAC4 @ =gUnk_09DCAF2A
_080ECA92:
	movs r0, #0xc8
	movs r1, #0x72
	movs r2, #1
	bl sub_080F2C1C
	ldr r0, _080ECAC8 @ =gUnk_02000000
	ldr r1, _080ECACC @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080ECAF0
	cmp r1, #2
	beq _080ECAE8
	cmp r1, #3
	beq _080ECAE0
	cmp r1, #4
	beq _080ECAD8
	ldr r3, _080ECAD0 @ =gUnk_09DC0006
	cmp r1, #5
	bne _080ECAF2
	ldr r2, _080ECAD4 @ =0x0003AB32
	adds r3, r3, r2
	b _080ECAF2
	.align 2, 0
_080ECAC4: .4byte gUnk_09DCAF2A
_080ECAC8: .4byte gUnk_02000000
_080ECACC: .4byte 0x00006C2C
_080ECAD0: .4byte gUnk_09DC0006
_080ECAD4: .4byte 0x0003AB32
_080ECAD8:
	ldr r3, _080ECADC @ =gUnk_09DEEF70
	b _080ECAF2
	.align 2, 0
_080ECADC: .4byte gUnk_09DEEF70
_080ECAE0:
	ldr r3, _080ECAE4 @ =gUnk_09DE2AC8
	b _080ECAF2
	.align 2, 0
_080ECAE4: .4byte gUnk_09DE2AC8
_080ECAE8:
	ldr r3, _080ECAEC @ =gUnk_09DD6740
	b _080ECAF2
	.align 2, 0
_080ECAEC: .4byte gUnk_09DD6740
_080ECAF0:
	ldr r3, _080ECB34 @ =gUnk_09DCADE8
_080ECAF2:
	movs r0, #0x1c
	movs r1, #0x82
	movs r2, #1
	bl sub_080F2A7C
	ldr r4, _080ECB38 @ =gUnk_02000000
	ldr r3, _080ECB3C @ =0x00006E34
	adds r0, r4, r3
	ldrh r3, [r0]
	movs r0, #0xc2
	movs r1, #0x82
	movs r2, #1
	bl sub_080F2C8C
	ldr r0, _080ECB40 @ =0x00006C2C
	adds r4, r4, r0
	movs r1, #7
	ldrb r4, [r4]
	ands r1, r4
	cmp r1, #1
	beq _080ECB64
	cmp r1, #2
	beq _080ECB5C
	cmp r1, #3
	beq _080ECB54
	cmp r1, #4
	beq _080ECB4C
	ldr r0, _080ECB44 @ =gUnk_09DC0140
	cmp r1, #5
	bne _080ECB66
	ldr r1, _080ECB48 @ =0x0003AB5E
	adds r0, r0, r1
	b _080ECB66
	.align 2, 0
_080ECB34: .4byte gUnk_09DCADE8
_080ECB38: .4byte gUnk_02000000
_080ECB3C: .4byte 0x00006E34
_080ECB40: .4byte 0x00006C2C
_080ECB44: .4byte gUnk_09DC0140
_080ECB48: .4byte 0x0003AB5E
_080ECB4C:
	ldr r0, _080ECB50 @ =gUnk_09DEF0D2
	b _080ECB66
	.align 2, 0
_080ECB50: .4byte gUnk_09DEF0D2
_080ECB54:
	ldr r0, _080ECB58 @ =gUnk_09DE2C3C
	b _080ECB66
	.align 2, 0
_080ECB58: .4byte gUnk_09DE2C3C
_080ECB5C:
	ldr r0, _080ECB60 @ =gUnk_09DD68BC
	b _080ECB66
	.align 2, 0
_080ECB60: .4byte gUnk_09DD68BC
_080ECB64:
	ldr r0, _080ECB9C @ =gUnk_09DCAF12
_080ECB66:
	bl StringLength
	lsls r1, r0, #1
	adds r1, r1, r0
	movs r0, #0x3c
	subs r2, r0, r1
	ldr r0, _080ECBA0 @ =gUnk_02000000
	ldr r3, _080ECBA4 @ =0x00006C2C
	adds r0, r0, r3
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080ECBC8
	cmp r1, #2
	beq _080ECBC0
	cmp r1, #3
	beq _080ECBB8
	cmp r1, #4
	beq _080ECBB0
	ldr r3, _080ECBA8 @ =gUnk_09DC0140
	cmp r1, #5
	bne _080ECBCA
	ldr r0, _080ECBAC @ =0x0003AB5E
	adds r3, r3, r0
	b _080ECBCA
	.align 2, 0
_080ECB9C: .4byte gUnk_09DCAF12
_080ECBA0: .4byte gUnk_02000000
_080ECBA4: .4byte 0x00006C2C
_080ECBA8: .4byte gUnk_09DC0140
_080ECBAC: .4byte 0x0003AB5E
_080ECBB0:
	ldr r3, _080ECBB4 @ =gUnk_09DEF0D2
	b _080ECBCA
	.align 2, 0
_080ECBB4: .4byte gUnk_09DEF0D2
_080ECBB8:
	ldr r3, _080ECBBC @ =gUnk_09DE2C3C
	b _080ECBCA
	.align 2, 0
_080ECBBC: .4byte gUnk_09DE2C3C
_080ECBC0:
	ldr r3, _080ECBC4 @ =gUnk_09DD68BC
	b _080ECBCA
	.align 2, 0
_080ECBC4: .4byte gUnk_09DD68BC
_080ECBC8:
	ldr r3, _080ECBFC @ =gUnk_09DCAF12
_080ECBCA:
	adds r0, r2, #0
	movs r1, #0x92
	movs r2, #1
	bl sub_080F2A7C
	ldr r0, _080ECC00 @ =gUnk_02000000
	ldr r1, _080ECC04 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080ECC28
	cmp r1, #2
	beq _080ECC20
	cmp r1, #3
	beq _080ECC18
	cmp r1, #4
	beq _080ECC10
	ldr r0, _080ECC08 @ =gUnk_09DC014A
	cmp r1, #5
	bne _080ECC2A
	ldr r2, _080ECC0C @ =0x0003AB64
	adds r0, r0, r2
	b _080ECC2A
	.align 2, 0
_080ECBFC: .4byte gUnk_09DCAF12
_080ECC00: .4byte gUnk_02000000
_080ECC04: .4byte 0x00006C2C
_080ECC08: .4byte gUnk_09DC014A
_080ECC0C: .4byte 0x0003AB64
_080ECC10:
	ldr r0, _080ECC14 @ =gUnk_09DEF0DE
	b _080ECC2A
	.align 2, 0
_080ECC14: .4byte gUnk_09DEF0DE
_080ECC18:
	ldr r0, _080ECC1C @ =gUnk_09DE2C4C
	b _080ECC2A
	.align 2, 0
_080ECC1C: .4byte gUnk_09DE2C4C
_080ECC20:
	ldr r0, _080ECC24 @ =gUnk_09DD68C8
	b _080ECC2A
	.align 2, 0
_080ECC24: .4byte gUnk_09DD68C8
_080ECC28:
	ldr r0, _080ECC60 @ =gUnk_09DCAF1E
_080ECC2A:
	bl StringLength
	lsls r1, r0, #1
	adds r1, r1, r0
	movs r0, #0xb4
	subs r2, r0, r1
	ldr r0, _080ECC64 @ =gUnk_02000000
	ldr r3, _080ECC68 @ =0x00006C2C
	adds r0, r0, r3
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080ECC8C
	cmp r1, #2
	beq _080ECC84
	cmp r1, #3
	beq _080ECC7C
	cmp r1, #4
	beq _080ECC74
	ldr r3, _080ECC6C @ =gUnk_09DC014A
	cmp r1, #5
	bne _080ECC8E
	ldr r0, _080ECC70 @ =0x0003AB64
	adds r3, r3, r0
	b _080ECC8E
	.align 2, 0
_080ECC60: .4byte gUnk_09DCAF1E
_080ECC64: .4byte gUnk_02000000
_080ECC68: .4byte 0x00006C2C
_080ECC6C: .4byte gUnk_09DC014A
_080ECC70: .4byte 0x0003AB64
_080ECC74:
	ldr r3, _080ECC78 @ =gUnk_09DEF0DE
	b _080ECC8E
	.align 2, 0
_080ECC78: .4byte gUnk_09DEF0DE
_080ECC7C:
	ldr r3, _080ECC80 @ =gUnk_09DE2C4C
	b _080ECC8E
	.align 2, 0
_080ECC80: .4byte gUnk_09DE2C4C
_080ECC84:
	ldr r3, _080ECC88 @ =gUnk_09DD68C8
	b _080ECC8E
	.align 2, 0
_080ECC88: .4byte gUnk_09DD68C8
_080ECC8C:
	ldr r3, _080ECCD8 @ =gUnk_09DCAF1E
_080ECC8E:
	adds r0, r2, #0
	movs r1, #0x92
	movs r2, #1
	bl sub_080F2A7C
	ldr r0, _080ECCDC @ =0x06005500
	movs r1, #0
	bl sub_080F2E4C
	ldr r5, _080ECCE0 @ =0x000010A8 (Beastking of the Swamps)
	movs r1, #0
	ldr r6, _080ECCE4 @ =0x06001000
_080ECCA6:
	lsls r0, r1, #6
	adds r2, r0, r6
	adds r4, r1, #1
	movs r3, #0x1d
_080ECCAE:
	adds r1, r5, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	strh r1, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _080ECCAE
	adds r1, r4, #0
	cmp r1, #0x13
	ble _080ECCA6
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ECCD8: .4byte gUnk_09DCAF1E
_080ECCDC: .4byte 0x06005500
_080ECCE0: .4byte 0x000010A8 @ Beastking of the Swamps
_080ECCE4: .4byte 0x06001000

	thumb_func_start sub_080ECCE8
sub_080ECCE8: @ 0x080ECCE8
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080ECE24 @ =0x0014001D
	movs r2, #0x82
	lsls r2, r2, #6
	movs r1, #0x80
	bl sub_080F616C
	ldr r7, _080ECE28 @ =gUnk_020297E0
	movs r0, #0x20
	ldrb r1, [r7, #1]
	ands r0, r1
	cmp r0, #0
	beq _080ECD68
	ldr r4, [r7]
	lsls r4, r4, #0x13
	lsrs r0, r4, #0x1c
	movs r1, #5
	bl __umodsi3
	adds r5, r0, #0
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	lsrs r4, r4, #0x1c
	adds r0, r4, #0
	movs r1, #5
	bl __udivsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r3, r5, #2
	adds r3, r3, r5
	lsls r3, r3, #3
	lsls r1, r0, #2
	adds r1, r1, r0
	adds r3, #0x18
	lsls r1, r1, #0x13
	movs r0, #0x88
	lsls r0, r0, #0xf
	adds r1, r1, r0
	orrs r3, r1
	ldr r2, _080ECE2C @ =gUnk_09E5EEE4
	ldr r0, _080ECE30 @ =gUnk_03000040
	movs r1, #0x83
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r0, [r0]
	lsrs r0, r0, #2
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #5
	adds r2, r0, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	adds r0, r3, #0
	movs r1, #0x80
	bl sub_080F61E4
_080ECD68:
	ldr r2, [r7]
	lsls r1, r2, #0x11
	lsrs r1, r1, #0x1f
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0xc
	movs r6, #0x90
	lsls r6, r6, #0x10
	orrs r0, r6
	movs r3, #0x81
	lsls r3, r3, #7
	mov sb, r3
	ldr r1, _080ECE34 @ =gUnk_09E5EEC4
	mov r8, r1
	lsls r2, r2, #0x12
	lsrs r2, r2, #0x1f
	lsls r2, r2, #1
	ldr r4, _080ECE30 @ =gUnk_03000040
	movs r3, #0x83
	lsls r3, r3, #2
	adds r4, r4, r3
	ldrh r3, [r4]
	lsrs r1, r3, #2
	movs r5, #7
	ands r1, r5
	lsls r1, r1, #2
	adds r2, r2, r1
	add r2, r8
	ldrh r2, [r2]
	movs r1, #0xe0
	lsls r1, r1, #5
	adds r2, r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r1, sb
	bl sub_080F616C
	ldr r2, [r7]
	lsls r1, r2, #0x11
	lsrs r1, r1, #0x1f
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x2c
	orrs r0, r6
	lsls r2, r2, #0x12
	lsrs r2, r2, #0x1f
	lsls r2, r2, #1
	ldrh r3, [r4]
	lsrs r1, r3, #2
	ands r1, r5
	lsls r1, r1, #2
	adds r2, r2, r1
	add r2, r8
	ldrh r2, [r2]
	ldr r1, _080ECE38 @ =0x00001C01
	adds r2, r2, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r1, sb
	bl sub_080F616C
	ldr r2, [r7]
	lsls r1, r2, #0x11
	lsrs r1, r1, #0x1f
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x4c
	orrs r0, r6
	lsls r2, r2, #0x12
	lsrs r2, r2, #0x1f
	lsls r2, r2, #1
	ldrh r4, [r4]
	lsrs r1, r4, #2
	ands r1, r5
	lsls r1, r1, #2
	adds r2, r2, r1
	add r2, r8
	ldrh r2, [r2]
	ldr r3, _080ECE3C @ =0x00001C02
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r1, sb
	bl sub_080F616C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ECE24: .4byte 0x0014001D
_080ECE28: .4byte gUnk_020297E0
_080ECE2C: .4byte gUnk_09E5EEE4
_080ECE30: .4byte gUnk_03000040
_080ECE34: .4byte gUnk_09E5EEC4
_080ECE38: .4byte 0x00001C01
_080ECE3C: .4byte 0x00001C02

	thumb_func_start sub_080ECE40
sub_080ECE40: @ 0x080ECE40
	push {r4, r5, r6, r7, lr}
	ldr r1, _080ECE64 @ =gUnk_03000040
	movs r2, #0x81
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x18
	adds r2, r1, #0
	cmp r0, #0x15
	bls _080ECE58
	b _080ED474
_080ECE58:
	lsls r0, r0, #2
	ldr r1, _080ECE68 @ =_080ECE6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ECE64: .4byte gUnk_03000040
_080ECE68: .4byte _080ECE6C
_080ECE6C: @ jump table
	.4byte _080ECEC4 @ case 0
	.4byte _080ECF24 @ case 1
	.4byte _080ECF6C @ case 2
	.4byte _080ED088 @ case 3
	.4byte _080ED474 @ case 4
	.4byte _080ED474 @ case 5
	.4byte _080ED474 @ case 6
	.4byte _080ED474 @ case 7
	.4byte _080ED474 @ case 8
	.4byte _080ED474 @ case 9
	.4byte _080ED09A @ case 10
	.4byte _080ED0BE @ case 11
	.4byte _080ED13E @ case 12
	.4byte _080ED474 @ case 13
	.4byte _080ED474 @ case 14
	.4byte _080ED290 @ case 15
	.4byte _080ED2B4 @ case 16
	.4byte _080ED474 @ case 17
	.4byte _080ED474 @ case 18
	.4byte _080ED474 @ case 19
	.4byte _080ED348 @ case 20
	.4byte _080ED39C @ case 21
_080ECEC4:
	bl sub_080EC200
	bl sub_080EC31C
	ldr r2, _080ECF14 @ =gUnk_020297E0
	ldr r0, _080ECF18 @ =0xFFFFFE1F
	ldrh r3, [r2]
	ands r0, r3
	strh r0, [r2]
	movs r0, #0x1f
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	adds r1, #0x20
	ands r0, r1
	strb r0, [r2, #1]
	ldr r2, _080ECF1C @ =gUnk_03000040
	movs r3, #0x81
	lsls r3, r3, #2
	adds r2, r2, r3
	ldrh r3, [r2]
	lsls r1, r3, #0x12
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #6
	ldr r0, _080ECF20 @ =0xFFFFC03F
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
	movs r0, #4
	bl sub_080F9ADC
_080ECF0E:
	movs r0, #0
	b _080ED47E
	.align 2, 0
_080ECF14: .4byte gUnk_020297E0
_080ECF18: .4byte 0xFFFFFE1F
_080ECF1C: .4byte gUnk_03000040
_080ECF20: .4byte 0xFFFFC03F
_080ECF24:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r0, [r2]
	movs r3, #0xe0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	bl sub_080ECCE8
	movs r0, #4
	bl sub_080F58B8
	cmp r0, #0
	beq _080ECF0E
	ldr r2, _080ECF64 @ =gUnk_03000040
	movs r0, #0x81
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrh r3, [r2]
	lsls r1, r3, #0x12
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #6
	ldr r0, _080ECF68 @ =0xFFFFC03F
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
	b _080ECF0E
	.align 2, 0
_080ECF64: .4byte gUnk_03000040
_080ECF68: .4byte 0xFFFFC03F
_080ECF6C:
	bl sub_080ECCE8
	ldr r1, _080ECFF4 @ =gUnk_03000040
	movs r2, #0xa4
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r0, #0x10
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080ECF9C
	ldr r4, _080ECFF8 @ =gUnk_020297E0
	movs r0, #0x40
	ldrb r3, [r4, #1]
	ands r0, r3
	cmp r0, #0
	bne _080ECF9C
	movs r0, #0
	bl sub_080F9AB4
	movs r0, #0x40
	ldrb r1, [r4, #1]
	orrs r0, r1
	strb r0, [r4, #1]
_080ECF9C:
	ldr r1, _080ECFF4 @ =gUnk_03000040
	movs r2, #0xa4
	lsls r2, r2, #1
	adds r1, r1, r2
	movs r0, #0x20
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080ECFCA
	ldr r4, _080ECFF8 @ =gUnk_020297E0
	movs r0, #0x40
	ldrb r3, [r4, #1]
	ands r0, r3
	cmp r0, #0
	beq _080ECFCA
	movs r0, #0
	bl sub_080F9AB4
	movs r0, #0x41
	rsbs r0, r0, #0
	ldrb r1, [r4, #1]
	ands r0, r1
	strb r0, [r4, #1]
_080ECFCA:
	ldr r4, _080ECFF4 @ =gUnk_03000040
	movs r2, #0xa4
	lsls r2, r2, #1
	adds r0, r4, r2
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080ED000
	movs r0, #1
	bl sub_080F9AB4
	movs r3, #0x81
	lsls r3, r3, #2
	adds r0, r4, r3
	ldr r1, _080ECFFC @ =0xFFFFC03F
	ldrh r2, [r0]
	ands r1, r2
	movs r2, #0xc0
	b _080ED07E
	.align 2, 0
_080ECFF4: .4byte gUnk_03000040
_080ECFF8: .4byte gUnk_020297E0
_080ECFFC: .4byte 0xFFFFC03F
_080ED000:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080ED00A
	b _080ECF0E
_080ED00A:
	movs r0, #0x24
	bl sub_080F9AB4
	ldr r3, _080ED05C @ =gUnk_020297E0
	ldrb r2, [r3, #1]
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _080ED06C
	movs r0, #0x20
	orrs r2, r0
	ldr r0, _080ED060 @ =gUnk_02000000
	ldr r1, _080ED064 @ =0x00006E57
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1c
	lsls r0, r0, #1
	movs r1, #0x1f
	rsbs r1, r1, #0
	ands r2, r1
	orrs r2, r0
	strb r2, [r3, #1]
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r2, [r3]
	ands r0, r2
	movs r1, #0x1c
	orrs r0, r1
	strb r0, [r3]
	movs r3, #0x81
	lsls r3, r3, #2
	adds r2, r4, r3
	ldr r0, _080ED068 @ =0xFFFFC03F
	ldrh r1, [r2]
	ands r0, r1
	adds r3, #0x7c
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	b _080ECF0E
	.align 2, 0
_080ED05C: .4byte gUnk_020297E0
_080ED060: .4byte gUnk_02000000
_080ED064: .4byte 0x00006E57
_080ED068: .4byte 0xFFFFC03F
_080ED06C:
	movs r1, #0x81
	lsls r1, r1, #2
	adds r0, r4, r1
	ldr r1, _080ED084 @ =0xFFFFC03F
	ldrh r2, [r0]
	ands r1, r2
	movs r3, #0xa0
	lsls r3, r3, #3
	adds r2, r3, #0
_080ED07E:
	orrs r1, r2
	strh r1, [r0]
	b _080ECF0E
	.align 2, 0
_080ED084: .4byte 0xFFFFC03F
_080ED088:
	bl sub_080ECCE8
	movs r0, #4
	bl sub_080F5840
	cmp r0, #0
	beq _080ED098
	b _080ED474
_080ED098:
	b _080ECF0E
_080ED09A:
	ldr r1, _080ED108 @ =0x04000050
	ldr r3, _080ED10C @ =0x00003C43
	adds r0, r3, #0
	strh r0, [r1]
	movs r0, #0x81
	lsls r0, r0, #2
	adds r3, r2, r0
	ldrh r2, [r3]
	lsls r1, r2, #0x12
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #6
	ldr r0, _080ED110 @ =0xFFFFC03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
_080ED0BE:
	ldr r2, _080ED114 @ =0x04000052
	ldr r4, _080ED118 @ =gUnk_020297E0
	ldr r1, [r4]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1b
	movs r5, #0x1f
	subs r0, r5, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #8
	orrs r0, r1
	strh r0, [r2]
	subs r2, #0x52
	ldrh r0, [r2]
	movs r3, #0xc0
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	bl sub_080ECCE8
	ldrb r2, [r4]
	movs r1, #0x1f
	ands r1, r2
	cmp r1, #0
	beq _080ED11C
	ldr r0, [r4]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	subs r0, #4
	ands r0, r5
	movs r1, #0x20
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r4]
	b _080ECF0E
	.align 2, 0
_080ED108: .4byte 0x04000050
_080ED10C: .4byte 0x00003C43
_080ED110: .4byte 0xFFFFC03F
_080ED114: .4byte 0x04000052
_080ED118: .4byte gUnk_020297E0
_080ED11C:
	ldr r0, _080ED278 @ =0x04000050
	strh r1, [r0]
	ldr r2, _080ED27C @ =gUnk_03000040
	movs r0, #0x81
	lsls r0, r0, #2
	adds r2, r2, r0
	ldrh r3, [r2]
	lsls r1, r3, #0x12
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #6
	ldr r0, _080ED280 @ =0xFFFFC03F
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
_080ED13E:
	bl sub_080ECCE8
	movs r5, #0
	ldr r6, _080ED27C @ =gUnk_03000040
	movs r1, #0xa4
	lsls r1, r1, #1
	adds r7, r6, r1
	movs r0, #0x10
	ldrh r2, [r7]
	ands r0, r2
	cmp r0, #0
	beq _080ED180
	movs r0, #0
	bl sub_080F9AB4
	movs r5, #1
	ldr r4, _080ED284 @ =gUnk_020297E0
	ldr r0, [r4]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1c
	adds r0, #1
	movs r1, #0xa
	bl __modsi3
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	movs r1, #0x1f
	rsbs r1, r1, #0
	ldrb r3, [r4, #1]
	ands r1, r3
	orrs r1, r0
	strb r1, [r4, #1]
_080ED180:
	movs r0, #0x20
	ldrh r1, [r7]
	ands r0, r1
	cmp r0, #0
	beq _080ED1B4
	movs r0, #0
	bl sub_080F9AB4
	movs r5, #1
	ldr r4, _080ED284 @ =gUnk_020297E0
	ldr r0, [r4]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1c
	adds r0, #9
	movs r1, #0xa
	bl __modsi3
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	movs r1, #0x1f
	rsbs r1, r1, #0
	ldrb r2, [r4, #1]
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #1]
_080ED1B4:
	movs r0, #0xc0
	ldrh r3, [r7]
	ands r0, r3
	cmp r0, #0
	beq _080ED1E8
	movs r0, #0
	bl sub_080F9AB4
	movs r5, #1
	ldr r4, _080ED284 @ =gUnk_020297E0
	ldr r0, [r4]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1c
	adds r0, #5
	movs r1, #0xa
	bl __modsi3
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	movs r1, #0x1f
	rsbs r1, r1, #0
	ldrb r2, [r4, #1]
	ands r1, r2
	orrs r1, r0
	strb r1, [r4, #1]
_080ED1E8:
	cmp r5, #0
	beq _080ED1F8
	ldr r0, _080ED284 @ =gUnk_020297E0
	ldr r0, [r0]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1c
	bl sub_080EC294
_080ED1F8:
	movs r0, #2
	ldrh r3, [r7]
	ands r0, r3
	cmp r0, #0
	beq _080ED22E
	movs r0, #1
	bl sub_080F9AB4
	ldr r0, _080ED288 @ =gUnk_02000000
	ldr r1, _080ED28C @ =0x00006E57
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1c
	bl sub_080EC294
	movs r3, #0x81
	lsls r3, r3, #2
	adds r2, r6, r3
	ldr r0, _080ED280 @ =0xFFFFC03F
	ldrh r1, [r2]
	ands r0, r1
	movs r3, #0xf0
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
_080ED22E:
	movs r0, #1
	ldrh r7, [r7]
	ands r0, r7
	cmp r0, #0
	bne _080ED23A
	b _080ECF0E
_080ED23A:
	movs r0, #0x24
	bl sub_080F9AB4
	ldr r2, _080ED288 @ =gUnk_02000000
	ldr r0, _080ED284 @ =gUnk_020297E0
	ldr r1, [r0]
	lsls r1, r1, #0x13
	ldr r0, _080ED28C @ =0x00006E57
	adds r2, r2, r0
	lsrs r1, r1, #0x1c
	lsls r1, r1, #3
	movs r0, #0x79
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	bl sub_080F9C88
	movs r0, #0x81
	lsls r0, r0, #2
	adds r2, r6, r0
	ldr r0, _080ED280 @ =0xFFFFC03F
	ldrh r1, [r2]
	ands r0, r1
	movs r3, #0xf0
	lsls r3, r3, #2
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	b _080ECF0E
	.align 2, 0
_080ED278: .4byte 0x04000050
_080ED27C: .4byte gUnk_03000040
_080ED280: .4byte 0xFFFFC03F
_080ED284: .4byte gUnk_020297E0
_080ED288: .4byte gUnk_02000000
_080ED28C: .4byte 0x00006E57
_080ED290:
	ldr r1, _080ED2F0 @ =0x04000050
	ldr r3, _080ED2F4 @ =0x00003C43
	adds r0, r3, #0
	strh r0, [r1]
	movs r0, #0x81
	lsls r0, r0, #2
	adds r3, r2, r0
	ldrh r2, [r3]
	lsls r1, r2, #0x12
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #6
	ldr r0, _080ED2F8 @ =0xFFFFC03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3]
_080ED2B4:
	ldr r2, _080ED2FC @ =0x04000052
	ldr r4, _080ED300 @ =gUnk_020297E0
	ldr r1, [r4]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1b
	movs r5, #0x1f
	subs r0, r5, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #8
	orrs r0, r1
	strh r0, [r2]
	bl sub_080ECCE8
	ldr r0, [r4]
	lsls r1, r0, #0x1b
	lsrs r0, r1, #0x1b
	cmp r0, #0x1b
	bhi _080ED304
	adds r1, r0, #0
	adds r1, #4
	ands r1, r5
	movs r0, #0x20
	rsbs r0, r0, #0
	ldrb r2, [r4]
	ands r0, r2
	orrs r0, r1
	strb r0, [r4]
	b _080ECF0E
	.align 2, 0
_080ED2F0: .4byte 0x04000050
_080ED2F4: .4byte 0x00003C43
_080ED2F8: .4byte 0xFFFFC03F
_080ED2FC: .4byte 0x04000052
_080ED300: .4byte gUnk_020297E0
_080ED304:
	movs r2, #0x80
	lsls r2, r2, #0x13
	ldrh r1, [r2]
	ldr r0, _080ED338 @ =0x0000FCFF
	ands r0, r1
	strh r0, [r2]
	ldr r1, _080ED33C @ =0x04000050
	movs r0, #0
	strh r0, [r1]
	ldr r2, _080ED340 @ =gUnk_03000040
	movs r3, #0x81
	lsls r3, r3, #2
	adds r2, r2, r3
	ldr r0, _080ED344 @ =0xFFFFC03F
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r2, [r4, #1]
	ands r0, r2
	strb r0, [r4, #1]
	b _080ECF0E
	.align 2, 0
_080ED338: .4byte 0x0000FCFF
_080ED33C: .4byte 0x04000050
_080ED340: .4byte gUnk_03000040
_080ED344: .4byte 0xFFFFC03F
_080ED348:
	bl sub_080ECCE8
	movs r0, #4
	bl sub_080F5840
	cmp r0, #0
	bne _080ED358
	b _080ECF0E
_080ED358:
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	ldr r4, _080ED390 @ =gUnk_03000040
	movs r3, #0x81
	lsls r3, r3, #2
	adds r4, r4, r3
	ldr r0, [r4]
	ldr r1, _080ED394 @ =0xFFC03FFF
	ands r0, r1
	str r0, [r4]
	movs r0, #5
	bl sub_080F9ADC
	ldrh r2, [r4]
	lsls r1, r2, #0x12
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #6
	ldr r0, _080ED398 @ =0xFFFFC03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r4]
	b _080ECF0E
	.align 2, 0
_080ED390: .4byte gUnk_03000040
_080ED394: .4byte 0xFFC03FFF
_080ED398: .4byte 0xFFFFC03F
_080ED39C:
	movs r3, #0
	ldr r2, _080ED3C8 @ =gUnk_02000000
	ldr r0, _080ED3CC @ =0x00006C2C
	adds r1, r2, r0
	movs r4, #7
	adds r0, r4, #0
	ldrb r1, [r1]
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	bne _080ED3B4
	movs r3, #1
_080ED3B4:
	ldr r2, _080ED3D0 @ =0x00006E57
	adds r1, r5, r2
	adds r0, r4, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080ED3D4
	cmp r3, #0
	beq _080ED3D8
	b _080ED3E0
	.align 2, 0
_080ED3C8: .4byte gUnk_02000000
_080ED3CC: .4byte 0x00006C2C
_080ED3D0: .4byte 0x00006E57
_080ED3D4:
	cmp r3, #0
	beq _080ED3E0
_080ED3D8:
	ldr r2, _080ED3DC @ =gUnk_09E4E97C
	b _080ED3E2
	.align 2, 0
_080ED3DC: .4byte gUnk_09E4E97C
_080ED3E0:
	ldr r2, _080ED454 @ =gUnk_02006E48
_080ED3E2:
	ldr r3, _080ED458 @ =0x00006C2C
	adds r6, r5, r3
	movs r0, #7
	ldrb r1, [r6]
	ands r0, r1
	movs r1, #0xe
	cmp r0, #0
	bne _080ED3F4
	movs r1, #7
_080ED3F4:
	adds r0, r2, #0
	bl sub_08019574
	cmp r0, #0
	bne _080ED400
	b _080ECF0E
_080ED400:
	ldr r4, _080ED45C @ =gUnk_03000040
	ldr r2, _080ED460 @ =0x0000023A
	adds r1, r4, r2
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080ED43C
	ldr r3, _080ED464 @ =0x00006E48
	adds r0, r5, r3
	subs r2, #0x20
	adds r1, r4, r2
	movs r2, #0xe
	bl MemoryCopyHalfWord
	ldrb r6, [r6]
	lsls r1, r6, #0x1d
	ldr r3, _080ED468 @ =0x00006E57
	adds r2, r5, r3
	lsrs r1, r1, #0x1d
	movs r0, #7
	ands r1, r0
	movs r0, #8
	rsbs r0, r0, #0
	ldrb r3, [r2]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2]
	bl sub_080F9C88
_080ED43C:
	movs r0, #0x81
	lsls r0, r0, #2
	adds r2, r4, r0
	ldr r0, [r2]
	ldr r1, _080ED46C @ =0xFFC03FFF
	ands r0, r1
	str r0, [r2]
	ldr r0, _080ED470 @ =0xFFFFC03F
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	b _080ECF0E
	.align 2, 0
_080ED454: .4byte gUnk_02006E48
_080ED458: .4byte 0x00006C2C
_080ED45C: .4byte gUnk_03000040
_080ED460: .4byte 0x0000023A
_080ED464: .4byte 0x00006E48
_080ED468: .4byte 0x00006E57
_080ED46C: .4byte 0xFFC03FFF
_080ED470: .4byte 0xFFFFC03F
_080ED474:
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0
	strh r0, [r1]
	movs r0, #1
_080ED47E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080ED484
sub_080ED484: @ 0x080ED484
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, _080ED510 @ =0x04000128
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0x10
	bhi _080ED524
	ldr r0, _080ED514 @ =gUnk_03000040
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r4, _080ED518 @ =0x00000928
	adds r0, r0, r4
	adds r1, r2, #0
	movs r2, #0xe
	bl MemoryCopyHalfWord
	ldr r1, [r5]
	adds r1, r1, r4
	ldr r0, _080ED51C @ =0x0000F0FF
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	ldr r0, [r5]
	adds r1, r0, r4
	ldr r3, _080ED520 @ =0x0000057E
	adds r0, r0, r3
	ldrh r0, [r0]
	lsls r0, r0, #8
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	ldr r0, [r5]
	adds r0, r0, r4
	movs r1, #0xe
	bl sub_080EFA70
	cmp r0, #0
	beq _080ED524
	ldr r1, [r5]
	ldr r3, _080ED520 @ =0x0000057E
	adds r2, r1, r3
	ldrh r3, [r2]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #1
	movs r2, #0xe0
	lsls r2, r2, #2
	adds r0, r0, r2
	adds r0, r1, r0
	adds r1, r1, r4
	movs r2, #0xe
	bl MemoryCopyHalfWord
	ldr r0, [r5]
	ldr r3, _080ED520 @ =0x0000057E
	adds r0, r0, r3
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	ldr r1, [r5]
	adds r1, r1, r3
	movs r0, #0xf
	ldrh r2, [r1]
	ands r0, r2
	strh r0, [r1]
	movs r0, #1
	b _080ED526
	.align 2, 0
_080ED510: .4byte 0x04000128
_080ED514: .4byte gUnk_03000040
_080ED518: .4byte 0x00000928
_080ED51C: .4byte 0x0000F0FF
_080ED520: .4byte 0x0000057E
_080ED524:
	movs r0, #0
_080ED526:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080ED52C
sub_080ED52C: @ 0x080ED52C
	push {lr}
	sub sp, #0x10
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r3, sp
	ldr r2, _080ED54C @ =0x00008006
	strh r2, [r3]
	mov r2, sp
	strh r0, [r2, #2]
	mov r0, sp
	strh r1, [r0, #4]
	bl sub_080ED484
	add sp, #0x10
	pop {r1}
	bx r1
	.align 2, 0
_080ED54C: .4byte 0x00008006

	thumb_func_start sub_080ED550
sub_080ED550: @ 0x080ED550
	push {r4, r5, r6, r7, lr}
	ldr r0, _080ED5C0 @ =gUnk_03000040
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r4, r0, r1
	ldr r2, [r4]
	movs r7, #0x8c
	lsls r7, r7, #3
	adds r0, r2, r7
	ldr r0, [r0]
	cmp r0, #0
	beq _080ED5D4
	ldr r6, _080ED5C4 @ =0x0000057E
	adds r1, r2, r6
	ldrh r3, [r1]
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #1
	movs r5, #0xe0
	lsls r5, r5, #2
	adds r1, r2, r5
	adds r3, r1, r0
	ldrh r2, [r3]
	movs r0, #0xf0
	lsls r0, r0, #8
	ands r0, r2
	movs r1, #0xe0
	lsls r1, r1, #8
	cmp r0, r1
	bne _080ED592
	ldr r1, _080ED5C8 @ =0xFFFFF000
	adds r0, r2, r1
	strh r0, [r3]
_080ED592:
	ldr r0, [r4]
	adds r2, r0, r6
	ldrh r3, [r2]
	lsls r1, r3, #3
	subs r1, r1, r3
	lsls r1, r1, #1
	adds r1, r1, r5
	adds r0, r0, r1
	bl sub_080ED484
	cmp r0, #0
	beq _080ED622
	ldr r0, _080ED5CC @ =gUnk_09E4E984
	ldr r1, [r4]
	ldr r2, _080ED5D0 @ =0x00000928
	adds r1, r1, r2
	ldrh r1, [r1]
	bl OS_Printf
	ldr r1, [r4]
	adds r1, r1, r7
	b _080ED60A
	.align 2, 0
_080ED5C0: .4byte gUnk_03000040
_080ED5C4: .4byte 0x0000057E
_080ED5C8: .4byte 0xFFFFF000
_080ED5CC: .4byte gUnk_09E4E984
_080ED5D0: .4byte 0x00000928
_080ED5D4:
	ldr r3, _080ED614 @ =0x00000464
	adds r0, r2, r3
	movs r5, #0x8d
	lsls r5, r5, #3
	adds r1, r2, r5
	ldr r0, [r0]
	ldr r1, [r1]
	cmp r0, r1
	beq _080ED61C
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	adds r0, r2, r0
	bl sub_080ED484
	cmp r0, #0
	beq _080ED622
	ldr r2, [r4]
	adds r2, r2, r5
	ldr r0, [r2]
	adds r0, #1
	movs r1, #0x3f
	ands r0, r1
	str r0, [r2]
	ldr r1, [r4]
	ldr r0, _080ED618 @ =0x0000046C
	adds r1, r1, r0
_080ED60A:
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	b _080ED622
	.align 2, 0
_080ED614: .4byte 0x00000464
_080ED618: .4byte 0x0000046C
_080ED61C:
	ldr r0, _080ED628 @ =gUnk_09E5EEF4
	bl sub_080ED484
_080ED622:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ED628: .4byte gUnk_09E5EEF4

	thumb_func_start sub_080ED62C
sub_080ED62C: @ 0x080ED62C
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r4, _080ED670 @ =gUnk_03000040
	movs r0, #0xe0
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r0, [r4]
	movs r5, #0xb3
	lsls r5, r5, #3
	adds r2, r0, r5
	ldr r3, [r2]
	lsls r2, r3, #3
	subs r2, r2, r3
	lsls r2, r2, #1
	movs r3, #0xb4
	lsls r3, r3, #3
	adds r2, r2, r3
	adds r0, r0, r2
	movs r2, #0xe
	bl MemoryCopyHalfWord
	ldr r2, [r4]
	adds r2, r2, r5
	ldr r0, [r2]
	adds r0, #1
	movs r1, #0x3f
	ands r0, r1
	str r0, [r2]
	bl sub_080ED550
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ED670: .4byte gUnk_03000040

	thumb_func_start sub_080ED674
sub_080ED674: @ 0x080ED674
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r2, _080ED6AC @ =gUnk_03000040
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r2, r1
	ldr r1, [r0]
	lsls r0, r7, #3
	subs r0, r0, r7
	lsls r0, r0, #1
	movs r3, #0xb4
	lsls r3, r3, #3
	adds r1, r1, r3
	adds r1, r1, r0
	ldrb r6, [r1]
	adds r6, #6
	lsls r0, r6, #0x18
	lsrs r5, r0, #0x18
	movs r1, #0xb0
	lsls r1, r1, #8
	adds r0, r1, #0
	orrs r5, r0
	movs r4, #0
	mov r8, r2
	b _080ED6E2
	.align 2, 0
_080ED6AC: .4byte gUnk_03000040
_080ED6B0:
	adds r2, r7, r4
	movs r0, #0x3f
	ands r2, r0
	movs r0, #0xe0
	lsls r0, r0, #1
	add r0, r8
	ldr r1, [r0]
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #1
	movs r2, #0xb4
	lsls r2, r2, #3
	adds r1, r1, r2
	adds r1, r1, r0
	ldr r0, _080ED6DC @ =0x0000F0FF
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, r5
	bne _080ED6E0
	movs r0, #1
	b _080ED6F2
	.align 2, 0
_080ED6DC: .4byte 0x0000F0FF
_080ED6E0:
	adds r4, #1
_080ED6E2:
	adds r0, r6, #0
	movs r1, #6
	bl __udivsi3
	adds r0, #3
	cmp r4, r0
	blo _080ED6B0
	movs r0, #0
_080ED6F2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080ED6FC
sub_080ED6FC: @ 0x080ED6FC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, _080ED76C @ =gUnk_03000040
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r4, r0, r1
	ldr r2, [r4]
	ldr r3, _080ED770 @ =0x00000592
	adds r1, r2, r3
	ldrh r1, [r1]
	mov ip, r0
	cmp r1, #0
	bne _080ED71C
	b _080ED848
_080ED71C:
	ldr r6, _080ED774 @ =0x0000058C
	adds r1, r2, r6
	movs r0, #1
	str r0, [r1]
	ldr r0, [r4]
	ldr r5, _080ED770 @ =0x00000592
	adds r0, r0, r5
	ldrh r1, [r0]
	subs r1, #1
	strh r1, [r0]
	ldr r1, [r4]
	movs r2, #0xb3
	lsls r2, r2, #3
	adds r0, r1, r2
	ldr r3, _080ED778 @ =0x0000059C
	mov r8, r3
	adds r2, r1, r3
	ldr r0, [r0]
	ldr r3, [r2]
	cmp r0, r3
	beq _080ED838
	lsls r0, r3, #3
	subs r0, r0, r3
	lsls r0, r0, #1
	adds r5, #0xe
	adds r0, r0, r5
	adds r5, r1, r0
	ldrh r0, [r5]
	lsrs r1, r0, #8
	movs r0, #0xf0
	ands r1, r0
	cmp r1, #0x90
	beq _080ED77C
	cmp r1, #0xa0
	beq _080ED7A2
	adds r0, r3, #1
	movs r1, #0x3f
	ands r0, r1
	str r0, [r2]
	b _080ED838
	.align 2, 0
_080ED76C: .4byte gUnk_03000040
_080ED770: .4byte 0x00000592
_080ED774: .4byte 0x0000058C
_080ED778: .4byte 0x0000059C
_080ED77C:
	adds r1, r5, #2
	adds r0, r7, #0
	movs r2, #0xc
	bl MemoryCopyHalfWord
	ldr r2, [r4]
	add r2, r8
	ldr r0, [r2]
	adds r0, #1
	movs r1, #0x3f
	ands r0, r1
	str r0, [r2]
	ldr r0, [r4]
	adds r0, r0, r6
	movs r1, #0
	str r1, [r0]
	ldrb r5, [r5]
	lsls r0, r5, #1
	b _080ED84A
_080ED7A2:
	adds r0, r3, #0
	bl sub_080ED674
	adds r1, r0, #0
	cmp r1, #0
	bne _080ED7B4
	ldr r0, [r4]
	adds r0, r0, r6
	b _080ED846
_080ED7B4:
	adds r6, r4, #0
_080ED7B6:
	ldrh r4, [r5]
	lsrs r1, r4, #8
	movs r0, #0xf0
	ands r1, r0
	cmp r1, #0xa0
	beq _080ED7FC
	cmp r1, #0xb0
	bne _080ED81A
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r1, r5, #2
	adds r0, r7, #0
	movs r2, #0xc
	bl MemoryCopyHalfWord
	ldr r2, [r6]
	ldr r1, _080ED7F4 @ =0x0000059C
	adds r2, r2, r1
	ldr r0, [r2]
	adds r0, #1
	movs r1, #0x3f
	ands r0, r1
	str r0, [r2]
	ldr r0, [r6]
	ldr r2, _080ED7F8 @ =0x0000058C
	adds r0, r0, r2
	movs r1, #0
	str r1, [r0]
	lsls r4, r4, #1
	adds r0, r4, #0
	b _080ED84A
	.align 2, 0
_080ED7F4: .4byte 0x0000059C
_080ED7F8: .4byte 0x0000058C
_080ED7FC:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x17
	adds r0, r7, r0
	adds r1, r5, #2
	movs r2, #0xc
	bl MemoryCopyHalfWord
	ldr r2, [r6]
	ldr r3, _080ED834 @ =0x0000059C
	adds r2, r2, r3
	ldr r0, [r2]
	adds r0, #1
	movs r1, #0x3f
	ands r0, r1
	str r0, [r2]
_080ED81A:
	ldr r2, [r6]
	ldr r5, _080ED834 @ =0x0000059C
	adds r0, r2, r5
	ldr r1, [r0]
	lsls r0, r1, #3
	subs r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0xb4
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r5, r2, r0
	b _080ED7B6
	.align 2, 0
_080ED834: .4byte 0x0000059C
_080ED838:
	movs r0, #0xe0
	lsls r0, r0, #1
	add r0, ip
	ldr r0, [r0]
	ldr r2, _080ED854 @ =0x0000058C
	adds r0, r0, r2
	movs r1, #0
_080ED846:
	str r1, [r0]
_080ED848:
	movs r0, #0
_080ED84A:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080ED854: .4byte 0x0000058C

	thumb_func_start sub_080ED858
sub_080ED858: @ 0x080ED858
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r1, #0
	mov r8, r0
	adds r0, r7, #1
	lsrs r7, r0, #1
	ldr r0, _080ED878 @ =gUnk_03000000
	ldr r0, [r0, #0x18]
	cmp r0, #0
	bne _080ED87C
	movs r0, #0
	b _080EDA1E
	.align 2, 0
_080ED878: .4byte gUnk_03000000
_080ED87C:
	movs r0, #1
	mov sl, r0
	ldr r1, _080ED8D0 @ =gUnk_03000040
	movs r2, #0xe0
	lsls r2, r2, #1
	adds r4, r1, r2
	ldr r3, [r4]
	ldr r5, _080ED8D4 @ =0x00000464
	adds r0, r3, r5
	ldr r6, [r0]
	mov sb, r1
	cmp r7, #6
	bhi _080ED938
	lsls r2, r6, #3
	subs r2, r2, r6
	lsls r2, r2, #1
	adds r3, r3, r2
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	movs r5, #0x90
	lsls r5, r5, #8
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3]
	movs r5, #0
	adds r6, #1
	adds r3, r2, #0
	mov ip, r5
_080ED8B4:
	cmp r5, r7
	bge _080ED8D8
	ldr r1, [r4]
	adds r2, r5, #1
	lsls r0, r2, #1
	adds r0, r0, r3
	adds r1, r1, r0
	mov r5, r8
	ldrh r0, [r5]
	strh r0, [r1]
	movs r0, #2
	add r8, r0
	b _080ED8E6
	.align 2, 0
_080ED8D0: .4byte gUnk_03000040
_080ED8D4: .4byte 0x00000464
_080ED8D8:
	ldr r0, [r4]
	adds r2, r5, #1
	lsls r1, r2, #1
	adds r1, r1, r3
	adds r0, r0, r1
	mov r1, ip
	strh r1, [r0]
_080ED8E6:
	adds r5, r2, #0
	cmp r5, #5
	bls _080ED8B4
	ldr r5, _080ED92C @ =0x04000208
	movs r0, #0
	strh r0, [r5]
	movs r3, #0xe0
	lsls r3, r3, #1
	add r3, sb
	ldr r0, [r3]
	ldr r2, _080ED930 @ =0x00000464
	adds r0, r0, r2
	movs r1, #0x3f
	ands r6, r1
	str r6, [r0]
	ldr r1, [r3]
	adds r2, #8
	adds r1, r1, r2
	ldr r0, [r1]
	add r0, sl
	str r0, [r1]
	movs r0, #1
	strh r0, [r5]
	ldr r1, [r3]
	adds r2, r1, r2
	ldr r0, [r2]
	cmp r0, #0x3f
	bls _080ED9CC
	ldr r4, _080ED934 @ =0x00000584
	adds r1, r1, r4
	movs r0, #1
	ldrb r5, [r1]
	orrs r0, r5
	b _080ED9B6
	.align 2, 0
_080ED92C: .4byte 0x04000208
_080ED930: .4byte 0x00000464
_080ED934: .4byte 0x00000584
_080ED938:
	lsls r0, r7, #0x18
	str r0, [sp]
_080ED93C:
	cmp r7, #6
	bhi _080ED9D0
	movs r7, #0xe0
	lsls r7, r7, #1
	add r7, sb
	ldr r3, [r7]
	lsls r2, r6, #3
	subs r2, r2, r6
	lsls r2, r2, #1
	adds r3, r3, r2
	ldr r1, [sp]
	lsrs r0, r1, #0x18
	movs r4, #0xb0
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	movs r5, #0
	adds r6, #1
	adds r4, r7, #0
	mov r3, r8
	adds r2, #2
_080ED968:
	ldr r0, [r4]
	adds r0, r0, r2
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r2, #2
	adds r5, #1
	cmp r5, #5
	bls _080ED968
	ldr r5, _080ED9BC @ =0x04000208
	movs r0, #0
	strh r0, [r5]
	movs r3, #0xe0
	lsls r3, r3, #1
	add r3, sb
	ldr r1, [r3]
	ldr r0, _080ED9C0 @ =0x00000464
	adds r1, r1, r0
	movs r0, #0x3f
	ands r6, r0
	str r6, [r1]
	ldr r1, [r3]
	ldr r2, _080ED9C4 @ =0x0000046C
	adds r1, r1, r2
	ldr r0, [r1]
	add r0, sl
	str r0, [r1]
	movs r0, #1
	strh r0, [r5]
	ldr r1, [r3]
	adds r2, r1, r2
	ldr r0, [r2]
	cmp r0, #0x3f
	bls _080ED9CC
	ldr r2, _080ED9C8 @ =0x00000584
	adds r1, r1, r2
	movs r0, #1
	ldrb r4, [r1]
	orrs r0, r4
_080ED9B6:
	strb r0, [r1]
	movs r0, #0
	b _080EDA1E
	.align 2, 0
_080ED9BC: .4byte 0x04000208
_080ED9C0: .4byte 0x00000464
_080ED9C4: .4byte 0x0000046C
_080ED9C8: .4byte 0x00000584
_080ED9CC:
	movs r0, #1
	b _080EDA1E
_080ED9D0:
	subs r7, #6
	movs r5, #0xe0
	lsls r5, r5, #1
	add r5, sb
	mov ip, r5
	ldr r3, [r5]
	lsls r2, r6, #3
	subs r2, r2, r6
	lsls r2, r2, #1
	adds r3, r3, r2
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0xa0
	lsls r4, r4, #8
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r3]
	movs r5, #0
	mov r4, sl
	adds r4, #1
	lsls r0, r7, #1
	mov r1, r8
	adds r3, r0, r1
	adds r2, #2
_080EDA00:
	mov r1, ip
	ldr r0, [r1]
	adds r0, r0, r2
	ldrh r1, [r3]
	strh r1, [r0]
	adds r3, #2
	adds r2, #2
	adds r5, #1
	cmp r5, #5
	bls _080EDA00
	adds r6, #1
	movs r0, #0x3f
	ands r6, r0
	mov sl, r4
	b _080ED93C
_080EDA1E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080EDA30
sub_080EDA30: @ 0x080EDA30
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _080EDA9C @ =gUnk_03000040
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r6, r0, r1
	ldr r0, [r6]
	movs r2, #0xb1
	lsls r2, r2, #3
	mov sb, r2
	add r0, sb
	ldr r4, [r0]
	cmp r4, #0
	beq _080EDA54
	b _080EDD38
_080EDA54:
	movs r5, #1
	str r5, [r0]
	ldr r0, [r6]
	movs r3, #0x8e
	lsls r3, r3, #3
	mov r8, r3
	add r0, r8
	strh r4, [r0]
	ldr r2, _080EDAA0 @ =gUnk_09E4E980
	ldr r0, _080EDAA4 @ =0x04000128
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	lsrs r0, r0, #4
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r6]
	add r1, r8
	movs r2, #0xe
	bl sub_080EFEEC
	ldr r1, [r6]
	ldr r2, _080EDAA8 @ =0x00000594
	adds r1, r1, r2
	strh r0, [r1]
	ldr r0, _080EDAAC @ =gUnk_030003A0
	ldr r3, _080EDAB0 @ =0x0000033F
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _080EDAB4
	ldr r0, [r6]
	add r0, sb
	b _080EDD36
	.align 2, 0
_080EDA9C: .4byte gUnk_03000040
_080EDAA0: .4byte gUnk_09E4E980
_080EDAA4: .4byte 0x04000128
_080EDAA8: .4byte 0x00000594
_080EDAAC: .4byte gUnk_030003A0
_080EDAB0: .4byte 0x0000033F
_080EDAB4:
	ldr r1, [r6]
	ldr r2, _080EDB00 @ =0x00000594
	adds r0, r1, r2
	ldrh r0, [r0]
	cmp r0, #0
	bne _080EDAC2
	b _080EDCE8
_080EDAC2:
	ldr r3, _080EDB04 @ =0x00000582
	adds r0, r1, r3
	strh r4, [r0]
	ldr r5, [r6]
	movs r0, #0xb0
	lsls r0, r0, #3
	mov sl, r0
	adds r3, r5, r0
	mov r1, r8
	adds r0, r5, r1
	ldrh r0, [r0]
	lsrs r2, r0, #8
	movs r7, #0xf
	adds r1, r2, #0
	ands r1, r7
	ldrh r0, [r3]
	cmp r0, r1
	bne _080EDB1C
	movs r1, #0x8c
	lsls r1, r1, #3
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080EDB08
	bl sub_080ED550
	ldr r0, [r6]
	add r0, sb
	str r4, [r0]
	b _080EDD38
	.align 2, 0
_080EDB00: .4byte 0x00000594
_080EDB04: .4byte 0x00000582
_080EDB08:
	ldr r0, _080EDB18 @ =gUnk_09E5EF02
	bl sub_080ED484
	ldr r0, [r6]
	add r0, sb
	str r4, [r0]
	b _080EDD38
	.align 2, 0
_080EDB18: .4byte gUnk_09E5EF02
_080EDB1C:
	ldrh r0, [r3]
	adds r0, #1
	ands r0, r7
	cmp r0, r1
	beq _080EDB8C
	movs r0, #0xf0
	ands r2, r0
	cmp r2, #0xe0
	beq _080EDB8E
	movs r2, #0x8c
	lsls r2, r2, #3
	adds r0, r5, r2
	ldr r7, [r0]
	cmp r7, #0
	beq _080EDB46
	bl sub_080ED550
	ldr r0, [r6]
	add r0, sb
	str r4, [r0]
	b _080EDD38
_080EDB46:
	ldr r4, _080EDB80 @ =0x00000928
	adds r0, r5, r4
	ldr r1, _080EDB84 @ =gUnk_09E5EF10
	movs r2, #0xe
	bl MemoryCopyHalfWord
	ldr r2, [r6]
	mov r3, r8
	adds r0, r2, r3
	ldrh r0, [r0]
	lsrs r1, r0, #8
	mov r3, sl
	adds r0, r2, r3
	ldrh r0, [r0]
	adds r0, #1
	subs r1, r1, r0
	movs r0, #0xf
	ands r1, r0
	ldr r0, _080EDB88 @ =0x0000092A
	adds r2, r2, r0
	strh r1, [r2]
	ldr r0, [r6]
	adds r0, r0, r4
	bl sub_080ED484
	ldr r0, [r6]
	add r0, sb
	str r7, [r0]
	b _080EDD38
	.align 2, 0
_080EDB80: .4byte 0x00000928
_080EDB84: .4byte gUnk_09E5EF10
_080EDB88: .4byte 0x0000092A
_080EDB8C:
	strh r0, [r3]
_080EDB8E:
	ldr r0, _080EDBBC @ =gUnk_03000040
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r4, r0, r1
	ldr r3, [r4]
	movs r0, #0x8e
	lsls r0, r0, #3
	adds r2, r3, r0
	ldrh r0, [r2]
	lsrs r1, r0, #8
	movs r0, #0xf0
	ands r1, r0
	cmp r1, #0xb0
	beq _080EDC80
	cmp r1, #0xb0
	bgt _080EDBC6
	cmp r1, #0x90
	beq _080EDC5C
	cmp r1, #0x90
	bgt _080EDBC0
	cmp r1, #0x80
	beq _080EDCA4
	b _080EDCDC
	.align 2, 0
_080EDBBC: .4byte gUnk_03000040
_080EDBC0:
	cmp r1, #0xa0
	beq _080EDC48
	b _080EDCDC
_080EDBC6:
	cmp r1, #0xe0
	beq _080EDBDA
	cmp r1, #0xe0
	bgt _080EDBD4
	cmp r1, #0xd0
	beq _080EDC28
	b _080EDCDC
_080EDBD4:
	cmp r1, #0xf0
	beq _080EDC28
	b _080EDCDC
_080EDBDA:
	movs r2, #0x8c
	lsls r2, r2, #3
	adds r1, r3, r2
	ldr r5, [r1]
	cmp r5, #0
	beq _080EDBF8
	bl sub_080ED550
	ldr r0, [r4]
	movs r3, #0xb1
	lsls r3, r3, #3
	adds r0, r0, r3
	movs r1, #0
	str r1, [r0]
	b _080EDD38
_080EDBF8:
	ldr r2, _080EDC20 @ =0x00000472
	adds r0, r3, r2
	ldrh r0, [r0]
	adds r0, #2
	str r0, [r1]
	ldr r0, [r4]
	ldr r3, _080EDC24 @ =0x0000057E
	adds r2, r0, r3
	movs r1, #0x8c
	lsls r1, r1, #3
	adds r0, r0, r1
	ldr r0, [r0]
	ldrh r3, [r2]
	subs r0, r3, r0
	movs r1, #0xf
	ands r0, r1
	strh r0, [r2]
	bl sub_080ED550
	b _080EDD2E
	.align 2, 0
_080EDC20: .4byte 0x00000472
_080EDC24: .4byte 0x0000057E
_080EDC28:
	bl sub_080ED550
	ldr r0, _080EDC44 @ =gUnk_03000040
	movs r2, #0xe0
	lsls r2, r2, #1
	adds r0, r0, r2
	ldr r0, [r0]
	movs r3, #0xb1
	lsls r3, r3, #3
	adds r0, r0, r3
	movs r1, #0
	str r1, [r0]
	b _080EDD38
	.align 2, 0
_080EDC44: .4byte gUnk_03000040
_080EDC48:
	adds r0, r2, #0
	bl sub_080ED62C
	ldr r0, [r4]
	movs r1, #0xb1
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r1, #0
	str r1, [r0]
	b _080EDD38
_080EDC5C:
	adds r0, r2, #0
	bl sub_080ED62C
	ldr r0, [r4]
	ldr r2, _080EDC7C @ =0x00000592
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r1, #1
	movs r2, #0
	strh r1, [r0]
	ldr r0, [r4]
	movs r3, #0xb1
	lsls r3, r3, #3
	adds r0, r0, r3
	b _080EDCCA
	.align 2, 0
_080EDC7C: .4byte 0x00000592
_080EDC80:
	adds r0, r2, #0
	bl sub_080ED62C
	ldr r0, [r4]
	ldr r1, _080EDCA0 @ =0x00000592
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r1, #1
	movs r2, #0
	strh r1, [r0]
	ldr r0, [r4]
	movs r3, #0xb1
	lsls r3, r3, #3
	adds r0, r0, r3
	b _080EDCCA
	.align 2, 0
_080EDCA0: .4byte 0x00000592
_080EDCA4:
	ldr r1, _080EDCD0 @ =0x00000472
	adds r0, r3, r1
	ldrh r1, [r0]
	movs r2, #0x92
	lsls r2, r2, #4
	adds r0, r3, r2
	movs r2, #0
	strh r1, [r0]
	ldr r0, [r4]
	ldr r3, _080EDCD4 @ =0x00000474
	adds r1, r0, r3
	ldrh r1, [r1]
	ldr r3, _080EDCD8 @ =0x00000922
	adds r0, r0, r3
	strh r1, [r0]
	ldr r0, [r4]
	movs r1, #0xb1
	lsls r1, r1, #3
	adds r0, r0, r1
_080EDCCA:
	str r2, [r0]
	movs r0, #1
	b _080EDD3A
	.align 2, 0
_080EDCD0: .4byte 0x00000472
_080EDCD4: .4byte 0x00000474
_080EDCD8: .4byte 0x00000922
_080EDCDC:
	ldr r0, _080EDCE4 @ =gUnk_09E5EF10
	bl sub_080ED484
	b _080EDCEC
	.align 2, 0
_080EDCE4: .4byte gUnk_09E5EF10
_080EDCE8:
	bl sub_080ED550
_080EDCEC:
	ldr r0, _080EDD48 @ =gUnk_03000040
	movs r2, #0xe0
	lsls r2, r2, #1
	adds r4, r0, r2
	ldr r0, [r4]
	ldr r2, _080EDD4C @ =0x00000582
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r1, #1
	movs r5, #0
	strh r1, [r0]
	ldr r0, [r4]
	adds r1, r0, r2
	ldrh r3, [r1]
	cmp r3, #0x5a
	bne _080EDD2E
	ldr r0, _080EDD50 @ =gUnk_09E4E990
	ldrh r1, [r1]
	bl OS_Printf
	bl sub_080FA4D8
	ldr r0, [r4]
	ldr r1, _080EDD4C @ =0x00000582
	adds r0, r0, r1
	strh r5, [r0]
	ldr r1, [r4]
	ldr r2, _080EDD54 @ =0x00000584
	adds r1, r1, r2
	movs r0, #1
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
_080EDD2E:
	ldr r0, [r4]
	movs r1, #0xb1
	lsls r1, r1, #3
	adds r0, r0, r1
_080EDD36:
	str r5, [r0]
_080EDD38:
	movs r0, #0
_080EDD3A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080EDD48: .4byte gUnk_03000040
_080EDD4C: .4byte 0x00000582
_080EDD50: .4byte gUnk_09E4E990
_080EDD54: .4byte 0x00000584

	thumb_func_start sub_080EDD58
sub_080EDD58: @ 0x080EDD58
	push {lr}
	bl sub_080EDA30
	ldr r0, _080EDD80 @ =gUnk_03000040
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080EDD84 @ =0x00000924
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080EDD76
	bl _call_via_r0
_080EDD76:
	ldr r1, _080EDD88 @ =0x04000108
	ldr r0, _080EDD8C @ =0x00C3FEB9
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080EDD80: .4byte gUnk_03000040
_080EDD84: .4byte 0x00000924
_080EDD88: .4byte 0x04000108
_080EDD8C: .4byte 0x00C3FEB9

	thumb_func_start sub_080EDD90
sub_080EDD90: @ 0x080EDD90
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r7, r1, #0
	cmp r2, #0
	beq _080EDDA4
	ldr r0, _080EDE04 @ =gUnk_03000040
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r0, r1
	str r2, [r0]
_080EDDA4:
	bl sub_080EF77C
	ldr r6, _080EDE04 @ =gUnk_03000040
	movs r0, #0xe0
	lsls r0, r0, #1
	adds r4, r6, r0
	ldr r0, [r4]
	ldr r1, _080EDE08 @ =0x00000938
	bl MemoryClearHalfWord
	ldr r5, _080EDE0C @ =gUnk_03000000
	adds r0, r5, #0
	adds r1, r5, #0
	bl sub_080EF65C
	ldr r0, [r4]
	movs r1, #0xb0
	lsls r1, r1, #3
	adds r0, r0, r1
	movs r2, #0
	movs r1, #0xf
	strh r1, [r0]
	ldr r0, [r4]
	ldr r1, _080EDE10 @ =0x00000924
	adds r0, r0, r1
	str r7, [r0]
	movs r1, #0xfc
	lsls r1, r1, #1
	adds r0, r6, r1
	str r2, [r0]
	ldr r0, _080EDE14 @ =sub_080EDD58
	str r0, [r5, #0x18]
	ldr r3, _080EDE18 @ =0x04000208
	strh r2, [r3]
	ldr r2, _080EDE1C @ =0x04000200
	ldrh r0, [r2]
	movs r1, #0x20
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _080EDE20 @ =0x04000108
	ldr r0, _080EDE24 @ =0x00C3FEB9
	str r0, [r1]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EDE04: .4byte gUnk_03000040
_080EDE08: .4byte 0x00000938
_080EDE0C: .4byte gUnk_03000000
_080EDE10: .4byte 0x00000924
_080EDE14: .4byte sub_080EDD58
_080EDE18: .4byte 0x04000208
_080EDE1C: .4byte 0x04000200
_080EDE20: .4byte 0x04000108
_080EDE24: .4byte 0x00C3FEB9

	thumb_func_start sub_080EDE28
sub_080EDE28: @ 0x080EDE28
	push {lr}
	ldr r3, _080EDE4C @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _080EDE50 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080EDE54 @ =0x0000FFDF
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _080EDE58 @ =gUnk_03000000
	movs r0, #0
	str r0, [r1, #0x18]
	bl sub_080EF77C
	pop {r0}
	bx r0
	.align 2, 0
_080EDE4C: .4byte 0x04000208
_080EDE50: .4byte 0x04000200
_080EDE54: .4byte 0x0000FFDF
_080EDE58: .4byte gUnk_03000000

	thumb_func_start sub_080EDE5C
sub_080EDE5C: @ 0x080EDE5C
	ldr r0, _080EDE9C @ =0x04000028
	movs r1, #0
	str r1, [r0]
	adds r0, #4
	str r1, [r0]
	subs r0, #0xc
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r3, #0
	strh r2, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r0, #0x12
	str r1, [r0]
	adds r0, #4
	str r1, [r0]
	subs r0, #0xc
	strh r2, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r2, [r0]
	ldr r1, _080EDEA0 @ =0x04000008
	movs r0, #4
	strh r0, [r1]
	bx lr
	.align 2, 0
_080EDE9C: .4byte 0x04000028
_080EDEA0: .4byte 0x04000008

	thumb_func_start sub_080EDEA4
sub_080EDEA4: @ 0x080EDEA4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsls r2, r2, #0x10
	movs r0, #0x1f
	lsrs r3, r1, #0x10
	ands r3, r0
	lsrs r1, r1, #0x15
	lsrs r6, r2, #0x10
	ands r6, r0
	lsrs r5, r2, #0x15
	cmp r5, #0
	beq _080EDEDC
	lsls r2, r1, #5
	lsls r1, r4, #0xb
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r0, r3, r0
	adds r1, r1, r0
	adds r4, r2, r1
_080EDECC:
	adds r0, r4, #0
	adds r1, r6, #0
	bl MemoryClearHalfWord
	adds r4, #0x20
	subs r5, #1
	cmp r5, #0
	bne _080EDECC
_080EDEDC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080EDEE4
sub_080EDEE4: @ 0x080EDEE4
	push {lr}
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r0, #0xb
	ldr r2, _080EDEFC @ =0x06004000
	adds r0, r0, r2
	lsrs r1, r1, #0xb
	bl MemoryClearHalfWord
	pop {r0}
	bx r0
	.align 2, 0
_080EDEFC: .4byte 0x06004000

	thumb_func_start sub_080EDF00
sub_080EDF00: @ 0x080EDF00
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r0, r0, #0x10
	ldrh r2, [r5]
	lsls r1, r2, #1
	adds r6, r1, #0
	adds r6, #8
	adds r6, r5, r6
	adds r1, #0x10
	adds r1, r5, r1
	lsrs r0, r0, #0xb
	ldr r3, _080EDF48 @ =0x06004000
	adds r0, r0, r3
	ldrh r3, [r6]
	lsls r2, r3, #5
	bl MemoryCopyHalfWord
	lsls r4, r4, #1
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r4, r4, r0
	adds r1, r5, #0
	adds r1, #8
	ldrh r5, [r5]
	lsls r2, r5, #1
	adds r0, r4, #0
	bl MemoryCopyHalfWord
	ldrh r0, [r6]
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080EDF48: .4byte 0x06004000

	thumb_func_start sub_080EDF4C
sub_080EDF4C: @ 0x080EDF4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	ldrh r1, [r3]
	lsls r0, r1, #1
	adds r1, r0, #0
	adds r1, #8
	adds r1, r1, r3
	mov sb, r1
	adds r0, #0x10
	adds r3, r3, r0
	ldrh r2, [r1]
	lsls r0, r2, #5
	adds r3, r3, r0
	mov ip, r3
	mov r5, ip
	adds r5, #8
	movs r7, #0
	ldrh r3, [r3]
	cmp r7, r3
	bhs _080EDFF2
	lsrs r0, r4, #0x14
	lsls r0, r0, #0xc
	mov r8, r0
_080EDF90:
	ldrh r0, [r5]
	adds r5, #2
	ldrh r4, [r5]
	adds r5, #2
	movs r3, #0x3f
	ands r3, r0
	movs r6, #0xff
	lsls r6, r6, #8
	ands r0, r6
	movs r1, #0xc0
	lsls r1, r1, #0x13
	str r1, [sp, #4]
	lsrs r1, r0, #3
	adds r0, r3, #0
	orrs r0, r1
	adds r2, r4, #0
	movs r6, #0xc0
	lsls r6, r6, #4
	ands r2, r6
	cmp r3, #0x1f
	bls _080EDFC8
	ldr r0, _080EE008 @ =0x06000800
	str r0, [sp, #4]
	adds r0, r3, #0
	subs r0, #0x20
	orrs r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
_080EDFC8:
	ldr r1, [sp]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r3, _080EE00C @ =0x000003FF
	ands r4, r3
	lsrs r0, r0, #0xf
	ldr r6, [sp, #4]
	adds r0, r0, r6
	mov r3, sl
	adds r1, r4, r3
	orrs r2, r1
	mov r6, r8
	orrs r2, r6
	strh r2, [r0]
	adds r0, r7, #1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r0, ip
	ldrh r0, [r0]
	cmp r7, r0
	blo _080EDF90
_080EDFF2:
	mov r1, sb
	ldrh r0, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080EE008: .4byte 0x06000800
_080EE00C: .4byte 0x000003FF

	thumb_func_start sub_080EE010
sub_080EE010: @ 0x080EE010
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	mov r8, r3
	lsls r6, r6, #0x10
	lsrs r6, r6, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	bl sub_080EDF00
	adds r0, r6, #0
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, r8
	bl sub_080EDF4C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080EE050
sub_080EE050: @ 0x080EE050
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r3, #0
	ldr r3, [sp, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	mov sl, r1
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x10
	lsls r0, r3, #8
	lsrs r3, r3, #0x18
	str r3, [sp, #4]
	ldrh r2, [r5]
	lsls r1, r2, #1
	adds r2, r1, #0
	adds r2, #8
	adds r2, r5, r2
	str r2, [sp, #8]
	adds r1, #0x10
	adds r1, r5, r1
	lsrs r0, r0, #0xa
	mov r3, sb
	lsls r2, r3, #5
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r2, r2, r3
	adds r0, r0, r2
	ldr r6, [sp, #8]
	ldrh r6, [r6]
	lsls r2, r6, #5
	adds r7, r1, r2
	mov r8, r7
	mov r6, r8
	adds r6, #8
	bl MemoryCopyHalfWord
	lsls r4, r4, #1
	movs r0, #0xa0
	lsls r0, r0, #0x13
	adds r4, r4, r0
	adds r1, r5, #0
	adds r1, #8
	ldrh r5, [r5]
	lsls r2, r5, #1
	adds r0, r4, #0
	bl MemoryCopyHalfWord
	movs r0, #0
	str r0, [sp, #0xc]
	ldrh r1, [r7]
	cmp r0, r1
	bhs _080EE13E
	ldr r2, [sp, #4]
	lsls r2, r2, #0xb
	mov ip, r2
	mov r3, sl
	lsrs r0, r3, #0x14
	lsls r0, r0, #0xc
	mov sl, r0
_080EE0D8:
	ldrh r1, [r6]
	adds r6, #2
	ldrh r3, [r6]
	adds r6, #2
	movs r5, #0x3f
	ands r5, r1
	movs r4, #0xff
	lsls r4, r4, #8
	ands r1, r4
	movs r0, #0xc0
	lsls r0, r0, #0x13
	mov r7, ip
	adds r4, r7, r0
	lsrs r1, r1, #3
	adds r0, r5, #0
	orrs r0, r1
	adds r2, r3, #0
	movs r7, #0xc0
	lsls r7, r7, #4
	ands r2, r7
	cmp r5, #0x1f
	bls _080EE112
	ldr r4, _080EE154 @ =0x06000800
	add r4, ip
	adds r0, r5, #0
	subs r0, #0x20
	orrs r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
_080EE112:
	ldr r1, [sp]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r7, _080EE158 @ =0x000003FF
	ands r3, r7
	lsrs r0, r0, #0xf
	adds r0, r0, r4
	mov r4, sb
	adds r1, r3, r4
	orrs r2, r1
	mov r7, sl
	orrs r2, r7
	strh r2, [r0]
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r1, r8
	ldrh r1, [r1]
	cmp r0, r1
	blo _080EE0D8
_080EE13E:
	ldr r2, [sp, #8]
	ldrh r0, [r2]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080EE154: .4byte 0x06000800
_080EE158: .4byte 0x000003FF

	thumb_func_start sub_080EE15C
sub_080EE15C: @ 0x080EE15C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov ip, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	mov r0, ip
	str r0, [sp, #4]
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r1, r0, #0
	adds r1, #8
	ldr r2, [sp, #4]
	adds r1, r1, r2
	mov sb, r1
	adds r0, #0x10
	adds r2, r2, r0
	mov r3, sl
	lsls r0, r3, #5
	ldr r7, _080EE25C @ =0x06004000
	adds r5, r0, r7
	ldrh r1, [r1]
	lsls r0, r1, #6
	adds r0, r0, r2
	mov r8, r0
	mov r4, r8
	adds r4, #8
	movs r3, #0
	cmp r1, #0
	beq _080EE1E4
_080EE1AA:
	ldrh r0, [r2]
	adds r1, r0, #0
	movs r7, #0xff
	lsls r7, r7, #8
	ands r0, r7
	cmp r0, #0
	beq _080EE1C0
	lsls r0, r6, #8
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_080EE1C0:
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _080EE1CE
	adds r0, r1, r6
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_080EE1CE:
	strh r1, [r5]
	adds r5, #2
	adds r2, #2
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r1, sb
	ldrh r1, [r1]
	lsls r0, r1, #5
	cmp r3, r0
	blt _080EE1AA
_080EE1E4:
	lsls r0, r6, #1
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	mov r1, ip
	adds r1, #8
	ldr r3, [sp, #4]
	ldrh r3, [r3]
	lsls r2, r3, #1
	bl MemoryCopyHalfWord
	movs r3, #0
	mov r5, r8
	ldrh r5, [r5]
	cmp r3, r5
	bhs _080EE246
	movs r7, #0xff
	lsls r7, r7, #8
	mov ip, r7
	movs r6, #0xc0
	lsls r6, r6, #0x13
	ldr r5, _080EE260 @ =0x00000FFF (Catapult Turtle)
_080EE210:
	ldrh r1, [r4]
	adds r4, #2
	ldrh r2, [r4]
	adds r4, #2
	movs r0, #0x3f
	ands r0, r1
	mov r7, ip
	ands r1, r7
	lsrs r1, r1, #3
	orrs r0, r1
	ldr r1, [sp]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	adds r0, r0, r6
	ands r2, r5
	mov r7, sl
	lsrs r1, r7, #1
	adds r2, r2, r1
	strh r2, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	mov r0, r8
	ldrh r0, [r0]
	cmp r3, r0
	blo _080EE210
_080EE246:
	mov r1, sb
	ldrh r0, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080EE25C: .4byte 0x06004000
_080EE260: .4byte 0x00000FFF @ Catapult Turtle

	thumb_func_start sub_080EE264
sub_080EE264: @ 0x080EE264
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r3, [sp, #4]
	ldr r3, [sp, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	lsls r3, r3, #0x10
	lsls r2, r3, #8
	lsrs r3, r3, #0x18
	str r3, [sp, #8]
	ldr r0, [sp, #4]
	str r0, [sp, #0xc]
	ldrh r1, [r0]
	lsls r0, r1, #1
	adds r1, r0, #0
	adds r1, #8
	ldr r3, [sp, #0xc]
	adds r1, r1, r3
	mov sb, r1
	adds r0, #0x10
	adds r3, r3, r0
	lsrs r2, r2, #0xa
	mov r6, sl
	lsls r0, r6, #5
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	adds r2, r2, r0
	mov r0, sb
	ldrh r1, [r0]
	lsls r0, r1, #6
	adds r0, r0, r3
	mov r8, r0
	mov r7, r8
	adds r7, #8
	movs r5, #0
	cmp r1, #0
	beq _080EE302
	movs r1, #0xff
	lsls r1, r1, #8
	mov ip, r1
_080EE2CA:
	ldrh r0, [r3]
	adds r1, r0, #0
	mov r6, ip
	ands r0, r6
	cmp r0, #0
	beq _080EE2DE
	lsls r0, r4, #8
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_080EE2DE:
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	beq _080EE2EC
	adds r0, r1, r4
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
_080EE2EC:
	strh r1, [r2]
	adds r2, #2
	adds r3, #2
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r1, sb
	ldrh r1, [r1]
	lsls r0, r1, #5
	cmp r5, r0
	blt _080EE2CA
_080EE302:
	lsls r0, r4, #1
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r0, r1
	ldr r1, [sp, #4]
	adds r1, #8
	ldr r3, [sp, #0xc]
	ldrh r3, [r3]
	lsls r2, r3, #1
	bl MemoryCopyHalfWord
	movs r5, #0
	mov r4, r8
	ldrh r4, [r4]
	cmp r5, r4
	bhs _080EE38C
	ldr r6, [sp, #8]
	lsls r6, r6, #0xb
	mov ip, r6
_080EE328:
	ldrh r1, [r7]
	adds r7, #2
	ldrh r4, [r7]
	adds r7, #2
	movs r3, #0x3f
	ands r3, r1
	movs r0, #0xff
	lsls r0, r0, #8
	ands r1, r0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	add r0, ip
	str r0, [sp, #0xc]
	lsrs r1, r1, #3
	adds r0, r3, #0
	orrs r0, r1
	adds r2, r4, #0
	movs r6, #0xc0
	lsls r6, r6, #4
	ands r2, r6
	cmp r3, #0x1f
	bls _080EE364
	ldr r0, _080EE3A0 @ =0x06000800
	add r0, ip
	str r0, [sp, #0xc]
	adds r0, r3, #0
	subs r0, #0x20
	orrs r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
_080EE364:
	ldr r1, [sp]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	ldr r3, _080EE3A4 @ =0x000003FF
	ands r4, r3
	lsrs r0, r0, #0xf
	ldr r6, [sp, #0xc]
	adds r0, r0, r6
	mov r3, sl
	lsrs r1, r3, #1
	adds r1, r4, r1
	orrs r2, r1
	strh r2, [r0]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r4, r8
	ldrh r4, [r4]
	cmp r5, r4
	blo _080EE328
_080EE38C:
	mov r6, sb
	ldrh r0, [r6]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080EE3A0: .4byte 0x06000800
_080EE3A4: .4byte 0x000003FF

	thumb_func_start sub_080EE3A8
sub_080EE3A8: @ 0x080EE3A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [sp, #0x28]
	lsls r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	lsls r0, r2, #8
	lsrs r0, r0, #0x18
	mov r8, r0
	lsrs r2, r2, #0x18
	mov sl, r2
	movs r0, #0
	cmp r0, sl
	bge _080EE422
_080EE3D8:
	adds r7, r4, #0
	adds r7, #0x40
	adds r0, #1
	mov ip, r0
	mov r0, r8
	cmp r0, #0
	beq _080EE41A
	adds r3, r4, #0
	ldr r0, _080EE434 @ =0x00000FFF (Catapult Turtle)
	mov sb, r0
	ldr r0, [sp]
	lsls r6, r0, #0xc
	mov r4, r8
_080EE3F2:
	ldrh r2, [r5]
	ldr r0, _080EE438 @ =0x000003FF
	ands r0, r2
	cmp r0, #0
	beq _080EE410
	ldr r0, [sp, #4]
	adds r1, r0, r2
	mov r0, sb
	ands r1, r0
	movs r0, #0xf0
	lsls r0, r0, #8
	ands r0, r2
	adds r0, r0, r6
	orrs r1, r0
	strh r1, [r3]
_080EE410:
	adds r5, #2
	adds r3, #2
	subs r4, #1
	cmp r4, #0
	bne _080EE3F2
_080EE41A:
	adds r4, r7, #0
	mov r0, ip
	cmp r0, sl
	blt _080EE3D8
_080EE422:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EE434: .4byte 0x00000FFF @ Catapult Turtle
_080EE438: .4byte 0x000003FF

	thumb_func_start sub_080EE43C
sub_080EE43C: @ 0x080EE43C
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	movs r0, #0xa0
	lsls r0, r0, #0x13
	lsls r2, r2, #5
	adds r1, r3, #0
	bl MemoryCopyHalfWord
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080EE454
sub_080EE454: @ 0x080EE454
	push {r4, r5, r6, r7, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xb
	ldr r2, _080EE4A8 @ =0x06004000
	adds r4, r1, r2
	adds r3, r0, #0
	movs r0, #0
	movs r6, #0xf
_080EE464:
	adds r0, #1
	mov ip, r0
	movs r5, #0xf
_080EE46A:
	adds r2, r6, #0
	ldrb r7, [r3]
	ands r2, r7
	adds r0, r6, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	lsls r0, r0, #4
	orrs r2, r0
	adds r1, r6, #0
	ldrb r7, [r3, #2]
	ands r1, r7
	adds r0, r6, #0
	ldrb r7, [r3, #3]
	ands r0, r7
	lsls r0, r0, #4
	orrs r1, r0
	lsls r1, r1, #8
	orrs r2, r1
	strh r2, [r4]
	adds r4, #2
	adds r3, #4
	subs r5, #1
	cmp r5, #0
	bge _080EE46A
	mov r0, ip
	cmp r0, #0xff
	ble _080EE464
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EE4A8: .4byte 0x06004000

	thumb_func_start sub_080EE4AC
sub_080EE4AC: @ 0x080EE4AC
	push {r4, r5, lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0xb
	ldr r2, _080EE4E0 @ =0x06004000
	adds r1, r1, r2
	adds r2, r0, #0
	movs r0, #0
_080EE4BA:
	adds r4, r0, #1
	movs r3, #0xf
_080EE4BE:
	ldrb r5, [r2, #1]
	lsls r0, r5, #8
	ldrb r5, [r2]
	orrs r0, r5
	strh r0, [r1]
	adds r1, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _080EE4BE
	adds r0, r4, #0
	cmp r0, #0xff
	ble _080EE4BA
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EE4E0: .4byte 0x06004000

	thumb_func_start sub_080EE4E4
sub_080EE4E4: @ 0x080EE4E4
	push {r4, r5, r6, r7, lr}
	adds r7, r2, #0
	adds r6, r3, #0
	ldr r2, [sp, #0x14]
	mov ip, r2
	adds r3, r0, #0
	lsls r1, r1, #0xb
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	movs r0, #0
	cmp r0, ip
	bge _080EE526
_080EE4FE:
	adds r4, r1, #0
	adds r4, #0x40
	adds r5, r0, #1
	cmp r6, #0
	ble _080EE51E
	adds r2, r6, #0
_080EE50A:
	ldrh r0, [r3]
	adds r3, #2
	cmp r0, #0
	beq _080EE514
	adds r0, r0, r7
_080EE514:
	strh r0, [r1]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080EE50A
_080EE51E:
	adds r1, r4, #0
	adds r0, r5, #0
	cmp r0, ip
	blt _080EE4FE
_080EE526:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080EE52C
sub_080EE52C: @ 0x080EE52C
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	ldr r1, _080EE574 @ =gUnk_0201AF20
	ldr r2, _080EE578 @ =0x05000023
	mov r0, sp
	bl CpuSet
	bl sub_08014638
	movs r1, #0x80
	lsls r1, r1, #0x13
	movs r0, #0x9a
	lsls r0, r0, #5
	strh r0, [r1]
	adds r1, #8
	ldr r0, _080EE57C @ =0x00000189
	strh r0, [r1]
	adds r1, #2
	movs r0, #4
	strh r0, [r1]
	movs r1, #0x10
	rsbs r1, r1, #0
	movs r0, #0x3f
	bl sub_080146FC
	bl sub_080148D0
	bl GL_InitializeObjects
	movs r0, #1
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_080EE574: .4byte gUnk_0201AF20
_080EE578: .4byte 0x05000023
_080EE57C: .4byte 0x00000189

	thumb_func_start sub_080EE580
sub_080EE580: @ 0x080EE580
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r7, #0x10
	movs r3, #0xc0
	lsls r3, r3, #0x13
	movs r0, #1
	movs r4, #0xf0
	lsls r4, r4, #8
	movs r2, #0x80
	lsls r2, r2, #3
_080EE596:
	adds r1, r0, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	orrs r1, r4
	strh r1, [r3]
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bne _080EE596
	movs r0, #0x20
	movs r1, #0x14
	bl sub_080F0BB4
	ldr r5, _080EE640 @ =gUnk_02006ED0
	movs r1, #1
	ldrb r0, [r5, #8]
	orrs r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r5, #8]
	ldr r0, _080EE644 @ =gUnk_09E5F854
	mov r8, r0
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	lsls r1, r1, #3
	adds r0, r0, r1
	add r0, r8
	ldr r0, [r0]
	str r0, [r5, #4]
	movs r4, #0x11
	lsls r6, r4, #0x18
	lsrs r6, r6, #0x18
	adds r1, r7, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x10
	orrs r1, r6
	ldr r3, _080EE648 @ =gUnk_09E4F1B4
	movs r0, #1
	movs r2, #0xf
	bl sub_080F09E0
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r5, #8]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r5, #8]
	mov r1, r8
	ldr r0, [r1]
	str r0, [r5, #4]
	adds r5, r7, #0
	adds r5, #0x11
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x10
	orrs r1, r6
	ldr r6, _080EE64C @ =gUnk_09E4F1BC
	movs r0, #1
	movs r2, #0xf
	adds r3, r6, #0
	bl sub_080F09E0
	adds r4, #1
	lsls r4, r4, #0x18
	adds r5, #1
	lsls r5, r5, #0x18
	lsrs r4, r4, #8
	orrs r4, r5
	lsrs r4, r4, #0x10
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0xf
	adds r3, r6, #0
	bl sub_080F09E0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EE640: .4byte gUnk_02006ED0
_080EE644: .4byte gUnk_09E5F854
_080EE648: .4byte gUnk_09E4F1B4
_080EE64C: .4byte gUnk_09E4F1BC

	thumb_func_start sub_080EE650
sub_080EE650: @ 0x080EE650
	movs r0, #1
	bx lr

	thumb_func_start sub_080EE654
sub_080EE654: @ 0x080EE654
	push {r4, lr}
	sub sp, #0x14
	movs r0, #0x10
	bl GL_CreateNewObject
	ldr r1, _080EE6B0 @ =0xC000A300
	str r1, [r0]
	ldr r1, _080EE6B4 @ =0xFFFFFE00
	ldrh r2, [r0, #2]
	ands r1, r2
	movs r2, #0x68
	orrs r1, r2
	strh r1, [r0, #2]
	movs r1, #0x30
	strb r1, [r0]
	ldr r1, _080EE6B8 @ =0xFFFFFC00
	ldrh r3, [r0, #4]
	ands r1, r3
	movs r3, #0xc8
	lsls r3, r3, #2
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #4]
	movs r1, #0x3f
	rsbs r1, r1, #0
	ldrb r2, [r0, #3]
	ands r1, r2
	strb r1, [r0, #3]
	movs r1, #0xc0
	lsls r1, r1, #5
	movs r2, #0x90
	lsls r2, r2, #5
	ldr r4, _080EE6BC @ =gUnk_03004C08
	ldr r0, [r4]
	adds r3, r0, #0
	adds r0, #1
	str r0, [r4]
	add r0, sp, #4
	str r0, [sp]
	movs r0, #0
	bl sub_08015820
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080EE6B0: .4byte 0xC000A300
_080EE6B4: .4byte 0xFFFFFE00
_080EE6B8: .4byte 0xFFFFFC00
_080EE6BC: .4byte gUnk_03004C08

	thumb_func_start sub_080EE6C0
sub_080EE6C0: @ 0x080EE6C0
	push {r4, lr}
	ldr r4, _080EE700 @ =gUnk_0201AF20
	ldr r1, _080EE704 @ =gUnk_03000040
	movs r0, #0xa4
	lsls r0, r0, #1
	adds r1, r1, r0
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080EE6E6
	bl sub_080148E0
	adds r1, r4, #0
	adds r1, #0x88
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
_080EE6E6:
	bl sub_080148F4
	cmp r0, #0
	bne _080EE708
	adds r1, r4, #0
	adds r1, #0x88
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080EE708
	movs r0, #1
	b _080EE70E
	.align 2, 0
_080EE700: .4byte gUnk_0201AF20
_080EE704: .4byte gUnk_03000040
_080EE708:
	bl sub_08014914
	movs r0, #0
_080EE70E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080EE714
sub_080EE714: @ 0x080EE714
	push {r4, lr}
	ldr r1, _080EE758 @ =gUnk_09E5EF20
	ldr r0, _080EE75C @ =gUnk_03000040
	movs r2, #0x81
	lsls r2, r2, #2
	adds r4, r0, r2
	ldrh r2, [r4]
	lsls r0, r2, #0x12
	lsrs r0, r0, #0x18
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080EE764
	bl _call_via_r0
	cmp r0, #0
	beq _080EE74E
	ldrh r2, [r4]
	lsls r1, r2, #0x12
	lsrs r1, r1, #0x18
	adds r1, #1
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #6
	ldr r0, _080EE760 @ =0xFFFFC03F
	ands r0, r2
	orrs r0, r1
	strh r0, [r4]
_080EE74E:
	bl sub_080FA4D4
	movs r0, #0
	b _080EE766
	.align 2, 0
_080EE758: .4byte gUnk_09E5EF20
_080EE75C: .4byte gUnk_03000040
_080EE760: .4byte 0xFFFFC03F
_080EE764:
	movs r0, #1
_080EE766:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080EE76C
sub_080EE76C: @ 0x080EE76C
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	adds r1, r2, #0
	ldr r0, _080EE794 @ =0x00000FA6
	cmp r2, r0
	bls _080EE7A8
	ldr r0, _080EE798 @ =0x00001BA6
	cmp r2, r0
	bhi _080EE7A8
	ldr r0, _080EE79C @ =gCardIDs
	ldr r2, _080EE7A0 @ =0xFFFFF059
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r0
	ldrh r1, [r1]
	ldr r0, _080EE7A4 @ =0x0000FFFF
	cmp r1, r0
	beq _080EE7A8
	adds r0, r1, #0
	b _080EE7AA
	.align 2, 0
_080EE794: .4byte 0x00000FA6
_080EE798: .4byte 0x00001BA6
_080EE79C: .4byte gCardIDs
_080EE7A0: .4byte 0xFFFFF059
_080EE7A4: .4byte 0x0000FFFF
_080EE7A8:
	movs r0, #0
_080EE7AA:
	bx lr

	thumb_func_start sub_080EE7AC
sub_080EE7AC: @ 0x080EE7AC
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _080EE7E0 @ =0x080000AE
	ldrh r0, [r0]
	lsrs r0, r0, #8
	cmp r0, #0x4a
	bne _080EE7BC
	b _080EE968
_080EE7BC:
	cmp r3, #0
	beq _080EE7C2
	b _080EE968
_080EE7C2:
	ldr r1, _080EE7E4 @ =gCardStats
	movs r0, #0x16
	muls r0, r2, r0
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _080EE7E8 @ =0x00001498 (Spirit Message \"N\")
	cmp r1, r0
	beq _080EE85C
	cmp r1, r0
	bgt _080EE7EC
	subs r0, #1
	cmp r1, r0
	beq _080EE800
	b _080EE968
	.align 2, 0
_080EE7E0: .4byte 0x080000AE
_080EE7E4: .4byte gCardStats
_080EE7E8: .4byte 0x00001498 @ Spirit Message \"N\"
_080EE7EC:
	ldr r0, _080EE7FC @ =0x00001499 (Spirit Message \"A\")
	cmp r1, r0
	beq _080EE8B8
	adds r0, #1
	cmp r1, r0
	bne _080EE7FA
	b _080EE910
_080EE7FA:
	b _080EE968
	.align 2, 0
_080EE7FC: .4byte 0x00001499 @ Spirit Message \"A\"
_080EE800:
	ldr r0, _080EE82C @ =gUnk_02000000
	ldr r1, _080EE830 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EE854
	cmp r1, #2
	beq _080EE84C
	cmp r1, #3
	beq _080EE844
	cmp r1, #4
	beq _080EE83C
	ldr r0, _080EE834 @ =gUnk_09DC4578
	cmp r1, #5
	beq _080EE824
	b _080EE97C
_080EE824:
	ldr r1, _080EE838 @ =0x0003B45C
	adds r0, r0, r1
	b _080EE97C
	.align 2, 0
_080EE82C: .4byte gUnk_02000000
_080EE830: .4byte 0x00006C2C
_080EE834: .4byte gUnk_09DC4578
_080EE838: .4byte 0x0003B45C
_080EE83C:
	ldr r0, _080EE840 @ =gUnk_09DF3C6A
	b _080EE97C
	.align 2, 0
_080EE840: .4byte gUnk_09DF3C6A
_080EE844:
	ldr r0, _080EE848 @ =gUnk_09DE7CBA
	b _080EE97C
	.align 2, 0
_080EE848: .4byte gUnk_09DE7CBA
_080EE84C:
	ldr r0, _080EE850 @ =gUnk_09DDB7E2
	b _080EE97C
	.align 2, 0
_080EE850: .4byte gUnk_09DDB7E2
_080EE854:
	ldr r0, _080EE858 @ =gUnk_09DCF474
	b _080EE97C
	.align 2, 0
_080EE858: .4byte gUnk_09DCF474
_080EE85C:
	ldr r0, _080EE888 @ =gUnk_02000000
	ldr r1, _080EE88C @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EE8B0
	cmp r1, #2
	beq _080EE8A8
	cmp r1, #3
	beq _080EE8A0
	cmp r1, #4
	beq _080EE898
	ldr r0, _080EE890 @ =gUnk_09DC458E
	cmp r1, #5
	beq _080EE880
	b _080EE97C
_080EE880:
	ldr r1, _080EE894 @ =0x0003B448
	adds r0, r0, r1
	b _080EE97C
	.align 2, 0
_080EE888: .4byte gUnk_02000000
_080EE88C: .4byte 0x00006C2C
_080EE890: .4byte gUnk_09DC458E
_080EE894: .4byte 0x0003B448
_080EE898:
	ldr r0, _080EE89C @ =gUnk_09DF3C6C
	b _080EE97C
	.align 2, 0
_080EE89C: .4byte gUnk_09DF3C6C
_080EE8A0:
	ldr r0, _080EE8A4 @ =gUnk_09DE7CBC
	b _080EE97C
	.align 2, 0
_080EE8A4: .4byte gUnk_09DE7CBC
_080EE8A8:
	ldr r0, _080EE8AC @ =gUnk_09DDB7E4
	b _080EE97C
	.align 2, 0
_080EE8AC: .4byte gUnk_09DDB7E4
_080EE8B0:
	ldr r0, _080EE8B4 @ =gUnk_09DCF476
	b _080EE97C
	.align 2, 0
_080EE8B4: .4byte gUnk_09DCF476
_080EE8B8:
	ldr r0, _080EE8E0 @ =gUnk_02000000
	ldr r1, _080EE8E4 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EE908
	cmp r1, #2
	beq _080EE900
	cmp r1, #3
	beq _080EE8F8
	cmp r1, #4
	beq _080EE8F0
	ldr r0, _080EE8E8 @ =gUnk_09DC45A4
	cmp r1, #5
	bne _080EE97C
	ldr r1, _080EE8EC @ =0x0003B434
	adds r0, r0, r1
	b _080EE97C
	.align 2, 0
_080EE8E0: .4byte gUnk_02000000
_080EE8E4: .4byte 0x00006C2C
_080EE8E8: .4byte gUnk_09DC45A4
_080EE8EC: .4byte 0x0003B434
_080EE8F0:
	ldr r0, _080EE8F4 @ =gUnk_09DF3C6E
	b _080EE97C
	.align 2, 0
_080EE8F4: .4byte gUnk_09DF3C6E
_080EE8F8:
	ldr r0, _080EE8FC @ =gUnk_09DE7CBE
	b _080EE97C
	.align 2, 0
_080EE8FC: .4byte gUnk_09DE7CBE
_080EE900:
	ldr r0, _080EE904 @ =gUnk_09DDB7E6
	b _080EE97C
	.align 2, 0
_080EE904: .4byte gUnk_09DDB7E6
_080EE908:
	ldr r0, _080EE90C @ =gUnk_09DCF478
	b _080EE97C
	.align 2, 0
_080EE90C: .4byte gUnk_09DCF478
_080EE910:
	ldr r0, _080EE938 @ =gUnk_02000000
	ldr r1, _080EE93C @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EE960
	cmp r1, #2
	beq _080EE958
	cmp r1, #3
	beq _080EE950
	cmp r1, #4
	beq _080EE948
	ldr r0, _080EE940 @ =gUnk_09DC45BA
	cmp r1, #5
	bne _080EE97C
	ldr r1, _080EE944 @ =0x0003B420
	adds r0, r0, r1
	b _080EE97C
	.align 2, 0
_080EE938: .4byte gUnk_02000000
_080EE93C: .4byte 0x00006C2C
_080EE940: .4byte gUnk_09DC45BA
_080EE944: .4byte 0x0003B420
_080EE948:
	ldr r0, _080EE94C @ =gUnk_09DF3C70
	b _080EE97C
	.align 2, 0
_080EE94C: .4byte gUnk_09DF3C70
_080EE950:
	ldr r0, _080EE954 @ =gUnk_09DE7CC0
	b _080EE97C
	.align 2, 0
_080EE954: .4byte gUnk_09DE7CC0
_080EE958:
	ldr r0, _080EE95C @ =gUnk_09DDB7E8
	b _080EE97C
	.align 2, 0
_080EE95C: .4byte gUnk_09DDB7E8
_080EE960:
	ldr r0, _080EE964 @ =gUnk_09DCF47A
	b _080EE97C
	.align 2, 0
_080EE964: .4byte gUnk_09DCF47A
_080EE968:
	ldr r1, _080EE980 @ =gUnk_095F3A5C
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080EE984 @ =gCardNamesDescriptionsPointers
	adds r0, r0, r1
_080EE97C:
	bx lr
	.align 2, 0
_080EE980: .4byte gUnk_095F3A5C
_080EE984: .4byte gCardNamesDescriptionsPointers

	thumb_func_start sub_080EE988
sub_080EE988: @ 0x080EE988
	adds r2, r0, #0
	ldr r0, _080EE9B4 @ =0x080000AE
	ldrh r0, [r0]
	lsrs r0, r0, #8
	cmp r0, #0x4a
	bne _080EE996
	b _080EEB3C
_080EE996:
	ldr r1, _080EE9B8 @ =gCardStats
	movs r0, #0x16
	muls r0, r2, r0
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, _080EE9BC @ =0x00001498 (Spirit Message \"N\")
	cmp r1, r0
	beq _080EEA30
	cmp r1, r0
	bgt _080EE9C0
	subs r0, #1
	cmp r1, r0
	beq _080EE9D4
	b _080EEB3C
	.align 2, 0
_080EE9B4: .4byte 0x080000AE
_080EE9B8: .4byte gCardStats
_080EE9BC: .4byte 0x00001498 @ Spirit Message \"N\"
_080EE9C0:
	ldr r0, _080EE9D0 @ =0x00001499 (Spirit Message \"A\")
	cmp r1, r0
	beq _080EEA8C
	adds r0, #1
	cmp r1, r0
	bne _080EE9CE
	b _080EEAE4
_080EE9CE:
	b _080EEB3C
	.align 2, 0
_080EE9D0: .4byte 0x00001499 @ Spirit Message \"A\"
_080EE9D4:
	ldr r0, _080EEA00 @ =gUnk_02000000
	ldr r1, _080EEA04 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EEA28
	cmp r1, #2
	beq _080EEA20
	cmp r1, #3
	beq _080EEA18
	cmp r1, #4
	beq _080EEA10
	ldr r0, _080EEA08 @ =gUnk_09DC45D0
	cmp r1, #5
	beq _080EE9F8
	b _080EEB48
_080EE9F8:
	ldr r1, _080EEA0C @ =0x0003B40C
	adds r0, r0, r1
	b _080EEB48
	.align 2, 0
_080EEA00: .4byte gUnk_02000000
_080EEA04: .4byte 0x00006C2C
_080EEA08: .4byte gUnk_09DC45D0
_080EEA0C: .4byte 0x0003B40C
_080EEA10:
	ldr r0, _080EEA14 @ =gUnk_09DF3C72
	b _080EEB48
	.align 2, 0
_080EEA14: .4byte gUnk_09DF3C72
_080EEA18:
	ldr r0, _080EEA1C @ =gUnk_09DE7CC2
	b _080EEB48
	.align 2, 0
_080EEA1C: .4byte gUnk_09DE7CC2
_080EEA20:
	ldr r0, _080EEA24 @ =gUnk_09DDB7EA
	b _080EEB48
	.align 2, 0
_080EEA24: .4byte gUnk_09DDB7EA
_080EEA28:
	ldr r0, _080EEA2C @ =gUnk_09DCF47C
	b _080EEB48
	.align 2, 0
_080EEA2C: .4byte gUnk_09DCF47C
_080EEA30:
	ldr r0, _080EEA5C @ =gUnk_02000000
	ldr r1, _080EEA60 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EEA84
	cmp r1, #2
	beq _080EEA7C
	cmp r1, #3
	beq _080EEA74
	cmp r1, #4
	beq _080EEA6C
	ldr r0, _080EEA64 @ =gUnk_09DC45E4
	cmp r1, #5
	beq _080EEA54
	b _080EEB48
_080EEA54:
	ldr r1, _080EEA68 @ =0x0003B3FA
	adds r0, r0, r1
	b _080EEB48
	.align 2, 0
_080EEA5C: .4byte gUnk_02000000
_080EEA60: .4byte 0x00006C2C
_080EEA64: .4byte gUnk_09DC45E4
_080EEA68: .4byte 0x0003B3FA
_080EEA6C:
	ldr r0, _080EEA70 @ =gUnk_09DF3C74
	b _080EEB48
	.align 2, 0
_080EEA70: .4byte gUnk_09DF3C74
_080EEA74:
	ldr r0, _080EEA78 @ =gUnk_09DE7CC4
	b _080EEB48
	.align 2, 0
_080EEA78: .4byte gUnk_09DE7CC4
_080EEA7C:
	ldr r0, _080EEA80 @ =gUnk_09DDB7EC
	b _080EEB48
	.align 2, 0
_080EEA80: .4byte gUnk_09DDB7EC
_080EEA84:
	ldr r0, _080EEA88 @ =gUnk_09DCF47E
	b _080EEB48
	.align 2, 0
_080EEA88: .4byte gUnk_09DCF47E
_080EEA8C:
	ldr r0, _080EEAB4 @ =gUnk_02000000
	ldr r1, _080EEAB8 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EEADC
	cmp r1, #2
	beq _080EEAD4
	cmp r1, #3
	beq _080EEACC
	cmp r1, #4
	beq _080EEAC4
	ldr r0, _080EEABC @ =gUnk_09DC45F8
	cmp r1, #5
	bne _080EEB48
	ldr r1, _080EEAC0 @ =0x0003B3E8
	adds r0, r0, r1
	b _080EEB48
	.align 2, 0
_080EEAB4: .4byte gUnk_02000000
_080EEAB8: .4byte 0x00006C2C
_080EEABC: .4byte gUnk_09DC45F8
_080EEAC0: .4byte 0x0003B3E8
_080EEAC4:
	ldr r0, _080EEAC8 @ =gUnk_09DF3C76
	b _080EEB48
	.align 2, 0
_080EEAC8: .4byte gUnk_09DF3C76
_080EEACC:
	ldr r0, _080EEAD0 @ =gUnk_09DE7CC6
	b _080EEB48
	.align 2, 0
_080EEAD0: .4byte gUnk_09DE7CC6
_080EEAD4:
	ldr r0, _080EEAD8 @ =gUnk_09DDB7EE
	b _080EEB48
	.align 2, 0
_080EEAD8: .4byte gUnk_09DDB7EE
_080EEADC:
	ldr r0, _080EEAE0 @ =gUnk_09DCF480
	b _080EEB48
	.align 2, 0
_080EEAE0: .4byte gUnk_09DCF480
_080EEAE4:
	ldr r0, _080EEB0C @ =gUnk_02000000
	ldr r1, _080EEB10 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EEB34
	cmp r1, #2
	beq _080EEB2C
	cmp r1, #3
	beq _080EEB24
	cmp r1, #4
	beq _080EEB1C
	ldr r0, _080EEB14 @ =gUnk_09DC460C
	cmp r1, #5
	bne _080EEB48
	ldr r1, _080EEB18 @ =0x0003B3D6
	adds r0, r0, r1
	b _080EEB48
	.align 2, 0
_080EEB0C: .4byte gUnk_02000000
_080EEB10: .4byte 0x00006C2C
_080EEB14: .4byte gUnk_09DC460C
_080EEB18: .4byte 0x0003B3D6
_080EEB1C:
	ldr r0, _080EEB20 @ =gUnk_09DF3C78
	b _080EEB48
	.align 2, 0
_080EEB20: .4byte gUnk_09DF3C78
_080EEB24:
	ldr r0, _080EEB28 @ =gUnk_09DE7CC8
	b _080EEB48
	.align 2, 0
_080EEB28: .4byte gUnk_09DE7CC8
_080EEB2C:
	ldr r0, _080EEB30 @ =gUnk_09DDB7F0
	b _080EEB48
	.align 2, 0
_080EEB30: .4byte gUnk_09DDB7F0
_080EEB34:
	ldr r0, _080EEB38 @ =gUnk_09DCF482
	b _080EEB48
	.align 2, 0
_080EEB38: .4byte gUnk_09DCF482
_080EEB3C:
	ldr r1, _080EEB4C @ =gUnk_0983885C
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080EEB50 @ =gUnk_0983A924
	adds r0, r0, r1
_080EEB48:
	bx lr
	.align 2, 0
_080EEB4C: .4byte gUnk_0983885C
_080EEB50: .4byte gUnk_0983A924

	thumb_func_start sub_080EEB54
sub_080EEB54: @ 0x080EEB54
	adds r2, r0, #0
	adds r3, r1, #0
	ldr r0, _080EEBA0 @ =0x080000AE
	ldrh r0, [r0]
	lsrs r0, r0, #8
	cmp r0, #0x4a
	beq _080EEBDC
	cmp r3, #0
	bne _080EEBDC
	ldr r1, _080EEBA4 @ =gCardStats
	movs r0, #0x16
	muls r0, r2, r0
	adds r0, r0, r1
	ldr r1, _080EEBA8 @ =0x00001468 (Destiny Board)
	ldrh r0, [r0]
	cmp r0, r1
	bne _080EEBDC
	ldr r0, _080EEBAC @ =gUnk_02000000
	ldr r1, _080EEBB0 @ =0x00006C2C
	adds r0, r0, r1
	movs r1, #7
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #1
	beq _080EEBD4
	cmp r1, #2
	beq _080EEBCC
	cmp r1, #3
	beq _080EEBC4
	cmp r1, #4
	beq _080EEBBC
	ldr r0, _080EEBB4 @ =gUnk_09DC4474
	cmp r1, #5
	bne _080EEBF0
	ldr r1, _080EEBB8 @ =0x0003B55E
	adds r0, r0, r1
	b _080EEBF0
	.align 2, 0
_080EEBA0: .4byte 0x080000AE
_080EEBA4: .4byte gCardStats
_080EEBA8: .4byte 0x00001468 @ Destiny Board
_080EEBAC: .4byte gUnk_02000000
_080EEBB0: .4byte 0x00006C2C
_080EEBB4: .4byte gUnk_09DC4474
_080EEBB8: .4byte 0x0003B55E
_080EEBBC:
	ldr r0, _080EEBC0 @ =gUnk_09DF3C68
	b _080EEBF0
	.align 2, 0
_080EEBC0: .4byte gUnk_09DF3C68
_080EEBC4:
	ldr r0, _080EEBC8 @ =gUnk_09DE7CB8
	b _080EEBF0
	.align 2, 0
_080EEBC8: .4byte gUnk_09DE7CB8
_080EEBCC:
	ldr r0, _080EEBD0 @ =gUnk_09DDB7E0
	b _080EEBF0
	.align 2, 0
_080EEBD0: .4byte gUnk_09DDB7E0
_080EEBD4:
	ldr r0, _080EEBD8 @ =gUnk_09DCF472
	b _080EEBF0
	.align 2, 0
_080EEBD8: .4byte gUnk_09DCF472
_080EEBDC:
	ldr r1, _080EEBF4 @ =gUnk_0980A508
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r1, _080EEBF8 @ =gUnk_095FFF0C
	adds r0, r0, r1
_080EEBF0:
	bx lr
	.align 2, 0
_080EEBF4: .4byte gUnk_0980A508
_080EEBF8: .4byte gUnk_095FFF0C

	thumb_func_start sub_080EEBFC
sub_080EEBFC: @ 0x080EEBFC
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080EE76C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _080EEC20 @ =gUnk_02000000
	ldr r2, _080EEC24 @ =0x00006C2C
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1d
	bl sub_080EE7AC
	pop {r1}
	bx r1
	.align 2, 0
_080EEC20: .4byte gUnk_02000000
_080EEC24: .4byte 0x00006C2C

	thumb_func_start sub_080EEC28
sub_080EEC28: @ 0x080EEC28
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080EE76C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, _080EEC4C @ =gUnk_02000000
	ldr r2, _080EEC50 @ =0x00006C2C
	adds r1, r1, r2
	ldrb r1, [r1]
	lsls r1, r1, #0x1d
	lsrs r1, r1, #0x1d
	bl sub_080EEB54
	pop {r1}
	bx r1
	.align 2, 0
_080EEC4C: .4byte gUnk_02000000
_080EEC50: .4byte 0x00006C2C

	thumb_func_start sub_080EEC54
sub_080EEC54: @ 0x080EEC54
	push {lr}
	adds r1, r0, #0
	ldr r0, _080EEC8C @ =0xFFFE0000
	ands r0, r1
	cmp r0, #0
	bne _080EECA0
	adds r0, r1, #0
	bl GetInterfaceTextIdIndex
	ldr r2, _080EEC90 @ =gInterfaceTextOffsets
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080EEC94 @ =gUnk_02000000
	ldr r3, _080EEC98 @ =0x00006C2C
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, _080EEC9C @ =gInterfaceText
	adds r0, r0, r1
	b _080EECA2
	.align 2, 0
_080EEC8C: .4byte 0xFFFE0000
_080EEC90: .4byte gInterfaceTextOffsets
_080EEC94: .4byte gUnk_02000000
_080EEC98: .4byte 0x00006C2C
_080EEC9C: .4byte gInterfaceText
_080EECA0:
	adds r0, r1, #0
_080EECA2:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080EECA8
sub_080EECA8: @ 0x080EECA8
	push {lr}
	cmp r0, #0
	beq _080EECF0
	movs r1, #0xfa
	lsls r1, r1, #1
	adds r0, r0, r1
	bl GetInterfaceTextIdIndex
	ldr r2, _080EECE0 @ =gInterfaceTextOffsets
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080EECE4 @ =gUnk_02000000
	ldr r3, _080EECE8 @ =0x00006C2C
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, _080EECEC @ =gInterfaceText
	adds r0, r0, r1
	b _080EECF2
	.align 2, 0
_080EECE0: .4byte gInterfaceTextOffsets
_080EECE4: .4byte gUnk_02000000
_080EECE8: .4byte 0x00006C2C
_080EECEC: .4byte gInterfaceText
_080EECF0:
	ldr r0, _080EECF8 @ =gUnk_09E4F348
_080EECF2:
	pop {r1}
	bx r1
	.align 2, 0
_080EECF8: .4byte gUnk_09E4F348

	thumb_func_start sub_080EECFC
sub_080EECFC: @ 0x080EECFC
	push {lr}
	cmp r0, #0
	beq _080EED44
	ldr r1, _080EED30 @ =0x00000226
	adds r0, r0, r1
	bl GetInterfaceTextIdIndex
	ldr r2, _080EED34 @ =gInterfaceTextOffsets
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080EED38 @ =gUnk_02000000
	ldr r3, _080EED3C @ =0x00006C2C
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, _080EED40 @ =gInterfaceText
	adds r0, r0, r1
	b _080EED46
	.align 2, 0
_080EED30: .4byte 0x00000226
_080EED34: .4byte gInterfaceTextOffsets
_080EED38: .4byte gUnk_02000000
_080EED3C: .4byte 0x00006C2C
_080EED40: .4byte gInterfaceText
_080EED44:
	ldr r0, _080EED4C @ =gUnk_09E4F348
_080EED46:
	pop {r1}
	bx r1
	.align 2, 0
_080EED4C: .4byte gUnk_09E4F348

	thumb_func_start sub_080EED50
sub_080EED50: @ 0x080EED50
	push {lr}
	cmp r0, #0
	beq _080EED98
	ldr r1, _080EED84 @ =0x00000212
	adds r0, r0, r1
	bl GetInterfaceTextIdIndex
	ldr r2, _080EED88 @ =gInterfaceTextOffsets
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080EED8C @ =gUnk_02000000
	ldr r3, _080EED90 @ =0x00006C2C
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, _080EED94 @ =gInterfaceText
	adds r0, r0, r1
	b _080EED9A
	.align 2, 0
_080EED84: .4byte 0x00000212
_080EED88: .4byte gInterfaceTextOffsets
_080EED8C: .4byte gUnk_02000000
_080EED90: .4byte 0x00006C2C
_080EED94: .4byte gInterfaceText
_080EED98:
	ldr r0, _080EEDA0 @ =gUnk_09E4F348
_080EED9A:
	pop {r1}
	bx r1
	.align 2, 0
_080EEDA0: .4byte gUnk_09E4F348

	thumb_func_start sub_080EEDA4
sub_080EEDA4: @ 0x080EEDA4
	push {lr}
	cmp r0, #0
	beq _080EEDEC
	ldr r1, _080EEDD8 @ =0x0000023A
	adds r0, r0, r1
	bl GetInterfaceTextIdIndex
	ldr r2, _080EEDDC @ =gInterfaceTextOffsets
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080EEDE0 @ =gUnk_02000000
	ldr r3, _080EEDE4 @ =0x00006C2C
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	ldr r1, _080EEDE8 @ =gInterfaceText
	adds r0, r0, r1
	b _080EEDEE
	.align 2, 0
_080EEDD8: .4byte 0x0000023A
_080EEDDC: .4byte gInterfaceTextOffsets
_080EEDE0: .4byte gUnk_02000000
_080EEDE4: .4byte 0x00006C2C
_080EEDE8: .4byte gInterfaceText
_080EEDEC:
	ldr r0, _080EEDF4 @ =gUnk_09E4F348
_080EEDEE:
	pop {r1}
	bx r1
	.align 2, 0
_080EEDF4: .4byte gUnk_09E4F348

	thumb_func_start sub_080EEDF8
sub_080EEDF8: @ 0x080EEDF8
	adds r1, r0, #0
	ldr r0, _080EEE14 @ =0x00000FA6
	cmp r1, r0
	ble _080EEE20
	ldr r2, _080EEE18 @ =gCardStatsKonamiIDs
	ldr r0, _080EEE1C @ =0xFFFFF059
	adds r1, r1, r0
	movs r0, #0xb
	muls r0, r1, r0
	adds r0, #6
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	b _080EEE22
	.align 2, 0
_080EEE14: .4byte 0x00000FA6
_080EEE18: .4byte gCardStatsKonamiIDs
_080EEE1C: .4byte 0xFFFFF059
_080EEE20:
	movs r0, #0
_080EEE22:
	bx lr

	thumb_func_start sub_080EEE24
sub_080EEE24: @ 0x080EEE24
	adds r1, r0, #0
	ldr r0, _080EEE40 @ =0x00000FA6
	cmp r1, r0
	ble _080EEE4C
	ldr r2, _080EEE44 @ =gCardStatsKonamiIDs
	ldr r0, _080EEE48 @ =0xFFFFF059
	adds r1, r1, r0
	movs r0, #0xb
	muls r0, r1, r0
	adds r0, #7
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	b _080EEE4E
	.align 2, 0
_080EEE40: .4byte 0x00000FA6
_080EEE44: .4byte gCardStatsKonamiIDs
_080EEE48: .4byte 0xFFFFF059
_080EEE4C:
	movs r0, #0
_080EEE4E:
	bx lr

	thumb_func_start sub_080EEE50
sub_080EEE50: @ 0x080EEE50
	adds r1, r0, #0
	ldr r0, _080EEE6C @ =0x00000FA6
	cmp r1, r0
	ble _080EEE78
	ldr r2, _080EEE70 @ =gCardStatsKonamiIDs
	ldr r0, _080EEE74 @ =0xFFFFF059
	adds r1, r1, r0
	movs r0, #0xb
	muls r0, r1, r0
	adds r0, #5
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	b _080EEE7A
	.align 2, 0
_080EEE6C: .4byte 0x00000FA6
_080EEE70: .4byte gCardStatsKonamiIDs
_080EEE74: .4byte 0xFFFFF059
_080EEE78:
	movs r0, #0
_080EEE7A:
	bx lr

	thumb_func_start sub_080EEE7C
sub_080EEE7C: @ 0x080EEE7C
	adds r1, r0, #0
	ldr r0, _080EEE98 @ =0x00000FA6
	cmp r1, r0
	ble _080EEEA4
	ldr r2, _080EEE9C @ =gCardStatsKonamiIDs
	ldr r0, _080EEEA0 @ =0xFFFFF059
	adds r1, r1, r0
	movs r0, #0xb
	muls r0, r1, r0
	adds r0, #9
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	b _080EEEA6
	.align 2, 0
_080EEE98: .4byte 0x00000FA6
_080EEE9C: .4byte gCardStatsKonamiIDs
_080EEEA0: .4byte 0xFFFFF059
_080EEEA4:
	movs r0, #0
_080EEEA6:
	bx lr

	thumb_func_start sub_080EEEA8
sub_080EEEA8: @ 0x080EEEA8
	adds r1, r0, #0
	ldr r0, _080EEEC4 @ =0x00000FA6
	cmp r1, r0
	ble _080EEED0
	ldr r2, _080EEEC8 @ =gCardStatsKonamiIDs
	ldr r0, _080EEECC @ =0xFFFFF059
	adds r1, r1, r0
	movs r0, #0xb
	muls r0, r1, r0
	adds r0, #8
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	b _080EEED2
	.align 2, 0
_080EEEC4: .4byte 0x00000FA6
_080EEEC8: .4byte gCardStatsKonamiIDs
_080EEECC: .4byte 0xFFFFF059
_080EEED0:
	movs r0, #0
_080EEED2:
	bx lr

	thumb_func_start sub_080EEED4
sub_080EEED4: @ 0x080EEED4
	adds r1, r0, #0
	ldr r0, _080EEEF8 @ =0x00000FA6
	cmp r1, r0
	ble _080EEF08
	ldr r2, _080EEEFC @ =gCardStatsKonamiIDs
	ldr r0, _080EEF00 @ =0xFFFFF059
	adds r1, r1, r0
	movs r0, #0xb
	muls r0, r1, r0
	adds r0, #3
	lsls r0, r0, #1
	adds r1, r0, r2
	ldr r0, _080EEF04 @ =0x0000FFFF
	ldrh r2, [r1]
	cmp r2, r0
	beq _080EEF08
	ldrh r0, [r1]
	b _080EEF0A
	.align 2, 0
_080EEEF8: .4byte 0x00000FA6
_080EEEFC: .4byte gCardStatsKonamiIDs
_080EEF00: .4byte 0xFFFFF059
_080EEF04: .4byte 0x0000FFFF
_080EEF08:
	movs r0, #0
_080EEF0A:
	bx lr

	thumb_func_start sub_080EEF0C
sub_080EEF0C: @ 0x080EEF0C
	adds r1, r0, #0
	ldr r0, _080EEF30 @ =0x00000FA6
	cmp r1, r0
	ble _080EEF40
	ldr r2, _080EEF34 @ =gCardStatsKonamiIDs
	ldr r0, _080EEF38 @ =0xFFFFF059
	adds r1, r1, r0
	movs r0, #0xb
	muls r0, r1, r0
	adds r0, #4
	lsls r0, r0, #1
	adds r1, r0, r2
	ldr r0, _080EEF3C @ =0x0000FFFF
	ldrh r2, [r1]
	cmp r2, r0
	beq _080EEF40
	ldrh r0, [r1]
	b _080EEF42
	.align 2, 0
_080EEF30: .4byte 0x00000FA6
_080EEF34: .4byte gCardStatsKonamiIDs
_080EEF38: .4byte 0xFFFFF059
_080EEF3C: .4byte 0x0000FFFF
_080EEF40:
	movs r0, #0
_080EEF42:
	bx lr

	thumb_func_start sub_080EEF44
sub_080EEF44: @ 0x080EEF44
	adds r1, r0, #0
	ldr r0, _080EEF60 @ =0x00000FA6
	cmp r1, r0
	ble _080EEF6C
	ldr r2, _080EEF64 @ =gCardStatsKonamiIDs
	ldr r0, _080EEF68 @ =0xFFFFF059
	adds r1, r1, r0
	movs r0, #0xb
	muls r0, r1, r0
	adds r0, #3
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	b _080EEF6E
	.align 2, 0
_080EEF60: .4byte 0x00000FA6
_080EEF64: .4byte gCardStatsKonamiIDs
_080EEF68: .4byte 0xFFFFF059
_080EEF6C:
	movs r0, #0
_080EEF6E:
	bx lr

	thumb_func_start sub_080EEF70
sub_080EEF70: @ 0x080EEF70
	adds r1, r0, #0
	ldr r0, _080EEF8C @ =0x00000FA6
	cmp r1, r0
	ble _080EEF98
	ldr r2, _080EEF90 @ =gCardStatsKonamiIDs
	ldr r0, _080EEF94 @ =0xFFFFF059
	adds r1, r1, r0
	movs r0, #0xb
	muls r0, r1, r0
	adds r0, #4
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	b _080EEF9A
	.align 2, 0
_080EEF8C: .4byte 0x00000FA6
_080EEF90: .4byte gCardStatsKonamiIDs
_080EEF94: .4byte 0xFFFFF059
_080EEF98:
	movs r0, #0
_080EEF9A:
	bx lr

	thumb_func_start sub_080EEF9C
sub_080EEF9C: @ 0x080EEF9C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080EE76C
	lsls r0, r0, #0x10
	lsrs r0, r0, #0xf
	ldr r1, _080EEFBC @ =gUnk_02000006
	adds r0, r0, r1
	movs r1, #3
	ldrb r0, [r0, #1]
	ands r1, r0
	adds r0, r1, #0
	pop {r1}
	bx r1
	.align 2, 0
_080EEFBC: .4byte gUnk_02000006

	thumb_func_start sub_080EEFC0
sub_080EEFC0: @ 0x080EEFC0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	adds r0, r6, #0
	bl gEngineEffectSpecialSummonSendToGY_0804AC58
	eors r0, r6
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	mov sb, r1
	lsls r4, r4, #3
	ldr r0, _080EF00C @ =gUnk_09E5F6CC
	adds r4, r4, r0
	mov r8, r4
	ldr r7, [r4, #4]
	movs r5, #0
	cmp r5, r7
	bge _080EF01C
_080EEFEE:
	lsls r1, r5, #2
	mov r2, r8
	ldr r0, [r2]
	adds r4, r0, r1
	mov r0, sb
	cmp r0, #0
	beq _080EF010
	ldrh r0, [r4]
	adds r1, r6, #0
	bl gEngineEffectSpecialSummonSendToGY_0804ACC8
	cmp r0, #0
	beq _080EF016
_080EF008:
	ldrh r0, [r4, #2]
	b _080EF01E
	.align 2, 0
_080EF00C: .4byte gUnk_09E5F6CC
_080EF010:
	ldrh r2, [r4]
	cmp r2, r6
	beq _080EF008
_080EF016:
	adds r5, #1
	cmp r5, r7
	blt _080EEFEE
_080EF01C:
	movs r0, #3
_080EF01E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080EF02C
sub_080EF02C: @ 0x080EF02C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	movs r6, #0
	ldr r0, _080EF108 @ =gUnk_02000000
	ldr r2, _080EF10C @ =0x00001150 (Stone Dragon (None))
	adds r1, r0, r2
	mov sb, r0
	ldrb r1, [r1]
	cmp r6, r1
	bge _080EF084
	ldr r0, _080EF110 @ =gCardStats
	mov sl, r0
_080EF04C:
	lsls r1, r6, #1
	ldr r7, _080EF114 @ =0x00001154 (Water Magician)
	add r7, sb
	adds r1, r1, r7
	movs r0, #0x16
	ldrh r1, [r1]
	muls r0, r1, r0
	add r0, sl
	ldrh r4, [r0]
	adds r0, r4, #0
	bl sub_080F914C
	adds r5, r0, #0
	mov r0, r8
	adds r1, r4, #0
	bl sub_080EEFC0
	cmp r5, r0
	bgt _080EF104
	adds r6, #1
	ldr r0, _080EF10C @ =0x00001150 (Stone Dragon (None))
	add r0, sb
	ldr r1, _080EF118 @ =0xFFFFEEAC
	adds r1, r1, r7
	mov sb, r1
	ldrb r0, [r0]
	cmp r6, r0
	blt _080EF04C
_080EF084:
	movs r6, #0
	ldr r0, _080EF11C @ =0x00001151 (Kaiser Dragon)
	add r0, sb
	ldrb r0, [r0]
	cmp r6, r0
	bge _080EF0CC
	ldr r2, _080EF110 @ =gCardStats
	mov sl, r2
_080EF094:
	lsls r1, r6, #1
	ldr r7, _080EF120 @ =0x000011F4 (Beaked Snake)
	add r7, sb
	adds r1, r1, r7
	movs r0, #0x16
	ldrh r1, [r1]
	muls r0, r1, r0
	add r0, sl
	ldrh r4, [r0]
	adds r0, r4, #0
	bl sub_080F914C
	adds r5, r0, #0
	mov r0, r8
	adds r1, r4, #0
	bl sub_080EEFC0
	cmp r5, r0
	bgt _080EF104
	adds r6, #1
	ldr r0, _080EF11C @ =0x00001151 (Kaiser Dragon)
	add r0, sb
	ldr r1, _080EF124 @ =0xFFFFEE0C
	adds r1, r1, r7
	mov sb, r1
	ldrb r0, [r0]
	cmp r6, r0
	blt _080EF094
_080EF0CC:
	movs r6, #0
	ldr r0, _080EF128 @ =0x00001152 (Magician of Faith)
	add r0, sb
	ldrb r2, [r0]
	cmp r6, r2
	bge _080EF13A
	mov sl, sb
	mov sb, r0
	ldr r7, _080EF110 @ =gCardStats
_080EF0DE:
	lsls r1, r6, #1
	ldr r0, _080EF12C @ =0x00001212 (Snakeyashi)
	add r0, sl
	adds r1, r1, r0
	movs r0, #0x16
	ldrh r1, [r1]
	muls r0, r1, r0
	adds r0, r0, r7
	ldrh r4, [r0]
	adds r0, r4, #0
	bl sub_080F914C
	adds r5, r0, #0
	mov r0, r8
	adds r1, r4, #0
	bl sub_080EEFC0
	cmp r5, r0
	ble _080EF130
_080EF104:
	movs r0, #0
	b _080EF13C
	.align 2, 0
_080EF108: .4byte gUnk_02000000
_080EF10C: .4byte 0x00001150 @ Stone Dragon (None)
_080EF110: .4byte gCardStats
_080EF114: .4byte 0x00001154 @ Water Magician
_080EF118: .4byte 0xFFFFEEAC
_080EF11C: .4byte 0x00001151 @ Kaiser Dragon
_080EF120: .4byte 0x000011F4 @ Beaked Snake
_080EF124: .4byte 0xFFFFEE0C
_080EF128: .4byte 0x00001152 @ Magician of Faith
_080EF12C: .4byte 0x00001212 @ Snakeyashi
_080EF130:
	adds r6, #1
	mov r0, sb
	ldrb r0, [r0]
	cmp r6, r0
	blt _080EF0DE
_080EF13A:
	movs r0, #1
_080EF13C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080EF14C
sub_080EF14C: @ 0x080EF14C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #1
	ldr r0, _080EF1B4 @ =gUnk_095B7CCA
	ldrh r0, [r0]
	cmp r4, r0
	bhi _080EF194
	ldr r6, _080EF1B8 @ =gCardStats
_080EF15C:
	movs r0, #0x16
	muls r0, r4, r0
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_080EEFC0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r4, #1
	ldr r1, _080EF1BC @ =gUnk_02000006
	adds r2, r2, r1
	movs r1, #3
	ands r0, r1
	movs r3, #4
	rsbs r3, r3, #0
	adds r1, r3, #0
	ldrb r3, [r2, #1]
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080EF1B4 @ =gUnk_095B7CCA
	ldrh r0, [r0]
	cmp r4, r0
	bls _080EF15C
_080EF194:
	ldr r1, _080EF1C0 @ =gUnk_02000000
	ldr r0, _080EF1C4 @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #0x3f
	ands r5, r0
	lsls r2, r5, #4
	ldr r0, _080EF1C8 @ =0xFFFFFC0F
	ldrh r3, [r1]
	ands r0, r3
	orrs r0, r2
	strh r0, [r1]
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080EF1B4: .4byte gUnk_095B7CCA
_080EF1B8: .4byte gCardStats
_080EF1BC: .4byte gUnk_02000006
_080EF1C0: .4byte gUnk_02000000
_080EF1C4: .4byte 0x00006C2C
_080EF1C8: .4byte 0xFFFFFC0F

	thumb_func_start sub_080EF1CC
sub_080EF1CC: @ 0x080EF1CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	adds r0, r6, #0
	bl gEngineEffectSpecialSummonSendToGY_0804AC58
	eors r0, r6
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	mov r8, r1
	lsls r0, r4, #7
	adds r0, r0, r4
	lsls r0, r0, #2
	ldr r1, _080EF220 @ =gUnk_020053F8
	adds r1, r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r1, r2
	ldrb r7, [r0]
	movs r5, #0
	cmp r5, r7
	bge _080EF23C
	adds r4, r1, #0
_080EF202:
	mov r0, r8
	cmp r0, #0
	beq _080EF224
	ldr r0, [r4]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x12
	adds r1, r6, #0
	bl gEngineEffectSpecialSummonSendToGY_0804ACC8
	cmp r0, #0
	beq _080EF234
	ldr r0, [r4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	b _080EF23E
	.align 2, 0
_080EF220: .4byte gUnk_020053F8
_080EF224:
	ldr r1, [r4]
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x12
	cmp r0, r6
	bne _080EF234
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1e
	b _080EF23E
_080EF234:
	adds r4, #2
	adds r5, #1
	cmp r5, r7
	blt _080EF202
_080EF23C:
	movs r0, #3
_080EF23E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start sub_080EF248
sub_080EF248: @ 0x080EF248
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r4, #1
	ldr r0, _080EF2B4 @ =gUnk_095B7CCA
	ldrh r0, [r0]
	cmp r4, r0
	bhi _080EF290
	ldr r6, _080EF2B8 @ =gCardStats
_080EF258:
	movs r0, #0x16
	muls r0, r4, r0
	adds r0, r0, r6
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_080EF1CC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r2, r4, #1
	ldr r1, _080EF2BC @ =gUnk_02000006
	adds r2, r2, r1
	movs r1, #3
	ands r0, r1
	movs r3, #4
	rsbs r3, r3, #0
	adds r1, r3, #0
	ldrb r3, [r2, #1]
	ands r1, r3
	orrs r1, r0
	strb r1, [r2, #1]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _080EF2B4 @ =gUnk_095B7CCA
	ldrh r0, [r0]
	cmp r4, r0
	bls _080EF258
_080EF290:
	ldr r2, _080EF2C0 @ =gUnk_02000000
	adds r1, r5, #0
	adds r1, #0xa
	ldr r0, _080EF2C4 @ =0x00006C2C
	adds r2, r2, r0
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #4
	ldr r0, _080EF2C8 @ =0xFFFFFC0F
	ldrh r3, [r2]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2]
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080EF2B4: .4byte gUnk_095B7CCA
_080EF2B8: .4byte gCardStats
_080EF2BC: .4byte gUnk_02000006
_080EF2C0: .4byte gUnk_02000000
_080EF2C4: .4byte 0x00006C2C
_080EF2C8: .4byte 0xFFFFFC0F

	thumb_func_start sub_080EF2CC
sub_080EF2CC: @ 0x080EF2CC
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _080EF2DC @ =gUnk_095B7CCA
	ldrh r0, [r0]
	cmp r1, r0
	bls _080EF2E4
	ldr r0, _080EF2E0 @ =gUnk_0984CFEC
	b _080EF356
	.align 2, 0
_080EF2DC: .4byte gUnk_095B7CCA
_080EF2E0: .4byte gUnk_0984CFEC
_080EF2E4:
	ldr r2, _080EF300 @ =gCardStats
	movs r0, #0xb
	muls r1, r0, r1
	adds r0, r1, #6
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	cmp r0, #0x16
	beq _080EF308
	cmp r0, #0x17
	bne _080EF310
	ldr r0, _080EF304 @ =gUnk_0984CFCC
	b _080EF356
	.align 2, 0
_080EF300: .4byte gCardStats
_080EF304: .4byte gUnk_0984CFCC
_080EF308:
	ldr r0, _080EF30C @ =gUnk_0984CFAC
	b _080EF356
	.align 2, 0
_080EF30C: .4byte gUnk_0984CFAC
_080EF310:
	ldr r0, _080EF330 @ =gUnk_09E4F1C4
	adds r1, #8
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r1, [r1]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	cmp r0, #2
	beq _080EF34C
	cmp r0, #2
	bgt _080EF334
	cmp r0, #1
	beq _080EF33A
	b _080EF354
	.align 2, 0
_080EF330: .4byte gUnk_09E4F1C4
_080EF334:
	cmp r0, #3
	beq _080EF344
	b _080EF354
_080EF33A:
	ldr r0, _080EF340 @ =gUnk_0984CF4C
	b _080EF356
	.align 2, 0
_080EF340: .4byte gUnk_0984CF4C
_080EF344:
	ldr r0, _080EF348 @ =gUnk_0984CF6C
	b _080EF356
	.align 2, 0
_080EF348: .4byte gUnk_0984CF6C
_080EF34C:
	ldr r0, _080EF350 @ =gUnk_0984CF8C
	b _080EF356
	.align 2, 0
_080EF350: .4byte gUnk_0984CF8C
_080EF354:
	ldr r0, _080EF358 @ =gUnk_0984CF2C
_080EF356:
	bx lr
	.align 2, 0
_080EF358: .4byte gUnk_0984CF2C

	thumb_func_start sub_080EF35C
sub_080EF35C: @ 0x080EF35C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl sub_080F5E00
	eors r4, r0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080EF370
sub_080EF370: @ 0x080EF370
	push {lr}
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _080EF388 @ =gCardPasswords
	lsls r0, r1, #2
	adds r0, r0, r2
	ldr r0, [r0]
	bl sub_080EF35C
	pop {r1}
	bx r1
	.align 2, 0
_080EF388: .4byte gCardPasswords

	thumb_func_start sub_080EF38C
sub_080EF38C: @ 0x080EF38C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #1
	b _080EF3A8
_080EF394:
	lsls r0, r5, #0x10
	lsrs r4, r0, #0x10
	adds r0, r4, #0
	bl sub_080EF370
	cmp r0, r6
	bne _080EF3A6
	adds r0, r4, #0
	b _080EF3B2
_080EF3A6:
	adds r5, #1
_080EF3A8:
	ldr r0, _080EF3B8 @ =gUnk_095B7CCA
	ldrh r0, [r0]
	cmp r5, r0
	ble _080EF394
	movs r0, #0
_080EF3B2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080EF3B8: .4byte gUnk_095B7CCA

	thumb_func_start sub_080EF3BC
sub_080EF3BC: @ 0x080EF3BC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _080EF3E8 @ =gCardStats
	movs r1, #0x16
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r0, _080EF3EC @ =0x000018B4 (Megarock Dragon)
	cmp r1, r0
	beq _080EF446
	cmp r1, r0
	bgt _080EF414
	ldr r0, _080EF3F0 @ =0x000014FC (Gradius' Option)
	cmp r1, r0
	beq _080EF446
	cmp r1, r0
	bgt _080EF3F8
	ldr r0, _080EF3F4 @ =0x00001388 (The Winged Dragon of Ra (None))
	cmp r1, r0
	bgt _080EF450
	subs r0, #1
	b _080EF442
	.align 2, 0
_080EF3E8: .4byte gCardStats
_080EF3EC: .4byte 0x000018B4 @ Megarock Dragon
_080EF3F0: .4byte 0x000014FC @ Gradius' Option
_080EF3F4: .4byte 0x00001388 @ The Winged Dragon of Ra (None)
_080EF3F8:
	ldr r0, _080EF408 @ =0x000016CA (Gren Maju Da Eiza)
	cmp r1, r0
	beq _080EF446
	cmp r1, r0
	bgt _080EF40C
	subs r0, #0x76
	b _080EF426
	.align 2, 0
_080EF408: .4byte 0x000016CA @ Gren Maju Da Eiza
_080EF40C:
	ldr r0, _080EF410 @ =0x000018B0 (Lost Guardian)
	b _080EF426
	.align 2, 0
_080EF410: .4byte 0x000018B0 @ Lost Guardian
_080EF414:
	ldr r0, _080EF42C @ =0x0000191B (Tyranno Infinity)
	cmp r1, r0
	beq _080EF446
	cmp r1, r0
	bgt _080EF430
	subs r0, #0x56
	cmp r1, r0
	beq _080EF446
	adds r0, #0x36
_080EF426:
	cmp r1, r0
	beq _080EF446
	b _080EF450
	.align 2, 0
_080EF42C: .4byte 0x0000191B @ Tyranno Infinity
_080EF430:
	ldr r0, _080EF44C @ =0x000019C4 (Parasitic Ticky)
	cmp r1, r0
	beq _080EF446
	cmp r1, r0
	blt _080EF450
	adds r0, #0x34
	cmp r1, r0
	bgt _080EF450
	subs r0, #2
_080EF442:
	cmp r1, r0
	blt _080EF450
_080EF446:
	movs r0, #1
	b _080EF452
	.align 2, 0
_080EF44C: .4byte 0x000019C4 @ Parasitic Ticky
_080EF450:
	movs r0, #0
_080EF452:
	bx lr

	thumb_func_start sub_080EF454
sub_080EF454: @ 0x080EF454
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r3, #0
	ldr r2, _080EF470 @ =gCardStats
	movs r1, #0x16
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r1, [r0]
	ldr r0, _080EF474 @ =gUnk_09E5F71C
_080EF466:
	ldrh r2, [r0]
	cmp r2, r1
	bne _080EF478
	adds r0, r3, #0
	b _080EF484
	.align 2, 0
_080EF470: .4byte gCardStats
_080EF474: .4byte gUnk_09E5F71C
_080EF478:
	adds r0, #0x14
	adds r3, #1
	cmp r3, #0xd
	bls _080EF466
	movs r0, #1
	rsbs r0, r0, #0
_080EF484:
	bx lr
	.align 2, 0

	thumb_func_start sub_080EF488
sub_080EF488: @ 0x080EF488
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r2, _080EF4A0 @ =0x00000FA6
	cmp r1, r2
	bls _080EF49C
	ldr r0, _080EF4A4 @ =gUnk_0984A3F8
	ldrh r0, [r0]
	adds r0, r0, r2
	cmp r1, r0
	ble _080EF4A8
_080EF49C:
	movs r0, #0
	b _080EF4B2
	.align 2, 0
_080EF4A0: .4byte 0x00000FA6
_080EF4A4: .4byte gUnk_0984A3F8
_080EF4A8:
	ldr r2, _080EF4B4 @ =0xFFFFF059
	adds r0, r1, r2
	lsls r0, r0, #3
	ldr r1, _080EF4B8 @ =gUnk_09845138
	adds r0, r0, r1
_080EF4B2:
	bx lr
	.align 2, 0
_080EF4B4: .4byte 0xFFFFF059
_080EF4B8: .4byte gUnk_09845138

	thumb_func_start sub_080EF4BC
sub_080EF4BC: @ 0x080EF4BC
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_080EF488
	adds r3, r0, #0
	cmp r4, #0x1f
	bgt _080EF4EC
	cmp r3, #0
	beq _080EF4EC
	asrs r0, r4, #4
	movs r1, #0xf
	ands r1, r4
	movs r2, #1
	lsls r2, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	ands r2, r0
	cmp r2, #0
	beq _080EF4EC
	movs r0, #1
	b _080EF4EE
_080EF4EC:
	movs r0, #0
_080EF4EE:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080EF4F4
sub_080EF4F4: @ 0x080EF4F4
	ldr r1, _080EF520 @ =gUnk_030003A0
	ldr r2, _080EF524 @ =0x0000033F
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080EF51E
	adds r2, #5
	adds r0, r1, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _080EF51E
	ldr r2, _080EF528 @ =0x04000128
	ldr r0, _080EF52C @ =0x0000FEFE
	strh r0, [r2, #2]
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080EF530 @ =0x0400010E
	movs r0, #0xc0
	strh r0, [r1]
_080EF51E:
	bx lr
	.align 2, 0
_080EF520: .4byte gUnk_030003A0
_080EF524: .4byte 0x0000033F
_080EF528: .4byte 0x04000128
_080EF52C: .4byte 0x0000FEFE
_080EF530: .4byte 0x0400010E

	thumb_func_start sub_080EF534
sub_080EF534: @ 0x080EF534
	push {r4, r5, r6, r7, lr}
	ldr r2, _080EF560 @ =gUnk_030007A4
	ldr r0, _080EF564 @ =0x04000120
	ldr r1, [r0, #4]
	ldr r0, [r0]
	str r0, [r2]
	str r1, [r2, #4]
	ldr r0, _080EF568 @ =0x0000FEFE
	ldrh r1, [r2]
	cmp r1, r0
	bne _080EF570
	adds r1, r2, #0
	subs r1, #0xb8
	ldr r0, [r1]
	cmp r0, #9
	ble _080EF570
	movs r0, #3
	rsbs r0, r0, #0
	str r0, [r1]
	ldr r4, _080EF56C @ =0xFFFFFBFC
	adds r5, r2, r4
	b _080EF5E6
	.align 2, 0
_080EF560: .4byte gUnk_030007A4
_080EF564: .4byte 0x04000120
_080EF568: .4byte 0x0000FEFE
_080EF56C: .4byte 0xFFFFFBFC
_080EF570:
	ldr r0, _080EF640 @ =gUnk_030003A0
	movs r1, #0xd3
	lsls r1, r1, #2
	adds r2, r0, r1
	ldr r1, [r2]
	adds r5, r0, #0
	cmp r1, #0
	blt _080EF5E6
	ldr r4, _080EF644 @ =0x0000041C
	adds r1, r5, r4
	movs r0, #0
	str r0, [r1]
	adds r4, r1, #0
	mov ip, r2
	movs r0, #0xd4
	lsls r0, r0, #2
	adds r7, r5, r0
	ldr r1, _080EF648 @ =0x00000404
	adds r6, r5, r1
_080EF596:
	ldr r0, [r4]
	mov r1, ip
	ldr r2, [r1]
	ldr r3, [r7]
	lsls r2, r2, #1
	lsls r1, r0, #1
	adds r0, r1, r0
	lsls r0, r0, #3
	adds r0, r0, r3
	adds r2, r2, r0
	adds r1, r1, r6
	ldrh r0, [r1]
	strh r0, [r2]
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	cmp r0, #1
	ble _080EF596
	movs r4, #0xd3
	lsls r4, r4, #2
	adds r0, r5, r4
	ldr r0, [r0]
	cmp r0, #9
	bne _080EF5E6
	ldr r1, _080EF64C @ =0x0000040C
	adds r0, r5, r1
	adds r4, #8
	adds r2, r5, r4
	ldr r3, [r2]
	str r3, [r0]
	movs r0, #0xd4
	lsls r0, r0, #2
	adds r1, r5, r0
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	subs r4, #0x13
	adds r1, r5, r4
	movs r0, #1
	strb r0, [r1]
_080EF5E6:
	adds r1, r5, #0
	movs r0, #0xd3
	lsls r0, r0, #2
	adds r2, r1, r0
	ldr r0, [r2]
	cmp r0, #0xa
	bgt _080EF5F8
	adds r0, #1
	str r0, [r2]
_080EF5F8:
	ldr r4, _080EF650 @ =0x0000033E
	adds r3, r1, r4
	ldrb r0, [r3]
	cmp r0, #0
	beq _080EF608
	ldr r1, _080EF654 @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
_080EF608:
	ldr r0, [r2]
	cmp r0, #9
	bgt _080EF638
	cmp r0, #0
	blt _080EF622
	ldr r2, _080EF658 @ =0x04000128
	lsls r0, r0, #1
	movs r4, #0xd7
	lsls r4, r4, #2
	adds r1, r5, r4
	adds r0, r0, r1
	ldrh r0, [r0]
	strh r0, [r2, #2]
_080EF622:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080EF638
	ldr r2, _080EF658 @ =0x04000128
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	ldr r1, _080EF654 @ =0x0400010E
	movs r0, #0xc0
	strh r0, [r1]
_080EF638:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EF640: .4byte gUnk_030003A0
_080EF644: .4byte 0x0000041C
_080EF648: .4byte 0x00000404
_080EF64C: .4byte 0x0000040C
_080EF650: .4byte 0x0000033E
_080EF654: .4byte 0x0400010E
_080EF658: .4byte 0x04000128

	thumb_func_start sub_080EF65C
sub_080EF65C: @ 0x080EF65C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r0
	mov sb, r1
	ldr r3, _080EF750 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _080EF754 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080EF758 @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	strh r0, [r3]
	movs r0, #0
	str r0, [sp]
	ldr r4, _080EF75C @ =gUnk_030003A0
	ldr r2, _080EF760 @ =0x05000116
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	movs r0, #0xd4
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r2, #0xdd
	lsls r2, r2, #2
	adds r0, r4, r2
	str r0, [r1]
	movs r0, #0xd5
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r2, #0x30
	adds r0, r4, r2
	str r0, [r1]
	movs r0, #0xd6
	lsls r0, r0, #2
	adds r1, r4, r0
	adds r2, #0x30
	adds r0, r4, r2
	str r0, [r1]
	movs r3, #0
	movs r0, #0xce
	lsls r0, r0, #2
	adds r1, r4, r0
	movs r5, #0xff
	adds r7, r4, #0
	movs r2, #1
_080EF6C2:
	ldrb r0, [r1, #0x10]
	orrs r0, r5
	strb r0, [r1, #0x10]
	strb r3, [r1]
	strb r3, [r1, #2]
	adds r1, #1
	subs r2, #1
	cmp r2, #0
	bge _080EF6C2
	ldr r1, _080EF764 @ =0x00000346
	adds r0, r7, r1
	movs r6, #0
	strh r6, [r0]
	ldr r0, _080EF768 @ =0x04000134
	strh r6, [r0]
	ldr r4, _080EF76C @ =0x04000128
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r4]
	ldrh r0, [r4]
	ldr r2, _080EF770 @ =0x00004003
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
	movs r0, #0xd3
	lsls r0, r0, #2
	adds r1, r7, r0
	movs r0, #0xc
	str r0, [r1]
	movs r2, #0xd8
	lsls r2, r2, #2
	adds r1, r7, r2
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r1]
	mov r0, r8
	str r0, [r7]
	mov r1, sb
	str r1, [r7, #4]
	ldr r3, _080EF750 @ =0x04000208
	strh r6, [r3]
	ldr r2, _080EF754 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #0x80
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080EF774 @ =sub_080EF534
	mov r1, r8
	str r0, [r1]
	mov r1, sb
	str r0, [r1]
	movs r5, #1
	strh r5, [r3]
	ldr r0, _080EF778 @ =0x0000042C
	adds r1, r7, r0
	ldr r0, [r4]
	str r0, [r1]
	strh r6, [r3]
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r2]
	strh r5, [r3]
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080EF750: .4byte 0x04000208
_080EF754: .4byte 0x04000200
_080EF758: .4byte 0x0000FF3F
_080EF75C: .4byte gUnk_030003A0
_080EF760: .4byte 0x05000116
_080EF764: .4byte 0x00000346
_080EF768: .4byte 0x04000134
_080EF76C: .4byte 0x04000128
_080EF770: .4byte 0x00004003
_080EF774: .4byte sub_080EF534
_080EF778: .4byte 0x0000042C

	thumb_func_start sub_080EF77C
sub_080EF77C: @ 0x080EF77C
	ldr r3, _080EF7B4 @ =0x04000208
	movs r0, #0
	strh r0, [r3]
	ldr r2, _080EF7B8 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080EF7BC @ =0x0000FF3F
	ands r0, r1
	strh r0, [r2]
	ldr r2, _080EF7C0 @ =gUnk_030003A0
	ldr r0, [r2, #4]
	movs r1, #0
	str r1, [r0]
	ldr r0, [r2]
	str r1, [r0]
	movs r0, #1
	strh r0, [r3]
	ldr r1, _080EF7C4 @ =0x0400010C
	ldr r0, _080EF7C8 @ =0x0000B1FC
	str r0, [r1]
	adds r1, #0x1c
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	strh r0, [r1]
	adds r1, #0xda
	movs r0, #0xc0
	strh r0, [r1]
	bx lr
	.align 2, 0
_080EF7B4: .4byte 0x04000208
_080EF7B8: .4byte 0x04000200
_080EF7BC: .4byte 0x0000FF3F
_080EF7C0: .4byte gUnk_030003A0
_080EF7C4: .4byte 0x0400010C
_080EF7C8: .4byte 0x0000B1FC

	thumb_func_start sub_080EF7CC
sub_080EF7CC: @ 0x080EF7CC
	push {r4, r5, lr}
	movs r5, #0
	ldr r4, _080EF80C @ =gUnk_030003A0
	ldr r2, _080EF810 @ =0x0000035E
	adds r1, r4, r2
	strh r5, [r1]
	adds r2, #2
	adds r1, r4, r2
	ldr r2, _080EF814 @ =0x04000004
	bl CpuSet
	movs r1, #0
	movs r0, #0xd7
	lsls r0, r0, #2
	adds r4, r4, r0
_080EF7EA:
	ldrh r2, [r4]
	adds r0, r2, r5
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	adds r4, #2
	adds r1, #1
	cmp r1, #9
	bls _080EF7EA
	ldr r0, _080EF80C @ =gUnk_030003A0
	mvns r1, r5
	ldr r2, _080EF810 @ =0x0000035E
	adds r0, r0, r2
	strh r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080EF80C: .4byte gUnk_030003A0
_080EF810: .4byte 0x0000035E
_080EF814: .4byte 0x04000004

	thumb_func_start sub_080EF818
sub_080EF818: @ 0x080EF818
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	ldr r4, _080EF8DC @ =0x04000208
	movs r3, #0
	strh r3, [r4]
	ldr r5, _080EF8E0 @ =gUnk_030003A0
	movs r0, #0x85
	lsls r0, r0, #3
	adds r0, r0, r5
	mov r8, r0
	movs r1, #0xd6
	lsls r1, r1, #2
	adds r6, r5, r1
	ldr r2, [r6]
	str r2, [r0]
	movs r7, #0xd5
	lsls r7, r7, #2
	adds r1, r5, r7
	ldr r0, [r1]
	str r0, [r6]
	str r2, [r1]
	ldr r0, _080EF8E4 @ =0x00000341
	adds r1, r5, r0
	ldrb r2, [r1]
	adds r7, #0xdc
	adds r0, r5, r7
	movs r7, #0
	strh r2, [r0]
	strb r3, [r1]
	movs r0, #1
	strh r0, [r4]
	ldr r0, _080EF8E8 @ =0x00000342
	adds r1, r5, r0
	strh r7, [r1]
	cmp r2, #0
	beq _080EF926
	ldr r2, _080EF8EC @ =0x0000041C
	adds r0, r5, r2
	str r7, [r0]
	mov sb, r8
	adds r4, r0, #0
	ldr r3, _080EF8F0 @ =0x00000432
	adds r7, r5, r3
	movs r0, #0
	mov r8, r0
	adds r2, #4
	adds r6, r5, r2
	adds r5, r1, #0
_080EF882:
	ldr r0, [r4]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	ldr r3, _080EF8F4 @ =gUnk_030006F8
	ldr r0, [r3]
	adds r0, r0, r1
	mov r1, sb
	str r0, [r1]
	mov r2, r8
	strh r2, [r7]
	mov r3, r8
	str r3, [r6]
	adds r2, r0, #0
_080EF89E:
	ldr r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r2
	ldrh r3, [r7]
	ldrh r0, [r0]
	adds r0, r3, r0
	strh r0, [r7]
	adds r1, #1
	str r1, [r6]
	cmp r1, #9
	bls _080EF89E
	lsls r1, r0, #0x10
	ldr r0, _080EF8F8 @ =0xFFFF0000
	cmp r1, r0
	bne _080EF8FC
	mov r1, sb
	ldr r0, [r1]
	adds r0, #4
	ldr r1, [r4]
	lsls r1, r1, #4
	add r1, sl
	movs r2, #8
	bl CpuSet
	ldr r1, [r4]
	movs r0, #1
	lsls r0, r1
	ldrh r2, [r5]
	orrs r0, r2
	b _080EF908
	.align 2, 0
_080EF8DC: .4byte 0x04000208
_080EF8E0: .4byte gUnk_030003A0
_080EF8E4: .4byte 0x00000341
_080EF8E8: .4byte 0x00000342
_080EF8EC: .4byte 0x0000041C
_080EF8F0: .4byte 0x00000432
_080EF8F4: .4byte gUnk_030006F8
_080EF8F8: .4byte 0xFFFF0000
_080EF8FC:
	ldr r1, [r4]
	adds r1, #4
	movs r0, #1
	lsls r0, r1
	ldrh r3, [r5]
	orrs r0, r3
_080EF908:
	strh r0, [r5]
	mov r0, r8
	str r0, [sp]
	mov r2, sb
	ldr r1, [r2]
	adds r1, #4
	mov r0, sp
	ldr r2, _080EF94C @ =0x05000004
	bl CpuSet
	ldr r0, [r4]
	adds r0, #1
	str r0, [r4]
	cmp r0, #1
	ble _080EF882
_080EF926:
	ldr r0, _080EF950 @ =gUnk_030003A0
	movs r3, #0xd0
	lsls r3, r3, #2
	adds r2, r0, r3
	ldr r7, _080EF954 @ =0x00000342
	adds r0, r0, r7
	ldrb r1, [r2]
	ldrb r3, [r0]
	orrs r1, r3
	strb r1, [r2]
	ldrh r0, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080EF94C: .4byte 0x05000004
_080EF950: .4byte gUnk_030003A0
_080EF954: .4byte 0x00000342

	thumb_func_start sub_080EF958
sub_080EF958: @ 0x080EF958
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r5, _080EF970 @ =gUnk_030003A0
	ldr r1, _080EF974 @ =0x0000033F
	adds r0, r5, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080EF978
	cmp r0, #1
	beq _080EF9FE
	b _080EFA22
	.align 2, 0
_080EF970: .4byte gUnk_030003A0
_080EF974: .4byte 0x0000033F
_080EF978:
	ldr r2, _080EFA44 @ =0x0000042C
	adds r1, r5, r2
	ldr r6, _080EFA48 @ =0x04000128
	ldr r0, [r6]
	str r0, [r1]
	movs r3, #0xd3
	lsls r3, r3, #2
	adds r0, r5, r3
	ldr r0, [r0]
	cmp r0, #0xc
	bne _080EF9E2
	ldrb r1, [r1]
	movs r4, #0x88
	ands r4, r1
	cmp r4, #8
	bne _080EFA22
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0
	bne _080EF9E2
	ldr r3, _080EFA4C @ =0x04000208
	strh r0, [r3]
	ldr r2, _080EFA50 @ =0x04000200
	ldrh r1, [r2]
	ldr r0, _080EFA54 @ =0x0000FF7F
	ands r0, r1
	strh r0, [r2]
	ldrh r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strh r0, [r2]
	movs r2, #1
	strh r2, [r3]
	ldrb r1, [r6, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r6, #1]
	ldr r1, _080EFA58 @ =0x04000202
	movs r0, #0xc0
	strh r0, [r1]
	subs r1, #0xf6
	ldr r0, _080EFA5C @ =0x0000B1FC
	str r0, [r1]
	ldr r1, _080EFA60 @ =0x0000033E
	adds r0, r5, r1
	strb r4, [r0]
	movs r3, #0xd1
	lsls r3, r3, #2
	adds r0, r5, r3
	strb r2, [r0]
_080EF9E2:
	ldr r1, _080EFA64 @ =gUnk_030003A0
	movs r0, #0xd8
	lsls r0, r0, #2
	adds r2, r1, r0
	ldrh r0, [r2]
	cmp r0, #0
	bne _080EF9F6
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r2]
_080EF9F6:
	ldr r2, _080EFA68 @ =0x0000033F
	adds r1, r1, r2
	movs r0, #1
	strb r0, [r1]
_080EF9FE:
	adds r0, r7, #0
	bl sub_080EF818
	ldr r2, _080EFA64 @ =gUnk_030003A0
	ldr r3, _080EFA6C @ =0x00000434
	adds r1, r2, r3
	strh r0, [r1]
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _080EFA22
	ldr r1, _080EFA60 @ =0x0000033E
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #8
	bne _080EFA22
	bl sub_080EF4F4
_080EFA22:
	ldr r0, _080EFA64 @ =gUnk_030003A0
	ldr r3, _080EFA6C @ =0x00000434
	adds r2, r0, r3
	ldrh r1, [r2]
	subs r3, #0xf6
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #8
	bne _080EFA38
	movs r0, #0x80
	orrs r1, r0
_080EFA38:
	strh r1, [r2]
	ldrh r0, [r2]
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080EFA44: .4byte 0x0000042C
_080EFA48: .4byte 0x04000128
_080EFA4C: .4byte 0x04000208
_080EFA50: .4byte 0x04000200
_080EFA54: .4byte 0x0000FF7F
_080EFA58: .4byte 0x04000202
_080EFA5C: .4byte 0x0000B1FC
_080EFA60: .4byte 0x0000033E
_080EFA64: .4byte gUnk_030003A0
_080EFA68: .4byte 0x0000033F
_080EFA6C: .4byte 0x00000434

	thumb_func_start sub_080EFA70
sub_080EFA70: @ 0x080EFA70
	push {r4, r5, r6, r7, lr}
	mov ip, r0
	adds r3, r1, #0
	ldr r4, _080EFA98 @ =gUnk_030003A0
	ldr r1, _080EFA9C @ =0x0000042C
	adds r0, r4, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1f
	lsls r1, r0, #1
	movs r2, #0x83
	lsls r2, r2, #3
	adds r0, r4, r2
	adds r5, r1, r0
	ldrh r6, [r5]
	cmp r6, #0
	beq _080EFAA0
	movs r0, #0
	b _080EFB04
	.align 2, 0
_080EFA98: .4byte gUnk_030003A0
_080EFA9C: .4byte 0x0000042C
_080EFAA0:
	subs r0, r3, #1
	cmp r0, #0xff
	bhi _080EFB02
	movs r2, #0x82
	lsls r2, r2, #3
	adds r0, r4, r2
	adds r2, r1, r0
	adds r0, r3, #0
	adds r0, #0x10
	cmp r0, #0
	bge _080EFAB8
	adds r0, #0xf
_080EFAB8:
	asrs r0, r0, #4
	movs r7, #0
	strh r0, [r2]
	adds r0, r3, #1
	strh r0, [r5]
	ldr r2, _080EFAD8 @ =0x00000414
	adds r0, r4, r2
	adds r0, r1, r0
	strh r6, [r0]
	cmp r3, #0xe
	bgt _080EFADC
	movs r0, #0xc0
	lsls r0, r0, #6
	adds r1, r0, #0
	b _080EFAE2
	.align 2, 0
_080EFAD8: .4byte 0x00000414
_080EFADC:
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r2, #0
_080EFAE2:
	adds r0, r3, #0
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r4, _080EFB0C @ =gUnk_030003AA
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	lsls r2, r2, #0xa
	lsrs r2, r2, #0xb
	mov r0, ip
	adds r1, r4, #0
	bl CpuSet
	subs r4, #2
	adds r0, r4, #0
	bl sub_080EF7CC
_080EFB02:
	movs r0, #1
_080EFB04:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080EFB0C: .4byte gUnk_030003AA

	thumb_func_start sub_080EFB10
sub_080EFB10: @ 0x080EFB10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	movs r0, #1
	str r0, [sp, #0x40]
	movs r6, #0
	movs r1, #0
	str r1, [sp, #0x44]
	mov r0, sp
	bl sub_080EF958
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x38]
	movs r0, #0x30
	ldr r2, [sp, #0x38]
	ands r0, r2
	cmp r0, #0
	beq _080EFB4E
	add r0, sp, #0x20
	movs r1, #0xa0
	lsls r1, r1, #7
	strh r1, [r0]
	bl sub_080EF7CC
	b _080EFE20
_080EFB4E:
	movs r0, #0xf
	ldr r3, [sp, #0x38]
	ands r0, r3
	cmp r0, #0
	bne _080EFB5A
	b _080EFE20
_080EFB5A:
	movs r0, #0
	str r0, [sp, #0x3c]
	ldr r1, _080EFBB0 @ =gUnk_030007B4
	mov sb, r1
	add r2, sp, #0x20
	mov sl, r2
_080EFB66:
	movs r0, #0xf
	ldr r3, [sp, #0x38]
	ands r0, r3
	ldr r1, [sp, #0x40]
	ands r0, r1
	cmp r0, #0
	bne _080EFB76
	b _080EFE02
_080EFB76:
	lsls r1, r6, #4
	mov r2, sp
	adds r3, r2, r1
	ldrh r4, [r3]
	movs r2, #0xf0
	lsls r2, r2, #8
	adds r0, r2, #0
	adds r2, r0, #0
	ands r2, r4
	movs r7, #0xc0
	lsls r7, r7, #6
	mov ip, r1
	cmp r2, r7
	bne _080EFB94
	b _080EFCC4
_080EFB94:
	cmp r2, r7
	bgt _080EFBB4
	movs r0, #0x80
	lsls r0, r0, #5
	lsls r5, r6, #1
	cmp r2, r0
	bne _080EFBA4
	b _080EFDC0
_080EFBA4:
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r2, r0
	beq _080EFBCC
	b _080EFDC0
	.align 2, 0
_080EFBB0: .4byte gUnk_030007B4
_080EFBB4:
	movs r3, #0x80
	lsls r3, r3, #7
	mov r8, r3
	lsls r5, r6, #1
	cmp r2, r8
	beq _080EFBFA
	movs r0, #0xa0
	lsls r0, r0, #7
	cmp r2, r0
	bne _080EFBCA
	b _080EFD40
_080EFBCA:
	b _080EFDC0
_080EFBCC:
	ldr r1, _080EFC60 @ =gUnk_030003A0
	movs r2, #0x83
	lsls r2, r2, #3
	adds r0, r1, r2
	adds r3, r5, r0
	ldr r1, _080EFC64 @ =0x000001FF
	adds r0, r1, #0
	ands r0, r4
	movs r1, #0
	strh r0, [r3]
	ldr r2, _080EFC68 @ =gUnk_030007B0
	adds r4, r5, r2
	ldrh r2, [r3]
	adds r0, r2, #0
	adds r0, #0x10
	asrs r0, r0, #4
	strh r0, [r4]
	ldrh r2, [r3]
	adds r0, r2, r0
	strh r0, [r3]
	mov r3, sb
	adds r0, r5, r3
	strh r1, [r0]
_080EFBFA:
	mov r0, sp
	add r0, ip
	adds r0, #2
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	ldr r7, _080EFC60 @ =gUnk_030003A0
	mov r2, sb
	adds r4, r5, r2
	ldrh r2, [r4]
	lsls r3, r2, #3
	adds r3, r3, r2
	lsls r2, r3, #6
	subs r2, r2, r3
	lsls r2, r2, #1
	adds r3, r7, #0
	adds r3, #0xac
	adds r2, r2, r3
	adds r1, r1, r2
	movs r2, #7
	bl CpuSet
	ldrh r2, [r4]
	adds r2, #1
	movs r3, #0
	strh r2, [r4]
	ldr r0, _080EFC6C @ =0x04000128
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	lsrs r0, r0, #4
	cmp r6, r0
	bne _080EFCB2
	lsls r0, r2, #0x10
	cmp r0, #0
	bne _080EFC70
	movs r3, #0x83
	lsls r3, r3, #3
	adds r1, r7, r3
	adds r1, r5, r1
	movs r2, #0x80
	lsls r2, r2, #6
	adds r0, r2, #0
	ldrh r1, [r1]
	orrs r0, r1
	mov r3, sl
	strh r0, [r3]
	b _080EFC94
	.align 2, 0
_080EFC60: .4byte gUnk_030003A0
_080EFC64: .4byte 0x000001FF
_080EFC68: .4byte gUnk_030007B0
_080EFC6C: .4byte 0x04000128
_080EFC70:
	ldrh r0, [r4]
	ldr r2, _080EFC88 @ =gUnk_030007B0
	adds r1, r5, r2
	ldrh r1, [r1]
	subs r1, #1
	cmp r0, r1
	bne _080EFC8C
	movs r0, #0xc0
	lsls r0, r0, #6
	mov r3, sl
	strh r0, [r3]
	b _080EFC94
	.align 2, 0
_080EFC88: .4byte gUnk_030007B0
_080EFC8C:
	movs r0, #0x80
	lsls r0, r0, #7
	mov r1, sl
	strh r0, [r1]
_080EFC94:
	add r4, sp, #0x20
	mov r2, sb
	adds r0, r5, r2
	ldrh r0, [r0]
	lsls r0, r0, #4
	ldr r3, _080EFCC0 @ =gUnk_030003A8
	adds r0, r0, r3
	mov r1, sp
	adds r1, #0x22
	movs r2, #7
	bl CpuSet
	adds r0, r4, #0
	bl sub_080EF7CC
_080EFCB2:
	mov r0, sb
	adds r1, r5, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _080EFDC0
	.align 2, 0
_080EFCC0: .4byte gUnk_030003A8
_080EFCC4:
	ldr r7, _080EFD30 @ =gUnk_030003A0
	lsls r0, r6, #1
	ldr r2, _080EFD34 @ =gUnk_030007B0
	adds r1, r0, r2
	ldrh r1, [r1]
	adds r5, r0, #0
	cmp r1, #0
	bne _080EFCE4
	movs r1, #0x83
	lsls r1, r1, #3
	adds r0, r7, r1
	adds r0, r5, r0
	ldr r2, _080EFD38 @ =0x000001FF
	adds r1, r2, #0
	ands r1, r4
	strh r1, [r0]
_080EFCE4:
	ldr r0, _080EFD3C @ =0x04000128
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	lsrs r0, r0, #4
	cmp r6, r0
	bne _080EFCFE
	movs r0, #0xd8
	lsls r0, r0, #2
	adds r1, r7, r0
	movs r0, #0x80
	lsls r0, r0, #5
	strh r0, [r1]
_080EFCFE:
	adds r0, r3, #2
	lsls r1, r6, #2
	adds r1, r1, r6
	lsls r1, r1, #4
	adds r1, r1, r6
	lsls r1, r1, #2
	mov r2, sb
	adds r4, r5, r2
	ldrh r2, [r4]
	lsls r3, r2, #3
	adds r3, r3, r2
	lsls r2, r3, #6
	subs r2, r2, r3
	lsls r2, r2, #1
	adds r3, r7, #0
	adds r3, #0xac
	adds r2, r2, r3
	adds r1, r1, r2
	movs r2, #7
	bl CpuSet
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	b _080EFDC0
	.align 2, 0
_080EFD30: .4byte gUnk_030003A0
_080EFD34: .4byte gUnk_030007B0
_080EFD38: .4byte 0x000001FF
_080EFD3C: .4byte 0x04000128
_080EFD40:
	ldr r4, _080EFD7C @ =gUnk_030003A0
	mov r3, sb
	adds r2, r5, r3
	ldrh r3, [r2]
	subs r3, #1
	movs r0, #0
	mov ip, r0
	strh r3, [r2]
	ldr r0, _080EFD80 @ =0x04000128
	ldrh r1, [r0]
	movs r0, #0x30
	ands r0, r1
	lsrs r0, r0, #4
	cmp r6, r0
	bne _080EFDC0
	lsls r0, r3, #0x10
	cmp r0, #0
	bne _080EFD84
	movs r2, #0x83
	lsls r2, r2, #3
	adds r1, r4, r2
	adds r1, r5, r1
	movs r3, #0x80
	lsls r3, r3, #6
	adds r0, r3, #0
	ldrh r1, [r1]
	orrs r0, r1
	mov r1, sl
	strh r0, [r1]
	b _080EFDA2
	.align 2, 0
_080EFD7C: .4byte gUnk_030003A0
_080EFD80: .4byte 0x04000128
_080EFD84:
	ldrh r0, [r2]
	ldr r2, _080EFD98 @ =gUnk_030007B0
	adds r1, r5, r2
	ldrh r1, [r1]
	subs r1, #1
	cmp r0, r1
	bne _080EFD9C
	mov r3, sl
	strh r7, [r3]
	b _080EFDA2
	.align 2, 0
_080EFD98: .4byte gUnk_030007B0
_080EFD9C:
	mov r1, r8
	mov r0, sl
	strh r1, [r0]
_080EFDA2:
	add r4, sp, #0x20
	mov r2, sb
	adds r0, r5, r2
	ldrh r0, [r0]
	lsls r0, r0, #4
	ldr r3, _080EFE2C @ =gUnk_030003A8
	adds r0, r0, r3
	mov r1, sp
	adds r1, #0x22
	movs r2, #7
	bl CpuSet
	adds r0, r4, #0
	bl sub_080EF7CC
_080EFDC0:
	ldr r2, _080EFE30 @ =gUnk_030003A0
	mov r0, sb
	adds r4, r5, r0
	ldrh r3, [r4]
	lsls r1, r3, #4
	subs r1, r1, r3
	movs r3, #0x83
	lsls r3, r3, #3
	adds r0, r2, r3
	adds r5, r5, r0
	ldrh r0, [r5]
	cmp r1, r0
	blt _080EFE02
	ldr r1, [sp, #0x30]
	cmp r6, r1
	bne _080EFDFC
	str r0, [sp, #0x44]
	lsls r0, r6, #2
	adds r0, r0, r6
	lsls r0, r0, #4
	adds r0, r0, r6
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0xac
	adds r0, r0, r1
	ldr r3, [sp, #0x44]
	lsrs r2, r3, #1
	ldr r1, [sp, #0x34]
	bl CpuSet
_080EFDFC:
	movs r0, #0
	strh r0, [r5]
	strh r0, [r4]
_080EFE02:
	ldr r1, [sp, #0x40]
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x18
	str r0, [sp, #0x40]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r0, [sp, #0x3c]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x3c]
	cmp r0, #1
	bhi _080EFE20
	b _080EFB66
_080EFE20:
	ldr r2, [sp, #0x44]
	cmp r2, #0
	bne _080EFE34
	movs r0, #0
	b _080EFE36
	.align 2, 0
_080EFE2C: .4byte gUnk_030003A8
_080EFE30: .4byte gUnk_030003A0
_080EFE34:
	ldr r0, [sp, #0x44]
_080EFE36:
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080EFE48
sub_080EFE48: @ 0x080EFE48
	push {r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	adds r6, r1, #0
	movs r7, #0
	mov r0, sp
	bl sub_080EF958
	lsls r0, r0, #0x10
	movs r1, #0xf0
	lsls r1, r1, #0xc
	ands r1, r0
	lsrs r1, r1, #0x10
	asrs r1, r5
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _080EFEE0
	lsls r0, r5, #4
	mov r1, sp
	adds r2, r1, r0
	movs r1, #0xf0
	lsls r1, r1, #8
	ldrh r3, [r2]
	ands r1, r3
	movs r0, #0x80
	lsls r0, r0, #5
	cmp r1, r0
	beq _080EFEB2
	movs r0, #0xc0
	lsls r0, r0, #6
	cmp r1, r0
	bne _080EFEB2
	adds r0, r2, #2
	movs r1, #0xa2
	adds r4, r5, #0
	muls r4, r1, r4
	ldr r1, _080EFED0 @ =gUnk_0300044C
	adds r4, r4, r1
	adds r1, r4, #0
	movs r2, #7
	bl CpuSet
	ldr r2, _080EFED4 @ =0x000001FF
	ldrh r0, [r4]
	ands r2, r0
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	lsrs r2, r2, #0x11
	adds r0, r4, #0
	adds r1, r6, #0
	bl CpuSet
_080EFEB2:
	ldr r1, _080EFED8 @ =gUnk_030003A0
	lsls r2, r5, #1
	movs r3, #0x83
	lsls r3, r3, #3
	adds r0, r1, r3
	adds r0, r2, r0
	movs r3, #0
	strh r3, [r0]
	ldr r0, _080EFEDC @ =0x00000414
	adds r1, r1, r0
	adds r2, r2, r1
	strh r3, [r2]
	adds r0, r7, #0
	b _080EFEE2
	.align 2, 0
_080EFED0: .4byte gUnk_0300044C
_080EFED4: .4byte 0x000001FF
_080EFED8: .4byte gUnk_030003A0
_080EFEDC: .4byte 0x00000414
_080EFEE0:
	movs r0, #0
_080EFEE2:
	add sp, #0x20
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080EFEEC
sub_080EFEEC: @ 0x080EFEEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r1, [sp, #4]
	ldr r5, _080F008C @ =gUnk_030007D6
	adds r0, r5, #0
	bl sub_080EF958
	ldr r2, _080F0090 @ =0x04000128
	ldrh r1, [r2]
	movs r3, #0x30
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0x10
	bls _080EFF12
	b _080F00B8
_080EFF12:
	movs r0, #0
	str r0, [sp]
	ldrh r1, [r2]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _080EFF24
	movs r1, #1
	str r1, [sp]
_080EFF24:
	subs r3, r5, #6
	movs r2, #0
	strh r2, [r3]
	subs r7, r5, #4
	strh r2, [r7]
	subs r1, r5, #2
	movs r0, #0xf
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _080EFF3C
	b _080F00B8
_080EFF3C:
	adds r0, r5, #0
	subs r0, #0x1a
	str r2, [r0]
	ldr r2, _080F0094 @ =0xFFFFFBCA
	adds r2, r2, r5
	mov r8, r2
	mov r6, r8
	adds r4, r3, #0
_080EFF4C:
	ldrh r1, [r4]
	lsls r0, r1, #4
	ldr r3, _080F0098 @ =0x00000436
	adds r3, r3, r6
	mov sl, r3
	add r0, sl
	ldrh r3, [r0]
	movs r5, #0xf0
	lsls r5, r5, #8
	adds r0, r5, #0
	adds r2, r0, #0
	ands r2, r3
	movs r0, #0x80
	lsls r0, r0, #5
	cmp r2, r0
	beq _080F0050
	movs r0, #0xc0
	lsls r0, r0, #6
	cmp r2, r0
	bne _080F0050
	lsls r1, r1, #1
	movs r7, #0x83
	lsls r7, r7, #3
	adds r7, r7, r6
	mov r8, r7
	add r1, r8
	ldr r2, _080F009C @ =0x000001FF
	adds r0, r2, #0
	ands r0, r3
	strh r0, [r1]
	ldrh r3, [r4]
	lsls r0, r3, #4
	movs r5, #0x87
	lsls r5, r5, #3
	adds r1, r6, r5
	adds r0, r0, r1
	ldr r7, _080F00A0 @ =0x0000033A
	adds r7, r7, r6
	mov sb, r7
	add r3, sb
	ldrb r2, [r3]
	adds r1, r2, #1
	strb r1, [r3]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #4
	adds r1, r1, r2
	lsls r1, r1, #2
	ldrh r3, [r4]
	movs r5, #0xa2
	adds r2, r3, #0
	muls r2, r5, r2
	adds r5, r6, #0
	adds r5, #0xac
	adds r2, r2, r5
	adds r1, r1, r2
	lsls r3, r3, #1
	ldr r7, _080F00A4 @ =gUnk_030007B4
	adds r3, r3, r7
	ldrh r7, [r3]
	lsls r2, r7, #1
	adds r3, r7, #0
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r1, r1, r2
	movs r2, #7
	bl CpuSet
	ldrh r1, [r4]
	lsls r0, r1, #1
	ldr r2, _080F00A4 @ =gUnk_030007B4
	adds r0, r0, r2
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
	ldrh r0, [r4]
	ldr r3, [sp]
	cmp r0, r3
	bne _080F002C
	lsls r0, r0, #1
	add r0, r8
	ldrh r0, [r0]
	ldr r7, _080F00A8 @ =gUnk_030007D2
	strh r0, [r7]
	movs r0, #0xce
	lsls r0, r0, #2
	adds r2, r6, r0
	ldrh r1, [r4]
	adds r2, r1, r2
	ldrb r1, [r2]
	adds r0, r1, #1
	strb r0, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r1
	lsls r0, r0, #2
	ldrh r2, [r4]
	movs r3, #0xa2
	adds r1, r2, #0
	muls r1, r3, r1
	adds r1, r1, r5
	adds r0, r0, r1
	ldrh r5, [r7]
	lsrs r2, r5, #1
	ldr r1, [sp, #4]
	bl CpuSet
_080F002C:
	ldrh r2, [r4]
	add r2, sb
	movs r1, #1
	adds r0, r1, #0
	ldrb r7, [r2]
	ands r0, r7
	strb r0, [r2]
	movs r2, #0xce
	lsls r2, r2, #2
	adds r0, r6, r2
	ldrh r3, [r4]
	adds r0, r3, r0
	ldrb r5, [r0]
	ands r1, r5
	strb r1, [r0]
	ldr r7, _080F0094 @ =0xFFFFFBCA
	add r7, sl
	mov r8, r7
_080F0050:
	ldrh r0, [r4]
	lsls r1, r0, #1
	movs r2, #0x83
	lsls r2, r2, #3
	adds r0, r6, r2
	adds r1, r1, r0
	movs r2, #0
	strh r2, [r1]
	ldrh r3, [r4]
	lsls r0, r3, #1
	ldr r5, _080F00A4 @ =gUnk_030007B4
	adds r0, r0, r5
	strh r2, [r0]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldr r7, _080F00AC @ =gUnk_030007BC
	ldr r0, [r7]
	adds r0, #1
	str r0, [r7]
	cmp r0, #1
	bgt _080F007E
	b _080EFF4C
_080F007E:
	ldr r0, _080F00B0 @ =0x00000346
	add r0, r8
	strh r2, [r0]
	ldr r0, _080F00B4 @ =0x00000432
	add r0, r8
	ldrh r0, [r0]
	b _080F00BA
	.align 2, 0
_080F008C: .4byte gUnk_030007D6
_080F0090: .4byte 0x04000128
_080F0094: .4byte 0xFFFFFBCA
_080F0098: .4byte 0x00000436
_080F009C: .4byte 0x000001FF
_080F00A0: .4byte 0x0000033A
_080F00A4: .4byte gUnk_030007B4
_080F00A8: .4byte gUnk_030007D2
_080F00AC: .4byte gUnk_030007BC
_080F00B0: .4byte 0x00000346
_080F00B4: .4byte 0x00000432
_080F00B8:
	movs r0, #0
_080F00BA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080F00CC
sub_080F00CC: @ 0x080F00CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	mov r8, r1
	adds r4, r2, #0
	mov sl, r3
	ldr r0, [sp, #0x20]
	mov ip, r0
	movs r1, #0
	cmp r1, sl
	bge _080F0124
	ldr r0, [sp, #0x30]
	lsls r6, r0, #0xc
_080F00EC:
	movs r2, #0
	adds r5, r1, #1
	cmp r2, r4
	bge _080F011E
	ldr r3, [sp, #0x28]
	adds r0, r3, r1
	lsls r0, r0, #5
	ldr r7, [sp, #0x24]
	adds r0, r0, r7
	add r1, r8
	muls r1, r4, r1
	ldr r3, [sp, #0x2c]
	adds r1, r3, r1
	mov r7, sb
	adds r3, r1, r7
	lsls r0, r0, #1
	mov r7, ip
	adds r1, r0, r7
_080F0110:
	adds r0, r3, r2
	orrs r0, r6
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, r4
	blt _080F0110
_080F011E:
	adds r1, r5, #0
	cmp r1, sl
	blt _080F00EC
_080F0124:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080F0134
sub_080F0134: @ 0x080F0134
	push {r4, lr}
	adds r2, r0, #0
	movs r3, #0
	ldr r1, _080F0160 @ =gUnk_02000000
	ldr r0, _080F0164 @ =0x00006C2C
	adds r1, r1, r0
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080F0178
	ldrb r1, [r2]
	cmp r1, #0
	beq _080F017E
	movs r4, #0x80
_080F0152:
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080F0168
	adds r2, #2
	b _080F016A
	.align 2, 0
_080F0160: .4byte gUnk_02000000
_080F0164: .4byte 0x00006C2C
_080F0168:
	adds r2, #1
_080F016A:
	adds r3, #1
	ldrb r1, [r2]
	cmp r1, #0
	bne _080F0152
	b _080F017E
_080F0174:
	adds r2, #1
	adds r3, #1
_080F0178:
	ldrb r0, [r2]
	cmp r0, #0
	bne _080F0174
_080F017E:
	adds r0, r3, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080F0188
sub_080F0188: @ 0x080F0188
	push {r4, r5, r6, lr}
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	movs r5, #0
	ldr r0, _080F01AC @ =gUnk_09BA2430
	ldrh r3, [r0]
	subs r3, #1
	ldr r0, _080F01B0 @ =0x0000EFFF
	cmp r4, r0
	bls _080F01B4
	movs r0, #0x7f
	ands r0, r4
	movs r1, #0xf0
	lsls r1, r1, #4
	ands r1, r4
	lsrs r1, r1, #1
	orrs r0, r1
	b _080F01F8
	.align 2, 0
_080F01AC: .4byte gUnk_09BA2430
_080F01B0: .4byte 0x0000EFFF
_080F01B4:
	ldr r6, _080F01D0 @ =gUnk_09BA1524
_080F01B6:
	adds r0, r5, r3
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r2, r0, #1
	lsls r0, r2, #1
	adds r0, r0, r6
	ldrh r0, [r0]
	adds r1, r0, #0
	cmp r0, r4
	bne _080F01D4
	adds r0, r2, #0
	b _080F01F8
	.align 2, 0
_080F01D0: .4byte gUnk_09BA1524
_080F01D4:
	cmp r5, r3
	bne _080F01DC
	movs r0, #0
	b _080F01F8
_080F01DC:
	cmp r4, r0
	bls _080F01E2
	adds r5, r2, #0
_080F01E2:
	cmp r4, r1
	bhs _080F01E8
	adds r3, r2, #0
_080F01E8:
	adds r0, r5, r3
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	cmp r0, r2
	bne _080F01B6
	adds r5, r3, #0
	b _080F01B6
_080F01F8:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080F0200
sub_080F0200: @ 0x080F0200
	ldr r0, _080F020C @ =gUnk_02006ED0
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	adds r0, #5
	bx lr
	.align 2, 0
_080F020C: .4byte gUnk_02006ED0

	thumb_func_start sub_080F0210
sub_080F0210: @ 0x080F0210
	ldr r1, _080F021C @ =gUnk_02006ED0
	movs r0, #2
	ldrb r1, [r1, #8]
	ands r0, r1
	adds r0, #0xa
	bx lr
	.align 2, 0
_080F021C: .4byte gUnk_02006ED0

	thumb_func_start sub_080F0220
sub_080F0220: @ 0x080F0220
	adds r2, r0, #0
	movs r1, #0
	ldrb r0, [r2]
	cmp r0, #0
	beq _080F023E
	ldr r0, _080F0244 @ =gUnk_02006ED0
	ldrb r0, [r0, #8]
	lsls r3, r0, #0x1e
_080F0230:
	adds r0, r1, #5
	lsrs r1, r3, #0x1f
	adds r1, r0, r1
	adds r2, #1
	ldrb r0, [r2]
	cmp r0, #0
	bne _080F0230
_080F023E:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_080F0244: .4byte gUnk_02006ED0

	thumb_func_start sub_080F0248
sub_080F0248: @ 0x080F0248
	movs r1, #0
	adds r2, r0, #0
	ldrb r0, [r2]
	cmp r0, #0
	beq _080F026A
	ldr r0, _080F0270 @ =gUnk_02006ED0
	ldrb r0, [r0, #8]
	lsls r3, r0, #0x1e
_080F0258:
	adds r0, r1, #0
	adds r0, #0xa
	lsrs r1, r3, #0x1f
	lsls r1, r1, #1
	adds r1, r0, r1
	adds r2, #2
	ldrb r0, [r2]
	cmp r0, #0
	bne _080F0258
_080F026A:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_080F0270: .4byte gUnk_02006ED0

	thumb_func_start sub_080F0274
sub_080F0274: @ 0x080F0274
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	b _080F0296
_080F027C:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080F028C
	bl sub_080F0200
	adds r5, r5, r0
	b _080F0294
_080F028C:
	bl sub_080F0210
	adds r5, r5, r0
	adds r4, #1
_080F0294:
	adds r4, #1
_080F0296:
	ldrb r1, [r4]
	cmp r1, #0
	bne _080F027C
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080F02A4
sub_080F02A4: @ 0x080F02A4
	adds r2, r0, #0
	movs r3, #0
	ldrb r0, [r2]
	cmp r0, #0
	bne _080F02B0
	b _080F05CC
_080F02B0:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _080F02BA
	b _080F05C4
_080F02BA:
	ldrb r0, [r2]
	subs r0, #9
	cmp r0, #0xb2
	bls _080F02C4
	b _080F05B6
_080F02C4:
	lsls r0, r0, #2
	ldr r1, _080F02D0 @ =_080F02D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F02D0: .4byte _080F02D4
_080F02D4: @ jump table
	.4byte _080F05A6 @ case 0
	.4byte _080F05A6 @ case 1
	.4byte _080F05B6 @ case 2
	.4byte _080F05B6 @ case 3
	.4byte _080F05A6 @ case 4
	.4byte _080F05B6 @ case 5
	.4byte _080F05B6 @ case 6
	.4byte _080F05B6 @ case 7
	.4byte _080F05B6 @ case 8
	.4byte _080F05B6 @ case 9
	.4byte _080F05B6 @ case 10
	.4byte _080F05B6 @ case 11
	.4byte _080F05B6 @ case 12
	.4byte _080F05B6 @ case 13
	.4byte _080F05B6 @ case 14
	.4byte _080F05B6 @ case 15
	.4byte _080F05B6 @ case 16
	.4byte _080F05B6 @ case 17
	.4byte _080F05B6 @ case 18
	.4byte _080F05B6 @ case 19
	.4byte _080F05B6 @ case 20
	.4byte _080F05B6 @ case 21
	.4byte _080F05B6 @ case 22
	.4byte _080F05A6 @ case 23
	.4byte _080F05A4 @ case 24
	.4byte _080F05B6 @ case 25
	.4byte _080F05B6 @ case 26
	.4byte _080F05B6 @ case 27
	.4byte _080F05A0 @ case 28
	.4byte _080F05B6 @ case 29
	.4byte _080F05B6 @ case 30
	.4byte _080F05B6 @ case 31
	.4byte _080F05B6 @ case 32
	.4byte _080F05B6 @ case 33
	.4byte _080F05B6 @ case 34
	.4byte _080F05B6 @ case 35
	.4byte _080F05A6 @ case 36
	.4byte _080F05AC @ case 37
	.4byte _080F05A4 @ case 38
	.4byte _080F05B6 @ case 39
	.4byte _080F05B6 @ case 40
	.4byte _080F05B6 @ case 41
	.4byte _080F05B6 @ case 42
	.4byte _080F05B6 @ case 43
	.4byte _080F05B6 @ case 44
	.4byte _080F05B6 @ case 45
	.4byte _080F05B6 @ case 46
	.4byte _080F05B6 @ case 47
	.4byte _080F05B6 @ case 48
	.4byte _080F05A4 @ case 49
	.4byte _080F05A4 @ case 50
	.4byte _080F05B6 @ case 51
	.4byte _080F05B6 @ case 52
	.4byte _080F05B6 @ case 53
	.4byte _080F05A4 @ case 54
	.4byte _080F05A0 @ case 55
	.4byte _080F05B6 @ case 56
	.4byte _080F05B6 @ case 57
	.4byte _080F05B6 @ case 58
	.4byte _080F05B6 @ case 59
	.4byte _080F05B6 @ case 60
	.4byte _080F05B6 @ case 61
	.4byte _080F05B6 @ case 62
	.4byte _080F05B6 @ case 63
	.4byte _080F05B6 @ case 64
	.4byte _080F05B6 @ case 65
	.4byte _080F05B6 @ case 66
	.4byte _080F05B6 @ case 67
	.4byte _080F05B6 @ case 68
	.4byte _080F05B6 @ case 69
	.4byte _080F05B6 @ case 70
	.4byte _080F05B6 @ case 71
	.4byte _080F05B6 @ case 72
	.4byte _080F05B6 @ case 73
	.4byte _080F05B6 @ case 74
	.4byte _080F05B6 @ case 75
	.4byte _080F05B6 @ case 76
	.4byte _080F05B6 @ case 77
	.4byte _080F05B6 @ case 78
	.4byte _080F05B6 @ case 79
	.4byte _080F05B6 @ case 80
	.4byte _080F05B6 @ case 81
	.4byte _080F05B6 @ case 82
	.4byte _080F05B6 @ case 83
	.4byte _080F05B6 @ case 84
	.4byte _080F05B6 @ case 85
	.4byte _080F05B6 @ case 86
	.4byte _080F05B6 @ case 87
	.4byte _080F05B6 @ case 88
	.4byte _080F05B6 @ case 89
	.4byte _080F05B6 @ case 90
	.4byte _080F05B6 @ case 91
	.4byte _080F05B6 @ case 92
	.4byte _080F05B6 @ case 93
	.4byte _080F05B6 @ case 94
	.4byte _080F05B6 @ case 95
	.4byte _080F05B6 @ case 96
	.4byte _080F05B6 @ case 97
	.4byte _080F05B6 @ case 98
	.4byte _080F05B6 @ case 99
	.4byte _080F05B6 @ case 100
	.4byte _080F05B6 @ case 101
	.4byte _080F05B6 @ case 102
	.4byte _080F05B6 @ case 103
	.4byte _080F05B6 @ case 104
	.4byte _080F05B6 @ case 105
	.4byte _080F05B6 @ case 106
	.4byte _080F05B6 @ case 107
	.4byte _080F05B6 @ case 108
	.4byte _080F05B6 @ case 109
	.4byte _080F05B6 @ case 110
	.4byte _080F05B6 @ case 111
	.4byte _080F05B6 @ case 112
	.4byte _080F05B6 @ case 113
	.4byte _080F05B6 @ case 114
	.4byte _080F05B6 @ case 115
	.4byte _080F05B6 @ case 116
	.4byte _080F05B6 @ case 117
	.4byte _080F05B6 @ case 118
	.4byte _080F05B6 @ case 119
	.4byte _080F05B6 @ case 120
	.4byte _080F05B6 @ case 121
	.4byte _080F05B6 @ case 122
	.4byte _080F05B6 @ case 123
	.4byte _080F05B6 @ case 124
	.4byte _080F05B6 @ case 125
	.4byte _080F05B6 @ case 126
	.4byte _080F05B6 @ case 127
	.4byte _080F05B6 @ case 128
	.4byte _080F05B6 @ case 129
	.4byte _080F05B6 @ case 130
	.4byte _080F05B6 @ case 131
	.4byte _080F05B6 @ case 132
	.4byte _080F05B6 @ case 133
	.4byte _080F05B6 @ case 134
	.4byte _080F05B6 @ case 135
	.4byte _080F05A4 @ case 136
	.4byte _080F05A4 @ case 137
	.4byte _080F05A4 @ case 138
	.4byte _080F05A4 @ case 139
	.4byte _080F05B6 @ case 140
	.4byte _080F05B6 @ case 141
	.4byte _080F05B6 @ case 142
	.4byte _080F05B6 @ case 143
	.4byte _080F05B6 @ case 144
	.4byte _080F05B6 @ case 145
	.4byte _080F05B6 @ case 146
	.4byte _080F05B6 @ case 147
	.4byte _080F05B6 @ case 148
	.4byte _080F05B6 @ case 149
	.4byte _080F05B6 @ case 150
	.4byte _080F05B6 @ case 151
	.4byte _080F05A4 @ case 152
	.4byte _080F05B6 @ case 153
	.4byte _080F05B6 @ case 154
	.4byte _080F05B6 @ case 155
	.4byte _080F05B6 @ case 156
	.4byte _080F05B6 @ case 157
	.4byte _080F05B6 @ case 158
	.4byte _080F05B6 @ case 159
	.4byte _080F05B6 @ case 160
	.4byte _080F05B6 @ case 161
	.4byte _080F05A4 @ case 162
	.4byte _080F05B6 @ case 163
	.4byte _080F05B6 @ case 164
	.4byte _080F05B6 @ case 165
	.4byte _080F05B6 @ case 166
	.4byte _080F05A4 @ case 167
	.4byte _080F05B6 @ case 168
	.4byte _080F05B6 @ case 169
	.4byte _080F05B6 @ case 170
	.4byte _080F05B6 @ case 171
	.4byte _080F05B6 @ case 172
	.4byte _080F05B6 @ case 173
	.4byte _080F05B6 @ case 174
	.4byte _080F05B6 @ case 175
	.4byte _080F05B6 @ case 176
	.4byte _080F05B6 @ case 177
	.4byte _080F05A4 @ case 178
_080F05A0:
	adds r2, #1
	b _080F05B8
_080F05A4:
	adds r3, #1
_080F05A6:
	cmp r3, #0
	beq _080F05C8
	b _080F05CC
_080F05AC:
	adds r3, #1
	ldrb r0, [r2, #1]
	cmp r0, #0x2e
	beq _080F05B8
	b _080F05CC
_080F05B6:
	adds r3, #1
_080F05B8:
	adds r2, #1
	ldrb r0, [r2]
	cmp r0, #0
	beq _080F05C2
	b _080F02B0
_080F05C2:
	b _080F05CC
_080F05C4:
	cmp r3, #0
	bne _080F05CC
_080F05C8:
	movs r0, #1
	b _080F05CE
_080F05CC:
	adds r0, r3, #0
_080F05CE:
	bx lr

	thumb_func_start sub_080F05D0
sub_080F05D0: @ 0x080F05D0
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r4, _080F0620 @ =gUnk_09BA1524
	adds r0, r2, #0
	bl sub_080F0188
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r2, r1, #0
	ldr r0, _080F0624 @ =0x000082A5
	cmp r1, r0
	bne _080F05EE
	b _080F0710
_080F05EE:
	cmp r1, r0
	bgt _080F0680
	ldr r0, _080F0628 @ =0x0000815E
	cmp r1, r0
	bgt _080F0644
	subs r0, #1
	cmp r1, r0
	blt _080F0600
	b _080F0710
_080F0600:
	subs r0, #0x18
	cmp r1, r0
	bne _080F0608
	b _080F0710
_080F0608:
	cmp r1, r0
	bgt _080F062C
	subs r0, #3
	cmp r1, r0
	ble _080F0614
	b _080F0718
_080F0614:
	subs r0, #1
	cmp r1, r0
	bge _080F061C
	b _080F0718
_080F061C:
	b _080F0710
	.align 2, 0
_080F0620: .4byte gUnk_09BA1524
_080F0624: .4byte 0x000082A5
_080F0628: .4byte 0x0000815E
_080F062C:
	ldr r0, _080F0640 @ =0x00008148
	cmp r1, r0
	bge _080F0634
	b _080F0718
_080F0634:
	adds r0, #1
	cmp r1, r0
	ble _080F0710
	adds r0, #0x12
	b _080F06F8
	.align 2, 0
_080F0640: .4byte 0x00008148
_080F0644:
	ldr r0, _080F065C @ =0x0000817A
	cmp r1, r0
	beq _080F0710
	cmp r1, r0
	bgt _080F0668
	subs r0, #4
	cmp r1, r0
	beq _080F0710
	cmp r1, r0
	bgt _080F0660
	subs r0, #0xc
	b _080F06F8
	.align 2, 0
_080F065C: .4byte 0x0000817A
_080F0660:
	ldr r0, _080F0664 @ =0x00008178
	b _080F06F8
	.align 2, 0
_080F0664: .4byte 0x00008178
_080F0668:
	ldr r0, _080F0678 @ =0x000082A1
	cmp r1, r0
	beq _080F0710
	cmp r1, r0
	ble _080F06F6
	ldr r0, _080F067C @ =0x000082A3
	b _080F06F8
	.align 2, 0
_080F0678: .4byte 0x000082A1
_080F067C: .4byte 0x000082A3
_080F0680:
	ldr r0, _080F06A4 @ =0x00008344
	cmp r1, r0
	beq _080F0710
	cmp r1, r0
	bgt _080F06CC
	subs r0, #0x61
	cmp r1, r0
	beq _080F0710
	cmp r1, r0
	bgt _080F06B0
	subs r0, #0x22
	cmp r1, r0
	beq _080F0710
	cmp r1, r0
	bgt _080F06A8
	subs r0, #0x1a
	b _080F06F8
	.align 2, 0
_080F06A4: .4byte 0x00008344
_080F06A8:
	ldr r0, _080F06AC @ =0x000082E1
	b _080F06F8
	.align 2, 0
_080F06AC: .4byte 0x000082E1
_080F06B0:
	ldr r0, _080F06C0 @ =0x00008340
	cmp r1, r0
	beq _080F0710
	cmp r1, r0
	bgt _080F06C4
	subs r0, #0x5b
	b _080F06F8
	.align 2, 0
_080F06C0: .4byte 0x00008340
_080F06C4:
	ldr r0, _080F06C8 @ =0x00008342
	b _080F06F8
	.align 2, 0
_080F06C8: .4byte 0x00008342
_080F06CC:
	ldr r0, _080F06E4 @ =0x00008383
	cmp r1, r0
	beq _080F0710
	cmp r1, r0
	bgt _080F06EC
	subs r0, #0x3b
	cmp r1, r0
	beq _080F0710
	cmp r1, r0
	ble _080F06F6
	ldr r0, _080F06E8 @ =0x00008362
	b _080F06F8
	.align 2, 0
_080F06E4: .4byte 0x00008383
_080F06E8: .4byte 0x00008362
_080F06EC:
	ldr r0, _080F0700 @ =0x00008387
	cmp r1, r0
	beq _080F0710
	cmp r1, r0
	bgt _080F0704
_080F06F6:
	subs r0, #2
_080F06F8:
	cmp r1, r0
	beq _080F0710
	b _080F0718
	.align 2, 0
_080F0700: .4byte 0x00008387
_080F0704:
	ldr r0, _080F0714 @ =0x00008396
	cmp r2, r0
	bgt _080F0718
	subs r0, #1
	cmp r2, r0
	blt _080F0718
_080F0710:
	movs r0, #1
	b _080F071A
	.align 2, 0
_080F0714: .4byte 0x00008396
_080F0718:
	movs r0, #0
_080F071A:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080F0720
sub_080F0720: @ 0x080F0720
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r4, _080F0744 @ =gUnk_09BA1524
	bl sub_080F0188
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	ldr r0, _080F0748 @ =0x00008169
	cmp r1, r0
	beq _080F073E
	adds r0, #0xc
	cmp r1, r0
	bne _080F074C
_080F073E:
	movs r0, #1
	b _080F074E
	.align 2, 0
_080F0744: .4byte gUnk_09BA1524
_080F0748: .4byte 0x00008169
_080F074C:
	movs r0, #0
_080F074E:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080F0754
sub_080F0754: @ 0x080F0754
	push {r4, r5, r6, r7, lr}
	ldr r7, [sp, #0x14]
	ldrh r3, [r3]
	lsls r4, r3, #0x10
	lsrs r4, r1
	lsls r4, r2
	ldr r5, _080F07E8 @ =gUnk_09E4F422
	lsrs r2, r4, #0x1c
	lsls r2, r2, #1
	adds r2, r2, r5
	lsrs r1, r4, #0x18
	movs r6, #0xf
	ands r1, r6
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	lsls r3, r1, #0x10
	ldrh r2, [r2]
	orrs r3, r2
	lsls r2, r3, #4
	subs r2, r2, r3
	ldr r1, [r0]
	bics r1, r2
	adds r2, r7, #0
	muls r2, r3, r2
	orrs r1, r2
	str r1, [r0]
	lsls r4, r4, #8
	lsrs r2, r4, #0x1c
	lsls r2, r2, #1
	adds r2, r2, r5
	lsrs r1, r4, #0x18
	ands r1, r6
	lsls r1, r1, #1
	adds r1, r1, r5
	ldrh r1, [r1]
	lsls r3, r1, #0x10
	ldrh r2, [r2]
	orrs r3, r2
	lsls r2, r3, #4
	subs r2, r2, r3
	ldr r1, [r0, #0x20]
	bics r1, r2
	adds r2, r7, #0
	muls r2, r3, r2
	orrs r1, r2
	str r1, [r0, #0x20]
	adds r2, r0, #0
	adds r2, #0x40
	lsls r4, r4, #8
	cmp r4, #0
	beq _080F07E2
	lsrs r1, r4, #0x1c
	lsls r1, r1, #1
	adds r1, r1, r5
	lsrs r0, r4, #0x18
	ands r0, r6
	lsls r0, r0, #1
	adds r0, r0, r5
	ldrh r0, [r0]
	lsls r3, r0, #0x10
	ldrh r1, [r1]
	orrs r3, r1
	lsls r1, r3, #4
	subs r1, r1, r3
	ldr r0, [r2]
	bics r0, r1
	adds r1, r7, #0
	muls r1, r3, r1
	orrs r0, r1
	str r0, [r2]
_080F07E2:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F07E8: .4byte gUnk_09E4F422

	thumb_func_start sub_080F07EC
sub_080F07EC: @ 0x080F07EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r2, [sp, #4]
	adds r7, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	ldr r2, _080F08B8 @ =gUnk_09E5F844
	ldr r0, _080F08BC @ =gUnk_02006ED0
	mov sl, r0
	ldrb r3, [r0, #8]
	lsls r4, r3, #0x1e
	lsrs r0, r4, #0x1f
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r3, [r0]
	ldr r2, _080F08C0 @ =gUnk_09E5F834
	lsrs r0, r4, #0x1f
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp, #8]
	lsls r0, r1, #8
	lsrs r0, r0, #0x18
	mov r8, r0
	lsrs r5, r1, #0x18
	mov r1, r8
	asrs r1, r1, #3
	mov ip, r1
	adds r0, r5, #0
	cmp r5, #0
	bge _080F0838
	adds r0, r5, #7
_080F0838:
	asrs r6, r0, #3
	ldr r0, _080F08C4 @ =gUnk_09E5F854
	lsrs r1, r4, #0x1f
	lsls r1, r1, #2
	adds r1, r1, r0
	adds r0, r7, #0
	muls r0, r3, r0
	lsls r0, r0, #1
	ldr r1, [r1]
	adds r1, r1, r0
	str r1, [sp, #0xc]
	mov r2, sb
	add r2, ip
	mov r4, sl
	ldrh r4, [r4, #8]
	lsls r0, r4, #0x16
	lsrs r0, r0, #0x18
	muls r0, r6, r0
	adds r0, r2, r0
	lsls r0, r0, #5
	ldr r7, _080F08C8 @ =0x06004000
	adds r0, r0, r7
	mov r4, ip
	lsls r1, r4, #3
	mov r7, r8
	subs r7, r7, r1
	mov r8, r7
	lsls r1, r6, #3
	subs r5, r5, r1
	lsls r1, r5, #2
	adds r4, r0, r1
	mov sl, r2
	cmp r3, #0
	ble _080F08DA
	adds r6, #1
	mov sb, r6
	adds r6, r3, #0
_080F0882:
	ldr r0, [sp, #4]
	str r0, [sp]
	adds r0, r4, #0
	mov r1, r8
	movs r3, #0x10
	ldr r7, [sp, #8]
	subs r2, r3, r7
	ldr r3, [sp, #0xc]
	bl sub_080F0754
	adds r5, #1
	cmp r5, #7
	ble _080F08CC
	ldr r0, _080F08BC @ =gUnk_02006ED0
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x18
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, sl
	lsls r0, r0, #5
	ldr r3, _080F08C8 @ =0x06004000
	adds r4, r0, r3
	movs r5, #0
	b _080F08CE
	.align 2, 0
_080F08B8: .4byte gUnk_09E5F844
_080F08BC: .4byte gUnk_02006ED0
_080F08C0: .4byte gUnk_09E5F834
_080F08C4: .4byte gUnk_09E5F854
_080F08C8: .4byte 0x06004000
_080F08CC:
	adds r4, #4
_080F08CE:
	ldr r7, [sp, #0xc]
	adds r7, #2
	str r7, [sp, #0xc]
	subs r6, #1
	cmp r6, #0
	bne _080F0882
_080F08DA:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080F08EC
sub_080F08EC: @ 0x080F08EC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r2, [sp, #4]
	adds r7, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	ldr r2, _080F09B4 @ =gUnk_09E5F844
	ldr r0, _080F09B8 @ =gUnk_02006ED0
	mov ip, r0
	ldrb r3, [r0, #8]
	lsls r4, r3, #0x1e
	lsrs r0, r4, #0x1f
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r3, [r0]
	lsrs r0, r4, #0x1f
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp, #8]
	lsls r0, r1, #8
	lsrs r0, r0, #0x18
	mov r8, r0
	lsrs r5, r1, #0x18
	mov r1, r8
	asrs r1, r1, #3
	mov sb, r1
	adds r0, r5, #0
	cmp r5, #0
	bge _080F0938
	adds r0, r5, #7
_080F0938:
	asrs r6, r0, #3
	ldr r0, _080F09BC @ =gUnk_09E5F854
	lsrs r1, r4, #0x1f
	lsls r1, r1, #2
	adds r0, #8
	adds r1, r1, r0
	adds r0, r7, #0
	subs r0, #0x20
	muls r0, r3, r0
	lsls r0, r0, #1
	ldr r1, [r1]
	adds r7, r1, r0
	mov r2, sl
	add r2, sb
	mov r4, ip
	ldrh r4, [r4, #8]
	lsls r0, r4, #0x16
	lsrs r0, r0, #0x18
	muls r0, r6, r0
	adds r0, r2, r0
	lsls r0, r0, #5
	ldr r1, _080F09C0 @ =0x06004000
	adds r0, r0, r1
	mov r4, sb
	lsls r1, r4, #3
	mov r4, r8
	subs r4, r4, r1
	mov r8, r4
	lsls r1, r6, #3
	subs r5, r5, r1
	lsls r1, r5, #2
	adds r4, r0, r1
	mov sl, r2
	cmp r3, #0
	ble _080F09CE
	adds r6, #1
	mov sb, r6
	adds r6, r3, #0
_080F0984:
	ldr r0, [sp, #4]
	str r0, [sp]
	adds r0, r4, #0
	mov r1, r8
	ldr r2, [sp, #8]
	adds r3, r7, #0
	bl sub_080F0754
	adds r5, #1
	cmp r5, #7
	ble _080F09C4
	ldr r0, _080F09B8 @ =gUnk_02006ED0
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x18
	mov r1, sb
	muls r1, r0, r1
	adds r0, r1, #0
	add r0, sl
	lsls r0, r0, #5
	ldr r3, _080F09C0 @ =0x06004000
	adds r4, r0, r3
	movs r5, #0
	b _080F09C6
	.align 2, 0
_080F09B4: .4byte gUnk_09E5F844
_080F09B8: .4byte gUnk_02006ED0
_080F09BC: .4byte gUnk_09E5F854
_080F09C0: .4byte 0x06004000
_080F09C4:
	adds r4, #4
_080F09C6:
	adds r7, #2
	subs r6, #1
	cmp r6, #0
	bne _080F0984
_080F09CE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080F09E0
sub_080F09E0: @ 0x080F09E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r2
	adds r5, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	lsls r1, r1, #0x10
	lsls r0, r1, #8
	lsrs r6, r0, #0x18
	lsrs r1, r1, #0x18
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F0A76
	lsls r7, r1, #8
	ldr r1, _080F0A34 @ =gUnk_09E5F834
	mov sl, r1
_080F0A08:
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _080F0A40
	lsls r1, r6, #0x18
	lsrs r1, r1, #0x18
	orrs r1, r7
	ldrb r3, [r5]
	mov r0, r8
	mov r2, sb
	bl sub_080F08EC
	ldr r0, _080F0A38 @ =gUnk_02006ED0
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	ldr r1, _080F0A3C @ =gUnk_09E5F83C
	adds r0, r0, r1
	ldr r0, [r0]
	adds r6, r6, r0
	adds r5, #1
	b _080F0A70
	.align 2, 0
_080F0A34: .4byte gUnk_09E5F834
_080F0A38: .4byte gUnk_02006ED0
_080F0A3C: .4byte gUnk_09E5F83C
_080F0A40:
	ldrb r1, [r5]
	lsls r0, r1, #8
	ldrb r1, [r5, #1]
	orrs r0, r1
	lsls r4, r6, #0x18
	lsrs r4, r4, #0x18
	orrs r4, r7
	bl sub_080F0188
	adds r3, r0, #0
	mov r0, r8
	adds r1, r4, #0
	mov r2, sb
	bl sub_080F07EC
	ldr r0, _080F0A84 @ =gUnk_02006ED0
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	add r0, sl
	ldr r0, [r0]
	adds r6, r6, r0
	adds r5, #2
_080F0A70:
	ldrb r0, [r5]
	cmp r0, #0
	bne _080F0A08
_080F0A76:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0A84: .4byte gUnk_02006ED0

	thumb_func_start sub_080F0A88
sub_080F0A88: @ 0x080F0A88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r2
	adds r4, r3, #0
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	lsls r1, r1, #0x10
	ldr r2, _080F0B24 @ =gUnk_09E5F834
	ldr r0, _080F0B28 @ =gUnk_02006ED0
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	mov sl, r0
	lsls r0, r1, #8
	lsrs r5, r0, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	str r0, [sp]
	cmp r4, #0
	bge _080F0AC6
	movs r0, #1
	str r0, [sp]
	rsbs r4, r4, #0
_080F0AC6:
	lsls r1, r1, #0x18
	mov sb, r1
	lsrs r7, r1, #0x10
_080F0ACC:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r3, r0, #0
	lsls r1, r5, #0x18
	lsrs r1, r1, #0x18
	orrs r1, r7
	adds r3, #0x30
	adds r0, r6, #0
	mov r2, r8
	bl sub_080F08EC
	mov r0, sl
	subs r5, r5, r0
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	cmp r4, #0
	bne _080F0ACC
	ldr r0, [sp]
	cmp r0, #0
	beq _080F0B12
	lsls r1, r5, #0x18
	lsrs r1, r1, #8
	mov r0, sb
	orrs r1, r0
	lsrs r1, r1, #0x10
	adds r0, r6, #0
	mov r2, r8
	movs r3, #0x2d
	bl sub_080F08EC
_080F0B12:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0B24: .4byte gUnk_09E5F834
_080F0B28: .4byte gUnk_02006ED0

	thumb_func_start sub_080F0B2C
sub_080F0B2C: @ 0x080F0B2C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r2
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	lsls r1, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r5, r3, #0x10
	ldr r2, _080F0B78 @ =gUnk_09E5F834
	ldr r0, _080F0B7C @ =gUnk_02006ED0
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	adds r2, #8
	adds r0, r0, r2
	ldr r0, [r0]
	mov sb, r0
	lsls r0, r1, #8
	lsrs r4, r0, #0x18
	lsrs r1, r1, #0x18
	lsls r6, r1, #8
_080F0B5C:
	movs r3, #0xf
	ands r3, r5
	cmp r3, #9
	bgt _080F0B80
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	orrs r1, r6
	adds r3, #0x30
	adds r0, r7, #0
	mov r2, r8
	bl sub_080F08EC
	b _080F0B90
	.align 2, 0
_080F0B78: .4byte gUnk_09E5F834
_080F0B7C: .4byte gUnk_02006ED0
_080F0B80:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	orrs r1, r6
	adds r3, #0x37
	adds r0, r7, #0
	mov r2, r8
	bl sub_080F08EC
_080F0B90:
	mov r0, sb
	subs r4, r4, r0
	lsrs r5, r5, #4
	cmp r5, #0
	bne _080F0B5C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080F0BA8
sub_080F0BA8: @ 0x080F0BA8
	movs r0, #7
_080F0BAA:
	subs r0, #1
	cmp r0, #0
	bge _080F0BAA
	bx lr
	.align 2, 0

	thumb_func_start sub_080F0BB4
sub_080F0BB4: @ 0x080F0BB4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r3, _080F0CA0 @ =gUnk_02006ED0
	movs r0, #0xff
	adds r1, r5, #0
	ands r1, r0
	lsls r1, r1, #2
	ldr r0, _080F0CA4 @ =0xFFFFFC03
	ldrh r2, [r3, #8]
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #8]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0xff
	ands r0, r1
	lsls r0, r0, #0xa
	ldr r1, [r3, #8]
	ldr r2, _080F0CA8 @ =0xFFFC03FF
	ands r1, r2
	orrs r1, r0
	str r1, [r3, #8]
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r6, [r3, #0x15]
	ands r1, r6
	movs r0, #0x7d
	rsbs r0, r0, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	movs r2, #0x7f
	ands r0, r2
	strb r0, [r3, #0x14]
	movs r0, #3
	rsbs r0, r0, #0
	ands r1, r0
	subs r0, #0x3e
	ands r1, r0
	strb r1, [r3, #0x15]
	ldrh r6, [r3, #8]
	lsls r1, r6, #0x16
	lsrs r1, r1, #0x18
	lsls r1, r1, #3
	ldr r2, _080F0CAC @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #2
	ldr r0, _080F0CB0 @ =0xFFFFF003
	ldrh r6, [r3, #0xa]
	ands r0, r6
	orrs r0, r1
	strh r0, [r3, #0xa]
	ldr r1, [r3, #8]
	lsls r1, r1, #0xe
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x13
	lsrs r2, r1, #0x10
	movs r0, #0xf
	ands r2, r0
	lsls r2, r2, #4
	ldrb r6, [r3, #0xb]
	ands r0, r6
	orrs r0, r2
	strb r0, [r3, #0xb]
	lsrs r1, r1, #0x14
	movs r0, #0x3f
	ands r1, r0
	subs r0, #0x7f
	ldrb r2, [r3, #0xc]
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0xc]
	ldr r0, [r3]
	cmp r0, #0
	beq _080F0C64
	adds r6, r0, #0
	cmp r4, #0
	ble _080F0C64
	lsls r5, r5, #6
_080F0C54:
	adds r0, r6, #0
	adds r1, r5, #0
	bl MemoryClearHalfWord
	adds r6, r6, r5
	subs r4, #1
	cmp r4, #0
	bne _080F0C54
_080F0C64:
	ldr r2, _080F0CA0 @ =gUnk_02006ED0
	ldr r1, _080F0CB4 @ =gUnk_02000000
	ldr r3, _080F0CB8 @ =0x00006C2C
	adds r1, r1, r3
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r6, [r2, #8]
	ands r1, r6
	orrs r1, r0
	strb r1, [r2, #8]
	ldr r3, _080F0CBC @ =gUnk_09E5F854
	lsls r0, r1, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	lsls r1, r1, #3
	adds r0, r0, r1
	adds r0, r0, r3
	ldr r0, [r0]
	str r0, [r2, #4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F0CA0: .4byte gUnk_02006ED0
_080F0CA4: .4byte 0xFFFFFC03
_080F0CA8: .4byte 0xFFFC03FF
_080F0CAC: .4byte 0x000003FF
_080F0CB0: .4byte 0xFFFFF003
_080F0CB4: .4byte gUnk_02000000
_080F0CB8: .4byte 0x00006C2C
_080F0CBC: .4byte gUnk_09E5F854

	thumb_func_start sub_080F0CC0
sub_080F0CC0: @ 0x080F0CC0
	push {r4, r5, lr}
	adds r4, r2, #0
	adds r5, r3, #0
	bl sub_080F0BB4
	ldr r1, _080F0CF4 @ =gUnk_02006ED0
	movs r0, #1
	ands r4, r0
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x15]
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, #0x15]
	movs r0, #0x1f
	ands r5, r0
	lsls r5, r5, #2
	movs r0, #0x7d
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x14]
	ands r0, r2
	orrs r0, r5
	strb r0, [r1, #0x14]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F0CF4: .4byte gUnk_02006ED0

	thumb_func_start sub_080F0CF8
sub_080F0CF8: @ 0x080F0CF8
	push {r4, r5, lr}
	adds r5, r2, #0
	adds r4, r3, #0
	movs r2, #1
	movs r3, #2
	bl sub_080F0CC0
	ldr r2, _080F0D44 @ =gUnk_02006ED0
	ldr r1, _080F0D48 @ =0x000003FF
	adds r0, r1, #0
	ands r5, r0
	lsls r5, r5, #2
	ldr r0, _080F0D4C @ =0xFFFFF003
	ldrh r3, [r2, #0xa]
	ands r0, r3
	orrs r0, r5
	strh r0, [r2, #0xa]
	lsls r4, r4, #0x10
	lsrs r1, r4, #0x10
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #4
	ldrb r3, [r2, #0xb]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0xb]
	lsrs r4, r4, #0x14
	movs r0, #0x3f
	ands r4, r0
	subs r0, #0x7f
	ldrb r1, [r2, #0xc]
	ands r0, r1
	orrs r0, r4
	strb r0, [r2, #0xc]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F0D44: .4byte gUnk_02006ED0
_080F0D48: .4byte 0x000003FF
_080F0D4C: .4byte 0xFFFFF003

	thumb_func_start sub_080F0D50
sub_080F0D50: @ 0x080F0D50
	push {r4, r5, lr}
	adds r4, r2, #0
	adds r5, r3, #0
	bl sub_080F0BB4
	ldr r2, _080F0D88 @ =gUnk_02006ED0
	movs r1, #1
	ldrb r0, [r2, #0x15]
	orrs r0, r1
	ands r4, r1
	lsls r4, r4, #1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r4
	strb r0, [r2, #0x15]
	movs r0, #0x1f
	ands r5, r0
	lsls r5, r5, #2
	movs r0, #0x7d
	rsbs r0, r0, #0
	ldrb r1, [r2, #0x14]
	ands r0, r1
	orrs r0, r5
	strb r0, [r2, #0x14]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F0D88: .4byte gUnk_02006ED0

	thumb_func_start sub_080F0D8C
sub_080F0D8C: @ 0x080F0D8C
	push {r4, lr}
	ldr r4, [sp, #0xc]
	bl sub_080F0CF8
	ldr r1, _080F0DB0 @ =gUnk_02006ED0
	movs r0, #0x1f
	ands r4, r0
	lsls r4, r4, #2
	movs r0, #0x7d
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x14]
	ands r0, r2
	orrs r0, r4
	strb r0, [r1, #0x14]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F0DB0: .4byte gUnk_02006ED0

	thumb_func_start sub_080F0DB4
sub_080F0DB4: @ 0x080F0DB4
	push {lr}
	bl sub_080F0BB4
	ldr r1, _080F0DC8 @ =gUnk_02006ED0
	movs r0, #0x80
	ldrb r2, [r1, #0x14]
	orrs r0, r2
	strb r0, [r1, #0x14]
	pop {r0}
	bx r0
	.align 2, 0
_080F0DC8: .4byte gUnk_02006ED0

	thumb_func_start sub_080F0DCC
sub_080F0DCC: @ 0x080F0DCC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _080F0E08 @ =gUnk_02006ED0
	mov r8, r3
	ldr r6, [r3]
	movs r5, #7
	adds r4, r0, #0
	ands r4, r5
	adds r3, r1, #0
	ands r3, r5
	lsls r3, r3, #3
	adds r4, r4, r3
	asrs r0, r0, #3
	mov r5, r8
	ldrh r5, [r5, #8]
	lsls r3, r5, #0x16
	lsrs r3, r3, #0x18
	asrs r1, r1, #3
	muls r1, r3, r1
	adds r0, r0, r1
	lsls r0, r0, #6
	adds r4, r4, r0
	adds r6, r6, r4
	strb r2, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0E08: .4byte gUnk_02006ED0

	thumb_func_start sub_080F0E0C
sub_080F0E0C: @ 0x080F0E0C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r4, r2, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	lsls r1, r0, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	cmp r4, #0
	beq _080F0ED8
	cmp r3, #0
	beq _080F0ED8
	movs r0, #0xf0
	mov r1, sb
	ands r1, r0
	mov sb, r1
	lsls r0, r1, #1
	movs r2, #0xa0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r3, #0
	movs r2, #0x20
	bl MemoryCopyLarge
	movs r0, #0
_080F0E4C:
	movs r6, #0
	adds r3, r0, #1
	str r3, [sp, #0xc]
	ldr r7, [sp, #4]
	adds r1, r7, r0
	adds r0, r1, #0
	movs r2, #7
	ands r0, r2
	lsls r0, r0, #3
	str r0, [sp, #8]
	asrs r1, r1, #3
	mov sl, r1
_080F0E64:
	ldrh r3, [r4]
	str r3, [sp, #0x10]
	movs r5, #0
	adds r4, #2
	mov ip, r4
	adds r7, r6, #1
	mov r8, r7
_080F0E72:
	lsls r0, r5, #2
	ldr r4, [sp, #0x10]
	asrs r4, r0
	movs r0, #0xf
	ands r4, r0
	cmp r4, #0
	beq _080F0EB8
	ldr r0, _080F0EE8 @ =gUnk_02006ED0
	ldr r0, [r0]
	str r0, [sp, #0x14]
	ldr r2, [sp]
	adds r1, r2, r5
	lsls r0, r6, #2
	adds r1, r1, r0
	adds r2, r1, #0
	movs r3, #7
	ands r2, r3
	ldr r7, [sp, #8]
	adds r2, r2, r7
	asrs r1, r1, #3
	ldr r3, _080F0EE8 @ =gUnk_02006ED0
	ldrh r3, [r3, #8]
	lsls r0, r3, #0x16
	lsrs r0, r0, #0x18
	mov r7, sl
	muls r7, r0, r7
	adds r0, r7, #0
	adds r1, r1, r0
	lsls r1, r1, #6
	adds r2, r2, r1
	ldr r0, [sp, #0x14]
	adds r3, r0, r2
	mov r1, sb
	orrs r4, r1
	strb r4, [r3]
_080F0EB8:
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #3
	bls _080F0E72
	mov r4, ip
	mov r2, r8
	lsls r0, r2, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #1
	bls _080F0E64
	ldr r3, [sp, #0xc]
	lsls r0, r3, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #7
	bls _080F0E4C
_080F0ED8:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F0EE8: .4byte gUnk_02006ED0

	thumb_func_start sub_080F0EEC
sub_080F0EEC: @ 0x080F0EEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	mov sb, r1
	mov r8, r2
	adds r7, r3, #0
	mov r0, sb
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r4, r5, #0x10
	lsrs r4, r4, #0x10
	lsrs r5, r5, #0x10
	lsls r6, r5, #0x10
	adds r0, r4, #0
	orrs r0, r6
	mov r1, sb
	bl sub_080F0E0C
	movs r0, #0x20
	add r8, r0
	movs r0, #8
	adds r0, r0, r4
	mov sl, r0
	orrs r6, r0
	adds r0, r6, #0
	mov r1, sb
	mov r2, r8
	adds r3, r7, #0
	bl sub_080F0E0C
	movs r0, #0x20
	add r8, r0
	adds r5, #8
	lsls r5, r5, #0x10
	orrs r4, r5
	adds r0, r4, #0
	mov r1, sb
	mov r2, r8
	adds r3, r7, #0
	bl sub_080F0E0C
	movs r0, #0x20
	add r8, r0
	mov r0, sl
	orrs r0, r5
	mov sl, r0
	mov r1, sb
	mov r2, r8
	adds r3, r7, #0
	bl sub_080F0E0C
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start __malloc_lock_2
__malloc_lock_2: @ 0x080F0F68
	bx lr
	.align 2, 0

	thumb_func_start __malloc_unlock_2
__malloc_unlock_2: @ 0x080F0F6C
	bx lr
	.align 2, 0

	thumb_func_start sub_080F0F70
sub_080F0F70: @ 0x080F0F70
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #7
	adds r4, r1, #0
	ands r4, r0
	mov r8, r2
	mov r3, r8
	ands r3, r0
	mov r8, r3
	asrs r6, r1, #3
	asrs r2, r2, #3
	mov sb, r2
	ldr r2, _080F101C @ =gUnk_02006ED0
	movs r0, #8
	ldrb r7, [r2, #0x15]
	ands r0, r7
	cmp r0, #0
	beq _080F1020
	movs r5, #0
	movs r0, #0xf
	mov ip, r0
	mov r1, ip
	mov r2, sl
	ands r1, r2
	mov ip, r1
	movs r3, #1
	mov sl, r3
_080F0FB6:
	movs r0, #0x80
	asrs r0, r5
	ldr r7, [sp]
	ands r0, r7
	adds r7, r4, #1
	cmp r0, #0
	beq _080F1008
	ldr r1, _080F101C @ =gUnk_02006ED0
	ldrh r1, [r1, #8]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x18
	mov r2, sb
	muls r2, r0, r2
	adds r0, r2, #0
	adds r0, r6, r0
	lsls r0, r0, #6
	ldr r1, _080F101C @ =gUnk_02006ED0
	ldr r3, [r1]
	adds r3, r3, r0
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	mov r2, r8
	lsls r1, r2, #2
	adds r0, r0, r1
	adds r3, r3, r0
	mov r0, sl
	ands r4, r0
	lsls r0, r4, #2
	mov r2, ip
	lsls r2, r0
	adds r1, r7, #0
	mov r0, sl
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xf
	lsls r0, r1
	ldrb r1, [r3]
	ands r0, r1
	orrs r2, r0
	strb r2, [r3]
_080F1008:
	adds r4, r7, #0
	cmp r4, #7
	ble _080F1012
	movs r4, #0
	adds r6, #1
_080F1012:
	adds r5, #1
	cmp r5, #7
	ble _080F0FB6
	b _080F1060
	.align 2, 0
_080F101C: .4byte gUnk_02006ED0
_080F1020:
	movs r5, #0
	adds r3, r2, #0
_080F1024:
	movs r0, #0x80
	asrs r0, r5
	ldr r2, [sp]
	ands r0, r2
	cmp r0, #0
	beq _080F1050
	ldr r2, [r3]
	mov r7, r8
	lsls r1, r7, #3
	adds r1, r4, r1
	ldrh r7, [r3, #8]
	lsls r0, r7, #0x16
	lsrs r0, r0, #0x18
	mov r7, sb
	muls r7, r0, r7
	adds r0, r7, #0
	adds r0, r6, r0
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r2, r2, r1
	mov r0, sl
	strb r0, [r2]
_080F1050:
	adds r4, #1
	cmp r4, #7
	ble _080F105A
	movs r4, #0
	adds r6, #1
_080F105A:
	adds r5, #1
	cmp r5, #7
	ble _080F1024
_080F1060:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080F1070
sub_080F1070: @ 0x080F1070
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	subs r1, #1
	movs r0, #7
	adds r4, r1, #0
	ands r4, r0
	mov sb, r2
	mov r3, sb
	ands r3, r0
	mov sb, r3
	asrs r6, r1, #3
	asrs r2, r2, #3
	str r2, [sp]
	mov r7, ip
	lsls r0, r7, #1
	lsls r1, r7, #2
	orrs r0, r1
	adds r1, r7, #0
	orrs r1, r0
	mov ip, r1
	ldr r2, _080F112C @ =gUnk_02006ED0
	movs r0, #8
	ldrb r3, [r2, #0x15]
	ands r0, r3
	cmp r0, #0
	beq _080F1130
	movs r5, #0
	movs r7, #0xf
	mov r8, r7
	mov r0, r8
	mov r1, sl
	ands r0, r1
	mov r8, r0
	movs r2, #1
	mov sl, r2
_080F10C6:
	movs r0, #0x80
	lsls r0, r0, #2
	asrs r0, r5
	mov r3, ip
	ands r0, r3
	adds r7, r4, #1
	cmp r0, #0
	beq _080F1118
	ldr r1, _080F112C @ =gUnk_02006ED0
	ldrh r1, [r1, #8]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	muls r0, r2, r0
	adds r0, r6, r0
	lsls r0, r0, #6
	ldr r1, _080F112C @ =gUnk_02006ED0
	ldr r3, [r1]
	adds r3, r3, r0
	lsrs r0, r4, #0x1f
	adds r0, r4, r0
	asrs r0, r0, #1
	mov r2, sb
	lsls r1, r2, #2
	adds r0, r0, r1
	adds r3, r3, r0
	mov r0, sl
	ands r4, r0
	lsls r0, r4, #2
	mov r2, r8
	lsls r2, r0
	adds r1, r7, #0
	mov r0, sl
	ands r1, r0
	lsls r1, r1, #2
	movs r0, #0xf
	lsls r0, r1
	ldrb r1, [r3]
	ands r0, r1
	orrs r2, r0
	strb r2, [r3]
_080F1118:
	adds r4, r7, #0
	cmp r4, #7
	ble _080F1122
	movs r4, #0
	adds r6, #1
_080F1122:
	adds r5, #1
	cmp r5, #9
	ble _080F10C6
	b _080F1170
	.align 2, 0
_080F112C: .4byte gUnk_02006ED0
_080F1130:
	movs r5, #0
	adds r3, r2, #0
_080F1134:
	movs r0, #0x80
	lsls r0, r0, #2
	asrs r0, r5
	mov r2, ip
	ands r0, r2
	cmp r0, #0
	beq _080F1160
	ldr r2, [r3]
	mov r7, sb
	lsls r1, r7, #3
	adds r1, r4, r1
	ldrh r7, [r3, #8]
	lsls r0, r7, #0x16
	lsrs r0, r0, #0x18
	ldr r7, [sp]
	muls r0, r7, r0
	adds r0, r6, r0
	lsls r0, r0, #6
	adds r1, r1, r0
	adds r2, r2, r1
	mov r0, sl
	strb r0, [r2]
_080F1160:
	adds r4, #1
	cmp r4, #7
	ble _080F116A
	movs r4, #0
	adds r6, #1
_080F116A:
	adds r5, #1
	cmp r5, #9
	ble _080F1134
_080F1170:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080F1180
sub_080F1180: @ 0x080F1180
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r1, [sp, #4]
	str r2, [sp, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r0, #0xf
	ands r0, r3
	str r0, [sp, #0xc]
	lsrs r3, r3, #4
	str r3, [sp, #0x10]
	ldr r1, _080F1290 @ =gUnk_02006ED0
	movs r0, #8
	ldrb r2, [r1, #0x15]
	ands r0, r2
	cmp r0, #0
	beq _080F1294
	movs r7, #7
	mov sl, r1
	movs r4, #1
	mov sb, r4
	ldr r0, [sp, #8]
	adds r0, #8
	mov r8, r0
	ldr r1, [sp, #4]
	adds r1, #8
	mov ip, r1
	movs r2, #0xf
	ands r3, r2
	str r3, [sp, #0x14]
_080F11CA:
	movs r0, #0x80
	asrs r0, r7
	ldr r4, [sp]
	ands r0, r4
	cmp r0, #0
	beq _080F1280
	ldr r0, [sp, #4]
	adds r0, r0, r7
	str r0, [sp, #0x18]
	mov r1, ip
	asrs r6, r1, #3
	ldr r2, [sp, #8]
	adds r3, r2, r7
	mov r4, r8
	asrs r2, r4, #3
	mov r5, ip
	movs r0, #7
	ands r5, r0
	mov r1, r8
	ands r1, r0
	mov r4, sl
	ldrh r4, [r4, #8]
	lsls r4, r4, #0x16
	str r4, [sp, #0x1c]
	lsrs r0, r4, #0x18
	muls r0, r2, r0
	adds r0, r6, r0
	lsls r0, r0, #6
	mov r4, sl
	ldr r2, [r4]
	adds r2, r2, r0
	lsrs r0, r5, #1
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r6, r2, r0
	adds r0, r5, #0
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #2
	ldr r2, [sp, #0x14]
	lsls r2, r0
	adds r1, r5, #1
	mov r4, sb
	ands r1, r4
	lsls r1, r1, #2
	movs r0, #0xf
	lsls r0, r1
	ldrb r1, [r6]
	ands r0, r1
	orrs r2, r0
	strb r2, [r6]
	ldr r2, [sp, #0x18]
	asrs r6, r2, #3
	asrs r2, r3, #3
	movs r5, #7
	ldr r4, [sp, #0x18]
	ands r5, r4
	movs r0, #7
	ands r3, r0
	mov r1, sl
	ldrh r1, [r1, #8]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x18
	muls r0, r2, r0
	adds r0, r6, r0
	lsls r0, r0, #6
	mov r2, sl
	ldr r1, [r2]
	adds r1, r1, r0
	lsrs r0, r5, #1
	lsls r3, r3, #2
	adds r0, r0, r3
	adds r6, r1, r0
	ldr r2, [sp, #0xc]
	movs r4, #0xf
	ands r2, r4
	adds r0, r5, #0
	mov r1, sb
	ands r0, r1
	lsls r0, r0, #2
	lsls r2, r0
	adds r1, r5, #1
	mov r4, sb
	ands r1, r4
	lsls r1, r1, #2
	movs r0, #0xf
	lsls r0, r1
	ldrb r1, [r6]
	ands r0, r1
	orrs r2, r0
	strb r2, [r6]
_080F1280:
	movs r2, #1
	rsbs r2, r2, #0
	add r8, r2
	add ip, r2
	subs r7, #1
	cmp r7, #0
	bge _080F11CA
	b _080F131C
	.align 2, 0
_080F1290: .4byte gUnk_02006ED0
_080F1294:
	movs r7, #7
	adds r6, r1, #0
	movs r4, #7
	mov r8, r4
	ldr r0, [sp, #8]
	adds r0, #1
	adds r1, r0, #0
	ands r1, r7
	lsls r1, r1, #3
	mov ip, r1
	asrs r0, r0, #3
	mov sl, r0
	ldr r0, [sp, #8]
	ands r0, r7
	lsls r0, r0, #3
	mov sb, r0
	ldr r5, [sp, #4]
	adds r5, #8
_080F12B8:
	movs r0, #0x80
	asrs r0, r7
	ldr r1, [sp]
	ands r0, r1
	cmp r0, #0
	beq _080F1314
	ldr r2, [sp, #4]
	adds r3, r2, r7
	adds r1, r5, #0
	mov r4, r8
	ands r1, r4
	add r1, ip
	asrs r2, r5, #3
	ldrh r4, [r6, #8]
	lsls r0, r4, #0x16
	lsrs r0, r0, #0x18
	mov r4, sl
	muls r4, r0, r4
	adds r0, r4, #0
	adds r2, r2, r0
	lsls r2, r2, #6
	adds r1, r1, r2
	ldr r0, [r6]
	adds r4, r0, r1
	mov r1, sp
	ldrb r1, [r1, #0x10]
	strb r1, [r4]
	adds r2, r3, #0
	mov r4, r8
	ands r2, r4
	add r2, sb
	asrs r3, r3, #3
	ldrh r1, [r6, #8]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x18
	ldr r4, [sp, #8]
	asrs r1, r4, #3
	muls r0, r1, r0
	adds r3, r3, r0
	lsls r3, r3, #6
	adds r2, r2, r3
	ldr r0, [r6]
	adds r4, r0, r2
	mov r1, sp
	ldrb r1, [r1, #0xc]
	strb r1, [r4]
_080F1314:
	subs r5, #1
	subs r7, #1
	cmp r7, #0
	bge _080F12B8
_080F131C:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080F132C
sub_080F132C: @ 0x080F132C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov ip, r0
	adds r7, r1, #0
	ldr r0, _080F13D8 @ =gUnk_02006ED0
	mov r8, r0
	movs r0, #2
	mov r1, r8
	ldrb r1, [r1, #8]
	ands r0, r1
	adds r6, r0, #0
	adds r6, #0xa
	mov r2, r8
	ldr r2, [r2]
	mov sb, r2
	movs r2, #7
	mov r4, ip
	ands r2, r4
	lsls r4, r2, #2
	lsls r3, r6, #2
	movs r1, #1
	adds r0, r1, #0
	lsls r0, r3
	subs r3, r0, #1
	adds r0, r6, #0
	subs r0, #8
	lsls r0, r0, #2
	lsls r1, r0
	subs r5, r1, #1
	adds r2, r6, r2
	cmp r2, #0x10
	ble _080F13DC
	cmp r6, #0
	beq _080F142E
	mov r0, ip
	asrs r0, r0, #3
	mov sl, r0
	adds r0, r3, #0
	lsls r0, r4
	mvns r0, r0
	mov ip, r0
	movs r1, #0x20
	subs r1, r1, r4
	lsrs r3, r1
	adds r0, r5, #0
	lsrs r0, r1
	mvns r0, r0
	mov r8, r0
	adds r2, r6, #0
	lsls r5, r4
	orrs r3, r5
	mvns r3, r3
_080F139A:
	ldr r1, _080F13D8 @ =gUnk_02006ED0
	ldrh r1, [r1, #8]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x18
	asrs r1, r7, #3
	muls r1, r0, r1
	add r1, sl
	lsls r1, r1, #5
	add r1, sb
	movs r0, #7
	ands r0, r7
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r7, #1
	ldr r0, [r1]
	mov r4, ip
	ands r0, r4
	str r0, [r1]
	adds r1, #0x20
	ldr r0, [r1]
	ands r0, r3
	str r0, [r1]
	adds r1, #0x20
	ldr r0, [r1]
	mov r4, r8
	ands r0, r4
	str r0, [r1]
	subs r2, #1
	cmp r2, #0
	bne _080F139A
	b _080F142E
	.align 2, 0
_080F13D8: .4byte gUnk_02006ED0
_080F13DC:
	cmp r6, #0
	beq _080F142E
	mov r0, ip
	asrs r0, r0, #3
	mov ip, r0
	adds r0, r3, #0
	lsls r0, r4
	mvns r0, r0
	mov r8, r0
	movs r0, #0x20
	subs r0, r0, r4
	lsrs r3, r0
	adds r2, r6, #0
	lsls r5, r4
	orrs r3, r5
	mvns r3, r3
_080F13FC:
	ldr r1, _080F143C @ =gUnk_02006ED0
	ldrh r1, [r1, #8]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x18
	asrs r1, r7, #3
	muls r1, r0, r1
	add r1, ip
	lsls r1, r1, #5
	add r1, sb
	movs r0, #7
	ands r0, r7
	lsls r0, r0, #2
	adds r1, r1, r0
	adds r7, #1
	ldr r0, [r1]
	mov r4, r8
	ands r0, r4
	str r0, [r1]
	adds r1, #0x20
	ldr r0, [r1]
	ands r0, r3
	str r0, [r1]
	subs r2, #1
	cmp r2, #0
	bne _080F13FC
_080F142E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F143C: .4byte gUnk_02006ED0

	thumb_func_start sub_080F1440
sub_080F1440: @ 0x080F1440
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r6, r1, #0
	adds r7, r2, #0
	adds r4, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_080F0188
	ldr r1, _080F15E0 @ =gUnk_02006ED0
	mov ip, r1
	ldrb r2, [r1, #8]
	lsls r3, r2, #0x1e
	lsrs r2, r3, #0x1f
	ldr r1, _080F15E4 @ =gUnk_09E5F864
	lsls r2, r2, #2
	adds r1, r2, r1
	ldr r5, [r1]
	ldr r1, _080F15E8 @ =gUnk_09E5F874
	adds r2, r2, r1
	ldr r1, [r2]
	muls r0, r1, r0
	adds r5, r5, r0
	lsrs r3, r3, #0x1f
	lsls r3, r3, #1
	adds r3, #0xa
	str r3, [sp]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	mov sl, r4
	adds r2, r3, #0
	mov r3, ip
	ldr r3, [r3]
	str r3, [sp, #4]
	movs r0, #7
	ands r0, r6
	lsls r1, r0, #2
	mov sb, r1
	adds r0, r2, r0
	cmp r0, #0x10
	bgt _080F14A0
	b _080F15F4
_080F14A0:
	cmp r2, #0
	bne _080F14A6
	b _080F1704
_080F14A6:
	adds r0, r2, #0
	subs r0, #8
	lsls r0, r0, #2
	movs r1, #0x20
	subs r0, r1, r0
	str r0, [sp, #8]
	asrs r6, r6, #3
	str r6, [sp, #0xc]
	ldr r3, _080F15EC @ =0x77777777
	mov r8, r3
	mov r6, sb
	subs r6, r1, r6
	str r6, [sp, #0x10]
	mov ip, r2
	adds r2, r5, #0
_080F14C4:
	ldrb r1, [r2, #1]
	lsls r0, r1, #4
	ldrb r3, [r2]
	orrs r0, r3
	ldrb r5, [r2, #2]
	lsls r1, r5, #8
	orrs r0, r1
	ldrb r6, [r2, #3]
	lsls r1, r6, #0xc
	orrs r0, r1
	ldrb r3, [r2, #4]
	lsls r1, r3, #0x10
	orrs r0, r1
	ldrb r5, [r2, #5]
	lsls r1, r5, #0x14
	orrs r0, r1
	ldrb r6, [r2, #6]
	lsls r1, r6, #0x18
	orrs r0, r1
	ldrb r3, [r2, #7]
	lsls r1, r3, #0x1c
	orrs r0, r1
	mov r6, sl
	muls r6, r0, r6
	ldrb r5, [r2, #9]
	lsls r0, r5, #4
	ldrb r1, [r2, #8]
	orrs r0, r1
	ldrb r3, [r2, #0xa]
	lsls r1, r3, #8
	orrs r0, r1
	ldrb r5, [r2, #0xb]
	lsls r1, r5, #0xc
	orrs r0, r1
	ldrb r3, [r2, #0xc]
	lsls r1, r3, #0x10
	orrs r0, r1
	ldrb r5, [r2, #0xd]
	lsls r1, r5, #0x14
	orrs r0, r1
	ldrb r3, [r2, #0xe]
	lsls r1, r3, #0x18
	orrs r0, r1
	ldrb r5, [r2, #0xf]
	lsls r1, r5, #0x1c
	orrs r0, r1
	mov r5, sl
	muls r5, r0, r5
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #8]
	lsrs r0, r1
	ands r5, r0
	ldr r0, _080F15E0 @ =gUnk_02006ED0
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x18
	asrs r1, r7, #3
	muls r1, r0, r1
	ldr r3, [sp, #0xc]
	adds r1, r3, r1
	lsls r1, r1, #5
	ldr r0, [sp, #4]
	adds r1, r0, r1
	movs r0, #7
	ands r0, r7
	lsls r0, r0, #2
	adds r4, r1, r0
	adds r7, #1
	adds r3, r6, #0
	mov r1, sb
	lsls r3, r1
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r1, _080F15EC @ =0x77777777
	adds r0, r0, r1
	orrs r0, r3
	ldr r1, _080F15F0 @ =0x88888888
	ands r0, r1
	lsrs r1, r0, #3
	ldr r0, _080F15EC @ =0x77777777
	adds r1, r1, r0
	mov r0, r8
	eors r1, r0
	ldr r0, [r4]
	bics r0, r1
	orrs r0, r3
	str r0, [r4]
	adds r4, #0x20
	adds r3, r6, #0
	ldr r1, [sp, #0x10]
	lsrs r3, r1
	adds r0, r5, #0
	mov r6, sb
	lsls r0, r6
	orrs r3, r0
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r6, _080F15EC @ =0x77777777
	adds r0, r0, r6
	orrs r0, r3
	ldr r1, _080F15F0 @ =0x88888888
	ands r0, r1
	lsrs r0, r0, #3
	adds r1, r0, r6
	mov r6, r8
	eors r1, r6
	ldr r0, [r4]
	bics r0, r1
	orrs r0, r3
	str r0, [r4]
	adds r4, #0x20
	adds r3, r5, #0
	ldr r0, [sp, #0x10]
	lsrs r3, r0
	adds r0, r3, #0
	ands r0, r6
	ldr r1, _080F15EC @ =0x77777777
	adds r0, r0, r1
	orrs r0, r3
	ldr r5, _080F15F0 @ =0x88888888
	ands r0, r5
	lsrs r0, r0, #3
	adds r1, r0, r1
	eors r1, r6
	ldr r0, [r4]
	bics r0, r1
	orrs r0, r3
	str r0, [r4]
	ldr r6, [sp]
	adds r2, r2, r6
	movs r0, #1
	rsbs r0, r0, #0
	add ip, r0
	mov r1, ip
	cmp r1, #0
	beq _080F15DC
	b _080F14C4
_080F15DC:
	b _080F1704
	.align 2, 0
_080F15E0: .4byte gUnk_02006ED0
_080F15E4: .4byte gUnk_09E5F864
_080F15E8: .4byte gUnk_09E5F874
_080F15EC: .4byte 0x77777777
_080F15F0: .4byte 0x88888888
_080F15F4:
	cmp r2, #0
	bne _080F15FA
	b _080F1704
_080F15FA:
	adds r0, r2, #0
	subs r0, #8
	lsls r0, r0, #2
	movs r1, #0x20
	subs r0, r1, r0
	asrs r6, r6, #3
	str r6, [sp, #0x18]
	ldr r3, _080F1714 @ =0x77777777
	mov r8, r3
	mov r6, sb
	subs r6, r1, r6
	str r6, [sp, #0x1c]
	mov ip, r2
	subs r1, #0x21
	lsrs r1, r0
	str r1, [sp, #0x14]
_080F161A:
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	ldrb r3, [r5]
	orrs r0, r3
	ldrb r6, [r5, #2]
	lsls r1, r6, #8
	orrs r0, r1
	ldrb r2, [r5, #3]
	lsls r1, r2, #0xc
	orrs r0, r1
	ldrb r3, [r5, #4]
	lsls r1, r3, #0x10
	orrs r0, r1
	ldrb r6, [r5, #5]
	lsls r1, r6, #0x14
	orrs r0, r1
	ldrb r2, [r5, #6]
	lsls r1, r2, #0x18
	orrs r0, r1
	ldrb r3, [r5, #7]
	lsls r1, r3, #0x1c
	orrs r0, r1
	mov r6, sl
	muls r6, r0, r6
	ldrb r1, [r5, #9]
	lsls r0, r1, #4
	ldrb r2, [r5, #8]
	orrs r0, r2
	ldrb r3, [r5, #0xa]
	lsls r1, r3, #8
	orrs r0, r1
	ldrb r2, [r5, #0xb]
	lsls r1, r2, #0xc
	orrs r0, r1
	ldrb r3, [r5, #0xc]
	lsls r1, r3, #0x10
	orrs r0, r1
	ldrb r2, [r5, #0xd]
	lsls r1, r2, #0x14
	orrs r0, r1
	ldrb r3, [r5, #0xe]
	lsls r1, r3, #0x18
	orrs r0, r1
	ldrb r2, [r5, #0xf]
	lsls r1, r2, #0x1c
	orrs r0, r1
	mov r2, sl
	muls r2, r0, r2
	ldr r3, [sp, #0x14]
	ands r2, r3
	ldr r1, _080F1718 @ =gUnk_02006ED0
	ldrh r1, [r1, #8]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x18
	asrs r1, r7, #3
	muls r1, r0, r1
	ldr r3, [sp, #0x18]
	adds r1, r3, r1
	lsls r1, r1, #5
	ldr r0, [sp, #4]
	adds r1, r0, r1
	movs r0, #7
	ands r0, r7
	lsls r0, r0, #2
	adds r4, r1, r0
	adds r7, #1
	adds r3, r6, #0
	mov r1, sb
	lsls r3, r1
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r1, _080F1714 @ =0x77777777
	adds r0, r0, r1
	orrs r0, r3
	ldr r1, _080F171C @ =0x88888888
	ands r0, r1
	lsrs r1, r0, #3
	ldr r0, _080F1714 @ =0x77777777
	adds r1, r1, r0
	mov r0, r8
	eors r1, r0
	ldr r0, [r4]
	bics r0, r1
	orrs r0, r3
	str r0, [r4]
	adds r4, #0x20
	adds r3, r6, #0
	ldr r1, [sp, #0x1c]
	lsrs r3, r1
	mov r6, sb
	lsls r2, r6
	orrs r3, r2
	adds r0, r3, #0
	mov r1, r8
	ands r0, r1
	ldr r2, _080F1714 @ =0x77777777
	adds r0, r0, r2
	orrs r0, r3
	ldr r6, _080F171C @ =0x88888888
	ands r0, r6
	lsrs r0, r0, #3
	adds r1, r0, r2
	mov r0, r8
	eors r1, r0
	ldr r0, [r4]
	bics r0, r1
	orrs r0, r3
	str r0, [r4]
	ldr r1, [sp]
	adds r5, r5, r1
	movs r2, #1
	rsbs r2, r2, #0
	add ip, r2
	mov r3, ip
	cmp r3, #0
	bne _080F161A
_080F1704:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F1714: .4byte 0x77777777
_080F1718: .4byte gUnk_02006ED0
_080F171C: .4byte 0x88888888

	thumb_func_start sub_080F1720
sub_080F1720: @ 0x080F1720
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r1, #0
	adds r6, r2, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	ldr r1, _080F1750 @ =gUnk_02006ED0
	movs r0, #2
	ldrb r4, [r1, #8]
	ands r0, r4
	adds r4, r0, #0
	adds r4, #0xa
	cmp r4, #0xa
	beq _080F1754
	cmp r4, #0xc
	beq _080F1764
	b _080F1864
	.align 2, 0
_080F1750: .4byte gUnk_02006ED0
_080F1754:
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080F1760 @ =gUnk_09CCB490
	b _080F176C
	.align 2, 0
_080F1760: .4byte gUnk_09CCB490
_080F1764:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _080F1874 @ =gUnk_09CCBE90
_080F176C:
	adds r5, r0, r1
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r0, _080F1878 @ =gUnk_02006ED0
	ldr r0, [r0]
	str r0, [sp, #4]
	movs r0, #7
	ands r0, r7
	lsls r0, r0, #2
	mov r8, r0
	cmp r4, #0
	beq _080F1864
	movs r1, #0x20
	mov sl, r1
	ldr r2, _080F187C @ =0x88888888
	mov sb, r2
	asrs r3, r7, #3
	str r3, [sp, #8]
	ldr r7, _080F1880 @ =0x77777777
	mov ip, r7
	subs r1, r1, r0
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
_080F179C:
	ldrb r3, [r5]
	lsls r2, r3, #1
	movs r1, #2
	ands r1, r2
	lsls r1, r1, #0x18
	movs r0, #4
	ands r0, r2
	lsls r0, r0, #0x14
	orrs r1, r0
	movs r0, #8
	ands r0, r2
	lsls r0, r0, #0x10
	orrs r1, r0
	movs r0, #0x10
	ands r0, r2
	lsls r0, r0, #8
	orrs r1, r0
	adds r0, r2, #0
	mov r4, sl
	ands r0, r4
	lsls r0, r0, #4
	orrs r1, r0
	movs r0, #0x40
	ands r0, r2
	orrs r1, r0
	movs r0, #0x80
	ands r2, r0
	lsrs r2, r2, #4
	orrs r1, r2
	ldr r7, _080F1880 @ =0x77777777
	adds r1, r1, r7
	mov r0, sb
	ands r1, r0
	lsrs r1, r1, #3
	ldr r2, [sp]
	adds r3, r1, #0
	muls r3, r2, r3
	ldr r4, _080F1878 @ =gUnk_02006ED0
	ldrh r4, [r4, #8]
	lsls r0, r4, #0x16
	lsrs r0, r0, #0x18
	asrs r1, r6, #3
	adds r2, r0, #0
	muls r2, r1, r2
	ldr r7, [sp, #8]
	adds r2, r7, r2
	lsls r2, r2, #5
	ldr r0, [sp, #4]
	adds r2, r0, r2
	movs r0, #7
	ands r0, r6
	lsls r0, r0, #2
	adds r2, r2, r0
	adds r6, #1
	adds r4, r3, #0
	mov r1, r8
	lsls r4, r1
	adds r0, r4, #0
	mov r7, ip
	ands r0, r7
	ldr r1, _080F1880 @ =0x77777777
	adds r0, r0, r1
	orrs r0, r4
	mov r7, sb
	ands r0, r7
	lsrs r0, r0, #3
	adds r1, r0, r1
	mov r0, ip
	eors r1, r0
	ldr r0, [r2]
	bics r0, r1
	orrs r0, r4
	str r0, [r2]
	adds r2, #0x20
	adds r4, r3, #0
	ldr r1, [sp, #0xc]
	lsrs r4, r1
	adds r0, r4, #0
	mov r3, ip
	ands r0, r3
	ldr r7, _080F1880 @ =0x77777777
	adds r0, r0, r7
	orrs r0, r4
	mov r1, sb
	ands r0, r1
	lsrs r0, r0, #3
	adds r3, r7, #0
	adds r1, r0, r3
	mov r7, ip
	eors r1, r7
	ldr r0, [r2]
	bics r0, r1
	orrs r0, r4
	str r0, [r2]
	adds r5, #1
	ldr r0, [sp, #0x10]
	subs r0, #1
	str r0, [sp, #0x10]
	cmp r0, #0
	bne _080F179C
_080F1864:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F1874: .4byte gUnk_09CCBE90
_080F1878: .4byte gUnk_02006ED0
_080F187C: .4byte 0x88888888
_080F1880: .4byte 0x77777777

	thumb_func_start sub_080F1884
sub_080F1884: @ 0x080F1884
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r1, [sp]
	adds r7, r2, #0
	adds r4, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r4, r4, #0x10
	lsrs r5, r4, #0x10
	bl sub_080F0188
	lsrs r4, r4, #0x18
	movs r1, #0x80
	ands r4, r1
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x1f
	ldr r1, _080F1998 @ =gUnk_02006ED0
	ldrb r3, [r1, #8]
	lsls r2, r3, #0x1e
	lsrs r1, r2, #0x1f
	lsls r1, r1, #1
	adds r1, #0xa
	str r1, [sp, #4]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	str r5, [sp, #8]
	lsrs r2, r2, #0x1f
	lsls r3, r4, #1
	adds r1, r3, #0
	orrs r1, r2
	ldr r6, [sp, #4]
	adds r6, r6, r3
	mov ip, r6
	ldr r2, _080F199C @ =gUnk_09E5F864
	lsls r1, r1, #2
	adds r2, r1, r2
	ldr r2, [r2]
	str r2, [sp, #0xc]
	ldr r2, _080F19A0 @ =gUnk_09E5F874
	adds r1, r1, r2
	ldr r1, [r1]
	muls r0, r1, r0
	ldr r1, [sp, #0xc]
	adds r1, r1, r0
	str r1, [sp, #0xc]
	ldr r2, [sp]
	subs r2, r2, r4
	str r2, [sp]
	subs r7, r7, r4
	movs r4, #0
	cmp r4, ip
	bge _080F1984
_080F18F4:
	ldr r3, [sp]
	asrs r2, r3, #3
	asrs r6, r7, #3
	mov r8, r6
	movs r0, #7
	ands r3, r0
	adds r5, r7, #0
	ands r5, r0
	ldr r0, _080F1998 @ =gUnk_02006ED0
	ldrh r1, [r0, #8]
	lsls r1, r1, #0x16
	lsrs r0, r1, #0x18
	mov r6, r8
	muls r6, r0, r6
	adds r0, r6, #0
	adds r0, r2, r0
	lsls r0, r0, #6
	ldr r1, _080F1998 @ =gUnk_02006ED0
	ldr r1, [r1]
	adds r1, r1, r0
	lsls r0, r5, #3
	adds r0, r3, r0
	adds r1, r1, r0
	adds r7, #1
	mov sb, r7
	adds r4, #1
	mov sl, r4
	mov r6, ip
	cmp r6, #0
	beq _080F197C
	mov r4, ip
_080F1932:
	movs r0, #8
	ands r0, r3
	cmp r0, #0
	beq _080F195A
	adds r2, #1
	movs r3, #0
	ldr r7, _080F1998 @ =gUnk_02006ED0
	ldrh r7, [r7, #8]
	lsls r0, r7, #0x16
	lsrs r0, r0, #0x18
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r2, r0
	lsls r0, r0, #6
	ldr r6, _080F1998 @ =gUnk_02006ED0
	ldr r1, [r6]
	adds r1, r1, r0
	lsls r0, r5, #3
	adds r1, r1, r0
_080F195A:
	ldr r7, [sp, #0xc]
	ldrb r0, [r7]
	cmp r0, #0
	beq _080F196C
	ldr r7, [sp, #8]
	adds r6, r7, #0
	muls r6, r0, r6
	adds r0, r6, #0
	strb r0, [r1]
_080F196C:
	adds r1, #1
	ldr r0, [sp, #0xc]
	adds r0, #1
	str r0, [sp, #0xc]
	adds r3, #1
	subs r4, #1
	cmp r4, #0
	bne _080F1932
_080F197C:
	mov r7, sb
	mov r4, sl
	cmp r4, ip
	blt _080F18F4
_080F1984:
	ldr r0, [sp, #4]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F1998: .4byte gUnk_02006ED0
_080F199C: .4byte gUnk_09E5F864
_080F19A0: .4byte gUnk_09E5F874

	thumb_func_start sub_080F19A4
sub_080F19A4: @ 0x080F19A4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sb, r1
	adds r6, r2, #0
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r3, r3, #0x10
	ldr r1, _080F1A0C @ =gUnk_09E5F844
	ldr r5, _080F1A10 @ =gUnk_02006ED0
	ldrb r4, [r5, #8]
	lsls r0, r4, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	adds r1, #8
	adds r0, r0, r1
	ldrb r4, [r0]
	lsls r0, r3, #8
	lsrs r0, r0, #0x18
	mov r8, r0
	lsrs r3, r3, #0x18
	movs r0, #0
	str r0, [sp, #8]
	movs r1, #0x80
	ands r3, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	rsbs r3, r3, #0
	lsrs r3, r3, #0x1f
	str r3, [sp, #4]
	movs r0, #0xf0
	mov r3, r8
	ands r0, r3
	cmp r0, #0
	beq _080F1A02
	adds r0, r1, #0
	ldrb r5, [r5, #0x14]
	ands r0, r5
	cmp r0, #0
	bne _080F1A02
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
_080F1A02:
	cmp r4, #0xa
	beq _080F1A14
	cmp r4, #0xc
	beq _080F1A24
	b _080F1AFC
	.align 2, 0
_080F1A0C: .4byte gUnk_09E5F844
_080F1A10: .4byte gUnk_02006ED0
_080F1A14:
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	ldr r1, _080F1A20 @ =gUnk_09CCB490
	b _080F1A2C
	.align 2, 0
_080F1A20: .4byte gUnk_09CCB490
_080F1A24:
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	ldr r1, _080F1AA8 @ =gUnk_09CCBE90
_080F1A2C:
	adds r0, r0, r1
	mov sl, r0
	movs r2, #0
	str r2, [sp]
	lsrs r0, r4, #1
	str r0, [sp, #0xc]
	cmp r2, r0
	bge _080F1AFC
_080F1A3C:
	mov r3, sl
	ldrh r1, [r3]
	movs r4, #2
	add sl, r4
	lsls r7, r1, #0x11
	lsrs r0, r7, #0x10
	adds r1, r0, #0
	ldr r2, [sp, #4]
	cmp r2, #0
	beq _080F1AAC
	lsls r4, r0, #0x18
	lsrs r4, r4, #0x18
	subs r2, r6, #1
	adds r0, r4, #0
	mov r1, sb
	mov r3, r8
	bl sub_080F1070
	adds r0, r4, #0
	mov r1, sb
	adds r2, r6, #0
	mov r3, r8
	bl sub_080F1070
	adds r5, r6, #1
	adds r0, r4, #0
	mov r1, sb
	adds r2, r5, #0
	mov r3, r8
	bl sub_080F1070
	adds r6, r5, #0
	lsrs r5, r7, #0x18
	subs r2, r6, #1
	adds r0, r5, #0
	mov r1, sb
	mov r3, r8
	bl sub_080F1070
	adds r0, r5, #0
	mov r1, sb
	adds r2, r6, #0
	mov r3, r8
	bl sub_080F1070
	adds r4, r6, #1
	adds r0, r5, #0
	mov r1, sb
	adds r2, r4, #0
	mov r3, r8
	bl sub_080F1070
	adds r6, r4, #0
	b _080F1AF0
	.align 2, 0
_080F1AA8: .4byte gUnk_09CCBE90
_080F1AAC:
	ldr r3, [sp, #8]
	cmp r3, #0
	beq _080F1AD2
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r2, r6, #0
	adds r6, #1
	mov r1, sb
	mov r3, r8
	bl sub_080F1180
	lsrs r0, r7, #0x18
	adds r2, r6, #0
	adds r6, #1
	mov r1, sb
	mov r3, r8
	bl sub_080F1180
	b _080F1AF0
_080F1AD2:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	adds r2, r6, #0
	adds r6, #1
	mov r1, sb
	mov r3, r8
	bl sub_080F0F70
	lsrs r0, r7, #0x18
	adds r2, r6, #0
	adds r6, #1
	mov r1, sb
	mov r3, r8
	bl sub_080F0F70
_080F1AF0:
	ldr r4, [sp]
	adds r4, #1
	str r4, [sp]
	ldr r0, [sp, #0xc]
	cmp r4, r0
	blt _080F1A3C
_080F1AFC:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080F1B0C
sub_080F1B0C: @ 0x080F1B0C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	mov r8, r1
	adds r5, r2, #0
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	movs r0, #3
	mov sb, r0
_080F1B22:
	ldrh r4, [r6]
	adds r6, #2
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r2, r5, #0
	adds r5, #1
	mov r1, r8
	adds r3, r7, #0
	bl sub_080F0F70
	lsrs r4, r4, #8
	adds r2, r5, #0
	adds r5, #1
	adds r0, r4, #0
	mov r1, r8
	adds r3, r7, #0
	bl sub_080F0F70
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r0, sb
	cmp r0, #0
	bge _080F1B22
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080F1B60
sub_080F1B60: @ 0x080F1B60
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r1
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsls r3, r3, #0x18
	lsrs r7, r3, #0x18
	lsrs r0, r0, #0x15
	ldr r1, _080F1BB8 @ =gUnk_09CCCA90
	adds r6, r0, r1
	movs r0, #4
	mov sb, r0
_080F1B7C:
	ldrh r4, [r6]
	adds r6, #2
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	adds r2, r5, #0
	adds r5, #1
	mov r1, r8
	adds r3, r7, #0
	bl sub_080F0F70
	lsrs r4, r4, #8
	adds r2, r5, #0
	adds r5, #1
	adds r0, r4, #0
	mov r1, r8
	adds r3, r7, #0
	bl sub_080F0F70
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r0, sb
	cmp r0, #0
	bne _080F1B7C
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F1BB8: .4byte gUnk_09CCCA90

	thumb_func_start sub_080F1BBC
sub_080F1BBC: @ 0x080F1BBC
	adds r2, r0, #0
	movs r3, #0
	b _080F1EC4
_080F1BC2:
	ldrb r0, [r2]
	subs r0, #9
	cmp r0, #0xb2
	bls _080F1BCC
	b _080F1EC0
_080F1BCC:
	lsls r0, r0, #2
	ldr r1, _080F1BD8 @ =_080F1BDC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F1BD8: .4byte _080F1BDC
_080F1BDC: @ jump table
	.4byte _080F1EAE @ case 0
	.4byte _080F1EAE @ case 1
	.4byte _080F1EC0 @ case 2
	.4byte _080F1EC0 @ case 3
	.4byte _080F1EAE @ case 4
	.4byte _080F1EC0 @ case 5
	.4byte _080F1EC0 @ case 6
	.4byte _080F1EC0 @ case 7
	.4byte _080F1EC0 @ case 8
	.4byte _080F1EC0 @ case 9
	.4byte _080F1EC0 @ case 10
	.4byte _080F1EC0 @ case 11
	.4byte _080F1EC0 @ case 12
	.4byte _080F1EC0 @ case 13
	.4byte _080F1EC0 @ case 14
	.4byte _080F1EC0 @ case 15
	.4byte _080F1EC0 @ case 16
	.4byte _080F1EC0 @ case 17
	.4byte _080F1EC0 @ case 18
	.4byte _080F1EC0 @ case 19
	.4byte _080F1EC0 @ case 20
	.4byte _080F1EC0 @ case 21
	.4byte _080F1EC0 @ case 22
	.4byte _080F1EAE @ case 23
	.4byte _080F1EAC @ case 24
	.4byte _080F1EC0 @ case 25
	.4byte _080F1EC0 @ case 26
	.4byte _080F1EC0 @ case 27
	.4byte _080F1EA8 @ case 28
	.4byte _080F1EC0 @ case 29
	.4byte _080F1EC0 @ case 30
	.4byte _080F1EC0 @ case 31
	.4byte _080F1EC0 @ case 32
	.4byte _080F1EC0 @ case 33
	.4byte _080F1EC0 @ case 34
	.4byte _080F1EC0 @ case 35
	.4byte _080F1EAE @ case 36
	.4byte _080F1EB6 @ case 37
	.4byte _080F1EAC @ case 38
	.4byte _080F1EC0 @ case 39
	.4byte _080F1EC0 @ case 40
	.4byte _080F1EC0 @ case 41
	.4byte _080F1EC0 @ case 42
	.4byte _080F1EC0 @ case 43
	.4byte _080F1EC0 @ case 44
	.4byte _080F1EC0 @ case 45
	.4byte _080F1EC0 @ case 46
	.4byte _080F1EC0 @ case 47
	.4byte _080F1EC0 @ case 48
	.4byte _080F1EAC @ case 49
	.4byte _080F1EAC @ case 50
	.4byte _080F1EC0 @ case 51
	.4byte _080F1EC0 @ case 52
	.4byte _080F1EC0 @ case 53
	.4byte _080F1EAC @ case 54
	.4byte _080F1EA8 @ case 55
	.4byte _080F1EC0 @ case 56
	.4byte _080F1EC0 @ case 57
	.4byte _080F1EC0 @ case 58
	.4byte _080F1EC0 @ case 59
	.4byte _080F1EC0 @ case 60
	.4byte _080F1EC0 @ case 61
	.4byte _080F1EC0 @ case 62
	.4byte _080F1EC0 @ case 63
	.4byte _080F1EC0 @ case 64
	.4byte _080F1EC0 @ case 65
	.4byte _080F1EC0 @ case 66
	.4byte _080F1EC0 @ case 67
	.4byte _080F1EC0 @ case 68
	.4byte _080F1EC0 @ case 69
	.4byte _080F1EC0 @ case 70
	.4byte _080F1EC0 @ case 71
	.4byte _080F1EC0 @ case 72
	.4byte _080F1EC0 @ case 73
	.4byte _080F1EC0 @ case 74
	.4byte _080F1EC0 @ case 75
	.4byte _080F1EC0 @ case 76
	.4byte _080F1EC0 @ case 77
	.4byte _080F1EC0 @ case 78
	.4byte _080F1EC0 @ case 79
	.4byte _080F1EC0 @ case 80
	.4byte _080F1EC0 @ case 81
	.4byte _080F1EC0 @ case 82
	.4byte _080F1EC0 @ case 83
	.4byte _080F1EC0 @ case 84
	.4byte _080F1EC0 @ case 85
	.4byte _080F1EC0 @ case 86
	.4byte _080F1EC0 @ case 87
	.4byte _080F1EC0 @ case 88
	.4byte _080F1EC0 @ case 89
	.4byte _080F1EC0 @ case 90
	.4byte _080F1EC0 @ case 91
	.4byte _080F1EC0 @ case 92
	.4byte _080F1EC0 @ case 93
	.4byte _080F1EC0 @ case 94
	.4byte _080F1EC0 @ case 95
	.4byte _080F1EC0 @ case 96
	.4byte _080F1EC0 @ case 97
	.4byte _080F1EC0 @ case 98
	.4byte _080F1EC0 @ case 99
	.4byte _080F1EC0 @ case 100
	.4byte _080F1EC0 @ case 101
	.4byte _080F1EC0 @ case 102
	.4byte _080F1EC0 @ case 103
	.4byte _080F1EC0 @ case 104
	.4byte _080F1EC0 @ case 105
	.4byte _080F1EC0 @ case 106
	.4byte _080F1EC0 @ case 107
	.4byte _080F1EC0 @ case 108
	.4byte _080F1EC0 @ case 109
	.4byte _080F1EC0 @ case 110
	.4byte _080F1EC0 @ case 111
	.4byte _080F1EC0 @ case 112
	.4byte _080F1EC0 @ case 113
	.4byte _080F1EC0 @ case 114
	.4byte _080F1EC0 @ case 115
	.4byte _080F1EC0 @ case 116
	.4byte _080F1EC0 @ case 117
	.4byte _080F1EC0 @ case 118
	.4byte _080F1EC0 @ case 119
	.4byte _080F1EC0 @ case 120
	.4byte _080F1EC0 @ case 121
	.4byte _080F1EC0 @ case 122
	.4byte _080F1EC0 @ case 123
	.4byte _080F1EC0 @ case 124
	.4byte _080F1EC0 @ case 125
	.4byte _080F1EC0 @ case 126
	.4byte _080F1EC0 @ case 127
	.4byte _080F1EC0 @ case 128
	.4byte _080F1EC0 @ case 129
	.4byte _080F1EC0 @ case 130
	.4byte _080F1EC0 @ case 131
	.4byte _080F1EC0 @ case 132
	.4byte _080F1EC0 @ case 133
	.4byte _080F1EC0 @ case 134
	.4byte _080F1EC0 @ case 135
	.4byte _080F1EAC @ case 136
	.4byte _080F1EAC @ case 137
	.4byte _080F1EAC @ case 138
	.4byte _080F1EAC @ case 139
	.4byte _080F1EC0 @ case 140
	.4byte _080F1EC0 @ case 141
	.4byte _080F1EC0 @ case 142
	.4byte _080F1EC0 @ case 143
	.4byte _080F1EC0 @ case 144
	.4byte _080F1EC0 @ case 145
	.4byte _080F1EC0 @ case 146
	.4byte _080F1EC0 @ case 147
	.4byte _080F1EC0 @ case 148
	.4byte _080F1EC0 @ case 149
	.4byte _080F1EC0 @ case 150
	.4byte _080F1EC0 @ case 151
	.4byte _080F1EAC @ case 152
	.4byte _080F1EC0 @ case 153
	.4byte _080F1EC0 @ case 154
	.4byte _080F1EC0 @ case 155
	.4byte _080F1EC0 @ case 156
	.4byte _080F1EC0 @ case 157
	.4byte _080F1EC0 @ case 158
	.4byte _080F1EC0 @ case 159
	.4byte _080F1EC0 @ case 160
	.4byte _080F1EC0 @ case 161
	.4byte _080F1EAC @ case 162
	.4byte _080F1EC0 @ case 163
	.4byte _080F1EC0 @ case 164
	.4byte _080F1EC0 @ case 165
	.4byte _080F1EC0 @ case 166
	.4byte _080F1EAC @ case 167
	.4byte _080F1EC0 @ case 168
	.4byte _080F1EC0 @ case 169
	.4byte _080F1EC0 @ case 170
	.4byte _080F1EC0 @ case 171
	.4byte _080F1EC0 @ case 172
	.4byte _080F1EC0 @ case 173
	.4byte _080F1EC0 @ case 174
	.4byte _080F1EC0 @ case 175
	.4byte _080F1EC0 @ case 176
	.4byte _080F1EC0 @ case 177
	.4byte _080F1EAC @ case 178
_080F1EA8:
	adds r2, #1
	b _080F1EC2
_080F1EAC:
	adds r3, #1
_080F1EAE:
	cmp r3, #0
	bne _080F1ECC
	movs r0, #1
	b _080F1ECE
_080F1EB6:
	adds r3, #1
	ldrb r0, [r2, #1]
	cmp r0, #0x2e
	beq _080F1EC2
	b _080F1ECC
_080F1EC0:
	adds r3, #1
_080F1EC2:
	adds r2, #1
_080F1EC4:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080F1ECC
	b _080F1BC2
_080F1ECC:
	adds r0, r3, #0
_080F1ECE:
	bx lr

	thumb_func_start sub_080F1ED0
sub_080F1ED0: @ 0x080F1ED0
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	movs r3, #0
	b _080F21D2
_080F1EDA:
	ldrb r0, [r2]
	subs r0, #9
	cmp r0, #0xb2
	bls _080F1EE4
	b _080F21CE
_080F1EE4:
	lsls r0, r0, #2
	ldr r1, _080F1EF0 @ =_080F1EF4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F1EF0: .4byte _080F1EF4
_080F1EF4: @ jump table
	.4byte _080F21DE @ case 0
	.4byte _080F21DE @ case 1
	.4byte _080F21CE @ case 2
	.4byte _080F21CE @ case 3
	.4byte _080F21DE @ case 4
	.4byte _080F21CE @ case 5
	.4byte _080F21CE @ case 6
	.4byte _080F21CE @ case 7
	.4byte _080F21CE @ case 8
	.4byte _080F21CE @ case 9
	.4byte _080F21CE @ case 10
	.4byte _080F21CE @ case 11
	.4byte _080F21CE @ case 12
	.4byte _080F21CE @ case 13
	.4byte _080F21CE @ case 14
	.4byte _080F21CE @ case 15
	.4byte _080F21CE @ case 16
	.4byte _080F21CE @ case 17
	.4byte _080F21CE @ case 18
	.4byte _080F21CE @ case 19
	.4byte _080F21CE @ case 20
	.4byte _080F21CE @ case 21
	.4byte _080F21CE @ case 22
	.4byte _080F21DE @ case 23
	.4byte _080F21DE @ case 24
	.4byte _080F21CE @ case 25
	.4byte _080F21CE @ case 26
	.4byte _080F21CE @ case 27
	.4byte _080F21C0 @ case 28
	.4byte _080F21CE @ case 29
	.4byte _080F21CE @ case 30
	.4byte _080F21CE @ case 31
	.4byte _080F21CE @ case 32
	.4byte _080F21CE @ case 33
	.4byte _080F21CE @ case 34
	.4byte _080F21CE @ case 35
	.4byte _080F21DE @ case 36
	.4byte _080F21C4 @ case 37
	.4byte _080F21DE @ case 38
	.4byte _080F21CE @ case 39
	.4byte _080F21CE @ case 40
	.4byte _080F21CE @ case 41
	.4byte _080F21CE @ case 42
	.4byte _080F21CE @ case 43
	.4byte _080F21CE @ case 44
	.4byte _080F21CE @ case 45
	.4byte _080F21CE @ case 46
	.4byte _080F21CE @ case 47
	.4byte _080F21CE @ case 48
	.4byte _080F21DE @ case 49
	.4byte _080F21DE @ case 50
	.4byte _080F21CE @ case 51
	.4byte _080F21CE @ case 52
	.4byte _080F21CE @ case 53
	.4byte _080F21DE @ case 54
	.4byte _080F21C0 @ case 55
	.4byte _080F21CE @ case 56
	.4byte _080F21CE @ case 57
	.4byte _080F21CE @ case 58
	.4byte _080F21CE @ case 59
	.4byte _080F21CE @ case 60
	.4byte _080F21CE @ case 61
	.4byte _080F21CE @ case 62
	.4byte _080F21CE @ case 63
	.4byte _080F21CE @ case 64
	.4byte _080F21CE @ case 65
	.4byte _080F21CE @ case 66
	.4byte _080F21CE @ case 67
	.4byte _080F21CE @ case 68
	.4byte _080F21CE @ case 69
	.4byte _080F21CE @ case 70
	.4byte _080F21CE @ case 71
	.4byte _080F21CE @ case 72
	.4byte _080F21CE @ case 73
	.4byte _080F21CE @ case 74
	.4byte _080F21CE @ case 75
	.4byte _080F21CE @ case 76
	.4byte _080F21CE @ case 77
	.4byte _080F21CE @ case 78
	.4byte _080F21CE @ case 79
	.4byte _080F21CE @ case 80
	.4byte _080F21CE @ case 81
	.4byte _080F21CE @ case 82
	.4byte _080F21CE @ case 83
	.4byte _080F21CE @ case 84
	.4byte _080F21CE @ case 85
	.4byte _080F21CE @ case 86
	.4byte _080F21CE @ case 87
	.4byte _080F21CE @ case 88
	.4byte _080F21CE @ case 89
	.4byte _080F21CE @ case 90
	.4byte _080F21CE @ case 91
	.4byte _080F21CE @ case 92
	.4byte _080F21CE @ case 93
	.4byte _080F21CE @ case 94
	.4byte _080F21CE @ case 95
	.4byte _080F21CE @ case 96
	.4byte _080F21CE @ case 97
	.4byte _080F21CE @ case 98
	.4byte _080F21CE @ case 99
	.4byte _080F21CE @ case 100
	.4byte _080F21CE @ case 101
	.4byte _080F21CE @ case 102
	.4byte _080F21CE @ case 103
	.4byte _080F21CE @ case 104
	.4byte _080F21CE @ case 105
	.4byte _080F21CE @ case 106
	.4byte _080F21CE @ case 107
	.4byte _080F21CE @ case 108
	.4byte _080F21CE @ case 109
	.4byte _080F21CE @ case 110
	.4byte _080F21CE @ case 111
	.4byte _080F21CE @ case 112
	.4byte _080F21CE @ case 113
	.4byte _080F21CE @ case 114
	.4byte _080F21CE @ case 115
	.4byte _080F21CE @ case 116
	.4byte _080F21CE @ case 117
	.4byte _080F21CE @ case 118
	.4byte _080F21CE @ case 119
	.4byte _080F21CE @ case 120
	.4byte _080F21CE @ case 121
	.4byte _080F21CE @ case 122
	.4byte _080F21CE @ case 123
	.4byte _080F21CE @ case 124
	.4byte _080F21CE @ case 125
	.4byte _080F21CE @ case 126
	.4byte _080F21CE @ case 127
	.4byte _080F21CE @ case 128
	.4byte _080F21CE @ case 129
	.4byte _080F21CE @ case 130
	.4byte _080F21CE @ case 131
	.4byte _080F21CE @ case 132
	.4byte _080F21CE @ case 133
	.4byte _080F21CE @ case 134
	.4byte _080F21CE @ case 135
	.4byte _080F21DE @ case 136
	.4byte _080F21DE @ case 137
	.4byte _080F21DE @ case 138
	.4byte _080F21DE @ case 139
	.4byte _080F21CE @ case 140
	.4byte _080F21CE @ case 141
	.4byte _080F21CE @ case 142
	.4byte _080F21CE @ case 143
	.4byte _080F21CE @ case 144
	.4byte _080F21CE @ case 145
	.4byte _080F21CE @ case 146
	.4byte _080F21CE @ case 147
	.4byte _080F21CE @ case 148
	.4byte _080F21CE @ case 149
	.4byte _080F21CE @ case 150
	.4byte _080F21CE @ case 151
	.4byte _080F21DE @ case 152
	.4byte _080F21CE @ case 153
	.4byte _080F21CE @ case 154
	.4byte _080F21CE @ case 155
	.4byte _080F21CE @ case 156
	.4byte _080F21CE @ case 157
	.4byte _080F21CE @ case 158
	.4byte _080F21CE @ case 159
	.4byte _080F21CE @ case 160
	.4byte _080F21CE @ case 161
	.4byte _080F21DE @ case 162
	.4byte _080F21CE @ case 163
	.4byte _080F21CE @ case 164
	.4byte _080F21CE @ case 165
	.4byte _080F21CE @ case 166
	.4byte _080F21DE @ case 167
	.4byte _080F21CE @ case 168
	.4byte _080F21CE @ case 169
	.4byte _080F21CE @ case 170
	.4byte _080F21CE @ case 171
	.4byte _080F21CE @ case 172
	.4byte _080F21CE @ case 173
	.4byte _080F21CE @ case 174
	.4byte _080F21CE @ case 175
	.4byte _080F21CE @ case 176
	.4byte _080F21CE @ case 177
	.4byte _080F21DE @ case 178
_080F21C0:
	adds r2, #1
	b _080F21D0
_080F21C4:
	adds r3, #1
	ldrb r0, [r2, #1]
	cmp r0, #0x2e
	beq _080F21D0
	b _080F21DE
_080F21CE:
	adds r3, #1
_080F21D0:
	adds r2, #1
_080F21D2:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080F21DE
	cmp r3, r4
	bge _080F21DE
	b _080F1EDA
_080F21DE:
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080F21E8
sub_080F21E8: @ 0x080F21E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	ldr r5, _080F22BC @ =gUnk_02006ED0
	ldrb r4, [r5, #8]
	lsls r2, r4, #0x1f
	lsrs r2, r2, #0x1f
	str r2, [sp]
	movs r2, #2
	ands r2, r4
	adds r2, #0xa
	mov sb, r2
	movs r6, #0x3f
	adds r2, r6, #0
	ldrh r4, [r5, #0xc]
	ands r2, r4
	strh r2, [r5, #0xc]
	ldr r2, _080F22C0 @ =0xFFFFFC00
	ldrh r7, [r5, #0xe]
	ands r2, r7
	strh r2, [r5, #0xe]
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r8, r2
	mov r4, r8
	ands r4, r6
	lsls r4, r4, #2
	movs r6, #3
	adds r2, r6, #0
	ldrb r7, [r5, #0xf]
	ands r2, r7
	orrs r2, r4
	strb r2, [r5, #0xf]
	lsrs r0, r0, #0x16
	movs r2, #0xf
	ands r0, r2
	subs r2, #0x1f
	ldrb r4, [r5, #0x10]
	ands r2, r4
	orrs r2, r0
	strb r2, [r5, #0x10]
	ldr r7, _080F22C4 @ =0x000003FF
	adds r0, r7, #0
	adds r2, r1, #0
	ands r2, r0
	lsls r2, r2, #4
	ldr r0, _080F22C8 @ =0xFFFFC00F
	ldrh r4, [r5, #0x10]
	ands r0, r4
	orrs r0, r2
	strh r0, [r5, #0x10]
	adds r2, r7, #0
	mov r7, r8
	ands r2, r7
	lsls r2, r2, #0xe
	ldr r0, [r5, #0x10]
	ldr r4, _080F22CC @ =0xFF003FFF
	ands r0, r4
	orrs r0, r2
	str r0, [r5, #0x10]
	lsls r2, r1, #0x10
	strb r1, [r5, #0x13]
	lsrs r2, r2, #0x18
	ands r2, r6
	movs r0, #4
	rsbs r0, r0, #0
	ldrb r1, [r5, #0x14]
	ands r0, r1
	orrs r0, r2
	strb r0, [r5, #0x14]
	str r3, [r5, #0x24]
	ldrb r0, [r3]
	cmp r0, #0
	bne _080F228A
	b _080F2A20
_080F228A:
	movs r6, #1
	movs r5, #0
	ldr r2, _080F22BC @ =gUnk_02006ED0
	ldrh r2, [r2, #0x10]
	lsls r0, r2, #0x12
	lsrs r0, r0, #0x16
	add r0, sb
	ldr r3, _080F22BC @ =gUnk_02006ED0
	ldrb r3, [r3, #0xb]
	lsrs r2, r3, #4
	movs r1, #0x3f
	ldr r4, _080F22BC @ =gUnk_02006ED0
	ldrb r4, [r4, #0xc]
	ands r1, r4
	lsls r1, r1, #4
	orrs r1, r2
	cmp r0, r1
	ble _080F22D0
	ldr r5, _080F22BC @ =gUnk_02006ED0
	ldrh r5, [r5, #0xe]
	lsls r0, r5, #0x16
	ldr r7, _080F22BC @ =gUnk_02006ED0
	ldrh r7, [r7, #0xc]
	orrs r0, r7
	b _080F2A2C
	.align 2, 0
_080F22BC: .4byte gUnk_02006ED0
_080F22C0: .4byte 0xFFFFFC00
_080F22C4: .4byte 0x000003FF
_080F22C8: .4byte 0xFFFFC00F
_080F22CC: .4byte 0xFF003FFF
_080F22D0:
	ldr r0, _080F22F0 @ =gUnk_02006ED0
	ldr r1, [r0, #0x24]
	ldrb r0, [r1]
	cmp r0, #0x1f
	bgt _080F22FA
	cmp r0, #0xe
	bge _080F23B4
	cmp r0, #0xa
	beq _080F232E
	cmp r0, #0xa
	bgt _080F22F4
	cmp r0, #1
	bge _080F22EC
	b _080F23F0
_080F22EC:
	b _080F23B4
	.align 2, 0
_080F22F0: .4byte gUnk_02006ED0
_080F22F4:
	cmp r0, #0xc
	ble _080F23B4
	b _080F232E
_080F22FA:
	cmp r0, #0x7f
	bgt _080F2324
	cmp r0, #0x41
	bge _080F23EC
	cmp r0, #0x3f
	ble _080F23EC
	ldrb r0, [r1, #1]
	cmp r0, #0x39
	bgt _080F23EC
	cmp r0, #0x30
	blt _080F23EC
	movs r0, #0x40
	ldr r1, _080F2320 @ =gUnk_02006ED0
	ldrb r1, [r1, #0x15]
	ands r0, r1
	cmp r0, #0
	beq _080F23D8
	b _080F23C4
	.align 2, 0
_080F2320: .4byte gUnk_02006ED0
_080F2324:
	cmp r0, #0xff
	bgt _080F23F0
	movs r5, #1
	ldr r6, [sp]
	b _080F23F0
_080F232E:
	ldr r3, _080F23A8 @ =gUnk_02006ED0
	ldr r2, [r3, #0x10]
	lsls r2, r2, #8
	lsrs r2, r2, #0x16
	movs r3, #0x3f
	adds r1, r3, #0
	ands r1, r2
	lsls r1, r1, #2
	movs r0, #3
	ldr r4, _080F23A8 @ =gUnk_02006ED0
	ldrb r4, [r4, #0xf]
	ands r0, r4
	orrs r0, r1
	ldr r7, _080F23A8 @ =gUnk_02006ED0
	strb r0, [r7, #0xf]
	lsrs r2, r2, #6
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r1, [r7, #0x10]
	ands r0, r1
	orrs r0, r2
	strb r0, [r7, #0x10]
	ldrh r4, [r7, #0x10]
	lsls r1, r4, #0x12
	lsrs r1, r1, #0x16
	ldrb r2, [r7, #0x14]
	lsls r0, r2, #0x19
	lsrs r0, r0, #0x1b
	add r0, sb
	adds r1, r1, r0
	ldr r7, _080F23AC @ =0x000003FF
	adds r0, r7, #0
	ands r1, r0
	lsls r1, r1, #4
	ldr r2, _080F23B0 @ =0xFFFFC00F
	ands r2, r4
	orrs r2, r1
	ldr r0, _080F23A8 @ =gUnk_02006ED0
	strh r2, [r0, #0x10]
	ldr r0, [r0, #0x24]
	adds r0, #1
	ldr r1, _080F23A8 @ =gUnk_02006ED0
	str r0, [r1, #0x24]
	lsls r2, r2, #0x12
	lsrs r2, r2, #0x16
	add r2, sb
	ldrb r4, [r1, #0xb]
	lsrs r0, r4, #4
	ldrb r7, [r1, #0xc]
	ands r3, r7
	lsls r3, r3, #4
	orrs r3, r0
	cmp r2, r3
	ble _080F23F0
	ldrh r1, [r1, #0xe]
	lsls r0, r1, #0x16
	ldr r2, _080F23A8 @ =gUnk_02006ED0
	ldrh r2, [r2, #0xc]
	orrs r0, r2
	b _080F2A2C
	.align 2, 0
_080F23A8: .4byte gUnk_02006ED0
_080F23AC: .4byte 0x000003FF
_080F23B0: .4byte 0xFFFFC00F
_080F23B4:
	ldr r3, _080F23C0 @ =gUnk_02006ED0
	ldr r0, [r3, #0x24]
	adds r0, #1
	str r0, [r3, #0x24]
	b _080F23F0
	.align 2, 0
_080F23C0: .4byte gUnk_02006ED0
_080F23C4:
	ldr r0, _080F23E4 @ =0x0000FFF0
	mov r4, sl
	ands r4, r0
	ldr r7, _080F23E8 @ =gUnk_02006ED0
	ldr r1, [r7, #0x24]
	movs r0, #0xf
	ldrb r1, [r1, #1]
	ands r0, r1
	orrs r4, r0
	mov sl, r4
_080F23D8:
	ldr r1, _080F23E8 @ =gUnk_02006ED0
	ldr r0, [r1, #0x24]
	adds r0, #2
	str r0, [r1, #0x24]
	b _080F23F0
	.align 2, 0
_080F23E4: .4byte 0x0000FFF0
_080F23E8: .4byte gUnk_02006ED0
_080F23EC:
	movs r6, #1
	b _080F23F6
_080F23F0:
	cmp r5, #0
	bne _080F23F6
	b _080F2A14
_080F23F6:
	adds r1, r6, #1
	mov r0, sb
	bl __divsi3
	mov r8, r0
	cmp r6, #0
	bne _080F2406
	b _080F27E8
_080F2406:
	movs r2, #1
	str r2, [sp, #4]
	ldr r3, _080F24BC @ =gUnk_02006ED0
	ldr r0, [r3, #0x24]
	bl sub_080F1BBC
	str r0, [sp, #8]
	ldr r4, _080F24BC @ =gUnk_02006ED0
	ldrb r7, [r4, #0xf]
	lsrs r1, r7, #2
	movs r5, #0xf
	adds r0, r5, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	lsls r3, r0, #6
	orrs r3, r1
	ldr r4, [sp, #8]
	mov r6, r8
	muls r6, r4, r6
	adds r1, r3, r6
	ldr r0, _080F24BC @ =gUnk_02006ED0
	ldrh r0, [r0, #0xa]
	lsls r4, r0, #0x14
	lsrs r0, r4, #0x16
	cmp r1, r0
	ble _080F24C8
	ldr r1, _080F24BC @ =gUnk_02006ED0
	ldr r0, [r1, #0x10]
	lsls r2, r0, #8
	lsrs r0, r2, #0x16
	cmp r3, r0
	bls _080F24C8
	lsrs r0, r4, #0x16
	cmp r6, r0
	blt _080F2458
	mov r1, r8
	adds r0, r3, r1
	add r0, r8
	lsrs r1, r4, #0x16
	cmp r0, r1
	ble _080F24C8
_080F2458:
	lsrs r2, r2, #0x16
	movs r3, #0x3f
	adds r1, r3, #0
	ands r1, r2
	lsls r1, r1, #2
	movs r0, #3
	ands r0, r7
	orrs r0, r1
	ldr r4, _080F24BC @ =gUnk_02006ED0
	strb r0, [r4, #0xf]
	lsrs r2, r2, #6
	ands r2, r5
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r5, [r4, #0x10]
	ands r0, r5
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrh r2, [r4, #0x10]
	lsls r1, r2, #0x12
	lsrs r1, r1, #0x16
	ldrb r7, [r4, #0x14]
	lsls r0, r7, #0x19
	lsrs r0, r0, #0x1b
	add r0, sb
	adds r1, r1, r0
	ldr r4, _080F24C0 @ =0x000003FF
	adds r0, r4, #0
	ands r1, r0
	lsls r1, r1, #4
	ldr r0, _080F24C4 @ =0xFFFFC00F
	ands r0, r2
	orrs r0, r1
	ldr r5, _080F24BC @ =gUnk_02006ED0
	strh r0, [r5, #0x10]
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x16
	add r0, sb
	ldrb r7, [r5, #0xb]
	lsrs r1, r7, #4
	ldrb r2, [r5, #0xc]
	ands r3, r2
	lsls r3, r3, #4
	orrs r3, r1
	cmp r0, r3
	ble _080F24C8
	ldrh r3, [r5, #0xe]
	lsls r0, r3, #0x16
	ldrh r4, [r5, #0xc]
	b _080F2A2A
	.align 2, 0
_080F24BC: .4byte gUnk_02006ED0
_080F24C0: .4byte 0x000003FF
_080F24C4: .4byte 0xFFFFC00F
_080F24C8:
	ldr r5, [sp, #4]
	cmp r5, #0
	bne _080F24D0
	b _080F29C8
_080F24D0:
	ldr r3, _080F2530 @ =gUnk_02006ED0
	ldr r0, [r3, #0x24]
	ldrb r0, [r0]
	cmp r0, #0
	bne _080F24DC
	b _080F29C8
_080F24DC:
	adds r4, r3, #0
	ldrb r7, [r3, #0xf]
	lsrs r0, r7, #2
	movs r1, #0xf
	ldrb r2, [r3, #0x10]
	ands r1, r2
	lsls r2, r1, #6
	ldr r1, [r3, #0x10]
	lsls r1, r1, #8
	orrs r2, r0
	lsrs r1, r1, #0x16
	cmp r2, r1
	bne _080F250E
	adds r1, r2, #0
_080F24F8:
	ldr r0, [r3, #0x24]
	ldrb r5, [r0]
	cmp r5, #0x20
	bne _080F250E
	adds r0, #1
	str r0, [r4, #0x24]
	ldr r0, [r3, #0x10]
	lsls r0, r0, #8
	lsrs r0, r0, #0x16
	cmp r1, r0
	beq _080F24F8
_080F250E:
	ldr r7, _080F2530 @ =gUnk_02006ED0
	ldr r0, [r7, #0x24]
	ldrb r5, [r0]
	cmp r5, #0x40
	beq _080F253C
	cmp r5, #0x40
	ble _080F2534
	cmp r5, #0xff
	bgt _080F2542
	cmp r5, #0x80
	blt _080F2542
	ldr r0, [sp]
	cmp r0, #0
	bne _080F2542
	movs r1, #0
	str r1, [sp, #4]
	b _080F2724
	.align 2, 0
_080F2530: .4byte gUnk_02006ED0
_080F2534:
	cmp r5, #0x1f
	bgt _080F2542
	cmp r5, #0
	blt _080F2542
_080F253C:
	movs r2, #0
	str r2, [sp, #4]
	b _080F2724
_080F2542:
	ldr r3, [sp, #4]
	cmp r3, #0
	bne _080F254A
	b _080F2724
_080F254A:
	ldr r7, _080F25D8 @ =gUnk_02006ED0
	ldrb r4, [r7, #0xf]
	lsrs r0, r4, #2
	movs r6, #0xf
	adds r1, r6, #0
	ldrb r2, [r7, #0x10]
	ands r1, r2
	lsls r1, r1, #6
	orrs r1, r0
	mov r7, r8
	adds r3, r1, r7
	ldr r0, _080F25D8 @ =gUnk_02006ED0
	ldrh r0, [r0, #0xa]
	lsls r2, r0, #0x14
	lsrs r0, r2, #0x16
	cmp r3, r0
	ble _080F25E4
	ldr r1, _080F25D8 @ =gUnk_02006ED0
	ldr r2, [r1, #0x10]
	lsls r2, r2, #8
	lsrs r2, r2, #0x16
	movs r3, #0x3f
	adds r1, r3, #0
	ands r1, r2
	lsls r1, r1, #2
	movs r0, #3
	ands r0, r4
	orrs r0, r1
	ldr r4, _080F25D8 @ =gUnk_02006ED0
	strb r0, [r4, #0xf]
	lsrs r2, r2, #6
	ands r2, r6
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r5, [r4, #0x10]
	ands r0, r5
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrh r2, [r4, #0x10]
	lsls r1, r2, #0x12
	lsrs r1, r1, #0x16
	ldrb r7, [r4, #0x14]
	lsls r0, r7, #0x19
	lsrs r0, r0, #0x1b
	add r0, sb
	adds r1, r1, r0
	ldr r4, _080F25DC @ =0x000003FF
	adds r0, r4, #0
	ands r1, r0
	lsls r1, r1, #4
	ldr r0, _080F25E0 @ =0xFFFFC00F
	ands r0, r2
	orrs r0, r1
	ldr r5, _080F25D8 @ =gUnk_02006ED0
	strh r0, [r5, #0x10]
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x16
	add r0, sb
	ldrb r7, [r5, #0xb]
	lsrs r1, r7, #4
	ldrb r2, [r5, #0xc]
	ands r3, r2
	lsls r3, r3, #4
	orrs r3, r1
	cmp r0, r3
	bgt _080F25D0
	b _080F27CC
_080F25D0:
	ldrh r3, [r5, #0xe]
	lsls r0, r3, #0x16
	ldrh r4, [r5, #0xc]
	b _080F2A2A
	.align 2, 0
_080F25D8: .4byte gUnk_02006ED0
_080F25DC: .4byte 0x000003FF
_080F25E0: .4byte 0xFFFFC00F
_080F25E4:
	ldr r7, [sp, #8]
	mov r1, r8
	muls r1, r7, r1
	lsrs r0, r2, #0x16
	cmp r1, r0
	blt _080F2604
	mov r0, r8
	adds r1, r3, r0
	lsrs r0, r2, #0x16
	cmp r1, r0
	ble _080F2604
	movs r5, #0x2d
	ldr r1, _080F2674 @ =gUnk_02006ED0
	ldr r0, [r1, #0x24]
	subs r0, #1
	str r0, [r1, #0x24]
_080F2604:
	ldr r2, [sp, #0x2c]
	cmp r2, #0
	beq _080F2698
	mov r3, sl
	lsrs r0, r3, #8
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080F2648
	movs r1, #0xf
	mov r0, sl
	ands r0, r1
	cmp r0, #6
	bhi _080F2648
	ldr r3, _080F2678 @ =0x0000FFF7
	mov r4, sl
	ands r3, r4
	movs r0, #8
	orrs r3, r0
	ldr r0, _080F2674 @ =gUnk_02006ED0
	ldrb r7, [r0, #0xf]
	lsrs r2, r7, #2
	ldrb r4, [r0, #0x10]
	ands r1, r4
	lsls r1, r1, #6
	orrs r1, r2
	adds r1, #1
	ldrh r0, [r0, #0x10]
	lsls r2, r0, #0x12
	lsrs r2, r2, #0x16
	adds r2, #1
	adds r0, r5, #0
	bl sub_080F19A4
_080F2648:
	ldr r2, _080F2674 @ =gUnk_02006ED0
	movs r0, #0x10
	ldrb r7, [r2, #0x15]
	ands r0, r7
	cmp r0, #0
	beq _080F267C
	ldrb r1, [r2, #0xf]
	lsrs r0, r1, #2
	movs r1, #0xf
	ldrb r3, [r2, #0x10]
	ands r1, r3
	lsls r1, r1, #6
	orrs r1, r0
	ldrh r2, [r2, #0x10]
	lsls r2, r2, #0x12
	lsrs r2, r2, #0x16
	adds r0, r5, #0
	mov r3, sl
	bl sub_080F1720
	b _080F2698
	.align 2, 0
_080F2674: .4byte gUnk_02006ED0
_080F2678: .4byte 0x0000FFF7
_080F267C:
	ldrb r4, [r2, #0xf]
	lsrs r0, r4, #2
	movs r1, #0xf
	ldrb r7, [r2, #0x10]
	ands r1, r7
	lsls r1, r1, #6
	orrs r1, r0
	ldrh r2, [r2, #0x10]
	lsls r2, r2, #0x12
	lsrs r2, r2, #0x16
	adds r0, r5, #0
	mov r3, sl
	bl sub_080F19A4
_080F2698:
	ldr r1, _080F2738 @ =gUnk_02006ED0
	ldrh r6, [r1, #0xc]
	lsrs r3, r6, #6
	ldrb r0, [r1, #0xf]
	lsrs r2, r0, #2
	movs r7, #0xf
	adds r0, r7, #0
	ldrb r4, [r1, #0x10]
	ands r0, r4
	lsls r4, r0, #6
	orrs r4, r2
	mov r2, r8
	adds r0, r4, r2
	cmp r3, r0
	bge _080F26C4
	adds r1, r0, #0
	lsls r1, r1, #6
	movs r0, #0x3f
	ands r0, r6
	orrs r0, r1
	ldr r3, _080F2738 @ =gUnk_02006ED0
	strh r0, [r3, #0xc]
_080F26C4:
	ldr r4, _080F2738 @ =gUnk_02006ED0
	ldrh r3, [r4, #0xe]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	ldrh r0, [r4, #0x10]
	lsls r2, r0, #0x12
	lsrs r0, r2, #0x16
	add r0, sb
	cmp r1, r0
	bge _080F26EA
	lsrs r0, r2, #0x16
	add r0, sb
	ldr r2, _080F273C @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	ldr r1, _080F2740 @ =0xFFFFFC00
	ands r1, r3
	orrs r1, r0
	strh r1, [r4, #0xe]
_080F26EA:
	ldr r4, _080F2738 @ =gUnk_02006ED0
	ldrb r3, [r4, #0xf]
	lsrs r0, r3, #2
	adds r1, r7, #0
	ldrb r2, [r4, #0x10]
	ands r1, r2
	lsls r1, r1, #6
	orrs r1, r0
	add r1, r8
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	movs r0, #0x3f
	ands r2, r0
	lsls r2, r2, #2
	movs r0, #3
	ands r0, r3
	orrs r0, r2
	strb r0, [r4, #0xf]
	lsrs r1, r1, #0x16
	ands r1, r7
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r3, [r4, #0x10]
	ands r0, r3
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldr r0, [r4, #0x24]
	adds r0, #1
	str r0, [r4, #0x24]
_080F2724:
	adds r0, r5, #0
	subs r0, #0x20
	cmp r0, #0x1f
	bhi _080F27CC
	lsls r0, r0, #2
	ldr r1, _080F2744 @ =_080F2748
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F2738: .4byte gUnk_02006ED0
_080F273C: .4byte 0x000003FF
_080F2740: .4byte 0xFFFFFC00
_080F2744: .4byte _080F2748
_080F2748: @ jump table
	.4byte _080F27C8 @ case 0
	.4byte _080F27C8 @ case 1
	.4byte _080F27C8 @ case 2
	.4byte _080F27CC @ case 3
	.4byte _080F27CC @ case 4
	.4byte _080F27CC @ case 5
	.4byte _080F27CC @ case 6
	.4byte _080F27CC @ case 7
	.4byte _080F27CC @ case 8
	.4byte _080F27C8 @ case 9
	.4byte _080F27CC @ case 10
	.4byte _080F27CC @ case 11
	.4byte _080F27CC @ case 12
	.4byte _080F27C8 @ case 13
	.4byte _080F27C8 @ case 14
	.4byte _080F27C8 @ case 15
	.4byte _080F27CC @ case 16
	.4byte _080F27CC @ case 17
	.4byte _080F27CC @ case 18
	.4byte _080F27CC @ case 19
	.4byte _080F27CC @ case 20
	.4byte _080F27CC @ case 21
	.4byte _080F27CC @ case 22
	.4byte _080F27CC @ case 23
	.4byte _080F27CC @ case 24
	.4byte _080F27CC @ case 25
	.4byte _080F27C8 @ case 26
	.4byte _080F27C8 @ case 27
	.4byte _080F27CC @ case 28
	.4byte _080F27CC @ case 29
	.4byte _080F27CC @ case 30
	.4byte _080F27C8 @ case 31
_080F27C8:
	movs r4, #0
	str r4, [sp, #4]
_080F27CC:
	ldr r5, [sp, #4]
	cmp r5, #0
	bne _080F27D4
	b _080F29C8
_080F27D4:
	ldr r3, _080F27E4 @ =gUnk_02006ED0
	ldr r0, [r3, #0x24]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080F27E0
	b _080F24DC
_080F27E0:
	b _080F29C8
	.align 2, 0
_080F27E4: .4byte gUnk_02006ED0
_080F27E8:
	ldr r2, _080F289C @ =gUnk_02006ED0
	ldr r0, [r2, #0x24]
	ldrb r1, [r0]
	lsls r7, r1, #8
	ldrb r3, [r0, #1]
	orrs r7, r3
	ldrb r5, [r0, #2]
	lsls r4, r5, #8
	ldrb r0, [r0, #3]
	orrs r4, r0
	movs r5, #0
	ldrb r0, [r2, #0xf]
	lsrs r1, r0, #2
	movs r0, #0xf
	ldrb r3, [r2, #0x10]
	ands r0, r3
	lsls r3, r0, #6
	orrs r3, r1
	mov r0, r8
	adds r1, r3, r0
	ldrh r2, [r2, #0xa]
	lsls r2, r2, #0x14
	lsrs r0, r2, #0x16
	cmp r1, r0
	ble _080F281C
	movs r5, #1
_080F281C:
	mov r1, r8
	lsls r0, r1, #1
	adds r0, r3, r0
	lsrs r1, r2, #0x16
	cmp r0, r1
	ble _080F2834
	adds r0, r4, #0
	bl sub_080F05D0
	cmp r0, #0
	beq _080F2834
	movs r5, #1
_080F2834:
	cmp r5, #0
	beq _080F28A8
	ldr r4, _080F289C @ =gUnk_02006ED0
	ldr r2, [r4, #0x10]
	lsls r2, r2, #8
	lsrs r2, r2, #0x16
	movs r3, #0x3f
	adds r1, r3, #0
	ands r1, r2
	lsls r1, r1, #2
	movs r0, #3
	ldrb r5, [r4, #0xf]
	ands r0, r5
	orrs r0, r1
	strb r0, [r4, #0xf]
	lsrs r2, r2, #6
	movs r0, #0x10
	rsbs r0, r0, #0
	ldrb r1, [r4, #0x10]
	ands r0, r1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrh r2, [r4, #0x10]
	lsls r1, r2, #0x12
	lsrs r1, r1, #0x16
	ldrb r5, [r4, #0x14]
	lsls r0, r5, #0x19
	lsrs r0, r0, #0x1b
	add r0, sb
	adds r1, r1, r0
	ldr r5, _080F28A0 @ =0x000003FF
	adds r0, r5, #0
	ands r1, r0
	lsls r1, r1, #4
	ldr r0, _080F28A4 @ =0xFFFFC00F
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #0x10]
	lsls r0, r0, #0x12
	lsrs r0, r0, #0x16
	add r0, sb
	ldrb r2, [r4, #0xb]
	lsrs r1, r2, #4
	ldrb r5, [r4, #0xc]
	ands r3, r5
	lsls r3, r3, #4
	orrs r3, r1
	cmp r0, r3
	ble _080F28A8
	ldrh r7, [r4, #0xe]
	lsls r0, r7, #0x16
	b _080F2A28
	.align 2, 0
_080F289C: .4byte gUnk_02006ED0
_080F28A0: .4byte 0x000003FF
_080F28A4: .4byte 0xFFFFC00F
_080F28A8:
	ldr r4, _080F2960 @ =gUnk_02006ED0
	ldrh r5, [r4, #0xc]
	lsrs r2, r5, #6
	ldrb r0, [r4, #0xf]
	lsrs r1, r0, #2
	movs r6, #0xf
	adds r0, r6, #0
	ldrb r3, [r4, #0x10]
	ands r0, r3
	lsls r3, r0, #6
	orrs r3, r1
	mov r1, r8
	adds r0, r3, r1
	cmp r2, r0
	bge _080F28D2
	adds r1, r0, #0
	lsls r1, r1, #6
	movs r0, #0x3f
	ands r0, r5
	orrs r0, r1
	strh r0, [r4, #0xc]
_080F28D2:
	ldrh r3, [r4, #0xe]
	lsls r1, r3, #0x16
	lsrs r1, r1, #0x16
	ldrh r5, [r4, #0x10]
	lsls r2, r5, #0x12
	lsrs r0, r2, #0x16
	add r0, sb
	cmp r1, r0
	bge _080F28F6
	lsrs r1, r2, #0x16
	add r1, sb
	ldr r5, _080F2964 @ =0x000003FF
	adds r0, r5, #0
	ands r1, r0
	ldr r0, _080F2968 @ =0xFFFFFC00
	ands r0, r3
	orrs r0, r1
	strh r0, [r4, #0xe]
_080F28F6:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	beq _080F298C
	mov r1, sl
	lsrs r0, r1, #8
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080F2934
	mov r0, sl
	ands r0, r6
	cmp r0, #6
	bhi _080F2934
	ldr r3, _080F296C @ =0x0000FFF7
	mov r5, sl
	ands r3, r5
	movs r0, #8
	orrs r3, r0
	ldrb r1, [r4, #0xf]
	lsrs r0, r1, #2
	adds r1, r6, #0
	ldrb r4, [r4, #0x10]
	ands r1, r4
	lsls r1, r1, #6
	orrs r1, r0
	adds r1, #1
	lsrs r2, r2, #0x16
	adds r2, #1
	adds r0, r7, #0
	bl sub_080F1884
_080F2934:
	ldr r2, _080F2960 @ =gUnk_02006ED0
	movs r0, #0x10
	ldrb r3, [r2, #0x15]
	ands r0, r3
	cmp r0, #0
	beq _080F2970
	ldrb r4, [r2, #0xf]
	lsrs r0, r4, #2
	movs r1, #0xf
	ldrb r5, [r2, #0x10]
	ands r1, r5
	lsls r1, r1, #6
	orrs r1, r0
	ldrh r2, [r2, #0x10]
	lsls r2, r2, #0x12
	lsrs r2, r2, #0x16
	adds r0, r7, #0
	mov r3, sl
	bl sub_080F1440
	b _080F298C
	.align 2, 0
_080F2960: .4byte gUnk_02006ED0
_080F2964: .4byte 0x000003FF
_080F2968: .4byte 0xFFFFFC00
_080F296C: .4byte 0x0000FFF7
_080F2970:
	ldrb r1, [r2, #0xf]
	lsrs r0, r1, #2
	movs r1, #0xf
	ldrb r3, [r2, #0x10]
	ands r1, r3
	lsls r1, r1, #6
	orrs r1, r0
	ldrh r2, [r2, #0x10]
	lsls r2, r2, #0x12
	lsrs r2, r2, #0x16
	adds r0, r7, #0
	mov r3, sl
	bl sub_080F1884
_080F298C:
	ldr r3, _080F2A08 @ =gUnk_02006ED0
	ldrb r4, [r3, #0xf]
	lsrs r0, r4, #2
	movs r5, #0xf
	adds r1, r5, #0
	ldrb r7, [r3, #0x10]
	ands r1, r7
	lsls r1, r1, #6
	orrs r1, r0
	add r1, r8
	lsls r1, r1, #0x10
	lsrs r2, r1, #0x10
	movs r0, #0x3f
	ands r2, r0
	lsls r2, r2, #2
	movs r0, #3
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #0xf]
	lsrs r1, r1, #0x16
	ands r1, r5
	movs r0, #0x10
	rsbs r0, r0, #0
	adds r2, r7, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldr r0, [r3, #0x24]
	adds r0, #2
	str r0, [r3, #0x24]
_080F29C8:
	ldr r3, [sp, #0x30]
	cmp r3, #0
	beq _080F2A14
	ldr r5, _080F2A08 @ =gUnk_02006ED0
	ldrh r4, [r5, #0xe]
	lsls r3, r4, #0x16
	ldrb r7, [r5, #0xb]
	lsrs r0, r7, #4
	movs r1, #0x3f
	ldrb r2, [r5, #0xc]
	ands r1, r2
	lsls r1, r1, #4
	lsrs r2, r3, #0x16
	orrs r1, r0
	cmp r2, r1
	bls _080F2A14
	adds r1, r2, #0
	mov r3, sb
	subs r1, r1, r3
	ldr r5, _080F2A0C @ =0x000003FF
	adds r0, r5, #0
	ands r1, r0
	ldr r0, _080F2A10 @ =0xFFFFFC00
	ands r0, r4
	orrs r0, r1
	ldr r7, _080F2A08 @ =gUnk_02006ED0
	strh r0, [r7, #0xe]
	lsls r0, r0, #0x16
	ldrh r1, [r7, #0xc]
	orrs r0, r1
	b _080F2A2C
	.align 2, 0
_080F2A08: .4byte gUnk_02006ED0
_080F2A0C: .4byte 0x000003FF
_080F2A10: .4byte 0xFFFFFC00
_080F2A14:
	ldr r2, _080F2A40 @ =gUnk_02006ED0
	ldr r0, [r2, #0x24]
	ldrb r0, [r0]
	cmp r0, #0
	beq _080F2A20
	b _080F228A
_080F2A20:
	ldr r3, _080F2A40 @ =gUnk_02006ED0
	ldrh r3, [r3, #0xe]
	lsls r0, r3, #0x16
	ldr r4, _080F2A40 @ =gUnk_02006ED0
_080F2A28:
	ldrh r4, [r4, #0xc]
_080F2A2A:
	orrs r0, r4
_080F2A2C:
	lsrs r0, r0, #6
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F2A40: .4byte gUnk_02006ED0

	thumb_func_start sub_080F2A44
sub_080F2A44: @ 0x080F2A44
	push {r4, lr}
	sub sp, #8
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	bl sub_080F21E8
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080F2A60
sub_080F2A60: @ 0x080F2A60
	push {r4, r5, lr}
	sub sp, #8
	ldr r5, [sp, #0x14]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r4, #0
	str r4, [sp]
	str r5, [sp, #4]
	bl sub_080F21E8
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_080F2A7C
sub_080F2A7C: @ 0x080F2A7C
	push {r4, lr}
	sub sp, #8
	adds r4, r3, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r3, #1
	str r3, [sp]
	movs r3, #0
	str r3, [sp, #4]
	adds r3, r4, #0
	bl sub_080F21E8
	ldr r0, _080F2AA4 @ =gUnk_02006ED0
	ldr r0, [r0, #0x24]
	subs r0, r0, r4
	add sp, #8
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080F2AA4: .4byte gUnk_02006ED0

	thumb_func_start sub_080F2AA8
sub_080F2AA8: @ 0x080F2AA8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r3, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp]
	movs r2, #8
	mov sl, r2
	adds r6, r0, #0
	mov r8, r1
	mov sb, r6
	str r4, [sp, #4]
	movs r7, #0
	ldr r1, _080F2AE0 @ =gUnk_02006ED0
	movs r0, #0x3f
	ldrh r3, [r1, #0xc]
	ands r0, r3
	strh r0, [r1, #0xc]
	ldr r0, _080F2AE4 @ =0xFFFFFC00
	ldrh r2, [r1, #0xe]
	ands r0, r2
	strh r0, [r1, #0xe]
	b _080F2BF2
	.align 2, 0
_080F2AE0: .4byte gUnk_02006ED0
_080F2AE4: .4byte 0xFFFFFC00
_080F2AE8:
	ldrb r0, [r4]
	cmp r0, #0xa
	beq _080F2B06
	cmp r0, #0xa
	bgt _080F2B00
	ldr r2, _080F2AFC @ =gUnk_02006ED0
	cmp r0, #9
	beq _080F2B16
	b _080F2B18
	.align 2, 0
_080F2AFC: .4byte gUnk_02006ED0
_080F2B00:
	ldr r2, _080F2B8C @ =gUnk_02006ED0
	cmp r0, #0xd
	bne _080F2B18
_080F2B06:
	mov r6, sb
	ldr r1, _080F2B8C @ =gUnk_02006ED0
	ldrb r3, [r1, #0x14]
	lsls r0, r3, #0x19
	lsrs r0, r0, #0x1b
	add r0, sl
	add r8, r0
	adds r2, r1, #0
_080F2B16:
	adds r4, #1
_080F2B18:
	movs r0, #1
	ldrb r1, [r2, #0x15]
	ands r0, r1
	cmp r0, #0
	beq _080F2B66
	movs r5, #0
	adds r0, r4, #0
	str r2, [sp, #8]
	bl sub_080F02A4
	adds r0, r6, r0
	ldr r2, [sp, #8]
	ldrh r2, [r2, #0xa]
	lsls r1, r2, #0x14
	lsrs r1, r1, #0x16
	cmp r0, r1
	ble _080F2B40
	cmp r7, #0x3f
	bhi _080F2B40
	movs r5, #1
_080F2B40:
	ldrb r0, [r4]
	bl sub_080F0200
	adds r0, r6, r0
	ldr r2, _080F2B8C @ =gUnk_02006ED0
	ldrh r3, [r2, #0xa]
	lsls r1, r3, #0x14
	lsrs r1, r1, #0x16
	cmp r0, r1
	ble _080F2B56
	movs r5, #1
_080F2B56:
	cmp r5, #0
	beq _080F2B66
	mov r6, sb
	ldrb r1, [r2, #0x14]
	lsls r0, r1, #0x19
	lsrs r0, r0, #0x1b
	add r0, sl
	add r8, r0
_080F2B66:
	movs r0, #2
	ldrb r3, [r2, #0x15]
	ands r0, r3
	mov r5, r8
	add r5, sl
	cmp r0, #0
	beq _080F2B90
	ldrb r0, [r2, #0xb]
	lsrs r1, r0, #4
	movs r0, #0x3f
	ldrb r3, [r2, #0xc]
	ands r0, r3
	lsls r0, r0, #4
	orrs r0, r1
	cmp r5, r0
	ble _080F2B90
	ldr r1, [sp, #4]
	subs r0, r4, r1
	b _080F2BFE
	.align 2, 0
_080F2B8C: .4byte gUnk_02006ED0
_080F2B90:
	movs r0, #1
	ldrb r2, [r2, #0x15]
	ands r0, r2
	mov r2, sl
	adds r7, r6, r2
	cmp r0, #0
	beq _080F2BB0
	cmp r6, sb
	bne _080F2BB0
	ldrb r3, [r4]
	cmp r3, #0x20
	bne _080F2BB0
_080F2BA8:
	adds r4, #1
	ldrb r0, [r4]
	cmp r0, #0x20
	beq _080F2BA8
_080F2BB0:
	ldrb r0, [r4]
	adds r1, r6, #0
	mov r2, r8
	ldr r3, [sp]
	bl sub_080F1B60
	ldr r3, _080F2C10 @ =gUnk_02006ED0
	ldrh r2, [r3, #0xc]
	lsrs r0, r2, #6
	adds r1, r7, #0
	cmp r0, r1
	bge _080F2BD2
	lsls r1, r1, #6
	movs r0, #0x3f
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #0xc]
_080F2BD2:
	ldrh r1, [r3, #0xe]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x16
	cmp r0, r5
	bge _080F2BEC
	ldr r2, _080F2C14 @ =0x000003FF
	adds r0, r2, #0
	ands r5, r0
	ldr r2, _080F2C18 @ =0xFFFFFC00
	adds r0, r2, #0
	ands r0, r1
	orrs r0, r5
	strh r0, [r3, #0xe]
_080F2BEC:
	adds r6, r7, #0
	ldrb r7, [r4]
	adds r4, #1
_080F2BF2:
	ldrb r0, [r4]
	cmp r0, #0
	beq _080F2BFA
	b _080F2AE8
_080F2BFA:
	ldr r3, [sp, #4]
	subs r0, r4, r3
_080F2BFE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080F2C10: .4byte gUnk_02006ED0
_080F2C14: .4byte 0x000003FF
_080F2C18: .4byte 0xFFFFFC00

	thumb_func_start sub_080F2C1C
sub_080F2C1C: @ 0x080F2C1C
	push {lr}
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_080F2A7C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080F2C2C
sub_080F2C2C: @ 0x080F2C2C
	push {lr}
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_080F2A7C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080F2C3C
sub_080F2C3C: @ 0x080F2C3C
	push {lr}
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_080F2A7C
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080F2C4C
sub_080F2C4C: @ 0x080F2C4C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r3, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
_080F2C58:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	ldr r1, _080F2C88 @ =0xFFFF824F
	adds r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	adds r2, r7, #0
	adds r3, r6, #0
	bl sub_080F1884
	subs r5, r5, r0
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	cmp r4, #0
	bne _080F2C58
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2C88: .4byte 0xFFFF824F

	thumb_func_start sub_080F2C8C
sub_080F2C8C: @ 0x080F2C8C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r3, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
_080F2C98:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, #0
	adds r2, r7, #0
	adds r3, r6, #0
	bl sub_080F19A4
	subs r1, r5, #5
	ldr r0, _080F2CD0 @ =gUnk_02006ED0
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	subs r5, r1, r0
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	cmp r4, #0
	bne _080F2C98
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2CD0: .4byte gUnk_02006ED0

	thumb_func_start sub_080F2CD4
sub_080F2CD4: @ 0x080F2CD4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	mov r8, r1
	adds r6, r3, #0
	ldr r4, [sp, #0x18]
	lsls r2, r2, #0x10
	lsrs r7, r2, #0x10
	cmp r4, #0
	beq _080F2D1E
_080F2CEA:
	adds r0, r6, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, #0
	mov r2, r8
	adds r3, r7, #0
	bl sub_080F19A4
	subs r1, r5, #5
	ldr r0, _080F2D28 @ =gUnk_02006ED0
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1f
	subs r5, r1, r0
	adds r0, r6, #0
	movs r1, #0xa
	bl __divsi3
	adds r6, r0, #0
	subs r4, #1
	cmp r4, #0
	bne _080F2CEA
_080F2D1E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F2D28: .4byte gUnk_02006ED0

	thumb_func_start sub_080F2D2C
sub_080F2D2C: @ 0x080F2D2C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r3, #0
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
_080F2D38:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r0, #0x30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r5, #0
	adds r2, r7, #0
	adds r3, r6, #0
	bl sub_080F1B60
	subs r5, #8
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	cmp r4, #0
	bne _080F2D38
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080F2D68
sub_080F2D68: @ 0x080F2D68
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	ldrb r4, [r0]
	movs r5, #1
	adds r3, r5, #0
	ands r3, r4
	movs r2, #2
	mov sl, r2
	ands r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x19
	orrs r3, r2
	movs r2, #4
	mov sb, r2
	ands r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1a
	orrs r3, r2
	movs r2, #8
	mov r8, r2
	ands r2, r4
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1b
	orrs r3, r2
	lsls r2, r3, #4
	subs r2, r2, r3
	ldrh r4, [r1]
	bics r4, r2
	orrs r4, r3
	adds r0, #1
	ldrb r6, [r0]
	adds r3, r5, #0
	ands r3, r6
	mov r2, sl
	ands r2, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x19
	orrs r3, r2
	mov r2, sb
	ands r2, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1a
	orrs r3, r2
	mov r2, r8
	ands r2, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1b
	orrs r3, r2
	lsls r2, r3, #4
	subs r3, r2, r3
	lsls r3, r3, #4
	bics r4, r3
	orrs r4, r2
	adds r0, #1
	ldrb r6, [r0]
	adds r3, r5, #0
	ands r3, r6
	mov r2, sl
	ands r2, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x19
	orrs r3, r2
	mov r2, sb
	ands r2, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1a
	orrs r3, r2
	mov r2, r8
	ands r2, r6
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1b
	orrs r3, r2
	lsls r2, r3, #4
	subs r2, r2, r3
	lsls r2, r2, #8
	bics r4, r2
	lsls r3, r3, #8
	orrs r4, r3
	ldrb r0, [r0, #1]
	ands r5, r0
	mov r2, sl
	ands r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x19
	orrs r5, r2
	mov r2, sb
	ands r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1a
	orrs r5, r2
	mov r2, r8
	ands r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x1b
	orrs r5, r2
	lsls r0, r5, #4
	subs r0, r0, r5
	lsls r0, r0, #0xc
	bics r4, r0
	lsls r5, r5, #0xc
	orrs r4, r5
	strh r4, [r1]
	ldrh r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080F2E4C
sub_080F2E4C: @ 0x080F2E4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	ldr r2, _080F2E78 @ =gUnk_02006ED0
	ldr r5, [r2]
	movs r0, #0x80
	ldrb r1, [r2, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080F2E7C
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_080F35E8
	b _080F34C6
	.align 2, 0
_080F2E78: .4byte gUnk_02006ED0
_080F2E7C:
	movs r0, #0xf
	ands r6, r0
	lsls r0, r6, #4
	orrs r6, r0
	lsls r0, r6, #0x10
	lsrs r6, r0, #0x10
	lsls r0, r6, #8
	orrs r6, r0
	lsls r0, r6, #0x10
	lsrs r6, r0, #0x10
	movs r0, #0
	mov sl, r0
	ldrh r0, [r2, #8]
	lsls r1, r0, #0x16
	lsrs r1, r1, #0x18
	ldr r0, [r2, #8]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x18
	muls r0, r1, r0
	cmp sl, r0
	blt _080F2EA8
	b _080F34C6
_080F2EA8:
	ldr r1, _080F2ED8 @ =0x0000FFF0
	mov sb, r1
	ldr r2, _080F2EDC @ =0x0000FF0F
	mov r8, r2
	ldr r0, _080F2EE0 @ =0x0000F0FF
	adds r3, r0, #0
	ldr r1, _080F2EE4 @ =0x00000FFF (Catapult Turtle)
	adds r7, r1, #0
_080F2EB8:
	ldr r1, _080F2EE8 @ =gUnk_02006ED0
	movs r0, #8
	ldrb r1, [r1, #0x15]
	ands r0, r1
	cmp r0, #0
	beq _080F2EEC
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x20
	str r3, [sp]
	bl MemoryCopyWord
	adds r4, #0x20
	ldr r3, [sp]
	b _080F34AC
	.align 2, 0
_080F2ED8: .4byte 0x0000FFF0
_080F2EDC: .4byte 0x0000FF0F
_080F2EE0: .4byte 0x0000F0FF
_080F2EE4: .4byte 0x00000FFF @ Catapult Turtle
_080F2EE8: .4byte gUnk_02006ED0
_080F2EEC:
	cmp r6, #0
	beq _080F2EF2
	strh r6, [r4]
_080F2EF2:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F2F06
	mov r0, sb
	ldrh r2, [r4]
	ands r0, r2
	strh r0, [r4]
	ldrb r1, [r5]
	orrs r0, r1
	strh r0, [r4]
_080F2F06:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F2F1C
	mov r1, r8
	ldrh r2, [r4]
	ands r1, r2
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F2F1C:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F2F30
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F2F30:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F2F44
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F2F44:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F2F4E
	strh r6, [r4]
_080F2F4E:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F2F62
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F2F62:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F2F78
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F2F78:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F2F8C
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F2F8C:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F2FA0
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F2FA0:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F2FAA
	strh r6, [r4]
_080F2FAA:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F2FBE
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F2FBE:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F2FD4
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F2FD4:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F2FE8
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F2FE8:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F2FFC
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F2FFC:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F3006
	strh r6, [r4]
_080F3006:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F301A
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F301A:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F3030
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F3030:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F3044
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F3044:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F3058
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F3058:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F3062
	strh r6, [r4]
_080F3062:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F3076
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F3076:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F308C
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F308C:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F30A0
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F30A0:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F30B4
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F30B4:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F30BE
	strh r6, [r4]
_080F30BE:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F30D2
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F30D2:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F30E8
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F30E8:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F30FC
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F30FC:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F3110
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F3110:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F311A
	strh r6, [r4]
_080F311A:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F312E
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F312E:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F3144
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F3144:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F3158
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F3158:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F316C
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F316C:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F3176
	strh r6, [r4]
_080F3176:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F318A
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F318A:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F31A0
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F31A0:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F31B4
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F31B4:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F31C8
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F31C8:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F31D2
	strh r6, [r4]
_080F31D2:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F31E6
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F31E6:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F31FC
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F31FC:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F3210
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F3210:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F3224
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F3224:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F322E
	strh r6, [r4]
_080F322E:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F3242
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F3242:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F3258
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F3258:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F326C
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F326C:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F3280
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F3280:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F328A
	strh r6, [r4]
_080F328A:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F329E
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F329E:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F32B4
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F32B4:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F32C8
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F32C8:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F32DC
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F32DC:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F32E6
	strh r6, [r4]
_080F32E6:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F32FA
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F32FA:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F3310
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F3310:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F3324
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F3324:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F3338
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F3338:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F3342
	strh r6, [r4]
_080F3342:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F3356
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F3356:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F336C
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F336C:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F3380
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F3380:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F3394
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F3394:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F339E
	strh r6, [r4]
_080F339E:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F33B2
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F33B2:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F33C8
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F33C8:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F33DC
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F33DC:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F33F0
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F33F0:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F33FA
	strh r6, [r4]
_080F33FA:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F340E
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F340E:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F3424
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F3424:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F3438
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F3438:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F344C
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F344C:
	adds r4, #2
	adds r5, #4
	cmp r6, #0
	beq _080F3456
	strh r6, [r4]
_080F3456:
	ldrb r0, [r5]
	cmp r0, #0
	beq _080F346A
	mov r0, sb
	ldrh r1, [r4]
	ands r0, r1
	strh r0, [r4]
	ldrb r2, [r5]
	orrs r0, r2
	strh r0, [r4]
_080F346A:
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _080F3480
	mov r1, r8
	ldrh r0, [r4]
	ands r1, r0
	strh r1, [r4]
	ldrb r2, [r5, #1]
	lsls r0, r2, #4
	orrs r1, r0
	strh r1, [r4]
_080F3480:
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _080F3494
	ldrh r1, [r4]
	ands r1, r3
	strh r1, [r4]
	ldrb r2, [r5, #2]
	lsls r0, r2, #8
	orrs r1, r0
	strh r1, [r4]
_080F3494:
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _080F34A8
	ldrh r1, [r4]
	ands r1, r7
	strh r1, [r4]
	ldrb r2, [r5, #3]
	lsls r0, r2, #0xc
	orrs r1, r0
	strh r1, [r4]
_080F34A8:
	adds r4, #2
	adds r5, #4
_080F34AC:
	movs r0, #1
	add sl, r0
	ldr r0, _080F34D8 @ =gUnk_02006ED0
	ldrh r2, [r0, #8]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x18
	ldr r0, [r0, #8]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x18
	muls r0, r1, r0
	cmp sl, r0
	bge _080F34C6
	b _080F2EB8
_080F34C6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F34D8: .4byte gUnk_02006ED0

	thumb_func_start sub_080F34DC
sub_080F34DC: @ 0x080F34DC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r3, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r6, _080F3504 @ =gUnk_02006ED0
	movs r0, #0x80
	ldrb r1, [r6, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080F3508
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_080F35E8
	b _080F35C8
	.align 2, 0
_080F3504: .4byte gUnk_02006ED0
_080F3508:
	movs r0, #0xf
	ands r4, r0
	lsls r0, r4, #4
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r4, #8
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
	movs r5, #0
	ldrh r2, [r6, #8]
	lsls r1, r2, #0x16
	lsrs r1, r1, #0x18
	ldr r0, [r6, #8]
	lsls r2, r0, #0xe
	lsrs r0, r2, #0x18
	muls r0, r1, r0
	cmp r5, r0
	bge _080F35C8
	mov sl, r6
	ldr r7, [r6]
	str r7, [sp, #4]
	ldr r0, _080F35D8 @ =0x0000FFF0
	mov sb, r0
	ldr r1, _080F35DC @ =0x0000FF0F
	mov r8, r1
	str r2, [sp]
	ldr r2, _080F35E0 @ =0x0000F0FF
	mov ip, r2
_080F3544:
	lsls r0, r5, #6
	ldr r7, [sp, #4]
	adds r2, r7, r0
	adds r6, r5, #1
	movs r5, #0xf
_080F354E:
	cmp r4, #0
	beq _080F3554
	strh r4, [r3]
_080F3554:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080F3568
	mov r0, sb
	ldrh r1, [r3]
	ands r0, r1
	strh r0, [r3]
	ldrb r7, [r2]
	orrs r0, r7
	strh r0, [r3]
_080F3568:
	ldrb r0, [r2, #1]
	cmp r0, #0
	beq _080F357E
	mov r0, r8
	ldrh r1, [r3]
	ands r0, r1
	strh r0, [r3]
	ldrb r7, [r2, #1]
	lsls r1, r7, #4
	orrs r0, r1
	strh r0, [r3]
_080F357E:
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _080F3594
	mov r0, ip
	ldrh r1, [r3]
	ands r0, r1
	strh r0, [r3]
	ldrb r7, [r2, #2]
	lsls r1, r7, #8
	orrs r0, r1
	strh r0, [r3]
_080F3594:
	ldrb r0, [r2, #3]
	cmp r0, #0
	beq _080F35AA
	ldr r0, _080F35E4 @ =0x00000FFF (Catapult Turtle)
	ldrh r1, [r3]
	ands r0, r1
	strh r0, [r3]
	ldrb r7, [r2, #3]
	lsls r1, r7, #0xc
	orrs r0, r1
	strh r0, [r3]
_080F35AA:
	adds r3, #2
	adds r2, #4
	subs r5, #1
	cmp r5, #0
	bge _080F354E
	adds r5, r6, #0
	mov r1, sl
	ldrh r1, [r1, #8]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x18
	ldr r2, [sp]
	lsrs r1, r2, #0x18
	muls r0, r1, r0
	cmp r5, r0
	blt _080F3544
_080F35C8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F35D8: .4byte 0x0000FFF0
_080F35DC: .4byte 0x0000FF0F
_080F35E0: .4byte 0x0000F0FF
_080F35E4: .4byte 0x00000FFF @ Catapult Turtle

	thumb_func_start sub_080F35E8
sub_080F35E8: @ 0x080F35E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r2, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	movs r3, #0
	ldr r7, _080F3680 @ =gUnk_02006ED0
	ldrh r0, [r7, #8]
	lsls r1, r0, #0x16
	lsrs r1, r1, #0x18
	ldr r0, [r7, #8]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x18
	muls r0, r1, r0
	cmp r3, r0
	bge _080F3670
	ldr r1, [r7]
	mov sb, r1
	movs r0, #0xff
	lsls r0, r0, #8
	mov r8, r0
	movs r1, #0xff
	mov ip, r1
	adds r6, r4, #0
	ands r6, r1
	adds r5, r4, #0
	ands r5, r0
_080F3624:
	lsls r0, r3, #6
	mov r4, sb
	adds r1, r4, r0
	adds r3, #1
	mov sl, r3
	movs r3, #0x1f
_080F3630:
	ldrb r0, [r1]
	cmp r0, #0
	beq _080F3640
	mov r0, r8
	ldrh r4, [r2]
	ands r0, r4
	orrs r0, r6
	strh r0, [r2]
_080F3640:
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	beq _080F3652
	mov r0, ip
	ldrh r4, [r2]
	ands r0, r4
	orrs r0, r5
	strh r0, [r2]
_080F3652:
	adds r2, #2
	adds r1, #1
	subs r3, #1
	cmp r3, #0
	bge _080F3630
	mov r3, sl
	ldrh r1, [r7, #8]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x18
	ldr r1, [r7, #8]
	lsls r1, r1, #0xe
	lsrs r1, r1, #0x18
	muls r0, r1, r0
	cmp r3, r0
	blt _080F3624
_080F3670:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F3680: .4byte gUnk_02006ED0

	thumb_func_start sub_080F3684
sub_080F3684: @ 0x080F3684
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r3, r0, #0
	movs r4, #0
	ldr r6, _080F3708 @ =gUnk_02006ED0
	ldrh r1, [r6, #8]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x18
	ldr r1, [r6, #8]
	lsls r1, r1, #0xe
	lsrs r1, r1, #0x18
	muls r0, r1, r0
	cmp r4, r0
	bge _080F36FC
	ldr r7, [r6]
	mov ip, r7
	movs r0, #0xff
	lsls r0, r0, #8
	mov r8, r0
_080F36AC:
	lsls r0, r4, #6
	mov r1, ip
	adds r2, r1, r0
	adds r5, r4, #1
	movs r4, #0x1f
_080F36B6:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080F36CA
	mov r0, r8
	ldrh r7, [r3]
	ands r0, r7
	strh r0, [r3]
	ldrb r1, [r2]
	orrs r0, r1
	strh r0, [r3]
_080F36CA:
	adds r2, #1
	ldrb r0, [r2]
	cmp r0, #0
	beq _080F36DE
	ldrb r1, [r3]
	strh r1, [r3]
	ldrb r7, [r2]
	lsls r0, r7, #8
	orrs r1, r0
	strh r1, [r3]
_080F36DE:
	adds r3, #2
	adds r2, #1
	subs r4, #1
	cmp r4, #0
	bge _080F36B6
	adds r4, r5, #0
	ldrh r1, [r6, #8]
	lsls r0, r1, #0x16
	lsrs r0, r0, #0x18
	ldr r1, [r6, #8]
	lsls r1, r1, #0xe
	lsrs r1, r1, #0x18
	muls r0, r1, r0
	cmp r4, r0
	blt _080F36AC
_080F36FC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F3708: .4byte gUnk_02006ED0

	thumb_func_start sub_080F370C
sub_080F370C: @ 0x080F370C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp]
	movs r0, #0
	mov sb, r0
	movs r2, #0
	ldr r1, _080F37D0 @ =gUnk_02006ED0
	ldr r0, [r1, #8]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x18
	cmp r2, r0
	bge _080F37BE
	ldrh r4, [r1, #8]
	lsls r4, r4, #0x16
	str r4, [sp, #4]
_080F3738:
	mov r3, sl
	movs r1, #0
	ldr r6, [sp, #4]
	lsrs r0, r6, #0x18
	adds r2, #1
	str r2, [sp, #8]
	cmp r1, r0
	bge _080F37AA
	ldr r0, _080F37D0 @ =gUnk_02006ED0
	ldr r0, [r0]
	mov r8, r0
	movs r2, #0xff
	lsls r2, r2, #8
	mov ip, r2
	movs r7, #0xff
	ldr r5, [sp]
	ands r5, r7
	ldr r4, [sp]
	ands r4, r2
_080F375E:
	mov r6, sb
	lsls r0, r6, #6
	mov r6, r8
	adds r2, r6, r0
	movs r0, #1
	add sb, r0
	adds r1, #1
	str r1, [sp, #0xc]
	movs r1, #0x1f
_080F3770:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080F3780
	mov r0, ip
	ldrh r6, [r3]
	ands r0, r6
	orrs r0, r5
	strh r0, [r3]
_080F3780:
	adds r2, #1
	ldrb r0, [r2]
	cmp r0, #0
	beq _080F3792
	adds r0, r7, #0
	ldrh r6, [r3]
	ands r0, r6
	orrs r0, r4
	strh r0, [r3]
_080F3792:
	adds r3, #2
	adds r2, #1
	subs r1, #1
	cmp r1, #0
	bge _080F3770
	ldr r1, [sp, #0xc]
	ldr r2, _080F37D0 @ =gUnk_02006ED0
	ldrh r2, [r2, #8]
	lsls r0, r2, #0x16
	lsrs r0, r0, #0x18
	cmp r1, r0
	blt _080F375E
_080F37AA:
	movs r4, #0x80
	lsls r4, r4, #3
	add sl, r4
	ldr r2, [sp, #8]
	ldr r6, _080F37D0 @ =gUnk_02006ED0
	ldr r0, [r6, #8]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x18
	cmp r2, r0
	blt _080F3738
_080F37BE:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F37D0: .4byte gUnk_02006ED0

	thumb_func_start sub_080F37D4
sub_080F37D4: @ 0x080F37D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r1, _080F3800 @ =gUnk_02006ED0
	ldr r3, [r1]
	movs r0, #0x80
	ldrb r2, [r1, #0x14]
	ands r0, r2
	mov sl, r1
	cmp r0, #0
	beq _080F3804
	mov r0, r8
	adds r1, r4, #0
	bl sub_080F370C
	b _080F3EDC
	.align 2, 0
_080F3800: .4byte gUnk_02006ED0
_080F3804:
	movs r0, #0xf
	ands r4, r0
	lsls r0, r4, #4
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r4, #8
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
	movs r1, #0
	b _080F3ECE
_080F381C:
	mov r2, r8
	movs r6, #0
	mov sb, r6
	mov r5, sl
	ldrh r5, [r5, #8]
	lsls r0, r5, #0x16
	lsrs r0, r0, #0x18
	adds r1, #1
	str r1, [sp]
	cmp sb, r0
	blt _080F3834
	b _080F3EC6
_080F3834:
	ldr r6, _080F3B7C @ =0x0000FFF0
	mov ip, r6
	ldr r7, _080F3B80 @ =0x0000FF0F
	ldr r6, _080F3B84 @ =0x0000F0FF
	ldr r5, _080F3B88 @ =0x00000FFF (Catapult Turtle)
_080F383E:
	cmp r4, #0
	beq _080F3844
	strh r4, [r2]
_080F3844:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F3858
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F3858:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F3870
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3870:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3888
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3888:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F38A0
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F38A0:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F38AA
	strh r4, [r2]
_080F38AA:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F38BE
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F38BE:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F38D6
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F38D6:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F38EE
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F38EE:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F3906
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3906:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F3910
	strh r4, [r2]
_080F3910:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F3924
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F3924:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F393C
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F393C:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3954
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3954:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F396C
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F396C:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F3976
	strh r4, [r2]
_080F3976:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F398A
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F398A:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F39A2
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F39A2:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F39BA
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F39BA:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F39D2
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F39D2:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F39DC
	strh r4, [r2]
_080F39DC:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F39F0
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F39F0:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F3A08
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3A08:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3A20
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3A20:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F3A38
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3A38:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F3A42
	strh r4, [r2]
_080F3A42:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F3A56
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F3A56:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F3A6E
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3A6E:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3A86
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3A86:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F3A9E
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3A9E:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F3AA8
	strh r4, [r2]
_080F3AA8:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F3ABC
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F3ABC:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F3AD4
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3AD4:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3AEC
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3AEC:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F3B04
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3B04:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F3B0E
	strh r4, [r2]
_080F3B0E:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F3B22
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F3B22:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F3B3A
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3B3A:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3B52
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3B52:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F3B6A
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3B6A:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F3B74
	strh r4, [r2]
_080F3B74:
	ldrb r0, [r3]
	cmp r0, #0
	b _080F3B8C
	.align 2, 0
_080F3B7C: .4byte 0x0000FFF0
_080F3B80: .4byte 0x0000FF0F
_080F3B84: .4byte 0x0000F0FF
_080F3B88: .4byte 0x00000FFF @ Catapult Turtle
_080F3B8C:
	beq _080F3B9C
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F3B9C:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F3BB4
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3BB4:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3BCC
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3BCC:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F3BE4
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3BE4:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F3BEE
	strh r4, [r2]
_080F3BEE:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F3C02
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F3C02:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F3C1A
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3C1A:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3C32
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3C32:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F3C4A
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3C4A:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F3C54
	strh r4, [r2]
_080F3C54:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F3C68
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F3C68:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F3C80
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3C80:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3C98
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3C98:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F3CB0
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3CB0:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F3CBA
	strh r4, [r2]
_080F3CBA:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F3CCE
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F3CCE:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F3CE6
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3CE6:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3CFE
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3CFE:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F3D16
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3D16:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F3D20
	strh r4, [r2]
_080F3D20:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F3D34
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F3D34:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F3D4C
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3D4C:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3D64
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3D64:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F3D7C
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3D7C:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F3D86
	strh r4, [r2]
_080F3D86:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F3D9A
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F3D9A:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F3DB2
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3DB2:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3DCA
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3DCA:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F3DE2
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3DE2:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F3DEC
	strh r4, [r2]
_080F3DEC:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F3E00
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F3E00:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F3E18
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3E18:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3E30
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3E30:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F3E48
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3E48:
	adds r2, #2
	adds r3, #4
	cmp r4, #0
	beq _080F3E52
	strh r4, [r2]
_080F3E52:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F3E66
	mov r0, ip
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F3E66:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F3E7E
	adds r0, r7, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #1]
	lsls r1, r1, #4
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3E7E:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3E96
	adds r0, r6, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #2]
	lsls r1, r1, #8
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3E96:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F3EAE
	adds r0, r5, #0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r1, [r3, #3]
	lsls r1, r1, #0xc
	str r1, [sp, #8]
	orrs r0, r1
	strh r0, [r2]
_080F3EAE:
	adds r2, #2
	adds r3, #4
	movs r0, #1
	add sb, r0
	mov r1, sl
	ldrh r1, [r1, #8]
	lsls r1, r1, #0x16
	str r1, [sp, #4]
	lsrs r0, r1, #0x18
	cmp sb, r0
	bge _080F3EC6
	b _080F383E
_080F3EC6:
	movs r2, #0x80
	lsls r2, r2, #3
	add r8, r2
	ldr r1, [sp]
_080F3ECE:
	mov r5, sl
	ldr r0, [r5, #8]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x18
	cmp r1, r0
	bge _080F3EDC
	b _080F381C
_080F3EDC:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_080F3EEC
sub_080F3EEC: @ 0x080F3EEC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	lsls r1, r1, #0x10
	lsrs r4, r1, #0x10
	ldr r2, _080F3F14 @ =gUnk_02006ED0
	movs r0, #0x80
	ldrb r1, [r2, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _080F3F18
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_080F35E8
	b _080F3FF4
	.align 2, 0
_080F3F14: .4byte gUnk_02006ED0
_080F3F18:
	movs r0, #0xf
	ands r4, r0
	lsls r0, r4, #4
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r4, #8
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
	movs r3, #0
	mov ip, r3
	ldr r0, [r2, #8]
	lsls r1, r0, #0xe
	lsrs r0, r1, #0x18
	cmp r3, r0
	bge _080F3FF4
	adds r0, r2, #0
	ldrh r5, [r0, #8]
	lsls r5, r5, #0x16
	str r5, [sp, #4]
	str r1, [sp]
_080F3F44:
	adds r2, r7, #0
	movs r1, #0
	ldr r6, [sp, #4]
	lsrs r0, r6, #0x18
	adds r3, #1
	mov sb, r3
	cmp r1, r0
	bge _080F3FE4
	ldr r0, _080F4004 @ =gUnk_02006ED0
	ldr r0, [r0]
	mov r8, r0
	ldr r3, _080F4008 @ =0x00000FFF (Catapult Turtle)
	mov sl, r3
_080F3F5E:
	mov r5, ip
	lsls r0, r5, #6
	mov r6, r8
	adds r3, r6, r0
	movs r0, #1
	add ip, r0
	adds r1, #1
	str r1, [sp, #8]
	movs r5, #0xf
_080F3F70:
	cmp r4, #0
	beq _080F3F76
	strh r4, [r2]
_080F3F76:
	ldrb r0, [r3]
	cmp r0, #0
	beq _080F3F8A
	ldr r0, _080F400C @ =0x0000FFF0
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r6, [r3]
	orrs r0, r6
	strh r0, [r2]
_080F3F8A:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F3FA0
	ldr r1, _080F4010 @ =0x0000FF0F
	ldrh r0, [r2]
	ands r1, r0
	strh r1, [r2]
	ldrb r6, [r3, #1]
	lsls r0, r6, #4
	orrs r1, r0
	strh r1, [r2]
_080F3FA0:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F3FB6
	ldr r1, _080F4014 @ =0x0000F0FF
	ldrh r0, [r2]
	ands r1, r0
	strh r1, [r2]
	ldrb r6, [r3, #2]
	lsls r0, r6, #8
	orrs r1, r0
	strh r1, [r2]
_080F3FB6:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F3FCC
	mov r1, sl
	ldrh r0, [r2]
	ands r1, r0
	strh r1, [r2]
	ldrb r6, [r3, #3]
	lsls r0, r6, #0xc
	orrs r1, r0
	strh r1, [r2]
_080F3FCC:
	adds r3, #4
	adds r2, #2
	subs r5, #1
	cmp r5, #0
	bge _080F3F70
	ldr r1, [sp, #8]
	ldr r3, _080F4004 @ =gUnk_02006ED0
	ldrh r3, [r3, #8]
	lsls r0, r3, #0x16
	lsrs r0, r0, #0x18
	cmp r1, r0
	blt _080F3F5E
_080F3FE4:
	movs r5, #0x80
	lsls r5, r5, #3
	adds r7, r7, r5
	mov r3, sb
	ldr r6, [sp]
	lsrs r0, r6, #0x18
	cmp r3, r0
	blt _080F3F44
_080F3FF4:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F4004: .4byte gUnk_02006ED0
_080F4008: .4byte 0x00000FFF @ Catapult Turtle
_080F400C: .4byte 0x0000FFF0
_080F4010: .4byte 0x0000FF0F
_080F4014: .4byte 0x0000F0FF

	thumb_func_start sub_080F4018
sub_080F4018: @ 0x080F4018
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	movs r0, #0x80
	ldr r2, _080F4128 @ =gUnk_02006ED0
	ldrb r2, [r2, #0x14]
	ands r0, r2
	cmp r0, #0
	bne _080F4116
	movs r0, #0xf
	ands r4, r0
	lsls r0, r4, #4
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
	lsls r0, r4, #8
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
	movs r7, #0
	movs r2, #0
	ldr r3, _080F4128 @ =gUnk_02006ED0
	ldr r0, [r3, #8]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x18
	cmp r2, r0
	bge _080F4116
	ldrh r5, [r3, #8]
	lsls r5, r5, #0x16
	str r5, [sp]
	lsls r1, r1, #5
	str r1, [sp, #4]
_080F4068:
	mov r3, r8
	movs r1, #0
	ldr r6, [sp]
	lsrs r0, r6, #0x18
	adds r2, #1
	mov sb, r2
	cmp r1, r0
	bge _080F4104
	ldr r0, _080F4128 @ =gUnk_02006ED0
	ldr r0, [r0]
	mov ip, r0
	ldr r2, _080F412C @ =0x00000FFF (Catapult Turtle)
	mov sl, r2
_080F4082:
	lsls r0, r7, #6
	mov r5, ip
	adds r2, r5, r0
	adds r7, #1
	adds r1, #1
	str r1, [sp, #8]
	movs r5, #0xf
_080F4090:
	cmp r4, #0
	beq _080F4096
	strh r4, [r3]
_080F4096:
	ldrb r0, [r2]
	cmp r0, #0
	beq _080F40AA
	ldr r0, _080F4130 @ =0x0000FFF0
	ldrh r6, [r3]
	ands r0, r6
	strh r0, [r3]
	ldrb r1, [r2]
	orrs r0, r1
	strh r0, [r3]
_080F40AA:
	ldrb r0, [r2, #1]
	cmp r0, #0
	beq _080F40C0
	ldr r1, _080F4134 @ =0x0000FF0F
	ldrh r6, [r3]
	ands r1, r6
	strh r1, [r3]
	ldrb r6, [r2, #1]
	lsls r0, r6, #4
	orrs r1, r0
	strh r1, [r3]
_080F40C0:
	ldrb r0, [r2, #2]
	cmp r0, #0
	beq _080F40D6
	ldr r1, _080F4138 @ =0x0000F0FF
	ldrh r0, [r3]
	ands r1, r0
	strh r1, [r3]
	ldrb r6, [r2, #2]
	lsls r0, r6, #8
	orrs r1, r0
	strh r1, [r3]
_080F40D6:
	ldrb r0, [r2, #3]
	cmp r0, #0
	beq _080F40EC
	mov r1, sl
	ldrh r0, [r3]
	ands r1, r0
	strh r1, [r3]
	ldrb r6, [r2, #3]
	lsls r0, r6, #0xc
	orrs r1, r0
	strh r1, [r3]
_080F40EC:
	adds r2, #4
	adds r3, #2
	subs r5, #1
	cmp r5, #0
	bge _080F4090
	ldr r1, [sp, #8]
	ldr r2, _080F4128 @ =gUnk_02006ED0
	ldrh r2, [r2, #8]
	lsls r0, r2, #0x16
	lsrs r0, r0, #0x18
	cmp r1, r0
	blt _080F4082
_080F4104:
	ldr r3, [sp, #4]
	add r8, r3
	mov r2, sb
	ldr r5, _080F4128 @ =gUnk_02006ED0
	ldr r0, [r5, #8]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x18
	cmp r2, r0
	blt _080F4068
_080F4116:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F4128: .4byte gUnk_02006ED0
_080F412C: .4byte 0x00000FFF @ Catapult Turtle
_080F4130: .4byte 0x0000FFF0
_080F4134: .4byte 0x0000FF0F
_080F4138: .4byte 0x0000F0FF

	thumb_func_start sub_080F413C
sub_080F413C: @ 0x080F413C
	push {r4, r5, lr}
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r4, _080F4170 @ =gUnk_02006ED0
	movs r5, #0
	movs r3, #0xf
	ands r2, r3
	lsls r3, r2, #4
	orrs r3, r2
	lsls r2, r3, #8
	orrs r3, r2
	strh r3, [r4, #0x28]
	strh r1, [r4, #0x2a]
	str r0, [r4, #0x18]
	strh r5, [r4, #0x2c]
	strh r5, [r4, #0x2e]
	strh r5, [r4, #0x30]
	strh r5, [r4, #0x32]
	movs r0, #4
	ldrb r1, [r4, #0x15]
	orrs r0, r1
	strb r0, [r4, #0x15]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080F4170: .4byte gUnk_02006ED0

	thumb_func_start sub_080F4174
sub_080F4174: @ 0x080F4174
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	ldr r1, _080F4194 @ =gUnk_02006ED0
	movs r0, #0x80
	ldrb r2, [r1, #0x14]
	ands r0, r2
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r6, r1, #0
	cmp r2, #0
	beq _080F4198
	movs r0, #0
	b _080F4292
	.align 2, 0
_080F4194: .4byte gUnk_02006ED0
_080F4198:
	ldr r0, [r6, #0x18]
	str r0, [r6, #0x1c]
	strh r2, [r6, #0x2e]
	ldrh r7, [r6, #8]
	lsls r0, r7, #0x16
	lsrs r0, r0, #0x18
	cmp r2, r0
	bhs _080F4254
	adds r4, r6, #0
	ldr r0, _080F4280 @ =0x0000FFF0
	mov ip, r0
	ldr r1, _080F4284 @ =0x0000FF0F
	mov sb, r1
_080F41B2:
	ldrh r2, [r4, #0x32]
	lsls r0, r2, #6
	add r0, r8
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x30]
_080F41BE:
	ldrh r1, [r4, #0x28]
	cmp r1, #0
	beq _080F41C8
	ldr r0, [r6, #0x1c]
	strh r1, [r0]
_080F41C8:
	ldr r5, [r4, #0x20]
	ldrb r0, [r5]
	ldr r2, [r4, #0x1c]
	adds r3, r5, #0
	cmp r0, #0
	beq _080F41E2
	mov r0, ip
	ldrh r7, [r2]
	ands r0, r7
	strh r0, [r2]
	ldrb r1, [r3]
	orrs r0, r1
	strh r0, [r2]
_080F41E2:
	ldrb r0, [r3, #1]
	cmp r0, #0
	beq _080F41F8
	mov r0, sb
	ldrh r7, [r2]
	ands r0, r7
	strh r0, [r2]
	ldrb r7, [r3, #1]
	lsls r1, r7, #4
	orrs r0, r1
	strh r0, [r2]
_080F41F8:
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _080F420E
	ldr r0, _080F4288 @ =0x0000F0FF
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r7, [r3, #2]
	lsls r1, r7, #8
	orrs r0, r1
	strh r0, [r2]
_080F420E:
	ldrb r0, [r3, #3]
	cmp r0, #0
	beq _080F4224
	ldr r0, _080F428C @ =0x00000FFF (Catapult Turtle)
	ldrh r1, [r2]
	ands r0, r1
	strh r0, [r2]
	ldrb r3, [r3, #3]
	lsls r1, r3, #0xc
	orrs r0, r1
	strh r0, [r2]
_080F4224:
	adds r0, r5, #4
	str r0, [r4, #0x20]
	adds r0, r2, #2
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xf
	bls _080F41BE
	ldrh r0, [r4, #0x32]
	adds r0, #1
	strh r0, [r4, #0x32]
	ldrh r0, [r4, #0x2e]
	adds r0, #1
	strh r0, [r4, #0x2e]
	ldrh r2, [r4, #8]
	lsls r1, r2, #0x16
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x18
	cmp r0, r1
	blo _080F41B2
_080F4254:
	ldrh r7, [r6, #0x2a]
	lsls r1, r7, #5
	ldr r0, [r6, #0x18]
	adds r0, r0, r1
	str r0, [r6, #0x18]
	ldrh r1, [r6, #0x2c]
	adds r1, #1
	strh r1, [r6, #0x2c]
	ldr r0, [r6, #8]
	lsls r0, r0, #0xe
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsrs r0, r0, #0x18
	cmp r1, r0
	blo _080F4290
	movs r0, #5
	rsbs r0, r0, #0
	ldrb r1, [r6, #0x15]
	ands r0, r1
	strb r0, [r6, #0x15]
	movs r0, #0
	b _080F4292
	.align 2, 0
_080F4280: .4byte 0x0000FFF0
_080F4284: .4byte 0x0000FF0F
_080F4288: .4byte 0x0000F0FF
_080F428C: .4byte 0x00000FFF @ Catapult Turtle
_080F4290:
	movs r0, #1
_080F4292:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_080F42A0
sub_080F42A0: @ 0x080F42A0
	ldr r1, _080F42B0 @ =gUnk_02006ED0
	str r0, [r1]
	movs r0, #0x11
	rsbs r0, r0, #0
	ldrb r2, [r1, #0x15]
	ands r0, r2
	strb r0, [r1, #0x15]
	bx lr
	.align 2, 0
_080F42B0: .4byte gUnk_02006ED0

	thumb_func_start sub_080F42B4
sub_080F42B4: @ 0x080F42B4
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	adds r6, r1, #0
	adds r4, r2, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r5, _080F43A0 @ =gUnk_02006ED0
	ldr r2, _080F43A4 @ =0x0100001A
	mov r0, sp
	adds r1, r5, #0
	bl CpuSet
	mov r0, r8
	str r0, [r5]
	movs r0, #0xff
	ands r6, r0
	lsls r6, r6, #2
	ldr r0, _080F43A8 @ =0xFFFFFC03
	ldrh r1, [r5, #8]
	ands r0, r1
	orrs r0, r6
	strh r0, [r5, #8]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	movs r0, #0xff
	ands r4, r0
	lsls r4, r4, #0xa
	ldr r0, [r5, #8]
	ldr r1, _080F43AC @ =0xFFFC03FF
	ands r0, r1
	orrs r0, r4
	str r0, [r5, #8]
	movs r3, #2
	rsbs r3, r3, #0
	adds r4, r3, #0
	ldrb r2, [r5, #0x15]
	ands r4, r2
	movs r0, #0x7d
	rsbs r0, r0, #0
	ldrb r6, [r5, #0x14]
	ands r0, r6
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #0x14]
	movs r0, #3
	rsbs r0, r0, #0
	ands r4, r0
	strb r4, [r5, #0x15]
	ldrh r0, [r5, #8]
	lsls r1, r0, #0x16
	lsrs r1, r1, #0x18
	lsls r1, r1, #3
	ldr r2, _080F43B0 @ =0x000003FF
	adds r0, r2, #0
	ands r1, r0
	lsls r1, r1, #2
	ldr r0, _080F43B4 @ =0xFFFFF003
	ldrh r6, [r5, #0xa]
	ands r0, r6
	orrs r0, r1
	strh r0, [r5, #0xa]
	ldr r1, [r5, #8]
	lsls r1, r1, #0xe
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x13
	lsrs r2, r1, #0x10
	movs r0, #0xf
	ands r2, r0
	lsls r2, r2, #4
	ldrb r6, [r5, #0xb]
	ands r0, r6
	orrs r0, r2
	strb r0, [r5, #0xb]
	lsrs r1, r1, #0x14
	movs r0, #0x3f
	ands r1, r0
	subs r0, #0x7f
	ldrb r2, [r5, #0xc]
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #0xc]
	ldr r1, _080F43B8 @ =gUnk_02000000
	ldr r6, _080F43BC @ =0x00006C2C
	adds r1, r1, r6
	movs r0, #7
	ldrb r1, [r1]
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	ldrb r1, [r5, #8]
	ands r3, r1
	orrs r3, r0
	strb r3, [r5, #8]
	ldr r1, _080F43C0 @ =gUnk_09E5F854
	lsls r0, r3, #0x1e
	lsrs r0, r0, #0x1f
	lsls r0, r0, #2
	lsls r3, r3, #0x1f
	lsrs r3, r3, #0x1f
	lsls r3, r3, #3
	adds r0, r0, r3
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [r5, #4]
	movs r0, #0x10
	orrs r4, r0
	strb r4, [r5, #0x15]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080F43A0: .4byte gUnk_02006ED0
_080F43A4: .4byte 0x0100001A
_080F43A8: .4byte 0xFFFFFC03
_080F43AC: .4byte 0xFFFC03FF
_080F43B0: .4byte 0x000003FF
_080F43B4: .4byte 0xFFFFF003
_080F43B8: .4byte gUnk_02000000
_080F43BC: .4byte 0x00006C2C
_080F43C0: .4byte gUnk_09E5F854

	thumb_func_start sub_080F43C4
sub_080F43C4: @ 0x080F43C4
	push {r4, lr}
	adds r3, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r4, #0x1f
	movs r1, #0x1f
	movs r2, #0x1f
	subs r0, #1
	cmp r0, #7
	bhi _080F4430
	lsls r0, r0, #2
	ldr r1, _080F43E4 @ =_080F43E8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080F43E4: .4byte _080F43E8
_080F43E8: @ jump table
	.4byte _080F4408 @ case 0
	.4byte _080F4410 @ case 1
	.4byte _080F4416 @ case 2
	.4byte _080F441C @ case 3
	.4byte _080F441C @ case 4
	.4byte _080F4424 @ case 5
	.4byte _080F442A @ case 6
	.4byte _080F4424 @ case 7
_080F4408:
	movs r4, #0x1f
	movs r1, #0x17
	movs r2, #0
	b _080F4430
_080F4410:
	movs r4, #0
	movs r1, #0x1f
	b _080F442E
_080F4416:
	movs r4, #0
	movs r1, #0x1f
	b _080F442E
_080F441C:
	movs r4, #0x1f
	movs r1, #1
	movs r2, #0
	b _080F4430
_080F4424:
	movs r4, #0
	movs r1, #0x1f
	b _080F442E
_080F442A:
	movs r4, #0x1f
	movs r1, #0
_080F442E:
	movs r2, #0x1f
_080F4430:
	cmp r3, #0
	beq _080F445A
	lsls r0, r2, #1
	adds r0, r0, r2
	asrs r0, r0, #2
	movs r2, #0x1f
	ands r0, r2
	lsls r3, r0, #0xa
	lsls r0, r1, #1
	adds r0, r0, r1
	asrs r0, r0, #2
	ands r0, r2
	lsls r1, r0, #5
	orrs r1, r3
	lsls r0, r4, #1
	adds r0, r0, r4
	asrs r0, r0, #2
	ands r0, r2
	orrs r1, r0
	adds r0, r1, #0
	b _080F4462
_080F445A:
	lsls r0, r2, #0xa
	lsls r1, r1, #5
	orrs r0, r1
	orrs r0, r4
_080F4462:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_080F4468
sub_080F4468: @ 0x080F4468
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r2, #1
	ldr r3, _080F453C @ =gUnk_095B7CCA
	ldrh r0, [r3]
	cmp r2, r0
	bhi _080F4496
	ldr r5, _080F4540 @ =gUnk_02000006
	movs r6, #0xf
	movs r4, #0x30
_080F447C:
	lsls r0, r2, #1
	adds r0, r0, r5
	adds r1, r6, #0
	ldrb r7, [r0]
	ands r1, r7
	orrs r1, r4
	strb r1, [r0]
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r3]
	cmp r2, r0
	bls _080F447C
_080F4496:
	movs r0, #9
	bl sub_080EF14C
	ldr r5, _080F4544 @ =gUnk_02001138
	movs r4, #0x8c
	lsls r4, r4, #1
	adds r0, r5, #0
	adds r1, r4, #0
	bl MemoryClearHalfWord
	adds r5, r5, r4
	adds r0, r5, #0
	adds r1, r4, #0
	bl MemoryClearHalfWord
	ldr r1, _080F4548 @ =0x000059DC
	adds r4, r5, r1
	ldrb r7, [r4]
	lsls r0, r7, #0x1d
	lsrs r0, r0, #0x1d
	movs r6, #0
	strb r0, [r5, #0x17]
	ldr r0, _080F454C @ =0x000005E6
	bl GetInterfaceTextIdIndex
	ldr r2, _080F4550 @ =gInterfaceTextOffsets
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #1
	ldrb r4, [r4]
	lsls r0, r4, #0x1d
	lsrs r0, r0, #0x1d
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	ldr r0, _080F4554 @ =gInterfaceText
	adds r1, r1, r0
	adds r0, r5, #0
	movs r2, #0x16
	bl strncpy
	strb r6, [r5, #0x16]
	ldr r7, _080F4558 @ =gStarterDeckTrunk
_080F44F2:
	lsls r0, r6, #1
	str r0, [sp]
	ldrh r0, [r7]
	bl sub_080EE76C
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r0, r4, #0
	movs r1, #1
	bl sub_080F9054
	adds r0, r5, #0
	adds r0, #0x1c
	ldr r1, [sp]
	adds r0, r0, r1
	strh r4, [r0]
	adds r7, #2
	adds r6, #1
	cmp r6, #0x27
	bls _080F44F2
	movs r0, #0
	strb r6, [r5, #0x18]
	strb r0, [r5, #0x19]
	strb r0, [r5, #0x1a]
	ldr r1, _080F455C @ =gUnk_02000000
	ldr r7, _080F4560 @ =0x000053F0
	adds r1, r1, r7
	ldr r0, [r1]
	movs r2, #1
	orrs r0, r2
	str r0, [r1]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080F453C: .4byte gUnk_095B7CCA
_080F4540: .4byte gUnk_02000006
_080F4544: .4byte gUnk_02001138
_080F4548: .4byte 0x000059DC
_080F454C: .4byte 0x000005E6
_080F4550: .4byte gInterfaceTextOffsets
_080F4554: .4byte gInterfaceText
_080F4558: .4byte gStarterDeckTrunk
_080F455C: .4byte gUnk_02000000
_080F4560: .4byte 0x000053F0

	thumb_func_start sub_080F4564
sub_080F4564: @ 0x080F4564
	push {r4, r5, r6, r7, lr}
	ldr r0, _080F4578 @ =gUnk_02006C3C
	movs r1, #0xfc
	lsls r1, r1, #1
	bl MemoryClearHalfWord
	movs r5, #0
	movs r6, #3
	ldr r4, _080F457C @ =gUnk_09E5E80C
	b _080F45B8
	.align 2, 0
_080F4578: .4byte gUnk_02006C3C
_080F457C: .4byte gUnk_09E5E80C
_080F4580:
	ldrh r0, [r4]
	bl sub_080E17BC
	cmp r0, #0
	beq _080F45B4
	ldr r0, _080F45D0 @ =gUnk_02000000
	lsls r3, r5, #2
	adds r3, r3, r0
	ldr r0, _080F45D4 @ =0x00006C3C
	adds r3, r3, r0
	movs r0, #3
	ldrb r1, [r3]
	orrs r0, r1
	strb r0, [r3]
	ldr r2, [r3]
	ands r2, r6
	ldr r0, _080F45D8 @ =0x0000E0FC
	orrs r2, r0
	lsrs r0, r2, #2
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_080F45B4:
	adds r4, #0xc
	adds r5, #1
_080F45B8:
	bl sub_080E1788
	cmp r5, r0
	blt _080F4580
	movs r5, #0
	movs r7, #3
	ldr r6, _080F45DC @ =gUnk_09E5E620
	ldr r0, _080F45D0 @ =gUnk_02000000
	ldr r1, _080F45E0 @ =0x00006CC8
	adds r4, r0, r1
	b _080F4614
	.align 2, 0
_080F45D0: .4byte gUnk_02000000
_080F45D4: .4byte 0x00006C3C
_080F45D8: .4byte 0x0000E0FC
_080F45DC: .4byte gUnk_09E5E620
_080F45E0: .4byte 0x00006CC8
_080F45E4:
	ldrh r0, [r6]
	bl sub_080E1020
	cmp r0, #0
	beq _080F460E
	movs r0, #3
	ldrb r1, [r4]
	orrs r0, r1
	strb r0, [r4]
	ldr r2, [r4]
	ands r2, r7
	ldr r0, _080F4624 @ =0x0000E0FC
	orrs r2, r0
	lsrs r0, r2, #2
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r0, r7, #0
	ands r0, r2
	orrs r0, r1
	str r0, [r4]
_080F460E:
	adds r6, #0xc
	adds r4, #4
	adds r5, #1
_080F4614:
	bl sub_080E0FEC
	cmp r5, r0
	blt _080F45E4
	movs r5, #0
	movs r6, #3
	ldr r4, _080F4628 @ =gUnk_09E5E9CC
	b _080F468C
	.align 2, 0
_080F4624: .4byte 0x0000E0FC
_080F4628: .4byte gUnk_09E5E9CC
_080F462C:
	ldrh r0, [r4]
	bl gEngineEffectSpecialSummonDestroy_080E328C
	cmp r0, #0
	beq _080F4688
	ldr r0, _080F4658 @ =gUnk_02000000
	adds r1, r5, #0
	adds r1, #0x4c
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, _080F465C @ =0x00006C3C
	adds r3, r1, r0
	movs r0, #3
	ldrb r1, [r3]
	orrs r0, r1
	strb r0, [r3]
	ldrh r0, [r4, #8]
	cmp r0, #4
	beq _080F4660
	cmp r0, #7
	beq _080F4668
	b _080F4694
	.align 2, 0
_080F4658: .4byte gUnk_02000000
_080F465C: .4byte 0x00006C3C
_080F4660:
	ldr r0, [r3]
	ands r0, r6
	str r0, [r3]
	b _080F4694
_080F4668:
	ldr r2, [r3]
	ands r2, r6
	ldr r0, _080F4684 @ =0x0000E0FC
	orrs r2, r0
	lsrs r0, r2, #2
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	b _080F4694
	.align 2, 0
_080F4684: .4byte 0x0000E0FC
_080F4688:
	adds r4, #0xc
	adds r5, #1
_080F468C:
	bl sub_080E3258
	cmp r5, r0
	blt _080F462C
_080F4694:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_080F469C
sub_080F469C: @ 0x080F469C
	push {r4, lr}
	ldr r4, _080F46D8 @ =gUnk_02006C30
	adds r0, r4, #0
	movs r1, #8
	bl MemoryClearHalfWord
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r4]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4]
	movs r1, #3
	adds r0, r4, #3
_080F46CA:
	strb r1, [r0, #4]
	subs r0, #1
	cmp r0, r4
	bge _080F46CA
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F46D8: .4byte gUnk_02006C30

	thumb_func_start sub_080F46DC
sub_080F46DC: @ 0x080F46DC
	push {lr}
	ldr r0, _080F46F8 @ =gUnk_02000000
	ldr r1, _080F46FC @ =0x00006ED0
	bl MemoryClearHalfWord
	ldr r0, _080F4700 @ =0x080000AE
	ldrh r0, [r0]
	lsrs r0, r0, #8
	cmp r0, #0x4a
	bne _080F4704
	movs r0, #0
	bl SetLanguage
	b _080F470A
	.align 2, 0
_080F46F8: .4byte gUnk_02000000
_080F46FC: .4byte 0x00006ED0
_080F4700: .4byte 0x080000AE
_080F4704:
	movs r0, #1
	bl SetLanguage
_080F470A:
	bl sub_080F4468
	bl sub_080F4564
	bl sub_080F469C
	ldr r1, _080F472C @ =gUnk_02000000
	ldr r0, _080F4730 @ =0x00006C38
	adds r2, r1, r0
	ldr r0, _080F4734 @ =0x00000BB8
	str r0, [r2]
	ldr r0, _080F4738 @ =0x00006E5C
	adds r1, r1, r0
	movs r0, #7
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080F472C: .4byte gUnk_02000000
_080F4730: .4byte 0x00006C38
_080F4734: .4byte 0x00000BB8
_080F4738: .4byte 0x00006E5C

	thumb_func_start sub_080F473C
sub_080F473C: @ 0x080F473C
	push {r4, lr}
	ldr r0, _080F475C @ =gUnk_02000000
	ldr r1, _080F4760 @ =0x00006C2C
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r4, r0, #0x1d
	lsrs r4, r4, #0x1d
	bl sub_080F46DC
	adds r0, r4, #0
	bl SetLanguage
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080F475C: .4byte gUnk_02000000
_080F4760: .4byte 0x00006C2C
