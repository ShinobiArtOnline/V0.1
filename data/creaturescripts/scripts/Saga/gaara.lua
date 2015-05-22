function onSaga(cid, target)
local bomb = {x=20, y=20, z=7, stackpos=253}
doSummonCreature("Gaara2", getPlayerPosition(target))


if isPlayer(target) then
doPlayerAddExp(target,20)
doTeleportThing(cid, bomb)
end
return true
end