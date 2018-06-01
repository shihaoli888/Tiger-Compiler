
L2:
sw $ra, -4+tigerMain_FRAMESIZE($sp)
sw $s7, -8+tigerMain_FRAMESIZE($sp)
sw $s6, -12+tigerMain_FRAMESIZE($sp)
sw $s5, -16+tigerMain_FRAMESIZE($sp)
sw $s4, -20+tigerMain_FRAMESIZE($sp)
sw $s3, -24+tigerMain_FRAMESIZE($sp)
sw $s2, -28+tigerMain_FRAMESIZE($sp)
sw $s1, -32+tigerMain_FRAMESIZE($sp)
sw $s0, -36+tigerMain_FRAMESIZE($sp)
li r100, 0
li r102, 1
li r103, 2
li r104, 3
li r105, 4
li r106, 5
li r107, 6
li r108, 7
li r109, 8
li r110, 9
li r111, 10
li r112, 11
li r113, 12
li r114, 13
li r115, 14
li r116, 15
li r117, 16
li r118, 17
li r119, 18
li r120, 19
add r153, r102, r103
add r152, r153, r104
add r151, r152, r105
add r150, r151, r106
add r149, r150, r107
add r148, r149, r108
add r147, r148, r109
add r146, r147, r110
add r145, r146, r111
add r144, r145, r112
add r143, r144, r113
add r142, r143, r114
add r141, r142, r115
add r140, r141, r116
add r139, r140, r117
add r138, r139, r118
add r137, r138, r119
add r136, r137, r120
move r100, r136
move $a0, r100
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
j L1
nop

L1:
nop


L2:
sw $ra, -4+tigerMain_FRAMESIZE($sp)
sw $s7, -8+tigerMain_FRAMESIZE($sp)
sw $s6, -12+tigerMain_FRAMESIZE($sp)
sw $s5, -16+tigerMain_FRAMESIZE($sp)
sw $s4, -20+tigerMain_FRAMESIZE($sp)
sw $s3, -24+tigerMain_FRAMESIZE($sp)
sw $s2, -28+tigerMain_FRAMESIZE($sp)
sw $s1, -32+tigerMain_FRAMESIZE($sp)
sw $s0, -36+tigerMain_FRAMESIZE($sp)
li r100, 0
li r102, 1
li r103, 2
li r104, 3
li r105, 4
li r106, 5
li r107, 6
li r108, 7
li r109, 8
li r110, 9
li r111, 10
li r112, 11
li r113, 12
li r114, 13
li r115, 14
li r116, 15
li r117, 16
li r118, 17
li r119, 18
li r120, 19
sw r120, -40+tigerMain_FRAMESIZE($sp)
add r153, r102, r103
add r152, r153, r104
add r151, r152, r105
add r150, r151, r106
add r149, r150, r107
add r148, r149, r108
add r147, r148, r109
add r146, r147, r110
add r145, r146, r111
add r144, r145, r112
add r143, r144, r113
add r142, r143, r114
add r141, r142, r115
add r140, r141, r116
add r139, r140, r117
add r138, r139, r118
add r137, r138, r119
lw r120, -40+tigerMain_FRAMESIZE($sp)
add r136, r137, r120
move r100, r136
move $a0, r100
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
j L1
nop

L1:
nop


L2:
sw $ra, -4+tigerMain_FRAMESIZE($sp)
sw $s7, -8+tigerMain_FRAMESIZE($sp)
sw $s6, -12+tigerMain_FRAMESIZE($sp)
sw $s5, -16+tigerMain_FRAMESIZE($sp)
sw $s4, -20+tigerMain_FRAMESIZE($sp)
sw $s3, -24+tigerMain_FRAMESIZE($sp)
sw $s2, -28+tigerMain_FRAMESIZE($sp)
sw $s1, -32+tigerMain_FRAMESIZE($sp)
sw $s0, -36+tigerMain_FRAMESIZE($sp)
li r100, 0
li r102, 1
li r103, 2
li r104, 3
li r105, 4
li r106, 5
li r107, 6
li r108, 7
li r109, 8
li r110, 9
li r111, 10
li r112, 11
li r113, 12
li r114, 13
li r115, 14
li r116, 15
li r117, 16
li r118, 17
li r119, 18
li r120, 19
sw r120, -44+tigerMain_FRAMESIZE($sp)
lw r120, -44+tigerMain_FRAMESIZE($sp)
sw r120, -40+tigerMain_FRAMESIZE($sp)
add r153, r102, r103
add r152, r153, r104
add r151, r152, r105
add r150, r151, r106
add r149, r150, r107
add r148, r149, r108
add r147, r148, r109
add r146, r147, r110
add r145, r146, r111
add r144, r145, r112
add r143, r144, r113
add r142, r143, r114
add r141, r142, r115
add r140, r141, r116
add r139, r140, r117
add r138, r139, r118
add r137, r138, r119
lw r120, -40+tigerMain_FRAMESIZE($sp)
sw r120, -44+tigerMain_FRAMESIZE($sp)
lw r120, -44+tigerMain_FRAMESIZE($sp)
add r136, r137, r120
move r100, r136
move $a0, r100
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
j L1
nop

L1:
nop

