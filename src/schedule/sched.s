	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	wakeup_proc
.LFB24 = .
	.file 1 "schedule/sched.c"
	.loc 1 6 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	wakeup_proc
	.type	wakeup_proc, @function
wakeup_proc:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL0 = .
	.loc 1 7 0
	lw	$2,8($4)
	bnel	$2,$0,.L3
	sw	$0,8($4)

.L3:
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	wakeup_proc
	.cfi_endproc
.LFE24:
	.size	wakeup_proc, .-wakeup_proc
	.align	2
	.globl	schedule
.LFB25 = .
	.loc 1 16 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	schedule
	.type	schedule, @function
schedule:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL1 = .
	.loc 1 21 0
	move	$2,$0
	.loc 1 19 0
	move	$7,$0
	.loc 1 23 0
	addiu	$3,$28,%gp_rel(proc_list)
	.loc 1 25 0
	move	$5,$3
.LVL2 = .
.L10:
	lw	$3,0($3)
.LVL3 = .
.L13:
	beq	$3,$5,.L5
	nop

.LVL4 = .
	.loc 1 28 0
	lw	$4,-80($3)
	bnel	$4,$0,.L13
	lw	$3,0($3)

	.loc 1 30 0
	lw	$4,-84($3)
	slt	$6,$7,$4
	beql	$6,$0,.L13
	lw	$3,0($3)

	.loc 1 26 0
	addiu	$2,$3,-88
.LVL5 = .
	.loc 1 32 0
	b	.L10
	move	$7,$4

.LVL6 = .
.L12:
	.loc 1 44 0 discriminator 1
	beq	$3,$0,.L14
	nop

.L8:
.LVL7 = .
	.loc 1 45 0
	jr	$31
	lw	$2,%gp_rel(idleproc)($28)

.LVL8 = .
.L5:
	.loc 1 44 0
	bnel	$2,$0,.L12
	lw	$3,8($2)

	b	.L8
	nop

.LVL9 = .
.L14:
	.loc 1 49 0
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	schedule
	.cfi_endproc
