local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local function remove(pos, id)
local item = getTileItemById(pos, id).uid
if item > 1 then
   doRemoveItem(item, 1)
end
end

local function playerSay(cid, text)
if isCreature(cid) then
doCreatureSay(cid, text, TALKTYPE_MONSTER)
end
end 

local function playerCombat(cid, min, max) 
if isCreature(cid) then
local find_area = getFirstCreaturePosOnDirection(cid,1)
doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, find_area, 0, -min, -max, 255)
doAreaCombatMana(cid, find_area, 0, -min, -max, 255)	
end
end

local function lastHit(cid, min, max) 
if isCreature(cid) then
local pos = getCreaturePosition(cid)
local find_area = getFirstCreaturePosOnDirection(cid,1)
quakePush(cid, find_area, 1, 0, 0, 255, true)
end
end
	
function onCastSpell(cid, var)
if exhaustion.check(cid, storage) then
			doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
   local pos = getCreaturePosition(cid)
   local position = {
         [1] = {pos = {x = pos.x, y = pos.y, z = pos.z}, item = 11411},
         [2] = {pos = {x = pos.x, y = pos.y-1, z = pos.z}, item = 11417},
         [3] = {pos = {x = pos.x+1, y = pos.y-1, z = pos.z}, item = 11420},
         [4] = {pos = {x = pos.x+1, y = pos.y, z = pos.z}, item = 11415},
         [5] = {pos = {x = pos.x+1, y = pos.y+1, z = pos.z}, item = 11412},
         [6] = {pos = {x = pos.x, y = pos.y+1, z = pos.z}, item = 11413},
         [7] = {pos = {x = pos.x-1, y = pos.y+1, z = pos.z}, item = 11414},
         [8] = {pos = {x = pos.x-1, y = pos.y, z = pos.z}, item = 11416},
         [9] = {pos = {x = pos.x-1, y = pos.y-1, z = pos.z}, item = 11418},  
         [10] = {pos = {x = pos.x, y = pos.y-2, z = pos.z}, item = 11419},
         [11] = {pos = {x = pos.x-1, y = pos.y-2, z = pos.z}, item = 11433},
         [12] = {pos = {x = pos.x+1, y = pos.y-2, z = pos.z}, item = 11434},
         [13] = {pos = {x = pos.x+2, y = pos.y-1, z = pos.z}, item = 11435},
         [14] = {pos = {x = pos.x+2, y = pos.y, z = pos.z}, item = 11436},
         [15] = {pos = {x = pos.x+2, y = pos.y+1, z = pos.z}, item = 11437},
         [16] = {pos = {x = pos.x, y = pos.y+2, z = pos.z}, item = 11438},
         [17] = {pos = {x = pos.x-1, y = pos.y+2, z = pos.z}, item = 11439},
         [18] = {pos = {x = pos.x-2, y = pos.y, z = pos.z}, item = 11440},
         [19] = {pos = {x = pos.x+1, y = pos.y+2, z = pos.z}, item = 11441},
         [20] = {pos = {x = pos.x-2, y = pos.y+1, z = pos.z}, item = 11442},
         [21] = {pos = {x = pos.x-2, y = pos.y-1, z = pos.z}, item = 11443}
   }
   addEvent(playerSay, 0, cid, "Hakke..")
  
   addEvent(playerSay, 1400, cid, "Ni Shou")
   addEvent(playerSay, 2100, cid, "Yon Shou")
   
   addEvent(playerSay, 2800, cid, "Hachi Shou")
   addEvent(playerSay, 3600, cid, "Juuroku Shou")

   addEvent(playerSay, 4900, cid, "SANJUUNI SHOU!!!")


   for i = 1,21 do
      if hasSqm(position[i].pos) then
         local item = doCreateItem(position[i].item, 1, position[i].pos)
         doDecayItem(item)
         addEvent(remove, 760, position[i].pos, position[i].item)
      end
   end 
   
	local level = getPlayerMagLevel(cid)
		local mlevel = getPlayerMagLevel(cid) 
		local jutsuDmg = 3
		local skill_factor = math.ceil((mlevel + level)/3)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.10))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.3) * jutsuDmg)*0.10))
local min = -dmg
local max = -mdmg

   local find_area = getFirstCreaturePosOnDirection(cid,1)
   for i = 1,10 do
   if isPlayer(getThingfromPos(find_area).uid) then
         addEvent(doPlayerAddMana, 700 + (700*i), getThingfromPos(find_area).uid, -(min*i))
   end
addEvent(playerCombat, 70, cid, (min), (max))	 
addEvent(playerCombat, 110, cid,(min), (max))
addEvent(playerCombat, 130, cid, (min), (max))
addEvent(playerCombat, 150, cid, (min), (max))
addEvent(playerCombat, 170, cid, (min), (max))
addEvent(playerCombat, 190, cid, (min), (max))
addEvent(playerCombat, 210, cid, (min), (max))
addEvent(playerCombat, 230, cid, (min), (max))
addEvent(playerCombat, 250, cid, (min), (max))
addEvent(playerCombat, 270, cid, (min), (max))	
addEvent(playerCombat, 290, cid, (min), (max))
addEvent(playerCombat, 310, cid, (min), (max))
addEvent(playerCombat, 330, cid, (min), (max))
addEvent(playerCombat, 350, cid, (min), (max))
addEvent(playerCombat, 370, cid, (min), (max))	
addEvent(playerCombat, 390, cid, (min), (max))
addEvent(playerCombat, 410, cid, (min), (max))
addEvent(playerCombat, 430, cid, (min), (max))
addEvent(playerCombat, 450, cid, (min), (max))
addEvent(playerCombat, 470, cid, (min), (max))	
addEvent(playerCombat, 490, cid, (min), (max))
addEvent(playerCombat, 510, cid, (min), (max))
addEvent(playerCombat, 530, cid, (min), (max))
addEvent(playerCombat, 550, cid, (min), (max))	
addEvent(playerCombat, 590, cid, (min), (max))
addEvent(lastHit, 600, cid, (min), (max))
exhaustion.set(cid, storage, waittime)
	return doCombat(cid,combat, var)
   end
return false
end