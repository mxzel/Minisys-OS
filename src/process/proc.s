	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
.LFB49 = .
	.file 1 "process/proc.c"
	.loc 1 169 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	do_exit
	.type	do_exit, @function
do_exit:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
	.loc 1 170 0
	li	$4,1717960704			# 0x66660000
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsHex
	addiu	$4,$4,26214
	.set	macro
	.set	reorder

.LVL0 = .
	.loc 1 171 0
	li	$3,1			# 0x1
	lw	$2,%gp_rel(current)($28)
	sw	$3,8($2)
.LBB14 = .
.LBB15 = .
	.loc 1 164 0
 #APP
 # 164 "process/proc.c" 1
	li $2,0x1
 # 0 "" 2
	.loc 1 165 0
 # 165 "process/proc.c" 1
	syscall
 # 0 "" 2
	.loc 1 166 0
 #NO_APP
	li	$4,858980352			# 0x33330000
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsHex
	addiu	$4,$4,13107
	.set	macro
	.set	reorder

.LVL1 = .
.LBE15 = .
.LBE14 = .
	.loc 1 173 0
	lw	$31,20($sp)
	.set	noreorder
	.set	nomacro
	jr	$31
	addiu	$sp,$sp,24
	.set	macro
	.set	reorder

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.end	do_exit
	.cfi_endproc
.LFE49:
	.size	do_exit, .-do_exit
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
.LVL2 = .
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	sw	$16,16($sp)
	.cfi_offset 31, -4
	.cfi_offset 16, -8
	.loc 1 20 0
	jal	kmalloc
	li	$5,108			# 0x6c

.LVL3 = .
	.loc 1 23 0
	beq	$2,$0,.L4
	move	$16,$2

	.loc 1 24 0
	li	$2,-1			# 0xffffffffffffffff
.LVL4 = .
	sw	$2,8($16)
	.loc 1 26 0
	sw	$0,28($16)
	.loc 1 27 0
	sw	$0,32($16)
	.loc 1 29 0
	addiu	$4,$16,36
	move	$5,$0
	jal	memset
	li	$6,52			# 0x34

.LVL5 = .
	.loc 1 31 0
	addiu	$4,$16,12
	move	$5,$0
	jal	memset
	li	$6,15			# 0xf

.LVL6 = .
.L4:
	.loc 1 37 0
	move	$2,$16
	lw	$31,20($sp)
	lw	$16,16($sp)
.LVL7 = .
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
.LFB43 = .
	.loc 1 101 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	test2
	.type	test2, @function
test2:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL8 = .
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
	.loc 1 104 0
	lw	$5,%gp_rel(current)($28)
.LVL9 = .
.LBB18 = .
.LBB19 = .
	.loc 1 97 0
	lw	$4,0($5)
.LVL10 = .
	sll	$2,$4,2
	sll	$3,$4,7
	subu	$2,$3,$2
	addu	$2,$2,$4
	sll	$4,$2,2
	addu	$2,$2,$4
	sll	$2,$2,4
	lw	$4,4($5)
.LBE19 = .
.LBE18 = .
	.loc 1 104 0
	jal	writeValTo7SegsDec
	addu	$4,$2,$4

.LVL11 = .
	.loc 1 105 0
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	test2
	.cfi_endproc
.LFE43:
	.size	test2, .-test2
	.align	2
.LFB44 = .
	.loc 1 106 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	test3
	.type	test3, @function
test3:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL12 = .
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
	.loc 1 108 0
	lw	$5,%gp_rel(current)($28)
.LVL13 = .
.LBB22 = .
.LBB23 = .
	.loc 1 97 0
	lw	$4,0($5)
.LVL14 = .
	sll	$2,$4,2
	sll	$3,$4,7
	subu	$2,$3,$2
	addu	$2,$2,$4
	sll	$4,$2,2
	addu	$2,$2,$4
	sll	$2,$2,4
	lw	$4,4($5)
.LBE23 = .
.LBE22 = .
	.loc 1 108 0
	jal	writeValTo7SegsDec
	addu	$4,$2,$4

.LVL15 = .
	.loc 1 109 0
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	test3
	.cfi_endproc
.LFE44:
	.size	test3, .-test3
	.align	2
.LFB45 = .
	.loc 1 110 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	test4
	.type	test4, @function
test4:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL16 = .
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
	.loc 1 112 0
	lw	$5,%gp_rel(current)($28)
.LVL17 = .
.LBB26 = .
.LBB27 = .
	.loc 1 97 0
	lw	$4,0($5)
.LVL18 = .
	sll	$2,$4,2
	sll	$3,$4,7
	subu	$2,$3,$2
	addu	$2,$2,$4
	sll	$4,$2,2
	addu	$2,$2,$4
	sll	$2,$2,4
	lw	$4,4($5)
.LBE27 = .
.LBE26 = .
	.loc 1 112 0
	jal	writeValTo7SegsDec
	addu	$4,$2,$4

.LVL19 = .
	.loc 1 113 0
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	test4
	.cfi_endproc
.LFE45:
	.size	test4, .-test4
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
.LVL20 = .
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
.LVL21 = .
	move	$5,$0
.LVL22 = .
	jal	memset
	li	$6,16			# 0x10

.LVL23 = .
	.loc 1 44 0
	move	$4,$16
	move	$5,$17
	jal	memcpy
	li	$6,15			# 0xf

.LVL24 = .
	.loc 1 45 0
	lw	$31,28($sp)
	lw	$17,24($sp)
.LVL25 = .
	lw	$16,20($sp)
.LVL26 = .
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
.LVL27 = .
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
	.globl	catOutput
.LFB42 = .
	.loc 1 96 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	catOutput
	.type	catOutput, @function
catOutput:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL28 = .
	.loc 1 97 0
	sll	$2,$4,2
	sll	$3,$4,7
	subu	$2,$3,$2
	addu	$4,$2,$4
.LVL29 = .
	sll	$2,$4,2
	addu	$4,$4,$2
	sll	$2,$4,4
	.loc 1 99 0
	jr	$31
	addu	$2,$2,$5

	.set	macro
	.set	reorder
	.end	catOutput
	.cfi_endproc
.LFE42:
	.size	catOutput, .-catOutput
	.align	2
	.globl	keyboard_input
