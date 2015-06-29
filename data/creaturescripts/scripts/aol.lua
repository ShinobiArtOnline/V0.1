function onDeath(cid, corpse)
	local aol = getPlayerSlotItem(cid, 2)
	if (aol.itemid == 2173) then
		doRemoveItem(aol.uid, 1)
		--trzeba dodać itemek drugi aol który bedzie mozna wymienić za inny
	end
	
	
end