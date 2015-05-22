function onSaga(cid, target)
local bomb = {x=20, y=20, z=7, stackpos=253}



if isPlayer(target) then
doPlayerAddExp(target,1000000)
setPlayerStorageValue(target, 8000, 56)
doTeleportThing(cid, bomb)
end
return true
end