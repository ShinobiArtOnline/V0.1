local combat = createCombatObject()
local confg = {
chakra = 10,
}
local waittime = 1 -- Tempo de exhaustion
local storage = 115818
function onCastSpell(cid, var)
		if not isCreature(cid) then
				return true
		end
		local area = {
				{1, 1, 1},
				{1, 2, 1},
				{1, 1, 1},
		}
	
		
		if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
		addEvent(doCreatureSay, 80, cid, "Kaiten!", TALKTYPE_MONSTER)
		local level = getPlayerMagLevel(cid)
		local mlevel = getPlayerMagLevel(cid) 

		local jutsuDmg = 65
		local skill_factor = math.ceil((mlevel + level)/3)
		local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.55))
		local mdmg = - math.max(1, math.ceil(((skill_factor*0.45) * jutsuDmg)*0.55))
		local pos = getCreaturePosition(cid)
		removeChakraLife(cid, - confg.chakra)
		addEvent(doSendMagicEffect, 90, {x = pos.x+1, y = pos.y+1, z = pos.z}, 105)
		
		addEvent(Defense, 400, cid, 160)
		pos = getPosfromArea(cid,area)
		n = 0
		while n < #pos do
				n = n+1
				addEvent(quake, 90, cid, {x=pos[n].x,y=pos[n].y,z=pos[n].z},COMBAT_PHYSICALDAMAGE, -mdmg, -dmg, 255, true)
				
		end
		return doCombat(cid,combat, var)
end