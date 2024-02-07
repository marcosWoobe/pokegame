function onUse(cid, item, fromPosition, itemEx, toPosition)

	local storage =  1855
	
	if getPlayerLevel(cid) >= 30 then
		if getPlayerStorageValue(cid, storage) >= 1 then
			sendMsgToPlayer(cid, 22, "Você já pegou o que tinha aqui.")
			return true 
		end
		doPlayerAddItem(cid,12344,15)
		doPlayerAddItem(cid,2392,15)
		doPlayerAddExperience(cid, 4000)
		doSendMagicEffect(getCreaturePosition(cid), 28)
		doSendMagicEffect(getCreaturePosition(cid), 27)
		-- sendMsgToPlayer(cid, 22, "Você acabou de descobrir os mistérios da caverna! Coletou uma Rock Stone e um pouuco de experiência.")
		setPlayerStorageValue(cid, storage, 1)
	else
		sendMsgToPlayer(cid, 22, "Você não tem level suficiente para descobrir os mistérios da caverna (30).")
	end

	return true
end