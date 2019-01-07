	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	test_pmm
.LFB37 = .
	.file 1 "main.c"
	.loc 1 16 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	test_pmm
	.type	test_pmm, @function
test_pmm:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
	.cfi_offset 16, -8
	.loc 1 22 0
	jal	pmm_init
	sw	$16,16($sp)

.LVL0 = .
	li	$16,35			# 0x23
.LVL1 = .
.L2:
.LBB2 = .
	.loc 1 25 0 discriminator 3
	jal	pmm_alloc_page
	addiu	$16,$16,-1

.LVL2 = .
	.loc 1 26 0 discriminator 3
	jal	writeValTo7SegsHex
	move	$4,$2

.LVL3 = .
	.loc 1 27 0 discriminator 3
	jal	delay
	nop

.LVL4 = .
.LBE2 = .
	.loc 1 24 0 discriminator 3
	bne	$16,$0,.L2
	lw	$31,20($sp)

	.loc 1 34 0
	lw	$16,16($sp)
.LVL5 = .
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	test_pmm
	.cfi_endproc
.LFE37:
	.size	test_pmm, .-test_pmm
	.align	2
	.globl	test_vmm
.LFB38 = .
	.loc 1 36 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	test_vmm
	.type	test_vmm, @function
test_vmm:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
	.loc 1 41 0
	jal	pmm_init
	nop

.LVL6 = .
	.loc 1 43 0
	jal	vmm_init
	nop

.LVL7 = .
	.loc 1 44 0
	move	$4,$0
	jal	kmalloc
	li	$5,32			# 0x20

.LVL8 = .
	.loc 1 57 0
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	test_vmm
	.cfi_endproc
.LFE38:
	.size	test_vmm, .-test_vmm
	.align	2
	.globl	main
.LFB39 = .
	.loc 1 59 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
	.cfi_offset 16, -8
	.loc 1 60 0
	jal	mm_init
	sw	$16,16($sp)

.LVL9 = .
	.loc 1 65 0
	jal	proc_init
	li	$16,1717960704			# 0x66660000

.LVL10 = .
	.loc 1 66 0
	jal	cpu_idle
	addiu	$16,$16,26214

.LVL11 = .
.L8:
	.loc 1 67 0 discriminator 1
	jal	writeValTo7SegsHex
	move	$4,$16

.LVL12 = .
	b	.L8
	nop

	.set	macro
	.set	reorder
	.end	main
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.align	2
	.globl	_mips_handle_exception
.LFB40 = .
	.loc 1 74 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	_mips_handle_exception
	.type	_mips_handle_exception, @function
_mips_handle_exception:
	.frame	$sp,32,$31		# vars= 0, regs= 2/0, args= 24, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
.LVL13 = .
	addiu	$sp,$sp,-32
	.cfi_def_cfa_offset 32
	sw	$31,28($sp)
	sw	$16,24($sp)
	.cfi_offset 31, -4
	.cfi_offset 16, -8
	.loc 1 76 0
	sltu	$2,$5,9
	.set	noreorder
	.set	nomacro
	beq	$2,$0,.L11
	move	$16,$4
	.set	macro
	.set	reorder

	sll	$3,$5,2
	lui	$2,%hi(.L13)
	addiu	$2,$2,%lo(.L13)
	addu	$2,$2,$3
	lw	$2,0($2)
	jr	$2
	.rdata
	.align	2
	.align	2
.L13:
	.word	.L11
	.word	.L12
	.word	.L14
	.word	.L14
	.word	.L15
	.word	.L15
	.word	.L11
	.word	.L11
	.word	.L16
	.text
.L16:
.LBB3 = .
	.loc 1 78 0
	li	$4,286326784			# 0x11110000
.LVL14 = .
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsHex
	addiu	$4,$4,4369
	.set	macro
	.set	reorder

.LVL15 = .
	.loc 1 79 0
	lw	$2,4($16)
	li	$3,1			# 0x1
	.set	noreorder
	.set	nomacro
	bne	$2,$3,.L17
	li	$3,2			# 0x2
	.set	macro
	.set	reorder

.LBB4 = .
	.loc 1 81 0
	lw	$2,%gp_rel(current)($28)
	lw	$3,60($16)
	sw	$3,44($2)
	.loc 1 82 0
	lw	$3,64($16)
	sw	$3,48($2)
	.loc 1 83 0
	lw	$3,68($16)
	sw	$3,52($2)
	.loc 1 84 0
	lw	$3,72($16)
	sw	$3,56($2)
	.loc 1 85 0
	lw	$3,76($16)
	sw	$3,60($2)
	.loc 1 86 0
	lw	$3,80($16)
	sw	$3,64($2)
	.loc 1 87 0
	lw	$3,84($16)
	sw	$3,68($2)
	.loc 1 88 0
	lw	$3,88($16)
	sw	$3,72($2)
	.loc 1 89 0
	lw	$3,112($16)
	sw	$3,76($2)
	.loc 1 90 0
	lw	$3,116($16)
	sw	$3,80($2)
	.loc 1 91 0
	lw	$3,120($16)
	sw	$3,84($2)
	.loc 1 92 0
	lw	$3,124($16)
	.loc 1 94 0
	.set	noreorder
	.set	nomacro
	jal	schedule
	sw	$3,36($2)
	.set	macro
	.set	reorder

