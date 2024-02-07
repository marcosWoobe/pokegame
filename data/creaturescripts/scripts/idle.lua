local config = {
    idleWarning = getConfigValue('idleWarningTime'),
    idleKick = getConfigValue('idleKickTime')
}

 

function onThink(cid, interval)

    if(getTileInfo(getCreaturePosition(cid)).nologout or getCreatureNoMove(cid) or
        getPlayerCustomFlagValue(cid, PLAYERCUSTOMFLAG_ALLOWIDLE)) then
        return true
    end
	
    local idleTime = getPlayerIdleTime(cid) + interval
    doPlayerSetIdleTime(cid, idleTime)
    if(config.idleKick > 0 and idleTime > config.idleKick) then
        doRemoveCreature(cid)
    elseif(config.idleWarning > 0 and idleTime == config.idleWarning) then
        local message = "Você tem estado ocioso por " .. math.ceil(config.idleWarning / 60000) .. " minutos"
        if(config.idleKick > 0) then
            message = message .. ", você será desconectado em "
            local diff = math.ceil((config.idleWarning - config.idleKick) / 60000)
            if(diff > 1) then
                message = message .. diff .. " minutos"
            else
                message = message .. "um minuto"
            end
            message = message .. " você será desconectado em"
        end
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, message .. ".")
    end

    return true
end