local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

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

	if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
		
	if getPlayerStorageValue(cid, sto_inuzuka[1]) > 0 then
		doAddCondition(cid, buff)
		addEvent(Susano, 400, cid, 400)
        addEvent(changeMove, 0, cid, 112, -1)
		doCreatureSay(cid, "SUSANOO!!!", TALKTYPE_MONSTER)
		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 25 then
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid) + info.speed)
		elseif getPlayerLevel(cid) >= 25 and getPlayerLevel(cid) < 50 then
				doChangeSpeed(cid, -getCreatureSpeed(cid))
				doChangeSpeed(cid, getCreatureBaseSpeed(cid) + 220)
				elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
				doChangeSpeed(cid, -getCreatureSpeed(cid))
				doChangeSpeed(cid, getCreatureBaseSpeed(cid) + 250)
				elseif getPlayerLevel(cid) > 100 and getPlayerLevel(cid) < 500 then
				doChangeSpeed(cid, -getCreatureSpeed(cid))
				doChangeSpeed(cid, getCreatureBaseSpeed(cid) + 280)
			  end
		setPlayerStorageValue(cid, sto_inuzuka[1], 0)
		removeChakra(cid, 10, 1, sto_inuzuka[1], "sharingan")
	elseif getPlayerStorageValue(cid, sto_inuzuka[1]) < 1 then
				if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 25 then
				addEvent(changeMove, 0, cid, 4, -1)
				setPlayerStorageValue(cid, STORAGE_DEFENSE, 0)
				elseif getPlayerLevel(cid) >= 25 and getPlayerLevel(cid) < 50 then
				addEvent(changeMove, 0, cid, 5, -1)
				setPlayerStorageValue(cid, STORAGE_DEFENSE, 0)
				elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
				addEvent(changeMove, 0, cid, 1, -1)
				setPlayerStorageValue(cid, STORAGE_DEFENSE, 0)
				elseif getPlayerLevel(cid) > 100 and getPlayerLevel(cid) < 500 then
				addEvent(changeMove, 0, cid, 34, -1)
				setPlayerStorageValue(cid, STORAGE_DEFENSE, 0)
				setPlayerStorageValue(cid, STORAGE_DEFENSE, 0)
			  end
		
		setPlayerStorageValue(cid, STORAGE_DEFENSE, 0)
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
	    doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid))
		setPlayerStorageValue(cid, sto_inuzuka[1], 1)
		setPlayerStorageValue(cid, STORAGE_DEFENSE, 0)
		
		exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
	end
end