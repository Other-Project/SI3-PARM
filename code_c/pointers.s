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
	.file	"pointers.c"
	.globl	run
	.p2align	1
	.type	run,%function
	.code	16
	.thumb_func
run:
	.fnstart
	.pad	#116
	sub	sp, #116
	@APP
	sub sp, #508
	.code	16
	@NO_APP
	@APP
	sub sp, #452
	.code	16
	@NO_APP
	movs	r0, #1
	str	r0, [sp, #12]
	movs	r0, #3
	str	r0, [sp, #16]
	movs	r0, #6
	str	r0, [sp, #20]
	movs	r0, #9
	str	r0, [sp, #24]
	movs	r0, #10
	str	r0, [sp, #28]
	movs	r0, #0
	str	r0, [sp, #8]
	b	.LBB0_1
.LBB0_1:
	ldr	r0, [sp, #8]
	cmp	r0, #4
	bgt	.LBB0_4
	b	.LBB0_2
.LBB0_2:
	ldr	r0, [sp, #8]
	lsls	r0, r0, #2
	add	r1, sp, #12
	ldr	r0, [r1, r0]
	str	r0, [sp, #56]
	b	.LBB0_3
.LBB0_3:
	ldr	r0, [sp, #8]
	adds	r0, r0, #1
	str	r0, [sp, #8]
	b	.LBB0_1
.LBB0_4:
	movs	r0, #0
	str	r0, [sp, #4]
	b	.LBB0_5
.LBB0_5:
	ldr	r0, [sp, #4]
	cmp	r0, #4
	bgt	.LBB0_8
	b	.LBB0_6
.LBB0_6:
	ldr	r0, [sp, #4]
	lsls	r1, r0, #2
	add	r2, sp, #12
	str	r0, [r2, r1]
	ldr	r0, [sp, #4]
	lsls	r0, r0, #2
	ldr	r0, [r2, r0]
	str	r0, [sp, #56]
	b	.LBB0_7
.LBB0_7:
	ldr	r0, [sp, #4]
	adds	r0, r0, #1
	str	r0, [sp, #4]
	b	.LBB0_5
.LBB0_8:
	movs	r0, #0
	str	r0, [sp]
	b	.LBB0_9
.LBB0_9:
	ldr	r0, [sp]
	cmp	r0, #4
	bgt	.LBB0_12
	b	.LBB0_10
.LBB0_10:
	ldr	r0, [sp]
	lsls	r0, r0, #2
	add	r1, sp, #12
	ldr	r0, [r1, r0]
	str	r0, [sp, #56]
	b	.LBB0_11
.LBB0_11:
	ldr	r0, [sp]
	adds	r0, r0, #1
	str	r0, [sp]
	b	.LBB0_9
.LBB0_12:
	b	.LBB0_13
.LBB0_13:
	b	.LBB0_14
.LBB0_14:
	b	.LBB0_14
.Lfunc_end0:
	.size	run, .Lfunc_end0-run
	.cantunwind
	.fnend


	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6
