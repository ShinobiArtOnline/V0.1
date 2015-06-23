local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local temp = {
exhausted = 2,
}
local times = 1 -- in sec 
local percent =-1

local info = {
speed = 200,	
	}
	function manka(cid) 
			local s=getCreatureMaxMana(cid)
			local perc= s * (35/100)
                doCreatureAddMana(cid,s * (percent/100)) 
                mang=addEvent(manka,times*1000,cid)
				if getPlayerStorageValue(cid, 676767) == 0   then
				stopEvent(mang)
				
end
            return true 
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
		
		
	
		
	  if getPlayerStorageValue(cid, sto_sensha[5]) == 0 then
		
		removeChakra(cid, -1, -3, sto_sensha[5], "sharingan")
         iniHariNikudan(cid)
		 addEvent(harinikudanSensha, 300, cid, 1)
		 setPlayerStorageValue(cid, sto_sensha[5], 1) 
		doCreatureSay(cid, "PAŁA", TALKTYPE_MONSTER)
		
			  end
		
		setPlayerStorageValue(cid, 676767, 1)
		doRemoveCondition(cid, CONDITION_OUTFIT)
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
	    doChangeSpeed(cid, -getCreatureSpeed(cid))
		doChangeSpeed(cid, getCreatureBaseSpeed(cid))
		
		exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
	end
