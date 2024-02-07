function onStepIn(cid, item, frompos, item2, topos, fromPosition, position, toPosition)

    if not isPlayer(cid) then 
        return true
    end

    local chance = math.random(1, 100)
    local contagem_total = 14750
    local count_max = 30 
    local sto_pw = item.actionid

    local totalItems = {
        [1] = {2392, 2393, 2391, 2394, 12344, 12343, 12345, 12346, 12347}, -- total itens facil
        [2] = {11441, 11442, 11443, 11444, 11445, 11446, 11447, 11448, 11449, 11450}, -- total itens medio
        [3] = {23418, 12618, 23474, 23462} -- total itens dificil
    }

    local Facil = { -- 75%
        [2392] = {count = 15},
        [2393] = {count = 25},
        [2391] = {count = 35},
        [2394] = {count = 50},
        [12344] = {count = 25},
        [12343] = {count = 25},
        [12345] = {count = 30},
        [12346] = {count = 35},
        [12347] = {count = 50},
    }
    local Medio = { -- 20%
        [11441] = {count = 1},
        [11442] = {count = 1},
        [11443] = {count = 1},
        [11444] = {count = 1},
        [11445] = {count = 1},
        [11446] = {count = 1},
        [11447] = {count = 1},
        [11448] = {count = 1},
        [11449] = {count = 1},
        [11450] = {count = 1},
    }
    local Dificil = { -- 5%
        [23418] = {count = 5},
        [12618] = {count = 1},
        [23474] = {count = 1},
        [23462] = {count = 1},
    }

    local dificuldade = totalItems[1]
    if chance <= 75 then
        dificuldade = dificuldade
    elseif chance > 75 and chance <= 95 then
        dificuldade = totalItems[2]
    elseif chance > 95 then
        dificuldade = totalItems[3]
    end  
    local itemRandom = dificuldade[math.random(#dificuldade)]

    local countItem = 1 
    if Facil[itemRandom] then
        countItem = Facil[itemRandom].count
    elseif Medio[itemRandom] then
        countItem = Medio[itemRandom].count
    elseif Dificil[itemRandom] then
        countItem = Dificil[itemRandom].count
    end

    if getPlayerStorageValue(cid, sto_pw) >= 1 then
        doPlayerSendCancel(cid, "Você ja coletou esse PowerUP!")
        doSendMagicEffect(getPlayerPosition(cid), 2) 
        return true
    end  

    if getPlayerStorageValue(cid, contagem_total) >= count_max then
        doPlayerSendCancel(cid, "Você já pegou seu premio de PowerUPs maximo")
        doSendMagicEffect(getPlayerPosition(cid), 2) 
        return true
    end

    setPlayerStorageValue(cid, sto_pw, 1)
    if getPlayerStorageValue(cid, contagem_total) == -1 then
        setPlayerStorageValue(cid, contagem_total, 1)
    else
        setPlayerStorageValue(cid, contagem_total, getPlayerStorageValue(cid, contagem_total) + 1)
    end

    doPlayerSendCancel(cid, "Você passou por 1 PowerUP. Total:  "..getPlayerStorageValue(cid, contagem_total).. "/"..count_max..".")   
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você passou por 1 PowerUP. Total:  "..getPlayerStorageValue(cid, contagem_total).. "/"..count_max..".")   
    doSendMagicEffect(getPlayerPosition(cid), 12)  

    local newItem = doCreateItemEx(itemRandom, countItem)
    doItemSetAttribute(newItem, "unico", 1)
    doPlayerAddItemEx(cid, newItem)

    doPlayerSendTextMessage(cid, 25, "Você ganhou "..countItem.." "..getItemNameById(itemRandom)..", Parabéns!")

   return true
end
