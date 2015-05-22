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

 	if getPlayerVocation(cid) ~= 1 then
 		return true
	 end

local level = getPlayerLevel(cid) 
local jutsuDmg = 15
local skill_factor = math.ceil((jutsuSkill_factor(cid, 1) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.25))

	if isPlayer(cid) then
		removeChakraLife(cid, - confg.chakra)
		
		addEvent(doCreatureSay, 200, cid, "Katon:", TALKTYPE_MONSTER)
		addEvent(doCreatureSay, 600, cid, "Housenka no Jutsu!", TALKTYPE_MONSTER)
		addEvent(actionMove, 900, cid, 386, 100)
		addEvent(doAreaCombatHealth, 600, cid, COMBAT_FIREDAMAGE, toPosition, 0, dmg, dmg, 4)
		for i = 1,5 do
		local target = getCreatureTarget(cid)
		local pos = getCreaturePosition(target)
		addEvent(doSendDistanceShoot, 600+(1*i), getCreaturePosition(cid), pos, 8)
		addEvent(doAreaCombatHealth, 600+(1*i), cid, COMBAT_FIREDAMAGE, pos, 0, dmg, dmg, 4)
		addEvent(doAreaCombatCondition, 600+(1*i), cid, pos, 0, condition, 4)
	end

	for k = 1,5 do
		local target = getCreatureTarget(cid)
		local pos2 = getCreaturePosition(target)
		addEvent(doSendDistanceShoot, 900+(100*k), getCreaturePosition(cid), pos2, 8)
		local combat = addEvent(doAreaCombatHealth, 900+(100*k), cid, COMBAT_FIREDAMAGE, pos2, 0, dmg, dmg, 4)
		addEvent(doAreaCombatCondition, 900+(1*k), cid, pos2, 0, condition, 4)
	end

		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
		return true
	end
end