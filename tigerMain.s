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
li $s7, 0
li $s6, 1
li $s7, 2
li $s5, 3
li $s4, 4
li $s3, 5
li $s2, 6
li $s1, 7
li $s0, 8
li $t9, 9
li $t8, 10
li $t7, 11
li $t6, 12
li $t5, 13
li $t4, 14
li $t3, 15
li $t2, 16
li $t1, 17
li $t0, 18
li r120, 19
sw r120, -48+tigerMain_FRAMESIZE($sp)
lw r120, -48+tigerMain_FRAMESIZE($sp)
sw r120, -44+tigerMain_FRAMESIZE($sp)
lw r120, -44+tigerMain_FRAMESIZE($sp)
sw r120, -48+tigerMain_FRAMESIZE($sp)
lw r120, -48+tigerMain_FRAMESIZE($sp)
sw r120, -40+tigerMain_FRAMESIZE($sp)
add $s7, $s6, $s7
add $s7, $s7, $s5
add $s7, $s7, $s4
add $s7, $s7, $s3
add $s7, $s7, $s2
add $s7, $s7, $s1
add $s7, $s7, $s0
add $s7, $s7, $t9
add $s7, $s7, $t8
add $s7, $s7, $t7
add $s7, $s7, $t6
add $s7, $s7, $t5
add $s7, $s7, $t4
add $s7, $s7, $t3
add $s7, $s7, $t2
add $s7, $s7, $t1
add $s7, $s7, $t0
lw r120, -40+tigerMain_FRAMESIZE($sp)
sw r120, -48+tigerMain_FRAMESIZE($sp)
lw r120, -48+tigerMain_FRAMESIZE($sp)
sw r120, -44+tigerMain_FRAMESIZE($sp)
lw r120, -44+tigerMain_FRAMESIZE($sp)
sw r120, -48+tigerMain_FRAMESIZE($sp)
lw r120, -48+tigerMain_FRAMESIZE($sp)
add $s7, $s7, r120
move $s7, $s7
move $a0, $s7
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




