local items = {2204,2202, 2203} 
 
function onUse(cid, item, fromPosition, itemEx, toPosition) 
 
    if(#items > 0) then 
        local rand = math.random(#items) 
        doPlayerAddItem(cid, items[rand]) 
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have got a " .. getItemNameById(items[rand])) 
        doRemoveItem(item.uid, 1) 
    end 
 
return true 
end