local level = 		--level potrzebny do nauczenia sie spella
	{
		1, --
		1, --
		1, --
		1, --
		1, --
		1, --
		1, --
		1, --
		1, --
		1, --
		1, --
	} 
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
		if(isPlayer(v)) then
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
		selfSay('Bro!')
		removeFocus(cid)
		if(isPlayer(cid)) then --Be sure he's online
			closeShopWindow(cid)
		end
	end
end
function onCreatureSay(cid, type, msg)
	local PlayerVoc = getPlayerVocation(cid)
	if  ((msg == 'hi') and (PlayerVoc == 2 or (PlayerVoc >= 42 and PlayerVoc <=47))) then -- Vocation Maito Lee i jego transformów
		addFocus(cid)
		selfSay('Hello '..getPlayerName(cid)..' what do you need? {jutsu}', cid)
	--[[elseif ((msg == 'jutsu') and (isFocused(cid))) then
		selfSay('{} level ' .. level[1] .. '',cid)
		selfSay('{} level ' .. level[2] .. '',cid)
		selfSay('{} level ' .. level[3] .. '',cid)
		selfSay('{} level ' .. level[4] .. '',cid)
		selfSay('{} level ' .. level[5] .. '',cid)
		selfSay('{} level ' .. level[6] .. '',cid)
		selfSay('{} level ' .. level[7] .. '',cid)
		selfSay('{} level ' .. level[8] .. '',cid)
		selfSay('{} level ' .. level[9] .. '',cid)
		selfSay('{} level ' .. level[10] .. '',cid)
		selfSay('{} level ' .. level[11] .. '',cid)
	elseif((msg == 'Chou') and (isFocused(cid))) then
		if playerLevel >= level[] then
			if getPlayerLearnedInstantSpell(cid, '') == false then
				doPlayerLearnInstantSpell(cid, '')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[] .. '')
		end]]
	elseif((isFocused(cid)) and (msg == 'bye' or msg == 'goodbye' or msg == 'cya')) then
		selfSay('Goodbye!', cid, true)
		removeFocus(cid)
	end
end


function onPlayerCloseChannel(cid)
	if(isFocused(cid)) then
		selfSay('Bro!')
		closeShopWindow(cid)
		removeFocus(cid)
	end
end


function onThink()
	for i, focus in pairs(focuses) do
		if(not isCreature(focus)) then
			removeFocus(focus)
		else
			local distance = getDistanceTo(focus) or -1
			if((distance > 4) or (distance == -1)) then
				selfSay('Bro!')
				closeShopWindow(focus)
				removeFocus(focus)
			end
		end
	end
	lookAtFocus()
end