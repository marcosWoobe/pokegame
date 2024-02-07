function onSay(cid, words, param)
	if getPlayerStorageValue(cid, 45144) - os.time() > 1 then
		doPlayerSendTextMessage(cid, 20, "Você tem um Experience Booster de "..getPlayerStorageValue(cid, 45145).."% e faltam "..convertTime(getPlayerStorageValue(cid, 45144) - os.time()).." para terminar.")
	else
		doPlayerSendTextMessage(cid, 20, "Você não tem nenhum Experience Booster ativo.")
	end	
	return true
end