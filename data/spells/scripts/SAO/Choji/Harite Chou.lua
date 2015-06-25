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

addEvent(doCreatureSay, 0, cid, "Harite..", TALKTYPE_MONSTER)
addEvent(doCreatureSay, 300, cid, "Chou!!!", TALKTYPE_MONSTER)
  local level = getPlayerLevel(cid) 
  local jutsuDmg = 26
  local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
  local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.25))
  local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.25))
local find_area = getFirstCreaturePosOnDirection(cid, 1)
local pos = getCreaturePosition(cid)
if getCreatureLookDir(cid) == 0 then
addEvent(doAreaCombatHealth, 300, cid, 1, find_area, AREA_HARITE, mdmg, dmg, 255)--Góra
addEvent(doSendMagicEffect, 300, {x = pos.x+1, y = pos.y-1, z = pos.z},120)
addEvent(doSendMagicEffect, 300, {x = pos.x, y = pos.y-1, z = pos.z},120)
elseif getCreatureLookDir(cid) == 1 then
addEvent(doAreaCombatHealth, 300, cid, 1, find_area, AREA_HARITE, mdmg, dmg, 255)--PRawo
addEvent(doSendMagicEffect, 300, {x = pos.x+3, y = pos.y+1, z = pos.z}, 137)
addEvent(doSendMagicEffect, 300, {x = pos.x+3, y = pos.y, z = pos.z}, 137)
elseif getCreatureLookDir(cid) == 2 then
addEvent(doAreaCombatHealth, 300, cid, 1, find_area, AREA_HARITE, mdmg, dmg, 255)--Dół
addEvent(doSendMagicEffect, 300, {x = pos.x+1, y = pos.y+3, z = pos.z}, 122)
addEvent(doSendMagicEffect, 300, {x = pos.x, y = pos.y+3, z = pos.z}, 122)
elseif getCreatureLookDir(cid) == 3 then
addEvent(doAreaCombatHealth, 300, cid, 1, find_area, AREA_HARITE, mdmg, dmg, 255)--LEWo
addEvent(doSendMagicEffect, 300, {x = pos.x-1, y = pos.y, z = pos.z},121)
addEvent(doSendMagicEffect, 300, {x = pos.x-1, y = pos.y+1, z = pos.z},121)

end
exhaustion.set(cid, storage, waittime)
return doCombat(cid,combat, var)
end