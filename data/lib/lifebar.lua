function onPokeBarLife(cid)
    if isSummon(cid) and isPlayer(getCreatureMaster(cid)) then
        local itemBall = getPlayerSlotItem(getCreatureMaster(cid), CONST_SLOT_FEET)
        local hp = math.ceil((getCreatureHealth(cid) * 100) / getCreatureMaxHealth(cid))
        local orde = getItemAttribute(itemBall.uid, "ballorder")
        if orde then
            doPlayerSendCancel(getCreatureMaster(cid), "pGS,"..hp.."|"..orde.."|"..getPokeName(cid))
            doPlayerSendCancel(getCreatureMaster(cid), "")
        end
    end
end