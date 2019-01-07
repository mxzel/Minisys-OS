	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.rdata
	.align	2
.LC0:
	.word	-2147340608
	.word	-2147340672
	.word	-2147341184
	.word	-2147342336
	.word	-2147343360
	.word	-2147344384
	.word	-2147340288
	.word	-2147336192
	.word	-2147332096
	.word	-2147323904
	.text
	.align	2
	.globl	test_alloc_memory
.LFB14 = .
	.file 1 "mm/mm_test.c"
	.loc 1 8 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	test_alloc_memory
	.type	test_alloc_memory, @function
test_alloc_memory:
	.frame	$sp,128,$31		# vars= 80, regs= 8/0, args= 16, gp= 0
	.mask	0x807f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-128
	.cfi_def_cfa_offset 128
	sw	$31,124($sp)
	sw	$22,120($sp)
	sw	$21,116($sp)
	sw	$20,112($sp)
	sw	$19,108($sp)
	sw	$18,104($sp)
	sw	$17,100($sp)
	sw	$16,96($sp)
	.cfi_offset 31, -4
	.cfi_offset 22, -8
	.cfi_offset 21, -12
	.cfi_offset 20, -16
	.cfi_offset 19, -20
	.cfi_offset 18, -24
	.cfi_offset 17, -28
	.cfi_offset 16, -32
	.loc 1 10 0
	lui	$2,%hi(.LC0)
	lw	$11,%lo(.LC0)($2)
	addiu	$2,$2,%lo(.LC0)
	lw	$10,4($2)
	lw	$9,8($2)
	lw	$8,12($2)
	lw	$7,16($2)
	lw	$6,20($2)
	lw	$5,24($2)
	lw	$4,28($2)
	lw	$3,32($2)
	lw	$2,36($2)
	sw	$11,16($sp)
	sw	$10,20($sp)
	sw	$9,24($sp)
	sw	$8,28($sp)
	sw	$7,32($sp)
	sw	$6,36($sp)
	sw	$5,40($sp)
	sw	$4,44($sp)
	sw	$3,48($sp)
	sw	$2,52($sp)
.LVL0 = .
	move	$2,$0
	.loc 1 15 0
	li	$6,-2147483648			# 0xffffffff80000000
	.loc 1 14 0
	li	$5,40			# 0x28
.LVL1 = .
.L2:
	addiu	$3,$sp,56
	addu	$4,$3,$2
	addiu	$3,$sp,16
	addu	$3,$3,$2
	.loc 1 15 0 discriminator 3
	lw	$3,0($3)
	addu	$3,$3,$6
	addiu	$2,$2,4
	.loc 1 14 0 discriminator 3
	bne	$2,$5,.L2
	sw	$3,0($4)

	lui	$17,%hi(alloc_size)
	addiu	$17,$17,%lo(alloc_size)
	addiu	$18,$sp,56
	.loc 1 14 0 is_stmt 0
	move	$19,$0
	.loc 1 20 0 is_stmt 1
	li	$20,1			# 0x1
	.loc 1 17 0
	li	$21,10			# 0xa
.L6:
.LVL2 = .
	.loc 1 19 0
	lw	$4,%gp_rel(pid)($28)
	jal	kmalloc
	lw	$5,0($17)

.LVL3 = .
	move	$16,$2
	.loc 1 20 0
	jal	get_page_status
	move	$4,$2

.LVL4 = .
	beql	$2,$20,.L3
	lw	$2,0($18)

	.loc 1 23 0
	jal	writeValTo7SegsHex
	li	$4,-1			# 0xffffffffffffffff

.LVL5 = .
	.loc 1 24 0
	b	.L4
	li	$2,1			# 0x1

.L3:
	.loc 1 27 0
	beql	$16,$2,.L5
	addiu	$19,$19,1

	.loc 1 34 0
	jal	writeValTo7SegsHex
	li	$4,-16			# 0xfffffffffffffff0

.LVL6 = .
	.loc 1 35 0
	jal	writeValTo7SegsDec
	move	$4,$19

.LVL7 = .
	.loc 1 36 0
	jal	writeValTo7SegsHex
	move	$4,$16

.LVL8 = .
	.loc 1 37 0
	b	.L4
	li	$2,2			# 0x2

.L5:
.LVL9 = .
	addiu	$17,$17,4
	.loc 1 17 0 discriminator 2
	bne	$19,$21,.L6
	addiu	$18,$18,4

	.loc 1 41 0
	jal	writeValTo7SegsHex
	move	$4,$0