.LFB46 = .
	.loc 1 115 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	keyboard_input
	.type	keyboard_input, @function
keyboard_input:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.loc 1 117 0
	lw	$2,%gp_rel(i.2891)($28)
	addiu	$3,$2,1
	.loc 1 118 0
	jr	$31
	sw	$3,%gp_rel(i.2891)($28)

	.set	macro
	.set	reorder
	.end	keyboard_input
	.cfi_endproc
.LFE46:
	.size	keyboard_input, .-keyboard_input
	.align	2
	.globl	create_proc
.LFB50 = .
	.loc 1 179 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	create_proc
	.type	create_proc, @function
create_proc:
	.frame	$sp,48,$31		# vars= 0, regs= 7/0, args= 16, gp= 0
	.mask	0x803f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL30 = .
	addiu	$sp,$sp,-48
	.cfi_def_cfa_offset 48
	sw	$31,44($sp)
	sw	$21,40($sp)
	sw	$20,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	.cfi_offset 31, -4
	.cfi_offset 21, -8
	.cfi_offset 20, -12
	.cfi_offset 19, -16
	.cfi_offset 18, -20
	.cfi_offset 17, -24
	.cfi_offset 16, -28
	.loc 1 184 0
	lw	$17,%gp_rel(tno)($28)
	addiu	$2,$17,1
	sw	$2,%gp_rel(tno)($28)
.LVL31 = .
	.loc 1 186 0
	lw	$3,%gp_rel(nr_process)($28)
	slt	$3,$3,1025
	beq	$3,$0,.L20
	move	$2,$20

	move	$19,$6
	move	$21,$5
	move	$18,$4
.LVL32 = .
	.loc 1 189 0
	jal	alloc_proc
	move	$4,$17

.LVL33 = .
	.loc 1 191 0
	beq	$2,$0,.L18
	move	$16,$2

	.loc 1 195 0
	lw	$2,%gp_rel(current)($28)
.LVL34 = .
	sw	$2,32($16)
	.loc 1 196 0
	sw	$19,4($16)
	.loc 1 198 0
	sw	$17,0($16)
.LVL35 = .
.LBB34 = .
.LBB35 = .
	.loc 1 87 0
	move	$4,$17
	jal	kmalloc
	li	$5,4096			# 0x1000

.LVL36 = .
	sw	$2,28($16)
.LBE35 = .
.LBE34 = .
	.loc 1 201 0
	addiu	$4,$18,-4
	sw	$4,36($16)
	.loc 1 202 0
	sw	$21,40($16)
	.loc 1 203 0
	lui	$3,%hi(do_exit)
	addiu	$3,$3,%lo(do_exit)
	sw	$3,84($16)
	.loc 1 204 0
	addiu	$2,$2,4096
	sw	$2,76($16)
	.loc 1 207 0
	addiu	$3,$16,88
.LVL37 = .
.LBB36 = .
.LBB37 = .
	.file 2 "./include/lib/list.h"
	.loc 2 41 0
	addiu	$2,$28,%gp_rel(proc_list)
	lw	$4,0($2)
.LVL38 = .
.LBB38 = .
.LBB39 = .
	.loc 2 33 0
	sw	$3,4($4)
	.loc 2 34 0
	sw	$4,88($16)
	.loc 2 35 0
	sw	$2,92($16)
	.loc 2 36 0
	sw	$3,0($2)
.LBE39 = .
.LBE38 = .
.LBE37 = .
.LBE36 = .
	.loc 1 210 0
	lw	$2,%gp_rel(nr_process)($28)
	addiu	$2,$2,1
	sw	$2,%gp_rel(nr_process)($28)
.LVL39 = .
	.loc 1 211 0
	jal	wakeup_proc
	move	$4,$16

.LVL40 = .
	.loc 1 213 0
	lw	$20,0($16)
.LVL41 = .
.L18:
	.loc 1 216 0
	move	$2,$20
.L20:
	lw	$31,44($sp)
	lw	$21,40($sp)
	lw	$20,36($sp)
.LVL42 = .
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
.LVL43 = .
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,48

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 17
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	create_proc
	.cfi_endproc
.LFE50:
	.size	create_proc, .-create_proc
	.align	2
.LFB47 = .
	.loc 1 121 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	init_main
	.type	init_main, @function
init_main:
	.frame	$sp,48,$31		# vars= 24, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL44 = .
	addiu	$sp,$sp,-48
	.cfi_def_cfa_offset 48
	sw	$31,44($sp)
	.cfi_offset 31, -4
.LVL45 = .
	.cfi_offset 16, -8
	.loc 1 135 0
	jal	keyboard_input
	sw	$16,40($sp)

.LVL46 = .
	jal	keyboard_input
	sw	$2,16($sp)

.LVL47 = .
	jal	keyboard_input
	sw	$2,20($sp)

.LVL48 = .
	sw	$2,24($sp)
.LVL49 = .
	.loc 1 138 0
	lw	$16,16($sp)
	lui	$4,%hi(test2)
	addiu	$4,$4,%lo(test2)
	move	$5,$0
	jal	create_proc
	move	$6,$16

.LVL50 = .
.LBB46 = .
.LBB47 = .
	.loc 1 97 0
	sll	$4,$2,2
	sll	$3,$2,7
	subu	$3,$3,$4
	addu	$2,$3,$2
.LVL51 = .
	sll	$6,$2,2
	addu	$2,$2,$6
	sll	$2,$2,4
	addu	$6,$2,$16
.LBE47 = .
.LBE46 = .
	.loc 1 139 0
	sw	$6,28($sp)
	.loc 1 141 0
	lw	$16,20($sp)
.LVL52 = .
	lui	$4,%hi(test3)
	addiu	$4,$4,%lo(test3)
	move	$5,$0
	jal	create_proc
	move	$6,$16

.LVL53 = .
.LBB48 = .
.LBB49 = .
	.loc 1 97 0
	sll	$4,$2,2
	sll	$3,$2,7
	subu	$3,$3,$4
	addu	$2,$3,$2
.LVL54 = .
	sll	$6,$2,2
	addu	$2,$2,$6
	sll	$2,$2,4
	addu	$6,$2,$16
