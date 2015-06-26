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
	if(((msg == "hi") or (msg == "Hi") or (msg == "hello") or (msg == "Hello") or (msg == "Whats Up") or (msg == "whats up") or (msg == "Whats up") or (msg == "hej") or (msg == "Hej")) and getPlayerStorageValue(cid,8000) == 5 and not (isFocused(cid))) then
		selfSay("I underestimated you ".. getCreatureName(cid) ..". This is your forehead protector.  You passed the exam!", cid)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, '#7. Talk with Kakashi and join the team')
		doPlayerSendTextMessage(cid, 19,'#7. Talk with Kakashi and join the team')
		addFocus(cid)
		setPlayerStorageValue(cid,8000,6)
	elseif (((msg == "hi") or (msg == "Hi") or (msg == "hello") or (msg == "Hello") or (msg == "Whats Up") or (msg == "whats up") or (msg == "Whats up") or (msg == "hej") or (msg == "Hej")) and getPlayerStorageValue(cid,8000) < 5) then
		selfSay("Sorry, but you can\'t do this {saga} at the moment.", cid)
	elseif (((msg == "hi") or (msg == "Hi") or (msg == "hello") or (msg == "Hello") or (msg == "Whats Up") or (msg == "whats up") or (msg == "Whats up") or (msg == "hej") or (msg == "Hej")) and getPlayerStorageValue(cid,8000) > 5) then
		selfSay("Sorry, but you can\'t do this {saga} anymore.", cid)
	elseif((isFocused(cid)) and (msg == "bye" or msg == "goodbye" or msg == "cya")) then
		selfSay("Goodbye!", cid, TRUE)
		removeFocus(cid)
	end
end

function onPlayerCloseChannel(cid)
	if(isFocused(cid)) then
		selfSay("Bye!")
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
				removeFocus(focus)
			end
		end
	end
	lookAtFocus()
end

	
  	






