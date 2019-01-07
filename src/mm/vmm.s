	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	oddspreg
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.globl	set_ppn_to_pte
.LFB15 = .
	.file 1 "mm/vmm.c"
	.loc 1 100 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	set_ppn_to_pte
	.type	set_ppn_to_pte, @function
set_ppn_to_pte:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL0 = .
	.loc 1 102 0
	lw	$2,0($5)
	ext	$2,$2,0,26
	lw	$3,4($5)
	sll	$4,$4,26
.LVL1 = .
	sra	$6,$4,31
	or	$2,$2,$4
	sw	$2,0($5)
	or	$3,$3,$6
	jr	$31
	sw	$3,4($5)

	.set	macro
	.set	reorder
	.end	set_ppn_to_pte
	.cfi_endproc
.LFE15:
	.size	set_ppn_to_pte, .-set_ppn_to_pte
	.align	2
	.globl	vmm_init
.LFB14 = .
	.loc 1 17 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	vmm_init
	.type	vmm_init, @function
vmm_init:
	.frame	$sp,40,$31		# vars= 0, regs= 6/0, args= 16, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
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
.LVL2 = .
	.loc 1 22 0
	li	$2,-2147352576			# 0xffffffff80020000
	sw	$2,%gp_rel(pte_p)($28)
	li	$20,34			# 0x22
	move	$16,$0
	.loc 1 36 0
	li	$18,48			# 0x30
	move	$19,$0
	.loc 1 22 0
	li	$17,-2147287040			# 0xffffffff80030000
.LVL3 = .
.L5:
	.loc 1 30 0
	sltu	$3,$16,29
	beql	$3,$0,.L3
	sw	$18,0($2)

	.loc 1 31 0
	move	$4,$0
	move	$5,$0
	sw	$4,0($2)
	sw	$5,4($2)
	.loc 1 32 0
	move	$4,$20
	jal	set_ppn_to_pte
	lw	$5,%gp_rel(pte_p)($28)

.LVL4 = .
	b	.L4
	addiu	$20,$20,1

.L3:
	.loc 1 36 0
	sw	$19,4($2)
.L4:
	.loc 1 22 0 discriminator 2
	lw	$2,%gp_rel(pte_p)($28)
	addiu	$2,$2,8
	sw	$2,%gp_rel(pte_p)($28)
.LVL5 = .
	sltu	$3,$2,$17
	bne	$3,$0,.L5
	addiu	$16,$16,1

.LVL6 = .
	.loc 1 42 0
	lui	$4,%hi(block_offset)
	sh	$0,%lo(block_offset)($4)
.LVL7 = .
	.loc 1 44 0
	lui	$3,%hi(block_flag)
	li	$2,268435456			# 0x10000000
	sw	$2,%lo(block_flag)($3)
.LVL8 = .
	.loc 1 46 0
	lui	$2,%hi(block_size)
	li	$5,1024			# 0x400
	sh	$5,%lo(block_size)($2)
.LVL9 = .
	.loc 1 49 0
	addiu	$4,$4,%lo(block_offset)
	sh	$5,2($4)
.LVL10 = .
	.loc 1 51 0
	addiu	$3,$3,%lo(block_flag)
	li	$5,134217728			# 0x8000000
	sw	$5,4($3)
.LVL11 = .
	.loc 1 53 0
	addiu	$2,$2,%lo(block_size)
	li	$5,512			# 0x200
	sh	$5,2($2)
.LVL12 = .
	.loc 1 58 0
	li	$5,1536			# 0x600
	sh	$5,4($4)
.LVL13 = .
	.loc 1 60 0
	li	$5,67108864			# 0x4000000
	sw	$5,8($3)
.LVL14 = .
	.loc 1 62 0
	li	$5,256			# 0x100
	sh	$5,4($2)
.LVL15 = .
	.loc 1 58 0
	li	$6,1792			# 0x700
	sh	$6,6($4)
.LVL16 = .
	.loc 1 60 0
	li	$6,33554432			# 0x2000000
	sw	$6,12($3)
.LVL17 = .
	.loc 1 62 0
	sh	$5,6($2)
.LVL18 = .
	.loc 1 58 0
	li	$6,2048			# 0x800
	sh	$6,8($4)
.LVL19 = .
	.loc 1 60 0
	li	$4,16777216			# 0x1000000
	sw	$4,16($3)
.LVL20 = .
	.loc 1 62 0
	sh	$5,8($2)
.LVL21 = .
	lui	$6,%hi(block_offset+10)
	addiu	$6,$6,%lo(block_offset+10)
	lui	$5,%hi(block_flag+20)
	addiu	$5,$5,%lo(block_flag+20)
	lui	$4,%hi(block_size+10)
	addiu	$4,$4,%lo(block_size+10)
	.loc 1 61 0
	li	$3,8388608			# 0x800000
	.loc 1 59 0
	li	$2,2304			# 0x900
	.loc 1 73 0
	li	$8,128			# 0x80
	.loc 1 68 0
	li	$7,3328			# 0xd00
.LVL22 = .
.L6:
	.loc 1 69 0 discriminator 3
	sh	$2,0($6)
	.loc 1 70 0 discriminator 3
	addiu	$2,$2,128
.LVL23 = .
	.loc 1 71 0 discriminator 3
	sw	$3,0($5)
	.loc 1 72 0 discriminator 3
	sra	$3,$3,1
.LVL24 = .
	.loc 1 73 0 discriminator 3
	sh	$8,0($4)
	addiu	$6,$6,2
	addiu	$5,$5,4
	.loc 1 68 0 discriminator 3
	bne	$2,$7,.L6
	addiu	$4,$4,2

	lui	$6,%hi(block_offset+26)
	addiu	$6,$6,%lo(block_offset+26)
	lui	$5,%hi(block_flag+52)
	addiu	$5,$5,%lo(block_flag+52)
	lui	$4,%hi(block_size+26)
	addiu	$4,$4,%lo(block_size+26)
	.loc 1 84 0
	li	$8,64			# 0x40
	.loc 1 79 0
	li	$7,3840			# 0xf00
.LVL25 = .
.L7:
	.loc 1 80 0 discriminator 3
	sh	$2,0($6)
	.loc 1 81 0 discriminator 3
	addiu	$2,$2,64
.LVL26 = .
	.loc 1 82 0 discriminator 3
	sw	$3,0($5)
	.loc 1 83 0 discriminator 3
	sra	$3,$3,1
.LVL27 = .
	.loc 1 84 0 discriminator 3
	sh	$8,0($4)
	addiu	$6,$6,2
	addiu	$5,$5,4
	.loc 1 79 0 discriminator 3
	bne	$2,$7,.L7
	addiu	$4,$4,2

	lui	$6,%hi(block_offset+42)
	addiu	$6,$6,%lo(block_offset+42)
	lui	$5,%hi(block_flag+84)
	addiu	$5,$5,%lo(block_flag+84)
	lui	$4,%hi(block_size+42)
	addiu	$4,$4,%lo(block_size+42)
	.loc 1 95 0
	li	$8,32			# 0x20
	.loc 1 90 0
	li	$7,4096			# 0x1000
.LVL28 = .
.L8:
	.loc 1 91 0 discriminator 3
	sh	$2,0($6)
	.loc 1 92 0 discriminator 3
	addiu	$2,$2,32
.LVL29 = .
	.loc 1 93 0 discriminator 3
	sw	$3,0($5)
	.loc 1 94 0 discriminator 3
	sra	$3,$3,1
.LVL30 = .
	.loc 1 95 0 discriminator 3
	sh	$8,0($4)
	addiu	$6,$6,2
	addiu	$5,$5,4
	.loc 1 90 0 discriminator 3
	bne	$2,$7,.L8
	addiu	$4,$4,2

	.loc 1 98 0
	lw	$31,36($sp)
	lw	$20,32($sp)
.LVL31 = .
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
.LVL32 = .
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
	.end	vmm_init
	.cfi_endproc
.LFE14:
	.size	vmm_init, .-vmm_init
	.align	2
	.globl	set_vpn_to_pte
.LFB16 = .
	.loc 1 105 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	set_vpn_to_pte
	.type	set_vpn_to_pte, @function
set_vpn_to_pte:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL33 = .
	.loc 1 107 0
	lw	$2,0($5)
	ins	$2,$0,6,16
	lw	$3,4($5)
	sll	$4,$4,6
.LVL34 = .
	sra	$6,$4,31
	or	$2,$2,$4
	sw	$2,0($5)
	or	$3,$3,$6
	jr	$31
	sw	$3,4($5)

	.set	macro
	.set	reorder
	.end	set_vpn_to_pte
	.cfi_endproc
.LFE16:
	.size	set_vpn_to_pte, .-set_vpn_to_pte
	.align	2
	.globl	get_ppn_from_page_addr
.LFB17 = .
	.loc 1 110 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	get_ppn_from_page_addr
	.type	get_ppn_from_page_addr, @function
get_ppn_from_page_addr:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL35 = .
	.loc 1 113 0
	jr	$31
	srl	$2,$4,12

	.set	macro
	.set	reorder
	.end	get_ppn_from_page_addr
	.cfi_endproc
.LFE17:
	.size	get_ppn_from_page_addr, .-get_ppn_from_page_addr
	.align	2
	.globl	get_ppn_from_pte
.LFB18 = .
	.loc 1 115 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	get_ppn_from_pte
	.type	get_ppn_from_pte, @function
get_ppn_from_pte:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL36 = .
	.loc 1 118 0
	jr	$31
	srl	$2,$4,26

	.set	macro
	.set	reorder
	.end	get_ppn_from_pte
	.cfi_endproc
.LFE18:
	.size	get_ppn_from_pte, .-get_ppn_from_pte
	.align	2
	.globl	get_vpn_from_pte
.LFB19 = .
	.loc 1 120 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	get_vpn_from_pte
	.type	get_vpn_from_pte, @function
get_vpn_from_pte:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL37 = .
	.loc 1 122 0
	li	$2,67043328			# 0x3ff0000
	ori	$2,$2,0xffc0
	and	$2,$4,$2
	.loc 1 123 0
	jr	$31
	srl	$2,$2,6

	.set	macro
	.set	reorder
	.end	get_vpn_from_pte
	.cfi_endproc
.LFE19:
	.size	get_vpn_from_pte, .-get_vpn_from_pte
	.align	2
	.globl	get_pid_from_pte
