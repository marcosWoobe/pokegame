function onSay(cid, words, param, channel)
    if getPlayerStorageValue(cid, 17001) >= 1 or getPlayerStorageValue(cid, 63215) >= 1 or 
        getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 75846) >= 1 or
        getPlayerStorageValue(cid, 6598754) >= 1 or getPlayerStorageValue(cid, 6598755) >= 1 then   --alterado v1.9
        return doPlayerSendCancel(cid, "You can't do that right now.")
    end
    local thisball = getPlayerSlotItem(cid, 8)
    if getCreatureSummons(cid)[1] then
        if getItemAttribute(thisball.uid, "ehditto") then
            doItemSetAttribute(thisball.uid, "poke",  "Ditto")
            doDittoRevert(cid)
        elseif getItemAttribute(thisball.uid, "ehshinyditto") then
            doItemSetAttribute(thisball.uid, "poke",  "Shiny Ditto")
            doDittoRevert(cid)
        else
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Você Não Está Usando Um Ditto ou Shiny Ditto.')
        end
    end
end