	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start ReadSramFast_Core
ReadSramFast_Core: @ 0x0810E420
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _0810E458 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _0810E45C @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _0810E450
	adds r1, r0, #0
_0810E442:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	subs r3, #1
	cmp r3, r1
	bne _0810E442
_0810E450:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E458: .4byte 0x04000204
_0810E45C: .4byte 0x0000FFFC

	thumb_func_start WriteSramFast
WriteSramFast: @ 0x0810E460
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _0810E498 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _0810E49C @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _0810E490
	adds r1, r0, #0
_0810E482:
	ldrb r0, [r5]
	strb r0, [r4]
	adds r5, #1
	adds r4, #1
	subs r3, #1
	cmp r3, r1
	bne _0810E482
_0810E490:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0810E498: .4byte 0x04000204
_0810E49C: .4byte 0x0000FFFC

	thumb_func_start VerifySramFast_Core
VerifySramFast_Core: @ 0x0810E4A0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r2, _0810E4D4 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _0810E4D8 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	subs r3, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	beq _0810E4E2
	adds r2, r0, #0
_0810E4C2:
	ldrb r1, [r4]
	ldrb r0, [r5]
	adds r5, #1
	adds r4, #1
	cmp r1, r0
	beq _0810E4DC
	subs r0, r4, #1
	b _0810E4E4
	.align 2, 0
_0810E4D4: .4byte 0x04000204
_0810E4D8: .4byte 0x0000FFFC
_0810E4DC:
	subs r3, #1
	cmp r3, r2
	bne _0810E4C2
_0810E4E2:
	movs r0, #0
_0810E4E4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start SetSramFastFunc
SetSramFastFunc: @ 0x0810E4EC
	push {lr}
	ldr r2, _0810E500 @ =ReadSramFast_Core
	movs r0, #1
	bics r2, r0
	ldr r3, _0810E504 @ =gUnk_030056F8
	ldr r0, _0810E508 @ =WriteSramFast
	ldr r1, _0810E500 @ =ReadSramFast_Core
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _0810E518
	.align 2, 0
_0810E500: .4byte ReadSramFast_Core
_0810E504: .4byte gUnk_030056F8
_0810E508: .4byte WriteSramFast
_0810E50C:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_0810E518:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0810E50C
	ldr r1, _0810E538 @ =gUnk_02029EA0
	ldr r0, _0810E53C @ =gUnk_030056F9
	str r0, [r1]
	ldr r2, _0810E540 @ =VerifySramFast_Core
	movs r0, #1
	bics r2, r0
	ldr r3, _0810E544 @ =gUnk_03005658
	ldr r0, _0810E548 @ =SetSramFastFunc
	ldr r1, _0810E540 @ =VerifySramFast_Core
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _0810E558
	.align 2, 0
_0810E538: .4byte gUnk_02029EA0
_0810E53C: .4byte gUnk_030056F9
_0810E540: .4byte VerifySramFast_Core
_0810E544: .4byte gUnk_03005658
_0810E548: .4byte SetSramFastFunc
_0810E54C:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_0810E558:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0810E54C
	ldr r1, _0810E578 @ =gUnk_02029EA4
	ldr r0, _0810E57C @ =gUnk_03005659
	str r0, [r1]
	ldr r2, _0810E580 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _0810E584 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_0810E578: .4byte gUnk_02029EA4
_0810E57C: .4byte gUnk_03005659
_0810E580: .4byte 0x04000204
_0810E584: .4byte 0x0000FFFC

	thumb_func_start WriteSramFastEx
WriteSramFastEx: @ 0x0810E588
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	movs r7, #0
	b _0810E59A
_0810E594:
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0810E59A:
	cmp r7, #2
	bhi _0810E5BC
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl WriteSramFast
	ldr r0, _0810E5C4 @ =gUnk_02029EA4
	ldr r3, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl _call_via_r3
	adds r3, r0, #0
	cmp r3, #0
	bne _0810E594
_0810E5BC:
	adds r0, r3, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0810E5C4: .4byte gUnk_02029EA4

	thumb_func_start _call_via_r0
_call_via_r0: @ 0x0810E5C8
	bx r0
	nop

	thumb_func_start _call_via_r1
_call_via_r1: @ 0x0810E5CC
	bx r1
	nop

	thumb_func_start _call_via_r2
_call_via_r2: @ 0x0810E5D0
	bx r2
	nop

	thumb_func_start _call_via_r3
_call_via_r3: @ 0x0810E5D4
	bx r3
	nop

	thumb_func_start _call_via_r4
_call_via_r4: @ 0x0810E5D8
	bx r4
	nop

	thumb_func_start _call_via_r5
_call_via_r5: @ 0x0810E5DC
	bx r5
	nop

	thumb_func_start _call_via_r6
_call_via_r6: @ 0x0810E5E0
	bx r6
	nop

	thumb_func_start _call_via_r7
_call_via_r7: @ 0x0810E5E4
	bx r7
	nop

	thumb_func_start _call_via_r8
_call_via_r8: @ 0x0810E5E8
	bx r8
	nop

	thumb_func_start _call_via_r9
_call_via_r9: @ 0x0810E5EC
	bx sb
	nop

	thumb_func_start _call_via_sl
_call_via_sl: @ 0x0810E5F0
	bx sl
	nop

	thumb_func_start _call_via_fp
_call_via_fp: @ 0x0810E5F4
	bx fp
	nop

	thumb_func_start _call_via_ip
_call_via_ip: @ 0x0810E5F8
	bx ip
	nop

	thumb_func_start _call_via_sp
_call_via_sp: @ 0x0810E5FC
	bx sp
	nop

	thumb_func_start _call_via_lr
_call_via_lr: @ 0x0810E600
	bx lr
	nop

	thumb_func_start __divsi3
__divsi3: @ 0x0810E604
	cmp r1, #0
	beq _0810E68C
	push {r4}
	adds r4, r0, #0
	eors r4, r1
	mov ip, r4
	movs r3, #1
	movs r2, #0
	cmp r1, #0
	bpl _0810E61A
	rsbs r1, r1, #0
_0810E61A:
	cmp r0, #0
	bpl _0810E620
	rsbs r0, r0, #0
_0810E620:
	cmp r0, r1
	blo _0810E67E
	movs r4, #1
	lsls r4, r4, #0x1c
_0810E628:
	cmp r1, r4
	bhs _0810E636
	cmp r1, r0
	bhs _0810E636
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _0810E628
_0810E636:
	lsls r4, r4, #3
_0810E638:
	cmp r1, r4
	bhs _0810E646
	cmp r1, r0
	bhs _0810E646
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _0810E638
_0810E646:
	cmp r0, r1
	blo _0810E64E
	subs r0, r0, r1
	orrs r2, r3
_0810E64E:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _0810E65A
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_0810E65A:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _0810E666
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_0810E666:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _0810E672
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_0810E672:
	cmp r0, #0
	beq _0810E67E
	lsrs r3, r3, #4
	beq _0810E67E
	lsrs r1, r1, #4
	b _0810E646
_0810E67E:
	adds r0, r2, #0
	mov r4, ip
	cmp r4, #0
	bpl _0810E688
	rsbs r0, r0, #0
_0810E688:
	pop {r4}
	mov pc, lr
_0810E68C:
	push {lr}
	bl nullsub_3
	movs r0, #0
	pop {pc}
	.align 2, 0

	thumb_func_start nullsub_3
nullsub_3: @ 0x0810E698
	mov pc, lr
	.align 2, 0

	thumb_func_start __modsi3
__modsi3: @ 0x0810E69C
	movs r3, #1
	cmp r1, #0
	beq _0810E760
	bpl _0810E6A6
	rsbs r1, r1, #0
_0810E6A6:
	push {r4}
	push {r0}
	cmp r0, #0
	bpl _0810E6B0
	rsbs r0, r0, #0
_0810E6B0:
	cmp r0, r1
	blo _0810E754
	movs r4, #1
	lsls r4, r4, #0x1c
_0810E6B8:
	cmp r1, r4
	bhs _0810E6C6
	cmp r1, r0
	bhs _0810E6C6
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _0810E6B8
_0810E6C6:
	lsls r4, r4, #3
_0810E6C8:
	cmp r1, r4
	bhs _0810E6D6
	cmp r1, r0
	bhs _0810E6D6
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _0810E6C8
_0810E6D6:
	movs r2, #0
	cmp r0, r1
	blo _0810E6DE
	subs r0, r0, r1
_0810E6DE:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _0810E6F0
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_0810E6F0:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _0810E702
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_0810E702:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _0810E714
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_0810E714:
	mov ip, r3
	cmp r0, #0
	beq _0810E722
	lsrs r3, r3, #4
	beq _0810E722
	lsrs r1, r1, #4
	b _0810E6D6
_0810E722:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	beq _0810E754
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _0810E738
	lsrs r4, r1, #3
	adds r0, r0, r4
_0810E738:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _0810E746
	lsrs r4, r1, #2
	adds r0, r0, r4
_0810E746:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _0810E754
	lsrs r4, r1, #1
	adds r0, r0, r4
_0810E754:
	pop {r4}
	cmp r4, #0
	bpl _0810E75C
	rsbs r0, r0, #0
_0810E75C:
	pop {r4}
	mov pc, lr
_0810E760:
	push {lr}
	bl nullsub_3
	movs r0, #0
	pop {pc}
	.align 2, 0

	thumb_func_start __muldi3
