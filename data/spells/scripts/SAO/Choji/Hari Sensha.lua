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

function onCastSpell(cid,var)
	local info = {
		chakra = 6,
	}

	local chakraPercent = getCreatureMaxMana(cid) * (info.chakra / 100)
-----[Restrições]-----
	if	impossibleUse(cid) then
		return true
	end

	if checkDoing(cid) then
		return true
	end	
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
			 removeChakraLife(cid, - confg.chakra)
			 setPlayerStorageValue(cid, sto_sensha[5], 1)
             addEvent(harinikudanSensha, 400, cid, 3)
			 removeChakra(cid, chakraPercent, 3, sto_sensha[5], "sharingan")
			 setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
         else
             endHariNikudan(cid)
			 setPlayerStorageValue(cid, sto_sensha[5], 0)
             doRemoveCondition(cid, CONDITION_OUTFIT)
			  setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
			  exhaustion.set(cid, storage, waittime)
		     
         end
end
return doCombat(cid,combat, var)
end
