local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local function finishJutsu(cid)   
if not isCreature(cid) then return true end
   mayNotMove(cid, false)
   addEvent(setPlayerStorageValue, 1, cid, STORAGE_KAGE_KUBI, 0)
end

local function kubi(cid, dmg, chakra, neck)
  if not isCreature(cid) then
     return finishJutsu(cid)
  end 
 local target=getCreatureTarget(cid)

             if(isCreature(cid)) then
                local targetPosition = getCreaturePosition(target) 
                doSendMagicEffect(targetPosition, 78) -- muda o effect pro que vc quiser
                if math.random(1,400) <= neck then
                   addEvent(doAreaCombatHealth,  0, cid, COMBAT_PHYSICALDAMAGE, targetPosition, 0, - getCreatureHealth(v), - getCreatureHealth(v), 15)
                   doSendAnimatedText(targetPosition, "K.O", COLOR_BLACK)
                else
                    doCreatureAddMana(cid, -chakra)
                   addEvent(doAreaCombatHealth,  0, cid, COMBAT_PHYSICALDAMAGE, targetPosition, 0, dmg, dmg, 15)
                       exhaustion.set(cid, storage, waittime)
					
				end
                finishJutsu(cid) 
             end
         end


function onCastSpell(cid, var)
if isPlayer(cid) then

  if  impossibleUse(cid) then
    return true
  end

  if checkDoing(cid) then
    return true
  end 
if exhaustion.check(cid, storage) then
			doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
  
if getPlayerLevel(cid) > 0 then
local level = getPlayerLevel(cid) 
local jutsuDmg = 70
local skill_factor = math.ceil((jutsuSkill_factor(cid, 1) + level)/2)
local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.20))
      doCreatureSay(cid, "Kage Kubi Shibari!", TALKTYPE_ORANGE_1)
      mayNotMove(cid, true)
      return kubi(cid, dmg, 10, 2) -- esse 10 é a quantidade de chakra que gasta
      -- e esse 1 é a chance em % de quebrar o pescoço do alvo e matar ele 
 
end
else
return doPlayerSendCancel(cid, "You have to catch somebody on your kagemane first.")
end 
doCombat(cid,combat, var)
return TRUE
end