local combat = createCombatObject()
local confg = {
chakra = 10,
}
local waittime = 0.5 -- Tempo de exhaustion
local storage = 115818
function onCastSpell(cid, var)
		if not isCreature(cid) then
				return true
		end
		local area = {
				{1 ,1, 1, 1, 1},
				{1 ,1, 2, 1, 1},
				{1, 1, 1, 1 ,1},
		}
	
		
		if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
		addEvent(doCreatureSay, 80, cid, "Kaiten!", TALKTYPE_MONSTER)
		local level = getPlayerLevel(cid) 
		local jutsuDmg = 16
		local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
		local dmg = math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.25))
		local mini = math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.25))
		local pos = getCreaturePosition(cid)
		removeChakraLife(cid, - confg.chakra)
		addEvent(doSendMagicEffect, 90, {x = pos.x+3, y = pos.y, z = pos.z}, 91)
		
		pos = getPosfromArea(cid,area)
		n = 0
		while n < #pos do
				n = n+1
		addEvent(doAreaCombatHealth, 30, cid, 1, {x=pos[n].x,y=pos[n].y,z=pos[n].z}, area, -mini, -dmg, 255)
		end
		return doCombat(cid,combat, var)
end