.LFB20 = .
	.loc 1 125 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	get_pid_from_pte
	.type	get_pid_from_pte, @function
get_pid_from_pte:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL38 = .
	.loc 1 128 0
	jr	$31
	andi	$2,$4,0xf

	.set	macro
	.set	reorder
	.end	get_pid_from_pte
	.cfi_endproc
.LFE20:
	.size	get_pid_from_pte, .-get_pid_from_pte
	.align	2
	.globl	get_pte_by_page_addr
.LFB21 = .
	.loc 1 130 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	get_pte_by_page_addr
	.type	get_pte_by_page_addr, @function
get_pte_by_page_addr:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL39 = .
	.loc 1 132 0
	sw	$0,%gp_rel(value_global)($28)
.LVL40 = .
.LBB6 = .
.LBB7 = .
	.loc 1 152 0
	srl	$4,$4,12
.LVL41 = .
.LBE7 = .
.LBE6 = .
	.loc 1 136 0
	li	$2,-2147352576			# 0xffffffff80020000
	sw	$2,%gp_rel(pte_p)($28)
.LVL42 = .
.LBB8 = .
.LBB9 = .
	.loc 1 122 0
	lw	$3,0($2)
	li	$2,67043328			# 0x3ff0000
.LVL43 = .
	ori	$2,$2,0xffc0
	and	$2,$3,$2
	srl	$2,$2,6
.LBE9 = .
.LBE8 = .
	.loc 1 143 0
	bne	$4,$2,.L27
	li	$2,-2147352576			# 0xffffffff80020000

	b	.L29
	nop

.LVL44 = .
.L24:
.LBB12 = .
.LBB10 = .
	.loc 1 122 0
	lw	$3,0($2)
	and	$3,$3,$6
	srl	$3,$3,6
.LBE10 = .
.LBE12 = .
	.loc 1 143 0
	bnel	$4,$3,.L22
	addiu	$2,$2,8

	jr	$31
	nop

.LVL45 = .
.L29:
	.loc 1 144 0
	jr	$31
	nop

.LVL46 = .
.L22:
	.loc 1 136 0 discriminator 2
	bne	$2,$5,.L24
	sw	$2,%gp_rel(pte_p)($28)

	.loc 1 147 0
	jr	$31
	move	$2,$0

.LVL47 = .
.L27:
	.loc 1 136 0
	addiu	$2,$2,8
	sw	$2,%gp_rel(pte_p)($28)
.LVL48 = .
.LBB13 = .
.LBB11 = .
	.loc 1 122 0
	li	$6,67043328			# 0x3ff0000
	ori	$6,$6,0xffc0
.LBE11 = .
.LBE13 = .
	.loc 1 136 0
	li	$5,-2147352576			# 0xffffffff80020000
	b	.L24
	addiu	$5,$5,232

	.set	macro
	.set	reorder
	.end	get_pte_by_page_addr
	.cfi_endproc
.LFE21:
	.size	get_pte_by_page_addr, .-get_pte_by_page_addr
	.align	2
	.globl	get_vpn_from_page_addr
.LFB22 = .
	.loc 1 150 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	get_vpn_from_page_addr
	.type	get_vpn_from_page_addr, @function
get_vpn_from_page_addr:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL49 = .
	.loc 1 153 0
	jr	$31
	srl	$2,$4,12

	.set	macro
	.set	reorder
	.end	get_vpn_from_page_addr
	.cfi_endproc
.LFE22:
	.size	get_vpn_from_page_addr, .-get_vpn_from_page_addr
	.align	2
	.globl	get_ppn_by_vpn
.LFB23 = .
	.loc 1 155 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	get_ppn_by_vpn
	.type	get_ppn_by_vpn, @function
get_ppn_by_vpn:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL50 = .
	.loc 1 158 0
	li	$2,-2147352576			# 0xffffffff80020000
	sw	$2,%gp_rel(pte_p)($28)
	.loc 1 160 0
	lw	$2,0($2)
.LVL51 = .
.LBB18 = .
.LBB19 = .
	.loc 1 122 0
	li	$3,67043328			# 0x3ff0000
	ori	$3,$3,0xffc0
	and	$3,$2,$3
	srl	$3,$3,6
.LBE19 = .
.LBE18 = .
	.loc 1 160 0
	bne	$4,$3,.L39
	li	$3,-2147352576			# 0xffffffff80020000

	.loc 1 117 0
	jr	$31
	srl	$2,$2,26

.LVL52 = .
.L37:
	.loc 1 160 0
	lw	$2,0($3)
.LVL53 = .
.LBB22 = .
.LBB20 = .
	.loc 1 122 0
	and	$5,$2,$7
	srl	$5,$5,6
.LBE20 = .
.LBE22 = .
	.loc 1 160 0
	bne	$4,$5,.L35
	addiu	$3,$3,8

.LVL54 = .
	.loc 1 161 0
	jr	$31
	srl	$2,$2,26

.LVL55 = .
.L35:
	.loc 1 158 0 discriminator 2
	bne	$3,$6,.L37
	sw	$3,%gp_rel(pte_p)($28)

	.loc 1 164 0
	move	$2,$0
	jr	$31
	nop

.LVL56 = .
.L39:
	.loc 1 158 0
	addiu	$3,$3,8
	sw	$3,%gp_rel(pte_p)($28)
.LVL57 = .
.LBB23 = .
.LBB21 = .
	.loc 1 122 0
	li	$7,67043328			# 0x3ff0000
	ori	$7,$7,0xffc0
.LBE21 = .
.LBE23 = .
	.loc 1 158 0
	li	$6,-2147352576			# 0xffffffff80020000
	b	.L37
	addiu	$6,$6,232

	.set	macro
	.set	reorder
	.end	get_ppn_by_vpn
	.cfi_endproc
.LFE23:
	.size	get_ppn_by_vpn, .-get_ppn_by_vpn
	.align	2
	.globl	get_phy_addr_by_vir_addr
.LFB24 = .
	.loc 1 167 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	get_phy_addr_by_vir_addr
	.type	get_phy_addr_by_vir_addr, @function
get_phy_addr_by_vir_addr:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL58 = .
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	sw	$16,16($sp)
	.cfi_offset 31, -4
	.cfi_offset 16, -8
	move	$16,$4
.LVL59 = .
	.loc 1 170 0
	jal	get_ppn_by_vpn
	srl	$4,$4,12

.LVL60 = .
	.loc 1 171 0
	sll	$2,$2,12
.LVL61 = .
	ins	$16,$0,0,12
.LVL62 = .
	.loc 1 173 0
	or	$2,$2,$16
.LVL63 = .
	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	get_phy_addr_by_vir_addr
	.cfi_endproc
.LFE24:
	.size	get_phy_addr_by_vir_addr, .-get_phy_addr_by_vir_addr
	.align	2
	.globl	set_page_status
.LFB28 = .
	.loc 1 185 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	set_page_status
	.type	set_page_status, @function
set_page_status:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL64 = .
	.loc 1 186 0
	sltu	$2,$5,3
	beq	$2,$0,.L55
	li	$2,-2147352576			# 0xffffffff80020000

.LVL65 = .
	.loc 1 190 0
	sw	$2,%gp_rel(pte_p)($28)
	.loc 1 192 0
	lw	$3,0($2)
	lw	$8,4($2)
.LVL66 = .
.LBB29 = .
.LBB30 = .
	.loc 1 117 0
	srl	$2,$3,26
.LBE30 = .
.LBE29 = .
	.loc 1 192 0
	bne	$4,$2,.L52
	li	$2,-2147352576			# 0xffffffff80020000

	.loc 1 195 0
	b	.L50
	ins	$3,$0,4,2

.LVL67 = .
.L49:
	.loc 1 192 0
	lw	$3,0($2)
.LVL68 = .
.LBB32 = .
.LBB31 = .
	.loc 1 117 0
	srl	$6,$3,26
.LBE31 = .
.LBE32 = .
	.loc 1 192 0
	bne	$4,$6,.L48
	lw	$8,4($2)

	ins	$3,$0,4,2
.LVL69 = .
.L50:
.LBB33 = .
	.loc 1 194 0
	sll	$5,$5,4
.LVL70 = .
	.loc 1 195 0
	sra	$4,$5,31
.LVL71 = .
	or	$3,$3,$5
	sw	$3,0($2)
	or	$8,$8,$4
	.loc 1 196 0
	jr	$31
	sw	$8,4($2)

.LVL72 = .
.L48:
.LBE33 = .
	.loc 1 190 0 discriminator 2
	addiu	$2,$2,8
	bne	$2,$7,.L49
	sw	$2,%gp_rel(pte_p)($28)

.L55:
	jr	$31
	nop

.LVL73 = .
.L52:
	.loc 1 190 0 is_stmt 0
	addiu	$2,$2,8
	sw	$2,%gp_rel(pte_p)($28)
.LVL74 = .
	li	$7,-2147352576			# 0xffffffff80020000
	b	.L49
	addiu	$7,$7,232

	.set	macro
	.set	reorder
	.end	set_page_status
	.cfi_endproc
.LFE28:
	.size	set_page_status, .-set_page_status
	.align	2
	.globl	set_page_unallocated
.LFB25 = .
	.loc 1 175 0 is_stmt 1
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	set_page_unallocated
	.type	set_page_unallocated, @function
set_page_unallocated:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL75 = .
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
	.loc 1 176 0
	jal	set_page_status
	move	$5,$0

.LVL76 = .
	.loc 1 177 0
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	set_page_unallocated
	.cfi_endproc
.LFE25:
	.size	set_page_unallocated, .-set_page_unallocated
	.align	2
	.globl	set_page_allocated
.LFB26 = .
	.loc 1 178 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	set_page_allocated
	.type	set_page_allocated, @function
set_page_allocated:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL77 = .
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
	.loc 1 179 0
	jal	set_page_status
	li	$5,1			# 0x1

.LVL78 = .
	.loc 1 180 0
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	set_page_allocated
	.cfi_endproc
.LFE26:
	.size	set_page_allocated, .-set_page_allocated
	.align	2
	.globl	set_page_reserved
.LFB27 = .
	.loc 1 181 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	set_page_reserved
	.type	set_page_reserved, @function
set_page_reserved:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL79 = .
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
	.loc 1 182 0
	jal	set_page_status
	li	$5,2			# 0x2

.LVL80 = .
	.loc 1 183 0
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	set_page_reserved
	.cfi_endproc