.LVL16 = .
	.loc 1 96 0
	lw	$3,40($2)
	sw	$3,12($16)
	.loc 1 97 0
	lw	$3,44($2)
	sw	$3,60($16)
	.loc 1 98 0
	lw	$3,48($2)
	sw	$3,64($16)
	.loc 1 99 0
	lw	$3,52($2)
	sw	$3,68($16)
	.loc 1 100 0
	lw	$3,56($2)
	sw	$3,72($16)
	.loc 1 101 0
	lw	$3,60($2)
	sw	$3,76($16)
	.loc 1 102 0
	lw	$3,64($2)
	sw	$3,80($16)
	.loc 1 103 0
	lw	$3,68($2)
	sw	$3,84($16)
	.loc 1 104 0
	lw	$3,72($2)
	sw	$3,88($16)
	.loc 1 108 0
	lw	$3,80($2)
	sw	$3,116($16)
	.loc 1 109 0
	lw	$3,84($2)
	sw	$3,120($16)
	.loc 1 110 0
	lw	$3,36($2)
	addiu	$3,$3,4
	sw	$3,124($16)
	.loc 1 112 0
	.set	noreorder
	.set	nomacro
	jal	set_current
	move	$4,$2
	.set	macro
	.set	reorder

.LVL17 = .
.LBE4 = .
	.set	noreorder
	.set	nomacro
	b	.L22
	lw	$31,28($sp)
	.set	macro
	.set	reorder

.L17:
	.loc 1 114 0
	.set	noreorder
	.set	nomacro
	bne	$2,$3,.L22
	lw	$31,28($sp)
	.set	macro
	.set	reorder

.LBB5 = .
	.loc 1 115 0
	li	$4,33685504			# 0x2020000
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsHex
	addiu	$4,$4,514
	.set	macro
	.set	reorder

.LVL18 = .
	.loc 1 116 0
	lw	$4,12($16)
	lw	$5,16($16)
	.set	noreorder
	.set	nomacro
	jal	create_proc
	lw	$6,20($16)
	.set	macro
	.set	reorder

.LVL19 = .
	.loc 1 117 0
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsDec
	move	$4,$2
	.set	macro
	.set	reorder

.LVL20 = .
	.loc 1 119 0
	lw	$2,124($16)
	addiu	$2,$2,4
.LBE5 = .
.LBE3 = .
	.set	noreorder
	.set	nomacro
	b	.L10
	sw	$2,124($16)
	.set	macro
	.set	reorder

.LVL21 = .
.L12:
.LBB10 = .
	.loc 1 123 0
	li	$4,33685504			# 0x2020000
.LVL22 = .
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsHex
	addiu	$4,$4,514
	.set	macro
	.set	reorder

.LVL23 = .
	.loc 1 124 0
	.set	noreorder
	.set	nomacro
	b	.L22
	lw	$31,28($sp)
	.set	macro
	.set	reorder

.LVL24 = .
.L15:
	.loc 1 127 0
	li	$4,67371008			# 0x4040000
.LVL25 = .
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsHex
	addiu	$4,$4,1028
	.set	macro
	.set	reorder

.LVL26 = .
	.loc 1 128 0
	.set	noreorder
	.set	nomacro
	b	.L22
	lw	$31,28($sp)
	.set	macro
	.set	reorder

.LVL27 = .
.L14:
	.loc 1 133 0
	li	$4,16842752			# 0x1010000
.LVL28 = .
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsHex
	addiu	$4,$4,257
	.set	macro
	.set	reorder

.LVL29 = .
	.loc 1 137 0
	li	$2,4095			# 0xfff
 #APP
 # 137 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$5,0
ehb
.set pop
 # 0 "" 2
.LVL30 = .
	.loc 1 140 0
 #NO_APP
	lw	$16,128($16)
.LVL31 = .
	srl	$16,$16,12
.LVL32 = .
	.loc 1 145 0
	andi	$2,$16,0x1
	bne	$2,$0,.L19
	.loc 1 146 0
	.set	noreorder
	.set	nomacro
	jal	get_ppn_by_vpn
	move	$4,$16
	.set	macro
	.set	reorder

.LVL33 = .
	.loc 1 147 0
	sll	$2,$2,6
.LVL34 = .
	ori	$2,$2,0x7
 #APP
 # 147 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$2,0
ehb
.set pop
 # 0 "" 2
	.loc 1 148 0
 #NO_APP
	.set	noreorder
	.set	nomacro
	jal	get_ppn_by_vpn
	addiu	$4,$16,1
	.set	macro
	.set	reorder

.LVL35 = .
	.loc 1 149 0
	sll	$2,$2,6
.LVL36 = .
	ori	$2,$2,0x5
 #APP
 # 149 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$3,0
ehb
.set pop
 # 0 "" 2
 #NO_APP
	.set	noreorder
	.set	nomacro
	b	.L23
	sll	$16,$16,12
	.set	macro
	.set	reorder

