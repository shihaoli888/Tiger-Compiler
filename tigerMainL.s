.data
.text
.align 2
.globl tigerMain
tigerMain:
tigerMain_FRAMESIZE = 44
addi $sp,$sp,-44

L10:
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
li $t0, 8
move $a0, $t0
jal allocRecord
nop
move $t1, $v0
li $t0, 1
sw $t0, 0($t1)
sw $zero, 4($t1)
move $s1, $t1
li $t0, 8
move $a0, $t0
jal allocRecord
nop
move $t1, $v0
li $t0, 1
sw $t0, 0($t1)
sw $zero, 4($t1)
move $s0, $t1
li $t0, 8
move $a0, $t0
jal allocRecord
nop
move $t1, $v0
li $t0, 2
sw $t0, 0($t1)
sw $zero, 4($t1)
move $s3, $t1
li $t0, 8
move $a0, $t0
jal allocRecord
nop
move $t1, $v0
li $t0, 3
sw $t0, 0($t1)
sw $zero, 4($t1)
move $s2, $t1
li $t0, 8
move $a0, $t0
jal allocRecord
nop
move $t0, $v0
sw $s2, 0($t0)
sw $zero, 4($t0)
move $s2, $t0
li $t0, 8
move $a0, $t0
jal allocRecord
nop
move $t0, $v0
sw $s3, 0($t0)
sw $s2, 4($t0)
move $s2, $t0
li $t0, 8
move $a0, $t0
jal allocRecord
nop
move $t0, $v0
sw $s0, 0($t0)
sw $s2, 4($t0)
move $t2, $t0
li $t0, 1
li $t0, 4
li $t1, 1
mul $t0, $t1, $t0
add $t0, $s1, $t0
lw $t0, 0($t0)
beq $t0, $t2, L7
nop

L8:
li $t0, 0

L7:
addi $a0, $sp, tigerMain_FRAMESIZE
move $a1, $s1
jal treeLeaves
nop
move $t0, $v0
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
j L9
nop

L9:
nop

addi $sp,$sp,44
jr $ra




.text
.align 2
.globl treelistLeaves
treelistLeaves:
treelistLeaves_FRAMESIZE = 44
addi $sp,$sp,-44

L12:
sw $ra, -4+treelistLeaves_FRAMESIZE($sp)
sw $s7, -8+treelistLeaves_FRAMESIZE($sp)
sw $s6, -12+treelistLeaves_FRAMESIZE($sp)
sw $s5, -16+treelistLeaves_FRAMESIZE($sp)
sw $s4, -20+treelistLeaves_FRAMESIZE($sp)
sw $s3, -24+treelistLeaves_FRAMESIZE($sp)
sw $s2, -28+treelistLeaves_FRAMESIZE($sp)
sw $s1, -32+treelistLeaves_FRAMESIZE($sp)
sw $s0, -36+treelistLeaves_FRAMESIZE($sp)
sw $a0, 0+treelistLeaves_FRAMESIZE($sp)
move $s0, $a1
beq $s0, $zero, L4
nop

L5:
lw $t1, 0+treelistLeaves_FRAMESIZE($sp)
li $t0, 4
mul $t0, $zero, $t0
add $t0, $s0, $t0
lw $t0, 0($t0)
move $a0, $t1
move $a1, $t0
jal treeLeaves
nop
move $t0, $v0
move $s1, $t0
lw $t2, 0+treelistLeaves_FRAMESIZE($sp)
li $t0, 4
li $t1, 1
mul $t0, $t1, $t0
add $t0, $s0, $t0
lw $t0, 0($t0)
move $a0, $t2
move $a1, $t0
jal treelistLeaves
nop
move $t0, $v0
add $t0, $s1, $t0
move $t0, $t0

L6:
move $v0, $t0
lw $s7, -8+treelistLeaves_FRAMESIZE($sp)
lw $s6, -12+treelistLeaves_FRAMESIZE($sp)
lw $s5, -16+treelistLeaves_FRAMESIZE($sp)
lw $s4, -20+treelistLeaves_FRAMESIZE($sp)
lw $s3, -24+treelistLeaves_FRAMESIZE($sp)
lw $s2, -28+treelistLeaves_FRAMESIZE($sp)
lw $s1, -32+treelistLeaves_FRAMESIZE($sp)
lw $s0, -36+treelistLeaves_FRAMESIZE($sp)
lw $ra, -4+treelistLeaves_FRAMESIZE($sp)
j L11
nop

L4:
li $t0, 0
j L6
nop

L11:
nop

addi $sp,$sp,44
jr $ra




.text
.align 2
.globl treeLeaves
treeLeaves:
treeLeaves_FRAMESIZE = 44
addi $sp,$sp,-44

L14:
sw $ra, -4+treeLeaves_FRAMESIZE($sp)
sw $s7, -8+treeLeaves_FRAMESIZE($sp)
sw $s6, -12+treeLeaves_FRAMESIZE($sp)
sw $s5, -16+treeLeaves_FRAMESIZE($sp)
sw $s4, -20+treeLeaves_FRAMESIZE($sp)
sw $s3, -24+treeLeaves_FRAMESIZE($sp)
sw $s2, -28+treeLeaves_FRAMESIZE($sp)
sw $s1, -32+treeLeaves_FRAMESIZE($sp)
sw $s0, -36+treeLeaves_FRAMESIZE($sp)
sw $a0, 0+treeLeaves_FRAMESIZE($sp)
move $t2, $a1
beq $t2, $zero, L1
nop

L2:
li $t0, 4
mul $t0, $zero, $t0
add $t0, $t2, $t0
lw $s0, 0($t0)
lw $t3, 0+treeLeaves_FRAMESIZE($sp)
li $t0, 4
li $t1, 1
mul $t0, $t1, $t0
add $t0, $t2, $t0
lw $t0, 0($t0)
move $a0, $t3
move $a1, $t0
jal treelistLeaves
nop
move $t0, $v0
add $t0, $s0, $t0
move $t0, $t0

L3:
move $v0, $t0
lw $s7, -8+treeLeaves_FRAMESIZE($sp)
lw $s6, -12+treeLeaves_FRAMESIZE($sp)
lw $s5, -16+treeLeaves_FRAMESIZE($sp)
lw $s4, -20+treeLeaves_FRAMESIZE($sp)
lw $s3, -24+treeLeaves_FRAMESIZE($sp)
lw $s2, -28+treeLeaves_FRAMESIZE($sp)
lw $s1, -32+treeLeaves_FRAMESIZE($sp)
lw $s0, -36+treeLeaves_FRAMESIZE($sp)
lw $ra, -4+treeLeaves_FRAMESIZE($sp)
j L13
nop

L1:
li $t0, 0
j L3
nop

L13:
nop

addi $sp,$sp,44
jr $ra




