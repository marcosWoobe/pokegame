function onSay(cid, words, param, channel) 
   
    if #getPlayerPokemons(cid) < 1 and getPlayerStorageValue(cid, 212124) <= 0 then     --alterado v1.6
        doPlayerSendTextMessage(cid, 27, "Chame primeiro seu pokemon para fora da pokeball!")   
	    return true  
    end   
	
	doPlayerSendTextMessage(cid, 27, "pokeStop Now!")   
	local pk = getPlayerPokemons(cid)[1]
	if not isCreature(pk) then doPlayerSendTextMessage(cid, 27, "gay Now!")   return true end
	doCreatureSetNoMove(pk, true)
	doChangeSpeed(pk, 0)
	return true
end