local amount = 200 -- amount of hp 
local times = 5 -- in sec 
local percent =10
local buff = createConditionObject(CONDITION_INFIGHT,-1)

function onEquip(cid, item, slot)
local hp=getCreatureMaxHealth(cid)
	summons = getCreatureSummons(cid)
local Fuuton = doCreateMonster("Katsuya", getCreaturePosition(cid))
doConvinceCreature(cid, Fuuton)
if getTilePzInfo(getPlayerPosition(cid)) then
        return doPlayerSendCancel(cid, "You in this area pz.") end 
			function heal(cid) 
			if getPlayerStorageValue(cid, 123489) == 1 then
                doCreatureAddHealth(cid,hp * (percent/100)) 
                healing=addEvent(heal,times*1000,cid)
				doAddCondition(cid, buff)
					else
					stopEvent(healing)
            return true 
        end 
		end
 
heal(cid)
if (getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE) then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE,'Take off your pet if you want to dont have pz. Sciagnij peta a pozbedziesz sie pz')
	return true
end


return true
end

function onDeEquip(cid, item, slot)
doRemoveCondition(cid, CONDITION_INFIGHT)
doTransformItem(item.uid, 2165)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You're no longer receiving the special bonus..")
stopEvent(healing)
summons = getCreatureSummons(cid)
for _, summon in pairs(summons) do
  doSendMagicEffect(getThingPos(summon), 1)
  doRemoveCreature(summon)
  end
setPlayerStorageValue(cid, 123489, 1) 
return true
end