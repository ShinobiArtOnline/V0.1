local temp = {
exhausted = 3,
}
local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local confg = {
level = 1,
chakra = 45,
}
function onCastSpell(cid,var)
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
local mdmg = - math.max(1, math.ceil(((skill_factor*0.3) * jutsuDmg)*0.30))
-----[Restrições]-----

	if	impossibleUse(cid) then
		return true
	end

	if checkDoing(cid) then
		return true
	end	

	
------------------------
	if isPlayer(cid) then
		
		
		
		local target = getCreatureTarget(cid)
		local pos = getCreaturePosition(target)
		for i = 1,2 do
			addEvent(doSendDistanceShoot, 3+(2*i), getCreaturePosition(cid), pos, 11)
				addEvent(doAreaCombatHealth, 3+(2*i), cid, COMBAT_FIREDAMAGE, pos, 0, mdmg, dmg, 5)
			end
		
	end
	exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
end