
function onAdvance(cid, skill, oldLevel, newLevel)
wokacje = {
   [1] = { 25, 37, 5, 150,100},---[wokacja],{lvl,nowa voc,nowy looktype, hp, mana}
   [37] = { 50, 38, 1,200,250},
   [38] = { 100, 39, 3,1050,750}, --KIBA TRANSFORM CO LVL
   [39] = { 500, 38, 3},--- podpucha zeby nie bylo errorow, nie osiagalny lvl :D
   
   [2] = {500, 42, 10,350,50},--LEE NA RAZIE ROBIMY BEZ TRANSOW
   [42] = {500, 43, 8,400,100},
   [43] = {500, 44, 8,1050,550},
   
   
   [3] = {25, 10, 19,150,150},--CHOJI
   [10] = {50, 11, 20,200,200},
   [11] = {100, 12, 22,950,950},
   [12] = {500, 12, 22},
   
   [4] = {25, 15, 58,100,150},--SHINO
   [15] = {50, 16, 56,150,250},
   [16] = {100, 17, 55,550,1050},
   [17] = {500, 17, 55},
   
   [5] = {25, 20, 52,100,150},--SHIKAMARU
   [20] = {50, 21, 53,150,250},
   [21] = {100, 22, 51,550,1050},
   [22] = {500, 22, 51},
   
   [6] = {25, 25, 34,150,200},--NEJI
   [25] = {50, 26, 97,200,250},
   [26] = {100, 27, 99,850,850},
   [27] = {500, 27, 99},
   
   [7] = {20, 30, 61,100,50},--UChiha
   [30] = {40, 31, 59,150,100},
   [31] = {60, 32, 62,200,150},
   [32] = {80, 33, 64,100,200},
   [33] = {100, 34, 66,150,250},
   [34] = {500, 35, 112,550,950},
   [35] = {500, 35, 112},
   
   
   
   
   }
local voc = wokacje[getPlayerVocation(cid)]
if(skill == 8 and newLevel >= voc[1] and getPlayerStorageValue(cid, 93918) < 1) then
if voc then
local outfit = {lookType = voc[3]}
doPlayerSetVocation(cid, voc[2])
doSetCreatureOutfit(cid, outfit, -1) 
doCreatureChangeOutfit(cid, outfit)
setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+voc[4])
setCreatureMaxMana(cid, getCreatureMaxMana(cid)+voc[5])
--doCreatureAddHealth(cid, voc[4])
--doCreatureAddMana(cid, voc[5])
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Congratulation gain a new dmg and new outfit")
setPlayerStorageValue(cid, 95918, 1)
end
return true
end
end
