local level = 		--level potrzebny do nauczenia sie spella
	{
		1, -- Chou
		1, -- Bubun
		1, -- Hari
		1, -- Choudan
		1, -- Harite
		1, -- Horengan no Jutsu
		1, -- Karegan no Jutsu
		1, -- Mizudan Suisha no Jutsu
		1, -- Nikudan Sensha no Jutsu
		1, -- Omoni no Jutsu
		1, -- Tongarashigan no Jutsu
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
	local playerLevel = getPlayerLevel(cid)
	if  ((msg == 'hi') and (PlayerVoc == 3 or (PlayerVoc >= 10 and PlayerVoc <=14))) then -- Vocation Akamichi Choji i jego transformów
		addFocus(cid)
		selfSay('Hello '..getPlayerName(cid)..' what do you need? {jutsu}', cid)
	elseif ((msg == 'jutsu') and (isFocused(cid))) then
		selfSay('{Chou} level ' .. level[1] .. '',cid)
		selfSay('{Bubun} level ' .. level[2] .. '',cid)
		selfSay('{Hari} level ' .. level[3] .. '',cid)
		selfSay('{Choudan} level ' .. level[4] .. '',cid)
		selfSay('{Harite} level ' .. level[5] .. '',cid)
		selfSay('{Horengan no Jutsu} level ' .. level[6] .. '',cid)
		selfSay('{Karegan no Jutsu} level ' .. level[7] .. '',cid)
		selfSay('{Mizudan Suisha no Jutsu} level ' .. level[8] .. '',cid)
		selfSay('{Nikudan Sensha no Jutsu} level ' .. level[9] .. '',cid)
		selfSay('{Omoni no Jutsu} level ' .. level[10] .. '',cid)
		selfSay('{Tongarashigan no Jutsu} level ' .. level[11] .. '',cid)
	elseif((msg == 'Chou') and (isFocused(cid))) then
		if playerLevel >= level[1] then
			if getPlayerLearnedInstantSpell(cid, 'Chou') == false then
				doPlayerLearnInstantSpell(cid, 'Chou')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Chou Baika}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[1] .. '')
		end
	elseif((msg == 'Bubun') and (isFocused(cid))) then
		if playerLevel >= level[2] then
			if getPlayerLearnedInstantSpell(cid, 'Bubun') == false then
				doPlayerLearnInstantSpell(cid, 'Bubun')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Bubun Baika}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[2] .. '')
		end
	elseif((msg == 'Hari') and (isFocused(cid))) then
		if playerLevel >= level[3] then
			if getPlayerLearnedInstantSpell(cid, 'Hari') == false then
				doPlayerLearnInstantSpell(cid, 'Hari')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Hari Sensha}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[3] .. '')
		end
	elseif((msg == 'Choudan') and (isFocused(cid))) then
		if playerLevel >= level[4] then
			if getPlayerLearnedInstantSpell(cid, 'Choudan') == false then
				doPlayerLearnInstantSpell(cid, 'Choudan')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Choudan Bakugeki}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[4] .. '')
		end
	elseif((msg == 'Harite') and (isFocused(cid))) then
		if playerLevel >= level[5] then
			if getPlayerLearnedInstantSpell(cid, 'Harite') == false then
				doPlayerLearnInstantSpell(cid, 'Harite')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Harite Chou}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[5] .. '')
		end
	elseif((msg == 'Horengan no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[6] then
			if getPlayerLearnedInstantSpell(cid, 'Horengan no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Horengan no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Horengan}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[6] .. '')
		end
	elseif((msg == 'Karegan no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[7] then
			if getPlayerLearnedInstantSpell(cid, 'Karegan no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Karegan no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Karegan}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[7] .. '')
		end
	elseif((msg == 'Mizudan Suisha no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[8] then
			if getPlayerLearnedInstantSpell(cid, 'Mizudan Suisha no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Mizudan Suisha no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Mizudan Suisha}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[8] .. '')
		end
	elseif((msg == 'Nikudan Sensha no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[9] then
			if getPlayerLearnedInstantSpell(cid, 'Nikudan Sensha no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Nikudan Sensha no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Nikudan Sensha}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[9] .. '')
		end
	elseif((msg == 'Omoni no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[10] then
			if getPlayerLearnedInstantSpell(cid, 'Omoni no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Omoni no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Omoni}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[10] .. '')
		end
	elseif((msg == 'Tongarashigan no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[11] then
			if getPlayerLearnedInstantSpell(cid, 'Tongarashigan no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Tongarashigan no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Tongarashigan}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[11] .. '')
		end
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