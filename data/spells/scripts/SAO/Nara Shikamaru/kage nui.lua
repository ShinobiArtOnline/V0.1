local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local temp = {
	exhausted = 7,
}


local config = {
     sqms = 3,
	 chakra = 50,
     effects = {
         [0] = 83,
         [1] = 85,
         [2] = 84,
         [3] = 86,
     },
     intervalo = 250
}

local function direcao(cid, pos, n)
local level = getPlayerLevel(cid)
local mlevel = getPlayerMagLevel(cid) 
local jutsuDmg = 60
local skill_factor = math.ceil((mlevel + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.40))
local mdmg = - math.max(1, math.ceil(((skill_factor*0.4) * jutsuDmg)*0.40))
        local n = n or 0

        if (n < config.sqms) then
            if (isCreature(cid)) then
                local pos = pos or getCreaturePosition(cid)

                local dir = getCreatureLookDirection(cid)

                local newPos = getPosByDir(pos, dir)
if getCreatureLookDir(cid) == 0 then
		 doAreaCombatHealth(cid, 1, pos, BITE, mdmg, dmg, 83)
	elseif getCreatureLookDir(cid) == 1 then
	 doAreaCombatHealth(cid, 1, pos, BITE, mdmg, dmg, 85)
	elseif getCreatureLookDir(cid) == 2 then
	 doAreaCombatHealth(cid, 1, pos, BITE, mdmg, dmg, 84)
	elseif getCreatureLookDir(cid) == 3 then
	 doAreaCombatHealth(cid, 1, pos, BITE, mdmg, dmg, 86)
	end
             
                doAreaCombatHealth(cid, 1, newPos, BITE, mdmg, dmg, config.effects[dir])
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
		
		setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
		noMove(cid, 1000)
		exhaustion.set(cid, storage, waittime)
		 return doCombat(cid,combat, var)
	end
    return true
end