local level = 		--level potrzebny do nauczenia sie spella
	{
		1, --Goukakyuu no Jutsu
		1, --Karyuu
		1, --Katon Endan
		1, --Katon Gouryuuka
		1, --Katon Housenka no Jutsu
		1, --Katon Karyuudan
		1, --Mangekyou
		1, --Ryuuka
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
	if  ((msg == 'hi') and (PlayerVoc == 7 or (PlayerVoc >= 30 and PlayerVoc <=36))) then -- Vocation Uchiha i jego transformów
		addFocus(cid)
		selfSay('Hello '..getPlayerName(cid)..' what do you need? {jutsu}', cid)
	elseif ((msg == 'jutsu') and (isFocused(cid))) then
		selfSay('{Goukakyuu no Jutsu} level ' .. level[1] .. '',cid)
		selfSay('{Karyuu} level ' .. level[2] .. '',cid)
		selfSay('{Katon Endan} level ' .. level[3] .. '',cid)
		selfSay('{Katon Gouryuuka} level ' .. level[4] .. '',cid)
		selfSay('{Katon Housenka no Jutsu} level ' .. level[5] .. '',cid)
		selfSay('{Katon Karyuudan} level ' .. level[6] .. '',cid)
		selfSay('{Mangekyou} level ' .. level[7] .. '',cid)
		selfSay('{Ryuuka} level ' .. level[8] .. '',cid)
	elseif((msg == 'Goukakyuu no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[1] then
			if getPlayerLearnedInstantSpell(cid, 'Goukakyuu no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Goukakyuu no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Goukakyuu}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[1] .. '')
		end
	elseif((msg == 'Karyuu') and (isFocused(cid))) then
		if playerLevel >= level[2] then
			if getPlayerLearnedInstantSpell(cid, 'Karyuu') == false then
				doPlayerLearnInstantSpell(cid, 'Karyuu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Karyuu Endan}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[2] .. '')
		end
	elseif((msg == 'Katon Endan') and (isFocused(cid))) then
		if playerLevel >= level[3] then
			if getPlayerLearnedInstantSpell(cid, 'Katon Endan') == false then
				doPlayerLearnInstantSpell(cid, 'Katon Endan')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Endan}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[3] .. '')
		end
	elseif((msg == 'Katon Gouryuuka') and (isFocused(cid))) then
		if playerLevel >= level[4] then
			if getPlayerLearnedInstantSpell(cid, 'Katon Gouryuuka') == false then
				doPlayerLearnInstantSpell(cid, 'Katon Gouryuuka')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Gouryuuka}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[4] .. '')
		end
	elseif((msg == 'Katon Housenka no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[5] then
			if getPlayerLearnedInstantSpell(cid, 'Katon Housenka no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Katon Housenka no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Housenka no Jutsu}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[5] .. '')
		end
	elseif((msg == 'Katon Karyuudan') and (isFocused(cid))) then
		if playerLevel >= level[6] then
			if getPlayerLearnedInstantSpell(cid, 'Katon Karyuudan') == false then
				doPlayerLearnInstantSpell(cid, 'Katon Karyuudan')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Karyuudan}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[6] .. '')
		end
	elseif((msg == 'Mangekyou') and (isFocused(cid))) then
		if playerLevel >= level[7] then
			if getPlayerLearnedInstantSpell(cid, 'Mangekyou') == false then
				doPlayerLearnInstantSpell(cid, 'Mangekyou')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Mangekyou Sharingan}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[7] .. '')
		end
	elseif((msg == 'Ryuuka') and (isFocused(cid))) then
		if playerLevel >= level[8] then
			if getPlayerLearnedInstantSpell(cid, 'Ryuuka') == false then
				doPlayerLearnInstantSpell(cid, 'Ryuuka')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Ryuuka no Jutsu}')
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