.LVL37 = .
.L19:
	.loc 1 152 0
	.set	noreorder
	.set	nomacro
	jal	get_ppn_by_vpn
	addiu	$4,$16,-1
	.set	macro
	.set	reorder

.LVL38 = .
	.loc 1 153 0
	sll	$2,$2,6
.LVL39 = .
	ori	$2,$2,0x5
 #APP
 # 153 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$2,0
ehb
.set pop
 # 0 "" 2
	.loc 1 154 0
 #NO_APP
	.set	noreorder
	.set	nomacro
	jal	get_ppn_by_vpn
	move	$4,$16
	.set	macro
	.set	reorder

.LVL40 = .
	.loc 1 155 0
	sll	$2,$2,6
.LVL41 = .
	ori	$2,$2,0x7
 #APP
 # 155 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$3,0
ehb
.set pop
 # 0 "" 2
	.loc 1 159 0
 #NO_APP
	sll	$16,$16,12
.LVL42 = .
.L23:
 #APP
 # 159 "main.c" 1
	.set push 
.set noreorder
mtc0 $16,$10,0
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBB6 = .
	.loc 1 163 0
 #APP
 # 163 "main.c" 1
	mfc0 $4,$10,0
 # 0 "" 2
 #NO_APP
.LBE6 = .
.LBB7 = .
	.loc 1 164 0
 #APP
 # 164 "main.c" 1
	mfc0 $5,$2,0
 # 0 "" 2
 #NO_APP
.LBE7 = .
.LBB8 = .
	.loc 1 165 0
 #APP
 # 165 "main.c" 1
	mfc0 $6,$3,0
 # 0 "" 2
 #NO_APP
.LBE8 = .
.LBB9 = .
	.loc 1 166 0
 #APP
 # 166 "main.c" 1
	mfc0 $7,$5,0
 # 0 "" 2
 #NO_APP
.LBE9 = .
	.loc 1 162 0
	li	$2,1			# 0x1
	.set	noreorder
	.set	nomacro
	jal	mips_tlbwi2
	sw	$2,16($sp)
	.set	macro
	.set	reorder

.LVL43 = .
	.loc 1 181 0
	.set	noreorder
	.set	nomacro
	b	.L22
	lw	$31,28($sp)
	.set	macro
	.set	reorder

.LVL44 = .
.L11:
	.loc 1 183 0
	.set	noreorder
	.set	nomacro
	jal	__exception_handle
	move	$4,$16
	.set	macro
	.set	reorder

.LVL45 = .
.L10:
.LBE10 = .
	.loc 1 186 0
	lw	$31,28($sp)
.L22:
	lw	$16,24($sp)
	.set	noreorder
	.set	nomacro
	jr	$31
	addiu	$sp,$sp,32
	.set	macro
	.set	reorder

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 31
	.end	_mips_handle_exception
	.cfi_endproc
