function onDeath(cid, corpse)
	local aol = getPlayerSlotItem(cid, 2)
	if (aol.itemid == 11834) then
		doRemoveItem(11834, 1)
		doPlayerAddItem(cid, 11835)
		--trzeba dodać itemek drugi aol który bedzie mozna wymienić za inny
	end
	
	
end