
L3:
sw $ra, -4+tigerMain_FRAMESIZE($sp)
sw $s7, -8+tigerMain_FRAMESIZE($sp)
sw $s6, -12+tigerMain_FRAMESIZE($sp)
sw $s5, -16+tigerMain_FRAMESIZE($sp)
sw $s4, -20+tigerMain_FRAMESIZE($sp)
sw $s3, -24+tigerMain_FRAMESIZE($sp)
sw $s2, -28+tigerMain_FRAMESIZE($sp)
sw $s1, -32+tigerMain_FRAMESIZE($sp)
sw $s0, -36+tigerMain_FRAMESIZE($sp)
li r100, 1
li r102, 2
add r118, r100, r102
move $a0, r118
jal printInt
nop
la r129, L1
move $a0, r129
jal printStr
nop
move $v0, $v0
lw $s7, -8+tigerMain_FRAMESIZE($sp)
lw $s6, -12+tigerMain_FRAMESIZE($sp)
lw $s5, -16+tigerMain_FRAMESIZE($sp)
lw $s4, -20+tigerMain_FRAMESIZE($sp)
lw $s3, -24+tigerMain_FRAMESIZE($sp)
lw $s2, -28+tigerMain_FRAMESIZE($sp)
lw $s1, -32+tigerMain_FRAMESIZE($sp)
lw $s0, -36+tigerMain_FRAMESIZE($sp)
lw $ra, -4+tigerMain_FRAMESIZE($sp)
j L2
nop

L2:
nop


--------
