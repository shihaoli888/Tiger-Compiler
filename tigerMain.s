.data
.text
.align 2
.globl tigerMain
tigerMain:
tigerMain_FRAMESIZE = 44
addi $sp,$sp,-44

L2:
sw $ra, -4+tigerMain_FRAMESIZE($sp)
sw $s7, -8+tigerMain_FRAMESIZE($sp)
sw $s6, -12+tigerMain_FRAMESIZE($sp)
sw $s5, -16+tigerMain_FRAMESIZE($sp)
sw $s4, -20+tigerMain_FRAMESIZE($sp)
sw $s3, -24+tigerMain_FRAMESIZE($sp)
sw $s2, -28+tigerMain_FRAMESIZE($sp)
sw $s1, -32+tigerMain_FRAMESIZE($sp)
sw $s0, -36+tigerMain_FRAMESIZE($sp)
li $t0, 0
li $t2, 1
li $t1, 2
li $t3, 3
li $t4, 4
li $t5, 5
li $t6, 6
li $t7, 7
li $t8, 8
li $t9, 9
li $t0, 10
add $t1, $t2, $t1
add $t1, $t1, $t3
add $t1, $t1, $t4
add $t1, $t1, $t5
add $t1, $t1, $t6
add $t1, $t1, $t7
add $t1, $t1, $t8
add $t1, $t1, $t9
add $t0, $t1, $t0
move $t0, $t0
move $a0, $t0
jal printInt
nop
li $v0, 0
lw $s7, -8+tigerMain_FRAMESIZE($sp)
lw $s6, -12+tigerMain_FRAMESIZE($sp)
lw $s5, -16+tigerMain_FRAMESIZE($sp)
lw $s4, -20+tigerMain_FRAMESIZE($sp)
lw $s3, -24+tigerMain_FRAMESIZE($sp)
lw $s2, -28+tigerMain_FRAMESIZE($sp)
lw $s1, -32+tigerMain_FRAMESIZE($sp)
lw $s0, -36+tigerMain_FRAMESIZE($sp)
lw $ra, -4+tigerMain_FRAMESIZE($sp)
j L1
nop

L1:
nop

addi $sp,$sp,44
jr $ra




