	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
.LFB42 = .
	.file 1 "process/proc.c"
	.loc 1 87 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	init_main
	.type	init_main, @function
init_main:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL0 = .
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
	.loc 1 90 0
	li	$4,1431633920			# 0x55550000
.LVL1 = .
	jal	writeValTo7SegsHex
	addiu	$4,$4,21845

.LVL2 = .
	.loc 1 91 0
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	init_main
	.cfi_endproc
.LFE42:
	.size	init_main, .-init_main
	.align	2
.LFB37 = .
	.loc 1 19 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	alloc_proc
	.type	alloc_proc, @function
alloc_proc:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL3 = .
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	sw	$16,16($sp)
	.cfi_offset 31, -4
	.cfi_offset 16, -8
	.loc 1 20 0
	jal	kmalloc
	li	$5,104			# 0x68

.LVL4 = .
	.loc 1 23 0
	beq	$2,$0,.L4
	move	$16,$2

	.loc 1 24 0
	li	$2,-1			# 0xffffffffffffffff
.LVL5 = .
	sw	$2,8($16)
	.loc 1 25 0
	sw	$0,32($16)
	.loc 1 26 0
	sw	$0,28($16)
	.loc 1 27 0
	sw	$0,36($16)
	.loc 1 29 0
	addiu	$4,$16,40
	move	$5,$0
	jal	memset
	li	$6,44			# 0x2c

.LVL6 = .
	.loc 1 31 0
	addiu	$4,$16,12
	move	$5,$0
	jal	memset
	li	$6,15			# 0xf

.LVL7 = .
.L4:
	.loc 1 37 0
	move	$2,$16
	lw	$31,20($sp)
	lw	$16,16($sp)
.LVL8 = .
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	alloc_proc
	.cfi_endproc
.LFE37:
	.size	alloc_proc, .-alloc_proc
	.align	2
	.globl	set_proc_name
.LFB38 = .
	.loc 1 42 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	set_proc_name
	.type	set_proc_name, @function
set_proc_name:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL9 = .
	addiu	$sp,$sp,-32
	.cfi_def_cfa_offset 32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	.cfi_offset 31, -4
	.cfi_offset 17, -8
	.cfi_offset 16, -12
	move	$17,$5
	.loc 1 43 0
	addiu	$16,$4,12
	move	$4,$16
.LVL10 = .
	move	$5,$0
.LVL11 = .
	jal	memset
	li	$6,16			# 0x10

.LVL12 = .
	.loc 1 44 0
	move	$4,$16
	move	$5,$17
	jal	memcpy
	li	$6,15			# 0xf

.LVL13 = .
	.loc 1 45 0
	lw	$31,28($sp)
	lw	$17,24($sp)
.LVL14 = .
	lw	$16,20($sp)
.LVL15 = .
	jr	$31
	addiu	$sp,$sp,32

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 17
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	set_proc_name
	.cfi_endproc
.LFE38:
	.size	set_proc_name, .-set_proc_name
	.align	2
	.globl	set_current
.LFB39 = .
	.loc 1 49 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	set_current
	.type	set_current, @function
set_current:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL16 = .
	.loc 1 50 0
	jr	$31
	sw	$4,%gp_rel(current)($28)

	.set	macro
	.set	reorder
	.end	set_current
	.cfi_endproc
.LFE39:
	.size	set_current, .-set_current
	.align	2
	.globl	proc_run
.LFB40 = .
	.loc 1 62 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	proc_run
	.type	proc_run, @function
proc_run:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL17 = .
	addiu	$sp,$sp,-32
	.cfi_def_cfa_offset 32
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	.cfi_offset 31, -4
	.cfi_offset 17, -8
	.cfi_offset 16, -12
	.loc 1 64 0
	lw	$17,%gp_rel(current)($28)
	beq	$4,$17,.L9
	move	$16,$4

.LVL18 = .
.LBB15 = .
.LBB16 = .
.LBB17 = .
	.loc 1 50 0
	sw	$4,%gp_rel(current)($28)
.LVL19 = .
.LBE17 = .
.LBE16 = .
	.loc 1 68 0
	jal	writeValTo7SegsHex
	lw	$4,80($4)

.LVL20 = .
	.loc 1 70 0
	li	$4,343277568			# 0x14760000
	jal	writeValTo7SegsHex
	addiu	$4,$4,26214

.LVL21 = .
	.loc 1 73 0
	jal	writeValTo7SegsHex
	lw	$4,72($16)

.LVL22 = .
	.loc 1 74 0
	addiu	$4,$17,40
	jal	switch_to
	addiu	$5,$16,40

.LVL23 = .
	.loc 1 75 0
	li	$4,123076608			# 0x7560000
	jal	writeValTo7SegsHex
	addiu	$4,$4,26214

.LVL24 = .
.LBB18 = .
.LBB19 = .
	.loc 1 50 0
	sw	$17,%gp_rel(current)($28)
.LVL25 = .
.L9:
.LBE19 = .
.LBE18 = .
.LBE15 = .
	.loc 1 79 0
	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,32

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 17
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	proc_run
	.cfi_endproc
