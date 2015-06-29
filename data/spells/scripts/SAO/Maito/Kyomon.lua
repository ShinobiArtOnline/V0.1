	local temp = {
	exhausted = 2,
	}
local buff = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(buff, CONDITION_PARAM_TICKS, -1)
setConditionParam(buff, CONDITION_PARAM_SKILL_FIST, 12)
setConditionParam(buff, CONDITION_PARAM_SKILL_AXE, 12)
	
function onCastSpell(cid, var)
local info = {
		mana = 7,
		speed = 270,
	}


	local manaPercent = getCreatureMaxMana(cid) * (info.mana / 100)
	
	
	if checkJutsu(cid, "Kagemane") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if getPlayerStorageValue(cid, sto_gen[1]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")		
	end

	if(getPlayerStorageValue(cid, sto_jutsu[1]) > os.time() and getPlayerStorageValue(cid, sto_jutsu[1]) < 100+os.time()) then
		doPlayerSendTextMessage(cid, 24, "Voce ja esta fazendo um jutsu")
		return true
	end
	
	if getCreatureStorage(cid, sto_hachimon[1]) == 0 then
		doPlayerSendCancel(cid, "You can't use Kyomon while you are using Kaimon.")
		return true
	end
	
	if getCreatureStorage(cid, sto_hachimon[2]) == 0 then
		doPlayerSendCancel(cid, "You can't use Kyomon while you are using Kyumon.")
		return true
	end
	
	if getCreatureStorage(cid, sto_hachimon[3]) == 0 then
		doPlayerSendCancel(cid, "You can't use Kyomon while you are using Seimon.")
		return true
	end
	
	if getCreatureStorage(cid, sto_hachimon[4]) == 0 then
		doPlayerSendCancel(cid, "You can't use Kyomon while you are using Shomon.")
		return true
	end

	if getCreatureStorage(cid, sto_hachimon[5]) == 0 then
		doPlayerSendCancel(cid, "You can't use Kyomon while you are using TOMON.")
		return true
	end
	
	if getCreatureStorage(cid, sto_hachimon[6]) == 0 then
		doPlayerSendCancel(cid, "You can't use Kyomon while you are using Keimon.")
		return true
	end
	
	if getCreatureStorage(cid, sto_hachimon[8]) == 0 then
		doPlayerSendCancel(cid, "You can't use Kyomon while you are using Shimon.")
		return true
	end
	if getPlayerStorageValue(cid, sto_hachimon[7]) > 0 then
		addEvent(doCreatureSay, 100, cid, "Hachimon Tonkou!", TALKTYPE_MONSTER)
		addEvent(doSendAnimatedText, 20, getCreaturePosition(cid), "KAIMON..", COLOR_GREY)
		addEvent(doSendAnimatedText, 40, getCreaturePosition(cid), "KYUMON..", COLOR_YELLOW)
		addEvent(doSendAnimatedText, 60, getCreaturePosition(cid), "SEIMON..", COLOR_LIGHTBLUE)
		addEvent(doSendAnimatedText, 80, getCreaturePosition(cid), "SHOUMON..", COLOR_RED)
		addEvent(doSendAnimatedText, 100, getCreaturePosition(cid), "TOMON..", COLOR_GREEN)
		addEvent(doSendAnimatedText, 120, getCreaturePosition(cid), "KEIMON..", COLOR_WHITE)
		addEvent(doSendAnimatedText, 140, getCreaturePosition(cid), "KYOMON..", COLOR_PINK)
		addEvent(doCreatureSay, 160, cid, "KAI!!!", TALKTYPE_SAY)
		hachimonTonkou3(cid)
		doAddCondition(cid, buff)
		setPlayerStorageValue(cid, sto_hachimon[7], 0)
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid) + info.speed)
		removeStaminaSecondLife(cid, -manaPercent, 1, sto_hachimon[7])
	elseif getPlayerStorageValue(cid, sto_hachimon[7]) == 0 then
		endhachimonTonkou2(cid)
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid))
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
		setPlayerStorageValue(cid, sto_hachimon[7], 1)
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
		end
	end


