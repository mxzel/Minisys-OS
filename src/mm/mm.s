	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	addr_to_ptr
.LFB14 = .
	.file 1 "mm/mm.c"
	.loc 1 9 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	addr_to_ptr
	.type	addr_to_ptr, @function
addr_to_ptr:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL0 = .
	.loc 1 11 0
	jr	$31
	move	$2,$4

	.set	macro
	.set	reorder
	.end	addr_to_ptr
	.cfi_endproc
.LFE14:
	.size	addr_to_ptr, .-addr_to_ptr
	.align	2
	.globl	mm_init
.LFB15 = .
	.loc 1 14 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	mm_init
	.type	mm_init, @function
mm_init:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	lui	$2,%hi(page_alloc_addrs)
	addiu	$2,$2,%lo(page_alloc_addrs)
	lui	$3,%hi(page_alloc_counts)
	addiu	$3,$3,%lo(page_alloc_counts)
	lui	$4,%hi(page_alloc_addrs+256)
	addiu	$4,$4,%lo(page_alloc_addrs+256)
.L3:
	.loc 1 16 0 discriminator 3
	sw	$0,0($2)
	.loc 1 17 0 discriminator 3
	sb	$0,0($3)
	addiu	$2,$2,4
	.loc 1 15 0 discriminator 3
	bne	$2,$4,.L3
	addiu	$3,$3,1

	.loc 1 14 0
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
	.loc 1 21 0
	jal	pmm_init
	sw	$0,%gp_rel(idx)($28)

.LVL1 = .
	.loc 1 22 0
	jal	vmm_init
	nop

.LVL2 = .
	.loc 1 23 0
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	mm_init
	.cfi_endproc
.LFE15:
	.size	mm_init, .-mm_init
	.align	2
	.globl	kmalloc
.LFB16 = .
	.loc 1 25 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	kmalloc
	.type	kmalloc, @function
kmalloc:
	.frame	$sp,40,$31		# vars= 0, regs= 6/0, args= 16, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL3 = .
	addiu	$sp,$sp,-40
	.cfi_def_cfa_offset 40
	sw	$31,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	.cfi_offset 31, -4
	.cfi_offset 20, -8
	.cfi_offset 19, -12
	.cfi_offset 18, -16
	.cfi_offset 17, -20
	.cfi_offset 16, -24
	move	$18,$4
	.loc 1 46 0
	sltu	$2,$5,1025
	bne	$2,$0,.L7
	move	$17,$5

.LVL4 = .
.LBB9 = .
	.loc 1 83 0
	sltu	$3,$5,4097
	beq	$3,$0,.L16
	move	$2,$5

	b	.L19
	nop

.LVL5 = .
.L7:
.LBE9 = .
.LBB10 = .
	.loc 1 48 0
	jal	find_block
	nop

.LVL6 = .
	move	$19,$2
.LVL7 = .
	.loc 1 50 0
	bne	$2,$0,.L10
	move	$16,$2

.LBB11 = .
	.loc 1 53 0
	jal	free_pages_count
	nop

.LVL8 = .
	beq	$2,$0,.L21
	move	$2,$16

	.loc 1 61 0
	jal	pmm_alloc_page
	nop

.LVL9 = .
	.loc 1 62 0
	move	$4,$2
	move	$5,$18
	jal	vmm_alloc_page
	li	$6,1			# 0x1

.LVL10 = .
	.loc 1 67 0
	move	$4,$18
	jal	find_block
	move	$5,$17

.LVL11 = .
	move	$19,$2
.LVL12 = .
	.loc 1 71 0
	beq	$2,$0,.L15
	move	$16,$2

	.loc 1 76 0
	jal	alloc_block
	move	$4,$2

.LVL13 = .
.L10:
.LBE11 = .
	.loc 1 79 0
	b	.L15
	move	$16,$19

.LVL14 = .
.L16:
.LBE10 = .
.LBB12 = .
	.loc 1 85 0
	addiu	$2,$2,-4096
.LVL15 = .
.L22:
	.loc 1 83 0
	sltu	$3,$2,4097
	beq	$3,$0,.L22
	addiu	$2,$2,-4096

	addiu	$17,$17,-4097
	srl	$17,$17,12
.LVL16 = .
	.loc 1 91 0
	jal	pmm_alloc_page
	addiu	$20,$17,2

