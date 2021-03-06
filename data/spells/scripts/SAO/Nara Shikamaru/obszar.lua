local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818


local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)
setConditionFormula(condition, -0.8, 0, -0.8, 0)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
		if not isCreature(cid) then
				return true
		end
		if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
		
		local area = {
				{1, 1, 1, 1, 1},
				{0, 1, 1, 1, 0},
				{1, 1, 3, 1, 1},
				{0, 1, 1, 1, 0},
				{1, 1, 1, 1, 1},
		}
	
		
	
		
		local level = getPlayerLevel(cid)
		local mlevel = getPlayerMagLevel(cid) 
		local jutsuDmg = 60
		local skill_factor = math.ceil((mlevel + level)/2)
		local dmg = math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.53))
		local mini = math.max(1, math.ceil(((skill_factor*0.45) * jutsuDmg)*0.53))
		local pos = getCreaturePosition(cid)
		addEvent(doSendMagicEffect, 30, {x = pos.x+1, y = pos.y+1, z = pos.z}, 83)
		addEvent(doSendMagicEffect, 80, {x = pos.x+2, y = pos.y+2, z = pos.z}, 83)
		pos = getPosfromArea(cid,area)
		n = 0
		while n < #pos do
				n = n+1
				addEvent(doAreaCombatHealth, 30, cid, 1, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, area, -mini, -dmg, 83)
				doAreaCombatCondition(cid, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, area, condition, 255)
		end
		exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
end