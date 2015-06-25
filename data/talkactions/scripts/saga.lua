--Transform By Crash
function onSay(cid, words, param)

local pos = getPlayerPosition(cid)

if getPlayerStorageValue(cid,8000) == 1 then
doPlayerSendTextMessage(cid, 19,"Use Bunshin no Jutsu")

elseif getPlayerStorageValue(cid,8000) == 2 then
doPlayerSendTextMessage(cid, 19,"Talk with Mizuki")

elseif getPlayerStorageValue(cid,8000) == 3 then
doPlayerSendTextMessage(cid, 19,"Find the scroll in Hokage House and bring him to Mizuki. He will be waiting in the forest.")

elseif getPlayerStorageValue(cid,8000) == 4 then
doPlayerSendTextMessage(cid, 19,"Go to the forest and fight with Mizuki")

elseif getPlayerStorageValue(cid,8000) == 5 then
doPlayerSendTextMessage(cid, 19,"Talk with Iruka") 

elseif getPlayerStorageValue(cid,8000) == 6 then
doPlayerSendTextMessage(cid, 19,"Talk with Kakashi and join the team") 

elseif getPlayerStorageValue(cid,8000) == 7 then
doPlayerSendTextMessage(cid, 19,"Go to the training place") 

elseif getPlayerStorageValue(cid,8000) == 8 then
doPlayerSendTextMessage(cid, 19,"Kill Kakashi\'s clones")

elseif getPlayerStorageValue(cid,8000) == 9 then
doPlayerSendTextMessage(cid, 19,"Talk with Kakashi")

elseif getPlayerStorageValue(cid,8000) == 10 then
doPlayerSendTextMessage(cid, 19,"Go to Kakashi's house and talk to him")

elseif getPlayerStorageValue(cid,8000) == 11 then
doPlayerSendTextMessage(cid, 19,"Go to the Hokage and talk to him")

elseif getPlayerStorageValue(cid,8000) == 12 then
doPlayerSendTextMessage(cid, 19,"Escort Tazuna to the Land of Waves. Beat the enemies. Tazuna must survive!")

elseif getPlayerStorageValue(cid,8000) == 13 then
doPlayerSendTextMessage(cid, 19,"Kill Masked Ninjas! Tazuna must survive!")

else
		doPlayerSendTextMessage(cid, 19,"Go to Academy and talk with Iruka")
	end

	return 1
end