.LFE27:
	.size	set_page_reserved, .-set_page_reserved
	.align	2
	.globl	get_page_status_from_pte
.LFB29 = .
	.loc 1 201 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	get_page_status_from_pte
	.type	get_page_status_from_pte, @function
get_page_status_from_pte:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL81 = .
	.loc 1 203 0
	lw	$2,%gp_rel(pte_p)($28)
	lw	$2,0($2)
	.loc 1 205 0
	jr	$31
	ext	$2,$2,4,2

	.set	macro
	.set	reorder
	.end	get_page_status_from_pte
	.cfi_endproc
.LFE29:
	.size	get_page_status_from_pte, .-get_page_status_from_pte
	.align	2
	.globl	get_page_status
.LFB30 = .
	.loc 1 207 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	get_page_status
	.type	get_page_status, @function
get_page_status:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL82 = .
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
.LVL83 = .
.LBB38 = .
.LBB39 = .
	.loc 1 152 0
	srl	$8,$4,12
.LVL84 = .
.LBE39 = .
.LBE38 = .
	.loc 1 210 0
	li	$2,-2147352576			# 0xffffffff80020000
	sw	$2,%gp_rel(pte_p)($28)
	.loc 1 212 0
	lw	$4,0($2)
.LVL85 = .
	lw	$5,4($2)
.LVL86 = .
.LBB40 = .
.LBB41 = .
	.loc 1 122 0
	li	$2,67043328			# 0x3ff0000
	ori	$2,$2,0xffc0
	and	$2,$4,$2
	srl	$2,$2,6
.LBE41 = .
.LBE40 = .
	.loc 1 212 0
	bnel	$8,$2,.L70
	li	$2,-2147352576			# 0xffffffff80020000

	b	.L64
	nop

.LVL87 = .
.L68:
	lw	$4,0($2)
.LVL88 = .
.LBB44 = .
.LBB42 = .
	.loc 1 122 0
	and	$3,$4,$7
	srl	$3,$3,6
.LBE42 = .
.LBE44 = .
	.loc 1 212 0
	bne	$8,$3,.L66
	lw	$5,4($2)

.LVL89 = .
.L64:
	.loc 1 213 0
	jal	get_page_status_from_pte
	nop

.LVL90 = .
	b	.L73
	lw	$31,20($sp)

.LVL91 = .
.L66:
	.loc 1 210 0 discriminator 2
	addiu	$2,$2,8
	bne	$2,$6,.L68
	sw	$2,%gp_rel(pte_p)($28)

	.loc 1 216 0
	b	.L71
	li	$2,-1			# 0xffffffffffffffff

.LVL92 = .
.L70:
	.loc 1 210 0
	addiu	$2,$2,8
	sw	$2,%gp_rel(pte_p)($28)
.LVL93 = .
.LBB45 = .
.LBB43 = .
	.loc 1 122 0
	li	$7,67043328			# 0x3ff0000
	ori	$7,$7,0xffc0
.LBE43 = .
.LBE45 = .
	.loc 1 210 0
	li	$6,-2147352576			# 0xffffffff80020000
	b	.L68
	addiu	$6,$6,232

.LVL94 = .
.L71:
	.loc 1 217 0
	lw	$31,20($sp)
.L73:
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	get_page_status
	.cfi_endproc
.LFE30:
	.size	get_page_status, .-get_page_status
	.align	2
	.globl	is_split_block
.LFB31 = .
	.loc 1 219 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	is_split_block
	.type	is_split_block, @function
is_split_block:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL95 = .
	.loc 1 226 0
	jr	$31
	srl	$2,$4,31

	.set	macro
	.set	reorder
	.end	is_split_block
	.cfi_endproc
.LFE31:
	.size	is_split_block, .-is_split_block
	.align	2
	.globl	get_suitable_block_from_pte
.LFB32 = .
	.loc 1 228 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	get_suitable_block_from_pte
	.type	get_suitable_block_from_pte, @function
get_suitable_block_from_pte:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL96 = .
	.loc 1 233 0
	bgez	$5,.L79
	lui	$4,%hi(block_size+56)

.LVL97 = .
	addiu	$4,$4,%lo(block_size+56)
	lui	$7,%hi(block_flag+112)
	addiu	$7,$7,%lo(block_flag+112)
	li	$2,28			# 0x1c
	.loc 1 238 0
	b	.L77
	li	$8,-1			# 0xffffffffffffffff

.LVL98 = .
.L78:
.L81:
	addiu	$4,$4,-2
	beq	$2,$8,.L80
	addiu	$7,$7,-4

.LVL99 = .
.L77:
	.loc 1 236 0
	lhu	$3,0($4)
	sltu	$3,$3,$6
	bnel	$3,$0,.L81
	addiu	$2,$2,-1

	.loc 1 236 0 is_stmt 0 discriminator 1
	lw	$3,0($7)
	and	$3,$5,$3
	bnel	$3,$0,.L78
	addiu	$2,$2,-1

	jr	$31
	nop

.LVL100 = .
.L79:
	.loc 1 234 0 is_stmt 1
	jr	$31
	li	$2,-1			# 0xffffffffffffffff

.LVL101 = .
.L80:
	.loc 1 242 0
	jr	$31
	li	$2,-1			# 0xffffffffffffffff

	.set	macro
	.set	reorder
	.end	get_suitable_block_from_pte
	.cfi_endproc
.LFE32:
	.size	get_suitable_block_from_pte, .-get_suitable_block_from_pte
	.align	2
	.globl	up_round
.LFB33 = .
	.loc 1 244 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	up_round
	.type	up_round, @function
up_round:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL102 = .
	.loc 1 250 0
	sltu	$3,$4,33
	bne	$3,$0,.L89
	li	$2,32			# 0x20

	.loc 1 252 0
	sltu	$3,$4,65
	bne	$3,$0,.L89
	li	$2,64			# 0x40

	.loc 1 254 0
	sltu	$3,$4,129
	bne	$3,$0,.L89
	li	$2,128			# 0x80

	.loc 1 256 0
	sltu	$3,$4,257
	bne	$3,$0,.L89
	li	$2,256			# 0x100

	.loc 1 258 0
	sltu	$4,$4,513
.LVL103 = .
	.loc 1 260 0
	li	$2,1024			# 0x400
	li	$3,512			# 0x200
	movn	$2,$3,$4
.L89:
	.loc 1 261 0
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	up_round
	.cfi_endproc
.LFE33:
	.size	up_round, .-up_round
	.align	2
	.globl	alloc_block
.LFB34 = .
	.loc 1 263 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	alloc_block
	.type	alloc_block, @function
alloc_block:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL104 = .
	.loc 1 264 0
	andi	$4,$4,0xfff
.LVL105 = .
	.loc 1 267 0
	lui	$2,%hi(block_offset)
	lhu	$2,%lo(block_offset)($2)
	beq	$2,$4,.L93
	lui	$3,%hi(block_offset+2)

	addiu	$3,$3,%lo(block_offset+2)
	.loc 1 266 0
	li	$2,1			# 0x1
	li	$6,29			# 0x1d
.LVL106 = .
.L92:
	.loc 1 267 0
	lhu	$5,0($3)
	beql	$5,$4,.L95
	lw	$4,%gp_rel(pte_p)($28)

	.loc 1 266 0 discriminator 2
	addiu	$2,$2,1
.LVL107 = .
	bne	$2,$6,.L92
	addiu	$3,$3,2

	.loc 1 270 0
	b	.L95
	lw	$4,%gp_rel(pte_p)($28)

.LVL108 = .
.L93:
	.loc 1 266 0
	move	$2,$0
.LVL109 = .
	.loc 1 270 0
	lw	$4,%gp_rel(pte_p)($28)
.LVL110 = .
.L95:
	sll	$2,$2,2
	lui	$3,%hi(block_flag)
	addiu	$3,$3,%lo(block_flag)
	addu	$2,$2,$3
	lw	$3,0($2)
	lw	$2,4($4)
	or	$2,$2,$3
	jr	$31
	sw	$2,4($4)

	.set	macro
	.set	reorder
	.end	alloc_block
	.cfi_endproc
.LFE34:
	.size	alloc_block, .-alloc_block
	.align	2
	.globl	free_block
.LFB35 = .
	.loc 1 274 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	free_block
	.type	free_block, @function
free_block:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL111 = .
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	sw	$16,16($sp)
	.cfi_offset 31, -4
	.cfi_offset 16, -8
	move	$5,$4
.LVL112 = .
	.loc 1 276 0
	andi	$5,$5,0xfff
.LVL113 = .
	.loc 1 279 0
	lui	$2,%hi(block_offset)
	lhu	$2,%lo(block_offset)($2)
	beq	$2,$5,.L99
	ins	$4,$0,0,12

	lui	$2,%hi(block_offset+2)
	addiu	$2,$2,%lo(block_offset+2)
	.loc 1 278 0
	li	$16,1			# 0x1
	li	$6,29			# 0x1d
.LVL114 = .
.L98:
	.loc 1 279 0
	lhu	$3,0($2)
	beq	$3,$5,.L97
	nop

	.loc 1 278 0 discriminator 2
	addiu	$16,$16,1
.LVL115 = .
	bne	$16,$6,.L98
	addiu	$2,$2,2

	b	.L97
	nop

.LVL116 = .
.L99:
	.loc 1 278 0 is_stmt 0
	move	$16,$0
.LVL117 = .
.L97:
	.loc 1 282 0 is_stmt 1
	jal	get_pte_by_page_addr
	sll	$16,$16,2

.LVL118 = .
	sw	$2,%gp_rel(pte_p)($28)
	.loc 1 283 0
	lui	$3,%hi(block_flag)
	addiu	$3,$3,%lo(block_flag)
	addu	$16,$16,$3
	lw	$3,0($16)
	nor	$4,$0,$3
	lw	$3,4($2)
	and	$3,$3,$4
	sw	$3,4($2)
	.loc 1 284 0
	lw	$31,20($sp)
	lw	$16,16($sp)
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	free_block
	.cfi_endproc
.LFE35:
	.size	free_block, .-free_block
	.align	2
	.globl	find_block
.LFB36 = .
	.loc 1 286 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	find_block
	.type	find_block, @function
