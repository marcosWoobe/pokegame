function PowerUp(cid, bonuss_contador, bonuss_max)
    if not isPlayer(cid) then return false end  

    setPlayerStorageValue(cid, bonuss_contador, getPlayerStorageValue(cid, bonuss_contador) + 1)
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você passou por 1 PowerUP. Total: ".. getPlayerStorageValue(cid,bonuss_contador) .. "/30.")   

    if getPlayerStorageValue(cid, bonuss_contador) >= bonuss_max then
        doPlayerSendTextMessage(cid, 19, "Seus ".. bonuss_max .." PowerUps foram convertidos em 3 dia de Premium Account!") 
        doPlayerAddPremiumDays(cid, 3)
        setPlayerStorageValue(cid, bonuss_contador, 4)
    end   
end

function onStepIn(cid, item, frompos, item2, topos, fromPosition, position, toPosition)

    if not isPlayer(cid) then 
    return true
    end

    local chance = math.random(1, 100)
    local bonuss_contador = 7222702
    local bonuss_max = 30 
    local storagepw = 1801104

    local items = {23418, 12618, 23474, 23462} -- difícil 5%
    local items1 = {11441, 11442, 11443, 11444, 11445, 11446, 11447, 11448, 11449, 11450} -- médio 20%  
    local items2 = {2392, 2393, 2391, 2394, 12344, 12343, 12345, 12346, 12347} -- fácil 75%

    local random_item = items[math.random(#items)]
    local random_item1 = items1[math.random(#items1)]
    local random_item2 = items2[math.random(#items2)]
    local item_name = getItemNameById(random_item) 
    local item_name1 = getItemNameById(random_item1) 
    local item_name2 = getItemNameById(random_item2) 

    if getPlayerStorageValue(cid, storagepw) >= 1 then 
        doTeleportThing(cid, fromPosition)
        doPlayerSendTextMessage(cid, 23, "Você ja coletou esse PowerUP!")
        doSendMagicEffect(getPlayerPosition(cid), 2) 
        return true
    end  

    if getPlayerStorageValue(cid,484818) >= 1 then
        doPlayerSendTextMessage(cid,22,"Você já pegou seu premio de PowerUPs maximo")
        doSendMagicEffect(getPlayerPosition(cid), 2) 
        return true
    end

    if getPlayerStorageValue(cid, storagepw) < 1 and getPlayerStorageValue(cid, bonuss_contador) <= 0 and chance > 1 and chance <= 75 then
        setPlayerStorageValue(cid,storagepw,1)
        setPlayerStorageValue(cid, bonuss_contador, getPlayerStorageValue(cid, bonuss_contador) + 1)
        doPlayerSendTextMessage(cid,25,"Você ganhou  "..item_name2.." , Parabéns!")
        doSendMagicEffect(getPlayerPosition(cid), 12)  
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você passou por 1 PowerUP. Total:  ".. getPlayerStorageValue(cid,bonuss_contador) .. "/30.")   
        
        local items1 = {
            [2392] = 15,
            [2393] = 25,
            [2391] = 35,
            [2394] = 50,
            [12344] = 25,
            [12343] = 25,
            [12345] = 30,
            [12346] = 35,
            [12347] = 50
        }      

        for item, count in pairs(items1) do
            local newItem = doCreateItemEx(item, count)
            doItemSetAttribute(newItem, "unico", 1)
            doPlayerAddItemEx(cid, newItem)
        end

    elseif getPlayerStorageValue(cid, storagepw) < 1 and getPlayerStorageValue(cid, bonuss_contador) >= 1 and chance > 1 and chance <= 75 then
        setPlayerStorageValue(cid,storagepw,1)
        setPlayerStorageValue(cid, bonuss_contador, getPlayerStorageValue(cid, bonuss_contador) + 1)
        doPlayerSendTextMessage(cid,25,"Você ganhou  "..item_name2.." , Parabéns!")
        doSendMagicEffect(getPlayerPosition(cid), 12)  
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você passou por 1 PowerUP. Total:  ".. getPlayerStorageValue(cid,bonuss_contador) .. "/30.")     

        local items2 = {
            [2392] = 15,
            [2393] = 25,
            [2391] = 35,
            [2394] = 50,
            [12344] = 25,
            [12343] = 25,
            [12345] = 30,
            [12346] = 35,
            [12347] = 50
        }

        for item, count in pairs(items2) do
            local newItem = doCreateItemEx(item, count)
            doItemSetAttribute(newItem, "unico", 1)
            doPlayerAddItemEx(cid, newItem)
        end

    elseif getPlayerStorageValue(cid, bonuss_contador) >= bonuss_max and getPlayerStorageValue(cid,484818) < 1 then      --------- aqui eu puis pro premio ser 2 dias vip mas ai vc altera pelo premio q  quiser
        doPlayerSendTextMessage(cid, 19, "Seus ".. bonuss_max .." PowerUps foram convertidos em 3 dias de Premium Account!") 
        setPlayerStorageValue(cid,484818,1)
        doPlayerAddPremiumDays(cid, 3)
        return true
    end

    if getPlayerStorageValue(cid, storagepw) < 1 and getPlayerStorageValue(cid, bonuss_contador) >= 1 and chance >= 76 and chance <= 94 then
        doPlayerAddItem(cid,random_item1)
        setPlayerStorageValue(cid,storagepw,1)
        setPlayerStorageValue(cid, bonuss_contador, getPlayerStorageValue(cid, bonuss_contador) + 1)
        doPlayerSendTextMessage(cid,25,"Você ganhou 1 "..item_name1.." , Parabéns!")
        doSendMagicEffect(getPlayerPosition(cid), 12) 
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você passou por 1 PowerUP. Total:  ".. getPlayerStorageValue(cid,bonuss_contador) .. "/30.")   
    elseif getPlayerStorageValue(cid, storagepw) < 1 and getPlayerStorageValue(cid, bonuss_contador) >= 1 and chance > 76 and chance <= 94 then
        doPlayerAddItem(cid,random_item1)
        setPlayerStorageValue(cid,storagepw,1)
        setPlayerStorageValue(cid, bonuss_contador, getPlayerStorageValue(cid, bonuss_contador) + 1)
        doPlayerSendTextMessage(cid,25,"Você ganhou 1 "..item_name1.." , Parabéns!")
        doSendMagicEffect(getPlayerPosition(cid), 12) 
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você passou por 1 PowerUP. Total:  ".. getPlayerStorageValue(cid,bonuss_contador) .. "/30.")     
    elseif getPlayerStorageValue(cid, bonuss_contador) >= bonuss_max and getPlayerStorageValue(cid,484818) < 1 then      --------- aqui eu puis pro premio ser 2 dias vip mas ai vc altera pelo premio q  quiser
        doPlayerSendTextMessage(cid, 19, "Seus ".. bonuss_max .." PowerUps foram convertidos em 3 dias de Premium Account!") 
        setPlayerStorageValue(cid,484818,1)
        doPlayerAddPremiumDays(cid, 3)
        return true
    end

    if getPlayerStorageValue(cid, storagepw) < 1 and getPlayerStorageValue(cid, bonuss_contador) >= 1 and chance >= 95 and chance <= 100 then
        setPlayerStorageValue(cid,storagepw,1)
        setPlayerStorageValue(cid, bonuss_contador, getPlayerStorageValue(cid, bonuss_contador) + 1)
        doPlayerSendTextMessage(cid,25,"Você ganhou 1 "..item_name.." , Parabéns!")
        doSendMagicEffect(getPlayerPosition(cid), 12)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você passou por 1 PowerUP. Total:  ".. getPlayerStorageValue(cid,bonuss_contador) .. "/30.")  
        local items3 = {
            [23418] = 5,
            [12618] = 1,
            [23474] = 1,
            [23462] = 1
        }
        for item, count in pairs(items3) do
            local newItem = doCreateItemEx(item, count)
            doItemSetAttribute(newItem, "unico", 1)
            doPlayerAddItemEx(cid, newItem)
        end
    elseif getPlayerStorageValue(cid, storagepw) < 1 and getPlayerStorageValue(cid, bonuss_contador) >= 1 and chance > 95 and chance <= 100 then
        setPlayerStorageValue(cid,storagepw,1)
        setPlayerStorageValue(cid, bonuss_contador, getPlayerStorageValue(cid, bonuss_contador) + 1)
        doPlayerSendTextMessage(cid,25,"Você ganhou 1 "..item_name.." , Parabéns!")
        doSendMagicEffect(getPlayerPosition(cid), 12)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você passou por 1 PowerUP. Total:  ".. getPlayerStorageValue(cid,bonuss_contador) .. "/30.")       
        local items4 = {
            [23418] = 5,
            [12618] = 1,
            [23474] = 1,
            [23462] = 1
        }  
        for item, count in pairs(items4) do
            local newItem = doCreateItemEx(item, count)
            doItemSetAttribute(newItem, "unico", 1)
            doPlayerAddItemEx(cid, newItem)
        end 
    elseif getPlayerStorageValue(cid, bonuss_contador) >= bonuss_max and getPlayerStorageValue(cid,484818) < 1 then      --------- aqui eu puis pro premio ser 2 dias vip mas ai vc altera pelo premio q  quiser
        doPlayerSendTextMessage(cid, 19, "Seus ".. bonuss_max .." PowerUps foram convertidos em 3 dias de Premium Account!") 
        setPlayerStorageValue(cid,484818,1)
        doPlayerAddPremiumDays(cid, 3) 
        return true
    end
   
end