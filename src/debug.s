	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	led_red
.LFB3 = .
	.file 1 "debug.c"
	.loc 1 70 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	led_red
	.type	led_red, @function
led_red:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL0 = .
	.loc 1 72 0
	li	$2,-1082130432			# 0xffffffffbf800000
	sw	$4,0($2)
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	led_red
	.cfi_endproc
.LFE3:
	.size	led_red, .-led_red
	.align	2
	.globl	delay
.LFB4 = .
	.loc 1 75 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	delay
	.type	delay, @function
delay:
	.frame	$sp,8,$31		# vars= 8, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	.cfi_def_cfa_offset 8
	.loc 1 77 0
	sw	$0,0($sp)
	lw	$3,0($sp)
	li	$2,6946816			# 0x6a0000
	ori	$2,$2,0xcfc0
	sltu	$2,$3,$2
	beq	$2,$0,.L2
	nop

	.loc 1 77 0 is_stmt 0 discriminator 3
	li	$3,6946816			# 0x6a0000
	ori	$3,$3,0xcfc0
.L5:
	lw	$2,0($sp)
	addiu	$2,$2,1
	sw	$2,0($sp)
	lw	$2,0($sp)
	sltu	$2,$2,$3
	bne	$2,$0,.L5
	nop

.L2:
	.loc 1 78 0 is_stmt 1
	jr	$31
	addiu	$sp,$sp,8

	.cfi_def_cfa_offset 0
	.set	macro
	.set	reorder
	.end	delay
	.cfi_endproc
.LFE4:
	.size	delay, .-delay
	.align	2
	.globl	writeValTo7SegsDec
.LFB0 = .
	.loc 1 5 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	writeValTo7SegsDec
	.type	writeValTo7SegsDec, @function
writeValTo7SegsDec:
	.frame	$sp,40,$31		# vars= 16, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL1 = .
	addiu	$sp,$sp,-40
	.cfi_def_cfa_offset 40
	sw	$31,36($sp)
	.cfi_offset 31, -4
.LVL2 = .
	.loc 1 9 0
	sw	$0,20($sp)
	sw	$0,24($sp)
.LVL3 = .
	.loc 1 10 0
	li	$5,-1082130432			# 0xffffffffbf800000
	addiu	$5,$5,20
	.loc 1 14 0
	li	$7,-859045888			# 0xffffffffcccc0000
	ori	$7,$7,0xcccd
	.loc 1 17 0
	li	$8,1			# 0x1
.LVL4 = .
	.loc 1 14 0 discriminator 2
	multu	$4,$7
.L13:
	mfhi	$6
	srl	$2,$6,3
	sll	$3,$2,1
	sll	$2,$2,3
	addu	$2,$3,$2
	subu	$2,$4,$2
	sw	$2,16($sp)
	.loc 1 15 0 discriminator 2
	lw	$2,16($sp)
	sw	$2,0($5)
	.loc 1 16 0 discriminator 2
	srl	$4,$6,3
.LVL5 = .
	.loc 1 17 0 discriminator 2
	lw	$2,20($sp)
	sll	$2,$8,$2
	sw	$2,28($sp)
	.loc 1 18 0 discriminator 2
	lw	$3,24($sp)
	lw	$2,28($sp)
	or	$2,$2,$3
	sw	$2,24($sp)
	.loc 1 19 0 discriminator 2
	addiu	$5,$5,4
.LVL6 = .
	.loc 1 20 0 discriminator 2
	lw	$2,20($sp)
	addiu	$2,$2,1
	sw	$2,20($sp)
	.loc 1 21 0 discriminator 2
	beq	$4,$0,.L9
	nop

	.loc 1 21 0 is_stmt 0 discriminator 1
	lw	$2,20($sp)
	slt	$2,$2,8
	bne	$2,$0,.L13
	multu	$4,$7

.L9:
	.loc 1 23 0 is_stmt 1
	lw	$2,24($sp)
	nor	$2,$0,$2
	li	$3,-1082130432			# 0xffffffffbf800000
	sw	$2,16($3)
	.loc 1 25 0
	jal	delay
	nop

.LVL7 = .
	.loc 1 27 0
	lw	$31,36($sp)
	jr	$31
	addiu	$sp,$sp,40

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	writeValTo7SegsDec
	.cfi_endproc
.LFE0:
	.size	writeValTo7SegsDec, .-writeValTo7SegsDec
	.align	2
	.globl	writeValTo7SegsHex
.LFB1 = .
	.loc 1 29 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	writeValTo7SegsHex
	.type	writeValTo7SegsHex, @function
