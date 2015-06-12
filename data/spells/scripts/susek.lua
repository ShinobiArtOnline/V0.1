local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local temp = {
exhausted = 2,
}
local times = 1 -- in sec 
local percent =5

local info = {
speed = 200,	
	}
	function mana(cid) 
			local manaa=getCreatureMaxMana(cid)
			local perc= manaa * (35/100)
                doCreatureAddMana(cid,-manaa * (percent/100)) 
                manaling=addEvent(mana,times*1000,cid)
				if getCreatureMana(cid) < perc then
				stopEvent(a)
				stopEvent(manaling)
				doPlayerCastSpell(cid, "susek")
end
            return true 
        end 
function Susano(cid,time)
if not isCreature(cid) then
return true
end
setPlayerStorageValue(cid, 123987, 1)
--addEvent(setPlayerStorageValue, time, cid, getPlayerStorageValue(cid,1239876)+1, 0)
a=addEvent(Susano, time, cid, time)
end

	
	local buff = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(buff, CONDITION_PARAM_TICKS, -1)
setConditionParam(buff, CONDITION_PARAM_SKILL_FIST, 3)
setConditionParam(buff, CONDITION_PARAM_SKILL_AXE, 3)

	
function onCastSpell(cid,var)
local perc =90
local man=getCreatureMaxMana(cid)
local proc=man*(perc/100)
	
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
		
		
		
		
	if getPlayerStorageValue(cid, 123987) == 0 then
		Susano(cid)
		mana(cid)
		
        addEvent(changeMove, 0, cid, 112, -1)
		doCreatureSay(cid, "SUSANOO!!!", TALKTYPE_MONSTER)
		setPlayerStorageValue(cid, 123987, 1)

	elseif getPlayerStorageValue(cid, 123987) == 1 then
	
				if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 20 then
				addEvent(changeMove, 0, cid, 61, -1)
				stopEvent(a)
				stopEvent(manaling)
				setPlayerStorageValue(cid, 123987, 0)
				elseif getPlayerLevel(cid) >= 20 and getPlayerLevel(cid) < 40 then
				addEvent(changeMove, 0, cid, 59, -1)
				stopEvent(a)
				stopEvent(manaling)
				setPlayerStorageValue(cid, 123987, 0)
				elseif getPlayerLevel(cid) >= 60 and getPlayerLevel(cid) < 80 then
				addEvent(changeMove, 0, cid, 62, -1)
				stopEvent(a)
				stopEvent(manaling)
				setPlayerStorageValue(cid, 123987, 0)
				
				elseif getPlayerLevel(cid) >= 80 and getPlayerLevel(cid) < 100 then
				addEvent(changeMove, 0, cid,64, -1)
				stopEvent(a)
				stopEvent(manaling)
				setPlayerStorageValue(cid, 123987, 0)
				elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 120 then
			
				addEvent(changeMove, 0, cid, 66, -1)
				stopEvent(a)
				stopEvent(manaling)
				setPlayerStorageValue(cid, 123987, 0)
				elseif getPlayerLevel(cid) >= 120 and getPlayerLevel(cid) < 500 then
				addEvent(changeMove, 0, cid, 112, -1)
				stopEvent(a)
				stopEvent(manaling)
				setPlayerStorageValue(cid, 123987, 0)
			  end
		
		setPlayerStorageValue(cid, 123987, 0)
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
	    doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid))
		
		exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
	end
end