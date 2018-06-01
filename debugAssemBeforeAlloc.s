
L2:
sw $ra, -4+tigerMain_FRAMESIZE($sp)
sw $s1, -8+tigerMain_FRAMESIZE($sp)
sw $s0, -12+tigerMain_FRAMESIZE($sp)
li r100, 0
li r102, 1
li r103, 2
li r104, 3
add r115, r102, r103
add r114, r115, r104
move r100, r114
move $a0, r100
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
li r100, 0
li r102, 1
li r103, 2
li r104, 3
sw r104, -16+tigerMain_FRAMESIZE($sp)
add r115, r102, r103
lw r104, -16+tigerMain_FRAMESIZE($sp)
add r114, r115, r104
move r100, r114
move $a0, r100
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

