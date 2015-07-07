
local waittime = 1.5 -- czas
local storage = 115818

local temp = {
exhausted = 2,
}
local times = 5 -- in sec 
local mpercent = 2.5
local percent= 7.5

local info = {
speed = 200,	
	}
	function manapet(cid) 
			
			local perc= getCreatureMaxMana(cid) * (35/100)
                doCreatureAddMana(cid,getCreatureMaxMana(cid) * (mpercent/100)) 
                dodajmane=addEvent(manapet,times*1000,cid)
				setPlayerStorageValue(cid, 10011, 1)
            return true 
        end 
		function hppet(cid) 
			local hppp=getCreatureMaxHealth(cid)
			local perc= hppp * (35/100)
                doCreatureAddHealth(cid,hppp * (percent/100)) 
                dodajhp=addEvent(hppet,times*1000,cid)
				setPlayerStorageValue(cid, 10011, 1)
            return true 
        end 
		


	
local buff = createConditionObject(CONDITION_INFIGHT,-1)

	
function onCastSpell(cid,var)

	if getTilePzInfo(getPlayerPosition(cid)) then
return doPlayerSendCancel(cid, "You in this area pz.") 
end 
if getPlayerStorageValue(cid, 10004) == 0 then
return doPlayerSendCancel(cid, "you cannot summon two pets")
end
	if not isCreature(cid) then
		return true
	end

	if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end

	if getPlayerStorageValue(cid, 10011) == 0 then
		
			summons = getCreatureSummons(cid)
			local Fuuton = doCreateMonster("Gamakatsu", getCreaturePosition(cid))
			doConvinceCreature(cid, Fuuton)
		manapet(cid)
		hppet(cid)
		setPlayerStorageValue(cid, 10011, 1)
		setPlayerStorageValue(cid, 10012, 0)
		--doAddCondition(cid, buff)
	elseif getPlayerStorageValue(cid, 10011) == 1 then
		stopEvent(dodajmane)
		stopEvent(dodajhp)
		setPlayerStorageValue(cid, 10012, 1)
		setPlayerStorageValue(cid, 10011, 0)
		doRemoveCondition(cid, CONDITION_ATTRIBUTES)
	   summons = getCreatureSummons(cid)
		for _, summon in pairs(summons) do
		doSendMagicEffect(getThingPos(summon), 1)
		doRemoveCreature(summon)
		end
		
		exhaustion.set(cid, storage, waittime)
		 
	end
end