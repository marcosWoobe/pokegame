function onUse(cid, item)
    local torneios = 1
     if #getPlayersInArea(torneio.area) > 1 then
        doPlayerSendTextMessage(cid, 20, "S� o ultimo que ficar na arena, poder� abrir est� porta! ") 
	    return true 
	end
    doTeleportThing(cid, torneio.playerTemple)
    doBroadcastMessage("[Torneio] Parab�ns ao treinador "..getCreatureName(cid).." foi o ganhador do torneio de hoje.")--, verifique o rank em nosso site www.seusite.com!")
    doPlayerAddItem(cid, 2160, 2)
    local item1 = doCreateItemEx(15645, 15) 
	doItemSetAttribute(item1, "unico", 1)
	doPlayerAddItemEx(cid, item1, true)
    addTopt(cid, torneios)
    doPlayerSendTextMessage(cid,MESSAGE_EVENT_ORANGE,"[Torneio] Voc� j� venceu "..(getTopt(cid,torneio)).."x, Parab�ns.")
    local item2 = doCreateItemEx(torneio.awardTournament, torneio.awardAmount)
	doItemSetAttribute(item2, "unico", 1)
	doPlayerAddItemEx(cid, item2, true)
	
    return true
end