.data
.align 2
L13:
.word 2
.ascii "\n"
.align 2
L10:
.word 2
.ascii "\n"
.align 2
L4:
.word 2
.ascii " ."
.align 2
L3:
.word 2
.ascii " O"
.text
.align 2
.globl tigerMain
tigerMain:
tigerMain_FRAMESIZE = 64
addi $sp,$sp,-64

L33:
sw $ra, -24+tigerMain_FRAMESIZE($sp)
sw $s7, -28+tigerMain_FRAMESIZE($sp)
sw $s6, -32+tigerMain_FRAMESIZE($sp)
sw $s5, -36+tigerMain_FRAMESIZE($sp)
sw $s4, -40+tigerMain_FRAMESIZE($sp)
sw $s3, -44+tigerMain_FRAMESIZE($sp)
sw $s2, -48+tigerMain_FRAMESIZE($sp)
sw $s1, -52+tigerMain_FRAMESIZE($sp)
sw $s0, -56+tigerMain_FRAMESIZE($sp)
li $s7, 8
sw $s7, -4+tigerMain_FRAMESIZE($sp)
addi $s7, $fp, -8
lw $s6, -4+tigerMain_FRAMESIZE($sp)
move $a0, $s6
move $a1, $zero
jal initArray
nop
move $s6, $v0
sw $s6, 0($s7)
addi $s7, $fp, -12
lw $s6, -4+tigerMain_FRAMESIZE($sp)
move $a0, $s6
move $a1, $zero
jal initArray
nop
move $s6, $v0
sw $s6, 0($s7)
addi $s7, $fp, -16
lw $s5, -4+tigerMain_FRAMESIZE($sp)
lw $s6, -4+tigerMain_FRAMESIZE($sp)
add $s6, $s5, $s6
addi $s6, $s6, -1
move $a0, $s6
move $a1, $zero
jal initArray
nop
move $s6, $v0
sw $s6, 0($s7)
addi $s7, $fp, -20
lw $s5, -4+tigerMain_FRAMESIZE($sp)
lw $s6, -4+tigerMain_FRAMESIZE($sp)
add $s6, $s5, $s6
addi $s6, $s6, -1
move $a0, $s6
move $a1, $zero
jal initArray
nop
move $s6, $v0
sw $s6, 0($s7)
addi $a0, $sp, tigerMain_FRAMESIZE
move $a1, $zero
jal try
nop
li $v0, 0
lw $s7, -28+tigerMain_FRAMESIZE($sp)
lw $s6, -32+tigerMain_FRAMESIZE($sp)
lw $s5, -36+tigerMain_FRAMESIZE($sp)
lw $s4, -40+tigerMain_FRAMESIZE($sp)
lw $s3, -44+tigerMain_FRAMESIZE($sp)
lw $s2, -48+tigerMain_FRAMESIZE($sp)
lw $s1, -52+tigerMain_FRAMESIZE($sp)
lw $s0, -56+tigerMain_FRAMESIZE($sp)
lw $ra, -24+tigerMain_FRAMESIZE($sp)
j L32
nop

L32:
nop

addi $sp,$sp,64
jr $ra




.text
.align 2
.globl try
try:
try_FRAMESIZE = 44
addi $sp,$sp,-44

L35:
sw $ra, -4+try_FRAMESIZE($sp)
sw $s7, -8+try_FRAMESIZE($sp)
sw $s6, -12+try_FRAMESIZE($sp)
sw $s5, -16+try_FRAMESIZE($sp)
sw $s4, -20+try_FRAMESIZE($sp)
sw $s3, -24+try_FRAMESIZE($sp)
sw $s2, -28+try_FRAMESIZE($sp)
sw $s1, -32+try_FRAMESIZE($sp)
sw $s0, -36+try_FRAMESIZE($sp)
sw $a0, 0+try_FRAMESIZE($sp)
move $s5, $a1
lw $s7, 0+try_FRAMESIZE($sp)
lw $s7, -4($s7)
beq $s5, $s7, L29
nop

L30:
li $s6, 0
lw $s7, 0+try_FRAMESIZE($sp)
lw $s7, -4($s7)
addi $s7, $s7, -1
ble $s6, $s7, L27
nop

L14:
li $s7, 0

L31:
move $v0, $s7
lw $s7, -8+try_FRAMESIZE($sp)
lw $s6, -12+try_FRAMESIZE($sp)
lw $s5, -16+try_FRAMESIZE($sp)
lw $s4, -20+try_FRAMESIZE($sp)
lw $s3, -24+try_FRAMESIZE($sp)
lw $s2, -28+try_FRAMESIZE($sp)
lw $s1, -32+try_FRAMESIZE($sp)
lw $s0, -36+try_FRAMESIZE($sp)
lw $ra, -4+try_FRAMESIZE($sp)
j L34
nop

L29:
lw $s7, 0+try_FRAMESIZE($sp)
move $a0, $s7
jal printboard
nop
move $s7, $v0
j L31
nop

L27:
lw $s4, 0+try_FRAMESIZE($sp)
lw $s3, -8($s4)
li $s4, 4
mul $s4, $s6, $s4
add $s4, $s3, $s4
lw $s4, 0($s4)
beq $s4, $zero, L15
nop

L16:
li $s4, 0

L17:
bne $zero, $s4, L20
nop

L21:
li $s4, 0

L22:
bne $zero, $s4, L25
nop

L26:
bge $s6, $s7, L14
nop

L28:
addi $s6, $s6, 1
j L27
nop

