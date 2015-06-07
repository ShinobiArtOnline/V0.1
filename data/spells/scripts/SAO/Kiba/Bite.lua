local CONDICAO_DRUNK = createConditionObject(CONDITION_DRUNK)
  setConditionParam(CONDICAO_DRUNK, CONDITION_PARAM_TICKINVERVAL, 100)  


function onCastSpell(cid, var)
	if not isCreature(cid) then
		return true
	end
		local pet = getPlayerPet(cid)
		local find_area = getFirstCreaturePosOnDirection(cid, 1)
local level = getPlayerLevel(cid) 
local jutsuDmg = 8
local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.30))
		
		doAreaCombatHealth(cid, 1, getCreaturePosition(cid),BITE, BITE, dmg, 77)
		doAreaCombatHealth(cid, 1, getThingPos(cid), BITE, dmg, dmg, 255)
		doCreatureSay(cid, "Bite!!", TALKTYPE_MONSTER)
end 