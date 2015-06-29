local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818


local temp = {
exhausted = 3,
}
local confg = {
level = 1,
chakra = 60,
}


function onCastSpell(cid, var)
----[Restriçoes]-----    
    if getTilePzInfo(getPlayerPosition(cid)) then
        return doPlayerSendCancel(cid, "You in this area pz.")
	end 
	
	if checkJutsu(cid, "Kagemane") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if exhaustion.check(cid, storage) then
			doPlayerSendCancel(cid, "You are exhausted")
		return false
		end

	if getPlayerStorageValue(cid, sto_gen[1]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")		
	end
---[Restriçoes]------
	local pos = getCreaturePosition(cid)
	local target = getCreatureTarget(cid)
	local poss= getCreaturePosition(target)
	local newpos = {x=pos.x - 7, y = pos.y - 6, z = pos.z}
	local basePos = getCreaturePosition(cid)
	local fromPos = {x=basePos.x-3, y=basePos.y-8, z=basePos.z}

	
	if getPlayerLevel(cid) < confg.level then
		doPlayerSendCancel(cid, "You need to be atleast level ".. confg.level ..".") 
	return true
	end

	if isPlayer(cid) then
		removeChakraLife(cid, - confg.chakra)
		
		
local level = getPlayerLevel(cid)
local mlevel = getPlayerMagLevel(cid) 
local jutsuDmg = 12
local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.25))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.25))
		addEvent(doSendDistanceShoot, 3, basePos, fromPos, 12)
		for i = 2,4 do
	local random = randomPos(cid, poss)
			addEvent(doSendDistanceShoot, 8+(1*i), newpos, poss, 41)
			addEvent(doSendDistanceShoot, 14+(1*i), newpos, random, 41)
			addEvent(doAreaCombatHealth, 8+(1*i), cid, COMBAT_PHYSICALDAMAGE, poss, 0, mdmg, dmg, 31)
			addEvent(doAreaCombatHealth, 14+(1*i), cid, COMBAT_PHYSICALDAMAGE, random, 0, mdmg, dmg, 31)
		end
			for k = 2,6 do
	local random2 = randomPos(cid, poss)
				addEvent(doSendDistanceShoot, 12+(1*k), newpos, poss, 41)
				addEvent(doSendDistanceShoot, 18+(1*k), newpos, random2, 41)
				addEvent(doAreaCombatHealth, 12+(1*k), cid, COMBAT_PHYSICALDAMAGE, poss, 0, mdmg, mdmg, 31)
				addEvent(doAreaCombatHealth, 18+(1*k), cid, COMBAT_PHYSICALDAMAGE, random2, 0, mdmg, dmg, 31)
			end
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
	else
		doPlayerSendCancel(cid, "You do not have chakra.")
		return true
	end
	exhaustion.set(cid, storage, waittime)
	return doCombat(cid,combat, var)
end