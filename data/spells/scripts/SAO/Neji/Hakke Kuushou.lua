local waittime = 1.5 -- czas
local storage = 115818
local combat = createCombatObject()
local combat1 = createCombatObject()
local combat2 = createCombatObject()
local combat3 = createCombatObject()
local combat4 = createCombatObject()
local area1 = createCombatArea(WAVE1)
local area2 = createCombatArea(WAVE2)                                   
local area3 = createCombatArea(WAVE3)                         
local area4 = createCombatArea(WAVE4)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
function onTargetTile1(cid, pos)
local level = getPlayerLevel(cid) 
local jutsuDmg = 45
local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.45))
quake(cid, pos, COMBAT_PHYSICALDAMAGE, -dmg, -dmg, effectdir(cid, 99, 97), true)
end
function onTargetTile2(cid, pos)
local level = getPlayerLevel(cid) 
local jutsuDmg = 45
local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.45))
quake(cid, pos, COMBAT_PHYSICALDAMAGE, -dmg, -dmg, effectdir(cid, 99, 97), true)
end
function onTargetTile3(cid, pos)
local level = getPlayerLevel(cid) 
local jutsuDmg = 45
local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.45))
quake(cid, pos, COMBAT_PHYSICALDAMAGE, -dmg, -dmg, effectdir(cid, 99, 97), true)
end
function onTargetTile4(cid, pos)
local level = getPlayerLevel(cid) 
local jutsuDmg = 45
local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.45))
quake(cid, pos, COMBAT_PHYSICALDAMAGE, -dmg, -dmg, effectdir(cid, 99, 97), true)
end

setCombatCallback(combat1, CALLBACK_PARAM_TARGETTILE, "onTargetTile1")
setCombatCallback(combat2, CALLBACK_PARAM_TARGETTILE, "onTargetTile2")
setCombatCallback(combat3, CALLBACK_PARAM_TARGETTILE, "onTargetTile3")
setCombatCallback(combat4, CALLBACK_PARAM_TARGETTILE, "onTargetTile4")

function onCastSpell(cid, var)
if not isCreature(cid) then
return true
end
if exhaustion.check(cid, storage) then
			doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
addEvent(doCreatureSay, 50, cid, "Kuushou!", TALKTYPE_MONSTER)
local combat = {[1] = combat1, [2] = combat2, [3] = combat3, [4] = combat4,}
for i = 0,3 do
addEvent(doCombat, (100*i), cid, combat[i+1], var)
end
exhaustion.set(cid, storage, waittime)
return doCombat(cid,combat1, var)
end