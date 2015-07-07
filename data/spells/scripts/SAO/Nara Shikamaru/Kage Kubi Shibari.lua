local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 15)

function onCastSpell(cid, var)
  if not isCreature(cid) then
    return true
  end


target=getCreatureTarget(cid)
pos=getCreaturePosition(target)
if isPlayer(target) then
				doPlayerSendTextMessage(cid,22,"You are under influence of a '"..getPlayerName(cid).."' paralyze")
			end
			doPlayerSendTextMessage(cid,22,"You have caught '"..getPlayerName(target).."' on your paralyze!")	 
addEvent(doSendMagicEffect, 1, {x = pos.x, y = pos.y, z = pos.z}, 15)
stopNow(getCreaturePosition(target), 2500)
stopNow(target, 2500)
doSendMagicEffect(getCreaturePosition(target), CONST_ME_SMALLCLOUDS)
addEvent(doPlayerSendTextMessage, 2500, target, 22, "'"..getPlayerName(target).."' escaped his genjutsu")
return doCombat(cid, combat, var)
end