.LBE49 = .
.LBE48 = .
	.loc 1 142 0
	sw	$6,32($sp)
	.loc 1 144 0
	lw	$16,24($sp)
.LVL55 = .
	lui	$4,%hi(test4)
	addiu	$4,$4,%lo(test4)
	move	$5,$0
	jal	create_proc
	move	$6,$16

.LVL56 = .
.LBB50 = .
.LBB51 = .
	.loc 1 97 0
	sll	$4,$2,2
	sll	$3,$2,7
	subu	$3,$3,$4
	addu	$2,$3,$2
.LVL57 = .
	sll	$6,$2,2
	addu	$2,$2,$6
	sll	$2,$2,4
	addu	$6,$2,$16
.LBE51 = .
.LBE50 = .
	.loc 1 145 0
	sw	$6,36($sp)
.LVL58 = .
	.loc 1 151 0
	jal	writeValTo7SegsDec
	lw	$4,28($sp)

.LVL59 = .
	jal	writeValTo7SegsDec
	lw	$4,32($sp)

.LVL60 = .
	jal	writeValTo7SegsDec
	lw	$4,36($sp)

.LVL61 = .
	.loc 1 158 0
	lw	$31,44($sp)
	lw	$16,40($sp)
.LVL62 = .
.LVL63 = .
	jr	$31
	addiu	$sp,$sp,48

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	init_main
	.cfi_endproc
.LFE47:
	.size	init_main, .-init_main
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.ascii	"idle\000"
	.text
	.align	2
	.globl	proc_init
.LFB51 = .
	.loc 1 219 0
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
.LVL64 = .
.LBB56 = .
.LBB57 = .
	.loc 2 26 0
	addiu	$2,$28,%gp_rel(proc_list)
	sw	$2,0($2)
	.loc 2 27 0
	sw	$2,4($2)
.LBE57 = .
.LBE56 = .
	.loc 1 224 0
	lw	$16,%gp_rel(tno)($28)
	addiu	$2,$16,1
	sw	$2,%gp_rel(tno)($28)
.LVL65 = .
	.loc 1 225 0
	jal	alloc_proc
	move	$4,$16

.LVL66 = .
	sw	$2,%gp_rel(idleproc)($28)
	.loc 1 228 0
	sw	$16,0($2)
	.loc 1 229 0
	lw	$4,%gp_rel(idleproc)($28)
	sw	$0,8($4)
	.loc 1 230 0
	sw	$0,4($4)
	.loc 1 232 0
	lui	$5,%hi(.LC0)
	jal	set_proc_name
	addiu	$5,$5,%lo(.LC0)

.LVL67 = .
	.loc 1 233 0
	lw	$2,%gp_rel(nr_process)($28)
	addiu	$2,$2,1
	sw	$2,%gp_rel(nr_process)($28)
.LVL68 = .
.LBB58 = .
.LBB59 = .
	.loc 1 50 0
	lw	$2,%gp_rel(idleproc)($28)
	sw	$2,%gp_rel(current)($28)
.LBE59 = .
.LBE58 = .
	.loc 1 236 0
	lui	$4,%hi(init_main)
	addiu	$4,$4,%lo(init_main)
	move	$5,$0
	jal	create_proc
	li	$6,1			# 0x1

.LVL69 = .
	.loc 1 239 0
	lw	$31,20($sp)
	lw	$16,16($sp)
.LVL70 = .
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	proc_init
	.cfi_endproc
.LFE51:
	.size	proc_init, .-proc_init
	.align	2
	.globl	cpu_idle
.LFB52 = .
	.loc 1 242 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	cpu_idle
	.type	cpu_idle, @function
cpu_idle:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	sw	$16,16($sp)
	.cfi_offset 31, -4
	.cfi_offset 16, -8
.LBB60 = .
.LBB61 = .
	.loc 1 166 0
	li	$16,858980352			# 0x33330000
	addiu	$16,$16,13107
.L26:
	.loc 1 164 0 discriminator 1
 #APP
 # 164 "process/proc.c" 1
	li $2,0x1
 # 0 "" 2
	.loc 1 165 0 discriminator 1
 # 165 "process/proc.c" 1
	syscall
 # 0 "" 2
	.loc 1 166 0 discriminator 1
 #NO_APP
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsHex
	move	$4,$16
	.set	macro
	.set	reorder

.LVL71 = .
.LBE61 = .
.LBE60 = .
	.loc 1 246 0 discriminator 1
	.set	noreorder
	.set	nomacro
	jal	writeValTo7SegsHex
	li	$4,1431633920			# 0x55550000
	.set	macro
	.set	reorder

.LVL72 = .
	.loc 1 247 0 discriminator 1
	b	.L26
	.end	cpu_idle
	.cfi_endproc
.LFE52:
	.size	cpu_idle, .-cpu_idle
	.section	.sdata,"aw",@progbits
	.align	2
	.type	i.2891, @object
	.size	i.2891, 4
