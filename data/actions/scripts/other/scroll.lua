function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid,8000) == 3 and getPlayerStorageValue(cid,8802) < 1) then
		setPlayerStorageValue(cid,8802,1)
		setPlayerStorageValue(cid,8000,4)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You found required scroll!')
	end
	return true
end