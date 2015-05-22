    function onLogin(cid)
    if getPlayerVocation(cid) == 1 then
	doOutLogin(cid, 4)
	elseif getPlayerVocation(cid) == 2 then
	doOutLogin(cid, 12)
	elseif getPlayerVocation(cid) == 3 then
	doOutLogin(cid, 21)
	elseif getPlayerVocation(cid) == 4 then
	doOutLogin(cid, 57)
	elseif getPlayerVocation(cid) == 5 then
	doOutLogin(cid, 53)
	elseif getPlayerVocation(cid) == 6 then
	doOutLogin(cid, 32)
	elseif getPlayerVocation(cid) == 7 then
	doOutLogin(cid, 65)
	elseif getPlayerVocation(cid) == 8 then
	doOutLogin(cid, 9)
	elseif getPlayerVocation(cid) == 9 then
	doOutLogin(cid, 11)
	elseif getPlayerVocation(cid) == 10 then
	doOutLogin(cid, 11)
    end
    return true
    end