.LFE40:
	.size	_mips_handle_exception, .-_mips_handle_exception

	.comm	pte_p,4,4
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\mips\\m32tlb.h"
	.file 3 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\mips\\m32c0.h"
	.file 4 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\machine\\_default_types.h"
	.file 5 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\stdint.h"
	.file 6 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\mips\\hal.h"
	.file 7 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\lib\\gcc\\mips-mti-elf\\4.9.2\\include\\stddef.h"
	.file 8 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\sys\\types.h"
	.file 9 "./include/types.h"
	.file 10 "./include/task/proc.h"
	.file 11 "./include/mm/vmm.h"
	.file 12 "./include/mm/pmm.h"
	.file 13 "./include/debug.h"
	.file 14 "./include/mm/mm.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x8be
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF88
	.byte	0x1
	.4byte	.LASF89
	.4byte	.LASF90
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF2
	.byte	0x2
	.byte	0x31
	.4byte	0x37
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x32
	.4byte	0x37
	.uleb128 0x4
	.4byte	.LASF4
	.byte	0x3
	.2byte	0x393
	.4byte	0x37
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x4
	.4byte	.LASF6
	.byte	0x3
	.2byte	0x396
	.4byte	0x37
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x4
	.byte	0x37
	.4byte	0x96
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF12
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x4
	.byte	0x38
	.4byte	0x25
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF14
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x4
	.byte	0x4e
	.4byte	0x55
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x5
	.byte	0x41
	.4byte	0x8b
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x5
	.byte	0x42
	.4byte	0x9d
	.uleb128 0x3
	.4byte	.LASF18
	.byte	0x5
	.byte	0x4e
	.4byte	0xaf
	.uleb128 0x6
	.byte	0x7c
	.byte	0x6
	.byte	0xec
	.4byte	0x158
	.uleb128 0x7
	.ascii	"at\000"
	.byte	0x6
	.byte	0xee
	.4byte	0x5c
	.byte	0
	.uleb128 0x7
	.ascii	"v\000"
	.byte	0x6
	.byte	0xef
	.4byte	0x158
	.byte	0x4
	.uleb128 0x7
	.ascii	"a\000"
	.byte	0x6
	.byte	0xf4
	.4byte	0x16f
	.byte	0xc
	.uleb128 0x7
	.ascii	"t\000"
	.byte	0x6
	.byte	0xf5
	.4byte	0x17f
	.byte	0x1c
	.uleb128 0x7
	.ascii	"s\000"
	.byte	0x6
	.byte	0xf7
	.4byte	0x17f
	.byte	0x3c
	.uleb128 0x7
	.ascii	"t2\000"
	.byte	0x6
	.byte	0xf8
	.4byte	0x158
	.byte	0x5c
	.uleb128 0x7
	.ascii	"k\000"
	.byte	0x6
	.byte	0xf9
	.4byte	0x158
	.byte	0x64
	.uleb128 0x7
	.ascii	"gp\000"
	.byte	0x6
	.byte	0xfa
	.4byte	0x5c
	.byte	0x6c
	.uleb128 0x7
	.ascii	"sp\000"
	.byte	0x6
	.byte	0xfb
	.4byte	0x5c
	.byte	0x70
	.uleb128 0x7
	.ascii	"fp\000"
	.byte	0x6
	.byte	0xfc
	.4byte	0x5c
	.byte	0x74
	.uleb128 0x7
	.ascii	"ra\000"
	.byte	0x6
	.byte	0xfd
	.4byte	0x5c
	.byte	0x78
	.byte	0
	.uleb128 0x8
	.4byte	0x5c
	.4byte	0x168
	.uleb128 0x9
	.4byte	0x168
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF19
	.uleb128 0x8
	.4byte	0x5c
	.4byte	0x17f
	.uleb128 0x9
	.4byte	0x168
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.4byte	0x5c
	.4byte	0x18f
	.uleb128 0x9
	.4byte	0x168
	.byte	0x7
	.byte	0
	.uleb128 0xa
	.byte	0x7c
	.byte	0x6
	.byte	0xea
	.4byte	0x1a6
	.uleb128 0xb
	.4byte	0xdb
	.uleb128 0xc
	.ascii	"r\000"
	.byte	0x6
	.byte	0xff
	.4byte	0x1a6
	.byte	0
	.uleb128 0x8
	.4byte	0x5c
	.4byte	0x1b6
	.uleb128 0x9
	.4byte	0x168
	.byte	0x1e
	.byte	0
	.uleb128 0xd
	.4byte	.LASF26
	.byte	0xa0
	.byte	0x6
	.byte	0xe8
	.4byte	0x23c
	.uleb128 0xe
	.4byte	0x18f
	.byte	0
	.uleb128 0xf
	.ascii	"epc\000"
	.byte	0x6
	.2byte	0x102
	.4byte	0x5c
	.byte	0x7c
	.uleb128 0x10
	.4byte	.LASF20
	.byte	0x6
	.2byte	0x103
	.4byte	0x5c
	.byte	0x80
	.uleb128 0xf
	.ascii	"hi\000"
	.byte	0x6
	.2byte	0x104
	.4byte	0x5c
	.byte	0x84
	.uleb128 0xf
	.ascii	"lo\000"
	.byte	0x6
	.2byte	0x105
	.4byte	0x5c
	.byte	0x88
	.uleb128 0x10
	.4byte	.LASF21
	.byte	0x6
	.2byte	0x107
	.4byte	0x263
	.byte	0x8c
	.uleb128 0x10
	.4byte	.LASF22
	.byte	0x6
	.2byte	0x10a
	.4byte	0xc5
	.byte	0x90
	.uleb128 0x10
	.4byte	.LASF23
	.byte	0x6
	.2byte	0x10c
	.4byte	0xc5
	.byte	0x94
	.uleb128 0x10
	.4byte	.LASF24
	.byte	0x6
	.2byte	0x10d
	.4byte	0xc5
	.byte	0x98
	.uleb128 0x10
	.4byte	.LASF25
	.byte	0x6
	.2byte	0x10e
	.4byte	0xc5
	.byte	0x9c
	.byte	0
	.uleb128 0x11
	.4byte	.LASF27
	.byte	0x8
	.byte	0x6
	.2byte	0x111
	.4byte	0x263
	.uleb128 0xf
	.ascii	"id\000"
	.byte	0x6
	.2byte	0x113
	.4byte	0x5c
	.byte	0
	.uleb128 0x10
	.4byte	.LASF28
	.byte	0x6
	.2byte	0x114
	.4byte	0x263
	.byte	0x4
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x23c
	.uleb128 0x8
	.4byte	0x279
	.4byte	0x279
	.uleb128 0x9
	.4byte	0x168
	.byte	0xf
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF29
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF30
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF31
	.uleb128 0x3
	.4byte	.LASF32
	.byte	0x7
	.byte	0xd4
	.4byte	0x25
	.uleb128 0x13
	.byte	0x4
	.uleb128 0x3
	.4byte	.LASF33
	.byte	0x8
	.byte	0xc1
	.4byte	0x68
	.uleb128 0x3
	.4byte	.LASF34
	.byte	0x9
	.byte	0x2f
	.4byte	0xd0
	.uleb128 0xd
	.4byte	.LASF35
	.byte	0x8
	.byte	0x9
	.byte	0x37
	.4byte	0x2d6
	.uleb128 0x14
	.4byte	.LASF28
	.byte	0x9
	.byte	0x38
	.4byte	0x2d6
	.byte	0
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x9
	.byte	0x39
	.4byte	0x2d6
	.byte	0x4
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x2b1
	.uleb128 0xd
	.4byte	.LASF37
	.byte	0x34
	.byte	0xa
	.byte	0x7
	.4byte	0x384
	.uleb128 0x7
	.ascii	"pc\000"
	.byte	0xa
	.byte	0x8
	.4byte	0xc5
	.byte	0
	.uleb128 0x14
	.4byte	.LASF38
	.byte	0xa
	.byte	0x9
	.4byte	0xc5
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF39
	.byte	0xa
	.byte	0xa
	.4byte	0xc5
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF40
	.byte	0xa
	.byte	0xb
	.4byte	0xc5
	.byte	0xc
	.uleb128 0x14
	.4byte	.LASF41
	.byte	0xa
	.byte	0xb
	.4byte	0xc5
	.byte	0x10
	.uleb128 0x14
	.4byte	.LASF42
	.byte	0xa
	.byte	0xb
	.4byte	0xc5
	.byte	0x14
	.uleb128 0x14
	.4byte	.LASF43
	.byte	0xa
	.byte	0xb
	.4byte	0xc5
	.byte	0x18
	.uleb128 0x14
	.4byte	.LASF44
	.byte	0xa
	.byte	0xb
	.4byte	0xc5
	.byte	0x1c
	.uleb128 0x14
	.4byte	.LASF45
	.byte	0xa
	.byte	0xb
	.4byte	0xc5
	.byte	0x20
	.uleb128 0x14
	.4byte	.LASF46
	.byte	0xa
	.byte	0xb
	.4byte	0xc5
	.byte	0x24
	.uleb128 0x14
	.4byte	.LASF47
	.byte	0xa
	.byte	0xc
	.4byte	0xc5
	.byte	0x28
	.uleb128 0x14
	.4byte	.LASF48
	.byte	0xa
	.byte	0xc
	.4byte	0xc5
	.byte	0x2c
	.uleb128 0x14
	.4byte	.LASF49
	.byte	0xa
	.byte	0xc
	.4byte	0xc5
	.byte	0x30
	.byte	0
	.uleb128 0xd
	.4byte	.LASF50
	.byte	0x6c
	.byte	0xa
	.byte	0x1b
	.4byte	0x414
	.uleb128 0x7
	.ascii	"pid\000"
	.byte	0xa
	.byte	0x1d
	.4byte	0x29b
	.byte	0
	.uleb128 0x14
	.4byte	.LASF51
	.byte	0xa
	.byte	0x1f
	.4byte	0xba
	.byte	0x4
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0xa
	.byte	0x20
	.4byte	0xba
	.byte	0x8
	.uleb128 0x14
	.4byte	.LASF53
	.byte	0xa
	.byte	0x21
	.4byte	0x269
	.byte	0xc
	.uleb128 0x14
	.4byte	.LASF54
	.byte	0xa
	.byte	0x22
	.4byte	0xc5
	.byte	0x1c
	.uleb128 0x14
	.4byte	.LASF55
	.byte	0xa
	.byte	0x24
	.4byte	0x414
	.byte	0x20
	.uleb128 0x14
	.4byte	.LASF37
	.byte	0xa
	.byte	0x25
	.4byte	0x2dc
	.byte	0x24
	.uleb128 0x14
	.4byte	.LASF56
	.byte	0xa
	.byte	0x27
	.4byte	0x2b1
	.byte	0x58
	.uleb128 0x7
	.ascii	"fs\000"
	.byte	0xa
	.byte	0x28
	.4byte	0x41f
	.byte	0x60
	.uleb128 0x14
	.4byte	.LASF57
	.byte	0xa
	.byte	0x29
	.4byte	0x42a
	.byte	0x64
	.uleb128 0x14
	.4byte	.LASF58
	.byte	0xa
	.byte	0x2a
	.4byte	0x435
	.byte	0x68
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x384
	.uleb128 0x15
	.4byte	.LASF59
	.uleb128 0x12
	.byte	0x4
	.4byte	0x41a
	.uleb128 0x15
	.4byte	.LASF60
	.uleb128 0x12
	.byte	0x4
	.4byte	0x425
	.uleb128 0x15
	.4byte	.LASF58
	.uleb128 0x12
	.byte	0x4
	.4byte	0x430
	.uleb128 0x16
	.4byte	.LASF62
	.byte	0x1
	.byte	0x10
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x49f
	.uleb128 0x17
	.ascii	"i\000"
	.byte	0x1
	.byte	0x17
	.4byte	0x68
	.4byte	.LLST0
	.uleb128 0x18
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x495
	.uleb128 0x19
	.4byte	.LASF61
	.byte	0x1
	.byte	0x19
	.4byte	0xc5
	.4byte	.LLST1
	.uleb128 0x1a
	.4byte	.LVL2
	.4byte	0x7b4
	.uleb128 0x1a
	.4byte	.LVL3
	.4byte	0x7c5
	.uleb128 0x1a
	.4byte	.LVL4
	.4byte	0x7d6
	.byte	0
	.uleb128 0x1a
	.4byte	.LVL0
	.4byte	0x7e3
	.byte	0
	.uleb128 0x16
	.4byte	.LASF63
	.byte	0x1
	.byte	0x24
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4e7
	.uleb128 0x1b
	.4byte	.LASF72
	.byte	0x1
	.byte	0x2c
	.4byte	0xc5
	.uleb128 0x1a
	.4byte	.LVL6
	.4byte	0x7e3
	.uleb128 0x1a
	.4byte	.LVL7
	.4byte	0x7f0
	.uleb128 0x1c
	.4byte	.LVL8
	.4byte	0x7f7
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF64
	.byte	0x1
	.byte	0x3b
	.4byte	0x68
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x53d
	.uleb128 0x1f
	.4byte	.LASF68
	.byte	0x1
	.byte	0x42
	.4byte	0x68
	.4byte	0x511
	.uleb128 0x20
	.byte	0
	.uleb128 0x1a
	.4byte	.LVL9
	.4byte	0x811
	.uleb128 0x1a
	.4byte	.LVL10
	.4byte	0x818
	.uleb128 0x1a
	.4byte	.LVL11
	.4byte	0x81f
	.uleb128 0x1c
	.4byte	.LVL12
	.4byte	0x7c5
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x21
	.4byte	.LASF65
	.byte	0x6
	.2byte	0x186
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x77f
	.uleb128 0x22
	.ascii	"ctx\000"
	.byte	0x1
	.byte	0x49
	.4byte	0x77f
	.4byte	.LLST2
	.uleb128 0x23
	.4byte	.LASF66
	.byte	0x1
	.byte	0x49
	.4byte	0x68
	.4byte	.LLST3
	.uleb128 0x24
	.4byte	.Ldebug_ranges0+0
	.uleb128 0x19
	.4byte	.LASF20
	.byte	0x1
	.byte	0x8b
	.4byte	0xc5
	.4byte	.LLST4
	.uleb128 0x17
	.ascii	"vpn\000"
	.byte	0x1
	.byte	0x8c
	.4byte	0xc5
	.4byte	.LLST5
	.uleb128 0x17
	.ascii	"ppn\000"
	.byte	0x1
	.byte	0x90
	.4byte	0xc5
	.4byte	.LLST6
	.uleb128 0x18
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x5f4
	.uleb128 0x19
	.4byte	.LASF67
	.byte	0x1
	.byte	0x5e
	.4byte	0x414
	.4byte	.LLST7
	.uleb128 0x1f
	.4byte	.LASF69
	.byte	0x1
	.byte	0x5e
	.4byte	0x68
	.4byte	0x5d0
	.uleb128 0x20
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF70
	.byte	0x1
	.byte	0x70
	.4byte	0x68
	.4byte	0x5e1
	.uleb128 0x20
	.byte	0
	.uleb128 0x1a
	.4byte	.LVL16
	.4byte	0x830
	.uleb128 0x1a
	.4byte	.LVL17
	.4byte	0x841
	.byte	0
	.uleb128 0x18
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0x649
	.uleb128 0x17
	.ascii	"p\000"
	.byte	0x1
	.byte	0x74
	.4byte	0x29b
	.4byte	.LLST8
	.uleb128 0x1f
	.4byte	.LASF71
	.byte	0x1
	.byte	0x74
	.4byte	0x68
	.4byte	0x61f
	.uleb128 0x20
	.byte	0
	.uleb128 0x25
	.4byte	.LVL18
	.4byte	0x7c5
	.4byte	0x636
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x2020202
	.byte	0
	.uleb128 0x1a
	.4byte	.LVL19
	.4byte	0x852
	.uleb128 0x1a
	.4byte	.LVL20
	.4byte	0x863
	.byte	0
	.uleb128 0x18
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.4byte	0x662
	.uleb128 0x26
	.ascii	"__r\000"
	.byte	0x1
	.byte	0xa3
	.4byte	0x25
	.byte	0
	.uleb128 0x18
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.4byte	0x67b
	.uleb128 0x26
	.ascii	"__r\000"
	.byte	0x1
	.byte	0xa4
	.4byte	0x25
	.byte	0
	.uleb128 0x18
	.4byte	.LBB8
	.4byte	.LBE8-.LBB8
	.4byte	0x694
	.uleb128 0x26
	.ascii	"__r\000"
	.byte	0x1
	.byte	0xa5
	.4byte	0x25
	.byte	0
	.uleb128 0x18
	.4byte	.LBB9
	.4byte	.LBE9-.LBB9
	.4byte	0x6ad
	.uleb128 0x26
	.ascii	"__r\000"
	.byte	0x1
	.byte	0xa6
	.4byte	0x25
	.byte	0
	.uleb128 0x25
	.4byte	.LVL15
	.4byte	0x7c5
	.4byte	0x6c4
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x11111111
	.byte	0
	.uleb128 0x25
	.4byte	.LVL23
	.4byte	0x7c5
	.4byte	0x6db
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x2020202
	.byte	0
	.uleb128 0x25
	.4byte	.LVL26
	.4byte	0x7c5
	.4byte	0x6f2
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x4040404
	.byte	0
	.uleb128 0x25
	.4byte	.LVL29
	.4byte	0x7c5
	.4byte	0x709
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x1010101
	.byte	0
	.uleb128 0x25
	.4byte	.LVL33
	.4byte	0x874
	.4byte	0x71d
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.uleb128 0x25
	.4byte	.LVL35
	.4byte	0x874
	.4byte	0x731
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 1
	.byte	0
	.uleb128 0x25
	.4byte	.LVL38
	.4byte	0x874
	.4byte	0x745
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 -1
	.byte	0
	.uleb128 0x25
	.4byte	.LVL40
	.4byte	0x874
	.4byte	0x759
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.uleb128 0x25
	.4byte	.LVL43
	.4byte	0x889
	.4byte	0x76d
	.uleb128 0x1d
	.uleb128 0x2
	.byte	0x8d
	.sleb128 16
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x1c
	.4byte	.LVL45
	.4byte	0x8ae
	.uleb128 0x1d
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x1b6
	.uleb128 0x27
	.4byte	.LASF73
	.byte	0xb
	.byte	0x12
	.4byte	0x796
	.uleb128 0x5
	.byte	0x3
	.4byte	pte_p
	.uleb128 0x12
	.byte	0x4
	.4byte	0x2a6
	.uleb128 0x27
	.4byte	.LASF74
	.byte	0xa
	.byte	0x10
	.4byte	0x414
	.uleb128 0x1
	.byte	0x6c
	.uleb128 0x28
	.4byte	.LASF75
	.byte	0xa
	.byte	0x3c
	.4byte	0x414
	.uleb128 0x1f
	.4byte	.LASF76
	.byte	0xc
	.byte	0x3b
	.4byte	0xc5
	.4byte	0x7c5
	.uleb128 0x20
	.byte	0
	.uleb128 0x29
	.4byte	.LASF77
	.byte	0xd
	.byte	0xe
	.4byte	0x7d6
	.uleb128 0x2a
	.4byte	0x37
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF78
	.byte	0xd
	.byte	0x14
	.4byte	0x7e3
	.uleb128 0x20
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF79
	.byte	0xc
	.byte	0x39
	.4byte	0x7f0
	.uleb128 0x20
	.byte	0
	.uleb128 0x2c
	.4byte	.LASF80
	.byte	0xb
	.byte	0x47
	.uleb128 0x2d
	.4byte	.LASF84
	.byte	0xe
	.byte	0x16
	.4byte	0x299
	.4byte	0x811
	.uleb128 0x2a
	.4byte	0x29b
	.uleb128 0x2a
	.4byte	0x28e
	.byte	0
	.uleb128 0x2c
	.4byte	.LASF81
	.byte	0xe
	.byte	0x14
	.uleb128 0x2c
	.4byte	.LASF82
	.byte	0xa
	.byte	0x3d
	.uleb128 0x1f
	.4byte	.LASF68
	.byte	0x1
	.byte	0x42
	.4byte	0x68
	.4byte	0x830
	.uleb128 0x20
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF69
	.byte	0x1
	.byte	0x5e
	.4byte	0x68
	.4byte	0x841
	.uleb128 0x20
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF70
	.byte	0x1
	.byte	0x70
	.4byte	0x68
	.4byte	0x852
	.uleb128 0x20
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF71
	.byte	0x1
	.byte	0x74
	.4byte	0x68
	.4byte	0x863
	.uleb128 0x20
	.byte	0
	.uleb128 0x29
	.4byte	.LASF83
	.byte	0xd
	.byte	0xc
	.4byte	0x874
	.uleb128 0x2a
	.4byte	0x37
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF85
	.byte	0xb
	.byte	0x60
	.4byte	0xc5
	.4byte	0x889
	.uleb128 0x2a
	.4byte	0xc5
	.byte	0
	.uleb128 0x29
	.4byte	.LASF86
	.byte	0x2
	.byte	0x43
	.4byte	0x8ae
	.uleb128 0x2a
	.4byte	0x2c
	.uleb128 0x2a
	.4byte	0x3e
	.uleb128 0x2a
	.4byte	0x3e
	.uleb128 0x2a
	.4byte	0x37
	.uleb128 0x2a
	.4byte	0x68
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF87
	.byte	0x6
	.2byte	0x188
	.uleb128 0x2a
	.4byte	0x77f
	.uleb128 0x2a
	.4byte	0x68
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
	.uleb128 0x4
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x13
	.byte	0x1
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
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x17
	.byte	0x1
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
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
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
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x17
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
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
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x5
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
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
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x6
	.byte	0x8
	.byte	0x23
	.byte	0x80
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL31-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL45-.Ltext0
	.4byte	.LFE40-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL15-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL15-1-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL23-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL23-1-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL26-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL26-1-.Ltext0
	.4byte	.LVL27-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL29-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL29-1-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL45-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL45-1-.Ltext0
	.4byte	.LFE40-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL30-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x3
	.byte	0x80
	.sleb128 128
	.4byte	.LVL31-.Ltext0
	.4byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL32-.Ltext0
	.4byte	.LVL33-1-.Ltext0
	.2byte	0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x23
	.uleb128 0x80
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL38-1-.Ltext0
	.2byte	0x6
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x23
	.uleb128 0x80
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL32-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL36-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL40-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL17-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-1-.Ltext0
	.2byte	0x1
	.byte	0x52
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
	.4byte	.LBB3-.Ltext0
	.4byte	.LBE3-.Ltext0
	.4byte	.LBB10-.Ltext0
	.4byte	.LBE10-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF70:
	.ascii	"set_current\000"