i.2891:
	.word	5
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
	.file 11 "./include/mm/mm.h"
	.file 12 "./include/string.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xb0e
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF84
	.byte	0x1
	.4byte	.LASF85
	.4byte	.LASF86
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
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x7
	.byte	0x2f
	.4byte	0xb8
	.uleb128 0xa
	.4byte	.LASF26
	.byte	0x8
	.byte	0x7
	.byte	0x37
	.4byte	0x142
	.uleb128 0xb
	.4byte	.LASF24
	.byte	0x7
	.byte	0x38
	.4byte	0x142
	.byte	0
	.uleb128 0xb
	.4byte	.LASF25
	.byte	0x7
	.byte	0x39
	.4byte	0x142
	.byte	0x4
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x11d
	.uleb128 0xa
	.4byte	.LASF27
	.byte	0x34
	.byte	0x8
	.byte	0x7
	.4byte	0x1f0
	.uleb128 0xc
	.ascii	"pc\000"
	.byte	0x8
	.byte	0x8
	.4byte	0xad
	.byte	0
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x8
	.byte	0x9
	.4byte	0xad
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x8
	.byte	0xa
	.4byte	0xad
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF30
	.byte	0x8
	.byte	0xb
	.4byte	0xad
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF31
	.byte	0x8
	.byte	0xb
	.4byte	0xad
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x8
	.byte	0xb
	.4byte	0xad
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x8
	.byte	0xb
	.4byte	0xad
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x8
	.byte	0xb
	.4byte	0xad
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF35
	.byte	0x8
	.byte	0xb
	.4byte	0xad
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x8
	.byte	0xb
	.4byte	0xad
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF37
	.byte	0x8
	.byte	0xc
	.4byte	0xad
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x8
	.byte	0xc
	.4byte	0xad
	.byte	0x2c
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x8
	.byte	0xc
	.4byte	0xad
	.byte	0x30
	.byte	0
	.uleb128 0xa
	.4byte	.LASF40
	.byte	0x6c
	.byte	0x8
	.byte	0x1b
	.4byte	0x280
	.uleb128 0xc
	.ascii	"pid\000"
	.byte	0x8
	.byte	0x1d
	.4byte	0x107
	.byte	0
	.uleb128 0xb
	.4byte	.LASF41
	.byte	0x8
	.byte	0x1f
	.4byte	0xa2
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF42
	.byte	0x8
	.byte	0x20
	.4byte	0xa2
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF43
	.byte	0x8
	.byte	0x21
	.4byte	0xca
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x8
	.byte	0x22
	.4byte	0xad
	.byte	0x1c
	.uleb128 0xb
	.4byte	.LASF45
	.byte	0x8
	.byte	0x24
	.4byte	0x280
	.byte	0x20
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x8
	.byte	0x25
	.4byte	0x148
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF46
	.byte	0x8
	.byte	0x27
	.4byte	0x11d
	.byte	0x58
	.uleb128 0xc
	.ascii	"fs\000"
	.byte	0x8
	.byte	0x28
	.4byte	0x28b
	.byte	0x60
	.uleb128 0xb
	.4byte	.LASF47
	.byte	0x8
	.byte	0x29
	.4byte	0x296
	.byte	0x64
	.uleb128 0xb
	.4byte	.LASF48
	.byte	0x8
	.byte	0x2a
	.4byte	0x2a1
	.byte	0x68
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x1f0
	.uleb128 0xd
	.4byte	.LASF49
	.uleb128 0x8
	.byte	0x4
	.4byte	0x286
	.uleb128 0xd
	.4byte	.LASF50
	.uleb128 0x8
	.byte	0x4
	.4byte	0x291
	.uleb128 0xd
	.4byte	.LASF48
	.uleb128 0x8
	.byte	0x4
	.4byte	0x29c
	.uleb128 0xe
	.4byte	.LASF52
	.byte	0x2
	.byte	0x1e
	.byte	0x3
	.4byte	0x2d5
	.uleb128 0xf
	.4byte	.LASF51
	.byte	0x2
	.byte	0x1e
	.4byte	0x142
	.uleb128 0xf
	.4byte	.LASF25
	.byte	0x2
	.byte	0x1f
	.4byte	0x142
	.uleb128 0xf
	.4byte	.LASF24
	.byte	0x2
	.byte	0x1f
	.4byte	0x142
	.byte	0
	.uleb128 0x10
	.4byte	.LASF87
	.byte	0x1
	.byte	0xa3
	.byte	0x3
	.uleb128 0xe
	.4byte	.LASF53
	.byte	0x2
	.byte	0x27
	.byte	0x3
	.4byte	0x300
	.uleb128 0xf
	.4byte	.LASF51
	.byte	0x2
	.byte	0x27
	.4byte	0x142
	.uleb128 0xf
	.4byte	.LASF54
	.byte	0x2
	.byte	0x27
	.4byte	0x142
	.byte	0
	.uleb128 0xe
	.4byte	.LASF55
	.byte	0x2
	.byte	0x19
	.byte	0x3
	.4byte	0x318
	.uleb128 0xf
	.4byte	.LASF56
	.byte	0x2
	.byte	0x19
	.4byte	0x142
	.byte	0
	.uleb128 0x11
	.4byte	.LASF88
	.byte	0x1
	.byte	0xa9
	.4byte	.LFB49
	.4byte	.LFE49-.LFB49
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x368
	.uleb128 0x12
	.4byte	0x2d5
	.4byte	.LBB14
	.4byte	.LBE14-.LBB14
	.byte	0x1
	.byte	0xac
	.4byte	0x354
	.uleb128 0x13
	.4byte	.LVL1
	.4byte	0xa81
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x33333333
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LVL0
	.4byte	0xa81
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x66666666
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF89
	.byte	0x1
	.byte	0x13
	.4byte	0x280
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3f4
	.uleb128 0x16
	.ascii	"pid\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x107
	.4byte	.LLST0
	.uleb128 0x17
	.4byte	.LASF60
	.byte	0x1
	.byte	0x14
	.4byte	0x280
	.4byte	.LLST1
	.uleb128 0x18
	.4byte	.LVL3
	.4byte	0xa92
	.4byte	0x3ba
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x8
	.byte	0x6c
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x18
	.4byte	.LVL5
	.4byte	0xaac
	.4byte	0x3d9
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x2
	.byte	0x8
	.byte	0x34
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 36
	.byte	0
	.uleb128 0x13
	.4byte	.LVL6
	.4byte	0xaac
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x3f
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 12
	.byte	0
	.byte	0
	.uleb128 0x19
	.4byte	.LASF79
	.byte	0x1
	.byte	0x5f
	.4byte	0x2c
	.byte	0x1
	.4byte	0x41b
	.uleb128 0x1a
	.ascii	"pid\000"
	.byte	0x1
	.byte	0x5f
	.4byte	0x2c
	.uleb128 0xf
	.4byte	.LASF41
	.byte	0x1
	.byte	0x5f
	.4byte	0x2c
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF57
	.byte	0x1
	.byte	0x65
	.4byte	.LFB43
	.4byte	.LFE43-.LFB43
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x46f
	.uleb128 0x16
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x65
	.4byte	0xfa
	.4byte	.LLST2
	.uleb128 0x12
	.4byte	0x3f4
	.4byte	.LBB18
	.4byte	.LBE18-.LBB18
	.byte	0x1
	.byte	0x68
	.4byte	0x465
	.uleb128 0x1c
	.4byte	0x40f
	.4byte	.LLST3
	.uleb128 0x1c
	.4byte	0x404
	.4byte	.LLST4
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL11
	.4byte	0xac7
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF58
	.byte	0x1
	.byte	0x6a
	.4byte	.LFB44
	.4byte	.LFE44-.LFB44
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4c3
	.uleb128 0x16
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x6a
	.4byte	0xfa
	.4byte	.LLST5
	.uleb128 0x12
	.4byte	0x3f4
	.4byte	.LBB22
	.4byte	.LBE22-.LBB22
	.byte	0x1
	.byte	0x6c
	.4byte	0x4b9
	.uleb128 0x1c
	.4byte	0x40f
	.4byte	.LLST6
	.uleb128 0x1c
	.4byte	0x404
	.4byte	.LLST7
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL15
	.4byte	0xac7
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF59
	.byte	0x1
	.byte	0x6e
	.4byte	.LFB45
	.4byte	.LFE45-.LFB45
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x517
	.uleb128 0x16
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x6e
	.4byte	0xfa
	.4byte	.LLST8
	.uleb128 0x12
	.4byte	0x3f4
	.4byte	.LBB26
	.4byte	.LBE26-.LBB26
	.byte	0x1
	.byte	0x70
	.4byte	0x50d
	.uleb128 0x1c
	.4byte	0x40f
	.4byte	.LLST9
	.uleb128 0x1c
	.4byte	0x404
	.4byte	.LLST10
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL19
	.4byte	0xac7
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF61
	.byte	0x1
	.byte	0x2a
	.4byte	0xfa
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x588
	.uleb128 0x1f
	.4byte	.LASF60
	.byte	0x1
	.byte	0x2a
	.4byte	0x280
	.4byte	.LLST11
	.uleb128 0x1f
	.4byte	.LASF43
	.byte	0x1
	.byte	0x2a
	.4byte	0xfc
	.4byte	.LLST12
	.uleb128 0x18
	.4byte	.LVL23
	.4byte	0xaac
	.4byte	0x56c
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x40
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.uleb128 0x13
	.4byte	.LVL24
	.4byte	0xad8
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x3f
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x81
	.sleb128 0
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x20
	.4byte	.LASF67
	.byte	0x1
	.byte	0x31
	.byte	0x1
	.4byte	0x5a0
	.uleb128 0xf
	.4byte	.LASF60
	.byte	0x1
	.byte	0x31
	.4byte	0x280
	.byte	0
	.uleb128 0x21
	.4byte	0x588
	.4byte	.LFB39
	.4byte	.LFE39-.LFB39
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5bb
	.uleb128 0x22
	.4byte	0x594
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x21
	.4byte	0x3f4
	.4byte	.LFB42
	.4byte	.LFE42-.LFB42
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5df
	.uleb128 0x1c
	.4byte	0x404
	.4byte	.LLST13
	.uleb128 0x22
	.4byte	0x40f
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x23
	.4byte	.LASF68
	.byte	0x1
	.byte	0x73
	.4byte	0x3a
	.4byte	.LFB46
	.4byte	.LFE46-.LFB46
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x608
	.uleb128 0x24
	.ascii	"i\000"
	.byte	0x1
	.byte	0x74
	.4byte	0x3a
	.uleb128 0x5
	.byte	0x3
	.4byte	i.2891
	.byte	0
	.uleb128 0x25
	.4byte	.LASF90
	.byte	0x1
	.byte	0x56
	.4byte	0x3a
	.byte	0x1
	.4byte	0x624
	.uleb128 0xf
	.4byte	.LASF60
	.byte	0x1
	.byte	0x56
	.4byte	0x280
	.byte	0
	.uleb128 0x1e
	.4byte	.LASF62
	.byte	0x1
	.byte	0xb3
	.4byte	0x107
	.4byte	.LFB50
	.4byte	.LFE50-.LFB50
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x74b
	.uleb128 0x16
	.ascii	"fn\000"
	.byte	0x1
	.byte	0xb3
	.4byte	0x756
	.4byte	.LLST14
	.uleb128 0x16
	.ascii	"arg\000"
	.byte	0x1
	.byte	0xb3
	.4byte	0xfa
	.4byte	.LLST15
	.uleb128 0x1f
	.4byte	.LASF41
	.byte	0x1
	.byte	0xb3
	.4byte	0xad
	.4byte	.LLST16
	.uleb128 0x17
	.4byte	.LASF60
	.byte	0x1
	.byte	0xb5
	.4byte	0x280
	.4byte	.LLST17
	.uleb128 0x26
	.ascii	"ret\000"
	.byte	0x1
	.byte	0xb6
	.4byte	0x107
	.4byte	.LLST18
	.uleb128 0x17
	.4byte	.LASF63
	.byte	0x1
	.byte	0xb8
	.4byte	0x107
	.4byte	.LLST19
	.uleb128 0x27
	.4byte	.LASF91
	.byte	0x1
	.byte	0xd6
	.4byte	.L18
	.uleb128 0x12
	.4byte	0x608
	.4byte	.LBB34
	.4byte	.LBE34-.LBB34
	.byte	0x1
	.byte	0xc7
	.4byte	0x6d5
	.uleb128 0x1c
	.4byte	0x618
	.4byte	.LLST20
	.uleb128 0x13
	.4byte	.LVL36
	.4byte	0xa92
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x3
	.byte	0xa
	.2byte	0x1000
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x81
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	0x2dd
	.4byte	.LBB36
	.4byte	.LBE36-.LBB36
	.byte	0x1
	.byte	0xcf
	.4byte	0x726
	.uleb128 0x1c
	.4byte	0x2f4
	.4byte	.LLST21
	.uleb128 0x1c
	.4byte	0x2e9
	.4byte	.LLST22
	.uleb128 0x28
	.4byte	0x2a7
	.4byte	.LBB38
	.4byte	.LBE38-.LBB38
	.byte	0x2
	.byte	0x29
	.uleb128 0x1c
	.4byte	0x2c9
	.4byte	.LLST23
	.uleb128 0x1c
	.4byte	0x2be
	.4byte	.LLST24
	.uleb128 0x1c
	.4byte	0x2b3
	.4byte	.LLST25
	.byte	0
	.byte	0
	.uleb128 0x18
	.4byte	.LVL33
	.4byte	0x368
	.4byte	0x73a
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x81
	.sleb128 0
	.byte	0
	.uleb128 0x13
	.4byte	.LVL40
	.4byte	0xb04
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x29
	.4byte	0x756
	.uleb128 0x2a
	.4byte	0xfa
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x74b
	.uleb128 0x1b
	.4byte	.LASF64
	.byte	0x1
	.byte	0x79
	.4byte	.LFB47
	.4byte	.LFE47-.LFB47
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8f6
	.uleb128 0x16
	.ascii	"arg\000"
	.byte	0x1
	.byte	0x79
	.4byte	0xfa
	.4byte	.LLST26
	.uleb128 0x26
	.ascii	"i\000"
	.byte	0x1
	.byte	0x82
	.4byte	0x3a
	.4byte	.LLST27
	.uleb128 0x2b
	.4byte	.LASF65
	.byte	0x1
	.byte	0x83
	.4byte	0x8f6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2b
	.4byte	.LASF66
	.byte	0x1
	.byte	0x84
	.4byte	0x8f6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x26
	.ascii	"p\000"
	.byte	0x1
	.byte	0x8a
	.4byte	0x2c
	.4byte	.LLST28
	.uleb128 0x2c
	.4byte	.LASF62
	.byte	0x1
	.byte	0x8a
	.4byte	0x3a
	.4byte	0x7c7
	.uleb128 0x2d
	.byte	0
	.uleb128 0x12
	.4byte	0x3f4
	.4byte	.LBB46
	.4byte	.LBE46-.LBB46
	.byte	0x1
	.byte	0x8b
	.4byte	0x7ed
	.uleb128 0x1c
	.4byte	0x40f
	.4byte	.LLST29
	.uleb128 0x1c
	.4byte	0x404
	.4byte	.LLST30
	.byte	0
	.uleb128 0x12
	.4byte	0x3f4
	.4byte	.LBB48
	.4byte	.LBE48-.LBB48
	.byte	0x1
	.byte	0x8e
	.4byte	0x813
	.uleb128 0x1c
	.4byte	0x40f
	.4byte	.LLST31
	.uleb128 0x1c
	.4byte	0x404
	.4byte	.LLST32
	.byte	0
	.uleb128 0x12
	.4byte	0x3f4
	.4byte	.LBB50
	.4byte	.LBE50-.LBB50
	.byte	0x1
	.byte	0x91
	.4byte	0x839
	.uleb128 0x1c
	.4byte	0x40f
	.4byte	.LLST33
	.uleb128 0x1c
	.4byte	0x404
	.4byte	.LLST34
	.byte	0
	.uleb128 0x1d
	.4byte	.LVL46
	.4byte	0x5df
	.uleb128 0x1d
	.4byte	.LVL47
	.4byte	0x5df
	.uleb128 0x1d
	.4byte	.LVL48
	.4byte	0x5df
	.uleb128 0x18
	.4byte	.LVL50
	.4byte	0x624
	.4byte	0x876
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0x3
	.4byte	test2
	.byte	0
	.uleb128 0x18
	.4byte	.LVL53
	.4byte	0x624
	.4byte	0x898
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0x3
	.4byte	test3
	.byte	0
	.uleb128 0x18
	.4byte	.LVL56
	.4byte	0x624
	.4byte	0x8ba
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0x3
	.4byte	test4
	.byte	0
	.uleb128 0x18
	.4byte	.LVL59
	.4byte	0xac7
	.4byte	0x8cf
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.4byte	.LVL60
	.4byte	0xac7
	.4byte	0x8e4
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -16
	.byte	0x6
	.byte	0
	.uleb128 0x13
	.4byte	.LVL61
	.4byte	0xac7
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0x91
	.sleb128 -12
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x5
	.4byte	0x3a
	.4byte	0x906
	.uleb128 0x6
	.4byte	0xc3
	.byte	0x2
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF69
	.byte	0x1
	.byte	0xdb
	.4byte	.LFB51
	.4byte	.LFE51-.LFB51
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9bb
	.uleb128 0x17
	.4byte	.LASF70
	.byte	0x1
	.byte	0xe0
	.4byte	0x107
	.4byte	.LLST35
	.uleb128 0x2f
	.ascii	"pid\000"
	.byte	0x1
	.byte	0xec
	.4byte	0x107
	.uleb128 0x12
	.4byte	0x300
	.4byte	.LBB56
	.4byte	.LBE56-.LBB56
	.byte	0x1
	.byte	0xde
	.4byte	0x955
	.uleb128 0x22
	.4byte	0x30c
	.uleb128 0x6
	.byte	0x3
	.4byte	proc_list
	.byte	0x9f
	.byte	0
	.uleb128 0x12
	.4byte	0x588
	.4byte	.LBB58
	.4byte	.LBE58-.LBB58
	.byte	0x1
	.byte	0xea
	.4byte	0x972
	.uleb128 0x1c
	.4byte	0x594
	.4byte	.LLST36
	.byte	0
	.uleb128 0x18
	.4byte	.LVL66
	.4byte	0x368
	.4byte	0x986
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.uleb128 0x18
	.4byte	.LVL67
	.4byte	0x517
	.4byte	0x99d
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x13
	.4byte	.LVL69
	.4byte	0x624
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0x3
	.4byte	init_main
	.byte	0
	.byte	0
	.uleb128 0x2e
	.4byte	.LASF71
	.byte	0x1
	.byte	0xf2
	.4byte	.LFB52
	.4byte	.LFE52-.LFB52
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa08
	.uleb128 0x12
	.4byte	0x2d5
	.4byte	.LBB60
	.4byte	.LBE60-.LBB60
	.byte	0x1
	.byte	0xf5
	.4byte	0x9f4
	.uleb128 0x13
	.4byte	.LVL71
	.4byte	0xa81
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x13
	.4byte	.LVL72
	.4byte	0xa81
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xc
	.4byte	0x55550000
	.byte	0
	.byte	0
	.uleb128 0x2b
	.4byte	.LASF72
	.byte	0x1
	.byte	0xe
	.4byte	0x3a
	.uleb128 0x5
	.byte	0x3
	.4byte	nr_process
	.uleb128 0x30
	.4byte	.LASF73
	.byte	0x9
	.byte	0x12
	.4byte	0xa2a
	.uleb128 0x5
	.byte	0x3
	.4byte	pte_p
	.uleb128 0x8
	.byte	0x4
	.4byte	0x112
	.uleb128 0x30
	.4byte	.LASF74
	.byte	0x8
	.byte	0x10
	.4byte	0x280
	.uleb128 0x1
	.byte	0x6c
	.uleb128 0x30
	.4byte	.LASF75
	.byte	0x1
	.byte	0x9
	.4byte	0x11d
	.uleb128 0x5
	.byte	0x3
	.4byte	proc_list
	.uleb128 0x30
	.4byte	.LASF76
	.byte	0x1
	.byte	0xb
	.4byte	0x280
	.uleb128 0x5
	.byte	0x3
	.4byte	idleproc
	.uleb128 0x30
	.4byte	.LASF77
	.byte	0x1
	.byte	0xc
	.4byte	0x280
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
	.4byte	.LASF78
	.byte	0xa
	.byte	0xe
	.4byte	0xa92
	.uleb128 0x2a
	.4byte	0x2c
	.byte	0
	.uleb128 0x33
	.4byte	.LASF80
	.byte	0xb
	.byte	0x16
	.4byte	0xfa
	.4byte	0xaac
	.uleb128 0x2a
	.4byte	0x107
	.uleb128 0x2a
	.4byte	0xef
	.byte	0
	.uleb128 0x32
	.4byte	.LASF81
	.byte	0xc
	.byte	0x8
	.4byte	0xac7
	.uleb128 0x2a
	.4byte	0xfa
	.uleb128 0x2a
	.4byte	0x97
	.uleb128 0x2a
	.4byte	0xad
	.byte	0
	.uleb128 0x32
	.4byte	.LASF82
	.byte	0xa
	.byte	0xc
	.4byte	0xad8
	.uleb128 0x2a
	.4byte	0x2c
	.byte	0
	.uleb128 0x32
	.4byte	.LASF83
	.byte	0xc
	.byte	0x6
	.4byte	0xaf3
	.uleb128 0x2a
	.4byte	0xaf3
	.uleb128 0x2a
	.4byte	0xaf9
	.uleb128 0x2a
	.4byte	0xad
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x97
	.uleb128 0x8
	.byte	0x4
	.4byte	0xaff
	.uleb128 0x9
	.4byte	0x97
	.uleb128 0x34
	.4byte	.LASF92
	.byte	0x1
	.byte	0xf
	.uleb128 0x2a
	.4byte	0x280
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
	.uleb128 0xb
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
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x2c
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
	.uleb128 0x2d
	.uleb128 0x18
	.byte	0
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
	.uleb128 0x2f
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
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL3-1-.Ltext0
	.4byte	.LFE37-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL7-.Ltext0
	.4byte	.LFE37-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL10-.Ltext0
	.4byte	.LFE43-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL11-1-.Ltext0
	.2byte	0x2
	.byte	0x75
	.sleb128 4
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL11-1-.Ltext0
	.2byte	0x2
	.byte	0x75
	.sleb128 0
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL14-.Ltext0
	.4byte	.LFE44-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL15-1-.Ltext0
	.2byte	0x2
	.byte	0x75
	.sleb128 4
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL15-1-.Ltext0
	.2byte	0x2
	.byte	0x75
	.sleb128 0
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL18-.Ltext0
	.4byte	.LFE45-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL19-1-.Ltext0
	.2byte	0x2
	.byte	0x75
	.sleb128 4
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL19-1-.Ltext0
	.2byte	0x2
	.byte	0x75
	.sleb128 0
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL23-1-.Ltext0
	.2byte	0x3
	.byte	0x74
	.sleb128 -12
	.byte	0x9f
	.4byte	.LVL23-1-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x3
	.byte	0x80
	.sleb128 -12
	.byte	0x9f
	.4byte	.LVL26-.Ltext0
	.4byte	.LFE38-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x1
	.byte	0x61
	.4byte	.LVL25-.Ltext0
	.4byte	.LFE38-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL29-.Ltext0
	.4byte	.LFE42-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL30-.Ltext0
	.4byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL32-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x62
	.4byte	.LVL41-.Ltext0
	.4byte	.LFE50-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL30-.Ltext0
	.4byte	.LVL33-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL33-1-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x65
	.4byte	.LVL41-.Ltext0
	.4byte	.LFE50-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL30-.Ltext0
	.4byte	.LVL33-1-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL33-1-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x63
	.4byte	.LVL41-.Ltext0
	.4byte	.LFE50-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x56
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL34-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL42-.Ltext0
	.2byte	0x1
	.byte	0x64
	.4byte	.LVL42-.Ltext0
	.4byte	.LFE50-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL31-.Ltext0
	.4byte	.LVL43-.Ltext0
	.2byte	0x1
	.byte	0x61
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL35-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x6
	.byte	0x3
	.4byte	proc_list
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL37-.Ltext0
	.4byte	.LVL40-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL40-1-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x4
	.byte	0x80
	.sleb128 88
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL39-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL39-.Ltext0
	.4byte	.LVL40-1-.Ltext0
	.2byte	0x2
	.byte	0x73
	.sleb128 0
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x6
	.byte	0x3
	.4byte	proc_list
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL38-.Ltext0
	.4byte	.LVL40-1-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL40-1-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x4
	.byte	0x80
	.sleb128 88
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL46-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL46-1-.Ltext0
	.4byte	.LFE47-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL45-.Ltext0
	.4byte	.LVL46-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL46-.Ltext0
	.4byte	.LVL47-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL47-.Ltext0
	.4byte	.LVL49-.Ltext0
	.2byte	0x2
	.byte	0x32
	.byte	0x9f
	.4byte	.LVL49-.Ltext0
	.4byte	.LVL58-.Ltext0
	.2byte	0x2
	.byte	0x33
	.byte	0x9f
	.4byte	.LVL58-.Ltext0
	.4byte	.LVL59-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL59-.Ltext0
	.4byte	.LVL60-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL60-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x2
	.byte	0x32
	.byte	0x9f
	.4byte	.LVL61-.Ltext0
	.4byte	.LFE47-.Ltext0
	.2byte	0x2
	.byte	0x33
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST28:
	.4byte	.LVL50-.Ltext0
	.4byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL56-.Ltext0
	.4byte	.LVL57-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST29:
	.4byte	.LVL50-.Ltext0
	.4byte	.LVL52-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL52-.Ltext0
	.4byte	.LVL63-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -32
	.4byte	.LVL63-.Ltext0
	.4byte	.LFE47-.Ltext0
	.2byte	0x2
	.byte	0x8d
	.sleb128 -32
	.4byte	0
	.4byte	0
