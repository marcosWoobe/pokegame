function onSay(cid, words, param, channel)

	if not param then
		doPlayerSendCancel(cid, "Escolha o modo on ou off.")
		return true
	end
	
	if param == "on" then
		setPlayerStorageValue(cid, 20025, "all")
		setPlayerStorageValue(cid, 20026, 1)
		doPlayerSendTextMessage(cid, 20, "Autoloot ativado!")
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Autoloot ativado!")
	elseif param == "off" then
		setPlayerStorageValue(cid, 20025, 0)
		setPlayerStorageValue(cid, 20026, 0)	
		doPlayerSendTextMessage(cid, 20, "Autoloot desativado!")
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Autoloot desativado!")
	end

return true
end
