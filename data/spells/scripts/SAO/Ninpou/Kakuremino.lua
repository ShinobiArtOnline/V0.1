local storage = 201
--doCreatureSetHideHealth(cid, true)
 --  addEvent(doCreatureSetHideHealth, 300, cid, false)
  -- doSetItemOutfit(cid, math.random(2701, 2704), 7000)
function onCastSpell(cid, var)
      if not isCreature(cid) then
         return doPlayerSendCancel(cid, "Use only in creatures")
      end
   if(getPlayerStorageValue(cid,storage) <= 0) then
         actionMove(cid, 400, -1)
		 doCreatureSetHideHealth(cid,TRUE)
		 addEvent(doCreatureSetHideHealth, 7000, cid, false)
		 doSendMagicEffect(getThingPos(cid), 107)
		 doCreatureSay(cid, "Kakuremino!", TALKTYPE_MONSTER)
        mayNotMove(cid, true) 
		setPlayerStorageValue(cid,storage, 1)
	else
	if (getPlayerStorageValue(cid,storage) == 0) then
         return doPlayerSendCancel(cid, "You can't use Henge on yourself")
      end
	  mayNotMove(cid, false)
	  doCreatureSetHideHealth(cid,false)
      setPlayerStorageValue(cid,storage, 0)
      doSendMagicEffect(getThingPos(cid), 107)	  
      doRemoveCondition(cid, CONDITION_OUTFIT)
   end
 end
  