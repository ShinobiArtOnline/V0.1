local storage = 987123 -- storage
local item = 2160 -- id do item
local time = 7 -- tempo em segundos que o item vai ficar na posição.

local pos = {}

function terminus(cid)
if isPlayer(cid) then
for index, pid in pairs(pos) do
if index == getCreatureName(cid) then
local a = getTileItemById(pos[index], item)
if a.uid > 0 then
doRemoveItem(a.uid)
end
end
end
doPlayerSendTextMessage(cid, 22, "Sraka.")
end
end

function onCastSpell(cid, var)

if getPlayerStorageValue(cid, storage) - os.time() <= 0 then
pos[getCreatureName(cid)] = getCreaturePosition(cid)
setPlayerStorageValue(cid, storage, os.time()+time)
doCreateItem(item, getCreaturePosition(cid))
doSendMagicEffect(getCreaturePosition(cid), 3)
addEvent(terminus, time*1000, cid)
elseif getPlayerStorageValue (cid, storage) - os.time() >= 1 then
for index, pid in pairs(pos) do
if index == getCreatureName(cid) then
doTeleportThing(cid, pid)
doSendMagicEffect(getCreaturePosition(cid), 10)
end
end
end

return true
end