function onUse(cid, item)
    local mEvolution, ball = megaEvolutions[item.itemid], getPlayerSlotItem(cid, 8).uid
    if not mEvolution then
        return doPlayerSendCancel(cid, "Sorry, this isn't a mega stone.")
    elseif ball < 1 then
        return doPlayerSendCancel(cid, "Put a pokeball in the pokeball slot.")
    elseif #getCreatureSummons(cid) > 0 then
        return doPlayerSendCancel(cid, "Return your pokemon.")
    elseif getItemAttribute(ball, "poke") ~= mEvolution[1] then
        return doPlayerSendCancel(cid, "Put a pokeball with a(n) "..mEvolution[1].." in the pokeball slot.")
    elseif getItemAttribute(ball, "megaStone") then
        return doPlayerSendCancel(cid, "Your pokemon is already holding a mega stone.")
    end
    doItemSetAttribute(ball, "megaStone", item.itemid)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Now your "..getItemAttribute(ball, "poke").." is holding a(n) "..getItemNameById(item.itemid)..".")
    doRemoveItem(item.uid)
    return true
end