.LVL10 = .
	.loc 1 42 0
	li	$2,3			# 0x3
.L4:
	.loc 1 43 0
	lw	$31,124($sp)
	lw	$22,120($sp)
	lw	$21,116($sp)
	lw	$20,112($sp)
	lw	$19,108($sp)
.LVL11 = .
	lw	$18,104($sp)
	lw	$17,100($sp)
	lw	$16,96($sp)
	jr	$31
	addiu	$sp,$sp,128

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 17
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	test_alloc_memory
	.cfi_endproc
.LFE14:
	.size	test_alloc_memory, .-test_alloc_memory
	.align	2
	.globl	test_rw_memory
.LFB15 = .
	.loc 1 45 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	test_rw_memory
	.type	test_rw_memory, @function
test_rw_memory:
	.frame	$sp,32,$31		# vars= 0, regs= 4/0, args= 16, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	.cfi_def_cfa_offset 32
	sw	$31,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	.cfi_offset 31, -4
	.cfi_offset 18, -8
	.cfi_offset 17, -12
	.cfi_offset 16, -16
	.loc 1 48 0
	move	$4,$0
	jal	kmalloc
	li	$5,128			# 0x80

.LVL12 = .
	move	$18,$2
.LVL13 = .
	.loc 1 49 0
	li	$4,1			# 0x1
	jal	kmalloc
	li	$5,128			# 0x80

.LVL14 = .
	move	$17,$2
.LVL15 = .
	.loc 1 50 0
	li	$4,1			# 0x1
	jal	kmalloc
	li	$5,4096			# 0x1000

.LVL16 = .
	move	$16,$2
.LVL17 = .
	.loc 1 52 0
	jal	writeValTo7SegsHex
	move	$4,$18

.LVL18 = .
	.loc 1 53 0
	jal	writeValTo7SegsHex
	move	$4,$17

.LVL19 = .
	.loc 1 54 0
	jal	writeValTo7SegsHex
	move	$4,$16

.LVL20 = .
	.loc 1 57 0
	li	$16,131072			# 0x20000
.LVL21 = .
	li	$2,123			# 0x7b
	sw	$2,11400($16)
	.loc 1 58 0
	jal	writeValTo7SegsDec
	li	$4,123			# 0x7b

.LVL22 = .
	.loc 1 59 0
	li	$2,456			# 0x1c8
	sw	$2,15496($16)
	.loc 1 60 0
	jal	writeValTo7SegsDec
	li	$4,456			# 0x1c8

.LVL23 = .
	.loc 1 61 0
	li	$2,987			# 0x3db
	sw	$2,20476($16)
	.loc 1 62 0
	jal	writeValTo7SegsDec
	li	$4,987			# 0x3db

.LVL24 = .
	.loc 1 65 0
	li	$2,1			# 0x1
	lw	$31,28($sp)
	lw	$18,24($sp)
.LVL25 = .
	lw	$17,20($sp)
.LVL26 = .
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,32

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 17
	.cfi_restore 18
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	test_rw_memory
	.cfi_endproc
.LFE15:
	.size	test_rw_memory, .-test_rw_memory
	.align	2
	.globl	test_free_memory
.LFB16 = .
	.loc 1 67 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	test_free_memory
	.type	test_free_memory, @function
test_free_memory:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.loc 1 69 0
	jr	$31
	li	$2,1			# 0x1

	.set	macro
	.set	reorder
	.end	test_free_memory
	.cfi_endproc
.LFE16:
	.size	test_free_memory, .-test_free_memory
	.align	2
	.globl	test_global_variable
.LFB17 = .
	.loc 1 71 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	test_global_variable
	.type	test_global_variable, @function
test_global_variable:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.loc 1 73 0
	li	$2,2			# 0x2
	jr	$31
	sw	$2,%gp_rel(index_)($28)

	.set	macro
	.set	reorder
	.end	test_global_variable
	.cfi_endproc
.LFE17:
	.size	test_global_variable, .-test_global_variable
	.globl	index_
	.section	.sbss,"aw",@nobits
	.align	2
	.type	index_, @object
	.size	index_, 4
index_:
	.space	4
	.globl	alloc_size
	.data
	.align	2
	.type	alloc_size, @object
	.size	alloc_size, 40
