local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local temp = {
exhausted = 4,
}

local confg = {
level = 1,
chakra = 65
}

local buff = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(buff, CONDITION_PARAM_TICKS, -1)
setConditionParam(buff, CONDITION_PARAM_SKILL_SHIELD, 15)
setConditionParam(buff, CONDITION_PARAM_SKILL_FIST, 5)-- evaluation


function onCastSpell(cid, var)
	
	if checkJutsu(cid, "Kagemane") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if checkCmd(cid, "rest") then
		return doPlayerSendCancel(cid, "you cannot use jutsu while you are resting.")
	end
	if checkJutsu(cid, "Nikudan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu.")
	end
	if checkJutsu(cid, "Hari") then
		return doPlayerSendCancel(cid, "you cannot use jutsu.")
	end
	if checkJutsu(cid, "Tongarashigan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	
	if getPlayerStorageValue(cid, sto_gen[1]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")		
	end	
		if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
	local info = {
		speed = 100,
	}

	if not isCreature(cid) then
		return true
	end


	if isPlayer(cid) and getPlayerStorageValue(cid, sto_sensha[6]) > 0 then
       	removeChakraLife(cid, - confg.chakra)
		iniBaika(cid)
		doAddCondition(cid, buff)
		addEvent(doSendMagicEffect, 550, getCreaturePosition(cid),111)
		setPlayerStorageValue(cid, sto_sensha[6], 0)
	    doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid) -info.speed)
		removeChakra(cid, 1, 3, sto_sensha[6], "sharingan")
	else
	  doRemoveCondition(cid, CONDITION_ATTRIBUTES)
		endBaika(cid)
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid))
		setPlayerStorageValue(cid, sto_sensha[6], 1)
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
		exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
	end
end
	
	