.LASF32:
	.ascii	"size_t\000"
.LASF18:
	.ascii	"uint64_t\000"
.LASF36:
	.ascii	"prev\000"
.LASF74:
	.ascii	"__current_task\000"
.LASF5:
	.ascii	"long long unsigned int\000"
.LASF28:
	.ascii	"next\000"
.LASF68:
	.ascii	"cpu_idle\000"
.LASF14:
	.ascii	"long long int\000"
.LASF7:
	.ascii	"signed char\000"
.LASF71:
	.ascii	"create_proc\000"
.LASF23:
	.ascii	"cause\000"
.LASF55:
	.ascii	"parent\000"
.LASF52:
	.ascii	"state\000"
.LASF12:
	.ascii	"long int\000"
.LASF79:
	.ascii	"pmm_init\000"
.LASF39:
	.ascii	"reg16\000"
.LASF40:
	.ascii	"reg17\000"
.LASF41:
	.ascii	"reg18\000"
.LASF42:
	.ascii	"reg19\000"
.LASF30:
	.ascii	"double\000"
.LASF27:
	.ascii	"linkctx\000"
.LASF65:
	.ascii	"_mips_handle_exception\000"
.LASF13:
	.ascii	"__uint32_t\000"
.LASF63:
	.ascii	"test_vmm\000"