find_block:
	.frame	$sp,56,$31		# vars= 0, regs= 9/0, args= 16, gp= 0
	.mask	0x80ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL119 = .
	addiu	$sp,$sp,-56
	.cfi_def_cfa_offset 56
	sw	$31,52($sp)
	sw	$23,48($sp)
	sw	$22,44($sp)
	sw	$21,40($sp)
	sw	$20,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
	.cfi_offset 31, -4
	.cfi_offset 23, -8
	.cfi_offset 22, -12
	.cfi_offset 21, -16
	.cfi_offset 20, -20
	.cfi_offset 19, -24
	.cfi_offset 18, -28
	.cfi_offset 17, -32
	.cfi_offset 16, -36
	move	$20,$4
	move	$23,$5
.LVL120 = .
	.loc 1 292 0
	li	$2,-2147352576			# 0xffffffff80020000
	sw	$2,%gp_rel(pte_p)($28)
	li	$16,-2147352576			# 0xffffffff80020000
	.loc 1 294 0
	li	$21,1			# 0x1
.LBB55 = .
	.loc 1 299 0
	li	$22,-1			# 0xffffffffffffffff
.LBE55 = .
	.loc 1 292 0
	li	$19,-2147352576			# 0xffffffff80020000
	addiu	$19,$19,232
.LVL121 = .
.L105:
	.loc 1 294 0
	lw	$17,0($16)
.LVL122 = .
.LBB58 = .
.LBB59 = .
	.loc 1 127 0
	andi	$2,$17,0xf
.LBE59 = .
.LBE58 = .
	.loc 1 294 0
	bne	$20,$2,.L103
	lw	$18,4($16)

	.loc 1 294 0 is_stmt 0 discriminator 1
	move	$4,$17
	jal	get_page_status_from_pte
	move	$5,$18

.LVL123 = .
	bnel	$2,$21,.L108
	addiu	$16,$16,8

.LVL124 = .
	.loc 1 295 0 is_stmt 1
	bgezl	$18,.L108
	addiu	$16,$16,8

.LBB60 = .
	.loc 1 296 0
	move	$4,$17
	move	$5,$18
	jal	get_suitable_block_from_pte
	move	$6,$23

.LVL125 = .
	.loc 1 299 0
	beq	$2,$22,.L103
	li	$3,67043328			# 0x3ff0000

.LBB56 = .
.LBB57 = .
	.loc 1 122 0
	ori	$3,$3,0xffc0
	and	$3,$17,$3
.LBE57 = .
.LBE56 = .
	.loc 1 301 0
	sll	$3,$3,6
	sll	$2,$2,1
.LVL126 = .
	lui	$4,%hi(block_offset)
	addiu	$4,$4,%lo(block_offset)
	addu	$2,$2,$4
	lhu	$2,0($2)
	.loc 1 306 0
	b	.L104
	addu	$2,$3,$2

.LVL127 = .
.L103:
.LBE60 = .
	.loc 1 292 0 discriminator 2
	addiu	$16,$16,8
.L108:
	bne	$16,$19,.L105
	sw	$16,%gp_rel(pte_p)($28)

	.loc 1 309 0
	move	$2,$0
.L104:
	.loc 1 310 0
	lw	$31,52($sp)
	lw	$23,48($sp)
.LVL128 = .
	lw	$22,44($sp)
	lw	$21,40($sp)
	lw	$20,36($sp)
.LVL129 = .
	lw	$19,32($sp)
	lw	$18,28($sp)
.LVL130 = .
	lw	$17,24($sp)
	lw	$16,20($sp)
	jr	$31
	addiu	$sp,$sp,56

	.cfi_def_cfa_offset 0
	.cfi_restore 16
	.cfi_restore 17
	.cfi_restore 18
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	find_block
	.cfi_endproc
.LFE36:
	.size	find_block, .-find_block
	.align	2
	.globl	vmm_alloc_page
.LFB37 = .
	.loc 1 313 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	vmm_alloc_page
	.type	vmm_alloc_page, @function
vmm_alloc_page:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL131 = .
	.loc 1 314 0
	lw	$2,%gp_rel(vmm_page_addr)($28)
.LVL132 = .
.LBB65 = .
.LBB66 = .
	.loc 1 112 0
	srl	$4,$4,12
.LVL133 = .
.LBE66 = .
.LBE65 = .
	.loc 1 318 0
	li	$3,-2147352576			# 0xffffffff80020000
	sw	$3,%gp_rel(pte_p)($28)
.LVL134 = .
.LBB67 = .
.LBB68 = .
	.loc 1 117 0
	lw	$3,0($3)
.LVL135 = .
	srl	$3,$3,26
.LBE68 = .
.LBE67 = .
	.loc 1 320 0
	bne	$4,$3,.L117
	li	$3,-2147352576			# 0xffffffff80020000

	.loc 1 321 0
	b	.L115
	move	$8,$0

.LVL136 = .
.L114:
.LBB70 = .
.LBB69 = .
	.loc 1 117 0
	lw	$7,0($3)
	srl	$7,$7,26
.LBE69 = .
.LBE70 = .
	.loc 1 320 0
	bnel	$4,$7,.L112
	addiu	$3,$3,8

	move	$8,$0
.LVL137 = .
.L115:
	.loc 1 321 0
	move	$9,$0
	sw	$8,0($3)
	sw	$9,4($3)
	.loc 1 322 0
	lw	$7,%gp_rel(pte_p)($28)
	sll	$4,$4,26
	lw	$3,0($7)
	or	$4,$3,$4
	sw	$4,0($7)
	.loc 1 323 0
	lw	$7,%gp_rel(pte_p)($28)
	.loc 1 316 0
	srl	$3,$2,12
	.loc 1 323 0
	sll	$4,$3,6
	lw	$3,0($7)
	or	$3,$3,$4
	sw	$3,0($7)
	.loc 1 324 0
	lw	$4,%gp_rel(pte_p)($28)
	lw	$3,0($4)
	ori	$3,$3,0x10
	sw	$3,0($4)
	.loc 1 325 0
	lw	$4,%gp_rel(pte_p)($28)
	andi	$5,$5,0xf
.LVL138 = .
	lw	$3,0($4)
	or	$5,$3,$5
	.loc 1 326 0
	li	$3,1			# 0x1
	bne	$6,$3,.L113
	sw	$5,0($4)

	.loc 1 327 0
	lw	$4,%gp_rel(pte_p)($28)
	lw	$3,4($4)
	li	$5,-2147483648			# 0xffffffff80000000
	or	$3,$3,$5
	b	.L113
	sw	$3,4($4)

.LVL139 = .
.L112:
	.loc 1 318 0 discriminator 2
	bne	$3,$8,.L114
	sw	$3,%gp_rel(pte_p)($28)

	b	.L120
	lw	$3,%gp_rel(vmm_page_addr)($28)

.LVL140 = .
.L117:
	.loc 1 318 0 is_stmt 0
	addiu	$3,$3,8
	sw	$3,%gp_rel(pte_p)($28)
.LVL141 = .
	li	$8,-2147352576			# 0xffffffff80020000
	b	.L114
	addiu	$8,$8,232

.LVL142 = .
.L113:
	.loc 1 335 0 is_stmt 1
	lw	$3,%gp_rel(vmm_page_addr)($28)
.L120:
	addiu	$3,$3,4096
	.loc 1 337 0
	jr	$31
	sw	$3,%gp_rel(vmm_page_addr)($28)

	.set	macro
	.set	reorder
	.end	vmm_alloc_page
	.cfi_endproc
.LFE37:
	.size	vmm_alloc_page, .-vmm_alloc_page
	.align	2
	.globl	vmm_free_page
.LFB38 = .
	.loc 1 340 0
	.cfi_startproc
	.set	nomips16
	.set	nomicromips
	.ent	vmm_free_page
	.type	vmm_free_page, @function
vmm_free_page:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
.LVL143 = .
	addiu	$sp,$sp,-24
	.cfi_def_cfa_offset 24
	sw	$31,20($sp)
	.cfi_offset 31, -4
.LVL144 = .
	.loc 1 345 0
	jal	set_page_unallocated
	srl	$4,$4,12

.LVL145 = .
	.loc 1 346 0
	lw	$31,20($sp)
	jr	$31
	addiu	$sp,$sp,24

	.cfi_def_cfa_offset 0
	.cfi_restore 31
	.set	macro
	.set	reorder
	.end	vmm_free_page
	.cfi_endproc
.LFE38:
	.size	vmm_free_page, .-vmm_free_page
	.globl	vmm_page_addr
	.section	.sdata,"aw",@progbits
	.align	2
	.type	vmm_page_addr, @object
	.size	vmm_page_addr, 4
vmm_page_addr:
	.word	139264
	.globl	block_size
	.section	.bss,"aw",@nobits
	.align	2
	.type	block_size, @object
	.size	block_size, 58
block_size:
	.space	58
	.globl	block_flag
	.align	2
	.type	block_flag, @object
	.size	block_flag, 116
block_flag:
	.space	116
	.globl	block_offset
	.align	2
	.type	block_offset, @object
	.size	block_offset, 58
block_offset:
	.space	58

	.comm	pte_p,4,4
	.text
