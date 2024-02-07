function onUse(cid, item, frompos, item2, topos)
	if not isCreature(cid) then return false end
	if exhaustion.get(cid, 1531) and exhaustion.get(cid, 1531) > 0 then
		doPlayerSendTextMessage(cid, 27, "You already have double experience.")
	return false
	end
	exhaustion.set(cid, 1531, 86400)
	doSendAnimatedText(getThingPos(cid), "DOUBLE XP", 35)
	doRemoveItem(item.uid, 1)
	
return true
end