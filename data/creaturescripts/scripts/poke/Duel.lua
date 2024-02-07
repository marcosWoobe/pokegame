function onJoinChannel(cid, channelId, users, isTv)
	if channelId >= 19 and channelId <= 21 then
		doSendAnimatedText(getThingPosWithDebug(cid), (channelId-18).."x"..(channelId-18), COLOR_BURN)
		doPlayerSetVocation(cid, 8)
    	openChannelDialog(cid)
    	return false
	end

	if channelId >= 13 and channelId <= 18 then
		local sid = getPlayerByName(getPlayerStorageValue(cid, 89142))
		if isPlayerOnline(sid) then
			if getCreatureMana(cid) >= channelId-12 then
				doOkDuel(cid, sid, channelId-12)
			else
				doPlayerSendTextMessage(cid, 25, "Sorry poke")
				openChannelDialog(cid)
			end
		else
			doPlayerSendTextMessage(cid, 25, "Sorry Offline")
			doCancelDuel(cid)
		end
		return false
	end

	return true
end