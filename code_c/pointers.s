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
	.pad	#136
	sub	sp, #136
	@APP
	sub sp, #508
	.code	16
	@NO_APP
	@APP
	sub sp, #452
	.code	16
	@NO_APP
	movs	r0, #25
	str	r0, [sp, #48]
	ldr	r0, [sp, #48]
	str	r0, [sp, #76]
	movs	r0, #1
	str	r0, [sp, #28]
	movs	r0, #3
	str	r0, [sp, #32]
	movs	r0, #6
	str	r0, [sp, #36]
	movs	r0, #9
	str	r0, [sp, #40]
	movs	r0, #10
	str	r0, [sp, #44]
	movs	r0, #0
	str	r0, [sp, #24]
	b	.LBB0_1
.LBB0_1:
	ldr	r0, [sp, #24]
	cmp	r0, #4
	bgt	.LBB0_4
	b	.LBB0_2
.LBB0_2:
	ldr	r0, [sp, #24]
	lsls	r0, r0, #2
	add	r1, sp, #28
	ldr	r0, [r1, r0]
	str	r0, [sp, #76]
	b	.LBB0_3
.LBB0_3:
	ldr	r0, [sp, #24]
	adds	r0, r0, #1
	str	r0, [sp, #24]
	b	.LBB0_1
.LBB0_4:
	movs	r0, #0
	str	r0, [sp, #20]
	b	.LBB0_5
.LBB0_5:
	ldr	r0, [sp, #20]
	cmp	r0, #4
	bgt	.LBB0_8
	b	.LBB0_6
.LBB0_6:
	ldr	r0, [sp, #20]
	lsls	r1, r0, #2
	add	r2, sp, #28
	str	r0, [r2, r1]
	ldr	r0, [sp, #20]
	lsls	r0, r0, #2
	ldr	r0, [r2, r0]
	str	r0, [sp, #76]
	b	.LBB0_7
.LBB0_7:
	ldr	r0, [sp, #20]
	adds	r0, r0, #1
	str	r0, [sp, #20]
	b	.LBB0_5
.LBB0_8:
	movs	r0, #0
	str	r0, [sp, #16]
	b	.LBB0_9
.LBB0_9:
	ldr	r0, [sp, #16]
	cmp	r0, #4
	bgt	.LBB0_12
	b	.LBB0_10
.LBB0_10:
	ldr	r0, [sp, #16]
	lsls	r0, r0, #2
	add	r1, sp, #28
	ldr	r0, [r1, r0]
	str	r0, [sp, #76]
	b	.LBB0_11
.LBB0_11:
	ldr	r0, [sp, #16]
	adds	r0, r0, #1
	str	r0, [sp, #16]
	b	.LBB0_9
.LBB0_12:
	movs	r0, #0
	str	r0, [sp, #12]
	b	.LBB0_13
.LBB0_13:
	ldr	r0, [sp, #12]
	cmp	r0, #4
	bgt	.LBB0_16
	b	.LBB0_14
.LBB0_14:
	ldr	r0, [sp, #12]
	lsls	r0, r0, #2
	add	r1, sp, #28
	ldr	r0, [r1, r0]
	str	r0, [sp, #76]
	b	.LBB0_15
.LBB0_15:
	ldr	r0, [sp, #12]
	adds	r0, r0, #1
	str	r0, [sp, #12]
	b	.LBB0_13
.LBB0_16:
	add	r0, sp, #28
	adds	r0, #8
	str	r0, [sp, #8]
	ldr	r0, [sp, #8]
	movs	r1, #50
	str	r1, [r0]
	ldr	r0, [sp, #48]
	ldr	r1, [sp, #8]
	str	r0, [r1, #4]
	ldr	r0, [sp, #8]
	ldr	r0, [r0, #4]
	str	r0, [sp, #76]
	ldr	r0, [sp, #8]
	adds	r0, #8
	str	r0, [sp, #8]
	movs	r0, #0
	str	r0, [sp, #4]
	b	.LBB0_17
.LBB0_17:
	ldr	r0, [sp, #4]
	cmp	r0, #4
	bgt	.LBB0_20
	b	.LBB0_18
.LBB0_18:
	ldr	r0, [sp, #4]
	lsls	r0, r0, #2
	add	r1, sp, #28
	ldr	r0, [r1, r0]
	str	r0, [sp, #76]
	b	.LBB0_19
.LBB0_19:
	ldr	r0, [sp, #4]
	adds	r0, r0, #1
	str	r0, [sp, #4]
	b	.LBB0_17
.LBB0_20:
	movs	r0, #0
	str	r0, [sp]
	b	.LBB0_21
.LBB0_21:
	ldr	r0, [sp]
	cmp	r0, #4
	bgt	.LBB0_24
	b	.LBB0_22
.LBB0_22:
	ldr	r0, [sp, #8]
	ldr	r1, [sp]
	lsls	r1, r1, #2
	subs	r0, r0, r1
	ldr	r0, [r0]
	str	r0, [sp, #76]
	b	.LBB0_23
.LBB0_23:
	ldr	r0, [sp]
	adds	r0, r0, #1
	str	r0, [sp]
	b	.LBB0_21
.LBB0_24:
	b	.LBB0_25
.LBB0_25:
	b	.LBB0_26
.LBB0_26:
	b	.LBB0_26
.Lfunc_end0:
	.size	run, .Lfunc_end0-run
	.cantunwind
	.fnend


	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6
