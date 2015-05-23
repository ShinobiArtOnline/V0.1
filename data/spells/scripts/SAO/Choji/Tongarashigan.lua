local temp = {
exhausted = 2,
}
	local buff = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(buff, CONDITION_PARAM_TICKS, -1)
setConditionParam(buff, CONDITION_PARAM_SKILL_FIST, 12)
setConditionParam(buff, CONDITION_PARAM_SKILL_SHIELD, 12)


function onCastSpell(cid,var)
local info = {
		mana = 1,
		speed = 300,
	}

	
	if checkCmd(cid, "rest") then
		return doPlayerSendCancel(cid, "you cannot use jutsu while you are resting.")
	end
	if checkCmd(cid, "mold") then
		return doPlayerSendCancel(cid, "you cannot use jutsu while you are mold chakra")
	end
	if checkJutsu(cid, "Nikudan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if checkJutsu(cid, "Karegan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if checkJutsu(cid, "Horengan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if checkJutsu(cid, "Hari") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if checkJutsu(cid, "Chou Baika") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end	
	if checkJutsu(cid, "Mizudan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if checkJutsu(cid, "Kagemane") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if getPlayerStorageValue(cid, sto_gen[1]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")		
	end
	
------------------------------------------------------------------------
	if not isCreature(cid) then
		return true
	end

		
		
	if getPlayerStorageValue(cid, sto_sensha[4]) > 0 then
		doSendMagicEffect(getCreaturePosition(cid),106)
		doCreatureSay(cid, "Tongarashigan", TALKTYPE_MONSTER)
		setPlayerStorageValue(cid, sto_sensha[4], 0)
		removeChakra(cid, 3, 2, sto_sensha[4], "sharingan")
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		doAddCondition(cid, buff)
		doChangeSpeed(cid, getCreatureBaseSpeed(cid) + info.speed)
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
	else
		
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid))
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
		setPlayerStorageValue(cid, sto_sensha[4], 1)
	
		
	end
end