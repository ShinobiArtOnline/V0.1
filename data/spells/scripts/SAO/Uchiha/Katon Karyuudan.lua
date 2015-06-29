local temp = {
exhausted = 2
}
local waittime = 1.5 -- czas
local storage = 115818

local confg = {
level = 1,
chakra = 30,
}

local function moviment(cid)

doCreatureSay(cid, "Katon:", TALKTYPE_MONSTER)
addEvent(doCreatureSay, 400, cid, "Karyuudan no Jutsu!", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
end

function onCastSpell(cid,var)
if exhaustion.check(cid, storage) then
			doPlayerSendCancel(cid, "You are exhausted")
		return false
		end

local level = getPlayerLevel(cid)
local mlevel = getPlayerMagLevel(cid) 
local jutsuDmg = 25
local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.25))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.25))
local pos = getCreaturePosition(cid)
	local target = getCreatureTarget(cid)
	local poss= getCreaturePosition(target)
	local newpos = {x=pos.x - 7, y = pos.y - 6, z = pos.z}
	local basePos = getCreaturePosition(cid)
	local fromPos = {x=basePos.x-3, y=basePos.y-8, z=basePos.z}

local function katonKaryuudan(cid, pos, poss)
local random = randomPos(cid, poss)
doSendDistanceShoot({x = pos.x+2, y = pos.y+1, z = pos.z}, random, 20)
addEvent(doAreaCombatHealth, 10, cid, COMBAT_FIREDAMAGE, poss, 0, mdmg, dmg, 5)
end


	if not isCreature(cid) then
		return true
	end
-----[Restrições]-----

	
-----[Restrições]-----

	if isPlayer(cid) then
		removeChakraLife(cid, - confg.chakra)
	local pos = getCreaturePosition(cid)
	if (poss.y == pos.y 
	or (poss.y <= pos.y+1 and poss.x >= pos.x+2) 
	or (poss.y <= pos.y-1 and poss.x >= pos.x+2) 
	or (poss.y <= pos.y+1 and poss.x >= pos.x+2) 
	or (poss.y <= pos.y and poss.x >= pos.x))
	and poss.x > pos.x then
		moviment(cid)
	local disteffect = {x = pos.x, y = pos.y, z = pos.z}
	local random = randomPos(cid, poss)
      for i = 1,4 do
      addEvent(katonKaryuudan, 100*i, cid, disteffect, poss)
      end
	elseif (poss.y == pos.y 
	or (poss.y <= pos.y+1 and poss.x <= pos.x-2) 
	or (poss.y <= pos.y-1 and poss.x <= pos.x-2) 
	or (poss.y <= pos.y+2 and poss.x <= pos.x-2) 
	or (poss.y <= pos.y-2 and poss.x <=  pos.x-2))
	and poss.x < pos.x then
		moviment(cid)
	local disteffect = {x = pos.x-2, y = pos.y, z = pos.z}
	local random = randomPos(cid, poss)
      for i = 1,4 do
      addEvent(katonKaryuudan, 100*i, cid, disteffect, poss)
      end
	elseif (poss.x == pos.x
	or (poss.y <= pos.y-2 and poss.x <= pos.x-1) 
	or (poss.y <= pos.y-2 and poss.x <= pos.x+1) 
	or (poss.y <= pos.y-2 and poss.x <= pos.x-2) 
	or (poss.y <= pos.y-2 and poss.x <= pos.x+2))
	and poss.y < pos.y then
	moviment(cid)
	local disteffect = {x = pos.x-1, y = pos.y-1, z = pos.z}
	local random = randomPos(cid, poss)
      for i = 1,4 do
      addEvent(katonKaryuudan, 100*i, cid, disteffect, poss)
      end
	elseif (poss.x == pos.x
	or (poss.y <= pos.y+2 and poss.x <= pos.x-1) 
	or (poss.y <= pos.y+2 and poss.x <= pos.x+1) 
	or (poss.y <= pos.y+2 and poss.x <= pos.x-2) 
	or (poss.y <= pos.y+2 and poss.x <= pos.x+2))
	and poss.y > pos.y then
		moviment(cid)
	local disteffect = {x = pos.x-1, y = pos.y+2, z = pos.z}
	local random = randomPos(cid, poss)
      for i = 1,4 do
      addEvent(katonKaryuudan, 100*i, cid, disteffect, random)
      end
      end
	end
	
	return true
end