local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

function onCastSpell(cid, var)
		if not isCreature(cid) then
				return true
		end
		if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
		
		local area = {
				{0, 1, 1, 1, 0},
				{1, 1, 1, 1, 1},
				{1, 1, 2, 1, 1},
				{1, 1, 1, 1, 1},
				{0, 1, 1, 1, 0},
		}
	
		
		
		
		local level = getPlayerLevel(cid) 
		local jutsuDmg = 80
		local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
		local dmg = math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.8))
		local mini = math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.8))
		local pos = getCreaturePosition(cid)
		addEvent(doSendMagicEffect, 30, {x = pos.x+1, y = pos.y+1, z = pos.z}, 255)
		
		pos = getPosfromArea(cid,area)
		n = 0
		while n < #pos do
				n = n+1
				addEvent(doAreaCombatHealth, 30, cid, 1, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, area, -mini, -dmg, 111)
	
		end
		exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
end