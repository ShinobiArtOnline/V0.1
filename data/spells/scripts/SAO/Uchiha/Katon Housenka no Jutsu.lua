local temp = {
exhausted = 2,
}

local confg = {
chakra = 15,
}

local condition = createConditionObject(CONDITION_FIRE)
setConditionParam(condition, CONDITION_PARAM_DELAYED, 1)
addDamageCondition(condition, 7, 1000, -2)

function onCastSpell(cid,var)
	
-----[Restrições]-----
	if  impossibleUse(cid) then return true end
	if 	checkDoing(cid) then return true end
-----[Restrições]-----

 	
local level = getPlayerLevel(cid)
local mlevel = getPlayerMagLevel(cid) 
local jutsuDmg = 18
local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.25))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.25))

	if isPlayer(cid) then
		removeChakraLife(cid, - confg.chakra)
		local target = getCreatureTarget(cid)
		local pos = getCreaturePosition(target)
		addEvent(doCreatureSay, 20, cid, "Katon:", TALKTYPE_MONSTER)
		addEvent(doCreatureSay, 60, cid, "Housenka no Jutsu!", TALKTYPE_MONSTER)
		addEvent(doAreaCombatHealth, 60, cid, COMBAT_FIREDAMAGE, pos, UCHI, mdmg, dmg, 4)
		for i = 1,5 do
		local target = getCreatureTarget(cid)
		local pos = getCreaturePosition(target)
		addEvent(doSendDistanceShoot, 50+(10*i), getCreaturePosition(cid), pos, 8)
		addEvent(doAreaCombatHealth, 50+(10*i), cid, COMBAT_FIREDAMAGE, pos, UCHI, mdmg, dmg, 4)
		addEvent(doAreaCombatCondition, 50+(10*i), cid, pos, UCHI, condition, 4)
	end

	for k = 1,5 do
		local target = getCreatureTarget(cid)
		local pos2 = getCreaturePosition(target)
		addEvent(doSendDistanceShoot, 90+(10*k), getCreaturePosition(cid), pos2, 8)
		local combat = addEvent(doAreaCombatHealth, 90+(100*k), cid, COMBAT_FIREDAMAGE, pos2,UCHI, mdmg, dmg, 4)
		addEvent(doAreaCombatCondition, 90+(10*k), cid, pos2, UCHI, condition, 4)
	end

		
		return true
	end
end