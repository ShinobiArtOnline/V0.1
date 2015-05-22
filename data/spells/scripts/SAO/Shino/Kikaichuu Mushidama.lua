local temp = {
   exhausted = 2,
}

local confg = {
		level = 5,
		chakra = 80,
}

local area = {
				{1, 1, 1},
				{1, 2, 1},
				{1, 1, 1},
		}

	 local function onCastSpell1(parameters, target)
    local targetpos = { x=getCreaturePosition(target).x, y=getCreaturePosition(target).y , z=getCreaturePosition(target).z }
    doSendMagicEffect(targetpos, CONST_ME_EXPLOSIONAREA)
    doCombat(parameters.cid, parameters.combat2, parameters.var)
    end	
		
		
function onCastSpell(cid, var)
	if not isCreature(cid) then
      return true
	end
   


	if getPlayerStorageValue(cid, sto_gen[1]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")		
	end
----[Restriçoes]-----    
    if getTilePzInfo(getPlayerPosition(cid)) then
        return doPlayerSendCancel(cid, "You in this area pz.") end 
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
	if(getPlayerStorageValue(cid, sto_jutsu[1]) > os.time() and getPlayerStorageValue(cid, sto_jutsu[1]) < 100+os.time()) then
		doPlayerSendTextMessage(cid, 24, "Voce ja esta fazendo um jutsu")
		return true
	end
   
		if isPlayer(cid) then
			removeChakraLife(cid, - confg.chakra)
			addEvent(doCreatureSay, 300, cid, "Kikaichuu!", TALKTYPE_MONSTER)
			addEvent(doCreatureSay, 400, cid, "Mushidama !!!", TALKTYPE_MONSTER)
			local find_area = getFirstCreaturePosOnDirection(cid, 1)
			local target = getCreatureTarget(cid)
		    local pos = getCreaturePosition(target)
			
local level = getPlayerLevel(cid) 
local jutsuDmg = 80
local skill_factor = math.ceil((jutsuSkill_factor(cid, 1) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.20))
for i = 1,3 do
			addEvent(doSendDistanceShoot, 300+(200*i), pos, pos, 41)
			addEvent(doAreaCombatHealth, 300+(200*i), cid, COMBAT_PHYSICALDAMAGE, pos, 0, dmg, dmg, 37)	
			end
        doAreaCombatHealth(cid, 1, find_area, 0, 0, 0, 75)
		addEvent(doAreaCombatHealth, 600, cid, 1, getThingPos(target), Marking_area, 0, 0, 76)
		addEvent(doAreaCombatHealth, 800, cid, 1, getThingPos(target), Marking_area, 0, 0, 37)
		doAreaCombatHealth(cid, 1, getThingPos(target), Marking_area, dmg, dmg, 255)
		addEvent(doAreaCombatHealth, 600, cid, 1, getThingPos(target), Marking_area, dmg, dmg, 255)
		addEvent(doAreaCombatHealth, 800, cid, 1, getThingPos(target), Marking_area, dmg, dmg, 37)
			addEvent(function()
			if not isCreature(cid) then return true end
			doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, pos, 0, dmg, dmg, 37)
			end, 60)
			addEvent(function()
			if not isCreature(cid) then return true end
			doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, pos, 0, dmg, dmg, 37)
			end, 120)
			addEvent(function()
			if not isCreature(cid) then return true end
			doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, pos, 0, dmg, dmg, 37)
			end, 180)
			setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
			local target = getCreatureTarget(cid)
          addEvent(onCastSpell1, 2, parameters, target)
		end
	return true
end