.LLST30:
	.4byte	.LVL50-.Ltext0
	.4byte	.LVL51-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST31:
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL55-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL55-.Ltext0
	.4byte	.LVL63-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -28
	.4byte	.LVL63-.Ltext0
	.4byte	.LFE47-.Ltext0
	.2byte	0x2
	.byte	0x8d
	.sleb128 -28
	.4byte	0
	.4byte	0
.LLST32:
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST33:
	.4byte	.LVL56-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL62-.Ltext0
	.4byte	.LVL63-.Ltext0
	.2byte	0x2
	.byte	0x91
	.sleb128 -24
	.4byte	.LVL63-.Ltext0
	.4byte	.LFE47-.Ltext0
	.2byte	0x2
	.byte	0x8d
	.sleb128 -24
	.4byte	0
	.4byte	0
.LLST34:
	.4byte	.LVL56-.Ltext0
	.4byte	.LVL57-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST35:
	.4byte	.LVL65-.Ltext0
	.4byte	.LVL70-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	0
	.4byte	0
.LLST36:
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL69-1-.Ltext0
	.2byte	0x5
	.byte	0x3
	.4byte	idleproc
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
.LASF76:
	.ascii	"idleproc\000"
.LASF67:
	.ascii	"set_current\000"
.LASF21:
	.ascii	"size_t\000"
