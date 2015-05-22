	function onAdvance(cid, skill, oldLevel, newLevel)
	if skill == 8  then
    local poziomy = {
    [50] = {storage = 350001}, -- brak nagrody
    [100] = {itemid = 2160, storage = 350002}, -- 1 cc
    [150] = {itemid = 2160, count = 50, storage = 350003} -- 50 cc
    }
 
    k = oldLevel
    if poziomy[k] ~= nil and getPlayerStorageValue(cid, poziomy[k].storage) < 1 then
    setPlayerStorageValue(cid, poziomy[k].storage, 1)
    doBroadcastMessage("Gracz "..getPlayerName(cid).." awansowal na poziom "..newLevel.." !\n Gratulujemy!")
    if poziomy[k].itemid ~= nil then
    if poziomy[k].count == nil then amount = 1 else amount = poziomy[k].count end
    doPlayerAddItem(cid, poziomy[k].itemid, amount)
    end
    end
    return true
    end
	end