local i = {
--[[["07:50"] = {nome = "O Torneio vai começar em 10 minutos, fale com o NPC Nike no CP de sua cidade, vai custar 500 Dollar's  para participar!"},
["07:55"] = {nome = "Faltam 5 minutos para fechar as inscriçoes do torneio!"},
["07:59"] = {nome = "As inscriçoes do Torneio fecharam!"},

["11:50"] = {nome = "O Torneio vai começar em 10 minutos, fale com o NPC Nike no CP de sua cidade, vai custar 500 Dollar's para participar!"},
["11:55"] = {nome = "Faltam 5 minutos para fechar as inscriçoes do torneio!"},
["11:59"] = {nome = "As inscriçoes do Torneio fecharam!"},]]

["14:50"] = {nome = "O Torneio de modalidade nivel: 80 até 150 vai começar em 10 minutos, fale com o NPC Torneio Man no TC, vai custar 500 Dollar's para participar!"},
["14:55"] = {nome = "Faltam 5 minutos para fechar as inscriçoes do torneio!"},
["14:59"] = {nome = "As inscriçoes do Torneio fecharam!?"},

["19:50"] = {nome = "O Torneio de modalidade nivel: 151 até 270 vai começar em 10 minutos, fale com o NPC Torneio Man no TC, vai custar 500 Dollar's para participar!"},
["19:55"] = {nome = "Faltam 5 minutos para fechar as inscriçoes do torneio!"},
["19:59"] = {nome = "As inscriçoes do Torneio fecharam!"},

}

function onThink(interval, lastExecution)
    hours = tostring(os.date("%X")):sub(1, 5)
    tb = i[hours]
    if tb then
        doBroadcastMessage(hours .. " - " .. tb.nome .. "")
    end
return true
end