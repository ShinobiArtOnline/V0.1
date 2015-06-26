function onDeath(cid, corpse, deathList)
	setGlobalStorageValue(2050, getGlobalStorageValue(2050)-1)
	for i = 1, table.getn(deathList), 1 do
		doPlayerAddExp(deathList[i],5000)
		if (getPlayerStorageValue(deathList[i],8000) == 13 and getPlayerStorageValue(deathList[i],8804) < 0) then
			doPlayerSetStorageValue(deathList[i],8804, getPlayerStorageValue(deathList[i],8804)+1)
		elseif (getPlayerStorageValue(deathList[i],8000) == 13 and getPlayerStorageValue(deathList[i],8804) == 0 ) then
			doPlayerSetStorageValue(deathList[i],8000, 12)
			doPlayerSetStorageValue(deathList[i],8804, 1)
			doPlayerSendTextMessage(deathList[i], 19,"Continue journey!")
			doPlayerSendTextMessage(deathList[i], MESSAGE_EVENT_ADVANCE, 'Continue journey!')
		end
	end
	return doTeleportThing(cid,{x = 1, y = 1, z = 7, stackpos = 253})
end

function target(cid)
	
end

function onCombat(cid, target)
	if (getCreatureName(cid)=='Masked Ninja' and isMonster(cid)) and ((getPlayerStorageValue(target, 8000) < 13) or (getPlayerStorageValue(target, 8000) > 13)) then
		doMonsterChangeTarget(cid)
		return false
	elseif (getCreatureName(cid)=='Masked Ninja' and isMonster(cid)) and getPlayerStorageValue(target, 8000) == 13 then
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
		if isMonster(cid) and (getPlayerStorageValue(player, 8000) < 13 or getPlayerStorageValue(player, 8000) > 13) and speed > 0 then
			doChangeSpeed(cid, -speed)
			return true
		elseif isMonster(cid) and getPlayerStorageValue(player, 8000) == 13 then
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


