    function onLogin(cid)
    wokacje = {
    [1] = {lookType = {lookType=4}},
	[2] = {lookType = {lookType=12}},
	[3] = {lookType = {lookType=21}},
	[4] = {lookType = {lookType=57}},
	[5] = {lookType = {lookType=46}},
	[6] = {lookType = {lookType=32}},
	[7] = {lookType = {lookType=65}},
	
	[8] = {lookType = {lookType= 24}},--Sakura
	[9] = {lookType = {lookType=11}},--Admin
	
	[10] = {lookType = {lookType=19}},--CHOJI
	[11] = {lookType = {lookType=20}},
	[12] = {lookType = {lookType=22}},
	
	
	[37] = {lookType = {lookType=5}},--KIBA
	[38] = {lookType = {lookType=1}},
	[39] = {lookType = {lookType=3}},
	
	[30] = {lookType = {lookType=61}},--UCHIHA SASUKE
	[31] = {lookType = {lookType=59}},
	[32] = {lookType = {lookType=62}},
	[33] = {lookType = {lookType=64}},
	[34] = {lookType = {lookType=66}},
	[35] = {lookType = {lookType=112}},
	
	[15] = {lookType = {lookType=58}},--SHINO
	[16] = {lookType = {lookType=56}},
	[17] = {lookType = {lookType=55}},
	
	[20] = {lookType = {lookType=52}},--SHIKAMARU
	[21] = {lookType = {lookType=53}},
	[22] = {lookType = {lookType=51}},
	
	[25] = {lookType = {lookType=34}},--NEJI
	[26] = {lookType = {lookType=97}},
	[27] = {lookType = {lookType=99}},
	
	[48] = {lookType = {lookType=14}},--Sakura
	[49] = {lookType = {lookType=15}},
	[50] = {lookType = {lookType=25}},
	[51] = {lookType = {lookType=7}},
	
	--[42] = {lookType = {lookType=10}},
	--[43] = {lookType = {lookType=8}},
	--[44] = {lookType = {lookType=9}},
	--[45] = {lookType = {lookType=11}},
	
	
    }
    local wokacja = wokacje[getPlayerVocation(cid)]
    if (not wokacja) then
    else
	doSetCreatureOutfit(cid, wokacja.lookType, -1) 
	doCreatureChangeOutfit(cid, wokacja.lookType)
	return true
    end
    end
	