.LFE25:
	.size	schedule, .-schedule
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\machine\\_default_types.h"
	.file 3 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\stdint.h"
	.file 4 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\sys\\types.h"
	.file 5 "./include/types.h"
	.file 6 "./include/task/proc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x32a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF55
	.byte	0x1
	.4byte	.LASF56
	.4byte	.LASF57
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
	.uleb128 0x5
	.4byte	0xae
	.4byte	0xae
	.uleb128 0x6
	.4byte	0x97
	.byte	0xf
	.byte	0
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
	.byte	0xc1
	.4byte	0x3a
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.byte	0x5
	.byte	0x1b
	.4byte	0xe7
	.uleb128 0x8
	.4byte	.LASF18
	.sleb128 0
	.uleb128 0x8
	.4byte	.LASF19
	.sleb128 1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x5
	.byte	0x1e
	.4byte	0xce
	.uleb128 0x9
	.4byte	.LASF23
	.byte	0x8
	.byte	0x5
	.byte	0x37
	.4byte	0x117
	.uleb128 0xa
	.4byte	.LASF21
	.byte	0x5
	.byte	0x38
	.4byte	0x117
	.byte	0
	.uleb128 0xa
	.4byte	.LASF22
	.byte	0x5
	.byte	0x39
	.4byte	0x117
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0xf2
	.uleb128 0x9
	.4byte	.LASF24
	.byte	0x34
	.byte	0x6
	.byte	0x7
	.4byte	0x1c5
	.uleb128 0xc
	.ascii	"pc\000"
	.byte	0x6
	.byte	0x8
	.4byte	0x8c
	.byte	0
	.uleb128 0xa
	.4byte	.LASF25
	.byte	0x6
	.byte	0x9
	.4byte	0x8c
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF26
	.byte	0x6
	.byte	0xa
	.4byte	0x8c
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF27
	.byte	0x6
	.byte	0xb
	.4byte	0x8c
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF28
	.byte	0x6
	.byte	0xb
	.4byte	0x8c
	.byte	0x10
	.uleb128 0xa
	.4byte	.LASF29
	.byte	0x6
	.byte	0xb
	.4byte	0x8c
	.byte	0x14
	.uleb128 0xa
	.4byte	.LASF30
	.byte	0x6
	.byte	0xb
	.4byte	0x8c
	.byte	0x18
	.uleb128 0xa
	.4byte	.LASF31
	.byte	0x6
	.byte	0xb
	.4byte	0x8c
	.byte	0x1c
	.uleb128 0xa
	.4byte	.LASF32
	.byte	0x6
	.byte	0xb
	.4byte	0x8c
	.byte	0x20
	.uleb128 0xa
	.4byte	.LASF33
	.byte	0x6
	.byte	0xb
	.4byte	0x8c
	.byte	0x24
	.uleb128 0xa
	.4byte	.LASF34
	.byte	0x6
	.byte	0xc
	.4byte	0x8c
	.byte	0x28
	.uleb128 0xa
	.4byte	.LASF35
	.byte	0x6
	.byte	0xc
	.4byte	0x8c
	.byte	0x2c
	.uleb128 0xa
	.4byte	.LASF36
	.byte	0x6
	.byte	0xc
	.4byte	0x8c
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.4byte	.LASF37
	.byte	0x6c
	.byte	0x6
	.byte	0x1b
	.4byte	0x255
	.uleb128 0xc
	.ascii	"pid\000"
	.byte	0x6
	.byte	0x1d
	.4byte	0xc3
	.byte	0
	.uleb128 0xa
	.4byte	.LASF38
	.byte	0x6
	.byte	0x1f
	.4byte	0x81
	.byte	0x4
	.uleb128 0xa
	.4byte	.LASF39
	.byte	0x6
	.byte	0x20
	.4byte	0x81
	.byte	0x8
	.uleb128 0xa
	.4byte	.LASF40
	.byte	0x6
	.byte	0x21
	.4byte	0x9e
	.byte	0xc
	.uleb128 0xa
	.4byte	.LASF41
	.byte	0x6
	.byte	0x22
	.4byte	0x8c
	.byte	0x1c
	.uleb128 0xa
	.4byte	.LASF42
	.byte	0x6
	.byte	0x24
	.4byte	0x255
	.byte	0x20
	.uleb128 0xa
	.4byte	.LASF24
	.byte	0x6
	.byte	0x25
	.4byte	0x11d
	.byte	0x24
	.uleb128 0xa
	.4byte	.LASF43
	.byte	0x6
	.byte	0x27
	.4byte	0xf2
	.byte	0x58
	.uleb128 0xc
	.ascii	"fs\000"
	.byte	0x6
	.byte	0x28
	.4byte	0x260
	.byte	0x60
	.uleb128 0xa
	.4byte	.LASF44
	.byte	0x6
	.byte	0x29
	.4byte	0x26b
	.byte	0x64
	.uleb128 0xa
	.4byte	.LASF45
	.byte	0x6
	.byte	0x2a
	.4byte	0x276
	.byte	0x68
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x1c5
	.uleb128 0xd
	.4byte	.LASF46
	.uleb128 0xb
	.byte	0x4
	.4byte	0x25b
	.uleb128 0xd
	.4byte	.LASF47
	.uleb128 0xb
	.byte	0x4
	.4byte	0x266
	.uleb128 0xd
	.4byte	.LASF45
	.uleb128 0xb
	.byte	0x4
	.4byte	0x271
	.uleb128 0xe
	.4byte	.LASF58
	.byte	0x1
	.byte	0x6
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x29f
	.uleb128 0xf
	.4byte	.LASF59
	.byte	0x1
	.byte	0x6
	.4byte	0x255
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x10
	.4byte	.LASF60
	.byte	0x1
	.byte	0x10
	.4byte	0x255
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x30a
	.uleb128 0x11
	.4byte	.LASF48
	.byte	0x1
	.byte	0x11
	.4byte	0xe7
	.uleb128 0x12
	.ascii	"le\000"
	.byte	0x1
	.byte	0x12
	.4byte	0x117
	.4byte	.LLST0
	.uleb128 0x11
	.4byte	.LASF49
	.byte	0x1
	.byte	0x12
	.4byte	0x117
	.uleb128 0x13
	.4byte	.LASF50
	.byte	0x1
	.byte	0x13
	.4byte	0x81
	.4byte	.LLST1
	.uleb128 0x13
	.4byte	.LASF21
	.byte	0x1
	.byte	0x14
	.4byte	0x255
	.4byte	.LLST2
	.uleb128 0x13
	.4byte	.LASF51
	.byte	0x1
	.byte	0x15
	.4byte	0x255
	.4byte	.LLST3
	.byte	0
	.uleb128 0x14
	.4byte	.LASF52
	.byte	0x6
	.byte	0x10
	.4byte	0x255
	.uleb128 0x1
	.byte	0x6c
	.uleb128 0x15
	.4byte	.LASF53
	.byte	0x6
	.byte	0x19
	.4byte	0xf2
	.uleb128 0x15
	.4byte	.LASF54
	.byte	0x6
	.byte	0x3c
	.4byte	0x255
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
	.uleb128 0x8
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-.Ltext0
	.2byte	0x4
	.byte	0x73
	.sleb128 -88
	.byte	0x9f
	.4byte	.LVL5-.Ltext0
	.4byte	.LVL6-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2-.Ltext0
	.4byte	.LFE25-.Ltext0
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
.LASF54:
	.ascii	"idleproc\000"
