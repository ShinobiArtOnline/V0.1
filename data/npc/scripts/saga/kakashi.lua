local focuses = {}
local function isFocused(cid)
	for i, v in pairs(focuses) do
		if(v == cid) then
			return true
		end
	end
	return false
end

local function addFocus(cid)
	if(not isFocused(cid)) then
		table.insert(focuses, cid)
	end
end
local function removeFocus(cid)
	for i, v in pairs(focuses) do
		if(v == cid) then
			table.remove(focuses, i)
			break
		end
	end
end
local function lookAtFocus()
	for i, v in pairs(focuses) do
		if(isPlayer(v) == TRUE) then
			doNpcSetCreatureFocus(v)
			return
		end
	end
	doNpcSetCreatureFocus(0)
end

function onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
	if(isFocused(cid)) then
		selfSay("Bye!")
		removeFocus(cid)
		if(isPlayer(cid) == TRUE) then --Be sure he's online
			closeShopWindow(cid)
		end
	end
end

function onCreatureSay(cid, type, msg)
	if(((msg == "hi") or (msg == "Hi") or (msg == "hello") or (msg == "Hello") or (msg == "Whats Up") or (msg == "whats up") or (msg == "Whats up") or (msg == "hej") or (msg == "Hej")) and getPlayerStorageValue(cid,8000) == 6 and not (isFocused(cid))) then
		selfSay("So you are. To be a member of my team, you need to pass a special test. Are you {ready}?", cid)
		addFocus(cid)
	elseif((msg == "hi") and getPlayerStorageValue(cid,8000) == 10 and not (isFocused(cid))) then
		selfSay("Hokage calls us. He has a first mission for you.", cid)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '#12. Go to the Hokage and talk to him')
		doPlayerSendTextMessage(cid, 19,'#12. Go to the Hokage and talk to him')
		setPlayerStorageValue(cid,8000,11)
		addFocus(cid)
	elseif (isFocused(cid) and (msg == "ready") and getPlayerStorageValue(cid,8000) == 6) then
		setPlayerStorageValue(cid,8000,7)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '#8. Go to the training place')
		doPlayerSendTextMessage(cid, 19,'#8. Go to the training place')
		selfSay("Ok. See you tomorrow on the test.", cid)
		doPlayerSendTextMessage(cid, 19,"Go to the training place")
	elseif (((msg == "hi") or (msg == "Hi") or (msg == "hello") or (msg == "Hello") or (msg == "Whats Up") or (msg == "whats up") or (msg == "Whats up") or (msg == "hej") or (msg == "Hej")) and getPlayerStorageValue(cid,8000) < 6) then
		selfSay("Sorry, but you can\'t do this {saga} at the moment.", cid)
	elseif (((msg == "hi") or (msg == "Hi") or (msg == "hello") or (msg == "Hello") or (msg == "Whats Up") or (msg == "whats up") or (msg == "Whats up") or (msg == "hej") or (msg == "Hej")) and getPlayerStorageValue(cid,8000) > 6) then
		selfSay("Sorry, but you can\'t do this {saga} anymore.", cid)
	elseif((isFocused(cid)) and (msg == "bye" or msg == "goodbye" or msg == "cya")) then
		selfSay("Goodbye!", cid, TRUE)
		closeShopWindow(cid)
		removeFocus(cid)
	end
end

function onPlayerCloseChannel(cid)
	if(isFocused(cid)) then
		selfSay("Bye!")
		closeShopWindow(cid)
		removeFocus(cid)
	end
end

function onThink()
	for i, focus in pairs(focuses) do
		if(isCreature(focus) == FALSE) then
			removeFocus(focus)
		else
			local distance = getDistanceTo(focus) or -1
			if((distance > 4) or (distance == -1)) then
				selfSay("Bye!")
				closeShopWindow(focus)
				removeFocus(focus)
			end
		end
	end
	lookAtFocus()
end

	
  	