.LVL17 = .
	.loc 1 92 0
	move	$4,$2
	move	$5,$18
	jal	vmm_alloc_page
	move	$6,$0

.LVL18 = .
	move	$19,$2
.LVL19 = .
	.loc 1 98 0
	slt	$2,$20,2
.LVL20 = .
	bne	$2,$0,.L12
	move	$17,$20

	li	$16,1			# 0x1
.LVL21 = .
.L13:
	.loc 1 99 0 discriminator 3
	jal	pmm_alloc_page
	addiu	$16,$16,1

.LVL22 = .
	.loc 1 100 0 discriminator 3
	move	$4,$2
	move	$5,$18
	jal	vmm_alloc_page
	move	$6,$0

.LVL23 = .
	.loc 1 98 0 discriminator 3
	bne	$16,$17,.L13
	nop

.LVL24 = .
.L12:
	.loc 1 108 0
	lw	$2,%gp_rel(idx)($28)
	sll	$4,$2,2
	lui	$3,%hi(page_alloc_addrs)
	addiu	$3,$3,%lo(page_alloc_addrs)
	addu	$3,$4,$3
	sw	$19,0($3)
	.loc 1 109 0
	addiu	$3,$2,1
	sw	$3,%gp_rel(idx)($28)
	lui	$3,%hi(page_alloc_counts)
	addiu	$3,$3,%lo(page_alloc_counts)
	addu	$2,$2,$3
	sb	$20,0($2)
.LVL25 = .
	.loc 1 111 0
	b	.L15
	move	$16,$19

.LVL26 = .
.L19:
	.loc 1 91 0
	jal	pmm_alloc_page
	li	$20,1			# 0x1

.LVL27 = .
	.loc 1 92 0
	move	$4,$2
	move	$5,$18
	jal	vmm_alloc_page
	move	$6,$0

.LVL28 = .
.LBE12 = .
	b	.L12
	move	$19,$2

.LVL29 = .
.L15:
	.loc 1 114 0
	move	$2,$16
.L21:
	lw	$31,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
.LVL30 = .
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,40

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 17
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	kmalloc
	.cfi_endproc
.LFE16:
	.size	kmalloc, .-kmalloc
	.align	2
	.globl	kfree
.LFB17 = .
	.loc 1 116 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	kfree
	.type	kfree, @function
kfree:
	.frame	$sp,40,$31		# vars= 0, regs= 6/0, args= 16, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL31 = .
	addiu	$sp,$sp,-40
	.cfi_def_cfa_offset 40
	sw	$31,36($sp)
	sw	$20,32($sp)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	sw	$16,16($sp)
	.cfi_offset 31, -4
	.cfi_offset 20, -8
	.cfi_offset 19, -12
	.cfi_offset 18, -16
	.cfi_offset 17, -20
	.cfi_offset 16, -24
.LVL32 = .
	.loc 1 122 0
	lw	$5,%gp_rel(idx)($28)
	blez	$5,.L24
	lui	$2,%hi(page_alloc_addrs)

	.loc 1 123 0
	lw	$2,%lo(page_alloc_addrs)($2)
	bne	$4,$2,.L38
	move	$17,$4

	.loc 1 122 0
	b	.L34
	move	$16,$0

.LVL33 = .
.L33:
	.loc 1 123 0
	lw	$3,-4($2)
	bnel	$17,$3,.L41
	addiu	$16,$16,1

	.loc 1 127 0
	b	.L40
	lui	$2,%hi(page_alloc_counts)

.LVL34 = .
.L34:
.LBB13 = .
	lui	$2,%hi(page_alloc_counts)
.L40:
	addiu	$2,$2,%lo(page_alloc_counts)
	addu	$2,$16,$2
	lbu	$20,0($2)
.LVL35 = .
	.loc 1 129 0
	blez	$20,.L42
	addiu	$4,$16,1

	move	$18,$0
.LVL36 = .
.L29:
	.loc 1 131 0 discriminator 3
	jal	get_phy_addr_by_vir_addr
	move	$4,$17

.LVL37 = .
	move	$19,$2
.LVL38 = .
	.loc 1 132 0 discriminator 3
	jal	pmm_free_page
	move	$4,$2

.LVL39 = .
	.loc 1 133 0 discriminator 3
	jal	vmm_free_page
	move	$4,$19