.LASF21:
	.ascii	"link\000"
.LASF83:
	.ascii	"writeValTo7SegsDec\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF43:
	.ascii	"reg20\000"
.LASF44:
	.ascii	"reg21\000"
.LASF45:
	.ascii	"reg22\000"
.LASF46:
	.ascii	"reg23\000"
.LASF67:
	.ascii	"next_task\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF47:
	.ascii	"reg29\000"
.LASF82:
	.ascii	"proc_init\000"
.LASF69:
	.ascii	"schedule\000"
.LASF53:
	.ascii	"name\000"
.LASF10:
	.ascii	"short unsigned int\000"
.LASF6:
	.ascii	"reg_t\000"
.LASF4:
	.ascii	"reg32_t\000"
.LASF89:
	.ascii	"main.c\000"
.LASF66:
	.ascii	"exception\000"
.LASF90:
	.ascii	"C:\\Users\\lzy05\\OneDrive\\18-19-Fall\\SCD\\git\\src\000"
.LASF77:
	.ascii	"writeValTo7SegsHex\000"
.LASF59:
	.ascii	"fs_struct\000"
.LASF3:
	.ascii	"tlblo_t\000"
.LASF58:
	.ascii	"namespace\000"
.LASF26:
	.ascii	"gpctx\000"
