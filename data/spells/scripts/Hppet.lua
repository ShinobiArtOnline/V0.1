
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
	function hp(cid) 
			local hpp=getCreatureMaxHealth(cid)
			local perc= hpp * (35/100)
                doCreatureAddHealth(cid,hpp * (percent/100)) 
                hpling=addEvent(hp,times*1000,cid)
				setPlayerStorageValue(cid, 10003, 1)
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

	if getPlayerStorageValue(cid, 10003) == 0 then
		
			summons = getCreatureSummons(cid)
			local Fuuton = doCreateMonster("Katsuya", getCreaturePosition(cid))
			doConvinceCreature(cid, Fuuton)
		hp(cid)
		setPlayerStorageValue(cid, 10003, 1)
		--doAddCondition(cid, buff)
	elseif getPlayerStorageValue(cid, 10003) == 1 then
		stopEvent(hpling)
		setPlayerStorageValue(cid, 10003, 0)
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
	   summons = getCreatureSummons(cid)
		for _, summon in pairs(summons) do
		doSendMagicEffect(getThingPos(summon), 1)
		doRemoveCreature(summon)
		end
		
		exhaustion.set(cid, storage, waittime)
		 
	end
end