.LFE40:
	.size	proc_run, .-proc_run
	.align	2
	.globl	create_proc
.LFB44 = .
	.loc 1 104 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	create_proc
	.type	create_proc, @function
create_proc:
	.frame	$sp,40,$31		# vars= 0, regs= 6/0, args= 16, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL26 = .
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
	.loc 1 109 0
	lw	$17,%gp_rel(tno)($28)
	addiu	$2,$17,1
	sw	$2,%gp_rel(tno)($28)
.LVL27 = .
	.loc 1 111 0
	lw	$3,%gp_rel(nr_process)($28)
	slt	$3,$3,1025
	beq	$3,$0,.L15
	move	$2,$20

	move	$19,$6
	move	$18,$4
.LVL28 = .
	.loc 1 114 0
	jal	alloc_proc
	move	$4,$17

.LVL29 = .
	.loc 1 116 0
	beq	$2,$0,.L13
	move	$16,$2

	.loc 1 120 0
	lw	$2,%gp_rel(current)($28)
.LVL30 = .
	sw	$2,36($16)
	.loc 1 121 0
	sw	$19,4($16)
	.loc 1 123 0
	sw	$17,0($16)
.LVL31 = .
.LBB26 = .
.LBB27 = .
	.loc 1 83 0
	move	$4,$17
	jal	kmalloc
	li	$5,4096			# 0x1000

.LVL32 = .
	sw	$2,28($16)
.LBE27 = .
.LBE26 = .
	.loc 1 126 0
	sw	$18,80($16)
	.loc 1 127 0
	addiu	$2,$2,4096
	sw	$2,72($16)
	.loc 1 130 0
	addiu	$3,$16,84
.LVL33 = .
.LBB28 = .
.LBB29 = .
	.file 2 "./include/lib/list.h"
	.loc 2 41 0
	addiu	$2,$28,%gp_rel(proc_list)
	lw	$4,0($2)
.LVL34 = .
.LBB30 = .
.LBB31 = .
	.loc 2 33 0
	sw	$3,4($4)
	.loc 2 34 0
	sw	$4,84($16)
	.loc 2 35 0
	sw	$2,88($16)
	.loc 2 36 0
	sw	$3,0($2)
.LBE31 = .
.LBE30 = .
.LBE29 = .
.LBE28 = .
	.loc 1 133 0
	lw	$2,%gp_rel(nr_process)($28)
	addiu	$2,$2,1
	sw	$2,%gp_rel(nr_process)($28)
.LVL35 = .
	.loc 1 134 0
	jal	wakeup_proc
	move	$4,$16

.LVL36 = .
	.loc 1 136 0
	lw	$20,0($16)
.LVL37 = .
.L13:
	.loc 1 140 0
	move	$2,$20
.L15:
	lw	$31,36($sp)
	lw	$20,32($sp)
.LVL38 = .
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
.LVL39 = .
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
	.end	create_proc
	.cfi_endproc
.LFE44:
	.size	create_proc, .-create_proc
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.ascii	"idle\000"
	.text
	.align	2
	.globl	proc_init
.LFB45 = .
	.loc 1 143 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	proc_init
	.type	proc_init, @function
proc_init:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	sw	$16,16($sp)
	.cfi_offset 31, -4
	.cfi_offset 16, -8
.LVL40 = .
.LBB36 = .
.LBB37 = .
	.loc 2 26 0
	addiu	$2,$28,%gp_rel(proc_list)
	sw	$2,0($2)
	.loc 2 27 0
	sw	$2,4($2)
.LBE37 = .
.LBE36 = .
	.loc 1 148 0
	lw	$16,%gp_rel(tno)($28)
	addiu	$2,$16,1
	sw	$2,%gp_rel(tno)($28)
.LVL41 = .
	.loc 1 149 0
	jal	alloc_proc
	move	$4,$16

.LVL42 = .
	sw	$2,%gp_rel(idleproc)($28)
	.loc 1 152 0
	sw	$16,0($2)
	.loc 1 153 0
	lw	$2,%gp_rel(idleproc)($28)
	sw	$0,8($2)
	.loc 1 154 0
	sw	$0,4($2)
	.loc 1 155 0
	li	$3,1			# 0x1
	sw	$3,32($2)
	.loc 1 156 0
	li	$4,-1718026240			# 0xffffffff99990000
	jal	writeValTo7SegsHex
	ori	$4,$4,0x9999

.LVL43 = .
	.loc 1 157 0
	jal	writeValTo7SegsHex
	lw	$4,%gp_rel(idleproc)($28)

.LVL44 = .
	.loc 1 159 0
	lw	$4,%gp_rel(idleproc)($28)
	lui	$5,%hi(.LC0)
	jal	set_proc_name
	addiu	$5,$5,%lo(.LC0)

.LVL45 = .
	.loc 1 160 0
	lw	$2,%gp_rel(nr_process)($28)
	addiu	$2,$2,1
	sw	$2,%gp_rel(nr_process)($28)
	.loc 1 161 0
	lw	$4,%gp_rel(idleproc)($28)
.LVL46 = .
	.loc 1 162 0
	jal	writeValTo7SegsHex
	sw	$4,%gp_rel(current)($28)

