local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local temp = {
exhausted = 2,
}
local times = 1 -- in sec 
local percent =-5

local info = {
speed = 200,	
	}
	function man(cid) 
			local m=getCreatureMaxMana(cid)
			local perc= m * (35/100)
                doCreatureAddMana(cid,m * (percent/100)) 
                manaling=addEvent(man,times*1000,cid)
				if getCreatureMana(cid) < perc then
				stopEvent(a)
				stopEvent(manaling)
				doPlayerCastSpell(cid, "susanoo")
end
            return true 
        end 
function Susano(cid,time)
if not isCreature(cid) then
return true
end
local l=getCreatureMaxMana(cid)
			local percy= l * (35/100)
setPlayerStorageValue(cid, 123987, 1)
--addEvent(setPlayerStorageValue, time, cid, getPlayerStorageValue(cid,1239876)+1, 0)
if getCreatureMana(cid) < percy then
doPlayerSendCancel(cid, "You cannot use jutsu, you don't have mana")
else
a=addEvent(Susano, time, cid, time)
end
end

	

	
function onCastSpell(cid,var)

local l=getCreatureMaxMana(cid)
			local percy= l * (35/100)
			
		
	
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
		
		
	
		
	if getPlayerStorageValue(cid, 123987) == 0 and getCreatureMana(cid) >= percy then
		Susano(cid)
		man(cid)
        addEvent(changeMove, 0, cid, 112, -1)
		doCreatureSay(cid, "SUSANOO!!!", TALKTYPE_MONSTER)
		--setPlayerStorageValue(cid, 123987, 1)
		
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
				doRemoveCondition(cid, CONDITION_OUTFIT)
				setPlayerStorageValue(cid, 123987, 0)
				elseif getPlayerLevel(cid) >= 120 and getPlayerLevel(cid) < 500 then
				addEvent(changeMove, 0, cid, 66, -1)
				stopEvent(a)
				stopEvent(manaling)
				doRemoveCondition(cid, CONDITION_OUTFIT)
				setPlayerStorageValue(cid, 123987, 0)
				else
				doRemoveCondition(cid, CONDITION_OUTFIT)
				addEvent(changeMove, 0, cid, 66, -1)
				stopEvent(a)
				stopEvent(manaling)
				doPlayerSendCancel(cid, "You cannot use jutsu, you don't have mana")
			  end
		
		--setPlayerStorageValue(cid, 123987, 0)
		doRemoveCondition(cid, CONDITION_OUTFIT)
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
	    doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid))
		
		exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
	end
end