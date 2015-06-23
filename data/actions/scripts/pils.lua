local waittime = 600 -- czas
local storage = 115819


function onUse(cid, item, fromPosition, itemEx, toPosition)

if exhaustion.check(cid, 657899) then
doPlayerSendCancel(cid, 'Your bonus experience is still active. (Left: ' .. exhaustion.get(cid, 657899) ..' seconds.)')
return true
end

if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, 'Your have to wait ' .. exhaustion.get(cid, storage) ..' seconds to use again.)')
		return false
		end

if configPils.work then

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "COME ON.")
setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+300)
	doCreatureAddHealth(cid, 300)
exhaustion.set(cid, 657899, 15)
addEvent(bonusPils, 15*1000, cid)

local animText = math.random(1,200)
doSendMagicEffect(fromPosition, 10) -- jakis efekt
doSendAnimatedText(fromPosition, '!MNIAAAM!', animText) -- animowany napis

else

doPlayerSendCancel(cid, 'Bonus experience is off.')

return true
end
exhaustion.set(cid, storage, waittime)

return true
end