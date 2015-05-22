function onStatsChange(cid, attacker, type, combat, value)

   if getPlayerPet(cid) and getPlayerPet(cid) == attacker then
	  return false
   end
   
if isPet(cid) then 
  if type == STATSCHANGE_HEALTHLOSS then
  local dmg = value
     local pet = getPlayerPet(getCreatureMaster(cid))
  end
  end
  return true
end