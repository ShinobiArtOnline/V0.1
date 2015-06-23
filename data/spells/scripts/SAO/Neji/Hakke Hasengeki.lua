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
local jutsuDmg = 26
local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.30))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.30))
local find_area = getFirstCreaturePosOnDirection(cid,1)
local pos = getCreaturePosition(cid)

if isPlayer(getThingfromPos(find_area).uid) then
doPlayerAddMana(getThingfromPos(find_area).uid, -(max/2))
end
addEvent(doCreatureSay, 100, cid, "Hasengeki!", TALKTYPE_MONSTER)
if getCreatureLookDir(cid) == 0 then
doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, find_area, KAGE1, mdmg, dmg, 255)
doSendMagicEffect({x = pos.x, y = pos.y-1, z = pos.z}, 58)
elseif getCreatureLookDir(cid) == 1 then
doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, find_area, KAGE1, mdmg, dmg, 255)
doSendMagicEffect({x = pos.x+4, y = pos.y, z = pos.z}, 59)
elseif getCreatureLookDir(cid) == 2 then
doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, find_area, KAGE1, mdmg, dmg, 255)
doSendMagicEffect({x = pos.x, y = pos.y+4, z = pos.z}, 57)
elseif getCreatureLookDir(cid) == 3 then
doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, find_area, KAGE1, mdmg, dmg, 255)
doSendMagicEffect({x = pos.x-1, y = pos.y, z = pos.z}, 60)
end
for i = 1,3 do
addEvent(doMoveCreature2, 100*i, getThingfromPos(find_area).uid, getPlayerLookDir(cid), effectdir(cid, 54, 55))
	end
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid,combat, var)
end