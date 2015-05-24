local level = 		--level potrzebny do nauczenia sie spella
	{
		1, -- Hakke Hasengeki no Jutsu
		1, -- Hakke Hiasangi no Jutsu
		1, -- Hakke Shou no Jutsu
		1, -- Hakke Kuushou no Jutsu
		1, -- Hakke Shou
		1, -- Hakke SanjuuniShou no Jutsu
		1, -- Hakke Shiten Kuushou no Jutsu
		1, -- Hakkeshou Kaiten no Jutsu
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
	if  ((msg == 'hi') and (PlayerVoc == 6 or (PlayerVoc >= 25 and PlayerVoc <=29))) then -- Vocation Hyuuga Neji i jego transformów
		addFocus(cid)
		selfSay('Hello '..getPlayerName(cid)..' what do you need? {jutsu}', cid)
	elseif ((msg == 'jutsu') and (isFocused(cid))) then
		selfSay('{Hakke Hasengeki no Jutsu} level ' .. level[1] .. '',cid)
		selfSay('{Hakke Hiasangi no Jutsu} level ' .. level[2] .. '',cid)
		selfSay('{Hakke Shou no Jutsu} level ' .. level[3] .. '',cid)
		selfSay('{Hakke Kuushou no Jutsu} level ' .. level[4] .. '',cid)
		selfSay('{Hakke Shou} level ' .. level[5] .. '',cid)
		selfSay('{Hakke Sanjuuni Shou no Jutsu} level ' .. level[6] .. '',cid)
		selfSay('{Hakke Shiten Kuushou no Jutsu} level ' .. level[7] .. '',cid)
		selfSay('{Hakkeshou Kaiten no Jutsu} level ' .. level[8] .. '',cid)
	elseif((msg == 'Hakke Hasengeki no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[1] then
			if getPlayerLearnedInstantSpell(cid, 'Hakke Hasengeki no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Hakke Hasengeki no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Hakke Hasengeki}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[1] .. '')
		end
	elseif((msg == 'Hakke Hiasangi no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[2] then
			if getPlayerLearnedInstantSpell(cid, 'Hakke Hiasangi no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Hakke Hiasangi no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Hakke Hiasangi}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[2] .. '')
		end
	elseif((msg == 'Hakke Shou no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[3] then
			if getPlayerLearnedInstantSpell(cid, 'Hakke Shou no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Hakke Shou no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Hakke Hyakunijuuhachi Shou}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[3] .. '')
		end
	elseif((msg == 'Hakke Kuushou no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[4] then
			if getPlayerLearnedInstantSpell(cid, 'Hakke Kuushou no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Hakke Kuushou no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Hakke Kuushou}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[4] .. '')
		end
	elseif((msg == 'Hakke Shou') and (isFocused(cid))) then
		if playerLevel >= level[5] then
			if getPlayerLearnedInstantSpell(cid, 'Hakke Shou') == false then
				doPlayerLearnInstantSpell(cid, 'Hakke Shou')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Hakke Rokujuuyon Shou}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[5] .. '')
		end
	elseif((msg == 'Hakke Sanjuuni Shou no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[6] then
			if getPlayerLearnedInstantSpell(cid, 'Hakke SanjuuniShou no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Hakke SanjuuniShou no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Hakke Sanjuuni Shou}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[6] .. '')
		end
	elseif((msg == 'Hakke Shiten Kuushou no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[7] then
			if getPlayerLearnedInstantSpell(cid, 'Hakke Shiten Kuushou no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Hakke Shiten Kuushou no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Hakke Shiten Kuushou}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[7] .. '')
		end
	elseif((msg == 'Hakkeshou Kaiten no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[8] then
			if getPlayerLearnedInstantSpell(cid, 'Hakkeshou Kaiten no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Hakkeshou Kaiten no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Hakkeshou Kaiten}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[8] .. '')
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