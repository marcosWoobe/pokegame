function onUse(cid, item)
    local torneios = 1
     if #getPlayersInArea(torneio.area) > 1 then
        doPlayerSendTextMessage(cid, 20, "Só o ultimo que ficar na arena, poderá abrir está porta! ") 
	    return true 
	end
    doTeleportThing(cid, torneio.playerTemple)
    doBroadcastMessage("[Torneio] Parabéns ao treinador "..getCreatureName(cid).." foi o ganhador do torneio de hoje.")--, verifique o rank em nosso site www.seusite.com!")
    doPlayerAddItem(cid, 2160, 2)
    local item1 = doCreateItemEx(15645, 15) 
	doItemSetAttribute(item1, "unico", 1)
	doPlayerAddItemEx(cid, item1, true)
    addTopt(cid, torneios)
    doPlayerSendTextMessage(cid,MESSAGE_EVENT_ORANGE,"[Torneio] Você já venceu "..(getTopt(cid,torneio)).."x, Parabéns.")
    local item2 = doCreateItemEx(torneio.awardTournament, torneio.awardAmount)
	doItemSetAttribute(item2, "unico", 1)
	doPlayerAddItemEx(cid, item2, true)
	
    return true
end