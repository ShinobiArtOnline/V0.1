local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

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
	
if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
		
	local info = {
		speed = 500,
	}
	

	if not isCreature(cid) then
		return true
	end
	local storage = 1111
	local storage2 = 11112
	local summons = getCreatureSummons(cid)				
	if(table.maxn(summons) <= 0) and getPlayerStorageValue(cid, storage2) < 1 then
		doPlayerSendCancel(cid, "Call your dog.")
		setPlayerStorageValue(cid, storage, 0)
		return false
		else
		setPlayerStorageValue(cid, storage, 1)
	end
	if isPlayer(cid) and getPlayerStorageValue(cid, sto_inuzuka[3]) > 0  and getPlayerStorageValue(cid, storage) > 0 then
	 if getPlayerLevel(cid) >= 1 then
		for _, pid in ipairs(getCreatureSummons(cid)) do
		doRemoveCreature(pid)
		end
       	removeChakraLife(cid, - confg.chakra)
		addEvent(doCreatureSay, 200, cid, "Juujin Konbi Henge..", TALKTYPE_MONSTER)
		addEvent(doCreatureSay, 600, cid, "SOUTOUROU!!!", TALKTYPE_MONSTER)
		addEvent(changeMove, 500, cid, 363, -1)
		doAddCondition(cid, buff)
		addEvent(doSendMagicEffect, 500, getCreaturePosition(cid),111)
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid) + info.speed)
		setPlayerStorageValue(cid, storage2, 1)
		setPlayerStorageValue(cid, storage, 1)
		setPlayerStorageValue(cid, sto_inuzuka[3], 0)
		removeChakra(cid, 4, 2, sto_inuzuka[3], "sharingan")
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
		else
		doPlayerSendCancel(cid, "You don't have enough level.")
		end
		elseif isPlayer(cid) and getPlayerStorageValue(cid, sto_inuzuka[3]) == 0 then
				if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 25 then
				addEvent(changeMove, 0, cid, 4, -1)
				elseif getPlayerLevel(cid) >= 25 and getPlayerLevel(cid) < 50 then
				addEvent(changeMove, 0, cid, 5, -1)
				elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
				addEvent(changeMove, 0, cid, 1, -1)
				elseif getPlayerLevel(cid) > 100 and getPlayerLevel(cid) < 500 then
				addEvent(changeMove, 0, cid, 3, -1)
			  end
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
	    doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid))
		setPlayerStorageValue(cid, storage, 0)
		setPlayerStorageValue(cid, storage2, 0)
		setPlayerStorageValue(cid, sto_inuzuka[3], 1)
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
		exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
	end
end
