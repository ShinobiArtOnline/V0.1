local temp = {
exhausted = 3,
}

function onUse (cid, item, frompos, itemEx, topos)
	local confg = {
		chakra = 30
	}

    local pos = getCreaturePosition(cid)
	local outfit = getCreatureOutfit(cid)
	
	if not isCreature(cid) then
		return true
	end
		
        if itemEx.uid <= 1 then
        	return doPlayerSendCancel(cid,"You can't do that.")
        end
-----[Restrições]-----
    if itemEx.uid <= 1 then
        return doPlayerSendCancel(cid,"You can't do that.")
    end

    if impossibleUse(cid) then 
    	return true
    end
--------------------
	if checkDoing(cid) then
		return true
	end

	if isPlayer(cid) then
	
	end
		doCreatureAddHealth(itemEx.uid, healthPercent)
		removeChakraLife(cid, - confg.chakra)
        doSendMagicEffect(pos ,7)
        doRemoveCondition(cid, CONDITION_FIRE)
        doRemoveCondition(cid, CONDITION_POISON)
        doRemoveCondition(cid, CONDITION_ENERGY)
        doCreatureSay(cid, "Saikan Chuushutsu no Jutsu..", TALKTYPE_MONSTER)
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
	end
end