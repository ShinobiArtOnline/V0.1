local items = {11801, 11691, 11690, 11693,11684,11797,11777} 
 
function onUse(cid, item, fromPosition, itemEx, toPosition) 
 
    if(#items > 0) then 
        local rand = math.random(#items) 
        doPlayerAddItem(cid, items[rand]) 
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have got a " .. getItemNameById(items[rand])) 
        doRemoveItem(item.uid, 1) 
    end 
 
return true 
end