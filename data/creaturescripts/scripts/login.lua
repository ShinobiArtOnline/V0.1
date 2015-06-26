local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			str = 'Good luck have fun ' ..getPlayerName(cid)..'! SAO Team'
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, it appears that your character has been namelocked, what would you like as your new name?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to manage your account and if you want to start over then type 'cancel'.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to create an account or type 'recover' to recover an account.")
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	if getPlayerStorageValue(cid, 49708) ~= 0 then
        setPlayerStorageValue(cid, 49708, 0) 
end
	--setPlayerStorageValue(cid, 123987, 0)--Susano
	setPlayerStorageValue(cid, 676767, 0)--
	setPlayerStorageValue(cid, 10002, 0)--pet
	setPlayerStorageValue(cid, 10003, 0)--pet
	for i = 9000, 9063 do setPlayerStorageValue(cid, i, 0)
	end
	registerCreatureEvent(cid, "Bounty")
    setPlayerStorageValue(cid, 8877, 0)
    setPlayerStorageValue(cid, 14755, -1)
	Outfit(cid)
	registerCreatureEvent(cid, "Sakura")
	registerCreatureEvent(cid, "Petdeath")
	--setPlayerStorageValue(cid, 1234899, 1) 
	registerCreatureEvent(cid, "Aol")
	registerCreatureEvent(cid, "dead")
	registerCreatureEvent(cid, "fullhp")
	registerCreatureEvent(cid, "sru")
	registerCreatureEvent(cid, "Outfitek") 
	registerCreatureEvent(cid, "direction")
	registerCreatureEvent(cid, "Stamina")
	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "GuildMotd")
	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "Hit")
	registerCreatureEvent(cid, "pointsup")
	registerCreatureEvent(cid, "noMove")
	registerCreatureEvent(cid, "skillAdvanced")
	registerCreatureEvent(cid, "CapKikkais")
	registerCreatureEvent(cid, "hachimonAdvance")
	registerCreatureEvent(cid, "Death")
	registerCreatureEvent(cid, "task")
--	registerCreatureEvent(cid, "partyAndGuildProtection")
	registerCreatureEvent(cid, "Rest")
	registerCreatureEvent(cid, "creatureMove")
	registerCreatureEvent(cid, "kagemaneDeath")
	registerCreatureEvent(cid, "Osiagniecia")
	registerCreatureEvent(cid, "mizuki")
	registerCreatureEvent(cid, "mizuki think")
	registerCreatureEvent(cid, "sagoweMonstery")
setPlayerStorageValue(cid, 1234998, 0)
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end
	registerCreatureEvent(cid, "ReportBug")
	registerCreatureEvent(cid, "AdvanceSave")
	
	return true
end

function onLogout(cid)
	cleanKagemaneTargetList(cid)
		if(getPlayerStorageValue(cid, STORAGE_TRAPED_ON_KAGEMANE) == 1) then
			freeFromKagemane(cid)
		end
		--setPlayerStorageValue(cid, 1234998, 1)
	
	if getPlayerStorageValue(cid, 10002) == 1 then
	doPlayerCastSpell(cid, "pet")
	end
	if getPlayerStorageValue(cid, 10003) == 1 then
	doPlayerCastSpell(cid, "Hppet")
	end
	if getPlayerStorageValue(cid, 676767) == 0 then
	doPlayerCastSpell(cid, "Hari Sensha")
	end
	
	for i = 9000, 9063 do 
   		 setPlayerStorageValue(cid, i, 0)
	end
	if configExp.work then

if exhaustion.check(cid, configExp.storageExh) then

local yourRates = getPlayerRates(cid)[SKILL__LEVEL]
local bonusExpRate = yourRates + (configExp.rate * yourRates/100)
local lastTime = exhaustion.get(cid, configExp.storageExh)

doPlayerSetRate(cid, SKILL__LEVEL, bonusExpRate)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Your bonus experience is still active. (Left: ' .. lastTime ..' seconds.)')
addEvent(bonusExp, lastTime * 1000, cid)
end

end

if configPils.work then

if exhaustion.check(cid, configPils.storageExh) then

setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+300)
doCreatureAddHealth(cid, 300)
local lastTime = exhaustion.get(cid, configExp.storageExh)

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Your bonus experience is still active. (Left: ' .. lastTime ..' seconds.)')
addEvent(bonusPils, lastTime * 1000, cid)
end

end
	return true
end