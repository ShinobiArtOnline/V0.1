function iniOmote(cid, var)
omotedir = getFirstCreaturePosOnDirection(cid,4)
	if not isCreature(cid) then
		return true
	end
	if not isCreature(cid) then
		return true
	end
  stopNow(cid, 2500)
  actionMove(cid, 215, 200)
  addEvent(actionMove, 100, cid, 215, 100)
  addEvent(actionMove, 200, cid, 216, 100)
  addEvent(actionMove, 300, cid, 217, 100)
  addEvent(actionMove, 400, cid, 218, 100)
  addEvent(actionMove, 500, cid, 219, 100)
  addEvent(actionMove, 600, cid, 220, 100)
  addEvent(actionMove, 700, cid, 221, 100)
  addEvent(actionMove, 800, cid, 222, 100)
  addEvent(actionMove, 900, cid, 223, 100)
  addEvent(actionMove, 1000, cid, 224, 100)
  addEvent(actionMove, 1100, cid, 225, 100)
  addEvent(actionMove, 1200, cid, 226, 100)
  addEvent(actionMove, 1300, cid, 227, 100)
  addEvent(actionMove, 1400, cid, 228, 100)
  addEvent(actionMove, 1500, cid, 229, 100)
  addEvent(actionMove, 1600, cid, 230, 100)
  addEvent(actionMove, 1700, cid, 231, 100)
  addEvent(actionMove, 1800, cid, 232, 100)
  addEvent(actionMove, 1900, cid, 233, 100)
  addEvent(actionMove, 2000, cid, 234, 100)
  addEvent(actionMove, 2100, cid, 235, 100)
  addEvent(actionMove, 0, cid, 400, 2400) 
  addEvent(doCreatureSay, 300, cid, "OMOTE..", TALKTYPE_MONSTER)
  addEvent(doCreatureSay, 1000, cid, "RENGE!!!!", TALKTYPE_MONSTER)
  doCreatureSetHideHealth(cid,true)
  addEvent(doCreatureSetHideHealth, 2400,cid,false)
  doCreatureSetHideHealth(cid,true)
  addEvent(doCreatureSetHideHealth, 2400,cid,false)
  end

function hachimonTonkou1(cid)
  addEvent(actionMove, 0, cid, 12, 500)
  addEvent(actionMove, 100, cid, 8, 500)
 
  addEvent(doSendMagicEffect, 100, getThingPos(cid), 95)
  addEvent(doSendMagicEffect, 400, getThingPos(cid), 95)
  addEvent(doSendMagicEffect, 700, getThingPos(cid), 94)
  stopNow(cid, 700)
end


function hachimonTonkou2(cid)
  addEvent(changeMove, 0, cid, 12)
  addEvent(changeMove, 100, cid, 8)
  addEvent(changeMove, 200, cid, 10)
 
  addEvent(doSendMagicEffect, 100, getThingPos(cid), 95)
  addEvent(doSendMagicEffect, 400, getThingPos(cid), 95)
  addEvent(doSendMagicEffect, 700, getThingPos(cid), 94)
  
  stopNow(cid, 700)
end



function hachimonTonkou3(cid)
local pos = getThingPos(cid)
  addEvent(changeMove, 0, cid, 12, 500)
  addEvent(changeMove, 100, cid, 8, 500)
  addEvent(changeMove, 200, cid, 10, 500)
  addEvent(changeMove, 300, cid, 9, 500)
 

  addEvent(doSendMagicEffect, 600, {x=pos.x+1, y=pos.y+1, z=pos.z}, 93)
  addEvent(doSendMagicEffect, 800, {x=pos.x+1, y=pos.y+1, z=pos.z}, 93)
  addEvent(doSendMagicEffect, 1000, {x=pos.x+1, y=pos.y+1, z=pos.z}, 93)
  addEvent(doSendMagicEffect, 1200, {x=pos.x+1, y=pos.y+1, z=pos.z}, 93)

  stopNow(cid, 1200)
end

function endhachimonTonkou1(cid)
  stopNow(cid, 400)
  addEvent(actionMove, 0, cid, 8, 500)
  addEvent(actionMove, 100, cid,12 , -1)

end

function endhachimonTonkou2(cid)
  stopNow(cid, 500)
  addEvent(changeMove, 0, cid, 10, 500)
  addEvent(changeMove, 100, cid,8 , 500)
  addEvent(changeMove, 200, cid, 12, -1)
  
end