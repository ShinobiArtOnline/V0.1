local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local temp = {
exhausted = 2,
}
local times = 1 -- in sec 
local percent =-5

local info = {
speed = 200,	
	}

	

	
function onCastSpell(cid,var)
	

	
		if getPlayerVocation(cid) ==1 or getPlayerVocation(cid) ==37 or getPlayerVocation(cid) ==38 or getPlayerVocation(cid) ==39 then
		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
		 addEvent(changeMove, 0, cid, 5, -1)
		elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
		addEvent(changeMove, 0, cid, 1, -1)
		elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
		addEvent(changeMove, 0, cid, 3, -1)
		end
	end
		
		if getPlayerVocation(cid) ==3 or getPlayerVocation(cid) ==10 or getPlayerVocation(cid) ==11 or getPlayerVocation(cid) ==12 then
		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
		 addEvent(changeMove, 0, cid, 19, -1)
		elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
		addEvent(changeMove, 0, cid, 20, -1)
		elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
		addEvent(changeMove, 0, cid, 22, -1)
		end
	end
	
       if getPlayerVocation(cid) ==4 or getPlayerVocation(cid) ==15 or getPlayerVocation(cid) ==16 or getPlayerVocation(cid) ==17 then
		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
		 addEvent(changeMove, 0, cid, 58, -1)
		elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
		addEvent(changeMove, 0, cid, 56, -1)
		elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
		addEvent(changeMove, 0, cid, 55, -1)
		end
	end
		
		if getPlayerVocation(cid) ==5 or getPlayerVocation(cid) ==20 or getPlayerVocation(cid) ==21 or getPlayerVocation(cid) ==22 then
		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
		 addEvent(changeMove, 0, cid, 52, -1)
		elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
		addEvent(changeMove, 0, cid, 53, -1)
		elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
		addEvent(changeMove, 0, cid, 54, -1)
		end
	end
		if getPlayerVocation(cid) ==6 or getPlayerVocation(cid) ==25 or getPlayerVocation(cid) ==26 or getPlayerVocation(cid) ==27 then
		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
		 addEvent(changeMove, 0, cid,34, -1)
		elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
		addEvent(changeMove, 0, cid, 97, -1)
		elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
		addEvent(changeMove, 0, cid, 99, -1)
		end
	end
		
		if getPlayerVocation(cid) ==7 or getPlayerVocation(cid) ==30 or getPlayerVocation(cid) ==31 or getPlayerVocation(cid) ==32 then
		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
		 addEvent(changeMove, 0, cid, 61, -1)
		elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
		addEvent(changeMove, 0, cid, 59, -1)
		elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
		addEvent(changeMove, 0, cid, 64, -1)
		end
	end
	
	if getPlayerVocation(cid) ==8 or getPlayerVocation(cid) ==48 or getPlayerVocation(cid) ==49 or getPlayerVocation(cid) ==50 then
		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
		 addEvent(changeMove, 0, cid, 14, -1)
		elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
		addEvent(changeMove, 0, cid, 15, -1)
		elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
		addEvent(changeMove, 0, cid, 25, -1)
		end
	end
	return true
		
	end
