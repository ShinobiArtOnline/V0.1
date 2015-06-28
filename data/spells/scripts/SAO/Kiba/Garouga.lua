local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local config = {
     sqms = 1,
	 chakra = 50,
     effects = {
         [0] = 68,
         [1] = 69,
         [2] = 67,
         [3] = 70,
     },
     intervalo = 900
}

		
local function onDash(cid)
	if not isCreature(cid) then
		return true
	end
local level = getPlayerLevel(cid) 
local jutsuDmg = 55
local skill_factor = math.ceil((jutsuSkill_factor(cid,0) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.6))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.45) * jutsuDmg)*0.6))
	local poslook = getCreatureLookPosition(cid)
	poslook.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
     if isWalkable(poslook, false, false, true) then
    	if not isCreature(getThingfromPos(poslook).uid) then
		 local n = n or 0

      
				local pos = pos or getCreaturePosition(cid)

                local dir = getCreatureLookDirection(cid)

                local newPos = getPosByDir(pos, dir)
				
         	 doMoveCreature(cid, getPlayerLookDirection(cid))
			  
			  doAreaCombatHealth(cid, 1, newPos, NEHAN, mdmg, dmg, config.effects[dir])
         	
			 --addEvent(onDash, config.intervalo, cid, newPos, n + 1)
			
     		return true
      	else
		  

        
                local pos = pos or getCreaturePosition(cid)

                local dir = getCreatureLookDirection(cid)

                local newPos = getPosByDir(pos, dir)
				
         	 doMoveCreature(cid, getPlayerLookDirection(cid))

			 -- addEvent(onDash, yy, cid, newPos, n + 1)
         	
     	
      	end
    end
	return true
end


local function iniciarTsuuga(cid)
	if not isCreature(cid) then
		return true
	end
        
		mayNotMove(cid, true)
         addEvent(actionMove, 20, cid, 400, 600)
         addEvent(mayNotMove, 310, cid, false)
end

local function finalizarTsuuga(cid)
	if not isCreature(cid) then
		return true
	end
         addEvent(doRemoveCondition, 600, cid, CONDITION_OUTFIT)
end

local function dashtsuuga(cid)
	if not isCreature(cid) then
		return true
	end
	

 local distance = 2
      for i = 0, distance do
      addEvent(onDash,100*i,cid)
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
		 
		
		--doPlayerAddSkillTry(cid, 3, 100)
		-- if getPlayerSkill(cid, 3) > 0 then
		--doPlayerAddSkill(cid, 7, 1)
		--end
         iniciarTsuuga(cid)
		 setPlayerStorageValue(cid, STORAGE_DIRECTION, 1)
         addEvent(function()
		 if not isCreature(cid) then return true end
		 dashtsuuga(cid)
		 end, 32)
		 addEvent(function()
		 if not isCreature(cid) then return true end
		 setPlayerStorageValue(cid, STORAGE_DIRECTION, 0)
		 end, 200)
         addEvent(function()
		  if not isCreature(cid) then return true end
		 finalizarTsuuga(cid)
		 end, 200)
         doCreatureSay(cid, "TSUUU", TALKTYPE_MONSTER)
		 addEvent(doCreatureSay, 100, cid, "GGAAA!!!", TALKTYPE_MONSTER)
		 exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
end 
	