.LVL40 = .
	.loc 1 129 0 discriminator 3
	addiu	$18,$18,1
.LVL41 = .
	bne	$20,$18,.L29
	addiu	$17,$17,4096

.LVL42 = .
	.loc 1 137 0
	addiu	$4,$16,1
.LVL43 = .
.L42:
	.loc 1 138 0
	lw	$6,%gp_rel(idx)($28)
	slt	$2,$4,$6
	beql	$2,$0,.L43
	addiu	$6,$6,-1

	sll	$2,$4,2
	lui	$3,%hi(page_alloc_addrs)
	addiu	$3,$3,%lo(page_alloc_addrs)
	addu	$3,$3,$2
	lui	$2,%hi(page_alloc_counts)
	addiu	$2,$2,%lo(page_alloc_counts)
	addu	$2,$2,$4
.LVL44 = .
.L31:
	.loc 1 139 0
	lw	$5,0($3)
	sw	$5,-4($3)
	.loc 1 140 0
	lbu	$5,0($2)
	sb	$5,-1($2)
.LVL45 = .
	.loc 1 142 0
	addiu	$4,$4,1
.LVL46 = .
	addiu	$3,$3,4
.LVL47 = .
	.loc 1 138 0
	slt	$5,$4,$6
	bne	$5,$0,.L31
	addiu	$2,$2,1

.LVL48 = .
	.loc 1 144 0
	addiu	$6,$6,-1
.L43:
	.loc 1 146 0
	b	.L23
	sw	$6,%gp_rel(idx)($28)

.LVL49 = .
.L38:
	lui	$2,%hi(page_alloc_addrs+4)
	addiu	$2,$2,%lo(page_alloc_addrs+4)
.LBE13 = .
	.loc 1 123 0
	move	$16,$0
.LVL50 = .
	.loc 1 122 0 discriminator 2
	addiu	$16,$16,1
.LVL51 = .
.L41:
	bne	$16,$5,.L33
	addiu	$2,$2,4

.LVL52 = .
.L24:
	.loc 1 151 0
	jal	free_block
	nop

.LVL53 = .
.L23:
	.loc 1 152 0
	lw	$31,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,40

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 17
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	kfree
	.cfi_endproc
