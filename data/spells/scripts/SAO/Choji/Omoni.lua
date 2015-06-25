local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local function onOmoni(cid)
  local level = getPlayerLevel(cid) 
  local jutsuDmg = 22
  local skill_factor = math.ceil((jutsuSkill_factor(cid, 0) + level)/2)
  local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.25))
  local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.25))
 local poslook = getCreatureLookPosition(cid)
 poslook.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
     if isWalkable(poslook, false, false, false) then
     if not isCreature(getThingfromPos(poslook).uid) then
          doMoveCreature(cid, getPlayerLookDirection(cid))
     return TRUE
      else
          doMoveCreature(cid, getPlayerLookDirection(cid))
          doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, getCreaturePosition(cid), area, mdmg, dmg, 93)
     return TRUE
      end
       end
       end

function iniciarOmoni(cid)
         addEvent(actionMove, 0, cid, 200, 200)
         addEvent(actionMove, 10, cid, 202, 200)
         addEvent(actionMove, 20, cid, 204, 1000)
		
		 addEvent(doSendMagicEffect, 100, getThingPos(cid), 111)
end

function finalizarOmoni(cid)
         addEvent(actionMove, 20, cid, 204, 1000)
		 addEvent(doSendMagicEffect, 200, getThingPos(cid), 93)
         addEvent(doRemoveCondition, 180, cid, CONDITION_OUTFIT)
end

local function dash(cid)
 local distance = 2

      for i = 0, distance do
      addEvent(onOmoni,160*i,cid)
      end
end

function onCastSpell(cid, var)
if	impossibleUse(cid) then
		return true
	end

	if checkDoing(cid) then
		return true
	end	
	if checkJutsu(cid, "Nikudan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if checkJutsu(cid, "Hari") then
		return doPlayerSendCancel(cid, "you cannot use jutsu ")	
	end
	if checkJutsu(cid, "Tongarashigan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end

if isPlayer(cid) and getPlayerStorageValue(cid, sto_sensha[6]) == 0 then

		 noMove(cid, 200)	
         iniciarOmoni(cid)
         addEvent(dash, 320, cid)
         addEvent(finalizarOmoni, 1000, cid)
         addEvent(doCreatureSay, 100, cid, "OMONI!!!!", TALKTYPE_MONSTER)
		 addEvent(doCreatureSay, 120, cid, "BOOMMM!!!!", TALKTYPE_MONSTER)
		 exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
		 else 
		 doPlayerSendCancel(cid, "USE first Chou Baika")
return false
end 
end