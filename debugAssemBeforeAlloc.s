
L3:
move r206, $ra
move r216, $s7
move r217, $s6
move r218, $s5
move r219, $s4
move r220, $s3
move r221, $s2
move r222, $s1
move r223, $s0
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
add r323, r102, r103
add r322, r323, r104
add r321, r322, r105
add r320, r321, r106
add r319, r320, r107
add r318, r319, r108
add r317, r318, r109
add r316, r317, r110
add r315, r316, r111
add r314, r315, r112
add r313, r314, r113
add r312, r313, r114
add r311, r312, r115
add r310, r311, r116
add r309, r310, r117
add r308, r309, r118
add r307, r308, r119
add r306, r307, r120
add r305, r306, r121
add r304, r305, r122
add r303, r304, r123
add r302, r303, r124
add r301, r302, r125
add r300, r301, r126
add r299, r300, r127
add r298, r299, r128
add r297, r298, r129
add r296, r297, r130
add r295, r296, r131
add r294, r295, r132
add r293, r294, r133
add r292, r293, r134
add r291, r292, r135
add r290, r291, r136
add r289, r290, r137
add r288, r289, r138
add r287, r288, r139
add r286, r287, r140
add r285, r286, r141
add r284, r285, r142
add r283, r284, r143
add r282, r283, r144
add r281, r282, r145
add r280, r281, r146
add r279, r280, r147
add r278, r279, r148
add r277, r278, r149
add r276, r277, r150
add r275, r276, r151
add r274, r275, r152
add r273, r274, r153
add r272, r273, r154
add r271, r272, r155
add r270, r271, r156
add r269, r270, r157
add r268, r269, r158
add r267, r268, r159
add r266, r267, r160
add r265, r266, r161
add r264, r265, r162
add r263, r264, r163
add r262, r263, r164
add r261, r262, r165
add r260, r261, r166
add r259, r260, r167
add r258, r259, r168
add r257, r258, r169
add r256, r257, r170
add r255, r256, r171
add r254, r255, r172
add r253, r254, r173
add r252, r253, r174
add r251, r252, r175
add r250, r251, r176
add r249, r250, r177
add r248, r249, r178
add r247, r248, r179
add r246, r247, r180
add r245, r246, r181
add r244, r245, r182
add r243, r244, r183
add r242, r243, r184
add r241, r242, r185
add r240, r241, r186
add r239, r240, r187
add r238, r239, r188
add r237, r238, r189
add r236, r237, r190
add r235, r236, r191
add r234, r235, r192
add r233, r234, r193
add r232, r233, r194
add r231, r232, r195
add r230, r231, r196
add r229, r230, r197
add r228, r229, r198
add r227, r228, r199
add r226, r227, r200
add r225, r226, r201
move r100, r225
move $a0, r100
jal printInt
nop
la r335, L1
move $a0, r335
jal printStr
nop
li $v0, 0
move $s7, r216
move $s6, r217
move $s5, r218
move $s4, r219
move $s3, r220
move $s2, r221
move $s1, r222
move $s0, r223
move $ra, r206
j L2
nop

L2:
nop


