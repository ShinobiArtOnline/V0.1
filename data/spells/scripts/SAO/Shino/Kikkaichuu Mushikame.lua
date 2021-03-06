local confg = {
chakra = 10,
}

local combat = createCombatObject()
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
        
       
		local level = getPlayerLevel(cid)
		local mlevel = getPlayerMagLevel(cid) 
		local jutsuDmg = 50
		local skill_factor = math.ceil((mlevel + level)/2)
		local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.60))
		local mdmg = - math.max(1, math.ceil(((skill_factor*0.45) * jutsuDmg)*0.60))
		local pos = getCreaturePosition(cid)
		removeChakraLife(cid, - confg.chakra)
		local pos = getCreaturePosition(cid)
		addEvent(doSendMagicEffect, 30, {x = pos.x+1, y = pos.y+1, z = pos.z}, 36)
		addEvent(doSendMagicEffect, 60, {x = pos.x+1, y = pos.y+1, z = pos.z}, 36)
		addEvent(doSendMagicEffect, 100, {x = pos.x+1, y = pos.y+1, z = pos.z}, 36)
		
		pos = getPosfromArea(cid,area)
		n = 0
		while n < #pos do
				n = n+1
				addEvent(quake, 90, cid, {x=pos[n].x,y=pos[n].y,z=pos[n].z},COMBAT_PHYSICALDAMAGE, -mdmg, -dmg, 255, true)
				
		end
		exhaustion.set(cid, storage, waittime)
		return doCombat(cid,combat, var)
end