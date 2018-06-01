.data
.align 2
L7:
.word 2
.ascii "\n"
.align 2
L6:
.word 2
.ascii "\n"
.align 2
L5:
.word 2
.ascii "\n"
.align 2
L1:
.word 14
.ascii "Hello World!\n"
.text
.align 2
.globl tigerMain
tigerMain:
tigerMain_FRAMESIZE = 52
addi $sp,$sp,-52

L9:
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
jal tigerGetchar
nop
move $s1, $v0
move $s2, $s0
li $t0, 0
li $t0, 3
li $s3, 0
move $s2, $t0
ble $s3, $s2, L3
nop

L2:
move $a0, $s0
move $a1, $s1
jal concat
nop
move $s2, $v0
move $a0, $s2
jal printStr
nop
la $t0, L5
move $a0, $t0
jal printStr
nop
move $a0, $s2
jal size
nop
move $t0, $v0
li $t1, 3
addi $t0, $t0, -3
move $a0, $s2
move $a1, $t1
move $a2, $t0
jal substring
nop
move $t0, $v0
move $a0, $t0
jal printStr
nop
la $t0, L6
move $a0, $t0
jal printStr
nop
move $a0, $s0
jal ord
nop
move $t0, $v0
move $a0, $t0
jal chr
nop
move $t0, $v0
move $a0, $t0
jal printStr
nop
la $t0, L7
move $a0, $t0
jal printStr
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
j L8
nop

L3:
move $a0, $s0
jal printStr
nop
bge $s3, $s2, L2
nop

L4:
addi $s3, $s3, 1
j L3
nop

L8:
nop

addi $sp,$sp,52
jr $ra




