function onSay(cid, words, param, channel)
	setPlayerStorageValue(cid, 188734, getPlayerMoney(cid))
	doPlayerRemoveMoney(cid, getPlayerMoney(cid))
	doPlayerAddMoney(cid, getPlayerStorageValue(cid, 188734))
	setPlayerStorageValue(cid, 188734, 0)	
	return true
end
