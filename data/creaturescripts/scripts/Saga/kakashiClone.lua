function onDeath(cid, corpse, deathList)
	doCreateMonster('Kakashi\'s Clone', {x=764,y=779,z=7,stackpos = 253})
	for i = 1, table.getn(deathList), 1 do
		doPlayerAddExp(deathList[i],5000)
		if (getPlayerStorageValue(deathList[i],8000) == 8 and getPlayerStorageValue(deathList[i],8803) < 1) then
			doPlayerSetStorageValue(deathList[i],8803, getPlayerStorageValue(deathList[i],8803)+1)
		elseif (getPlayerStorageValue(deathList[i],8000) == 8 and getPlayerStorageValue(deathList[i],8803) == 1 ) then
			doPlayerSetStorageValue(deathList[i],8000, 9)
			doPlayerSetStorageValue(deathList[i],8803, 3)
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '#10. Talk with Kakashi')
			doPlayerSendTextMessage(cid, 19,'#10. Talk with Kakashi')
		end
	end
	return doTeleportThing(cid,{x = 1, y = 1, z = 7, stackpos = 2})
end

function target(cid)
	
end

function onCombat(cid, target)
	if (getCreatureName(cid)=='Kakashi\'s Clone' and isMonster(cid)) and ((getPlayerStorageValue(target, 8000) < 8) or (getPlayerStorageValue(target, 8000) > 8)) then
		doMonsterChangeTarget(cid)
		return false
	elseif (getCreatureName(cid)=='Kakashi\'s Clone' and isMonster(cid)) and getPlayerStorageValue(target, 8000) == 8 then
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
		if isMonster(cid) and (getPlayerStorageValue(player, 8000) < 8 or getPlayerStorageValue(player, 8000) > 8) and speed > 0 then
			doChangeSpeed(cid, -speed)
			return true
		elseif isMonster(cid) and getPlayerStorageValue(player, 8000) == 8 then
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


