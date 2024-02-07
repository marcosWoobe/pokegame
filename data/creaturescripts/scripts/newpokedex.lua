function onJoinChannel(cid, channelId, users, isTv)
    for i = 10001, 10264 do               
        local z = tonumber(i - 10000)     
        local myball = getPlayerSlotItem(cid, 8).uid
        if channelId == i then
	        local catchP = getPlayerCatch(cid, testeDex[z][1]) 
		    if catchP.dex then--viktor
                doShowPokedexRegistration(cid, testeDex[z][1], myball)
            else 
                doPlayerSendTextMessage(cid, 27, "Você não descobriu esse pokémon ainda!")
                doPlayerSetVocation(cid, 9)
	            openChannelDialog(cid)
            end
            return false
        end
    end
    return true
end

function onLeaveChannel(cid, channelId, users)

    for i = 10001, 10264 do
        if channelId == i then
            doPlayerSetVocation(cid, 1)
        end
    end
end 