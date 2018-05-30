.globl tigerMain
.type tigerMain, @function
tigerMain:
	addi	$t0, $zero, 1
	addi 	$t1, $zero, 2
	li $5, 0
	ble		$t0, $t1, jyx1
	li $5, 12
	li $4, 11 #0xb
jyx1:
	li	$4,10			# 0xa
	jal	putchar
	nop
	move $4, $5
	jal putchar
	nop

	j $31
	nop
