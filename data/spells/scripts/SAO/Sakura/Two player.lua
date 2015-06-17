local cf = 
{
 rateLevel = 1, -- quantia a ser multiplicada pelo level para a formula, deixando 1 irá ser level + (diferença do ml abaixo)
 rateMagic = 1, -- quantia a ser multiplicada pelo magic level para a formula, deixando 1 aqui e no level significa que a cura minima seria Level+ML
 perc = 100 -- quantia em % da variação entre cura mínima e máxima, deixando 100 significa que irá variar entre mínimo à mínimo*2(ou seja, se a cura minima for 50 varia entre 50~100)
}


local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)


function onGetFormulaValues(cid, level, maglevel) 
 min = ((level*cf.rateLevel) + (maglevel*cf.rateMagic))
 return min, min*(cf.perc/100+1)
end
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")


function onCastSpell(cid, var)
  local target = variantToNumber(var)
    if target ~= cid then
     doCombat(cid, combat, var)
    end
  doCombat(cid, combat, numberToVariant(cid))
 return true
end