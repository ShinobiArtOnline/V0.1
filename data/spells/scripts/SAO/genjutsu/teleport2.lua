local config = {
	effectTarget = 9, -- efeito que dá no target ao acertá-lo
	effectFinal = 37, -- efeito que aparece na posição final onde vc será teleportado
	jumpMax = 3 -- número máximo de quadrados que irá pular
}

function onCastSpell(cid, var)

local maglevel, level, mana = getPlayerMagLevel(cid), getPlayerLevel(cid), getCreatureMana(cid)
local axe, sword, club, distance = getPlayerSkillLevel(cid, 3), getPlayerSkillLevel(cid, 2), getPlayerSkillLevel(cid, 1), getPlayerSkillLevel(cid, 4)
local shield, health = getPlayerSkillLevel(cid, 5), getCreatureHealth(cid)

	local formula = {
	min = ((level + maglevel)/5 + axe + sword + club + shield + (mana/1000)), --- formula de dano minimo
	max = ((level + maglevel)/5 + axe + sword + club + shield + ((mana + health)/1000)) --- formula de dano maximo
	}
	local target= getCreatureTarget(cid)
	local pos = getCreaturePos(cid, variantToNumber(var), config.jumpMax)
	local position = getCreaturePosition(target)
	if position then
		doTeleportThing(cid, position)
		doTargetCombatHealth(cid, variantToNumber(var), 1, -formula.min, -formula.max, config.effectTarget)
		doSendMagicEffect(pos, config.effectFinal)
	else
		doPlayerSendCancel(cid, "Sorry, not possible.")
	return false
	end
return true
end