.Letext0:
	.file 2 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\machine\\_default_types.h"
	.file 3 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\stdint.h"
	.file 4 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\lib\\gcc\\mips-mti-elf\\4.9.2\\include\\stddef.h"
	.file 5 "c:\\progra~1\\imagin~1\\toolch~1\\mips-mti-elf\\2016.05-03\\mips-mti-elf\\include\\sys\\types.h"
	.file 6 "./include/types.h"
	.file 7 "./include/debug.h"
	.file 8 "./include/mm/vmm.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xa31
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF73
	.byte	0x1
	.4byte	.LASF74
	.4byte	.LASF75
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x4
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
	.uleb128 0x4
	.4byte	.LASF8
	.byte	0x2
	.byte	0x26
	.4byte	0x61
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
	.4byte	0x33
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x4
	.4byte	.LASF11
	.byte	0x2
	.byte	0x4e
	.4byte	0x25
	.uleb128 0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x36
	.4byte	0x56
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
	.4byte	0x33
	.uleb128 0x4
	.4byte	.LASF20
	.byte	0x5
	.byte	0xc1
	.4byte	0x3a
	.uleb128 0x5
	.4byte	.LASF23
	.byte	0x4
	.byte	0x6
	.byte	0x1b
	.4byte	0xf8
	.uleb128 0x6
	.4byte	.LASF21
	.sleb128 0
	.uleb128 0x6
	.4byte	.LASF22
	.sleb128 1
	.byte	0
	.uleb128 0x4
	.4byte	.LASF23
	.byte	0x6
	.byte	0x1e
	.4byte	0xdf
	.uleb128 0x4
	.4byte	.LASF24
	.byte	0x6
	.byte	0x2f
	.4byte	0xa2
	.uleb128 0x7
	.4byte	.LASF25
	.byte	0x1
	.byte	0x64
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x14f
	.uleb128 0x8
	.ascii	"ppn\000"
	.byte	0x1
	.byte	0x64
	.4byte	0x3a
	.4byte	.LLST0
	.uleb128 0x9
	.ascii	"pte\000"
	.byte	0x1
	.byte	0x64
	.4byte	0x14f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xa
	.4byte	.LASF27
	.byte	0x1
	.byte	0x65
	.4byte	0xa2
	.4byte	0xfc000000
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.4byte	0x103
	.uleb128 0x7
	.4byte	.LASF26
	.byte	0x1
	.byte	0x11
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x1e2
	.uleb128 0xc
	.ascii	"cnt\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x3a
	.4byte	.LLST1
	.uleb128 0xc
	.ascii	"ppn\000"
	.byte	0x1
	.byte	0x15
	.4byte	0x3a
	.4byte	.LLST2
	.uleb128 0xc
	.ascii	"idx\000"
	.byte	0x1
	.byte	0x28
	.4byte	0x3a
	.4byte	.LLST3
	.uleb128 0xd
	.4byte	.LASF28
	.byte	0x1
	.byte	0x28
	.4byte	0x3a
	.4byte	.LLST4
	.uleb128 0xd
	.4byte	.LASF29
	.byte	0x1
	.byte	0x28
	.4byte	0x3a
	.4byte	.LLST5
	.uleb128 0xd
	.4byte	.LASF30
	.byte	0x1
	.byte	0x28
	.4byte	0x3a
	.4byte	.LLST6
	.uleb128 0xc
	.ascii	"k\000"
	.byte	0x1
	.byte	0x38
	.4byte	0x3a
	.4byte	.LLST7
	.uleb128 0xe
	.4byte	.LVL4
	.4byte	0x10e
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x84
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x1
	.byte	0x69
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x223
	.uleb128 0x8
	.ascii	"vpn\000"
	.byte	0x1
	.byte	0x69
	.4byte	0x3a
	.4byte	.LLST8
	.uleb128 0x9
	.ascii	"pte\000"
	.byte	0x1
	.byte	0x69
	.4byte	0x14f
	.uleb128 0x1
	.byte	0x55
	.uleb128 0xa
	.4byte	.LASF27
	.byte	0x1
	.byte	0x6a
	.4byte	0xa2
	.4byte	0x3fffc0
	.byte	0
	.uleb128 0x10
	.4byte	.LASF32
	.byte	0x1
	.byte	0x6e
	.4byte	0x97
	.byte	0x1
	.4byte	0x23f
	.uleb128 0x11
	.4byte	.LASF34
	.byte	0x1
	.byte	0x6e
	.4byte	0x97
	.byte	0
	.uleb128 0x12
	.4byte	0x223
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x25a
	.uleb128 0x13
	.4byte	0x233
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x10
	.4byte	.LASF33
	.byte	0x1
	.byte	0x73
	.4byte	0x97
	.byte	0x1
	.4byte	0x276
	.uleb128 0x14
	.ascii	"pte\000"
	.byte	0x1
	.byte	0x73
	.4byte	0x103
	.byte	0
	.uleb128 0x12
	.4byte	0x25a
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x296
	.uleb128 0x13
	.4byte	0x26a
	.uleb128 0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.byte	0
	.uleb128 0x10
	.4byte	.LASF35
	.byte	0x1
	.byte	0x78
	.4byte	0x97
	.byte	0x1
	.4byte	0x2b2
	.uleb128 0x14
	.ascii	"pte\000"
	.byte	0x1
	.byte	0x78
	.4byte	0x103
	.byte	0
	.uleb128 0x12
	.4byte	0x296
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x2d2
	.uleb128 0x13
	.4byte	0x2a6
	.uleb128 0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.byte	0
	.uleb128 0x10
	.4byte	.LASF36
	.byte	0x1
	.byte	0x7d
	.4byte	0x97
	.byte	0x1
	.4byte	0x2ee
	.uleb128 0x14
	.ascii	"pte\000"
	.byte	0x1
	.byte	0x7d
	.4byte	0x103
	.byte	0
	.uleb128 0x12
	.4byte	0x2d2
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x30e
	.uleb128 0x13
	.4byte	0x2e2
	.uleb128 0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.byte	0
	.uleb128 0x10
	.4byte	.LASF37
	.byte	0x1
	.byte	0x96
	.4byte	0x97
	.byte	0x1
	.4byte	0x32a
	.uleb128 0x11
	.4byte	.LASF38
	.byte	0x1
	.byte	0x96
	.4byte	0x97
	.byte	0
	.uleb128 0x15
	.4byte	.LASF39
	.byte	0x1
	.byte	0x82
	.4byte	0x14f
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3a3
	.uleb128 0x16
	.4byte	.LASF38
	.byte	0x1
	.byte	0x82
	.4byte	0x97
	.4byte	.LLST9
	.uleb128 0x17
	.ascii	"vpn\000"
	.byte	0x1
	.byte	0x86
	.4byte	0x3a
	.uleb128 0xc
	.ascii	"cnt\000"
	.byte	0x1
	.byte	0x87
	.4byte	0x3a
	.4byte	.LLST10
	.uleb128 0x18
	.4byte	0x30e
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.byte	0x1
	.byte	0x86
	.4byte	0x389
	.uleb128 0x19
	.4byte	0x31e
	.4byte	.LLST11
	.byte	0
	.uleb128 0x1a
	.4byte	0x296
	.4byte	.LBB8
	.4byte	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x8f
	.uleb128 0x19
	.4byte	0x2a6
	.4byte	.LLST12
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	0x30e
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x3be
	.uleb128 0x13
	.4byte	0x31e
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x15
	.4byte	.LASF40
	.byte	0x1
	.byte	0x9b
	.4byte	0x97
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x40d
	.uleb128 0x9
	.ascii	"vpn\000"
	.byte	0x1
	.byte	0x9b
	.4byte	0x97
	.uleb128 0x1
	.byte	0x54
	.uleb128 0xc
	.ascii	"cnt\000"
	.byte	0x1
	.byte	0x9d
	.4byte	0x3a
	.4byte	.LLST13
	.uleb128 0x1a
	.4byte	0x296
	.4byte	.LBB18
	.4byte	.Ldebug_ranges0+0x20
	.byte	0x1
	.byte	0xa0
	.uleb128 0x19
	.4byte	0x2a6
	.4byte	.LLST14
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF41
	.byte	0x1
	.byte	0xa7
	.4byte	0x97
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x471
	.uleb128 0x16
	.4byte	.LASF42
	.byte	0x1
	.byte	0xa7
	.4byte	0x97
	.4byte	.LLST15
	.uleb128 0x17
	.ascii	"vpn\000"
	.byte	0x1
	.byte	0xa9
	.4byte	0x97
	.uleb128 0xc
	.ascii	"ppn\000"
	.byte	0x1
	.byte	0xaa
	.4byte	0x97
	.4byte	.LLST16
	.uleb128 0xd
	.4byte	.LASF43
	.byte	0x1
	.byte	0xab
	.4byte	0x97
	.4byte	.LLST17
	.uleb128 0xe
	.4byte	.LVL60
	.4byte	0x3be
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x4
	.byte	0x80
	.sleb128 0
	.byte	0x3c
	.byte	0x25
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF44
	.byte	0x1
	.byte	0xb9
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x4ea
	.uleb128 0x8
	.ascii	"ppn\000"
	.byte	0x1
	.byte	0xb9
	.4byte	0x97
	.4byte	.LLST18
	.uleb128 0x16
	.4byte	.LASF45
	.byte	0x1
	.byte	0xb9
	.4byte	0x3a
	.4byte	.LLST19
	.uleb128 0xc
	.ascii	"cnt\000"
	.byte	0x1
	.byte	0xbd
	.4byte	0x3a
	.4byte	.LLST20
	.uleb128 0x1b
	.4byte	0x25a
	.4byte	.LBB29
	.4byte	.Ldebug_ranges0+0x40
	.byte	0x1
	.byte	0xc0
	.4byte	0x4d0
	.uleb128 0x19
	.4byte	0x26a
	.4byte	.LLST21
	.byte	0
	.uleb128 0x1c
	.4byte	.LBB33
	.4byte	.LBE33-.LBB33
	.uleb128 0xd
	.4byte	.LASF27
	.byte	0x1
	.byte	0xc1
	.4byte	0x3a
	.4byte	.LLST22
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF46
	.byte	0x1
	.byte	0xaf
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x525
	.uleb128 0x8
	.ascii	"ppn\000"
	.byte	0x1
	.byte	0xaf
	.4byte	0x97
	.4byte	.LLST23
	.uleb128 0xe
	.4byte	.LVL76
	.4byte	0x471
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x30
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF47
	.byte	0x1
	.byte	0xb2
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x560
	.uleb128 0x8
	.ascii	"ppn\000"
	.byte	0x1
	.byte	0xb2
	.4byte	0x97
	.4byte	.LLST24
	.uleb128 0xe
	.4byte	.LVL78
	.4byte	0x471
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.byte	0
	.uleb128 0x7
	.4byte	.LASF48
	.byte	0x1
	.byte	0xb5
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x59b
	.uleb128 0x8
	.ascii	"ppn\000"
	.byte	0x1
	.byte	0xb5
	.4byte	0x97
	.4byte	.LLST25
	.uleb128 0xe
	.4byte	.LVL80
	.4byte	0x471
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x32
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x3
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.byte	0
	.uleb128 0x15
	.4byte	.LASF49
	.byte	0x1
	.byte	0xc9
	.4byte	0x3a
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5f4
	.uleb128 0x9
	.ascii	"pte\000"
	.byte	0x1
	.byte	0xc9
	.4byte	0x103
	.uleb128 0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.uleb128 0x1d
	.4byte	.LASF27
	.byte	0x1
	.byte	0xca
	.4byte	0x3a
	.sleb128 -49
	.uleb128 0x1e
	.4byte	.LASF45
	.byte	0x1
	.byte	0xcb
	.4byte	0x3a
	.uleb128 0x15
	.byte	0x3
	.4byte	pte_p
	.byte	0x6
	.byte	0xf6
	.byte	0x8
	.uleb128 0x25
	.byte	0x8
	.byte	0x30
	.byte	0xf7
	.uleb128 0x25
	.byte	0x1a
	.byte	0x34
	.byte	0xf7
	.uleb128 0x25
	.byte	0x25
	.byte	0xf7
	.uleb128 0x2c
	.byte	0x9f
	.byte	0
	.uleb128 0x15
	.4byte	.LASF50
	.byte	0x1
	.byte	0xcf
	.4byte	0x3a
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x67a
	.uleb128 0x16
	.4byte	.LASF38
	.byte	0x1
	.byte	0xcf
	.4byte	0x97
	.4byte	.LLST26
	.uleb128 0x17
	.ascii	"vpn\000"
	.byte	0x1
	.byte	0xd0
	.4byte	0x3a
	.uleb128 0xc
	.ascii	"cnt\000"
	.byte	0x1
	.byte	0xd1
	.4byte	0x3a
	.4byte	.LLST27
	.uleb128 0x18
	.4byte	0x30e
	.4byte	.LBB38
	.4byte	.LBE38-.LBB38
	.byte	0x1
	.byte	0xd0
	.4byte	0x653
	.uleb128 0x19
	.4byte	0x31e
	.4byte	.LLST28
	.byte	0
	.uleb128 0x1b
	.4byte	0x296
	.4byte	.LBB40
	.4byte	.Ldebug_ranges0+0x58
	.byte	0x1
	.byte	0xd4
	.4byte	0x670
	.uleb128 0x19
	.4byte	0x2a6
	.4byte	.LLST29
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL90
	.4byte	0x59b
	.byte	0
	.uleb128 0x10
	.4byte	.LASF51
	.byte	0x1
	.byte	0xdb
	.4byte	0xf8
	.byte	0x1
	.4byte	0x696
	.uleb128 0x11
	.4byte	.LASF52
	.byte	0x1
	.byte	0xdb
	.4byte	0x97
	.byte	0
	.uleb128 0x12
	.4byte	0x67a
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6b1
	.uleb128 0x13
	.4byte	0x68a
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x15
	.4byte	.LASF53
	.byte	0x1
	.byte	0xe4
	.4byte	0x3a
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x703
	.uleb128 0x8
	.ascii	"pte\000"
	.byte	0x1
	.byte	0xe4
	.4byte	0x103
	.4byte	.LLST30
	.uleb128 0x20
	.4byte	.LASF30
	.byte	0x1
	.byte	0xe4
	.4byte	0xc9
	.uleb128 0x1
	.byte	0x56
	.uleb128 0xc
	.ascii	"idx\000"
	.byte	0x1
	.byte	0xe6
	.4byte	0x3a
	.4byte	.LLST31
	.uleb128 0x1e
	.4byte	.LASF52
	.byte	0x1
	.byte	0xe7
	.4byte	0x97
	.uleb128 0x1
	.byte	0x55
	.byte	0
	.uleb128 0x15
	.4byte	.LASF54
	.byte	0x1
	.byte	0xf4
	.4byte	0xc9
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x72c
	.uleb128 0x16
	.4byte	.LASF30
	.byte	0x1
	.byte	0xf4
	.4byte	0xc9
	.4byte	.LLST32
	.byte	0
	.uleb128 0x21
	.4byte	.LASF55
	.byte	0x1
	.2byte	0x107
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x773
	.uleb128 0x22
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x107
	.4byte	0x97
	.4byte	.LLST33
	.uleb128 0x23
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x108
	.4byte	0x97
	.4byte	.LLST34
	.uleb128 0x24
	.ascii	"idx\000"
	.byte	0x1
	.2byte	0x109
	.4byte	0x3a
	.4byte	.LLST35
	.byte	0
	.uleb128 0x21
	.4byte	.LASF57
	.byte	0x1
	.2byte	0x112
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7d3
	.uleb128 0x22
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x112
	.4byte	0x97
	.4byte	.LLST36
	.uleb128 0x23
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x113
	.4byte	0x97
	.4byte	.LLST37
	.uleb128 0x23
	.4byte	.LASF28
	.byte	0x1
	.2byte	0x114
	.4byte	0x97
	.4byte	.LLST38
	.uleb128 0x24
	.ascii	"idx\000"
	.byte	0x1
	.2byte	0x115
	.4byte	0x3a
	.4byte	.LLST39
	.uleb128 0x1f
	.4byte	.LVL118
	.4byte	0x32a
	.byte	0
	.uleb128 0x25
	.4byte	.LASF59
	.byte	0x1
	.2byte	0x11e
	.4byte	0x97
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8a1
	.uleb128 0x26
	.ascii	"pid\000"
	.byte	0x1
	.2byte	0x11e
	.4byte	0xd4
	.4byte	.LLST40
	.uleb128 0x22
	.4byte	.LASF30
	.byte	0x1
	.2byte	0x11e
	.4byte	0xc9
	.4byte	.LLST41
	.uleb128 0x27
	.4byte	.LASF60
	.byte	0x1
	.2byte	0x122
	.4byte	0xc9
	.uleb128 0x24
	.ascii	"cnt\000"
	.byte	0x1
	.2byte	0x123
	.4byte	0x3a
	.4byte	.LLST42
	.uleb128 0x28
	.4byte	.Ldebug_ranges0+0x78
	.4byte	0x879
	.uleb128 0x23
	.4byte	.LASF61
	.byte	0x1
	.2byte	0x128
	.4byte	0x3a
	.4byte	.LLST43
	.uleb128 0x27
	.4byte	.LASF56
	.byte	0x1
	.2byte	0x12d
	.4byte	0x97
	.uleb128 0x29
	.4byte	0x296
	.4byte	.LBB56
	.4byte	.LBE56-.LBB56
	.byte	0x1
	.2byte	0x12d
	.4byte	0x868
	.uleb128 0x2a
	.4byte	0x2a6
	.byte	0
	.uleb128 0xe
	.4byte	.LVL125
	.4byte	0x6b1
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x2
	.byte	0x87
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x29
	.4byte	0x2d2
	.4byte	.LBB58
	.4byte	.LBE58-.LBB58
	.byte	0x1
	.2byte	0x126
	.4byte	0x897
	.uleb128 0x19
	.4byte	0x2e2
	.4byte	.LLST44
	.byte	0
	.uleb128 0x1f
	.4byte	.LVL123
	.4byte	0x59b
	.byte	0
	.uleb128 0x25
	.4byte	.LASF62
	.byte	0x1
	.2byte	0x138
	.4byte	0x97
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x95e
	.uleb128 0x22
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x138
	.4byte	0x97
	.4byte	.LLST45
	.uleb128 0x26
	.ascii	"pid\000"
	.byte	0x1
	.2byte	0x138
	.4byte	0xd4
	.4byte	.LLST46
	.uleb128 0x2b
	.4byte	.LASF63
	.byte	0x1
	.2byte	0x138
	.4byte	0xf8
	.uleb128 0x1
	.byte	0x56
	.uleb128 0x2c
	.4byte	.LASF64
	.byte	0x1
	.2byte	0x13a
	.4byte	0x97
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2d
	.ascii	"ppn\000"
	.byte	0x1
	.2byte	0x13b
	.4byte	0x97
	.uleb128 0x2e
	.ascii	"vpn\000"
	.byte	0x1
	.2byte	0x13c
	.4byte	0x97
	.uleb128 0x5
	.byte	0x72
	.sleb128 0
	.byte	0x3c
	.byte	0x25
	.byte	0x9f
	.uleb128 0x24
	.ascii	"cnt\000"
	.byte	0x1
	.2byte	0x13d
	.4byte	0x3a
	.4byte	.LLST47
	.uleb128 0x29
	.4byte	0x223
	.4byte	.LBB65
	.4byte	.LBE65-.LBB65
	.byte	0x1
	.2byte	0x13b
	.4byte	0x943
	.uleb128 0x19
	.4byte	0x233
	.4byte	.LLST48
	.byte	0
	.uleb128 0x2f
	.4byte	0x25a
	.4byte	.LBB67
	.4byte	.Ldebug_ranges0+0x90
	.byte	0x1
	.2byte	0x140
	.uleb128 0x19
	.4byte	0x26a
	.4byte	.LLST49
	.byte	0
	.byte	0
	.uleb128 0x21
	.4byte	.LASF65
	.byte	0x1
	.2byte	0x153
	.4byte	.LFB38
	.4byte	.LFE38-.LFB38
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9a4
	.uleb128 0x22
	.4byte	.LASF58
	.byte	0x1
	.2byte	0x153
	.4byte	0x97
	.4byte	.LLST50
	.uleb128 0x2d
	.ascii	"ppn\000"
	.byte	0x1
	.2byte	0x158
	.4byte	0x97
	.uleb128 0xe
	.4byte	.LVL145
	.4byte	0x4ea
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x5
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x3c
	.byte	0x25
	.byte	0
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF66
	.byte	0x1
	.byte	0x3
	.4byte	0x14f
	.sleb128 -2147352576
	.uleb128 0x30
	.4byte	.LASF67
	.byte	0x7
	.byte	0xa
	.4byte	0x3a
	.uleb128 0x31
	.4byte	.LASF68
	.byte	0x8
	.byte	0x12
	.4byte	0x14f
	.uleb128 0x5
	.byte	0x3
	.4byte	pte_p
	.uleb128 0x31
	.4byte	.LASF69
	.byte	0x1
	.byte	0xe
	.4byte	0x97
	.uleb128 0x5
	.byte	0x3
	.4byte	vmm_page_addr
	.uleb128 0x32
	.4byte	0x8c
	.4byte	0x9f1
	.uleb128 0x33
	.4byte	0xad
	.byte	0x1c
	.byte	0
	.uleb128 0x31
	.4byte	.LASF70
	.byte	0x1
	.byte	0x6
	.4byte	0x9e1
	.uleb128 0x5
	.byte	0x3
	.4byte	block_offset
	.uleb128 0x32
	.4byte	0x97
	.4byte	0xa12
	.uleb128 0x33
	.4byte	0xad
	.byte	0x1c
	.byte	0
	.uleb128 0x31
	.4byte	.LASF71
	.byte	0x1
	.byte	0x9
	.4byte	0xa02
	.uleb128 0x5
	.byte	0x3
	.4byte	block_flag
	.uleb128 0x31
	.4byte	.LASF72
	.byte	0x1
	.byte	0xc
	.4byte	0x9e1
	.uleb128 0x5
	.byte	0x3
	.4byte	block_size
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
	.uleb128 0x6
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
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
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0x6
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
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
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
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
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
	.uleb128 0x5
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
	.uleb128 0x26
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x2f
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
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
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x31
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
	.uleb128 0x32
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.4byte	.LFE15-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL32-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x3
	.byte	0x8
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL31-.Ltext0
	.2byte	0x1
	.byte	0x64
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x2
	.byte	0x32
	.byte	0x9f
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x2
	.byte	0x33
	.byte	0x9f
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x2
	.byte	0x34
	.byte	0x9f
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x2
	.byte	0x35
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL10-.Ltext0
	.2byte	0x4
	.byte	0xa
	.2byte	0x400
	.byte	0x9f
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x4
	.byte	0xa
	.2byte	0x600
	.byte	0x9f
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL16-.Ltext0
	.2byte	0x4
	.byte	0xa
	.2byte	0x700
	.byte	0x9f
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x4
	.byte	0xa
	.2byte	0x800
	.byte	0x9f
	.4byte	.LVL19-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x4
	.byte	0xa
	.2byte	0x900
	.byte	0x9f
	.4byte	.LVL22-.Ltext0
	.4byte	.LFE14-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x4
	.byte	0x40
	.byte	0x48
	.byte	0x24
	.byte	0x9f
	.4byte	.LVL8-.Ltext0
	.4byte	.LVL11-.Ltext0
	.2byte	0x4
	.byte	0x40
	.byte	0x47
	.byte	0x24
	.byte	0x9f
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x4
	.byte	0x40
	.byte	0x46
	.byte	0x24
	.byte	0x9f
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x4
	.byte	0x40
	.byte	0x45
	.byte	0x24
	.byte	0x9f
	.4byte	.LVL17-.Ltext0
	.4byte	.LVL20-.Ltext0
	.2byte	0x4
	.byte	0x40
	.byte	0x44
	.byte	0x24
	.byte	0x9f
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x4
	.byte	0x40
	.byte	0x43
	.byte	0x24
	.byte	0x9f
	.4byte	.LVL22-.Ltext0
	.4byte	.LFE14-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL6-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x4
	.byte	0xa
	.2byte	0x400
	.byte	0x9f
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x4
	.byte	0xa
	.2byte	0x200
	.byte	0x9f
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x4
	.byte	0xa
	.2byte	0x100
	.byte	0x9f
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x3
	.byte	0x8
	.byte	0x80
	.byte	0x9f
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x3
	.byte	0x8
	.byte	0x40
	.byte	0x9f
	.4byte	.LVL28-.Ltext0
	.4byte	.LFE14-.Ltext0
	.2byte	0x3
	.byte	0x8
	.byte	0x20
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL15-.Ltext0
	.4byte	.LVL18-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x2
	.byte	0x32
	.byte	0x9f
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x2
	.byte	0x33
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL34-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL34-.Ltext0
	.4byte	.LFE16-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL39-.Ltext0
	.4byte	.LVL40-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL40-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x7
	.byte	0x74
	.sleb128 0
	.byte	0xb
	.2byte	0xf000
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL41-.Ltext0
	.4byte	.LFE21-.Ltext0
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
.LLST10:
	.4byte	.LVL41-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL45-.Ltext0
	.4byte	.LVL46-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL47-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL48-.Ltext0
	.4byte	.LFE21-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL40-.Ltext0
	.4byte	.LVL41-.Ltext0
	.2byte	0x7
	.byte	0x74
	.sleb128 0
	.byte	0xb
	.2byte	0xf000
	.byte	0x1a
	.byte	0x9f
	.4byte	.LVL41-.Ltext0
	.4byte	.LFE21-.Ltext0
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
.LLST12:
	.4byte	.LVL42-.Ltext0
	.4byte	.LVL43-.Ltext0
	.2byte	0x2
	.byte	0x72
	.sleb128 0
	.4byte	.LVL43-.Ltext0
	.4byte	.LVL44-.Ltext0
	.2byte	0x6
	.byte	0x3
	.4byte	pte_p
	.byte	0x6
	.4byte	.LVL44-.Ltext0
	.4byte	.LVL45-.Ltext0
	.2byte	0x2
	.byte	0x72
	.sleb128 0
	.4byte	.LVL45-.Ltext0
	.4byte	.LVL46-.Ltext0
	.2byte	0x6
	.byte	0x3
	.4byte	pte_p
	.byte	0x6
	.4byte	.LVL47-.Ltext0
	.4byte	.LVL48-.Ltext0
	.2byte	0x6
	.byte	0x3
	.4byte	pte_p
	.byte	0x6
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL50-.Ltext0
	.4byte	.LVL52-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL56-.Ltext0
	.4byte	.LVL57-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL57-.Ltext0
	.4byte	.LFE23-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL51-.Ltext0
	.4byte	.LVL52-.Ltext0
	.2byte	0xd
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x3
	.4byte	pte_p
	.byte	0x6
	.byte	0x23
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL53-.Ltext0
	.4byte	.LVL54-.Ltext0
	.2byte	0x8
	.byte	0x73
	.sleb128 0
	.byte	0x93
	.uleb128 0x4
	.byte	0x73
	.sleb128 4
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL56-.Ltext0
	.4byte	.LVL57-.Ltext0
	.2byte	0xd
	.byte	0x52
	.byte	0x93
	.uleb128 0x4
	.byte	0x3
	.4byte	pte_p
	.byte	0x6
	.byte	0x23
	.uleb128 0x4
	.byte	0x93
	.uleb128 0x4
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL58-.Ltext0
	.4byte	.LVL59-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL59-.Ltext0
	.4byte	.LVL62-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL62-.Ltext0
	.4byte	.LFE24-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL60-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL60-.Ltext0
	.4byte	.LVL61-.Ltext0
	.2byte	0xc
	.byte	0x80
	.sleb128 0
	.byte	0xb
	.2byte	0xf000
	.byte	0x1a
	.byte	0x72
	.sleb128 0
	.byte	0x3c
	.byte	0x24
	.byte	0x21
	.byte	0x9f
	.4byte	.LVL63-.Ltext0
	.4byte	.LFE24-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL64-.Ltext0
	.4byte	.LVL71-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL71-.Ltext0
	.4byte	.LVL72-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	.LVL72-.Ltext0
	.4byte	.LFE28-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL64-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL69-.Ltext0
	.4byte	.LVL70-.Ltext0
	.2byte	0x5
	.byte	0x75
	.sleb128 0
	.byte	0x34
	.byte	0x24
	.byte	0x9f
	.4byte	.LVL70-.Ltext0
	.4byte	.LFE28-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL65-.Ltext0
	.4byte	.LVL67-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL73-.Ltext0
	.4byte	.LVL74-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL74-.Ltext0
	.4byte	.LFE28-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST21:
	.4byte	.LVL66-.Ltext0
	.4byte	.LVL67-.Ltext0
	.2byte	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x58
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL67-.Ltext0
	.4byte	.LVL68-.Ltext0
	.2byte	0x7
	.byte	0x72
	.sleb128 0
	.byte	0x93
	.uleb128 0x4
	.byte	0x58
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL68-.Ltext0
	.4byte	.LVL69-.Ltext0
	.2byte	0x8
	.byte	0x72
	.sleb128 0
	.byte	0x93
	.uleb128 0x4
	.byte	0x72
	.sleb128 4
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL72-.Ltext0
	.4byte	.LFE28-.Ltext0
	.2byte	0x6
	.byte	0x53
	.byte	0x93
	.uleb128 0x4
	.byte	0x58
	.byte	0x93
	.uleb128 0x4
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL69-.Ltext0
	.4byte	.LVL72-.Ltext0
	.2byte	0x3
	.byte	0x9
	.byte	0xcf
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST23:
	.4byte	.LVL75-.Ltext0
	.4byte	.LVL76-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL76-1-.Ltext0
	.4byte	.LFE25-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST24:
	.4byte	.LVL77-.Ltext0
	.4byte	.LVL78-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL78-1-.Ltext0
	.4byte	.LFE26-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST25:
	.4byte	.LVL79-.Ltext0
	.4byte	.LVL80-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL80-1-.Ltext0
	.4byte	.LFE27-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST26:
	.4byte	.LVL82-.Ltext0
	.4byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL85-.Ltext0
	.4byte	.LFE30-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST27:
	.4byte	.LVL84-.Ltext0
	.4byte	.LVL87-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL92-.Ltext0
	.4byte	.LVL93-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL93-.Ltext0
	.4byte	.LVL94-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST28:
	.4byte	.LVL83-.Ltext0
	.4byte	.LVL85-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL85-.Ltext0
	.4byte	.LFE30-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST29:
	.4byte	.LVL86-.Ltext0
	.4byte	.LVL87-.Ltext0
	.2byte	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL87-.Ltext0
	.4byte	.LVL88-.Ltext0
	.2byte	0x7
	.byte	0x72
	.sleb128 0
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL88-.Ltext0
	.4byte	.LVL89-.Ltext0
	.2byte	0x8
	.byte	0x72
	.sleb128 0
	.byte	0x93
	.uleb128 0x4
	.byte	0x72
	.sleb128 4
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL91-.Ltext0
	.4byte	.LVL94-.Ltext0
	.2byte	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.4byte	0
	.4byte	0
