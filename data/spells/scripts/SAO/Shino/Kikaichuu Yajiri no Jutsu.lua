local temp = {
exhausted = 3,
}
local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818


local confg = {
level = 1,
chakra = 25,
}

function conditSquareArea(pos, condt)
local position = {
[1] = {x = pos.x+1, y = pos.y, z = pos.z , stackpos=253},
[2] = {x = pos.x, y = pos.y+1, z = pos.z , stackpos=253},
[3] = {x = pos.x-1, y = pos.y, z = pos.z , stackpos=253},
[4] = {x = pos.x, y = pos.y-1, z = pos.z , stackpos=253},
[5] = {x = pos.x+1, y = pos.y-1, z = pos.z , stackpos=253},
[6] = {x = pos.x+1, y = pos.y+1, z = pos.z , stackpos=253},
[7] = {x = pos.x-1, y = pos.y-1, z = pos.z , stackpos=253},
[8] = {x = pos.x-1, y = pos.y+1, z = pos.z , stackpos=253},
[9] = {x = pos.x, y = pos.y, z = pos.z , stackpos=253}
}

end



function onCastSpell(cid, var)

if exhaustion.check(cid, storage) then
			doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
----[Restriçoes]-----    
    if getTilePzInfo(getPlayerPosition(cid)) then
        return doPlayerSendCancel(cid, "You in this area pz.") end 
	
	if checkJutsu(cid, "Kagemane") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if getPlayerStorageValue(cid, sto_gen[1]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")		
	end
---[Restriçoes]------
	
   if getPlayerLevel(cid) < confg.level then
				doPlayerSendCancel(cid, "You need to be atleast level ".. confg.level ..".") 
				return true
	end
   if isPlayer(cid) then
		removeChakraLife(cid, - confg.chakra)
		addEvent(doCreatureSay, 300, cid, "Kikkaichu..", TALKTYPE_MONSTER)
		addEvent(doCreatureSay, 300, cid, "Yajiri!!", TALKTYPE_MONSTER)
		
		local level = getPlayerLevel(cid)
		local mlevel = getPlayerMagLevel(cid) 
		local jutsuDmg = 50
		local skill_factor = math.ceil((mlevel + level)/2)
		local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.50))
		local mdmg = - math.max(1, math.ceil(((skill_factor*0.45) * jutsuDmg)*0.50))
		local target = getCreatureTarget(cid)
		local pos = getCreaturePosition(target)
		for n = 1,3 do
			addEvent(doAreaCombatHealth, 300*n, cid, COMBAT_PHYSICALDAMAGE, pos, 1, mdmg, dmg, 30)
			addEvent(doAreaCombatMana, 300*n, cid, pos, 1, mdmg, dmg, 255)
		end
			setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
		return true
	else
			doPlayerSendCancel(cid, "you do not have chakra.")
		return true
	end
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid,combat, var)
end