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
	.loc 1 64 0
	jal	proc_init
	li	$16,1717960704			# 0x66660000

.LVL10 = .
	.loc 1 65 0
	jal	cpu_idle
	addiu	$16,$16,26214

.LVL11 = .
.L8:
	.loc 1 66 0 discriminator 1
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
	.loc 1 73 0
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
	.loc 1 75 0
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
	.loc 1 77 0
	li	$4,286326784			# 0x11110000
.LVL14 = .
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsHex
	addiu	$4,$4,4369
	.set	macro
	.set	reorder

.LVL15 = .
	.loc 1 78 0
	.set	noreorder
	.set	nomacro
	b	.L21
	lw	$31,28($sp)
	.set	macro
	.set	reorder

.LVL16 = .
.L12:
	.loc 1 80 0
	li	$4,33685504			# 0x2020000
.LVL17 = .
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsHex
	addiu	$4,$4,514
	.set	macro
	.set	reorder

.LVL18 = .
	.loc 1 81 0
	.set	noreorder
	.set	nomacro
	b	.L21
	lw	$31,28($sp)
	.set	macro
	.set	reorder

.LVL19 = .
.L15:
	.loc 1 84 0
	li	$4,67371008			# 0x4040000
.LVL20 = .
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsHex
	addiu	$4,$4,1028
	.set	macro
	.set	reorder

.LVL21 = .
	.loc 1 85 0
	.set	noreorder
	.set	nomacro
	b	.L21
	lw	$31,28($sp)
	.set	macro
	.set	reorder

.LVL22 = .
.L14:
	.loc 1 90 0
	li	$4,16842752			# 0x1010000
.LVL23 = .
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsHex
	addiu	$4,$4,257
	.set	macro
	.set	reorder

.LVL24 = .
	.loc 1 94 0
	li	$2,4095			# 0xfff
 #APP
 # 94 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$5,0
ehb
.set pop
 # 0 "" 2
	.loc 1 96 0
 #NO_APP
	lw	$4,128($16)
.LVL25 = .
	.loc 1 98 0
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsHex
	srl	$16,$4,12
	.set	macro
	.set	reorder

.LVL26 = .
	.loc 1 102 0
	andi	$2,$16,0x1
	bne	$2,$0,.L18
	.loc 1 103 0
	.set	noreorder
	.set	nomacro
	jal	get_ppn_by_vpn
	move	$4,$16
	.set	macro
	.set	reorder

.LVL27 = .
	.loc 1 104 0
	sll	$2,$2,6
.LVL28 = .
	ori	$2,$2,0x7
 #APP
 # 104 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$2,0
ehb
.set pop
 # 0 "" 2
	.loc 1 105 0
 #NO_APP
	.set	noreorder
	.set	nomacro
	jal	get_ppn_by_vpn
	addiu	$4,$16,1
	.set	macro
	.set	reorder

.LVL29 = .
	.loc 1 106 0
	sll	$2,$2,6
.LVL30 = .
	ori	$2,$2,0x7
 #APP
 # 106 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$3,0
ehb
.set pop
 # 0 "" 2
 #NO_APP
	.set	noreorder
	.set	nomacro
	b	.L22
	sll	$16,$16,12
	.set	macro
	.set	reorder

.L18:
	.loc 1 109 0
	.set	noreorder
	.set	nomacro
	jal	get_ppn_by_vpn
	addiu	$4,$16,-1
	.set	macro
	.set	reorder

.LVL31 = .
	.loc 1 110 0
	sll	$2,$2,6
.LVL32 = .
	ori	$2,$2,0x7
 #APP
 # 110 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$2,0
ehb
.set pop
 # 0 "" 2
	.loc 1 111 0
 #NO_APP
	.set	noreorder
	.set	nomacro
	jal	get_ppn_by_vpn
	move	$4,$16
	.set	macro
	.set	reorder

.LVL33 = .
	.loc 1 112 0
	sll	$2,$2,6
.LVL34 = .
	ori	$2,$2,0x7
 #APP
 # 112 "main.c" 1
	.set push 
