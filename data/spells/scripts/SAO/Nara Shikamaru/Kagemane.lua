local function movercriatura(cid, pos)
if not isCreature(cid) then return false end
   if(isWalkable(pos) and isCreature(cid)) then
      doTeleportThing(cid, pos, true)
   end
end
function CreatureMove(cid, old, current)
if getPlayerStorageValue(cid, STORAGE_KAGEMANE_TRAPED_QTY > 0) then
local list = getKagemaneTargetList(cid)
if(#list > 0) then
          local dir = getDirectionTo(old, current)
          local list = getKagemaneTargetList(cid)
          for _,v in pairs(list) do
             if isCreature(v) then 
                if not getStorage(v, STORAGE_TRAPED_ON_KAGEMANE) == 1 then removeKagemaneTarget(cid, v) end 
                if getStorage(v, STORAGE_KAGEMANE_TRAPED_QTY) > 0 then removeKagemaneTarget(cid, v) end 
                local targetPos = getCreaturePosition(v)
                local npos = getPositionByDirection(targetPos, dir)
                if getTilePzInfo(targetPos) or getTilePzInfo(npos) then
                
                else
                  if isWalkable(npos) then
                     addEvent(movercriatura, 400, v, npos)
                  end            
                  local targetPos = getCreaturePosition(v)
                  local dist = getDistanceBetween(targetPos, current)
                  if dist > 7 or targetPos.z ~= current.z  then
                     removeKagemaneTarget(cid, v)
                  end 
                end
             else
                removeKagemaneTarget(cid, v)
             end
          end 
       end
end

return true
end
local function finishJutsu(cid)   
if not isCreature(cid) then return true end
   mayNotMove(cid, false)
end

local confg = {
chakra = 8,
}

function move(attacker, cid, playerpos, targetpos, times)
    if not isCreature(attacker) then
       noMove(attacker,5000)
        setPlayerStorageValue(cid, sto_nara[2], 1)
        setPlayerStorageValue(cid, sto_nara[6], 1)
        return true
    end
        if not isCreature(cid) then
			noMove(attacker,5000)
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
					noMove(attacker,5000)
                end
        end
    end
    
    local playerpos, targetpos = getCreaturePosition(attacker), getCreaturePosition(cid)
    local times = times+1
    
    if times  <  10 then
        addEvent(move, 10, attacker, cid, playerpos, targetpos, times)
    else
		noMove(attacker,5000)       
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


function onCastSpell(cid, var)


	if(isCreature(cid)) then
		if getPlayerStorageValue(cid, STORAGE_SHADOW_1) == 1 then
   			setPlayerStorageValue(cid, STORAGE_SHADOW_1, 0)
   			setPlayerStorageValue(cid, STORAGE_SHADOW_2, 0)
   			setPlayerStorageValue(cid, STORAGE_SHADOW_3, 0)
   			doPlayerSetNoMove(cid, false)
			
   			return doPlayerSendCancel(cid, "Kagemane stopped.")
	end

	
	if checkJutsu(cid, "Kagemane") then
		return doPlayerSendCancel(cid, "You are already doing kagemane no jutsu.")
	end

	if getPlayerStorageValue(cid, STORAGE_KAGEMANE_TRAPED_QTY) > 0 then
  		return doPlayerSendCancel(cid, "You are already doing kagemane no jutsu.")
	end


	if getTileInfo(getCreaturePosition(cid)).protection then return doPlayerSendCancel(cid, "You use that from here.") end  
	local maxShadowDist = 15
	setPlayerStorageValue(cid, STORAGE_SHADOW_DIST, maxShadowDist)
	--doAddCondition(getCreatureTarget(cid), condition)
	move(cid)
	CreatureMove(cid)
	setPlayerStorageValue(cid, STORAGE_MAX_SHADOW_DIST, maxShadowDist)
	setPlayerStorageValue(cid, 10176, 1)
	removeChakraLife(cid, - confg.chakra)
	
	setPlayerStorageValue(cid, 9000, 'doing jutsu')
	doCreatureSay(cid, 'Kagemane no Jutsu!', TALKTYPE_ORANGE_1) 
	createKagemane(cid, getCreaturePosition(cid), 1)
    
	end
	return TRUE
end