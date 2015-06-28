--local condition = createConditionObject(CONDITION_PARALYZE)
--setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)
--setConditionFormula(condition, -0.8, 0, -0.8, 0)
--setCombatCondition(combat, condition)
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
local level = getPlayerLevel(cid)
local mlevel = getPlayerMagLevel(cid) 
local jutsuDmg = 65
local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.6))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.6))
local find_area = getFirstCreaturePosOnDirection(cid, 1)
local pos = getCreaturePosition(cid)


	
	

	if getCreatureLookDir(cid) == 0 then
		addEvent(doAreaCombatHealth, 30, cid, COMBAT_PHYSICALDAMAGE, find_area, NARASHI, mdmg, dmg, 82)
		--doAreaCombatCondition(cid, find_area, NARASHI, condition, 255)
		--addEvent(doSendMagicEffect, 30, {x = pos.x+1, y = pos.y-1, z = pos.z}, 82)
	elseif getCreatureLookDir(cid) == 1 then
	--doAreaCombatCondition(cid, find_area, NARASHI, condition, 255)
		addEvent(doAreaCombatHealth, 30, cid, COMBAT_PHYSICALDAMAGE, find_area, NARASHI, mdmg, dmg, 81)
		--addEvent(doSendMagicEffect, 30, {x = pos.x+5, y = pos.y+1, z = pos.z}, 81)
	elseif getCreatureLookDir(cid) == 2 then
	--doAreaCombatCondition(cid, find_area, NARASHI, condition, 255)
		addEvent(doAreaCombatHealth, 30, cid, COMBAT_PHYSICALDAMAGE, find_area, NARASHI, mdmg, dmg, 80)
		--addEvent(doSendMagicEffect, 30, {x = pos.x+1, y = pos.y+5, z = pos.z}, 80)
	elseif getCreatureLookDir(cid) == 3 then
	--doAreaCombatCondition(cid, find_area, NARASHI, condition, 255)
		addEvent(doAreaCombatHealth, 30, cid, COMBAT_PHYSICALDAMAGE, find_area, NARASHI, mdmg, dmg, 79)
		--addEvent(doSendMagicEffect, 60, {x = pos.x-1, y = pos.y+1, z = pos.z}, 79)
	end
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid,combat, var)
end
