function onCastSpell(cid, var)
	local level = getPlayerLevel(cid) 
	local jutsuDmg = 5
	local skill_factor = math.ceil((jutsuSkill_factor(cid, 2) + level)/2)
	local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.30))
	local tempo = 8
	local efeito = 4
	local target=getCreatureTarget(cid)
	local pos=getCreaturePosition(target)
	function kaenDamage(cid, life, times, effect)
	if not isCreature(cid) then
		return true
	end

	for i = 1, times do
		addEvent(doSendMagicEffect, i*1000, getCreaturePosition(target), effect)
	end
	return true
	end

	
	
    if getTilePzInfo(getPlayerPosition(cid)) then
        return doPlayerSendCancel(cid, "You in this area pz.") 
    end 

       if getTilePzInfo(getPlayerPosition(cid)) then
        return doPlayerSendCancel(cid, "You in this area pz.") 
    end
	
	
	
	
	
	
	
	
    if(getPlayerStorageValue(cid, sto_gen[2]) > os.time() and getPlayerStorageValue(cid, sto_gen[2]) < 100+os.time()) then
      return doPlayerSendTextMessage(cid, 24, "Voce ja esta fazendo um jutsu")
    end
    
		if isPlayer(cid) then
			doCreatureSay(cid, "Kaen!", TALKTYPE_MONSTER)
			if isPlayer(cid) then
				doPlayerSendTextMessage(cid,22,"You are under influence of a '"..getPlayerName(cid).."' Genjutsu! (Kaen)")
			end
			doPlayerSendTextMessage(cid,22,"You have caught '"..getPlayerName(cid).."' on your Genjutsu! (Kaen)")	 
			doSendMagicEffect(getThingPos(cid), 3)
			kaenDamage(getCreaturePosition(target), dmg, tempo, efeito)
			removeChakraLife(cid, - 95)
			setPlayerStorageValue(cid, sto_gen[2], os.time() + 15)
			setPlayerStorageValue(cid, sto_gen[1], os.time() + 8)
			stopNow(getCreaturePosition(target), 3000)
			addEvent(doPlayerSendTextMessage, 8000, cid, 22, "'"..getPlayerName(cid).."' escaped his genjutsu (Kaen)")
			
		end
			return true
end