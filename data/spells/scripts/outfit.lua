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


	
		--if getPlayerVocation ==1 or getPlayerVocation ==37 or getPlayerVocation ==38 or getPlayerVocation ==39 then
		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
		 addEvent(changeMove, 0, cid, 5, -1)
		elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
		addEvent(changeMove, 0, cid, 1, -1)
		elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
		addEvent(changeMove, 0, cid, 3, -1)
		end
	
		
		if getPlayerVocation ==3 or getPlayerVocation ==10 or getPlayerVocation ==11 or getPlayerVocation ==12 then
		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
		 addEvent(changeMove, 0, cid, 19, -1)
		elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
		addEvent(changeMove, 0, cid, 20, -1)
		elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
		addEvent(changeMove, 0, cid, 22, -1)
		end
	end
	
       if getPlayerVocation ==4 or getPlayerVocation ==15 or getPlayerVocation ==16 or getPlayerVocation ==17 then
		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
		 addEvent(changeMove, 0, cid, 58, -1)
		elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
		addEvent(changeMove, 0, cid, 56, -1)
		elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
		addEvent(changeMove, 0, cid, 55, -1)
		end
	end
		
		if getPlayerVocation ==5 or getPlayerVocation ==20 or getPlayerVocation ==21 or getPlayerVocation ==22 then
		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
		 addEvent(changeMove, 0, cid, 52, -1)
		elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
		addEvent(changeMove, 0, cid, 53, -1)
		elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
		addEvent(changeMove, 0, cid, 54, -1)
		end
	end
		if getPlayerVocation ==6 or getPlayerVocation ==25 or getPlayerVocation ==26 or getPlayerVocation ==27 then
		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
		 addEvent(changeMove, 0, cid,34, -1)
		elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
		addEvent(changeMove, 0, cid, 97, -1)
		elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
		addEvent(changeMove, 0, cid, 99, -1)
		end
	end
		
		if getPlayerVocation ==7 or getPlayerVocation ==30 or getPlayerVocation ==31 or getPlayerVocation ==32 then
		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 50 then
		 addEvent(changeMove, 0, cid, 61, -1)
		elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
		addEvent(changeMove, 0, cid, 59, -1)
		elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
		addEvent(changeMove, 0, cid, 64, -1)
		end
	end
	
	if getPlayerVocation ==8 or getPlayerVocation ==48 or getPlayerVocation ==49 or getPlayerVocation ==50 then
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
