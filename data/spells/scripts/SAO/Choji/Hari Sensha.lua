local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local temp = {
exhausted = 4,
}

local confg = {
level = 1,
chakra = 35
}
 

	


function many(cid) 
			
                doCreatureAddMana(cid,-1) 
                removemana=addEvent(many,1*1000,cid)
            return true 
        end 

function onCastSpell(cid,var)
	local info = {
		chakra = 6,
	}
	
-----[Restrições]-----
	

	
	if checkJutsu(cid, "Nikudan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if checkJutsu(cid, "Mizudan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end	
	if checkJutsu(cid, "Chou Baika") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if checkJutsu(cid, "Tongarashigan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end	
	if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
-----[Restrições]-----
   if isPlayer(cid) then
	  if(getPlayerStorageValue(cid, sto_sensha[5]) == 0) then
           iniHariNikudan(cid)
		   many(cid)
			 removeChakraLife(cid, - confg.chakra)
			 
			addEvent(harinikudanSensha, 300, cid, 3)
			setPlayerStorageValue(cid, sto_sensha[5], 1)
			setPlayerStorageValue(cid, 676767, 1)
			
         else
		 stopEvent(removemana)
		 --setPlayerStorageValue(cid, 676767, 0)
             endHariNikudan(cid)
			 setPlayerStorageValue(cid, sto_sensha[5], 0)
             doRemoveCondition(cid, CONDITION_OUTFIT)
			  exhaustion.set(cid, storage, waittime)
		     
         end
end
return doCombat(cid,combat, var)
end
