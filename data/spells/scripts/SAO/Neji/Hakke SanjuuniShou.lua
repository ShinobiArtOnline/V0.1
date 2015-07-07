local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.1, 1, -2.2, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -4.2, 1, -3.2, 1)






arr1 = {
	{3}
}

arr2 = {
	{3}
}



local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)


setCombatArea(combat1, area1)
setCombatArea(combat2, area2)


 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end


 
function onCastSpell(cid, var)
local position127 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local parameters = { cid = cid, var = var}
local target = getCreatureTarget(cid)
local pos = getCreaturePosition(target)
addEvent(doSendMagicEffect, 200, {x = pos.x, y = pos.y, z = pos.z}, 71)
addEvent(doSendMagicEffect, 300, {x = pos.x, y = pos.y, z = pos.z}, 71)


addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 300, parameters)

return TRUE
end 