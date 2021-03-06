local function olhos(cid)
local pos = getThingPos(cid)
         doSendMagicEffect({x=pos.x+3, y=pos.y-1, z=pos.z}, 50, cid) -- Esquerdo
         doSendMagicEffect({x=pos.x-2, y=pos.y-1, z=pos.z}, 52, cid) -- Direito
end

local function effect(cid, life, times, effectFire, effectExplosion, effectThunder)

local pos = getThingPos(cid)
             addEvent(doSendMagicEffect, 800,cid, {x=pos.x+math.random(-4, 4), y=pos.y+math.random(1, 4), z=pos.z}, 5)
             addEvent(doSendMagicEffect, 800,cid, {x=pos.x-math.random(-4, 4), y=pos.y-math.random(1, 4), z=pos.z}, 14)
             addEvent(doSendMagicEffect, 1000,cid, {x=pos.x+math.random(-4, 4), y=pos.y+math.random(1, 4), z=pos.z}, 14)
             addEvent(doSendMagicEffect, 1000,cid, {x=pos.x-math.random(-4, 4), y=pos.y-math.random(1, 4), z=pos.z}, 5)
			 addEvent(doSendMagicEffect, 1600,cid, {x=pos.x+math.random(-4, 4), y=pos.y+math.random(1, 4), z=pos.z}, 5)
             addEvent(doSendMagicEffect, 1600,cid, {x=pos.x-math.random(-4, 4), y=pos.y-math.random(1, 4), z=pos.z}, 14)
             addEvent(doSendMagicEffect, 1900,cid, {x=pos.x+math.random(-4, 4), y=pos.y+math.random(1, 4), z=pos.z}, 14)
             addEvent(doSendMagicEffect, 1900,cid, {x=pos.x-math.random(-4, 4), y=pos.y-math.random(1, 4), z=pos.z}, 5)
			 addEvent(doSendMagicEffect, 2400,cid, {x=pos.x+math.random(-4, 4), y=pos.y+math.random(1, 4), z=pos.z}, 5)
             addEvent(doSendMagicEffect, 2400,cid, {x=pos.x-math.random(-4, 4), y=pos.y-math.random(1, 4), z=pos.z}, 14)
             addEvent(doSendMagicEffect,2800,cid, {x=pos.x+math.random(-4, 4), y=pos.y+math.random(1, 4), z=pos.z}, 14)
             addEvent(doSendMagicEffect, 2800,cid, {x=pos.x-math.random(-4, 4), y=pos.y-math.random(1, 4), z=pos.z}, 5)
			 addEvent(doSendMagicEffect, 3200,cid, {x=pos.x+math.random(-4, 4), y=pos.y+math.random(1, 4), z=pos.z}, 5)
             addEvent(doSendMagicEffect, 3200,cid, {x=pos.x-math.random(-4, 4), y=pos.y-math.random(1, 4), z=pos.z}, 14)
             addEvent(doSendMagicEffect, 3600,cid, {x=pos.x+math.random(-4, 4), y=pos.y+math.random(1, 4), z=pos.z}, 14)
             addEvent(doSendMagicEffect, 3600,cid, {x=pos.x-math.random(-4, 4), y=pos.y-math.random(1, 4), z=pos.z}, 5)
			 return true
      end


function onCastSpell(cid, var)
if not isCreature(cid) then
return true
end



if getPlayerSkillLevel(cid, 2) > getPlayerSkillLevel(cid, 5) and math.random(1,100) < 50 or math.random(1,100) > 80 then
local min = (getPlayerLevel(cid)*0.1 + getPlayerSkill(cid,2)*0.1)
local max = (getPlayerLevel(cid)*0.2 + getPlayerSkill(cid,2)*0.2)
addEvent(doAreaCombatHealth, 800, cid, 1, {x = 2405, y = 52, z = 7}, 0, -min, -max, 4)
addEvent(doAreaCombatHealth, 1200, cid, 1, {x = 2405, y = 52, z = 7}, 0, -min, -max, 4)
addEvent(doAreaCombatHealth, 1500, cid, 1, {x = 2405, y = 52, z = 7}, 0, -min, -max, 4)
addEvent(doAreaCombatHealth, 1800, cid, 1, {x = 2405, y = 52, z = 7}, 0, -min, -max, 4)
addEvent(doAreaCombatHealth, 2200, cid, 1, {x = 2405, y = 52, z = 7}, 0, -min, -max, 4)
addEvent(doAreaCombatHealth, 2400, cid, 1, {x = 2405, y = 52, z = 7}, 0, -min, -max, 4)
addEvent(doAreaCombatHealth, 2700, cid, 1, {x = 2405, y = 52, z = 7}, 0, -min, -max, 4)
addEvent(doAreaCombatHealth, 3000, cid, 1, {x = 2405, y = 52, z = 7}, 0, -min, -max, 4)
addEvent(doAreaCombatHealth, 3400, cid, 1, {x = 2405, y = 52, z = 7}, 0, -min, -max, 4)
addEvent(doAreaCombatHealth, 3700, cid, 1, {x = 2405, y = 52, z = 7}, 0, -min, -max, 4)
addEvent(doAreaCombatHealth, 4000, cid, 1, {x = 2405, y = 52, z = 7}, 0, -min, -max, 4)



