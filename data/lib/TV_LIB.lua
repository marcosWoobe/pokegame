function getTvOnlines()
    local t = {}
    local online = getPlayersOnline()
    for i=1, #online do
        if playerHasTv(online[i]) then
            table.insert(t, online[i])
        end
    end
    return t
end


function playerWatchTv(cid, playerCam)
    if not isPlayer(playerCam) or playerHasTv(playerCam) == false then
        doPlayerSendCancel(cid, "Canal fora do Ar.")
        return false
    end

    if playerHasTv(cid) then
        doPlayerSendCancel(cid, "Você não pode assistindo enquanto grava.")
        return false
    end

    --[[if playerWatchTv(cid) then
        doPlayerSendCancel(cid, MSG_WATCH_TV)
        return false
    end]]
	
    setPlayerTvWatch(cid, playerCam)
	return true
end
