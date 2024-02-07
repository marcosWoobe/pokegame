torneio = {
awardTournament = 15644, ---moeda usada para entra no torneio--
awardAmount = 8, -- quantidade de moeda que o player vai ganhar ao vencer o torneio--
playerTemple = {x = 306, y = 1071, z = 6}, --pra onde vai o player quando morrer ?--

tournamentFight = {x = 284, y = 1071, z = 7}, --centro da arena torneio combate--
area = {fromx = 263, fromy = 1057, fromz = 7, tox = 308, toy = 1085, toz= 7},--canto acima direito da arena combate-canto esquerdo abaixo da arena combate--

waitPlace = {x = 283, y = 1153, z = 7},  --centro da sala de espera--
waitArea = {fromx = 265, fromy = 1139, fromz = 7, tox = 304, toy = 1168, toz= 7}, --canto esquerdo acima da sala de espera--canto abaixo esquerdo da sala de espera--



--[[startHour1 = "14:50:00", --horario do aviso?--
endHour1 = "15:00:00",--horario que começa?--

startHour2 = "19:50:00",--horario do aviso?--
endHour2 = "20:00:00",--horario do aviso?--]]



--startHour1 = "05:30:00", --horario do aviso?-- +3 por causa da vps
--endHour1 = "05:40:00",--horario que começa?-- +3 por causa da vps

startHour1 = "14:50:00", --horario do aviso?-- +3 por causa da vps
endHour1 = "15:00:00",--horario que começa?-- +3 por causa da vps

startHour2 = "19:50:00",--horario do aviso?-- +3 por causa da vps
endHour2 = "20:00:00",--horario do aviso?-- +3 por causa da vps

price = 50000,--valor para entrar no torneio ? 500 dollar no caso--
revivePoke = 12344,--aqui é revive se tiver e se não tiver não precisa mexer--
}

function getPlayersInArea(area)

    local players = {}

    for x = area.fromx,area.tox do
        for y = area.fromy,area.toy do
            for z = area.fromz,area.toz do
                local m = getTopCreature({x=x, y=y, z=z}).uid

                if m ~= 1 and isPlayer(m) then
                    table.insert(players, m)
                end
            end
        end
    end
	
return players
end

function getTopt(cid)
    local check4 = db.getResult("SELECT `torneio` FROM `players` WHERE `id` = " .. getPlayerGUID(cid) .. " LIMIT 1")
    return check4:getDataInt("torneio") <= 0 and 0 or check4:getDataInt("torneio") 
end

function addTopt(cid,amount)
    db.executeQuery("UPDATE `players` SET `torneio` = "..getTopt(cid).."+"..amount.." WHERE `id` = "..getPlayerGUID(cid)) 
end

function removeTopt(cid,amount)
    db.executeQuery("UPDATE `players` SET `torneio` = "..getTopt(cid).."-"..amount.." WHERE `id` = "..getPlayerGUID(cid)) 
end

function setTopt(cid,value)
    db.executeQuery("UPDATE `players` SET `torneio` = "..value.." WHERE `id` = "..getPlayerGUID(cid))
end