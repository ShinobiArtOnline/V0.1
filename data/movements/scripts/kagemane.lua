local shadowStorages = {
[1] = 9001,
[2] = 9002,
[3] = 9003,
}
 
 
function onStepIn(cid, item, position, fromPosition)
	mayNotMove(cid, true)
    local name = getItemAttribute(item.uid, "name")
    local player = name:match("a shadow. It belongs to (.*)")
    player = player + 0
    noMove(player, 2000)
    if not isCreature(player) then
	function move(attacker, cid, playerpos, targetpos, times)
    if not isCreature(attacker) then
        stopNows(cid, 0)
		
        setPlayerStorageValue(cid, sto_nara[2], 1)
        setPlayerStorageValue(cid, sto_nara[6], 1)
        return true
    end
        if not isCreature(cid) then
		 noMove(attacker, 2000)
            mayNotMove(attacker, true)
            setPlayerStorageValue(attacker, sto_nara[1], 1)
            setPlayerStorageValue(attacker, sto_nara[2], 1)
            setPlayerStorageValue(attacker, sto_nara[10], 1)
            setPlayerStorageValue(attacker, sto_nara[9], 1)
            return true
        end

        if playerdir ~= getCreatureLookDirection(attacker) then
            doCreatureSetLookDirection(cid, getCreatureLookDirection(attacker))
        end

    if playerpos ~= getCreaturePosition(attacker) then
        if playerpos.z == getCreaturePosition(attacker).z then
            local ntpos = getCreaturePosition(attacker)
            local x,y,z = ntpos.x-playerpos.x,ntpos.y-playerpos.y,ntpos.z-playerpos.z
            ntpos = getCreaturePosition(cid)
            ntpos.x, ntpos.y, ntpos.z = ntpos.x+x,ntpos.y+y,ntpos.z+z
                if queryTileAddThing(cid, ntpos) == RETURNVALUE_NOERROR and getCreaturePosition(attacker).z == getCreaturePosition(cid).z then
                    doMoveCreature(cid, getCreatureLookDirection(attacker))
                end
        end
    end
    
    local playerpos, targetpos = getCreaturePosition(attacker), getCreaturePosition(cid)
    local times = times+1
    
    if times  <  500 then
        addEvent(move, 1, attacker, cid, playerpos, targetpos, times)
    else
        stopEvent(Kubi)
        setPlayerStorageValue(attacker, sto_nara[1], 1)
        setPlayerStorageValue(cid, sto_nara[2], 1)
        setPlayerStorageValue(attacker, sto_nara[2], 1)
        setPlayerStorageValue(attacker, sto_nara[3], 1)
        setPlayerStorageValue(attacker, sto_nara[4], 1)
        setPlayerStorageValue(attacker, sto_nara[5], 1)
        setPlayerStorageValue(cid, sto_nara[6], 1)
        setPlayerStorageValue(attacker, sto_nara[10], 1)
        setPlayerStorageValue(attacker, sto_nara[9], 1)
        stopNows(cid, 0)
		
        mayNotMove(attacker, true)
        doPlayerSendTextMessage(attacker, MESSAGE_EVENT_ADVANCE, "'"..getPlayerName(cid).."' is not longer tied to your Kagemane")
    end
end
		
       doRemoveItem(item.uid, 1)
	   
       return true
    end
   
    if(isNpc(cid)) then
       return true
    end
   
   
    local aid = 9000 + (item.actionid/1000)
     
    if isCreature(player) then
    if((getCreatureName(cid) ~= getCreatureName(player)) and not isKagemaneTarget(player, cid) and (isPlayer(cid) or isMonster(cid))) then
      if(getPlayerStorageValue(cid,STORAGE_TRAPED_ON_KAGEMANE) ~= 1) then
           if addKagemaneTarget(player, cid) then
		   
               setPlayerStorageValue(player, aid, 0)
           end
      end  
    end
    else
       doRemoveItem(item.uid, 6)
    end
   
   
    return true
end