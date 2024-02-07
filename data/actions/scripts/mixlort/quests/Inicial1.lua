function onUse(cid, item, fromPosition, itemEx, toPosition)

	local storage =  28010
	
	if getPlayerLevel(cid) <= 50 then
		if getPlayerStorageValue(cid, storage) >= 1 then
			sendMsgToPlayer(cid, 22, "Você já pegou o que tinha aqui.")
			return true 
		end
		doPlayerAddItem(cid,11445,1)
		doPlayerAddExperience(cid, 4000)
		sendMsgToPlayer(cid, 22, "Você acabou de descobrir os mistérios da caverna! Coletou uma Rock Stone e um pouuco de experiência.")
		setPlayerStorageValue(cid, storage, 1)
	else
		sendMsgToPlayer(cid, 22, "Você não tem level suficiente para descobrir os mistérios da caverna.")
	end

	return true
end