.LASF16:
	.ascii	"uint64_t\000"
.LASF7:
	.ascii	"__uint8_t\000"
.LASF25:
	.ascii	"prev\000"
.LASF64:
	.ascii	"init_main\000"
.LASF89:
	.ascii	"alloc_proc\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF51:
	.ascii	"new_node\000"
.LASF57:
	.ascii	"test2\000"
.LASF79:
	.ascii	"catOutput\000"
.LASF59:
	.ascii	"test4\000"
.LASF24:
	.ascii	"next\000"
.LASF71:
	.ascii	"cpu_idle\000"
.LASF11:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF88:
	.ascii	"do_exit\000"
.LASF62:
	.ascii	"create_proc\000"
.LASF66:
	.ascii	"outputValue\000"
.LASF45:
	.ascii	"parent\000"
.LASF42:
	.ascii	"state\000"
.LASF9:
	.ascii	"long int\000"
.LASF52:
	.ascii	"__list_add\000"
.LASF29:
	.ascii	"reg16\000"
.LASF30:
	.ascii	"reg17\000"
.LASF31:
	.ascii	"reg18\000"
.LASF32:
	.ascii	"reg19\000"
.LASF19:
	.ascii	"double\000"
.LASF75:
	.ascii	"proc_list\000"
.LASF10:
	.ascii	"__uint32_t\000"
