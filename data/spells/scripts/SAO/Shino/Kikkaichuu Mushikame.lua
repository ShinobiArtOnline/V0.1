function onCastSpell(cid, var)
		if not isPlayer(cid) then
				return true
		end
	
		local area = {
				{1, 1, 1},
				{1, 2, 1},
				{1, 1, 1},
		}
		local waittime = 2.0 -- Tempo de exhaustion
		local storage = 115818

		if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
        
        addEvent(doCreatureSay, 200, cid, "Kikkaichu", TALKTYPE_MONSTER)
        addEvent(doCreatureSay, 500, cid, "Mushikame!!", TALKTYPE_MONSTER)
        local level = getPlayerLevel(cid) 
		local jutsuDmg = 11
		local skill_factor = math.ceil((jutsuSkill_factor(cid, 1) + level)/2)
		local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.20))
		local pos = getCreaturePosition(cid)
		addEvent(doSendMagicEffect, 300, {x = pos.x+1, y = pos.y+1, z = pos.z}, 36)
		addEvent(doSendMagicEffect, 600, {x = pos.x+1, y = pos.y+1, z = pos.z}, 36)
		addEvent(doSendMagicEffect, 1000, {x = pos.x+1, y = pos.y+1, z = pos.z}, 36)
		
		pos = getPosfromArea(cid,area)
		n = 0
		while n < #pos do
				n = n+1
				addEvent(quakePush, 300, cid, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, COMBAT_PHYSICALDAMAGE, dmg, dmg, 255, true)
				addEvent(quakePush, 600, cid, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, COMBAT_PHYSICALDAMAGE, dmg, dmg, 255, true)
				addEvent(quakePush, 850, cid, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, COMBAT_PHYSICALDAMAGE, dmg, dmg, 255, true)
				addEvent(quakePush, 1550, cid, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, COMBAT_PHYSICALDAMAGE, dmg, dmg, 255, true)
		end
		exhaustion.set(cid, storage, waittime)
end