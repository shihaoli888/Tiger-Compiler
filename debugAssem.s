
L2:
sw $ra, -4+tigerMain_FRAMESIZE($sp)
sw $s1, -8+tigerMain_FRAMESIZE($sp)
sw $s0, -12+tigerMain_FRAMESIZE($sp)
li $s1, 0
li $s0, 1
li $s1, 2
li r104, 3
sw r104, -16+tigerMain_FRAMESIZE($sp)
add $s1, $s0, $s1
lw r104, -16+tigerMain_FRAMESIZE($sp)
add $s1, $s1, r104
move $s1, $s1
move $a0, $s1
jal printInt
nop
li $v0, 0
lw $s1, -8+tigerMain_FRAMESIZE($sp)
lw $s0, -12+tigerMain_FRAMESIZE($sp)
lw $ra, -4+tigerMain_FRAMESIZE($sp)
j L1
nop

L1:
nop


L2:
sw $ra, -4+tigerMain_FRAMESIZE($sp)
sw $s1, -8+tigerMain_FRAMESIZE($sp)
sw $s0, -12+tigerMain_FRAMESIZE($sp)
li $s1, 0
li $s0, 1
li $s1, 2
li r104, 3
sw r104, -20+tigerMain_FRAMESIZE($sp)
lw r104, -20+tigerMain_FRAMESIZE($sp)
sw r104, -16+tigerMain_FRAMESIZE($sp)
add $s1, $s0, $s1
lw r104, -16+tigerMain_FRAMESIZE($sp)
sw r104, -20+tigerMain_FRAMESIZE($sp)
lw r104, -20+tigerMain_FRAMESIZE($sp)
add $s1, $s1, r104
move $s1, $s1
move $a0, $s1
jal printInt
nop
li $v0, 0
lw $s1, -8+tigerMain_FRAMESIZE($sp)
lw $s0, -12+tigerMain_FRAMESIZE($sp)
lw $ra, -4+tigerMain_FRAMESIZE($sp)
j L1
nop

L1:
nop

