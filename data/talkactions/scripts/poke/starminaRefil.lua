function onSay(cid, words, param, channel)
    local cfg = {}
    cfg.refuel = 42 * 60 * 1000
	--doPlayerSetStamina(cid, -cfg.refuel)
	if getPlayerItemCount(cid, 2145) < 3 then
        return doPlayerSendCancel(cid, "Você precisa de 3 diamonds.")
    end
	
    if(getPlayerStamina(cid) >= cfg.refuel) then
        doPlayerSendCancel(cid, "Your stamina is already full.")
    else
        doPlayerSetStamina(cid, cfg.refuel)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your stamina has been refilled.")
        doPlayerRemoveItem(cid, 2145, 3)
    end
	return true
end