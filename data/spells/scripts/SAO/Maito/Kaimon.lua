
local temp = {
	exhausted = 2,
	}
	
	local buff = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(buff, CONDITION_PARAM_TICKS, -1)
setConditionParam(buff, CONDITION_PARAM_SKILL_FIST, 4)
setConditionParam(buff, CONDITION_PARAM_SKILL_AXE, 4)
	
function onCastSpell(cid, var)
local info = {
		mana = 5,
		speed = 210,
	}


	local manaPercent = getCreatureMaxMana(cid) * (info.mana / 100)
	
	if not isCreature(cid) then
		return true
	end
	
	if checkCmd(cid, "rest") then
		return doPlayerSendCancel(cid, "you cannot use jutsu while you are resting.")
	end
	if checkCmd(cid, "mold") then
		return doPlayerSendCancel(cid, "you cannot use jutsu while you are mold chakra")
	end
	if checkJutsu(cid, "Kagemane") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if getPlayerStorageValue(cid, sto_gen[1]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")		
	end
	

	

	if getCreatureStorage(cid, sto_hachimon[2]) == 0 then
		doPlayerSendCancel(cid, "You can't use Kaimon while you are using Kyumon.")
		return true
	end
	
	if getCreatureStorage(cid, sto_hachimon[3]) == 0 then
		doPlayerSendCancel(cid, "You can't use Kaimon while you are using Seimon.")
		return true
	end
	
	if getCreatureStorage(cid, sto_hachimon[4]) == 0 then
		doPlayerSendCancel(cid, "You can't use Kaimon while you are using Shomon.")
		return true
	end
	
	if getCreatureStorage(cid, sto_hachimon[5]) == 0 then
		doPlayerSendCancel(cid, "You can't use Kaimon while you are using Keimon.")
		return true
	end
	
	if getCreatureStorage(cid, sto_hachimon[6]) == 0 then
		doPlayerSendCancel(cid, "You can't use Kaimon while you are using Kaimon.")
		return true
	end

	if getCreatureStorage(cid, sto_hachimon[7]) == 0 then
		doPlayerSendCancel(cid, "You can't use Kaimon while you are using Kyomon.")
		return true
	end
	
	if getCreatureStorage(cid, sto_hachimon[8]) == 0 then
		doPlayerSendCancel(cid, "You can't use Kaimon while you are using Shimon.")
		return true
	end

	
	if getPlayerStorageValue(cid, sto_hachimon[1]) > 0 then
		addEvent(doCreatureSay, 10, cid, "Hachimon Tonkou!", TALKTYPE_MONSTER)
		addEvent(doSendAnimatedText, 40, getCreaturePosition(cid), "KAIMON..", COLOR_GREY)
		addEvent(doCreatureSay, 90, cid, "KAI!", TALKTYPE_SAY)
		hachimonTonkou1(cid)
		doAddCondition(cid, buff)
		setPlayerStorageValue(cid, sto_hachimon[1], 0)
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid) + info.speed)
		removeStaminaSecondLife(cid, -manaPercent, 1, sto_hachimon[1])
	elseif getPlayerStorageValue(cid, sto_hachimon[1]) == 0 then
		endhachimonTonkou1(cid)
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
		setPlayerStorageValue(cid, sto_hachimon[1], 1)
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid))
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
	end
end

