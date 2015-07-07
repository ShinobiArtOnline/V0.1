
function onUseWeapon(cid, var)
local level = getPlayerLevel(cid)
		local mlevel = getPlayerMagLevel(cid) 
		local jutsuDmg = 30
		local skill_factor = math.ceil((mlevel + level)/2)
		local dmg = - math.max(1, math.ceil(((skill_factor*0.5) * jutsuDmg)*0.40))
if math.random(1,50) <= 25 then
doPlayerAddMana(cid, dmg)
end

end
