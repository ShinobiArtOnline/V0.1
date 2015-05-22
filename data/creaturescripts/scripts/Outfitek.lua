    function onLogin(cid)
    wokacje = {
    [1] = {lookType = {lookType=4}},
	[2] = {lookType = {lookType=12}},
	[3] = {lookType = {lookType=21}},
	[4] = {lookType = {lookType=57}},
	[5] = {lookType = {lookType=53}},
	[6] = {lookType = {lookType=32}},
	[7] = {lookType = {lookType=65}},
	[8] = {lookType = {lookType=9}},
	[9] = {lookType = {lookType=11}},
	[37] = {lookType = {lookType=3}},
	[38] = {lookType = {lookType=4}},
    }
    local wokacja = wokacje[getPlayerVocation(cid)]
    if (not wokacja) then
    else
	doSetCreatureOutfit(cid, wokacja.lookType, -1) 
	doCreatureChangeOutfit(cid, wokacja.lookType)
	return true
    end
    end
	
