tigerMain:
tigerMain_FRAMESIZE = 8
addi $sp,$sp,-8

L5:
move $t0, $ra
move $s7, $s7
move $s6, $s6
move $s5, $s5
move $s4, $s4
move $s3, $s3
move $s2, $s2
move $s1, $s1
move $t0, $s0
li $s0, 8
move $a0, $fp
move $a1, $s0
jal factorial
nop
li $v0, 0
move $s7, $s7
move $s6, $s6
move $s5, $s5
move $s4, $s4
move $s3, $s3
move $s2, $s2
move $s1, $s1
move $s0, $t0
j L4
nop

L4:
addi $sp,$sp,8
jr $ra
factorial:
factorial_FRAMESIZE = 8
addi $sp,$sp,-8

L7:
move $t0, $ra
sw $a0, 0+factorial_FRAMESIZE($sp)
move $t0, $a1
move $s7, $s7
move $s6, $s6
move $s5, $s5
move $s4, $s4
move $s3, $s3
move $s2, $s2
move $s1, $s1
move $s0, $s0
blt $t1, $zero, L1
nop

L2:
move $t2, $t1
lw $t0, 0+factorial_FRAMESIZE($sp)
addi $t1, $t1, -1
move $a0, $t0
move $a1, $t1
jal factorial
nop
move $t0, $v0
mul $t0, $t2, $t0
move $t0, $t0

L3:
move $v0, $t0
move $s7, $s7
move $s6, $s6
move $s5, $s5
move $s4, $s4
move $s3, $s3
move $s2, $s2
move $s1, $s1
move $s0, $s0
j L6
nop

L1:
addi $t0, $zero, -1
j L3
nop

L6:
addi $sp,$sp,8
jr $ra
