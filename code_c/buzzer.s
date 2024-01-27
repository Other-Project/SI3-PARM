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
	.file	"buzzer.c"
	.globl	run
	.p2align	1
	.type	run,%function
	.code	16
	.thumb_func
run:
	.fnstart
	.pad	#96
	sub	sp, #96
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
	b	.LBB0_2
.LBB0_2:
	movs	r0, #8
	str	r0, [sp, #8]
	ldr	r0, [sp, #8]
	lsls	r0, r0, #6
	str	r0, [sp, #8]
	ldr	r0, [sp, #8]
	lsls	r0, r0, #8
	str	r0, [sp, #8]
	ldr	r0, [sp, #88]
	lsls	r0, r0, #9
	asrs	r0, r0, #9
	ldr	r1, [sp, #8]
	adds	r0, r1, r0
	str	r0, [sp, #8]
	ldr	r0, [sp, #8]
	lsls	r0, r0, #8
	str	r0, [sp, #8]
	ldr	r0, [sp, #88]
	ldr	r1, [sp, #8]
	lsls	r1, r1, #2
	str	r1, [sp, #8]
	ldr	r1, [sp, #88]
	ldr	r2, [sp, #8]
	adds	r2, r2, #1
	str	r2, [sp, #8]
	ldr	r2, [sp, #8]
	str	r2, [sp, #56]
	str	r0, [sp, #4]
	str	r1, [sp]
	b	.LBB0_3
.LBB0_3:
	b	.LBB0_1
.Lfunc_end0:
	.size	run, .Lfunc_end0-run
	.cantunwind
	.fnend


	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6
