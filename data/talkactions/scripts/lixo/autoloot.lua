function onSay(cid, words, param)

if not isCreature(cid) then return true end
if not param then return true end

if string.lower(param) == "on" then
	setPlayerStorageValue(cid, 83771, -1)
	doPlayerSendTextMessage(cid, 27, "Auto Loot Ativado")
return true
elseif string.lower(param) == "off" then
	setPlayerStorageValue(cid, 83771, 1)
	doPlayerSendTextMessage(cid, 27, "Auto Loot Desativado.")
return true
end
return true
end