.LVL47 = .
	.loc 1 163 0
	li	$4,338034688			# 0x14260000
	jal	writeValTo7SegsHex
	addiu	$4,$4,26214

.LVL48 = .
	.loc 1 164 0
	lui	$4,%hi(init_main)
	addiu	$4,$4,%lo(init_main)
	move	$5,$0
	jal	create_proc
	li	$6,1			# 0x1

.LVL49 = .
	.loc 1 169 0
	jal	writeValTo7SegsHex
	lw	$4,%gp_rel(current)($28)

.LVL50 = .
	.loc 1 170 0
	lw	$2,%gp_rel(current)($28)
	lw	$4,32($2)
	jal	writeValTo7SegsHex
	nop

.LVL51 = .
	.loc 1 172 0
	lw	$31,20($sp)
	lw	$16,16($sp)
.LVL52 = .
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	proc_init
	.cfi_endproc
.LFE45:
	.size	proc_init, .-proc_init
	.align	2
	.globl	cpu_idle
.LFB46 = .
	.loc 1 175 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	cpu_idle
	.type	cpu_idle, @function
cpu_idle:
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
.LBB38 = .
	.loc 1 179 0
	li	$17,286326784			# 0x11110000
	addiu	$17,$17,8806
.LBE38 = .
	.loc 1 182 0
	li	$16,373358592			# 0x16410000
	addiu	$16,$16,8806
	.loc 1 178 0
	lw	$2,%gp_rel(current)($28)
.L22:
	lw	$2,32($2)
	beq	$2,$0,.L19
	nop

.LBB39 = .
	.loc 1 179 0
	jal	writeValTo7SegsHex
	move	$4,$17

.LVL53 = .
	.loc 1 180 0
	jal	schedule
	nop

.LVL54 = .
.L19:
.LBE39 = .
	.loc 1 182 0
	jal	writeValTo7SegsHex
	move	$4,$16

.LVL55 = .
	.loc 1 183 0
	b	.L22
	lw	$2,%gp_rel(current)($28)

	.set	macro
	.set	reorder
	.end	cpu_idle
	.cfi_endproc
.LFE46:
	.size	cpu_idle, .-cpu_idle
	.globl	tno
	.section	.sbss,"aw",@nobits
	.align	2
	.type	tno, @object
	.size	tno, 4
tno:
	.space	4
	.local	nr_process
	.comm	nr_process,4,4
	.globl	current
	.align	2
	.type	current, @object
	.size	current, 4
current:
	.space	4
	.globl	idleproc
	.align	2
	.type	idleproc, @object
	.size	idleproc, 4
idleproc:
	.space	4

	.comm	proc_list,8,4

	.comm	pte_p,4,4
	.text
