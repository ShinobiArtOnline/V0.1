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
		local jutsuDmg = 45
		local skill_factor = math.ceil((mlevel + level)/2)
local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.4))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.45) * jutsuDmg)*0.4))
local find_area = getFirstCreaturePosOnDirection(cid, 1)
local pos = getCreaturePosition(cid)


	
	addEvent(doCreatureSay, 20, cid, "Katon:", TALKTYPE_MONSTER)
	addEvent(doCreatureSay, 30, cid, "Goukakyuu no Jutsu!", TALKTYPE_MONSTER)

	if getCreatureLookDir(cid) == 0 then
		addEvent(doAreaCombatHealth, 30, cid, COMBAT_FIREDAMAGE, find_area, KATON, mdmg, dmg, 255)
		addEvent(doSendMagicEffect, 30, {x = pos.x+1, y = pos.y-1, z = pos.z}, 17)
	elseif getCreatureLookDir(cid) == 1 then
		addEvent(doAreaCombatHealth, 30, cid, COMBAT_FIREDAMAGE, find_area, KATON, mdmg, dmg, 255)
		addEvent(doSendMagicEffect, 30, {x = pos.x+5, y = pos.y+1, z = pos.z}, 18)
	elseif getCreatureLookDir(cid) == 2 then
		addEvent(doAreaCombatHealth, 30, cid, COMBAT_FIREDAMAGE, find_area, KATON, mdmg, dmg, 255)
		addEvent(doSendMagicEffect, 30, {x = pos.x+1, y = pos.y+5, z = pos.z}, 19)
	elseif getCreatureLookDir(cid) == 3 then
		addEvent(doAreaCombatHealth, 30, cid, COMBAT_FIREDAMAGE, find_area, KATON, mdmg, dmg, 255)
		addEvent(doSendMagicEffect, 60, {x = pos.x-1, y = pos.y+1, z = pos.z}, 16)
	end
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid,combat, var)
end