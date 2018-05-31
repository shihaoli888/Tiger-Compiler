	# .file	1 "tigerMain.c"
	# .section .mdebug.abi32
	# .previous
	# .gnu_attribute 4, 1
	# .abicalls
	# .option	pic0
	.data
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
	# .frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	# .mask	0xc0000000,-4
	# .fmask	0x00000000,0
	# .set	noreorder
	# .set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	# lui	$2,%hi($LC0)
	# addiu	$2,$2,%lo($LC0)
	la $2, $LC0
	sw	$2,24($fp)
	jal	tigerGetchar
	nop

	sw	$2,28($fp)
	li	$4,97			# 0x61
	jal	chr
	nop

	sw	$2,32($fp)
	li	$4,98			# 0x62
	jal	chr
	nop


	lw	$4,32($fp)
	move	$5,$2
	jal	concat
	nop

	move	$4,$2
	lw	$5,28($fp)
	jal	concat
	nop

	sw	$2,36($fp)
	lw	$4,36($fp)
	jal	printStr
	nop

	jal	flush
	nop

	lw	$4,36($fp)
	li	$5,1			# 0x1
	li	$6,1			# 0x1
	jal	substring
	nop

	move	$4,$2
	jal	printStr
	nop

	lw	$4,36($fp)
	jal	size
	nop

	move	$4,$2
	jal	printInt
	nop

	lw	$4,36($fp)
	jal	size
	nop

	move	$4,$2
	jal	not
	nop

	move	$4,$2
	jal	printInt
	nop

	lw	$4,32($fp)
	jal	ord
	nop

	move	$4,$2
	jal	printInt
	nop

	not $t0, $t1

	li	$4,-1			# 0xffffffffffffffff
	jal	tigerExit
	nop

	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	# .set	macro
	# .set	reorder
	# .end	tigerMain
	# .size	tigerMain, .-tigerMain
	# .ident	"GCC: (Debian 4.6.3-14) 4.6.3"
