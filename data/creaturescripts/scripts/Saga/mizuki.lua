function onDeath(cid, corpse, deathList)
	for i = 1, table.getn(deathList), 1 do
		if (getPlayerStorageValue(deathList[i],8000) == 4 and getPlayerStorageValue(deathList[i],8801) < 1) then
			doPlayerAddExp(deathList[i],10000)
			doPlayerSetStorageValue(deathList[i],8801, 1)	-- TODO opracowac wczytywanie calej listy graczy 
			doPlayerSetStorageValue(deathList[i],8000, 5)
			doPlayerSendTextMessage(deathList[i], MESSAGE_EVENT_ADVANCE, '#6. Talk with Iruka')
			doPlayerSendTextMessage(deathList[i], 19,'#6. Talk with Iruka')
		end
	end
	return doTeleportThing(cid,{x = 1, y = 1, z = 7, stackpos = 253})
end

function onCombat(cid, target)
	if (getCreatureName(cid)=='Mizuki' and isMonster(cid)) and ((getPlayerStorageValue(target, 8000) < 4) or (getPlayerStorageValue(target, 8000) > 4)) then
		return false
	elseif (getCreatureName(cid)=='Mizuki' and isMonster(cid)) and getPlayerStorageValue(target, 8000) == 4 then
		return true
	else
		return false
	end
end  

function onThink(cid, interval)
	if isPlayer(getCreatureTarget(cid)) then
		local player = getCreatureTarget(cid)
		local basespeed = getCreatureBaseSpeed(cid)
		local speed = getCreatureSpeed(cid)
		if isMonster(cid) and (getPlayerStorageValue(player, 8000) < 4 or getPlayerStorageValue(player, 8000) > 4) and speed > 0 then
			doChangeSpeed(cid, -speed)
			--doTeleportThing(cid,{x = 85, y = 245, z = 7})    -- TODO zooptymalizowaæ zeby teleportowalo tylko raz
			return true
		elseif isMonster(cid) and getPlayerStorageValue(player, 8000) == 4 then
			if (speed > basespeed) then
				delta=speed-basespeed
				doChangeSpeed(cid, -delta)
			elseif (speed < basespeed) then      -- TODO popracowac nad lepszym sposobem
				delta=basespeed-speed
				doChangeSpeed(cid, delta)
			end
			return true
		end
		return true
	end
end  