.LASF48:
	.ascii	"intr_flag\000"
.LASF22:
	.ascii	"prev\000"
.LASF52:
	.ascii	"__current_task\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF21:
	.ascii	"next\000"
.LASF10:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF42:
	.ascii	"parent\000"
.LASF39:
	.ascii	"state\000"
.LASF7:
	.ascii	"long int\000"
.LASF26:
	.ascii	"reg16\000"
.LASF27:
	.ascii	"reg17\000"
.LASF28:
	.ascii	"reg18\000"
.LASF29:
	.ascii	"reg19\000"
.LASF15:
	.ascii	"double\000"
.LASF56:
	.ascii	"schedule/sched.c\000"
.LASF51:
	.ascii	"current_highest\000"
.LASF53:
	.ascii	"proc_list\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF50:
	.ascii	"highest\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF30:
	.ascii	"reg20\000"
.LASF31:
	.ascii	"reg21\000"
.LASF32:
	.ascii	"reg22\000"
.LASF33:
	.ascii	"reg23\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF34:
	.ascii	"reg29\000"
.LASF60:
	.ascii	"schedule\000"
.LASF40:
	.ascii	"name\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF49:
	.ascii	"last\000"
.LASF38:
	.ascii	"priority\000"
.LASF20:
	.ascii	"bool\000"
.LASF57:
	.ascii	"C:\\Users\\lzy05\\OneDrive\\18-19-Fall\\SCD\\git\\src\000"
.LASF46:
	.ascii	"fs_struct\000"
.LASF45:
	.ascii	"namespace\000"
.LASF35:
	.ascii	"reg30\000"
.LASF36:
	.ascii	"reg31\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF43:
	.ascii	"list_link\000"
.LASF59:
	.ascii	"proc\000"
.LASF16:
	.ascii	"float\000"
.LASF41:
	.ascii	"kstack\000"
.LASF11:
	.ascii	"int32_t\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF5:
	.ascii	"short int\000"
.LASF18:
	.ascii	"false\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF14:
	.ascii	"char\000"
.LASF23:
	.ascii	"list_head\000"
.LASF8:
	.ascii	"__int32_t\000"
.LASF24:
	.ascii	"context\000"
.LASF47:
	.ascii	"files_struct\000"
.LASF37:
	.ascii	"task_struct\000"
.LASF55:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF58:
	.ascii	"wakeup_proc\000"
.LASF17:
	.ascii	"pid_t\000"
.LASF25:
	.ascii	"args\000"
.LASF44:
	.ascii	"files\000"
.LASF19:
	.ascii	"true\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
