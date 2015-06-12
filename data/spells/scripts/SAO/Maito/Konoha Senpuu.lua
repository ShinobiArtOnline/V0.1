function iniSenpuu(cid)
  addEvent(actionMove, 0, cid, 400, 250)
  addEvent(doRemoveCondition, 300, cid, CONDITION_OUTFIT)
  
end
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
iniSenpuu(cid)
		local area = {
				{1, 1, 1},
				{1, 2, 1},
				{1, 1, 1},
		}
	
		
		addEvent(doCreatureSay, 10, cid, "KONOHA!", TALKTYPE_MONSTER)
		addEvent(doCreatureSay, 40, cid, "SENPUU!", TALKTYPE_MONSTER)
	local level = getPlayerLevel(cid) 
	local jutsuDmg = 12
	local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
	local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.25))
		local pos = getCreaturePosition(cid)
		pos = getPosfromArea(cid,area)
		n = 0
		while n < #pos do
				n = n+1
				addEvent(quake, 40, cid, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, COMBAT_PHYSICALDAMAGE, -dmg, -dmg, 128, true)
		end
		exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
end

