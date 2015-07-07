function onCombat(cid, target)
if(isPlayer(cid) and isMonster(target) and getCreatureName(cid) == getCreatureName(getCreatureMaster(target))) then
return false
	end
return true
end