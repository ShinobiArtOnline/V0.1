local function finishJutsu(cid)   
if not isCreature(cid) then return true end
   mayNotMove(cid, false)
end

local confg = {
chakra = 8,
}
local function move(cid, target, playerpos, targetpos, times)
if playerdir ~= getCreatureLookDirection(cid) then
doCreatureSetLookDirection(target, getCreatureLookDirection(cid))
end

if playerpos ~= getCreaturePosition(cid) then
if playerpos.z == getCreaturePosition(cid).z then
local ntpos = getCreaturePosition(cid)
local x,y,z = ntpos.x-playerpos.x,ntpos.y-playerpos.y,ntpos.z-playerpos.z
ntpos = getCreaturePosition(target)
ntpos.x, ntpos.y, ntpos.z = ntpos.x+x,ntpos.y+y,ntpos.z+z
if queryTileAddThing(target, ntpos) == RETURNVALUE_NOERROR and getCreaturePosition(cid).z == getCreaturePosition(target).z then
doMoveCreature(target, getCreatureLookDirection(cid))
end
end
end
local playerpos, targetpos = getCreaturePosition(cid), getCreaturePosition(target)
local times = times+1
if times < 100 then
addEvent(move, 1, cid, target, playerpos, targetpos, times)
else
doCreatureSetNoMove(target, 0)
doSendDistanceShoot(targetpos, playerpos, 31)
doSendAnimatedText(targetpos, "FREE!", math.random(1,255))
doPlayerSendCancel(cid, "You have lost control of "..getCreatureName(target)..".")
if (isPlayer(target)) then
doPlayerSendCancel(cid, "You've been freed from "..getPlayerName(cid).."'s Shadow Imitation Technique.")
setPlayerStorageValue(target, 14755, -1)
end
end
end


function onCastSpell(cid, var)


	if(isCreature(cid)) then
		if getPlayerStorageValue(cid, STORAGE_SHADOW_1) == 1 then
   			setPlayerStorageValue(cid, STORAGE_SHADOW_1, 0)
   			setPlayerStorageValue(cid, STORAGE_SHADOW_2, 0)
   			setPlayerStorageValue(cid, STORAGE_SHADOW_3, 0)
   			doPlayerSetNoMove(cid, false)
   			return doPlayerSendCancel(cid, "Kagemane stopped.")
	end

	
	if checkJutsu(cid, "Kagemane") then
		return doPlayerSendCancel(cid, "You are already doing kagemane no jutsu.")
	end

	if getPlayerStorageValue(cid, STORAGE_KAGEMANE_TRAPED_QTY) > 0 then
  		return doPlayerSendCancel(cid, "You are already doing kagemane no jutsu.")
	end
	local target = getCreatureTarget(cid)
	if (isPlayer(target)) or (isMonster(target)) then
	if getPlayerStorageValue(cid, 14755) == -1 then
	doCreatureSetNoMove(target, 1)
	doPlayerSendCancel(cid, "You have possessed "..getCreatureName(target)..".")
	if (isPlayer(target)) then
	doPlayerSendCancel(target, "You have been possessed by "..getPlayerName(cid)..".")
	setPlayerStorageValue(target, 14755, 1)
	end
	local playerpos,playerdir,targetpos = getCreaturePosition(cid), getPlayerLookDir(cid), getCreaturePosition(target)
	doSendDistanceShoot(playerpos, targetpos, 31)
	if getTileInfo(getCreaturePosition(cid)).protection then return doPlayerSendCancel(cid, "You use that from here.") end  
	local maxShadowDist = 10
	setPlayerStorageValue(cid, STORAGE_SHADOW_DIST, maxShadowDist)

	setPlayerStorageValue(cid, STORAGE_MAX_SHADOW_DIST, maxShadowDist)
	setPlayerStorageValue(cid, 10176, 1)
	removeChakraLife(cid, - confg.chakra)
	mayNotMove(cid, true)
	setPlayerStorageValue(cid, 9000, 'doing jutsu')
	doCreatureSay(cid, 'Kagemane no Jutsu!', TALKTYPE_ORANGE_1) 
	createKagemane(cid, getCreaturePosition(cid), 1)
	local times = 3
    addEvent(move, 1000, cid, target, playerpos, targetpos, times)
	end
	end
	end
	return TRUE
end