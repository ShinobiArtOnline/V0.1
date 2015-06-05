function onCastSpell(cid, var)
	if not isCreature(cid) then
return true
end

	
	addEvent(doCreatureSay, 100, cid, "Kikkaichu", TALKTYPE_MONSTER)
	addEvent(doCreatureSay, 400, cid, "Bashira!", TALKTYPE_MONSTER)
for n = 0,3 do
local pos = getFirstCreaturePosOnDirection(cid,(n+1))
local newpos = {x = pos.x - 7, y = pos.y - 6, z = pos.z}
	addEvent(doSendDistanceShoot, 600+400*n, newpos, pos, 41)
	addEvent(doAreaCombatHealth, 600+400*n, cid, COMBAT_KIKAICHUU, getFirstCreaturePosOnDirection(cid,(n+1)), 0, -10, -12, 31)
	end
end