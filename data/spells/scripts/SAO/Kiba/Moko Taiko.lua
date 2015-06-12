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
		
		local target=getCreatureTarget(cid)
		local pos =getCreaturePosition(target)
		local find_area = getFirstCreaturePosOnDirection(cid, 1)
		local pet = getPlayerPet(cid)
		local find_area = getFirstCreaturePosOnDirection(cid, 1)
		local level = getPlayerLevel(cid) 
		local jutsuDmg = 12
		local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
		local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.30))
		doAreaCombatHealth(cid, 1, pos, 1, dmg, dmg, 75)
		addEvent(doAreaCombatHealth, 20, cid, 1, pos, Marking_area, 0, 0, 76)
		addEvent(doAreaCombatHealth, 60, cid, 1, pos, Marking_area, 0, 0, 108)
		doAreaCombatHealth(cid, 0, pos, Marking_area, dmg, dmg, 255)
		addEvent(doAreaCombatHealth, 20, cid, 1, pos, Marking_area, dmg, dmg, 255)
		addEvent(doAreaCombatHealth, 60, cid, 1, pos, Marking_area, dmg, dmg, 108)
		doCreatureSay(cid, "Moko Taiko!!", TALKTYPE_MONSTER)
		exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
end 