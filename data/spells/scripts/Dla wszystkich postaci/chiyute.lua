local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 7)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 3, 2)

function onCastSpell(cid, var)
local waittime = 0.8 -- Tempo de exhaustion
local storage = 11511

if exhaustion.check(cid, storage) then
    doPlayerSendCancel(cid, "You are exhausted")
return false
end
exhaustion.set(cid, storage, waittime)
	return doCombat(cid, combat, var)
end