.set noreorder
mtc0 $2,$3,0
ehb
.set pop
 # 0 "" 2
	.loc 1 116 0
 #NO_APP
	sll	$16,$16,12
.LVL35 = .
.L22:
 #APP
 # 116 "main.c" 1
	.set push 
.set noreorder
mtc0 $16,$10,0
ehb
.set pop
 # 0 "" 2
 #NO_APP
.LBB4 = .
	.loc 1 120 0
 #APP
 # 120 "main.c" 1
	mfc0 $4,$10,0
 # 0 "" 2
 #NO_APP
.LBE4 = .
.LBB5 = .
	.loc 1 121 0
 #APP
 # 121 "main.c" 1
	mfc0 $5,$2,0
 # 0 "" 2
 #NO_APP
.LBE5 = .
.LBB6 = .
	.loc 1 122 0
 #APP
 # 122 "main.c" 1
	mfc0 $6,$3,0
 # 0 "" 2
 #NO_APP
.LBE6 = .
.LBB7 = .
	.loc 1 123 0
 #APP
 # 123 "main.c" 1
	mfc0 $7,$5,0
 # 0 "" 2
 #NO_APP
.LBE7 = .
	.loc 1 119 0
	li	$2,1			# 0x1
	.set	noreorder
	.set	nomacro
	jal	mips_tlbwi2
	sw	$2,16($sp)
	.set	macro
	.set	reorder

.LVL36 = .
	.loc 1 138 0
	.set	noreorder
	.set	nomacro
	b	.L21
	lw	$31,28($sp)
	.set	macro
	.set	reorder

.LVL37 = .
.L11:
	.loc 1 140 0
	.set	noreorder
	.set	nomacro
	jal	__exception_handle
	move	$4,$16
	.set	macro
	.set	reorder

.LVL38 = .
.LBE3 = .
	.loc 1 143 0
	lw	$31,28($sp)
