  local config = {
    hp = 20, -- ile procent hp
    mana = 20, -- ile procent many
    exh = {storage = 51000, time = 1.5} --storage do zapisaywania exh oraz czas
    }
    
    local function getExhausted(cid, storage)
	return os.time() >= getCreatureStorage(cid, storage) and true or false
end
 
local function setExhausted(cid, storage, cooldown)
	return doCreatureSetStorage(cid, storage, os.time() + cooldown)
end
 
    
    function onUse(cid, item, fromPosition, itemEx, toPosition)
   if getExhausted(cid, config.exh.storage) then
    doRemoveItem(item.uid, 1)

    doCreatureAddHealth(cid, getCreatureMaxHealth(cid)*(config.hp/100))
    doCreatureAddMana(cid, getCreatureMaxMana(cid)*(config.mana/100))
    doSendMagicEffect(getPlayerPosition(cid), 13)
    end
  return setExhausted(cid, config.exh.storage, config.exh.time) or false  
end
