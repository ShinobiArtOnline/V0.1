local combat = createCombatObject()
local waittime = 6 -- czas
local storage = 115818

local temp = {
	exhausted = 7,
}


local config = {
     sqms = 13,
	 chakra = 50,
     effects = {
         [0] = 3,
         [1] = 3,
         [2] = 3,
         [3] = 3,
     },
     intervalo = 250
}

local function direcao(cid, pos, n)
local level = getPlayerLevel(cid) 
local jutsuDmg = 18
local skill_factor = math.ceil((jutsuSkill_factor(cid, 1) + level)/2)
local dmg = math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.20))
        local n = n or 0

        if (n < config.sqms) then
            if (isCreature(cid)) then
                local pos = pos or getCreaturePosition(cid)

                local dir = getCreatureLookDirection(cid)

                local newPos = getPosByDir(pos, dir)
if getCreatureLookDir(cid) == 0 then
		 doAreaCombatHealth(cid,COMBAT_HEALING, pos, BITE, dmg, dmg, 3)
	elseif getCreatureLookDir(cid) == 1 then
	 doAreaCombatHealth(cid, COMBAT_HEALING, pos, BITE, dmg, dmg, 3)
	elseif getCreatureLookDir(cid) == 2 then
	 doAreaCombatHealth(cid, COMBAT_HEALING, pos, BITE, dmg, dmg, 3)
	elseif getCreatureLookDir(cid) == 3 then
	 doAreaCombatHealth(cid, COMBAT_HEALING, pos, BITE, dmg, dmg, 3)
	end
             
                doAreaCombatHealth(cid, COMBAT_HEALING, newPos, BITE, dmg, dmg, config.effects[dir])
                addEvent(direcao, config.intervalo, cid, newPos, n + 1)
            end
        end
    end

function onCastSpell(cid, var)	
	if	impossibleUse(cid) then
		return true
	end
		if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
		
	if checkDoing(cid) then
		return true
	end	
	if getPlayerStorageValue(cid, sto_gen[1]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")		
	end
	
	if getPlayerStorageValue(cid, sto_nara[7]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")
	end
	
	if isPlayer(cid) then
	    removeChakraLife(cid, - config.chakra)
		doCreatureSay(cid, "Kage Nui !!", TALKTYPE_MONSTER)
		direcao(cid)
		
		
		noMove(cid, 3000)
		exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
	end
    return true
end