.L21:
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
	.4byte	0x7f4
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF85
	.byte	0x1
	.4byte	.LASF86
	.4byte	.LASF87
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
	.uleb128 0x14
	.4byte	.LASF36
	.byte	0x4
	.byte	0x9
	.byte	0x1b
	.4byte	0x2bf
	.uleb128 0x15
	.4byte	.LASF34
	.sleb128 0
	.uleb128 0x15
	.4byte	.LASF35
	.sleb128 1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF36
	.byte	0x9
	.byte	0x1e
	.4byte	0x2a6
	.uleb128 0x3
	.4byte	.LASF37
	.byte	0x9
	.byte	0x2f
	.4byte	0xd0
	.uleb128 0xd
	.4byte	.LASF38
	.byte	0x8
	.byte	0x9
	.byte	0x37
	.4byte	0x2fa
	.uleb128 0x16
	.4byte	.LASF28
	.byte	0x9
	.byte	0x38
	.4byte	0x2fa
	.byte	0
	.uleb128 0x16
	.4byte	.LASF39
	.byte	0x9
	.byte	0x39
	.4byte	0x2fa
	.byte	0x4
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x2d5
	.uleb128 0xd
	.4byte	.LASF40
	.byte	0x2c
	.byte	0xa
	.byte	0x7
	.4byte	0x391
	.uleb128 0x16
	.4byte	.LASF41
	.byte	0xa
	.byte	0x9
	.4byte	0xc5
	.byte	0
	.uleb128 0x16
	.4byte	.LASF42
	.byte	0xa
	.byte	0xa
	.4byte	0xc5
	.byte	0x4
	.uleb128 0x16
	.4byte	.LASF43
	.byte	0xa
	.byte	0xa
	.4byte	0xc5
	.byte	0x8
	.uleb128 0x16
	.4byte	.LASF44
	.byte	0xa
	.byte	0xa
	.4byte	0xc5
	.byte	0xc
	.uleb128 0x16
	.4byte	.LASF45
	.byte	0xa
	.byte	0xa
	.4byte	0xc5
	.byte	0x10
	.uleb128 0x16
	.4byte	.LASF46
	.byte	0xa
	.byte	0xa
	.4byte	0xc5
	.byte	0x14
	.uleb128 0x16
	.4byte	.LASF47
	.byte	0xa
	.byte	0xa
	.4byte	0xc5
	.byte	0x18
	.uleb128 0x16
	.4byte	.LASF48
	.byte	0xa
	.byte	0xa
	.4byte	0xc5
	.byte	0x1c
	.uleb128 0x16
	.4byte	.LASF49
	.byte	0xa
	.byte	0xb
	.4byte	0xc5
	.byte	0x20
	.uleb128 0x16
	.4byte	.LASF50
	.byte	0xa
	.byte	0xb
	.4byte	0xc5
	.byte	0x24
	.uleb128 0x16
	.4byte	.LASF51
	.byte	0xa
	.byte	0xb
	.4byte	0xc5
	.byte	0x28
	.byte	0
	.uleb128 0xd
	.4byte	.LASF52
	.byte	0x68
	.byte	0xa
	.byte	0x1a
	.4byte	0x42d
	.uleb128 0x7
	.ascii	"pid\000"
	.byte	0xa
	.byte	0x1c
	.4byte	0x29b
	.byte	0
	.uleb128 0x16
	.4byte	.LASF53
	.byte	0xa
	.byte	0x1e
	.4byte	0xba
	.byte	0x4
	.uleb128 0x16
	.4byte	.LASF54
	.byte	0xa
	.byte	0x1f
	.4byte	0xba
	.byte	0x8
	.uleb128 0x16
	.4byte	.LASF55
	.byte	0xa
	.byte	0x20
	.4byte	0x269
	.byte	0xc
	.uleb128 0x16
	.4byte	.LASF56
	.byte	0xa
	.byte	0x21
	.4byte	0xc5
	.byte	0x1c
	.uleb128 0x16
	.4byte	.LASF57
	.byte	0xa
	.byte	0x22
	.4byte	0x42d
	.byte	0x20
	.uleb128 0x16
	.4byte	.LASF58
	.byte	0xa
	.byte	0x23
	.4byte	0x432
	.byte	0x24
	.uleb128 0x16
	.4byte	.LASF40
	.byte	0xa
	.byte	0x24
	.4byte	0x300
	.byte	0x28
	.uleb128 0x16
	.4byte	.LASF59
	.byte	0xa
	.byte	0x26
	.4byte	0x2d5
	.byte	0x54
	.uleb128 0x7
	.ascii	"fs\000"
	.byte	0xa
	.byte	0x27
	.4byte	0x43d
	.byte	0x5c
	.uleb128 0x16
	.4byte	.LASF60
	.byte	0xa
	.byte	0x28
	.4byte	0x448
	.byte	0x60
	.uleb128 0x16
	.4byte	.LASF61
	.byte	0xa
	.byte	0x29
	.4byte	0x453
	.byte	0x64
	.byte	0
	.uleb128 0x17
	.4byte	0x2bf
	.uleb128 0x12
	.byte	0x4
	.4byte	0x391
	.uleb128 0x18
	.4byte	.LASF62
	.uleb128 0x12
	.byte	0x4
	.4byte	0x438
	.uleb128 0x18
	.4byte	.LASF63
	.uleb128 0x12
	.byte	0x4
	.4byte	0x443
	.uleb128 0x18
	.4byte	.LASF61
	.uleb128 0x12
	.byte	0x4
	.4byte	0x44e
	.uleb128 0x19
	.4byte	.LASF65
	.byte	0x1
	.byte	0x10
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4bd
	.uleb128 0x1a
	.ascii	"i\000"
	.byte	0x1
	.byte	0x17
	.4byte	0x68
	.4byte	.LLST0
	.uleb128 0x1b
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x4b3
	.uleb128 0x1c
	.4byte	.LASF64
	.byte	0x1
	.byte	0x19
	.4byte	0xc5
	.4byte	.LLST1
	.uleb128 0x1d
	.4byte	.LVL2
	.4byte	0x72e
	.uleb128 0x1d
	.4byte	.LVL3
	.4byte	0x73f
	.uleb128 0x1d
	.4byte	.LVL4
	.4byte	0x750
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL0
	.4byte	0x75d
	.byte	0
	.uleb128 0x19
	.4byte	.LASF66
	.byte	0x1
	.byte	0x24
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x505
	.uleb128 0x1e
	.4byte	.LASF70
	.byte	0x1
	.byte	0x2c
	.4byte	0xc5
	.uleb128 0x1d
	.4byte	.LVL6
	.4byte	0x75d
	.uleb128 0x1d
	.4byte	.LVL7
	.4byte	0x76a
	.uleb128 0x1f
	.4byte	.LVL8
	.4byte	0x771
	.uleb128 0x20
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0x20
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x21
	.4byte	.LASF67
	.byte	0x1
	.byte	0x3b
	.4byte	0x68
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x55b
	.uleb128 0x22
	.4byte	.LASF73
	.byte	0x1
	.byte	0x41
	.4byte	0x68
	.4byte	0x52f
	.uleb128 0x23
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL9
	.4byte	0x78b
	.uleb128 0x1d
	.4byte	.LVL10
	.4byte	0x792
	.uleb128 0x1d
	.4byte	.LVL11
	.4byte	0x799
	.uleb128 0x1f
	.4byte	.LVL12
	.4byte	0x73f
	.uleb128 0x20
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x24
	.4byte	.LASF68
	.byte	0x6
	.2byte	0x186
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x704
	.uleb128 0x25
	.ascii	"ctx\000"
	.byte	0x1
	.byte	0x48
	.4byte	0x704
	.4byte	.LLST2
	.uleb128 0x26
	.4byte	.LASF69
	.byte	0x1
	.byte	0x48
	.4byte	0x68
	.4byte	.LLST3
	.uleb128 0x27
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x1c
	.4byte	.LASF20
	.byte	0x1
	.byte	0x60
	.4byte	0xc5
	.4byte	.LLST4
	.uleb128 0x1a
	.ascii	"vpn\000"
	.byte	0x1
	.byte	0x61
	.4byte	0xc5
	.4byte	.LLST5
	.uleb128 0x1a
	.ascii	"ppn\000"
	.byte	0x1
	.byte	0x65
	.4byte	0xc5
	.4byte	.LLST6
	.uleb128 0x1b
	.4byte	.LBB4
	.4byte	.LBE4-.LBB4
	.4byte	0x5de
	.uleb128 0x28
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x78
	.4byte	0x25
	.byte	0
	.uleb128 0x1b
	.4byte	.LBB5
	.4byte	.LBE5-.LBB5
	.4byte	0x5f7
	.uleb128 0x28
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x79
	.4byte	0x25
	.byte	0
	.uleb128 0x1b
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.4byte	0x610
	.uleb128 0x28
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x7a
	.4byte	0x25
	.byte	0
	.uleb128 0x1b
	.4byte	.LBB7
	.4byte	.LBE7-.LBB7
	.4byte	0x629
	.uleb128 0x28
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x7b
	.4byte	0x25
	.byte	0
	.uleb128 0x29
	.4byte	.LVL15
	.4byte	0x73f
	.4byte	0x640
	.uleb128 0x20
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x11111111
	.byte	0
	.uleb128 0x29
	.4byte	.LVL18
	.4byte	0x73f
	.4byte	0x657
	.uleb128 0x20
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x2020202
	.byte	0
	.uleb128 0x29
	.4byte	.LVL21
	.4byte	0x73f
	.4byte	0x66e
	.uleb128 0x20
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x4040404
	.byte	0
	.uleb128 0x29
	.4byte	.LVL24
	.4byte	0x73f
	.4byte	0x685
	.uleb128 0x20
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x1010101
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL26
	.4byte	0x73f
	.uleb128 0x29
	.4byte	.LVL27
	.4byte	0x7aa
	.4byte	0x6a2
	.uleb128 0x20
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.uleb128 0x29
	.4byte	.LVL29
	.4byte	0x7aa
	.4byte	0x6b6
	.uleb128 0x20
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 1
	.byte	0
	.uleb128 0x29
	.4byte	.LVL31
	.4byte	0x7aa
	.4byte	0x6ca
	.uleb128 0x20
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 -1
	.byte	0
	.uleb128 0x29
	.4byte	.LVL33
	.4byte	0x7aa
	.4byte	0x6de
	.uleb128 0x20
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.uleb128 0x29
	.4byte	.LVL36
	.4byte	0x7bf
	.4byte	0x6f2
	.uleb128 0x20
	.uleb128 0x2
	.byte	0x8d
	.sleb128 16
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL38
	.4byte	0x7e4
	.uleb128 0x20
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
	.uleb128 0x2a
	.4byte	.LASF71
	.byte	0xb
	.byte	0x12
	.4byte	0x71b
	.uleb128 0x5
	.byte	0x3
	.4byte	pte_p
	.uleb128 0x12
	.byte	0x4
	.4byte	0x2ca
	.uleb128 0x2a
	.4byte	.LASF72
	.byte	0xa
	.byte	0xf
	.4byte	0x432
	.uleb128 0x1
	.byte	0x6c
	.uleb128 0x22
	.4byte	.LASF74
	.byte	0xc
	.byte	0x3b
	.4byte	0xc5
	.4byte	0x73f
	.uleb128 0x23
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF75
	.byte	0xd
	.byte	0xe
	.4byte	0x750
	.uleb128 0x2c
	.4byte	0x37
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF76
	.byte	0xd
	.byte	0x14
	.4byte	0x75d
	.uleb128 0x23
	.byte	0
	.uleb128 0x2d
	.4byte	.LASF77
	.byte	0xc
	.byte	0x39
	.4byte	0x76a
	.uleb128 0x23
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF78
	.byte	0xb
	.byte	0x47
	.uleb128 0x2f
	.4byte	.LASF81
	.byte	0xe
	.byte	0x16
	.4byte	0x299
	.4byte	0x78b
	.uleb128 0x2c
	.4byte	0x29b
	.uleb128 0x2c
	.4byte	0x28e
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF79
	.byte	0xe
	.byte	0x14
	.uleb128 0x2e
	.4byte	.LASF80
	.byte	0xa
	.byte	0x3c
	.uleb128 0x22
	.4byte	.LASF73
	.byte	0x1
	.byte	0x41
	.4byte	0x68
	.4byte	0x7aa
	.uleb128 0x23
	.byte	0
	.uleb128 0x2f
	.4byte	.LASF82
	.byte	0xb
	.byte	0x60
	.4byte	0xc5
	.4byte	0x7bf
	.uleb128 0x2c
	.4byte	0xc5
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF83
	.byte	0x2
	.byte	0x43
	.4byte	0x7e4
	.uleb128 0x2c
	.4byte	0x2c
	.uleb128 0x2c
	.4byte	0x3e
	.uleb128 0x2c
	.4byte	0x3e
	.uleb128 0x2c
	.4byte	0x37
	.uleb128 0x2c
	.4byte	0x68
	.byte	0
	.uleb128 0x30
	.4byte	.LASF84
	.byte	0x6
	.2byte	0x188
	.uleb128 0x2c
	.4byte	0x704
	.uleb128 0x2c
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
	.uleb128 0x15
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
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
	.uleb128 0x23
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.4byte	.LVL16-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL38-.Ltext0
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
	.4byte	.LVL16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL18-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL18-1-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL21-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL21-1-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL24-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL24-1-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL38-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL38-1-.Ltext0
	.4byte	.LFE40-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL29-.Ltext0
	.4byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL31-.Ltext0
	.4byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL34-.Ltext0
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
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF32:
	.ascii	"size_t\000"
