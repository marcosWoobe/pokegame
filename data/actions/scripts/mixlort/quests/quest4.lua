function onUse(cid, item, fromPosition, itemEx, toPosition)

	local storage =  1853
	
	if getPlayerLevel(cid) >= 30 then
		if getPlayerStorageValue(cid, storage) >= 1 then
			sendMsgToPlayer(cid, 22, "Voc� j� pegou o que tinha aqui.")
			return true 
		end
		doPlayerAddItem(cid,2393,15)
		doPlayerAddExperience(cid, 4000)
		doSendMagicEffect(getCreaturePosition(cid), 28)
		doSendMagicEffect(getCreaturePosition(cid), 27)
		-- sendMsgToPlayer(cid, 22, "Voc� acabou de descobrir os mist�rios da caverna! Coletou uma Rock Stone e um pouuco de experi�ncia.")
		setPlayerStorageValue(cid, storage, 1)
	else
		sendMsgToPlayer(cid, 22, "Voc� n�o tem level suficiente para descobrir os mist�rios da caverna (30).")
	end

	return true
end