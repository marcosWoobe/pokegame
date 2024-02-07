function onStepIn(cid, item, position, fromPosition)
    if not isPlayer(cid) then return true end 
	local owner = getItemAttribute(item.uid, "corpseowner")
	if owner and isCreature(owner) and isPlayer(owner) and cid == owner then   
	    local expBonus = getItemAttribute(item.uid, "bonusexp")
        doPlayerAddExp(cid, expBonus)
		sendMsgToPlayer(cid, 25, "Você ganhou "..expBonus.." Pontos de Experiência.")
		doItemEraseAttribute(item.uid, "aid")
		doItemEraseAttribute(item.uid, "bonusexp")
    end 
    return true
end