L3:
move r206, $ra
sw r206, -364+tigerMain_FRAMESIZE($sp)
move r216, $s7
sw r216, -332+tigerMain_FRAMESIZE($sp)
move r217, $s6
sw r217, -336+tigerMain_FRAMESIZE($sp)
move r218, $s5
sw r218, -340+tigerMain_FRAMESIZE($sp)
move r219, $s4
sw r219, -344+tigerMain_FRAMESIZE($sp)
move r220, $s3
sw r220, -348+tigerMain_FRAMESIZE($sp)
move r221, $s2
sw r221, -352+tigerMain_FRAMESIZE($sp)
move r222, $s1
sw r222, -356+tigerMain_FRAMESIZE($sp)
move r223, $s0
sw r223, -360+tigerMain_FRAMESIZE($sp)
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
sw r120, -4+tigerMain_FRAMESIZE($sp)
li r121, 20
sw r121, -8+tigerMain_FRAMESIZE($sp)
li r122, 21
sw r122, -12+tigerMain_FRAMESIZE($sp)
li r123, 22
sw r123, -16+tigerMain_FRAMESIZE($sp)
li r124, 23
sw r124, -20+tigerMain_FRAMESIZE($sp)
li r125, 24
sw r125, -24+tigerMain_FRAMESIZE($sp)
li r126, 25
sw r126, -28+tigerMain_FRAMESIZE($sp)
li r127, 26
sw r127, -32+tigerMain_FRAMESIZE($sp)
li r128, 27
sw r128, -36+tigerMain_FRAMESIZE($sp)
li r129, 28
sw r129, -40+tigerMain_FRAMESIZE($sp)
li r130, 29
sw r130, -44+tigerMain_FRAMESIZE($sp)
li r131, 30
sw r131, -48+tigerMain_FRAMESIZE($sp)
li r132, 31
sw r132, -52+tigerMain_FRAMESIZE($sp)
li r133, 32
sw r133, -56+tigerMain_FRAMESIZE($sp)
li r134, 33
sw r134, -60+tigerMain_FRAMESIZE($sp)
li r135, 34
sw r135, -64+tigerMain_FRAMESIZE($sp)
li r136, 35
sw r136, -68+tigerMain_FRAMESIZE($sp)
li r137, 36
sw r137, -72+tigerMain_FRAMESIZE($sp)
li r138, 37
sw r138, -76+tigerMain_FRAMESIZE($sp)
li r139, 38
sw r139, -80+tigerMain_FRAMESIZE($sp)
li r140, 39
sw r140, -84+tigerMain_FRAMESIZE($sp)
li r141, 40
sw r141, -88+tigerMain_FRAMESIZE($sp)
li r142, 41
sw r142, -92+tigerMain_FRAMESIZE($sp)
li r143, 42
sw r143, -96+tigerMain_FRAMESIZE($sp)
li r144, 43
sw r144, -100+tigerMain_FRAMESIZE($sp)
li r145, 44
sw r145, -104+tigerMain_FRAMESIZE($sp)
li r146, 45
sw r146, -108+tigerMain_FRAMESIZE($sp)
li r147, 46
sw r147, -112+tigerMain_FRAMESIZE($sp)
li r148, 47
sw r148, -116+tigerMain_FRAMESIZE($sp)
li r149, 48
sw r149, -120+tigerMain_FRAMESIZE($sp)
li r150, 49
sw r150, -124+tigerMain_FRAMESIZE($sp)
li r151, 50
sw r151, -128+tigerMain_FRAMESIZE($sp)
li r152, 51
sw r152, -132+tigerMain_FRAMESIZE($sp)
li r153, 52
sw r153, -136+tigerMain_FRAMESIZE($sp)
li r154, 53
sw r154, -140+tigerMain_FRAMESIZE($sp)
li r155, 54
sw r155, -144+tigerMain_FRAMESIZE($sp)
li r156, 55
sw r156, -148+tigerMain_FRAMESIZE($sp)
li r157, 56
sw r157, -152+tigerMain_FRAMESIZE($sp)
li r158, 57
sw r158, -156+tigerMain_FRAMESIZE($sp)
li r159, 58
sw r159, -160+tigerMain_FRAMESIZE($sp)
li r160, 59
sw r160, -164+tigerMain_FRAMESIZE($sp)
li r161, 60
sw r161, -168+tigerMain_FRAMESIZE($sp)
li r162, 61
sw r162, -172+tigerMain_FRAMESIZE($sp)
li r163, 62
sw r163, -176+tigerMain_FRAMESIZE($sp)
li r164, 63
sw r164, -180+tigerMain_FRAMESIZE($sp)
li r165, 64
sw r165, -184+tigerMain_FRAMESIZE($sp)
li r166, 65
sw r166, -188+tigerMain_FRAMESIZE($sp)
li r167, 66
sw r167, -192+tigerMain_FRAMESIZE($sp)
li r168, 67
sw r168, -196+tigerMain_FRAMESIZE($sp)
li r169, 68
sw r169, -200+tigerMain_FRAMESIZE($sp)
li r170, 69
sw r170, -204+tigerMain_FRAMESIZE($sp)
li r171, 70
sw r171, -208+tigerMain_FRAMESIZE($sp)
li r172, 71
sw r172, -212+tigerMain_FRAMESIZE($sp)
li r173, 72
sw r173, -216+tigerMain_FRAMESIZE($sp)
li r174, 73
sw r174, -220+tigerMain_FRAMESIZE($sp)
li r175, 74
sw r175, -224+tigerMain_FRAMESIZE($sp)
li r176, 75
sw r176, -228+tigerMain_FRAMESIZE($sp)
li r177, 76
sw r177, -232+tigerMain_FRAMESIZE($sp)
li r178, 77
sw r178, -236+tigerMain_FRAMESIZE($sp)
li r179, 78
sw r179, -240+tigerMain_FRAMESIZE($sp)
li r180, 79
sw r180, -244+tigerMain_FRAMESIZE($sp)
li r181, 80
sw r181, -248+tigerMain_FRAMESIZE($sp)
li r182, 81
sw r182, -252+tigerMain_FRAMESIZE($sp)
li r183, 82
sw r183, -256+tigerMain_FRAMESIZE($sp)
li r184, 83
sw r184, -260+tigerMain_FRAMESIZE($sp)
li r185, 84
sw r185, -264+tigerMain_FRAMESIZE($sp)
li r186, 85
sw r186, -268+tigerMain_FRAMESIZE($sp)
li r187, 86
sw r187, -272+tigerMain_FRAMESIZE($sp)
li r188, 87
sw r188, -276+tigerMain_FRAMESIZE($sp)
li r189, 88
sw r189, -280+tigerMain_FRAMESIZE($sp)
li r190, 89
sw r190, -284+tigerMain_FRAMESIZE($sp)
li r191, 90
sw r191, -288+tigerMain_FRAMESIZE($sp)
li r192, 91
sw r192, -292+tigerMain_FRAMESIZE($sp)
li r193, 92
sw r193, -296+tigerMain_FRAMESIZE($sp)
li r194, 93
sw r194, -300+tigerMain_FRAMESIZE($sp)
li r195, 94
sw r195, -304+tigerMain_FRAMESIZE($sp)
li r196, 95
sw r196, -308+tigerMain_FRAMESIZE($sp)
li r197, 96
sw r197, -312+tigerMain_FRAMESIZE($sp)
li r198, 97
sw r198, -316+tigerMain_FRAMESIZE($sp)
li r199, 98
sw r199, -320+tigerMain_FRAMESIZE($sp)
li r200, 99
sw r200, -324+tigerMain_FRAMESIZE($sp)
li r201, 100
sw r201, -328+tigerMain_FRAMESIZE($sp)
add r323, r102, r103
add r322, r323, r104
add r321, r322, r105
add r320, r321, r106
add r319, r320, r107
add r318, r319, r108
add r317, r318, r109
add r316, r317, r110
add r315, r316, r111
add r314, r315, r112
add r313, r314, r113
add r312, r313, r114
add r311, r312, r115
add r310, r311, r116
add r309, r310, r117
add r308, r309, r118
add r307, r308, r119
lw r337, -4+tigerMain_FRAMESIZE($sp)
add r306, r307, r337
lw r338, -8+tigerMain_FRAMESIZE($sp)
add r305, r306, r338
lw r339, -12+tigerMain_FRAMESIZE($sp)
add r304, r305, r339
lw r340, -16+tigerMain_FRAMESIZE($sp)
add r303, r304, r340
lw r341, -20+tigerMain_FRAMESIZE($sp)
add r302, r303, r341
lw r342, -24+tigerMain_FRAMESIZE($sp)
add r301, r302, r342
lw r343, -28+tigerMain_FRAMESIZE($sp)
add r300, r301, r343
lw r344, -32+tigerMain_FRAMESIZE($sp)
add r299, r300, r344
lw r345, -36+tigerMain_FRAMESIZE($sp)
add r298, r299, r345
lw r346, -40+tigerMain_FRAMESIZE($sp)
add r297, r298, r346
lw r347, -44+tigerMain_FRAMESIZE($sp)
add r296, r297, r347
lw r348, -48+tigerMain_FRAMESIZE($sp)
add r295, r296, r348
lw r349, -52+tigerMain_FRAMESIZE($sp)
add r294, r295, r349
lw r350, -56+tigerMain_FRAMESIZE($sp)
add r293, r294, r350
lw r351, -60+tigerMain_FRAMESIZE($sp)
add r292, r293, r351
lw r352, -64+tigerMain_FRAMESIZE($sp)
add r291, r292, r352
lw r353, -68+tigerMain_FRAMESIZE($sp)
add r290, r291, r353
lw r354, -72+tigerMain_FRAMESIZE($sp)
add r289, r290, r354
lw r355, -76+tigerMain_FRAMESIZE($sp)
add r288, r289, r355
lw r356, -80+tigerMain_FRAMESIZE($sp)
add r287, r288, r356
lw r357, -84+tigerMain_FRAMESIZE($sp)
add r286, r287, r357
lw r358, -88+tigerMain_FRAMESIZE($sp)
add r285, r286, r358
lw r359, -92+tigerMain_FRAMESIZE($sp)
add r284, r285, r359
lw r360, -96+tigerMain_FRAMESIZE($sp)
add r283, r284, r360
lw r361, -100+tigerMain_FRAMESIZE($sp)
add r282, r283, r361
lw r362, -104+tigerMain_FRAMESIZE($sp)
add r281, r282, r362
lw r363, -108+tigerMain_FRAMESIZE($sp)
add r280, r281, r363
lw r364, -112+tigerMain_FRAMESIZE($sp)
add r279, r280, r364
lw r365, -116+tigerMain_FRAMESIZE($sp)
add r278, r279, r365
lw r366, -120+tigerMain_FRAMESIZE($sp)
add r277, r278, r366
lw r367, -124+tigerMain_FRAMESIZE($sp)
add r276, r277, r367
lw r368, -128+tigerMain_FRAMESIZE($sp)
add r275, r276, r368
lw r369, -132+tigerMain_FRAMESIZE($sp)
add r274, r275, r369
lw r370, -136+tigerMain_FRAMESIZE($sp)
add r273, r274, r370
lw r371, -140+tigerMain_FRAMESIZE($sp)
add r272, r273, r371
lw r372, -144+tigerMain_FRAMESIZE($sp)
add r271, r272, r372
lw r373, -148+tigerMain_FRAMESIZE($sp)
add r270, r271, r373
lw r374, -152+tigerMain_FRAMESIZE($sp)
add r269, r270, r374
lw r375, -156+tigerMain_FRAMESIZE($sp)
add r268, r269, r375
lw r376, -160+tigerMain_FRAMESIZE($sp)
add r267, r268, r376
lw r377, -164+tigerMain_FRAMESIZE($sp)
add r266, r267, r377
lw r378, -168+tigerMain_FRAMESIZE($sp)
add r265, r266, r378
lw r379, -172+tigerMain_FRAMESIZE($sp)
add r264, r265, r379
lw r380, -176+tigerMain_FRAMESIZE($sp)
add r263, r264, r380
lw r381, -180+tigerMain_FRAMESIZE($sp)
add r262, r263, r381
lw r382, -184+tigerMain_FRAMESIZE($sp)
add r261, r262, r382
lw r383, -188+tigerMain_FRAMESIZE($sp)
add r260, r261, r383
lw r384, -192+tigerMain_FRAMESIZE($sp)
add r259, r260, r384
lw r385, -196+tigerMain_FRAMESIZE($sp)
add r258, r259, r385
lw r386, -200+tigerMain_FRAMESIZE($sp)
add r257, r258, r386
lw r387, -204+tigerMain_FRAMESIZE($sp)
add r256, r257, r387
lw r388, -208+tigerMain_FRAMESIZE($sp)
add r255, r256, r388
lw r389, -212+tigerMain_FRAMESIZE($sp)
add r254, r255, r389
lw r390, -216+tigerMain_FRAMESIZE($sp)
add r253, r254, r390
lw r391, -220+tigerMain_FRAMESIZE($sp)
add r252, r253, r391
lw r392, -224+tigerMain_FRAMESIZE($sp)
add r251, r252, r392
lw r393, -228+tigerMain_FRAMESIZE($sp)
add r250, r251, r393
lw r394, -232+tigerMain_FRAMESIZE($sp)
add r249, r250, r394
lw r395, -236+tigerMain_FRAMESIZE($sp)
add r248, r249, r395
lw r396, -240+tigerMain_FRAMESIZE($sp)
add r247, r248, r396
lw r397, -244+tigerMain_FRAMESIZE($sp)
add r246, r247, r397
lw r398, -248+tigerMain_FRAMESIZE($sp)
add r245, r246, r398
lw r399, -252+tigerMain_FRAMESIZE($sp)
add r244, r245, r399
lw r400, -256+tigerMain_FRAMESIZE($sp)
add r243, r244, r400
lw r401, -260+tigerMain_FRAMESIZE($sp)
add r242, r243, r401
lw r402, -264+tigerMain_FRAMESIZE($sp)
add r241, r242, r402
lw r403, -268+tigerMain_FRAMESIZE($sp)
add r240, r241, r403
lw r404, -272+tigerMain_FRAMESIZE($sp)
add r239, r240, r404
lw r405, -276+tigerMain_FRAMESIZE($sp)
add r238, r239, r405
lw r406, -280+tigerMain_FRAMESIZE($sp)
add r237, r238, r406
lw r407, -284+tigerMain_FRAMESIZE($sp)
add r236, r237, r407
lw r408, -288+tigerMain_FRAMESIZE($sp)
add r235, r236, r408
lw r409, -292+tigerMain_FRAMESIZE($sp)
add r234, r235, r409
lw r410, -296+tigerMain_FRAMESIZE($sp)
add r233, r234, r410
lw r411, -300+tigerMain_FRAMESIZE($sp)
add r232, r233, r411
lw r412, -304+tigerMain_FRAMESIZE($sp)
add r231, r232, r412
lw r413, -308+tigerMain_FRAMESIZE($sp)
add r230, r231, r413
lw r414, -312+tigerMain_FRAMESIZE($sp)
add r229, r230, r414
lw r415, -316+tigerMain_FRAMESIZE($sp)
add r228, r229, r415
lw r416, -320+tigerMain_FRAMESIZE($sp)
add r227, r228, r416
lw r417, -324+tigerMain_FRAMESIZE($sp)
add r226, r227, r417
lw r418, -328+tigerMain_FRAMESIZE($sp)
add r225, r226, r418
move r100, r225
move $a0, r100
jal printInt
nop
la r335, L1
move $a0, r335
jal printStr
nop
li $v0, 0
lw r419, -332+tigerMain_FRAMESIZE($sp)
move $s7, r419
lw r420, -336+tigerMain_FRAMESIZE($sp)
move $s6, r420
lw r421, -340+tigerMain_FRAMESIZE($sp)
move $s5, r421
lw r422, -344+tigerMain_FRAMESIZE($sp)
move $s4, r422
lw r423, -348+tigerMain_FRAMESIZE($sp)
move $s3, r423
lw r424, -352+tigerMain_FRAMESIZE($sp)
move $s2, r424
lw r425, -356+tigerMain_FRAMESIZE($sp)
move $s1, r425
lw r426, -360+tigerMain_FRAMESIZE($sp)
move $s0, r426
lw r427, -364+tigerMain_FRAMESIZE($sp)
move $ra, r427
j L2
nop

