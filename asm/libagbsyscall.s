	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start CpuFastSet
CpuFastSet: @ 0x0810E3F4
	svc #12
	bx lr

	thumb_func_start CpuSet
CpuSet: @ 0x0810E3F8
	svc #11
	bx lr

	thumb_func_start Div
Div: @ 0x0810E3FC
	svc #6
	bx lr

	thumb_func_start Mod
Mod: @ 0x0810E400
	svc #6
	adds r0, r1, #0
	bx lr

    thumb_func_start GetBiosChecksum
GetBiosChecksum: @ 0x0810E408
	svc #0xd
	ldr r1, _0810E414 @ =0xBAAE187F
	subs r0, r0, r1
	movs r1, #1
	ands r0, r1
	bx lr
	.align 2, 0
_0810E414: .4byte 0xBAAE187F

	thumb_func_start LZ77UnCompVram
LZ77UnCompVram: @ 0x0810E418
	svc #18
	bx lr

	thumb_func_start LZ77UnCompWram
LZ77UnCompWram: @ 0x0810E41C
	svc #17
	bx lr

    .align 2, 0
