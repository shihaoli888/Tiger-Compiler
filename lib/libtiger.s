	.file	1 "libtiger.c"
	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 1
	.abicalls
	.option	pic0

	.comm	constchar,1024,4

	.comm	emptychar,4,4
	.text
	.align	2
	.globl	initArray
	.set	nomips16
	.ent	initArray
	.type	initArray, @function
initArray:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	sw	$5,44($fp)
	lw	$2,40($fp)
	sll	$2,$2,2
	move	$4,$2
	jal	malloc
	nop

	sw	$2,28($fp)
	sw	$0,24($fp)
	j	$L2
	nop

$L3:
	lw	$2,24($fp)
	sll	$2,$2,2
	lw	$3,28($fp)
	addu	$2,$3,$2
	lw	$3,44($fp)
	sw	$3,0($2)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L2:
	lw	$3,24($fp)
	lw	$2,40($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L3
	nop

	lw	$2,28($fp)
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	initArray
	.size	initArray, .-initArray
	.align	2
	.globl	allocRecord
	.set	nomips16
	.ent	allocRecord
	.type	allocRecord, @function
allocRecord:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	lw	$2,32($fp)
	sll	$2,$2,2
	move	$4,$2
	jal	malloc
	nop

	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	allocRecord
	.size	allocRecord, .-allocRecord
	.align	2
	.globl	printStr
	.set	nomips16
	.ent	printStr
	.type	printStr, @function
printStr:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	lw	$2,40($fp)
	lw	$2,0($2)
	sw	$2,28($fp)
	sw	$0,24($fp)
	j	$L6
	nop

$L7:
	lw	$3,40($fp)
	lw	$2,24($fp)
	addu	$2,$3,$2
	lbu	$2,4($2)
	move	$4,$2
	jal	putchar
	nop

	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L6:
	lw	$3,24($fp)
	lw	$2,28($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L7
	nop

	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	printStr
	.size	printStr, .-printStr
	.rdata
	.align	2
$LC0:
	.ascii	"%d\000"
	.text
	.align	2
	.globl	printInt
	.set	nomips16
	.ent	printInt
	.type	printInt, @function
printInt:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	lui	$2,%hi($LC0)
	addiu	$2,$2,%lo($LC0)
	move	$4,$2
	lw	$5,32($fp)
	jal	printf
	nop

	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	printInt
	.size	printInt, .-printInt
	.align	2
	.globl	flush
	.set	nomips16
	.ent	flush
	.type	flush, @function
flush:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	lui	$2,%hi(stdout)
	lw	$2,%lo(stdout)($2)
	move	$4,$2
	jal	fflush
	nop

	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	flush
	.size	flush, .-flush
	.align	2
	.globl	tigerGetchar
	.set	nomips16
	.ent	tigerGetchar
	.type	tigerGetchar, @function
tigerGetchar:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	lui	$2,%hi(stdin)
	lw	$2,%lo(stdin)($2)
	move	$4,$2
	jal	_IO_getc
	nop

	sw	$2,24($fp)
	lw	$3,24($fp)
	li	$2,-1			# 0xffffffffffffffff
	bne	$3,$2,$L11
	nop

	lui	$2,%hi(emptychar)
	lw	$2,%lo(emptychar)($2)
	j	$L12
	nop

$L11:
	lui	$2,%hi(constchar)
	lw	$3,24($fp)
	sll	$3,$3,2
	addiu	$2,$2,%lo(constchar)
	addu	$2,$3,$2
	lw	$2,0($2)
$L12:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	tigerGetchar
	.size	tigerGetchar, .-tigerGetchar
	.align	2
	.globl	ord
	.set	nomips16
	.ent	ord
	.type	ord, @function
ord:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	lw	$2,8($fp)
	lw	$2,0($2)
	beq	$2,$0,$L14
	nop

	lw	$2,8($fp)
	lbu	$2,4($2)
	j	$L15
	nop

$L14:
	li	$2,-1			# 0xffffffffffffffff
$L15:
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	ord
	.size	ord, .-ord
	.rdata
	.align	2
$LC1:
	.ascii	"Error: function chr: ASCII value out of range\000"
	.text
	.align	2
	.globl	chr
	.set	nomips16
	.ent	chr
	.type	chr, @function
chr:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	lw	$2,32($fp)
	bltz	$2,$L17
	nop

	lw	$2,32($fp)
	slt	$2,$2,256
	bne	$2,$0,$L18
	nop

$L17:
	lui	$2,%hi($LC1)
	addiu	$4,$2,%lo($LC1)
	jal	puts
	nop

	li	$4,1			# 0x1
	jal	exit
	nop

$L18:
	lui	$2,%hi(constchar)
	lw	$3,32($fp)
	sll	$3,$3,2
	addiu	$2,$2,%lo(constchar)
	addu	$2,$3,$2
	lw	$2,0($2)
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	chr
	.size	chr, .-chr
	.align	2
	.globl	size
	.set	nomips16
	.ent	size
	.type	size, @function
size:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	lw	$2,8($fp)
	lw	$2,0($2)
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	size
	.size	size, .-size
	.rdata
	.align	2
$LC2:
	.ascii	"Error: function substring: out of range\000"
	.text
	.align	2
	.globl	substring
	.set	nomips16
	.ent	substring
	.type	substring, @function
substring:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	sw	$5,44($fp)
	sw	$6,48($fp)
	lw	$3,48($fp)
	lw	$2,44($fp)
	addu	$3,$3,$2
	lw	$2,40($fp)
	lw	$2,0($2)
	slt	$2,$2,$3
	beq	$2,$0,$L21
	nop

	lui	$2,%hi($LC2)
	addiu	$4,$2,%lo($LC2)
	jal	puts
	nop

	li	$4,1			# 0x1
	jal	exit
	nop

$L21:
	lw	$2,48($fp)
	addiu	$2,$2,1
	sll	$2,$2,2
	move	$4,$2
	jal	malloc
	nop

	sw	$2,24($fp)
	lw	$2,24($fp)
	lw	$3,48($fp)
	sw	$3,0($2)
	lw	$2,24($fp)
	addiu	$2,$2,4
	move	$4,$2
	lw	$2,40($fp)
	addiu	$2,$2,4
	move	$3,$2
	lw	$2,44($fp)
	addu	$3,$3,$2
	lw	$2,48($fp)
	sll	$2,$2,2
	move	$5,$3
	move	$6,$2
	jal	memcpy
	nop

	lw	$2,24($fp)
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	substring
	.size	substring, .-substring
	.align	2
	.globl	concat
	.set	nomips16
	.ent	concat
	.type	concat, @function
concat:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	sw	$5,44($fp)
	lw	$2,40($fp)
	lw	$2,0($2)
	bne	$2,$0,$L23
	nop

	lw	$2,44($fp)
	j	$L24
	nop

$L23:
	lw	$2,44($fp)
	lw	$2,0($2)
	bne	$2,$0,$L25
	nop

	lw	$2,40($fp)
	j	$L24
	nop

$L25:
	lw	$2,40($fp)
	lw	$3,0($2)
	lw	$2,44($fp)
	lw	$2,0($2)
	addu	$2,$3,$2
	sw	$2,24($fp)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sll	$2,$2,2
	move	$4,$2
	jal	malloc
	nop

	sw	$2,28($fp)
	lw	$2,28($fp)
	lw	$3,24($fp)
	sw	$3,0($2)
	lw	$2,28($fp)
	addiu	$2,$2,4
	move	$4,$2
	lw	$2,40($fp)
	addiu	$2,$2,4
	move	$3,$2
	lw	$2,40($fp)
	lw	$2,0($2)
	sll	$2,$2,2
	move	$5,$3
	move	$6,$2
	jal	memcpy
	nop

	lw	$2,28($fp)
	addiu	$2,$2,4
	move	$3,$2
	lw	$2,40($fp)
	lw	$2,0($2)
	addu	$4,$3,$2
	lw	$2,44($fp)
	addiu	$2,$2,4
	move	$3,$2
	lw	$2,44($fp)
	lw	$2,0($2)
	sll	$2,$2,2
	move	$5,$3
	move	$6,$2
	jal	memcpy
	nop

	lw	$2,28($fp)
$L24:
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	concat
	.size	concat, .-concat
	.align	2
	.globl	not
	.set	nomips16
	.ent	not
	.type	not, @function
not:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	lw	$2,8($fp)
	sltu	$2,$2,1
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	not
	.size	not, .-not
	.align	2
	.globl	tigerExit
	.set	nomips16
	.ent	tigerExit
	.type	tigerExit, @function
tigerExit:
	.frame	$fp,32,$31		# vars= 0, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	lw	$4,32($fp)
	jal	exit
	nop

	.set	macro
	.set	reorder
	.end	tigerExit
	.size	tigerExit, .-tigerExit
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
	.type	main, @function
main:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	sw	$0,24($fp)
	j	$L29
	nop

$L30:
	li	$4,8			# 0x8
	jal	malloc
	nop

	move	$3,$2
	lui	$2,%hi(constchar)
	lw	$4,24($fp)
	sll	$4,$4,2
	addiu	$2,$2,%lo(constchar)
	addu	$2,$4,$2
	sw	$3,0($2)
	lui	$2,%hi(constchar)
	lw	$3,24($fp)
	sll	$3,$3,2
	addiu	$2,$2,%lo(constchar)
	addu	$2,$3,$2
	lw	$2,0($2)
	li	$3,1			# 0x1
	sw	$3,0($2)
	lui	$2,%hi(constchar)
	lw	$3,24($fp)
	sll	$3,$3,2
	addiu	$2,$2,%lo(constchar)
	addu	$2,$3,$2
	lw	$2,0($2)
	lw	$3,24($fp)
	andi	$3,$3,0x00ff
	sb	$3,4($2)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L29:
	lw	$2,24($fp)
	slt	$2,$2,256
	bne	$2,$0,$L30
	nop

	li	$4,8			# 0x8
	jal	malloc
	nop

	move	$3,$2
	lui	$2,%hi(emptychar)
	sw	$3,%lo(emptychar)($2)
	lui	$2,%hi(emptychar)
	lw	$2,%lo(emptychar)($2)
	sb	$0,4($2)
	lui	$2,%hi(emptychar)
	lw	$2,%lo(emptychar)($2)
	sw	$0,0($2)
	jal	tigerMain
	nop

	move	$2,$0
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14) 4.6.3"