.LLST30:
	.4byte	.LVL96-.Ltext0
	.4byte	.LVL97-.Ltext0
	.2byte	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL97-.Ltext0
	.4byte	.LVL100-.Ltext0
	.2byte	0x6
	.byte	0xf3
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x4
	.uleb128 0x25
	.byte	0x9f
	.4byte	.LVL100-.Ltext0
	.4byte	.LVL101-.Ltext0
	.2byte	0x6
	.byte	0x54
	.byte	0x93
	.uleb128 0x4
	.byte	0x55
	.byte	0x93
	.uleb128 0x4
	.4byte	.LVL101-.Ltext0
	.4byte	.LFE32-.Ltext0
	.2byte	0x6
	.byte	0xf3
	.uleb128 0x3
	.byte	0xf5
	.uleb128 0x4
	.uleb128 0x25
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST31:
	.4byte	.LVL96-.Ltext0
	.4byte	.LVL98-.Ltext0
	.2byte	0x2
	.byte	0x4c
	.byte	0x9f
	.4byte	.LVL98-.Ltext0
	.4byte	.LVL100-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL100-.Ltext0
	.4byte	.LVL101-.Ltext0
	.2byte	0x2
	.byte	0x4c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST32:
	.4byte	.LVL102-.Ltext0
	.4byte	.LVL103-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL103-.Ltext0
	.4byte	.LFE33-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST33:
	.4byte	.LVL104-.Ltext0
	.4byte	.LVL105-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL105-.Ltext0
	.4byte	.LFE34-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST34:
	.4byte	.LVL105-.Ltext0
	.4byte	.LVL110-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL110-.Ltext0
	.4byte	.LFE34-.Ltext0
	.2byte	0x8
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0xa
	.2byte	0xfff
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST35:
	.4byte	.LVL105-.Ltext0
	.4byte	.LVL106-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL106-.Ltext0
	.4byte	.LVL108-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL108-.Ltext0
	.4byte	.LVL109-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST36:
	.4byte	.LVL111-.Ltext0
	.4byte	.LVL112-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL112-.Ltext0
	.4byte	.LVL113-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL113-.Ltext0
	.4byte	.LFE35-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST37:
	.4byte	.LVL112-.Ltext0
	.4byte	.LVL118-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL118-1-.Ltext0
	.4byte	.LFE35-.Ltext0
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
.LLST38:
	.4byte	.LVL113-.Ltext0
	.4byte	.LVL118-1-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL118-1-.Ltext0
	.4byte	.LFE35-.Ltext0
	.2byte	0x8
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0xa
	.2byte	0xfff
	.byte	0x1a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST39:
	.4byte	.LVL113-.Ltext0
	.4byte	.LVL114-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL114-.Ltext0
	.4byte	.LVL116-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	.LVL116-.Ltext0
	.4byte	.LVL117-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST40:
	.4byte	.LVL119-.Ltext0
	.4byte	.LVL121-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL121-.Ltext0
	.4byte	.LVL129-.Ltext0
	.2byte	0x1
	.byte	0x64
	.4byte	.LVL129-.Ltext0
	.4byte	.LFE36-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST41:
	.4byte	.LVL119-.Ltext0
	.4byte	.LVL121-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL121-.Ltext0
	.4byte	.LVL128-.Ltext0
	.2byte	0x1
	.byte	0x67
	.4byte	.LVL128-.Ltext0
	.4byte	.LFE36-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST42:
	.4byte	.LVL120-.Ltext0
	.4byte	.LVL121-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST43:
	.4byte	.LVL125-.Ltext0
	.4byte	.LVL126-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST44:
	.4byte	.LVL122-.Ltext0
	.4byte	.LVL130-.Ltext0
	.2byte	0x6
	.byte	0x61
	.byte	0x93
	.uleb128 0x4
	.byte	0x62
	.byte	0x93
	.uleb128 0x4
	.4byte	0
	.4byte	0
