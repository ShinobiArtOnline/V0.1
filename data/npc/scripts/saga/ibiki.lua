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
		selfSay("Hmph!")
		removeFocus(cid)
		if(isPlayer(cid) == TRUE) then --Be sure he's online
			closeShopWindow(cid)
		end
	end
end

function onCreatureSay(cid, type, msg)
	if((msg == "hi") and not (isFocused(cid))) then
		selfSay("Hello, ".. getCreatureName(cid) ..". The {enemy} is on the bridge!.", cid)
		addFocus(cid)

	elseif (isFocused(cid) and msg == "enemy" and getPlayerStorageValue(cid,8000) <= 4) then
		selfSay("Sorry, but you can\'t do this {saga} now", cid)
		
	elseif (isFocused(cid) and msg == "enemy" and getPlayerStorageValue(cid,8000) >= 6) then
		selfSay("Sorry, but you can\'t do this {saga} any more.", cid)

	elseif (isFocused(cid) and msg == "enemy") then
		setPlayerStorageValue(cid,8000,6)
		selfSay("Ok, ".. getCreatureName(cid) ..". Go there!", cid)

	elseif((isFocused(cid)) and (msg == "bye" or msg == "goodbye" or msg == "cya")) then
		selfSay("Goodbye!", cid, TRUE)
		closeShopWindow(cid)
		removeFocus(cid)
	end
end

function onPlayerCloseChannel(cid)
	if(isFocused(cid)) then
		selfSay("Hmph!")
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
				selfSay("Hmph!")
				closeShopWindow(focus)
				removeFocus(focus)
			end
		end
	end
	lookAtFocus()
end

	
  	






