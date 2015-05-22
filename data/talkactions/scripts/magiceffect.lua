function onSay(cid, words, param, channel)
ilosc_efektow = 256

param = tonumber(param)
if(not param or param < 0 or param > ilosc_efektow) then
doPlayerSendCancel(cid, "Numeric param may not be lower than 0 and higher than "..ilosc_efektow..".")
return true
end

doSendMagicEffect(getCreaturePosition(cid), param)
return true
end