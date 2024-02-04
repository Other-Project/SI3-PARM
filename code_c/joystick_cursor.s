	.text
	.syntax unified
	.eabi_attribute	67, "2.09"
	.cpu	cortex-m0
	.eabi_attribute	6, 12
	.eabi_attribute	7, 77
	.eabi_attribute	8, 0
	.eabi_attribute	9, 1
	.eabi_attribute	34, 0
	.eabi_attribute	17, 1
	.eabi_attribute	20, 1
	.eabi_attribute	21, 1
	.eabi_attribute	23, 3
	.eabi_attribute	24, 1
	.eabi_attribute	25, 1
	.eabi_attribute	38, 1
	.eabi_attribute	18, 4
	.eabi_attribute	26, 2
	.eabi_attribute	14, 0
	.file	"joystick_cursor.c"
	.globl	run
	.p2align	1
	.type	run,%function
	.code	16
	.thumb_func
run:
	.fnstart
	.pad	#92
	sub	sp, #92
	@APP
	sub sp, #508
	.code	16
	@NO_APP
	@APP
	sub sp, #452
	.code	16
	@NO_APP
	b	.LBB0_1
.LBB0_1:
	ldr	r0, [sp, #60]
	asrs	r1, r0, #31
	lsrs	r1, r1, #30
	adds	r0, r0, r1
	asrs	r0, r0, #2
	str	r0, [sp, #4]
	ldr	r0, [sp, #64]
	asrs	r1, r0, #31
	lsrs	r1, r1, #29
	adds	r0, r0, r1
	asrs	r0, r0, #3
	str	r0, [sp]
	b	.LBB0_2
.LBB0_2:
	ldr	r0, [sp, #4]
	movs	r1, #7
	subs	r0, r1, r0
	ldr	r1, [sp]
	movs	r2, #3
	ands	r1, r2
	lsls	r1, r1, #3
	orrs	r0, r1
	movs	r1, #1
	lsls	r1, r0
	ldr	r0, [sp, #36]
	orrs	r0, r1
	str	r0, [sp, #36]
	b	.LBB0_3
.LBB0_3:
	b	.LBB0_4
.LBB0_4:
	movs	r0, #1
	str	r0, [sp, #40]
	b	.LBB0_5
.LBB0_5:
	b	.LBB0_6
.LBB0_6:
	ldr	r0, [sp, #4]
	movs	r1, #7
	subs	r0, r1, r0
	ldr	r1, [sp]
	movs	r2, #3
	ands	r1, r2
	lsls	r1, r1, #3
	orrs	r0, r1
	movs	r1, #1
	lsls	r1, r0
	ldr	r0, [sp, #36]
	bics	r0, r1
	str	r0, [sp, #36]
	b	.LBB0_7
.LBB0_7:
	b	.LBB0_1
.Lfunc_end0:
	.size	run, .Lfunc_end0-run
	.cantunwind
	.fnend


	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6