.LFE17:
	.size	kfree, .-kfree

	.comm	idx,4,4

	.comm	page_alloc_counts,64,4

	.comm	page_alloc_addrs,256,4

	.comm	pte_p,4,4
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\machine\\_default_types.h"
	.file 3 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\stdint.h"
	.file 4 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\lib\\gcc\\mips-mti-elf\\4.9.2\\include\\stddef.h"
	.file 5 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\sys\\types.h"
	.file 6 "./include/types.h"
	.file 7 "./include/mm/vmm.h"
	.file 8 "./include/mm/pmm.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x4df
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0x1
	.4byte	.LASF50
	.4byte	.LASF51
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
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x2
	.byte	0x1c
	.4byte	0x53
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
	.4byte	.LASF10
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x2
	.byte	0x4e
	.4byte	0x33
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x2a
	.4byte	0x48
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x3
	.byte	0x42
	.4byte	0x6f
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x3
	.byte	0x4e
	.4byte	0x81
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF15
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF16
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF17
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF18
	.uleb128 0x4
	.4byte	.LASF19
	.byte	0x4
	.byte	0xd4
	.4byte	0x25
	.uleb128 0x5
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x5
	.byte	0xc1
	.4byte	0x3a
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x4
	.byte	0x6
	.byte	0x1b
	.4byte	0xfa
	.uleb128 0x7
	.4byte	.LASF21
	.sleb128 0
	.uleb128 0x7
	.4byte	.LASF22
	.sleb128 1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x6
	.byte	0x1e
	.4byte	0xe1
	.uleb128 0x4
	.4byte	.LASF24
	.byte	0x6
	.byte	0x2f
	.4byte	0xa2
	.uleb128 0x8
	.4byte	.LASF39
	.byte	0x1
	.byte	0x9
	.4byte	0xd4
	.byte	0x1
	.4byte	0x12c
	.uleb128 0x9
	.4byte	.LASF52
	.byte	0x1
	.byte	0x9
	.4byte	0x97
	.byte	0
	.uleb128 0xa
	.4byte	0x110
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x147
	.uleb128 0xb
	.4byte	0x120
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x1
	.byte	0xd
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x16f
	.uleb128 0xd
	.4byte	.LVL1
	.4byte	0x424
	.uleb128 0xd
	.4byte	.LVL2
	.4byte	0x431
	.byte	0
	.uleb128 0xe
	.4byte	.LASF53
	.byte	0x1
	.byte	0x19
	.4byte	0xd4
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2e1
	.uleb128 0xf
	.ascii	"pid\000"
	.byte	0x1
	.byte	0x19
	.4byte	0xd6
	.4byte	.LLST0
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x1
	.byte	0x19
	.4byte	0xc9
	.4byte	.LLST1
	.uleb128 0x11
	.4byte	.Ldebug_ranges0+0
	.4byte	0x24c
	.uleb128 0x12
	.4byte	.LASF26
	.byte	0x1
	.byte	0x52
	.4byte	0x3a
	.4byte	.LLST2
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0x1
	.byte	0x5b
	.4byte	0x97
	.4byte	.LLST3
	.uleb128 0x12
	.4byte	.LASF28
	.byte	0x1
	.byte	0x5c
	.4byte	0x97
	.4byte	.LLST4
	.uleb128 0x13
	.ascii	"i\000"
	.byte	0x1
	.byte	0x61
	.4byte	0x3a
	.4byte	.LLST5
	.uleb128 0xd
	.4byte	.LVL17
	.4byte	0x438
	.uleb128 0x14
	.4byte	.LVL18
	.4byte	0x449
	.4byte	0x20b
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL22
	.4byte	0x438
	.uleb128 0x14
	.4byte	.LVL23
	.4byte	0x449
	.4byte	0x22d
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL27
	.4byte	0x438
	.uleb128 0x16
	.4byte	.LVL28
	.4byte	0x449
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.uleb128 0x12
	.4byte	.LASF29
	.byte	0x1
	.byte	0x30
	.4byte	0x97
	.4byte	.LLST6
	.uleb128 0x18
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.4byte	0x2d6
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0x1
	.byte	0x3d
	.4byte	0x97
	.4byte	.LLST7
	.uleb128 0xd
	.4byte	.LVL8
	.4byte	0x468
	.uleb128 0xd
	.4byte	.LVL9
	.4byte	0x438
	.uleb128 0x14
	.4byte	.LVL10
	.4byte	0x449
	.4byte	0x2ab
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL11
	.4byte	0x473
	.4byte	0x2c5
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x81
	.sleb128 0
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x82
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL13
	.4byte	0x48d
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL6
	.4byte	0x473
	.byte	0
	.byte	0
	.uleb128 0xc
	.4byte	.LASF31
	.byte	0x1
	.byte	0x74
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3ba
	.uleb128 0xf
	.ascii	"ptr\000"
	.byte	0x1
	.byte	0x74
	.4byte	0xd4
	.4byte	.LLST8
	.uleb128 0x12
	.4byte	.LASF32
	.byte	0x1
	.byte	0x75
	.4byte	0x97
	.4byte	.LLST9
	.uleb128 0x12
	.4byte	.LASF33
	.byte	0x1
	.byte	0x76
	.4byte	0x97
	.4byte	.LLST10
	.uleb128 0x13
	.ascii	"i\000"
	.byte	0x1
	.byte	0x79
	.4byte	0x3a
	.4byte	.LLST11
	.uleb128 0x18
	.4byte	.LBB13
	.4byte	.LBE13-.LBB13
	.4byte	0x3b0
	.uleb128 0x12
	.4byte	.LASF34
	.byte	0x1
	.byte	0x7d
	.4byte	0x97
	.4byte	.LLST12
	.uleb128 0x12
	.4byte	.LASF35
	.byte	0x1
	.byte	0x7d
	.4byte	0x97
	.4byte	.LLST13
	.uleb128 0x12
	.4byte	.LASF26
	.byte	0x1
	.byte	0x7f
	.4byte	0x3a
	.4byte	.LLST14
	.uleb128 0x13
	.ascii	"j\000"
	.byte	0x1
	.byte	0x80
	.4byte	0x3a
	.4byte	.LLST15
	.uleb128 0x14
	.4byte	.LVL37
	.4byte	0x49e
	.4byte	0x38b
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x81
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.4byte	.LVL39
	.4byte	0x4b3
	.4byte	0x39f
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.4byte	.LVL40
	.4byte	0x4c4
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x83
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL53
	.4byte	0x4d5
	.byte	0
	.uleb128 0x19
	.4byte	.LASF36
	.byte	0x7
	.byte	0x12
	.4byte	0x3cb
	.uleb128 0x5
	.byte	0x3
	.4byte	pte_p
	.uleb128 0x1a
	.byte	0x4
	.4byte	0x105
	.uleb128 0x1b
	.4byte	0x97
	.4byte	0x3e1
	.uleb128 0x1c
	.4byte	0xad
	.byte	0x3f
	.byte	0
	.uleb128 0x19
	.4byte	.LASF37
	.byte	0x1
	.byte	0x4
	.4byte	0x3d1
	.uleb128 0x5
	.byte	0x3
	.4byte	page_alloc_addrs
	.uleb128 0x1b
	.4byte	0x8c
	.4byte	0x402
	.uleb128 0x1c
	.4byte	0xad
	.byte	0x3f
	.byte	0
	.uleb128 0x19
	.4byte	.LASF38
	.byte	0x1
	.byte	0x5
	.4byte	0x3f2
	.uleb128 0x5
	.byte	0x3
	.4byte	page_alloc_counts
	.uleb128 0x1d
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x6
	.4byte	0x3a
	.uleb128 0x5
	.byte	0x3
	.4byte	idx
	.uleb128 0x1e
	.4byte	.LASF47
	.byte	0x8
	.byte	0x39
	.4byte	0x431
	.uleb128 0x1f
	.byte	0
	.uleb128 0x20
	.4byte	.LASF54
	.byte	0x7
	.byte	0x47
	.uleb128 0x21
	.4byte	.LASF42
	.byte	0x8
	.byte	0x3b
	.4byte	0x97
	.4byte	0x449
	.uleb128 0x1f
	.byte	0
	.uleb128 0x22
	.4byte	.LASF40
	.byte	0x7
	.byte	0x75
	.4byte	0x97
	.4byte	0x468
	.uleb128 0x23
	.4byte	0x97
	.uleb128 0x23
	.4byte	0xd6
	.uleb128 0x23
	.4byte	0xfa
	.byte	0
	.uleb128 0x24
	.4byte	.LASF55
	.byte	0x8
	.byte	0x40
	.4byte	0x97
	.uleb128 0x22
	.4byte	.LASF41
	.byte	0x7
	.byte	0x7f
	.4byte	0x97
	.4byte	0x48d
	.uleb128 0x23
	.4byte	0xd6
	.uleb128 0x23
	.4byte	0xc9
	.byte	0
	.uleb128 0x25
	.4byte	.LASF43
	.byte	0x7
	.byte	0x7b
	.4byte	0x49e
	.uleb128 0x23
	.4byte	0x97
	.byte	0
	.uleb128 0x22
	.4byte	.LASF44
	.byte	0x7
	.byte	0x63
	.4byte	0x97
	.4byte	0x4b3
	.uleb128 0x23
	.4byte	0x97
	.byte	0
	.uleb128 0x25
	.4byte	.LASF45
	.byte	0x8
	.byte	0x3d
	.4byte	0x4c4
	.uleb128 0x23
	.4byte	0x97
	.byte	0
	.uleb128 0x25
	.4byte	.LASF46
	.byte	0x7
	.byte	0x76
	.4byte	0x4d5
	.uleb128 0x23
	.4byte	0x97
	.byte	0
	.uleb128 0x26
	.4byte	.LASF48
	.byte	0x7
	.byte	0x7c
	.uleb128 0x23
	.4byte	0x97
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
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
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
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
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
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL6-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL6-1-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL17-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL17-1-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL27-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL27-1-.Ltext0
	.4byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL30-.Ltext0
	.4byte	.LFE16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL6-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL6-1-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x61
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL17-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL27-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL27-1-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x61
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x64
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL18-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL23-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL28-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL8-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL8-1-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL13-1-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL10-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL31-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL49-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	.LVL49-.Ltext0
	.4byte	.LVL53-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL53-1-.Ltext0
	.4byte	.LFE17-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL32-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL49-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	.LVL49-.Ltext0
	.4byte	.LVL53-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL53-1-.Ltext0
	.4byte	.LFE17-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL32-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x7
	.byte	0x74
	.sleb128 0
	.byte	0xb
	.2byte	0xf000
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL49-.Ltext0
	.2byte	0x8
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0xb
	.2byte	0xf000
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL49-.Ltext0
	.4byte	.LVL53-1-.Ltext0
	.2byte	0x7
	.byte	0x74
	.sleb128 0
	.byte	0xb
	.2byte	0xf000
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL53-1-.Ltext0
	.4byte	.LFE17-.Ltext0
	.2byte	0x8
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0xb
	.2byte	0xf000
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL32-.Ltext0
	.4byte	.LVL33-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL43-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0xa
	.byte	0x3
	.4byte	page_alloc_counts
	.byte	0x20
	.byte	0x72
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL45-.Ltext0
	.4byte	.LVL47-.Ltext0
	.2byte	0x9
	.byte	0x72
	.sleb128 0
	.byte	0x3
	.4byte	page_alloc_counts
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL47-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0xa
	.byte	0x3
	.4byte	page_alloc_counts
	.byte	0x20
	.byte	0x72
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL49-.Ltext0
	.4byte	.LVL50-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL50-.Ltext0
	.4byte	.LVL52-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL39-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL39-1-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x63
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL34-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x61
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x64
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL36-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL43-.Ltext0
	.4byte	.LVL49-.Ltext0
	.2byte	0x1
	.byte	0x54
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB9-.Ltext0
	.4byte	.LBE9-.Ltext0
	.4byte	.LBB12-.Ltext0
	.4byte	.LBE12-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF28:
	.ascii	"vir_page_addr\000"
