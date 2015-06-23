
function onThink(cid, interval)
local target=getCreatureTarget(cid)
  
      if getPlayerStorageValue(cid, 10007) == 1 then 
	   setCreatureMaxHealth(cid, getCreatureMaxHealth(cid) - 300)
		doCreatureAddHealth(cid, -300,1)
		doPlayerSendCancel(cid, 'Bonus experience is off.')
		setPlayerStorageValue(target, 10007, 0)
      end   
      
   return true
end
