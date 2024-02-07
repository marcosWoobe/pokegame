function onSelectTv(cid, id)
    local tv = getTvOnlines()
    local idstarter = 200
    for i=0, #tv do
        local player_cam = tv[i]
        local sub_id = i+idstarter


        if sub_id == id then
            playerWatchTv(cid, player_cam)
			return true
        end
    end

    doPlayerSendCancel(cid, "Canal sem sitonia.")
    return true
end

function onLeaveChannel(cid, channelId, users)  

	if channelId >= 100 and channelId <= 10000 then
	    local owner = getPlayerByGUID(getChannelOwner(channelId))
	    if playerHasTv(owner) then
			if owner ~= cid then 
				doLeaveTvChannel(cid)
				doSendAnimatedText(getThingPos(cid), "sair", 180)
				local plural = #users == 2 and "" or "s"
				doPlayerSendChannelMessage(owner, "TV Channel", getCreatureName(cid)..' is not watching your channel anymore (currently '..#users - (1)..' player'..plural..' watching this channel).', 15, channelId)
			elseif owner == cid then
			    doCloseChannelTv(cid)
				doSendAnimatedText(getThingPos(cid), "CAM OFF", 180)
			end 
		end

		return true
	end

    return true
end