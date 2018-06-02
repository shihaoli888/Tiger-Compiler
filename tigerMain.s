.data
.align 2
L6:
.word 1
.ascii "\n"
.text
.align 2
.globl tigerMain
tigerMain:
tigerMain_FRAMESIZE = 72
addi $sp,$sp,-72

L8:
sw $ra, -8+tigerMain_FRAMESIZE($sp)
sw $s7, -12+tigerMain_FRAMESIZE($sp)
sw $s6, -16+tigerMain_FRAMESIZE($sp)
sw $s5, -20+tigerMain_FRAMESIZE($sp)
sw $s4, -24+tigerMain_FRAMESIZE($sp)
sw $s3, -28+tigerMain_FRAMESIZE($sp)
sw $s2, -32+tigerMain_FRAMESIZE($sp)
sw $s1, -36+tigerMain_FRAMESIZE($sp)
sw $s0, -40+tigerMain_FRAMESIZE($sp)
li $s7, 1
sw $zero, -4+tigerMain_FRAMESIZE($sp)
li $s7, 2
li $s6, 3
li $s5, 4
li $s4, 5
li $s3, 6
li $s2, 7
li $s1, 8
addi $a0, $sp, tigerMain_FRAMESIZE
move $a1, $s7
move $a2, $s6
move $a3, $s5
sw $s4, 16($sp)
sw $s3, 20($sp)
sw $s2, 24($sp)
sw $s1, 28($sp)
jal fun
nop
lw $s7, -4+tigerMain_FRAMESIZE($sp)
move $a0, $s7
jal printInt
nop
la $s7, L6
move $a0, $s7
jal printStr
nop
move $v0, $v0
lw $s7, -12+tigerMain_FRAMESIZE($sp)
lw $s6, -16+tigerMain_FRAMESIZE($sp)
lw $s5, -20+tigerMain_FRAMESIZE($sp)
lw $s4, -24+tigerMain_FRAMESIZE($sp)
lw $s3, -28+tigerMain_FRAMESIZE($sp)
lw $s2, -32+tigerMain_FRAMESIZE($sp)
lw $s1, -36+tigerMain_FRAMESIZE($sp)
lw $s0, -40+tigerMain_FRAMESIZE($sp)
lw $ra, -8+tigerMain_FRAMESIZE($sp)
j L7
nop

L7:
nop

addi $sp,$sp,72
jr $ra




.text
.align 2
.globl fun
fun:
fun_FRAMESIZE = 36
addi $sp,$sp,-36

L10:
sw $ra, -4+fun_FRAMESIZE($sp)
sw $s7, -8+fun_FRAMESIZE($sp)
sw $s6, -12+fun_FRAMESIZE($sp)
sw $s5, -16+fun_FRAMESIZE($sp)
sw $s4, -20+fun_FRAMESIZE($sp)
sw $s3, -24+fun_FRAMESIZE($sp)
sw $s2, -28+fun_FRAMESIZE($sp)
sw $s1, -32+fun_FRAMESIZE($sp)
sw $s0, -36+fun_FRAMESIZE($sp)
sw $a0, 0+fun_FRAMESIZE($sp)
move $s5, $a1
move $s6, $a2
move $s3, $a3
lw $s1, 16+fun_FRAMESIZE($sp)
lw $s2, 20+fun_FRAMESIZE($sp)
lw $t9, 24+fun_FRAMESIZE($sp)
lw $s0, 28+fun_FRAMESIZE($sp)
li $s4, 2
lw $s7, 0+fun_FRAMESIZE($sp)
addi $s7, $s7, -4
div $s6, $s5, $s6
add $s6, $s4, $s6
move $s5, $s6
move $s6, $s3
beq $s1, $s2, L1
nop

L2:
li $s4, 0

L3:
mul $s6, $s6, $s4
sub $s6, $s5, $s6
sw $s6, 0($s7)
li $v0, 0
lw $s7, -8+fun_FRAMESIZE($sp)
lw $s6, -12+fun_FRAMESIZE($sp)
lw $s5, -16+fun_FRAMESIZE($sp)
lw $s4, -20+fun_FRAMESIZE($sp)
lw $s3, -24+fun_FRAMESIZE($sp)
lw $s2, -28+fun_FRAMESIZE($sp)
lw $s1, -32+fun_FRAMESIZE($sp)
lw $s0, -36+fun_FRAMESIZE($sp)
lw $ra, -4+fun_FRAMESIZE($sp)
j L9
nop

L1:
li $s4, 1
ble $t9, $s0, L4
nop

L5:
li $s4, 0

L4:
move $s4, $s4
j L3
nop

L9:
nop

addi $sp,$sp,36
jr $ra




