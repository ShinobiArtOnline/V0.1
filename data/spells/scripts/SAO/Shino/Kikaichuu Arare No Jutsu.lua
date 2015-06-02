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
	
	if checkCmd(cid, "rest") then
		return doPlayerSendCancel(cid, "you cannot use jutsu while you are resting.")
	end
	if checkCmd(cid, "mold") then
		return doPlayerSendCancel(cid, "you cannot use jutsu while you are mold chakra")
	end
	if checkJutsu(cid, "Kagemane") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
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

	if(getPlayerStorageValue(cid, sto_jutsu[1]) > os.time() and getPlayerStorageValue(cid, sto_jutsu[1]) < 100+os.time()) then
		doPlayerSendTextMessage(cid, 24, "Voce ja esta fazendo um jutsu")
	return true
	elseif getPlayerLevel(cid) < confg.level then
		doPlayerSendCancel(cid, "You need to be atleast level ".. confg.level ..".") 
	return true
	end

	if isPlayer(cid) then
		removeChakraLife(cid, - confg.chakra)
		addEvent(doCreatureSay, 1, cid, "Kikkaichu !!", TALKTYPE_MONSTER)
		addEvent(doCreatureSay, 4, cid, "ARARE !!", TALKTYPE_MONSTER)
		
local level = getPlayerLevel(cid) 
local jutsuDmg = 27
local skill_factor = math.ceil((jutsuSkill_factor(cid, 1) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.20))
		addEvent(doSendDistanceShoot, 3, basePos, fromPos, 12)
		for i = 2,6 do
	local random = randomPos(cid, poss)
			addEvent(doSendDistanceShoot, 8+(1*i), newpos, random, 41)
			addEvent(doSendDistanceShoot, 14+(1*i), newpos, random, 41)
			addEvent(doAreaCombatHealth, 8+(1*i), cid, COMBAT_PHYSICALDAMAGE, random, 0, dmg, dmg, 31)
			addEvent(doAreaCombatHealth, 14+(1*i), cid, COMBAT_PHYSICALDAMAGE, random, 0, dmg, dmg, 31)
		end
			for k = 2,6 do
	local random2 = randomPos(cid, poss)
				addEvent(doSendDistanceShoot, 12+(1*k), newpos, random2, 41)
				addEvent(doSendDistanceShoot, 18+(1*k), newpos, random2, 41)
				addEvent(doAreaCombatHealth, 12+(1*k), cid, COMBAT_PHYSICALDAMAGE, random2, 0, dmg, dmg, 31)
				addEvent(doAreaCombatHealth, 18+(1*k), cid, COMBAT_PHYSICALDAMAGE, random2, 0, dmg, dmg, 31)
			end
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
	else
		doPlayerSendCancel(cid, "You do not have chakra.")
		return true
	end
end