local confg = {
level = 1,
chakra = 100,
}

function onCastSpell(cid,var)
-----[Restrições]-----
	
	if not isCreature(cid) then
		return true
	end
	
	if	impossibleUse(cid) then
		return true
	end

	if checkDoing(cid) then
		return true
	end	
-----[Restrições]-----
	if isPlayer(cid) then
		removeChakraLife(cid , - confg.chakra)
		for n = 0,1 do
			local pos = getFirstCreaturePosOnDirection(cid,(n+1))
			local level = getPlayerLevel(cid) 
			local target = getCreatureTarget(cid)
			local pos2 = getCreaturePosition(target)
			
			local jutsuDmg = 50
			local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
			local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.25))
				if not isCreature(cid) then
					return true
				end
			 local poslook = getCreatureLookPosition(cid)
		if isWalkable(poslook, false, false, true) then
			local distance = getDistanceBetween(getThingPos(cid), getThingPos(target))
			for i = 1, distance do
				addEvent(doMoveCreature, (	600+(100*i)), cid, getCreatureLookDirection(cid))
			end
			actionMove(cid, 10, 200)
			addEvent(actionMove, 100, cid, 11, 200)
			addEvent(actionMove, 200, cid, 11, 200)
			addEvent(actionMove, 300, cid, 11, 200)
			addEvent(actionMove, 400, cid, 11, -1)
			stopNow(cid, 4000)
			addEvent(doCreatureSetLookDirection, (600+(100*distance+25)), cid, 0)
			addEvent(doAreaCombatHealth, (600+(100*distance+2300)), cid, 1, getThingPos(cid), area, dmg, dmg, 111)
			addEvent(doAreaCombatHealth, (600+(100*distance+2400)), cid, 1, getThingPos(cid), area, 0, 0, 93)
			addEvent(iniOmote, (600+(100*distance+50)), cid, item, getThingPos(cid), cid, getThingPos(target))
			addEvent(doRemoveCondition, (600+(100*distance+50)) , cid, CONDITION_OUTFIT)
			setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
			return true
		end
	end
	end
end
