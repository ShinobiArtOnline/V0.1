function onKill(cid, target)


	if(isPlayer(target) == TRUE and getPlayerStorageValue(cid,9103) ~= 1) then	
		setPlayerStorageValue(cid, 9103, 1)
	end

	if(isMonster(target) == TRUE) then
		if getCreatureName(target) == "Bear" then
			if(getPlayerStorageValue(cid,19100) <= 0) then
			setPlayerStorageValue(cid, 19100, 1)
			else
			setPlayerStorageValue(cid, 19100, getPlayerStorageValue(cid,19100)+1)
			end
		end

		if getCreatureName(target) == "Fighter" or getCreatureName(target) == "Strong Fighter" or getCreatureName(target) == "Elite Fighter" or getCreatureName(target) == "Master Fighter" then
			if(getPlayerStorageValue(cid,19101) <= 0) then
			setPlayerStorageValue(cid, 19101, 1)
			else
			setPlayerStorageValue(cid, 19101, getPlayerStorageValue(cid,19101)+1)
			end
		end
		if getCreatureName(target) == "Swordsman" or getCreatureName(target) == "Strong Swordsman" or getCreatureName(target) == "Elite Swordsman" or getCreatureName(target) == "Master Swordsman" or getCreatureName(target) == "Destruction Swordsman" then
			if(getPlayerStorageValue(cid,19102) <= 0) then
			setPlayerStorageValue(cid, 19102, 1)
			else
			setPlayerStorageValue(cid, 19102, getPlayerStorageValue(cid,19102)+1)
			end
		end
		if getCreatureName(target) == "Ninja" or getCreatureName(target) == "Strong Ninja" or getCreatureName(target) == "Elite Ninja" or getCreatureName(target) == "Master Ninja" or getCreatureName(target) == "Destruction Ninja" or getCreatureName(target) == "Black Ninja" or getCreatureName(target) == "White Ninja" or getCreatureName(target) == "Star Ninja" or getCreatureName(target) == "Elite Star Ninja" then
			if(getPlayerStorageValue(cid,19104) <= 0) then
			setPlayerStorageValue(cid, 19104, 1)
			else
			setPlayerStorageValue(cid, 19104, getPlayerStorageValue(cid,19104)+1)
			end
		end

		if getCreatureName(target) == "Fire Shaolin Master" or getCreatureName(target) == "Water Shaolin Master" or getCreatureName(target) == "Shaolin" or getCreatureName(target) == "Strong Shaolin" or getCreatureName(target) == "Elite Shaolin" then
			if(getPlayerStorageValue(cid,19105) <= 0) then
			setPlayerStorageValue(cid, 19105, 1)
			else
			setPlayerStorageValue(cid, 19105, getPlayerStorageValue(cid,19105)+1)
			end
		end

		if getCreatureName(target) == "Insect" then
			if(getPlayerStorageValue(cid,19106) <= 0) then
			setPlayerStorageValue(cid, 19106, 1)
			else
			setPlayerStorageValue(cid, 19106, getPlayerStorageValue(cid,19106)+1)
			end
		end
		if getCreatureName(target) == "Shinobi Boss" then
			if(getPlayerStorageValue(cid,19107) <= 0) then
			setPlayerStorageValue(cid, 19107, 1)
			else
			setPlayerStorageValue(cid, 19107, getPlayerStorageValue(cid,19107)+1)
			end
		end

		if getCreatureName(target) == "Weapon Specialist Boss" then
			if(getPlayerStorageValue(cid,19108) <= 0) then
			setPlayerStorageValue(cid, 19108, 1)
			else
			setPlayerStorageValue(cid, 19108, getPlayerStorageValue(cid,19108)+1)
			end
		end

		if getCreatureName(target) == "Ninja Boss" then
			if(getPlayerStorageValue(cid,19109) <= 0) then
			setPlayerStorageValue(cid, 19109, 1)
			else
			setPlayerStorageValue(cid, 19109, getPlayerStorageValue(cid,19109)+1)
			end
		end

		if getCreatureName(target) == "Anbu" or getCreatureName(target) == "Stong Anbu" or getCreatureName(target) == "Elite Anbu" then
			if(getPlayerStorageValue(cid,19110) <= 0) then
			setPlayerStorageValue(cid, 19110, 1)
			else
			setPlayerStorageValue(cid, 19110, getPlayerStorageValue(cid,19110)+1)
			end
		end
if(getPlayerStorageValue(cid,19100) >= 75) then
			setPlayerStorageValue(cid, 9100, 1)
end
if(getPlayerStorageValue(cid,19101) >= 100) then
			setPlayerStorageValue(cid, 9101, 1)
end
if(getPlayerStorageValue(cid,19102) >= 100) then
			setPlayerStorageValue(cid, 9102, 1)
end
if(getPlayerStorageValue(cid,19104) >= 100) then
			setPlayerStorageValue(cid, 9104, 1)
end
if(getPlayerStorageValue(cid,19105) >= 200) then
			setPlayerStorageValue(cid, 9105, 1)
end
if(getPlayerStorageValue(cid,19106) >= 100) then
			setPlayerStorageValue(cid, 9106, 1)
end
if(getPlayerStorageValue(cid,19107) >= 10) then
			setPlayerStorageValue(cid, 9107, 1)
end
if(getPlayerStorageValue(cid,19108) >= 10) then
			setPlayerStorageValue(cid, 9108, 1)
end
if(getPlayerStorageValue(cid,19109) >= 10) then
			setPlayerStorageValue(cid, 9109, 1)
end
if(getPlayerStorageValue(cid,19110) >= 300) then
			setPlayerStorageValue(cid, 9110, 1)
end
	end
	return TRUE
end
