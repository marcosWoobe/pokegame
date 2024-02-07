function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then return true end 

    if not (getPlayerItemCount(cid, 25217) >= 1) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não tem o ticket para viagens, vá comprar!")
        return true
    end

    if not isPremium(cid) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não tem acesso Premium Account!")
		return true
    else
        doTeleportThing(cid, {x = 2202, y = 2139, z = 7}, false)
    end
    return false
end