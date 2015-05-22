function onSaga(cid, target)
local bomb = {x=20, y=20, z=7, stackpos=253}



if isPlayer(target) then


doTeleportThing(cid, bomb)
end
return true
end