function onPrepareDeath(cid, lastHitKiller, mostDamageKiller)

if getPlayerVocation(cid) == 1 then
	corpse = doCreateItem(3096, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 2 then
	corpse = doCreateItem(3085, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 3 then
	corpse = doCreateItem(5994, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 4 then
	corpse = doCreateItem(6053, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 5 then
	corpse = doCreateItem(5986, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 6 then
	corpse = doCreateItem(3053, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 7 then
	corpse = doCreateItem(6040, 1, getThingPos(cid))
	
	elseif getPlayerVocation(cid) == 8 then
	corpse = doCreateItem(3081, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 9 then
	corpse = doCreateItem(2928, 1, getThingPos(cid))
	
	elseif getPlayerVocation(cid) == 10 then--CHOJI
	corpse = doCreateItem(5994, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 11 then
	corpse = doCreateItem(5992, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 12 then
	corpse = doCreateItem(5990, 1, getThingPos(cid))
	
	elseif getPlayerVocation(cid) == 37 then--KIBA
	corpse = doCreateItem(3100, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 38 then
	corpse = doCreateItem(3100, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 39 then
	corpse = doCreateItem(5981, 1, getThingPos(cid))
	
	
	elseif getPlayerVocation(cid) == 30 then--UChiha
	corpse = doCreateItem(3077, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 31 then
	corpse = doCreateItem(3077, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 32 then
	corpse = doCreateItem(3073, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 33 then
	corpse = doCreateItem(6048, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 34 then
	corpse = doCreateItem(6048, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 35 then
	corpse = doCreateItem(6048, 1, getThingPos(cid))
	
	elseif getPlayerVocation(cid) == 15 then -- SHINO
	corpse = doCreateItem(6053, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 16 then
	corpse = doCreateItem(6053, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 17 then
	corpse = doCreateItem(5993, 1, getThingPos(cid))
	
	elseif getPlayerVocation(cid) == 25 then--NEJI
	corpse = doCreateItem(6036, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 26 then
	corpse = doCreateItem(3036, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 27 then
	corpse = doCreateItem(5989, 1, getThingPos(cid))
	
	elseif getPlayerVocation(cid) == 48 then--Sakura
	corpse = doCreateItem(3081, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 49 then
	corpse = doCreateItem(5972, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 50 then
	corpse = doCreateItem(5985, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 51 then
	corpse = doCreateItem(5996, 1, getThingPos(cid))
	
	elseif getPlayerVocation(cid) == 20 then--SHIKAMARU
	corpse = doCreateItem(5894, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 21 then
	corpse = doCreateItem(3052, 1, getThingPos(cid))
	elseif getPlayerVocation(cid) == 22 then
	corpse = doCreateItem(5982, 1, getThingPos(cid))
	
end

doItemSetAttribute(corpse, "description", "You recognize " .. getCreatureName(cid) .. ".")
return true
end

