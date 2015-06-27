local buff = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(buff, CONDITION_PARAM_TICKS, -1)
setConditionParam(buff, CONDITION_PARAM_SKILL_FIST, 8)


function onCastSpell(cid,var)
	local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818
	
	if checkJutsu(cid, "Nikudan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if checkJutsu(cid, "Hari") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end		
	if checkJutsu(cid, "Horengan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	
	if checkJutsu(cid, "Chou Baika") then
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
	if getPlayerStorageValue(cid, sto_sensha[3]) == 1 then
        doCreatureSay(cid, "Karegan!", TALKTYPE_MONSTER)
		setPlayerStorageValue(cid, sto_sensha[3], 0)
		doAddCondition(cid, buff)
		removeChakra(cid, 2, 2, sto_sensha[3], "sharingan")	
		exhaustion.set(cid, storage, waittime)
	else
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
		setPlayerStorageValue(cid, sto_sensha[3], 1)
		exhaustion.set(cid, storage, waittime)
		
	end
	return doCombat(cid,combat, var)
end
