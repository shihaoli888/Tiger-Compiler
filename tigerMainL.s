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
li $t0, 8
sw $t0, -4+tigerMain_FRAMESIZE($sp)
addi $s0, $fp, -8
lw $t0, -4+tigerMain_FRAMESIZE($sp)
move $a0, $t0
move $a1, $zero
jal initArray
nop
move $t0, $v0
sw $t0, 0($s0)
addi $s0, $fp, -12
lw $t0, -4+tigerMain_FRAMESIZE($sp)
move $a0, $t0
move $a1, $zero
jal initArray
nop
move $t0, $v0
sw $t0, 0($s0)
addi $s0, $fp, -16
lw $t1, -4+tigerMain_FRAMESIZE($sp)
lw $t0, -4+tigerMain_FRAMESIZE($sp)
add $t0, $t1, $t0
addi $t0, $t0, -1
move $a0, $t0
move $a1, $zero
jal initArray
nop
move $t0, $v0
sw $t0, 0($s0)
addi $s0, $fp, -20
lw $t1, -4+tigerMain_FRAMESIZE($sp)
lw $t0, -4+tigerMain_FRAMESIZE($sp)
add $t0, $t1, $t0
addi $t0, $t0, -1
move $a0, $t0
move $a1, $zero
jal initArray
nop
move $t0, $v0
sw $t0, 0($s0)
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
move $s2, $a1
lw $t0, 0+try_FRAMESIZE($sp)
lw $t0, -4($t0)
beq $s2, $t0, L29
nop

L30:
li $s1, 0
lw $t0, 0+try_FRAMESIZE($sp)
lw $t0, -4($t0)
addi $s0, $t0, -1
ble $s1, $s0, L27
nop

L14:
li $t0, 0

L31:
move $v0, $t0
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
lw $t0, 0+try_FRAMESIZE($sp)
move $a0, $t0
jal printboard
nop
move $t0, $v0
j L31
nop

L27:
lw $t0, 0+try_FRAMESIZE($sp)
lw $t1, -8($t0)
li $t0, 4
mul $t0, $s1, $t0
add $t0, $t1, $t0
lw $t0, 0($t0)
beq $t0, $zero, L15
nop

L16:
li $t0, 0

L17:
bne $zero, $t0, L20
nop

L21:
li $t0, 0

L22:
bne $zero, $t0, L25
nop

L26:
bge $s1, $s0, L14
nop

L28:
addi $s1, $s1, 1
j L27
nop

L15:
li $t3, 1
lw $t0, 0+try_FRAMESIZE($sp)
lw $t2, -16($t0)
add $t1, $s1, $s2
li $t0, 4
mul $t0, $t1, $t0
add $t0, $t2, $t0
lw $t0, 0($t0)
beq $t0, $zero, L18
nop

L19:
li $t3, 0

L18:
move $t0, $t3
j L17
nop

L20:
li $t3, 1
lw $t0, 0+try_FRAMESIZE($sp)
lw $t2, -20($t0)
addi $t0, $s1, 7
sub $t1, $t0, $s2
li $t0, 4
mul $t0, $t1, $t0
add $t0, $t2, $t0
lw $t0, 0($t0)
beq $t0, $zero, L23
nop

L24:
li $t3, 0

L23:
move $t0, $t3
j L22
nop

L25:
li $t2, 1
lw $t0, 0+try_FRAMESIZE($sp)
lw $t1, -8($t0)
li $t0, 4
mul $t0, $s1, $t0
add $t0, $t1, $t0
sw $t2, 0($t0)
li $t3, 1
lw $t0, 0+try_FRAMESIZE($sp)
lw $t2, -16($t0)
add $t1, $s1, $s2
li $t0, 4
mul $t0, $t1, $t0
add $t0, $t2, $t0
sw $t3, 0($t0)
li $t3, 1
lw $t0, 0+try_FRAMESIZE($sp)
lw $t2, -20($t0)
addi $t0, $s1, 7
sub $t1, $t0, $s2
li $t0, 4
mul $t0, $t1, $t0
add $t0, $t2, $t0
sw $t3, 0($t0)
lw $t0, 0+try_FRAMESIZE($sp)
lw $t1, -12($t0)
li $t0, 4
mul $t0, $s2, $t0
add $t0, $t1, $t0
sw $s1, 0($t0)
lw $t0, 0+try_FRAMESIZE($sp)
addi $t1, $s2, 1
move $a0, $t0
move $a1, $t1
jal try
nop
lw $t0, 0+try_FRAMESIZE($sp)
lw $t1, -8($t0)
li $t0, 4
mul $t0, $s1, $t0
add $t0, $t1, $t0
sw $zero, 0($t0)
lw $t0, 0+try_FRAMESIZE($sp)
lw $t2, -16($t0)
add $t1, $s1, $s2
li $t0, 4
mul $t0, $t1, $t0
add $t0, $t2, $t0
sw $zero, 0($t0)
lw $t0, 0+try_FRAMESIZE($sp)
lw $t2, -20($t0)
addi $t0, $s1, 7
sub $t1, $t0, $s2
li $t0, 4
mul $t0, $t1, $t0
add $t0, $t2, $t0
sw $zero, 0($t0)
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
li $s3, 0
lw $t0, 0+printboard_FRAMESIZE($sp)
lw $t0, -4($t0)
addi $s2, $t0, -1
ble $s3, $s2, L11
nop

L1:
la $t0, L13
move $a0, $t0
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
li $s1, 0
lw $t0, 0+printboard_FRAMESIZE($sp)
lw $t0, -4($t0)
addi $s0, $t0, -1
ble $s1, $s0, L8
nop

L2:
la $t0, L10
move $a0, $t0
jal printStr
nop
bge $s3, $s2, L1
nop

L12:
addi $s3, $s3, 1
j L11
nop

L8:
lw $t0, 0+printboard_FRAMESIZE($sp)
lw $t1, -12($t0)
li $t0, 4
mul $t0, $s3, $t0
add $t0, $t1, $t0
lw $t0, 0($t0)
beq $t0, $s1, L5
nop

L6:
la $t0, L4
move $t0, $t0

L7:
move $a0, $t0
jal printStr
nop
bge $s1, $s0, L2
nop

L9:
addi $s1, $s1, 1
j L8
nop

L5:
la $t0, L3
move $t0, $t0
j L7
nop

L36:
nop

addi $sp,$sp,44
jr $ra




