local CONDICAO_POISON = createConditionObject(CONDITION_POISON)
  setConditionParam(CONDITION_POISON, CONDITION_PARAM_TICKINVERVAL, 10000)  
  addDamageCondition(CONDICAO_POISON, 50, 1000, -1)


function onCastSpell(cid, var)
	if not isCreature(cid) then
		return true
	end
		local target= getCreatureTarget(cid)
		local pet = getCreatureSummons(cid)
		local find_area = getCreaturePosition(target)
		local level = getPlayerLevel(cid) 
		local jutsuDmg = 6
		local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
		local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.30))
		
		doAreaCombatHealth(cid, 1, getThingPos(target), Marking_area, dmg, dmg, 72)
		addEvent(doAreaCombatHealth, 20, cid, 1, getThingPos(target), Marking_area, dmg, dmg, 72)
		doAreaCombatCondition(cid, getThingPos(target), Marking_area, CONDICAO_POISON, 72)
		doCreatureSay(cid, "Dynamic Marking", TALKTYPE_MONSTER)
end 