alloc_size:
	.word	33
	.word	64
	.word	128
	.word	256
	.word	512
	.word	1024
	.word	2048
	.word	4096
	.word	6144
	.word	4096
	.globl	pid
	.section	.sbss
	.align	2
	.type	pid, @object
	.size	pid, 4
pid:
	.space	4

	.comm	pte_p,4,4
	.text
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\machine\\_default_types.h"
	.file 3 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\stdint.h"
	.file 4 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\lib\\gcc\\mips-mti-elf\\4.9.2\\include\\stddef.h"
	.file 5 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\sys\\types.h"
	.file 6 "./include/types.h"
	.file 7 "./include/mm/vmm.h"
	.file 8 "./include/mm/mm.h"
	.file 9 "./include/debug.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x38b
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0x1
	.4byte	.LASF33
	.4byte	.LASF34
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x4
	.4byte	.LASF9
	.byte	0x2
	.byte	0x38
	.4byte	0x25
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x2
	.byte	0x4e
	.4byte	0x33
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x3
	.byte	0x42
	.4byte	0x64
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x4e
	.4byte	0x76
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF15
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF16
	.uleb128 0x4
	.4byte	.LASF17
	.byte	0x4
	.byte	0xd4
	.4byte	0x25
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF18
	.byte	0x5
	.byte	0xc1
	.4byte	0x3a
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x6
	.byte	0x2f
	.4byte	0x8c
	.uleb128 0x6
	.4byte	.LASF22
	.byte	0x1
	.byte	0x8
	.4byte	0x3a
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1a2
	.uleb128 0x7
	.4byte	.LASF35
	.byte	0x1
	.byte	0x9
	.4byte	0x1a2
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x1
	.byte	0xa
	.4byte	0x1b8
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x1
	.byte	0xb
	.4byte	0x1a2
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x9
	.ascii	"i\000"
	.byte	0x1
	.byte	0xd
	.4byte	0x3a
	.4byte	.LLST0
	.uleb128 0xa
	.4byte	.LVL3
	.4byte	0x341
	.uleb128 0xb
	.4byte	.LVL4
	.4byte	0x35b
	.4byte	0x142
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.uleb128 0xb
	.4byte	.LVL5
	.4byte	0x370
	.4byte	0x156
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x9
	.byte	0xff
	.byte	0
	.uleb128 0xb
	.4byte	.LVL6
	.4byte	0x370
	.4byte	0x16a
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x9
	.byte	0xf0
	.byte	0
	.uleb128 0xb
	.4byte	.LVL7
	.4byte	0x381
	.4byte	0x17e
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.byte	0
	.uleb128 0xb
	.4byte	.LVL8
	.4byte	0x370
	.4byte	0x192
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL10
	.4byte	0x370
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0xe
	.4byte	0x1b2
	.4byte	0x1b2
	.uleb128 0xf
	.4byte	0x97
	.byte	0x9
	.byte	0
	.uleb128 0x10
	.byte	0x4
	.4byte	0x3a
	.uleb128 0xe
	.4byte	0x3a
	.4byte	0x1c8
	.uleb128 0xf
	.4byte	0x97
	.byte	0x9
	.byte	0
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x1
	.byte	0x2d
	.4byte	0x3a
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d1
	.uleb128 0x11
	.4byte	.LASF24
	.byte	0x1
	.byte	0x30
	.4byte	0x1b2
	.4byte	.LLST1
	.uleb128 0x11
	.4byte	.LASF25
	.byte	0x1
	.byte	0x31
	.4byte	0x1b2
	.4byte	.LLST2
	.uleb128 0x11
	.4byte	.LASF26
	.byte	0x1
	.byte	0x32
	.4byte	0x1b2
	.4byte	.LLST3
	.uleb128 0xb
	.4byte	.LVL12
	.4byte	0x341
	.4byte	0x227
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x80
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0xb
	.4byte	.LVL14
	.4byte	0x341
	.4byte	0x240
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x80
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0xb
	.4byte	.LVL16
	.4byte	0x341
	.4byte	0x25a
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xa
	.2byte	0x1000
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0xb
	.4byte	.LVL18
	.4byte	0x370
	.4byte	0x26e
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.byte	0
	.uleb128 0xb
	.4byte	.LVL19
	.4byte	0x370
	.4byte	0x282
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x81
	.sleb128 0
	.byte	0
	.uleb128 0xb
	.4byte	.LVL20
	.4byte	0x370
	.4byte	0x296
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.uleb128 0xb
	.4byte	.LVL22
	.4byte	0x381
	.4byte	0x2aa
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x7b
	.byte	0
	.uleb128 0xb
	.4byte	.LVL23
	.4byte	0x381
	.4byte	0x2bf
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.2byte	0x1c8
	.byte	0
	.uleb128 0xd
	.4byte	.LVL24
	.4byte	0x381
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xa
	.2byte	0x3db
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	.LASF36
	.byte	0x1
	.byte	0x43
	.4byte	0x3a
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF37
	.byte	0x1
	.byte	0x47
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF27
	.byte	0x7
	.byte	0x12
	.4byte	0x308
	.uleb128 0x5
	.byte	0x3
	.4byte	pte_p
	.uleb128 0x10
	.byte	0x4
	.4byte	0xcb
	.uleb128 0x15
	.ascii	"pid\000"
	.byte	0x1
	.byte	0x3
	.4byte	0xc0
	.uleb128 0x5
	.byte	0x3
	.4byte	pid
	.uleb128 0x14
	.4byte	.LASF28
	.byte	0x1
	.byte	0x4
	.4byte	0x1b8
	.uleb128 0x5
	.byte	0x3
	.4byte	alloc_size
	.uleb128 0x14
	.4byte	.LASF29
	.byte	0x1
	.byte	0x6
	.4byte	0x3a
	.uleb128 0x5
	.byte	0x3
	.4byte	index_
	.uleb128 0x16
	.4byte	.LASF30
	.byte	0x8
	.byte	0x16
	.4byte	0xbe
	.4byte	0x35b
	.uleb128 0x17
	.4byte	0xc0
	.uleb128 0x17
	.4byte	0xb3
	.byte	0
	.uleb128 0x16
	.4byte	.LASF31
	.byte	0x7
	.byte	0x6f
	.4byte	0x3a
	.4byte	0x370
	.uleb128 0x17
	.4byte	0x81
	.byte	0
	.uleb128 0x18
	.4byte	.LASF38
	.byte	0x9
	.byte	0xe
	.4byte	0x381
	.uleb128 0x17
	.4byte	0x2c
	.byte	0
	.uleb128 0x19
	.4byte	.LASF39
	.byte	0x9
	.byte	0xc
	.uleb128 0x17
	.4byte	0x2c
	.byte	0
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
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x7
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
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x63
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL14-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL14-1-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x62
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL16-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL16-1-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x61
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL18-1-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x60
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
.LASF38:
	.ascii	"writeValTo7SegsHex\000"
