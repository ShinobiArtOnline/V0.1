local buff = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(buff, CONDITION_PARAM_TICKS, -1)
setConditionParam(buff, CONDITION_PARAM_SKILL_FIST, 6)
setConditionParam(buff, CONDITION_PARAM_SKILL_AXE, 6)



function onLogin(cid)
---[EXP VIP]--
local rate = 1.1 -- 10%
local config = {
	welvip = "You are premium member! ["..((rate - 1)*100).."% more exp]",
}

if isPremium(cid) then
	doPlayerSetExperienceRate(cid, rate)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.welvip)
end

if isPremium(cid) then
  regen(cid, 2, 6)
 else
  regen(cid, 1, 2)
 end

---[Config Hospital]--
	--if getPlayerStorageValue(cid, initStorages.death) == 1 then
		--location = {
		--{x=246, y=300, z=7},
		--{x=246, y=302, z=7},

--	}
		--setPlayerStorageValue(cid, initStorages.death, 0)
	--	doTeleportThing(cid, location[math.random(#location)])
--end
----------------------
---[Config Kikkais]---
if getPlayerStorageValue(cid, sto_kikkais[1]) < 0 then
   setPlayerStorageValue(cid, sto_kikkais[1], 10)
   setPlayerStorageValue(cid, sto_kikkais[2], getPlayerLevel(cid)+1)
end
--------------------

	setPlayerStorageValue(cid, STORAGE_DEFENSE, 0)



-----INIT PONTOS----
	

-----[Config Missão]---
	
	for i = 1, #sto_missao do
	  if getCreatureStorage(cid, sto_missao[i]) < 0 then
		 doCreatureSetStorage(cid, sto_missao[i], 0)
	  end
	end
   
-----------------------
---INIT CMD---
	

	
---[Mizu Kinobori]---
	--setPlayerStorageValue(cid, sto_jutsu[3], 1)

-------------------

--if getPlayerStorageValue(cid, sto_resetPoints) < 0 then
--	setPlayerStorageValue(cid, sto_resetPoints, 0)
--end


---[Byakugan Config]-----  
	for i = 1, #sto_byakugan do
	  if getCreatureStorage(cid, sto_byakugan[i]) < 0 then
		 doCreatureSetStorage(cid, sto_byakugan[i], 1)
	  end
   end
 
	setPlayerStorageValue(cid, 9997, 0)
----[Sharingan Login]-----
	for i = 1, #sto_sharingan do
	  if getCreatureStorage(cid, sto_sharingan[i]) < 0 then
		 doCreatureSetStorage(cid, sto_sharingan[i], 1)
	  end
   end

	for i = 1, #sto_sharingan_reflect do
	  if getCreatureStorage(cid, sto_sharingan_reflect[i]) < 0 or getCreatureStorage(cid, sto_sharingan_reflect[i]) == 1 then
		 doCreatureSetStorage(cid, sto_sharingan_reflect[i], 0)
	  end
   end
-------------------------

---[HACHIMON TONKOU CONFIG]----
	if getPlayerStorageValue(cid, sto_hachimon[1]) == 0 then
		 doPlayerCastSpell(cid, "Kaimon")
		setPlayerStorageValue(cid, sto_hachimon[1], 1)
	end

	if getPlayerStorageValue(cid, sto_hachimon[2]) == 0 then
		doPlayerCastSpell(cid, "Kyumon")
		setPlayerStorageValue(cid, sto_hachimon[2], 1)
	end
	
	if getPlayerStorageValue(cid, sto_hachimon[3]) == 0 then
		--doRemoveCondition(cid, CONDITION_ATTRIBUTES)
		setPlayerStorageValue(cid, sto_hachimon[3], 1)
	end	
	
	if getPlayerStorageValue(cid, sto_hachimon[4]) == 0 then
		--doRemoveCondition(cid, CONDITION_ATTRIBUTES)
		setPlayerStorageValue(cid, sto_hachimon[4], 1)
	end	
	
	if getPlayerStorageValue(cid, sto_hachimon[5]) == 0 then
		--doRemoveCondition(cid, CONDITION_ATTRIBUTES)
		setPlayerStorageValue(cid, sto_hachimon[5], 1)
	end	
	
	if getPlayerStorageValue(cid, sto_hachimon[6]) == 0 then
		doPlayerCastSpell(cid, "Keimon")
		setPlayerStorageValue(cid, sto_hachimon[6], 1)
	end		
	
	if getPlayerStorageValue(cid, sto_hachimon[7]) == 0 then
		doPlayerCastSpell(cid, "Kyomon")
		setPlayerStorageValue(cid, sto_hachimon[7], 1)
	end		
	
	if getPlayerStorageValue(cid, sto_hachimon[8]) == 0 then
		 doPlayerCastSpell(cid, "Shimon")
		setPlayerStorageValue(cid, sto_hachimon[8], 1)
	end			

---[Hachimon tonkou login]---	
	for i = 1, #sto_hachimon do
	  if getCreatureStorage(cid, sto_hachimon[i]) < 0 then
		 setPlayerStorageValue(cid, sto_hachimon[i], 1)
	  end
   end
-----------------------------
   
----------------------------------------------------------------

--------------------------------------------------------------
------[Pills Config]----


------------------------
---[Akimichi Storage]--
---[Akimichi Storage]---
	setPlayerStorageValue(cid, sto_sensha[1], 0)
	setPlayerStorageValue(cid, sto_sensha[5], 0)
	setPlayerStorageValue(cid, sto_sensha[7], 0)
	setPlayerStorageValue(cid, sto_sensha[6], 1)
	setPlayerStorageValue(cid, sto_sensha[3], 1)
	setPlayerStorageValue(cid, sto_sensha[2], 1)
------------------------

	

---[Config Inuzuka]--
	if getPlayerStorageValue(cid, sto_inuzuka[1]) == 0 then
		doPlayerCastSpell(cid, "Shikyaku")
		setPlayerStorageValue(cid, sto_inuzuka[1], 1)
	end

	if getPlayerStorageValue(cid, sto_inuzuka[2]) == 0 then
		--doRemoveCondition(cid, CONDITION_ATTRIBUTESS)
		setPlayerStorageValue(cid, sto_inuzuka[2], 1)
	end
	if getPlayerStorageValue(cid, sto_inuzuka[3]) == 0 then
		doPlayerCastSpell(cid, "Soutorou")
		setPlayerStorageValue(cid, sto_inuzuka[3], 1)
	end

---[Config Inuzuka login]---
	for i = 1, #sto_inuzuka do
	  if getCreatureStorage(cid, sto_inuzuka[i]) < 0 then
		 doCreatureSetStorage(cid, sto_inuzuka[i], 1)
	  end
   end
   
---[Config Nara]--
	for i = 1, #sto_nara do
	  if getCreatureStorage(cid, sto_nara[i]) <= 0 then
		 doCreatureSetStorage(cid, sto_nara[i], 1)
	  end
   end
 
--[Config Genjutsu]--
	for i = 1, #sto_gen do
	  if getCreatureStorage(cid, sto_gen[i]) <= 0 then
		 doCreatureSetStorage(cid, sto_gen[i], 1)
	  end
	end 
---------------------------------------------------------------

 return true
end
