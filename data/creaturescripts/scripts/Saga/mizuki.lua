function onSaga(cid, target)
local bomb = {x=20, y=20, z=7, stackpos=253}



if isPlayer(target) then
doPlayerAddExp(target,10000)
doTeleportThing(cid, bomb)
end
return true
end