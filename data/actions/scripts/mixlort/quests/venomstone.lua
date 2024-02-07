function onUse(cid, item, fromPosition, itemEx, toPosition)

	local storage =  28011

	if getPlayerLevel(cid) >= 30 then
		if getPlayerStorageValue(cid, storage) >= 1 then
			sendMsgToPlayer(cid, 22, "Você já pegou o que tinha aqui.")
			return true 
		end
		doPlayerAddItem(cid,11443,1)
		doPlayerAddExperience(cid, 4000)
		sendMsgToPlayer(cid, 22, "Você acabou de descobrir os mistérios da caverna! Coletou uma Venom Stone e um pouuco de experiência.")
		doSendMagicEffect(getPlayerPosition(cid), 586)
		setPlayerStorageValue(cid, storage, 1)
	else
		sendMsgToPlayer(cid, 22, "Você não tem level suficiente para descobrir os mistérios da caverna.")
	end

end