.LLST45:
	.4byte	.LVL131-.Ltext0
	.4byte	.LVL133-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL133-.Ltext0
	.4byte	.LFE37-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST46:
	.4byte	.LVL131-.Ltext0
	.4byte	.LVL138-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL138-.Ltext0
	.4byte	.LVL139-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	.LVL139-.Ltext0
	.4byte	.LVL142-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL142-.Ltext0
	.4byte	.LFE37-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST47:
	.4byte	.LVL133-.Ltext0
	.4byte	.LVL136-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL140-.Ltext0
	.4byte	.LVL141-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL141-.Ltext0
	.4byte	.LVL142-.Ltext0
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST48:
	.4byte	.LVL132-.Ltext0
	.4byte	.LVL133-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL133-.Ltext0
	.4byte	.LFE37-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST49:
	.4byte	.LVL134-.Ltext0
	.4byte	.LVL135-.Ltext0
	.2byte	0x2
	.byte	0x73
	.sleb128 0
	.4byte	.LVL135-.Ltext0
	.4byte	.LVL136-.Ltext0
	.2byte	0x6
	.byte	0x3
	.4byte	pte_p
	.byte	0x6
	.4byte	.LVL136-.Ltext0
	.4byte	.LVL137-.Ltext0
	.2byte	0x2
	.byte	0x73
	.sleb128 0
	.4byte	.LVL140-.Ltext0
	.4byte	.LVL141-.Ltext0
	.2byte	0x6
	.byte	0x3
	.4byte	pte_p
	.byte	0x6
	.4byte	0
	.4byte	0