.LASF18:
	.ascii	"uint64_t\000"
.LASF39:
	.ascii	"prev\000"
.LASF72:
	.ascii	"__current_task\000"
.LASF5:
	.ascii	"long long unsigned int\000"
.LASF28:
	.ascii	"next\000"
.LASF73:
	.ascii	"cpu_idle\000"
.LASF14:
	.ascii	"long long int\000"
.LASF7:
	.ascii	"signed char\000"
.LASF23:
	.ascii	"cause\000"
.LASF58:
	.ascii	"parent\000"
.LASF54:
	.ascii	"state\000"
.LASF12:
	.ascii	"long int\000"
.LASF34:
	.ascii	"false\000"
.LASF77:
	.ascii	"pmm_init\000"
.LASF41:
	.ascii	"reg16\000"
.LASF42:
	.ascii	"reg17\000"
.LASF43:
	.ascii	"reg18\000"
.LASF44:
	.ascii	"reg19\000"
.LASF30:
	.ascii	"double\000"
.LASF27:
	.ascii	"linkctx\000"
.LASF68:
	.ascii	"_mips_handle_exception\000"
.LASF13:
	.ascii	"__uint32_t\000"
.LASF66:
	.ascii	"test_vmm\000"
.LASF21:
	.ascii	"link\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF45:
	.ascii	"reg20\000"
