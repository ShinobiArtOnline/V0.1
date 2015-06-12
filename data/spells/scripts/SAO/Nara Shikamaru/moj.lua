local function move(cid, target, playerpos, targetpos, times)
if playerdir ~= getCreatureLookDirection(cid) then
doCreatureSetLookDirection(target, getCreatureLookDirection(cid))
end

if playerpos ~= getCreaturePosition(cid) then
if playerpos.z == getCreaturePosition(cid).z then
local newtargetpos = getCreaturePosition(cid)
local x = newtargetpos.x-playerpos.x
local y = newtargetpos.y-playerpos.y
local z = newtargetpos.z-playerpos.z
newtargetpos = getCreaturePosition(target)
newtargetpos.x = newtargetpos.x+x
newtargetpos.y = newtargetpos.y+y
newtargetpos.z = newtargetpos.z+z 
if queryTileAddThing(target, newtargetpos) == RETURNVALUE_NOERROR and getCreaturePosition(cid).z == getCreaturePosition(target).z then
doMoveCreature(target, getCreatureLookDirection(cid))
end
end
end
local playerpos = getCreaturePosition(cid)
local targetpos = getCreaturePosition(target)
local times = times+1
if times < 10 then
addEvent(move, 1000, cid, target, playerpos, targetpos, times)
doSendMagicEffect(getCreaturePosition(target), CONST_ME_SMALLCLOUDS)
else
doCreatureSetNoMove(target, 0)
doSendDistanceShoot(targetpos, playerpos, 31)
doSendAnimatedText(targetpos, "FREE!", math.random(1,255))
doChangeSpeed(target, getCreatureBaseSpeed(target))
doPlayerSendCancel(target, "You've been freed from "..getPlayerName(cid).."'s Shadow Possesion Jutsu.")
setPlayerStorageValue(target, 14755, -1)
end
end

function onCastSpell(cid, var)
local target = getCreatureTarget(cid) 
if isPlayer(target) == TRUE then
if getPlayerStorageValue(target, 14755) == -1 then
doCreatureSetNoMove(target, 1)
doChangeSpeed(target, getCreatureSpeed(cid))
doPlayerSendCancel(target, "You have been possessed by "..getPlayerName(cid)..".")
doSendAnimatedText(getCreaturePosition(target), "POSSESSED!", math.random(1,255))
local playerpos,playerdir,targetpos = getCreaturePosition(cid), getPlayerLookDir(cid), getCreaturePosition(target)
doSendDistanceShoot(playerpos, targetpos, 31)
local times = 1
addEvent(move, 1000, cid, target, playerpos, targetpos, times)
setPlayerStorageValue(target, 14755, 1)
else
doPlayerSendCancel(cid, "Your shadow possession jutsu isn't worn out yet.")
end
end
end