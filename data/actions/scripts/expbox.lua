function onUse(cid, item, fromPosition, itemEx, toPosition)

if exhaustion.check(cid, 65789) then
doPlayerSendCancel(cid, 'Your bonus experience is still active. (Left: ' .. exhaustion.get(cid, 65789) ..' seconds.)')
return true
end


if configExp.work then
local yourRates = getPlayerRates(cid)[SKILL__LEVEL]
local bonusExpRate = yourRates + (1 * yourRates/100)

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Your old rates: " .. yourRates .. "x, now: " .. bonusExpRate .."x.")
doPlayerSetRate(cid, SKILL__LEVEL, bonusExpRate)
doRemoveItem(item.uid,1)
exhaustion.set(cid, 65789, 1000 * 60)
addEvent(bonusExp, configExp.workTime * 60 * 1000, cid)

local animText = math.random(1,200)
doSendMagicEffect(fromPosition, 10) -- jakis efekt
doSendAnimatedText(fromPosition, '!Bonus Exp!', animText) -- animowany napis

else

doPlayerSendCancel(cid, 'Bonus experience is off.')

return true
end

return true
end