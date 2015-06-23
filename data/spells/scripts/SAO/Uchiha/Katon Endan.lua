local temp = {
exhausted = 2,
}

local confg = {
chakra = 5,
}


function onCastSpell(cid, var)
	if not isCreature(cid) then
		return true
	end

local level = getPlayerLevel(cid)
local mlevel = getPlayerMagLevel(cid) 
local jutsuDmg = 11
local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.30))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.30))
-----[Restrições]-----
 

	if	impossibleUse(cid) then
		return true
	end

	if checkDoing(cid) then
		return true
	end	
local target = getCreatureTarget(cid)
local pos = getCreaturePosition(target)
-----[Restrições]-----
   if isPlayer(cid) then
        removeChakraLife(cid, - confg.chakra)
		addEvent(doCreatureSay, 10, cid, "Katon:", TALKTYPE_MONSTER)
		addEvent(doCreatureSay, 30, cid, "Endan no Jutsu!", TALKTYPE_MONSTER)

		addEvent(doSendDistanceShoot, 30, getCreaturePosition(cid), pos, 27)
		addEvent(doAreaCombatHealth, 40, cid, COMBAT_FIREDAMAGE, pos, 0, mdmg, dmg, 5)
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
	end
	return true
end