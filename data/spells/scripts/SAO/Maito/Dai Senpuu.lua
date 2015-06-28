local waittime = 1.5 -- czas
local storage = 115818
local combat = createCombatObject()


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
		
		if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
		iniDaiSenpuu(cid)
		local area = {
				{1, 1, 1},
				{1, 2, 1},
				{1, 1, 1},
		}
	
		
		addEvent(doCreatureSay, 10, cid, "KONOHA!", TALKTYPE_MONSTER)
		addEvent(doCreatureSay, 20, cid, "DAI SENPUU!!!", TALKTYPE_MONSTER)
	local level = getPlayerLevel(cid) 
	local jutsuDmg = 40
	local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
	local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.55))
	local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.55))
		local pos = getCreaturePosition(cid)
		addEvent(doSendMagicEffect, 1, {x = pos.x+1, y = pos.y+1, z = pos.z}, 93)
		
		pos = getPosfromArea(cid,area)
		n = 0
		while n < #pos do
				n = n+1
				addEvent(quake, 1, cid, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, COMBAT_PHYSICALDAMAGE, -mdmg, -dmg, 255, true)
				
		end
		exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
end