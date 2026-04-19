	.include "asm/macros.inc"
	.include "constants/constants.inc"

	.syntax unified

	.text

	thumb_func_start atof
atof: @ 0x0810FE6C
	push {lr}
	movs r1, #0
	bl strtod
	pop {pc}
	.align 2, 0
