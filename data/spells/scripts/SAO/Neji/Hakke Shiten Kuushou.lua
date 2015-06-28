local waittime = 1.5 -- czas
local storage = 115818

local combat1 = createCombatObject()
local combat2 = createCombatObject()
local combat3 = createCombatObject()
local area1 = createCombatArea(Shiten)
local area2 = createCombatArea(Shiten)                                   
local area3 = createCombatArea(Shiten)                         

setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)

function onTargetTile1(cid, pos)
	local level = getPlayerMagLevel(cid)
	local mlevel = getPlayerMagLevel(cid) 
	local jutsuDmg = 90
	local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.40))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.40))
quake(cid, pos, COMBAT_PHYSICALDAMAGE, -mdmg, -dmg, effectdir(cid, 99, 97), true)
end
function onTargetTile2(cid, pos)
local level = getPlayerMagLevel(cid)
	local mlevel = getPlayerMagLevel(cid) 
	local jutsuDmg = 90
	local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.40))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.40))
quake(cid, pos, COMBAT_PHYSICALDAMAGE, -mdmg, -dmg, effectdir(cid, 99, 97), true)
end
function onTargetTile3(cid, pos)
local level = getPlayerMagLevel(cid)
	local mlevel = getPlayerMagLevel(cid) 
	local jutsuDmg = 90
	local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.40))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.40))
quake(cid, pos, COMBAT_PHYSICALDAMAGE, -mdmg, -dmg, effectdir(cid, 99, 97), true)
end

setCombatCallback(combat1, CALLBACK_PARAM_TARGETTILE, "onTargetTile1")
setCombatCallback(combat2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")
setCombatCallback(combat3, CALLBACK_PARAM_TARGETTILE, "onTargetTile3")


function onCastSpell(cid, var)
if not isCreature(cid) then
return true
end

addEvent(doCreatureSay, 50, cid, "Kuushou!", TALKTYPE_MONSTER)
local combat = {[1] = combat1, [2] = combat2, [3] = combat3,}
for i = 1,3 do
addEvent(doCombat, (500*i), cid, combat[i], var)
end
exhaustion.set(cid, storage, waittime)
return doCombat(cid,combat1, var)
end