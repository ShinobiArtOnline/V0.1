 function onUse(cid, item, fromPosition, itemEx, toPosition)
  local pet = getPlayerSlotItem(cid, 10)
 if (pet.itemid == 11829)  then
 doPlayerCastSpell(cid, "pet")
 end
 end