.LASF63:
	.ascii	"porc_id\000"
.LASF82:
	.ascii	"writeValTo7SegsDec\000"
.LASF72:
	.ascii	"nr_process\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF33:
	.ascii	"reg20\000"
.LASF34:
	.ascii	"reg21\000"
.LASF35:
	.ascii	"reg22\000"
.LASF36:
	.ascii	"reg23\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF37:
	.ascii	"reg29\000"
.LASF53:
	.ascii	"list_add\000"
.LASF69:
	.ascii	"proc_init\000"
.LASF85:
	.ascii	"process/proc.c\000"
.LASF43:
	.ascii	"name\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF41:
	.ascii	"priority\000"
.LASF86:
	.ascii	"C:\\Users\\lzy05\\OneDrive\\18-19-Fall\\SCD\\git\\src\000"
.LASF78:
	.ascii	"writeValTo7SegsHex\000"
.LASF49:
	.ascii	"fs_struct\000"
.LASF70:
	.ascii	"idle_pid\000"
.LASF48:
	.ascii	"namespace\000"
.LASF38:
	.ascii	"reg30\000"
.LASF39:
	.ascii	"reg31\000"
.LASF74:
	.ascii	"__current_task\000"
.LASF17:
	.ascii	"sizetype\000"
.LASF73:
	.ascii	"pte_p\000"