.LLST50:
	.4byte	.LVL143-.Ltext0
	.4byte	.LVL144-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL144-.Ltext0
	.4byte	.LFE38-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
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
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB8-.Ltext0
	.4byte	.LBE8-.Ltext0
	.4byte	.LBB12-.Ltext0
	.4byte	.LBE12-.Ltext0
	.4byte	.LBB13-.Ltext0
	.4byte	.LBE13-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB18-.Ltext0
	.4byte	.LBE18-.Ltext0
	.4byte	.LBB22-.Ltext0
	.4byte	.LBE22-.Ltext0
	.4byte	.LBB23-.Ltext0
	.4byte	.LBE23-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB29-.Ltext0
	.4byte	.LBE29-.Ltext0
	.4byte	.LBB32-.Ltext0
	.4byte	.LBE32-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB40-.Ltext0
	.4byte	.LBE40-.Ltext0
	.4byte	.LBB44-.Ltext0
	.4byte	.LBE44-.Ltext0
	.4byte	.LBB45-.Ltext0
	.4byte	.LBE45-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB55-.Ltext0
	.4byte	.LBE55-.Ltext0
	.4byte	.LBB60-.Ltext0
	.4byte	.LBE60-.Ltext0
	.4byte	0
	.4byte	0
	.4byte	.LBB67-.Ltext0
	.4byte	.LBE67-.Ltext0
	.4byte	.LBB70-.Ltext0
	.4byte	.LBE70-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF46:
	.ascii	"set_page_unallocated\000"
.LASF19:
	.ascii	"size_t\000"
.LASF43:
	.ascii	"phy_addr\000"
.LASF14:
	.ascii	"uint64_t\000"
.LASF39:
	.ascii	"get_pte_by_page_addr\000"
.LASF58:
	.ascii	"page_addr\000"
.LASF65:
	.ascii	"vmm_free_page\000"
.LASF41:
	.ascii	"get_phy_addr_by_vir_addr\000"
.LASF0:
	.ascii	"long long unsigned int\000"
.LASF37:
	.ascii	"get_vpn_from_page_addr\000"
.LASF10:
	.ascii	"long long int\000"
.LASF3:
	.ascii	"signed char\000"
.LASF7:
	.ascii	"long int\000"
.LASF12:
	.ascii	"uint16_t\000"
.LASF17:
	.ascii	"double\000"
.LASF32:
	.ascii	"get_ppn_from_page_addr\000"
.LASF38:
	.ascii	"vir_page_addr\000"
.LASF25:
	.ascii	"set_ppn_to_pte\000"
.LASF66:
	.ascii	"pte_addr\000"
.LASF55:
	.ascii	"alloc_block\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF27:
	.ascii	"mask\000"
.LASF36:
	.ascii	"get_pid_from_pte\000"
.LASF33:
	.ascii	"get_ppn_from_pte\000"
.LASF51:
	.ascii	"is_split_block\000"
.LASF1:
	.ascii	"unsigned int\000"
.LASF72:
	.ascii	"block_size\000"
.LASF56:
	.ascii	"block_addr\000"
.LASF2:
	.ascii	"long unsigned int\000"
.LASF44:
	.ascii	"set_page_status\000"
.LASF30:
	.ascii	"size\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF62:
	.ascii	"vmm_alloc_page\000"
.LASF67:
	.ascii	"value_global\000"
.LASF31:
	.ascii	"set_vpn_to_pte\000"
.LASF23:
	.ascii	"bool\000"
.LASF75:
	.ascii	"C:\\Users\\lzy05\\OneDrive\\18-19-Fall\\SCD\\git\\src\000"
.LASF71:
	.ascii	"block_flag\000"
.LASF15:
	.ascii	"sizetype\000"
.LASF48:
	.ascii	"set_page_reserved\000"
.LASF68:
	.ascii	"pte_p\000"
.LASF24:
	.ascii	"pte_t\000"
.LASF42:
	.ascii	"vir_addr\000"
.LASF11:
	.ascii	"__uint64_t\000"
.LASF18:
	.ascii	"float\000"
.LASF59:
	.ascii	"find_block\000"
.LASF4:
	.ascii	"unsigned char\000"
.LASF35:
	.ascii	"get_vpn_from_pte\000"
.LASF60:
	.ascii	"size_up_round\000"
.LASF50:
	.ascii	"get_page_status\000"
.LASF5:
	.ascii	"short int\000"
.LASF61:
	.ascii	"block_idx\000"
.LASF21:
	.ascii	"false\000"
.LASF40:
	.ascii	"get_ppn_by_vpn\000"
.LASF26:
	.ascii	"vmm_init\000"
.LASF63:
	.ascii	"split_block\000"
.LASF13:
	.ascii	"uint32_t\000"
.LASF29:
	.ascii	"flag\000"
.LASF70:
	.ascii	"block_offset\000"
.LASF16:
	.ascii	"char\000"
.LASF52:
	.ascii	"pte_block_flag\000"
.LASF8:
	.ascii	"__uint16_t\000"
.LASF49:
	.ascii	"get_page_status_from_pte\000"
.LASF28:
	.ascii	"offset\000"
.LASF53:
	.ascii	"get_suitable_block_from_pte\000"
.LASF34:
	.ascii	"phy_page_addr\000"
.LASF69:
	.ascii	"vmm_page_addr\000"
.LASF57:
	.ascii	"free_block\000"
.LASF45:
	.ascii	"status\000"
.LASF73:
	.ascii	"GNU C 4.9.2 -mel -march=m14kc -msoft-float -mplt -mips32"
	.ascii	"r2 -msynci -mabi=32 -g -O1\000"
.LASF74:
	.ascii	"mm/vmm.c\000"
.LASF47:
	.ascii	"set_page_allocated\000"
.LASF20:
	.ascii	"pid_t\000"
.LASF64:
	.ascii	"ret_addr\000"
.LASF54:
	.ascii	"up_round\000"
.LASF22:
	.ascii	"true\000"
	.ident	"GCC: (Codescape GNU Tools 2016.05-03 for MIPS MTI Bare Metal) 4.9.2"
