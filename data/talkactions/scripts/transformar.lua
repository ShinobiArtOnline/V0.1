local config = {
--[vocation id] = { level, nova voc, looktype, efeito}
---------- NARUTO -----------
[1] = { 25, 2, 71, 13},
[2] = { 50, 3, 66, 13},
[3] = { 75, 4, 91, 13},
[4] = { 100, 5, 18, 13},
[5] = { 125, 6, 31, 13},
[6] = { 150, 7, 92, 13},
[7] = { 200, 8, 40, 13},
[8] = { 250, 9, 49, 13},
[9] = { 300, 10, 25, 13},
[10] = { 350, 11, 179, 13},
[11] = { 400, 12, 31, 13},
[12] = { 500, 13, 291, 13},
[13] = { 600, 14, 302, 13},
--------- SASUKE -----------
[15] = { 25, 16, 2, 13},
[16] = { 50, 17, 93, 13},
[17] = { 75, 18, 6, 13},
[18] = { 100, 19, 5, 13},
[19] = { 125, 20, 7, 13},
[20] = { 150, 21, 94, 13},
[21] = { 200, 22, 59, 13},
[22] = { 250, 23, 8, 13},
[23] = { 300, 24, 178, 13},
[24] = { 350, 25, 95, 13},
[25] = { 400, 26, 334, 13},
[26] = { 450, 27, 379, 13},
[27] = { 500, 28, 504, 13},
[28] = { 600, 29, 745, 13},
--------- SAKURA -----------
[30] = { 25, 31, 195, 13},
[31] = { 50, 32, 175, 13},
[32] = { 75, 33, 171, 13},
[33] = { 100, 34, 174, 13},
[34] = { 125, 35, 169, 13},
[35] = { 150, 36, 300, 13},
[36] = { 200, 37, 194, 13},
[37] = { 250, 38, 301, 13},
[38] = { 300, 39, 170, 13},
[39] = { 350, 40, 172, 13},
[40] = { 400, 41, 296, 13},
[41] = { 450, 42, 294, 13},
[42] = { 500, 43, 501, 13},
[43] = { 600, 44, 502, 13},
-------- ROCK LEE -----------
[45] = { 25, 46, 30, 13},
[46] = { 50, 47, 60, 13},
[47] = { 75, 48, 83, 13},
[48] = { 100, 49, 82, 13},
[49] = { 125, 50, 80, 13},
[50] = { 150, 51, 190, 13},
[51] = { 200, 52, 78, 13},
[52] = { 250, 53, 191, 13},
[53] = { 300, 54, 192, 13},
[54] = { 350, 55, 193, 13},
[55] = { 400, 56, 295, 13},
[56] = { 450, 57, 746, 13},
[57] = { 500, 58, 747, 13},
[58] = { 600, 59, 749, 13},
-------- NEJI -----------
[60] = { 25, 61, 101, 13},
[61] = { 50, 62, 102, 13},
[62] = { 75, 63, 103, 13},
[63] = { 100, 64, 104, 13},
[64] = { 125, 65, 105, 13},
[65] = { 150, 66, 107, 13},
[66] = { 200, 67, 108, 13},
[67] = { 250, 68, 65, 13},
[68] = { 300, 69, 488, 13},
[69] = { 350, 70, 489, 13},
-------- TENTEN -----------
[75] = { 25, 76, 308, 13},
[76] = { 50, 77, 308, 13},
[77] = { 75, 78, 309, 13},
[78] = { 100, 79, 309, 13},
[79] = { 125, 80, 310, 13},
[80] = { 150, 81, 311, 13},
[81] = { 200, 82, 312, 13},
[82] = { 300, 83, 313, 13},
[83] = { 350, 84, 314, 13},
[84] = { 400, 85, 315, 13}, 
[85] = { 450, 86, 315, 13},
[86] = { 500, 87, 316, 13},
[87] = { 600, 88, 316, 13},
-------- KIBA -----------
[90] = { 25, 91, 50, 13},
[91] = { 50, 92, 69, 13},
[92] = { 75, 93, 70, 13},
[93] = { 100, 94, 84, 13},
[94] = { 125, 95, 196, 13},
[95] = { 150, 96, 196, 13},
[96] = { 200, 97, 197, 13},
[97] = { 250, 98, 197, 13},
[98] = { 300, 99, 198, 13},
[99] = { 350, 100, 199, 13},
[100] = { 400, 101, 199, 13},
[101] = { 450, 102, 200, 13},
[102] = { 500, 103, 493, 13},
[103] = { 600, 104, 200, 13},
-------- SHINO -----------
[105] = { 25, 106, 416, 13},
[106] = { 50, 107, 421, 13},
[107] = { 75, 108, 422, 13},
[108] = { 100, 109, 417, 13},
[109] = { 125, 110, 418, 13},
[110] = { 150, 111, 419, 13},
[111] = { 200, 112, 523, 13},
[112] = { 300, 113, 418, 13},
[113] = { 400, 114, 419, 13},
[114] = { 500, 115, 515, 13},
[115] = { 600, 116, 439, 13},
-------- KISAME -----------
[117] = { 25, 118, 687, 13},
[118] = { 50, 119, 688, 13},
[119] = { 75, 120, 689, 13},
[120] = { 100, 121, 690, 13},
[121] = { 125, 122, 691, 13},
[122] = { 150, 123, 551, 13},
[123] = { 200, 124, 553, 13},
[124] = { 250, 125, 554, 13},
[125] = { 300, 126, 555, 13},
[126] = { 400, 127, 556, 13},
[127] = { 500, 128, 557, 13},
[128] = { 600, 129, 558, 13},
-------- HIDAN -----------
[130] = { 25, 131, 528, 13},
[131] = { 50, 132, 529, 13},
[132] = { 75, 133, 530, 13},
[133] = { 100, 134, 531, 13},
[134] = { 125, 135, 539, 13},
[135] = { 150, 136, 540, 13},
[136] = { 200, 137, 541, 13},
[137] = { 250, 138, 547, 13},
[138] = { 300, 139, 550, 13},
[139] = { 350, 140, 566, 13},
[140] = { 400, 141, 567, 13}, ----
[141] = { 450, 142, 568, 13},
[142] = { 500, 143, 569, 13},
[143] = { 600, 144, 570, 13},
-------- KAKUZU -----------
[145] = { 25, 146, 572, 13},
[146] = { 50, 147, 606, 13},
[147] = { 75, 148, 608, 13},
[148] = { 100, 149, 609, 13},
[149] = { 125, 150, 613, 13},
[150] = { 150, 151, 614, 13},
[151] = { 200, 152, 634, 13},
[152] = { 250, 153, 643, 13},
[153] = { 300, 154, 652, 13},
[154] = { 350, 155, 693, 13},
[155] = { 400, 156, 694, 13},
[156] = { 450, 157, 695, 13},
[157] = { 500, 158, 712, 13},
[158] = { 600, 159, 764, 13},
-------- ITACHI -----------
[160] = { 25, 161, 96, 13},
[161] = { 50, 162, 97, 13},
[162] = { 75, 163, 284, 13},
[163] = { 100, 164, 98, 13},
[164] = { 125, 165, 99, 13},
[165] = { 150, 166, 282, 13},
[166] = { 200, 167, 283, 13},
[167] = { 250, 168, 100, 13},
[168] = { 300, 169, 297, 13},
[169] = { 350, 170, 322, 13},
[170] = { 400, 171, 298, 13},
[171] = { 450, 172, 472, 13},
[172] = { 500, 173, 511, 13},
[173] = { 600, 174, 490, 13},
-------- DEIDARA -----------
[175] = { 25, 176, 774, 13},
[176] = { 50, 177, 775, 13},
[177] = { 75, 178, 776, 13},
[178] = { 100, 179, 777, 13},
[179] = { 125, 180, 672, 13},
[180] = { 150, 181, 782, 13},
[181] = { 200, 182, 671, 13},
[182] = { 250, 183, 785, 13},
[183] = { 300, 184, 778, 13},
[184] = { 350, 185, 773, 13},
[185] = { 400, 186, 783, 13},
[186] = { 450, 187, 772, 13},
[187] = { 500, 188, 784, 13},
[188] = { 600, 189, 779, 13},
-------- KAKASHI -----------
[190] = { 25, 191, 9, 13},
[191] = { 50, 192, 11, 13},
[192] = { 75, 193, 12, 13},
[193] = { 100, 194, 289, 13},
[194] = { 125, 195, 10, 13},
[195] = { 150, 196, 13, 13},
[196] = { 200, 197, 289, 13},
[197] = { 250, 198, 288, 13}, 
[198] = { 300, 199, 304, 13},
[199] = { 350, 200, 289, 13},
[200] = { 400, 201, 287, 13},
[201] = { 450, 202, 299, 13},
[202] = { 500, 203, 491, 13},
[203] = { 600, 204, 299, 13},
--------- KILLER BEE -----------
[205] = { 25, 206, 714, 13},
[206] = { 50, 207, 729, 13},
[207] = { 75, 208, 732, 13},
[208] = { 100, 209, 733, 13},
[209] = { 125, 210, 734, 13},
[210] = { 150, 211, 735, 13},
[211] = { 200, 212, 736, 13},
[212] = { 250, 213, 737, 13},
[213] = { 300, 214, 738, 13},
[214] = { 350, 215, 738, 13},
[215] = { 400, 216, 739, 13},
[216] = { 450, 217, 739, 13},
[217] = { 500, 218, 740, 13},
[218] = { 600, 219, 741, 13},
-------- YAMATO -----------
[220] = { 25, 221, 464, 13},
[221] = { 50, 222, 464, 13},
[222] = { 75, 223, 463, 13},
[223] = { 100, 224, 463, 13},
[224] = { 125, 225, 465, 13},
[225] = { 150, 226, 465, 13},
[226] = { 200, 227, 462, 13},
[227] = { 250, 228, 462, 13},
[228] = { 300, 229, 465, 13},
[229] = { 350, 230, 466, 13},
[230] = { 400, 231, 466, 13},
[231] = { 450, 232, 465, 13},
[232] = { 500, 233, 466, 13},
[233] = { 600, 234, 467, 13},
-------- MADARA -----------
[250] = { 25, 251, 476, 13},
[251] = { 50, 252, 477, 13},
[252] = { 75, 253, 725, 13},
[253] = { 100, 254, 478, 13},
[254] = { 125, 255, 479, 13},
[255] = { 150, 256, 482, 13},
[256] = { 200, 257, 480, 13},
[257] = { 250, 258, 481, 13},
[258] = { 300, 259, 483, 13},
[259] = { 350, 260, 485, 13},
[260] = { 400, 261, 484, 13},
[261] = { 450, 262, 726, 13},
[262] = { 500, 263, 486, 13},
[263] = { 600, 264, 722, 13},
-------- MINATO -----------
[265] = { 25, 266, 559, 13},
[266] = { 50, 267, 560, 13},
[267] = { 75, 268, 561, 13},
[268] = { 100, 269, 562, 13},
[269] = { 125, 270, 563, 13},
[270] = { 150, 271, 564, 13},
[271] = { 200, 272, 565, 13},
[272] = { 250, 273, 596, 13},
[273] = { 300, 274, 598, 13},
[274] = { 350, 275, 599, 13},
[275] = { 400, 276, 707, 13},
[276] = { 450, 277, 708, 13},
[277] = { 500, 278, 709, 13},
[278] = { 600, 279, 710, 13},
-------- HASHIRAMA -----------
[280] = { 25, 281, 750, 13},
[281] = { 50, 282, 750, 13},
[282] = { 75, 283, 751, 13},
[283] = { 100, 284, 752, 13},
[284] = { 125, 285, 786, 13},
[285] = { 150, 286, 753, 13},
[286] = { 200, 287, 754, 13},
[287] = { 250, 288, 755, 13},
[288] = { 300, 289, 756, 13},
[289] = { 350, 290, 757, 13},
[290] = { 400, 291, 758, 13},
[291] = { 450, 292, 759, 13},
[292] = { 500, 293, 760, 13},
[293] = { 600, 294, 761, 13},
-------- TOBIRAMA -----------
[295] = { 25, 296, 227, 13},
[296] = { 50, 297, 227, 13},
[297] = { 75, 298, 230, 13},
[298] = { 100, 299, 230, 13},
[299] = { 125, 300, 788, 13},
[300] = { 150, 301, 788, 13},
[301] = { 200, 302, 789, 13},
[302] = { 250, 303, 789, 13},
[303] = { 300, 304, 344, 13},
[304] = { 350, 305, 790, 13},
[305] = { 400, 306, 791, 13},
[306] = { 450, 307, 792, 13},
[307] = { 500, 308, 793, 13},
[308] = { 600, 309, 794, 13},
---------- OBITO -----------
[310] = { 25, 311, 399, 13},
[311] = { 50, 312, 400, 13},
[312] = { 75, 313, 401, 13},
[313] = { 100, 314, 402, 13},
[314] = { 125, 315, 403, 13},
[315] = { 150, 316, 404, 13},
[316] = { 200, 317, 405, 13},
[317] = { 250, 318, 413, 13},
[318] = { 300, 319, 452, 13},
[319] = { 350, 320, 460, 13},
[320] = { 400, 321, 461, 13},
[321] = { 450, 322, 524, 13},
[322] = { 500, 323, 525, 13},
[323] = { 600, 324, 526, 13},
---------- KANKURO -----------
[325] = { 25, 326, 619, 13},
[326] = { 50, 327, 620, 13},
[327] = { 75, 328, 621, 13},
[328] = { 100, 329, 600, 13},
[329] = { 125, 330, 603, 13},
[330] = { 150, 331, 602, 13},
[331] = { 200, 332, 623, 13},
[332] = { 250, 333, 624, 13},
[333] = { 300, 334, 548, 13},
[334] = { 350, 335, 637, 13},
[335] = { 400, 336, 625, 13},
[336] = { 450, 337, 625, 13},
[337] = { 500, 338, 662, 13},
[338] = { 600, 339, 663, 13},
---------- GAARA -----------
[340] = { 25, 341, 52, 13},
[341] = { 50, 342, 53, 13},
[342] = { 75, 343, 67, 13},
[343] = { 100, 344, 72, 13},
[344] = { 125, 345, 158, 13},
[345] = { 150, 346, 62, 13},
[346] = { 200, 347, 189, 13},
[347] = { 250, 348, 61, 13},
[348] = { 300, 349, 188, 13},
[349] = { 350, 350, 305, 13},
[350] = { 400, 351, 306, 13},
[351] = { 450, 352, 58, 13},
[352] = { 500, 353, 187, 13},
[353] = { 600, 354, 508, 13},
---------- KABUTO -----------
[360] = { 25, 361, 800, 13},
[361] = { 50, 362, 801, 13},
[362] = { 75, 363, 802, 13},
[363] = { 100, 364, 803, 13},
[364] = { 125, 365, 804, 13},
[365] = { 150, 366, 805, 13},
[366] = { 200, 367, 806, 13},
[367] = { 250, 368, 807, 13},
[368] = { 300, 369, 808, 13},
[369] = { 350, 370, 809, 13},
[370] = { 400, 371, 810, 13},
[371] = { 450, 372, 812, 13},
[372] = { 500, 373, 812, 13},
[373] = { 600, 374, 813, 13},
---------- JIRAYA -----------
[375] = { 25, 376, 815, 13},
[376] = { 50, 377, 816, 13},
[377] = { 75, 378, 817, 13},
[378] = { 100, 379, 819, 13},
[379] = { 125, 380, 820, 13},
[380] = { 150, 381, 818, 13},
[381] = { 200, 382, 821, 13},
[382] = { 250, 383, 823, 13},
[383] = { 300, 384, 822, 13},
[384] = { 350, 385, 824, 13},
[385] = { 400, 386, 825, 13},
[386] = { 450, 387, 826, 13},
[387] = { 500, 388, 827, 13},
[388] = { 600, 389, 828, 13},
---------- TSUNADE -----------
[390] = { 25, 391, 587, 13},
[391] = { 50, 392, 587, 13},
[392] = { 75, 393, 586, 13},
[393] = { 100, 394, 586, 13},
[394] = { 125, 395, 588, 13},
[395] = { 150, 396, 588, 13},
[396] = { 200, 397, 589, 13},
[397] = { 250, 398, 592, 13},
[398] = { 300, 399, 593, 13},
[399] = { 350, 400, 590, 13},
[400] = { 400, 401, 591, 13},
[401] = { 450, 402, 222, 13},
[402] = { 500, 403, 594, 13},
[403] = { 600, 404, 595, 13},
---------- ANBU -----------
[405] = { 25, 406, 123, 13},
[406] = { 50, 407, 123, 13},
[407] = { 75, 408, 16, 13},
[408] = { 100, 409, 16, 13},
[409] = { 125, 410, 463, 13},
[410] = { 150, 411, 463, 13},
[411] = { 200, 412, 147, 13},
[412] = { 250, 413, 147, 13},
[413] = { 300, 414, 148, 13},
[414] = { 350, 415, 148, 13},
[415] = { 400, 416, 159, 13},
[416] = { 450, 417, 163, 13},
[417] = { 500, 418, 273, 13},
[418] = { 600, 419, 546, 13},
--------- HINATA -----------
[420] = {25, 421, 4, 13},
[421] = {50, 422, 318, 13},
[422] = {100, 423, 333, 13},
[423] = {150, 424, 319, 13},
[424] = {200, 425, 370, 13},
[425] = {250, 426, 370, 13},
[426] = {300, 427, 377, 13},
[427] = {350, 428, 378, 13},
[428] = {400, 429, 380, 13},
[429] = {450, 430, 381, 13},
[430] = {500, 431, 346, 13},
[431] = {550, 432, 509, 13},
[432] = {600, 433, 510, 13}
}
function onSay(cid, words, param, channel)
local from,to = {x=1001, y=705, z=7},{x=1031, y=737, z=7} -- come�o e final do mapa
local from2,to2 = {x=1011, y=705, z=6},{x=1031, y=738, z=6} -- come�o e final do mapa
local from3,to3 = {x=1012, y=706, z=5},{x=1032, y=739, z=5} -- come�o e final do mapa
local from4,to4 = {x=985, y=598, z=7},{x=1044, y=652, z=7} -- come�o e final do mapa
local from5,to5 = {x=986, y=615, z=6},{x=1039, y=647, z=7} -- come�o e final do mapa
local from6,to6 = {x=990, y=616, z=5},{x=1040, y=647, z=5} -- come�o e final do mapa
if isInRange(getCreaturePosition(cid), from, to) or isInRange(getCreaturePosition(cid), from2, to2) or isInRange(getCreaturePosition(cid), from3, to3) or isInRange(getCreaturePosition(cid), from4, to4) or isInRange(getCreaturePosition(cid), from5, to5) or isInRange(getCreaturePosition(cid), from6, to6) then
doPlayerSendCancel(cid, "Voc� n�o pode se Transformar nesta �rea!") return true
end
local voc = config[getPlayerVocation(cid)]
if voc then
if getPlayerLevel(cid) >= voc[1] then
doPlayerSetVocation(cid, voc[2])
local outfit = {lookType = voc[3]}
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), voc[4])
else
doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Voc� precisa estar no level " .. voc[1] .. " para transformar.")
end
else
doPlayerSendCancel(cid, "Voc� n�o pode se Transformar!")
end
return true
end