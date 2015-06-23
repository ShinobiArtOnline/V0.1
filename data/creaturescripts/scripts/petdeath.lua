function onDeath(cid, deathList)

if getPlayerStorageValue(cid, 10002) == 1 then
doPlayerCastSpell(cid, "pet")
doRemoveCondition(cid, CONDITION_ATTRIBUTES)
end
if getPlayerStorageValue(cid, 10003) == 1 then
doPlayerCastSpell(cid, "Hppet")
doRemoveCondition(cid, CONDITION_ATTRIBUTES)
end
if getPlayerStorageValue(cid, 676767) == 1 then
doPlayerCastSpell(cid, "Hari Sensha")
doRemoveCondition(cid, CONDITION_ATTRIBUTES)
end
  return true
end