	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	pmm_alloc_page
.LFB15 = .
	.file 1 "mm/pmm.c"
	.loc 1 28 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	pmm_alloc_page
	.type	pmm_alloc_page, @function
pmm_alloc_page:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.loc 1 31 0
	lw	$2,%gp_rel(pmm_stack_top)($28)
	li	$3,-1			# 0xffffffffffffffff
	beq	$2,$3,.L3
	addiu	$3,$2,-1

	.loc 1 34 0
	sw	$3,%gp_rel(pmm_stack_top)($28)
	sll	$2,$2,2
	lui	$3,%hi(pmm_stack)
	addiu	$3,$3,%lo(pmm_stack)
	addu	$2,$2,$3
	lw	$2,0($2)
.LVL0 = .
	.loc 1 35 0
	lw	$3,%gp_rel(phy_page_count)($28)
	addiu	$3,$3,-1
	.loc 1 37 0
	jr	$31
	sw	$3,%gp_rel(phy_page_count)($28)

.LVL1 = .
.L3:
	.loc 1 38 0
	jr	$31
	move	$2,$0

	.set	macro
	.set	reorder
	.end	pmm_alloc_page
	.cfi_endproc
.LFE15:
	.size	pmm_alloc_page, .-pmm_alloc_page
	.align	2
	.globl	pmm_free_page
.LFB16 = .
	.loc 1 41 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	pmm_free_page
	.type	pmm_free_page, @function
pmm_free_page:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL2 = .
	.loc 1 44 0
	lw	$2,%gp_rel(pmm_stack_top)($28)
	li	$3,29			# 0x1d
	beq	$2,$3,.L6
	addiu	$2,$2,1

	.loc 1 46 0
	sw	$2,%gp_rel(pmm_stack_top)($28)
	sll	$2,$2,2
	lui	$3,%hi(pmm_stack)
	addiu	$3,$3,%lo(pmm_stack)
	addu	$2,$2,$3
	sw	$4,0($2)
	.loc 1 47 0
	lw	$2,%gp_rel(phy_page_count)($28)
	addiu	$2,$2,1
	sw	$2,%gp_rel(phy_page_count)($28)
.L6:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	pmm_free_page
	.cfi_endproc
.LFE16:
	.size	pmm_free_page, .-pmm_free_page
	.align	2
	.globl	pmm_init
.LFB14 = .
	.loc 1 13 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	pmm_init
	.type	pmm_init, @function
pmm_init:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	.cfi_def_cfa_offset 32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	.cfi_offset 31, -4
	.cfi_offset 17, -8
	.cfi_offset 16, -12
	.loc 1 14 0
	li	$2,-1			# 0xffffffffffffffff
	sw	$2,%gp_rel(phy_page_count)($28)
	.loc 1 15 0
	sw	$2,%gp_rel(pmm_stack_top)($28)
.LVL3 = .
	li	$16,131072			# 0x20000
	addiu	$16,$16,8192
	.loc 1 19 0
	li	$17,196608			# 0x30000
	ori	$17,$17,0xf000
.LVL4 = .
.L8:
	.loc 1 21 0 discriminator 3
	jal	pmm_free_page
	move	$4,$16

.LVL5 = .
	.loc 1 22 0 discriminator 3
	addiu	$16,$16,4096
.LVL6 = .
	.loc 1 23 0 discriminator 3
	lw	$2,%gp_rel(phy_page_count)($28)
	addiu	$2,$2,1
	.loc 1 19 0 discriminator 3
	bne	$16,$17,.L8
	sw	$2,%gp_rel(phy_page_count)($28)

	.loc 1 25 0
	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
.LVL7 = .
	jr	$31
	addiu	$sp,$sp,32

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 17
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	pmm_init
	.cfi_endproc
.LFE14:
	.size	pmm_init, .-pmm_init
	.align	2
	.globl	free_pages_count
.LFB17 = .
	.loc 1 50 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	free_pages_count
	.type	free_pages_count, @function
