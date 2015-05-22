function onThink(interval, lastExecution, thinkInterval)
    for _, player in ipairs(Game.getPlayers()) do
        local accid = player:getAccountId()

        -- Create the query
        local orderQuery = db.storeQuery("SELECT `id`, `type`, `itemid`, `count` FROM `znote_shop_orders` WHERE `account_id` = " .. accid .. " LIMIT 1;")

        -- Detect if we got any results
        if orderQuery ~= false then
            -- Fetch order values
            local q_id = result.getDataInt(orderQuery, "id")
            local q_type = result.getDataInt(orderQuery, "type")
            local q_itemid = result.getDataInt(orderQuery, "itemid")
            local q_count = result.getDataInt(orderQuery, "count")
            result.free(orderQuery)

            -- ORDER TYPE 1 (Regular item shop products)
            if q_type == 1 then
                -- Get wheight
                local playerCap = player:getFreeCapacity()
                local itemweight = ItemType(q_itemid):getWeight(q_count)
                if playerCap >= itemweight then
                    db.query("DELETE FROM `znote_shop_orders` WHERE `id` = " .. q_id .. ";")
                    player:addItem(q_itemid, q_count)
                    player:sendTextMessage(MESSAGE_INFO_DESCR, "Congratulations! You have recieved ".. q_count .." "..ItemType(q_itemid):getName().."(s)!")
                else
                    player:sendTextMessage(MESSAGE_STATUS_WARNING, "Need more CAP!")
                end
            end
            -- Add custom order types here
            -- Type 2 is reserved for premium days and is handled on website, not needed here.
            -- Type 3 is reserved for character gender(sex) change and is handled on website as well.
            -- So use type 4+ for custom stuff, like etc packages.
            -- if q_type == 4 then
            -- end
        end
    end
    return true
end