.LASF86:
	.ascii	"mips_tlbwi2\000"
.LASF48:
	.ascii	"reg30\000"
.LASF49:
	.ascii	"reg31\000"
.LASF20:
	.ascii	"badvaddr\000"
.LASF19:
	.ascii	"sizetype\000"
.LASF73:
	.ascii	"pte_p\000"
.LASF34:
	.ascii	"pte_t\000"
.LASF56:
	.ascii	"list_link\000"
.LASF75:
	.ascii	"current\000"
.LASF15:
	.ascii	"__uint64_t\000"
.LASF31:
	.ascii	"float\000"
.LASF54:
	.ascii	"kstack\000"
.LASF16:
	.ascii	"int32_t\000"
.LASF8:
	.ascii	"unsigned char\000"
.LASF78:
	.ascii	"delay\000"
.LASF9:
	.ascii	"short int\000"
.LASF62:
	.ascii	"test_pmm\000"
.LASF85:
	.ascii	"get_ppn_by_vpn\000"
.LASF80:
	.ascii	"vmm_init\000"
.LASF17:
	.ascii	"uint32_t\000"
.LASF29:
	.ascii	"char\000"
.LASF51:
	.ascii	"priority\000"
.LASF87:
	.ascii	"__exception_handle\000"
.LASF35:
	.ascii	"list_head\000"
.LASF11:
	.ascii	"__int32_t\000"
.LASF37:
	.ascii	"context\000"
.LASF61:
	.ascii	"phy_page_addr\000"
.LASF72:
	.ascii	"vmm_page_addr\000"
.LASF60:
	.ascii	"files_struct\000"
.LASF22:
	.ascii	"status\000"
.LASF50:
	.ascii	"task_struct\000"
.LASF88:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF81:
	.ascii	"mm_init\000"
.LASF25:
	.ascii	"badpinstr\000"
.LASF84:
	.ascii	"kmalloc\000"
.LASF76:
	.ascii	"pmm_alloc_page\000"
.LASF33:
	.ascii	"pid_t\000"
.LASF24:
	.ascii	"badinstr\000"
.LASF38:
	.ascii	"args\000"
.LASF64:
	.ascii	"main\000"
.LASF2:
	.ascii	"tlbhi_t\000"
.LASF57:
	.ascii	"files\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
