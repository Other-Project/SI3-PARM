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
	.eabi_attribute	21, 0
	.eabi_attribute	23, 3
	.eabi_attribute	24, 1
	.eabi_attribute	25, 1
	.eabi_attribute	38, 1
	.eabi_attribute	18, 4
	.eabi_attribute	26, 2
	.eabi_attribute	14, 0
	.file	"buzzer.c"
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
	sub	sp, #508
	@NO_APP
	@APP
	sub	sp, #452
	@NO_APP
	b	.LBB0_1
.LBB0_1:
	movs	r0, #8
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	lsls	r0, r0, #6
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	lsls	r0, r0, #8
	str	r0, [sp, #4]
	ldr	r0, [sp, #84]
	lsls	r0, r0, #9
	asrs	r1, r0, #9
	ldr	r0, [sp, #4]
	adds	r0, r0, r1
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	lsls	r0, r0, #8
	str	r0, [sp, #4]
	ldr	r0, [sp, #84]
	ldr	r0, [sp, #4]
	lsls	r0, r0, #2
	str	r0, [sp, #4]
	ldr	r0, [sp, #84]
	ldr	r0, [sp, #4]
	adds	r0, r0, #1
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	str	r0, [sp, #52]
	str	r0, [sp]
	b	.LBB0_1
.Lfunc_end0:
	.size	run, .Lfunc_end0-run
	.cantunwind
	.fnend

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",%progbits
	.addrsig
	.eabi_attribute	30, 6