L2:
nop


L3:
move r206, $ra
sw r206, -364+tigerMain_FRAMESIZE($sp)
move r216, $s7
sw r216, -332+tigerMain_FRAMESIZE($sp)
move r217, $s6
sw r217, -336+tigerMain_FRAMESIZE($sp)
move r218, $s5
sw r218, -340+tigerMain_FRAMESIZE($sp)
move r219, $s4
sw r219, -344+tigerMain_FRAMESIZE($sp)
move r220, $s3
sw r220, -348+tigerMain_FRAMESIZE($sp)
move r221, $s2
sw r221, -352+tigerMain_FRAMESIZE($sp)
move r222, $s1
sw r222, -356+tigerMain_FRAMESIZE($sp)
move r223, $s0
sw r223, -360+tigerMain_FRAMESIZE($sp)
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
sw r120, -4+tigerMain_FRAMESIZE($sp)
li r121, 20
sw r121, -8+tigerMain_FRAMESIZE($sp)
li r122, 21
sw r122, -12+tigerMain_FRAMESIZE($sp)
li r123, 22
sw r123, -16+tigerMain_FRAMESIZE($sp)
li r124, 23
sw r124, -20+tigerMain_FRAMESIZE($sp)
li r125, 24
sw r125, -24+tigerMain_FRAMESIZE($sp)
li r126, 25
sw r126, -28+tigerMain_FRAMESIZE($sp)
li r127, 26
sw r127, -32+tigerMain_FRAMESIZE($sp)
li r128, 27
sw r128, -36+tigerMain_FRAMESIZE($sp)
li r129, 28
sw r129, -40+tigerMain_FRAMESIZE($sp)
li r130, 29
sw r130, -44+tigerMain_FRAMESIZE($sp)
li r131, 30
sw r131, -48+tigerMain_FRAMESIZE($sp)
li r132, 31
sw r132, -52+tigerMain_FRAMESIZE($sp)
li r133, 32
sw r133, -56+tigerMain_FRAMESIZE($sp)
li r134, 33
sw r134, -60+tigerMain_FRAMESIZE($sp)
li r135, 34
sw r135, -64+tigerMain_FRAMESIZE($sp)
li r136, 35
sw r136, -68+tigerMain_FRAMESIZE($sp)
li r137, 36
sw r137, -72+tigerMain_FRAMESIZE($sp)
li r138, 37
sw r138, -76+tigerMain_FRAMESIZE($sp)
li r139, 38
sw r139, -80+tigerMain_FRAMESIZE($sp)
li r140, 39
sw r140, -84+tigerMain_FRAMESIZE($sp)
li r141, 40
sw r141, -88+tigerMain_FRAMESIZE($sp)
li r142, 41
sw r142, -92+tigerMain_FRAMESIZE($sp)
li r143, 42
sw r143, -96+tigerMain_FRAMESIZE($sp)
li r144, 43
sw r144, -100+tigerMain_FRAMESIZE($sp)
li r145, 44
sw r145, -104+tigerMain_FRAMESIZE($sp)
li r146, 45
sw r146, -108+tigerMain_FRAMESIZE($sp)
li r147, 46
sw r147, -112+tigerMain_FRAMESIZE($sp)
li r148, 47
sw r148, -116+tigerMain_FRAMESIZE($sp)
li r149, 48
sw r149, -120+tigerMain_FRAMESIZE($sp)
li r150, 49
sw r150, -124+tigerMain_FRAMESIZE($sp)
li r151, 50
sw r151, -128+tigerMain_FRAMESIZE($sp)
li r152, 51
sw r152, -132+tigerMain_FRAMESIZE($sp)
li r153, 52
sw r153, -136+tigerMain_FRAMESIZE($sp)
li r154, 53
sw r154, -140+tigerMain_FRAMESIZE($sp)
li r155, 54
sw r155, -144+tigerMain_FRAMESIZE($sp)
li r156, 55
sw r156, -148+tigerMain_FRAMESIZE($sp)
li r157, 56
sw r157, -152+tigerMain_FRAMESIZE($sp)
li r158, 57
sw r158, -156+tigerMain_FRAMESIZE($sp)
li r159, 58
sw r159, -160+tigerMain_FRAMESIZE($sp)
li r160, 59
sw r160, -164+tigerMain_FRAMESIZE($sp)
li r161, 60
sw r161, -168+tigerMain_FRAMESIZE($sp)
li r162, 61
sw r162, -172+tigerMain_FRAMESIZE($sp)
li r163, 62
sw r163, -176+tigerMain_FRAMESIZE($sp)
li r164, 63
sw r164, -180+tigerMain_FRAMESIZE($sp)
li r165, 64
sw r165, -184+tigerMain_FRAMESIZE($sp)
li r166, 65
sw r166, -188+tigerMain_FRAMESIZE($sp)
li r167, 66
sw r167, -192+tigerMain_FRAMESIZE($sp)
li r168, 67
sw r168, -196+tigerMain_FRAMESIZE($sp)
li r169, 68
sw r169, -200+tigerMain_FRAMESIZE($sp)
li r170, 69
sw r170, -204+tigerMain_FRAMESIZE($sp)
li r171, 70
sw r171, -208+tigerMain_FRAMESIZE($sp)
li r172, 71
sw r172, -212+tigerMain_FRAMESIZE($sp)
li r173, 72
sw r173, -216+tigerMain_FRAMESIZE($sp)
li r174, 73
sw r174, -220+tigerMain_FRAMESIZE($sp)
li r175, 74
sw r175, -224+tigerMain_FRAMESIZE($sp)
li r176, 75
sw r176, -228+tigerMain_FRAMESIZE($sp)
li r177, 76
sw r177, -232+tigerMain_FRAMESIZE($sp)
li r178, 77
sw r178, -236+tigerMain_FRAMESIZE($sp)
li r179, 78
sw r179, -240+tigerMain_FRAMESIZE($sp)
li r180, 79
sw r180, -244+tigerMain_FRAMESIZE($sp)
li r181, 80
sw r181, -248+tigerMain_FRAMESIZE($sp)
li r182, 81
sw r182, -252+tigerMain_FRAMESIZE($sp)
li r183, 82
sw r183, -256+tigerMain_FRAMESIZE($sp)
li r184, 83
sw r184, -260+tigerMain_FRAMESIZE($sp)
li r185, 84
sw r185, -264+tigerMain_FRAMESIZE($sp)
li r186, 85
sw r186, -268+tigerMain_FRAMESIZE($sp)
li r187, 86
sw r187, -272+tigerMain_FRAMESIZE($sp)
li r188, 87
sw r188, -276+tigerMain_FRAMESIZE($sp)
li r189, 88
sw r189, -280+tigerMain_FRAMESIZE($sp)
li r190, 89
sw r190, -284+tigerMain_FRAMESIZE($sp)
li r191, 90
sw r191, -288+tigerMain_FRAMESIZE($sp)
li r192, 91
sw r192, -292+tigerMain_FRAMESIZE($sp)
li r193, 92
sw r193, -296+tigerMain_FRAMESIZE($sp)
li r194, 93
sw r194, -300+tigerMain_FRAMESIZE($sp)
li r195, 94
sw r195, -304+tigerMain_FRAMESIZE($sp)
li r196, 95
sw r196, -308+tigerMain_FRAMESIZE($sp)
li r197, 96
sw r197, -312+tigerMain_FRAMESIZE($sp)
li r198, 97
sw r198, -316+tigerMain_FRAMESIZE($sp)
li r199, 98
sw r199, -320+tigerMain_FRAMESIZE($sp)
li r200, 99
sw r200, -324+tigerMain_FRAMESIZE($sp)
li r201, 100
sw r201, -328+tigerMain_FRAMESIZE($sp)
add r323, r102, r103
add r322, r323, r104
add r321, r322, r105
add r320, r321, r106
add r319, r320, r107
add r318, r319, r108
add r317, r318, r109
add r316, r317, r110
add r315, r316, r111
add r314, r315, r112
add r313, r314, r113
add r312, r313, r114
add r311, r312, r115
add r310, r311, r116
add r309, r310, r117
add r308, r309, r118
lw r428, -368+tigerMain_FRAMESIZE($sp)
add r307, r308, r428
lw r337, -4+tigerMain_FRAMESIZE($sp)
add r306, r307, r337
lw r338, -8+tigerMain_FRAMESIZE($sp)
add r305, r306, r338
lw r339, -12+tigerMain_FRAMESIZE($sp)
add r304, r305, r339
lw r340, -16+tigerMain_FRAMESIZE($sp)
add r303, r304, r340
lw r341, -20+tigerMain_FRAMESIZE($sp)
add r302, r303, r341
lw r342, -24+tigerMain_FRAMESIZE($sp)
add r301, r302, r342
lw r343, -28+tigerMain_FRAMESIZE($sp)
add r300, r301, r343
lw r344, -32+tigerMain_FRAMESIZE($sp)
add r299, r300, r344
lw r345, -36+tigerMain_FRAMESIZE($sp)
add r298, r299, r345
lw r346, -40+tigerMain_FRAMESIZE($sp)
add r297, r298, r346
lw r347, -44+tigerMain_FRAMESIZE($sp)
add r296, r297, r347
lw r348, -48+tigerMain_FRAMESIZE($sp)
add r295, r296, r348
lw r349, -52+tigerMain_FRAMESIZE($sp)
add r294, r295, r349
lw r350, -56+tigerMain_FRAMESIZE($sp)
add r293, r294, r350
lw r351, -60+tigerMain_FRAMESIZE($sp)
add r292, r293, r351
lw r352, -64+tigerMain_FRAMESIZE($sp)
add r291, r292, r352
lw r353, -68+tigerMain_FRAMESIZE($sp)
add r290, r291, r353
lw r354, -72+tigerMain_FRAMESIZE($sp)
add r289, r290, r354
lw r355, -76+tigerMain_FRAMESIZE($sp)
add r288, r289, r355
lw r356, -80+tigerMain_FRAMESIZE($sp)
add r287, r288, r356
lw r357, -84+tigerMain_FRAMESIZE($sp)
add r286, r287, r357
lw r358, -88+tigerMain_FRAMESIZE($sp)
add r285, r286, r358
lw r359, -92+tigerMain_FRAMESIZE($sp)
add r284, r285, r359
lw r360, -96+tigerMain_FRAMESIZE($sp)
add r283, r284, r360
lw r361, -100+tigerMain_FRAMESIZE($sp)
add r282, r283, r361
lw r362, -104+tigerMain_FRAMESIZE($sp)
add r281, r282, r362
lw r363, -108+tigerMain_FRAMESIZE($sp)
add r280, r281, r363
lw r364, -112+tigerMain_FRAMESIZE($sp)
add r279, r280, r364
lw r365, -116+tigerMain_FRAMESIZE($sp)
add r278, r279, r365
lw r366, -120+tigerMain_FRAMESIZE($sp)
add r277, r278, r366
lw r367, -124+tigerMain_FRAMESIZE($sp)
add r276, r277, r367
lw r368, -128+tigerMain_FRAMESIZE($sp)
add r275, r276, r368
lw r369, -132+tigerMain_FRAMESIZE($sp)
add r274, r275, r369
lw r370, -136+tigerMain_FRAMESIZE($sp)
add r273, r274, r370
lw r371, -140+tigerMain_FRAMESIZE($sp)
add r272, r273, r371
lw r372, -144+tigerMain_FRAMESIZE($sp)
add r271, r272, r372
lw r373, -148+tigerMain_FRAMESIZE($sp)
add r270, r271, r373
lw r374, -152+tigerMain_FRAMESIZE($sp)
add r269, r270, r374
lw r375, -156+tigerMain_FRAMESIZE($sp)
add r268, r269, r375
lw r376, -160+tigerMain_FRAMESIZE($sp)
add r267, r268, r376
lw r377, -164+tigerMain_FRAMESIZE($sp)
add r266, r267, r377
lw r378, -168+tigerMain_FRAMESIZE($sp)
add r265, r266, r378
lw r379, -172+tigerMain_FRAMESIZE($sp)
add r264, r265, r379
lw r380, -176+tigerMain_FRAMESIZE($sp)
add r263, r264, r380
lw r381, -180+tigerMain_FRAMESIZE($sp)
add r262, r263, r381
lw r382, -184+tigerMain_FRAMESIZE($sp)
add r261, r262, r382
lw r383, -188+tigerMain_FRAMESIZE($sp)
add r260, r261, r383
lw r384, -192+tigerMain_FRAMESIZE($sp)
add r259, r260, r384
lw r385, -196+tigerMain_FRAMESIZE($sp)
add r258, r259, r385
lw r386, -200+tigerMain_FRAMESIZE($sp)
add r257, r258, r386
lw r387, -204+tigerMain_FRAMESIZE($sp)
add r256, r257, r387
lw r388, -208+tigerMain_FRAMESIZE($sp)
add r255, r256, r388
lw r389, -212+tigerMain_FRAMESIZE($sp)
add r254, r255, r389
lw r390, -216+tigerMain_FRAMESIZE($sp)
add r253, r254, r390
lw r391, -220+tigerMain_FRAMESIZE($sp)
add r252, r253, r391
lw r392, -224+tigerMain_FRAMESIZE($sp)
add r251, r252, r392
lw r393, -228+tigerMain_FRAMESIZE($sp)
add r250, r251, r393
lw r394, -232+tigerMain_FRAMESIZE($sp)
add r249, r250, r394
lw r395, -236+tigerMain_FRAMESIZE($sp)
add r248, r249, r395
lw r396, -240+tigerMain_FRAMESIZE($sp)
add r247, r248, r396
lw r397, -244+tigerMain_FRAMESIZE($sp)
add r246, r247, r397
lw r398, -248+tigerMain_FRAMESIZE($sp)
add r245, r246, r398
lw r399, -252+tigerMain_FRAMESIZE($sp)
add r244, r245, r399
lw r400, -256+tigerMain_FRAMESIZE($sp)
add r243, r244, r400
lw r401, -260+tigerMain_FRAMESIZE($sp)
add r242, r243, r401
lw r402, -264+tigerMain_FRAMESIZE($sp)
add r241, r242, r402
lw r403, -268+tigerMain_FRAMESIZE($sp)
add r240, r241, r403
lw r404, -272+tigerMain_FRAMESIZE($sp)
add r239, r240, r404
lw r405, -276+tigerMain_FRAMESIZE($sp)
add r238, r239, r405
lw r406, -280+tigerMain_FRAMESIZE($sp)
add r237, r238, r406
lw r407, -284+tigerMain_FRAMESIZE($sp)
add r236, r237, r407
lw r408, -288+tigerMain_FRAMESIZE($sp)
add r235, r236, r408
lw r409, -292+tigerMain_FRAMESIZE($sp)
add r234, r235, r409
lw r410, -296+tigerMain_FRAMESIZE($sp)
add r233, r234, r410
lw r411, -300+tigerMain_FRAMESIZE($sp)
add r232, r233, r411
lw r412, -304+tigerMain_FRAMESIZE($sp)
add r231, r232, r412
lw r413, -308+tigerMain_FRAMESIZE($sp)
add r230, r231, r413
lw r414, -312+tigerMain_FRAMESIZE($sp)
add r229, r230, r414
lw r415, -316+tigerMain_FRAMESIZE($sp)
add r228, r229, r415
lw r416, -320+tigerMain_FRAMESIZE($sp)
add r227, r228, r416
lw r417, -324+tigerMain_FRAMESIZE($sp)
add r226, r227, r417
lw r418, -328+tigerMain_FRAMESIZE($sp)
add r225, r226, r418
move r100, r225
move $a0, r100
jal printInt
nop
la r335, L1
move $a0, r335
jal printStr
nop
li $v0, 0
lw r419, -332+tigerMain_FRAMESIZE($sp)
move $s7, r419
lw r420, -336+tigerMain_FRAMESIZE($sp)
move $s6, r420
lw r421, -340+tigerMain_FRAMESIZE($sp)
move $s5, r421
lw r422, -344+tigerMain_FRAMESIZE($sp)
move $s4, r422
lw r423, -348+tigerMain_FRAMESIZE($sp)
move $s3, r423
lw r424, -352+tigerMain_FRAMESIZE($sp)
move $s2, r424
lw r425, -356+tigerMain_FRAMESIZE($sp)
move $s1, r425
lw r426, -360+tigerMain_FRAMESIZE($sp)
move $s0, r426
lw r427, -364+tigerMain_FRAMESIZE($sp)
move $ra, r427
j L2
nop

L2:
nop

