local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 10)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat, COMBAT_PARAM_CREATEITEM, 11605)
local arr = {
{ 0, 0, 0, 0, 0, 0. },
{ 0, 0, 0, 0, 0, 0. },
{ 0, 0, 1, 1, 1, 0, },
{ 0, 0, 1, 3, 1, 0, },
{ 0, 0, 1, 1, 1, 0, },
{ 0, 0, 0, 0, 0, 0, },
{ 0, 0, 0, 0, 0, 0, },
}
local area = createCombatArea(arr)
setCombatArea(combat, area)
function onCastSpell(cid, var)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x-2, y=getThingPosition(getCreatureTarget(cid)).y-3, z=getThingPosition(getCreatureTarget(cid)).z}
local target = getCreatureTarget(cid)
local pos = getCreaturePosition(target)
addEvent(doSendMagicEffect, 1, {x = pos.x-2, y = pos.y-3, z = pos.z}, 255)
return doCombat(cid, combat, var)
end