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
local jutsuDmg = 20
local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.30))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.30))
	
	addEvent(doCreatureSay, 50, cid, "Kikkaichu", TALKTYPE_MONSTER)
	addEvent(doCreatureSay, 200, cid, "Bashira!", TALKTYPE_MONSTER)
for n = 0,3 do
local pos = getFirstCreaturePosOnDirection(cid,(n+1))
local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
	addEvent(doSendDistanceShoot, 60+180*n, newpos, pos, 41)
	addEvent(doAreaCombatHealth, 60+180*n, cid, COMBAT_PHYSICALDAMAGE, getFirstCreaturePosOnDirection(cid,(n+2)), 0, mdmg, dmg, 31)
	end
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid,combat, var)
end