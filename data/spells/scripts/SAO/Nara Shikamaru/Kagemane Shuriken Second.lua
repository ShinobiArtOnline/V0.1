
function onCastSpell(cid, var)
		if not isCreature(cid) then
				return true
		end
		
		local area = {
				{1, 0, 0, 0, 1},
				{0, 1, 1, 1, 0},
				{1, 1, 2, 1, 1},
				{0, 1, 1, 1, 0},
				{1, 0, 0, 0, 1},
		}
	
		
		addEvent(doCreatureSay, 10, cid, "KageMane!", TALKTYPE_MONSTER)
		addEvent(doCreatureSay, 20, cid, "Shuriken..", TALKTYPE_MONSTER)
		addEvent(doCreatureSay, 70, cid, "FULL!!!!!", TALKTYPE_MONSTER)
		local level = getPlayerLevel(cid) 
		local jutsuDmg = 16
		local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
		local dmg = math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.25))
		local pos = getCreaturePosition(cid)
		addEvent(doSendMagicEffect, 30, {x = pos.x+1, y = pos.y+1, z = pos.z}, 132)
		addEvent(doSendMagicEffect, 80, {x = pos.x+2, y = pos.y+2, z = pos.z}, 130)
		pos = getPosfromArea(cid,area)
		n = 0
		while n < #pos do
				n = n+1
				addEvent(doAreaCombatHealth, 30, cid, 1, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, area, -dmg, -dmg, 255)
				addEvent(doAreaCombatHealth, 30, cid, 1, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, area, -dmg, -dmg, 255)
				
				
		end
end