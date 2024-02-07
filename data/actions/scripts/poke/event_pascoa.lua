function onUse(cid, item, fromPosition, item2, toPosition)

    sendMsgToPlayer(cid, 20, "Você recebeu 1 Event Point por encontrar uma cesta de ovo.")
	setPlayerStorageValue(cid, 57086, getPlayerStorageValue(cid, 57086) + 1) 
	doRemoveItem(item.uid, 1)

return true
end