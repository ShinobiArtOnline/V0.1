function onCastSpell(cid, var)
local playerpos = getPlayerPosition(cid)
local cloth = getCreatureOutfit(cid)
local health = getCreatureHealth(cid)
local maxhealth = getCreatureMaxHealth(cid)
local MaximoSummon = 2 --- Maximo de Monstros Sumonados!! No Caso So Posso Sumonar 5 Clones
local level = getPlayerLevel(cid) 
local summons = getCreatureSummons(cid)
local hp = 60
local percent=50
local skill_factor = math.ceil((jutsuSkill_factor(cid,0) + level)/2)
local hp = math.max(1, math.ceil(((skill_factor*0.3) * hp)*0.4))
if(table.maxn(summons) < MaximoSummon) then -- no summons
 
local aka = doCreateMonster("Akamaru", getCreaturePosition(cid))

				if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) < 25 then
				doConvinceCreature(cid, aka)
				setCreatureMaxHealth(aka, maxhealth * (percent/100))
				doCreatureAddHealth(aka, maxhealth * (percent/100))
				elseif getPlayerLevel(cid) >= 25 and getPlayerLevel(cid) < 50 then
				doConvinceCreature(cid, aka)
				setCreatureMaxHealth(aka, maxhealth * (percent/100))
				doCreatureAddHealth(aka, maxhealth * (percent/100))
				elseif getPlayerLevel(cid) >= 50 and getPlayerLevel(cid) < 100 then
				doConvinceCreature(cid, aka)
				setCreatureMaxHealth(aka, maxhealth * (percent/100))
				doCreatureAddHealth(aka, maxhealth * (percent/100))
				elseif getPlayerLevel(cid) >= 100 and getPlayerLevel(cid) < 200 then
				doConvinceCreature(cid, aka)
				setCreatureMaxHealth(aka, maxhealth * (percent/100))
				doCreatureAddHealth(aka, maxhealth * (percent/100))
			  end

return TRUE
end
end