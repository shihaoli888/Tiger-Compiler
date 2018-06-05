
L13:
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
move r102, $a1
beq r102, $zero, L1
nop

L2:
li r178, 4
mul r177, $zero, r178
add r176, r102, r177
lw r175, 0(r176)
lw r179, 0+treeLeaves_FRAMESIZE($sp)
li r183, 1
li r184, 4
mul r182, r183, r184
add r181, r102, r182
lw r180, 0(r181)
move $a0, r179
move $a1, r180
jal treelistLeaves
nop
move r174, $v0
add r185, r175, r174
move r104, r185

L3:
move $v0, r104
lw $s7, -8+treeLeaves_FRAMESIZE($sp)
lw $s6, -12+treeLeaves_FRAMESIZE($sp)
lw $s5, -16+treeLeaves_FRAMESIZE($sp)
lw $s4, -20+treeLeaves_FRAMESIZE($sp)
lw $s3, -24+treeLeaves_FRAMESIZE($sp)
lw $s2, -28+treeLeaves_FRAMESIZE($sp)
lw $s1, -32+treeLeaves_FRAMESIZE($sp)
lw $s0, -36+treeLeaves_FRAMESIZE($sp)
lw $ra, -4+treeLeaves_FRAMESIZE($sp)
j L12
nop

L1:
li r104, 0
j L3
nop

L12:
nop


--------
