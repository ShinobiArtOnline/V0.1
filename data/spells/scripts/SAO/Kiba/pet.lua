function onCastSpell(cid, var)
local from,to = {x=962, y=885, z=7},{x=973, y=892, z=7} -- começo e final do mapa
local from2,to2 = {x=979, y=901, z=7},{x=991, y=905, z=7} -- começo e final do mapa
local playerpos = getPlayerPosition(cid)
local cloth = getCreatureOutfit(cid)
local health = getCreatureHealth(cid)
local maxhealth = getCreatureMaxHealth(cid)
local MaximoSummon = 1 --- Maximo de Monstros Sumonados!! No Caso So Posso Sumonar 5 Clones

local summons = getCreatureSummons(cid)
if isInRange(getCreaturePosition(cid), from, to) or isInRange(getCreaturePosition(cid), from2, to2) then
doPlayerSendCancel(cid, "Ssij mi jaja") return true
end
if(table.maxn(summons) < MaximoSummon) and getPlayerStorageValue(cid, sto_inuzuka[2]) == 0 then -- no summons
local Fuuton = doCreateMonster("Summon Karasu", playerpos)
setPlayerStorageValue(cid, sto_inuzuka[2], 1)
doConvinceCreature(cid, Fuuton)
setCreatureMaxHealth(Fuuton, 5000)
doCreatureAddHealth(Fuuton, 5000)
return TRUE
end
end