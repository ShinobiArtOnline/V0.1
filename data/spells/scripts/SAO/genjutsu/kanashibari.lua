

function onCastSpell(cid, var)
	if not isCreature(cid) then
		return true
	end
	
    if getTilePzInfo(getPlayerPosition(cid)) then
        return doPlayerSendCancel(cid, "You in this area pz.") 
    end 
	
	
	
	if not isCreature(cid) then
		setPlayerStorageValue(cid, sto_gen[2], 1)
		return true
	end
	
	if not isCreature(cid) then
		return doPlayerSendCancel(cid, "Use only in creatures!")		
	end
	

    if(getPlayerStorageValue(cid, sto_gen[1]) > os.time() and getPlayerStorageValue(cid, sto_gen[1]) < 100+os.time()) then
      return doPlayerSendTextMessage(cid, 24, "Voce ja esta fazendo um jutsu")
    end
	
	
    if(getPlayerStorageValue(cid, sto_gen[2]) > os.time() and getPlayerStorageValue(cid, sto_gen[2]) < 100+os.time()) then
      return doPlayerSendTextMessage(cid, 24, "Voce ja esta fazendo um jutsu")
    end
local target= getCreatureTarget(cid)
		if isPlayer(cid) then
			doCreatureSay(cid, "Kanashibari no Genjutsu!", TALKTYPE_MONSTER)
			if isPlayer(cid) then
				doPlayerSendTextMessage(cid,22,"You are under influence of a '"..getPlayerName(cid).."' Genjutsu! (Kanashibari)")
			end if isPlayer(cid) then
				doPlayerSendTextMessage(cid,22,"You are under influence of a '"..getPlayerName(cid).."' Genjutsu! (Kanashibari)")
			end
			doPlayerSendTextMessage(cid,22,"You have caught '"..getPlayerName(target).."' on your Genjutsu! (Kanashibari)")	 
			doSendMagicEffect(getThingPos(cid), 3)
			removeChakraLife(cid, - 80)
			setPlayerStorageValue(cid, sto_gen[2], os.time() + 15)
			setPlayerStorageValue(cid, sto_gen[1], os.time() + 8)
			
			stopNow(cid, 8000)
			addEvent(doPlayerSendTextMessage, 8000, cid, 22, "'"..getPlayerName(cid).."' escaped his genjutsu (Kanashibari)")
			
		end
	return true
end
