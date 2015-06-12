local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local config = {
storage = 49708,
tempo = 1,
effect = 125,
}

local exception = {"Nic", "Training Monk", "GOD"}

function onCastSpell(cid, var)
if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
local name = getCreatureName(getCreatureTarget(cid))
if not isInArray(exception, name) then
	if getPlayerStorageValue(cid, config.storage) <= 0 then
		doPlayerSetStorageValue(cid, config.storage, 1)
		
		addEvent(function()
		doPlayerSetStorageValue(cid, config.storage, 0)
			if isCreature(cid) and isCreature(variantToNumber(var)) then
				if isWalkable(getCreaturePosition(variantToNumber(var)), false, true, true) then
					doTeleportThing(cid, getThingPos(variantToNumber(var)), true)
					arr = {3}
					doAreaCombatHealth(cid, 1, getThingPos(variantToNumber(var)), arr, -getPlayerLevel(cid), -2*(getPlayerLevel(cid)), 125)
				elseif isCreature(cid) and not isWalkable(getCreaturePosition(variantToNumber(var)), false, true, true) then
					doPlayerSendCancel(cid, "You can't reach your target")
				end
			end
		end, 10*config.tempo)
	elseif getPlayerStorageValue (cid, config.storage) > 0 then
		doSendMagicEffect(getThingPos(cid), 2)
		doPlayerSendCancel(cid, "You've already set your target.")
	end
	else
	doPlayerSendCancel (cid, "You can't use this spell in this creature.")
	return false
	end
	exhaustion.set(cid, storage, waittime)
	doCombat(cid,combat, var)
return true
end