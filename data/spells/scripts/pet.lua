
local waittime = 1.5 -- czas
local storage = 115818

local temp = {
exhausted = 2,
}
local times = 5 -- in sec 
local percent =5

local info = {
speed = 200,	
	}
	function mana(cid) 
			local manaa=getCreatureMaxMana(cid)
			local perc= manaa * (35/100)
                doCreatureAddMana(cid,manaa * (percent/100)) 
                manaling=addEvent(mana,times*1000,cid)
				setPlayerStorageValue(cid, 10002, 1)
            return true 
        end 
		--doPlayerCastSpell(cid, "susek")


	
local buff = createConditionObject(CONDITION_INFIGHT,-1)

	
function onCastSpell(cid,var)

	if getTilePzInfo(getPlayerPosition(cid)) then
return doPlayerSendCancel(cid, "You in this area pz.") 
end 

	if not isCreature(cid) then
		return true
	end

	if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end

	if getPlayerStorageValue(cid, 10002) == 0 then
		local hp=getCreatureMaxHealth(cid)
			summons = getCreatureSummons(cid)
			local Fuuton = doCreateMonster("Gamakichi", getCreaturePosition(cid))
			doConvinceCreature(cid, Fuuton)
		mana(cid)
		setPlayerStorageValue(cid, 10002, 1)
		--doAddCondition(cid, buff)
	elseif getPlayerStorageValue(cid, 10002) == 1 then
		stopEvent(manaling)
		setPlayerStorageValue(cid, 10002, 0)
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
	   summons = getCreatureSummons(cid)
		for _, summon in pairs(summons) do
		doSendMagicEffect(getThingPos(summon), 1)
		doRemoveCreature(summon)
		end
		
		exhaustion.set(cid, storage, waittime)
		 
	end
end