
function onAdvance(cid, skill, oldLevel, newLevel)
wokacje = {
    [1] = { 25, 37, 5},---[wokacja],{lvl,nowa voc,nowy looktype}
   [37] = { 50, 38, 1},
   [38] = { 100, 39, 3}, --KIBA TRANSFORM CO LVL
   [39] = { 500, 38, 3},--- podpucha zeby nie bylo errorow, nie osiagalny lvl :D
   
   [2] = {500, 42, 10},--LEE NA RAZIE ROBIMY BEZ TRANSOW
   [42] = {500, 43, 8},
   [43] = {500, 44, 8},
   
   
   [3] = {25, 10, 19},--CHOJI
   [10] = {50, 11, 20},
   [11] = {100, 12, 22},
   [12] = {500, 12, 22},
   
   [4] = {25, 15, 58},--SHINO
   [15] = {50, 16, 56},
   [16] = {100, 17, 55},
   [17] = {500, 17, 55},
   
   [5] = {25, 20, 52},--SHIKAMARU
   [20] = {50, 21, 53},
   [21] = {100, 22, 51},
   [22] = {500, 22, 51},
   
   [6] = {25, 25, 34},--NEJI
   [25] = {50, 26, 97},
   [26] = {100, 27, 99},
   [27] = {500, 27, 99},
   
   [7] = {20, 30, 61},--UChiha
   [30] = {40, 31, 59},
   [31] = {60, 32, 62},
   [32] = {80, 33, 64},
   [33] = {100, 34, 66},
   [34] = {120, 35, 112},
   [35] = {500, 35, 112},
   
   
   
   
   }
local voc = wokacje[getPlayerVocation(cid)]
if(skill == 8 and newLevel >= voc[1] and getPlayerStorageValue(cid, 93918) < 1) then
if voc then
local outfit = {lookType = voc[3]}
doPlayerSetVocation(cid, voc[2])
doSetCreatureOutfit(cid, outfit, -1) 
doCreatureChangeOutfit(cid, outfit)
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Congratulation gain a new dmg and new outfit")
setPlayerStorageValue(cid, 95918, 1)
end
return true
end
end
