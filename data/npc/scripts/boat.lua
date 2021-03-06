local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

local travelNode = keywordHandler:addKeyword({'konoha'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wanna go to Konoha Gakure, are you sure?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  level = 10, cost = 0, destination = {x=1015, y=911, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

local travelNode = keywordHandler:addKeyword({'small florest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Dou you wanna go to Small Florest, are you sure?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  level = 70, cost = 0, destination = {x=789, y=905, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

local travelNode = keywordHandler:addKeyword({'naara florest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Dou you wanna go to Naara Florest, are you sure?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 120, cost = 0, destination = {x=848, y=718, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

local travelNode = keywordHandler:addKeyword({'desert montain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wanna go to Desert Montain, are you sure?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 240, cost = 0, destination = {x=975, y=757, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

local travelNode = keywordHandler:addKeyword({'water island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Dou you wanna go to Water Island, are you sure?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 240, cost = 0, destination = {x=1170, y=1214, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

local travelNode = keywordHandler:addKeyword({'akatsuki entrance'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Dou you wanna go to Akatsuki Entrance, are you sure?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 240, cost = 15000, destination = {x=910, y=738, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

local travelNode = keywordHandler:addKeyword({'naara desert'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Dou you wanna go to Naara Desert, are you sure?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 280, cost = 0, destination = {x=1126, y=654, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

        keywordHandler:addKeyword({'travel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can take you to Konoha, Small Florest, Naara Florest, Naara Desert, Desert Montain, Water Island, and Akatsuki Entrance'})
        -- Makes sure the npc reacts when you say hi, bye etc.
        npcHandler:addModule(FocusModule:new())