
function onAdvance(cid, skill, oldLevel, newLevel)
wokacje = {
   [1] = { 50, 37, 5, 500,700},---[wokacja],{lvl,nowa voc,nowy looktype, hp, mana}
   [37] = { 100, 38, 1,1000,1400},
   [38] = { 150, 39, 3,1500,2100}, --KIBA TRANSFORM CO LVL
   [39] = { 500, 39, 3},--- podpucha zeby nie bylo errorow, nie osiagalny lvl :D
   
   [2] = {50, 42, 12,800,400},--LEE NA RAZIE ROBIMY BEZ TRANSOW
   [42] = {100, 43, 12,1600,800},
   [43] = {150, 44, 12,2400,1200},
   [44] = {1500, 44, 12,1050,550},
   
   
   [3] = {50, 10, 19,450,750},--CHOJI
   [10] = {100, 11, 20,900,1500},
   [11] = {150, 12, 22,1350,2200},
   [12] = {500, 12, 22},
   
   [4] = {50, 15, 56,500,700},--SHINO
   [15] = {100, 16, 58,1000,1400},
   [16] = {150, 17, 55,1500,2800},
   [17] = {500, 17, 55},
   
   [5] = {50, 20, 52, 400,800},--SHIKAMARU
   [20] = {100, 21, 53,800,600},
   [21] = {150, 22, 54,1200,2400},
   [22] = {500, 22, 54},
   
   [6] = {50, 25, 34,600,600},--NEJI
   [25] = {100, 26, 97,1200,1200},
   [26] = {150, 27, 99,1800,1800},
   [27] = {500, 27, 99},
   
   [7] = {50, 30, 61,500,700},--UChiha
   [30] = {100, 31, 59,1000,1400},
   [31] = {150, 32, 62,1500,2100},
   [32] = {500, 33, 64,1500,2100},
   [33] = {2000, 34, 66,150,250},
   [34] = {5000, 35, 112,550,950},
   [35] = {5000, 35, 112},
   
   [8] = {50, 48, 14,700,500},--Sakura
   [48] = {100, 49, 15,1400,1000},
   [49] = {150, 50, 25,2100,1500},
   [50] = {2000, 51, 7},
   [51] = {500, 51, 7},
   [52] = {500, 52, 7},
   [53] = {500, 53, 7},
   
   
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
doCreatureAddHealth(cid, voc[4])
doCreatureAddMana(cid, voc[5])
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYAREA)
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Congratulation gain a new dmg and new outfit")
setPlayerStorageValue(cid, 95918, 1)
end
return true
end
end