free_pages_count:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.loc 1 52 0
	lw	$2,%gp_rel(phy_page_count)($28)
	jr	$31
	addiu	$2,$2,1

	.set	macro
	.set	reorder
	.end	free_pages_count
	.cfi_endproc
.LFE17:
	.size	free_pages_count, .-free_pages_count
	.globl	phy_page_count
	.section	.sdata,"aw",@progbits
	.align	2
	.type	phy_page_count, @object
	.size	phy_page_count, 4
phy_page_count:
	.word	-1
	.globl	pmm_stack_top
	.align	2
	.type	pmm_stack_top, @object
	.size	pmm_stack_top, 4
pmm_stack_top:
	.word	-1

	.comm	pmm_stack,120,4
	.text
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\machine\\_default_types.h"
	.file 3 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\stdint.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x196
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0x1
	.4byte	.LASF25
	.4byte	.LASF26
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
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x2
	.byte	0x37
	.4byte	0x68
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
	.byte	0x3
	.byte	0x41
	.4byte	0x5d
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x42
	.4byte	0x6f
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
	.uleb128 0x5
	.4byte	.LASF17
	.byte	0x1
	.byte	0x1b
	.4byte	0x8c
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xdc
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x1
	.byte	0x22
	.4byte	0x8c
	.4byte	.LLST0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x1
	.byte	0x28
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xfd
	.uleb128 0x8
	.ascii	"p\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x8c
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x9
	.4byte	.LASF27
	.byte	0x1
	.byte	0xd
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x141
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x1
	.byte	0x10
	.4byte	0x8c
	.4byte	.LLST1
	.uleb128 0xa
	.ascii	"cnt\000"
	.byte	0x1
	.byte	0x12
	.4byte	0x3a
	.4byte	.LLST2
	.uleb128 0xb
	.4byte	.LVL5
	.4byte	0xdc
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF28
	.byte	0x1
	.byte	0x32
	.4byte	0x8c
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	0x8c
	.4byte	0x166
	.uleb128 0xf
	.4byte	0x97
	.byte	0x1d
	.byte	0
	.uleb128 0x10
	.4byte	.LASF21
	.byte	0x1
	.byte	0x5
	.4byte	0x156
	.uleb128 0x5
	.byte	0x3
	.4byte	pmm_stack
	.uleb128 0x10
	.4byte	.LASF22
	.byte	0x1
	.byte	0x8
	.4byte	0x81
	.uleb128 0x5
	.byte	0x3
	.4byte	pmm_stack_top
	.uleb128 0x10
	.4byte	.LASF23
	.byte	0x1
	.byte	0xb
	.4byte	0x81
	.uleb128 0x5
	.byte	0x3
	.4byte	phy_page_count
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
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
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x4
	.byte	0x41
	.byte	0x3d
	.byte	0x24
	.byte	0x9f
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x2
	.byte	0x30
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
.LASF19:
	.ascii	"page\000"
.LASF8:
	.ascii	"__int32_t\000"
.LASF16:
	.ascii	"float\000"
.LASF27:
	.ascii	"pmm_init\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF28:
	.ascii	"free_pages_count\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF15:
	.ascii	"double\000"
.LASF22:
	.ascii	"pmm_stack_top\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF26:
	.ascii	"C:\\Users\\lzy05\\OneDrive\\18-19-Fall\\SCD\\git\\src\000"
.LASF18:
	.ascii	"pmm_free_page\000"
.LASF24:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF23:
	.ascii	"phy_page_count\000"
.LASF21:
	.ascii	"pmm_stack\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF17:
	.ascii	"pmm_alloc_page\000"
.LASF11:
	.ascii	"int32_t\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF10:
	.ascii	"long long int\000"
.LASF14:
	.ascii	"char\000"
.LASF25:
	.ascii	"mm/pmm.c\000"
.LASF5:
	.ascii	"short int\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF7:
	.ascii	"long int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF20:
	.ascii	"page_addr\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
