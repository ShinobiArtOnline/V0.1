function onStatsChange(cid, attacker, type, combat, value)
dmg = value
-----[ KAGEMANE ]------
if isMonster(cid) or isPlayer(attacker) or isPlayer(cid) then
---------------------------
-----[ Damage Color ]------
   if combat == COMBAT_JUUKEN then
   doSendAnimatedText(getThingPos(cid), "".. dmg .."", COLOR_LIGHTBLUE)
   elseif combat == COMBAT_KIKAICHUU then
   doSendAnimatedText(getThingPos(cid), "".. dmg .."", COLOR_LIGHTGREEN)
   elseif combat == COMBAT_RESISTENCE then
   doSendAnimatedText(getThingPos(cid), "".. dmg .."", COLOR_RED)
   elseif combat == COMBAT_NEHAN then
   doSendAnimatedText(getThingPos(cid), "".. dmg .."", COLOR_WHITE)
   setPlayerStorageValue(cid, sto_gen[5], os.time() + 7)
   setPlayerStorageValue(cid, sto_gen[3], 0)
   Nehan(cid, 7, 131, sto_gen[3])
   end
end
-----[ Damage Color ]------

-----[ Juuken Ryuu ]------
if isPlayer(attacker) and getPlayerStorageValue(attacker, 9997) == 1 and getPlayerVocation(attacker) == 4 then
   if combat == COMBAT_PHYSICALDAMAGE then
 
                        if isMonster(attacker) then
                       dmg = value*0.4
                       local maxdmg = math.ceil(dmg)
                       doTargetCombatHealth(attacker, cid, COMBAT_PHYSICALDAMAGE, -maxdmg, -maxdmg, 1)
					    elseif isPlayer(cid) then
                        dmg = value*0.2
                      local maxdmg = math.ceil(dmg)
                        doPlayerAddMana(cid, -maxdmg) 
                      end
  end
end

----MONSTER BLOCK SYSTEM----
if isPlayer(attacker) then
  if type == STATSCHANGE_HEALTHLOSS and isMonster(cid) then
    if math.random(1, 100) <= 4 then
         doSendAnimatedText(getCreaturePosition(cid), "Block..",COLOR_GREY)
         return false   
    end
  end
end

if isPlayer(cid) then
   ----[Invunerable System]----
   if getPlayerStorageValue(cid, STORAGE_DEFENSE) == 1 then
	doSendAnimatedText(getCreaturePosition(cid), "Def -".. value .."", 173)
   return false
   end
   
  if type == STATSCHANGE_HEALTHLOSS and isPlayer(cid) and isPlayer(attacker) or isMonster(attacker) then
   ----[SUSANOO]----
   if getPlayerStorageValue(cid, 123987) == 1 then
   local ChanceBlock = math.random(1,3)
   local ChanceBKHit = 2
   if ChanceBlock == ChanceBKHit then
	doSendAnimatedText(getCreaturePosition(cid), "Def - ".. value .."", 173)
	 else
	 return true
	end
	 return false
   end
 
   end
   ----[BLOCK]----
if type == STATSCHANGE_HEALTHLOSS and isPlayer(cid) and isPlayer(attacker) or isMonster(attacker) then
   local ChanceBlock = math.random(1, 300)
   local ChanceBKHit = getPlayerSkill(cid, 5)
   if ChanceBlock <= ChanceBKHit then
   doSendAnimatedText(getCreaturePosition(cid), "Block..",COLOR_GREY)    
      return false  
  end
----------[EVASION]----------
   local ChanceEva = math.random(1, 300)
   local ChanceEvHit = getPlayerSkill(cid, 1)
   if ChanceEva <= ChanceEvHit then
   doSendAnimatedText(getCreaturePosition(cid), "Evasion..", COLOR_GREEN)    
      return false  
    end
end
end
------ Sharingan ------ 
 if isPlayer(cid) and getPlayerVocation(cid) == 34 then
      ----[Sharingan level 1]----      
      if math.random(1,15) <= getPlayerLevel(cid) and getPlayerStorageValue(cid, 9999) <= 0 then
	  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Congratulations! You released the Sharingan Level 1!")
	   doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Congratulations! You released the Sharingan Level 1!. Write Sharingan Level 1")
	  setPlayerStorageValue(cid, 9999, 1)
	    setPlayerStorageValue(cid, 9998, 0)
	 end
end	  
      ----[Sharingan level 2]----                                                                                                
if getPlayerStorageValue(cid, 9998) >= 5 and getPlayerLevel(cid) >= 45 and getPlayerVocation(cid) == 34 
      and getPlayerStorageValue(cid, 9999) == 1 and math.random(1,5) == 1 and getPlayerStorageValue(cid, 9999) < 2 then 
      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Congratulations! You released the Sharingan Level 2!")
      doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Congratulations! You released the Sharingan Level 2!. Write Sharingan Level 2")
	 setPlayerStorageValue(cid, 9999, 2)
      setPlayerStorageValue(cid, 9998, 0)
	
      ----[Sharingan level 2]----    
    
end
      ----[Sharingan level 3]----    
if getPlayerStorageValue(cid, 9998) >= 200 and getPlayerLevel(cid) >= 20 and getPlayerVocation(cid) == 5
       and getPlayerStorageValue(cid, 9999) == 2 and math.random(1,300) == 1 then 
      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Congratulations! You released the Sharingan Level 3!")
	  doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Congratulations! You released the Sharingan Level 3!. Write Sharingan Level 3")
	  setPlayerStorageValue(cid, 9999, 3)
      setPlayerStorageValue(cid, 9998, 0)
	
      ----[Sharingan level 3]----    
	
end
      ----[Mangekyou Sharingan]----    
if getPlayerStorageValue(cid, 9998) >= 3000 and getPlayerLevel(cid) >= 80 and getPlayerVocation(cid) == 34  and getCreatureHealth(cid) <= (0.4*getCreatureMaxHealth(cid)) 
      and getPlayerStorageValue(cid, 9999) == 3 and math.random(1,10) == 1 then 
      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Congratulations! You released the Mangekyou Sharingan!")
      setPlayerStorageValue(cid, 9999, 4)
      setPlayerStorageValue(cid, 9998, 0)
	  
end
------ Sharingan ------ 
------ Genjutsu ------
    if getPlayerStorageValue(cid, 9998) >= 1 and getPlayerStorageValue(cid, 9999) == 2 and getPlayerVocation(cid) == 5 and getPlayerStorageValue(cid, 9922) <= 0 then 
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Congratulations! You released the genjutsu Kanashibari")
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Voce aprendeu um novo jutsu! (Kanashibari) Menu->Jutsus->Genjutsus")
		
		setPlayerStorageValue(cid, 9922, 1)
	end
   if getPlayerVocation(cid) == 5 and getPlayerStorageValue(cid, 9999) == 3 and math.random(1,100) == 70 and  getPlayerStorageValue(cid, 9919) <= 0 then 
      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Congratulations! You released the genjutsu Kaen")
      doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Voce aprendeu um novo jutsu! (Kaen) Menu->Jutsus->Genjutsus")
	   if(getPlayerItemCount(cid, 13445) == 1) then
	       local item = getPlayerItemById(cid, true, 13445)
	       doTransformItem(item.uid, 11462)
      end
        setPlayerStorageValue(cid, 9919, 1)
    
return true
end
return true
end