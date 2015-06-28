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
  local jutsuDmg = 58
  local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
  local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.6))
  local mdmg = - math.max(1, math.ceil(((skill_factor*0.45) * jutsuDmg)*0.6))
local find_area = getFirstCreaturePosOnDirection(cid, 1)
local pos = getCreaturePosition(cid)
if getCreatureLookDir(cid) == 0 then
addEvent(doAreaCombatHealth, 3, cid, 1, find_area, AREA_HARITE, mdmg, dmg, 255)--Góra
addEvent(doSendMagicEffect, 3, {x = pos.x+1, y = pos.y-1, z = pos.z},120)
addEvent(doSendMagicEffect, 3, {x = pos.x, y = pos.y-1, z = pos.z},120)
elseif getCreatureLookDir(cid) == 1 then
addEvent(doAreaCombatHealth, 3, cid, 1, find_area, AREA_HARITE, mdmg, dmg, 255)--PRawo
addEvent(doSendMagicEffect, 3, {x = pos.x+3, y = pos.y+1, z = pos.z}, 137)
addEvent(doSendMagicEffect, 3, {x = pos.x+3, y = pos.y, z = pos.z}, 137)
elseif getCreatureLookDir(cid) == 2 then
addEvent(doAreaCombatHealth, 3, cid, 1, find_area, AREA_HARITE, mdmg, dmg, 255)--Dół
addEvent(doSendMagicEffect, 3, {x = pos.x+1, y = pos.y+3, z = pos.z}, 122)
addEvent(doSendMagicEffect, 3, {x = pos.x, y = pos.y+3, z = pos.z}, 122)
elseif getCreatureLookDir(cid) == 3 then
addEvent(doAreaCombatHealth, 3, cid, 1, find_area, AREA_HARITE, mdmg, dmg, 255)--LEWo
addEvent(doSendMagicEffect, 3, {x = pos.x-1, y = pos.y, z = pos.z},121)
addEvent(doSendMagicEffect, 3, {x = pos.x-1, y = pos.y+1, z = pos.z},121)

end
exhaustion.set(cid, storage, waittime)
return doCombat(cid,combat, var)
end