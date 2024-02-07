function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then return true end 
    if not isPremium(cid) then
        doTeleportThing(cid, fromPosition, true)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"Voce nao tem acesso Premium Account!")
        doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
    else
        doSendMagicEffect(getCreaturePosition(cid), 13)
    end
    return true
end