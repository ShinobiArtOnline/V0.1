local level = 		--level potrzebny do nauczenia sie spella
	{
		1, --Kikkaichuu Mushikame no jutsu
		1, --Kikaichuu Arare
		1, --Kikaichuu Bashira no Jutsu
		1, --Kikaichuu Call no Jutsu
		1, --Kikaichuu Mushidama no Jutsu
		1, --Kikaichuu
		1, --Kikaichuu Return no Jutsu
		1, --Kikaichuu Tsumoji
		1, --Kikaichuu Yajiri
		1, --Kikaichuu Yajiri no Jutsu
		2, --target1
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
	if  ((msg == 'hi') and (PlayerVoc == 4 or (PlayerVoc >= 15 and PlayerVoc <=19))) then -- Vocation Aburame Shino i jego transformów
		addFocus(cid)
		selfSay('Hello '..getPlayerName(cid)..' what do you need? {jutsu}', cid)
	elseif ((msg == 'jutsu') and (isFocused(cid))) then
		selfSay('{Kikkaichuu Mushikame no jutsu} level ' .. level[1] .. '', cid)
		selfSay('{Kikaichuu Arare} level ' .. level[2] .. '',cid)
		selfSay('{Kikaichuu Bashira no jutsu} level ' .. level[3] .. '', cid)
		selfSay('{Kikaichuu Call no jutsu} level ' .. level[4] .. '', cid)
		selfSay('{Kikaichuu Mushidama no jutsu} level ' .. level[5] .. '', cid)
		selfSay('{Kikaichuu} level ' .. level[6] .. '', cid)
		selfSay('{Kikaichuu Return no jutsu} level ' .. level[7] .. '', cid)
		selfSay('{Kikaichuu Tsumoji} level ' .. level[8] .. '', cid)
		selfSay('{Kikaichuu Yajiri} level ' .. level[9] .. '', cid)
		selfSay('{Kikaichuu Yajiri no Jutsu} level ' .. level[10] .. '', cid)
		selfSay('{target1} level ' .. level[11] .. '', cid)
	elseif((msg == 'Kikkaichuu Mushikame no jutsu') and (isFocused(cid))) then
		if playerLevel >= level[1] then
			if getPlayerLearnedInstantSpell(cid, 'Kikkaichuu Mushikame no jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Kikkaichuu Mushikame no jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Kikkaichuu Mushikame}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[1] .. '')
		end
	elseif ((msg == 'Kikaichuu Arare') and (isFocused(cid))) then
		if playerLevel >= level[2] then
			if getPlayerLearnedInstantSpell(cid, 'Kikaichuu Arare') == false then
				doPlayerLearnInstantSpell(cid, 'Kikaichuu Arare')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Kikaichuu Arare No Jutsu}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[2] .. '')
		end
	elseif ((msg == 'Kikaichuu Bashira no jutsu') and (isFocused(cid))) then
		if playerLevel >= level[3] then
			if getPlayerLearnedInstantSpell(cid, 'Kikaichuu Bashira no jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Kikaichuu Bashira no jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Kikaichuu Bashira}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[3] .. '')
		end
	elseif ((msg == 'Kikaichuu Call no jutsu') and (isFocused(cid))) then
		if playerLevel >= level[4] then
			if getPlayerLearnedInstantSpell(cid, 'Kikaichuu Call no jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Kikaichuu Call no jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Kikaichuu Call}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[4] .. '')
		end
	elseif ((msg == 'Kikaichuu Mushidama no jutsu') and (isFocused(cid))) then
		if playerLevel >= level[5] then
			if getPlayerLearnedInstantSpell(cid, 'Kikaichuu Mushidama no jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Kikaichuu Mushidama no jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Kikaichuu Mushidama}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[5] .. '')
		end
	elseif ((msg == 'Kikaichuu') and (isFocused(cid))) then
		if playerLevel >= level[6] then
			if getPlayerLearnedInstantSpell(cid, 'Kikaichuu') == false then
				doPlayerLearnInstantSpell(cid, 'Kikaichuu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Kikaichuu no Jutsu}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[6] .. '')
		end
	elseif ((msg == 'Kikaichuu Return no jutsu') and (isFocused(cid))) then
		if playerLevel >= level[7] then
			if getPlayerLearnedInstantSpell(cid, 'Kikaichuu Return no jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Kikaichuu Return no jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Kikaichuu Return}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[7] .. '')
		end
	elseif ((msg == 'Kikaichuu Tsumoji') and (isFocused(cid))) then
		if playerLevel >= level[8] then
			if getPlayerLearnedInstantSpell(cid, 'Kikaichuu Tsumoji') == false then
				doPlayerLearnInstantSpell(cid, 'Kikaichuu Tsumoji')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Kikaichuu Tsumoji no Jutsu}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[8] .. '')
		end
	elseif ((msg == 'Kikaichuu Yajiri') and (isFocused(cid))) then
		if playerLevel >= level[9] then
			if getPlayerLearnedInstantSpell(cid, 'Kikaichuu Yajiri') == false then
				doPlayerLearnInstantSpell(cid, 'Kikaichuu Yajiri')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Kikaichuu Yajiri no Jutsu}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[9] .. '')
		end
	elseif ((msg == 'Kikaichuu Yajiri no Jutsu') and (isFocused(cid))) then
		if playerLevel >= level[10] then		
			if getPlayerLearnedInstantSpell(cid, 'Kikaichuu Yajiri no Jutsu') == false then
				doPlayerLearnInstantSpell(cid, 'Kikaichuu Yajiri no Jutsu')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {Mushi Bunshin no Jutsu}')
			else
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You already learned this jutsu.')
			end
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You need to be atleast level ' .. level[10] .. '')
		end
	elseif ((msg == 'target1') and (isFocused(cid))) then
		if playerLevel >= level[11] then	
			if getPlayerLearnedInstantSpell(cid, 'target1') == false then
				doPlayerLearnInstantSpell(cid, 'target1')
				doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'To use write {target}')
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