local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2.5, 1, -1.5, 1)
local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 1000)
setCombatCondition(combat, condition)

local temp = {
exhausted = 3,
}
local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 125818


local confg = {
level = 1,
chakra = 25,
}
local area = {
				{0, 0, 0, 0, 0},
				{0, 0, 1, 0, 0},
				{0, 1, 3, 1, 0},
				{0, 0, 1, 0, 0},
				{0, 0, 0, 0, 0},
		}

function onCastSpell(cid, var)

if exhaustion.check(cid, storage) then
			doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
		
		local level = getPlayerLevel(cid)
		local mlevel = getPlayerMagLevel(cid) 
		local jutsuDmg = 50
		local skill_factor = math.ceil((mlevel + level)/2)
		local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.50))
		local mdmg = - math.max(1, math.ceil(((skill_factor*0.45) * jutsuDmg)*0.50))
		local target = getCreatureTarget(cid)
		local pos = getCreaturePosition(target)
		
			addEvent(doAreaCombatHealth, 30, cid, COMBAT_PHYSICALDAMAGE, {x = pos.x+1, y = pos.y, z = pos.z}, area, -80, -120, 20)
			doAreaCombatCondition(cid, pos, area, condition, 255)
	
	
	
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid,combat, var)
end
