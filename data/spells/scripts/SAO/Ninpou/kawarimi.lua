function onCastSpell (cid, var)
local _ = {410, 459, 1394, 1388, 1390, 369, 428}

       
		
    if getTilePzInfo(getPlayerPosition(cid)) then
        return doPlayerSendCancel(cid, "You can't use.")
    end 

		

       


         if getPlayerStorageValue(cid, sto_nara[2]) == 0 then
               return doPlayerSendCancel(cid, "Sorry this is not possible.")
         end

       

        if getPlayerMana(cid) < 5 then
        return doPlayerSendCancel(cid, "You don't have enough chakra.")
        end

       

          if checkCmd(cid, "rest") then
             return doPlayerSendCancel(cid, "you cannot use jutsu while you are resting.")
         end
        if checkCmd(cid, "mold") then
            return doPlayerSendCancel(cid, "you cannot use jutsu while you are mold chakra")
         end
         if checkJutsu(cid, "Kagemane") then
            return doPlayerSendCancel(cid, "you cannot use jutsu")
         end

	local target=getCreatureTarget(cid)
        playerpos = getPlayerPosition (cid)
        doTeleportThing (cid, getCreaturePosition(target), false)
        doSendMagicEffect (playerpos ,2)
        doSendMagicEffect (getCreaturePosition(target) ,110)
        doCreatureSay(cid, "Kawarimi!", TALKTYPE_MONSTER)
        doPlayerAddMana(cid, -5)
end
