function onSay(cid, words, param)
	if getPlayerStorageValue(cid, 4125) - os.time() > 1 then
		doPlayerSendTextMessage(cid, 20, "Voc� tem um Shiny Charm que falta "..convertTime(getPlayerStorageValue(cid, 4125) - os.time()).." para terminar.")
	else
		doPlayerSendTextMessage(cid, 20, "Voc� n�o tem nenhum Shiny Charm ativo.")
	end	
	return true
end