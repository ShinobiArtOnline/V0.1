local waittime = 600 -- czas
local storage = 115819


function onCastSpell(cid, var)
local target=getCreatureTarget(cid)
if exhaustion.check(cid, 657899) then
doPlayerSendCancel(cid, 'Your bonus experience is still active. (Left: ' .. exhaustion.get(cid, 657899) ..' seconds.)')
return true
end

if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, 'Your have to wait ' .. exhaustion.get(cid, storage) ..' seconds to use again.)')
		return false
		end

if configSakura.work then

setPlayerStorageValue(target, 10007, 1)
setCreatureMaxHealth(target, getCreatureMaxHealth(cid)+300)
doCreatureAddHealth(target, 300)
exhaustion.set(cid, 657899, 15)
addEvent(bonusSakura, 15*1000, cid)

else
setPlayerStorageValue(target, 10007, 0)
doPlayerSendCancel(cid, 'Bonus experience is off.')

return true
end
exhaustion.set(cid, storage, waittime)

return true
end