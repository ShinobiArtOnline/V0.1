local combat = createCombatObject()
local waittime = 2.0 -- czas
local storage = 115818
function onCastSpell(cid, var)
if not isCreature(cid) then
return true
end
local level = getPlayerLevel(cid)
local mlevel = getPlayerMagLevel(cid) 
local jutsuDmg = 31
local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.30))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.30))
if exhaustion.check(cid, storage) then
			doPlayerSendCancel(cid, "You are exhausted")
		return false
		end


local find_area = getFirstCreaturePosOnDirection(cid,1)
local pos = getCreaturePosition(cid)
if getCreatureLookDir(cid) == 0 then
addEvent(doAreaCombatHealth, 60, cid, COMBAT_FIREDAMAGE, find_area, KATON, mdmg, dmg, 255)
addEvent(doAreaCombatHealth, 220, cid, COMBAT_FIREDAMAGE, find_area, KATON, mdmg, dmg, 255)
addEvent(doSendMagicEffect, 60, {x = pos.x, y = pos.y-1, z = pos.z}, 46)
addEvent(doSendMagicEffect, 100, {x = pos.x, y = pos.y-1, z = pos.z}, 46)
elseif getCreatureLookDir(cid) == 1 then
addEvent(doAreaCombatHealth, 60, cid, COMBAT_FIREDAMAGE, find_area, KATON, mdmg, dmg, 255)
addEvent(doAreaCombatHealth, 220, cid, COMBAT_FIREDAMAGE, find_area, KATON, mdmg, dmg, 255)
addEvent(doSendMagicEffect, 60, {x = pos.x+5, y = pos.y, z = pos.z}, 47)
addEvent(doSendMagicEffect, 100, {x = pos.x+5, y = pos.y, z = pos.z}, 47)
elseif getCreatureLookDir(cid) == 2 then
addEvent(doAreaCombatHealth, 60, cid, COMBAT_FIREDAMAGE, find_area, KATON, mdmg, dmg, 255)
addEvent(doAreaCombatHealth, 220, cid, COMBAT_FIREDAMAGE, find_area, KATON, mdmg, dmg, 255)
addEvent(doSendMagicEffect, 60, {x = pos.x, y = pos.y+5, z = pos.z}, 45)
addEvent(doSendMagicEffect, 100, {x = pos.x, y = pos.y+5, z = pos.z}, 45)
elseif getCreatureLookDir(cid) == 3 then
addEvent(doAreaCombatHealth, 60, cid, COMBAT_FIREDAMAGE, find_area, KATON, dmg, dmg, 255)
addEvent(doAreaCombatHealth, 220, cid, COMBAT_FIREDAMAGE, find_area, KATON, dmg, dmg, 255)
addEvent(doSendMagicEffect, 60, {x = pos.x-1, y = pos.y, z = pos.z}, 48)
addEvent(doSendMagicEffect, 100, {x = pos.x-1, y = pos.y, z = pos.z}, 48)
end
exhaustion.set(cid, storage, waittime)
return doCombat(cid,combat, var)
end