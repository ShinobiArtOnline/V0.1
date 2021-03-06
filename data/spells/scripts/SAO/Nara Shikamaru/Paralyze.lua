local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818


local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	if not isCreature(cid) then
		return true
	end
	if exhaustion.check(cid, storage) then
			doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
local level = getPlayerLevel(cid)
local mlevel = getPlayerMagLevel(cid) 
local jutsuDmg = 60
local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.54))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.54))
local find_area = getFirstCreaturePosOnDirection(cid, 1)
local pos = getCreaturePosition(cid)


	
	

	if getCreatureLookDir(cid) == 0 then
		addEvent(doAreaCombatHealth, 30, cid, COMBAT_PHYSICALDAMAGE, find_area, KAGE1, mdmg, dmg, 255)
		doAreaCombatCondition(cid, find_area, KAGE1, condition, 255)
		addEvent(doSendMagicEffect, 30, {x = pos.x, y = pos.y-1, z = pos.z}, 23)
	elseif getCreatureLookDir(cid) == 1 then
	doAreaCombatCondition(cid, find_area, KAGE1, condition, 255)
		addEvent(doAreaCombatHealth, 30, cid, COMBAT_PHYSICALDAMAGE, find_area, KAGE1, mdmg, dmg, 255)
		addEvent(doSendMagicEffect, 30, {x = pos.x+5, y = pos.y, z = pos.z}, 25)
	elseif getCreatureLookDir(cid) == 2 then
	doAreaCombatCondition(cid, find_area, KAGE1, condition, 255)
		addEvent(doAreaCombatHealth, 30, cid, COMBAT_PHYSICALDAMAGE, find_area, KAGE1, mdmg, dmg, 255)
		addEvent(doSendMagicEffect, 30, {x = pos.x, y = pos.y+5, z = pos.z}, 24)
	elseif getCreatureLookDir(cid) == 3 then
	doAreaCombatCondition(cid, find_area, KAGE1, condition, 255)
		addEvent(doAreaCombatHealth, 30, cid, COMBAT_PHYSICALDAMAGE, find_area, KAGE1, mdmg, dmg, 255)
		addEvent(doSendMagicEffect, 60, {x = pos.x-1, y = pos.y, z = pos.z}, 71)
	end
	exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
end