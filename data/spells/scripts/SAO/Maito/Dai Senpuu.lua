function iniDaiSenpuu(cid)
		if not isCreature(cid) then
				return true
		end
 
  addEvent(doRemoveCondition, 100, cid, CONDITION_OUTFIT)
end


function onCastSpell(cid, var)
		if not isCreature(cid) then
				return true
		end
		iniDaiSenpuu(cid)
		local area = {
				{1, 1, 1},
				{1, 2, 1},
				{1, 1, 1},
		}
	
		
		addEvent(doCreatureSay, 100, cid, "KONOHA!", TALKTYPE_MONSTER)
		addEvent(doCreatureSay, 200, cid, "DAI SENPUU!!!", TALKTYPE_MONSTER)
	local level = getPlayerLevel(cid) 
	local jutsuDmg = 19
	local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
	local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.25))
		local pos = getCreaturePosition(cid)
		addEvent(doSendMagicEffect, 300, {x = pos.x+1, y = pos.y+1, z = pos.z}, 93)
		addEvent(doSendMagicEffect, 800, {x = pos.x+1, y = pos.y+1, z = pos.z}, 93)
		addEvent(doSendMagicEffect, 1300, {x = pos.x+1, y = pos.y+1, z = pos.z}, 93)
		pos = getPosfromArea(cid,area)
		n = 0
		while n < #pos do
				n = n+1
				addEvent(quakePush, 50, cid, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, COMBAT_PHYSICALDAMAGE, -dmg, -dmg, 255, true)
				addEvent(quakePush, 150, cid, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, COMBAT_PHYSICALDAMAGE, -dmg, -dmg, 255, true)
				addEvent(quakePush, 250, cid, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, COMBAT_PHYSICALDAMAGE, -dmg, -dmg, 255, true)
				addEvent(quakePush, 350, cid, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, COMBAT_PHYSICALDAMAGE, -dmg, -dmg, 255, true)
		end
end