.Letext0:
	.file 3 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\machine\\_default_types.h"
	.file 4 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\stdint.h"
	.file 5 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\lib\\gcc\\mips-mti-elf\\4.9.2\\include\\stddef.h"
	.file 6 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\sys\\types.h"
	.file 7 "./include/types.h"
	.file 8 "./include/task/proc.h"
	.file 9 "./include/mm/vmm.h"
	.file 10 "./include/debug.h"
	.file 11 "./include/string.h"
	.file 12 "./include/mm/mm.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x945
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF83
	.byte	0x1
	.4byte	.LASF84
	.4byte	.LASF85
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
	.4byte	.LASF7
	.byte	0x3
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
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x3
	.byte	0x37
	.4byte	0x73
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x4
	.4byte	.LASF10
	.byte	0x3
	.byte	0x38
	.4byte	0x25
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x4e
	.4byte	0x33
	.uleb128 0x4
	.4byte	.LASF13
	.byte	0x4
	.byte	0x2a
	.4byte	0x48
	.uleb128 0x4
	.4byte	.LASF14
	.byte	0x4
	.byte	0x41
	.4byte	0x68
	.uleb128 0x4
	.4byte	.LASF15
	.byte	0x4
	.byte	0x42
	.4byte	0x7a
	.uleb128 0x4
	.4byte	.LASF16
	.byte	0x4
	.byte	0x4e
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF17
	.uleb128 0x5
	.4byte	0xda
	.4byte	0xda
	.uleb128 0x6
	.4byte	0xc3
	.byte	0xf
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF18
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF19
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF20
	.uleb128 0x4
	.4byte	.LASF21
	.byte	0x5
	.byte	0xd4
	.4byte	0x25
	.uleb128 0x7
	.byte	0x4
	.uleb128 0x8
	.byte	0x4
	.4byte	0x102
	.uleb128 0x9
	.4byte	0xda
	.uleb128 0x4
	.4byte	.LASF22
	.byte	0x6
	.byte	0xc1
	.4byte	0x3a
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x4
	.byte	0x7
	.byte	0x1b
	.4byte	0x12b
	.uleb128 0xb
	.4byte	.LASF23
	.sleb128 0
	.uleb128 0xb
	.4byte	.LASF24
	.sleb128 1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF25
	.byte	0x7
	.byte	0x1e
	.4byte	0x112
	.uleb128 0x4
	.4byte	.LASF26
	.byte	0x7
	.byte	0x2f
	.4byte	0xb8
	.uleb128 0xc
	.4byte	.LASF29
	.byte	0x8
	.byte	0x7
	.byte	0x37
	.4byte	0x166
	.uleb128 0xd
	.4byte	.LASF27
	.byte	0x7
	.byte	0x38
	.4byte	0x166
	.byte	0
	.uleb128 0xd
	.4byte	.LASF28
	.byte	0x7
	.byte	0x39
	.4byte	0x166
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x141
	.uleb128 0xc
	.4byte	.LASF30
	.byte	0x2c
	.byte	0x8
	.byte	0x7
	.4byte	0x1fd
	.uleb128 0xd
	.4byte	.LASF31
	.byte	0x8
	.byte	0x9
	.4byte	0xad
	.byte	0
	.uleb128 0xd
	.4byte	.LASF32
	.byte	0x8
	.byte	0xa
	.4byte	0xad
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF33
	.byte	0x8
	.byte	0xa
	.4byte	0xad
	.byte	0x8
	.uleb128 0xd
	.4byte	.LASF34
	.byte	0x8
	.byte	0xa
	.4byte	0xad
	.byte	0xc
	.uleb128 0xd
	.4byte	.LASF35
	.byte	0x8
	.byte	0xa
	.4byte	0xad
	.byte	0x10
	.uleb128 0xd
	.4byte	.LASF36
	.byte	0x8
	.byte	0xa
	.4byte	0xad
	.byte	0x14
	.uleb128 0xd
	.4byte	.LASF37
	.byte	0x8
	.byte	0xa
	.4byte	0xad
	.byte	0x18
	.uleb128 0xd
	.4byte	.LASF38
	.byte	0x8
	.byte	0xa
	.4byte	0xad
	.byte	0x1c
	.uleb128 0xd
	.4byte	.LASF39
	.byte	0x8
	.byte	0xb
	.4byte	0xad
	.byte	0x20
	.uleb128 0xd
	.4byte	.LASF40
	.byte	0x8
	.byte	0xb
	.4byte	0xad
	.byte	0x24
	.uleb128 0xd
	.4byte	.LASF41
	.byte	0x8
	.byte	0xb
	.4byte	0xad
	.byte	0x28
	.byte	0
	.uleb128 0xc
	.4byte	.LASF42
	.byte	0x68
	.byte	0x8
	.byte	0x1a
	.4byte	0x299
	.uleb128 0xe
	.ascii	"pid\000"
	.byte	0x8
	.byte	0x1c
	.4byte	0x107
	.byte	0
	.uleb128 0xd
	.4byte	.LASF43
	.byte	0x8
	.byte	0x1e
	.4byte	0xa2
	.byte	0x4
	.uleb128 0xd
	.4byte	.LASF44
	.byte	0x8
	.byte	0x1f
	.4byte	0xa2
	.byte	0x8
	.uleb128 0xd
	.4byte	.LASF45
	.byte	0x8
	.byte	0x20
	.4byte	0xca
	.byte	0xc
	.uleb128 0xd
	.4byte	.LASF46
	.byte	0x8
	.byte	0x21
	.4byte	0xad
	.byte	0x1c
	.uleb128 0xd
	.4byte	.LASF47
	.byte	0x8
	.byte	0x22
	.4byte	0x299
	.byte	0x20
	.uleb128 0xd
	.4byte	.LASF48
	.byte	0x8
	.byte	0x23
	.4byte	0x29e
	.byte	0x24
	.uleb128 0xd
	.4byte	.LASF30
	.byte	0x8
	.byte	0x24
	.4byte	0x16c
	.byte	0x28
	.uleb128 0xd
	.4byte	.LASF49
	.byte	0x8
	.byte	0x26
	.4byte	0x141
	.byte	0x54
	.uleb128 0xe
	.ascii	"fs\000"
	.byte	0x8
	.byte	0x27
	.4byte	0x2a9
	.byte	0x5c
	.uleb128 0xd
	.4byte	.LASF50
	.byte	0x8
	.byte	0x28
	.4byte	0x2b4
	.byte	0x60
	.uleb128 0xd
	.4byte	.LASF51
	.byte	0x8
	.byte	0x29
	.4byte	0x2bf
	.byte	0x64
	.byte	0
	.uleb128 0xf
	.4byte	0x12b
	.uleb128 0x8
	.byte	0x4
	.4byte	0x1fd
	.uleb128 0x10
	.4byte	.LASF52
	.uleb128 0x8
	.byte	0x4
	.4byte	0x2a4
	.uleb128 0x10
	.4byte	.LASF53
	.uleb128 0x8
	.byte	0x4
	.4byte	0x2af
	.uleb128 0x10
	.4byte	.LASF51
	.uleb128 0x8
	.byte	0x4
	.4byte	0x2ba
	.uleb128 0x11
	.4byte	.LASF55
	.byte	0x2
	.byte	0x1e
	.byte	0x3
	.4byte	0x2f3
	.uleb128 0x12
	.4byte	.LASF54
	.byte	0x2
	.byte	0x1e
	.4byte	0x166
	.uleb128 0x12
	.4byte	.LASF28
	.byte	0x2
	.byte	0x1f
	.4byte	0x166
	.uleb128 0x12
	.4byte	.LASF27
	.byte	0x2
	.byte	0x1f
	.4byte	0x166
	.byte	0
	.uleb128 0x11
	.4byte	.LASF56
	.byte	0x2
	.byte	0x27
	.byte	0x3
	.4byte	0x316
	.uleb128 0x12
	.4byte	.LASF54
	.byte	0x2
	.byte	0x27
	.4byte	0x166
	.uleb128 0x12
	.4byte	.LASF57
	.byte	0x2
	.byte	0x27
	.4byte	0x166
	.byte	0
	.uleb128 0x11
	.4byte	.LASF58
	.byte	0x2
	.byte	0x19
	.byte	0x3
	.4byte	0x32e
	.uleb128 0x12
	.4byte	.LASF59
	.byte	0x2
	.byte	0x19
	.4byte	0x166
	.byte	0
	.uleb128 0x13
	.4byte	.LASF86
	.byte	0x1
	.byte	0x57
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x366
	.uleb128 0x14
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x57
	.4byte	0xfa
	.4byte	.LLST0
	.uleb128 0x15
	.4byte	.LVL2
	.4byte	0x898
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x55555555
	.byte	0
	.byte	0
	.uleb128 0x17
	.4byte	.LASF87
	.byte	0x1
	.byte	0x13
	.4byte	0x29e
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3f2
	.uleb128 0x14
	.ascii	"pid\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x107
	.4byte	.LLST1
	.uleb128 0x18
	.4byte	.LASF60
	.byte	0x1
	.byte	0x14
	.4byte	0x29e
	.4byte	.LLST2
	.uleb128 0x19
	.4byte	.LVL4
	.4byte	0x8a9
	.4byte	0x3b8
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x68
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x19
	.4byte	.LVL6
	.4byte	0x8c3
	.4byte	0x3d7
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x2
	.byte	0x8
	.byte	0x2c
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 40
	.byte	0
	.uleb128 0x15
	.4byte	.LVL7
	.4byte	0x8c3
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x3f
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 12
	.byte	0
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF61
	.byte	0x1
	.byte	0x2a
	.4byte	0xfa
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x463
	.uleb128 0x1b
	.4byte	.LASF60
	.byte	0x1
	.byte	0x2a
	.4byte	0x29e
	.4byte	.LLST3
	.uleb128 0x1b
	.4byte	.LASF45
	.byte	0x1
	.byte	0x2a
	.4byte	0xfc
	.4byte	.LLST4
	.uleb128 0x19
	.4byte	.LVL12
	.4byte	0x8c3
	.4byte	0x447
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x40
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.uleb128 0x15
	.4byte	.LVL13
	.4byte	0x8de
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x3f
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x81
	.sleb128 0
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.4byte	.LASF69
	.byte	0x1
	.byte	0x31
	.byte	0x1
	.4byte	0x47b
	.uleb128 0x12
	.4byte	.LASF60
	.byte	0x1
	.byte	0x31
	.4byte	0x29e
	.byte	0
	.uleb128 0x1d
	.4byte	0x463
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x496
	.uleb128 0x1e
	.4byte	0x46f
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF64
	.byte	0x1
	.byte	0x3e
	.4byte	.LFB40
	.4byte	.LFE40-.LFB40
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x57e
	.uleb128 0x1b
	.4byte	.LASF60
	.byte	0x1
	.byte	0x3e
	.4byte	0x29e
	.4byte	.LLST5
	.uleb128 0x20
	.4byte	.LBB15
	.4byte	.LBE15-.LBB15
	.uleb128 0x21
	.4byte	.LASF67
	.byte	0x1
	.byte	0x41
	.4byte	0x12b
	.uleb128 0x18
	.4byte	.LASF28
	.byte	0x1
	.byte	0x42
	.4byte	0x29e
	.4byte	.LLST6
	.uleb128 0x18
	.4byte	.LASF27
	.byte	0x1
	.byte	0x42
	.4byte	0x29e
	.4byte	.LLST7
	.uleb128 0x22
	.4byte	0x463
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.byte	0x1
	.byte	0x43
	.4byte	0x509
	.uleb128 0x23
	.4byte	0x46f
	.4byte	.LLST7
	.byte	0
	.uleb128 0x22
	.4byte	0x463
	.4byte	.LBB18
	.4byte	.LBE18-.LBB18
	.byte	0x1
	.byte	0x4c
	.4byte	0x526
	.uleb128 0x23
	.4byte	0x46f
	.4byte	.LLST9
	.byte	0
	.uleb128 0x24
	.4byte	.LVL20
	.4byte	0x898
	.uleb128 0x19
	.4byte	.LVL21
	.4byte	0x898
	.4byte	0x546
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x14766666
	.byte	0
	.uleb128 0x24
	.4byte	.LVL22
	.4byte	0x898
	.uleb128 0x19
	.4byte	.LVL23
	.4byte	0x90a
	.4byte	0x569
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x80
	.sleb128 40
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x81
	.sleb128 40
	.byte	0
	.uleb128 0x15
	.4byte	.LVL24
	.4byte	0x898
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x7566666
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x25
	.4byte	.LASF88
	.byte	0x1
	.byte	0x52
	.4byte	0x3a
	.byte	0x1
	.4byte	0x59a
	.uleb128 0x12
	.4byte	.LASF60
	.byte	0x1
	.byte	0x52
	.4byte	0x29e
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF62
	.byte	0x1
	.byte	0x68
	.4byte	0x107
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6c1
	.uleb128 0x14
	.ascii	"fn\000"
	.byte	0x1
	.byte	0x68
	.4byte	0x6cc
	.4byte	.LLST10
	.uleb128 0x14
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x68
	.4byte	0xfa
	.4byte	.LLST11
	.uleb128 0x1b
	.4byte	.LASF43
	.byte	0x1
	.byte	0x68
	.4byte	0xad
	.4byte	.LLST12
	.uleb128 0x18
	.4byte	.LASF60
	.byte	0x1
	.byte	0x6a
	.4byte	0x29e
	.4byte	.LLST13
	.uleb128 0x26
	.ascii	"ret\000"
	.byte	0x1
	.byte	0x6b
	.4byte	0x107
	.4byte	.LLST14
	.uleb128 0x18
	.4byte	.LASF63
	.byte	0x1
	.byte	0x6d
	.4byte	0x107
	.4byte	.LLST15
	.uleb128 0x27
	.4byte	.LASF89
	.byte	0x1
	.byte	0x8a
	.4byte	.L13
	.uleb128 0x22
	.4byte	0x57e
	.4byte	.LBB26
	.4byte	.LBE26-.LBB26
	.byte	0x1
	.byte	0x7c
	.4byte	0x64b
	.uleb128 0x23
	.4byte	0x58e
	.4byte	.LLST16
	.uleb128 0x15
	.4byte	.LVL32
	.4byte	0x8a9
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xa
	.2byte	0x1000
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x81
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x22
	.4byte	0x2f3
	.4byte	.LBB28
	.4byte	.LBE28-.LBB28
	.byte	0x1
	.byte	0x82
	.4byte	0x69c
	.uleb128 0x23
	.4byte	0x30a
	.4byte	.LLST17
	.uleb128 0x23
	.4byte	0x2ff
	.4byte	.LLST18
	.uleb128 0x28
	.4byte	0x2c5
	.4byte	.LBB30
	.4byte	.LBE30-.LBB30
	.byte	0x2
	.byte	0x29
	.uleb128 0x23
	.4byte	0x2e7
	.4byte	.LLST19
	.uleb128 0x23
	.4byte	0x2dc
	.4byte	.LLST20
	.uleb128 0x23
	.4byte	0x2d1
	.4byte	.LLST21
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LVL29
	.4byte	0x366
	.4byte	0x6b0
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x81
	.sleb128 0
	.byte	0
	.uleb128 0x15
	.4byte	.LVL36
	.4byte	0x92a
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x29
	.4byte	0x6cc
	.uleb128 0x2a
	.4byte	0xfa
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x6c1
	.uleb128 0x1f
	.4byte	.LASF65
	.byte	0x1
	.byte	0x8f
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7c1
	.uleb128 0x18
	.4byte	.LASF66
	.byte	0x1
	.byte	0x94
	.4byte	0x107
	.4byte	.LLST22
	.uleb128 0x2b
	.ascii	"pid\000"
	.byte	0x1
	.byte	0xa4
	.4byte	0x107
	.uleb128 0x22
	.4byte	0x316
	.4byte	.LBB36
	.4byte	.LBE36-.LBB36
	.byte	0x1
	.byte	0x92
	.4byte	0x721
	.uleb128 0x1e
	.4byte	0x322
	.uleb128 0x6
	.byte	0x3
	.4byte	proc_list
	.byte	0x9f
	.byte	0
	.uleb128 0x19
	.4byte	.LVL42
	.4byte	0x366
	.4byte	0x735
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.uleb128 0x19
	.4byte	.LVL43
	.4byte	0x898
	.4byte	0x74d
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x6
	.byte	0x11
	.sleb128 -1717986919
	.byte	0
	.uleb128 0x24
	.4byte	.LVL44
	.4byte	0x898
	.uleb128 0x19
	.4byte	.LVL45
	.4byte	0x3f2
	.4byte	0x76d
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x24
	.4byte	.LVL47
	.4byte	0x898
	.uleb128 0x19
	.4byte	.LVL48
	.4byte	0x898
	.4byte	0x78d
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x14266666
	.byte	0
	.uleb128 0x19
	.4byte	.LVL49
	.4byte	0x59a
	.4byte	0x7ae
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0x3
	.4byte	init_main
	.byte	0
	.uleb128 0x24
	.4byte	.LVL50
	.4byte	0x898
	.uleb128 0x24
	.4byte	.LVL51
	.4byte	0x898
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF68
	.byte	0x1
	.byte	0xaf
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x81f
	.uleb128 0x2c
	.4byte	.Ldebug_ranges0+0
	.4byte	0x80e
	.uleb128 0x2d
	.4byte	.LASF70
	.byte	0x1
	.byte	0xb4
	.4byte	0x3a
	.4byte	0x7f0
	.uleb128 0x2e
	.byte	0
	.uleb128 0x19
	.4byte	.LVL53
	.4byte	0x898
	.4byte	0x804
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x81
	.sleb128 0
	.byte	0
	.uleb128 0x24
	.4byte	.LVL54
	.4byte	0x93b
	.byte	0
	.uleb128 0x15
	.4byte	.LVL55
	.4byte	0x898
	.uleb128 0x16
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x2f
	.4byte	.LASF71
	.byte	0x1
	.byte	0xe
	.4byte	0x3a
	.uleb128 0x5
	.byte	0x3
	.4byte	nr_process
	.uleb128 0x30
	.4byte	.LASF72
	.byte	0x9
	.byte	0x12
	.4byte	0x841
	.uleb128 0x5
	.byte	0x3
	.4byte	pte_p
	.uleb128 0x8
	.byte	0x4
	.4byte	0x136
	.uleb128 0x30
	.4byte	.LASF73
	.byte	0x8
	.byte	0xf
	.4byte	0x29e
	.uleb128 0x1
	.byte	0x6c
	.uleb128 0x30
	.4byte	.LASF74
	.byte	0x1
	.byte	0x9
	.4byte	0x141
	.uleb128 0x5
	.byte	0x3
	.4byte	proc_list
	.uleb128 0x30
	.4byte	.LASF75
	.byte	0x1
	.byte	0xb
	.4byte	0x29e
	.uleb128 0x5
	.byte	0x3
	.4byte	idleproc
	.uleb128 0x30
	.4byte	.LASF76
	.byte	0x1
	.byte	0xc
	.4byte	0x29e
	.uleb128 0x5
	.byte	0x3
	.4byte	current
	.uleb128 0x31
	.ascii	"tno\000"
	.byte	0x1
	.byte	0x10
	.4byte	0x3a
	.uleb128 0x5
	.byte	0x3
	.4byte	tno
	.uleb128 0x32
	.4byte	.LASF77
	.byte	0xa
	.byte	0xe
	.4byte	0x8a9
	.uleb128 0x2a
	.4byte	0x2c
	.byte	0
	.uleb128 0x33
	.4byte	.LASF80
	.byte	0xc
	.byte	0x16
	.4byte	0xfa
	.4byte	0x8c3
	.uleb128 0x2a
	.4byte	0x107
	.uleb128 0x2a
	.4byte	0xef
	.byte	0
	.uleb128 0x32
	.4byte	.LASF78
	.byte	0xb
	.byte	0x8
	.4byte	0x8de
	.uleb128 0x2a
	.4byte	0xfa
	.uleb128 0x2a
	.4byte	0x97
	.uleb128 0x2a
	.4byte	0xad
	.byte	0
	.uleb128 0x32
	.4byte	.LASF79
	.byte	0xb
	.byte	0x6
	.4byte	0x8f9
	.uleb128 0x2a
	.4byte	0x8f9
	.uleb128 0x2a
	.4byte	0x8ff
	.uleb128 0x2a
	.4byte	0xad
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x97
	.uleb128 0x8
	.byte	0x4
	.4byte	0x905
	.uleb128 0x9
	.4byte	0x97
	.uleb128 0x33
	.4byte	.LASF81
	.byte	0x8
	.byte	0x12
	.4byte	0xfa
	.4byte	0x924
	.uleb128 0x2a
	.4byte	0x924
	.uleb128 0x2a
	.4byte	0x924
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x16c
	.uleb128 0x32
	.4byte	.LASF82
	.byte	0x1
	.byte	0xf
	.4byte	0x93b
	.uleb128 0x2a
	.4byte	0x29e
	.byte	0
	.uleb128 0x34
	.4byte	.LASF70
	.byte	0x1
	.byte	0xb4
	.4byte	0x3a
	.uleb128 0x2e
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
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
	.uleb128 0x2c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
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
	.uleb128 0x33
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
	.uleb128 0x34
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
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL1-.Ltext0
	.4byte	.LFE42-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL4-1-.Ltext0
	.4byte	.LFE37-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL8-.Ltext0
	.4byte	.LFE37-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL12-1-.Ltext0
	.2byte	0x3
	.byte	0x74
	.sleb128 -12
	.byte	0x9f
	.4byte	.LVL12-1-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x3
	.byte	0x80
	.sleb128 -12
	.byte	0x9f
	.4byte	.LVL15-.Ltext0
	.4byte	.LFE38-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x61
	.4byte	.LVL14-.Ltext0
	.4byte	.LFE38-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL25-.Ltext0
	.4byte	.LFE40-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x61
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x61
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL37-.Ltext0
	.4byte	.LFE44-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL29-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL29-1-.Ltext0
	.4byte	.LFE44-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL26-.Ltext0
	.4byte	.LVL29-1-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL29-1-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL37-.Ltext0
	.4byte	.LFE44-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x56
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL29-.Ltext0
	.4byte	.LVL30-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL30-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL38-.Ltext0
	.2byte	0x1
	.byte	0x64
	.4byte	.LVL38-.Ltext0
	.4byte	.LFE44-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL27-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x61
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL31-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x6
	.byte	0x3
	.4byte	proc_list
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL36-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL36-1-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x4
	.byte	0x80
	.sleb128 84
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL34-.Ltext0
	.4byte	.LVL35-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL36-1-.Ltext0
	.2byte	0x2
	.byte	0x73
	.sleb128 0
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL34-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x6
	.byte	0x3
	.4byte	proc_list
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL34-.Ltext0
	.4byte	.LVL36-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL36-1-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x4
	.byte	0x80
	.sleb128 84
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL52-.Ltext0
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB38-.Ltext0
	.4byte	.LBE38-.Ltext0
	.4byte	.LBB39-.Ltext0
	.4byte	.LBE39-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF75:
	.ascii	"idleproc\000"
