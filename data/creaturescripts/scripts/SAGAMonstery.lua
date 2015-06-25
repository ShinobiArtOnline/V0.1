function onCombat(cid, target)
	local creatures = { 'Mizuki', 'Kakashi\'s Clone', 'Masked Ninja' } --lista sagowych monsterow
	local monster = getCreatureName(target)
	if isInArray(creatures, monster) then
		if isInArray(creatures, monster) and getPlayerStorageValue(cid, 8000) == 4 then -- Mizuki
			return true
		elseif isInArray(creatures, monster) and getPlayerStorageValue(cid, 8000) == 8 then -- KakashiClone
			return true
		elseif isInArray(creatures, monster) and getPlayerStorageValue(cid, 8000) == 13 then -- Ninja
			return true
		else	
			return false
		end
	else
		return true
	end
end  