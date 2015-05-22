
function onAdvance(cid, skill, oldLevel, newLevel)
wokacje = {
   [1] = { 25, 37, 3},---[wokacja],{lvl,nowa voc,nowy looktype}
   [37] = { 50, 38, 4},
   [2] = {50, 3, 4},
   [3] = {500, 3, 4},--- podpucha zeby nie bylo errorow, nie osiagalny lvl :D
   [5] = {25, 6, 10},
   [6] = {50, 7, 8},
   [7] = {500, 3, 4},
   
   
   
   
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