L15:
li $s1, 1
lw $s4, 0+try_FRAMESIZE($sp)
lw $s2, -16($s4)
add $s3, $s6, $s5
li $s4, 4
mul $s4, $s3, $s4
add $s4, $s2, $s4
lw $s4, 0($s4)
beq $s4, $zero, L18
nop

L19:
li $s1, 0

L18:
move $s4, $s1
j L17
nop

L20:
li $s1, 1
lw $s4, 0+try_FRAMESIZE($sp)
lw $s2, -20($s4)
addi $s4, $s6, 7
sub $s3, $s4, $s5
li $s4, 4
mul $s4, $s3, $s4
add $s4, $s2, $s4
lw $s4, 0($s4)
beq $s4, $zero, L23
nop

L24:
li $s1, 0

L23:
move $s4, $s1
j L22
nop

L25:
li $s2, 1
lw $s4, 0+try_FRAMESIZE($sp)
lw $s3, -8($s4)
li $s4, 4
mul $s4, $s6, $s4
add $s4, $s3, $s4
sw $s2, 0($s4)
li $s1, 1
lw $s4, 0+try_FRAMESIZE($sp)
lw $s2, -16($s4)
add $s3, $s6, $s5
li $s4, 4
mul $s4, $s3, $s4
add $s4, $s2, $s4
sw $s1, 0($s4)
li $s1, 1
lw $s4, 0+try_FRAMESIZE($sp)
lw $s2, -20($s4)
addi $s4, $s6, 7
sub $s3, $s4, $s5
li $s4, 4
mul $s4, $s3, $s4
add $s4, $s2, $s4
sw $s1, 0($s4)
lw $s4, 0+try_FRAMESIZE($sp)
lw $s3, -12($s4)
li $s4, 4
mul $s4, $s5, $s4
add $s4, $s3, $s4
sw $s6, 0($s4)
lw $s4, 0+try_FRAMESIZE($sp)
addi $s3, $s5, 1
move $a0, $s4
move $a1, $s3
jal try
nop
lw $s4, 0+try_FRAMESIZE($sp)
lw $s3, -8($s4)
li $s4, 4
mul $s4, $s6, $s4
add $s4, $s3, $s4
sw $zero, 0($s4)
lw $s4, 0+try_FRAMESIZE($sp)
lw $s2, -16($s4)
add $s3, $s6, $s5
li $s4, 4
mul $s4, $s3, $s4
add $s4, $s2, $s4
sw $zero, 0($s4)
lw $s4, 0+try_FRAMESIZE($sp)
lw $s2, -20($s4)
addi $s4, $s6, 7
sub $s3, $s4, $s5
li $s4, 4
mul $s4, $s3, $s4
add $s4, $s2, $s4
sw $zero, 0($s4)
j L26
nop

L34:
nop

addi $sp,$sp,44
jr $ra




.text
.align 2
.globl printboard
printboard:
printboard_FRAMESIZE = 44
addi $sp,$sp,-44

L37:
sw $ra, -4+printboard_FRAMESIZE($sp)
sw $s7, -8+printboard_FRAMESIZE($sp)
sw $s6, -12+printboard_FRAMESIZE($sp)
sw $s5, -16+printboard_FRAMESIZE($sp)
sw $s4, -20+printboard_FRAMESIZE($sp)
sw $s3, -24+printboard_FRAMESIZE($sp)
sw $s2, -28+printboard_FRAMESIZE($sp)
sw $s1, -32+printboard_FRAMESIZE($sp)
sw $s0, -36+printboard_FRAMESIZE($sp)
sw $a0, 0+printboard_FRAMESIZE($sp)
li $s6, 0
lw $s7, 0+printboard_FRAMESIZE($sp)
lw $s7, -4($s7)
addi $s7, $s7, -1
ble $s6, $s7, L11
nop

L1:
la $s7, L13
move $a0, $s7
jal printStr
nop
move $v0, $v0
lw $s7, -8+printboard_FRAMESIZE($sp)
lw $s6, -12+printboard_FRAMESIZE($sp)
lw $s5, -16+printboard_FRAMESIZE($sp)
lw $s4, -20+printboard_FRAMESIZE($sp)
lw $s3, -24+printboard_FRAMESIZE($sp)
lw $s2, -28+printboard_FRAMESIZE($sp)
lw $s1, -32+printboard_FRAMESIZE($sp)
lw $s0, -36+printboard_FRAMESIZE($sp)
lw $ra, -4+printboard_FRAMESIZE($sp)
j L36
nop

L11:
li $s4, 0
lw $s5, 0+printboard_FRAMESIZE($sp)
lw $s5, -4($s5)
addi $s5, $s5, -1
ble $s4, $s5, L8
nop

L2:
la $s5, L10
move $a0, $s5
jal printStr
nop
bge $s6, $s7, L1
nop

L12:
addi $s6, $s6, 1
j L11
nop

L8:
lw $s3, 0+printboard_FRAMESIZE($sp)
lw $s2, -12($s3)
li $s3, 4
mul $s3, $s6, $s3
add $s3, $s2, $s3
lw $s3, 0($s3)
beq $s3, $s4, L5
nop

L6:
la $s3, L4
move $s3, $s3

L7:
move $a0, $s3
jal printStr
nop
bge $s4, $s5, L2
nop

L9:
addi $s4, $s4, 1
j L8
nop

L5:
la $s3, L3
move $s3, $s3
j L7
nop

L36:
nop

addi $sp,$sp,44
jr $ra




