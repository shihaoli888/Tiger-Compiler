.data
.align 2
L15:
.word 2
.ascii "\n"
.align 2
L14:
.word 18
.ascii " a prime number?\n"
.align 2
L13:
.word 3
.ascii "Is "
.align 2
L5:
.word 2
.ascii "\n"
.align 2
L3:
.word 2
.ascii "\n"
.text
.align 2
.globl tigerMain
tigerMain:
tigerMain_FRAMESIZE = 48
addi $sp,$sp,-48

L17:
sw $ra, -8+tigerMain_FRAMESIZE($sp)
sw $s7, -12+tigerMain_FRAMESIZE($sp)
sw $s6, -16+tigerMain_FRAMESIZE($sp)
sw $s5, -20+tigerMain_FRAMESIZE($sp)
sw $s4, -24+tigerMain_FRAMESIZE($sp)
sw $s3, -28+tigerMain_FRAMESIZE($sp)
sw $s2, -32+tigerMain_FRAMESIZE($sp)
sw $s1, -36+tigerMain_FRAMESIZE($sp)
sw $s0, -40+tigerMain_FRAMESIZE($sp)
li $t0, 1
sw $t0, -4+tigerMain_FRAMESIZE($sp)
li $t0, 2
addi $a0, $sp, tigerMain_FRAMESIZE
move $a1, $t0
jal check
nop
li $t0, 7
addi $a0, $sp, tigerMain_FRAMESIZE
move $a1, $t0
jal check
nop
li $t0, 10
addi $a0, $sp, tigerMain_FRAMESIZE
move $a1, $t0
jal check
nop
li $t0, 15
addi $a0, $sp, tigerMain_FRAMESIZE
move $a1, $t0
jal check
nop
li $t0, 17
addi $a0, $sp, tigerMain_FRAMESIZE
move $a1, $t0
jal check
nop
li $v0, 0
lw $s7, -12+tigerMain_FRAMESIZE($sp)
lw $s6, -16+tigerMain_FRAMESIZE($sp)
lw $s5, -20+tigerMain_FRAMESIZE($sp)
lw $s4, -24+tigerMain_FRAMESIZE($sp)
lw $s3, -28+tigerMain_FRAMESIZE($sp)
lw $s2, -32+tigerMain_FRAMESIZE($sp)
lw $s1, -36+tigerMain_FRAMESIZE($sp)
lw $s0, -40+tigerMain_FRAMESIZE($sp)
lw $ra, -8+tigerMain_FRAMESIZE($sp)
j L16
nop

L16:
nop

addi $sp,$sp,48
jr $ra




.text
.align 2
.globl check
check:
check_FRAMESIZE = 44
addi $sp,$sp,-44

L19:
sw $ra, -4+check_FRAMESIZE($sp)
sw $s7, -8+check_FRAMESIZE($sp)
sw $s6, -12+check_FRAMESIZE($sp)
sw $s5, -16+check_FRAMESIZE($sp)
sw $s4, -20+check_FRAMESIZE($sp)
sw $s3, -24+check_FRAMESIZE($sp)
sw $s2, -28+check_FRAMESIZE($sp)
sw $s1, -32+check_FRAMESIZE($sp)
sw $s0, -36+check_FRAMESIZE($sp)
sw $a0, 0+check_FRAMESIZE($sp)
move $s0, $a1
lw $t0, 0+check_FRAMESIZE($sp)
li $t1, 1
sw $t1, -4($t0)
la $t0, L13
move $a0, $t0
jal printStr
nop
move $a0, $s0
jal printInt
nop
la $t0, L14
move $a0, $t0
jal printStr
nop
lw $t0, 0+check_FRAMESIZE($sp)
move $a0, $t0
move $a1, $s0
jal isPrime
nop
lw $t0, 0+check_FRAMESIZE($sp)
lw $t0, -4($t0)
move $a0, $t0
jal printInt
nop
la $t0, L15
move $a0, $t0
jal printStr
nop
move $v0, $v0
lw $s7, -8+check_FRAMESIZE($sp)
lw $s6, -12+check_FRAMESIZE($sp)
lw $s5, -16+check_FRAMESIZE($sp)
lw $s4, -20+check_FRAMESIZE($sp)
lw $s3, -24+check_FRAMESIZE($sp)
lw $s2, -28+check_FRAMESIZE($sp)
lw $s1, -32+check_FRAMESIZE($sp)
lw $s0, -36+check_FRAMESIZE($sp)
lw $ra, -4+check_FRAMESIZE($sp)
j L18
nop

L18:
nop

addi $sp,$sp,44
jr $ra




