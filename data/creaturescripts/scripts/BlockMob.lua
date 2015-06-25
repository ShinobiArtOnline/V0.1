function onStatsChange(cid, attacker, type, combat, value)
----MONSTER BLOCK SYSTEM----
if isPlayer(attacker) and isMonster(attacker) then
  if type == STATSCHANGE_HEALTHLOSS and isMonster(cid) then
    if math.random(1, 5) > 4 then
         doSendAnimatedText(getCreaturePosition(cid), "Block..",COLOR_GREY)
         return false   
    end
  end
end

end