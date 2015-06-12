function onCastSpell(cid, var)
-----[Restrições]-----
    if getTilePzInfo(getPlayerPosition(cid)) then
        return doPlayerSendCancel(cid, "You in this area pz.") end 
	
	if checkJutsu(cid, "Kagemane") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if getPlayerStorageValue(cid, sto_gen[1]) == 0 then
		return doPlayerSendCancel(cid, "Sorry this is not possible.")		
	end
-----[Restrições]-----
if getPlayerStorageValue(cid, sto_byakugan[4]) == 0 then
		
		setPlayerStorageValue(cid, sto_byakugan[3], 1)
		setPlayerStorageValue(cid, sto_byakugan[4], 1)
		setPlayerStorageValue(cid, sto_byakugan[5], 1)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Byakugan Search Mode: Deactivated!")
	for x = -20,20 do
	for y = -20,20 do
    local byakupos = getThingFromPos({x = getThingPos(cid).x+(x),y = getThingPos(cid).y+(y),z = getThingPos(cid).z, stackpos = 253})
	if isCreature(byakupos.uid) and byakupos.uid ~= cid then
    local peo = {x = getThingPos(cid).x+(x),y = getThingPos(cid).y+(y),z = getThingPos(cid).z}
	 
	addEvent (function()
	if not isCreature(cid) then return true end
	end, 500)  
  
    end
	  return true
   end
   return true
end
else
doPlayerSendCancel(cid, "You cannot use.")
   end
end