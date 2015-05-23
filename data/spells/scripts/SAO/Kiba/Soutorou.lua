local temp = {
exhausted = 3,
}

local confg = {
level = 1,
chakra = 100,
}

local buff = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(buff, CONDITION_PARAM_TICKS, -1)
setConditionParam(buff, CONDITION_PARAM_SKILL_FIST, 20)
setConditionParam(buff, CONDITION_PARAM_SKILL_AXE, 20)


function onCastSpell(cid,var)
	
	if getPlayerLevel(cid) < confg.level then
		doPlayerSendCancel(cid, "You need to be atleast level ".. confg.level ..".") 
	return true
	end
	
	if checkJutsu(cid, "Kagemane") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	
	if getPlayerStorageValue(cid, sto_gen[1]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")		
	end
	

	local info = {
		speed = 500,
	}
	

	if not isCreature(cid) then
		return true
	end

	local pet = getCreatureSummons(getCreatureMaster(cid))
	if not pet then
		return doPlayerSendCancel(cid, "Call your dog.")
	end
	if isPlayer(cid) and getPlayerStorageValue(cid, sto_inuzuka[3]) > 0 then
	 if pet then
		doRemoveCreature(pet)
       	removeChakraLife(cid, - confg.chakra)
		addEvent(doCreatureSay, 200, cid, "Juujin Konbi Henge..", TALKTYPE_MONSTER)
		addEvent(doCreatureSay, 600, cid, "SOUTOUROU!!!", TALKTYPE_MONSTER)
		actionMove(cid, 464, 500)
		addEvent(changeMove, 500, cid, 407, -1)
		doAddCondition(cid, buff)
		addEvent(doSendMagicEffect, 500, getCreaturePosition(cid),111)
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid) + info.speed)
		setPlayerStorageValue(cid, sto_inuzuka[3], 0)
		removeChakra(cid, 4, 2, sto_inuzuka[3], "sharingan")
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
		else
		doPlayerSendCancel(cid, "Call your dog.")
		end
	elseif isPlayer(cid) and getPlayerStorageValue(cid, sto_inuzuka[3]) == 0 then
		changeMove(cid, 359, -1)
		
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
	    doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid))
		setPlayerStorageValue(cid, sto_inuzuka[3], 1)
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
	end
end
