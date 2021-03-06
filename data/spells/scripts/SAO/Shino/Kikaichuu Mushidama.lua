local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -7.9, 1, -6.9, 1)

function onCastSpell(cid, var)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
local target = getCreatureTarget(cid)
local pos = getCreaturePosition(target)
addEvent(doSendMagicEffect, 1, {x = pos.x, y = pos.y, z = pos.z}, 37)
return doCombat(cid, combat, var)
end