-- [( Script created by Matheus for TibiaKing.com )] --
function onThink(interval, lastExecution)
MENSAGEM = {
"Ssij mi jaja",
}
doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],22)
return TRUE
end