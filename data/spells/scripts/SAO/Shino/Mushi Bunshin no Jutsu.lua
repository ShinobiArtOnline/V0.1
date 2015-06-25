local temp = {
exhausted = 3,
}

local confg = {
level = 1,
chakra = 20,
}

function onCastSpell(cid,var)
	if not isCreature(cid) then
		return true
	end
----[Restriçoes]-----    
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
---[Restriçoes]------
	if(getPlayerStorageValue(cid, sto_jutsu[1]) > os.time() and getPlayerStorageValue(cid, sto_jutsu[1]) < 100+os.time()) then
		doPlayerSendTextMessage(cid, 24, "Voce ja esta fazendo um jutsu")
	return true
	elseif getPlayerLevel(cid) < confg.level then
		doPlayerSendCancel(cid, "You need to be atleast level ".. confg.level ..".") 
	return true
	end

    if #getCreatureSummons(cid) <= 2 then
	  local pos = getPlayerPosition(cid)
	  local Bunshin = doCreateMonster("Bunshin", getCreaturePosition(cid))
      
	  if isPlayer(cid) then
			removeChakraLife(cid, - confg.chakra)
		end
		doConvinceCreature(cid, Bunshin)	 
		setCreatureMaxHealth(Bunshin, 100)
		doCreatureAddHealth(Bunshin, 100)
		doSetCreatureOutfit(Bunshin, getCreatureOutfit(cid), -1)

		doSendMagicEffect(getCreaturePosition(Bunshin), 33)
		doCreatureSay(cid,"Mushi Bunshin no Jutsu!", TALKTYPE_MONSTER)
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
		
	return true	
	end
	if #getCreatureSummons(cid) == 3 then
		doPlayerSendCancel(cid, "You can't use.") 
		--doSendMagicEffect(getCreaturePosition(cid), 33)
		--doRemoveCreature(Bunshin)
    else
      return doPlayerSendCancel(cid, "You can't use.") 
   end	
end