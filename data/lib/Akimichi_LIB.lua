function iniNikudan(cid)
	
             mayNotMove(cid, true)
             addEvent(changeMove, 300, cid, 203, -1)--kula
			 addEvent(doCreatureSay, 100, cid, "Baika no Jutsu!", TALKTYPE_MONSTER)
             addEvent(doCreatureSay, 200, cid, "NIKUDAN SENSHAAA!!!!", TALKTYPE_MONSTER)
end

function iniMizudan(cid)
             mayNotMove(cid, true)
             addEvent(changeMove, 300, cid, 203, -1)
			 addEvent(doCreatureSay, 100, cid, "Baika no Jutsu!", TALKTYPE_MONSTER)
             addEvent(doCreatureSay, 200, cid, "MIZUDAN SUISHAAA!!!!", TALKTYPE_MONSTER)
end

function iniHariNikudan(cid)
             mayNotMove(cid, true)
			
			 addEvent(changeMove, 400, cid, 201, -1)--kula kolczasta
			 addEvent(doCreatureSay, 100, cid, "Baika no Jutsu!", TALKTYPE_MONSTER)
             addEvent(doCreatureSay, 200, cid, "NIKUDAN HARI SENSHAA!!!", TALKTYPE_MONSTER)
end

function endNikudan(cid)
            if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 25 then
             addEvent(changeMove, 0, cid, 21, -1)
			 mayNotMove(cid, false)
			 setPlayerStorageValue(cid, 676767, 1)
			 elseif getPlayerLevel(cid) >= 25 and getPlayerLevel(cid) < 50 then
			 addEvent(changeMove, 0, cid, 19, -1)
			mayNotMove(cid, false)
			 elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 80 then
			  addEvent(changeMove, 0, cid, 20, -1)
			  mayNotMove(cid, false)
			  setPlayerStorageValue(cid, 676767, 1)
			 elseif getPlayerLevel(cid) >= 80 and getPlayerLevel(cid) < 100 then
			  addEvent(changeMove, 0, cid, 22, -1)
			 mayNotMove(cid, false)
			 setPlayerStorageValue(cid, 676767, 1)
			   elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 500 then
			  addEvent(changeMove, 0, cid, 22, -1)
			  mayNotMove(cid, false)
			  setPlayerStorageValue(cid, 676767, 1)
			  end
end



function endMizudan(cid)
             
              if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 25 then
             addEvent(changeMove, 0, cid, 21, -1)
			 mayNotMove(cid, false)
			 elseif getPlayerLevel(cid) >= 25 and getPlayerLevel(cid) < 50 then
			 addEvent(changeMove, 0, cid, 19, -1)
			 mayNotMove(cid, false)
			 elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 80 then
			  addEvent(changeMove, 0, cid, 20, -1)
			  mayNotMove(cid, false)
			   elseif getPlayerLevel(cid) >= 80 and getPlayerLevel(cid) < 100 then
			  addEvent(changeMove, 0, cid, 22, -1)
			  mayNotMove(cid, false)
			  end
          
end

function endHariNikudan(cid)
  
            if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 25 then
             addEvent(changeMove, 0, cid, 21, -1)
			-- noMove(cid, 1000)
			 elseif getPlayerLevel(cid) >= 25 and getPlayerLevel(cid) < 50 then
			 addEvent(changeMove, 0, cid, 19, -1)
			-- noMove(cid, 1000)
			 setPlayerStorageValue(cid, sto_sensha[5], 0)
			 elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 80 then
			  addEvent(changeMove, 0, cid, 20, -1)
			 -- noMove(cid, 1000)
			  setPlayerStorageValue(cid, sto_sensha[5], 0)
			 elseif getPlayerLevel(cid) >= 80 and getPlayerLevel(cid) < 100 then
			  addEvent(changeMove, 0, cid, 22, -1)
			 -- noMove(cid, 1000)
			  setPlayerStorageValue(cid, sto_sensha[5], 0)
			   elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 500 then
			  addEvent(changeMove, 0, cid, 22, -1)
			  --noMove(cid, 1000)
			  setPlayerStorageValue(cid, sto_sensha[5], 0)
			  end
   
end

