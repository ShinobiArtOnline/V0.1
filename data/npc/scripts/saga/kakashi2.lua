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
	if((msg == "hi") and getPlayerStorageValue(cid,8000) == 7 and not (isFocused(cid))) then
		selfSay("Now you can start the {test}!", cid)
		addFocus(cid)
	elseif((msg == "hi") and getPlayerStorageValue(cid,8000) == 9 and not (isFocused(cid))) then
		selfSay("You made it! You are now officially admitted to the group number 7!", cid)
		addFocus(cid)
		setPlayerStorageValue(cid,8000,10)
		doPlayerSendTextMessage(cid, 19,"Go to Kakashi's house and talk to him")
	elseif (isFocused(cid) and (msg == "test") and getPlayerStorageValue(cid,8000) == 7) then
		setPlayerStorageValue(cid,8000,8)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Kill Kakashi\'s clones!')
		doPlayerSendTextMessage(cid, 19,"Kill Kakashi\'s clones!")
		doCreateMonster('Kakashi\'s Clone', {x=766,y=776,z=7,stackpos = 253})
		doCreateMonster('Kakashi\'s Clone', {x=761,y=776,z=7,stackpos = 253})
		doCreateMonster('Kakashi\'s Clone', {x=760,y=782,z=7,stackpos = 253})
		doCreateMonster('Kakashi\'s Clone', {x=766,y=782,z=7,stackpos = 253})
	elseif ((msg == "hi") and getPlayerStorageValue(cid,8000) < 9) then
		selfSay("Sorry, but you can\'t do this {saga} at the moment.", cid)
	elseif ((msg == "hi") and getPlayerStorageValue(cid,8000) > 9) then
		selfSay("Sorry, but you can\'t do this {saga} anymore.", cid)
	elseif ((msg == "bye" or msg == "goodbye" or msg == "cya")) then
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

	
  	






