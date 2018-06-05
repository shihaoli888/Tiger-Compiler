
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
li r121, 20
li r122, 21
li r123, 22
li r124, 23
li r125, 24
li r126, 25
li r127, 26
li r128, 27
li r129, 28
li r130, 29
li r131, 30
li r132, 31
li r133, 32
li r134, 33
li r135, 34
li r136, 35
li r137, 36
li r138, 37
li r139, 38
li r140, 39
li r141, 40
li r142, 41
li r143, 42
li r144, 43
li r145, 44
li r146, 45
li r147, 46
li r148, 47
li r149, 48
li r150, 49
li r151, 50
li r152, 51
li r153, 52
li r154, 53
li r155, 54
li r156, 55
li r157, 56
li r158, 57
li r159, 58
li r160, 59
li r161, 60
li r162, 61
li r163, 62
li r164, 63
li r165, 64
li r166, 65
li r167, 66
li r168, 67
li r169, 68
li r170, 69
li r171, 70
li r172, 71
li r173, 72
li r174, 73
li r175, 74
li r176, 75
li r177, 76
li r178, 77
li r179, 78
li r180, 79
li r181, 80
li r182, 81
li r183, 82
li r184, 83
li r185, 84
li r186, 85
li r187, 86
li r188, 87
li r189, 88
li r190, 89
li r191, 90
li r192, 91
li r193, 92
li r194, 93
li r195, 94
li r196, 95
li r197, 96
li r198, 97
li r199, 98
li r200, 99
li r201, 100
add r315, r102, r103
add r314, r315, r104
add r313, r314, r105
add r312, r313, r106
add r311, r312, r107
add r310, r311, r108
add r309, r310, r109
add r308, r309, r110
add r307, r308, r111
add r306, r307, r112
add r305, r306, r113
add r304, r305, r114
add r303, r304, r115
add r302, r303, r116
add r301, r302, r117
add r300, r301, r118
add r299, r300, r119
add r298, r299, r120
add r297, r298, r121
add r296, r297, r122
add r295, r296, r123
add r294, r295, r124
add r293, r294, r125
add r292, r293, r126
add r291, r292, r127
add r290, r291, r128
add r289, r290, r129
add r288, r289, r130
add r287, r288, r131
add r286, r287, r132
add r285, r286, r133
add r284, r285, r134
add r283, r284, r135
add r282, r283, r136
add r281, r282, r137
add r280, r281, r138
add r279, r280, r139
add r278, r279, r140
add r277, r278, r141
add r276, r277, r142
add r275, r276, r143
add r274, r275, r144
add r273, r274, r145
add r272, r273, r146
add r271, r272, r147
add r270, r271, r148
add r269, r270, r149
add r268, r269, r150
add r267, r268, r151
add r266, r267, r152
add r265, r266, r153
add r264, r265, r154
add r263, r264, r155
add r262, r263, r156
add r261, r262, r157
add r260, r261, r158
add r259, r260, r159
add r258, r259, r160
add r257, r258, r161
add r256, r257, r162
add r255, r256, r163
add r254, r255, r164
add r253, r254, r165
add r252, r253, r166
add r251, r252, r167
add r250, r251, r168
add r249, r250, r169
add r248, r249, r170
add r247, r248, r171
add r246, r247, r172
add r245, r246, r173
add r244, r245, r174
add r243, r244, r175
add r242, r243, r176
add r241, r242, r177
add r240, r241, r178
add r239, r240, r179
add r238, r239, r180
add r237, r238, r181
add r236, r237, r182
add r235, r236, r183
add r234, r235, r184
add r233, r234, r185
add r232, r233, r186
add r231, r232, r187
add r230, r231, r188
add r229, r230, r189
add r228, r229, r190
add r227, r228, r191
add r226, r227, r192
add r225, r226, r193
add r224, r225, r194
add r223, r224, r195
add r222, r223, r196
add r221, r222, r197
add r220, r221, r198
add r219, r220, r199
add r218, r219, r200
add r217, r218, r201
move r100, r217
move $a0, r100
jal printInt
nop
la r326, L1
move $a0, r326
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
li r121, 20
sw r121, -44+tigerMain_FRAMESIZE($sp)
li r122, 21
sw r122, -48+tigerMain_FRAMESIZE($sp)
li r123, 22
sw r123, -52+tigerMain_FRAMESIZE($sp)
li r124, 23
sw r124, -56+tigerMain_FRAMESIZE($sp)
li r125, 24
sw r125, -60+tigerMain_FRAMESIZE($sp)
li r126, 25
sw r126, -64+tigerMain_FRAMESIZE($sp)
li r127, 26
sw r127, -68+tigerMain_FRAMESIZE($sp)
li r128, 27
sw r128, -72+tigerMain_FRAMESIZE($sp)
li r129, 28
sw r129, -76+tigerMain_FRAMESIZE($sp)
li r130, 29
sw r130, -80+tigerMain_FRAMESIZE($sp)
li r131, 30
sw r131, -84+tigerMain_FRAMESIZE($sp)
li r132, 31
sw r132, -88+tigerMain_FRAMESIZE($sp)
li r133, 32
sw r133, -92+tigerMain_FRAMESIZE($sp)
li r134, 33
sw r134, -96+tigerMain_FRAMESIZE($sp)
li r135, 34
sw r135, -100+tigerMain_FRAMESIZE($sp)
li r136, 35
sw r136, -104+tigerMain_FRAMESIZE($sp)
li r137, 36
sw r137, -108+tigerMain_FRAMESIZE($sp)
li r138, 37
sw r138, -112+tigerMain_FRAMESIZE($sp)
li r139, 38
sw r139, -116+tigerMain_FRAMESIZE($sp)
li r140, 39
sw r140, -120+tigerMain_FRAMESIZE($sp)
li r141, 40
sw r141, -124+tigerMain_FRAMESIZE($sp)
li r142, 41
sw r142, -128+tigerMain_FRAMESIZE($sp)
li r143, 42
sw r143, -132+tigerMain_FRAMESIZE($sp)
li r144, 43
sw r144, -136+tigerMain_FRAMESIZE($sp)
li r145, 44
sw r145, -140+tigerMain_FRAMESIZE($sp)
li r146, 45
sw r146, -144+tigerMain_FRAMESIZE($sp)
li r147, 46
sw r147, -148+tigerMain_FRAMESIZE($sp)
li r148, 47
sw r148, -152+tigerMain_FRAMESIZE($sp)
li r149, 48
sw r149, -156+tigerMain_FRAMESIZE($sp)
li r150, 49
sw r150, -160+tigerMain_FRAMESIZE($sp)
li r151, 50
sw r151, -164+tigerMain_FRAMESIZE($sp)
li r152, 51
sw r152, -168+tigerMain_FRAMESIZE($sp)
li r153, 52
sw r153, -172+tigerMain_FRAMESIZE($sp)
li r154, 53
sw r154, -176+tigerMain_FRAMESIZE($sp)
li r155, 54
sw r155, -180+tigerMain_FRAMESIZE($sp)
li r156, 55
sw r156, -184+tigerMain_FRAMESIZE($sp)
li r157, 56
sw r157, -188+tigerMain_FRAMESIZE($sp)
li r158, 57
sw r158, -192+tigerMain_FRAMESIZE($sp)
li r159, 58
sw r159, -196+tigerMain_FRAMESIZE($sp)
li r160, 59
sw r160, -200+tigerMain_FRAMESIZE($sp)
li r161, 60
sw r161, -204+tigerMain_FRAMESIZE($sp)
li r162, 61
sw r162, -208+tigerMain_FRAMESIZE($sp)
li r163, 62
sw r163, -212+tigerMain_FRAMESIZE($sp)
li r164, 63
sw r164, -216+tigerMain_FRAMESIZE($sp)
li r165, 64
sw r165, -220+tigerMain_FRAMESIZE($sp)
li r166, 65
sw r166, -224+tigerMain_FRAMESIZE($sp)
li r167, 66
sw r167, -228+tigerMain_FRAMESIZE($sp)
li r168, 67
sw r168, -232+tigerMain_FRAMESIZE($sp)
li r169, 68
sw r169, -236+tigerMain_FRAMESIZE($sp)
li r170, 69
sw r170, -240+tigerMain_FRAMESIZE($sp)
li r171, 70
sw r171, -244+tigerMain_FRAMESIZE($sp)
li r172, 71
sw r172, -248+tigerMain_FRAMESIZE($sp)
li r173, 72
sw r173, -252+tigerMain_FRAMESIZE($sp)
li r174, 73
sw r174, -256+tigerMain_FRAMESIZE($sp)
li r175, 74
sw r175, -260+tigerMain_FRAMESIZE($sp)
li r176, 75
sw r176, -264+tigerMain_FRAMESIZE($sp)
li r177, 76
sw r177, -268+tigerMain_FRAMESIZE($sp)
li r178, 77
sw r178, -272+tigerMain_FRAMESIZE($sp)
li r179, 78
sw r179, -276+tigerMain_FRAMESIZE($sp)
li r180, 79
sw r180, -280+tigerMain_FRAMESIZE($sp)
li r181, 80
sw r181, -284+tigerMain_FRAMESIZE($sp)
li r182, 81
sw r182, -288+tigerMain_FRAMESIZE($sp)
li r183, 82
sw r183, -292+tigerMain_FRAMESIZE($sp)
li r184, 83
sw r184, -296+tigerMain_FRAMESIZE($sp)
li r185, 84
sw r185, -300+tigerMain_FRAMESIZE($sp)
li r186, 85
sw r186, -304+tigerMain_FRAMESIZE($sp)
li r187, 86
sw r187, -308+tigerMain_FRAMESIZE($sp)
li r188, 87
sw r188, -312+tigerMain_FRAMESIZE($sp)
li r189, 88
sw r189, -316+tigerMain_FRAMESIZE($sp)
li r190, 89
sw r190, -320+tigerMain_FRAMESIZE($sp)
li r191, 90
sw r191, -324+tigerMain_FRAMESIZE($sp)
li r192, 91
sw r192, -328+tigerMain_FRAMESIZE($sp)
li r193, 92
sw r193, -332+tigerMain_FRAMESIZE($sp)
li r194, 93
sw r194, -336+tigerMain_FRAMESIZE($sp)
li r195, 94
sw r195, -340+tigerMain_FRAMESIZE($sp)
li r196, 95
sw r196, -344+tigerMain_FRAMESIZE($sp)
li r197, 96
sw r197, -348+tigerMain_FRAMESIZE($sp)
li r198, 97
sw r198, -352+tigerMain_FRAMESIZE($sp)
li r199, 98
sw r199, -356+tigerMain_FRAMESIZE($sp)
li r200, 99
sw r200, -360+tigerMain_FRAMESIZE($sp)
li r201, 100
sw r201, -364+tigerMain_FRAMESIZE($sp)
add r315, r102, r103
add r314, r315, r104
add r313, r314, r105
add r312, r313, r106
add r311, r312, r107
add r310, r311, r108
add r309, r310, r109
add r308, r309, r110
add r307, r308, r111
add r306, r307, r112
add r305, r306, r113
add r304, r305, r114
add r303, r304, r115
add r302, r303, r116
add r301, r302, r117
add r300, r301, r118
add r299, r300, r119
lw r328, -40+tigerMain_FRAMESIZE($sp)
add r298, r299, r328
lw r329, -44+tigerMain_FRAMESIZE($sp)
add r297, r298, r329
lw r330, -48+tigerMain_FRAMESIZE($sp)
add r296, r297, r330
lw r331, -52+tigerMain_FRAMESIZE($sp)
add r295, r296, r331
lw r332, -56+tigerMain_FRAMESIZE($sp)
add r294, r295, r332
lw r333, -60+tigerMain_FRAMESIZE($sp)
add r293, r294, r333
lw r334, -64+tigerMain_FRAMESIZE($sp)
add r292, r293, r334
lw r335, -68+tigerMain_FRAMESIZE($sp)
add r291, r292, r335
lw r336, -72+tigerMain_FRAMESIZE($sp)
add r290, r291, r336
lw r337, -76+tigerMain_FRAMESIZE($sp)
add r289, r290, r337
lw r338, -80+tigerMain_FRAMESIZE($sp)
add r288, r289, r338
lw r339, -84+tigerMain_FRAMESIZE($sp)
add r287, r288, r339
lw r340, -88+tigerMain_FRAMESIZE($sp)
add r286, r287, r340
lw r341, -92+tigerMain_FRAMESIZE($sp)
add r285, r286, r341
lw r342, -96+tigerMain_FRAMESIZE($sp)
add r284, r285, r342
lw r343, -100+tigerMain_FRAMESIZE($sp)
add r283, r284, r343
lw r344, -104+tigerMain_FRAMESIZE($sp)
add r282, r283, r344
lw r345, -108+tigerMain_FRAMESIZE($sp)
add r281, r282, r345
lw r346, -112+tigerMain_FRAMESIZE($sp)
add r280, r281, r346
lw r347, -116+tigerMain_FRAMESIZE($sp)
add r279, r280, r347
lw r348, -120+tigerMain_FRAMESIZE($sp)
add r278, r279, r348
lw r349, -124+tigerMain_FRAMESIZE($sp)
add r277, r278, r349
lw r350, -128+tigerMain_FRAMESIZE($sp)
add r276, r277, r350
lw r351, -132+tigerMain_FRAMESIZE($sp)
add r275, r276, r351
lw r352, -136+tigerMain_FRAMESIZE($sp)
add r274, r275, r352
lw r353, -140+tigerMain_FRAMESIZE($sp)
add r273, r274, r353
lw r354, -144+tigerMain_FRAMESIZE($sp)
add r272, r273, r354
lw r355, -148+tigerMain_FRAMESIZE($sp)
add r271, r272, r355
lw r356, -152+tigerMain_FRAMESIZE($sp)
add r270, r271, r356
lw r357, -156+tigerMain_FRAMESIZE($sp)
add r269, r270, r357
lw r358, -160+tigerMain_FRAMESIZE($sp)
add r268, r269, r358
lw r359, -164+tigerMain_FRAMESIZE($sp)
add r267, r268, r359
lw r360, -168+tigerMain_FRAMESIZE($sp)
add r266, r267, r360
lw r361, -172+tigerMain_FRAMESIZE($sp)
add r265, r266, r361
lw r362, -176+tigerMain_FRAMESIZE($sp)
add r264, r265, r362
lw r363, -180+tigerMain_FRAMESIZE($sp)
add r263, r264, r363
lw r364, -184+tigerMain_FRAMESIZE($sp)
add r262, r263, r364
lw r365, -188+tigerMain_FRAMESIZE($sp)
add r261, r262, r365
lw r366, -192+tigerMain_FRAMESIZE($sp)
add r260, r261, r366
lw r367, -196+tigerMain_FRAMESIZE($sp)
add r259, r260, r367
lw r368, -200+tigerMain_FRAMESIZE($sp)
add r258, r259, r368
lw r369, -204+tigerMain_FRAMESIZE($sp)
add r257, r258, r369
lw r370, -208+tigerMain_FRAMESIZE($sp)
add r256, r257, r370
lw r371, -212+tigerMain_FRAMESIZE($sp)
add r255, r256, r371
lw r372, -216+tigerMain_FRAMESIZE($sp)
add r254, r255, r372
lw r373, -220+tigerMain_FRAMESIZE($sp)
add r253, r254, r373
lw r374, -224+tigerMain_FRAMESIZE($sp)
add r252, r253, r374
lw r375, -228+tigerMain_FRAMESIZE($sp)
add r251, r252, r375
lw r376, -232+tigerMain_FRAMESIZE($sp)
add r250, r251, r376
lw r377, -236+tigerMain_FRAMESIZE($sp)
add r249, r250, r377
lw r378, -240+tigerMain_FRAMESIZE($sp)
add r248, r249, r378
lw r379, -244+tigerMain_FRAMESIZE($sp)
add r247, r248, r379
lw r380, -248+tigerMain_FRAMESIZE($sp)
add r246, r247, r380
lw r381, -252+tigerMain_FRAMESIZE($sp)
add r245, r246, r381
lw r382, -256+tigerMain_FRAMESIZE($sp)
add r244, r245, r382
lw r383, -260+tigerMain_FRAMESIZE($sp)
add r243, r244, r383
lw r384, -264+tigerMain_FRAMESIZE($sp)
add r242, r243, r384
lw r385, -268+tigerMain_FRAMESIZE($sp)
add r241, r242, r385
lw r386, -272+tigerMain_FRAMESIZE($sp)
add r240, r241, r386
lw r387, -276+tigerMain_FRAMESIZE($sp)
add r239, r240, r387
lw r388, -280+tigerMain_FRAMESIZE($sp)
add r238, r239, r388
lw r389, -284+tigerMain_FRAMESIZE($sp)
add r237, r238, r389
lw r390, -288+tigerMain_FRAMESIZE($sp)
add r236, r237, r390
lw r391, -292+tigerMain_FRAMESIZE($sp)
add r235, r236, r391
lw r392, -296+tigerMain_FRAMESIZE($sp)
add r234, r235, r392
lw r393, -300+tigerMain_FRAMESIZE($sp)
add r233, r234, r393
lw r394, -304+tigerMain_FRAMESIZE($sp)
add r232, r233, r394
lw r395, -308+tigerMain_FRAMESIZE($sp)
add r231, r232, r395
lw r396, -312+tigerMain_FRAMESIZE($sp)
add r230, r231, r396
lw r397, -316+tigerMain_FRAMESIZE($sp)
add r229, r230, r397
lw r398, -320+tigerMain_FRAMESIZE($sp)
add r228, r229, r398
lw r399, -324+tigerMain_FRAMESIZE($sp)
add r227, r228, r399
lw r400, -328+tigerMain_FRAMESIZE($sp)
add r226, r227, r400
lw r401, -332+tigerMain_FRAMESIZE($sp)
add r225, r226, r401
lw r402, -336+tigerMain_FRAMESIZE($sp)
add r224, r225, r402
lw r403, -340+tigerMain_FRAMESIZE($sp)
add r223, r224, r403
lw r404, -344+tigerMain_FRAMESIZE($sp)
add r222, r223, r404
lw r405, -348+tigerMain_FRAMESIZE($sp)
add r221, r222, r405
lw r406, -352+tigerMain_FRAMESIZE($sp)
add r220, r221, r406
lw r407, -356+tigerMain_FRAMESIZE($sp)
add r219, r220, r407
lw r408, -360+tigerMain_FRAMESIZE($sp)
add r218, r219, r408
lw r409, -364+tigerMain_FRAMESIZE($sp)
add r217, r218, r409
move r100, r217
move $a0, r100
jal printInt
nop
la r326, L1
move $a0, r326
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
sw r119, -368+tigerMain_FRAMESIZE($sp)
li r120, 19
sw r120, -40+tigerMain_FRAMESIZE($sp)
li r121, 20
sw r121, -44+tigerMain_FRAMESIZE($sp)
li r122, 21
sw r122, -48+tigerMain_FRAMESIZE($sp)
li r123, 22
sw r123, -52+tigerMain_FRAMESIZE($sp)
li r124, 23
sw r124, -56+tigerMain_FRAMESIZE($sp)
li r125, 24
sw r125, -60+tigerMain_FRAMESIZE($sp)
li r126, 25
sw r126, -64+tigerMain_FRAMESIZE($sp)
li r127, 26
sw r127, -68+tigerMain_FRAMESIZE($sp)
li r128, 27
sw r128, -72+tigerMain_FRAMESIZE($sp)
li r129, 28
sw r129, -76+tigerMain_FRAMESIZE($sp)
li r130, 29
sw r130, -80+tigerMain_FRAMESIZE($sp)
li r131, 30
sw r131, -84+tigerMain_FRAMESIZE($sp)
li r132, 31
sw r132, -88+tigerMain_FRAMESIZE($sp)
li r133, 32
sw r133, -92+tigerMain_FRAMESIZE($sp)
li r134, 33
sw r134, -96+tigerMain_FRAMESIZE($sp)
li r135, 34
sw r135, -100+tigerMain_FRAMESIZE($sp)
li r136, 35
sw r136, -104+tigerMain_FRAMESIZE($sp)
li r137, 36
sw r137, -108+tigerMain_FRAMESIZE($sp)
li r138, 37
sw r138, -112+tigerMain_FRAMESIZE($sp)
li r139, 38
sw r139, -116+tigerMain_FRAMESIZE($sp)
li r140, 39
sw r140, -120+tigerMain_FRAMESIZE($sp)
li r141, 40
sw r141, -124+tigerMain_FRAMESIZE($sp)
li r142, 41
sw r142, -128+tigerMain_FRAMESIZE($sp)
li r143, 42
sw r143, -132+tigerMain_FRAMESIZE($sp)
li r144, 43
sw r144, -136+tigerMain_FRAMESIZE($sp)
li r145, 44
sw r145, -140+tigerMain_FRAMESIZE($sp)
li r146, 45
sw r146, -144+tigerMain_FRAMESIZE($sp)
li r147, 46
sw r147, -148+tigerMain_FRAMESIZE($sp)
li r148, 47
sw r148, -152+tigerMain_FRAMESIZE($sp)
li r149, 48
sw r149, -156+tigerMain_FRAMESIZE($sp)
li r150, 49
sw r150, -160+tigerMain_FRAMESIZE($sp)
li r151, 50
sw r151, -164+tigerMain_FRAMESIZE($sp)
li r152, 51
sw r152, -168+tigerMain_FRAMESIZE($sp)
li r153, 52
sw r153, -172+tigerMain_FRAMESIZE($sp)
li r154, 53
sw r154, -176+tigerMain_FRAMESIZE($sp)
li r155, 54
sw r155, -180+tigerMain_FRAMESIZE($sp)
li r156, 55
sw r156, -184+tigerMain_FRAMESIZE($sp)
li r157, 56
sw r157, -188+tigerMain_FRAMESIZE($sp)
li r158, 57
sw r158, -192+tigerMain_FRAMESIZE($sp)
li r159, 58
sw r159, -196+tigerMain_FRAMESIZE($sp)
li r160, 59
sw r160, -200+tigerMain_FRAMESIZE($sp)
li r161, 60
sw r161, -204+tigerMain_FRAMESIZE($sp)
li r162, 61
sw r162, -208+tigerMain_FRAMESIZE($sp)
li r163, 62
sw r163, -212+tigerMain_FRAMESIZE($sp)
li r164, 63
sw r164, -216+tigerMain_FRAMESIZE($sp)
li r165, 64
sw r165, -220+tigerMain_FRAMESIZE($sp)
li r166, 65
sw r166, -224+tigerMain_FRAMESIZE($sp)
li r167, 66
sw r167, -228+tigerMain_FRAMESIZE($sp)
li r168, 67
sw r168, -232+tigerMain_FRAMESIZE($sp)
li r169, 68
sw r169, -236+tigerMain_FRAMESIZE($sp)
li r170, 69
sw r170, -240+tigerMain_FRAMESIZE($sp)
li r171, 70
sw r171, -244+tigerMain_FRAMESIZE($sp)
li r172, 71
sw r172, -248+tigerMain_FRAMESIZE($sp)
li r173, 72
sw r173, -252+tigerMain_FRAMESIZE($sp)
li r174, 73
sw r174, -256+tigerMain_FRAMESIZE($sp)
li r175, 74
sw r175, -260+tigerMain_FRAMESIZE($sp)
li r176, 75
sw r176, -264+tigerMain_FRAMESIZE($sp)
li r177, 76
sw r177, -268+tigerMain_FRAMESIZE($sp)
li r178, 77
sw r178, -272+tigerMain_FRAMESIZE($sp)
li r179, 78
sw r179, -276+tigerMain_FRAMESIZE($sp)
li r180, 79
sw r180, -280+tigerMain_FRAMESIZE($sp)
li r181, 80
sw r181, -284+tigerMain_FRAMESIZE($sp)
li r182, 81
sw r182, -288+tigerMain_FRAMESIZE($sp)
li r183, 82
sw r183, -292+tigerMain_FRAMESIZE($sp)
li r184, 83
sw r184, -296+tigerMain_FRAMESIZE($sp)
li r185, 84
sw r185, -300+tigerMain_FRAMESIZE($sp)
li r186, 85
sw r186, -304+tigerMain_FRAMESIZE($sp)
li r187, 86
sw r187, -308+tigerMain_FRAMESIZE($sp)
li r188, 87
sw r188, -312+tigerMain_FRAMESIZE($sp)
li r189, 88
sw r189, -316+tigerMain_FRAMESIZE($sp)
li r190, 89
sw r190, -320+tigerMain_FRAMESIZE($sp)
li r191, 90
sw r191, -324+tigerMain_FRAMESIZE($sp)
li r192, 91
sw r192, -328+tigerMain_FRAMESIZE($sp)
li r193, 92
sw r193, -332+tigerMain_FRAMESIZE($sp)
li r194, 93
sw r194, -336+tigerMain_FRAMESIZE($sp)
li r195, 94
sw r195, -340+tigerMain_FRAMESIZE($sp)
li r196, 95
sw r196, -344+tigerMain_FRAMESIZE($sp)
li r197, 96
sw r197, -348+tigerMain_FRAMESIZE($sp)
li r198, 97
sw r198, -352+tigerMain_FRAMESIZE($sp)
li r199, 98
sw r199, -356+tigerMain_FRAMESIZE($sp)
li r200, 99
sw r200, -360+tigerMain_FRAMESIZE($sp)
li r201, 100
sw r201, -364+tigerMain_FRAMESIZE($sp)
add r315, r102, r103
add r314, r315, r104
add r313, r314, r105
add r312, r313, r106
add r311, r312, r107
add r310, r311, r108
add r309, r310, r109
add r308, r309, r110
add r307, r308, r111
add r306, r307, r112
add r305, r306, r113
add r304, r305, r114
add r303, r304, r115
add r302, r303, r116
add r301, r302, r117
add r300, r301, r118
lw r410, -368+tigerMain_FRAMESIZE($sp)
add r299, r300, r410
lw r328, -40+tigerMain_FRAMESIZE($sp)
add r298, r299, r328
lw r329, -44+tigerMain_FRAMESIZE($sp)
add r297, r298, r329
lw r330, -48+tigerMain_FRAMESIZE($sp)
add r296, r297, r330
lw r331, -52+tigerMain_FRAMESIZE($sp)
add r295, r296, r331
lw r332, -56+tigerMain_FRAMESIZE($sp)
add r294, r295, r332
lw r333, -60+tigerMain_FRAMESIZE($sp)
add r293, r294, r333
lw r334, -64+tigerMain_FRAMESIZE($sp)
add r292, r293, r334
lw r335, -68+tigerMain_FRAMESIZE($sp)
add r291, r292, r335
lw r336, -72+tigerMain_FRAMESIZE($sp)
add r290, r291, r336
lw r337, -76+tigerMain_FRAMESIZE($sp)
add r289, r290, r337
lw r338, -80+tigerMain_FRAMESIZE($sp)
add r288, r289, r338
lw r339, -84+tigerMain_FRAMESIZE($sp)
add r287, r288, r339
lw r340, -88+tigerMain_FRAMESIZE($sp)
add r286, r287, r340
lw r341, -92+tigerMain_FRAMESIZE($sp)
add r285, r286, r341
lw r342, -96+tigerMain_FRAMESIZE($sp)
add r284, r285, r342
lw r343, -100+tigerMain_FRAMESIZE($sp)
add r283, r284, r343
lw r344, -104+tigerMain_FRAMESIZE($sp)
add r282, r283, r344
lw r345, -108+tigerMain_FRAMESIZE($sp)
add r281, r282, r345
lw r346, -112+tigerMain_FRAMESIZE($sp)
add r280, r281, r346
lw r347, -116+tigerMain_FRAMESIZE($sp)
add r279, r280, r347
lw r348, -120+tigerMain_FRAMESIZE($sp)
add r278, r279, r348
lw r349, -124+tigerMain_FRAMESIZE($sp)
add r277, r278, r349
lw r350, -128+tigerMain_FRAMESIZE($sp)
add r276, r277, r350
lw r351, -132+tigerMain_FRAMESIZE($sp)
add r275, r276, r351
lw r352, -136+tigerMain_FRAMESIZE($sp)
add r274, r275, r352
lw r353, -140+tigerMain_FRAMESIZE($sp)
add r273, r274, r353
lw r354, -144+tigerMain_FRAMESIZE($sp)
add r272, r273, r354
lw r355, -148+tigerMain_FRAMESIZE($sp)
add r271, r272, r355
lw r356, -152+tigerMain_FRAMESIZE($sp)
add r270, r271, r356
lw r357, -156+tigerMain_FRAMESIZE($sp)
add r269, r270, r357
lw r358, -160+tigerMain_FRAMESIZE($sp)
add r268, r269, r358
lw r359, -164+tigerMain_FRAMESIZE($sp)
add r267, r268, r359
lw r360, -168+tigerMain_FRAMESIZE($sp)
add r266, r267, r360
lw r361, -172+tigerMain_FRAMESIZE($sp)
add r265, r266, r361
lw r362, -176+tigerMain_FRAMESIZE($sp)
add r264, r265, r362
lw r363, -180+tigerMain_FRAMESIZE($sp)
add r263, r264, r363
lw r364, -184+tigerMain_FRAMESIZE($sp)
add r262, r263, r364
lw r365, -188+tigerMain_FRAMESIZE($sp)
add r261, r262, r365
lw r366, -192+tigerMain_FRAMESIZE($sp)
add r260, r261, r366
lw r367, -196+tigerMain_FRAMESIZE($sp)
add r259, r260, r367
lw r368, -200+tigerMain_FRAMESIZE($sp)
add r258, r259, r368
lw r369, -204+tigerMain_FRAMESIZE($sp)
add r257, r258, r369
lw r370, -208+tigerMain_FRAMESIZE($sp)
add r256, r257, r370
lw r371, -212+tigerMain_FRAMESIZE($sp)
add r255, r256, r371
lw r372, -216+tigerMain_FRAMESIZE($sp)
add r254, r255, r372
lw r373, -220+tigerMain_FRAMESIZE($sp)
add r253, r254, r373
lw r374, -224+tigerMain_FRAMESIZE($sp)
add r252, r253, r374
lw r375, -228+tigerMain_FRAMESIZE($sp)
add r251, r252, r375
lw r376, -232+tigerMain_FRAMESIZE($sp)
add r250, r251, r376
lw r377, -236+tigerMain_FRAMESIZE($sp)
add r249, r250, r377
lw r378, -240+tigerMain_FRAMESIZE($sp)
add r248, r249, r378
lw r379, -244+tigerMain_FRAMESIZE($sp)
add r247, r248, r379
lw r380, -248+tigerMain_FRAMESIZE($sp)
add r246, r247, r380
lw r381, -252+tigerMain_FRAMESIZE($sp)
add r245, r246, r381
lw r382, -256+tigerMain_FRAMESIZE($sp)
add r244, r245, r382
lw r383, -260+tigerMain_FRAMESIZE($sp)
add r243, r244, r383
lw r384, -264+tigerMain_FRAMESIZE($sp)
add r242, r243, r384
lw r385, -268+tigerMain_FRAMESIZE($sp)
add r241, r242, r385
lw r386, -272+tigerMain_FRAMESIZE($sp)
add r240, r241, r386
lw r387, -276+tigerMain_FRAMESIZE($sp)
add r239, r240, r387
lw r388, -280+tigerMain_FRAMESIZE($sp)
add r238, r239, r388
lw r389, -284+tigerMain_FRAMESIZE($sp)
add r237, r238, r389
lw r390, -288+tigerMain_FRAMESIZE($sp)
add r236, r237, r390
lw r391, -292+tigerMain_FRAMESIZE($sp)
add r235, r236, r391
lw r392, -296+tigerMain_FRAMESIZE($sp)
add r234, r235, r392
lw r393, -300+tigerMain_FRAMESIZE($sp)
add r233, r234, r393
lw r394, -304+tigerMain_FRAMESIZE($sp)
add r232, r233, r394
lw r395, -308+tigerMain_FRAMESIZE($sp)
add r231, r232, r395
lw r396, -312+tigerMain_FRAMESIZE($sp)
add r230, r231, r396
lw r397, -316+tigerMain_FRAMESIZE($sp)
add r229, r230, r397
lw r398, -320+tigerMain_FRAMESIZE($sp)
add r228, r229, r398
lw r399, -324+tigerMain_FRAMESIZE($sp)
add r227, r228, r399
lw r400, -328+tigerMain_FRAMESIZE($sp)
add r226, r227, r400
lw r401, -332+tigerMain_FRAMESIZE($sp)
add r225, r226, r401
lw r402, -336+tigerMain_FRAMESIZE($sp)
add r224, r225, r402
lw r403, -340+tigerMain_FRAMESIZE($sp)
add r223, r224, r403
lw r404, -344+tigerMain_FRAMESIZE($sp)
add r222, r223, r404
lw r405, -348+tigerMain_FRAMESIZE($sp)
add r221, r222, r405
lw r406, -352+tigerMain_FRAMESIZE($sp)
add r220, r221, r406
lw r407, -356+tigerMain_FRAMESIZE($sp)
add r219, r220, r407
lw r408, -360+tigerMain_FRAMESIZE($sp)
add r218, r219, r408
lw r409, -364+tigerMain_FRAMESIZE($sp)
add r217, r218, r409
move r100, r217
move $a0, r100
jal printInt
nop
la r326, L1
move $a0, r326
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
