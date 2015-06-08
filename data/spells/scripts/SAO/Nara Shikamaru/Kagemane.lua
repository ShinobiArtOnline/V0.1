local combat = createCombatObject()
local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 6 * 1000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat, condition)


local function finishJutsu(cid)   
if not isCreature(cid) then return true end
   mayNotMove(cid, false)
end

local confg = {
chakra = 8,
}




function onCastSpell(cid, var)


	if(isCreature(cid)) then
		if getPlayerStorageValue(cid, STORAGE_SHADOW_1) == 1 then
   			setPlayerStorageValue(cid, STORAGE_SHADOW_1, 0)
   			setPlayerStorageValue(cid, STORAGE_SHADOW_2, 0)
   			setPlayerStorageValue(cid, STORAGE_SHADOW_3, 0)
   			doPlayerSetNoMove(cid, false)
			doRemoveCondition(cid, CONDITION_PARALYZE)
   			return doPlayerSendCancel(cid, "Kagemane stopped.")
	end

	
	if checkJutsu(cid, "Kagemane") then
		return doPlayerSendCancel(cid, "You are already doing kagemane no jutsu.")
	end

	if getPlayerStorageValue(cid, STORAGE_KAGEMANE_TRAPED_QTY) > 0 then
  		return doPlayerSendCancel(cid, "You are already doing kagemane no jutsu.")
	end


	if getTileInfo(getCreaturePosition(cid)).protection then return doPlayerSendCancel(cid, "You use that from here.") end  
	local maxShadowDist = 10
	setPlayerStorageValue(cid, STORAGE_SHADOW_DIST, maxShadowDist)
	--doAddCondition(getCreatureTarget(cid), condition)
	doAreaCombatCondition(cid, getCreaturePosition(cid), KAGEMANE, condition , 255)
	setPlayerStorageValue(cid, STORAGE_MAX_SHADOW_DIST, maxShadowDist)
	setPlayerStorageValue(cid, 10176, 1)
	removeChakraLife(cid, - confg.chakra)
	mayNotMove(cid, true)
	setPlayerStorageValue(cid, 9000, 'doing jutsu')
	doCreatureSay(cid, 'Kagemane no Jutsu!', TALKTYPE_ORANGE_1) 
	createKagemane(cid, getCreaturePosition(cid), 1)
    return doCombat(cid, combat, var)
	end
	return TRUE
end