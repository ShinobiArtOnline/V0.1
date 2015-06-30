local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local temp = {
exhausted = 2,
}
	
local buff = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(buff, CONDITION_PARAM_TICKS, -1)
setConditionParam(buff, CONDITION_PARAM_SKILL_FIST, 5)

setConditionParam(buff, CONDITION_PARAM_SKILL_SHIELD, 5)

function onCastSpell(cid)
    if not isCreature(cid) then
		return true
	end
	if exhaustion.check(cid, storage) then
			doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
-----[Restrições]-----
	

	if checkJutsu(cid, "Kagemane") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if getPlayerStorageValue(cid, sto_gen[1]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")		
	end
-----[Restrições]-----
	if getPlayerStorageValue(cid, sto_byakugan[1]) > 0 then
		doAddCondition(cid, buff)
		doCreatureSay(cid, "Byakugan!", TALKTYPE_MONSTER)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Byakugan: Activated!")
		actionMove(cid, 376, 300)
		noMove(cid, 500)
		setPlayerStorageValue(cid, 9997, 1)
		setPlayerStorageValue(cid, sto_byakugan[1], 0)
		setPlayerStorageValue(cid, sto_byakugan[6], 0)
		removeChakra(cid, 5, 2, sto_byakugan[1], "sharingan")
	
		
	elseif getPlayerStorageValue(cid, sto_byakugan[1]) == 0 then
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
		setPlayerStorageValue(cid, 9997, 0)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Byakugan: Deactivated!")
		setPlayerStorageValue(cid, sto_byakugan[1], 1)
		setPlayerStorageValue(cid, sto_byakugan[4], 1)
------------------------------------------------------------------------------
		setPlayerStorageValue(cid, sto_byakugan[5], 1)
		setPlayerStorageValue(cid, sto_byakugan[6], 1)
		setPlayerStorageValue(cid, sto_byakugan[4], 1)
		setPlayerStorageValue(cid, sto_byakugan[3], 1)
		setPlayerStorageValue(cid, sto_byakugan[2], os.time() + temp.exhausted)
		
	end
	
	exhaustion.set(cid, storage, waittime)
end