writeValTo7SegsHex:
	.frame	$sp,32,$31		# vars= 8, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL8 = .
	addiu	$sp,$sp,-32
	.cfi_def_cfa_offset 32
	sw	$31,28($sp)
	.cfi_offset 31, -4
.LVL9 = .
	.loc 1 42 0
	li	$2,-1082130432			# 0xffffffffbf800000
	sw	$0,16($2)
	.loc 1 44 0
	sw	$4,16($sp)
	.loc 1 46 0
	lw	$3,16($sp)
	sw	$3,20($2)
	.loc 1 47 0
	lw	$3,16($sp)
	srl	$3,$3,4
	sw	$3,16($sp)
	.loc 1 48 0
	lw	$3,16($sp)
	sw	$3,24($2)
	.loc 1 49 0
	lw	$3,16($sp)
	srl	$3,$3,4
	sw	$3,16($sp)
	.loc 1 50 0
	lw	$3,16($sp)
	sw	$3,28($2)
	.loc 1 51 0
	lw	$3,16($sp)
	srl	$3,$3,4
	sw	$3,16($sp)
	.loc 1 52 0
	lw	$3,16($sp)
	sw	$3,32($2)
	.loc 1 53 0
	lw	$3,16($sp)
	srl	$3,$3,4
	sw	$3,16($sp)
	.loc 1 54 0
	lw	$3,16($sp)
	sw	$3,36($2)
	.loc 1 55 0
	lw	$3,16($sp)
	srl	$3,$3,4
	sw	$3,16($sp)
	.loc 1 56 0
	lw	$3,16($sp)
	sw	$3,40($2)
	.loc 1 57 0
	lw	$3,16($sp)
	srl	$3,$3,4
	sw	$3,16($sp)
	.loc 1 58 0
	lw	$3,16($sp)
	sw	$3,44($2)
	.loc 1 59 0
	lw	$3,16($sp)
	srl	$3,$3,4
	sw	$3,16($sp)
	.loc 1 60 0
	lw	$3,16($sp)
	sw	$3,48($2)
	.loc 1 61 0
	lw	$2,16($sp)
	srl	$2,$2,4
	sw	$2,16($sp)
	.loc 1 63 0
	jal	delay
	nop

.LVL10 = .
	.loc 1 64 0
	lw	$31,28($sp)
	jr	$31
	addiu	$sp,$sp,32

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	writeValTo7SegsHex
	.cfi_endproc
.LFE1:
	.size	writeValTo7SegsHex, .-writeValTo7SegsHex
	.align	2
	.globl	writeValTo7SegsHex1
.LFB2 = .
	.loc 1 66 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	writeValTo7SegsHex1
	.type	writeValTo7SegsHex1, @function
writeValTo7SegsHex1:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL11 = .
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
	.loc 1 67 0
	sll	$4,$4,16
.LVL12 = .
	jal	writeValTo7SegsHex
	addu	$4,$4,$5

.LVL13 = .
	.loc 1 68 0
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	writeValTo7SegsHex1
	.cfi_endproc
.LFE2:
	.size	writeValTo7SegsHex1, .-writeValTo7SegsHex1
	.globl	value_global
	.section	.sbss,"aw",@nobits
	.align	2
	.type	value_global, @object
	.size	value_global, 4
