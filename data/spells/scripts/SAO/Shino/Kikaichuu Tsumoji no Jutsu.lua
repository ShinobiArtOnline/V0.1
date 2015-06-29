local temp = {
exhausted = 3,
}
local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

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
	if exhaustion.check(cid, storage) then
			doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
----[Restriçoes]-----    
    if getTilePzInfo(getPlayerPosition(cid)) then
        return doPlayerSendCancel(cid, "You in this area pz.")
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
		
		
		
local level = getPlayerLevel(cid)
local mlevel = getPlayerMagLevel(cid) 
local jutsuDmg = 65
local pos = pos or getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local dir = (target ~= 0) and getDirectionTo(pos, getCreaturePosition(target)) or getCreatureLookDirection(cid)
local tpos = (target ~= 0) and getCreaturePosition(target)
local newPos = getPosByDir(pos, dir)
local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.45) * jutsuDmg)*0.70))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.70))
		addEvent(doAreaCombatHealth, 0, cid, COMBAT_PHYSICALDAMAGE, newPos, NARASHI, mdmg, dmg, 31)
		--addEvent(doAreaCombatHealth, 0, cid, COMBAT_PHYSICALDAMAGE, tpos, 1, dmg, dmg, 35)
		addEvent(doAreaCombatMana, 0, cid, newPos, 1, mdmg, dmg, 255)
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
	else
		doPlayerSendCancel(cid, "You do not have chakra.")
		return true
	end
	exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
end