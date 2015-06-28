local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

function onCastSpell(cid, var)
if checkDoing(cid) then
		return true
	end	
	if checkJutsu(cid, "Nikudan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if checkJutsu(cid, "Hari") then
		return doPlayerSendCancel(cid, "you cannot use jutsu ")	
	end
	if checkJutsu(cid, "Chou Baika") then
		return doPlayerSendCancel(cid, "you cannot use jutsu ")	
	end
	if checkJutsu(cid, "Mizudan	") then
		return doPlayerSendCancel(cid, "you cannot use jutsu ")	
	end
	if checkJutsu(cid, "Tongarashigan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
if not isCreature(cid) then
return true
end
if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
addEvent(doCreatureSay, 0, cid, "Bubun..", TALKTYPE_MONSTER)
addEvent(doCreatureSay, 30, cid, "BAIKA!!!", TALKTYPE_MONSTER)
  local level = getPlayerLevel(cid) 
  local jutsuDmg = 37
  local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.55))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.35) * jutsuDmg)*0.55))
local find_area = getFirstCreaturePosOnDirection(cid, 1)
local pos = getThingPos(cid)
if getCreatureLookDir(cid) == 0 then
addEvent(doAreaCombatHealth, 20, cid, 1, find_area, AREA_HARITE2, mdmg, dmg, 255)
addEvent(doSendMagicEffect, 20, {x = pos.x+1, y = pos.y-1, z = pos.z}, 28)--Góra
elseif getCreatureLookDir(cid) == 1 then
addEvent(doAreaCombatHealth, 20, cid, 1, find_area, AREA_HARITE2, mdmg, dmg, 255)--Prawo
addEvent(doSendMagicEffect, 20, {x = pos.x+3, y = pos.y+1, z = pos.z}, 90)
elseif getCreatureLookDir(cid) == 2 then
addEvent(doAreaCombatHealth, 20, cid, 1, find_area, AREA_HARITE2, mdmg, dmg, 255)--Dół
addEvent(doSendMagicEffect, 20, {x = pos.x+1, y = pos.y+3, z = pos.z}, 89)
elseif getCreatureLookDir(cid) == 3 then
addEvent(doAreaCombatHealth, 20, cid, 1, find_area, AREA_HARITE2, mdmg, dmg, 255)--Lewo
addEvent(doSendMagicEffect, 20, {x = pos.x-1, y = pos.y+1, z = pos.z}, 27)
end

exhaustion.set(cid, storage, waittime)
return doCombat(cid,combat, var)
end