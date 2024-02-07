function onJoinChannel(cid, channelId, users, isTv)

	if channelId == 10 then
		doShowPokemonStatistics(cid)
	    return false
	end

	if channelId == 11 then
		if reloadHighscoresWhenUsingPc then
			doReloadHighscores()
		end
		
        doPlayerPopupFYI(cid, getHighscoreString(8))
		return false
	end

	if channelId == 12 then
		if reloadHighscoresWhenUsingPc then
			doReloadHighscores()
		end
		
        doPlayerPopupFYI(cid, getHighscoreString(6))
		return false
	end
	--////////////////////////////////////////////////////////////////////////////////////////--
	   
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

function onLeaveChannel(cid, channelId, users)  
	return true
end

function onWalk(cid, fromPosition, toPosition)

	if getPlayerStorageValue(cid, 99284) <= 0 then return true end

	local speed = getCreatureSpeed(cid)
	local a = getWatchingPlayersFromPos(cid, fromPosition)

	for b = 1, #a do
		if getCreatureSpeed(a[b]) ~= speed then
			doChangeSpeed(a[b], - getCreatureSpeed(a[b]))
			doChangeSpeed(a[b], speed)
		end
		doTeleportThing(a[b], toPosition, true)
	end

return true
end

local permited = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
"t", "u", "v", "x", "w", ",", "'", '"',
"y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", ".", "!", "@", "#", "$", "%", "&", "*", "(", ")",
"-", "_", "+", "/", ";", ":", "?", "^", "~", "{", "[", "}", "]", ">", "<", "£", "¢", "¬"}

function onTextEdit(cid, item, newText)

	if item.itemid == 12330 then

		if getPlayerStorageValue(cid, 99284) >= 1 then
			doPlayerSendCancel(cid, "You are already on air!")
		return false
		end

		local channelName = getCreatureName(cid).."'s TV Channel"

		if string.len(newText) <= 0 then
			doPlayerSendCancel(cid, "Your channel is going to be shown as \""..getCreatureName(cid).."'s TV Channel\".")
		elseif string.len(newText) > 25 then
			doPlayerSendCancel(cid, "Your channel name can't have more than 25 characters.")
		return false
		else
			channelName = newText
		end


		setPlayerStorageValue(cid, 99284, 1)
		setPlayerStorageValue(cid, 99285, "")
		setPlayerStorageValue(cid, 99285, channelName)
		doPlayerCreatePrivateChannel(cid, channelName)
		doSendAnimatedText(getThingPos(cid), "ON AIR!", COLOR_GRASS)

	    return false
	end

    return true
end