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

local pos = getCreaturePosition(cid)
local find_area = getCreaturePosition(cid)
doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, pos, Marking_area , -min, -max, 255)
doAreaCombatMana(cid, pos, Marking_area , -min, -max, 255)	
end
end

local function lastHit(cid, min, max) 
if isCreature(cid) then
local target=getCreatureTarget(cid)
local pos = getCreaturePosition(target)


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
   addEvent(playerSay, 1600, cid, "Yon Shou")
 
   addEvent(playerSay, 1800, cid, "Hachi Shou")
   addEvent(playerSay, 2100, cid, "Juuroku Shou")
 
   addEvent(playerSay, 2200, cid, "SANJUUNI SHOU!!!")
  
   addEvent(playerSay, 3300, cid, "ROKUJUUYON SHOU!!!!")

   addEvent(playerSay, 3700, cid, "HYAKUNIJUUHACHI SHOU!!!!")
 
 
   
   for i = 1,21 do
      if hasSqm(position[i].pos) then
         local item = doCreateItem(position[i].item, 1, position[i].pos)
         doDecayItem(item)
         addEvent(remove, 3700, position[i].pos, position[i].item)
      end
   end  

local level = getPlayerLevel(cid) 
local jutsuDmg = 5
local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.10))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.3) * jutsuDmg)*0.10))
local min = -mdmg
local max = -dmg
   local find_area = getCreaturePosition(cid)
   for i = 1,12 do
  if isPlayer(getThingfromPos(find_area).uid) then
         addEvent(doPlayerAddMana, 70 + (40*i), getThingfromPos(find_area).uid, -(min*i))
   end
addEvent(playerCombat, 300, cid, (min), (max))	 
addEvent(playerCombat, 500, cid, (min), (max))
addEvent(playerCombat, 900, cid, (min), (max))
addEvent(playerCombat, 1300, cid, (min), (max))
addEvent(playerCombat, 1600, cid, (min), (max))
addEvent(playerCombat, 1900, cid, (min), (max))
addEvent(playerCombat, 2100, cid, (min), (max))
addEvent(playerCombat, 2300, cid, (min), (max))
addEvent(playerCombat, 2500, cid, (min), (max))
addEvent(playerCombat, 2700, cid, (min), (max))	
addEvent(playerCombat, 2900, cid, (min), (max))
addEvent(playerCombat, 2100, cid, (min), (max))
addEvent(playerCombat, 3300, cid, (min), (max))
addEvent(playerCombat, 3500, cid, (min), (max))
exhaustion.set(cid, storage, waittime)
return doCombat(cid,combat, var)
   end
return false
end