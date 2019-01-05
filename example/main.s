	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	main
.LFB1 = .
	.file 1 "main.c"
	.loc 1 13 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL0 = .
	.loc 1 16 0
	li	$2,1365			# 0x555
	li	$3,12345			# 0x3039
	swl	$3,3($2)
	swr	$3,0($2)
	.loc 1 18 0
	jr	$31
	move	$2,$0

	.set	macro
	.set	reorder
	.end	main
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.align	2
	.globl	_mips_handle_exception
.LFB2 = .
	.loc 1 21 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	_mips_handle_exception
	.type	_mips_handle_exception, @function
_mips_handle_exception:
	.frame	$sp,8,$31		# vars= 8, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
.LVL1 = .
	addiu	$sp,$sp,-8
	.cfi_def_cfa_offset 8
.LBB2 = .
	.loc 1 22 0
 #APP
 # 22 "main.c" 1
	mfc0 $2,$8,0
 # 0 "" 2
.LVL2 = .
 #NO_APP
.LBE2 = .
	sw	$2,0($sp)
	.loc 1 23 0
	.set	noreorder
	.set	nomacro
	jr	$31
	addiu	$sp,$sp,8
	.set	macro
	.set	reorder

	.cfi_def_cfa_offset 0
	.end	_mips_handle_exception
	.cfi_endproc
.LFE2:
	.size	_mips_handle_exception, .-_mips_handle_exception
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\mips\\m32c0.h"
	.file 3 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\machine\\_default_types.h"
	.file 4 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\stdint.h"
	.file 5 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\mips\\hal.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x2b7
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x1
	.4byte	.LASF29
	.4byte	.LASF30
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
	.4byte	.LASF8
	.byte	0x2
	.2byte	0x396
	.4byte	0x2c
	.uleb128 0x4
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
	.uleb128 0x5
	.4byte	.LASF9
	.byte	0x3
	.byte	0x38
	.4byte	0x25
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x5
	.4byte	.LASF11
	.byte	0x4
	.byte	0x42
	.4byte	0x70
	.uleb128 0x6
	.byte	0x7c
	.byte	0x5
	.byte	0xec
	.4byte	0x10a
	.uleb128 0x7
	.ascii	"at\000"
	.byte	0x5
	.byte	0xee
	.4byte	0x3a
	.byte	0
	.uleb128 0x7
	.ascii	"v\000"
	.byte	0x5
	.byte	0xef
	.4byte	0x10a
	.byte	0x4
	.uleb128 0x7
	.ascii	"a\000"
	.byte	0x5
	.byte	0xf4
	.4byte	0x121
	.byte	0xc
	.uleb128 0x7
	.ascii	"t\000"
	.byte	0x5
	.byte	0xf5
	.4byte	0x131
	.byte	0x1c
	.uleb128 0x7
	.ascii	"s\000"
	.byte	0x5
	.byte	0xf7
	.4byte	0x131
	.byte	0x3c
	.uleb128 0x7
	.ascii	"t2\000"
	.byte	0x5
	.byte	0xf8
	.4byte	0x10a
	.byte	0x5c
	.uleb128 0x7
	.ascii	"k\000"
	.byte	0x5
	.byte	0xf9
	.4byte	0x10a
	.byte	0x64
	.uleb128 0x7
	.ascii	"gp\000"
	.byte	0x5
	.byte	0xfa
	.4byte	0x3a
	.byte	0x6c
	.uleb128 0x7
	.ascii	"sp\000"
	.byte	0x5
	.byte	0xfb
	.4byte	0x3a
	.byte	0x70
	.uleb128 0x7
	.ascii	"fp\000"
	.byte	0x5
	.byte	0xfc
	.4byte	0x3a
	.byte	0x74
	.uleb128 0x7
	.ascii	"ra\000"
	.byte	0x5
	.byte	0xfd
	.4byte	0x3a
	.byte	0x78
	.byte	0
	.uleb128 0x8
	.4byte	0x3a
	.4byte	0x11a
	.uleb128 0x9
	.4byte	0x11a
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x8
	.4byte	0x3a
	.4byte	0x131
	.uleb128 0x9
	.4byte	0x11a
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.4byte	0x3a
	.4byte	0x141
	.uleb128 0x9
	.4byte	0x11a
	.byte	0x7
	.byte	0
	.uleb128 0xa
	.byte	0x7c
	.byte	0x5
	.byte	0xea
	.4byte	0x158
	.uleb128 0xb
	.4byte	0x8d
	.uleb128 0xc
	.ascii	"r\000"
	.byte	0x5
	.byte	0xff
	.4byte	0x158
	.byte	0
	.uleb128 0x8
	.4byte	0x3a
	.4byte	0x168
	.uleb128 0x9
	.4byte	0x11a
	.byte	0x1e
	.byte	0
	.uleb128 0xd
	.4byte	.LASF19
	.byte	0xa0
	.byte	0x5
	.byte	0xe8
	.4byte	0x1ee
	.uleb128 0xe
	.4byte	0x141
	.byte	0
	.uleb128 0xf
	.ascii	"epc\000"
	.byte	0x5
	.2byte	0x102
	.4byte	0x3a
	.byte	0x7c
	.uleb128 0x10
	.4byte	.LASF13
	.byte	0x5
	.2byte	0x103
	.4byte	0x3a
	.byte	0x80
	.uleb128 0xf
	.ascii	"hi\000"
	.byte	0x5
	.2byte	0x104
	.4byte	0x3a
	.byte	0x84
	.uleb128 0xf
	.ascii	"lo\000"
	.byte	0x5
	.2byte	0x105
	.4byte	0x3a
	.byte	0x88
	.uleb128 0x10
	.4byte	.LASF14
	.byte	0x5
	.2byte	0x107
	.4byte	0x215
	.byte	0x8c
	.uleb128 0x10
	.4byte	.LASF15
	.byte	0x5
	.2byte	0x10a
	.4byte	0x82
	.byte	0x90
	.uleb128 0x10
	.4byte	.LASF16
	.byte	0x5
	.2byte	0x10c
	.4byte	0x82
	.byte	0x94
	.uleb128 0x10
	.4byte	.LASF17
	.byte	0x5
	.2byte	0x10d
	.4byte	0x82
	.byte	0x98
	.uleb128 0x10
	.4byte	.LASF18
	.byte	0x5
	.2byte	0x10e
	.4byte	0x82
	.byte	0x9c
	.byte	0
	.uleb128 0x11
	.4byte	.LASF20
	.byte	0x8
	.byte	0x5
	.2byte	0x111
	.4byte	0x215
	.uleb128 0xf
	.ascii	"id\000"
	.byte	0x5
	.2byte	0x113
	.4byte	0x3a
	.byte	0
	.uleb128 0x10
	.4byte	.LASF21
	.byte	0x5
	.2byte	0x114
	.4byte	0x215
	.byte	0x4
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x1ee
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF22
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF23
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF24
	.uleb128 0x13
	.4byte	.LASF25
	.byte	0x1
	.byte	0xd
	.4byte	0x46
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x255
	.uleb128 0x14
	.ascii	"i\000"
	.byte	0x1
	.byte	0xe
	.4byte	0x255
	.2byte	0x555
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x25b
	.uleb128 0x15
	.4byte	0x46
	.uleb128 0x16
	.4byte	.LASF26
	.byte	0x5
	.2byte	0x186
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2b4
	.uleb128 0x17
	.ascii	"ctx\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x2b4
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x18
	.4byte	.LASF27
	.byte	0x1
	.byte	0x15
	.4byte	0x46
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x19
	.ascii	"j\000"
	.byte	0x1
	.byte	0x16
	.4byte	0x25b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1a
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x19
	.ascii	"__r\000"
	.byte	0x1
	.byte	0x16
	.4byte	0x25
	.uleb128 0x1
	.byte	0x52
	.byte	0
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.4byte	0x168
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x14
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
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.byte	0
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
.LASF5:
	.ascii	"short int\000"
