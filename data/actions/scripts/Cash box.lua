local items = {11750, 11800, 11752, 11671} 
 
function onUse(cid, item, fromPosition, itemEx, toPosition) 
 
    if(#items > 0) then 
        local rand = math.random(#items) 
        doPlayerAddItem(cid, items[rand]) 
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have got a " .. getItemNameById(items[rand])) 
        doRemoveItem(item.uid, 1) 
    end 
 
return true 
end