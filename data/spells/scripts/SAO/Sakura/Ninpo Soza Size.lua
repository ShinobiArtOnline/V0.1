local config = {
cooldown = 10, -- ehaustion
time = 1, -- czas
percent = 50, --- procent hp 
storage = 19330,
effect = 7, --- efekt
mana = 40 -- mana
}
function onCastSpell(cid, var)
if getCreatureMana(cid) >= config.mana then
if os.time() - getPlayerStorageValue(cid, config.storage) >= config.cooldown then
doPlayerSetStorageValue(cid, config.storage, os.time())
local i = 0
doCreatureAddMana(cid, -config.mana, 0)
while i < config.time do
i = i+1
addEvent(function()
 if isCreature(cid) then
 if getCreatureMaxHealth(cid) ~= getCreatureHealth(cid) then
 local lifedraw = math.ceil(getCreatureMaxHealth(cid) * (config.percent)/100)
 local pos = getPlayerPosition(cid)
              doCreatureAddHealth(cid, lifedraw, 1) 
              doSendAnimatedText(pos, "+"..lifedraw , TEXTCOLOR_GREEN) 
            doSendMagicEffect(pos, config.effect)
end
end
end, 1000*i)
end
else
doPlayerSendCancel(cid, "Your Mass Healing is at cooldown, you must wait "..(config.cooldown - (os.time() - getPlayerStorageValue(cid, config.storage))).." seconds.")
end
else
doPlayerSendCancel(cid, 36)
end
return false
end