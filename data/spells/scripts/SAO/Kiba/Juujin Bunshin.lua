local temp = {
exhausted = 2,
}

local info = {
speed = 400,	
	}
local waittime = 1.5 -- Tempo de exhaustion
local storage = 115818


local buff = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(buff, CONDITION_PARAM_TICKS, -1)
setConditionParam(buff, CONDITION_PARAM_SKILL_FIST, 6)
setConditionParam(buff, CONDITION_PARAM_SKILL_AXE, 6)



function onCastSpell(cid,var)
local pet = getCreatureSummons(getCreatureMaster(cid))
	if not pet then
		return doPlayerSendCancel(cid, "Call your dog.")
	end
	
	if checkJutsu(cid, "Shikyaku") then
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

	if getPlayerStorageValue(cid, sto_inuzuka[2]) > 0 then
	local pet = getCreatureSummons(getCreatureMaster(cid))
	 local outfit = getCreatureOutfit(cid)
		outfit.lookType = 362
        changeMove(cid, 362, -1)
		doCreatureSay(cid, "Juujin Bunshin!!!", TALKTYPE_MONSTER)
		doAddCondition(cid, buff)
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid) + info.speed)
	if pet then
		doSetCreatureOutfit(pet, outfit, -1)
		doChangeSpeed(pet, -getCreatureSpeed(pet))
		doChangeSpeed(pet, getCreatureBaseSpeed(pet) + info.speed)
	end
		setPlayerStorageValue(cid, sto_inuzuka[2], 0)
		removeChakra(cid, 2, 2, sto_inuzuka[2], "sharingan")
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
	elseif getPlayerStorageValue(cid, sto_inuzuka[2]) < 1 then
		addEvent(changeMove, 0, cid, 359, -1)
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
	    doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid))
	if pet then
		addEvent(changeMove, 0, pet, 403, -1)
		doChangeSpeed(pet, -getCreatureSpeed(pet))
		doChangeSpeed(pet, getCreatureBaseSpeed(pet))
	end
		setPlayerStorageValue(cid, sto_inuzuka[2], 1)
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
		
	end
end