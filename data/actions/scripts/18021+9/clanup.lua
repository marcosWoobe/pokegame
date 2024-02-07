function onUse(cid, item, frompos, item2, topos)
	if not isCreature(cid) then return false end
	if getPlayerClanNum(cid) <= 0 then
		doPlayerSendTextMessage(cid, 27, "You need enter in a clan to use this item.")
	return false
	end
	if getPlayerClanRank(cid) == 5 then
		doPlayerSendTextMessage(cid, 27, "You have max rank of your clan.")
	return false
	end
	nextRank = 5
	if getPlayerLevel(cid) < 120 then
		doPlayerSendTextMessage(cid, 27, "You need level 120 to advance your clan rank!")
	return false
	end
	if getPlayerStorageValue(cid, 854789) >= 1 then
		doPlayerSendTextMessage(cid, 27, "You not advance to rank 5 during tasks!")
	return false
	end
	doRemoveItem(item.uid, 1)
	setPlayerClanRank(cid, nextRank)
	doPlayerSendTextMessage(cid, 27, "You advanced your rank!\nNow your is "..lookClans[getPlayerClanNum(cid)][getPlayerClanRank(cid)]..".")
	doSendMagicEffect(getThingPos(cid), 28)
return true
end