.LASF12:
	.ascii	"sizetype\000"
.LASF25:
	.ascii	"main\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF19:
	.ascii	"gpctx\000"
.LASF17:
	.ascii	"badinstr\000"
.LASF30:
	.ascii	"C:\\Users\\lzy05\\OneDrive\\Desktop\\CExample\000"
.LASF14:
	.ascii	"link\000"
.LASF24:
	.ascii	"float\000"
.LASF27:
	.ascii	"exception\000"
.LASF10:
	.ascii	"long long int\000"
.LASF7:
	.ascii	"long int\000"
.LASF18:
	.ascii	"badpinstr\000"
.LASF28:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF3:
	.ascii	"signed char\000"
.LASF16:
	.ascii	"cause\000"
.LASF2:
	.ascii	"long long unsigned int\000"
.LASF11:
	.ascii	"uint32_t\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF8:
	.ascii	"reg_t\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF15:
	.ascii	"status\000"
.LASF22:
	.ascii	"char\000"
.LASF20:
	.ascii	"linkctx\000"
.LASF29:
	.ascii	"main.c\000"
.LASF0:
	.ascii	"long unsigned int\000"
.LASF23:
	.ascii	"double\000"
.LASF13:
	.ascii	"badvaddr\000"
.LASF26:
	.ascii	"_mips_handle_exception\000"
.LASF21:
	.ascii	"next\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