function nikudanSensha(cid, chakra, oldLook)
    if not isCreature(cid) or getPlayerStorageValue(cid, sto_sensha[1]) < 1 then
                return false
        end
 
        local minDmg = -(getPlayerLevel(cid)*1.5 + getPlayerSkill(cid, 0) * 1.6)
        local maxDmg = -(getPlayerLevel(cid)*1.4 + getPlayerSkill(cid, 0) * 1.5)
        local efeito = CONST_ME_NONE
        local poslook = getCreatureLookPosition(cid)
        poslook.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
		local newLook = getCreatureLookDir(cid)
 
     if isWalkable(poslook, false, false, true) then
	    if (oldLook == 0 and newLook == 2) or (oldLook == 2 and newLook == 0) or
         (oldLook == 1 and newLook == 3) or (oldLook == 3 and newLook == 1) then
		 doSendMagicEffect(getThingPos(cid), 107)
         addEvent(nikudanSensha, 500, cid, chakra, newLook)
         return true
		end
		if not isCreature(getThingfromPos(poslook).uid) then
          doMoveCreature(cid, getPlayerLookDirection(cid))
		else
          doMoveCreature(cid, getPlayerLookDirection(cid))
          doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, getCreaturePosition(cid), area, minDmg, maxDmg, efeito)
		end
		else
	        --setPlayerStorageValue(cid, 676767, 1)
			 if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
				mayNotMove(cid, false)
				addEvent(changeMove, 0, cid, 21, -1)
				addEvent(doCreatureSay, 10, cid, "OUCH!", TALKTYPE_MONSTER)
				doCreatureAddHealth(cid, -5)
				--setPlayerStorageValue(cid, 676767, 1)
				setPlayerStorageValue(cid, sto_sensha[1], 0)
			 elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
			 mayNotMove(cid, false)
				addEvent(changeMove, 0, cid, 19, -1)
				addEvent(doCreatureSay, 10, cid, "OUCH!", TALKTYPE_MONSTER)
				doCreatureAddHealth(cid, -15)
				setPlayerStorageValue(cid, sto_sensha[1], 0)
				 
			 elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
			 mayNotMove(cid, false)
				addEvent(changeMove, 0, cid, 20, -1)
				addEvent(doCreatureSay, 10, cid, "OUCH!", TALKTYPE_MONSTER)
				doCreatureAddHealth(cid, -25)
				setPlayerStorageValue(cid, sto_sensha[1], 0)
				
			   elseif getPlayerLevel(cid) >= 150 and getPlayerLevel(cid) < 200 then
			   mayNotMove(cid, false)
				addEvent(changeMove, 0, cid, 22, -1)
				addEvent(doCreatureSay, 10, cid, "OUCH!", TALKTYPE_MONSTER)
				doCreatureAddHealth(cid, -25)
				setPlayerStorageValue(cid, sto_sensha[1], 0)
				  
				elseif getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) < 500 then
				mayNotMove(cid, false)
				addEvent(changeMove, 0, cid, 22, -1)
				addEvent(doCreatureSay, 10, cid, "OUCH!", TALKTYPE_MONSTER)
				doCreatureAddHealth(cid, -25)
				  
				setPlayerStorageValue(cid, sto_sensha[1], 0)
			  end
           
			 end
			addEvent(nikudanSensha, 130, cid, chakra,newLook)
		return true
end



function mizudanSuisha(cid, chakra, oldLook)
 
        if not isCreature(cid) or getPlayerStorageValue(cid, sto_sensha[7]) < 1 then
                return false
        end
 
        local minDmg = -(getPlayerLevel(cid)*0.3 + getPlayerSkill(cid, 0) * 1.0)
        local maxDmg = -(getPlayerLevel(cid)*0.6 + getPlayerSkill(cid, 0) * 1.5)
        local efeito = CONST_ME_NONE
        local poslook = getCreatureLookPosition(cid)
        poslook.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
		local newLook = getCreatureLookDir(cid)
 
     if isWalkable(poslook, false, false, true) then
	   if (oldLook == 0 and newLook == 2) or (oldLook == 2 and newLook == 0) or
         (oldLook == 1 and newLook == 3) or (oldLook == 3 and newLook == 1) then
		 doSendMagicEffect(getThingPos(cid), 107)
         addEvent(mizudanSuisha, 800, cid, chakra, newLook)
         return true
      end
	   if not isCreature(getThingfromPos(poslook).uid) then
          doMoveCreature(cid, getPlayerLookDirection(cid))
		else
          doMoveCreature(cid, getPlayerLookDirection(cid))
          doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, getCreaturePosition(cid), area, minDmg, maxDmg, efeito)
		  end
else
         mayNotMove(cid, false)
            if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 25 then
				 
				addEvent(changeMove, 0, cid, 21, -1)
				addEvent(doCreatureSay, 10, cid, "OUCH!", TALKTYPE_MONSTER)
				doCreatureAddHealth(cid, -5)
				setPlayerStorageValue(cid, sto_sensha[7], 0)
			 elseif getPlayerLevel(cid) >= 25 and getPlayerLevel(cid) < 50 then
				
				addEvent(changeMove, 0, cid, 19, -1)
				addEvent(doCreatureSay, 10, cid, "OUCH!", TALKTYPE_MONSTER)
				doCreatureAddHealth(cid, -5)
				setPlayerStorageValue(cid, sto_sensha[7], 0)
			 elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 80 then
				 
				addEvent(changeMove, 0, cid, 20, -1)
				addEvent(doCreatureSay, 10, cid, "OUCH!", TALKTYPE_MONSTER)
				doCreatureAddHealth(cid, -5)
				setPlayerStorageValue(cid, sto_sensha[7], 0)
			   elseif getPlayerLevel(cid) >= 80 and getPlayerLevel(cid) < 100 then
				
				addEvent(changeMove, 0, cid, 22, -1)
				addEvent(doCreatureSay, 10, cid, "OUCH!", TALKTYPE_MONSTER)
				doCreatureAddHealth(cid, -5)
				setPlayerStorageValue(cid, sto_sensha[7], 0)
			  end
     
			 end
			addEvent(mizudanSuisha, 80, cid, chakra, newLook)
		return true
