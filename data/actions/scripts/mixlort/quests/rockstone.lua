function onUse(cid, item, fromPosition, itemEx, toPosition)

	local storage =  21014

	if getPlayerLevel(cid) >= 25 then
		if getPlayerStorageValue(cid, storage) >= 1 then
			sendMsgToPlayer(cid, 22, "Voc� j� pegou o que tinha aqui.")
			return true 
		end
		doPlayerAddItem(cid,11445,1)
		doPlayerAddExperience(cid, 4000)
		-- sendMsgToPlayer(cid, 22, "Voc� acabou de descobrir os mist�rios da caverna! Coletou uma Rock Stone e um pouuco de experi�ncia.")
		doSendMagicEffect(getPlayerPosition(cid), 586)
		setPlayerStorageValue(cid, storage, 1)
	else
		sendMsgToPlayer(cid, 22, "Voc� n�o tem level suficiente para descobrir os mist�rios da caverna.")
	end

end