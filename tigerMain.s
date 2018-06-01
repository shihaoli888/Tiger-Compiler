.data
.align 2
L1:
.word 14
.ascii "Hello World!\n"
.text
.align 2
.globl tigerMain
tigerMain:
tigerMain_FRAMESIZE = 44
addi $sp,$sp,-44

L6:
sw $ra, -4+tigerMain_FRAMESIZE($sp)
sw $s7, -8+tigerMain_FRAMESIZE($sp)
sw $s6, -12+tigerMain_FRAMESIZE($sp)
sw $s5, -16+tigerMain_FRAMESIZE($sp)
sw $s4, -20+tigerMain_FRAMESIZE($sp)
sw $s3, -24+tigerMain_FRAMESIZE($sp)
sw $s2, -28+tigerMain_FRAMESIZE($sp)
sw $s1, -32+tigerMain_FRAMESIZE($sp)
sw $s0, -36+tigerMain_FRAMESIZE($sp)
la $t0, L1
move $s0, $t0
li $t0, 3
li $s2, 0
move $s1, $t0
ble $s2, $s1, L3
nop

L2:
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
j L5
nop

L3:
move $a0, $s0
jal printStr
nop
bge $s2, $s1, L2
nop

L4:
addi $s2, $s2, 1
j L3
nop

L5:
nop

addi $sp,$sp,44
jr $ra




