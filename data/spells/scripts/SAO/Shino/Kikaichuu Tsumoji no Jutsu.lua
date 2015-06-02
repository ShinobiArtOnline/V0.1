local temp = {
exhausted = 3,
}


local confg = {
level = 1,
chakra = 50,
}

function onCastSpell(cid, var)
if not isCreature(cid) then
return true
end
	if getPlayerStorageValue(cid, sto_gen[1]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")		
	end
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
---[Restriçoes]------	
	
		if getPlayerLevel(cid) < confg.level then
			doPlayerSendCancel(cid, "You need to be atleast level ".. confg.level ..".") 
		return true
	end

   if isPlayer(cid) then
        removeChakraLife(cid, - confg.chakra)
		addEvent(doCreatureSay, 0, cid, "Kikkaichu", TALKTYPE_MONSTER)
		addEvent(doCreatureSay, 0, cid, "Tsumoji !", TALKTYPE_MONSTER)
		
		
local level = getPlayerLevel(cid) 
local jutsuDmg = 24
local pos = pos or getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local dir = (target ~= 0) and getDirectionTo(pos, getCreaturePosition(target)) or getCreatureLookDirection(cid)
local tpos = (target ~= 0) and getCreaturePosition(target)
local newPos = getPosByDir(pos, dir)
local skill_factor = math.ceil((jutsuSkill_factor(cid, 1) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.20))
		addEvent(doAreaCombatHealth, 0, cid, COMBAT_PHYSICALDAMAGE, newPos, 2, dmg, dmg, 35)
		--addEvent(doAreaCombatHealth, 0, cid, COMBAT_PHYSICALDAMAGE, tpos, 1, dmg, dmg, 35)
		addEvent(doAreaCombatMana, 0, cid, newPos, 1, dmg, dmg, 255)
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
	else
		doPlayerSendCancel(cid, "You do not have chakra.")
		return true
	end
end