.LASF23:
	.ascii	"pte_t\000"
.LASF46:
	.ascii	"list_link\000"
.LASF60:
	.ascii	"proc\000"
.LASF77:
	.ascii	"current\000"
.LASF12:
	.ascii	"__uint64_t\000"
.LASF20:
	.ascii	"float\000"
.LASF87:
	.ascii	"sys_schedule\000"
.LASF44:
	.ascii	"kstack\000"
.LASF14:
	.ascii	"int32_t\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF5:
	.ascii	"short int\000"
.LASF13:
	.ascii	"uint8_t\000"
.LASF54:
	.ascii	"head\000"
.LASF15:
	.ascii	"uint32_t\000"
.LASF68:
	.ascii	"keyboard_input\000"
.LASF18:
	.ascii	"char\000"
.LASF26:
	.ascii	"list_head\000"
.LASF8:
	.ascii	"__int32_t\000"
.LASF90:
	.ascii	"setup_kstack\000"
.LASF83:
	.ascii	"memcpy\000"
.LASF55:
	.ascii	"init_list_head\000"
.LASF27:
	.ascii	"context\000"
.LASF58:
	.ascii	"test3\000"
.LASF61:
	.ascii	"set_proc_name\000"
.LASF65:
	.ascii	"inputValue\000"
.LASF81:
	.ascii	"memset\000"
.LASF50:
	.ascii	"files_struct\000"
.LASF40:
	.ascii	"task_struct\000"
.LASF84:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF91:
	.ascii	"fork_out\000"
.LASF92:
	.ascii	"wakeup_proc\000"
.LASF80:
	.ascii	"kmalloc\000"
.LASF22:
	.ascii	"pid_t\000"
.LASF56:
	.ascii	"list\000"
.LASF28:
	.ascii	"args\000"
.LASF47:
	.ascii	"files\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