registerCreatureEvent(cid, "Tsuk")
	if #getCreatureSummons(cid) >= 1 then
		local summons = getCreatureSummons(cid)
			for _,cid in ipairs(summons) do
		if getCreatureName(cid) == getPlayerName(cid) then
			doSendMagicEffect(getCreaturePosition(cid), 107)
				doRemoveCreature(cid) 
		end
			end
	end
local outfit = getCreatureOutfit(cid)


	local oldPos = {}
	local target = {}		
	local pos = getPlayerPosition(cid)
	local bpos = {x=pos.x+2, y = pos.y, z = pos.z} 
	local farAwayPos = {x = 2347, y = 56, z = 7} 
	doCreatureSetLookDir(cid, 2)
		position = getThingPos(cid)
	table.insert(oldPos, position)
			addEvent(doSendPlayerExtendedOpcode, 450, cid, 124, "Radial Blur")
				addEvent(effect, 450, cid, dano, tempo, efeitoFogo, efeitoExplosao, efeitoRaio)
					addEvent(olhos, 450, cid)
	if getGlobalStorageValue(cid, 910562) == 1 then
		addEvent(doSendPlayerExtendedOpcode, 5000, cid, 124, "Sepia")
	end
	if getGlobalStorageValue(cid, 910562) == 2 then
		addEvent(doSendPlayerExtendedOpcode, 5000, cid, 124, "Default")
	end
		addEvent(doCreatureSay, 500, cid, "You will suffer this in the next 72\nhours.", TALKTYPE_MONSTER)
		doPlayerSendTextMessage(cid,22,"You have caught '"..getPlayerName(target).."' on your Genjutsu! (Tsukuyomi)")
			doPlayerSendTextMessage(cid,22,"You are under influence of a '"..getPlayerName(cid).."' Genjutsu! (Tsukuyomi)")	  
				addEvent(doTeleportThing, 400, cid, {x = 2405, y = 52, z = 7})
	tsukuyomis = addEvent(doTeleportThing, 5300, cid, oldPos[1])
					addEvent(actionMove, 500, cid, 380, 4450)
-----------------------------------------------------------------------------------------	
	local Tsukuyomi = doCreateMonster("Bunshin", farAwayPos)
			doConvinceCreature(cid, Tsukuyomi)
				setCreatureMaxHealth(Tsukuyomi, getCreatureMaxHealth(cid))
					doCreatureAddHealth(Tsukuyomi, getCreatureHealth(cid)-30)
						doSetCreatureOutfit(Tsukuyomi, 71, -1)
							setCreatureName(Tsukuyomi, "".. getCreatureName(cid) .."", "the player ".. getCreatureName(cid) .." on the influence of this genjutsu. (Tsukuyomi)")
								doChangeSpeed(Tsukuyomi, -getCreatureSpeed(cid))
									addEvent(doTeleportThing, 100, Tsukuyomi, getThingPos(cid))
										doSendMagicEffect(getThingPos(cid), 107)
	if #getCreatureSummons(cid) >= 1 then
		local summons = getCreatureSummons(cid)
			for _,cid in ipairs(summons) do
		if getCreatureName(cid) == getPlayerName(cid) then
			addEvent(doSendMagicEffect, 5000, getCreaturePosition(cid), 107)
				addEvent(doRemoveCreature, 5300, cid) 
-----------------------------------------------------------------------------------------
		end
			end
				return true
			end
		else
	end
		doSendMagicEffect(getCreaturePosition(cid), 3)
		doPlayerSendCancel(cid, "his genjutsu did not succeed.")
		return true
	end