.LASF46:
	.ascii	"reg21\000"
.LASF47:
	.ascii	"reg22\000"
.LASF48:
	.ascii	"reg23\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF49:
	.ascii	"reg29\000"
.LASF80:
	.ascii	"proc_init\000"
.LASF55:
	.ascii	"name\000"
.LASF10:
	.ascii	"short unsigned int\000"
.LASF6:
	.ascii	"reg_t\000"
.LASF4:
	.ascii	"reg32_t\000"
.LASF86:
	.ascii	"main.c\000"
.LASF69:
	.ascii	"exception\000"
.LASF36:
	.ascii	"bool\000"
.LASF57:
	.ascii	"need_resched\000"
.LASF87:
	.ascii	"C:\\Users\\lzy05\\OneDrive\\18-19-Fall\\SCD\\git\\src\000"
.LASF75:
	.ascii	"writeValTo7SegsHex\000"
.LASF62:
	.ascii	"fs_struct\000"
.LASF3:
	.ascii	"tlblo_t\000"
.LASF61:
	.ascii	"namespace\000"
.LASF26:
	.ascii	"gpctx\000"
.LASF83:
	.ascii	"mips_tlbwi2\000"
.LASF50:
	.ascii	"reg30\000"
.LASF51:
	.ascii	"reg31\000"
