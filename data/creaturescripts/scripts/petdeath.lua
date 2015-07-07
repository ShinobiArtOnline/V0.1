function onDeath(cid, deathList)

if getPlayerStorageValue(cid, 10002) == 1 then
doPlayerCastSpell(cid, "pet")
doRemoveCondition(cid, CONDITION_ATTRIBUTES)
end
if getPlayerStorageValue(cid, 10003) == 1 then
doPlayerCastSpell(cid, "Hppet")
doRemoveCondition(cid, CONDITION_ATTRIBUTES)
end
if getPlayerStorageValue(cid, 10011) == 1 then
doPlayerCastSpell(cid, "Gamakatsu")
doRemoveCondition(cid, CONDITION_ATTRIBUTES)
end
if getPlayerStorageValue(cid, 676767) == 1 then
doPlayerCastSpell(cid, "Hari Sensha")
doRemoveCondition(cid, CONDITION_ATTRIBUTES)
end
if getCreatureStorage(cid, sto_hachimon[8])==0 then
doPlayerCastSpell(cid, "Shimon")
doRemoveCondition(cid, CONDITION_ATTRIBUTES)
end
if getCreatureStorage(cid, sto_hachimon[1])==0 then
doPlayerCastSpell(cid, "Kaimon")
doRemoveCondition(cid, CONDITION_ATTRIBUTES)
end
if getCreatureStorage(cid, sto_hachimon[6])==0 then
doPlayerCastSpell(cid, "Keimon")
doRemoveCondition(cid, CONDITION_ATTRIBUTES)
end
if getCreatureStorage(cid, sto_hachimon[7])==0 then
doPlayerCastSpell(cid, "Kyomon")
doRemoveCondition(cid, CONDITION_ATTRIBUTES)
end
  return true
end