local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818


local function onDash(cid)
	if not isCreature(cid) then
		return true
	end
local level = getPlayerLevel(cid) 
local jutsuDmg = 40
local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.25))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.25))
 local poslook = getCreatureLookPosition(cid)
 poslook.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
     if isWalkable(poslook, false, false, true) then
     if not isCreature(getThingfromPos(poslook).uid) then
          doMoveCreature(cid, getPlayerLookDirection(cid))
     return TRUE
      else
          doMoveCreature(cid, getPlayerLookDirection(cid))
          doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, getCreaturePosition(cid), area, mdmg, dmg, efeito)
     return TRUE
      end
       end
       end

function iniciarEntry(cid)
	if not isCreature(cid) then
		return true
	end
         
         addEvent(actionMove, 100, cid, 198, 500)-- wjazd
end

function finalizarEntry(cid)
	if not isCreature(cid) then
		return true
	end
         
         addEvent(doRemoveCondition, 500, cid, CONDITION_OUTFIT)
end

local function dash(cid)
	if not isCreature(cid) then
		return true
	end
 local distance = 3

      for i = 0, distance do
      addEvent(onDash,160*i,cid)
       end
end

function onCastSpell(cid, var)
	if not isCreature(cid) then
		return true
	end
		 	if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
         iniciarEntry(cid)
		 setPlayerStorageValue(cid, STORAGE_DIRECTION, 1)
         addEvent(dash, 320, cid)
		 addEvent(function()
		 if not isCreature(cid) then return true end
		 setPlayerStorageValue(cid, STORAGE_DIRECTION, 0)
		 end, 1000)
         addEvent(finalizarEntry, 500, cid)
         addEvent(doCreatureSay, 100, cid, "DYNAMIC..", TALKTYPE_MONSTER)
		 addEvent(doCreatureSay, 200, cid, "ENTRY!!", TALKTYPE_MONSTER)
		exhaustion.set(cid, storage, waittime)
		doCombat(cid,combat, var)
return false
end 