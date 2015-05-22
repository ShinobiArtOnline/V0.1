local temp = {
exhausted = 2,
}

local info = {
speed = 200,	
	}
	
	local buff = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(buff, CONDITION_PARAM_TICKS, -1)
setConditionParam(buff, CONDITION_PARAM_SKILL_FIST, 3)
setConditionParam(buff, CONDITION_PARAM_SKILL_AXE, 3)

	
function onCastSpell(cid,var)
	
	if checkJutsu(cid, "Kagemane") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	
	if checkJutsu(cid, "Juujin") then
		return doPlayerSendCancel(cid, "You cannot use jutsu")
	end	
	
	if checkJutsu(cid, "Soutorou") then
		return doPlayerSendCancel(cid, "You cannot use jutsu")
	end
	if getPlayerStorageValue(cid, sto_gen[1]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")		
	end	

	if not isCreature(cid) then
		return true
	end

	if getPlayerStorageValue(cid, sto_inuzuka[1]) > 0 then
		doAddCondition(cid, buff)
        addEvent(changeMove, 0, cid, 362, -1)
		doCreatureSay(cid, "Shikyaku no Jutsu!!!", TALKTYPE_MONSTER)
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid) + info.speed)
		setPlayerStorageValue(cid, sto_inuzuka[1], 0)
		removeChakra(cid, 1, 2, sto_inuzuka[1], "sharingan")
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
	elseif getPlayerStorageValue(cid, sto_inuzuka[1]) < 1 then
		addEvent(changeMove, 0, cid, 1, -1)
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
	    doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid))
		setPlayerStorageValue(cid, sto_inuzuka[1], 1)
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
		
	end
end