local combat = createCombatObject()
local waittime = 1.5 -- czas
local storage = 115818

local temp = {
exhausted = 2,
}

local confg = {
level = 1,
chakra = 35
}
function ChojiremoveChakra(cid, percent, time, storage, type)
 local remove = percent
 if not isCreature(cid) then
  return true
 end


  if type == "sharingan" then
   if getCreatureMana(cid) > remove then
    doCreatureAddMana(cid, -remove)
   else
    doCreatureAddMana(cid, -remove)
    doCreatureAddHealth(cid, -remove)
    doSendAnimatedText(getCreaturePosition(cid), remove, COLOR_RED)
   end
   elseif  getPlayerStorageValue(cid,676767)==1 then
   stopEvent(ab)
  end
  ab=addEvent(ChojiremoveChakra, 1*1000, cid, remove, time, storage, type)
  
 end


function onCastSpell(cid,var)
	local info = {
		chakra = 5,
	}

	local chakraPercent = getCreatureMaxMana(cid) * (info.chakra / 100)
	
-----[Restrições]-----

	
	
	if checkJutsu(cid, "Hari") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if checkJutsu(cid, "Chou Baika") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end	
	if checkJutsu(cid, "Mizudan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if checkJutsu(cid, "Tongarashigan") then
		return doPlayerSendCancel(cid, "you cannot use jutsu")
	end
	if exhaustion.check(cid, storage) then
		doPlayerSendCancel(cid, "You are exhausted")
		return false
		end
----------------------	

	 if isPlayer(cid) then
	  if getPlayerStorageValue(cid,sto_sensha[1]) == 0 then
		setPlayerStorageValue(cid, 676767, 0)
             iniNikudan(cid)
			  
			  --ChojiremoveChakra(cid, 1, 1, 676767, "sharingan")
			 setPlayerStorageValue(cid, sto_sensha[1], 1)
             addEvent(nikudanSensha, 300, cid, 3)
			 setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
			
		
         else
		 setPlayerStorageValue(cid, 676767, 1)
			
             endNikudan(cid)
			 setPlayerStorageValue(cid, sto_sensha[1], 0)
			doRemoveCondition(cid, CONDITION_OUTFIT)
			 setPlayerStorageValue(cid, sto_jutsu[1], os.time() + temp.exhausted)
			 exhaustion.set(cid, storage, waittime)
         end
	end
	return doCombat(cid,combat, var)
end
