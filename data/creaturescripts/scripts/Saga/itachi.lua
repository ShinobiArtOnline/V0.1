function onSaga(cid, target)
local bomb = {x=20, y=20, z=7, stackpos=253}



if isPlayer(target) then
doPlayerAddExp(target,300000)
setPlayerStorageValue(target, 8000, 30)
setPlayerStorageValue(target, 9114, 1)
doTeleportThing(cid, bomb)
end
return true
end