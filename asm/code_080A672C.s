
	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start gEngineEffectSpecialSummonNegate_080A672C
gEngineEffectSpecialSummonNegate_080A672C: @ 0x080A672C
	push {r4, r5, r6, r7, lr}
	ldr r6, _080A6750 @ =gUnk_0201E4D0
	ldrb r0, [r6, #0x13]
	lsrs r1, r0, #1
	movs r7, #1
	adds r0, r7, #0
	ldrb r2, [r6, #0x14]
	ands r0, r2
	lsls r0, r0, #7
	orrs r0, r1
	cmp r0, #1
	beq _080A6798
	cmp r0, #1
	bgt _080A6754
	cmp r0, #0
	beq _080A675A
	b _080A6892
	.align 2, 0
_080A6750: .4byte gUnk_0201E4D0
_080A6754:
	cmp r0, #2
	beq _080A6808
	b _080A6892
_080A675A:
	strb r0, [r6, #8]
	ldrb r1, [r6]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	movs r1, #0x12
	bl gEngineEffectSpecialSummon_08093390
	ldrb r3, [r6, #0x13]
	lsrs r0, r3, #1
	adds r1, r7, #0
	ldrb r2, [r6, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
_080A6778:
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	adds r0, r7, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r6, #0x13]
	lsrs r1, r1, #7
	ands r1, r7
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r6, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #0x14]
	b _080A6892
_080A6798:
	ldr r1, _080A67BC @ =gUnk_0201E2A0
	ldrb r2, [r6]
	lsls r0, r2, #0x1f
	lsrs r3, r0, #0x1f
	lsls r0, r3, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #1
	bne _080A67C4
	ldr r1, [r6]
	lsls r1, r1, #9
	lsrs r1, r1, #0x11
	ldr r2, _080A67C0 @ =gEngineEffectSpecialSummon_080A5714
	adds r0, r3, #0
	bl gEngineEffectSpecialSummonGraveyard_080B70AC
	b _080A67CA
	.align 2, 0
_080A67BC: .4byte gUnk_0201E2A0
_080A67C0: .4byte gEngineEffectSpecialSummon_080A5714
_080A67C4:
	ldr r0, _080A6800 @ =gEngineEffectSpecialSummon_080A5714
	bl sub_080969C4
_080A67CA:
	ldr r3, _080A6804 @ =gUnk_0201E4D0
	ldrb r5, [r3, #0x13]
	lsrs r0, r5, #1
	movs r4, #1
	adds r1, r4, #0
	ldrb r2, [r3, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	adds r0, r4, #0
	ands r0, r5
	orrs r0, r2
	strb r0, [r3, #0x13]
	lsrs r1, r1, #7
	ands r1, r4
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x14]
	b _080A6892
	.align 2, 0
_080A6800: .4byte gEngineEffectSpecialSummon_080A5714
_080A6804: .4byte gUnk_0201E4D0
_080A6808:
	bl sub_08096B14
	cmp r0, #0
	beq _080A6880
	ldr r0, _080A6874 @ =gUnk_0201C4E0
	ldr r2, _080A6878 @ =0x00001D68
	adds r1, r0, r2
	ldr r5, [r1]
	adds r2, #4
	adds r1, r0, r2
	adds r2, #4
	adds r0, r0, r2
	ldr r4, [r1]
	ldr r0, [r0]
	adds r4, r4, r0
	movs r0, #0x28
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl gEngineEffectSpecialSummon_0801EC9C
	ldrb r0, [r6, #8]
	lsls r1, r0, #1
	adds r0, r6, #0
	adds r0, #0xc
	adds r1, r1, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x10
	orrs r5, r4
	strh r5, [r1]
	ldrb r4, [r6, #8]
	adds r4, #1
	strb r4, [r6, #8]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, [r6]
	lsls r0, r0, #9
	lsrs r0, r0, #0x11
	bl gEngineEffectSpecialSummonNegate_080A3B50
	cmp r4, r0
	bge _080A687C
	ldrb r3, [r6, #0x13]
	lsrs r0, r3, #1
	adds r1, r7, #0
	ldrb r2, [r6, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	subs r1, #1
	b _080A6778
	.align 2, 0
_080A6874: .4byte gUnk_0201C4E0
_080A6878: .4byte 0x00001D68
_080A687C:
	movs r0, #1
	b _080A6894
_080A6880:
	movs r0, #0x29
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl gEngineEffectSpecialSummon_0801EC9C
	movs r0, #1
	rsbs r0, r0, #0
	b _080A6894
_080A6892:
	movs r0, #0
_080A6894:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	@ Metamorphosis
	thumb_func_start gEngineEffectSpecialSummonFusion_080A689C
gEngineEffectSpecialSummonFusion_080A689C: @ 0x080A689C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	ldr r0, _080A68C8 @ =gUnk_0201E4D0
	mov sb, r0
	ldrb r2, [r0, #0x13]
	lsrs r1, r2, #1
	movs r0, #1
	mov r3, sb
	ldrb r3, [r3, #0x14]
	ands r0, r3
	lsls r7, r0, #7
	orrs r7, r1
	cmp r7, #1
	beq _080A6950
	cmp r7, #1
	bgt _080A68CC
	cmp r7, #0
	beq _080A68D4
	b _080A6A12
	.align 2, 0
_080A68C8: .4byte gUnk_0201E4D0
_080A68CC:
	cmp r7, #2
	bne _080A68D2
	b _080A6A0E
_080A68D2:
	b _080A6A12
_080A68D4:
	ldr r1, _080A68FC @ =gUnk_0201E2A0
	mov r2, sb
	ldrb r2, [r2]
	lsls r0, r2, #0x1f
	lsrs r3, r0, #0x1f
	lsls r0, r3, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #1
	bne _080A6904
	mov r0, sb
	ldr r1, [r0]
	lsls r1, r1, #9
	lsrs r1, r1, #0x11
	ldr r2, _080A6900 @ =gEngineEffectSpecialSummonGraveyard_080A57B8
	adds r0, r3, #0
	bl gEngineEffectSpecialSummonGraveyard_080B70AC
	b _080A6912
	.align 2, 0
_080A68FC: .4byte gUnk_0201E2A0
_080A6900: .4byte gEngineEffectSpecialSummonGraveyard_080A57B8
_080A6904:
	adds r0, r3, #0
	movs r1, #0x3a
	bl gEngineEffectSpecialSummon_08093390
	ldr r0, _080A6948 @ =gEngineEffectSpecialSummonGraveyard_080A57B8
	bl sub_080969C4
_080A6912:
	ldr r3, _080A694C @ =gUnk_0201E4D0
	ldrb r5, [r3, #0x13]
	lsrs r0, r5, #1
	movs r4, #1
	adds r1, r4, #0
	ldrb r2, [r3, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	adds r0, r4, #0
	ands r0, r5
	orrs r0, r2
	strb r0, [r3, #0x13]
	lsrs r1, r1, #7
	ands r1, r4
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x14]
	b _080A6A12
	.align 2, 0
_080A6948: .4byte gEngineEffectSpecialSummonGraveyard_080A57B8
_080A694C: .4byte gUnk_0201E4D0
_080A6950:
	bl sub_08096B14
	cmp r0, #0
	beq _080A6A08
	ldr r5, _080A69F0 @ =gUnk_0201C4E0
	ldr r3, _080A69F4 @ =0x00001D68
	adds r0, r5, r3
	ldr r0, [r0]
	mov r8, r0
	ldr r1, _080A69F8 @ =0x00001D6C
	adds r0, r5, r1
	ldr r2, _080A69FC @ =0x00001D70
	adds r1, r5, r2
	ldr r4, [r0]
	ldr r0, [r1]
	adds r4, r4, r0
	mov r3, sb
	ldrb r3, [r3]
	lsls r0, r3, #0x1f
	lsrs r0, r0, #0x1f
	ldr r1, _080A6A00 @ =0x000015A3 (Metamorphosis)
	bl gEngineEffectBoostATKBoostDEF_08037A8C
	adds r6, r0, #0
	bl sub_0804A76C
	mov r0, r8
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl gEngineEffectBoostATKBoostDEF_08047E20
	mov r1, sb
	ldrb r1, [r1]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	adds r1, r0, #0
	ands r1, r7
	ldr r2, _080A6A04 @ =0x00000868
	muls r1, r2, r1
	movs r2, #0x90
	lsls r2, r2, #1
	adds r5, r5, r2
	adds r1, r1, r5
	lsls r6, r6, #2
	adds r1, r1, r6
	movs r2, #0
	bl gEngineEffectBanishSendToGY_080445A4
	bl sub_0804A870
	mov r3, sb
	ldrb r4, [r3, #0x13]
	lsrs r0, r4, #1
	adds r1, r7, #0
	ldrb r2, [r3, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	movs r3, #1
	adds r0, r7, #0
	ands r0, r4
	orrs r0, r2
	mov r2, sb
	strb r0, [r2, #0x13]
	lsrs r1, r1, #7
	ands r1, r7
	ands r1, r3
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r2, #0x14]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #0x14]
	b _080A6A12
	.align 2, 0
_080A69F0: .4byte gUnk_0201C4E0
_080A69F4: .4byte 0x00001D68
_080A69F8: .4byte 0x00001D6C
_080A69FC: .4byte 0x00001D70
_080A6A00: .4byte 0x000015A3 @ Metamorphosis
_080A6A04: .4byte 0x00000868
_080A6A08:
	movs r0, #1
	rsbs r0, r0, #0
	b _080A6A14
_080A6A0E:
	movs r0, #1
	b _080A6A14
_080A6A12:
	movs r0, #0
_080A6A14:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start gEngineEffectSpecialSummonBoostATK_080A6A20
gEngineEffectSpecialSummonBoostATK_080A6A20: @ 0x080A6A20
	push {r4, r5, r6, lr}
	ldr r6, _080A6A40 @ =gUnk_0201E4D0
	ldrb r0, [r6, #0x13]
	lsrs r1, r0, #1
	movs r0, #1
	ldrb r2, [r6, #0x14]
	ands r0, r2
	lsls r5, r0, #7
	orrs r5, r1
	cmp r5, #1
	beq _080A6AC4
	cmp r5, #1
	bgt _080A6A44
	cmp r5, #0
	beq _080A6A4A
	b _080A6B2E
	.align 2, 0
_080A6A40: .4byte gUnk_0201E4D0
_080A6A44:
	cmp r5, #2
	beq _080A6B2A
	b _080A6B2E
_080A6A4A:
	ldr r1, _080A6A70 @ =gUnk_0201E2A0
	ldrb r3, [r6]
	lsls r0, r3, #0x1f
	lsrs r3, r0, #0x1f
	lsls r0, r3, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #1
	bne _080A6A78
	ldr r1, [r6]
	lsls r1, r1, #9
	lsrs r1, r1, #0x11
	ldr r2, _080A6A74 @ =gEngineEffectSpecialSummonGraveyard_080A57B8
	adds r0, r3, #0
	bl gEngineEffectSpecialSummonGraveyard_080B70AC
	b _080A6A86
	.align 2, 0
_080A6A70: .4byte gUnk_0201E2A0
_080A6A74: .4byte gEngineEffectSpecialSummonGraveyard_080A57B8
_080A6A78:
	adds r0, r3, #0
	movs r1, #0x7e
	bl gEngineEffectSpecialSummon_08093390
	ldr r0, _080A6ABC @ =gEngineEffectSpecialSummonGraveyard_080A57B8
	bl sub_080969C4
_080A6A86:
	ldr r3, _080A6AC0 @ =gUnk_0201E4D0
	ldrb r5, [r3, #0x13]
	lsrs r0, r5, #1
	movs r4, #1
	adds r1, r4, #0
	ldrb r2, [r3, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	adds r0, r4, #0
	ands r0, r5
	orrs r0, r2
	strb r0, [r3, #0x13]
	lsrs r1, r1, #7
	ands r1, r4
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x14]
	b _080A6B2E
	.align 2, 0
_080A6ABC: .4byte gEngineEffectSpecialSummonGraveyard_080A57B8
_080A6AC0: .4byte gUnk_0201E4D0
_080A6AC4:
	bl sub_08096B14
	cmp r0, #0
	beq _080A6B24
	ldr r2, _080A6B1C @ =gUnk_0201C4E0
	ldr r3, _080A6B20 @ =0x00001D68
	adds r0, r2, r3
	ldr r0, [r0]
	adds r3, #4
	adds r1, r2, r3
	adds r3, #4
	adds r2, r2, r3
	ldr r1, [r1]
	ldr r2, [r2]
	adds r1, r1, r2
	movs r2, #0
	bl gEngineEffectBoostATKBoostDEF_08047A38
	ldrb r4, [r6, #0x13]
	lsrs r0, r4, #1
	adds r1, r5, #0
	ldrb r2, [r6, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	movs r3, #1
	adds r0, r5, #0
	ands r0, r4
	orrs r0, r2
	strb r0, [r6, #0x13]
	lsrs r1, r1, #7
	ands r1, r5
	ands r1, r3
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r3, [r6, #0x14]
	ands r0, r3
	orrs r0, r1
	strb r0, [r6, #0x14]
	b _080A6B2E
	.align 2, 0
_080A6B1C: .4byte gUnk_0201C4E0
_080A6B20: .4byte 0x00001D68
_080A6B24:
	movs r0, #1
	rsbs r0, r0, #0
	b _080A6B30
_080A6B2A:
	movs r0, #1
	b _080A6B30
_080A6B2E:
	movs r0, #0
_080A6B30:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start gEngineEffectSpecialSummonGraveyard_080A6B38
gEngineEffectSpecialSummonGraveyard_080A6B38: @ 0x080A6B38
	push {r4, r5, r6, r7, lr}
	sub sp, #0x100
	ldr r7, _080A6B58 @ =gUnk_0201E4D0
	ldrb r0, [r7, #0x13]
	lsrs r1, r0, #1
	movs r0, #1
	ldrb r2, [r7, #0x14]
	ands r0, r2
	lsls r6, r0, #7
	orrs r6, r1
	cmp r6, #0
	beq _080A6B5C
	cmp r6, #1
	beq _080A6BF0
	movs r0, #0
	b _080A6C84
	.align 2, 0
_080A6B58: .4byte gUnk_0201E4D0
_080A6B5C:
	ldr r1, _080A6B80 @ =gUnk_0201E2A0
	ldrb r2, [r7]
	lsls r0, r2, #0x1f
	lsrs r3, r0, #0x1f
	lsls r0, r3, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #1
	bne _080A6B88
	ldr r1, [r7]
	lsls r1, r1, #9
	lsrs r1, r1, #0x11
	ldr r2, _080A6B84 @ =gEngineEffectSpecialSummon_080A585C
	adds r0, r3, #0
	bl gEngineEffectSpecialSummonGraveyard_080B70AC
	b _080A6BAE
	.align 2, 0
_080A6B80: .4byte gUnk_0201E2A0
_080A6B84: .4byte gEngineEffectSpecialSummon_080A585C
_080A6B88:
	ldrb r1, [r7, #8]
	ldr r2, _080A6BE4 @ =0x00001119 (Sanga of the Thunder)
	adds r0, r1, r2
	bl sub_080EEBFC
	adds r2, r0, #0
	mov r0, sp
	movs r1, #0xd2
	bl sub_0801F2C4
	ldrb r7, [r7]
	lsls r0, r7, #0x1f
	lsrs r0, r0, #0x1f
	mov r1, sp
	bl gEngineEffectSpecialSummon_08093390
	ldr r0, _080A6BE8 @ =gEngineEffectSpecialSummon_080A585C
	bl sub_080969C4
_080A6BAE:
	ldr r3, _080A6BEC @ =gUnk_0201E4D0
	ldrb r5, [r3, #0x13]
	lsrs r0, r5, #1
	movs r4, #1
	adds r1, r4, #0
	ldrb r2, [r3, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	adds r0, r4, #0
	ands r0, r5
	orrs r0, r2
	strb r0, [r3, #0x13]
	lsrs r1, r1, #7
	ands r1, r4
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x14]
	movs r0, #0
	b _080A6C84
	.align 2, 0
_080A6BE4: .4byte 0x00001119 @ Sanga of the Thunder
_080A6BE8: .4byte gEngineEffectSpecialSummon_080A585C
_080A6BEC: .4byte gUnk_0201E4D0
_080A6BF0:
	bl sub_08096B14
	cmp r0, #0
	beq _080A6C80
	ldr r0, _080A6C74 @ =gUnk_0201C4E0
	ldr r2, _080A6C78 @ =0x00001D68
	adds r1, r0, r2
	ldr r5, [r1]
	adds r2, #4
	adds r1, r0, r2
	adds r2, #4
	adds r0, r0, r2
	ldr r4, [r1]
	ldr r0, [r0]
	adds r4, r4, r0
	movs r0, #0x28
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl gEngineEffectSpecialSummon_0801EC9C
	ldrb r0, [r7, #8]
	lsls r1, r0, #1
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r1, r0
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x10
	orrs r5, r4
	strh r5, [r1]
	ldrb r0, [r7, #8]
	adds r0, #1
	strb r0, [r7, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _080A6C7C
	ldrb r4, [r7, #0x13]
	lsrs r0, r4, #1
	adds r1, r6, #0
	ldrb r2, [r7, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	subs r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	movs r3, #1
	adds r0, r6, #0
	ands r0, r4
	orrs r0, r2
	strb r0, [r7, #0x13]
	lsrs r1, r1, #7
	ands r1, r6
	ands r1, r3
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r7, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #0x14]
	movs r0, #0
	b _080A6C84
	.align 2, 0
_080A6C74: .4byte gUnk_0201C4E0
_080A6C78: .4byte 0x00001D68
_080A6C7C:
	movs r0, #1
	b _080A6C84
_080A6C80:
	movs r0, #1
	rsbs r0, r0, #0
_080A6C84:
	add sp, #0x100
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start gEngineEffectSpecialSummonDiscard_080A6C8C
gEngineEffectSpecialSummonDiscard_080A6C8C: @ 0x080A6C8C
	push {r4, r5, lr}
	ldr r2, _080A6CC4 @ =gUnk_0201E4D0
	ldrb r3, [r2, #0x13]
	lsrs r1, r3, #1
	movs r4, #1
	adds r0, r4, #0
	ldrb r5, [r2, #0x14]
	ands r0, r5
	lsls r0, r0, #7
	orrs r0, r1
	cmp r0, #0
	bne _080A6CB8
	adds r0, r4, #0
	ands r0, r3
	movs r1, #0x3c
	orrs r0, r1
	strb r0, [r2, #0x13]
	movs r0, #2
	rsbs r0, r0, #0
	adds r1, r5, #0
	ands r0, r1
	strb r0, [r2, #0x14]
_080A6CB8:
	bl gEngineEffectSpecialSummonDiscard_080A5F7C
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A6CC4: .4byte gUnk_0201E4D0

	thumb_func_start gEngineEffectGraveyardDraw_080A6CC8
gEngineEffectGraveyardDraw_080A6CC8: @ 0x080A6CC8
	push {r4, r5, r6, lr}
	sub sp, #0x100
	ldr r6, _080A6CEC @ =gUnk_0201E4D0
	ldrb r0, [r6, #0x13]
	lsrs r1, r0, #1
	movs r0, #1
	ldrb r2, [r6, #0x14]
	ands r0, r2
	lsls r5, r0, #7
	orrs r5, r1
	cmp r5, #1
	beq _080A6D90
	cmp r5, #1
	bgt _080A6CF0
	cmp r5, #0
	beq _080A6CF8
	b _080A6E68
	.align 2, 0
_080A6CEC: .4byte gUnk_0201E4D0
_080A6CF0:
	cmp r5, #2
	bne _080A6CF6
	b _080A6E60
_080A6CF6:
	b _080A6E68
_080A6CF8:
	ldr r1, _080A6D1C @ =gUnk_0201E2A0
	ldrb r2, [r6]
	lsls r0, r2, #0x1f
	lsrs r3, r0, #0x1f
	lsls r0, r3, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #1
	bne _080A6D24
	ldr r1, [r6]
	lsls r1, r1, #9
	lsrs r1, r1, #0x11
	ldr r2, _080A6D20 @ =gEngineEffectSpecialSummon_080A5994
	adds r0, r3, #0
	bl gEngineEffectSpecialSummonGraveyard_080B70AC
	b _080A6D4E
	.align 2, 0
_080A6D1C: .4byte gUnk_0201E2A0
_080A6D20: .4byte gEngineEffectSpecialSummon_080A5994
_080A6D24:
	ldr r1, _080A6D84 @ =gUnk_09E478BC
	ldrb r2, [r6, #8]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bl sub_080EEBFC
	adds r2, r0, #0
	mov r0, sp
	movs r1, #0xd3
	bl sub_0801F2C4
	ldrb r6, [r6]
	lsls r0, r6, #0x1f
	lsrs r0, r0, #0x1f
	mov r1, sp
	bl gEngineEffectSpecialSummon_08093390
	ldr r0, _080A6D88 @ =gEngineEffectSpecialSummon_080A5994
	bl sub_080969C4
_080A6D4E:
	ldr r3, _080A6D8C @ =gUnk_0201E4D0
	ldrb r5, [r3, #0x13]
	lsrs r0, r5, #1
	movs r4, #1
	adds r1, r4, #0
	ldrb r2, [r3, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	adds r0, r4, #0
	ands r0, r5
	orrs r0, r2
	strb r0, [r3, #0x13]
	lsrs r1, r1, #7
	ands r1, r4
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x14]
	b _080A6E68
	.align 2, 0
_080A6D84: .4byte gUnk_09E478BC
_080A6D88: .4byte gEngineEffectSpecialSummon_080A5994
_080A6D8C: .4byte gUnk_0201E4D0
_080A6D90:
	bl sub_08096B14
	cmp r0, #0
	beq _080A6E2C
	ldr r0, _080A6DBC @ =gUnk_0201C4E0
	ldr r2, _080A6DC0 @ =0x00001D68
	adds r1, r0, r2
	ldr r3, [r1]
	adds r2, #4
	adds r1, r0, r2
	ldr r2, [r1]
	ldr r1, _080A6DC4 @ =0x00001D70
	adds r0, r0, r1
	ldr r1, [r0]
	cmp r2, #0xb
	bne _080A6DC8
	adds r0, r3, #0
	movs r2, #0
	bl gEngineEffectSendToGYGraveyard_0804448C
	b _080A6DD0
	.align 2, 0
_080A6DBC: .4byte gUnk_0201C4E0
_080A6DC0: .4byte 0x00001D68
_080A6DC4: .4byte 0x00001D70
_080A6DC8:
	adds r1, r2, r1
	adds r0, r3, #0
	bl gEngineEffectDrawDiscard_08047D28
_080A6DD0:
	ldr r5, _080A6E14 @ =gUnk_0201E4D0
	ldrb r0, [r5, #8]
	adds r0, #1
	strb r0, [r5, #8]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #2
	bhi _080A6E18
	ldrb r4, [r5, #0x13]
	lsrs r0, r4, #1
	movs r3, #1
	adds r1, r3, #0
	ldrb r2, [r5, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	subs r1, #1
_080A6DF2:
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	adds r0, r3, #0
	ands r0, r4
	orrs r0, r2
	strb r0, [r5, #0x13]
	lsrs r1, r1, #7
	ands r1, r3
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r5, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r5, #0x14]
	b _080A6E68
	.align 2, 0
_080A6E14: .4byte gUnk_0201E4D0
_080A6E18:
	ldrb r4, [r5, #0x13]
	lsrs r0, r4, #1
	movs r3, #1
	adds r1, r3, #0
	ldrb r2, [r5, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
	b _080A6DF2
_080A6E2C:
	ldrb r4, [r6, #0x13]
	lsrs r0, r4, #1
	adds r1, r5, #0
	ldrb r2, [r6, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	subs r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	movs r3, #1
	adds r0, r5, #0
	ands r0, r4
	orrs r0, r2
	strb r0, [r6, #0x13]
	lsrs r1, r1, #7
	ands r1, r5
	ands r1, r3
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r6, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #0x14]
	b _080A6E68
_080A6E60:
	movs r0, #0
	strb r0, [r6, #8]
	movs r0, #1
	b _080A6E6A
_080A6E68:
	movs r0, #0
_080A6E6A:
	add sp, #0x100
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start gEngineEffectSpecialSummonGraveyard_080A6E74
gEngineEffectSpecialSummonGraveyard_080A6E74: @ 0x080A6E74
	push {r4, r5, r6, r7, lr}
	ldr r4, _080A6E9C @ =0xFFFFFE00
	add sp, r4
	ldr r6, _080A6EA0 @ =gUnk_0201E4D0
	ldrb r0, [r6, #0x13]
	lsrs r1, r0, #1
	movs r7, #1
	adds r0, r7, #0
	ldrb r2, [r6, #0x14]
	ands r0, r2
	lsls r0, r0, #7
	orrs r0, r1
	cmp r0, #1
	beq _080A6F58
	cmp r0, #1
	bgt _080A6EA4
	cmp r0, #0
	beq _080A6EB2
	b _080A7056
	.align 2, 0
_080A6E9C: .4byte 0xFFFFFE00
_080A6EA0: .4byte gUnk_0201E4D0
_080A6EA4:
	cmp r0, #2
	bne _080A6EAA
	b _080A6FCE
_080A6EAA:
	cmp r0, #3
	bne _080A6EB0
	b _080A6FF0
_080A6EB0:
	b _080A7056
_080A6EB2:
	ldr r1, _080A6ED8 @ =gUnk_0201E2A0
	ldrb r2, [r6]
	lsls r0, r2, #0x1f
	lsrs r3, r0, #0x1f
	lsls r0, r3, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #1
	bne _080A6EE0
_080A6EC6:
	ldr r1, [r6]
	lsls r1, r1, #9
	lsrs r1, r1, #0x11
	ldr r2, _080A6EDC @ =gEngineEffectSpecialSummonTribute_080A5BC8
	adds r0, r3, #0
	bl gEngineEffectSpecialSummonGraveyard_080B70AC
	b _080A6F14
	.align 2, 0
_080A6ED8: .4byte gUnk_0201E2A0
_080A6EDC: .4byte gEngineEffectSpecialSummonTribute_080A5BC8
_080A6EE0:
	add r4, sp, #0x100
	ldr r0, _080A6F48 @ =0x000013E5 (Grand Tiki Elder)
	bl sub_080EEBFC
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #0xda
	bl sub_0801F2C4
	ldr r0, _080A6F4C @ =0x000013E7 (Melchid the Four-Face Beast)
	bl sub_080EEBFC
	adds r2, r0, #0
	mov r0, sp
	adds r1, r4, #0
	bl sub_0801F2C4
	ldrb r6, [r6]
	lsls r0, r6, #0x1f
	lsrs r0, r0, #0x1f
	mov r1, sp
_080A6F0A:
	bl gEngineEffectSpecialSummon_08093390
	ldr r0, _080A6F50 @ =gEngineEffectSpecialSummonTribute_080A5BC8
	bl sub_080969C4
_080A6F14:
	ldr r3, _080A6F54 @ =gUnk_0201E4D0
	ldrb r5, [r3, #0x13]
	lsrs r0, r5, #1
	movs r4, #1
	adds r1, r4, #0
	ldrb r2, [r3, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	adds r0, r4, #0
	ands r0, r5
	orrs r0, r2
	strb r0, [r3, #0x13]
	lsrs r1, r1, #7
	ands r1, r4
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x14]
	b _080A7056
	.align 2, 0
_080A6F48: .4byte 0x000013E5 @ Grand Tiki Elder
_080A6F4C: .4byte 0x000013E7 @ Melchid the Four-Face Beast
_080A6F50: .4byte gEngineEffectSpecialSummonTribute_080A5BC8
_080A6F54: .4byte gUnk_0201E4D0
_080A6F58:
	bl sub_08096B14
	cmp r0, #0
	beq _080A6FC8
	ldr r0, _080A6FC0 @ =gUnk_0201C4E0
	ldr r2, _080A6FC4 @ =0x00001D68
	adds r1, r0, r2
	ldr r5, [r1]
	adds r2, #4
	adds r1, r0, r2
	adds r2, #4
	adds r0, r0, r2
	ldr r4, [r1]
	ldr r0, [r0]
	adds r4, r4, r0
	movs r0, #0x28
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl gEngineEffectSpecialSummon_0801EC9C
	strb r7, [r6, #8]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x10
	orrs r5, r4
	strh r5, [r6, #0xc]
	ldrb r3, [r6, #0x13]
	lsrs r0, r3, #1
	adds r1, r7, #0
	ldrb r2, [r6, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	adds r0, r7, #0
	ands r0, r3
	orrs r0, r2
	strb r0, [r6, #0x13]
	lsrs r1, r1, #7
	ands r1, r7
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r6, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #0x14]
	b _080A7056
	.align 2, 0
_080A6FC0: .4byte gUnk_0201C4E0
_080A6FC4: .4byte 0x00001D68
_080A6FC8:
	movs r0, #1
	rsbs r0, r0, #0
	b _080A7058
_080A6FCE:
	ldr r1, _080A6FEC @ =gUnk_0201E2A0
	ldrb r2, [r6]
	lsls r0, r2, #0x1f
	lsrs r3, r0, #0x1f
	lsls r0, r3, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #1
	bne _080A6FE4
	b _080A6EC6
_080A6FE4:
	adds r0, r3, #0
	movs r1, #4
	b _080A6F0A
	.align 2, 0
_080A6FEC: .4byte gUnk_0201E2A0
_080A6FF0:
	bl sub_08096B14
	cmp r0, #0
	beq _080A7038
	ldr r0, _080A7030 @ =gUnk_0201C4E0
	ldr r2, _080A7034 @ =0x00001D68
	adds r1, r0, r2
	ldr r5, [r1]
	adds r2, #4
	adds r1, r0, r2
	adds r2, #4
	adds r0, r0, r2
	ldr r4, [r1]
	ldr r0, [r0]
	adds r4, r4, r0
	movs r0, #0x28
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl gEngineEffectSpecialSummon_0801EC9C
	movs r0, #2
	strb r0, [r6, #8]
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x10
	orrs r5, r4
	strh r5, [r6, #0xe]
	movs r0, #1
	b _080A7058
	.align 2, 0
_080A7030: .4byte gUnk_0201C4E0
_080A7034: .4byte 0x00001D68
_080A7038:
	adds r0, r7, #0
	ldrb r1, [r6, #0x13]
	ands r0, r1
	strb r0, [r6, #0x13]
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r6, #0x14]
	ands r0, r2
	strb r0, [r6, #0x14]
	movs r0, #0x29
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl gEngineEffectSpecialSummon_0801EC9C
_080A7056:
	movs r0, #0
_080A7058:
	movs r3, #0x80
	lsls r3, r3, #2
	add sp, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start gEngineEffectSpecialSummonDiscard_080A7064
gEngineEffectSpecialSummonDiscard_080A7064: @ 0x080A7064
	push {lr}
	ldr r1, _080A7078 @ =gUnk_0201E4D0
	movs r0, #2
	ldrb r1, [r1, #0x12]
	ands r0, r1
	cmp r0, #0
	bne _080A707C
	bl gEngineEffectSpecialSummonDiscard_080A5F7C
	b _080A707E
	.align 2, 0
_080A7078: .4byte gUnk_0201E4D0
_080A707C:
	movs r0, #1
_080A707E:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start gEngineEffectSpecialSummonDiscard_080A7084
gEngineEffectSpecialSummonDiscard_080A7084: @ 0x080A7084
	push {lr}
	ldr r1, _080A7098 @ =gUnk_0201E4D0
	movs r0, #2
	ldrb r2, [r1, #0x12]
	ands r0, r2
	cmp r0, #0
	bne _080A709C
	bl gEngineEffectSpecialSummonDiscard_080A5F7C
	b _080A70A6
	.align 2, 0
_080A7098: .4byte gUnk_0201E4D0
_080A709C:
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	movs r0, #1
_080A70A6:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start gEngineEffectSpecialSummonDiscard_080A70AC
gEngineEffectSpecialSummonDiscard_080A70AC: @ 0x080A70AC
	push {lr}
	ldr r1, _080A70C0 @ =gUnk_0201E4D0
	movs r0, #2
	ldrb r2, [r1, #0x12]
	ands r0, r2
	cmp r0, #0
	bne _080A70C4
	bl gEngineEffectSpecialSummonDiscard_080A5F7C
	b _080A70D4
	.align 2, 0
_080A70C0: .4byte gUnk_0201E4D0
_080A70C4:
	ldrb r1, [r1]
	lsls r0, r1, #0x1f
	lsrs r0, r0, #0x1f
	movs r1, #0xfa
	lsls r1, r1, #1
	bl sub_08048750
	movs r0, #1
_080A70D4:
	pop {r1}
	bx r1

	thumb_func_start gEngineEffectSpecialSummonBanish_080A70D8
gEngineEffectSpecialSummonBanish_080A70D8: @ 0x080A70D8
	push {r4, r5, r6, lr}
	ldr r6, _080A7100 @ =gUnk_0201E4D0
	movs r0, #2
	ldrb r1, [r6, #0x12]
	ands r0, r1
	cmp r0, #0
	bne _080A70E8
	b _080A71D8
_080A70E8:
	ldrb r2, [r6, #0x13]
	lsrs r1, r2, #1
	movs r0, #1
	ldrb r2, [r6, #0x14]
	ands r0, r2
	lsls r5, r0, #7
	orrs r5, r1
	cmp r5, #0
	beq _080A7104
	cmp r5, #1
	beq _080A717C
	b _080A71CC
	.align 2, 0
_080A7100: .4byte gUnk_0201E4D0
_080A7104:
	ldr r1, _080A7128 @ =gUnk_0201E2A0
	ldrb r2, [r6]
	lsls r0, r2, #0x1f
	lsrs r3, r0, #0x1f
	lsls r0, r3, #2
	adds r1, #8
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #1
	bne _080A7130
	ldr r1, [r6]
	lsls r1, r1, #9
	lsrs r1, r1, #0x11
	ldr r2, _080A712C @ =sub_080A5D4C
	adds r0, r3, #0
	bl gEngineEffectSpecialSummonGraveyard_080B70AC
	b _080A713E
	.align 2, 0
_080A7128: .4byte gUnk_0201E2A0
_080A712C: .4byte sub_080A5D4C
_080A7130:
	adds r0, r3, #0
	movs r1, #0xeb
	bl gEngineEffectSpecialSummon_08093390
	ldr r0, _080A7174 @ =sub_080A5D4C
	bl sub_080969C4
_080A713E:
	ldr r3, _080A7178 @ =gUnk_0201E4D0
	ldrb r5, [r3, #0x13]
	lsrs r0, r5, #1
	movs r4, #1
	adds r1, r4, #0
	ldrb r2, [r3, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	adds r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	adds r0, r4, #0
	ands r0, r5
	orrs r0, r2
	strb r0, [r3, #0x13]
	lsrs r1, r1, #7
	ands r1, r4
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r3, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x14]
	movs r0, #0
	b _080A71DC
	.align 2, 0
_080A7174: .4byte sub_080A5D4C
_080A7178: .4byte gUnk_0201E4D0
_080A717C:
	bl sub_08096B14
	cmp r0, #0
	bne _080A71BA
	ldrb r4, [r6, #0x13]
	lsrs r0, r4, #1
	adds r1, r5, #0
	ldrb r2, [r6, #0x14]
	ands r1, r2
	lsls r1, r1, #7
	orrs r1, r0
	subs r1, #1
	movs r2, #0x7f
	ands r2, r1
	lsls r2, r2, #1
	movs r3, #1
	adds r0, r5, #0
	ands r0, r4
	orrs r0, r2
	strb r0, [r6, #0x13]
	lsrs r1, r1, #7
	ands r1, r5
	ands r1, r3
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r6, #0x14]
	ands r0, r2
	orrs r0, r1
	strb r0, [r6, #0x14]
	movs r0, #0
	b _080A71DC
_080A71BA:
	ldr r1, _080A71D0 @ =gUnk_0201C4E0
	ldr r2, _080A71D4 @ =0x00001D68
	adds r0, r1, r2
	ldr r0, [r0]
	adds r2, #8
	adds r1, r1, r2
	ldr r1, [r1]
	bl gEngineEffectBanishSendToGY_0804444C
_080A71CC:
	movs r0, #1
	b _080A71DC
	.align 2, 0
_080A71D0: .4byte gUnk_0201C4E0
_080A71D4: .4byte 0x00001D68
_080A71D8:
	bl gEngineEffectSpecialSummonDiscard_080A5F7C
_080A71DC:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
