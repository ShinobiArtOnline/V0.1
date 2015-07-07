local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 0.0, 0, 0.4, 0)
 
 
function onUseWeapon(cid, var)
 if getPlayerSkill(cid, 1) > 0 then
      doPlayerAddSkillTry(cid, 3, 9)
	return doCombat(cid, combat, var)
 end
end