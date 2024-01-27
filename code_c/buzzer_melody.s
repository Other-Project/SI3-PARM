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
	.save	{r7, lr}
	push	{r7, lr}
	.setfp	r7, sp
	add	r7, sp, #0
	.pad	#348
	sub	sp, #348
	@APP
	sub sp, #508
	.code	16
	@NO_APP
	@APP
	sub sp, #452
	.code	16
	@NO_APP
	ldr	r0, [sp, #340]
	lsls	r0, r0, #9
	str	r0, [sp, #260]
	b	.LBB0_1
.LBB0_1:
	movs	r0, #2
	str	r0, [sp, #256]
	ldr	r0, [sp, #256]
	lsls	r0, r0, #6
	str	r0, [sp, #256]
	ldr	r0, [sp, #256]
	adds	r0, r0, #2
	str	r0, [sp, #256]
	ldr	r0, [sp, #256]
	lsls	r0, r0, #8
	str	r0, [sp, #256]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #256]
	adds	r0, r1, r0
	str	r0, [sp, #256]
	ldr	r0, [sp, #256]
	lsls	r0, r0, #8
	str	r0, [sp, #256]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #256]
	adds	r0, r1, r0
	str	r0, [sp, #256]
	ldr	r0, [sp, #256]
	lsls	r0, r0, #2
	str	r0, [sp, #256]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #256]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #256]
	ldr	r0, [sp, #256]
	str	r0, [sp, #308]
	b	.LBB0_2
.LBB0_2:
	movs	r0, #0
	str	r0, [sp, #252]
	b	.LBB0_3
.LBB0_3:
	ldr	r0, [sp, #252]
	cmp	r0, #2
	bgt	.LBB0_6
	b	.LBB0_4
.LBB0_4:
	b	.LBB0_5
.LBB0_5:
	ldr	r0, [sp, #252]
	adds	r0, r0, #1
	str	r0, [sp, #252]
	b	.LBB0_3
.LBB0_6:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #248]
	b	.LBB0_7
.LBB0_7:
	ldr	r0, [sp, #248]
	cmp	r0, #0
	bge	.LBB0_10
	b	.LBB0_8
.LBB0_8:
	b	.LBB0_9
.LBB0_9:
	ldr	r0, [sp, #248]
	adds	r0, r0, #1
	str	r0, [sp, #248]
	b	.LBB0_7
.LBB0_10:
	b	.LBB0_11
.LBB0_11:
	movs	r0, #2
	str	r0, [sp, #244]
	ldr	r0, [sp, #244]
	lsls	r0, r0, #6
	str	r0, [sp, #244]
	ldr	r0, [sp, #244]
	adds	r0, r0, #2
	str	r0, [sp, #244]
	ldr	r0, [sp, #244]
	lsls	r0, r0, #8
	str	r0, [sp, #244]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #244]
	adds	r0, r1, r0
	str	r0, [sp, #244]
	ldr	r0, [sp, #244]
	lsls	r0, r0, #8
	str	r0, [sp, #244]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #244]
	adds	r0, r1, r0
	str	r0, [sp, #244]
	ldr	r0, [sp, #244]
	lsls	r0, r0, #2
	str	r0, [sp, #244]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #244]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #244]
	ldr	r0, [sp, #244]
	str	r0, [sp, #308]
	b	.LBB0_12
.LBB0_12:
	movs	r0, #0
	str	r0, [sp, #240]
	b	.LBB0_13
.LBB0_13:
	ldr	r0, [sp, #240]
	cmp	r0, #2
	bgt	.LBB0_16
	b	.LBB0_14
.LBB0_14:
	b	.LBB0_15
.LBB0_15:
	ldr	r0, [sp, #240]
	adds	r0, r0, #1
	str	r0, [sp, #240]
	b	.LBB0_13
.LBB0_16:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #236]
	b	.LBB0_17
.LBB0_17:
	ldr	r0, [sp, #236]
	cmp	r0, #0
	bge	.LBB0_20
	b	.LBB0_18
.LBB0_18:
	b	.LBB0_19
.LBB0_19:
	ldr	r0, [sp, #236]
	adds	r0, r0, #1
	str	r0, [sp, #236]
	b	.LBB0_17
.LBB0_20:
	b	.LBB0_21
.LBB0_21:
	movs	r0, #2
	str	r0, [sp, #232]
	ldr	r0, [sp, #232]
	lsls	r0, r0, #6
	str	r0, [sp, #232]
	ldr	r0, [sp, #232]
	adds	r0, r0, #2
	str	r0, [sp, #232]
	ldr	r0, [sp, #232]
	lsls	r0, r0, #8
	str	r0, [sp, #232]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #232]
	adds	r0, r1, r0
	str	r0, [sp, #232]
	ldr	r0, [sp, #232]
	lsls	r0, r0, #8
	str	r0, [sp, #232]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #232]
	adds	r0, r1, r0
	str	r0, [sp, #232]
	ldr	r0, [sp, #232]
	lsls	r0, r0, #2
	str	r0, [sp, #232]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #232]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #232]
	ldr	r0, [sp, #232]
	str	r0, [sp, #308]
	b	.LBB0_22
.LBB0_22:
	movs	r0, #0
	str	r0, [sp, #228]
	b	.LBB0_23
.LBB0_23:
	ldr	r0, [sp, #228]
	cmp	r0, #2
	bgt	.LBB0_26
	b	.LBB0_24
.LBB0_24:
	b	.LBB0_25
.LBB0_25:
	ldr	r0, [sp, #228]
	adds	r0, r0, #1
	str	r0, [sp, #228]
	b	.LBB0_23
.LBB0_26:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #224]
	b	.LBB0_27
.LBB0_27:
	ldr	r0, [sp, #224]
	cmp	r0, #0
	bge	.LBB0_30
	b	.LBB0_28
.LBB0_28:
	b	.LBB0_29
.LBB0_29:
	ldr	r0, [sp, #224]
	adds	r0, r0, #1
	str	r0, [sp, #224]
	b	.LBB0_27
.LBB0_30:
	b	.LBB0_31
.LBB0_31:
	movs	r0, #2
	str	r0, [sp, #220]
	ldr	r0, [sp, #220]
	lsls	r0, r0, #6
	str	r0, [sp, #220]
	ldr	r0, [sp, #220]
	adds	r0, #18
	str	r0, [sp, #220]
	ldr	r0, [sp, #220]
	lsls	r0, r0, #8
	str	r0, [sp, #220]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #220]
	adds	r0, r1, r0
	str	r0, [sp, #220]
	ldr	r0, [sp, #220]
	lsls	r0, r0, #8
	str	r0, [sp, #220]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #220]
	adds	r0, r1, r0
	str	r0, [sp, #220]
	ldr	r0, [sp, #220]
	lsls	r0, r0, #2
	str	r0, [sp, #220]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #220]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #220]
	ldr	r0, [sp, #220]
	str	r0, [sp, #308]
	b	.LBB0_32
.LBB0_32:
	movs	r0, #0
	str	r0, [sp, #216]
	b	.LBB0_33
.LBB0_33:
	ldr	r0, [sp, #216]
	cmp	r0, #2
	bgt	.LBB0_36
	b	.LBB0_34
.LBB0_34:
	b	.LBB0_35
.LBB0_35:
	ldr	r0, [sp, #216]
	adds	r0, r0, #1
	str	r0, [sp, #216]
	b	.LBB0_33
.LBB0_36:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #212]
	b	.LBB0_37
.LBB0_37:
	ldr	r0, [sp, #212]
	cmp	r0, #0
	bge	.LBB0_40
	b	.LBB0_38
.LBB0_38:
	b	.LBB0_39
.LBB0_39:
	ldr	r0, [sp, #212]
	adds	r0, r0, #1
	str	r0, [sp, #212]
	b	.LBB0_37
.LBB0_40:
	b	.LBB0_41
.LBB0_41:
	movs	r0, #2
	str	r0, [sp, #208]
	ldr	r0, [sp, #208]
	lsls	r0, r0, #6
	str	r0, [sp, #208]
	ldr	r0, [sp, #208]
	adds	r0, #37
	str	r0, [sp, #208]
	ldr	r0, [sp, #208]
	lsls	r0, r0, #8
	str	r0, [sp, #208]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #208]
	adds	r0, r1, r0
	str	r0, [sp, #208]
	ldr	r0, [sp, #208]
	lsls	r0, r0, #8
	str	r0, [sp, #208]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #208]
	adds	r0, r1, r0
	str	r0, [sp, #208]
	ldr	r0, [sp, #208]
	lsls	r0, r0, #2
	str	r0, [sp, #208]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #208]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #208]
	ldr	r0, [sp, #208]
	str	r0, [sp, #308]
	b	.LBB0_42
.LBB0_42:
	movs	r0, #0
	str	r0, [sp, #204]
	b	.LBB0_43
.LBB0_43:
	ldr	r0, [sp, #204]
	cmp	r0, #2
	bgt	.LBB0_46
	b	.LBB0_44
.LBB0_44:
	b	.LBB0_45
.LBB0_45:
	ldr	r0, [sp, #204]
	adds	r0, r0, #1
	str	r0, [sp, #204]
	b	.LBB0_43
.LBB0_46:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #200]
	b	.LBB0_47
.LBB0_47:
	ldr	r0, [sp, #200]
	cmp	r0, #0
	bge	.LBB0_50
	b	.LBB0_48
.LBB0_48:
	b	.LBB0_49
.LBB0_49:
	ldr	r0, [sp, #200]
	adds	r0, r0, #1
	str	r0, [sp, #200]
	b	.LBB0_47
.LBB0_50:
	b	.LBB0_51
.LBB0_51:
	movs	r0, #2
	str	r0, [sp, #196]
	ldr	r0, [sp, #196]
	lsls	r0, r0, #6
	str	r0, [sp, #196]
	ldr	r0, [sp, #196]
	adds	r0, #18
	str	r0, [sp, #196]
	ldr	r0, [sp, #196]
	lsls	r0, r0, #8
	str	r0, [sp, #196]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #196]
	adds	r0, r1, r0
	str	r0, [sp, #196]
	ldr	r0, [sp, #196]
	lsls	r0, r0, #8
	str	r0, [sp, #196]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #196]
	adds	r0, r1, r0
	str	r0, [sp, #196]
	ldr	r0, [sp, #196]
	lsls	r0, r0, #2
	str	r0, [sp, #196]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #196]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #196]
	ldr	r0, [sp, #196]
	str	r0, [sp, #308]
	b	.LBB0_52
.LBB0_52:
	movs	r0, #0
	str	r0, [sp, #192]
	b	.LBB0_53
.LBB0_53:
	ldr	r0, [sp, #192]
	cmp	r0, #2
	bgt	.LBB0_56
	b	.LBB0_54
.LBB0_54:
	b	.LBB0_55
.LBB0_55:
	ldr	r0, [sp, #192]
	adds	r0, r0, #1
	str	r0, [sp, #192]
	b	.LBB0_53
.LBB0_56:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #188]
	b	.LBB0_57
.LBB0_57:
	ldr	r0, [sp, #188]
	cmp	r0, #0
	bge	.LBB0_60
	b	.LBB0_58
.LBB0_58:
	b	.LBB0_59
.LBB0_59:
	ldr	r0, [sp, #188]
	adds	r0, r0, #1
	str	r0, [sp, #188]
	b	.LBB0_57
.LBB0_60:
	b	.LBB0_61
.LBB0_61:
	movs	r0, #2
	str	r0, [sp, #184]
	ldr	r0, [sp, #184]
	lsls	r0, r0, #6
	str	r0, [sp, #184]
	ldr	r0, [sp, #184]
	adds	r0, r0, #2
	str	r0, [sp, #184]
	ldr	r0, [sp, #184]
	lsls	r0, r0, #8
	str	r0, [sp, #184]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #184]
	adds	r0, r1, r0
	str	r0, [sp, #184]
	ldr	r0, [sp, #184]
	lsls	r0, r0, #8
	str	r0, [sp, #184]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #184]
	adds	r0, r1, r0
	str	r0, [sp, #184]
	ldr	r0, [sp, #184]
	lsls	r0, r0, #2
	str	r0, [sp, #184]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #184]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #184]
	ldr	r0, [sp, #184]
	str	r0, [sp, #308]
	b	.LBB0_62
.LBB0_62:
	movs	r0, #0
	str	r0, [sp, #180]
	b	.LBB0_63
.LBB0_63:
	ldr	r0, [sp, #180]
	cmp	r0, #2
	bgt	.LBB0_66
	b	.LBB0_64
.LBB0_64:
	b	.LBB0_65
.LBB0_65:
	ldr	r0, [sp, #180]
	adds	r0, r0, #1
	str	r0, [sp, #180]
	b	.LBB0_63
.LBB0_66:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #176]
	b	.LBB0_67
.LBB0_67:
	ldr	r0, [sp, #176]
	cmp	r0, #0
	bge	.LBB0_70
	b	.LBB0_68
.LBB0_68:
	b	.LBB0_69
.LBB0_69:
	ldr	r0, [sp, #176]
	adds	r0, r0, #1
	str	r0, [sp, #176]
	b	.LBB0_67
.LBB0_70:
	b	.LBB0_71
.LBB0_71:
	movs	r0, #2
	str	r0, [sp, #172]
	ldr	r0, [sp, #172]
	lsls	r0, r0, #6
	str	r0, [sp, #172]
	ldr	r0, [sp, #172]
	adds	r0, #37
	str	r0, [sp, #172]
	ldr	r0, [sp, #172]
	lsls	r0, r0, #8
	str	r0, [sp, #172]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #172]
	adds	r0, r1, r0
	str	r0, [sp, #172]
	ldr	r0, [sp, #172]
	lsls	r0, r0, #8
	str	r0, [sp, #172]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #172]
	adds	r0, r1, r0
	str	r0, [sp, #172]
	ldr	r0, [sp, #172]
	lsls	r0, r0, #2
	str	r0, [sp, #172]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #172]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #172]
	ldr	r0, [sp, #172]
	str	r0, [sp, #308]
	b	.LBB0_72
.LBB0_72:
	movs	r0, #0
	str	r0, [sp, #168]
	b	.LBB0_73
.LBB0_73:
	ldr	r0, [sp, #168]
	cmp	r0, #2
	bgt	.LBB0_76
	b	.LBB0_74
.LBB0_74:
	b	.LBB0_75
.LBB0_75:
	ldr	r0, [sp, #168]
	adds	r0, r0, #1
	str	r0, [sp, #168]
	b	.LBB0_73
.LBB0_76:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #164]
	b	.LBB0_77
.LBB0_77:
	ldr	r0, [sp, #164]
	cmp	r0, #0
	bge	.LBB0_80
	b	.LBB0_78
.LBB0_78:
	b	.LBB0_79
.LBB0_79:
	ldr	r0, [sp, #164]
	adds	r0, r0, #1
	str	r0, [sp, #164]
	b	.LBB0_77
.LBB0_80:
	b	.LBB0_81
.LBB0_81:
	movs	r0, #2
	str	r0, [sp, #160]
	ldr	r0, [sp, #160]
	lsls	r0, r0, #6
	str	r0, [sp, #160]
	ldr	r0, [sp, #160]
	adds	r0, #18
	str	r0, [sp, #160]
	ldr	r0, [sp, #160]
	lsls	r0, r0, #8
	str	r0, [sp, #160]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #160]
	adds	r0, r1, r0
	str	r0, [sp, #160]
	ldr	r0, [sp, #160]
	lsls	r0, r0, #8
	str	r0, [sp, #160]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #160]
	adds	r0, r1, r0
	str	r0, [sp, #160]
	ldr	r0, [sp, #160]
	lsls	r0, r0, #2
	str	r0, [sp, #160]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #160]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #160]
	ldr	r0, [sp, #160]
	str	r0, [sp, #308]
	b	.LBB0_82
.LBB0_82:
	movs	r0, #0
	str	r0, [sp, #156]
	b	.LBB0_83
.LBB0_83:
	ldr	r0, [sp, #156]
	cmp	r0, #2
	bgt	.LBB0_86
	b	.LBB0_84
.LBB0_84:
	b	.LBB0_85
.LBB0_85:
	ldr	r0, [sp, #156]
	adds	r0, r0, #1
	str	r0, [sp, #156]
	b	.LBB0_83
.LBB0_86:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #152]
	b	.LBB0_87
.LBB0_87:
	ldr	r0, [sp, #152]
	cmp	r0, #0
	bge	.LBB0_90
	b	.LBB0_88
.LBB0_88:
	b	.LBB0_89
.LBB0_89:
	ldr	r0, [sp, #152]
	adds	r0, r0, #1
	str	r0, [sp, #152]
	b	.LBB0_87
.LBB0_90:
	b	.LBB0_91
.LBB0_91:
	movs	r0, #2
	str	r0, [sp, #148]
	ldr	r0, [sp, #148]
	lsls	r0, r0, #6
	str	r0, [sp, #148]
	ldr	r0, [sp, #148]
	adds	r0, #18
	str	r0, [sp, #148]
	ldr	r0, [sp, #148]
	lsls	r0, r0, #8
	str	r0, [sp, #148]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #148]
	adds	r0, r1, r0
	str	r0, [sp, #148]
	ldr	r0, [sp, #148]
	lsls	r0, r0, #8
	str	r0, [sp, #148]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #148]
	adds	r0, r1, r0
	str	r0, [sp, #148]
	ldr	r0, [sp, #148]
	lsls	r0, r0, #2
	str	r0, [sp, #148]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #148]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #148]
	ldr	r0, [sp, #148]
	str	r0, [sp, #308]
	b	.LBB0_92
.LBB0_92:
	movs	r0, #0
	str	r0, [sp, #144]
	b	.LBB0_93
.LBB0_93:
	ldr	r0, [sp, #144]
	cmp	r0, #2
	bgt	.LBB0_96
	b	.LBB0_94
.LBB0_94:
	b	.LBB0_95
.LBB0_95:
	ldr	r0, [sp, #144]
	adds	r0, r0, #1
	str	r0, [sp, #144]
	b	.LBB0_93
.LBB0_96:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #140]
	b	.LBB0_97
.LBB0_97:
	ldr	r0, [sp, #140]
	cmp	r0, #0
	bge	.LBB0_100
	b	.LBB0_98
.LBB0_98:
	b	.LBB0_99
.LBB0_99:
	ldr	r0, [sp, #140]
	adds	r0, r0, #1
	str	r0, [sp, #140]
	b	.LBB0_97
.LBB0_100:
	b	.LBB0_101
.LBB0_101:
	movs	r0, #2
	str	r0, [sp, #136]
	ldr	r0, [sp, #136]
	lsls	r0, r0, #6
	str	r0, [sp, #136]
	ldr	r0, [sp, #136]
	adds	r0, r0, #2
	str	r0, [sp, #136]
	ldr	r0, [sp, #136]
	lsls	r0, r0, #8
	str	r0, [sp, #136]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #136]
	adds	r0, r1, r0
	str	r0, [sp, #136]
	ldr	r0, [sp, #136]
	lsls	r0, r0, #8
	str	r0, [sp, #136]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #136]
	adds	r0, r1, r0
	str	r0, [sp, #136]
	ldr	r0, [sp, #136]
	lsls	r0, r0, #2
	str	r0, [sp, #136]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #136]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #136]
	ldr	r0, [sp, #136]
	str	r0, [sp, #308]
	b	.LBB0_102
.LBB0_102:
	movs	r0, #0
	str	r0, [sp, #132]
	b	.LBB0_103
.LBB0_103:
	ldr	r0, [sp, #132]
	cmp	r0, #2
	bgt	.LBB0_106
	b	.LBB0_104
.LBB0_104:
	b	.LBB0_105
.LBB0_105:
	ldr	r0, [sp, #132]
	adds	r0, r0, #1
	str	r0, [sp, #132]
	b	.LBB0_103
.LBB0_106:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #128]
	b	.LBB0_107
.LBB0_107:
	ldr	r0, [sp, #128]
	cmp	r0, #0
	bge	.LBB0_110
	b	.LBB0_108
.LBB0_108:
	b	.LBB0_109
.LBB0_109:
	ldr	r0, [sp, #128]
	adds	r0, r0, #1
	str	r0, [sp, #128]
	b	.LBB0_107
.LBB0_110:
	b	.LBB0_111
.LBB0_111:
	movs	r0, #2
	str	r0, [sp, #124]
	ldr	r0, [sp, #124]
	lsls	r0, r0, #6
	str	r0, [sp, #124]
	ldr	r0, [sp, #124]
	adds	r0, r0, #2
	str	r0, [sp, #124]
	ldr	r0, [sp, #124]
	lsls	r0, r0, #8
	str	r0, [sp, #124]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #124]
	adds	r0, r1, r0
	str	r0, [sp, #124]
	ldr	r0, [sp, #124]
	lsls	r0, r0, #8
	str	r0, [sp, #124]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #124]
	adds	r0, r1, r0
	str	r0, [sp, #124]
	ldr	r0, [sp, #124]
	lsls	r0, r0, #2
	str	r0, [sp, #124]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #124]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #124]
	ldr	r0, [sp, #124]
	str	r0, [sp, #308]
	b	.LBB0_112
.LBB0_112:
	movs	r0, #0
	str	r0, [sp, #120]
	b	.LBB0_113
.LBB0_113:
	ldr	r0, [sp, #120]
	cmp	r0, #2
	bgt	.LBB0_116
	b	.LBB0_114
.LBB0_114:
	b	.LBB0_115
.LBB0_115:
	ldr	r0, [sp, #120]
	adds	r0, r0, #1
	str	r0, [sp, #120]
	b	.LBB0_113
.LBB0_116:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #116]
	b	.LBB0_117
.LBB0_117:
	ldr	r0, [sp, #116]
	cmp	r0, #0
	bge	.LBB0_120
	b	.LBB0_118
.LBB0_118:
	b	.LBB0_119
.LBB0_119:
	ldr	r0, [sp, #116]
	adds	r0, r0, #1
	str	r0, [sp, #116]
	b	.LBB0_117
.LBB0_120:
	b	.LBB0_121
.LBB0_121:
	movs	r0, #2
	str	r0, [sp, #112]
	ldr	r0, [sp, #112]
	lsls	r0, r0, #6
	str	r0, [sp, #112]
	ldr	r0, [sp, #112]
	adds	r0, r0, #2
	str	r0, [sp, #112]
	ldr	r0, [sp, #112]
	lsls	r0, r0, #8
	str	r0, [sp, #112]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #112]
	adds	r0, r1, r0
	str	r0, [sp, #112]
	ldr	r0, [sp, #112]
	lsls	r0, r0, #8
	str	r0, [sp, #112]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #112]
	adds	r0, r1, r0
	str	r0, [sp, #112]
	ldr	r0, [sp, #112]
	lsls	r0, r0, #2
	str	r0, [sp, #112]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #112]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #112]
	ldr	r0, [sp, #112]
	str	r0, [sp, #308]
	b	.LBB0_122
.LBB0_122:
	movs	r0, #0
	str	r0, [sp, #108]
	b	.LBB0_123
.LBB0_123:
	ldr	r0, [sp, #108]
	cmp	r0, #2
	bgt	.LBB0_126
	b	.LBB0_124
.LBB0_124:
	b	.LBB0_125
.LBB0_125:
	ldr	r0, [sp, #108]
	adds	r0, r0, #1
	str	r0, [sp, #108]
	b	.LBB0_123
.LBB0_126:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #104]
	b	.LBB0_127
.LBB0_127:
	ldr	r0, [sp, #104]
	cmp	r0, #0
	bge	.LBB0_130
	b	.LBB0_128
.LBB0_128:
	b	.LBB0_129
.LBB0_129:
	ldr	r0, [sp, #104]
	adds	r0, r0, #1
	str	r0, [sp, #104]
	b	.LBB0_127
.LBB0_130:
	b	.LBB0_131
.LBB0_131:
	movs	r0, #2
	str	r0, [sp, #100]
	ldr	r0, [sp, #100]
	lsls	r0, r0, #6
	str	r0, [sp, #100]
	ldr	r0, [sp, #100]
	adds	r0, r0, #2
	str	r0, [sp, #100]
	ldr	r0, [sp, #100]
	lsls	r0, r0, #8
	str	r0, [sp, #100]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #100]
	adds	r0, r1, r0
	str	r0, [sp, #100]
	ldr	r0, [sp, #100]
	lsls	r0, r0, #8
	str	r0, [sp, #100]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #100]
	adds	r0, r1, r0
	str	r0, [sp, #100]
	ldr	r0, [sp, #100]
	lsls	r0, r0, #2
	str	r0, [sp, #100]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #100]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #100]
	ldr	r0, [sp, #100]
	str	r0, [sp, #308]
	b	.LBB0_132
.LBB0_132:
	movs	r0, #0
	str	r0, [sp, #96]
	b	.LBB0_133
.LBB0_133:
	ldr	r0, [sp, #96]
	cmp	r0, #2
	bgt	.LBB0_136
	b	.LBB0_134
.LBB0_134:
	b	.LBB0_135
.LBB0_135:
	ldr	r0, [sp, #96]
	adds	r0, r0, #1
	str	r0, [sp, #96]
	b	.LBB0_133
.LBB0_136:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #92]
	b	.LBB0_137
.LBB0_137:
	ldr	r0, [sp, #92]
	cmp	r0, #0
	bge	.LBB0_140
	b	.LBB0_138
.LBB0_138:
	b	.LBB0_139
.LBB0_139:
	ldr	r0, [sp, #92]
	adds	r0, r0, #1
	str	r0, [sp, #92]
	b	.LBB0_137
.LBB0_140:
	b	.LBB0_141
.LBB0_141:
	movs	r0, #2
	str	r0, [sp, #88]
	ldr	r0, [sp, #88]
	lsls	r0, r0, #6
	str	r0, [sp, #88]
	ldr	r0, [sp, #88]
	adds	r0, #18
	str	r0, [sp, #88]
	ldr	r0, [sp, #88]
	lsls	r0, r0, #8
	str	r0, [sp, #88]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #88]
	adds	r0, r1, r0
	str	r0, [sp, #88]
	ldr	r0, [sp, #88]
	lsls	r0, r0, #8
	str	r0, [sp, #88]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #88]
	adds	r0, r1, r0
	str	r0, [sp, #88]
	ldr	r0, [sp, #88]
	lsls	r0, r0, #2
	str	r0, [sp, #88]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #88]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #88]
	ldr	r0, [sp, #88]
	str	r0, [sp, #308]
	b	.LBB0_142
.LBB0_142:
	movs	r0, #0
	str	r0, [sp, #84]
	b	.LBB0_143
.LBB0_143:
	ldr	r0, [sp, #84]
	cmp	r0, #2
	bgt	.LBB0_146
	b	.LBB0_144
.LBB0_144:
	b	.LBB0_145
.LBB0_145:
	ldr	r0, [sp, #84]
	adds	r0, r0, #1
	str	r0, [sp, #84]
	b	.LBB0_143
.LBB0_146:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #80]
	b	.LBB0_147
.LBB0_147:
	ldr	r0, [sp, #80]
	cmp	r0, #0
	bge	.LBB0_150
	b	.LBB0_148
.LBB0_148:
	b	.LBB0_149
.LBB0_149:
	ldr	r0, [sp, #80]
	adds	r0, r0, #1
	str	r0, [sp, #80]
	b	.LBB0_147
.LBB0_150:
	b	.LBB0_151
.LBB0_151:
	movs	r0, #2
	str	r0, [sp, #76]
	ldr	r0, [sp, #76]
	lsls	r0, r0, #6
	str	r0, [sp, #76]
	ldr	r0, [sp, #76]
	adds	r0, #37
	str	r0, [sp, #76]
	ldr	r0, [sp, #76]
	lsls	r0, r0, #8
	str	r0, [sp, #76]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #76]
	adds	r0, r1, r0
	str	r0, [sp, #76]
	ldr	r0, [sp, #76]
	lsls	r0, r0, #8
	str	r0, [sp, #76]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #76]
	adds	r0, r1, r0
	str	r0, [sp, #76]
	ldr	r0, [sp, #76]
	lsls	r0, r0, #2
	str	r0, [sp, #76]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #76]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #76]
	ldr	r0, [sp, #76]
	str	r0, [sp, #308]
	b	.LBB0_152
.LBB0_152:
	movs	r0, #0
	str	r0, [sp, #72]
	b	.LBB0_153
.LBB0_153:
	ldr	r0, [sp, #72]
	cmp	r0, #2
	bgt	.LBB0_156
	b	.LBB0_154
.LBB0_154:
	b	.LBB0_155
.LBB0_155:
	ldr	r0, [sp, #72]
	adds	r0, r0, #1
	str	r0, [sp, #72]
	b	.LBB0_153
.LBB0_156:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #68]
	b	.LBB0_157
.LBB0_157:
	ldr	r0, [sp, #68]
	cmp	r0, #0
	bge	.LBB0_160
	b	.LBB0_158
.LBB0_158:
	b	.LBB0_159
.LBB0_159:
	ldr	r0, [sp, #68]
	adds	r0, r0, #1
	str	r0, [sp, #68]
	b	.LBB0_157
.LBB0_160:
	b	.LBB0_161
.LBB0_161:
	movs	r0, #2
	str	r0, [sp, #64]
	ldr	r0, [sp, #64]
	lsls	r0, r0, #6
	str	r0, [sp, #64]
	ldr	r0, [sp, #64]
	adds	r0, #18
	str	r0, [sp, #64]
	ldr	r0, [sp, #64]
	lsls	r0, r0, #8
	str	r0, [sp, #64]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #64]
	adds	r0, r1, r0
	str	r0, [sp, #64]
	ldr	r0, [sp, #64]
	lsls	r0, r0, #8
	str	r0, [sp, #64]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #64]
	adds	r0, r1, r0
	str	r0, [sp, #64]
	ldr	r0, [sp, #64]
	lsls	r0, r0, #2
	str	r0, [sp, #64]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #64]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #64]
	ldr	r0, [sp, #64]
	str	r0, [sp, #308]
	b	.LBB0_162
.LBB0_162:
	movs	r0, #0
	str	r0, [sp, #60]
	b	.LBB0_163
.LBB0_163:
	ldr	r0, [sp, #60]
	cmp	r0, #2
	bgt	.LBB0_166
	b	.LBB0_164
.LBB0_164:
	b	.LBB0_165
.LBB0_165:
	ldr	r0, [sp, #60]
	adds	r0, r0, #1
	str	r0, [sp, #60]
	b	.LBB0_163
.LBB0_166:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #56]
	b	.LBB0_167
.LBB0_167:
	ldr	r0, [sp, #56]
	cmp	r0, #0
	bge	.LBB0_170
	b	.LBB0_168
.LBB0_168:
	b	.LBB0_169
.LBB0_169:
	ldr	r0, [sp, #56]
	adds	r0, r0, #1
	str	r0, [sp, #56]
	b	.LBB0_167
.LBB0_170:
	b	.LBB0_171
.LBB0_171:
	movs	r0, #2
	str	r0, [sp, #52]
	ldr	r0, [sp, #52]
	lsls	r0, r0, #6
	str	r0, [sp, #52]
	ldr	r0, [sp, #52]
	adds	r0, r0, #2
	str	r0, [sp, #52]
	ldr	r0, [sp, #52]
	lsls	r0, r0, #8
	str	r0, [sp, #52]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #52]
	adds	r0, r1, r0
	str	r0, [sp, #52]
	ldr	r0, [sp, #52]
	lsls	r0, r0, #8
	str	r0, [sp, #52]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #52]
	adds	r0, r1, r0
	str	r0, [sp, #52]
	ldr	r0, [sp, #52]
	lsls	r0, r0, #2
	str	r0, [sp, #52]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #52]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #52]
	ldr	r0, [sp, #52]
	str	r0, [sp, #308]
	b	.LBB0_172
.LBB0_172:
	movs	r0, #0
	str	r0, [sp, #48]
	b	.LBB0_173
.LBB0_173:
	ldr	r0, [sp, #48]
	cmp	r0, #2
	bgt	.LBB0_176
	b	.LBB0_174
.LBB0_174:
	b	.LBB0_175
.LBB0_175:
	ldr	r0, [sp, #48]
	adds	r0, r0, #1
	str	r0, [sp, #48]
	b	.LBB0_173
.LBB0_176:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #44]
	b	.LBB0_177
.LBB0_177:
	ldr	r0, [sp, #44]
	cmp	r0, #0
	bge	.LBB0_180
	b	.LBB0_178
.LBB0_178:
	b	.LBB0_179
.LBB0_179:
	ldr	r0, [sp, #44]
	adds	r0, r0, #1
	str	r0, [sp, #44]
	b	.LBB0_177
.LBB0_180:
	b	.LBB0_181
.LBB0_181:
	movs	r0, #2
	str	r0, [sp, #40]
	ldr	r0, [sp, #40]
	lsls	r0, r0, #6
	str	r0, [sp, #40]
	ldr	r0, [sp, #40]
	adds	r0, #37
	str	r0, [sp, #40]
	ldr	r0, [sp, #40]
	lsls	r0, r0, #8
	str	r0, [sp, #40]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #40]
	adds	r0, r1, r0
	str	r0, [sp, #40]
	ldr	r0, [sp, #40]
	lsls	r0, r0, #8
	str	r0, [sp, #40]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #40]
	adds	r0, r1, r0
	str	r0, [sp, #40]
	ldr	r0, [sp, #40]
	lsls	r0, r0, #2
	str	r0, [sp, #40]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #40]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #40]
	ldr	r0, [sp, #40]
	str	r0, [sp, #308]
	b	.LBB0_182
.LBB0_182:
	movs	r0, #0
	str	r0, [sp, #36]
	b	.LBB0_183
.LBB0_183:
	ldr	r0, [sp, #36]
	cmp	r0, #2
	bgt	.LBB0_186
	b	.LBB0_184
.LBB0_184:
	b	.LBB0_185
.LBB0_185:
	ldr	r0, [sp, #36]
	adds	r0, r0, #1
	str	r0, [sp, #36]
	b	.LBB0_183
.LBB0_186:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #32]
	b	.LBB0_187
.LBB0_187:
	ldr	r0, [sp, #32]
	cmp	r0, #0
	bge	.LBB0_190
	b	.LBB0_188
.LBB0_188:
	b	.LBB0_189
.LBB0_189:
	ldr	r0, [sp, #32]
	adds	r0, r0, #1
	str	r0, [sp, #32]
	b	.LBB0_187
.LBB0_190:
	b	.LBB0_191
.LBB0_191:
	movs	r0, #2
	str	r0, [sp, #28]
	ldr	r0, [sp, #28]
	lsls	r0, r0, #6
	str	r0, [sp, #28]
	ldr	r0, [sp, #28]
	adds	r0, #18
	str	r0, [sp, #28]
	ldr	r0, [sp, #28]
	lsls	r0, r0, #8
	str	r0, [sp, #28]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #28]
	adds	r0, r1, r0
	str	r0, [sp, #28]
	ldr	r0, [sp, #28]
	lsls	r0, r0, #8
	str	r0, [sp, #28]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #28]
	adds	r0, r1, r0
	str	r0, [sp, #28]
	ldr	r0, [sp, #28]
	lsls	r0, r0, #2
	str	r0, [sp, #28]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #28]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #28]
	ldr	r0, [sp, #28]
	str	r0, [sp, #308]
	b	.LBB0_192
.LBB0_192:
	movs	r0, #0
	str	r0, [sp, #24]
	b	.LBB0_193
.LBB0_193:
	ldr	r0, [sp, #24]
	cmp	r0, #2
	bgt	.LBB0_196
	b	.LBB0_194
.LBB0_194:
	b	.LBB0_195
.LBB0_195:
	ldr	r0, [sp, #24]
	adds	r0, r0, #1
	str	r0, [sp, #24]
	b	.LBB0_193
.LBB0_196:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #20]
	b	.LBB0_197
.LBB0_197:
	ldr	r0, [sp, #20]
	cmp	r0, #0
	bge	.LBB0_200
	b	.LBB0_198
.LBB0_198:
	b	.LBB0_199
.LBB0_199:
	ldr	r0, [sp, #20]
	adds	r0, r0, #1
	str	r0, [sp, #20]
	b	.LBB0_197
.LBB0_200:
	b	.LBB0_201
.LBB0_201:
	movs	r0, #2
	str	r0, [sp, #16]
	ldr	r0, [sp, #16]
	lsls	r0, r0, #6
	str	r0, [sp, #16]
	ldr	r0, [sp, #16]
	adds	r0, #18
	str	r0, [sp, #16]
	ldr	r0, [sp, #16]
	lsls	r0, r0, #8
	str	r0, [sp, #16]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #16]
	adds	r0, r1, r0
	str	r0, [sp, #16]
	ldr	r0, [sp, #16]
	lsls	r0, r0, #8
	str	r0, [sp, #16]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #16]
	adds	r0, r1, r0
	str	r0, [sp, #16]
	ldr	r0, [sp, #16]
	lsls	r0, r0, #2
	str	r0, [sp, #16]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #16]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #16]
	ldr	r0, [sp, #16]
	str	r0, [sp, #308]
	b	.LBB0_202
.LBB0_202:
	movs	r0, #0
	str	r0, [sp, #12]
	b	.LBB0_203
.LBB0_203:
	ldr	r0, [sp, #12]
	cmp	r0, #2
	bgt	.LBB0_206
	b	.LBB0_204
.LBB0_204:
	b	.LBB0_205
.LBB0_205:
	ldr	r0, [sp, #12]
	adds	r0, r0, #1
	str	r0, [sp, #12]
	b	.LBB0_203
.LBB0_206:
	movs	r0, #0
	str	r0, [sp, #308]
	str	r0, [sp, #8]
	b	.LBB0_207
.LBB0_207:
	ldr	r0, [sp, #8]
	cmp	r0, #0
	bge	.LBB0_210
	b	.LBB0_208
.LBB0_208:
	b	.LBB0_209
.LBB0_209:
	ldr	r0, [sp, #8]
	adds	r0, r0, #1
	str	r0, [sp, #8]
	b	.LBB0_207
.LBB0_210:
	b	.LBB0_211
.LBB0_211:
	movs	r0, #2
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	lsls	r0, r0, #6
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	adds	r0, r0, #2
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	lsls	r0, r0, #8
	str	r0, [sp, #4]
	ldr	r0, [sp, #260]
	asrs	r0, r0, #9
	ldr	r1, [sp, #4]
	adds	r0, r1, r0
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	lsls	r0, r0, #8
	str	r0, [sp, #4]
	ldr	r0, [sp, #260]
	lsrs	r0, r0, #1
	movs	r1, #15
	ands	r0, r1
	ldr	r1, [sp, #4]
	adds	r0, r1, r0
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	lsls	r0, r0, #2
	str	r0, [sp, #4]
	ldr	r0, [sp, #260]
	movs	r1, #1
	ands	r0, r1
	lsls	r0, r0, #1
	ldr	r1, [sp, #4]
	adds	r0, r1, r0
	adds	r0, r0, #1
	str	r0, [sp, #4]
	ldr	r0, [sp, #4]
	str	r0, [sp, #308]
	b	.LBB0_212
.LBB0_212:
	movs	r0, #0
	str	r0, [sp]
	b	.LBB0_213
.LBB0_213:
	ldr	r0, [sp]
	cmp	r0, #2
	bgt	.LBB0_216
	b	.LBB0_214
.LBB0_214:
	b	.LBB0_215
.LBB0_215:
	ldr	r0, [sp]
	adds	r0, r0, #1
	str	r0, [sp]
	b	.LBB0_213
.LBB0_216:
	movs	r0, #0
	str	r0, [sp, #308]
	b	.LBB0_217
.LBB0_217:
	b	.LBB0_218
.LBB0_218:
	b	.LBB0_218
.Lfunc_end0:
	.size	run, .Lfunc_end0-run
	.cantunwind
	.fnend


	.ident	"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 6