.text
.align 2
.globl isPrime
isPrime:
isPrime_FRAMESIZE = 48
addi $sp,$sp,-48

L21:
sw $ra, -4+isPrime_FRAMESIZE($sp)
sw $s7, -8+isPrime_FRAMESIZE($sp)
sw $s6, -12+isPrime_FRAMESIZE($sp)
sw $s5, -16+isPrime_FRAMESIZE($sp)
sw $s4, -20+isPrime_FRAMESIZE($sp)
sw $s3, -24+isPrime_FRAMESIZE($sp)
sw $s2, -28+isPrime_FRAMESIZE($sp)
sw $s1, -32+isPrime_FRAMESIZE($sp)
sw $s0, -36+isPrime_FRAMESIZE($sp)
sw $a0, 0+isPrime_FRAMESIZE($sp)
move $s0, $a1
move $a0, $s0
jal printInt
nop
la $t0, L3
move $a0, $t0
jal printStr
nop
li $t0, 2
beq $s0, $t0, L10
nop

L11:
li $s2, 2
addi $s1, $s0, -1
ble $s2, $s1, L8
nop

L4:
li $t0, 0

L12:
li $v0, 0
lw $s7, -8+isPrime_FRAMESIZE($sp)
lw $s6, -12+isPrime_FRAMESIZE($sp)
lw $s5, -16+isPrime_FRAMESIZE($sp)
lw $s4, -20+isPrime_FRAMESIZE($sp)
lw $s3, -24+isPrime_FRAMESIZE($sp)
lw $s2, -28+isPrime_FRAMESIZE($sp)
lw $s1, -32+isPrime_FRAMESIZE($sp)
lw $s0, -36+isPrime_FRAMESIZE($sp)
lw $ra, -4+isPrime_FRAMESIZE($sp)
j L20
nop

L10:
lw $t0, 0+isPrime_FRAMESIZE($sp)
li $t1, 1
sw $t1, -4($t0)
li $t0, 0
j L12
nop

L8:
addi $a0, $sp, isPrime_FRAMESIZE
move $a1, $s0
move $a2, $s2
jal isDivisible
nop
move $a0, $s0
jal printInt
nop
la $t0, L5
move $a0, $t0
jal printStr
nop
move $a0, $s2
jal printInt
nop
li $t1, 1
lw $t0, 0+isPrime_FRAMESIZE($sp)
lw $t0, -4($t0)
bne $t1, $t0, L6
nop

L7:
bge $s2, $s1, L4
nop

L9:
addi $s2, $s2, 1
j L8
nop

L6:
j L4
nop

L20:
nop

addi $sp,$sp,48
jr $ra




.text
.align 2
.globl isDivisible
isDivisible:
isDivisible_FRAMESIZE = 36
addi $sp,$sp,-36

L23:
sw $ra, -4+isDivisible_FRAMESIZE($sp)
sw $s7, -8+isDivisible_FRAMESIZE($sp)
sw $s6, -12+isDivisible_FRAMESIZE($sp)
sw $s5, -16+isDivisible_FRAMESIZE($sp)
sw $s4, -20+isDivisible_FRAMESIZE($sp)
sw $s3, -24+isDivisible_FRAMESIZE($sp)
sw $s2, -28+isDivisible_FRAMESIZE($sp)
sw $s1, -32+isDivisible_FRAMESIZE($sp)
sw $s0, -36+isDivisible_FRAMESIZE($sp)
sw $a0, 0+isDivisible_FRAMESIZE($sp)
move $t2, $a1
move $t1, $a2
lw $t0, 0+isDivisible_FRAMESIZE($sp)
lw $t0, 0($t0)
addi $t3, $t0, -4
li $t4, 1
div $t0, $t2, $t1
mul $t0, $t0, $t1
bne $t0, $t2, L1
nop

L2:
li $t4, 0

L1:
sw $t4, 0($t3)
li $v0, 0
lw $s7, -8+isDivisible_FRAMESIZE($sp)
lw $s6, -12+isDivisible_FRAMESIZE($sp)
lw $s5, -16+isDivisible_FRAMESIZE($sp)
lw $s4, -20+isDivisible_FRAMESIZE($sp)
lw $s3, -24+isDivisible_FRAMESIZE($sp)
lw $s2, -28+isDivisible_FRAMESIZE($sp)
lw $s1, -32+isDivisible_FRAMESIZE($sp)
lw $s0, -36+isDivisible_FRAMESIZE($sp)
lw $ra, -4+isDivisible_FRAMESIZE($sp)
j L22
nop

L22:
nop

addi $sp,$sp,36
jr $ra




