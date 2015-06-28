local buff = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(buff, CONDITION_PARAM_TICKS, -1)
setConditionParam(buff, CONDITION_PARAM_SKILL_FIST, 5)
local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818



function onCastSpell(cid,var)

	if checkJutsu(cid, "Nikudan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if checkJutsu(cid, "Karegan") then
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

	
	if getPlayerStorageValue(cid, sto_gen[1]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")		
	end
------------------------------------
if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
		
	if not isCreature(cid) then
		return true
	end
	if getPlayerStorageValue(cid, sto_sensha[2]) == 1 then
        doCreatureSay(cid, "Horengan!", TALKTYPE_MONSTER)
		setPlayerStorageValue(cid, sto_sensha[2], 0)
		doAddCondition(cid, buff)
		removeChakra(cid, 5, 2, sto_sensha[2], "sharingan")
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
	else
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
		setPlayerStorageValue(cid, sto_sensha[2], 1)
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
		exhaustion.set(cid, storage, waittime)
		
	end
	return doCombat(cid,combat, var)
end