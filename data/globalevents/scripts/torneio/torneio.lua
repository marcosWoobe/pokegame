function onTimer()

    if #getPlayersInArea(torneio.area) > 1 then
        doBroadcastMessage("O Torneio dessa vez não teve vencedor, tente na proxima vez")
        return true
    end
	
	if #getPlayersInArea(torneio.waitArea) <= 1 then
        doBroadcastMessage("O Torneio foi cancelado por falta de participantes.")
		for _, pid in ipairs(getPlayersInArea(torneio.waitArea)) do
            puxar = math.random(-2, 2)
            doTeleportThing(pid, torneio.playerTemple)
			doPlayerAddMoney(pid, torneio.price)
			doPlayerSendTextMessage(pid, 27, "Sua taxa de inscrição foi devolvida.")
        end
        return true
    end

    for _, pid in ipairs(getPlayersInArea(torneio.waitArea)) do
        puxar = math.random(-2, 2)
        doTeleportThing(pid, {x = torneio.tournamentFight.x + puxar, y = torneio.tournamentFight.y + puxar, z = torneio.tournamentFight.z})
        setPlayerStorageValue(pid, 84929, 1)
		if #getCreatureSummons(pid) >= 1 then
		    setPlayerStorageValue(getCreatureSummons(pid)[1], 84929, 1)
		end
    end

    doBroadcastMessage("O torneio Iniciou!")
return true
end