.LASF23:
	.ascii	"bool\000"
.LASF16:
	.ascii	"char\000"
.LASF8:
	.ascii	"__uint8_t\000"
.LASF19:
	.ascii	"size_t\000"
.LASF26:
	.ascii	"count\000"
.LASF30:
	.ascii	"mm_init\000"
.LASF54:
	.ascii	"vmm_init\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF14:
	.ascii	"uint64_t\000"
.LASF20:
	.ascii	"pid_t\000"
.LASF44:
	.ascii	"get_phy_addr_by_vir_addr\000"
.LASF27:
	.ascii	"phy_page_addr\000"
.LASF31:
	.ascii	"kfree\000"
.LASF18:
	.ascii	"float\000"
.LASF22:
	.ascii	"true\000"
.LASF47:
	.ascii	"pmm_init\000"
.LASF25:
	.ascii	"size\000"
.LASF55:
	.ascii	"free_pages_count\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF52:
	.ascii	"addr\000"
.LASF41:
	.ascii	"find_block\000"
.LASF53:
	.ascii	"kmalloc\000"
.LASF43:
	.ascii	"alloc_block\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF17:
	.ascii	"double\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF51:
	.ascii	"C:\\Users\\lzy05\\OneDrive\\18-19-Fall\\SCD\\git\\src\000"
