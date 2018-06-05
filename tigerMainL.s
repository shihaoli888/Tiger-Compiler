.data
.text
.align 2
.globl tigerMain
tigerMain:
tigerMain_FRAMESIZE = 12
addi $sp,$sp,-12

L5:
move $t9, $ra
sw $t9, -4+tigerMain_FRAMESIZE($sp)
move $s7, $s7
move $s6, $s6
move $s5, $s5
move $s4, $s4
move $s3, $s3
move $s2, $s2
move $s1, $s1
move $s0, $s0
li $t9, 10
addi $a0, $sp, tigerMain_FRAMESIZE
move $a1, $t9
jal nfactor
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
lw $t9, -4+tigerMain_FRAMESIZE($sp)
move $ra, $t9
j L4
nop

L4:
nop

addi $sp,$sp,12
jr $ra




.text
.align 2
.globl nfactor
nfactor:
nfactor_FRAMESIZE = 16
addi $sp,$sp,-16

L8:
move $t9, $ra
sw $t9, -8+nfactor_FRAMESIZE($sp)
move $s7, $s7
move $s6, $s6
sw $s6, -4+nfactor_FRAMESIZE($sp)
move $s5, $s5
move $s4, $s4
move $s3, $s3
move $s2, $s2
move $s1, $s1
move $s0, $s0
sw $a0, 0+nfactor_FRAMESIZE($sp)
move $s6, $a1
beq $s6, $zero, L1
nop

L2:
move $s6, $s6
lw $t9, 0+nfactor_FRAMESIZE($sp)
addi $t8, $s6, -1
move $a0, $t9
move $a1, $t8
jal nfactor
nop
move $t9, $v0
mul $s6, $s6, $t9
move $s6, $s6

L3:
move $v0, $s6
move $s7, $s7
lw $s6, -4+nfactor_FRAMESIZE($sp)
move $s6, $s6
move $s5, $s5
move $s4, $s4
move $s3, $s3
move $s2, $s2
move $s1, $s1
move $s0, $s0
lw $t9, -8+nfactor_FRAMESIZE($sp)
move $ra, $t9
j L7
nop

L1:
li $s6, 1
j L3
nop

L7:
nop

addi $sp,$sp,16
jr $ra