.LASF20:
	.ascii	"badvaddr\000"
.LASF19:
	.ascii	"sizetype\000"
.LASF71:
	.ascii	"pte_p\000"
.LASF37:
	.ascii	"pte_t\000"
.LASF59:
	.ascii	"list_link\000"
.LASF15:
	.ascii	"__uint64_t\000"
.LASF31:
	.ascii	"float\000"
.LASF56:
	.ascii	"kstack\000"
.LASF16:
	.ascii	"int32_t\000"
.LASF8:
	.ascii	"unsigned char\000"
.LASF76:
	.ascii	"delay\000"
.LASF9:
	.ascii	"short int\000"
.LASF65:
	.ascii	"test_pmm\000"
.LASF82:
	.ascii	"get_ppn_by_vpn\000"
.LASF78:
	.ascii	"vmm_init\000"
.LASF17:
	.ascii	"uint32_t\000"
.LASF29:
	.ascii	"char\000"
.LASF53:
	.ascii	"priority\000"
.LASF84:
	.ascii	"__exception_handle\000"
.LASF38:
	.ascii	"list_head\000"
.LASF11:
	.ascii	"__int32_t\000"
.LASF40:
	.ascii	"context\000"
.LASF64:
	.ascii	"phy_page_addr\000"
.LASF70:
	.ascii	"vmm_page_addr\000"
.LASF63:
	.ascii	"files_struct\000"
.LASF22:
	.ascii	"status\000"
.LASF52:
	.ascii	"task_struct\000"
.LASF85:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF79:
	.ascii	"mm_init\000"
.LASF25:
	.ascii	"badpinstr\000"
.LASF81:
	.ascii	"kmalloc\000"
.LASF74:
	.ascii	"pmm_alloc_page\000"
.LASF33:
	.ascii	"pid_t\000"
.LASF24:
	.ascii	"badinstr\000"
.LASF67:
	.ascii	"main\000"
.LASF2:
	.ascii	"tlbhi_t\000"
.LASF60:
	.ascii	"files\000"
.LASF35:
	.ascii	"true\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