.LASF49:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF35:
	.ascii	"vir_addr\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF12:
	.ascii	"uint8_t\000"
.LASF48:
	.ascii	"free_block\000"
.LASF46:
	.ascii	"vmm_free_page\000"
.LASF50:
	.ascii	"mm/mm.c\000"
.LASF42:
	.ascii	"pmm_alloc_page\000"
.LASF15:
	.ascii	"sizetype\000"
.LASF10:
	.ascii	"long long int\000"
.LASF21:
	.ascii	"false\000"
.LASF45:
	.ascii	"pmm_free_page\000"
.LASF37:
	.ascii	"page_alloc_addrs\000"
.LASF29:
	.ascii	"new_block_addr\000"
.LASF5:
	.ascii	"short int\000"
.LASF11:
	.ascii	"__uint64_t\000"
.LASF39:
	.ascii	"addr_to_ptr\000"
.LASF32:
	.ascii	"ptr_block_addr\000"
.LASF36:
	.ascii	"pte_p\000"
.LASF13:
	.ascii	"uint32_t\000"
.LASF7:
	.ascii	"long int\000"
.LASF34:
	.ascii	"phy_addr\000"
.LASF24:
	.ascii	"pte_t\000"
.LASF3:
	.ascii	"signed char\000"
.LASF33:
	.ascii	"page_addr\000"
.LASF38:
	.ascii	"page_alloc_counts\000"
.LASF40:
	.ascii	"vmm_alloc_page\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
