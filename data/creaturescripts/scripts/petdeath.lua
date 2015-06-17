function onDeath(cid, deathList)
local aol = getPlayerSlotItem(cid, 2)
if getPlayerStorageValue(cid, 10001) == 1  and (aol.itemid == 2165) then
doRemoveItem(aol.uid, 1)
doPlayerAddItem(cid, 2202, 1)
setPlayerStorageValue(cid, 1234899, 0)
doRemoveCondition(cid, CONDITION_ATTRIBUTES)
end
  return true
end