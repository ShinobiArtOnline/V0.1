local CONDICAO_POISON = createConditionObject(CONDITION_POISON)
  setConditionParam(CONDITION_POISON, CONDITION_PARAM_TICKINVERVAL, 10000)  
  addDamageCondition(CONDICAO_POISON, 50, 1000, -1)
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
		local area = {
				{1, 1, 1},
				{1, 2, 1},
				{1, 1, 1},
		}
		
local find_area = getFirstCreaturePosOnDirection(cid, 1)
local level = getPlayerLevel(cid) 
local jutsuDmg = 45
local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.3))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.45) * jutsuDmg)*0.3))
		
		doAreaCombatHealth(cid, 1, getCreaturePosition(cid),area, mdmg, dmg, 72)
		doCreatureSay(cid, "Bite!!", TALKTYPE_MONSTER)
		exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
end 