.LASF69:
	.ascii	"set_current\000"
.LASF21:
	.ascii	"size_t\000"
.LASF16:
	.ascii	"uint64_t\000"
.LASF67:
	.ascii	"intr_flag\000"
.LASF7:
	.ascii	"__uint8_t\000"
.LASF28:
	.ascii	"prev\000"
.LASF87:
	.ascii	"alloc_proc\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF54:
	.ascii	"new_node\000"
.LASF27:
	.ascii	"next\000"
.LASF68:
	.ascii	"cpu_idle\000"
.LASF11:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF62:
	.ascii	"create_proc\000"
.LASF48:
	.ascii	"parent\000"
.LASF44:
	.ascii	"state\000"
.LASF9:
	.ascii	"long int\000"
.LASF55:
	.ascii	"__list_add\000"
.LASF31:
	.ascii	"reg16\000"
.LASF32:
	.ascii	"reg17\000"
.LASF33:
	.ascii	"reg18\000"
.LASF34:
	.ascii	"reg19\000"
.LASF19:
	.ascii	"double\000"
.LASF74:
	.ascii	"proc_list\000"
.LASF10:
	.ascii	"__uint32_t\000"
.LASF63:
	.ascii	"porc_id\000"
.LASF71:
	.ascii	"nr_process\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF35:
	.ascii	"reg20\000"
