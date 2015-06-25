function onLogin(cid)
if getPlayerGroupId(cid) >= 3 then
doBroadcastMessage("Staff [".. getCreatureName(cid).."] Enter on Server")
end
return true
end