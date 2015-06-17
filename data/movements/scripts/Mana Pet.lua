local amount = 200 -- amount of mana 
local times = 5 -- in sec 
local percent =10
local buff = createConditionObject(CONDITION_INFIGHT,-1)

function onEquip(cid, item, slot)
 --if getTilePzInfo(getPlayerPosition(cid)) then
    --    return doPlayerSendCancel(cid, "You in this area pz.")
	--	end 
local manaa=getCreatureMaxMana(cid)
	summons = getCreatureSummons(cid)
local Fuuton = doCreateMonster("Gamakichi", getCreaturePosition(cid))
doConvinceCreature(cid, Fuuton)
--if getTilePzInfo(getPlayerPosition(cid)) then
        --return doPlayerSendCancel(cid, "You in this area pz.") end 
			function mana(cid) 
			
                doCreatureAddMana(cid,manaa * (percent/100)) 
                manaling=addEvent(mana,times*1000,cid)
				doAddCondition(cid, buff)
					
            return true 
        end 
	
 
mana(cid)
if (getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE) then
doPlayerSendTextMessage(cid, MESSAGE_EVENT_ORANGE,'Take off your pet if you want to dont have pz. Sciagnij peta a pozbedziesz sie pz')
	return true
end


return true
end

function onDeEquip(cid, item, slot)
doRemoveCondition(cid, CONDITION_INFIGHT)
doTransformItem(item.uid, 2167)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You're no longer receiving the special bonus..")
stopEvent(manaling)
summons = getCreatureSummons(cid)
for _, summon in pairs(summons) do
  doSendMagicEffect(getThingPos(summon), 1)
  doRemoveCreature(summon)
  end
return true
end