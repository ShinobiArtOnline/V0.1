function onCastSpell(cid, var)
local playerpos = getPlayerPosition(cid)
local cloth = getCreatureOutfit(cid)
local health = getCreatureHealth(cid)
local maxhealth = getCreatureMaxHealth(cid)
local MaximoSummon = 1 --- Maximo de Monstros Sumonados!! No Caso So Posso Sumonar 5 Clones
local level = getPlayerLevel(cid) 
local summons = getCreatureSummons(cid)
local hp = 60
local percent=15
local percent100=25
local percent150=45
local skill_factor = math.ceil((jutsuSkill_factor(cid,0) + level)/2)
local hp = math.max(1, math.ceil(((skill_factor*0.3) * hp)*0.4))





if(table.maxn(summons) < MaximoSummon) then -- no summons
 

				if getPlayerLevel(cid) >= 10 and getPlayerLevel(cid) < 50 then
				local aka = doCreateMonster("Akamaru", getCreaturePosition(cid))
				setPlayerStorageValue(cid, 10011, 1)
				doConvinceCreature(cid, aka)
				setCreatureMaxHealth(aka, maxhealth * (percent/100))
				doCreatureAddHealth(aka, maxhealth * (percent/100))
				end
				if getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
				local aka = doCreateMonster("Akamaruu", getCreaturePosition(cid))
				doConvinceCreature(cid, aka50)
				setCreatureMaxHealth(aka50, maxhealth * (percent/100))
				doCreatureAddHealth(aka50, maxhealth * (percent/100))
				end
				if getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 150 then
				local aka100 = doCreateMonster("Red Akamaru", getCreaturePosition(cid))
				doConvinceCreature(cid, aka100)
				setCreatureMaxHealth(aka100, maxhealth * (percent100/100))
				doCreatureAddHealth(aka100, maxhealth * (percent100/100))
				end
				if getPlayerLevel(cid) >= 150 and getPlayerLevel(cid) < 500 then
				local aka150 = doCreateMonster("Adult Akamaru", getCreaturePosition(cid))
				doConvinceCreature(cid, aka150)
				setCreatureMaxHealth(aka150, maxhealth * (percent150/100))
				doCreatureAddHealth(aka150, maxhealth * (percent150/100))
				end
			  


end
end