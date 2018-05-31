.data
.text
.globl main
main:
tigerMain_FRAMESIZE = 8
addi $sp,$sp,-8

L2:
move $t0, $ra
move $s7, $s7
move $s6, $s6
move $s5, $s5
move $s4, $s4
move $s3, $s3
move $s2, $s2
move $s1, $s1
move $s0, $s0
li $t1, 0
li $t9, 1
li $t8, 2
li $t7, 3
li $t6, 4
li $t5, 5
li $t4, 6
li $t3, 7
li $t2, 8
li $t1, 9
add $t8, $t9, $t8
add $t7, $t8, $t7
add $t6, $t7, $t6
add $t5, $t6, $t5
add $t4, $t5, $t4
add $t3, $t4, $t3
add $t2, $t3, $t2
add $t1, $t2, $t1
move $t1, $t1
move $a0, $t1
jal printInt
nop
li $v0, 0
move $s7, $s7
move $s6, $s6
move $s5, $s5
move $s4, $s4
move $s3, $s3
move $s2, $s2
move $s1, $s1
move $s0, $s0
move $ra, $t0
j L1
nop

L1:
addi $sp,$sp,8
jr $ra




