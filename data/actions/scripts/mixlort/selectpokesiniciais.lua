function onUse(cid, item, fromPosition, itemEx, toPosition)

	local storage =  180033

	if getPlayerStorageValue(cid, 18057) <= 0 then
		setPlayerStorageValue(cid, 18057, 1)
	end
	if getPlayerStorageValue(cid, storage) >= 1 then
		sendMsgToPlayer(cid, 22, "Voc� j� escolheu seu pok�mon inicial.")
		return true 
	else
	-- 	setPlayerStorageValue(cid, storage, 1)
		InicialNpc(cid, cid, '')
	end

end