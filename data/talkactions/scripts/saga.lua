--Transform By Crash
function onSay(cid, words, param)

local pos = getPlayerPosition(cid)

if getPlayerStorageValue(cid,8000) == 1 then
doPlayerSendTextMessage(cid, 19,"#2. Use Bunshin no Jutsu")

elseif getPlayerStorageValue(cid,8000) == 2 then
doPlayerSendTextMessage(cid, 19,"#3. Talk with Mizuki")

elseif getPlayerStorageValue(cid,8000) == 3 then
doPlayerSendTextMessage(cid, 19,"#4. Find the scroll in Hokage House and bring him to Mizuki. He will be waiting in the forest")

elseif getPlayerStorageValue(cid,8000) == 4 then
doPlayerSendTextMessage(cid, 19,"#5. Go to the forest and fight with Mizuki")

elseif getPlayerStorageValue(cid,8000) == 5 then
doPlayerSendTextMessage(cid, 19,"#6. Talk with Iruka") 

elseif getPlayerStorageValue(cid,8000) == 6 then
doPlayerSendTextMessage(cid, 19,"#7. Talk with Kakashi and join the team") 

elseif getPlayerStorageValue(cid,8000) == 7 then
doPlayerSendTextMessage(cid, 19,"#8. Go to the training place") 

elseif getPlayerStorageValue(cid,8000) == 8 then
doPlayerSendTextMessage(cid, 19,"#9. Kill three Kakashi\'s clones")

elseif getPlayerStorageValue(cid,8000) == 9 then
doPlayerSendTextMessage(cid, 19,"#10. Talk with Kakashi")

elseif getPlayerStorageValue(cid,8000) == 10 then
doPlayerSendTextMessage(cid, 19,"#11. Go to Kakashi's house and talk to him")

elseif getPlayerStorageValue(cid,8000) == 11 then
doPlayerSendTextMessage(cid, 19,"#12. Go to the Hokage and talk to him")

elseif getPlayerStorageValue(cid,8000) == 12 then
doPlayerSendTextMessage(cid, 19,"#13. Escort Tazuna to the Land of Waves. Beat the enemies. Tazuna must survive!")

elseif getPlayerStorageValue(cid,8000) == 13 then
doPlayerSendTextMessage(cid, 19,"#14. Kill Masked Ninja's! Tazuna must survive!")

else
		doPlayerSendTextMessage(cid, 19,"#1. Go to Academy and talk with Iruka")
	end

	return 1
end
