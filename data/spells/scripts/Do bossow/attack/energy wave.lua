local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_ENERGYAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 4.5, 7.5, 20, 55)

function onGetFormulaValues(cid, level, maglevel)
	local min = level / 5 + maglevel * 4.5 + 20
	local max = level / 5 + maglevel * 7.5 + 55
	return -min, -max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
local area = createCombatArea(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end