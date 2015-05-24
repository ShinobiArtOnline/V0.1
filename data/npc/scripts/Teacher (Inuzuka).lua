local level = 		--level potrzebny do nauczenia sie spella
	{
		1, --Garouga no Jutsu
		1, --Gatsuuga no Jutsu
		1, --Shikyaku no Jutsu
		1, --Soutorou no Jutsu
		1, --Tsuga no Jutsu
		1, --Juujin Bunshin no Jutsu
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
	if  ((msg == 'hi') and (PlayerVoc == 1 or (PlayerVoc >= 37 and PlayerVoc <=41))) then -- Vocation Inuzuka i jego transformów
		addFocus(cid)
		selfSay('Hello '..getPlayerName(cid)..' what do you need? {jutsu}', cid)
	elseif ((msg == 'jutsu') and (isFocused(cid))) then
		selfSay('{Garouga no Jutsu} level ' .. level[1] .. '',cid)
		selfSay('{Gatsuuga no Jutsu} level ' .. level[2] .. '',cid)
		selfSay('{Shikyaku no Jutsu} level ' .. level[3] .. '',cid)
		selfSay('{Soutorou no Jutsu} level ' .. level[4] .. '',cid)
		selfSay('{Tsuga no Jutsu} level ' .. level[5] .. '',cid)
		selfSay('{Juujin Bunshin no Jutsu} level ' .. level[6] .. '',cid)
	elseif((msg == 'Garouga no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[1] then
			if getPlayerLearnedInstantSpell(cid, 'Garouga no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Garouga no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Garouga}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[1] .. '')
		end
	elseif((msg == 'Gatsuuga no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[2] then
			if getPlayerLearnedInstantSpell(cid, 'Gatsuuga no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Gatsuuga no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Gatsuugaa}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[2] .. '')
		end
	elseif((msg == 'Shikyaku no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[3] then
			if getPlayerLearnedInstantSpell(cid, 'Shikyaku no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Shikyaku no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Shikyaku}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[3] .. '')
		end
	elseif((msg == 'Soutorou no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[4] then
			if getPlayerLearnedInstantSpell(cid, 'Soutorou no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Soutorou no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Soutorou}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[4] .. '')
		end
	elseif((msg == 'Tsuga no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[5] then
			if getPlayerLearnedInstantSpell(cid, 'Tsuga no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Tsuga no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Tsu}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[5] .. '')
		end
	elseif((msg == 'Juujin Bunshin no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[6] then
			if getPlayerLearnedInstantSpell(cid, 'Juujin Bunshin no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Juujin Bunshin no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Juujin Bunshin}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[6] .. '')
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