.LASF36:
	.ascii	"reg21\000"
.LASF37:
	.ascii	"reg22\000"
.LASF38:
	.ascii	"reg23\000"
.LASF89:
	.ascii	"fork_out\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF39:
	.ascii	"reg29\000"
.LASF56:
	.ascii	"list_add\000"
.LASF65:
	.ascii	"proc_init\000"
.LASF70:
	.ascii	"schedule\000"
.LASF84:
	.ascii	"process/proc.c\000"
.LASF45:
	.ascii	"name\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF43:
	.ascii	"priority\000"
.LASF25:
	.ascii	"bool\000"
.LASF47:
	.ascii	"need_resched\000"
.LASF85:
	.ascii	"C:\\Users\\lzy05\\OneDrive\\18-19-Fall\\SCD\\git\\src\000"
.LASF77:
	.ascii	"writeValTo7SegsHex\000"
.LASF52:
	.ascii	"fs_struct\000"
.LASF66:
	.ascii	"idle_pid\000"
.LASF51:
	.ascii	"namespace\000"
.LASF40:
	.ascii	"reg30\000"
.LASF41:
	.ascii	"reg31\000"
.LASF73:
	.ascii	"__current_task\000"
.LASF17:
	.ascii	"sizetype\000"
.LASF72:
	.ascii	"pte_p\000"
