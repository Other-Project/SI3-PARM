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
	.file	"buzzer_melody.c"
	.globl	run
	.p2align	1
	.type	run,%function
	.code	16
	.thumb_func
run:
	.fnstart
	.save	{r4, r5, r7, lr}
	push	{r4, r5, r7, lr}
	.setfp	r7, sp, #8
	add	r7, sp, #8
	.pad	#280
	sub	sp, #280
	@APP
	sub sp, #508
	.code	16
	@NO_APP
	@APP
	sub sp, #452
	.code	16
	@NO_APP
	add	r0, sp, #20
	str	r0, [sp, #16]
	ldr	r0, [sp, #16]
	adds	r1, r0, #4
	str	r1, [sp, #16]
	movs	r1, #131
	lsls	r1, r1, #1
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r2, r0, #4
	str	r2, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r2, r0, #4
	str	r2, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r2, r0, #4
	str	r2, [sp, #16]
	movs	r2, #147
	lsls	r2, r2, #1
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r3, r0, #4
	str	r3, [sp, #16]
	movs	r3, #165
	lsls	r3, r3, #1
	str	r3, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r3, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r3, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r3, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	movs	r4, #220
	str	r4, [r0]
	ldr	r0, [sp, #16]
	adds	r5, r0, #4
	str	r5, [sp, #16]
	str	r4, [r0]
	ldr	r0, [sp, #16]
	adds	r5, r0, #4
	str	r5, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r5, r0, #4
	str	r5, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r5, r0, #4
	str	r5, [sp, #16]
	movs	r5, #246
	str	r5, [r0]
	ldr	r0, [sp, #16]
	adds	r5, r0, #4
	str	r5, [sp, #16]
	str	r4, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	movs	r4, #196
	str	r4, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r3, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #16]
	adds	r4, r0, #4
	str	r4, [sp, #16]
	str	r3, [r0]
	ldr	r0, [sp, #16]
	adds	r3, r0, #4
	str	r3, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r3, r0, #4
	str	r3, [sp, #16]
	str	r2, [r0]
	ldr	r0, [sp, #16]
	adds	r2, r0, #4
	str	r2, [sp, #16]
	str	r1, [r0]
	ldr	r0, [sp, #272]
	lsls	r0, r0, #9
	str	r0, [sp, #12]
	b	.LBB0_1
.LBB0_1:
	movs	r0, #0
	str	r0, [sp, #8]
	b	.LBB0_2
.LBB0_2:
	ldr	r0, [sp, #8]
	cmp	r0, #43
	bgt	.LBB0_11
	b	.LBB0_3
.LBB0_3:
	movs	r0, #0
	str	r0, [sp, #240]
	b	.LBB0_4
.LBB0_4:
	ldr	r0, [sp, #8]
	lsls	r0, r0, #2
	add	r1, sp, #20
	ldr	r0, [r1, r0]
	asrs	r0, r0, #6
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	lsls	r0, r0, #6
	str	r0, [sp, #4]
	ldr	r0, [sp, #8]
	lsls	r0, r0, #2
	ldr	r0, [r1, r0]
	movs	r1, #63
	ands	r0, r1
	ldr	r1, [sp, #4]
	adds	r0, r1, r0
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	lsls	r0, r0, #8
	str	r0, [sp, #4]
	ldr	r0, [sp, #12]
	asrs	r0, r0, #9
	ldr	r1, [sp, #4]
	adds	r0, r1, r0
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	lsls	r0, r0, #8
	str	r0, [sp, #4]
	ldr	r0, [sp, #12]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #4]
	adds	r0, r1, r0
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	lsls	r0, r0, #2
	str	r0, [sp, #4]
	ldr	r0, [sp, #12]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #4]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	str	r0, [sp, #240]
	b	.LBB0_5
.LBB0_5:
	ldr	r0, [sp, #8]
	str	r0, [sp, #220]
	movs	r0, #0
	str	r0, [sp]
	b	.LBB0_6
.LBB0_6:
	ldr	r0, [sp]
	cmp	r0, #2
	bgt	.LBB0_9
	b	.LBB0_7
.LBB0_7:
	b	.LBB0_8
.LBB0_8:
	ldr	r0, [sp]
	adds	r0, r0, #1
	str	r0, [sp]
	b	.LBB0_6
.LBB0_9:
	b	.LBB0_10
.LBB0_10:
	ldr	r0, [sp, #8]
	adds	r0, r0, #1
	str	r0, [sp, #8]
	b	.LBB0_2
.LBB0_11:
	b	.LBB0_1
.Lfunc_end0:
	.size	run, .Lfunc_end0-run
	.cantunwind
	.fnend


	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6
