function onThink(interval, lastExecution)
MENSAGEM = {
"Visit our website shinobiartonline.eu",
}
doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],22)
return TRUE
end