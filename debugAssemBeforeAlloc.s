
L8:
move r107, $ra
move r117, $s7
move r118, $s6
move r119, $s5
move r120, $s4
move r121, $s3
move r122, $s2
move r123, $s1
move r124, $s0
sw $a0, 0+nfactor_FRAMESIZE($sp)
move r100, $a1
beq r100, $zero, L1
nop

L2:
move r150, r100
lw r151, 0+nfactor_FRAMESIZE($sp)
addi r152, r100, -1
move $a0, r151
move $a1, r152
jal nfactor
nop
move r149, $v0
mul r153, r150, r149
move r102, r153

L3:
move $v0, r102
move $s7, r117
move $s6, r118
move $s5, r119
move $s4, r120
move $s3, r121
move $s2, r122
move $s1, r123
move $s0, r124
move $ra, r107
j L7
nop

L1:
li r102, 1
j L3
nop

L7:
nop


--------

L8:
move r107, $ra
sw r107, -8+nfactor_FRAMESIZE($sp)
move r117, $s7
move r118, $s6
sw r118, -4+nfactor_FRAMESIZE($sp)
move r119, $s5
move r120, $s4
move r121, $s3
move r122, $s2
move r123, $s1
move r124, $s0
sw $a0, 0+nfactor_FRAMESIZE($sp)
move r100, $a1
beq r100, $zero, L1
nop

L2:
move r150, r100
lw r151, 0+nfactor_FRAMESIZE($sp)
addi r152, r100, -1
move $a0, r151
move $a1, r152
jal nfactor
nop
move r149, $v0
mul r153, r150, r149
move r102, r153

L3:
move $v0, r102
move $s7, r117
lw r154, -4+nfactor_FRAMESIZE($sp)
move $s6, r154
move $s5, r119
move $s4, r120
move $s3, r121
move $s2, r122
move $s1, r123
move $s0, r124
lw r155, -8+nfactor_FRAMESIZE($sp)
move $ra, r155
j L7
nop

L1:
li r102, 1
j L3
nop

L7:
nop


--------