end




function harinikudanSensha(cid, chakra, oldLook)
 
        if not isCreature(cid) or getPlayerStorageValue(cid, sto_sensha[5]) == 0 then
                return false
        end
 
        local minDmg = -(getPlayerLevel(cid)*2.5 + getPlayerSkill(cid, 0) * 1.7)
        local maxDmg = -(getPlayerLevel(cid)*2.6 + getPlayerSkill(cid, 0) * 1.8)
        local efeito = CONST_ME_NONE
        local poslook = getCreatureLookPosition(cid)
        poslook.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
		local newLook = getCreatureLookDir(cid)
 
     if isWalkable(poslook, false, false, true) then
	    if (oldLook == 0 and newLook == 2) or (oldLook == 2 and newLook == 0) or
         (oldLook == 1 and newLook == 3) or (oldLook == 3 and newLook == 1) then
		 doSendMagicEffect(getThingPos(cid), 107)
         addEvent(harinikudanSensha, 800, cid, chakra, newLook)
         return true
		end
		if not isCreature(getThingfromPos(poslook).uid) then
          doMoveCreature(cid, getPlayerLookDirection(cid))
		else
          doMoveCreature(cid, getPlayerLookDirection(cid))
          doAreaCombatHealth(cid, COMBAT_PHYSICALDAMAGE, getCreaturePosition(cid), area, minDmg, maxDmg, efeito)
		end
		else
	       
			 if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
			  mayNotMove(cid, false)
				addEvent(changeMove, 0, cid, 21, -1)
				addEvent(doCreatureSay, 10, cid, "OUCH!", TALKTYPE_MONSTER)
				doCreatureAddHealth(cid, -5)
				 setPlayerStorageValue(cid, 676767, 1)
				 stopEvent(removemana)
				setPlayerStorageValue(cid, sto_sensha[5], 0)
			 elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
			  mayNotMove(cid, false)
				addEvent(changeMove, 0, cid, 19, -1)
				addEvent(doCreatureSay, 10, cid, "OUCH!", TALKTYPE_MONSTER)
				doCreatureAddHealth(cid, -15)
				 setPlayerStorageValue(cid, 676767, 1)
				stopEvent(removemana)
				setPlayerStorageValue(cid, sto_sensha[5], 0)
			 elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
			  mayNotMove(cid, false)
				addEvent(changeMove, 0, cid, 20, -1)
				addEvent(doCreatureSay, 10, cid, "OUCH!", TALKTYPE_MONSTER)
				 setPlayerStorageValue(cid, 676767, 1)
				 stopEvent(removemana)
				doCreatureAddHealth(cid, -25)
				setPlayerStorageValue(cid, sto_sensha[5], 0)
			   elseif getPlayerLevel(cid) >= 150 and getPlayerLevel(cid) < 200 then
			    mayNotMove(cid, false)
				addEvent(changeMove, 0, cid, 22, -1)
				addEvent(doCreatureSay, 10, cid, "OUCH!", TALKTYPE_MONSTER)
				doCreatureAddHealth(cid, -25)
				 stopEvent(removemana)
				 setPlayerStorageValue(cid, 676767, 1)
				setPlayerStorageValue(cid, sto_sensha[5], 0)
				elseif getPlayerLevel(cid) >= 200 and getPlayerLevel(cid) < 500 then
				 mayNotMove(cid, false)
				addEvent(changeMove, 0, cid, 22, -1)
				addEvent(doCreatureSay, 10, cid, "OUCH!", TALKTYPE_MONSTER)
				doCreatureAddHealth(cid, -25)
				 stopEvent(removemana)
				 setPlayerStorageValue(cid, 676767, 1)
				setPlayerStorageValue(cid, sto_sensha[5], 0)
			  end
           
			 end
			addEvent(harinikudanSensha, 130, cid, chakra,newLook)
		return true
end

function iniBaika(cid)
  mayNotMove(cid, true)
  
  addEvent(changeMove, 700, cid,236 , -1)--wielkolud
  addEvent(mayNotMove, 600, cid, false)
  addEvent(doCreatureSay, 300, cid, "Chou Baika no Jutsu!!!", TALKTYPE_MONSTER)
end

function endBaika(cid)

  
			if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 25 then
             addEvent(changeMove, 0, cid, 21, -1)
			 mayNotMove(cid, true)
			 elseif getPlayerLevel(cid) >= 25 and getPlayerLevel(cid) < 50 then
			 addEvent(changeMove, 0, cid, 19, -1)
			 mayNotMove(cid, true)
			 elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 80 then
			  addEvent(changeMove, 0, cid, 20, -1)
			  mayNotMove(cid, true)
			 elseif getPlayerLevel(cid) >= 80 and getPlayerLevel(cid) < 100 then
			  addEvent(changeMove, 0, cid, 22, -1)
			  mayNotMove(cid, true)
			  
			  elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 500 then
			  addEvent(changeMove, 0, cid, 22, -1)
			  mayNotMove(cid, true)
			  end
              addEvent(mayNotMove, 10, cid, false)
end