__muldi3: @ 0x0810E76C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	ldr r3, [sp]
	ldr r0, _0810E7D8 @ =0x0000FFFF
	mov ip, r0
	adds r2, r3, #0
	ands r2, r0
	lsrs r3, r3, #0x10
	ldr r1, [sp, #8]
	adds r0, r1, #0
	mov r4, ip
	ands r0, r4
	lsrs r1, r1, #0x10
	adds r5, r2, #0
	muls r5, r0, r5
	adds r4, r2, #0
	muls r4, r1, r4
	adds r2, r3, #0
	muls r2, r0, r2
	muls r3, r1, r3
	lsrs r0, r5, #0x10
	adds r4, r4, r0
	adds r4, r4, r2
	cmp r4, r2
	bhs _0810E7AC
	movs r0, #0x80
	lsls r0, r0, #9
	adds r3, r3, r0
_0810E7AC:
	lsrs r0, r4, #0x10
	adds r7, r3, r0
	mov r1, ip
	ands r4, r1
	lsls r0, r4, #0x10
	ands r5, r1
	adds r6, r0, #0
	orrs r6, r5
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r3, [sp]
	ldr r4, [sp, #0xc]
	adds r2, r3, #0
	muls r2, r4, r2
	ldr r5, [sp, #4]
	ldr r4, [sp, #8]
	adds r3, r5, #0
	muls r3, r4, r3
	adds r2, r2, r3
	adds r1, r7, r2
	add sp, #0x10
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0810E7D8: .4byte 0x0000FFFF

	thumb_func_start __udivsi3
__udivsi3: @ 0x0810E7DC
	cmp r1, #0
	beq _0810E84A
	movs r3, #1
	movs r2, #0
	push {r4}
	cmp r0, r1
	blo _0810E844
	movs r4, #1
	lsls r4, r4, #0x1c
_0810E7EE:
	cmp r1, r4
	bhs _0810E7FC
	cmp r1, r0
	bhs _0810E7FC
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _0810E7EE
_0810E7FC:
	lsls r4, r4, #3
_0810E7FE:
	cmp r1, r4
	bhs _0810E80C
	cmp r1, r0
	bhs _0810E80C
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _0810E7FE
_0810E80C:
	cmp r0, r1
	blo _0810E814
	subs r0, r0, r1
	orrs r2, r3
_0810E814:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _0810E820
	subs r0, r0, r4
	lsrs r4, r3, #1
	orrs r2, r4
_0810E820:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _0810E82C
	subs r0, r0, r4
	lsrs r4, r3, #2
	orrs r2, r4
_0810E82C:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _0810E838
	subs r0, r0, r4
	lsrs r4, r3, #3
	orrs r2, r4
_0810E838:
	cmp r0, #0
	beq _0810E844
	lsrs r3, r3, #4
	beq _0810E844
	lsrs r1, r1, #4
	b _0810E80C
_0810E844:
	adds r0, r2, #0
	pop {r4}
	mov pc, lr
_0810E84A:
	push {lr}
	bl nullsub_3
	movs r0, #0
	pop {pc}

	thumb_func_start __umodsi3
__umodsi3: @ 0x0810E854
	cmp r1, #0
	beq _0810E90A
	movs r3, #1
	cmp r0, r1
	bhs _0810E860
	mov pc, lr
_0810E860:
	push {r4}
	movs r4, #1
	lsls r4, r4, #0x1c
_0810E866:
	cmp r1, r4
	bhs _0810E874
	cmp r1, r0
	bhs _0810E874
	lsls r1, r1, #4
	lsls r3, r3, #4
	b _0810E866
_0810E874:
	lsls r4, r4, #3
_0810E876:
	cmp r1, r4
	bhs _0810E884
	cmp r1, r0
	bhs _0810E884
	lsls r1, r1, #1
	lsls r3, r3, #1
	b _0810E876
_0810E884:
	movs r2, #0
	cmp r0, r1
	blo _0810E88C
	subs r0, r0, r1
_0810E88C:
	lsrs r4, r1, #1
	cmp r0, r4
	blo _0810E89E
	subs r0, r0, r4
	mov ip, r3
	movs r4, #1
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_0810E89E:
	lsrs r4, r1, #2
	cmp r0, r4
	blo _0810E8B0
	subs r0, r0, r4
	mov ip, r3
	movs r4, #2
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_0810E8B0:
	lsrs r4, r1, #3
	cmp r0, r4
	blo _0810E8C2
	subs r0, r0, r4
	mov ip, r3
	movs r4, #3
	rors r3, r4
	orrs r2, r3
	mov r3, ip
_0810E8C2:
	mov ip, r3
	cmp r0, #0
	beq _0810E8D0
	lsrs r3, r3, #4
	beq _0810E8D0
	lsrs r1, r1, #4
	b _0810E884
_0810E8D0:
	movs r4, #0xe
	lsls r4, r4, #0x1c
	ands r2, r4
	bne _0810E8DC
	pop {r4}
	mov pc, lr
_0810E8DC:
	mov r3, ip
	movs r4, #3
	rors r3, r4
	tst r2, r3
	beq _0810E8EA
	lsrs r4, r1, #3
	adds r0, r0, r4
_0810E8EA:
	mov r3, ip
	movs r4, #2
	rors r3, r4
	tst r2, r3
	beq _0810E8F8
	lsrs r4, r1, #2
	adds r0, r0, r4
_0810E8F8:
	mov r3, ip
	movs r4, #1
	rors r3, r4
	tst r2, r3
	beq _0810E906
	lsrs r4, r1, #1
	adds r0, r0, r4
_0810E906:
	pop {r4}
	mov pc, lr
_0810E90A:
	push {lr}
	bl nullsub_3
	movs r0, #0
	pop {pc}

	thumb_func_start memcmp
memcmp: @ 0x0810E914
	push {r4, lr}
	adds r4, r2, #0
	adds r3, r0, #0
	adds r2, r1, #0
	cmp r4, #3
	bls _0810E950
	orrs r0, r2
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0810E950
	b _0810E936
_0810E92C:
	adds r3, #4
	adds r2, #4
	subs r4, #4
	cmp r4, #3
	bls _0810E950
_0810E936:
	ldr r1, [r3]
	ldr r0, [r2]
	cmp r1, r0
	beq _0810E92C
	b _0810E950
_0810E940:
	ldrb r0, [r3]
	ldrb r1, [r2]
	cmp r0, r1
	beq _0810E94C
	subs r0, r0, r1
	b _0810E95A
_0810E94C:
	adds r3, #1
	adds r2, #1
_0810E950:
	adds r0, r4, #0
	subs r4, #1
	cmp r0, #0
	bne _0810E940
	movs r0, #0
_0810E95A:
	pop {r4, pc}

	thumb_func_start memcpy
memcpy: @ 0x0810E95C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r3, r1, #0
	cmp r2, #0xf
	bls _0810E99C
	adds r0, r3, #0
	orrs r0, r5
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0810E99C
	adds r1, r5, #0
_0810E976:
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _0810E976
	cmp r2, #3
	bls _0810E99A
_0810E990:
	ldm r3!, {r0}
	stm r1!, {r0}
	subs r2, #4
	cmp r2, #3
	bhi _0810E990
_0810E99A:
	adds r4, r1, #0
_0810E99C:
	subs r2, #1
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0810E9B6
	adds r1, r0, #0
_0810E9A8:
	ldrb r0, [r3]
	strb r0, [r4]
	adds r3, #1
	adds r4, #1
	subs r2, #1
	cmp r2, r1
	bne _0810E9A8
_0810E9B6:
	adds r0, r5, #0
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start memset
memset: @ 0x0810E9BC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r5, #0
	cmp r2, #3
	bls _0810EA02
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	bne _0810EA02
	adds r1, r5, #0
	movs r0, #0xff
	ands r4, r0
	lsls r3, r4, #8
	orrs r3, r4
	lsls r0, r3, #0x10
	orrs r3, r0
	cmp r2, #0xf
	bls _0810E9F6
_0810E9E2:
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	stm r1!, {r3}
	subs r2, #0x10
	cmp r2, #0xf
	bhi _0810E9E2
	b _0810E9F6
_0810E9F2:
	stm r1!, {r3}
	subs r2, #4
_0810E9F6:
	cmp r2, #3
	bhi _0810E9F2
	adds r3, r1, #0
	b _0810EA02
_0810E9FE:
	strb r4, [r3]
	adds r3, #1
_0810EA02:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _0810E9FE
	adds r0, r5, #0
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start qsort
qsort: @ 0x0810EA10
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	str r0, [sp]
	mov sb, r1
	adds r7, r2, #0
	str r3, [sp, #4]
_0810EA24:
	movs r1, #3
	ldr r0, [sp]
	ands r0, r1
	cmp r0, #0
	bne _0810EA42
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	bne _0810EA42
	movs r1, #4
	eors r1, r7
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	b _0810EA44
_0810EA42:
	movs r0, #2
_0810EA44:
	str r0, [sp, #0xc]
	movs r1, #0
	str r1, [sp, #0x10]
	mov r2, sb
	cmp r2, #6
	bhi _0810EAD8
	ldr r0, [sp]
	adds r5, r0, r7
	mov r0, sb
	muls r0, r7, r0
	ldr r2, [sp]
	adds r1, r2, r0
	str r0, [sp, #0x1c]
	cmp r5, r1
	blo _0810EA64
	b _0810EF94
_0810EA64:
	adds r6, r5, #0
	adds r5, r5, r7
	mov r8, r5
	b _0810EAB2
_0810EA6C:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0810EA7C
	ldr r1, [r6]
	ldr r0, [r5]
	str r0, [r6]
	str r1, [r5]
	b _0810EAB0
_0810EA7C:
	ldr r1, [sp, #0xc]
	cmp r1, #1
	bgt _0810EA98
	lsrs r2, r7, #2
	adds r4, r6, #0
	adds r3, r5, #0
_0810EA88:
	ldr r1, [r4]
	ldr r0, [r3]
	stm r4!, {r0}
	stm r3!, {r1}
	subs r2, #1
	cmp r2, #0
	bgt _0810EA88
	b _0810EAB0
_0810EA98:
	adds r3, r7, #0
	adds r4, r6, #0
	adds r2, r5, #0
_0810EA9E:
	ldrb r1, [r4]
	ldrb r0, [r2]
	strb r0, [r4]
	adds r4, #1
	strb r1, [r2]
	adds r2, #1
	subs r3, #1
	cmp r3, #0
	bgt _0810EA9E
_0810EAB0:
	adds r6, r5, #0
_0810EAB2:
	ldr r2, [sp]
	cmp r6, r2
	bls _0810EACA
	subs r4, r6, r7
	adds r0, r4, #0
	adds r1, r6, #0
	ldr r2, [sp, #4]
	bl _call_via_r2
	adds r5, r4, #0
	cmp r0, #0
	bgt _0810EA6C
_0810EACA:
	mov r5, r8
	ldr r1, [sp]
	ldr r2, [sp, #0x1c]
	adds r0, r1, r2
	cmp r5, r0
	blo _0810EA64
	b _0810EF94
_0810EAD8:
	mov r1, sb
	lsrs r0, r1, #1
	muls r0, r7, r0
	ldr r2, [sp]
	adds r5, r2, r0
	subs r1, #1
	str r1, [sp, #0x14]
	mov r0, sb
	cmp r0, #7
	bhi _0810EAEE
	b _0810EC7C
_0810EAEE:
	adds r6, r2, #0
	adds r0, r1, #0
	muls r0, r7, r0
	adds r2, r2, r0
	mov sl, r2
	mov r1, sb
	cmp r1, #0x28
	bhi _0810EB00
	b _0810EC26
_0810EB00:
	lsrs r0, r1, #3
	adds r2, r0, #0
	muls r2, r7, r2
	str r2, [sp, #8]
	adds r4, r6, r2
	lsls r0, r2, #1
	adds r6, r0, r6
	ldr r0, [sp]
	adds r1, r4, #0
	ldr r2, [sp, #4]
	bl _call_via_r2
	cmp r0, #0
	bge _0810EB3E
	adds r0, r4, #0
	adds r1, r6, #0
	ldr r2, [sp, #4]
	bl _call_via_r2
	cmp r0, #0
	blt _0810EB60
	ldr r0, [sp]
	adds r1, r6, #0
	ldr r2, [sp, #4]
	bl _call_via_r2
	ldr r1, [sp]
	cmp r0, #0
	bge _0810EB62
	adds r1, r6, #0
	b _0810EB62
_0810EB3E:
	adds r0, r4, #0
	adds r1, r6, #0
	ldr r2, [sp, #4]
	bl _call_via_r2
	cmp r0, #0
	bgt _0810EB60
	ldr r0, [sp]
	adds r1, r6, #0
	ldr r2, [sp, #4]
	bl _call_via_r2
	adds r1, r6, #0
	cmp r0, #0
	bge _0810EB62
	ldr r1, [sp]
	b _0810EB62
_0810EB60:
	adds r1, r4, #0
_0810EB62:
	adds r6, r1, #0
	ldr r0, [sp, #8]
	subs r0, r5, r0
	mov r8, r0
	ldr r1, [sp, #8]
	adds r4, r5, r1
	adds r1, r5, #0
	ldr r2, [sp, #4]
	bl _call_via_r2
	cmp r0, #0
	bge _0810EB9C
	adds r0, r5, #0
	adds r1, r4, #0
	ldr r2, [sp, #4]
	bl _call_via_r2
	cmp r0, #0
	blt _0810EBBE
	mov r0, r8
	adds r1, r4, #0
	ldr r2, [sp, #4]
	bl _call_via_r2
	mov r1, r8
	cmp r0, #0
	bge _0810EBC0
	adds r1, r4, #0
	b _0810EBC0
_0810EB9C:
	adds r0, r5, #0
	adds r1, r4, #0
	ldr r2, [sp, #4]
	bl _call_via_r2
	cmp r0, #0
	bgt _0810EBBE
	mov r0, r8
	adds r1, r4, #0
	ldr r2, [sp, #4]
	bl _call_via_r2
	adds r1, r4, #0
	cmp r0, #0
	bge _0810EBC0
	mov r1, r8
	b _0810EBC0
_0810EBBE:
	adds r1, r5, #0
_0810EBC0:
	adds r5, r1, #0
	ldr r1, [sp, #8]
	lsls r0, r1, #1
	mov r2, sl
	subs r2, r2, r0
	mov r8, r2
	mov r0, sl
	subs r4, r0, r1
	mov r0, r8
	adds r1, r4, #0
	ldr r2, [sp, #4]
	bl _call_via_r2
	cmp r0, #0
	bge _0810EC00
	adds r0, r4, #0
	mov r1, sl
	ldr r2, [sp, #4]
	bl _call_via_r2
	cmp r0, #0
	blt _0810EC22
	mov r0, r8
	mov r1, sl
	ldr r2, [sp, #4]
	bl _call_via_r2
	mov r1, r8
	cmp r0, #0
	bge _0810EC24
	mov r1, sl
	b _0810EC24
_0810EC00:
	adds r0, r4, #0
	mov r1, sl
	ldr r2, [sp, #4]
	bl _call_via_r2
	cmp r0, #0
	bgt _0810EC22
	mov r0, r8
	mov r1, sl
	ldr r2, [sp, #4]
	bl _call_via_r2
	mov r1, sl
	cmp r0, #0
	bge _0810EC24
	mov r1, r8
	b _0810EC24
_0810EC22:
	adds r1, r4, #0
_0810EC24:
	mov sl, r1
_0810EC26:
	adds r0, r6, #0
	adds r1, r5, #0
	ldr r2, [sp, #4]
	bl _call_via_r2
	cmp r0, #0
	bge _0810EC56
	adds r0, r5, #0
	mov r1, sl
	ldr r2, [sp, #4]
	bl _call_via_r2
	cmp r0, #0
	blt _0810EC78
	adds r0, r6, #0
	mov r1, sl
	ldr r2, [sp, #4]
	bl _call_via_r2
	adds r1, r6, #0
	cmp r0, #0
	bge _0810EC7A
	mov r1, sl
	b _0810EC7A
_0810EC56:
	adds r0, r5, #0
	mov r1, sl
	ldr r2, [sp, #4]
	bl _call_via_r2
	cmp r0, #0
	bgt _0810EC78
	adds r0, r6, #0
	mov r1, sl
	ldr r2, [sp, #4]
	bl _call_via_r2
	mov r1, sl
	cmp r0, #0
	bge _0810EC7A
	adds r1, r6, #0
	b _0810EC7A
_0810EC78:
	adds r1, r5, #0
_0810EC7A:
	adds r5, r1, #0
_0810EC7C:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0810EC98
	ldr r2, [sp]
	ldr r1, [r2]
	ldr r0, [r5]
	str r0, [r2]
	str r1, [r5]
	adds r0, r2, r7
	str r0, [sp, #0x18]
	mov r1, sb
	muls r1, r7, r1
	str r1, [sp, #0x1c]
	b _0810ECE0
_0810EC98:
	ldr r2, [sp, #0xc]
	cmp r2, #1
	bgt _0810ECBE
	lsrs r2, r7, #2
	ldr r4, [sp]
	adds r3, r5, #0
	adds r0, r4, r7
	str r0, [sp, #0x18]
	mov r1, sb
	muls r1, r7, r1
	str r1, [sp, #0x1c]
_0810ECAE:
	ldr r1, [r4]
	ldr r0, [r3]
	stm r4!, {r0}
	stm r3!, {r1}
	subs r2, #1
	cmp r2, #0
	bgt _0810ECAE
	b _0810ECE0
_0810ECBE:
	adds r4, r7, #0
	ldr r3, [sp]
	adds r2, r5, #0
	adds r0, r3, r7
	str r0, [sp, #0x18]
	mov r1, sb
	muls r1, r7, r1
	str r1, [sp, #0x1c]
_0810ECCE:
	ldrb r1, [r3]
	ldrb r0, [r2]
	strb r0, [r3]
	adds r3, #1
	strb r1, [r2]
	adds r2, #1
	subs r4, #1
	cmp r4, #0
	bgt _0810ECCE
_0810ECE0:
	ldr r6, [sp, #0x18]
	mov sb, r6
	ldr r2, [sp, #0x14]
	adds r0, r2, #0
	muls r0, r7, r0
	ldr r1, [sp]
	adds r1, r1, r0
	mov r8, r1
	mov r5, r8
	b _0810EDB0
_0810ECF4:
	ldr r1, [r6]
	ldr r0, [r5]
	str r0, [r6]
	str r1, [r5]
	adds r6, r6, r7
	mov sl, r6
	subs r5, r5, r7
	mov ip, r5
	b _0810ED4A
_0810ED06:
	ldr r2, [sp, #0xc]
	cmp r2, #1
	bgt _0810ED2A
	lsrs r3, r7, #2
	adds r4, r6, #0
	adds r2, r5, #0
	adds r0, r4, r7
	mov sl, r0
	subs r1, r2, r7
	mov ip, r1
_0810ED1A:
	ldr r1, [r4]
	ldr r0, [r2]
	stm r4!, {r0}
	stm r2!, {r1}
	subs r3, #1
	cmp r3, #0
	bgt _0810ED1A
	b _0810ED4A
_0810ED2A:
	adds r4, r7, #0
	adds r3, r6, #0
	adds r2, r5, #0
	adds r0, r3, r7
	mov sl, r0
	subs r1, r2, r7
	mov ip, r1
_0810ED38:
	ldrb r1, [r3]
	ldrb r0, [r2]
	strb r0, [r3]
	adds r3, #1
	strb r1, [r2]
	adds r2, #1
	subs r4, #1
	cmp r4, #0
	bgt _0810ED38
_0810ED4A:
	movs r2, #1
	str r2, [sp, #0x10]
	mov r6, sl
	mov r5, ip
	b _0810EDB0
_0810ED54:
	adds r1, r6, r7
	mov sl, r1
	cmp r0, #0
	bne _0810EDAE
	movs r2, #1
	str r2, [sp, #0x10]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0810ED74
	mov r2, sb
	ldr r1, [r2]
	ldr r0, [r6]
	str r0, [r2]
	str r1, [r6]
	adds r6, r2, r7
	b _0810EDAC
_0810ED74:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bgt _0810ED92
	lsrs r3, r7, #2
	mov r2, sb
	adds r4, r6, #0
	adds r6, r2, r7
_0810ED82:
	ldr r1, [r2]
	ldr r0, [r4]
	stm r2!, {r0}
	stm r4!, {r1}
	subs r3, #1
	cmp r3, #0
	bgt _0810ED82
	b _0810EDAC
_0810ED92:
	adds r4, r7, #0
	mov r2, sb
	adds r3, r6, #0
	adds r6, r2, r7
_0810ED9A:
	ldrb r1, [r2]
	ldrb r0, [r3]
	strb r0, [r2]
	adds r2, #1
	strb r1, [r3]
	adds r3, #1
	subs r4, #1
	cmp r4, #0
	bgt _0810ED9A
_0810EDAC:
	mov sb, r6
_0810EDAE:
	mov r6, sl
_0810EDB0:
	cmp r6, r5
	bhi _0810EE20
	adds r0, r6, #0
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl _call_via_r2
	cmp r0, #0
	ble _0810ED54
	b _0810EE20
_0810EDC4:
	subs r1, r5, r7
	mov ip, r1
	cmp r0, #0
	bne _0810EE1E
	movs r2, #1
	str r2, [sp, #0x10]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0810EDE4
	ldr r1, [r5]
	mov r2, r8
	ldr r0, [r2]
	str r0, [r5]
	str r1, [r2]
	subs r5, r2, r7
	b _0810EE1C
_0810EDE4:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bgt _0810EE02
	lsrs r3, r7, #2
	adds r4, r5, #0
	mov r2, r8
	subs r5, r2, r7
_0810EDF2:
	ldr r1, [r4]
	ldr r0, [r2]
	stm r4!, {r0}
	stm r2!, {r1}
	subs r3, #1
	cmp r3, #0
	bgt _0810EDF2
	b _0810EE1C
_0810EE02:
	adds r4, r7, #0
	adds r3, r5, #0
	mov r2, r8
	subs r5, r2, r7
_0810EE0A:
	ldrb r1, [r3]
	ldrb r0, [r2]
	strb r0, [r3]
	adds r3, #1
	strb r1, [r2]
	adds r2, #1
	subs r4, #1
	cmp r4, #0
	bgt _0810EE0A
_0810EE1C:
	mov r8, r5
_0810EE1E:
	mov r5, ip
_0810EE20:
	cmp r6, r5
	bhi _0810EE3C
	adds r0, r5, #0
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl _call_via_r2
	cmp r0, #0
	bge _0810EDC4
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0810EE3A
	b _0810ED06
_0810EE3A:
	b _0810ECF4
_0810EE3C:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	bne _0810EEC4
	ldr r5, [sp, #0x18]
	ldr r2, [sp]
	ldr r1, [sp, #0x1c]
	adds r0, r2, r1
	cmp r5, r0
	blo _0810EE50
	b _0810EF94
_0810EE50:
	adds r6, r5, #0
	adds r5, r5, r7
	mov r8, r5
	b _0810EE9E
_0810EE58:
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _0810EE68
	ldr r1, [r6]
	ldr r0, [r5]
	str r0, [r6]
	str r1, [r5]
	b _0810EE9C
_0810EE68:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bgt _0810EE84
	lsrs r2, r7, #2
	adds r4, r6, #0
	adds r3, r5, #0
_0810EE74:
	ldr r1, [r4]
	ldr r0, [r3]
	stm r4!, {r0}
	stm r3!, {r1}
	subs r2, #1
	cmp r2, #0
	bgt _0810EE74
	b _0810EE9C
_0810EE84:
	adds r3, r7, #0
	adds r4, r6, #0
	adds r2, r5, #0
_0810EE8A:
	ldrb r1, [r4]
	ldrb r0, [r2]
	strb r0, [r4]
	adds r4, #1
	strb r1, [r2]
	adds r2, #1
	subs r3, #1
	cmp r3, #0
	bgt _0810EE8A
_0810EE9C:
	adds r6, r5, #0
_0810EE9E:
	ldr r1, [sp]
	cmp r6, r1
	bls _0810EEB6
	subs r4, r6, r7
	adds r0, r4, #0
	adds r1, r6, #0
	ldr r2, [sp, #4]
	bl _call_via_r2
	adds r5, r4, #0
	cmp r0, #0
	bgt _0810EE58
_0810EEB6:
	mov r5, r8
	ldr r1, [sp]
	ldr r2, [sp, #0x1c]
	adds r0, r1, r2
	cmp r5, r0
	blo _0810EE50
	b _0810EF94
_0810EEC4:
	ldr r0, [sp]
	ldr r1, [sp, #0x1c]
	adds r0, r0, r1
	mov sl, r0
	mov r2, sb
	ldr r0, [sp]
	subs r1, r2, r0
	subs r0, r6, r2
	mov sb, r0
	cmp r0, r1
	ble _0810EEDC
	adds r0, r1, #0
_0810EEDC:
	mov r1, r8
	subs r5, r1, r5
	mov r2, sl
	subs r2, r2, r1
	mov r8, r2
	cmp r0, #0
	ble _0810EF20
	subs r1, r6, r0
	ldr r2, [sp, #0xc]
	cmp r2, #1
	bgt _0810EF08
	lsrs r2, r0, #2
	ldr r4, [sp]
	adds r3, r1, #0
_0810EEF8:
	ldr r1, [r4]
	ldr r0, [r3]
	stm r4!, {r0}
	stm r3!, {r1}
	subs r2, #1
	cmp r2, #0
	bgt _0810EEF8
	b _0810EF20
_0810EF08:
	adds r4, r0, #0
	ldr r3, [sp]
	adds r2, r1, #0
_0810EF0E:
	ldrb r1, [r3]
	ldrb r0, [r2]
	strb r0, [r3]
	adds r3, #1
	strb r1, [r2]
	adds r2, #1
	subs r4, #1
	cmp r4, #0
	bgt _0810EF0E
_0810EF20:
	mov r1, r8
	subs r0, r1, r7
	cmp r0, r5
	bls _0810EF2A
	adds r0, r5, #0
_0810EF2A:
	cmp r0, #0
	ble _0810EF66
	mov r2, sl
	subs r1, r2, r0
	ldr r2, [sp, #0xc]
	cmp r2, #1
	bgt _0810EF4E
	lsrs r2, r0, #2
	adds r4, r6, #0
	adds r3, r1, #0
_0810EF3E:
	ldr r1, [r4]
	ldr r0, [r3]
	stm r4!, {r0}
	stm r3!, {r1}
	subs r2, #1
	cmp r2, #0
	bgt _0810EF3E
	b _0810EF66
_0810EF4E:
	adds r4, r0, #0
	adds r3, r6, #0
	adds r2, r1, #0
_0810EF54:
	ldrb r1, [r3]
	ldrb r0, [r2]
	strb r0, [r3]
	adds r3, #1
	strb r1, [r2]
	adds r2, #1
	subs r4, #1
	cmp r4, #0
	bgt _0810EF54
_0810EF66:
	mov r0, sb
	cmp r0, r7
	bls _0810EF7E
	adds r1, r7, #0
	bl __udivsi3
	adds r1, r0, #0
	ldr r0, [sp]
	adds r2, r7, #0
	ldr r3, [sp, #4]
	bl qsort
_0810EF7E:
	cmp r5, r7
	bls _0810EF94
	mov r0, sl
	subs r0, r0, r5
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	bl __udivsi3
	mov sb, r0
	b _0810EA24
_0810EF94:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

	thumb_func_start eofread
eofread: @ 0x0810EFA0
	movs r0, #0
	bx lr

	thumb_func_start sscanf
sscanf: @ 0x0810EFA4
	push {r1, r2, r3}
	push {r4, r5, lr}
	sub sp, #0x58
	ldr r5, [sp, #0x64]
	mov r2, sp
	movs r4, #0
	movs r1, #4
	strh r1, [r2, #0xc]
	str r0, [sp]
	str r0, [sp, #0x10]
	bl strlen
	str r0, [sp, #4]
	str r0, [sp, #0x14]
	ldr r0, _0810EFE4 @ =eofread
	str r0, [sp, #0x20]
	str r4, [sp, #0x30]
	str r4, [sp, #0x44]
	ldr r0, _0810EFE8 @ =gUnk_09ED4D94
	ldr r0, [r0]
	str r0, [sp, #0x54]
	add r2, sp, #0x68
	mov r0, sp
	adds r1, r5, #0
	bl __svfscanf
	add sp, #0x58
	pop {r4, r5}
	pop {r3}
	add sp, #0xc
	bx r3
	.align 2, 0
_0810EFE4: .4byte eofread
_0810EFE8: .4byte gUnk_09ED4D94

	thumb_func_start strcat
strcat: @ 0x0810EFEC
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	movs r0, #3
	ands r0, r4
	cmp r0, #0
	bne _0810F022
	ldr r1, [r4]
	ldr r5, _0810F008 @ =0xFEFEFEFF
	adds r0, r1, r5
	bics r0, r1
	ldr r3, _0810F00C @ =0x80808080
	b _0810F018
	.align 2, 0
_0810F008: .4byte 0xFEFEFEFF
_0810F00C: .4byte 0x80808080
_0810F010:
	adds r2, #4
	ldr r1, [r2]
	adds r0, r1, r5
	bics r0, r1
_0810F018:
	ands r0, r3
	cmp r0, #0
	beq _0810F010
	b _0810F022
_0810F020:
	adds r2, #1
_0810F022:
	ldrb r0, [r2]
	cmp r0, #0
	bne _0810F020
	adds r0, r2, #0
	adds r1, r6, #0
	bl strcpy
	adds r0, r4, #0
	pop {r4, r5, r6, pc}

	thumb_func_start strcmp
strcmp: @ 0x0810F034
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	orrs r0, r3
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0810F07A
	ldr r1, [r2]
	ldr r0, [r3]
	cmp r1, r0
	bne _0810F07A
	ldr r5, _0810F060 @ =0xFEFEFEFF
	ldr r4, _0810F064 @ =0x80808080
_0810F050:
	ldr r1, [r2]
	adds r0, r1, r5
	bics r0, r1
	ands r0, r4
	cmp r0, #0
	beq _0810F068
	movs r0, #0
	b _0810F08C
	.align 2, 0
_0810F060: .4byte 0xFEFEFEFF
_0810F064: .4byte 0x80808080
_0810F068:
	adds r2, #4
	adds r3, #4
	ldr r1, [r2]
	ldr r0, [r3]
	cmp r1, r0
	beq _0810F050
	b _0810F07A
_0810F076:
	adds r2, #1
	adds r3, #1
_0810F07A:
	ldrb r0, [r2]
	cmp r0, #0
	beq _0810F086
	ldrb r1, [r3]
	cmp r0, r1
	beq _0810F076
_0810F086:
	ldrb r2, [r2]
	ldrb r3, [r3]
	subs r0, r2, r3
_0810F08C:
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start strcpy
strcpy: @ 0x0810F090
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r3, r6, #0
	adds r2, r1, #0
	adds r0, r2, #0
	orrs r0, r6
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0810F0C8
	ldr r1, [r2]
	ldr r5, _0810F0B0 @ =0xFEFEFEFF
	adds r0, r1, r5
	bics r0, r1
	ldr r4, _0810F0B4 @ =0x80808080
	b _0810F0C2
	.align 2, 0
_0810F0B0: .4byte 0xFEFEFEFF
_0810F0B4: .4byte 0x80808080
_0810F0B8:
	ldm r2!, {r0}
	stm r3!, {r0}
	ldr r1, [r2]
	adds r0, r1, r5
	bics r0, r1
_0810F0C2:
	ands r0, r4
	cmp r0, #0
	beq _0810F0B8
_0810F0C8:
	ldrb r0, [r2]
	strb r0, [r3]
	lsls r0, r0, #0x18
	adds r2, #1
	adds r3, #1
	cmp r0, #0
	bne _0810F0C8
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	.align 2, 0

	thumb_func_start strlen
strlen: @ 0x0810F0DC
	push {r4, r5, lr}
	adds r1, r0, #0
	adds r5, r1, #0
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _0810F114
	adds r2, r1, #0
	ldr r1, [r2]
	ldr r4, _0810F0F8 @ =0xFEFEFEFF
	adds r0, r1, r4
	bics r0, r1
	ldr r3, _0810F0FC @ =0x80808080
	b _0810F108
	.align 2, 0
_0810F0F8: .4byte 0xFEFEFEFF
_0810F0FC: .4byte 0x80808080
_0810F100:
	adds r2, #4
	ldr r1, [r2]
	adds r0, r1, r4
	bics r0, r1
_0810F108:
	ands r0, r3
	cmp r0, #0
	beq _0810F100
	adds r1, r2, #0
	b _0810F114
_0810F112:
	adds r1, #1
_0810F114:
	ldrb r0, [r1]
	cmp r0, #0
	bne _0810F112
	subs r0, r1, r5
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start strncmp
strncmp: @ 0x0810F120
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	beq _0810F18C
	adds r0, r6, #0
	orrs r0, r4
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0810F170
	adds r3, r6, #0
	adds r5, r4, #0
	cmp r2, #3
	bls _0810F16C
	ldr r1, [r6]
	ldr r0, [r4]
	cmp r1, r0
	bne _0810F16C
	ldr r6, _0810F17C @ =0xFEFEFEFF
	ldr r4, _0810F180 @ =0x80808080
_0810F14A:
	subs r2, #4
	cmp r2, #0
	beq _0810F18C
	ldr r1, [r3]
	adds r0, r1, r6
	bics r0, r1
	ands r0, r4
	cmp r0, #0
	bne _0810F18C
	adds r3, #4
	adds r5, #4
	cmp r2, #3
	bls _0810F16C
	ldr r1, [r3]
	ldr r0, [r5]
	cmp r1, r0
	beq _0810F14A
_0810F16C:
	adds r6, r3, #0
	adds r4, r5, #0
_0810F170:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	beq _0810F19E
	b _0810F196
	.align 2, 0
_0810F17C: .4byte 0xFEFEFEFF
_0810F180: .4byte 0x80808080
_0810F184:
	cmp r2, #0
	beq _0810F18C
	cmp r0, #0
	bne _0810F190
_0810F18C:
	movs r0, #0
	b _0810F1A4
_0810F190:
	adds r6, #1
	adds r4, #1
	subs r2, #1
_0810F196:
	ldrb r0, [r6]
	ldrb r1, [r4]
	cmp r0, r1
	beq _0810F184
_0810F19E:
	ldrb r6, [r6]
	ldrb r4, [r4]
	subs r0, r6, r4
_0810F1A4:
	pop {r4, r5, r6, pc}
	.align 2, 0

	thumb_func_start strncpy
strncpy: @ 0x0810F1A8
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r3, r1, #0
	adds r0, r3, #0
	orrs r0, r7
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _0810F1EA
	cmp r2, #3
	bls _0810F1EA
	ldr r1, [r3]
	ldr r6, _0810F1CC @ =0xFEFEFEFF
	adds r0, r1, r6
	bics r0, r1
	ldr r5, _0810F1D0 @ =0x80808080
	b _0810F1E4
	.align 2, 0
_0810F1CC: .4byte 0xFEFEFEFF
_0810F1D0: .4byte 0x80808080
_0810F1D4:
	subs r2, #4
	ldm r3!, {r0}
	stm r4!, {r0}
	cmp r2, #3
	bls _0810F1EA
	ldr r1, [r3]
	adds r0, r1, r6
	bics r0, r1
_0810F1E4:
	ands r0, r5
	cmp r0, #0
	beq _0810F1D4
_0810F1EA:
	cmp r2, #0
	beq _0810F1FE
	subs r2, #1
	ldrb r0, [r3]
	strb r0, [r4]
	lsls r0, r0, #0x18
	adds r3, #1
	adds r4, #1
	cmp r0, #0
	bne _0810F1EA
_0810F1FE:
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	beq _0810F214
	movs r1, #0
_0810F208:
	strb r1, [r4]
	adds r4, #1
	adds r0, r2, #0
	subs r2, #1
	cmp r0, #0
	bne _0810F208
_0810F214:
	adds r0, r7, #0
	pop {r4, r5, r6, r7, pc}

	thumb_func_start __svfscanf
__svfscanf: @ 0x0810F218
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r4, _0810F260 @ =0xFFFFFD90
	add sp, r4
	adds r5, r0, #0
	mov r8, r2
	str r1, [sp, #0x260]
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x268]
	movs r2, #0
	str r2, [sp, #0x264]
	mov sb, r2
_0810F23A:
	ldr r3, [sp, #0x260]
	ldrb r2, [r3]
	adds r3, #1
	str r3, [sp, #0x260]
	cmp r2, #0
	bne _0810F24A
	bl _0810FDDE
_0810F24A:
	movs r0, #1
	cmp r0, #1
	bne _0810F2A4
	ldr r1, _0810F264 @ =gUnk_09E58579
	adds r1, r2, r1
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0810F2A4
	b _0810F276
	.align 2, 0
_0810F260: .4byte 0xFFFFFD90
_0810F264: .4byte gUnk_09E58579
_0810F268:
	movs r1, #1
	add sb, r1
	ldr r0, [r5, #4]
	subs r0, #1
	str r0, [r5, #4]
	adds r0, r2, #1
	str r0, [r5]
_0810F276:
	ldr r0, [r5, #4]
	cmp r0, #0
	bgt _0810F28A
	adds r0, r5, #0
	bl __srefill
	cmp r0, #0
	beq _0810F28A
	bl _0810FDDE
_0810F28A:
	ldr r2, [r5]
	ldr r1, _0810F2A0 @ =gUnk_09E58579
	ldrb r3, [r2]
	adds r1, r3, r1
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0810F268
	b _0810F23A
	.align 2, 0
_0810F2A0: .4byte gUnk_09E58579
_0810F2A4:
	cmp r2, #0x25
	beq _0810F2AA
	b _0810F4B0
_0810F2AA:
	movs r3, #0
	movs r7, #0
_0810F2AE:
	ldr r0, [sp, #0x260]
	ldrb r4, [r0]
	adds r0, #1
	str r0, [sp, #0x260]
	cmp r4, #0x78
	bls _0810F2BC
	b _0810F606
_0810F2BC:
	lsls r0, r4, #2
	ldr r1, _0810F2C8 @ =_0810F2CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810F2C8: .4byte _0810F2CC
_0810F2CC: @ jump table
	.4byte _0810F5FE @ case 0
	.4byte _0810F606 @ case 1
	.4byte _0810F606 @ case 2
	.4byte _0810F606 @ case 3
	.4byte _0810F606 @ case 4
	.4byte _0810F606 @ case 5
	.4byte _0810F606 @ case 6
	.4byte _0810F606 @ case 7
	.4byte _0810F606 @ case 8
	.4byte _0810F606 @ case 9
	.4byte _0810F606 @ case 10
	.4byte _0810F606 @ case 11
	.4byte _0810F606 @ case 12
	.4byte _0810F606 @ case 13
	.4byte _0810F606 @ case 14
	.4byte _0810F606 @ case 15
	.4byte _0810F606 @ case 16
	.4byte _0810F606 @ case 17
	.4byte _0810F606 @ case 18
	.4byte _0810F606 @ case 19
	.4byte _0810F606 @ case 20
	.4byte _0810F606 @ case 21
	.4byte _0810F606 @ case 22
	.4byte _0810F606 @ case 23
	.4byte _0810F606 @ case 24
	.4byte _0810F606 @ case 25
	.4byte _0810F606 @ case 26
	.4byte _0810F606 @ case 27
	.4byte _0810F606 @ case 28
	.4byte _0810F606 @ case 29
	.4byte _0810F606 @ case 30
	.4byte _0810F606 @ case 31
	.4byte _0810F606 @ case 32
	.4byte _0810F606 @ case 33
	.4byte _0810F606 @ case 34
	.4byte _0810F606 @ case 35
	.4byte _0810F606 @ case 36
	.4byte _0810F4B0 @ case 37
	.4byte _0810F606 @ case 38
	.4byte _0810F606 @ case 39
	.4byte _0810F606 @ case 40
	.4byte _0810F606 @ case 41
	.4byte _0810F4F8 @ case 42
	.4byte _0810F606 @ case 43
	.4byte _0810F606 @ case 44
	.4byte _0810F606 @ case 45
	.4byte _0810F606 @ case 46
	.4byte _0810F606 @ case 47
	.4byte _0810F510 @ case 48
	.4byte _0810F510 @ case 49
	.4byte _0810F510 @ case 50
	.4byte _0810F510 @ case 51
	.4byte _0810F510 @ case 52
	.4byte _0810F510 @ case 53
	.4byte _0810F510 @ case 54
	.4byte _0810F510 @ case 55
	.4byte _0810F510 @ case 56
	.4byte _0810F510 @ case 57
	.4byte _0810F606 @ case 58
	.4byte _0810F606 @ case 59
	.4byte _0810F606 @ case 60
	.4byte _0810F606 @ case 61
	.4byte _0810F606 @ case 62
	.4byte _0810F606 @ case 63
	.4byte _0810F606 @ case 64
	.4byte _0810F606 @ case 65
	.4byte _0810F606 @ case 66
	.4byte _0810F606 @ case 67
	.4byte _0810F51E @ case 68
	.4byte _0810F578 @ case 69
	.4byte _0810F606 @ case 70
	.4byte _0810F578 @ case 71
	.4byte _0810F606 @ case 72
	.4byte _0810F606 @ case 73
	.4byte _0810F606 @ case 74
	.4byte _0810F606 @ case 75
	.4byte _0810F504 @ case 76
	.4byte _0810F606 @ case 77
	.4byte _0810F606 @ case 78
	.4byte _0810F53C @ case 79
	.4byte _0810F606 @ case 80
	.4byte _0810F606 @ case 81
	.4byte _0810F606 @ case 82
	.4byte _0810F606 @ case 83
	.4byte _0810F606 @ case 84
	.4byte _0810F606 @ case 85
	.4byte _0810F606 @ case 86
	.4byte _0810F606 @ case 87
	.4byte _0810F560 @ case 88
	.4byte _0810F606 @ case 89
	.4byte _0810F606 @ case 90
	.4byte _0810F580 @ case 91
	.4byte _0810F606 @ case 92
	.4byte _0810F606 @ case 93
	.4byte _0810F606 @ case 94
	.4byte _0810F606 @ case 95
	.4byte _0810F606 @ case 96
	.4byte _0810F606 @ case 97
	.4byte _0810F606 @ case 98
	.4byte _0810F596 @ case 99
	.4byte _0810F522 @ case 100
	.4byte _0810F578 @ case 101
	.4byte _0810F578 @ case 102
	.4byte _0810F578 @ case 103
	.4byte _0810F50A @ case 104
	.4byte _0810F52C @ case 105
	.4byte _0810F606 @ case 106
	.4byte _0810F606 @ case 107
	.4byte _0810F4FE @ case 108
	.4byte _0810F606 @ case 109
	.4byte _0810F5B4 @ case 110
	.4byte _0810F540 @ case 111
	.4byte _0810F59E @ case 112
	.4byte _0810F606 @ case 113
	.4byte _0810F606 @ case 114
	.4byte _0810F57C @ case 115
	.4byte _0810F606 @ case 116
	.4byte _0810F550 @ case 117
	.4byte _0810F606 @ case 118
	.4byte _0810F606 @ case 119
	.4byte _0810F560 @ case 120
_0810F4B0:
	ldr r1, [sp, #0x260]
	movs r2, #1
	subs r4, r1, r2
	movs r7, #0
	cmp r7, #1
	blt _0810F4BE
	b _0810F23A
_0810F4BE:
	ldr r0, [r5, #4]
	cmp r0, #0
	bgt _0810F4D2
	adds r0, r5, #0
	bl __srefill
	cmp r0, #0
	beq _0810F4D2
	bl _0810FDD2
_0810F4D2:
	ldr r1, [r5]
	ldrb r3, [r1]
	ldrb r0, [r4]
	cmp r3, r0
	beq _0810F4E0
	bl _0810FDDE
_0810F4E0:
	ldr r0, [r5, #4]
	subs r0, #1
	str r0, [r5, #4]
	adds r0, r1, #1
	str r0, [r5]
	movs r1, #1
	add sb, r1
	adds r4, #1
	adds r7, #1
	cmp r7, #1
	blt _0810F4BE
	b _0810F23A
_0810F4F8:
	movs r0, #8
	orrs r7, r0
	b _0810F2AE
_0810F4FE:
	movs r0, #1
	orrs r7, r0
	b _0810F2AE
_0810F504:
	movs r0, #2
	orrs r7, r0
	b _0810F2AE
_0810F50A:
	movs r0, #4
	orrs r7, r0
	b _0810F2AE
_0810F510:
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r4
	adds r3, r0, #0
	subs r3, #0x30
	b _0810F2AE
_0810F51E:
	movs r0, #1
	orrs r7, r0
_0810F522:
	movs r4, #3
	ldr r2, _0810F528 @ =strtol
	b _0810F554
	.align 2, 0
_0810F528: .4byte strtol
_0810F52C:
	movs r4, #3
	ldr r1, _0810F538 @ =strtol
	str r1, [sp, #0x268]
	movs r2, #0
	mov sl, r2
	b _0810F622
	.align 2, 0
_0810F538: .4byte strtol
_0810F53C:
	movs r0, #1
	orrs r7, r0
_0810F540:
	movs r4, #3
	ldr r0, _0810F54C @ =strtoul
	str r0, [sp, #0x268]
	movs r1, #8
	b _0810F620
	.align 2, 0
_0810F54C: .4byte strtoul
_0810F550:
	movs r4, #3
	ldr r2, _0810F55C @ =strtoul
_0810F554:
	str r2, [sp, #0x268]
	movs r0, #0xa
	mov sl, r0
	b _0810F622
	.align 2, 0
_0810F55C: .4byte strtoul
_0810F560:
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r7, r0
	movs r4, #3
	ldr r1, _0810F574 @ =strtoul
	str r1, [sp, #0x268]
	movs r2, #0x10
	mov sl, r2
	b _0810F622
	.align 2, 0
_0810F574: .4byte strtoul
_0810F578:
	movs r4, #4
	b _0810F622
_0810F57C:
	movs r4, #2
	b _0810F622
_0810F580:
	mov r0, sp
	ldr r1, [sp, #0x260]
	str r3, [sp, #0x26c]
	bl __sccl
	str r0, [sp, #0x260]
	movs r0, #0x20
	orrs r7, r0
	movs r4, #1
	ldr r3, [sp, #0x26c]
	b _0810F622
_0810F596:
	movs r0, #0x20
	orrs r7, r0
	movs r4, #0
	b _0810F622
_0810F59E:
	movs r0, #0x88
	lsls r0, r0, #1
	orrs r7, r0
	movs r4, #3
	ldr r0, _0810F5B0 @ =strtoul
	str r0, [sp, #0x268]
	movs r1, #0x10
	b _0810F620
	.align 2, 0
_0810F5B0: .4byte strtoul
_0810F5B4:
	movs r0, #8
	ands r0, r7
	cmp r0, #0
	beq _0810F5BE
	b _0810F23A
_0810F5BE:
	movs r0, #4
	ands r0, r7
	cmp r0, #0
	beq _0810F5D6
	movs r2, #4
	add r8, r2
	mov r0, r8
	subs r0, #4
	ldr r0, [r0]
	mov r3, sb
	strh r3, [r0]
	b _0810F23A
_0810F5D6:
	movs r0, #1
	ands r7, r0
	cmp r7, #0
	beq _0810F5EE
	movs r0, #4
	add r8, r0
	mov r0, r8
	subs r0, #4
	ldr r0, [r0]
	mov r1, sb
	str r1, [r0]
	b _0810F23A
_0810F5EE:
	movs r2, #4
	add r8, r2
	mov r0, r8
	subs r0, #4
	ldr r0, [r0]
	mov r3, sb
	str r3, [r0]
	b _0810F23A
_0810F5FE:
	movs r0, #1
	rsbs r0, r0, #0
	bl _0810FDE0
_0810F606:
	ldr r1, _0810F644 @ =gUnk_09E58579
	adds r1, r4, r1
	movs r2, #1
	adds r0, r2, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0810F618
	orrs r7, r2
_0810F618:
	movs r4, #3
	ldr r0, _0810F648 @ =strtol
	str r0, [sp, #0x268]
	movs r1, #0xa
_0810F620:
	mov sl, r1
_0810F622:
	ldr r0, [r5, #4]
	cmp r0, #0
	bgt _0810F638
	adds r0, r5, #0
	str r3, [sp, #0x26c]
	bl __srefill
	ldr r3, [sp, #0x26c]
	cmp r0, #0
	beq _0810F638
	b _0810FDD2
_0810F638:
	movs r0, #0x20
	ands r0, r7
	cmp r0, #0
	bne _0810F682
	b _0810F670
	.align 2, 0
_0810F644: .4byte gUnk_09E58579
_0810F648: .4byte strtol
_0810F64C:
	movs r1, #1
	add sb, r1
	ldr r0, [r5, #4]
	subs r0, #1
	str r0, [r5, #4]
	cmp r0, #0
	ble _0810F660
	adds r0, r2, #1
	str r0, [r5]
	b _0810F670
_0810F660:
	adds r0, r5, #0
	str r3, [sp, #0x26c]
	bl __srefill
	ldr r3, [sp, #0x26c]
	cmp r0, #0
	beq _0810F670
	b _0810FDD2
_0810F670:
	ldr r2, [r5]
	ldr r1, _0810F694 @ =gUnk_09E58579
	ldrb r0, [r2]
	adds r1, r0, r1
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0810F64C
_0810F682:
	cmp r4, #4
	bls _0810F688
	b _0810F23A
_0810F688:
	lsls r0, r4, #2
	ldr r1, _0810F698 @ =_0810F69C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810F694: .4byte gUnk_09E58579
_0810F698: .4byte _0810F69C
_0810F69C: @ jump table
	.4byte _0810F6B0 @ case 0
	.4byte _0810F71A @ case 1
	.4byte _0810F7DE @ case 2
	.4byte _0810F8C0 @ case 3
	.4byte _0810FB92 @ case 4
_0810F6B0:
	cmp r3, #0
	bne _0810F6B6
	movs r3, #1
_0810F6B6:
	movs r0, #8
	ands r7, r0
	cmp r7, #0
	beq _0810F6F6
	movs r4, #0
_0810F6C0:
	ldr r7, [r5, #4]
	cmp r7, r3
	bhs _0810F6E6
	adds r4, r4, r7
	subs r3, r3, r7
	ldr r0, [r5]
	adds r0, r0, r7
	str r0, [r5]
	adds r0, r5, #0
	str r3, [sp, #0x26c]
	bl __srefill
	ldr r3, [sp, #0x26c]
	cmp r0, #0
	beq _0810F6C0
	cmp r4, #0
	bne _0810F6E4
	b _0810FDD2
_0810F6E4:
	b _0810F6F2
_0810F6E6:
	adds r4, r4, r3
	subs r0, r7, r3
	str r0, [r5, #4]
	ldr r0, [r5]
	adds r0, r0, r3
	str r0, [r5]
_0810F6F2:
	add sb, r4
	b _0810F23A
_0810F6F6:
	movs r1, #4
	add r8, r1
	mov r0, r8
	subs r0, #4
	ldr r0, [r0]
	movs r1, #1
	adds r2, r3, #0
	adds r3, r5, #0
	bl fread
	cmp r0, #0
	bne _0810F710
	b _0810FDD2
_0810F710:
	add sb, r0
	ldr r2, [sp, #0x264]
	adds r2, #1
	str r2, [sp, #0x264]
	b _0810F23A
_0810F71A:
	cmp r3, #0
	bne _0810F722
	movs r3, #1
	rsbs r3, r3, #0
_0810F722:
	movs r0, #8
	ands r7, r0
	cmp r7, #0
	beq _0810F77E
	movs r7, #0
	ldr r1, [r5]
	ldrb r0, [r1]
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _0810F776
	movs r7, #1
	b _0810F766
_0810F73C:
	ldr r0, [r5, #4]
	cmp r0, #0
	bgt _0810F758
	adds r0, r5, #0
	str r3, [sp, #0x26c]
	bl __srefill
	ldr r3, [sp, #0x26c]
	cmp r0, #0
	beq _0810F758
	cmp r7, #0
	bne _0810F756
	b _0810FDD2
_0810F756:
	b _0810F776
_0810F758:
	ldr r1, [r5]
	ldrb r0, [r1]
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _0810F776
	adds r7, #1
_0810F766:
	ldr r0, [r5, #4]
	subs r0, #1
	str r0, [r5, #4]
	adds r0, r1, #1
	str r0, [r5]
	subs r3, #1
	cmp r3, #0
	bne _0810F73C
_0810F776:
	cmp r7, #0
	bne _0810F77C
	b _0810FDDE
_0810F77C:
	b _0810F844
_0810F77E:
	movs r0, #4
	add r8, r0
	mov r0, r8
	subs r0, #4
	ldr r6, [r0]
	adds r7, r6, #0
	b _0810F7A8
_0810F78C:
	ldr r0, [r5, #4]
	cmp r0, #0
	bgt _0810F7A8
	adds r0, r5, #0
	str r3, [sp, #0x26c]
	bl __srefill
	ldr r3, [sp, #0x26c]
	cmp r0, #0
	beq _0810F7A8
	cmp r6, r7
	bne _0810F7A6
	b _0810FDD2
_0810F7A6:
	b _0810F7CA
_0810F7A8:
	ldr r1, [r5]
	ldrb r0, [r1]
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0
	beq _0810F7CA
	ldr r0, [r5, #4]
	subs r0, #1
	str r0, [r5, #4]
	ldrb r0, [r1]
	strb r0, [r6]
	adds r0, r1, #1
	str r0, [r5]
	adds r6, #1
	subs r3, #1
	cmp r3, #0
	bne _0810F78C
_0810F7CA:
	subs r7, r6, r7
	cmp r7, #0
	bne _0810F7D2
	b _0810FDDE
_0810F7D2:
	movs r0, #0
	strb r0, [r6]
	ldr r1, [sp, #0x264]
	adds r1, #1
	str r1, [sp, #0x264]
	b _0810F844
_0810F7DE:
	cmp r3, #0
	bne _0810F7E6
	movs r3, #1
	rsbs r3, r3, #0
_0810F7E6:
	movs r4, #8
	ands r7, r4
	cmp r7, #0
	beq _0810F84C
	movs r7, #0
	ldr r2, [r5]
	ldr r1, _0810F808 @ =gUnk_09E58579
	ldrb r0, [r2]
	adds r1, r0, r1
	adds r0, r4, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0810F844
	movs r7, #1
	b _0810F834
	.align 2, 0
_0810F808: .4byte gUnk_09E58579
_0810F80C:
	ldr r0, [r5, #4]
	cmp r0, #0
	bgt _0810F820
	adds r0, r5, #0
	str r3, [sp, #0x26c]
	bl __srefill
	ldr r3, [sp, #0x26c]
	cmp r0, #0
	bne _0810F844
_0810F820:
	ldr r2, [r5]
	ldr r1, _0810F848 @ =gUnk_09E58579
	ldrb r0, [r2]
	adds r1, r0, r1
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0810F844
	adds r7, #1
_0810F834:
	ldr r0, [r5, #4]
	subs r0, #1
	str r0, [r5, #4]
	adds r0, r2, #1
	str r0, [r5]
	subs r3, #1
	cmp r3, #0
	bne _0810F80C
_0810F844:
	add sb, r7
	b _0810F23A
	.align 2, 0
_0810F848: .4byte gUnk_09E58579
_0810F84C:
	movs r1, #4
	add r8, r1
	mov r0, r8
	subs r0, #4
	ldr r6, [r0]
	adds r7, r6, #0
	ldr r2, [r5]
	ldr r0, _0810F870 @ =gUnk_09E58579
	ldrb r1, [r2]
	adds r0, r1, r0
	adds r1, r4, #0
	ldrb r0, [r0]
	ands r1, r0
	ldr r4, [sp, #0x264]
	adds r4, #1
	cmp r1, #0
	bne _0810F8B0
	b _0810F89A
	.align 2, 0
_0810F870: .4byte gUnk_09E58579
_0810F874:
	ldr r0, [r5, #4]
	cmp r0, #0
	bgt _0810F888
	adds r0, r5, #0
	str r3, [sp, #0x26c]
	bl __srefill
	ldr r3, [sp, #0x26c]
	cmp r0, #0
	bne _0810F8B0
_0810F888:
	ldr r2, [r5]
	ldr r1, _0810F8BC @ =gUnk_09E58579
	ldrb r0, [r2]
	adds r1, r0, r1
	movs r0, #8
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0810F8B0
_0810F89A:
	ldr r0, [r5, #4]
	subs r0, #1
	str r0, [r5, #4]
	ldrb r0, [r2]
	strb r0, [r6]
	adds r0, r2, #1
	str r0, [r5]
	adds r6, #1
	subs r3, #1
	cmp r3, #0
	bne _0810F874
_0810F8B0:
	movs r0, #0
	strb r0, [r6]
	subs r0, r6, r7
	add sb, r0
	str r4, [sp, #0x264]
	b _0810F23A
	.align 2, 0
_0810F8BC: .4byte gUnk_09E58579
_0810F8C0:
	subs r3, #1
	movs r0, #0xae
	lsls r0, r0, #1
	cmp r3, r0
	bls _0810F8CC
	adds r3, r0, #0
_0810F8CC:
	adds r3, #1
	movs r0, #0xb0
	lsls r0, r0, #2
	orrs r7, r0
	add r6, sp, #0x100
	cmp r3, #0
	bne _0810F8DC
	b _0810FB06
_0810F8DC:
	ldr r0, [r5]
	ldrb r4, [r0]
	adds r0, r4, #0
	subs r0, #0x2b
	cmp r0, #0x4d
	bls _0810F8EA
	b _0810FB06
_0810F8EA:
	lsls r0, r0, #2
	ldr r1, _0810F8F4 @ =_0810F8F8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810F8F4: .4byte _0810F8F8
_0810F8F8: @ jump table
	.4byte _0810FAA8 @ case 0
	.4byte _0810FB06 @ case 1
	.4byte _0810FAA8 @ case 2
	.4byte _0810FB06 @ case 3
	.4byte _0810FB06 @ case 4
	.4byte _0810FA30 @ case 5
	.4byte _0810FA5C @ case 6
	.4byte _0810FA5C @ case 7
	.4byte _0810FA5C @ case 8
	.4byte _0810FA5C @ case 9
	.4byte _0810FA5C @ case 10
	.4byte _0810FA5C @ case 11
	.4byte _0810FA5C @ case 12
	.4byte _0810FA78 @ case 13
	.4byte _0810FA78 @ case 14
	.4byte _0810FB06 @ case 15
	.4byte _0810FB06 @ case 16
	.4byte _0810FB06 @ case 17
	.4byte _0810FB06 @ case 18
	.4byte _0810FB06 @ case 19
	.4byte _0810FB06 @ case 20
	.4byte _0810FB06 @ case 21
	.4byte _0810FA98 @ case 22
	.4byte _0810FA98 @ case 23
	.4byte _0810FA98 @ case 24
	.4byte _0810FA98 @ case 25
	.4byte _0810FA98 @ case 26
	.4byte _0810FA98 @ case 27
	.4byte _0810FB06 @ case 28
	.4byte _0810FB06 @ case 29
	.4byte _0810FB06 @ case 30
	.4byte _0810FB06 @ case 31
	.4byte _0810FB06 @ case 32
	.4byte _0810FB06 @ case 33
	.4byte _0810FB06 @ case 34
	.4byte _0810FB06 @ case 35
	.4byte _0810FB06 @ case 36
	.4byte _0810FB06 @ case 37
	.4byte _0810FB06 @ case 38
	.4byte _0810FB06 @ case 39
	.4byte _0810FB06 @ case 40
	.4byte _0810FB06 @ case 41
	.4byte _0810FB06 @ case 42
	.4byte _0810FB06 @ case 43
	.4byte _0810FB06 @ case 44
	.4byte _0810FAB6 @ case 45
	.4byte _0810FB06 @ case 46
	.4byte _0810FB06 @ case 47
	.4byte _0810FB06 @ case 48
	.4byte _0810FB06 @ case 49
	.4byte _0810FB06 @ case 50
	.4byte _0810FB06 @ case 51
	.4byte _0810FB06 @ case 52
	.4byte _0810FB06 @ case 53
	.4byte _0810FA98 @ case 54
	.4byte _0810FA98 @ case 55
	.4byte _0810FA98 @ case 56
	.4byte _0810FA98 @ case 57
	.4byte _0810FA98 @ case 58
	.4byte _0810FA98 @ case 59
	.4byte _0810FB06 @ case 60
	.4byte _0810FB06 @ case 61
	.4byte _0810FB06 @ case 62
	.4byte _0810FB06 @ case 63
	.4byte _0810FB06 @ case 64
	.4byte _0810FB06 @ case 65
	.4byte _0810FB06 @ case 66
	.4byte _0810FB06 @ case 67
	.4byte _0810FB06 @ case 68
	.4byte _0810FB06 @ case 69
	.4byte _0810FB06 @ case 70
	.4byte _0810FB06 @ case 71
	.4byte _0810FB06 @ case 72
	.4byte _0810FB06 @ case 73
	.4byte _0810FB06 @ case 74
	.4byte _0810FB06 @ case 75
	.4byte _0810FB06 @ case 76
	.4byte _0810FAB6 @ case 77
_0810FA30:
	mov r1, sl
	cmp r1, #0
	bne _0810FA40
	movs r2, #8
	mov sl, r2
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r7, r0
_0810FA40:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r7
	cmp r0, #0
	beq _0810FA54
	ldr r0, _0810FA50 @ =0xFFFFFD3F
	b _0810FACE
	.align 2, 0
_0810FA50: .4byte 0xFFFFFD3F
_0810FA54:
	ldr r0, _0810FA58 @ =0xFFFFFE3F
	b _0810FACE
	.align 2, 0
_0810FA58: .4byte 0xFFFFFE3F
_0810FA5C:
	ldr r0, _0810FA70 @ =gUnk_09E58554
	mov r2, sl
	lsls r1, r2, #1
	adds r1, r1, r0
	movs r2, #0
	ldrsh r0, [r1, r2]
	mov sl, r0
	ldr r0, _0810FA74 @ =0xFFFFFE3F
	b _0810FACE
	.align 2, 0
_0810FA70: .4byte gUnk_09E58554
_0810FA74: .4byte 0xFFFFFE3F
_0810FA78:
	ldr r1, _0810FA90 @ =gUnk_09E58554
	mov r2, sl
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov sl, r1
	cmp r1, #8
	ble _0810FB06
	ldr r0, _0810FA94 @ =0xFFFFFE3F
	b _0810FACE
	.align 2, 0
_0810FA90: .4byte gUnk_09E58554
_0810FA94: .4byte 0xFFFFFE3F
_0810FA98:
	mov r0, sl
	cmp r0, #0xa
	ble _0810FB06
	ldr r0, _0810FAA4 @ =0xFFFFFE3F
	b _0810FACE
	.align 2, 0
_0810FAA4: .4byte 0xFFFFFE3F
_0810FAA8:
	movs r0, #0x40
	ands r0, r7
	cmp r0, #0
	beq _0810FB06
	movs r0, #0x41
	rsbs r0, r0, #0
	b _0810FACE
_0810FAB6:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r7
	cmp r0, #0
	beq _0810FB06
	ldr r0, _0810FAE8 @ =0x00000101
	add r0, sp
	cmp r6, r0
	bne _0810FB06
	movs r1, #0x10
	mov sl, r1
	ldr r0, _0810FAEC @ =0xFFFFFEFF
_0810FACE:
	ands r7, r0
	strb r4, [r6]
	adds r6, #1
	ldr r0, [r5, #4]
	subs r0, #1
	str r0, [r5, #4]
	cmp r0, #0
	ble _0810FAF0
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	b _0810FAFE
	.align 2, 0
_0810FAE8: .4byte 0x00000101
_0810FAEC: .4byte 0xFFFFFEFF
_0810FAF0:
	adds r0, r5, #0
	str r3, [sp, #0x26c]
	bl __srefill
	ldr r3, [sp, #0x26c]
	cmp r0, #0
	bne _0810FB06
_0810FAFE:
	subs r3, #1
	cmp r3, #0
	beq _0810FB06
	b _0810F8DC
_0810FB06:
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0810FB22
	add r0, sp, #0x100
	cmp r6, r0
	bhi _0810FB16
	b _0810FDDE
_0810FB16:
	subs r6, #1
	ldrb r0, [r6]
	adds r1, r5, #0
	bl ungetc
	b _0810FDDE
_0810FB22:
	subs r0, r6, #1
	ldrb r4, [r0]
	cmp r4, #0x78
	beq _0810FB2E
	cmp r4, #0x58
	bne _0810FB38
_0810FB2E:
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ungetc
_0810FB38:
	movs r0, #8
	ands r0, r7
	cmp r0, #0
	beq _0810FB42
	b _0810FDC8
_0810FB42:
	strb r0, [r6]
	add r0, sp, #0x100
	movs r1, #0
	mov r2, sl
	ldr r3, [sp, #0x268]
	bl _call_via_r3
	adds r1, r0, #0
	movs r0, #0x10
	ands r0, r7
	cmp r0, #0
	bne _0810FB7E
	movs r0, #4
	ands r0, r7
	cmp r0, #0
	beq _0810FB70
	movs r2, #4
	add r8, r2
	mov r0, r8
	subs r0, #4
	ldr r0, [r0]
	strh r1, [r0]
	b _0810FB8A
_0810FB70:
	movs r0, #1
	ands r7, r0
	cmp r7, #0
	beq _0810FB7E
	movs r3, #4
	add r8, r3
	b _0810FB82
_0810FB7E:
	movs r0, #4
	add r8, r0
_0810FB82:
	mov r0, r8
	subs r0, #4
	ldr r0, [r0]
	str r1, [r0]
_0810FB8A:
	ldr r1, [sp, #0x264]
	adds r1, #1
	str r1, [sp, #0x264]
	b _0810FDC8
_0810FB92:
	subs r3, #1
	movs r0, #0xae
	lsls r0, r0, #1
	cmp r3, r0
	bls _0810FB9E
	adds r3, r0, #0
_0810FB9E:
	adds r3, #1
	movs r0, #0xf0
	lsls r0, r0, #2
	orrs r7, r0
	add r6, sp, #0x100
	cmp r3, #0
	bne _0810FBAE
	b _0810FD2A
_0810FBAE:
	ldr r0, [r5]
	ldrb r4, [r0]
	adds r0, r4, #0
	subs r0, #0x2b
	cmp r0, #0x3a
	bls _0810FBBC
	b _0810FD2A
_0810FBBC:
	lsls r0, r0, #2
	ldr r1, _0810FBC8 @ =_0810FBCC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0810FBC8: .4byte _0810FBCC
_0810FBCC: @ jump table
	.4byte _0810FCC0 @ case 0
	.4byte _0810FD2A @ case 1
	.4byte _0810FCC0 @ case 2
	.4byte _0810FCD0 @ case 3
	.4byte _0810FD2A @ case 4
	.4byte _0810FCB8 @ case 5
	.4byte _0810FCB8 @ case 6
	.4byte _0810FCB8 @ case 7
	.4byte _0810FCB8 @ case 8
	.4byte _0810FCB8 @ case 9
	.4byte _0810FCB8 @ case 10
	.4byte _0810FCB8 @ case 11
	.4byte _0810FCB8 @ case 12
	.4byte _0810FCB8 @ case 13
	.4byte _0810FCB8 @ case 14
	.4byte _0810FD2A @ case 15
	.4byte _0810FD2A @ case 16
	.4byte _0810FD2A @ case 17
	.4byte _0810FD2A @ case 18
	.4byte _0810FD2A @ case 19
	.4byte _0810FD2A @ case 20
	.4byte _0810FD2A @ case 21
	.4byte _0810FD2A @ case 22
	.4byte _0810FD2A @ case 23
	.4byte _0810FD2A @ case 24
	.4byte _0810FD2A @ case 25
	.4byte _0810FCE4 @ case 26
	.4byte _0810FD2A @ case 27
	.4byte _0810FD2A @ case 28
	.4byte _0810FD2A @ case 29
	.4byte _0810FD2A @ case 30
	.4byte _0810FD2A @ case 31
	.4byte _0810FD2A @ case 32
	.4byte _0810FD2A @ case 33
	.4byte _0810FD2A @ case 34
	.4byte _0810FD2A @ case 35
	.4byte _0810FD2A @ case 36
	.4byte _0810FD2A @ case 37
	.4byte _0810FD2A @ case 38
	.4byte _0810FD2A @ case 39
	.4byte _0810FD2A @ case 40
	.4byte _0810FD2A @ case 41
	.4byte _0810FD2A @ case 42
	.4byte _0810FD2A @ case 43
	.4byte _0810FD2A @ case 44
	.4byte _0810FD2A @ case 45
	.4byte _0810FD2A @ case 46
	.4byte _0810FD2A @ case 47
	.4byte _0810FD2A @ case 48
	.4byte _0810FD2A @ case 49
	.4byte _0810FD2A @ case 50
	.4byte _0810FD2A @ case 51
	.4byte _0810FD2A @ case 52
	.4byte _0810FD2A @ case 53
	.4byte _0810FD2A @ case 54
	.4byte _0810FD2A @ case 55
	.4byte _0810FD2A @ case 56
	.4byte _0810FD2A @ case 57
	.4byte _0810FCE4 @ case 58
_0810FCB8:
	movs r0, #0xc1
	rsbs r0, r0, #0
	ands r7, r0
	b _0810FCFA
_0810FCC0:
	movs r0, #0x40
	ands r0, r7
	cmp r0, #0
	beq _0810FD2A
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r7, r0
	b _0810FCFA
_0810FCD0:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r7
	cmp r0, #0
	beq _0810FD2A
	ldr r0, _0810FCE0 @ =0xFFFFFEBF
	ands r7, r0
	b _0810FCFA
	.align 2, 0
_0810FCE0: .4byte 0xFFFFFEBF
_0810FCE4:
	movs r0, #0xa0
	lsls r0, r0, #2
	ands r0, r7
	movs r1, #0x80
	lsls r1, r1, #2
	cmp r0, r1
	bne _0810FD2A
	ldr r0, _0810FD10 @ =0xFFFFFCFF
	ands r7, r0
	movs r0, #0xc0
	orrs r7, r0
_0810FCFA:
	strb r4, [r6]
	adds r6, #1
	ldr r0, [r5, #4]
	subs r0, #1
	str r0, [r5, #4]
	cmp r0, #0
	ble _0810FD14
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
	b _0810FD22
	.align 2, 0
_0810FD10: .4byte 0xFFFFFCFF
_0810FD14:
	adds r0, r5, #0
	str r3, [sp, #0x26c]
	bl __srefill
	ldr r3, [sp, #0x26c]
	cmp r0, #0
	bne _0810FD2A
_0810FD22:
	subs r3, #1
	cmp r3, #0
	beq _0810FD2A
	b _0810FBAE
_0810FD2A:
	movs r0, #0x80
	ands r0, r7
	cmp r0, #0
	beq _0810FD74
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r7
	cmp r0, #0
	beq _0810FD54
	add r0, sp, #0x100
	cmp r6, r0
	bls _0810FDDE
	adds r4, r0, #0
_0810FD44:
	subs r6, #1
	ldrb r0, [r6]
	adds r1, r5, #0
	bl ungetc
	cmp r6, r4
	bhi _0810FD44
	b _0810FDDE
_0810FD54:
	subs r6, #1
	ldrb r4, [r6]
	cmp r4, #0x65
	beq _0810FD6C
	cmp r4, #0x45
	beq _0810FD6C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ungetc
	subs r6, #1
	ldrb r4, [r6]
_0810FD6C:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ungetc
_0810FD74:
	movs r0, #8
	ands r0, r7
	cmp r0, #0
	bne _0810FDC8
	strb r0, [r6]
	add r0, sp, #0x100
	bl atof
	adds r2, r1, #0
	adds r1, r0, #0
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	beq _0810FD96
	movs r3, #4
	add r8, r3
	b _0810FDA2
_0810FD96:
	movs r0, #2
	ands r7, r0
	cmp r7, #0
	beq _0810FDAE
	movs r0, #4
	add r8, r0
_0810FDA2:
	mov r0, r8
	subs r0, #4
	ldr r0, [r0]
	str r1, [r0]
	str r2, [r0, #4]
	b _0810FDC2
_0810FDAE:
	movs r3, #4
	add r8, r3
	mov r0, r8
	subs r0, #4
	ldr r4, [r0]
	adds r0, r1, #0
	adds r1, r2, #0
	bl __truncdfsf2
	str r0, [r4]
_0810FDC2:
	ldr r0, [sp, #0x264]
	adds r0, #1
	str r0, [sp, #0x264]
_0810FDC8:
	add r0, sp, #0x100
	subs r0, r6, r0
	add sb, r0
	bl _0810F23A
_0810FDD2:
	ldr r0, [sp, #0x264]
	cmp r0, #0
	bne _0810FDE0
	movs r0, #1
	rsbs r0, r0, #0
	b _0810FDE0
_0810FDDE:
	ldr r0, [sp, #0x264]
_0810FDE0:
	movs r3, #0x9c
	lsls r3, r3, #2
	add sp, r3
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

	thumb_func_start __sccl
__sccl: @ 0x0810FDF0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrb r3, [r1]
	adds r1, #1
	cmp r3, #0x5e
	bne _0810FE04
	movs r6, #1
	ldrb r3, [r1]
	adds r1, #1
	b _0810FE06
_0810FE04:
	movs r6, #0
_0810FE06:
	adds r0, r5, #0
	adds r0, #0xff
_0810FE0A:
	strb r6, [r0]
	subs r0, #1
	cmp r0, r5
	bge _0810FE0A
	cmp r3, #0
	bne _0810FE1A
	subs r0, r1, #1
	b _0810FE68
_0810FE1A:
	movs r0, #1
	subs r6, r0, r6
_0810FE1E:
	ldrb r2, [r1]
_0810FE20:
	adds r0, r5, r3
	strb r6, [r0]
_0810FE24:
	adds r4, r2, #0
	adds r1, #1
	cmp r2, #0x2d
	beq _0810FE40
	cmp r2, #0x2d
	bgt _0810FE36
	cmp r2, #0
	beq _0810FE3C
	b _0810FE64
_0810FE36:
	cmp r2, #0x5d
	beq _0810FE60
	b _0810FE64
_0810FE3C:
	subs r0, r1, #1
	b _0810FE68
_0810FE40:
	ldrb r2, [r1]
	adds r4, r2, #0
	cmp r2, #0x5d
	beq _0810FE4C
	cmp r2, r3
	bge _0810FE50
_0810FE4C:
	movs r3, #0x2d
	b _0810FE20
_0810FE50:
	adds r1, #1
_0810FE52:
	adds r3, #1
	adds r0, r5, r3
	strb r6, [r0]
	cmp r3, r4
	blt _0810FE52
	ldrb r2, [r1]
	b _0810FE24
_0810FE60:
	adds r0, r1, #0
	b _0810FE68
_0810FE64:
	adds r3, r4, #0
	b _0810FE1E
_0810FE68:
	pop {r4, r5, r6, pc}
	.align 2, 0

	thumb_func_start atof
atof: @ 0x0810FE6C
	push {lr}
	movs r1, #0
	bl strtod
	pop {pc}
	.align 2, 0

	thumb_func_start fread
fread: @ 0x0810FE78
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	mov sb, r1
	mov sl, r2
	adds r5, r3, #0
	mov r6, sl
	muls r6, r1, r6
	cmp r6, #0
	bne _0810FEA2
	movs r0, #0
	b _0810FEEE
_0810FE96:
	mov r1, r8
	subs r0, r1, r6
	mov r1, sb
	bl __udivsi3
	b _0810FEEE
_0810FEA2:
	ldr r0, [r5, #4]
	cmp r0, #0
	bge _0810FEAC
	movs r0, #0
	str r0, [r5, #4]
_0810FEAC:
	mov r8, r6
	adds r7, r4, #0
	b _0810FED0
_0810FEB2:
	ldr r1, [r5]
	adds r0, r7, #0
	adds r2, r4, #0
	bl memcpy
	ldr r0, [r5]
	adds r0, r0, r4
	str r0, [r5]
	adds r7, r7, r4
	subs r6, r6, r4
	adds r0, r5, #0
	bl __srefill
	cmp r0, #0
	bne _0810FE96
_0810FED0:
	ldr r4, [r5, #4]
	cmp r6, r4
	bhi _0810FEB2
	ldr r1, [r5]
	adds r0, r7, #0
	adds r2, r6, #0
	bl memcpy
	ldr r0, [r5, #4]
	subs r0, r0, r6
	str r0, [r5, #4]
	ldr r0, [r5]
	adds r0, r0, r6
	str r0, [r5]
	mov r0, sl
_0810FEEE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

	thumb_func_start lflush
lflush: @ 0x0810FEF8
	push {lr}
	bl fflush
	pop {pc}

	thumb_func_start __srefill
__srefill: @ 0x0810FF00
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _0810FF10
	ldr r0, _0810FF6C @ =gUnk_09ED4D94
	ldr r0, [r0]
	str r0, [r4, #0x54]
_0810FF10:
	ldr r1, [r4, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _0810FF1E
	adds r0, r1, #0
	bl __sinit
_0810FF1E:
	movs r0, #0
	str r0, [r4, #4]
	ldrh r1, [r4, #0xc]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	cmp r5, #0
	bne _0810FFEA
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0810FF70
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0810FFEA
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0810FF60
	adds r0, r4, #0
	bl fflush
	cmp r0, #0
	bne _0810FFEA
	movs r0, #9
	rsbs r0, r0, #0
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
	str r5, [r4, #8]
	str r5, [r4, #0x18]
_0810FF60:
	movs r0, #4
	ldrh r2, [r4, #0xc]
	orrs r0, r2
	strh r0, [r4, #0xc]
	b _0810FF94
	.align 2, 0
_0810FF6C: .4byte gUnk_09ED4D94
_0810FF70:
	ldr r1, [r4, #0x30]
	cmp r1, #0
	beq _0810FF94
	adds r0, r4, #0
	adds r0, #0x40
	cmp r1, r0
	beq _0810FF84
	ldr r0, [r4, #0x54]
	bl _free_r
_0810FF84:
	str r5, [r4, #0x30]
	ldr r0, [r4, #0x3c]
	str r0, [r4, #4]
	cmp r0, #0
	beq _0810FF94
	ldr r0, [r4, #0x38]
	str r0, [r4]
	b _0810FFF0
_0810FF94:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0810FFA0
	adds r0, r4, #0
	bl __smakebuf
_0810FFA0:
	movs r0, #3
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _0810FFB2
	ldr r0, [r4, #0x54]
	ldr r1, _0810FFD8 @ =lflush
	bl _fwalk
_0810FFB2:
	ldr r1, [r4, #0x10]
	str r1, [r4]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x20]
	bl _call_via_r3
	str r0, [r4, #4]
	ldr r1, _0810FFDC @ =0xFFFFDFFF
	ldrh r2, [r4, #0xc]
	ands r1, r2
	movs r2, #0
	strh r1, [r4, #0xc]
	cmp r0, #0
	bgt _0810FFF0
	cmp r0, #0
	bne _0810FFE0
	movs r0, #0x20
	b _0810FFE6
	.align 2, 0
_0810FFD8: .4byte lflush
_0810FFDC: .4byte 0xFFFFDFFF
_0810FFE0:
	movs r0, #0
	str r0, [r4, #4]
	movs r0, #0x40
_0810FFE6:
	orrs r1, r0
	strh r1, [r4, #0xc]
_0810FFEA:
	movs r0, #1
	rsbs r0, r0, #0
	b _0810FFF2
_0810FFF0:
	movs r0, #0
_0810FFF2:
	pop {r4, r5, pc}

	thumb_func_start _strtod_r
_strtod_r: @ 0x0810FFF4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x68
	str r0, [sp, #0xc]
	adds r5, r1, #0
	str r2, [sp, #0x10]
	movs r2, #0
	mov ip, r2
	movs r0, #0
	str r0, [sp, #0x20]
	movs r6, #0
	movs r7, #0
	str r5, [sp, #0x28]
_08110014:
	ldr r1, [sp, #0x28]
	ldrb r0, [r1]
	cmp r0, #0x2d
	bhi _081100FE
	lsls r0, r0, #2
	ldr r1, _08110028 @ =_0811002C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08110028: .4byte _0811002C
_0811002C: @ jump table
	.4byte _081102F0 @ case 0
	.4byte _081100FE @ case 1
	.4byte _081100FE @ case 2
	.4byte _081100FE @ case 3
	.4byte _081100FE @ case 4
	.4byte _081100FE @ case 5
	.4byte _081100FE @ case 6
	.4byte _081100FE @ case 7
	.4byte _081100FE @ case 8
	.4byte _081100F6 @ case 9
	.4byte _081100F6 @ case 10
	.4byte _081100F6 @ case 11
	.4byte _081100F6 @ case 12
	.4byte _081100F6 @ case 13
	.4byte _081100FE @ case 14
	.4byte _081100FE @ case 15
	.4byte _081100FE @ case 16
	.4byte _081100FE @ case 17
	.4byte _081100FE @ case 18
	.4byte _081100FE @ case 19
	.4byte _081100FE @ case 20
	.4byte _081100FE @ case 21
	.4byte _081100FE @ case 22
	.4byte _081100FE @ case 23
	.4byte _081100FE @ case 24
	.4byte _081100FE @ case 25
	.4byte _081100FE @ case 26
	.4byte _081100FE @ case 27
	.4byte _081100FE @ case 28
	.4byte _081100FE @ case 29
	.4byte _081100FE @ case 30
	.4byte _081100FE @ case 31
	.4byte _081100F6 @ case 32
	.4byte _081100FE @ case 33
	.4byte _081100FE @ case 34
	.4byte _081100FE @ case 35
	.4byte _081100FE @ case 36
	.4byte _081100FE @ case 37
	.4byte _081100FE @ case 38
	.4byte _081100FE @ case 39
	.4byte _081100FE @ case 40
	.4byte _081100FE @ case 41
	.4byte _081100FE @ case 42
	.4byte _081100E8 @ case 43
	.4byte _081100FE @ case 44
	.4byte _081100E4 @ case 45
_081100E4:
	movs r3, #1
	str r3, [sp, #0x20]
_081100E8:
	ldr r0, [sp, #0x28]
	adds r0, #1
	str r0, [sp, #0x28]
	ldrb r0, [r0]
	cmp r0, #0
	bne _081100FE
	b _081102F0
_081100F6:
	ldr r1, [sp, #0x28]
	adds r1, #1
	str r1, [sp, #0x28]
	b _08110014
_081100FE:
	ldr r3, [sp, #0x28]
	ldrb r3, [r3]
	cmp r3, #0x30
	bne _0811012E
	movs r0, #1
	mov ip, r0
	ldr r1, [sp, #0x28]
	adds r1, #1
	str r1, [sp, #0x28]
	ldrb r3, [r1]
	cmp r3, #0x30
	bne _08110122
_08110116:
	ldr r0, [sp, #0x28]
	adds r0, #1
	str r0, [sp, #0x28]
	ldrb r1, [r0]
	cmp r1, #0x30
	beq _08110116
_08110122:
	ldr r3, [sp, #0x28]
	ldrb r0, [r3]
	cmp r0, #0
	bne _0811012E
	bl _08110AFE
_0811012E:
	ldr r0, [sp, #0x28]
	str r0, [sp, #0x2c]
	movs r1, #0
	mov sb, r1
	movs r3, #0
	str r3, [sp, #0x38]
	mov r8, r3
	mov sl, r3
	ldrb r1, [r0]
	b _08110178
_08110142:
	mov r0, sl
	cmp r0, #8
	bgt _08110158
	ldr r3, [sp, #0x38]
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r1
	subs r0, #0x30
	str r0, [sp, #0x38]
	b _0811016C
_08110158:
	mov r0, sl
	cmp r0, #0xf
	bgt _0811016C
	mov r3, sb
	lsls r0, r3, #2
	add r0, sb
	lsls r0, r0, #1
	adds r0, r0, r1
	subs r0, #0x30
	mov sb, r0
_0811016C:
	movs r0, #1
	add sl, r0
	ldr r1, [sp, #0x28]
	adds r1, #1
	str r1, [sp, #0x28]
	ldrb r1, [r1]
_08110178:
	cmp r1, #0x2f
	ble _08110180
	cmp r1, #0x39
	ble _08110142
_08110180:
	mov r3, sl
	str r3, [sp, #0x1c]
	cmp r1, #0x2e
	bne _0811022E
	ldr r0, [sp, #0x28]
	adds r0, #1
	str r0, [sp, #0x28]
	ldrb r1, [r0]
	cmp r3, #0
	bne _08110226
	cmp r1, #0x30
	bne _081101A6
_08110198:
	adds r2, #1
	ldr r1, [sp, #0x28]
	adds r1, #1
	str r1, [sp, #0x28]
	ldrb r1, [r1]
	cmp r1, #0x30
	beq _08110198
_081101A6:
	adds r0, r1, #0
	subs r0, #0x31
	cmp r0, #8
	bhi _0811022E
	ldr r3, [sp, #0x28]
	str r3, [sp, #0x2c]
	add r8, r2
	movs r2, #0
_081101B6:
	adds r2, #1
	subs r1, #0x30
	ldr r4, [sp, #0x28]
	adds r4, #1
	cmp r1, #0
	beq _08110222
	add r8, r2
	cmp r2, #1
	ble _081101F6
	subs r3, r2, #1
_081101CA:
	mov r0, sl
	movs r2, #1
	add sl, r2
	cmp r0, #8
	bgt _081101E0
	ldr r2, [sp, #0x38]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	str r0, [sp, #0x38]
	b _081101F0
_081101E0:
	mov r0, sl
	cmp r0, #0x10
	bgt _081101F0
	mov r2, sb
	lsls r0, r2, #2
	add r0, sb
	lsls r0, r0, #1
	mov sb, r0
_081101F0:
	subs r3, #1
	cmp r3, #0
	bne _081101CA
_081101F6:
	mov r0, sl
	movs r3, #1
	add sl, r3
	cmp r0, #8
	bgt _0811020E
	ldr r2, [sp, #0x38]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r0, r0, r1
	str r0, [sp, #0x38]
	b _08110220
_0811020E:
	mov r3, sl
	cmp r3, #0x10
	bgt _08110220
	mov r2, sb
	lsls r0, r2, #2
	add r0, sb
	lsls r0, r0, #1
	adds r0, r0, r1
	mov sb, r0
_08110220:
	movs r2, #0
_08110222:
	str r4, [sp, #0x28]
	ldrb r1, [r4]
_08110226:
	adds r0, r1, #0
	subs r0, #0x30
	cmp r0, #9
	bls _081101B6
_0811022E:
	movs r3, #0
	str r3, [sp, #0x24]
	cmp r1, #0x65
	beq _0811023A
	cmp r1, #0x45
	bne _081102D8
_0811023A:
	mov r0, sl
	cmp r0, #0
	bne _0811024A
	cmp r2, #0
	bne _0811024A
	mov r1, ip
	cmp r1, #0
	beq _081102F0
_0811024A:
	ldr r5, [sp, #0x28]
	movs r4, #0
	adds r3, r5, #0
	adds r3, #1
	str r3, [sp, #0x28]
	ldrb r1, [r3]
	cmp r1, #0x2b
	beq _08110260
	cmp r1, #0x2d
	bne _08110268
	movs r4, #1
_08110260:
	ldr r0, [sp, #0x28]
	adds r0, #1
	str r0, [sp, #0x28]
	ldrb r1, [r0]
_08110268:
	adds r0, r1, #0
	subs r0, #0x30
	cmp r0, #9
	bhi _081102D6
	cmp r1, #0x30
	bne _08110280
_08110274:
	ldr r1, [sp, #0x28]
	adds r1, #1
	str r1, [sp, #0x28]
	ldrb r1, [r1]
	cmp r1, #0x30
	beq _08110274
_08110280:
	adds r0, r1, #0
	subs r0, #0x31
	cmp r0, #8
	bhi _081102D0
	subs r1, #0x30
	str r1, [sp, #0x24]
	ldr r3, [sp, #0x28]
	str r3, [sp, #0x64]
	adds r0, r3, #0
	b _081102A4
_08110294:
	ldr r3, [sp, #0x24]
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r0, r0, r1
	subs r0, #0x30
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x28]
_081102A4:
	adds r0, #1
	str r0, [sp, #0x28]
	ldrb r1, [r0]
	cmp r1, #0x2f
	ble _081102B2
	cmp r1, #0x39
	ble _08110294
_081102B2:
	ldr r1, [sp, #0x28]
	ldr r3, [sp, #0x64]
	subs r0, r1, r3
	cmp r0, #8
	ble _081102C0
	ldr r0, _081102CC @ =0x0098967F
	str r0, [sp, #0x24]
_081102C0:
	cmp r4, #0
	beq _081102D8
	ldr r1, [sp, #0x24]
	rsbs r1, r1, #0
	str r1, [sp, #0x24]
	b _081102D8
	.align 2, 0
_081102CC: .4byte 0x0098967F
_081102D0:
	movs r3, #0
	str r3, [sp, #0x24]
	b _081102D8
_081102D6:
	str r5, [sp, #0x28]
_081102D8:
	mov r0, sl
	cmp r0, #0
	bne _081102F6
	cmp r2, #0
	beq _081102E6
	bl _08110AFE
_081102E6:
	mov r1, ip
	cmp r1, #0
	beq _081102F0
	bl _08110AFE
_081102F0:
	str r5, [sp, #0x28]
	bl _08110AFE
_081102F6:
	ldr r2, [sp, #0x24]
	mov r3, r8
	subs r2, r2, r3
	str r2, [sp, #0x24]
	mov r8, r2
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0811030A
	mov r1, sl
	str r1, [sp, #0x1c]
_0811030A:
	mov r2, sl
	str r2, [sp, #0x18]
	cmp r2, #0x10
	ble _08110316
	movs r3, #0x10
	str r3, [sp, #0x18]
_08110316:
	ldr r0, [sp, #0x38]
	bl __floatsidf
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [sp, #0x38]
	cmp r0, #0
	bge _08110336
	ldr r3, _081103B4 @ =0x00000000
	ldr r2, _081103B0 @ =0x41F00000
	adds r1, r5, #0
	adds r0, r4, #0
	bl __adddf3
	adds r5, r1, #0
	adds r4, r0, #0
_08110336:
	adds r7, r5, #0
	adds r6, r4, #0
	ldr r1, [sp, #0x18]
	cmp r1, #9
	ble _08110384
	ldr r0, _081103B8 @ =gUnk_09E5868C
	subs r1, #9
	lsls r1, r1, #3
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, [r1, #4]
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldf3
	adds r7, r1, #0
	adds r6, r0, #0
	mov r0, sb
	bl __floatsidf
	adds r5, r1, #0
	adds r4, r0, #0
	mov r2, sb
	cmp r2, #0
	bge _08110374
	ldr r3, _081103B4 @ =0x00000000
	ldr r2, _081103B0 @ =0x41F00000
	bl __adddf3
	adds r5, r1, #0
	adds r4, r0, #0
_08110374:
	adds r1, r7, #0
	adds r0, r6, #0
	adds r3, r5, #0
	adds r2, r4, #0
	bl __adddf3
	adds r7, r1, #0
	adds r6, r0, #0
_08110384:
	movs r3, #0
	str r3, [sp, #0x4c]
	mov r0, sl
	cmp r0, #0xf
	bgt _08110428
	ldr r1, [sp, #0x24]
	cmp r1, #0
	bne _08110396
	b _08110AFE
_08110396:
	cmp r1, #0
	ble _08110400
	cmp r1, #0x16
	bgt _081103BC
	ldr r1, _081103B8 @ =gUnk_09E5868C
	ldr r2, [sp, #0x24]
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	adds r3, r7, #0
	adds r2, r6, #0
	b _081103F0
	.align 2, 0
_081103B0: .4byte 0x41F00000
_081103B4: .4byte 0x00000000
_081103B8: .4byte gUnk_09E5868C
_081103BC:
	movs r0, #0xf
	mov r1, sl
	subs r3, r0, r1
	adds r0, r3, #0
	adds r0, #0x16
	ldr r2, [sp, #0x24]
	cmp r2, r0
	bgt _08110428
	subs r2, r2, r3
	str r2, [sp, #0x24]
	ldr r4, _081103FC @ =gUnk_09E5868C
	lsls r0, r3, #3
	adds r0, r0, r4
	ldr r1, [r0, #4]
	ldr r0, [r0]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r1, [sp, #0x24]
	lsls r0, r1, #3
	adds r0, r0, r4
	ldr r1, [r0, #4]
	ldr r0, [r0]
_081103F0:
	bl __muldf3
	adds r7, r1, #0
	adds r6, r0, #0
	b _08110AFE
	.align 2, 0
_081103FC: .4byte gUnk_09E5868C
_08110400:
	movs r0, #0x16
	rsbs r0, r0, #0
	ldr r2, [sp, #0x24]
	cmp r2, r0
	blt _08110428
	ldr r0, _08110424 @ =gUnk_09E5868C
	lsls r1, r2, #3
	subs r0, r0, r1
	ldr r2, [r0]
	ldr r3, [r0, #4]
	adds r1, r7, #0
	adds r0, r6, #0
	bl __divdf3
	adds r7, r1, #0
	adds r6, r0, #0
	b _08110AFE
	.align 2, 0
_08110424: .4byte gUnk_09E5868C
_08110428:
	mov r3, sl
	ldr r1, [sp, #0x18]
	subs r0, r3, r1
	add r8, r0
	mov r2, r8
	cmp r2, #0
	ble _08110528
	movs r3, #0xf
	ands r3, r2
	cmp r3, #0
	beq _08110454
	ldr r1, _08110484 @ =gUnk_09E5868C
	lsls r0, r3, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldf3
	adds r7, r1, #0
	adds r6, r0, #0
_08110454:
	movs r0, #0x10
	rsbs r0, r0, #0
	mov r3, r8
	ands r3, r0
	mov r8, r3
	cmp r3, #0
	bne _08110464
	b _08110632
_08110464:
	movs r0, #0x9a
	lsls r0, r0, #1
	cmp r8, r0
	ble _0811048C
_0811046C:
	movs r0, #0x22
	ldr r1, [sp, #0xc]
	str r0, [r1]
	ldr r0, _08110488 @ =gUnk_09E587A4
	ldr r6, [r0]
	ldr r7, [r0, #4]
	ldr r2, [sp, #0x4c]
	cmp r2, #0
	beq _08110480
	b _08110AD6
_08110480:
	b _08110AFE
	.align 2, 0
_08110484: .4byte gUnk_09E5868C
_08110488: .4byte gUnk_09E587A4
_0811048C:
	mov r3, r8
	asrs r3, r3, #4
	mov r8, r3
	cmp r3, #0
	bne _08110498
	b _08110632
_08110498:
	movs r0, #0
	mov sb, r0
	ldr r5, _08110508 @ =gUnk_09E58754
	cmp r3, #1
	ble _081104CE
	adds r4, r5, #0
_081104A4:
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _081104BE
	ldr r0, [r4]
	ldr r1, [r4, #4]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldf3
	adds r7, r1, #0
	adds r6, r0, #0
_081104BE:
	adds r4, #8
	movs r2, #1
	add sb, r2
	mov r3, r8
	asrs r3, r3, #1
	mov r8, r3
	cmp r3, #1
	bgt _081104A4
_081104CE:
	ldr r0, _0811050C @ =0xFCB00000
	adds r6, r6, r0
	mov r1, sb
	lsls r0, r1, #3
	adds r0, r0, r5
	ldr r1, [r0, #4]
	ldr r0, [r0]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldf3
	adds r7, r1, #0
	adds r6, r0, #0
	ldr r2, _08110510 @ =0x7FF00000
	mov sb, r2
	mov r3, sb
	ands r3, r6
	mov sb, r3
	ldr r0, _08110514 @ =0x7CA00000
	cmp sb, r0
	bhi _0811046C
	ldr r0, _08110518 @ =0x7C900000
	cmp sb, r0
	bls _08110520
	ldr r6, _0811051C @ =0x7FEFFFFF
	movs r7, #1
	rsbs r7, r7, #0
	b _08110632
	.align 2, 0
_08110508: .4byte gUnk_09E58754
_0811050C: .4byte 0xFCB00000
_08110510: .4byte 0x7FF00000
_08110514: .4byte 0x7CA00000
_08110518: .4byte 0x7C900000
_0811051C: .4byte 0x7FEFFFFF
_08110520:
	movs r0, #0xd4
	lsls r0, r0, #0x12
	adds r6, r6, r0
	b _08110632
_08110528:
	mov r1, r8
	cmp r1, #0
	blt _08110530
	b _08110632
_08110530:
	rsbs r1, r1, #0
	mov r8, r1
	movs r3, #0xf
	ands r3, r1
	cmp r3, #0
	beq _08110552
	ldr r1, _08110608 @ =gUnk_09E5868C
	lsls r0, r3, #3
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r3, [r0, #4]
	adds r1, r7, #0
	adds r0, r6, #0
	bl __divdf3
	adds r7, r1, #0
	adds r6, r0, #0
_08110552:
	movs r0, #0x10
	rsbs r0, r0, #0
	mov r2, r8
	ands r2, r0
	cmp r2, #0
	beq _08110632
	asrs r2, r2, #4
	mov r8, r2
	cmp r2, #0x1f
	bgt _081105F2
	movs r3, #0
	mov sb, r3
	cmp r2, #1
	ble _0811059A
	ldr r4, _0811060C @ =gUnk_09E5877C
_08110570:
	movs r0, #1
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _0811058A
	ldr r0, [r4]
	ldr r1, [r4, #4]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldf3
	adds r7, r1, #0
	adds r6, r0, #0
_0811058A:
	adds r4, #8
	movs r2, #1
	add sb, r2
	mov r3, r8
	asrs r3, r3, #1
	mov r8, r3
	cmp r3, #1
	bgt _08110570
_0811059A:
	adds r5, r7, #0
	adds r4, r6, #0
	mov r1, sb
	lsls r0, r1, #3
	ldr r2, _0811060C @ =gUnk_09E5877C
	adds r0, r0, r2
	ldr r1, [r0]
	ldr r2, [r0, #4]
	str r1, [sp, #0x58]
	str r2, [sp, #0x5c]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r3, r5, #0
	adds r2, r4, #0
	bl __muldf3
	adds r7, r1, #0
	adds r6, r0, #0
	ldr r2, _08110610 @ =0x00000000
	ldr r3, _08110614 @ =0x00000000
	bl __eqdf2
	cmp r0, #0
	bne _08110632
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r5, #0
	adds r2, r4, #0
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #0x5c]
	bl __muldf3
	adds r7, r1, #0
	adds r6, r0, #0
	ldr r2, _08110610 @ =0x00000000
	ldr r3, _08110614 @ =0x00000000
	bl __eqdf2
	cmp r0, #0
	bne _0811062E
_081105F2:
	movs r6, #0
	movs r7, #0
	movs r0, #0x22
	ldr r2, [sp, #0xc]
	str r0, [r2]
	ldr r3, [sp, #0x4c]
	cmp r3, #0
	beq _08110604
	b _08110AD6
_08110604:
	b _08110AFE
	.align 2, 0
_08110608: .4byte gUnk_09E5868C
_0811060C: .4byte gUnk_09E5877C
_08110610: .4byte 0x00000000
_08110614: .4byte 0x00000000
_08110618:
	adds r1, r7, #0
	adds r0, r6, #0
	bl _ulp
	adds r3, r7, #0
	adds r2, r6, #0
	bl __adddf3
	adds r7, r1, #0
	adds r6, r0, #0
	b _08110AD6
_0811062E:
	movs r6, #0
	movs r7, #1
_08110632:
	ldr r0, [sp, #0x38]
	str r0, [sp]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x1c]
	mov r3, sl
	bl _s2b
	str r0, [sp, #0x4c]
	mov r1, sp
	adds r1, #8
	str r1, [sp, #0x60]
	b _08110982
_0811064C:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x54]
	movs r2, #1
	bl _lshift
	str r0, [sp, #0x54]
	ldr r1, [sp, #0x50]
	bl __mcmp
	cmp r0, #0
	bgt _081106A4
	b _08110AD6
_08110664:
	cmp r3, #0
	bne _08110704
	mov r2, sb
	cmp r2, #0
	beq _08110698
	ldr r1, _08110690 @ =0x000FFFFF
	adds r2, r6, #0
	adds r0, r2, #0
	ands r0, r1
	cmp r0, r1
	bne _081106C4
	movs r0, #1
	rsbs r0, r0, #0
	cmp r7, r0
	bne _081106C4
	ldr r0, _08110694 @ =0x7FF00000
	ands r2, r0
	movs r3, #0x80
	lsls r3, r3, #0xd
	adds r6, r2, r3
	movs r7, #0
	b _08110AD6
	.align 2, 0
_08110690: .4byte 0x000FFFFF
_08110694: .4byte 0x7FF00000
_08110698:
	ldr r0, _081106B8 @ =0x000FFFFF
	ands r0, r6
	cmp r0, #0
	bne _081106C4
	cmp r7, #0
	bne _081106C4
_081106A4:
	ldr r0, _081106BC @ =0x7FF00000
	ands r0, r6
	ldr r2, _081106C0 @ =0xFFF00000
	adds r1, r0, r2
	ldr r0, _081106B8 @ =0x000FFFFF
	adds r6, r1, #0
	orrs r6, r0
	movs r7, #1
	rsbs r7, r7, #0
	b _08110AD6
	.align 2, 0
_081106B8: .4byte 0x000FFFFF
_081106BC: .4byte 0x7FF00000
_081106C0: .4byte 0xFFF00000
_081106C4:
	movs r0, #1
	ands r0, r7
	cmp r0, #0
	bne _081106CE
	b _08110AD6
_081106CE:
	mov r3, sb
	cmp r3, #0
	bne _08110618
	adds r1, r7, #0
	adds r0, r6, #0
	bl _ulp
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r7, #0
	adds r0, r6, #0
	bl __subdf3
	adds r7, r1, #0
	adds r6, r0, #0
	ldr r3, _08110700 @ =0x00000000
	ldr r2, _081106FC @ =0x00000000
	bl __eqdf2
	cmp r0, #0
	bne _081106FA
	b _081105F2
_081106FA:
	b _08110AD6
	.align 2, 0
_081106FC: .4byte 0x00000000
_08110700: .4byte 0x00000000
_08110704:
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x50]
	bl _ratio
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r3, _08110730 @ =0x00000000
	ldr r2, _0811072C @ =0x40000000
	bl __ledf2
	cmp r0, #0
	bgt _081107BC
	mov r0, sb
	cmp r0, #0
	beq _0811073C
	ldr r4, _08110734 @ =0x3FF00000
	ldr r5, _08110738 @ =0x00000000
	str r4, [sp, #0x30]
	str r5, [sp, #0x34]
	b _081107DE
	.align 2, 0
_0811072C: .4byte 0x40000000
_08110730: .4byte 0x00000000
_08110734: .4byte 0x3FF00000
_08110738: .4byte 0x00000000
_0811073C:
	cmp r7, #0
	bne _08110748
	ldr r0, _08110760 @ =0x000FFFFF
	ands r0, r6
	cmp r0, #0
	beq _08110774
_08110748:
	cmp r7, #1
	bne _08110752
	cmp r6, #0
	bne _08110752
	b _081105F2
_08110752:
	ldr r4, _08110764 @ =0x3FF00000
	ldr r5, _08110768 @ =0x00000000
	ldr r1, _0811076C @ =0xBFF00000
	ldr r2, _08110770 @ =0x00000000
	str r1, [sp, #0x30]
	str r2, [sp, #0x34]
	b _081107DE
	.align 2, 0
_08110760: .4byte 0x000FFFFF
_08110764: .4byte 0x3FF00000
_08110768: .4byte 0x00000000
_0811076C: .4byte 0xBFF00000
_08110770: .4byte 0x00000000
_08110774:
	ldr r3, _08110790 @ =0x00000000
	ldr r2, _0811078C @ =0x3FF00000
	adds r1, r5, #0
	adds r0, r4, #0
	bl __ltdf2
	cmp r0, #0
	bge _0811079C
	ldr r4, _08110794 @ =0x3FE00000
	ldr r5, _08110798 @ =0x00000000
	b _081107AC
	.align 2, 0
_0811078C: .4byte 0x3FF00000
_08110790: .4byte 0x00000000
_08110794: .4byte 0x3FE00000
_08110798: .4byte 0x00000000
_0811079C:
	ldr r3, _081107B8 @ =0x00000000
	ldr r2, _081107B4 @ =0x3FE00000
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldf3
	adds r5, r1, #0
	adds r4, r0, #0
_081107AC:
	adds r1, r5, #0
	adds r0, r4, #0
	b _081107D6
	.align 2, 0
_081107B4: .4byte 0x3FE00000
_081107B8: .4byte 0x00000000
_081107BC:
	ldr r3, _08110844 @ =0x00000000
	ldr r2, _08110840 @ =0x3FE00000
	adds r1, r5, #0
	adds r0, r4, #0
	bl __muldf3
	adds r5, r1, #0
	adds r4, r0, #0
	str r4, [sp, #0x30]
	str r5, [sp, #0x34]
	mov r2, sb
	cmp r2, #0
	bne _081107DE
_081107D6:
	bl __negdf2
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
_081107DE:
	ldr r3, _08110848 @ =0x7FF00000
	mov r8, r3
	mov r0, r8
	ands r0, r6
	str r0, [sp, #0x38]
	ldr r0, _0811084C @ =0x7FE00000
	ldr r1, [sp, #0x38]
	cmp r1, r0
	bne _08110864
	str r6, [sp, #0x3c]
	str r7, [sp, #0x40]
	ldr r2, _08110850 @ =0xFCB00000
	adds r6, r6, r2
	adds r1, r7, #0
	adds r0, r6, #0
	bl _ulp
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x34]
	bl __muldf3
	adds r3, r7, #0
	adds r2, r6, #0
	bl __adddf3
	adds r7, r1, #0
	adds r6, r0, #0
	mov r0, r8
	ands r0, r6
	ldr r1, _08110854 @ =0x7C9FFFFF
	cmp r0, r1
	bls _0811085C
	ldr r1, _08110858 @ =0x7FEFFFFF
	ldr r3, [sp, #0x3c]
	cmp r3, r1
	bne _08110836
	movs r0, #1
	rsbs r0, r0, #0
	ldr r2, [sp, #0x40]
	cmp r2, r0
	bne _08110836
	b _0811046C
_08110836:
	adds r6, r1, #0
	movs r7, #1
	rsbs r7, r7, #0
	b _08110962
	.align 2, 0
_08110840: .4byte 0x3FE00000
_08110844: .4byte 0x00000000
_08110848: .4byte 0x7FF00000
_0811084C: .4byte 0x7FE00000
_08110850: .4byte 0xFCB00000
_08110854: .4byte 0x7C9FFFFF
_08110858: .4byte 0x7FEFFFFF
_0811085C:
	movs r3, #0xd4
	lsls r3, r3, #0x12
	adds r6, r6, r3
	b _081108C4
_08110864:
	movs r0, #0xd0
	lsls r0, r0, #0x12
	ldr r1, [sp, #0x38]
	cmp r1, r0
	bhi _081108A4
	ldr r3, _0811092C @ =0x00000000
	ldr r2, _08110928 @ =0x3FF00000
	adds r1, r5, #0
	adds r0, r4, #0
	bl __gedf2
	cmp r0, #0
	blt _081108A4
	ldr r2, _08110930 @ =0x3FE00000
	ldr r3, _08110934 @ =0x00000000
	adds r1, r5, #0
	adds r0, r4, #0
	bl __adddf3
	bl __fixdfsi
	bl __floatsidf
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	mov r2, sb
	cmp r2, #0
	bne _081108A4
	bl __negdf2
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
_081108A4:
	adds r1, r7, #0
	adds r0, r6, #0
	bl _ulp
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x34]
	bl __muldf3
	adds r3, r7, #0
	adds r2, r6, #0
	bl __adddf3
	adds r7, r1, #0
	adds r6, r0, #0
_081108C4:
	ldr r0, _08110938 @ =0x7FF00000
	mov r8, r6
	ands r0, r6
	ldr r3, [sp, #0x38]
	cmp r3, r0
	bne _08110962
	adds r1, r5, #0
	adds r0, r4, #0
	bl __fixdfsi
	adds r1, r0, #0
	bl __floatsidf
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __subdf3
	adds r5, r1, #0
	adds r4, r0, #0
	mov r0, sb
	cmp r0, #0
	bne _08110902
	cmp r7, #0
	bne _08110902
	ldr r0, _0811093C @ =0x000FFFFF
	mov r1, r8
	ands r1, r0
	cmp r1, #0
	beq _08110950
_08110902:
	ldr r2, _08110940 @ =0x3FDFFFFF
	ldr r3, _08110944 @ =0x94A03595
	adds r1, r5, #0
	adds r0, r4, #0
	bl __ltdf2
	cmp r0, #0
	bge _08110914
	b _08110AD6
_08110914:
	ldr r2, _08110948 @ =0x3FE00000
	ldr r3, _0811094C @ =0x35AFE535
	adds r1, r5, #0
	adds r0, r4, #0
	bl __gtdf2
	cmp r0, #0
	ble _08110926
	b _08110AD6
_08110926:
	b _08110962
	.align 2, 0
_08110928: .4byte 0x3FF00000
_0811092C: .4byte 0x00000000
_08110930: .4byte 0x3FE00000
_08110934: .4byte 0x00000000
_08110938: .4byte 0x7FF00000
_0811093C: .4byte 0x000FFFFF
_08110940: .4byte 0x3FDFFFFF
_08110944: .4byte 0x94A03595
_08110948: .4byte 0x3FE00000
_0811094C: .4byte 0x35AFE535
_08110950:
	ldr r3, _081109D0 @ =0x94A03595
	ldr r2, _081109CC @ =0x3FCFFFFF
	adds r1, r5, #0
	adds r0, r4, #0
	bl __ltdf2
	cmp r0, #0
	bge _08110962
	b _08110AD6
_08110962:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x44]
	bl _Bfree
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x48]
	bl _Bfree
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x50]
	bl _Bfree
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x54]
	bl _Bfree
_08110982:
	ldr r2, [sp, #0x4c]
	ldr r1, [r2, #4]
	ldr r0, [sp, #0xc]
	bl _Balloc
	str r0, [sp, #0x48]
	adds r0, #0xc
	ldr r1, [sp, #0x4c]
	adds r1, #0xc
	ldr r3, [sp, #0x4c]
	ldr r2, [r3, #0x10]
	lsls r2, r2, #2
	adds r2, #8
	bl memcpy
	ldr r0, [sp, #0x60]
	str r0, [sp]
	ldr r0, [sp, #0xc]
	adds r2, r7, #0
	adds r1, r6, #0
	add r3, sp, #4
	bl _d2b
	str r0, [sp, #0x44]
	ldr r0, [sp, #0xc]
	movs r1, #1
	bl _i2b
	str r0, [sp, #0x50]
	ldr r1, [sp, #0x24]
	cmp r1, #0
	blt _081109D4
	movs r2, #0
	mov r8, r2
	adds r5, r1, #0
	str r5, [sp, #0x14]
	b _081109E0
	.align 2, 0
_081109CC: .4byte 0x3FCFFFFF
_081109D0: .4byte 0x94A03595
_081109D4:
	ldr r2, [sp, #0x24]
	rsbs r2, r2, #0
	mov r8, r2
	movs r3, #0
	str r3, [sp, #0x14]
	movs r5, #0
_081109E0:
	ldr r1, [sp, #4]
	cmp r1, #0
	blt _081109EA
	add r8, r1
	b _081109EC
_081109EA:
	subs r5, r5, r1
_081109EC:
	mov sl, r8
	ldr r4, [sp, #8]
	adds r0, r1, r4
	subs r3, r0, #1
	ldr r0, _08110A00 @ =0xFFFFFC02
	cmp r3, r0
	bge _08110A08
	ldr r0, _08110A04 @ =0x00000433
	adds r0, r0, r1
	b _08110A0C
	.align 2, 0
_08110A00: .4byte 0xFFFFFC02
_08110A04: .4byte 0x00000433
_08110A08:
	movs r0, #0x36
	subs r0, r0, r4
_08110A0C:
	mov sb, r0
	add r8, sb
	mov r1, sb
	adds r3, r5, r1
	adds r5, r3, #0
	cmp r3, r8
	ble _08110A1C
	mov r3, r8
_08110A1C:
	cmp r3, sl
	ble _08110A22
	mov r3, sl
_08110A22:
	cmp r3, #0
	ble _08110A34
	mov r0, r8
	subs r0, r0, r3
	mov r8, r0
	subs r5, r5, r3
	mov r1, sl
	subs r1, r1, r3
	mov sl, r1
_08110A34:
	cmp r2, #0
	ble _08110A58
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x50]
	bl _pow5mult
	str r0, [sp, #0x50]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x44]
	bl _multiply
	adds r4, r0, #0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x44]
	bl _Bfree
	str r4, [sp, #0x44]
_08110A58:
	mov r2, r8
	cmp r2, #0
	ble _08110A68
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x44]
	bl _lshift
	str r0, [sp, #0x44]
_08110A68:
	ldr r3, [sp, #0x14]
	cmp r3, #0
	ble _08110A7A
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x48]
	adds r2, r3, #0
	bl _pow5mult
	str r0, [sp, #0x48]
_08110A7A:
	cmp r5, #0
	ble _08110A8A
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x48]
	adds r2, r5, #0
	bl _lshift
	str r0, [sp, #0x48]
_08110A8A:
	mov r0, sl
	cmp r0, #0
	ble _08110A9C
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x50]
	mov r2, sl
	bl _lshift
	str r0, [sp, #0x50]
_08110A9C:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x48]
	bl __mdiff
	str r0, [sp, #0x54]
	ldr r1, [r0, #0xc]
	mov sb, r1
	movs r0, #0
	ldr r2, [sp, #0x54]
	str r0, [r2, #0xc]
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x50]
	bl __mcmp
	adds r3, r0, #0
	cmp r3, #0
	blt _08110AC2
	b _08110664
_08110AC2:
	mov r3, sb
	cmp r3, #0
	bne _08110AD6
	cmp r7, #0
	bne _08110AD6
	ldr r0, _08110B24 @ =0x000FFFFF
	ands r0, r6
	cmp r0, #0
	bne _08110AD6
	b _0811064C
_08110AD6:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x44]
	bl _Bfree
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x48]
	bl _Bfree
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x50]
	bl _Bfree
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x4c]
	bl _Bfree
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x54]
	bl _Bfree
_08110AFE:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _08110B08
	ldr r1, [sp, #0x28]
	str r1, [r0]
_08110B08:
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x20]
	cmp r2, #0
	beq _08110B16
	bl __negdf2
_08110B16:
	add sp, #0x68
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08110B24: .4byte 0x000FFFFF

	thumb_func_start strtod
strtod: @ 0x08110B28
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _08110B3C @ =gUnk_09ED4D94
	ldr r0, [r0]
	adds r1, r3, #0
	bl _strtod_r
	pop {pc}
	.align 2, 0
_08110B3C: .4byte gUnk_09ED4D94

	thumb_func_start strtodf
strtodf: @ 0x08110B40
	push {lr}
	bl strtod
	bl __truncdfsf2
	pop {pc}

	thumb_func_start _strtol_r
_strtol_r: @ 0x08110B4C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	adds r6, r3, #0
	adds r5, r1, #0
	movs r0, #0
	mov sb, r0
	ldr r1, _08110B88 @ =gUnk_09E58579
	mov sl, r1
	mov r2, sl
	movs r3, #8
_08110B6E:
	ldrb r4, [r5]
	adds r5, #1
	adds r1, r4, r2
	adds r0, r3, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08110B6E
	cmp r4, #0x2d
	bne _08110B8C
	movs r0, #1
	mov sb, r0
	b _08110B90
	.align 2, 0
_08110B88: .4byte gUnk_09E58579
_08110B8C:
	cmp r4, #0x2b
	bne _08110B94
_08110B90:
	ldrb r4, [r5]
	adds r5, #1
_08110B94:
	cmp r6, #0
	beq _08110B9C
	cmp r6, #0x10
	bne _08110BB0
_08110B9C:
	cmp r4, #0x30
	bne _08110BB0
	ldrb r0, [r5]
	cmp r0, #0x78
	beq _08110BAA
	cmp r0, #0x58
	bne _08110BB0
_08110BAA:
	ldrb r4, [r5, #1]
	adds r5, #2
	movs r6, #0x10
_08110BB0:
	cmp r6, #0
	bne _08110BBC
	movs r6, #0xa
	cmp r4, #0x30
	bne _08110BBC
	movs r6, #8
_08110BBC:
	ldr r7, _08110BE0 @ =0x7FFFFFFF
	mov r1, sb
	cmp r1, #0
	beq _08110BC6
	adds r7, #1
_08110BC6:
	adds r0, r7, #0
	adds r1, r6, #0
	bl __umodsi3
	mov r8, r0
	adds r0, r7, #0
	adds r1, r6, #0
	bl __udivsi3
	adds r7, r0, #0
	movs r2, #0
	movs r3, #0
	b _08110C08
	.align 2, 0
_08110BE0: .4byte 0x7FFFFFFF
_08110BE4:
	cmp r4, r6
	bge _08110C34
	cmp r3, #0
	blt _08110BF8
	cmp r2, r7
	bhi _08110BF8
	cmp r2, r7
	bne _08110BFE
	cmp r4, r8
	ble _08110BFE
_08110BF8:
	movs r3, #1
	rsbs r3, r3, #0
	b _08110C04
_08110BFE:
	movs r3, #1
	muls r2, r6, r2
	adds r2, r2, r4
_08110C04:
	ldrb r4, [r5]
	adds r5, #1
_08110C08:
	mov r1, sl
	adds r0, r4, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08110C1A
	subs r4, #0x30
	b _08110BE4
_08110C1A:
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08110C34
	movs r0, #1
	ands r0, r1
	adds r1, r4, #0
	subs r1, #0x57
	cmp r0, #0
	beq _08110C30
	adds r1, #0x20
_08110C30:
	adds r4, r1, #0
	b _08110BE4
_08110C34:
	cmp r3, #0
	bge _08110C50
	ldr r2, _08110C4C @ =0x7FFFFFFF
	mov r0, sb
	cmp r0, #0
	beq _08110C42
	adds r2, #1
_08110C42:
	movs r0, #0x22
	ldr r1, [sp]
	str r0, [r1]
	b _08110C58
	.align 2, 0
_08110C4C: .4byte 0x7FFFFFFF
_08110C50:
	mov r0, sb
	cmp r0, #0
	beq _08110C58
	rsbs r2, r2, #0
_08110C58:
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _08110C6A
	ldr r1, [sp, #4]
	cmp r3, #0
	beq _08110C66
	subs r1, r5, #1
_08110C66:
	ldr r0, [sp, #8]
	str r1, [r0]
_08110C6A:
	adds r0, r2, #0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

	thumb_func_start strtol
strtol: @ 0x08110C78
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, _08110C90 @ =gUnk_09ED4D94
	ldr r0, [r0]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _strtol_r
	pop {r4, r5, pc}
	.align 2, 0
_08110C90: .4byte gUnk_09ED4D94

	thumb_func_start _strtoul_r
_strtoul_r: @ 0x08110C94
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp]
	mov sl, r1
	str r2, [sp, #4]
	adds r7, r3, #0
	mov r6, sl
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, _08110CD0 @ =gUnk_09E58579
	mov sb, r1
	mov r2, sb
	movs r3, #8
_08110CB6:
	ldrb r5, [r6]
	adds r6, #1
	adds r1, r5, r2
	adds r0, r3, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08110CB6
	cmp r5, #0x2d
	bne _08110CD4
	movs r0, #1
	str r0, [sp, #8]
	b _08110CD8
	.align 2, 0
_08110CD0: .4byte gUnk_09E58579
_08110CD4:
	cmp r5, #0x2b
	bne _08110CDC
_08110CD8:
	ldrb r5, [r6]
	adds r6, #1
_08110CDC:
	cmp r7, #0
	beq _08110CE4
	cmp r7, #0x10
	bne _08110CF8
_08110CE4:
	cmp r5, #0x30
	bne _08110CF8
	ldrb r0, [r6]
	cmp r0, #0x78
	beq _08110CF2
	cmp r0, #0x58
	bne _08110CF8
_08110CF2:
	ldrb r5, [r6, #1]
	adds r6, #2
	movs r7, #0x10
_08110CF8:
	cmp r7, #0
	bne _08110D04
	movs r7, #0xa
	cmp r5, #0x30
	bne _08110D04
	movs r7, #8
_08110D04:
	movs r4, #1
	rsbs r4, r4, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl __udivsi3
	mov r8, r0
	adds r0, r4, #0
	adds r1, r7, #0
	bl __umodsi3
	adds r4, r0, #0
	movs r2, #0
	movs r3, #0
	b _08110D46
_08110D22:
	cmp r5, r7
	bge _08110D72
	cmp r3, #0
	blt _08110D36
	cmp r2, r8
	bhi _08110D36
	cmp r2, r8
	bne _08110D3C
	cmp r5, r4
	ble _08110D3C
_08110D36:
	movs r3, #1
	rsbs r3, r3, #0
	b _08110D42
_08110D3C:
	movs r3, #1
	muls r2, r7, r2
	adds r2, r2, r5
_08110D42:
	ldrb r5, [r6]
	adds r6, #1
_08110D46:
	mov r1, sb
	adds r0, r5, r1
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08110D58
	subs r5, #0x30
	b _08110D22
_08110D58:
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08110D72
	movs r0, #1
	ands r0, r1
	adds r1, r5, #0
	subs r1, #0x57
	cmp r0, #0
	beq _08110D6E
	adds r1, #0x20
_08110D6E:
	adds r5, r1, #0
	b _08110D22
_08110D72:
	cmp r3, #0
	bge _08110D82
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0x22
	ldr r1, [sp]
	str r0, [r1]
	b _08110D8A
_08110D82:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _08110D8A
	rsbs r2, r2, #0
_08110D8A:
	ldr r1, [sp, #4]
	cmp r1, #0
	beq _08110D9C
	mov r1, sl
	cmp r3, #0
	beq _08110D98
	subs r1, r6, #1
_08110D98:
	ldr r0, [sp, #4]
	str r1, [r0]
_08110D9C:
	adds r0, r2, #0
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

	thumb_func_start strtoul
strtoul: @ 0x08110DAC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r3, r2, #0
	ldr r0, _08110DC4 @ =gUnk_09ED4D94
	ldr r0, [r0]
	adds r1, r4, #0
	adds r2, r5, #0
	bl _strtoul_r
	pop {r4, r5, pc}
	.align 2, 0
_08110DC4: .4byte gUnk_09ED4D94

	thumb_func_start __submore
__submore: @ 0x08110DC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r0, #0x40
	ldr r4, [r7, #0x30]
	cmp r4, r0
	bne _08110E10
	ldr r0, [r7, #0x54]
	movs r6, #0x80
	lsls r6, r6, #3
	adds r1, r6, #0
	bl _malloc_r
	adds r5, r0, #0
	cmp r5, #0
	beq _08110E3E
	str r5, [r7, #0x30]
	str r6, [r7, #0x34]
	ldr r0, _08110E0C @ =0x000003FD
	adds r5, r5, r0
	movs r6, #2
	adds r2, r4, #0
_08110DF6:
	adds r0, r5, r6
	adds r1, r2, r6
	ldrb r1, [r1]
	strb r1, [r0]
	subs r6, #1
	cmp r6, #0
	bge _08110DF6
	str r5, [r7]
	movs r0, #0
	b _08110E42
	.align 2, 0
_08110E0C: .4byte 0x000003FD
_08110E10:
	ldr r6, [r7, #0x34]
	ldr r0, [r7, #0x54]
	lsls r1, r6, #1
	mov r8, r1
	adds r1, r4, #0
	mov r2, r8
	bl _realloc_r
	adds r5, r0, #0
	cmp r5, #0
	beq _08110E3E
	adds r4, r5, r6
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl memcpy
	str r4, [r7]
	str r5, [r7, #0x30]
	mov r0, r8
	str r0, [r7, #0x34]
	movs r0, #0
	b _08110E42
_08110E3E:
	movs r0, #1
	rsbs r0, r0, #0
_08110E42:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}

	thumb_func_start ungetc
ungetc: @ 0x08110E48
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r6, #1
	rsbs r6, r6, #0
	cmp r5, r6
	beq _08110F24
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _08110E62
	ldr r0, _08110ED8 @ =gUnk_09ED4D94
	ldr r0, [r0]
	str r0, [r4, #0x54]
_08110E62:
	ldr r1, [r4, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _08110E70
	adds r0, r1, #0
	bl __sinit
_08110E70:
	movs r1, #0x21
	rsbs r1, r1, #0
	ldrh r0, [r4, #0xc]
	ands r1, r0
	strh r1, [r4, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08110EB4
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08110ED0
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _08110EAC
	adds r0, r4, #0
	bl fflush
	adds r1, r0, #0
	cmp r1, #0
	bne _08110ED0
	movs r0, #9
	rsbs r0, r0, #0
	ldrh r2, [r4, #0xc]
	ands r0, r2
	strh r0, [r4, #0xc]
	str r1, [r4, #8]
	str r1, [r4, #0x18]
_08110EAC:
	movs r0, #4
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
_08110EB4:
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _08110EEA
	ldr r1, [r4, #4]
	ldr r0, [r4, #0x34]
	cmp r1, r0
	blt _08110EDC
	adds r0, r4, #0
	bl __submore
	cmp r0, #0
	beq _08110EDC
_08110ED0:
	movs r0, #1
	rsbs r0, r0, #0
	b _08110F24
	.align 2, 0
_08110ED8: .4byte gUnk_09ED4D94
_08110EDC:
	ldr r0, [r4]
	subs r0, #1
	str r0, [r4]
	strb r5, [r0]
	ldr r0, [r4, #4]
	adds r0, #1
	b _08110F20
_08110EEA:
	ldr r0, [r4, #0x10]
	ldr r1, [r4]
	cmp r0, #0
	beq _08110F06
	cmp r1, r0
	bls _08110F06
	subs r2, r1, #1
	ldrb r0, [r2]
	cmp r0, r5
	bne _08110F06
	str r2, [r4]
	ldr r0, [r4, #4]
	adds r0, #1
	b _08110F20
_08110F06:
	ldr r0, [r4, #4]
	str r0, [r4, #0x3c]
	str r1, [r4, #0x38]
	adds r0, r4, #0
	adds r0, #0x40
	str r0, [r4, #0x30]
	movs r0, #3
	str r0, [r4, #0x34]
	adds r0, r4, #0
	adds r0, #0x42
	strb r5, [r0]
	str r0, [r4]
	movs r0, #1
_08110F20:
	str r0, [r4, #4]
	adds r0, r5, #0
_08110F24:
	pop {r4, r5, r6, pc}
	.align 2, 0

	thumb_func_start fflush
fflush: @ 0x08110F28
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	cmp r4, #0
	bne _08110F44
	ldr r0, _08110F3C @ =gUnk_09ED4D94
	ldr r0, [r0]
	ldr r1, _08110F40 @ =fflush
	bl _fwalk
	b _08110FBA
	.align 2, 0
_08110F3C: .4byte gUnk_09ED4D94
_08110F40: .4byte fflush
_08110F44:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _08110F50
	ldr r0, _08110F84 @ =gUnk_09ED4D94
	ldr r0, [r0]
	str r0, [r4, #0x54]
_08110F50:
	ldr r1, [r4, #0x54]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	bne _08110F5E
	adds r0, r1, #0
	bl __sinit
_08110F5E:
	movs r0, #0xc
	ldrsh r1, [r4, r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08110FB8
	ldr r6, [r4, #0x10]
	cmp r6, #0
	beq _08110FB8
	ldr r0, [r4]
	subs r5, r0, r6
	str r6, [r4]
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08110F96
	ldr r0, [r4, #0x14]
	b _08110F98
	.align 2, 0
_08110F84: .4byte gUnk_09ED4D94
_08110F88:
	movs r0, #0x40
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	b _08110FBA
_08110F96:
	movs r0, #0
_08110F98:
	str r0, [r4, #8]
	cmp r5, #0
	ble _08110FB8
_08110F9E:
	ldr r0, [r4, #0x1c]
	ldr r3, [r4, #0x24]
	adds r1, r6, #0
	adds r2, r5, #0
	bl _call_via_r3
	adds r1, r0, #0
	cmp r1, #0
	ble _08110F88
	adds r6, r6, r1
	subs r5, r5, r1
	cmp r5, #0
	bgt _08110F9E
_08110FB8:
	movs r0, #0
_08110FBA:
	pop {r4, r5, r6, pc}

	thumb_func_start std
std: @ 0x08110FBC
	push {r4, lr}
	movs r4, #0
	str r4, [r0]
	str r4, [r0, #4]
	str r4, [r0, #8]
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	str r4, [r0, #0x10]
	str r4, [r0, #0x18]
	str r0, [r0, #0x1c]
	ldr r1, _08110FE4 @ =__sread
	str r1, [r0, #0x20]
	ldr r1, _08110FE8 @ =__swrite
	str r1, [r0, #0x24]
	ldr r1, _08110FEC @ =__sseek
	str r1, [r0, #0x28]
	ldr r1, _08110FF0 @ =__sclose
	str r1, [r0, #0x2c]
	str r3, [r0, #0x54]
	pop {r4, pc}
	.align 2, 0
_08110FE4: .4byte __sread
_08110FE8: .4byte __swrite
_08110FEC: .4byte __sseek
_08110FF0: .4byte __sclose

	thumb_func_start __sfmoreglue
__sfmoreglue: @ 0x08110FF4
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	movs r1, #0x58
	adds r6, r5, #0
	muls r6, r1, r6
	adds r1, r6, #0
	adds r1, #0xc
	bl _malloc_r
	adds r4, r0, #0
	cmp r4, #0
	beq _08111020
	adds r0, #0xc
	movs r1, #0
	str r1, [r4]
	str r5, [r4, #4]
	str r0, [r4, #8]
	adds r2, r6, #0
	bl memset
	adds r0, r4, #0
	b _08111022
_08111020:
	movs r0, #0
_08111022:
	pop {r4, r5, r6, pc}

	thumb_func_start __sfp
__sfp: @ 0x08111024
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	cmp r0, #0
	bne _08111034
	adds r0, r5, #0
	bl __sinit
_08111034:
	movs r0, #0xec
	lsls r0, r0, #1
	adds r4, r5, r0
	b _0811103E
_0811103C:
	ldr r4, [r4]
_0811103E:
	ldr r2, [r4, #8]
	ldr r0, [r4, #4]
	b _0811104E
_08111044:
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	cmp r1, #0
	beq _08111070
	adds r2, #0x58
_0811104E:
	subs r0, #1
	cmp r0, #0
	bge _08111044
	ldr r0, [r4]
	cmp r0, #0
	bne _0811103C
	adds r0, r5, #0
	movs r1, #4
	bl __sfmoreglue
	str r0, [r4]
	cmp r0, #0
	bne _0811103C
	movs r0, #0xc
	str r0, [r5]
	movs r0, #0
	b _08111090
_08111070:
	movs r0, #1
	strh r0, [r2, #0xc]
	str r1, [r2]
	str r1, [r2, #8]
	str r1, [r2, #4]
	str r1, [r2, #0x10]
	str r1, [r2, #0x14]
	str r1, [r2, #0x18]
	ldr r0, _08111094 @ =0x0000FFFF
	strh r0, [r2, #0xe]
	str r1, [r2, #0x30]
	str r1, [r2, #0x34]
	str r1, [r2, #0x44]
	str r1, [r2, #0x48]
	str r5, [r2, #0x54]
	adds r0, r2, #0
_08111090:
	pop {r4, r5, pc}
	.align 2, 0
_08111094: .4byte 0x0000FFFF

	thumb_func_start _cleanup_r
_cleanup_r: @ 0x08111098
	push {lr}
	ldr r1, _081110A4 @ =fflush
	bl _fwalk
	pop {pc}
	.align 2, 0
_081110A4: .4byte fflush

	thumb_func_start _cleanup
_cleanup: @ 0x081110A8
	push {lr}
	ldr r0, _081110B4 @ =gUnk_09ED4D94
	ldr r0, [r0]
	bl _cleanup_r
	pop {pc}
	.align 2, 0
_081110B4: .4byte gUnk_09ED4D94

	thumb_func_start __sinit
__sinit: @ 0x081110B8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08111114 @ =_cleanup_r
	str r0, [r5, #0x3c]
	movs r0, #1
	str r0, [r5, #0x38]
	movs r0, #0xf2
	lsls r0, r0, #1
	adds r4, r5, r0
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0
	adds r3, r5, #0
	bl std
	movs r1, #0x8f
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #9
	movs r2, #1
	adds r3, r5, #0
	bl std
	movs r1, #0xa5
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0xa
	movs r2, #2
	adds r3, r5, #0
	bl std
	movs r0, #0xec
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #0
	str r0, [r1]
	movs r0, #0xee
	lsls r0, r0, #1
	adds r1, r5, r0
	movs r0, #3
	str r0, [r1]
	movs r1, #0xf0
	lsls r1, r1, #1
	adds r0, r5, r1
	str r4, [r0]
	pop {r4, r5, pc}
	.align 2, 0
_08111114: .4byte _cleanup_r

	thumb_func_start _free_r
_free_r: @ 0x08111118
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r4, r1, #0
	cmp r4, #0
	bne _0811112A
	b _081112CE
_0811112A:
	bl __malloc_lock_6
	adds r5, r4, #0
	subs r5, #8
	ldr r1, [r5, #4]
	movs r6, #2
	rsbs r6, r6, #0
	ands r6, r1
	adds r7, r5, r6
	ldr r4, [r7, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r4, r0
	ldr r0, _0811118C @ =gUnk_09ED4D98
	mov ip, r0
	ldr r0, [r0, #8]
	cmp r7, r0
	bne _08111198
	adds r6, r6, r4
	movs r4, #1
	ands r1, r4
	cmp r1, #0
	bne _08111166
	ldr r0, [r5]
	subs r5, r5, r0
	adds r6, r6, r0
	ldr r3, [r5, #0xc]
	ldr r2, [r5, #8]
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_08111166:
	adds r0, r6, #0
	orrs r0, r4
	str r0, [r5, #4]
	mov r2, ip
	str r5, [r2, #8]
	ldr r0, _08111190 @ =gUnk_09ED51A0
	ldr r0, [r0]
	cmp r6, r0
	blo _08111182
	ldr r0, _08111194 @ =gUnk_09ED51A4
	ldr r1, [r0]
	mov r0, sb
	bl _malloc_trim_r
_08111182:
	mov r0, sb
	bl __malloc_unlock_6
	b _081112CE
	.align 2, 0
_0811118C: .4byte gUnk_09ED4D98
_08111190: .4byte gUnk_09ED51A0
_08111194: .4byte gUnk_09ED51A4
_08111198:
	str r4, [r7, #4]
	movs r0, #0
	mov r8, r0
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _081111C4
	ldr r0, [r5]
	subs r5, r5, r0
	adds r6, r6, r0
	ldr r1, [r5, #8]
	mov r0, ip
	adds r0, #8
	cmp r1, r0
	bne _081111BC
	movs r2, #1
	mov r8, r2
	b _081111C4
_081111BC:
	ldr r3, [r5, #0xc]
	adds r2, r1, #0
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_081111C4:
	adds r0, r7, r4
	ldr r0, [r0, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _081111FC
	adds r6, r6, r4
	ldr r1, [r7, #8]
	mov r0, r8
	cmp r0, #0
	bne _081111F4
	ldr r0, _081111F0 @ =gUnk_09ED4DA0
	cmp r1, r0
	bne _081111F4
	movs r2, #1
	mov r8, r2
	str r5, [r1, #0xc]
	str r5, [r1, #8]
	str r1, [r5, #0xc]
	str r1, [r5, #8]
	b _081111FC
	.align 2, 0
_081111F0: .4byte gUnk_09ED4DA0
_081111F4:
	ldr r3, [r7, #0xc]
	adds r2, r1, #0
	str r3, [r2, #0xc]
	str r2, [r3, #8]
_081111FC:
	movs r1, #1
	adds r0, r6, #0
	orrs r0, r1
	str r0, [r5, #4]
	adds r0, r5, r6
	str r6, [r0]
	mov r0, r8
	cmp r0, #0
	bne _081112C8
	ldr r0, _0811122C @ =0x000001FF
	cmp r6, r0
	bhi _08111234
	lsrs r4, r6, #3
	ldr r2, _08111230 @ =gUnk_09ED4D98
	adds r0, r4, #0
	asrs r0, r0, #2
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
	lsls r0, r4, #3
	adds r3, r0, r2
	ldr r2, [r3, #8]
	b _081112C0
	.align 2, 0
_0811122C: .4byte 0x000001FF
_08111230: .4byte gUnk_09ED4D98
_08111234:
	lsrs r1, r6, #9
	cmp r1, #0
	bne _0811123E
	lsrs r4, r6, #3
	b _08111286
_0811123E:
	cmp r1, #4
	bhi _0811124A
	lsrs r0, r6, #6
	adds r4, r0, #0
	adds r4, #0x38
	b _08111286
_0811124A:
	cmp r1, #0x14
	bhi _08111254
	adds r4, r1, #0
	adds r4, #0x5b
	b _08111286
_08111254:
	cmp r1, #0x54
	bhi _08111260
	lsrs r0, r6, #0xc
	adds r4, r0, #0
	adds r4, #0x6e
	b _08111286
_08111260:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08111270
	lsrs r0, r6, #0xf
	adds r4, r0, #0
	adds r4, #0x77
	b _08111286
_08111270:
	ldr r0, _08111280 @ =0x00000554
	cmp r1, r0
	bhi _08111284
	lsrs r0, r6, #0x12
	adds r4, r0, #0
	adds r4, #0x7c
	b _08111286
	.align 2, 0
_08111280: .4byte 0x00000554
_08111284:
	movs r4, #0x7e
_08111286:
	lsls r0, r4, #3
	ldr r7, _081112A4 @ =gUnk_09ED4D98
	adds r3, r0, r7
	ldr r2, [r3, #8]
	cmp r2, r3
	bne _081112A8
	adds r0, r4, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r0, [r7, #4]
	orrs r0, r1
	str r0, [r7, #4]
	b _081112C0
	.align 2, 0
_081112A4: .4byte gUnk_09ED4D98
_081112A8:
	ldr r0, [r2, #4]
	movs r1, #4
	rsbs r1, r1, #0
	b _081112B8
_081112B0:
	ldr r2, [r2, #8]
	cmp r2, r3
	beq _081112BE
	ldr r0, [r2, #4]
_081112B8:
	ands r0, r1
	cmp r6, r0
	blo _081112B0
_081112BE:
	ldr r3, [r2, #0xc]
_081112C0:
	str r3, [r5, #0xc]
	str r2, [r5, #8]
	str r5, [r3, #8]
	str r5, [r2, #0xc]
_081112C8:
	mov r0, sb
	bl __malloc_unlock_6
_081112CE:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

	thumb_func_start _malloc_trim_r
_malloc_trim_r: @ 0x081112D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	bl __malloc_lock_6
	ldr r0, _08111360 @ =gUnk_09ED4D98
	mov r8, r0
	ldr r0, [r0, #8]
	ldr r6, [r0, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r6, r0
	subs r4, r6, r4
	movs r5, #0x80
	lsls r5, r5, #5
	ldr r1, _08111364 @ =0x00000FEF
	adds r4, r4, r1
	adds r0, r4, #0
	adds r1, r5, #0
	bl __udivsi3
	subs r0, #1
	lsls r4, r0, #0xc
	cmp r4, r5
	blt _08111356
	adds r0, r7, #0
	movs r1, #0
	bl _sbrk_r
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1, #8]
	adds r0, r0, r6
	cmp r2, r0
	bne _08111356
	rsbs r1, r4, #0
	adds r0, r7, #0
	bl _sbrk_r
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	bne _08111370
	adds r0, r7, #0
	movs r1, #0
	bl _sbrk_r
	adds r2, r0, #0
	mov r0, r8
	ldr r3, [r0, #8]
	subs r6, r2, r3
	cmp r6, #0xf
	ble _08111356
	ldr r1, _08111368 @ =gUnk_09ED51B4
	ldr r0, _0811136C @ =gUnk_09ED51A8
	ldr r0, [r0]
	subs r0, r2, r0
	str r0, [r1]
	movs r0, #1
	orrs r6, r0
	str r6, [r3, #4]
_08111356:
	adds r0, r7, #0
	bl __malloc_unlock_6
	movs r0, #0
	b _0811138C
	.align 2, 0
_08111360: .4byte gUnk_09ED4D98
_08111364: .4byte 0x00000FEF
_08111368: .4byte gUnk_09ED51B4
_0811136C: .4byte gUnk_09ED51A8
_08111370:
	mov r1, r8
	ldr r2, [r1, #8]
	subs r0, r6, r4
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	ldr r1, _08111394 @ =gUnk_09ED51B4
	ldr r0, [r1]
	subs r0, r0, r4
	str r0, [r1]
	adds r0, r7, #0
	bl __malloc_unlock_6
	movs r0, #1
_0811138C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08111394: .4byte gUnk_09ED51B4

	thumb_func_start _fwalk
_fwalk: @ 0x08111398
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r1
	movs r7, #0
	movs r1, #0xec
	lsls r1, r1, #1
	adds r6, r0, r1
	cmp r6, #0
	beq _081113D0
_081113AC:
	ldr r5, [r6, #8]
	ldr r4, [r6, #4]
	b _081113C4
_081113B2:
	movs r1, #0xc
	ldrsh r0, [r5, r1]
	cmp r0, #0
	beq _081113C2
	adds r0, r5, #0
	bl _call_via_r8
	orrs r7, r0
_081113C2:
	adds r5, #0x58
_081113C4:
	subs r4, #1
	cmp r4, #0
	bge _081113B2
	ldr r6, [r6]
	cmp r6, #0
	bne _081113AC
_081113D0:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}

	thumb_func_start __smakebuf
__smakebuf: @ 0x081113D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	adds r4, r0, #0
	movs r0, #2
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	bne _0811146E
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	cmp r0, #0
	blt _08111400
	ldr r0, [r4, #0x54]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	mov r2, sp
	bl _fstat_r
	cmp r0, #0
	bge _08111412
_08111400:
	movs r7, #0
	movs r6, #0x80
	lsls r6, r6, #3
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r1, #0
	ldrh r2, [r4, #0xc]
	orrs r0, r2
	b _08111456
_08111412:
	movs r7, #0
	ldr r1, [sp, #4]
	movs r0, #0xf0
	lsls r0, r0, #8
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #6
	cmp r1, r0
	bne _08111426
	movs r7, #1
_08111426:
	movs r6, #0x80
	lsls r6, r6, #3
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r1, r0
	bne _0811144C
	ldr r1, [r4, #0x28]
	ldr r0, _08111448 @ =__sseek
	cmp r1, r0
	bne _0811144C
	adds r0, r6, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	str r6, [r4, #0x4c]
	b _08111458
	.align 2, 0
_08111448: .4byte __sseek
_0811144C:
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r2, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
_08111456:
	strh r0, [r4, #0xc]
_08111458:
	ldr r0, [r4, #0x54]
	adds r1, r6, #0
	bl _malloc_r
	adds r2, r0, #0
	cmp r2, #0
	bne _0811147C
	movs r0, #2
	ldrh r2, [r4, #0xc]
	orrs r0, r2
	strh r0, [r4, #0xc]
_0811146E:
	adds r0, r4, #0
	adds r0, #0x43
	str r0, [r4]
	str r0, [r4, #0x10]
	movs r0, #1
	str r0, [r4, #0x14]
	b _081114AA
_0811147C:
	ldr r1, [r4, #0x54]
	ldr r0, _081114B0 @ =_cleanup_r
	str r0, [r1, #0x3c]
	movs r0, #0x80
	movs r5, #0
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
	str r2, [r4]
	str r2, [r4, #0x10]
	str r6, [r4, #0x14]
	cmp r7, #0
	beq _081114AA
	movs r2, #0xe
	ldrsh r0, [r4, r2]
	bl isatty
	cmp r0, #0
	beq _081114AA
	movs r0, #1
	ldrh r1, [r4, #0xc]
	orrs r0, r1
	strh r0, [r4, #0xc]
_081114AA:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_081114B0: .4byte _cleanup_r

	thumb_func_start malloc_extend_top
malloc_extend_top: @ 0x081114B4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	ldr r0, _08111528 @ =gUnk_09ED4D98
	ldr r0, [r0, #8]
	mov r8, r0
	ldr r7, [r0, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r7, r0
	mov r2, r8
	adds r4, r2, r7
	ldr r0, _0811152C @ =gUnk_09ED51A4
	ldr r0, [r0]
	adds r1, r1, r0
	adds r6, r1, #0
	adds r6, #0x10
	ldr r3, _08111530 @ =gUnk_09ED51A8
	mov sl, r3
	ldr r0, [r3]
	movs r2, #1
	rsbs r2, r2, #0
	mov sb, r2
	cmp r0, sb
	beq _081114F6
	ldr r3, _08111534 @ =0x0000100F
	adds r6, r1, r3
	ldr r0, _08111538 @ =0xFFFFF000
	ands r6, r0
_081114F6:
	ldr r0, [sp]
	adds r1, r6, #0
	bl _sbrk_r
	adds r5, r0, #0
	cmp r5, sb
	beq _081115F8
	cmp r5, r4
	bhs _0811150E
	ldr r0, _08111528 @ =gUnk_09ED4D98
	cmp r8, r0
	bne _081115F8
_0811150E:
	ldr r1, _0811153C @ =gUnk_09ED51B4
	ldr r0, [r1]
	adds r2, r0, r6
	str r2, [r1]
	cmp r5, r4
	bne _08111540
	adds r2, r6, r7
	ldr r3, _08111528 @ =gUnk_09ED4D98
	ldr r1, [r3, #8]
	movs r0, #1
	orrs r2, r0
	str r2, [r1, #4]
	b _081115E0
	.align 2, 0
_08111528: .4byte gUnk_09ED4D98
_0811152C: .4byte gUnk_09ED51A4
_08111530: .4byte gUnk_09ED51A8
_08111534: .4byte 0x0000100F
_08111538: .4byte 0xFFFFF000
_0811153C: .4byte gUnk_09ED51B4
_08111540:
	mov r3, sl
	ldr r0, [r3]
	cmp r0, sb
	bne _0811154C
	str r5, [r3]
	b _08111552
_0811154C:
	subs r0, r5, r4
	adds r0, r2, r0
	str r0, [r1]
_08111552:
	adds r1, r5, #0
	adds r1, #8
	movs r0, #7
	ands r1, r0
	cmp r1, #0
	beq _08111566
	movs r0, #8
	subs r4, r0, r1
	adds r5, r5, r4
	b _08111568
_08111566:
	movs r4, #0
_08111568:
	adds r0, r5, r6
	movs r1, #0x80
	lsls r1, r1, #5
	subs r1, #1
	ands r0, r1
	movs r1, #0x80
	lsls r1, r1, #5
	subs r0, r1, r0
	adds r4, r4, r0
	ldr r0, [sp]
	adds r1, r4, #0
	bl _sbrk_r
	adds r2, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _081115F8
	ldr r1, _081115B0 @ =gUnk_09ED51B4
	ldr r0, [r1]
	adds r0, r0, r4
	str r0, [r1]
	ldr r1, _081115B4 @ =gUnk_09ED4D98
	str r5, [r1, #8]
	subs r0, r2, r5
	adds r2, r0, r4
	movs r3, #1
	orrs r2, r3
	str r2, [r5, #4]
	cmp r8, r1
	beq _081115E0
	cmp r7, #0xf
	bhi _081115B8
	str r3, [r5, #4]
	b _081115F8
	.align 2, 0
_081115B0: .4byte gUnk_09ED51B4
_081115B4: .4byte gUnk_09ED4D98
_081115B8:
	subs r7, #0xc
	movs r0, #8
	rsbs r0, r0, #0
	ands r7, r0
	mov r2, r8
	ldr r0, [r2, #4]
	ands r0, r3
	orrs r0, r7
	str r0, [r2, #4]
	adds r1, r2, r7
	movs r0, #5
	str r0, [r1, #4]
	str r0, [r1, #8]
	cmp r7, #0xf
	bls _081115E0
	mov r1, r8
	adds r1, #8
	ldr r0, [sp]
	bl _free_r
_081115E0:
	ldr r0, _08111604 @ =gUnk_09ED51B4
	ldr r2, _08111608 @ =gUnk_09ED51AC
	ldr r1, [r0]
	ldr r0, [r2]
	cmp r1, r0
	bls _081115EE
	str r1, [r2]
_081115EE:
	ldr r2, _0811160C @ =gUnk_09ED51B0
	ldr r0, [r2]
	cmp r1, r0
	bls _081115F8
	str r1, [r2]
_081115F8:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08111604: .4byte gUnk_09ED51B4
_08111608: .4byte gUnk_09ED51AC
_0811160C: .4byte gUnk_09ED51B0

	thumb_func_start _malloc_r
_malloc_r: @ 0x08111610
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r1, #0xb
	cmp r1, #0x16
	ble _08111632
	movs r0, #8
	rsbs r0, r0, #0
	mov r8, r0
	mov r2, r8
	ands r2, r1
	mov r8, r2
	b _08111636
_08111632:
	movs r3, #0x10
	mov r8, r3
_08111636:
	ldr r0, [sp]
	bl __malloc_lock_6
	ldr r0, _0811167C @ =0x000001F7
	cmp r8, r0
	bhi _0811168A
	mov r4, r8
	lsrs r4, r4, #3
	mov ip, r4
	ldr r0, _08111680 @ =gUnk_09ED4D98
	mov r7, r8
	adds r2, r7, r0
	ldr r5, [r2, #0xc]
	cmp r5, r2
	bne _0811165E
	adds r2, r5, #0
	adds r2, #8
	ldr r5, [r2, #0xc]
	cmp r5, r2
	beq _08111684
_0811165E:
	ldr r2, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r2, r0
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	adds r2, r5, r2
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _081119B6
	.align 2, 0
_0811167C: .4byte 0x000001F7
_08111680: .4byte gUnk_09ED4D98
_08111684:
	movs r0, #2
	add ip, r0
	b _08111736
_0811168A:
	mov r2, r8
	lsrs r1, r2, #9
	cmp r1, #0
	bne _08111696
	lsrs r2, r2, #3
	b _081116E6
_08111696:
	cmp r1, #4
	bhi _081116A4
	mov r3, r8
	lsrs r0, r3, #6
	adds r0, #0x38
	mov ip, r0
	b _081116E8
_081116A4:
	cmp r1, #0x14
	bhi _081116AE
	adds r1, #0x5b
	mov ip, r1
	b _081116E8
_081116AE:
	cmp r1, #0x54
	bhi _081116BC
	mov r4, r8
	lsrs r0, r4, #0xc
	adds r0, #0x6e
	mov ip, r0
	b _081116E8
_081116BC:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r1, r0
	bhi _081116CE
	mov r7, r8
	lsrs r0, r7, #0xf
	adds r0, #0x77
	mov ip, r0
	b _081116E8
_081116CE:
	ldr r0, _081116E0 @ =0x00000554
	cmp r1, r0
	bhi _081116E4
	mov r1, r8
	lsrs r0, r1, #0x12
	adds r0, #0x7c
	mov ip, r0
	b _081116E8
	.align 2, 0
_081116E0: .4byte 0x00000554
_081116E4:
	movs r2, #0x7e
_081116E6:
	mov ip, r2
_081116E8:
	mov r3, ip
	lsls r0, r3, #3
	ldr r1, _0811170C @ =gUnk_09ED4D98
	adds r4, r0, r1
	ldr r5, [r4, #0xc]
	cmp r5, r4
	beq _08111732
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	ble _08111710
	adds r0, #3
	add ip, r0
	b _08111732
	.align 2, 0
_0811170C: .4byte gUnk_09ED4D98
_08111710:
	cmp r3, #0
	blt _08111716
	b _08111950
_08111716:
	ldr r5, [r5, #0xc]
	cmp r5, r4
	beq _08111732
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r2, r8
	subs r3, r1, r2
	cmp r3, #0xf
	ble _08111710
	movs r3, #1
	rsbs r3, r3, #0
	add ip, r3
_08111732:
	movs r4, #1
	add ip, r4
_08111736:
	ldr r0, _08111774 @ =gUnk_09ED4DA0
	ldr r5, [r0, #8]
	mov sl, r0
	cmp r5, sl
	bne _08111742
	b _08111844
_08111742:
	ldr r1, [r5, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	ble _08111778
	adds r2, r5, r7
	movs r1, #1
	adds r0, r7, #0
	orrs r0, r1
	str r0, [r5, #4]
	mov r4, sl
	str r2, [r4, #0xc]
	str r2, [r4, #8]
	str r4, [r2, #0xc]
	str r4, [r2, #8]
	adds r0, r3, #0
	orrs r0, r1
	str r0, [r2, #4]
	adds r0, r2, r3
	str r3, [r0]
	b _081119B6
	.align 2, 0
_08111774: .4byte gUnk_09ED4DA0
_08111778:
	mov r7, sl
	str r7, [r7, #0xc]
	str r7, [r7, #8]
	cmp r3, #0
	blt _0811178E
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _081119B6
_0811178E:
	ldr r0, _081117B0 @ =0x000001FF
	cmp r1, r0
	bhi _081117B4
	lsrs r2, r1, #3
	mov r3, sl
	subs r3, #8
	adds r0, r2, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r0, [r3, #4]
	orrs r0, r1
	str r0, [r3, #4]
	lsls r0, r2, #3
	adds r6, r0, r3
	ldr r4, [r6, #8]
	b _0811183C
	.align 2, 0
_081117B0: .4byte 0x000001FF
_081117B4:
	lsrs r2, r1, #9
	cmp r2, #0
	bne _081117BE
	lsrs r2, r1, #3
	b _08111802
_081117BE:
	cmp r2, #4
	bhi _081117CA
	lsrs r0, r1, #6
	adds r2, r0, #0
	adds r2, #0x38
	b _08111802
_081117CA:
	cmp r2, #0x14
	bhi _081117D2
	adds r2, #0x5b
	b _08111802
_081117D2:
	cmp r2, #0x54
	bhi _081117DE
	lsrs r0, r1, #0xc
	adds r2, r0, #0
	adds r2, #0x6e
	b _08111802
_081117DE:
	movs r0, #0xaa
	lsls r0, r0, #1
	cmp r2, r0
	bhi _081117EE
	lsrs r0, r1, #0xf
	adds r2, r0, #0
	adds r2, #0x77
	b _08111802
_081117EE:
	ldr r0, _081117FC @ =0x00000554
	cmp r2, r0
	bhi _08111800
	lsrs r0, r1, #0x12
	adds r2, r0, #0
	adds r2, #0x7c
	b _08111802
	.align 2, 0
_081117FC: .4byte 0x00000554
_08111800:
	movs r2, #0x7e
_08111802:
	lsls r0, r2, #3
	ldr r3, _08111820 @ =gUnk_09ED4D98
	adds r6, r0, r3
	ldr r4, [r6, #8]
	cmp r4, r6
	bne _08111824
	adds r0, r2, #0
	asrs r0, r0, #2
	movs r1, #1
	lsls r1, r0
	ldr r7, _08111820 @ =gUnk_09ED4D98
	ldr r0, [r7, #4]
	orrs r0, r1
	str r0, [r7, #4]
	b _0811183C
	.align 2, 0
_08111820: .4byte gUnk_09ED4D98
_08111824:
	ldr r0, [r4, #4]
	movs r2, #4
	rsbs r2, r2, #0
	b _08111834
_0811182C:
	ldr r4, [r4, #8]
	cmp r4, r6
	beq _0811183A
	ldr r0, [r4, #4]
_08111834:
	ands r0, r2
	cmp r1, r0
	blo _0811182C
_0811183A:
	ldr r6, [r4, #0xc]
_0811183C:
	str r6, [r5, #0xc]
	str r4, [r5, #8]
	str r5, [r6, #8]
	str r5, [r4, #0xc]
_08111844:
	mov r0, ip
	cmp r0, #0
	bge _0811184C
	adds r0, #3
_0811184C:
	asrs r0, r0, #2
	movs r6, #1
	lsls r6, r0
	ldr r0, _08111870 @ =gUnk_09ED4D98
	ldr r1, [r0, #4]
	cmp r6, r1
	bhi _0811190E
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08111882
	movs r0, #4
	rsbs r0, r0, #0
	mov r2, ip
	ands r0, r2
	adds r0, #4
	mov ip, r0
	b _08111878
	.align 2, 0
_08111870: .4byte gUnk_09ED4D98
_08111874:
	movs r3, #4
	add ip, r3
_08111878:
	lsls r6, r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _08111874
_08111882:
	ldr r4, _08111900 @ =gUnk_09ED4D98
	mov sb, r4
_08111886:
	mov r7, ip
	str r7, [sp, #4]
	mov r1, ip
	lsls r0, r1, #3
	mov r3, sb
	adds r2, r0, r3
	adds r4, r2, #0
_08111894:
	ldr r5, [r4, #0xc]
	cmp r5, r4
	beq _081118B4
	movs r0, #4
	rsbs r0, r0, #0
_0811189E:
	ldr r1, [r5, #4]
	ands r1, r0
	mov r7, r8
	subs r3, r1, r7
	cmp r3, #0xf
	bgt _08111964
	cmp r3, #0
	bge _0811198C
	ldr r5, [r5, #0xc]
	cmp r5, r4
	bne _0811189E
_081118B4:
	adds r4, #8
	movs r0, #1
	add ip, r0
	mov r0, ip
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	bne _08111894
_081118C4:
	ldr r0, [sp, #4]
	ands r0, r1
	cmp r0, #0
	beq _08111904
	ldr r3, [sp, #4]
	subs r3, #1
	str r3, [sp, #4]
	subs r2, #8
	ldr r0, [r2, #8]
	cmp r0, r2
	beq _081118C4
_081118DA:
	lsls r6, r6, #1
	mov r4, sb
	ldr r1, [r4, #4]
	cmp r6, r1
	bhi _0811190E
	cmp r6, #0
	beq _0811190E
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	bne _08111886
_081118F0:
	movs r7, #4
	add ip, r7
	lsls r6, r6, #1
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _081118F0
	b _08111886
	.align 2, 0
_08111900: .4byte gUnk_09ED4D98
_08111904:
	mov r1, sb
	ldr r0, [r1, #4]
	bics r0, r6
	str r0, [r1, #4]
	b _081118DA
_0811190E:
	ldr r2, _0811194C @ =gUnk_09ED4D98
	ldr r0, [r2, #8]
	ldr r0, [r0, #4]
	movs r4, #4
	rsbs r4, r4, #0
	ands r0, r4
	mov r7, r8
	subs r3, r0, r7
	cmp r0, r8
	blo _08111926
	cmp r3, #0xf
	bgt _081119A0
_08111926:
	ldr r0, [sp]
	mov r1, r8
	bl malloc_extend_top
	ldr r1, _0811194C @ =gUnk_09ED4D98
	ldr r0, [r1, #8]
	ldr r0, [r0, #4]
	ands r0, r4
	mov r2, r8
	subs r3, r0, r2
	cmp r0, r8
	blo _08111942
	cmp r3, #0xf
	bgt _081119A0
_08111942:
	ldr r0, [sp]
	bl __malloc_unlock_6
	movs r0, #0
	b _081119C0
	.align 2, 0
_0811194C: .4byte gUnk_09ED4D98
_08111950:
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	b _081119B6
_08111964:
	mov r4, r8
	adds r2, r5, r4
	movs r1, #1
	orrs r4, r1
	str r4, [r5, #4]
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	mov r7, sl
	str r2, [r7, #0xc]
	str r2, [r7, #8]
	str r7, [r2, #0xc]
	str r7, [r2, #8]
	adds r0, r3, #0
	orrs r0, r1
	str r0, [r2, #4]
	adds r0, r2, r3
	str r3, [r0]
	b _081119B6
_0811198C:
	adds r2, r5, r1
	ldr r0, [r2, #4]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	ldr r6, [r5, #0xc]
	ldr r4, [r5, #8]
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	b _081119B6
_081119A0:
	ldr r2, _081119CC @ =gUnk_09ED4D98
	ldr r5, [r2, #8]
	movs r1, #1
	mov r0, r8
	orrs r0, r1
	str r0, [r5, #4]
	mov r4, r8
	adds r0, r5, r4
	str r0, [r2, #8]
	orrs r3, r1
	str r3, [r0, #4]
_081119B6:
	ldr r0, [sp]
	bl __malloc_unlock_6
	adds r0, r5, #0
	adds r0, #8
_081119C0:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_081119CC: .4byte gUnk_09ED4D98

	thumb_func_start __malloc_lock_6
__malloc_lock_6: @ 0x081119D0
	bx lr
	.align 2, 0

	thumb_func_start __malloc_unlock_6
__malloc_unlock_6: @ 0x081119D4
	bx lr
	.align 2, 0

	thumb_func_start _Balloc
_Balloc: @ 0x081119D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	bne _081119F4
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x10
	bl _calloc_r
	str r0, [r4, #0x4c]
	cmp r0, #0
	beq _08111A1C
_081119F4:
	ldr r1, [r4, #0x4c]
	lsls r0, r6, #2
	adds r2, r0, r1
	ldr r1, [r2]
	cmp r1, #0
	beq _08111A06
	ldr r0, [r1]
	str r0, [r2]
	b _08111A24
_08111A06:
	movs r5, #1
	lsls r5, r6
	lsls r2, r5, #2
	adds r2, #0x14
	adds r0, r4, #0
	movs r1, #1
	bl _calloc_r
	adds r1, r0, #0
	cmp r1, #0
	bne _08111A20
_08111A1C:
	movs r0, #0
	b _08111A2C
_08111A20:
	str r6, [r1, #4]
	str r5, [r1, #8]
_08111A24:
	movs r0, #0
	str r0, [r1, #0x10]
	str r0, [r1, #0xc]
	adds r0, r1, #0
_08111A2C:
	pop {r4, r5, r6, pc}
	.align 2, 0

	thumb_func_start _Bfree
_Bfree: @ 0x08111A30
	adds r3, r0, #0
	adds r2, r1, #0
	cmp r2, #0
	beq _08111A46
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	str r1, [r2]
	str r2, [r0]
_08111A46:
	bx lr

	thumb_func_start _multadd
_multadd: @ 0x08111A48
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov sb, r0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldr r6, [r5, #0x10]
	adds r3, r5, #0
	adds r3, #0x14
	movs r7, #0
	ldr r0, _08111ADC @ =0x0000FFFF
	mov ip, r0
_08111A64:
	ldr r1, [r3]
	adds r0, r1, #0
	mov r2, ip
	ands r0, r2
	adds r2, r0, #0
	muls r2, r4, r2
	add r2, r8
	lsrs r1, r1, #0x10
	adds r0, r1, #0
	muls r0, r4, r0
	lsrs r1, r2, #0x10
	adds r0, r0, r1
	lsrs r1, r0, #0x10
	mov r8, r1
	lsls r0, r0, #0x10
	mov r1, ip
	ands r2, r1
	adds r0, r0, r2
	stm r3!, {r0}
	adds r7, #1
	cmp r7, r6
	blt _08111A64
	mov r2, r8
	cmp r2, #0
	beq _08111AD2
	ldr r0, [r5, #8]
	cmp r6, r0
	blt _08111AC2
	ldr r1, [r5, #4]
	adds r1, #1
	mov r0, sb
	bl _Balloc
	adds r4, r0, #0
	adds r0, #0xc
	adds r1, r5, #0
	adds r1, #0xc
	ldr r2, [r5, #0x10]
	lsls r2, r2, #2
	adds r2, #8
	bl memcpy
	mov r0, sb
	adds r1, r5, #0
	bl _Bfree
	adds r5, r4, #0
_08111AC2:
	lsls r1, r6, #2
	adds r0, r5, #0
	adds r0, #0x14
	adds r0, r0, r1
	mov r1, r8
	str r1, [r0]
	adds r6, #1
	str r6, [r5, #0x10]
_08111AD2:
	adds r0, r5, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08111ADC: .4byte 0x0000FFFF

	thumb_func_start _s2b
_s2b: @ 0x08111AE0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	mov r8, r3
	mov r0, r8
	adds r0, #8
	movs r1, #9
	bl __divsi3
	movs r1, #0
	movs r2, #1
	cmp r0, #1
	ble _08111B08
_08111B00:
	lsls r2, r2, #1
	adds r1, #1
	cmp r0, r2
	bgt _08111B00
_08111B08:
	adds r0, r7, #0
	bl _Balloc
	adds r1, r0, #0
	ldr r0, [sp, #0x18]
	str r0, [r1, #0x14]
	movs r0, #1
	str r0, [r1, #0x10]
	movs r5, #9
	cmp r6, #9
	ble _08111B3A
	adds r4, #9
_08111B20:
	ldrb r3, [r4]
	subs r3, #0x30
	adds r4, #1
	adds r0, r7, #0
	movs r2, #0xa
	bl _multadd
	adds r1, r0, #0
	adds r5, #1
	cmp r5, r6
	blt _08111B20
	adds r4, #1
	b _08111B3C
_08111B3A:
	adds r4, #0xa
_08111B3C:
	cmp r5, r8
	bge _08111B5A
	mov r0, r8
	subs r5, r0, r5
_08111B44:
	ldrb r3, [r4]
	subs r3, #0x30
	adds r4, #1
	adds r0, r7, #0
	movs r2, #0xa
	bl _multadd
	adds r1, r0, #0
	subs r5, #1
	cmp r5, #0
	bne _08111B44
_08111B5A:
	adds r0, r1, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

	thumb_func_start _hi0bits
_hi0bits: @ 0x08111B64
	adds r1, r0, #0
	movs r2, #0
	ldr r0, _08111BB4 @ =0xFFFF0000
	ands r0, r1
	cmp r0, #0
	bne _08111B74
	movs r2, #0x10
	lsls r1, r1, #0x10
_08111B74:
	movs r0, #0xff
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _08111B82
	adds r2, #8
	lsls r1, r1, #8
_08111B82:
	movs r0, #0xf0
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _08111B90
	adds r2, #4
	lsls r1, r1, #4
_08111B90:
	movs r0, #0xc0
	lsls r0, r0, #0x18
	ands r0, r1
	cmp r0, #0
	bne _08111B9E
	adds r2, #2
	lsls r1, r1, #2
_08111B9E:
	cmp r1, #0
	blt _08111BB8
	adds r2, #1
	movs r0, #0x80
	lsls r0, r0, #0x17
	ands r0, r1
	cmp r0, #0
	bne _08111BB8
	movs r0, #0x20
	b _08111BBA
	.align 2, 0
_08111BB4: .4byte 0xFFFF0000
_08111BB8:
	adds r0, r2, #0
_08111BBA:
	bx lr

	thumb_func_start _lo0bits
_lo0bits: @ 0x08111BBC
	adds r3, r0, #0
	ldr r1, [r3]
	movs r0, #7
	ands r0, r1
	cmp r0, #0
	beq _08111BEC
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08111BD4
	movs r0, #0
	b _08111C3C
_08111BD4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08111BE4
	lsrs r0, r1, #1
	str r0, [r3]
	movs r0, #1
	b _08111C3C
_08111BE4:
	lsrs r0, r1, #2
	str r0, [r3]
	movs r0, #2
	b _08111C3C
_08111BEC:
	movs r2, #0
	ldr r0, _08111C34 @ =0x0000FFFF
	ands r0, r1
	cmp r0, #0
	bne _08111BFA
	movs r2, #0x10
	lsrs r1, r1, #0x10
_08111BFA:
	movs r0, #0xff
	ands r0, r1
	cmp r0, #0
	bne _08111C06
	adds r2, #8
	lsrs r1, r1, #8
_08111C06:
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _08111C12
	adds r2, #4
	lsrs r1, r1, #4
_08111C12:
	movs r0, #3
	ands r0, r1
	cmp r0, #0
	bne _08111C1E
	adds r2, #2
	lsrs r1, r1, #2
_08111C1E:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08111C38
	adds r2, #1
	lsrs r1, r1, #1
	cmp r1, #0
	bne _08111C38
	movs r0, #0x20
	b _08111C3C
	.align 2, 0
_08111C34: .4byte 0x0000FFFF
_08111C38:
	str r1, [r3]
	adds r0, r2, #0
_08111C3C:
	bx lr
	.align 2, 0

	thumb_func_start _i2b
_i2b: @ 0x08111C40
	push {r4, lr}
	adds r4, r1, #0
	movs r1, #1
	bl _Balloc
	str r4, [r0, #0x14]
	movs r1, #1
	str r1, [r0, #0x10]
	pop {r4, pc}
	.align 2, 0

	thumb_func_start _multiply
_multiply: @ 0x08111C54
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	adds r3, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r1, [r4, #0x10]
	ldr r0, [r5, #0x10]
	cmp r1, r0
	bge _08111C74
	str r4, [sp]
	adds r4, r5, #0
	ldr r5, [sp]
_08111C74:
	ldr r1, [r4, #4]
	ldr r6, [r4, #0x10]
	ldr r0, [r5, #0x10]
	mov r8, r0
	mov r2, r8
	adds r2, r6, r2
	str r2, [sp, #4]
	ldr r0, [r4, #8]
	cmp r2, r0
	ble _08111C8A
	adds r1, #1
_08111C8A:
	adds r0, r3, #0
	bl _Balloc
	str r0, [sp]
	adds r7, r0, #0
	adds r7, #0x14
	ldr r1, [sp, #4]
	lsls r0, r1, #2
	adds r2, r7, r0
	str r2, [sp, #8]
	str r0, [sp, #0x18]
	adds r1, r4, #0
	adds r1, #0x14
	lsls r3, r6, #2
	adds r2, r5, #0
	adds r2, #0x14
	mov r5, r8
	lsls r4, r5, #2
	ldr r0, [sp, #8]
	cmp r7, r0
	bhs _08111CBE
	movs r0, #0
_08111CB6:
	stm r7!, {r0}
	ldr r5, [sp, #8]
	cmp r7, r5
	blo _08111CB6
_08111CBE:
	str r1, [sp, #8]
	adds r3, r1, r3
	str r3, [sp, #0xc]
	mov r8, r2
	add r4, r8
	str r4, [sp, #0x10]
	ldr r0, [sp]
	adds r0, #0x14
	mov sb, r0
	mov r1, sb
	str r1, [sp, #0x20]
	cmp r8, r4
	bhs _08111D86
_08111CD8:
	mov r2, r8
	ldm r2!, {r6}
	str r2, [sp, #0x14]
	ldr r0, _08111D94 @ =0x0000FFFF
	ands r6, r0
	mov r4, sb
	adds r4, #4
	str r4, [sp, #0x1c]
	cmp r6, #0
	beq _08111D30
	ldr r7, [sp, #8]
	mov r5, sb
	movs r1, #0
	mov ip, r1
	mov sl, r0
_08111CF6:
	ldm r7!, {r3}
	adds r0, r3, #0
	mov r2, sl
	ands r0, r2
	adds r1, r0, #0
	muls r1, r6, r1
	ldr r2, [r5]
	adds r0, r2, #0
	mov r4, sl
	ands r0, r4
	adds r1, r1, r0
	mov r0, ip
	adds r4, r1, r0
	lsrs r1, r4, #0x10
	lsrs r3, r3, #0x10
	adds r0, r3, #0
	muls r0, r6, r0
	lsrs r2, r2, #0x10
	adds r0, r0, r2
	adds r2, r0, r1
	lsrs r0, r2, #0x10
	mov ip, r0
	strh r2, [r5]
	strh r4, [r5, #2]
	adds r5, #4
	ldr r1, [sp, #0xc]
	cmp r7, r1
	blo _08111CF6
	str r0, [r5]
_08111D30:
	mov r2, r8
	ldrh r6, [r2, #2]
	cmp r6, #0
	beq _08111D78
	ldr r7, [sp, #8]
	mov r5, sb
	movs r4, #0
	mov ip, r4
	ldr r2, [r5]
	ldr r3, _08111D94 @ =0x0000FFFF
_08111D44:
	ldm r7!, {r1}
	adds r0, r1, #0
	ands r0, r3
	muls r0, r6, r0
	ldrh r4, [r5, #2]
	adds r4, r4, r0
	mov r8, r4
	add r4, ip
	lsrs r0, r4, #0x10
	mov ip, r0
	strh r4, [r5]
	strh r2, [r5, #2]
	adds r5, #4
	lsrs r1, r1, #0x10
	muls r1, r6, r1
	ldr r0, [r5]
	ands r0, r3
	adds r1, r1, r0
	mov r4, ip
	adds r2, r1, r4
	lsrs r0, r2, #0x10
	mov ip, r0
	ldr r1, [sp, #0xc]
	cmp r7, r1
	blo _08111D44
	str r2, [r5]
_08111D78:
	ldr r2, [sp, #0x14]
	mov r8, r2
	ldr r4, [sp, #0x1c]
	mov sb, r4
	ldr r5, [sp, #0x10]
	cmp r8, r5
	blo _08111CD8
_08111D86:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x18]
	adds r5, r0, r1
	ldr r2, [sp, #4]
	cmp r2, #0
	ble _08111DAA
	b _08111DA2
	.align 2, 0
_08111D94: .4byte 0x0000FFFF
_08111D98:
	ldr r4, [sp, #4]
	subs r4, #1
	str r4, [sp, #4]
	cmp r4, #0
	ble _08111DAA
_08111DA2:
	subs r5, #4
	ldr r0, [r5]
	cmp r0, #0
	beq _08111D98
_08111DAA:
	ldr r5, [sp, #4]
	ldr r0, [sp]
	str r5, [r0, #0x10]
	ldr r0, [sp]
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

	thumb_func_start _pow5mult
_pow5mult: @ 0x08111DC0
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r7, r1, #0
	adds r6, r2, #0
	movs r1, #3
	ands r1, r6
	cmp r1, #0
	beq _08111DEA
	ldr r0, _08111E0C @ =gUnk_09E58680
	subs r1, #1
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r2, [r1]
	mov r0, r8
	adds r1, r7, #0
	movs r3, #0
	bl _multadd
	adds r7, r0, #0
_08111DEA:
	asrs r6, r6, #2
	cmp r6, #0
	beq _08111E50
	mov r0, r8
	ldr r5, [r0, #0x48]
	adds r4, r5, #0
	cmp r5, #0
	bne _08111E2C
	ldr r1, _08111E10 @ =0x00000271
	bl _i2b
	mov r1, r8
	str r0, [r1, #0x48]
	adds r5, r0, #0
	str r4, [r5]
	b _08111E2C
	.align 2, 0
_08111E0C: .4byte gUnk_09E58680
_08111E10: .4byte 0x00000271
_08111E14:
	ldr r0, [r5]
	adds r4, r0, #0
	cmp r0, #0
	bne _08111E2A
	mov r0, r8
	adds r1, r5, #0
	adds r2, r5, #0
	bl _multiply
	str r0, [r5]
	str r4, [r0]
_08111E2A:
	adds r5, r0, #0
_08111E2C:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _08111E4A
	mov r0, r8
	adds r1, r7, #0
	adds r2, r5, #0
	bl _multiply
	adds r4, r0, #0
	mov r0, r8
	adds r1, r7, #0
	bl _Bfree
	adds r7, r4, #0
_08111E4A:
	asrs r6, r6, #1
	cmp r6, #0
	bne _08111E14
_08111E50:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}

	thumb_func_start _lshift
_lshift: @ 0x08111E58
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sl, r0
	mov r8, r1
	adds r5, r2, #0
	asrs r6, r5, #5
	ldr r1, [r1, #4]
	mov r2, r8
	ldr r0, [r2, #0x10]
	adds r0, r6, r0
	adds r7, r0, #1
	ldr r2, [r2, #8]
	cmp r7, r2
	ble _08111E82
_08111E7A:
	adds r1, #1
	lsls r2, r2, #1
	cmp r7, r2
	bgt _08111E7A
_08111E82:
	mov r0, sl
	bl _Balloc
	mov sb, r0
	mov r4, sb
	adds r4, #0x14
	mov r0, r8
	adds r0, #0x14
	cmp r6, #0
	ble _08111EA2
	movs r1, #0
	adds r2, r6, #0
_08111E9A:
	stm r4!, {r1}
	subs r2, #1
	cmp r2, #0
	bne _08111E9A
_08111EA2:
	adds r3, r0, #0
	mov r1, r8
	ldr r0, [r1, #0x10]
	lsls r0, r0, #2
	adds r6, r3, r0
	movs r0, #0x1f
	ands r5, r0
	cmp r5, #0
	beq _08111ED4
	movs r0, #0x20
	subs r1, r0, r5
	movs r2, #0
_08111EBA:
	ldr r0, [r3]
	lsls r0, r5
	orrs r0, r2
	stm r4!, {r0}
	ldm r3!, {r2}
	lsrs r2, r1
	cmp r3, r6
	blo _08111EBA
	str r2, [r4]
	cmp r2, #0
	beq _08111EDC
	adds r7, #1
	b _08111EDC
_08111ED4:
	ldm r3!, {r0}
	stm r4!, {r0}
	cmp r3, r6
	blo _08111ED4
_08111EDC:
	subs r0, r7, #1
	mov r2, sb
	str r0, [r2, #0x10]
	mov r0, sl
	mov r1, r8
	bl _Bfree
	mov r0, sb
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

	thumb_func_start __mcmp
__mcmp: @ 0x08111EF8
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r5, r1, #0
	ldr r0, [r2, #0x10]
	ldr r1, [r5, #0x10]
	subs r0, r0, r1
	cmp r0, #0
	bne _08111F34
	adds r4, r2, #0
	adds r4, #0x14
	lsls r1, r1, #2
	adds r3, r4, r1
	adds r0, r5, #0
	adds r0, #0x14
	adds r1, r0, r1
_08111F16:
	subs r3, #4
	subs r1, #4
	ldr r0, [r3]
	ldr r2, [r1]
	cmp r0, r2
	beq _08111F2E
	movs r1, #1
	cmp r0, r2
	bhs _08111F2A
	subs r1, #2
_08111F2A:
	adds r0, r1, #0
	b _08111F34
_08111F2E:
	cmp r3, r4
	bhi _08111F16
	movs r0, #0
_08111F34:
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start __mdiff
__mdiff: @ 0x08111F38
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r5, r1, #0
	mov r8, r2
	adds r0, r5, #0
	mov r1, r8
	bl __mcmp
	adds r4, r0, #0
	cmp r4, #0
	bne _08111F6A
	adds r0, r6, #0
	movs r1, #0
	bl _Balloc
	adds r7, r0, #0
	movs r0, #1
	str r0, [r7, #0x10]
	str r4, [r7, #0x14]
	b _0811201A
_08111F6A:
	cmp r4, #0
	bge _08111F78
	adds r7, r5, #0
	mov r5, r8
	mov r8, r7
	movs r4, #1
	b _08111F7A
_08111F78:
	movs r4, #0
_08111F7A:
	ldr r1, [r5, #4]
	adds r0, r6, #0
	bl _Balloc
	adds r7, r0, #0
	str r4, [r7, #0xc]
	ldr r0, [r5, #0x10]
	mov sb, r0
	adds r6, r5, #0
	adds r6, #0x14
	lsls r0, r0, #2
	adds r0, r0, r6
	mov sl, r0
	mov r1, r8
	ldr r0, [r1, #0x10]
	movs r3, #0x14
	add r3, r8
	mov ip, r3
	lsls r0, r0, #2
	add r0, ip
	str r0, [sp]
	adds r4, r7, #0
	adds r4, #0x14
	movs r5, #0
	ldr r0, _08112004 @ =0x0000FFFF
	mov r8, r0
_08111FAE:
	ldm r6!, {r1}
	str r1, [sp, #4]
	mov r3, r8
	ands r1, r3
	mov r0, ip
	adds r0, #4
	mov ip, r0
	subs r0, #4
	ldm r0!, {r2}
	adds r0, r2, #0
	ands r0, r3
	subs r1, r1, r0
	adds r0, r1, r5
	asrs r5, r0, #0x10
	ldr r1, [sp, #4]
	lsrs r3, r1, #0x10
	lsrs r2, r2, #0x10
	subs r3, r3, r2
	adds r1, r3, r5
	asrs r5, r1, #0x10
	strh r1, [r4]
	strh r0, [r4, #2]
	adds r4, #4
	ldr r3, [sp]
	cmp ip, r3
	blo _08111FAE
	cmp r6, sl
	bhs _0811200E
	ldr r2, _08112004 @ =0x0000FFFF
_08111FE8:
	ldm r6!, {r1}
	adds r0, r1, #0
	ands r0, r2
	adds r0, r0, r5
	asrs r5, r0, #0x10
	lsrs r1, r1, #0x10
	adds r1, r1, r5
	asrs r5, r1, #0x10
	strh r1, [r4]
	strh r0, [r4, #2]
	adds r4, #4
	cmp r6, sl
	blo _08111FE8
	b _0811200E
	.align 2, 0
_08112004: .4byte 0x0000FFFF
_08112008:
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
_0811200E:
	subs r4, #4
	ldr r0, [r4]
	cmp r0, #0
	beq _08112008
	mov r1, sb
	str r1, [r7, #0x10]
_0811201A:
	adds r0, r7, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}

	thumb_func_start _ulp
_ulp: @ 0x08112028
	push {r4, lr}
	ldr r2, _0811203C @ =0x7FF00000
	ands r2, r0
	ldr r0, _08112040 @ =0xFCC00000
	adds r2, r2, r0
	cmp r2, #0
	ble _08112044
	adds r3, r2, #0
	movs r4, #0
	b _0811206E
	.align 2, 0
_0811203C: .4byte 0x7FF00000
_08112040: .4byte 0xFCC00000
_08112044:
	rsbs r0, r2, #0
	asrs r2, r0, #0x14
	cmp r2, #0x13
	bgt _08112058
	movs r0, #0x80
	lsls r0, r0, #0xc
	adds r3, r0, #0
	asrs r3, r2
	movs r4, #0
	b _0811206E
_08112058:
	movs r3, #0
	subs r2, #0x14
	cmp r2, #0x1e
	bgt _0811206A
	movs r0, #0x1f
	subs r0, r0, r2
	movs r1, #1
	lsls r1, r0
	b _0811206C
_0811206A:
	movs r1, #1
_0811206C:
	adds r4, r1, #0
_0811206E:
	adds r1, r4, #0
	adds r0, r3, #0
	pop {r4, pc}

	thumb_func_start _b2d
_b2d: @ 0x08112074
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r1, #0
	movs r1, #0x14
	adds r1, r1, r0
	mov r8, r1
	ldr r0, [r0, #0x10]
	lsls r0, r0, #2
	adds r5, r1, r0
	subs r5, #4
	ldr r2, [r5]
	adds r0, r2, #0
	str r2, [sp]
	bl _hi0bits
	adds r3, r0, #0
	movs r0, #0x20
	subs r0, r0, r3
	str r0, [r4]
	ldr r2, [sp]
	cmp r3, #0xa
	bgt _081120D4
	movs r0, #0xb
	subs r0, r0, r3
	adds r1, r2, #0
	lsrs r1, r0
	ldr r0, _081120BC @ =0x3FF00000
	adds r6, r1, #0
	orrs r6, r0
	cmp r5, r8
	bls _081120C0
	subs r5, #4
	ldr r1, [r5]
	b _081120C2
	.align 2, 0
_081120BC: .4byte 0x3FF00000
_081120C0:
	movs r1, #0
_081120C2:
	adds r0, r3, #0
	adds r0, #0x15
	lsls r2, r0
	movs r0, #0xb
	subs r0, r0, r3
	lsrs r1, r0
	adds r7, r2, #0
	orrs r7, r1
	b _08112120
_081120D4:
	cmp r5, r8
	bls _081120DE
	subs r5, #4
	ldr r4, [r5]
	b _081120E0
_081120DE:
	movs r4, #0
_081120E0:
	subs r3, #0xb
	cmp r3, #0
	beq _08112118
	lsls r2, r3
	movs r0, #0x20
	subs r0, r0, r3
	adds r1, r4, #0
	lsrs r1, r0
	ldr r0, _08112104 @ =0x3FF00000
	orrs r1, r0
	adds r6, r2, #0
	orrs r6, r1
	cmp r5, r8
	bls _08112108
	subs r5, #4
	ldr r2, [r5]
	b _0811210A
	.align 2, 0
_08112104: .4byte 0x3FF00000
_08112108:
	movs r2, #0
_0811210A:
	lsls r4, r3
	movs r0, #0x20
	subs r0, r0, r3
	lsrs r2, r0
	adds r7, r4, #0
	orrs r7, r2
	b _08112120
_08112118:
	ldr r0, _0811212C @ =0x3FF00000
	adds r6, r2, #0
	orrs r6, r0
	adds r7, r4, #0
_08112120:
	adds r1, r7, #0
	adds r0, r6, #0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0811212C: .4byte 0x3FF00000

	thumb_func_start _d2b
_d2b: @ 0x08112130
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r3
	ldr r3, [sp, #0x28]
	mov sl, r3
	adds r5, r2, #0
	adds r4, r1, #0
	movs r1, #1
	bl _Balloc
	adds r6, r0, #0
	movs r0, #0x14
	adds r0, r0, r6
	mov r8, r0
	ldr r2, _08112198 @ =0x000FFFFF
	adds r1, r4, #0
	ands r2, r1
	str r2, [sp, #4]
	ldr r0, _0811219C @ =0x7FFFFFFF
	ands r4, r0
	lsrs r7, r4, #0x14
	cmp r7, #0
	beq _0811216E
	movs r0, #0x80
	lsls r0, r0, #0xd
	orrs r0, r2
	str r0, [sp, #4]
_0811216E:
	str r5, [sp]
	cmp r5, #0
	beq _081121B8
	mov r0, sp
	bl _lo0bits
	adds r2, r0, #0
	cmp r2, #0
	beq _081121A0
	movs r0, #0x20
	subs r0, r0, r2
	ldr r1, [sp, #4]
	lsls r1, r0
	ldr r0, [sp]
	orrs r0, r1
	str r0, [r6, #0x14]
	ldr r0, [sp, #4]
	lsrs r0, r2
	str r0, [sp, #4]
	b _081121A4
	.align 2, 0
_08112198: .4byte 0x000FFFFF
_0811219C: .4byte 0x7FFFFFFF
_081121A0:
	ldr r0, [sp]
	str r0, [r6, #0x14]
_081121A4:
	ldr r0, [sp, #4]
	mov r1, r8
	str r0, [r1, #4]
	movs r1, #1
	cmp r0, #0
	beq _081121B2
	movs r1, #2
_081121B2:
	str r1, [r6, #0x10]
	adds r4, r1, #0
	b _081121CC
_081121B8:
	add r0, sp, #4
	bl _lo0bits
	adds r2, r0, #0
	ldr r0, [sp, #4]
	str r0, [r6, #0x14]
	movs r0, #1
	str r0, [r6, #0x10]
	movs r4, #1
	adds r2, #0x20
_081121CC:
	cmp r7, #0
	beq _081121E8
	ldr r3, _081121E4 @ =0xFFFFFBCD
	adds r0, r2, r3
	adds r0, r7, r0
	mov r1, sb
	str r0, [r1]
	movs r0, #0x35
	subs r0, r0, r2
	mov r3, sl
	str r0, [r3]
	b _08112204
	.align 2, 0
_081121E4: .4byte 0xFFFFFBCD
_081121E8:
	ldr r1, _08112214 @ =0xFFFFFBCE
	adds r0, r2, r1
	mov r3, sb
	str r0, [r3]
	lsls r0, r4, #2
	add r0, r8
	subs r0, #4
	ldr r0, [r0]
	bl _hi0bits
	lsls r1, r4, #5
	subs r1, r1, r0
	mov r0, sl
	str r1, [r0]
_08112204:
	adds r0, r6, #0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08112214: .4byte 0xFFFFFBCE

	thumb_func_start _ratio
_ratio: @ 0x08112218
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r5, r1, #0
	mov r1, sp
	bl _b2d
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r1, sp, #4
	adds r0, r5, #0
	bl _b2d
	adds r7, r1, #0
	adds r6, r0, #0
	ldr r2, [sp]
	ldr r0, [sp, #4]
	subs r2, r2, r0
	ldr r0, [r4, #0x10]
	ldr r1, [r5, #0x10]
	subs r0, r0, r1
	lsls r0, r0, #5
	adds r0, r2, r0
	cmp r0, #0
	ble _08112254
	lsls r0, r0, #0x14
	ldr r1, [sp, #8]
	adds r0, r1, r0
	str r0, [sp, #8]
	b _08112258
_08112254:
	lsls r0, r0, #0x14
	subs r6, r6, r0
_08112258:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __divdf3
	add sp, #0x10
	pop {r4, r5, r6, r7, pc}

	thumb_func_start _mprec_log10
_mprec_log10: @ 0x08112268
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08112284 @ =0x00000000
	ldr r0, _08112280 @ =0x3FF00000
	cmp r4, #0x17
	bgt _0811228C
	ldr r0, _08112288 @ =gUnk_09E5868C
	lsls r1, r4, #3
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, [r1, #4]
	b _0811229E
	.align 2, 0
_08112280: .4byte 0x3FF00000
_08112284: .4byte 0x00000000
_08112288: .4byte gUnk_09E5868C
_0811228C:
	cmp r4, #0
	ble _0811229E
_08112290:
	ldr r3, _081122A4 @ =0x00000000
	ldr r2, _081122A0 @ =0x40240000
	bl __muldf3
	subs r4, #1
	cmp r4, #0
	bgt _08112290
_0811229E:
	pop {r4, pc}
	.align 2, 0
_081122A0: .4byte 0x40240000
_081122A4: .4byte 0x00000000

	thumb_func_start _realloc_r
_realloc_r: @ 0x081122A8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	adds r5, r1, #0
	str r2, [sp, #4]
	cmp r5, #0
	bne _081122C6
	adds r1, r2, #0
	bl _malloc_r
	b _08112592
_081122C6:
	ldr r0, [sp]
	bl __malloc_lock_6
	adds r4, r5, #0
	subs r4, #8
	adds r7, r4, #0
	ldr r0, [r4, #4]
	mov sb, r0
	movs r0, #4
	rsbs r0, r0, #0
	mov r1, sb
	ands r1, r0
	mov sb, r1
	mov r8, sb
	ldr r0, [sp, #4]
	adds r0, #0xb
	cmp r0, #0x16
	ble _081122F8
	movs r3, #8
	rsbs r3, r3, #0
	mov sl, r3
	mov r1, sl
	ands r1, r0
	mov sl, r1
	b _081122FC
_081122F8:
	movs r3, #0x10
	mov sl, r3
_081122FC:
	cmp r8, sl
	blt _08112302
	b _08112544
_08112302:
	mov r0, r8
	adds r6, r7, r0
	ldr r0, _08112360 @ =gUnk_09ED4D98
	ldr r2, [r0, #8]
	mov ip, r0
	cmp r6, r2
	beq _08112324
	ldr r0, [r6, #4]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	adds r0, r6, r0
	ldr r0, [r0, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08112378
_08112324:
	ldr r3, [r6, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r3, r0
	cmp r6, r2
	bne _08112364
	mov r4, sb
	adds r1, r3, r4
	mov r0, sl
	adds r0, #0x10
	cmp r1, r0
	blt _0811237C
	mov r5, sl
	adds r2, r7, r5
	mov r0, ip
	str r2, [r0, #8]
	subs r0, r1, r5
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	ldr r0, [r7, #4]
	ands r0, r1
	orrs r0, r5
	str r0, [r7, #4]
	ldr r0, [sp]
	bl __malloc_unlock_6
	adds r0, r7, #0
	b _08112590
	.align 2, 0
_08112360: .4byte gUnk_09ED4D98
_08112364:
	mov r1, sb
	adds r2, r3, r1
	cmp r2, sl
	blt _0811237C
	ldr r1, [r6, #0xc]
	ldr r0, [r6, #8]
	str r1, [r0, #0xc]
	str r0, [r1, #8]
	mov sb, r2
	b _08112544
_08112378:
	movs r6, #0
	movs r3, #0
_0811237C:
	ldr r0, [r7, #4]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08112388
	b _081124B2
_08112388:
	ldr r0, [r7]
	subs r2, r7, r0
	ldr r1, [r2, #4]
	movs r0, #4
	rsbs r0, r0, #0
	ands r1, r0
	cmp r6, #0
	beq _08112444
	mov r4, ip
	ldr r0, [r4, #8]
	cmp r6, r0
	bne _08112430
	adds r0, r3, r1
	mov r4, sb
	adds r3, r0, r4
	mov r0, sl
	adds r0, #0x10
	cmp r3, r0
	blt _08112444
	ldr r1, [r2, #0xc]
	ldr r0, [r2, #8]
	str r1, [r0, #0xc]
	str r0, [r1, #8]
	adds r4, r2, #0
	mov sb, r3
	adds r6, r4, #0
	adds r6, #8
	mov r2, r8
	subs r2, #4
	cmp r2, #0x24
	bhi _08112406
	adds r1, r5, #0
	adds r3, r6, #0
	cmp r2, #0x13
	bls _081123F8
	ldm r1!, {r0}
	str r0, [r4, #8]
	ldr r0, [r5, #4]
	str r0, [r4, #0xc]
	adds r1, #4
	adds r3, r4, #0
	adds r3, #0x10
	cmp r2, #0x1b
	bls _081123F8
	ldm r1!, {r0}
	str r0, [r4, #0x10]
	ldm r1!, {r0}
	str r0, [r4, #0x14]
	adds r3, #8
	cmp r2, #0x23
	bls _081123F8
	ldm r1!, {r0}
	str r0, [r4, #0x18]
	ldm r1!, {r0}
	str r0, [r4, #0x1c]
	adds r3, #8
_081123F8:
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldr r0, [r1]
	str r0, [r3]
	b _0811240E
_08112406:
	adds r0, r6, #0
	adds r1, r5, #0
	bl memcpy
_0811240E:
	ldr r0, _0811242C @ =gUnk_09ED4D98
	mov r5, sl
	adds r2, r4, r5
	str r2, [r0, #8]
	mov r1, sb
	subs r0, r1, r5
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #4]
	ldr r0, [r4, #4]
	ands r0, r1
	orrs r0, r5
	str r0, [r4, #4]
	b _0811253A
	.align 2, 0
_0811242C: .4byte gUnk_09ED4D98
_08112430:
	adds r0, r3, r1
	mov r4, sb
	adds r3, r0, r4
	cmp r3, sl
	blt _08112444
	ldr r1, [r6, #0xc]
	ldr r0, [r6, #8]
	str r1, [r0, #0xc]
	str r0, [r1, #8]
	b _08112450
_08112444:
	cmp r2, #0
	beq _081124B2
	mov r0, sb
	adds r3, r1, r0
	cmp r3, sl
	blt _081124B2
_08112450:
	ldr r1, [r2, #0xc]
	ldr r0, [r2, #8]
	str r1, [r0, #0xc]
	str r0, [r1, #8]
	adds r4, r2, #0
	mov sb, r3
	adds r6, r4, #0
	adds r6, #8
	mov r2, r8
	subs r2, #4
	cmp r2, #0x24
	bhi _081124A8
	adds r1, r5, #0
	adds r3, r6, #0
	cmp r2, #0x13
	bls _0811249A
	ldm r1!, {r0}
	str r0, [r4, #8]
	ldr r0, [r5, #4]
	str r0, [r4, #0xc]
	adds r1, #4
	adds r3, r4, #0
	adds r3, #0x10
	cmp r2, #0x1b
	bls _0811249A
	ldm r1!, {r0}
	str r0, [r4, #0x10]
	ldm r1!, {r0}
	str r0, [r4, #0x14]
	adds r3, #8
	cmp r2, #0x23
	bls _0811249A
	ldm r1!, {r0}
	str r0, [r4, #0x18]
	ldm r1!, {r0}
	str r0, [r4, #0x1c]
	adds r3, #8
_0811249A:
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldr r0, [r1]
	str r0, [r3]
	b _08112544
_081124A8:
	adds r0, r6, #0
	adds r1, r5, #0
	bl memcpy
	b _08112544
_081124B2:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl _malloc_r
	adds r6, r0, #0
	cmp r6, #0
	bne _081124CA
	ldr r0, [sp]
	bl __malloc_unlock_6
	movs r0, #0
	b _08112592
_081124CA:
	adds r4, r6, #0
	subs r4, #8
	ldr r0, [r7, #4]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	adds r0, r7, r0
	cmp r4, r0
	bne _081124E8
	ldr r0, [r4, #4]
	subs r1, #2
	ands r0, r1
	add sb, r0
	adds r4, r7, #0
	b _08112544
_081124E8:
	mov r2, r8
	subs r2, #4
	cmp r2, #0x24
	bhi _0811252A
	adds r1, r5, #0
	adds r3, r6, #0
	cmp r2, #0x13
	bls _0811251C
	ldm r1!, {r0}
	stm r3!, {r0}
	ldr r0, [r5, #4]
	str r0, [r6, #4]
	adds r1, #4
	adds r3, #4
	cmp r2, #0x1b
	bls _0811251C
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	cmp r2, #0x23
	bls _0811251C
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
_0811251C:
	ldm r1!, {r0}
	stm r3!, {r0}
	ldm r1!, {r0}
	stm r3!, {r0}
	ldr r0, [r1]
	str r0, [r3]
	b _08112532
_0811252A:
	adds r0, r6, #0
	adds r1, r5, #0
	bl memcpy
_08112532:
	ldr r0, [sp]
	adds r1, r5, #0
	bl _free_r
_0811253A:
	ldr r0, [sp]
	bl __malloc_unlock_6
	adds r0, r6, #0
	b _08112592
_08112544:
	mov r1, sb
	mov r3, sl
	subs r2, r1, r3
	cmp r2, #0xf
	bls _08112574
	adds r1, r4, r3
	ldr r0, [r4, #4]
	movs r3, #1
	ands r0, r3
	mov r5, sl
	orrs r0, r5
	str r0, [r4, #4]
	adds r0, r2, #0
	orrs r0, r3
	str r0, [r1, #4]
	adds r2, r1, r2
	ldr r0, [r2, #4]
	orrs r0, r3
	str r0, [r2, #4]
	adds r1, #8
	ldr r0, [sp]
	bl _free_r
	b _08112588
_08112574:
	ldr r0, [r4, #4]
	movs r2, #1
	ands r0, r2
	mov r1, sb
	orrs r0, r1
	str r0, [r4, #4]
	adds r1, r4, r1
	ldr r0, [r1, #4]
	orrs r0, r2
	str r0, [r1, #4]
_08112588:
	ldr r0, [sp]
	bl __malloc_unlock_6
	adds r0, r4, #0
_08112590:
	adds r0, #8
_08112592:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

	thumb_func_start _sbrk_r
_sbrk_r: @ 0x081125A0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	ldr r4, _081125C8 @ =gUnk_02029EA8
	movs r1, #0
	str r1, [r4]
	bl _sbrk
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _081125C2
	ldr r0, [r4]
	cmp r0, #0
	beq _081125C2
	str r0, [r5]
_081125C2:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_081125C8: .4byte gUnk_02029EA8

	thumb_func_start __sread
__sread: @ 0x081125CC
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r0, [r5, #0x54]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	adds r2, r4, #0
	bl _read_r
	adds r1, r0, #0
	cmp r1, #0
	blt _081125EE
	ldr r0, [r5, #0x50]
	adds r0, r0, r1
	str r0, [r5, #0x50]
	b _081125F6
_081125EE:
	ldr r0, _081125FC @ =0xFFFFEFFF
	ldrh r2, [r5, #0xc]
	ands r0, r2
	strh r0, [r5, #0xc]
_081125F6:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_081125FC: .4byte 0xFFFFEFFF

	thumb_func_start __swrite
__swrite: @ 0x08112600
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r4, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _08112622
	ldr r0, [r4, #0x54]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	movs r2, #0
	movs r3, #2
	bl _lseek_r
_08112622:
	ldr r0, _0811263C @ =0xFFFFEFFF
	ldrh r1, [r4, #0xc]
	ands r0, r1
	strh r0, [r4, #0xc]
	ldr r0, [r4, #0x54]
	movs r2, #0xe
	ldrsh r1, [r4, r2]
	adds r2, r5, #0
	adds r3, r6, #0
	bl _write_r
	pop {r4, r5, r6, pc}
	.align 2, 0
_0811263C: .4byte 0xFFFFEFFF

	thumb_func_start __sseek
__sseek: @ 0x08112640
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r2, #0
	ldr r0, [r5, #0x54]
	movs r2, #0xe
	ldrsh r1, [r5, r2]
	adds r2, r4, #0
	bl _lseek_r
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0811266C
	ldr r0, _08112668 @ =0xFFFFEFFF
	ldrh r2, [r5, #0xc]
	ands r0, r2
	strh r0, [r5, #0xc]
	b _0811267A
	.align 2, 0
_08112668: .4byte 0xFFFFEFFF
_0811266C:
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	ldrh r2, [r5, #0xc]
	orrs r0, r2
	strh r0, [r5, #0xc]
	str r1, [r5, #0x50]
_0811267A:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start __sclose
__sclose: @ 0x08112680
	push {lr}
	ldr r2, [r0, #0x54]
	movs r3, #0xe
	ldrsh r1, [r0, r3]
	adds r0, r2, #0
	bl _close_r
	pop {pc}

	thumb_func_start findslot
findslot: @ 0x08112690
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _08112698 @ =gUnk_03005788
	b _081126A4
	.align 2, 0
_08112698: .4byte gUnk_03005788
_0811269C:
	adds r2, #8
	adds r1, #1
	cmp r1, #0x13
	bgt _081126AA
_081126A4:
	ldr r0, [r2]
	cmp r0, r3
	bne _0811269C
_081126AA:
	adds r0, r1, #0
	bx lr
	.align 2, 0

	thumb_func_start remap_handle
remap_handle: @ 0x081126B0
	adds r2, r0, #0
	ldr r0, _081126C4 @ =gUnk_09ED4D94
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r3, #0xe
	ldrsh r0, [r0, r3]
	cmp r2, r0
	bne _081126CC
	ldr r0, _081126C8 @ =gUnk_0300577C
	b _081126F2
	.align 2, 0
_081126C4: .4byte gUnk_09ED4D94
_081126C8: .4byte gUnk_0300577C
_081126CC:
	ldr r0, [r1, #8]
	movs r3, #0xe
	ldrsh r0, [r0, r3]
	cmp r2, r0
	bne _081126E0
	ldr r0, _081126DC @ =gUnk_03005780
	b _081126F2
	.align 2, 0
_081126DC: .4byte gUnk_03005780
_081126E0:
	ldr r0, [r1, #0xc]
	movs r1, #0xe
	ldrsh r0, [r0, r1]
	cmp r2, r0
	beq _081126F0
	adds r0, r2, #0
	subs r0, #0x20
	b _081126F4
_081126F0:
	ldr r0, _081126F8 @ =gUnk_03005784
_081126F2:
	ldr r0, [r0]
_081126F4:
	bx lr
	.align 2, 0
_081126F8: .4byte gUnk_03005784

	thumb_func_start initialise_monitor_handles
initialise_monitor_handles: @ 0x081126FC
	push {r4, r5, lr}
	sub sp, #0xc
	ldr r4, _08112758 @ =gUnk_09E587AC
	str r4, [sp]
	movs r3, #3
	str r3, [sp, #8]
	movs r0, #0
	str r0, [sp, #4]
	movs r5, #1
	adds r0, r5, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	ldr r5, _0811275C @ =gUnk_0300577C
	str r2, [r5]
	str r4, [sp]
	str r3, [sp, #8]
	movs r0, #4
	str r0, [sp, #4]
	ldr r3, _08112760 @ =gUnk_03005780
	movs r4, #1
	adds r0, r4, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	ldr r0, _08112764 @ =gUnk_03005784
	str r2, [r0]
	str r2, [r3]
	ldr r2, _08112768 @ =gUnk_03005788
	adds r1, r2, #0
	subs r4, #2
	adds r0, r2, #0
	adds r0, #0x98
_0811273E:
	str r4, [r0]
	subs r0, #8
	cmp r0, r1
	bge _0811273E
	movs r0, #0
	ldr r1, [r5]
	str r1, [r2]
	str r0, [r2, #4]
	ldr r1, [r3]
	str r1, [r2, #8]
	str r0, [r2, #0xc]
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_08112758: .4byte gUnk_09E587AC
_0811275C: .4byte gUnk_0300577C
_08112760: .4byte gUnk_03005780
_08112764: .4byte gUnk_03005784
_08112768: .4byte gUnk_03005788

	thumb_func_start get_errno
get_errno: @ 0x0811276C
	push {r4, lr}
	movs r3, #0x13
	movs r4, #0
	adds r0, r3, #0
	adds r1, r4, #0
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	pop {r4, pc}
	.align 2, 0

	thumb_func_start error
error: @ 0x08112780
	push {r4, r5, lr}
	adds r5, r0, #0
	bl __errno
	adds r4, r0, #0
	bl get_errno
	str r0, [r4]
	adds r0, r5, #0
	pop {r4, r5, pc}

	thumb_func_start wrap
wrap: @ 0x08112794
	push {lr}
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _081127A4
	adds r0, r1, #0
	b _081127AA
_081127A4:
	adds r0, r1, #0
	bl error
_081127AA:
	pop {pc}

	thumb_func_start _swiread
_swiread: @ 0x081127AC
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	bl remap_handle
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r3, #6
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start _read
_read: @ 0x081127D0
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r7, r2, #0
	bl remap_handle
	bl findslot
	adds r6, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl _swiread
	cmp r0, #0
	bge _081127FA
	movs r0, #1
	rsbs r0, r0, #0
	bl error
	b _08112810
_081127FA:
	subs r2, r7, r0
	cmp r6, #0x14
	beq _0811280E
	ldr r0, _08112814 @ =gUnk_03005788
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_0811280E:
	adds r0, r2, #0
_08112810:
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08112814: .4byte gUnk_03005788

	thumb_func_start _swilseek
_swilseek: @ 0x08112818
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	bl remap_handle
	adds r7, r0, #0
	bl findslot
	adds r6, r0, #0
	cmp r4, #1
	bne _0811284E
	cmp r6, #0x14
	bne _08112840
	movs r0, #1
	rsbs r0, r0, #0
	b _08112890
_08112840:
	ldr r0, _08112898 @ =gUnk_03005788
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r5, r5, r0
	movs r4, #0
_0811284E:
	cmp r4, #2
	bne _08112860
	str r7, [sp]
	movs r3, #0xc
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r5, r5, r2
_08112860:
	mov r0, r8
	bl remap_handle
	str r0, [sp]
	str r5, [sp, #4]
	movs r3, #0xa
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	cmp r6, #0x14
	beq _08112886
	cmp r2, #0
	bne _08112886
	ldr r0, _08112898 @ =gUnk_03005788
	lsls r1, r6, #3
	adds r0, #4
	adds r1, r1, r0
	str r5, [r1]
_08112886:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, #0
	bne _08112890
	adds r0, r5, #0
_08112890:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08112898: .4byte gUnk_03005788

	thumb_func_start _lseek
_lseek: @ 0x0811289C
	push {lr}
	bl _swilseek
	bl wrap
	pop {pc}

	thumb_func_start _swiwrite
_swiwrite: @ 0x081128A8
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r5, r2, #0
	bl remap_handle
	str r0, [sp]
	str r4, [sp, #4]
	str r5, [sp, #8]
	movs r3, #5
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start _write
_write: @ 0x081128CC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl remap_handle
	bl findslot
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl _swiwrite
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _081128F4
	cmp r0, r6
	bne _081128FC
_081128F4:
	adds r0, r1, #0
	bl error
	b _08112912
_081128FC:
	subs r2, r6, r0
	cmp r7, #0x14
	beq _08112910
	ldr r0, _08112914 @ =gUnk_03005788
	lsls r1, r7, #3
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	adds r0, r0, r2
	str r0, [r1]
_08112910:
	adds r0, r2, #0
_08112912:
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08112914: .4byte gUnk_03005788

	thumb_func_start _swiopen
_swiopen: @ 0x08112918
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r1, #0
	movs r5, #0
	movs r6, #1
	rsbs r6, r6, #0
	adds r0, r6, #0
	bl findslot
	mov r8, r0
	cmp r0, #0x14
	bne _0811293A
	adds r0, r6, #0
	b _081129AE
_0811293A:
	movs r0, #2
	ands r0, r4
	cmp r0, #0
	beq _08112944
	movs r5, #2
_08112944:
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r4
	cmp r0, #0
	beq _08112952
	movs r0, #4
	orrs r5, r0
_08112952:
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	cmp r0, #0
	beq _08112960
	movs r0, #4
	orrs r5, r0
_08112960:
	movs r1, #8
	ands r4, r1
	cmp r4, #0
	beq _08112970
	movs r0, #5
	rsbs r0, r0, #0
	ands r5, r0
	orrs r5, r1
_08112970:
	str r7, [sp]
	adds r0, r7, #0
	bl strlen
	str r0, [sp, #8]
	str r5, [sp, #4]
	movs r2, #1
	adds r0, r2, #0
	mov r1, sp
	svc #0xab
	adds r3, r0, #0
	cmp r3, #0
	blt _081129A8
	ldr r0, _081129A4 @ =gUnk_03005788
	mov r1, r8
	lsls r2, r1, #3
	adds r1, r2, r0
	str r3, [r1]
	adds r0, #4
	adds r2, r2, r0
	movs r0, #0
	str r0, [r2]
	adds r0, r3, #0
	adds r0, #0x20
	b _081129AE
	.align 2, 0
_081129A4: .4byte gUnk_03005788
_081129A8:
	adds r0, r3, #0
	bl error
_081129AE:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

	thumb_func_start _open
_open: @ 0x081129B8
	push {r1, r2, r3}
	push {lr}
	ldr r1, [sp, #4]
	bl _swiopen
	bl wrap
	pop {r3}
	add sp, #0xc
	bx r3

	thumb_func_start _swiclose
_swiclose: @ 0x081129CC
	push {lr}
	sub sp, #4
	bl remap_handle
	str r0, [sp]
	bl findslot
	adds r1, r0, #0
	cmp r1, #0x14
	beq _081129EC
	ldr r0, _081129FC @ =gUnk_03005788
	lsls r1, r1, #3
	adds r1, r1, r0
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r1]
_081129EC:
	movs r3, #2
	adds r0, r3, #0
	mov r1, sp
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	add sp, #4
	pop {pc}
	.align 2, 0
_081129FC: .4byte gUnk_03005788

	thumb_func_start _close
_close: @ 0x08112A00
	push {lr}
	bl _swiclose
	bl wrap
	pop {pc}

	thumb_func_start _exit
_exit: @ 0x08112A0C
	mov ip, r3
	mov r3, r8
	push {r3}
	mov r3, ip
	movs r2, #0x18
	ldr r3, _08112A28 @ =0x00020026
	adds r0, r2, #0
	adds r1, r3, #0
	svc #0xab
	mov r8, r0
	pop {r3}
	mov r8, r3
	bx lr
	.align 2, 0
_08112A28: .4byte 0x00020026

	thumb_func_start _kill
_kill: @ 0x08112A2C
	mov ip, r3
	mov r3, r8
	push {r3}
	mov r3, ip
	movs r2, #0x18
	ldr r3, _08112A48 @ =0x00020026
	adds r0, r2, #0
	adds r1, r3, #0
	svc #0xab
	mov r8, r0
	pop {r3}
	mov r8, r3
	bx lr
	.align 2, 0
_08112A48: .4byte 0x00020026

	thumb_func_start _getpid
_getpid: @ 0x08112A4C
	movs r0, #1
	bx lr

	thumb_func_start _sbrk
_sbrk: @ 0x08112A50
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08112A80 @ =gUnk_03005778
	ldr r0, [r4]
	cmp r0, #0
	bne _08112A60
	ldr r0, _08112A84 @ =gUnk_03005F78
	str r0, [r4]
_08112A60:
	ldr r5, [r4]
	adds r0, r5, r6
	cmp r0, sp
	bls _08112A76
	ldr r1, _08112A88 @ =gUnk_09E587B0
	movs r0, #1
	movs r2, #0x20
	bl _write
	bl abort
_08112A76:
	ldr r0, [r4]
	adds r0, r0, r6
	str r0, [r4]
	adds r0, r5, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_08112A80: .4byte gUnk_03005778
_08112A84: .4byte gUnk_03005F78
_08112A88: .4byte gUnk_09E587B0

	thumb_func_start _fstat
_fstat: @ 0x08112A8C
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #4]
	movs r0, #0
	bx lr
	.align 2, 0

	thumb_func_start _unlink
_unlink: @ 0x08112A98
	movs r0, #1
	rsbs r0, r0, #0
	bx lr
	.align 2, 0

	thumb_func_start _raise
_raise: @ 0x08112AA0
	bx lr
	.align 2, 0

	thumb_func_start _gettimeofday
_gettimeofday: @ 0x08112AA4
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r3, r1, #0
	cmp r2, #0
	beq _08112AC2
	movs r4, #0x11
	movs r5, #0
	adds r0, r4, #0
	adds r1, r5, #0
	svc #0xab
	adds r5, r0, #0
	adds r4, r5, #0
	str r4, [r2]
	movs r0, #0
	str r0, [r2, #4]
_08112AC2:
	cmp r3, #0
	beq _08112ACC
	movs r0, #0
	str r0, [r3]
	str r0, [r3, #4]
_08112ACC:
	movs r0, #0
	pop {r4, r5, pc}

	thumb_func_start _times
_times: @ 0x08112AD0
	push {r4, r5, lr}
	adds r2, r0, #0
	movs r4, #0x10
	movs r5, #0
	adds r0, r4, #0
	adds r1, r5, #0
	svc #0xab
	adds r3, r0, #0
	cmp r2, #0
	beq _08112AEE
	str r3, [r2]
	movs r0, #0
	str r0, [r2, #4]
	str r0, [r2, #8]
	str r0, [r2, #0xc]
_08112AEE:
	adds r0, r3, #0
	pop {r4, r5, pc}
	.align 2, 0

	thumb_func_start _write_r
_write_r: @ 0x08112AF4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r4, _08112B20 @ =gUnk_02029EA8
	movs r3, #0
	str r3, [r4]
	bl _write
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08112B1A
	ldr r0, [r4]
	cmp r0, #0
	beq _08112B1A
	str r0, [r5]
_08112B1A:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_08112B20: .4byte gUnk_02029EA8

	thumb_func_start _calloc_r
_calloc_r: @ 0x08112B24
	push {r4, lr}
	muls r1, r2, r1
	bl _malloc_r
	adds r4, r0, #0
	cmp r4, #0
	bne _08112B36
	movs r0, #0
	b _08112B7A
_08112B36:
	adds r0, r4, #0
	subs r0, #8
	ldr r0, [r0, #4]
	movs r1, #4
	rsbs r1, r1, #0
	ands r0, r1
	subs r2, r0, #4
	cmp r2, #0x24
	bhi _08112B70
	adds r1, r4, #0
	cmp r2, #0x13
	bls _08112B66
	movs r0, #0
	stm r1!, {r0}
	str r0, [r4, #4]
	adds r1, #4
	cmp r2, #0x1b
	bls _08112B66
	stm r1!, {r0}
	stm r1!, {r0}
	cmp r2, #0x23
	bls _08112B66
	stm r1!, {r0}
	stm r1!, {r0}
_08112B66:
	movs r0, #0
	stm r1!, {r0}
	stm r1!, {r0}
	str r0, [r1]
	b _08112B78
_08112B70:
	adds r0, r4, #0
	movs r1, #0
	bl memset
_08112B78:
	adds r0, r4, #0
_08112B7A:
	pop {r4, pc}

	thumb_func_start _close_r
_close_r: @ 0x08112B7C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	ldr r4, _08112BA4 @ =gUnk_02029EA8
	movs r1, #0
	str r1, [r4]
	bl _close
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08112B9E
	ldr r0, [r4]
	cmp r0, #0
	beq _08112B9E
	str r0, [r5]
_08112B9E:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_08112BA4: .4byte gUnk_02029EA8

	thumb_func_start __errno
__errno: @ 0x08112BA8
	ldr r0, _08112BB0 @ =gUnk_09ED4D94
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08112BB0: .4byte gUnk_09ED4D94

	thumb_func_start _fstat_r
_fstat_r: @ 0x08112BB4
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	ldr r4, _08112BDC @ =gUnk_02029EA8
	movs r2, #0
	str r2, [r4]
	bl _fstat
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08112BD8
	ldr r0, [r4]
	cmp r0, #0
	beq _08112BD8
	str r0, [r5]
_08112BD8:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_08112BDC: .4byte gUnk_02029EA8

	thumb_func_start abort
abort: @ 0x08112BE0
	mov ip, r3
	mov r3, r8
	push {r3}
	mov r3, ip
	movs r2, #0x18
	ldr r3, _08112BFC @ =0x00020022
	adds r0, r2, #0
	adds r1, r3, #0
	svc #0xab
	mov r8, r0
	pop {r3}
	mov r8, r3
	bx lr
	.align 2, 0
_08112BFC: .4byte 0x00020022

	thumb_func_start isatty
isatty: @ 0x08112C00
	movs r0, #1
	bx lr

	thumb_func_start alarm
alarm: @ 0x08112C04
	bx lr
	.align 2, 0

	thumb_func_start _lseek_r
_lseek_r: @ 0x08112C08
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r4, _08112C34 @ =gUnk_02029EA8
	movs r3, #0
	str r3, [r4]
	bl _lseek
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08112C2E
	ldr r0, [r4]
	cmp r0, #0
	beq _08112C2E
	str r0, [r5]
_08112C2E:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_08112C34: .4byte gUnk_02029EA8

	thumb_func_start _read_r
_read_r: @ 0x08112C38
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	ldr r4, _08112C64 @ =gUnk_02029EA8
	movs r3, #0
	str r3, [r4]
	bl _read
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08112C5E
	ldr r0, [r4]
	cmp r0, #0
	beq _08112C5E
	str r0, [r5]
_08112C5E:
	adds r0, r1, #0
	pop {r4, r5, pc}
	.align 2, 0
_08112C64: .4byte gUnk_02029EA8

	thumb_func_start __pack_d
__pack_d: @ 0x08112C68
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r1, r0, #0
	ldr r4, [r1, #0xc]
	ldr r5, [r1, #0x10]
	ldr r7, [r1, #4]
	movs r6, #0
	movs r2, #0
	ldr r0, [r1]
	cmp r0, #1
	bhi _08112C80
	movs r2, #1
_08112C80:
	cmp r2, #0
	beq _08112CA0
	ldr r6, _08112C94 @ =0x000007FF
	ldr r2, _08112C98 @ =0x00000000
	ldr r3, _08112C9C @ =0x00080000
	adds r0, r4, #0
	adds r1, r5, #0
	orrs r1, r3
	b _08112D58
	.align 2, 0
_08112C94: .4byte 0x000007FF
_08112C98: .4byte 0x00000000
_08112C9C: .4byte 0x00080000
_08112CA0:
	movs r2, #0
	cmp r0, #4
	bne _08112CA8
	movs r2, #1
_08112CA8:
	cmp r2, #0
	bne _08112CF4
	movs r2, #0
	cmp r0, #2
	bne _08112CB4
	movs r2, #1
_08112CB4:
	cmp r2, #0
	beq _08112CBE
	movs r4, #0
	movs r5, #0
	b _08112D5C
_08112CBE:
	adds r0, r5, #0
	orrs r0, r4
	cmp r0, #0
	beq _08112D5C
	ldr r2, [r1, #8]
	ldr r0, _08112CDC @ =0xFFFFFC02
	cmp r2, r0
	bge _08112CEE
	subs r2, r0, r2
	cmp r2, #0x38
	ble _08112CE0
	movs r4, #0
	movs r5, #0
	b _08112D4E
	.align 2, 0
_08112CDC: .4byte 0xFFFFFC02
_08112CE0:
	adds r1, r5, #0
	adds r0, r4, #0
	bl __lshrdi3
	adds r5, r1, #0
	adds r4, r0, #0
	b _08112D4E
_08112CEE:
	ldr r0, _08112CFC @ =0x000003FF
	cmp r2, r0
	ble _08112D04
_08112CF4:
	ldr r6, _08112D00 @ =0x000007FF
	movs r4, #0
	movs r5, #0
	b _08112D5C
	.align 2, 0
_08112CFC: .4byte 0x000003FF
_08112D00: .4byte 0x000007FF
_08112D04:
	ldr r0, _08112D2C @ =0x000003FF
	adds r6, r2, r0
	movs r0, #0xff
	adds r1, r4, #0
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _08112D30
	cmp r2, #0
	bne _08112D30
	adds r0, #1
	adds r1, r4, #0
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	beq _08112D38
	movs r0, #0x80
	movs r1, #0
	b _08112D34
	.align 2, 0
_08112D2C: .4byte 0x000003FF
_08112D30:
	movs r0, #0x7f
	movs r1, #0
_08112D34:
	adds r4, r4, r0
	adcs r5, r1
_08112D38:
	ldr r0, _08112D9C @ =0x1FFFFFFF
	cmp r5, r0
	bls _08112D4E
	lsls r3, r5, #0x1f
	lsrs r2, r4, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #1
	adds r5, r1, #0
	adds r4, r0, #0
	adds r6, #1
_08112D4E:
	lsls r3, r5, #0x18
	lsrs r2, r4, #8
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #8
_08112D58:
	adds r5, r1, #0
	adds r4, r0, #0
_08112D5C:
	str r4, [sp]
	ldr r2, _08112DA0 @ =0x000FFFFF
	ands r2, r5
	ldr r0, [sp, #4]
	ldr r1, _08112DA4 @ =0xFFF00000
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	mov r2, sp
	ldr r1, _08112DA8 @ =0x000007FF
	adds r0, r1, #0
	ands r6, r0
	lsls r1, r6, #4
	ldr r0, _08112DAC @ =0xFFFF800F
	ldrh r3, [r2, #6]
	ands r0, r3
	orrs r0, r1
	strh r0, [r2, #6]
	lsls r1, r7, #7
	movs r0, #0x7f
	ldrb r3, [r2, #7]
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #7]
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add sp, #8
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08112D9C: .4byte 0x1FFFFFFF
_08112DA0: .4byte 0x000FFFFF
_08112DA4: .4byte 0xFFF00000
_08112DA8: .4byte 0x000007FF
_08112DAC: .4byte 0xFFFF800F

	thumb_func_start __unpack_d
__unpack_d: @ 0x08112DB0
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r2, r0, #0
	adds r6, r1, #0
	ldr r1, [r2, #4]
	str r1, [sp]
	ldr r0, [r2]
	str r0, [sp, #4]
	mov r2, sp
	adds r4, r1, #0
	lsls r0, r0, #0xc
	lsrs r5, r0, #0xc
	ldrh r3, [r2, #6]
	lsls r0, r3, #0x11
	lsrs r3, r0, #0x15
	ldrb r2, [r2, #7]
	lsrs r0, r2, #7
	str r0, [r6, #4]
	cmp r3, #0
	bne _08112E24
	orrs r1, r5
	cmp r1, #0
	bne _08112DE4
	movs r0, #2
	str r0, [r6]
	b _08112E78
_08112DE4:
	ldr r0, _08112E1C @ =0xFFFFFC02
	str r0, [r6, #8]
	lsrs r3, r4, #0x18
	lsls r2, r5, #8
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #8
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #3
	str r0, [r6]
	ldr r0, _08112E20 @ =0x0FFFFFFF
	cmp r5, r0
	bhi _08112E54
	adds r7, r0, #0
_08112E02:
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [r6, #8]
	subs r0, #1
	str r0, [r6, #8]
	cmp r5, r7
	bls _08112E02
	b _08112E54
	.align 2, 0
_08112E1C: .4byte 0xFFFFFC02
_08112E20: .4byte 0x0FFFFFFF
_08112E24:
	ldr r0, _08112E38 @ =0x000007FF
	cmp r3, r0
	bne _08112E5A
	orrs r1, r5
	cmp r1, #0
	bne _08112E3C
	movs r0, #4
	str r0, [r6]
	b _08112E78
	.align 2, 0
_08112E38: .4byte 0x000007FF
_08112E3C:
	movs r2, #0x80
	lsls r2, r2, #0xc
	movs r0, #0
	adds r1, r5, #0
	ands r1, r2
	orrs r1, r0
	cmp r1, #0
	beq _08112E52
	movs r0, #1
	str r0, [r6]
	b _08112E54
_08112E52:
	str r1, [r6]
_08112E54:
	str r4, [r6, #0xc]
	str r5, [r6, #0x10]
	b _08112E78
_08112E5A:
	ldr r1, _08112E7C @ =0xFFFFFC01
	adds r0, r3, r1
	str r0, [r6, #8]
	movs r0, #3
	str r0, [r6]
	lsrs r3, r4, #0x18
	lsls r2, r5, #8
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #8
	ldr r2, _08112E80 @ =0x00000000
	ldr r3, _08112E84 @ =0x10000000
	orrs r1, r3
	str r0, [r6, #0xc]
	str r1, [r6, #0x10]
_08112E78:
	add sp, #8
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08112E7C: .4byte 0xFFFFFC01
_08112E80: .4byte 0x00000000
_08112E84: .4byte 0x10000000

	thumb_func_start _fpadd_parts
_fpadd_parts: @ 0x08112E88
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r3, r0, #0
	adds r4, r1, #0
	mov sl, r2
	movs r0, #0
	ldr r2, [r3]
	cmp r2, #1
	bhi _08112EA4
	movs r0, #1
_08112EA4:
	cmp r0, #0
	beq _08112EAC
_08112EA8:
	adds r0, r3, #0
	b _081130E4
_08112EAC:
	movs r1, #0
	ldr r0, [r4]
	cmp r0, #1
	bhi _08112EB6
	movs r1, #1
_08112EB6:
	cmp r1, #0
	bne _08112F2E
	movs r1, #0
	cmp r2, #4
	bne _08112EC2
	movs r1, #1
_08112EC2:
	cmp r1, #0
	beq _08112EE4
	movs r1, #0
	cmp r0, #4
	bne _08112ECE
	movs r1, #1
_08112ECE:
	cmp r1, #0
	beq _08112EA8
	ldr r1, [r3, #4]
	ldr r0, [r4, #4]
	cmp r1, r0
	beq _08112EA8
	ldr r0, _08112EE0 @ =gUnk_03005828
	b _081130E4
	.align 2, 0
_08112EE0: .4byte gUnk_03005828
_08112EE4:
	movs r1, #0
	cmp r0, #4
	bne _08112EEC
	movs r1, #1
_08112EEC:
	cmp r1, #0
	bne _08112F2E
	movs r1, #0
	cmp r0, #2
	bne _08112EF8
	movs r1, #1
_08112EF8:
	cmp r1, #0
	beq _08112F20
	movs r0, #0
	cmp r2, #2
	bne _08112F04
	movs r0, #1
_08112F04:
	cmp r0, #0
	beq _08112EA8
	mov r1, sl
	adds r0, r3, #0
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldm r0!, {r2, r5}
	stm r1!, {r2, r5}
	ldr r0, [r3, #4]
	ldr r1, [r4, #4]
	ands r0, r1
	mov r6, sl
	str r0, [r6, #4]
	b _081130E2
_08112F20:
	movs r1, #0
	ldr r0, [r3]
	cmp r0, #2
	bne _08112F2A
	movs r1, #1
_08112F2A:
	cmp r1, #0
	beq _08112F32
_08112F2E:
	adds r0, r4, #0
	b _081130E4
_08112F32:
	ldr r0, [r3, #8]
	mov sb, r0
	ldr r1, [r4, #8]
	mov r8, r1
	ldr r6, [r3, #0xc]
	ldr r7, [r3, #0x10]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	str r0, [sp]
	str r1, [sp, #4]
	mov r1, sb
	mov r2, r8
	subs r0, r1, r2
	cmp r0, #0
	bge _08112F52
	rsbs r0, r0, #0
_08112F52:
	cmp r0, #0x3f
	bgt _08112FD0
	ldr r3, [r3, #4]
	mov ip, r3
	ldr r4, [r4, #4]
	str r4, [sp, #8]
	cmp sb, r8
	ble _08112F9C
	mov r3, sb
	mov r4, r8
	subs r3, r3, r4
	mov r8, r3
_08112F6A:
	movs r5, #1
	rsbs r5, r5, #0
	add r8, r5
	ldr r2, [sp]
	movs r0, #1
	ands r2, r0
	movs r3, #0
	ldr r1, [sp, #4]
	lsls r5, r1, #0x1f
	ldr r0, [sp]
	lsrs r4, r0, #1
	adds r0, r5, #0
	orrs r0, r4
	adds r4, r1, #0
	lsrs r1, r4, #1
	adds r5, r2, #0
	orrs r5, r0
	str r5, [sp]
	adds r4, r3, #0
	orrs r4, r1
	str r4, [sp, #4]
	mov r5, r8
	cmp r5, #0
	bne _08112F6A
	mov r8, sb
_08112F9C:
	cmp r8, sb
	ble _08112FEC
	mov r0, r8
	mov r1, sb
	subs r0, r0, r1
	mov sb, r0
_08112FA8:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	movs r2, #1
	ands r2, r6
	movs r3, #0
	lsls r5, r7, #0x1f
	lsrs r4, r6, #1
	adds r0, r5, #0
	orrs r0, r4
	lsrs r1, r7, #1
	adds r6, r2, #0
	orrs r6, r0
	adds r7, r3, #0
	orrs r7, r1
	mov r3, sb
	cmp r3, #0
	bne _08112FA8
	mov sb, r8
	b _08112FEC
_08112FD0:
	cmp sb, r8
	ble _08112FDE
	movs r0, #0
	movs r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	b _08112FE4
_08112FDE:
	mov sb, r8
	movs r6, #0
	movs r7, #0
_08112FE4:
	ldr r3, [r3, #4]
	mov ip, r3
	ldr r4, [r4, #4]
	str r4, [sp, #8]
_08112FEC:
	ldr r1, [sp, #8]
	cmp ip, r1
	beq _08113094
	mov r2, ip
	cmp r2, #0
	beq _0811300E
	adds r1, r7, #0
	adds r0, r6, #0
	bl __negdi2
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r4, [sp]
	ldr r5, [sp, #4]
	adds r2, r2, r4
	adcs r3, r5
	b _0811301A
_0811300E:
	adds r3, r7, #0
	adds r2, r6, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	subs r2, r2, r0
	sbcs r3, r1
_0811301A:
	cmp r3, #0
	blt _08113030
	movs r0, #0
	mov r1, sl
	str r0, [r1, #4]
	mov r4, sb
	str r4, [r1, #8]
	mov r5, sl
	str r2, [r5, #0xc]
	str r3, [r5, #0x10]
	b _08113048
_08113030:
	movs r0, #1
	mov r6, sl
	str r0, [r6, #4]
	mov r0, sb
	str r0, [r6, #8]
	adds r1, r3, #0
	adds r0, r2, #0
	bl __negdi2
	mov r2, sl
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
_08113048:
	mov r4, sl
	ldr r2, [r4, #0xc]
	ldr r3, [r4, #0x10]
	movs r0, #1
	rsbs r0, r0, #0
	asrs r1, r0, #0x1f
_08113054:
	adds r2, r2, r0
	adcs r3, r1
	ldr r0, _08113090 @ =0x0FFFFFFF
	cmp r3, r0
	bhi _081130AC
	cmp r3, r0
	bne _0811306A
	movs r0, #2
	rsbs r0, r0, #0
	cmp r2, r0
	bhi _081130AC
_0811306A:
	mov r5, sl
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	lsrs r3, r0, #0x1f
	lsls r2, r1, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r0, #1
	mov r6, sl
	str r0, [r6, #0xc]
	str r1, [r6, #0x10]
	ldr r2, [r6, #8]
	subs r2, #1
	str r2, [r6, #8]
	movs r2, #1
	rsbs r2, r2, #0
	asrs r3, r2, #0x1f
	b _08113054
	.align 2, 0
_08113090: .4byte 0x0FFFFFFF
_08113094:
	mov r0, ip
	mov r1, sl
	str r0, [r1, #4]
	mov r2, sb
	str r2, [r1, #8]
	ldr r3, [sp]
	ldr r4, [sp, #4]
	adds r6, r6, r3
	adcs r7, r4
	mov r4, sl
	str r6, [r4, #0xc]
	str r7, [r4, #0x10]
_081130AC:
	movs r0, #3
	mov r5, sl
	str r0, [r5]
	ldr r1, [r5, #0x10]
	ldr r0, _081130F0 @ =0x1FFFFFFF
	cmp r1, r0
	bls _081130E2
	ldr r4, [r5, #0xc]
	ldr r5, [r5, #0x10]
	movs r2, #1
	adds r0, r4, #0
	ands r0, r2
	movs r1, #0
	lsls r6, r5, #0x1f
	mov r8, r6
	lsrs r6, r4, #1
	mov r2, r8
	orrs r2, r6
	lsrs r3, r5, #1
	orrs r0, r2
	orrs r1, r3
	mov r2, sl
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
	ldr r0, [r2, #8]
	adds r0, #1
	str r0, [r2, #8]
_081130E2:
	mov r0, sl
_081130E4:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_081130F0: .4byte 0x1FFFFFFF

	thumb_func_start __adddf3
__adddf3: @ 0x081130F4
	push {r4, lr}
	sub sp, #0x4c
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	add r2, sp, #0x28
	mov r0, sp
	adds r1, r4, #0
	bl _fpadd_parts
	bl __pack_d
	add sp, #0x4c
	pop {r4, pc}

	thumb_func_start __subdf3
__subdf3: @ 0x08113124
	push {r4, lr}
	sub sp, #0x4c
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	ldr r0, [r4, #4]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #4]
	add r2, sp, #0x28
	mov r0, sp
	adds r1, r4, #0
	bl _fpadd_parts
	bl __pack_d
	add sp, #0x4c
	pop {r4, pc}

	thumb_func_start __muldf3
__muldf3: @ 0x0811315C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	mov r8, sp
	add r0, sp, #0x28
	mov sl, r0
	movs r0, #0
	ldr r1, [sp]
	cmp r1, #1
	bhi _08113192
	movs r0, #1
_08113192:
	cmp r0, #0
	bne _081131F6
	movs r2, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _081131A0
	movs r2, #1
_081131A0:
	cmp r2, #0
	beq _081131A8
	ldr r0, [sp, #4]
	b _08113218
_081131A8:
	movs r2, #0
	cmp r1, #4
	bne _081131B0
	movs r2, #1
_081131B0:
	cmp r2, #0
	beq _081131C2
	movs r1, #0
	cmp r0, #2
	bne _081131BC
	movs r1, #1
_081131BC:
	cmp r1, #0
	bne _081131DA
	b _081131F6
_081131C2:
	movs r2, #0
	cmp r0, #4
	bne _081131CA
	movs r2, #1
_081131CA:
	cmp r2, #0
	beq _081131EA
	movs r0, #0
	cmp r1, #2
	bne _081131D6
	movs r0, #1
_081131D6:
	cmp r0, #0
	beq _081131E4
_081131DA:
	ldr r0, _081131E0 @ =gUnk_03005828
	b _081133E2
	.align 2, 0
_081131E0: .4byte gUnk_03005828
_081131E4:
	mov r1, r8
	ldr r0, [r1, #4]
	b _08113218
_081131EA:
	movs r2, #0
	cmp r1, #2
	bne _081131F2
	movs r2, #1
_081131F2:
	cmp r2, #0
	beq _08113208
_081131F6:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #4]
	mov r0, sp
	b _081133E2
_08113208:
	movs r1, #0
	cmp r0, #2
	bne _08113210
	movs r1, #1
_08113210:
	cmp r1, #0
	beq _08113228
	mov r2, r8
	ldr r0, [r2, #4]
_08113218:
	ldr r1, [sp, #0x18]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #0x18]
	adds r0, r4, #0
	b _081133E2
_08113228:
	mov r4, r8
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	adds r6, r0, #0
	movs r7, #0
	str r1, [sp, #0x4c]
	movs r5, #0
	str r5, [sp, #0x50]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	adds r4, r0, #0
	str r1, [sp, #0x54]
	movs r0, #0
	str r0, [sp, #0x58]
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldi3
	str r0, [sp, #0x5c]
	str r1, [sp, #0x60]
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x58]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldi3
	adds r7, r1, #0
	adds r6, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x4c]
	ldr r3, [sp, #0x50]
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x58]
	ldr r2, [sp, #0x4c]
	ldr r3, [sp, #0x50]
	bl __muldi3
	str r0, [sp, #0x64]
	str r1, [sp, #0x68]
	movs r1, #0
	movs r2, #0
	str r1, [sp, #0x6c]
	str r2, [sp, #0x70]
	adds r3, r7, #0
	adds r2, r6, #0
	adds r2, r2, r4
	adcs r3, r5
	cmp r7, r3
	bhi _081132A0
	cmp r7, r3
	bne _081132A8
	cmp r6, r2
	bls _081132A8
_081132A0:
	ldr r5, _081133F8 @ =0x00000001
	ldr r4, _081133F4 @ =0x00000000
	str r4, [sp, #0x6c]
	str r5, [sp, #0x70]
_081132A8:
	adds r1, r2, #0
	movs r6, #0
	adds r7, r1, #0
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	adds r6, r6, r0
	adcs r7, r1
	cmp r1, r7
	bhi _081132C4
	ldr r1, [sp, #0x60]
	cmp r1, r7
	bne _081132D4
	cmp r0, r6
	bls _081132D4
_081132C4:
	movs r0, #1
	movs r1, #0
	ldr r4, [sp, #0x6c]
	ldr r5, [sp, #0x70]
	adds r4, r4, r0
	adcs r5, r1
	str r4, [sp, #0x6c]
	str r5, [sp, #0x70]
_081132D4:
	adds r0, r3, #0
	adds r2, r0, #0
	movs r3, #0
	adds r5, r3, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x64]
	ldr r1, [sp, #0x68]
	adds r4, r4, r0
	adcs r5, r1
	ldr r1, [sp, #0x6c]
	ldr r2, [sp, #0x70]
	adds r4, r4, r1
	adcs r5, r2
	mov r0, r8
	ldr r2, [r0, #8]
	ldr r0, [sp, #0x1c]
	adds r2, r2, r0
	str r2, [sp, #0x30]
	mov r0, r8
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x18]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x2c]
	adds r2, #4
	str r2, [sp, #0x30]
	ldr r0, _081133FC @ =0x1FFFFFFF
	cmp r5, r0
	bls _08113356
	movs r1, #1
	mov sb, r1
	mov r8, r0
	mov ip, r2
_0811331A:
	movs r2, #1
	add ip, r2
	mov r0, sb
	ands r0, r4
	cmp r0, #0
	beq _08113340
	lsls r3, r7, #0x1f
	lsrs r2, r6, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r7, #1
	adds r7, r1, #0
	adds r6, r0, #0
	adds r0, r6, #0
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r1, r7
	adds r7, r1, #0
	adds r6, r0, #0
_08113340:
	lsls r3, r5, #0x1f
	lsrs r2, r4, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #1
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, r8
	bhi _0811331A
	mov r0, ip
	str r0, [sp, #0x30]
_08113356:
	ldr r0, _08113400 @ =0x0FFFFFFF
	cmp r5, r0
	bhi _081133A8
	movs r1, #0x80
	lsls r1, r1, #0x18
	mov sb, r1
	mov r8, r0
	ldr r2, [sp, #0x30]
	mov ip, r2
_08113368:
	movs r0, #1
	rsbs r0, r0, #0
	add ip, r0
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #0
	mov r1, sb
	ands r1, r7
	orrs r0, r1
	cmp r0, #0
	beq _08113392
	movs r0, #1
	orrs r0, r4
	adds r1, r5, #0
	adds r5, r1, #0
	adds r4, r0, #0
_08113392:
	lsrs r3, r6, #0x1f
	lsls r2, r7, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r6, #1
	adds r7, r1, #0
	adds r6, r0, #0
	cmp r5, r8
	bls _08113368
	mov r1, ip
	str r1, [sp, #0x30]
_081133A8:
	movs r0, #0xff
	adds r1, r4, #0
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _081133D6
	cmp r2, #0
	bne _081133D6
	adds r0, #1
	adds r1, r4, #0
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	bne _081133CE
	adds r0, r7, #0
	orrs r0, r6
	cmp r0, #0
	beq _081133D6
_081133CE:
	movs r0, #0x80
	movs r1, #0
	adds r4, r4, r0
	adcs r5, r1
_081133D6:
	str r4, [sp, #0x34]
	str r5, [sp, #0x38]
	movs r0, #3
	mov r2, sl
	str r0, [r2]
	add r0, sp, #0x28
_081133E2:
	bl __pack_d
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_081133F4: .4byte 0x00000000
_081133F8: .4byte 0x00000001
_081133FC: .4byte 0x1FFFFFFF
_08113400: .4byte 0x0FFFFFFF

	thumb_func_start __divdf3
__divdf3: @ 0x08113404
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	mov ip, sp
	movs r0, #0
	ldr r3, [sp]
	cmp r3, #1
	bhi _0811342E
	movs r0, #1
_0811342E:
	cmp r0, #0
	beq _08113436
	mov r1, sp
	b _08113578
_08113436:
	movs r0, #0
	ldr r2, [sp, #0x14]
	adds r5, r2, #0
	cmp r2, #1
	bhi _08113442
	movs r0, #1
_08113442:
	cmp r0, #0
	beq _0811344A
	adds r1, r4, #0
	b _08113578
_0811344A:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	eors r0, r1
	str r0, [sp, #4]
	movs r0, #0
	cmp r3, #4
	bne _0811345A
	movs r0, #1
_0811345A:
	cmp r0, #0
	bne _0811346A
	movs r4, #0
	cmp r3, #2
	bne _08113466
	movs r4, #1
_08113466:
	cmp r4, #0
	beq _0811347C
_0811346A:
	mov r1, ip
	ldr r0, [r1]
	cmp r0, r5
	beq _08113474
	b _08113578
_08113474:
	ldr r1, _08113478 @ =gUnk_03005828
	b _08113578
	.align 2, 0
_08113478: .4byte gUnk_03005828
_0811347C:
	movs r0, #0
	cmp r2, #4
	bne _08113484
	movs r0, #1
_08113484:
	cmp r0, #0
	beq _08113496
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r4, [sp, #8]
	mov r1, sp
	b _08113578
_08113496:
	movs r0, #0
	cmp r2, #2
	bne _0811349E
	movs r0, #1
_0811349E:
	cmp r0, #0
	beq _081134AA
	movs r0, #4
	mov r2, ip
	str r0, [r2]
	b _08113576
_081134AA:
	mov r3, ip
	ldr r1, [r3, #8]
	ldr r0, [sp, #0x1c]
	subs r6, r1, r0
	str r6, [r3, #8]
	ldr r4, [r3, #0xc]
	ldr r5, [r3, #0x10]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x38]
	str r1, [sp, #0x3c]
	cmp r1, r5
	bhi _081134CE
	ldr r1, [sp, #0x3c]
	cmp r1, r5
	bne _081134E2
	cmp r0, r4
	bls _081134E2
_081134CE:
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	subs r0, r6, #1
	mov r2, ip
	str r0, [r2, #8]
_081134E2:
	ldr r7, _08113588 @ =0x10000000
	ldr r6, _08113584 @ =0x00000000
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_081134EE:
	ldr r1, [sp, #0x3c]
	cmp r1, r5
	bhi _08113512
	cmp r1, r5
	bne _081134FE
	ldr r2, [sp, #0x38]
	cmp r2, r4
	bhi _08113512
_081134FE:
	ldr r0, [sp, #0x40]
	orrs r0, r6
	ldr r1, [sp, #0x44]
	orrs r1, r7
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x3c]
	subs r4, r4, r0
	sbcs r5, r1
_08113512:
	lsls r3, r7, #0x1f
	lsrs r2, r6, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r7, #1
	adds r7, r1, #0
	adds r6, r0, #0
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r7, #0
	orrs r0, r6
	cmp r0, #0
	bne _081134EE
	movs r0, #0xff
	ldr r1, [sp, #0x40]
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _0811356C
	cmp r2, #0
	bne _0811356C
	adds r0, #1
	ldr r1, [sp, #0x40]
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	bne _0811355C
	adds r0, r5, #0
	orrs r0, r4
	cmp r0, #0
	beq _0811356C
_0811355C:
	movs r0, #0x80
	movs r1, #0
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x40]
	str r3, [sp, #0x44]
_0811356C:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	mov r2, ip
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
_08113576:
	mov r1, ip
_08113578:
	adds r0, r1, #0
	bl __pack_d
	add sp, #0x48
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08113584: .4byte 0x00000000
_08113588: .4byte 0x10000000

	thumb_func_start __fpcmp_parts_d
__fpcmp_parts_d: @ 0x0811358C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0
	ldr r1, [r5]
	cmp r1, #1
	bhi _0811359C
	movs r0, #1
_0811359C:
	cmp r0, #0
	bne _081135AE
	movs r0, #0
	ldr r2, [r6]
	cmp r2, #1
	bhi _081135AA
	movs r0, #1
_081135AA:
	cmp r0, #0
	beq _081135B2
_081135AE:
	movs r0, #1
	b _08113688
_081135B2:
	movs r0, #0
	cmp r1, #4
	bne _081135BA
	movs r0, #1
_081135BA:
	cmp r0, #0
	beq _081135D2
	movs r0, #0
	cmp r2, #4
	bne _081135C6
	movs r0, #1
_081135C6:
	cmp r0, #0
	beq _081135D2
	ldr r0, [r6, #4]
	ldr r1, [r5, #4]
	subs r0, r0, r1
	b _08113688
_081135D2:
	movs r1, #0
	ldr r0, [r5]
	cmp r0, #4
	bne _081135DC
	movs r1, #1
_081135DC:
	cmp r1, #0
	bne _0811362A
	movs r1, #0
	cmp r2, #4
	bne _081135E8
	movs r1, #1
_081135E8:
	cmp r1, #0
	beq _081135FA
_081135EC:
	ldr r0, [r6, #4]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _08113634
	movs r1, #1
	b _08113634
_081135FA:
	movs r1, #0
	cmp r0, #2
	bne _08113602
	movs r1, #1
_08113602:
	cmp r1, #0
	beq _08113612
	movs r1, #0
	cmp r2, #2
	bne _0811360E
	movs r1, #1
_0811360E:
	cmp r1, #0
	bne _08113686
_08113612:
	movs r1, #0
	cmp r0, #2
	bne _0811361A
	movs r1, #1
_0811361A:
	cmp r1, #0
	bne _081135EC
	movs r0, #0
	cmp r2, #2
	bne _08113626
	movs r0, #1
_08113626:
	cmp r0, #0
	beq _08113638
_0811362A:
	ldr r0, [r5, #4]
	movs r1, #1
	cmp r0, #0
	beq _08113634
	subs r1, #2
_08113634:
	adds r0, r1, #0
	b _08113688
_08113638:
	ldr r0, [r6, #4]
	ldr r4, [r5, #4]
	cmp r4, r0
	beq _0811364A
_08113640:
	movs r0, #1
	cmp r4, #0
	beq _08113688
	subs r0, #2
	b _08113688
_0811364A:
	ldr r1, [r5, #8]
	ldr r0, [r6, #8]
	cmp r1, r0
	bgt _08113640
	cmp r1, r0
	bge _08113662
_08113656:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, #0
	beq _08113688
	movs r0, #1
	b _08113688
_08113662:
	ldr r3, [r5, #0x10]
	ldr r2, [r6, #0x10]
	cmp r3, r2
	bhi _08113640
	cmp r3, r2
	bne _08113676
	ldr r1, [r5, #0xc]
	ldr r0, [r6, #0xc]
	cmp r1, r0
	bhi _08113640
_08113676:
	cmp r2, r3
	bhi _08113656
	cmp r2, r3
	bne _08113686
	ldr r1, [r6, #0xc]
	ldr r0, [r5, #0xc]
	cmp r1, r0
	bhi _08113656
_08113686:
	movs r0, #0
_08113688:
	pop {r4, r5, r6, pc}
	.align 2, 0

	thumb_func_start __cmpdf2
__cmpdf2: @ 0x0811368C
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0

	thumb_func_start __eqdf2
__eqdf2: @ 0x081136B8
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _081136E0
	movs r1, #1
_081136E0:
	cmp r1, #0
	bne _081136F2
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _081136EE
	movs r1, #1
_081136EE:
	cmp r1, #0
	beq _081136F6
_081136F2:
	movs r0, #1
	b _081136FE
_081136F6:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_081136FE:
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0

	thumb_func_start __nedf2
__nedf2: @ 0x08113704
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _0811372C
	movs r1, #1
_0811372C:
	cmp r1, #0
	bne _0811373E
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _0811373A
	movs r1, #1
_0811373A:
	cmp r1, #0
	beq _08113742
_0811373E:
	movs r0, #1
	b _0811374A
_08113742:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_0811374A:
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0

	thumb_func_start __gtdf2
__gtdf2: @ 0x08113750
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08113778
	movs r1, #1
_08113778:
	cmp r1, #0
	bne _0811378A
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _08113786
	movs r1, #1
_08113786:
	cmp r1, #0
	beq _08113790
_0811378A:
	movs r0, #1
	rsbs r0, r0, #0
	b _08113798
_08113790:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_08113798:
	add sp, #0x38
	pop {r4, pc}

	thumb_func_start __gedf2
__gedf2: @ 0x0811379C
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _081137C4
	movs r1, #1
_081137C4:
	cmp r1, #0
	bne _081137D6
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _081137D2
	movs r1, #1
_081137D2:
	cmp r1, #0
	beq _081137DC
_081137D6:
	movs r0, #1
	rsbs r0, r0, #0
	b _081137E4
_081137DC:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_081137E4:
	add sp, #0x38
	pop {r4, pc}

	thumb_func_start __ltdf2
__ltdf2: @ 0x081137E8
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08113810
	movs r1, #1
_08113810:
	cmp r1, #0
	bne _08113822
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _0811381E
	movs r1, #1
_0811381E:
	cmp r1, #0
	beq _08113826
_08113822:
	movs r0, #1
	b _0811382E
_08113826:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_0811382E:
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0

	thumb_func_start __ledf2
__ledf2: @ 0x08113834
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _0811385C
	movs r1, #1
_0811385C:
	cmp r1, #0
	bne _0811386E
	movs r1, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _0811386A
	movs r1, #1
_0811386A:
	cmp r1, #0
	beq _08113872
_0811386E:
	movs r0, #1
	b _0811387A
_08113872:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_d
_0811387A:
	add sp, #0x38
	pop {r4, pc}
	.align 2, 0

	thumb_func_start __floatsidf
__floatsidf: @ 0x08113880
	push {r4, r5, lr}
	sub sp, #0x14
	adds r2, r0, #0
	movs r0, #3
	str r0, [sp]
	lsrs r1, r2, #0x1f
	str r1, [sp, #4]
	cmp r2, #0
	bne _08113898
	movs r0, #2
	str r0, [sp]
	b _081138EE
_08113898:
	movs r0, #0x3c
	str r0, [sp, #8]
	cmp r1, #0
	beq _081138BE
	movs r0, #0x80
	lsls r0, r0, #0x18
	cmp r2, r0
	bne _081138B8
	ldr r1, _081138B4 @ =0x00000000
	ldr r0, _081138B0 @ =0xC1E00000
	b _081138F4
	.align 2, 0
_081138B0: .4byte 0xC1E00000
_081138B4: .4byte 0x00000000
_081138B8:
	rsbs r0, r2, #0
	asrs r1, r0, #0x1f
	b _081138C2
_081138BE:
	adds r0, r2, #0
	asrs r1, r2, #0x1f
_081138C2:
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r0, [sp, #0x10]
	ldr r1, _081138F8 @ =0x0FFFFFFF
	cmp r0, r1
	bhi _081138EE
	adds r5, r1, #0
	ldr r4, [sp, #8]
_081138D2:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	lsrs r3, r0, #0x1f
	lsls r2, r1, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r0, #1
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	subs r4, #1
	ldr r0, [sp, #0x10]
	cmp r0, r5
	bls _081138D2
	str r4, [sp, #8]
_081138EE:
	mov r0, sp
	bl __pack_d
_081138F4:
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
_081138F8: .4byte 0x0FFFFFFF

	thumb_func_start __fixdfsi
__fixdfsi: @ 0x081138FC
	push {lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #2
	bne _08113916
	movs r1, #1
_08113916:
	cmp r1, #0
	bne _0811394A
	movs r1, #0
	cmp r0, #1
	bhi _08113922
	movs r1, #1
_08113922:
	cmp r1, #0
	bne _0811394A
	movs r1, #0
	cmp r0, #4
	bne _0811392E
	movs r1, #1
_0811392E:
	cmp r1, #0
	beq _08113944
_08113932:
	ldr r0, [sp, #4]
	ldr r1, _08113940 @ =0x7FFFFFFF
	cmp r0, #0
	beq _08113968
	adds r1, #1
	b _08113968
	.align 2, 0
_08113940: .4byte 0x7FFFFFFF
_08113944:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _0811394E
_0811394A:
	movs r0, #0
	b _0811396A
_0811394E:
	cmp r0, #0x1e
	bgt _08113932
	movs r2, #0x3c
	subs r2, r2, r0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl __lshrdi3
	adds r1, r0, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _08113968
	rsbs r1, r1, #0
_08113968:
	adds r0, r1, #0
_0811396A:
	add sp, #0x1c
	pop {pc}
	.align 2, 0

	thumb_func_start __negdf2
__negdf2: @ 0x08113970
	push {lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl __unpack_d
	movs r1, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0811398A
	movs r1, #1
_0811398A:
	str r1, [sp, #4]
	mov r0, sp
	bl __pack_d
	add sp, #0x1c
	pop {pc}
	.align 2, 0

	thumb_func_start __make_dp
__make_dp: @ 0x08113998
	sub sp, #4
	push {r4, lr}
	sub sp, #0x14
	str r3, [sp, #0x1c]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	str r4, [sp, #0x10]
	mov r0, sp
	bl __pack_d
	add sp, #0x14
	pop {r4}
	pop {r3}
	add sp, #4
	bx r3
	.align 2, 0

	thumb_func_start __truncdfsf2
__truncdfsf2: @ 0x081139C0
	push {r4, r5, lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r1, sp
	bl __unpack_d
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	lsls r5, r3, #2
	lsrs r4, r2, #0x1e
	adds r0, r5, #0
	orrs r0, r4
	adds r5, r0, #0
	ldr r4, _08113A00 @ =0x3FFFFFFF
	adds r0, r2, #0
	ands r0, r4
	movs r1, #0
	orrs r0, r1
	cmp r0, #0
	beq _081139F0
	movs r0, #1
	orrs r5, r0
_081139F0:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	adds r3, r5, #0
	bl __make_fp
	add sp, #0x1c
	pop {r4, r5, pc}
	.align 2, 0
_08113A00: .4byte 0x3FFFFFFF

	thumb_func_start __pack_f
__pack_f: @ 0x08113A04
	push {r4, r5, r6, lr}
	ldr r2, [r0, #0xc]
	ldr r6, [r0, #4]
	movs r5, #0
	movs r1, #0
	ldr r3, [r0]
	cmp r3, #1
	bhi _08113A16
	movs r1, #1
_08113A16:
	cmp r1, #0
	beq _08113A24
	movs r5, #0xff
	movs r0, #0x80
	lsls r0, r0, #0xd
	orrs r2, r0
	b _08113A8A
_08113A24:
	movs r1, #0
	cmp r3, #4
	bne _08113A2C
	movs r1, #1
_08113A2C:
	cmp r1, #0
	bne _08113A60
	movs r1, #0
	cmp r3, #2
	bne _08113A38
	movs r1, #1
_08113A38:
	cmp r1, #0
	beq _08113A40
	movs r2, #0
	b _08113A8A
_08113A40:
	cmp r2, #0
	beq _08113A8A
	ldr r0, [r0, #8]
	movs r3, #0x7e
	rsbs r3, r3, #0
	cmp r0, r3
	bge _08113A5C
	subs r0, r3, r0
	cmp r0, #0x19
	ble _08113A58
	movs r2, #0
	b _08113A88
_08113A58:
	lsrs r2, r0
	b _08113A88
_08113A5C:
	cmp r0, #0x7f
	ble _08113A66
_08113A60:
	movs r5, #0xff
	movs r2, #0
	b _08113A8A
_08113A66:
	adds r5, r0, #0
	adds r5, #0x7f
	movs r0, #0x7f
	ands r0, r2
	cmp r0, #0x40
	bne _08113A7E
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _08113A80
	adds r2, #0x40
	b _08113A80
_08113A7E:
	adds r2, #0x3f
_08113A80:
	cmp r2, #0
	bge _08113A88
	lsrs r2, r2, #1
	adds r5, #1
_08113A88:
	lsrs r2, r2, #7
_08113A8A:
	ldr r0, _08113AAC @ =0x007FFFFF
	ands r2, r0
	ldr r0, _08113AB0 @ =0xFF800000
	ands r4, r0
	orrs r4, r2
	movs r0, #0xff
	ands r5, r0
	lsls r1, r5, #0x17
	ldr r0, _08113AB4 @ =0x807FFFFF
	ands r4, r0
	orrs r4, r1
	lsls r1, r6, #0x1f
	ldr r0, _08113AB8 @ =0x7FFFFFFF
	ands r4, r0
	orrs r4, r1
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_08113AAC: .4byte 0x007FFFFF
_08113AB0: .4byte 0xFF800000
_08113AB4: .4byte 0x807FFFFF
_08113AB8: .4byte 0x7FFFFFFF

	thumb_func_start __unpack_f
__unpack_f: @ 0x08113ABC
	push {r4, lr}
	adds r3, r1, #0
	ldr r0, [r0]
	lsls r1, r0, #9
	lsrs r2, r1, #9
	lsls r1, r0, #1
	lsrs r1, r1, #0x18
	lsrs r0, r0, #0x1f
	str r0, [r3, #4]
	cmp r1, #0
	bne _08113B00
	cmp r2, #0
	bne _08113ADC
	movs r0, #2
	str r0, [r3]
	b _08113B34
_08113ADC:
	adds r4, r1, #0
	subs r4, #0x7e
	str r4, [r3, #8]
	lsls r2, r2, #7
	movs r0, #3
	str r0, [r3]
	ldr r1, _08113AFC @ =0x3FFFFFFF
	cmp r2, r1
	bhi _08113B1C
	adds r0, r4, #0
_08113AF0:
	lsls r2, r2, #1
	subs r0, #1
	cmp r2, r1
	bls _08113AF0
	str r0, [r3, #8]
	b _08113B1C
	.align 2, 0
_08113AFC: .4byte 0x3FFFFFFF
_08113B00:
	cmp r1, #0xff
	bne _08113B20
	cmp r2, #0
	bne _08113B0E
	movs r0, #4
	str r0, [r3]
	b _08113B34
_08113B0E:
	movs r0, #0x80
	lsls r0, r0, #0xd
	ands r0, r2
	cmp r0, #0
	beq _08113B1A
	movs r0, #1
_08113B1A:
	str r0, [r3]
_08113B1C:
	str r2, [r3, #0xc]
	b _08113B34
_08113B20:
	adds r0, r1, #0
	subs r0, #0x7f
	str r0, [r3, #8]
	movs r0, #3
	str r0, [r3]
	lsls r0, r2, #7
	movs r1, #0x80
	lsls r1, r1, #0x17
	orrs r0, r1
	str r0, [r3, #0xc]
_08113B34:
	pop {r4, pc}
	.align 2, 0

	thumb_func_start _fpadd_parts_0
_fpadd_parts_0: @ 0x08113B38
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	movs r0, #0
	ldr r2, [r6]
	cmp r2, #1
	bhi _08113B4E
	movs r0, #1
_08113B4E:
	cmp r0, #0
	beq _08113B56
_08113B52:
	adds r0, r6, #0
	b _08113CAC
_08113B56:
	movs r1, #0
	ldr r0, [r7]
	cmp r0, #1
	bhi _08113B60
	movs r1, #1
_08113B60:
	cmp r1, #0
	bne _08113BD4
	movs r1, #0
	cmp r2, #4
	bne _08113B6C
	movs r1, #1
_08113B6C:
	cmp r1, #0
	beq _08113B8C
	movs r1, #0
	cmp r0, #4
	bne _08113B78
	movs r1, #1
_08113B78:
	cmp r1, #0
	beq _08113B52
	ldr r1, [r6, #4]
	ldr r0, [r7, #4]
	cmp r1, r0
	beq _08113B52
	ldr r0, _08113B88 @ =gUnk_03005840
	b _08113CAC
	.align 2, 0
_08113B88: .4byte gUnk_03005840
_08113B8C:
	movs r1, #0
	cmp r0, #4
	bne _08113B94
	movs r1, #1
_08113B94:
	cmp r1, #0
	bne _08113BD4
	movs r1, #0
	cmp r0, #2
	bne _08113BA0
	movs r1, #1
_08113BA0:
	cmp r1, #0
	beq _08113BC6
	movs r0, #0
	cmp r2, #2
	bne _08113BAC
	movs r0, #1
_08113BAC:
	cmp r0, #0
	beq _08113B52
	adds r1, r5, #0
	adds r0, r6, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6, #4]
	ldr r1, [r7, #4]
	ands r0, r1
	str r0, [r5, #4]
	b _08113CAA
_08113BC6:
	movs r1, #0
	ldr r0, [r6]
	cmp r0, #2
	bne _08113BD0
	movs r1, #1
_08113BD0:
	cmp r1, #0
	beq _08113BD8
_08113BD4:
	adds r0, r7, #0
	b _08113CAC
_08113BD8:
	ldr r1, [r6, #8]
	ldr r3, [r7, #8]
	ldr r2, [r6, #0xc]
	ldr r4, [r7, #0xc]
	subs r0, r1, r3
	cmp r0, #0
	bge _08113BE8
	rsbs r0, r0, #0
_08113BE8:
	cmp r0, #0x1f
	bgt _08113C2C
	ldr r6, [r6, #4]
	ldr r7, [r7, #4]
	mov r8, r7
	cmp r1, r3
	ble _08113C0E
	movs r7, #1
	mov ip, r7
	subs r3, r1, r3
_08113BFC:
	subs r3, #1
	adds r0, r4, #0
	mov r7, ip
	ands r0, r7
	lsrs r4, r4, #1
	orrs r4, r0
	cmp r3, #0
	bne _08113BFC
	adds r3, r1, #0
_08113C0E:
	cmp r3, r1
	ble _08113C3E
	movs r0, #1
	mov ip, r0
	subs r1, r3, r1
_08113C18:
	subs r1, #1
	adds r0, r2, #0
	mov r7, ip
	ands r0, r7
	lsrs r2, r2, #1
	orrs r2, r0
	cmp r1, #0
	bne _08113C18
	adds r1, r3, #0
	b _08113C3E
_08113C2C:
	cmp r1, r3
	ble _08113C34
	movs r4, #0
	b _08113C38
_08113C34:
	adds r1, r3, #0
	movs r2, #0
_08113C38:
	ldr r6, [r6, #4]
	ldr r7, [r7, #4]
	mov r8, r7
_08113C3E:
	cmp r6, r8
	beq _08113C88
	cmp r6, #0
	beq _08113C4A
	subs r3, r4, r2
	b _08113C4C
_08113C4A:
	subs r3, r2, r4
_08113C4C:
	cmp r3, #0
	blt _08113C5A
	movs r0, #0
	str r0, [r5, #4]
	str r1, [r5, #8]
	str r3, [r5, #0xc]
	b _08113C64
_08113C5A:
	movs r0, #1
	str r0, [r5, #4]
	str r1, [r5, #8]
	rsbs r0, r3, #0
	str r0, [r5, #0xc]
_08113C64:
	ldr r1, [r5, #0xc]
	subs r0, r1, #1
	ldr r2, _08113C84 @ =0x3FFFFFFE
	cmp r0, r2
	bhi _08113C90
_08113C6E:
	lsls r0, r1, #1
	str r0, [r5, #0xc]
	ldr r1, [r5, #8]
	subs r1, #1
	str r1, [r5, #8]
	adds r1, r0, #0
	subs r0, r1, #1
	cmp r0, r2
	bls _08113C6E
	b _08113C90
	.align 2, 0
_08113C84: .4byte 0x3FFFFFFE
_08113C88:
	str r6, [r5, #4]
	str r1, [r5, #8]
	adds r0, r2, r4
	str r0, [r5, #0xc]
_08113C90:
	movs r0, #3
	str r0, [r5]
	ldr r1, [r5, #0xc]
	cmp r1, #0
	bge _08113CAA
	movs r0, #1
	ands r0, r1
	lsrs r1, r1, #1
	orrs r0, r1
	str r0, [r5, #0xc]
	ldr r0, [r5, #8]
	adds r0, #1
	str r0, [r5, #8]
_08113CAA:
	adds r0, r5, #0
_08113CAC:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

	thumb_func_start __addsf3
__addsf3: @ 0x08113CB4
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	add r0, sp, #0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x34
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	add r2, sp, #0x20
	mov r0, sp
	adds r1, r4, #0
	bl _fpadd_parts_0
	bl __pack_f
	add sp, #0x38
	pop {r4, pc}

	thumb_func_start __subsf3
__subsf3: @ 0x08113CE0
	push {r4, lr}
	sub sp, #0x38
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	add r0, sp, #0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x34
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	ldr r0, [r4, #4]
	movs r1, #1
	eors r0, r1
	str r0, [r4, #4]
	add r2, sp, #0x20
	mov r0, sp
	adds r1, r4, #0
	bl _fpadd_parts_0
	bl __pack_f
	add sp, #0x38
	pop {r4, pc}

	thumb_func_start __mulsf3
__mulsf3: @ 0x08113D14
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x38
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	add r0, sp, #0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x34
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	mov r7, sp
	add r0, sp, #0x20
	mov r8, r0
	movs r0, #0
	ldr r1, [sp]
	mov sb, r8
	cmp r1, #1
	bhi _08113D46
	movs r0, #1
_08113D46:
	cmp r0, #0
	bne _08113DA4
	movs r2, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _08113D54
	movs r2, #1
_08113D54:
	cmp r2, #0
	beq _08113D5C
	ldr r0, [sp, #4]
	b _08113DC4
_08113D5C:
	movs r2, #0
	cmp r1, #4
	bne _08113D64
	movs r2, #1
_08113D64:
	cmp r2, #0
	beq _08113D76
	movs r1, #0
	cmp r0, #2
	bne _08113D70
	movs r1, #1
_08113D70:
	cmp r1, #0
	bne _08113D8E
	b _08113DA4
_08113D76:
	movs r2, #0
	cmp r0, #4
	bne _08113D7E
	movs r2, #1
_08113D7E:
	cmp r2, #0
	beq _08113D98
	movs r0, #0
	cmp r1, #2
	bne _08113D8A
	movs r0, #1
_08113D8A:
	cmp r0, #0
	beq _08113DC2
_08113D8E:
	ldr r0, _08113D94 @ =gUnk_03005840
	b _08113E66
	.align 2, 0
_08113D94: .4byte gUnk_03005840
_08113D98:
	movs r2, #0
	cmp r1, #2
	bne _08113DA0
	movs r2, #1
_08113DA0:
	cmp r2, #0
	beq _08113DB6
_08113DA4:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x14]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #4]
	mov r0, sp
	b _08113E66
_08113DB6:
	movs r1, #0
	cmp r0, #2
	bne _08113DBE
	movs r1, #1
_08113DBE:
	cmp r1, #0
	beq _08113DD4
_08113DC2:
	ldr r0, [r7, #4]
_08113DC4:
	ldr r1, [sp, #0x14]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #0x14]
	adds r0, r4, #0
	b _08113E66
_08113DD4:
	ldr r0, [r7, #0xc]
	movs r1, #0
	ldr r2, [sp, #0x1c]
	movs r3, #0
	bl __muldi3
	adds r2, r1, #0
	adds r5, r2, #0
	adds r6, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [sp, #0x18]
	adds r4, r4, r0
	str r4, [sp, #0x28]
	ldr r1, [r7, #4]
	ldr r0, [sp, #0x14]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x24]
	adds r4, #2
	str r4, [sp, #0x28]
	cmp r2, #0
	bge _08113E20
	movs r2, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
_08113E0A:
	adds r4, #1
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _08113E18
	lsrs r6, r6, #1
	orrs r6, r1
_08113E18:
	lsrs r5, r5, #1
	cmp r5, #0
	blt _08113E0A
	str r4, [sp, #0x28]
_08113E20:
	ldr r0, _08113E74 @ =0x3FFFFFFF
	cmp r5, r0
	bhi _08113E46
	movs r4, #0x80
	lsls r4, r4, #0x18
	movs r3, #1
	adds r2, r0, #0
	ldr r1, [sp, #0x28]
_08113E30:
	subs r1, #1
	lsls r5, r5, #1
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	beq _08113E3E
	orrs r5, r3
_08113E3E:
	lsls r6, r6, #1
	cmp r5, r2
	bls _08113E30
	str r1, [sp, #0x28]
_08113E46:
	movs r0, #0x7f
	ands r0, r5
	cmp r0, #0x40
	bne _08113E5C
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	bne _08113E5A
	cmp r6, #0
	beq _08113E5C
_08113E5A:
	adds r5, #0x40
_08113E5C:
	str r5, [sp, #0x2c]
	movs r0, #3
	mov r1, r8
	str r0, [r1]
	mov r0, sb
_08113E66:
	bl __pack_f
	add sp, #0x38
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_08113E74: .4byte 0x3FFFFFFF

	thumb_func_start __divsf3
__divsf3: @ 0x08113E78
	push {r4, r5, r6, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r5, sp, #0x10
	adds r1, r5, #0
	bl __unpack_f
	mov r4, sp
	movs r0, #0
	ldr r3, [sp]
	cmp r3, #1
	bhi _08113E9E
	movs r0, #1
_08113E9E:
	cmp r0, #0
	beq _08113EA6
	mov r1, sp
	b _08113F58
_08113EA6:
	movs r0, #0
	ldr r2, [sp, #0x10]
	adds r6, r2, #0
	cmp r2, #1
	bhi _08113EB2
	movs r0, #1
_08113EB2:
	cmp r0, #0
	beq _08113EBA
	adds r1, r5, #0
	b _08113F58
_08113EBA:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x14]
	eors r0, r1
	str r0, [sp, #4]
	movs r0, #0
	cmp r3, #4
	bne _08113ECA
	movs r0, #1
_08113ECA:
	cmp r0, #0
	bne _08113EDA
	movs r0, #0
	cmp r3, #2
	bne _08113ED6
	movs r0, #1
_08113ED6:
	cmp r0, #0
	beq _08113EEC
_08113EDA:
	ldr r0, [r4]
	adds r1, r4, #0
	cmp r0, r6
	bne _08113F58
	ldr r1, _08113EE8 @ =gUnk_03005840
	b _08113F58
	.align 2, 0
_08113EE8: .4byte gUnk_03005840
_08113EEC:
	movs r1, #0
	cmp r2, #4
	bne _08113EF4
	movs r1, #1
_08113EF4:
	cmp r1, #0
	beq _08113F00
	str r0, [sp, #0xc]
	str r0, [sp, #8]
	mov r1, sp
	b _08113F58
_08113F00:
	movs r0, #0
	cmp r2, #2
	bne _08113F08
	movs r0, #1
_08113F08:
	cmp r0, #0
	beq _08113F12
	movs r0, #4
	str r0, [r4]
	b _08113F56
_08113F12:
	ldr r1, [r4, #8]
	ldr r0, [sp, #0x18]
	subs r0, r1, r0
	str r0, [r4, #8]
	ldr r2, [r4, #0xc]
	ldr r3, [sp, #0x1c]
	cmp r2, r3
	bhs _08113F28
	lsls r2, r2, #1
	subs r0, #1
	str r0, [r4, #8]
_08113F28:
	movs r0, #0x80
	lsls r0, r0, #0x17
	movs r1, #0
_08113F2E:
	cmp r2, r3
	blo _08113F36
	orrs r1, r0
	subs r2, r2, r3
_08113F36:
	lsrs r0, r0, #1
	lsls r2, r2, #1
	cmp r0, #0
	bne _08113F2E
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x40
	bne _08113F54
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08113F52
	cmp r2, #0
	beq _08113F54
_08113F52:
	adds r1, #0x40
_08113F54:
	str r1, [r4, #0xc]
_08113F56:
	adds r1, r4, #0
_08113F58:
	adds r0, r1, #0
	bl __pack_f
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.align 2, 0

	thumb_func_start __fpcmp_parts_f
__fpcmp_parts_f: @ 0x08113F64
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	ldr r2, [r4]
	cmp r2, #1
	bhi _08113F72
	movs r0, #1
_08113F72:
	cmp r0, #0
	bne _08113F84
	movs r0, #0
	ldr r3, [r1]
	cmp r3, #1
	bhi _08113F80
	movs r0, #1
_08113F80:
	cmp r0, #0
	beq _08113F88
_08113F84:
	movs r0, #1
	b _08114046
_08113F88:
	movs r0, #0
	cmp r2, #4
	bne _08113F90
	movs r0, #1
_08113F90:
	cmp r0, #0
	beq _08113FA8
	movs r0, #0
	cmp r3, #4
	bne _08113F9C
	movs r0, #1
_08113F9C:
	cmp r0, #0
	beq _08113FA8
	ldr r0, [r1, #4]
	ldr r1, [r4, #4]
	subs r0, r0, r1
	b _08114046
_08113FA8:
	movs r2, #0
	ldr r0, [r4]
	cmp r0, #4
	bne _08113FB2
	movs r2, #1
_08113FB2:
	cmp r2, #0
	bne _08114000
	movs r2, #0
	cmp r3, #4
	bne _08113FBE
	movs r2, #1
_08113FBE:
	cmp r2, #0
	beq _08113FD0
_08113FC2:
	ldr r0, [r1, #4]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _0811400A
	movs r1, #1
	b _0811400A
_08113FD0:
	movs r2, #0
	cmp r0, #2
	bne _08113FD8
	movs r2, #1
_08113FD8:
	cmp r2, #0
	beq _08113FE8
	movs r2, #0
	cmp r3, #2
	bne _08113FE4
	movs r2, #1
_08113FE4:
	cmp r2, #0
	bne _08114044
_08113FE8:
	movs r2, #0
	cmp r0, #2
	bne _08113FF0
	movs r2, #1
_08113FF0:
	cmp r2, #0
	bne _08113FC2
	movs r0, #0
	cmp r3, #2
	bne _08113FFC
	movs r0, #1
_08113FFC:
	cmp r0, #0
	beq _0811400E
_08114000:
	ldr r0, [r4, #4]
	movs r1, #1
	cmp r0, #0
	beq _0811400A
	subs r1, #2
_0811400A:
	adds r0, r1, #0
	b _08114046
_0811400E:
	ldr r3, [r4, #4]
	ldr r0, [r1, #4]
	cmp r3, r0
	beq _08114020
_08114016:
	movs r0, #1
	cmp r3, #0
	beq _08114046
	subs r0, #2
	b _08114046
_08114020:
	ldr r2, [r4, #8]
	ldr r0, [r1, #8]
	cmp r2, r0
	bgt _08114016
	cmp r2, r0
	bge _08114038
_0811402C:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, #0
	beq _08114046
	movs r0, #1
	b _08114046
_08114038:
	ldr r0, [r4, #0xc]
	ldr r1, [r1, #0xc]
	cmp r0, r1
	bhi _08114016
	cmp r0, r1
	blo _0811402C
_08114044:
	movs r0, #0
_08114046:
	pop {r4, pc}

	thumb_func_start __cmpsf2
__cmpsf2: @ 0x08114048
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0

	thumb_func_start __eqsf2
__eqsf2: @ 0x08114070
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08114094
	movs r1, #1
_08114094:
	cmp r1, #0
	bne _081140A6
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _081140A2
	movs r1, #1
_081140A2:
	cmp r1, #0
	beq _081140AA
_081140A6:
	movs r0, #1
	b _081140B2
_081140AA:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_081140B2:
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0

	thumb_func_start __nesf2
__nesf2: @ 0x081140B8
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _081140DC
	movs r1, #1
_081140DC:
	cmp r1, #0
	bne _081140EE
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _081140EA
	movs r1, #1
_081140EA:
	cmp r1, #0
	beq _081140F2
_081140EE:
	movs r0, #1
	b _081140FA
_081140F2:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_081140FA:
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0

	thumb_func_start __gtsf2
__gtsf2: @ 0x08114100
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _08114124
	movs r1, #1
_08114124:
	cmp r1, #0
	bne _08114136
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _08114132
	movs r1, #1
_08114132:
	cmp r1, #0
	beq _0811413C
_08114136:
	movs r0, #1
	rsbs r0, r0, #0
	b _08114144
_0811413C:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_08114144:
	add sp, #0x28
	pop {r4, pc}

	thumb_func_start __gesf2
__gesf2: @ 0x08114148
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _0811416C
	movs r1, #1
_0811416C:
	cmp r1, #0
	bne _0811417E
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _0811417A
	movs r1, #1
_0811417A:
	cmp r1, #0
	beq _08114184
_0811417E:
	movs r0, #1
	rsbs r0, r0, #0
	b _0811418C
_08114184:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_0811418C:
	add sp, #0x28
	pop {r4, pc}

	thumb_func_start __ltsf2
__ltsf2: @ 0x08114190
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _081141B4
	movs r1, #1
_081141B4:
	cmp r1, #0
	bne _081141C6
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _081141C2
	movs r1, #1
_081141C2:
	cmp r1, #0
	beq _081141CA
_081141C6:
	movs r0, #1
	b _081141D2
_081141CA:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_081141D2:
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0

	thumb_func_start __lesf2
__lesf2: @ 0x081141D8
	push {r4, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #1
	bhi _081141FC
	movs r1, #1
_081141FC:
	cmp r1, #0
	bne _0811420E
	movs r1, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _0811420A
	movs r1, #1
_0811420A:
	cmp r1, #0
	beq _08114212
_0811420E:
	movs r0, #1
	b _0811421A
_08114212:
	mov r0, sp
	adds r1, r4, #0
	bl __fpcmp_parts_f
_0811421A:
	add sp, #0x28
	pop {r4, pc}
	.align 2, 0

	thumb_func_start __floatsisf
__floatsisf: @ 0x08114220
	push {lr}
	sub sp, #0x10
	adds r1, r0, #0
	movs r0, #3
	str r0, [sp]
	lsrs r2, r1, #0x1f
	str r2, [sp, #4]
	cmp r1, #0
	bne _08114238
	movs r0, #2
	str r0, [sp]
	b _08114270
_08114238:
	movs r0, #0x1e
	str r0, [sp, #8]
	cmp r2, #0
	beq _08114256
	movs r0, #0x80
	lsls r0, r0, #0x18
	cmp r1, r0
	bne _08114250
	ldr r0, _0811424C @ =0xCF000000
	b _08114276
	.align 2, 0
_0811424C: .4byte 0xCF000000
_08114250:
	rsbs r0, r1, #0
	str r0, [sp, #0xc]
	b _08114258
_08114256:
	str r1, [sp, #0xc]
_08114258:
	ldr r2, [sp, #0xc]
	ldr r3, _0811427C @ =0x3FFFFFFF
	cmp r2, r3
	bhi _08114270
	ldr r1, [sp, #8]
_08114262:
	lsls r0, r2, #1
	subs r1, #1
	adds r2, r0, #0
	cmp r0, r3
	bls _08114262
	str r1, [sp, #8]
	str r0, [sp, #0xc]
_08114270:
	mov r0, sp
	bl __pack_f
_08114276:
	add sp, #0x10
	pop {pc}
	.align 2, 0
_0811427C: .4byte 0x3FFFFFFF

	thumb_func_start __fixsfsi
__fixsfsi: @ 0x08114280
	push {lr}
	sub sp, #0x14
	str r0, [sp, #0x10]
	add r0, sp, #0x10
	mov r1, sp
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp]
	cmp r0, #2
	bne _08114298
	movs r1, #1
_08114298:
	cmp r1, #0
	bne _081142CA
	movs r1, #0
	cmp r0, #1
	bhi _081142A4
	movs r1, #1
_081142A4:
	cmp r1, #0
	bne _081142CA
	movs r1, #0
	cmp r0, #4
	bne _081142B0
	movs r1, #1
_081142B0:
	cmp r1, #0
	beq _081142C4
_081142B4:
	ldr r0, [sp, #4]
	ldr r1, _081142C0 @ =0x7FFFFFFF
	cmp r0, #0
	beq _081142E2
	adds r1, #1
	b _081142E2
	.align 2, 0
_081142C0: .4byte 0x7FFFFFFF
_081142C4:
	ldr r1, [sp, #8]
	cmp r1, #0
	bge _081142CE
_081142CA:
	movs r0, #0
	b _081142E4
_081142CE:
	cmp r1, #0x1e
	bgt _081142B4
	movs r0, #0x1e
	subs r0, r0, r1
	ldr r1, [sp, #0xc]
	lsrs r1, r0
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _081142E2
	rsbs r1, r1, #0
_081142E2:
	adds r0, r1, #0
_081142E4:
	add sp, #0x14
	pop {pc}

	thumb_func_start __negsf2
__negsf2: @ 0x081142E8
	push {lr}
	sub sp, #0x14
	str r0, [sp, #0x10]
	add r0, sp, #0x10
	mov r1, sp
	bl __unpack_f
	movs r1, #0
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _08114300
	movs r1, #1
_08114300:
	str r1, [sp, #4]
	mov r0, sp
	bl __pack_f
	add sp, #0x14
	pop {pc}

	thumb_func_start __make_fp
__make_fp: @ 0x0811430C
	push {lr}
	sub sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, sp
	bl __pack_f
	add sp, #0x10
	pop {pc}
	.align 2, 0

	thumb_func_start __extendsfdf2
__extendsfdf2: @ 0x08114324
	push {r4, r5, r6, lr}
	sub sp, #0x18
	str r0, [sp, #0x14]
	add r0, sp, #0x14
	add r1, sp, #4
	bl __unpack_f
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	movs r4, #0
	lsrs r6, r3, #2
	lsls r5, r4, #0x1e
	adds r4, r6, #0
	orrs r4, r5
	lsls r3, r3, #0x1e
	str r4, [sp]
	bl __make_dp
	add sp, #0x18
	pop {r4, r5, r6, pc}

	thumb_func_start __lshrdi3
__lshrdi3: @ 0x08114350
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r2, #0
	beq _08114380
	movs r0, #0x20
	subs r0, r0, r2
	cmp r0, #0
	bgt _0811436C
	movs r4, #0
	rsbs r0, r0, #0
	adds r3, r6, #0
	lsrs r3, r0
	b _0811437C
_0811436C:
	adds r1, r6, #0
	lsls r1, r0
	adds r4, r6, #0
	lsrs r4, r2
	adds r0, r5, #0
	lsrs r0, r2
	adds r3, r0, #0
	orrs r3, r1
_0811437C:
	adds r1, r4, #0
	adds r0, r3, #0
_08114380:
	pop {r4, r5, r6, pc}
	.align 2, 0

	thumb_func_start __negdi2
__negdi2: @ 0x08114384
	push {r4, lr}
	rsbs r2, r0, #0
	adds r3, r2, #0
	rsbs r1, r1, #0
	cmp r2, #0
	beq _08114392
	subs r1, #1
_08114392:
	adds r4, r1, #0
	adds r1, r4, #0
	adds r0, r3, #0
	pop {r4, pc}
	.align 2, 0
