	# .file	1 "tigerMain.c"
	# .section .mdebug.abi32
	# .previous
	# .gnu_attribute 4, 1
	# .abicalls
	# .option	pic0
	.rdata
	# .align	2
$LC0:
	.ascii	"test\012\000"
	.text
	# .align	2
	.globl	tigerMain
	# .set	nomips16
	# .ent	tigerMain
	# .type	tigerMain, @function
tigerMain:
	# .frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	# .mask	0xc0000000,-4
	# .fmask	0x00000000,0
	# .set	noreorder
	# .set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	xxx = 8
	move	$fp,$sp
	lui  $2,%hi($LC0)
	addiu	$2,$2,%lo($LC0)
	sw	$2,24($fp)
	lui	$2,%hi(stdout)
	lw	$2,%lo(stdout)($2)
	li	$4,120+xxx-8			# 0x78
	move	$5,$2
	jal	_IO_putc
	nop
	
	li	$4,97			# 0x61
	jal	chr
	nop

	sw	$2,28($fp)
	lw	$4,28($fp)
	jal	ord
	nop

	move	$4,$2
	jal	putchar
	nop

	li	$4,98			# 0x62
	jal	chr
	nop

	lw	$4,28($fp)
	move	$5,$2
	jal	concat
	nop

	sw	$2,32($fp)
	lw	$4,32($fp)
	jal	print
	nop

	lw	$4,32($fp)
	li	$5,1			# 0x1
	li	$6,1			# 0x1
	jal	substring
	nop

	move	$4,$2
	jal	print
	nop

	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	# .set	macro
	# .set	reorder
	# .end	tigerMain
	# .size	tigerMain, .-tigerMain
	# .ident	"GCC: (Debian 4.6.3-14) 4.6.3"