.LASF26:
	.ascii	"pte_t\000"
.LASF49:
	.ascii	"list_link\000"
.LASF60:
	.ascii	"proc\000"
.LASF76:
	.ascii	"current\000"
.LASF12:
	.ascii	"__uint64_t\000"
.LASF20:
	.ascii	"float\000"
.LASF46:
	.ascii	"kstack\000"
.LASF14:
	.ascii	"int32_t\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF5:
	.ascii	"short int\000"
.LASF23:
	.ascii	"false\000"
.LASF13:
	.ascii	"uint8_t\000"
.LASF57:
	.ascii	"head\000"
.LASF15:
	.ascii	"uint32_t\000"
.LASF18:
	.ascii	"char\000"
.LASF29:
	.ascii	"list_head\000"
.LASF64:
	.ascii	"proc_run\000"
.LASF8:
	.ascii	"__int32_t\000"
.LASF88:
	.ascii	"setup_kstack\000"
.LASF79:
	.ascii	"memcpy\000"
.LASF58:
	.ascii	"init_list_head\000"
.LASF30:
	.ascii	"context\000"
.LASF61:
	.ascii	"set_proc_name\000"
.LASF81:
	.ascii	"switch_to\000"
.LASF78:
	.ascii	"memset\000"
.LASF53:
	.ascii	"files_struct\000"
.LASF42:
	.ascii	"task_struct\000"
.LASF83:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF86:
	.ascii	"init_main\000"
.LASF82:
	.ascii	"wakeup_proc\000"
.LASF80:
	.ascii	"kmalloc\000"
.LASF22:
	.ascii	"pid_t\000"
.LASF59:
	.ascii	"list\000"
.LASF50:
	.ascii	"files\000"
.LASF24:
	.ascii	"true\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