value_global:
	.space	4
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x24f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF21
	.byte	0x1
	.4byte	.LASF22
	.4byte	.LASF23
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF2
	.byte	0x1
	.byte	0x46
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x58
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x1
	.byte	0x46
	.4byte	0x58
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.4byte	.LASF0
	.byte	0x1
	.byte	0x47
	.4byte	0x5f
	.sleb128 -1082130432
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x6
	.byte	0x4
	.4byte	0x65
	.uleb128 0x7
	.4byte	0x58
	.uleb128 0x8
	.4byte	.LASF24
	.byte	0x1
	.byte	0x4b
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8c
	.uleb128 0x9
	.ascii	"j\000"
	.byte	0x1
	.byte	0x4c
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.byte	0
	.uleb128 0x7
	.4byte	0x91
	.uleb128 0xa
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x2
	.4byte	.LASF3
	.byte	0x1
	.byte	0x5
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x12a
	.uleb128 0xb
	.ascii	"val\000"
	.byte	0x1
	.byte	0x5
	.4byte	0x91
	.4byte	.LLST0
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x1
	.byte	0x6
	.4byte	0x5f
	.sleb128 -1082130416
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x1
	.byte	0x7
	.4byte	0x5f
	.sleb128 -1082130412
	.uleb128 0xc
	.4byte	.LASF7
	.byte	0x1
	.byte	0x9
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x9
	.ascii	"i\000"
	.byte	0x1
	.byte	0x9
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x9
	.ascii	"en\000"
	.byte	0x1
	.byte	0x9
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xc
	.4byte	.LASF8
	.byte	0x1
	.byte	0x9
	.4byte	0x65
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0xd
	.4byte	.LASF9
	.byte	0x1
	.byte	0xa
	.4byte	0x5f
	.4byte	.LLST1
	.uleb128 0xe
	.4byte	.LVL7
	.4byte	0x6a
	.byte	0
	.uleb128 0x2
	.4byte	.LASF10
	.byte	0x1
	.byte	0x1d
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1f6
	.uleb128 0xb
	.ascii	"val\000"
	.byte	0x1
	.byte	0x1d
	.4byte	0x91
	.4byte	.LLST2
	.uleb128 0x4
	.4byte	.LASF5
	.byte	0x1
	.byte	0x1e
	.4byte	0x5f
	.sleb128 -1082130416
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x1
	.byte	0x1f
	.4byte	0x5f
	.sleb128 -1082130412
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x1
	.byte	0x20
	.4byte	0x5f
	.sleb128 -1082130408
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x1
	.byte	0x21
	.4byte	0x5f
	.sleb128 -1082130404
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x1
	.byte	0x22
	.4byte	0x5f
	.sleb128 -1082130400
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x1
	.byte	0x23
	.4byte	0x5f
	.sleb128 -1082130396
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x1
	.byte	0x24
	.4byte	0x5f
	.sleb128 -1082130392
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x1
	.byte	0x25
	.4byte	0x5f
	.sleb128 -1082130388
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x1
	.byte	0x26
	.4byte	0x5f
	.sleb128 -1082130384
	.uleb128 0xc
	.4byte	.LASF18
	.byte	0x1
	.byte	0x28
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0xe
	.4byte	.LVL10
	.4byte	0x6a
	.byte	0
	.uleb128 0x2
	.4byte	.LASF19
	.byte	0x1
	.byte	0x42
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x241
	.uleb128 0xf
	.4byte	.LASF20
	.byte	0x1
	.byte	0x42
	.4byte	0x91
	.4byte	.LLST3
	.uleb128 0xb
	.ascii	"low\000"
	.byte	0x1
	.byte	0x42
	.4byte	0x91
	.4byte	.LLST4
	.uleb128 0x10
	.4byte	.LVL13
	.4byte	0x12a
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x40
	.byte	0x24
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x22
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF25
	.byte	0x1
	.byte	0x3
	.4byte	0x58
	.uleb128 0x5
	.byte	0x3
	.4byte	value_global
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL7-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x6
	.byte	0x9e
	.uleb128 0x4
	.4byte	0xbf800014
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL7-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL10-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL10-1-.Ltext0
	.4byte	.LFE1-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL12-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL13-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL13-1-.Ltext0
	.4byte	.LFE2-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF3:
	.ascii	"writeValTo7SegsDec\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF2:
	.ascii	"led_red\000"
.LASF15:
	.ascii	"IO_7SEG5\000"
.LASF20:
	.ascii	"high\000"
.LASF16:
	.ascii	"IO_7SEG6\000"
.LASF9:
	.ascii	"addr_7SEG\000"
.LASF0:
	.ascii	"IO_LEDR\000"
.LASF18:
	.ascii	"switches\000"
.LASF19:
	.ascii	"writeValTo7SegsHex1\000"
.LASF21:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF25:
	.ascii	"value_global\000"
.LASF11:
	.ascii	"IO_7SEG1\000"
.LASF10:
	.ascii	"writeValTo7SegsHex\000"
.LASF13:
	.ascii	"IO_7SEG3\000"
.LASF14:
	.ascii	"IO_7SEG4\000"
.LASF23:
	.ascii	"C:\\Users\\lzy05\\OneDrive\\18-19-Fall\\SCD\\git\\src\000"
.LASF6:
	.ascii	"IO_7SEG0\000"
.LASF17:
	.ascii	"IO_7SEG7\000"
.LASF5:
	.ascii	"IO_7SEGEN\000"
.LASF12:
	.ascii	"IO_7SEG2\000"
.LASF22:
	.ascii	"debug.c\000"
.LASF7:
	.ascii	"digit\000"
.LASF4:
	.ascii	"value\000"
.LASF24:
	.ascii	"delay\000"
.LASF8:
	.ascii	"enBit\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
