
local combat1 = createCombatObject()
local combat2 = createCombatObject()
local area1 = createCombatArea(SHOU)
local area2 = createCombatArea(SHOU2)                                   

local waittime = 2.0 -- czas
local storage = 115818
local combat5 = createCombatObject()
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)


function onTargetTile1(cid, pos)
local level = getPlayerLevel(cid)
local mlevel = getPlayerMagLevel(cid) 
local jutsuDmg = 50
local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.4))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.45) * jutsuDmg)*0.4))
quake(cid, pos, COMBAT_PHYSICALDAMAGE, -dmg, -dmg, effectdir(cid, 95, 95), true)
end

function onTargetTile2(cid, pos)	
local level = getPlayerLevel(cid)
local mlevel = getPlayerMagLevel(cid) 
local jutsuDmg = 50
local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.4))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.45) * jutsuDmg)*0.4))
quake(cid, pos, COMBAT_PHYSICALDAMAGE, -mdmg, -dmg, effectdir(cid, 95, 95), true)
end

setCombatCallback(combat1, CALLBACK_PARAM_TARGETTILE, "onTargetTile1")
setCombatCallback(combat2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")


function onCastSpell(cid, var)
	if not isCreature(cid) then
		return true
	end
if exhaustion.check(cid, storage) then
			doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
	local pos=getCreaturePosition(cid)
	addEvent(doSendMagicEffect, 500, {x = pos.x+1, y = pos.y+1, z = pos.z}, 26)
	local combat = {[1] = combat1, [2] = combat2, [3] = combat3, [4] = combat4}
	for i = 0,1 do
		addEvent(doCombat, 300+(100*i), cid, combat[i+1], var)
	end
	exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat5, var)
end