.LASF36:
	.ascii	"test_free_memory\000"
.LASF20:
	.ascii	"addr_true_int\000"
.LASF17:
	.ascii	"size_t\000"
.LASF31:
	.ascii	"get_page_status\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF15:
	.ascii	"double\000"
.LASF12:
	.ascii	"uint64_t\000"
.LASF18:
	.ascii	"pid_t\000"
.LASF35:
	.ascii	"addr_alloc\000"
.LASF16:
	.ascii	"float\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF33:
	.ascii	"mm/mm_test.c\000"
.LASF24:
	.ascii	"addr\000"
.LASF30:
	.ascii	"kmalloc\000"
.LASF21:
	.ascii	"addr_true\000"
.LASF29:
	.ascii	"index_\000"
.LASF39:
	.ascii	"writeValTo7SegsDec\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF34:
	.ascii	"C:\\Users\\lzy05\\OneDrive\\18-19-Fall\\SCD\\git\\src\000"
.LASF23:
	.ascii	"test_rw_memory\000"
.LASF32:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF37:
	.ascii	"test_global_variable\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF28:
	.ascii	"alloc_size\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF8:
	.ascii	"long long int\000"
.LASF14:
	.ascii	"char\000"
.LASF5:
	.ascii	"short int\000"
.LASF10:
	.ascii	"__uint64_t\000"
.LASF27:
	.ascii	"pte_p\000"
.LASF11:
	.ascii	"uint32_t\000"
.LASF7:
	.ascii	"long int\000"
.LASF19:
	.ascii	"pte_t\000"
.LASF22:
	.ascii	"test_alloc_memory\000"
.LASF3:
	.ascii	"signed char\000"
.LASF25:
	.ascii	"addr1\000"
.LASF26:
	.ascii	"addr2\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
