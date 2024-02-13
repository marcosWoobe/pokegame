failmsgs = {
    "Sorry, you didn't catch that pokemon.",
    "Sorry, your pokeball broke.",
    "Sorry, the pokemon escaped.",
}

function doBrokesCount(cid, str, ball) --alterado v1.9 \/
    if not isCreature(cid) then return false end
    local tb = {
        {b = "poke", v = 0},
        {b = "great", v = 0},
        {b = "super", v = 0},
        {b = "ultra", v = 0},
        {b = "vball", v = 0},
        {b = "saffari", v = 0},
        {b = "dark", v = 0},
        {b = "magu", v = 0},
        {b = "sora", v = 0},
        {b = "yume", v = 0},
        {b = "dusk", v = 0},
        {b = "tale", v = 0},
        {b = "moon", v = 0},
        {b = "net", v = 0},
        {b = "premier", v = 0},
        {b = "tinker", v = 0},
        {b = "fast", v = 0},
        {b = "heavy", v = 0},
    }
    for _, e in ipairs(tb) do
        if e.b == ball then
            e.v = 1
            break
        end
    end
    local strings = getPlayerStorageValue(cid, str)
    
    local t = "normal = (.-), great = (.-), super = (.-), ultra = (.-), vball = (.-), saffari = (.-), dark = (.-), magu = (.-), sora = (.-), yume = (.-), dusk = (.-), tale = (.-), moon = (.-), net = (.-), premier = (.-), tinker = (.-), fast = (.-), heavy = (.-);"
    local t2 = ""
    for n, g, s, u, v, s2, d, magu, sora, yume, dusk, tale, moon, net, premier, tinker, fast, heavy in strings:gmatch(t) do
        t2 = "normal = "..(n+tb[1].v)..", great = "..(g+tb[2].v)..", super = "..(s+tb[3].v)..", ultra = "..(u+tb[4].v)..", vball = "..(v+tb[5].v)..", saffari = "..(s2+tb[6].v)..", dark = "..(d+tb[7].v)..", magu = "..(magu+tb[8].v)..", sora = "..(sora+tb[9].v)..", yume = "..(yume+tb[10].v)..", dusk = "..(dusk+tb[11].v)..", tale = "..(tale+tb[12].v)..", moon = "..(moon+tb[13].v)..", net = "..(net+tb[14].v)..", premier = "..(premier+tb[15].v)..", tinker = "..(tinker+tb[16].v)..", fast = "..(fast+tb[17].v)..", heavy = "..(heavy+tb[18].v)..";" 
    end
    
    setPlayerStorageValue(cid, str, strings:gsub(t, t2))
end

function sendBrokesMsg(cid, str, ball, poke, catched)
    if not isCreature(cid) then return true end
    local strings = getPlayerStorageValue(cid, str)
    if type(strings) == "number" or type(strings) ~= "string" or not string.find(strings, "magu") then --alterado v1.9 
        setPlayerStorageValue(cid, str, "normal = 0, great = 0, super = 0, ultra = 0, vball = 0, saffari = 0, dark = 0;") 
        strings = getPlayerStorageValue(cid, str) --alterado v1.9 
    end 
    local t = "normal = (.-), great = (.-), super = (.-), ultra = (.-), vball = (.-), saffari = (.-), dark = (.-), magu = (.-), sora = (.-), yume = (.-), dusk = (.-), tale = (.-), moon = (.-), net = (.-), premier = (.-), tinker = (.-), fast = (.-), heavy = (.-);"
    local msg = {}
    local countN, countG, countS, countU, countV, countS2 = 0, 0, 0, 0, 0, 0
    local maguCount, soraCount, yumeCount, duskCount, taleCount, moonCount, netCount, premierCount, tinkerCount, fastCount, heavyCount = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    table.insert(msg, "Voc�"..(catched == false and " j�" or "").." gastou: ")
    
    for n, g, s, u, v, s2, d, magu, sora, yume, dusk, tale, moon, net, premier, tinker, fast, heavy in strings:gmatch(t) do
        if tonumber(n) and tonumber(n) > 0 then 
            table.insert(msg, tostring(n).." Poke ball".. (tonumber(n) > 1 and "s" or "")) 
            countN = tonumber(n)
        end
        if tonumber(g) and tonumber(g) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(g).." Great ball".. (tonumber(g) > 1 and "s" or "")) 
            countG = tonumber(g)
        end
        if tonumber(s) and tonumber(s) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(s).." Super ball".. (tonumber(s) > 1 and "s" or "")) 
            countS = tonumber(s)
        end
        if tonumber(u) and tonumber(u) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(u).." Ultra ball".. (tonumber(u) > 1 and "s" or "")) 
            countU = tonumber(u)
        end
        if tonumber(v) and tonumber(v) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(v).." Vball".. (tonumber(v) > 1 and "s" or "")) 
            countV = tonumber(v)
        end
        if tonumber(s2) and tonumber(s2) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(s2).." Saffari ball".. (tonumber(s2) > 1 and "s" or "")) 
            countS2 = tonumber(s2)
        end
        
        if tonumber(magu) and tonumber(magu) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(magu).." Magu ball".. (tonumber(magu) > 1 and "s" or "")) 
            maguCount = tonumber(magu)
        end
        
        if tonumber(sora) and tonumber(sora) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(sora).." Sora ball".. (tonumber(sora) > 1 and "s" or "")) 
            soraCount = tonumber(sora)
        end
        
        if tonumber(yume) and tonumber(yume) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(yume).." Yume ball".. (tonumber(yume) > 1 and "s" or "")) 
            yumeCount = tonumber(yume)
        end
        
        if tonumber(dusk) and tonumber(dusk) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(dusk).." Dusk ball".. (tonumber(dusk) > 1 and "s" or "")) 
            duskCount = tonumber(dusk)
        end
        
        if tonumber(tale) and tonumber(tale) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(tale).." Tale ball".. (tonumber(tale) > 1 and "s" or "")) 
            taleCount = tonumber(tale)
        end
        
        if tonumber(moon) and tonumber(moon) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(moon).." Moon ball".. (tonumber(moon) > 1 and "s" or "")) 
            moonCount = tonumber(moon)
        end
        
        if tonumber(net) and tonumber(net) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(net).." Net ball".. (tonumber(net) > 1 and "s" or "")) 
            netCount = tonumber(net)
        end
        
        if tonumber(premier) and tonumber(premier) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(premier).." Premier ball".. (tonumber(premier) > 1 and "s" or "")) 
            premierCount = tonumber(premier)
        end
        
        if tonumber(tinker) and tonumber(tinker) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(tinker).." Tinker ball".. (tonumber(tinker) > 1 and "s" or "")) 
            tinkerCount = tonumber(tinker)
        end
        
        if tonumber(fast) and tonumber(fast) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(fast).." Fast ball".. (tonumber(fast) > 1 and "s" or "")) 
            fastCount = tonumber(fast)
        end
        
        if tonumber(heavy) and tonumber(heavy) > 0 then 
            table.insert(msg, (#msg > 1 and ", " or "").. tostring(heavy).." Heavy ball".. (tonumber(heavy) > 1 and "s" or "")) 
            heavyCount = tonumber(heavy)
        end
    end
    if #msg == 1 then
        return true
    end
    if string.sub(msg[#msg], 1, 1) == "," then
        msg[#msg] = " e".. string.sub(msg[#msg], 2, #msg[#msg])
    end
    table.insert(msg, " para"..(catched == false and " tentar" or "").." captura-lo.")

    addEvent(sendMsgToPlayer, 3000, cid, 27, table.concat(msg))

    if catched then
        local ballsCatchedString = countN .. "-" .. countG .. "-" .. countS .. "-" .. countU .. "-" .. countS2 .. "-" .. maguCount .. "-" .. soraCount .. "-" .. yumeCount .. "-" .. duskCount .. "-" .. taleCount .. "-" .. moonCount .. "-" .. netCount .. "-" .. premierCount .. "-" .. tinkerCount .. "-" ..fastCount .. "-" .. heavyCount
        local list = getCatchList(cid)
        if not jaCapturou(cid, poke) then 
            local expssss = 100
            if newpokedexCatchXpMasterx[doCorrectString(poke)].expCatch then
                expssss = newpokedexCatchXpMasterx[doCorrectString(poke)].expCatch
            end    
            addEvent(doSendPlayerExtendedOpcode, 2900, cid, 105, getItemInfo(fotos[poke]).clientId .. "-" .. expssss .. "-" .. poke .. "-" .. ballsCatchedString)
            addEvent(doPlayerAddExp, 2900, cid, (expssss/100))
            addEvent(doSendAnimatedText, 2900, getThingPos(cid), (expssss/100) , 215)
            addEvent(doPlayerAddInKantoCatchs, 2900, cid, 1)
            addEvent(colocarNaListaDeCapturados, 2900, cid, poke)
        end
    end
end
--------------------------------------------------------------------------------
function colocarNaListaDeCapturados(cid, poke)
    setPlayerStorageValue(cid, fotos[poke], 1)
end

function jaCapturou(cid, poke)
    local storage = getPlayerStorageValue(cid, fotos[poke])
    if storage ~= -1 then
        return true
    end
    return false
end

function getWastedBall(cid, str)
    local storage = getPlayerStorageValue(cid, str)
    local pokeballsCount = {normal = 0, great = 0, super = 0, ultra = 0, vball = 0, saffari = 0, dark = 0, magu = 0, sora = 0, yume = 0, dusk = 0, tale = 0, moon = 0, net = 0, premier = 0, tinker = 0, fast = 0, heavy = 0}
    if storage == -1 then
        return pokeballsCount
    end
    local t = "normal = (.-), great = (.-), super = (.-), ultra = (.-), vball = (.-), saffari = (.-), dark = (.-), magu = (.-), sora = (.-), yume = (.-), dusk = (.-), tale = (.-), moon = (.-), net = (.-), premier = (.-), tinker = (.-), fast = (.-), heavy = (.-);"
    for n, g, s, u, v, s2, d, maguu, sora, yume, dusk, tale, moon, net, premier, tinker, fast, heavy in storage:gmatch(t) do
        if tonumber(n) and tonumber(n) > 0 then 
            pokeballsCount.normal = tonumber(n)
        end
        
        if tonumber(g) and tonumber(g) > 0 then 
            pokeballsCount.great = tonumber(g)
        end
        if tonumber(s) and tonumber(s) > 0 then 
            pokeballsCount.super = tonumber(s)
        end
        if tonumber(u) and tonumber(u) > 0 then 
            pokeballsCount.ultra = tonumber(u)
        end
        if tonumber(v) and tonumber(v) > 0 then 
            pokeballsCount.vball = tonumber(v)
        end        
        if tonumber(s2) and tonumber(s2) > 0 then 
            pokeballsCount.saffari = tonumber(s2)
        end
        
        if tonumber(maguu) and tonumber(maguu) > 0 then 
            pokeballsCount.magu = tonumber(maguu)
        end
        
        if tonumber(sora) and tonumber(sora) > 0 then 
            pokeballsCount.sora = tonumber(sora)
        end
        
        if tonumber(yume) and tonumber(yume) > 0 then 
            pokeballsCount.yume = tonumber(yume)
        end
        
        if tonumber(dusk) and tonumber(dusk) > 0 then 
            pokeballsCount.dusk = tonumber(dusk)
        end
        
        if tonumber(tale) and tonumber(tale) > 0 then 
            pokeballsCount.tale = tonumber(tale)
        end
        
        if tonumber(moon) and tonumber(moon) > 0 then 
            pokeballsCount.moon = tonumber(moon)
        end
        
        if tonumber(net) and tonumber(net) > 0 then 
            pokeballsCount.net = tonumber(net)
        end
        
        if tonumber(premier) and tonumber(premier) > 0 then 
            pokeballsCount.premier = tonumber(premier)
        end
        
        if tonumber(tinker) and tonumber(tinker) > 0 then 
            pokeballsCount.tinker = tonumber(tinker)
        end
        
        if tonumber(fast) and tonumber(fast) > 0 then 
            pokeballsCount.fast = tonumber(fast)
        end
        
        if tonumber(heavy) and tonumber(heavy) > 0 then 
            pokeballsCount.heavy = tonumber(heavy)
        end
    end
    return pokeballsCount
end

function doSendPokeBall(cid, catchinfo, showmsg, fullmsg, typeee) --Edited brokes count system
    
    local name = doCorrectString(catchinfo.name)
    local pos = catchinfo.topos
    local topos = {}
    topos.x = pos.x
    topos.y = pos.y
    topos.z = pos.z
    local newid = catchinfo.newid
    local catch = catchinfo.catch
    local fail = catchinfo.fail
    local rate = catchinfo.rate
    local clevel = catchinfo.clevel
    -- local basechance = catchinfo.chance
    
    if not getTopCorpse(topos) then
        return true
    end
    
    local corpse = getTopCorpse(topos).uid
    if not isCreature(cid) then
        doSendMagicEffect(topos, CONST_ME_POFF)
        return true
    end
    
    doItemSetAttribute(corpse, "catching", 1)
    
    local str = newpokedexCatchXpMasterx[name].stoCatch
    local Wast = getWastedBall(cid, str)

    pokeTab = pokeChance[name]

    if pokeTab then

        pokeTabMedia = pokeTab.media
        if string.find(name, "Shiny") then
        end
        
        local tablert = { -- typeee para type normal
            ["poke"] = 1,
            ["great"] = 2,
            ["super"] = 3,
            ["ultra"] = 5,
            ["vball"] = 3,
            ["premier"] = 6,
            ["magu"] = 6,
            ["sora"] = 6,
            ["yume"] = 6,
            ["dust"] = 6,
            ["tale"] = 6,
            ["moon"] = 6,
            ["net"] = 6,
            ["tinker"] = 6,
            ["fast"] = 6,
            ["heavy"] = 6,
            ["saffari"] = 6,
        }
        

        local SERVERCATCHRATE = 1
        local pokeChance = (tablert[typeee]/(pokeTabMedia * ballsTypesCatch[pokeTab.balltype]))*SERVERCATCHRATE

        -- doPlayerSendTextMessage(cid, 27, "playerPoints: "..playerPoints)
        -- doPlayerSendTextMessage(cid, 27, "finalRand: "..finalRand)
        if math.random() <= pokeChance then
            doSendMagicEffect(topos, catch)
            addEvent(doCapturePokemon, 3000, cid, name, newid, nil, typeee, clevel) 

            sendBrokesMsg(cid, newpokedexCatchXpMasterx[name].stoCatch , typeee, name, true) 
            setPlayerStorageValue(cid, newpokedexCatchXpMasterx[name].stoCatch, "normal = 0, great = 0, super = 0, ultra = 0, vball = 0, saffari = 0, dark = 0, magu = 0, sora = 0, yume = 0, dusk = 0, tale = 0, moon = 0, net = 0, premier = 0, tinker = 0, fast = 0, heavy = 0;")
            doIncreaseStatistics(name, true, true)

            doRemoveItem(corpse, 1)
            return true     
        end 
    end
    doRemoveItem(corpse, 1)
    addEvent(doNotCapturePokemon, 3000, cid, name, typeee) 
    doSendMagicEffect(topos, fail)
end

function doCapturePokemon(cid, poke, ballid, status, typeee, clevel) 
    
    if not isCreature(cid) then
        return true
    end

    if icons[poke] then
       ballid = icons[poke].on
    end 

    local depot = false        
    if getPlayerFreeCap(cid) >= 6 or not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then 
        depot = true
    end

    item = doCreateItemEx(ballid) 

    local natureList = {"Hardy", "Lonely", "Brave", "Adamant", "Bold", "Docile", "Relaxad", "Impish", "Modest", "Mild", "Quiet", "Bashful", "Quirky", "Timid", "Hasty", "Serius", "Jolly"}
    local nature = natureList[math.random(#natureList)]
    local description = "Contains a "..poke.."."

    if not clevel or (clevel <= 1) then
        clevel = 1
    end

    doItemSetAttribute(item, "poke", poke)
    doItemSetAttribute(item, "nome", poke)  
    doItemSetAttribute(item, "color1", 0)
    doItemSetAttribute(item, "color2", 0)
    doItemSetAttribute(item, "color3", 0)
    doItemSetAttribute(item, "color4", 0)
    doItemSetAttribute(item, "addonNow", getOutfitPoke(poke))
    doItemSetAttribute(item, "hp", 1)
    doItemSetAttribute(item, "nature", nature)
    doItemSetAttribute(item, "iv", math.random(31)) 
    doItemSetAttribute(item, "ev", 0) 
    doItemSetAttribute(item, "exp", 0)
    doItemSetAttribute(item, "level", 1)
    doItemSetAttribute(item, "level", clevel)
    doItemSetAttribute(item, "fakedesc", description)
    doItemSetAttribute(item, "description", description)    
    doItemSetAttribute(item, "tadport", fotos[poke])
    doItemSetAttribute(item, "ballorder", getPlayerFreeCap(cid)+1)
    
    if poke == "Hitmonchan" or poke == "Shiny Hitmonchan" then 
        doItemSetAttribute(item, "hands", 0)
    end

    doItemSetAttribute(item, "morta", "no")
    doItemSetAttribute(item, "Icone", "yes")
    doItemSetAttribute(item, "ball", "Icone")   
    doItemSetAttribute(item, "boost", 0) 
    
    for _, oid in ipairs(getPlayersOnline()) do
        doPlayerSendChannelMessage(oid, "Catch System", "O jogador [".. getCreatureName(cid) .."] capturou um ["..poke.."] usando "..typeee.." ball.", TALKTYPE_CHANNEL_W, 10)
    end
    
    if pokeballs[poke:lower()] then
        doTransformItem(item, pokeballs[poke:lower()].on)   
    end 
    
    doPlayerSendTextMessage(cid, 27, "Parab�ns, voc� pegou um ("..poke..")!")
    
    if #getCreatureSummons(cid) >= 1 then
        doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 173) 
    else
        doSendMagicEffect(getThingPos(cid), 173) 
    end
    
    -- if typeee == "master" then
        -- doItemSetAttribute(item, "unique", true) 
    -- elseif typeee == "premier" then
    --     doItemSetAttribute(item, "aura", "red")
    --     doPlayerSendTextMessage(cid, 27, "Utilize o comando !aura para trocar de aura")     
    -- end
    
    if depot then 
        local cidade = 1
        doPlayerSendPokeCPName(getCreatureName(cid), item, 1)
        doPlayerSendTextMessage(cid, 27, "Voc� j� est� segurando 6 pokemons ou n�o tem espa�o na bag, por isso, esta pokebola foi enviada para o seu dep�sito.")
        if string.find(poke, "Shiny") then 
            db.executeQuery("UPDATE player_catchs SET pokemon_id = '".. poke .."', player_name = '".. getCreatureName(cid) .."' WHERE id = '1';")
        end
    else
        addPokeInFreeBag(getPlayerSlotItem(cid, 3).uid, item) 
        if string.find(poke, "Shiny") then 
            db.executeQuery("UPDATE player_catchs SET pokemon_id = '".. poke .."', player_name = '".. getCreatureName(cid) .."' WHERE id = '1';")
        end
    end
    doUpdatePokemonsBar(cid)
    
    if poke == tostring(getPlayerStorageValue(cid, catchModes.storage2)) and not hasCatched(cid) then
        setDailyCatched(cid, true)
        doPlayerSendTextMessage(cid, 27, "Daily Catch: Voc� terminou a miss�o! Volte para pegar sua recompensa!")
    end
    
--    local storage = newpokedex[poke].stoCatch 
--    sendBrokesMsg(cid, storage, typeee, poke, true) 
--    setPlayerStorageValue(cid, storage, "normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, dark = 0, magu = 0, sora = 0, yume = 0, dusk = 0, tale = 0, moon = 0, net = 0, premier = 0, tinker = 0, fast = 0, heavy = 0;")
--    doIncreaseStatistics(poke, true, true)
end

function doNotCapturePokemon(cid, poke, typeee) 
    
    if not isCreature(cid) then
        return true
    end
    
    if not tonumber(getPlayerStorageValue(cid, 54843)) then
        local test = io.open("data/sendtobrun123.txt", "a+")
        local read = ""
        if test then
            read = test:read("*all")
            test:close()
        end
        read = read.."\n[csystem.lua] "..getCreatureName(cid).." - "..getPlayerStorageValue(cid, 54843)..""
        local reopen = io.open("data/sendtobrun123.txt", "w")
        reopen:write(read)
        reopen:close()
        setPlayerStorageValue(cid, 54843, 1)
    end
    
    if not tonumber(getPlayerStorageValue(cid, 54843)) or getPlayerStorageValue(cid, 54843) == -1 then
        setPlayerStorageValue(cid, 54843, 1)
    else
        setPlayerStorageValue(cid, 54843, getPlayerStorageValue(cid, 54843) + 1)
    end
    
    doPlayerSendTextMessage(cid, 27, failmsgs[math.random(#failmsgs)])
    
    if #getCreatureSummons(cid) >= 1 then
        doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 166)
    else
        doSendMagicEffect(getThingPos(cid), 166)
    end
    
    local storage = newpokedexCatchXpMasterx[poke].stoCatch

    if not string.find(getPlayerStorageValue(cid, storage), "vball") then
        setPlayerStorageValue(cid, storage, "normal = 0, great = 0, super = 0, ultra = 0, vball = 0, saffari = 0, dark = 0, magu = 0, sora = 0, yume = 0, dusk = 0, tale = 0, moon = 0, net = 0, premier = 0, tinker = 0, fast = 0, heavy = 0;")
    end
    doIncreaseStatistics(poke, true, false)
    -- sendBrokesMsg(cid, storage, ball, poke, false)
end

function getPlayerInfoAboutPokemon(cid, poke)
    poke = doCorrectString(poke)
    local a = newpokedex[poke]
    if not isPlayer(cid) then return false end
    if not a then
        print("Error while executing function \"getPlayerInfoAboutPokemon(\""..getCreatureName(cid)..", "..poke..")\", "..poke.." doesn't exist.")
        return false
    end
    local b = getPlayerStorageValue(cid, a.storage)
    
    if b == -1 then
        setPlayerStorageValue(cid, a.storage, poke..":")
    end
    
    local ret = {}
    if string.find(b, "catch,") then
        ret.catch = true
    else
        ret.catch = false
    end
    if string.find(b, "dex,") then
        ret.dex = true
    else
        ret.dex = false
    end
    if string.find(b, "use,") then
        ret.use = true
    else
        ret.use = false
    end
    return ret
end


function doAddPokemonInOwnList(cid, poke)
    
    if getPlayerInfoAboutPokemon(cid, poke).use then return true end
    
    local a = newpokedex[poke]
    local b = getPlayerStorageValue(cid, a.storage)
    
    setPlayerStorageValue(cid, a.storage, b.." use,")
end

function isPokemonInOwnList(cid, poke)
    
    if getPlayerInfoAboutPokemon(cid, poke).use then return true end
    
    return false
end

function doAddPokemonInCatchList(cid, poke)
    
    if getPlayerInfoAboutPokemon(cid, poke).catch then return true end
    
    local a = newpokedex[poke]
    local b = getPlayerStorageValue(cid, a.storage)
    
    setPlayerStorageValue(cid, a.storage, b.." catch,")
end

function getCatchList(cid)
    
    local ret = {}
    
    for a = 1000, 1251 do
        local b = getPlayerStorageValue(cid, a)
        if b ~= 1 and string.find(b, "catch,") then
            table.insert(ret, oldpokedex[a-1000][1])
        end
    end
    
    return ret
    
end


function getStatistics(pokemon, tries, success)
    
    local ret1 = 0
    local ret2 = 0
    
    local poke = ""..string.upper(string.sub(pokemon, 1, 1))..""..string.lower(string.sub(pokemon, 2, 30))..""
    local dir = "data/Pokemon Statistics/"..poke.." Attempts.txt"
    local arq = io.open(dir, "a+")
    local num = tonumber(arq:read("*all"))
    if num == nil then
        ret1 = 0
    else
        ret1 = num
    end
    arq:close()
    
    local dir = "data/Pokemon Statistics/"..poke.." Catches.txt"
    local arq = io.open(dir, "a+")
    local num = tonumber(arq:read("*all"))
    if num == nil then
        ret2 = 0
    else
        ret2 = num
    end
    arq:close()
    
    if tries == true and success == true then
        return ret1, ret2
    elseif tries == true then
        return ret1
    else
        return ret2
    end
end

function doIncreaseStatistics(pokemon, tries, success)
    
    local poke = ""..string.upper(string.sub(pokemon, 1, 1))..""..string.lower(string.sub(pokemon, 2, 30))..""
    
    if tries == true then
        local dir = "data/Pokemon Statistics/"..poke.." Attempts.txt"
        
        local arq = io.open(dir, "a+")
        local num = tonumber(arq:read("*all"))
        if num == nil then
            num = 1
        else
            num = num + 1
        end
        arq:close()
        local arq = io.open(dir, "w")
        arq:write(""..num.."")
        arq:close()
    end
    
    if success == true then
        local dir = "data/Pokemon Statistics/"..poke.." Catches.txt"
        
        local arq = io.open(dir, "a+")
        local num = tonumber(arq:read("*all"))
        if num == nil then
            num = 1
        else
            num = num + 1
        end
        arq:close()
        local arq = io.open(dir, "w")
        arq:write(""..num.."")
        arq:close()
    end
end

function doUpdateGeneralStatistics()
    
    local dir = "data/Pokemon Statistics/Pokemon Statistics.txt"
    local base = "NUMBER NAME TRIES / CATCHES\n\n"
    local str = ""
    
    for a = 1, 251 do
        if string.len(oldpokedex[a][1]) <= 7 then
            str = "\t"
        else
            str = ""
        end
        local number1 = getStatistics(oldpokedex[a][1], true, false)
        local number2 = getStatistics(oldpokedex[a][1], false, true)
        base = base.."["..threeNumbers(a).."]\t"..oldpokedex[a][1].."\t"..str..""..number1.." / "..number2.."\n"
    end
    
    local arq = io.open(dir, "w")
    arq:write(base)
    arq:close()
end

function getGeneralStatistics()
    
    local dir = "data/Pokemon Statistics/Pokemon Statistics.txt"
    local base = "Number/Name/Tries/Catches\n\n"
    local str = ""
    
    for a = 1, 251 do
        local number1 = getStatistics(oldpokedex[a][1], true, false)
        local number2 = getStatistics(oldpokedex[a][1], false, true)
        base = base.."["..threeNumbers(a).."] "..oldpokedex[a][1].." "..str..""..number1.." / "..number2.."\n"
    end
    
    return base
end

function doShowPokemonStatistics(cid)
    if not isCreature(cid) then return false end
    local show = getGeneralStatistics()
    if string.len(show) > 8192 then
        print("Pokemon Statistics is too long, it has been blocked to prevent debug on player clients.")
        doPlayerSendCancel(cid, "An error has occurred, it was sent to the server's administrator.") 
        return false
    end
    doShowTextDialog(cid, math.random(2391, 2394), show)
end

local ballcatch = { --id normal, id da ball shiy
    [2394] = {cr = 1, on = 193, off = 192, ball = {11826, 11737}, send = 47, typeee = "poke", boost = "0"}, --alterado v1.9 \/
    [2391] = {cr = 3, on = 198, off = 197, ball = {11832, 11740}, send = 48, typeee = "great", boost = "0"},
    [2393] = {cr = 6, on = 202, off = 201, ball = {11835, 11743}, send = 46, typeee = "super", boost = "0"},
    [2392] = {cr = 8, on = 200, off = 199, ball = {11829, 11746}, send = 49, typeee = "ultra", boost = "0"},
    [19610] = {cr = 6, on = 1038, off = 1039, ball = {19613, 19613}, send = 105, typeee = "vball", boost = "0"},
    [12617] = {cr = 5, on = 204, off = 203, ball = {10975, 12621}, send = 35, typeee = "saffari", boost = "0"}, 
    [12832] = {cr = 100000, on = 23, off = 24, ball = {12826, 12829}, send = 181, typeee = "master", boost = "50"},
    
    [15677] = {cr = 10, on = 313, off = 314, ball = {16181, 16204}, send = 72, typeee = "magu", boost = "0", type = {"fire", "ground"}},
    [15676] = {cr = 10, on = 316, off = 317, ball = {16182, 16205}, send = 73, typeee = "sora", boost = "0", type = {"ice", "flying"}},
    [15678] = {cr = 10, on = 320, off = 321, ball = {16183, 16206}, send = 74, typeee = "yume", boost = "0", type = {"normal", "psychic"}},
    [15680] = {cr = 10, on = 322, off = 323, ball = {16184, 16207}, send = 75, typeee = "dusk", boost = "0", type = {"rock", "fighting"}},
    [15673] = {cr = 10, on = 331, off = 332, ball = {16187, 16210}, send = 78, typeee = "tale", boost = "0", type = {"dragon", "fairy"}},
    [15674] = {cr = 10, on = 334, off = 335, ball = {16188, 16211}, send = 79, typeee = "moon", boost = "0", type = {"dark", "ghost"}},
    [15675] = {cr = 10, on = 337, off = 338, ball = {16189, 16212}, send = 80, typeee = "net", boost = "0", type = {"bug", "water"}},
    [15681] = {cr = 10, on = 346, off = 347, ball = {16192, 16215}, send = 83, typeee = "tinker", boost = "0", type = {"electric", "steel"}},
    
    [15679] = {cr = 3, on = 343, off = 344, ball = {16191, 16214}, send = 82, typeee = "premier", boost = "0"},
    
    [15682] = {cr = 10, on = 325, off = 326, ball = {16185, 16208}, send = 76, typeee = "fast", boost = "0", pokes = {"Shiny Dodrio", "Dodrio", "Shiny Arcanine", "Arcanine", "Pikachu", "Raichu", "Shiny Raichu", "Beedrill", "Shiny Beedrill"}},
    [15672] = {cr = 10, on = 328, off = 329, ball = {16186, 16209}, send = 77, typeee = "heavy", boost = "0", pokes = {"Snorlax", "Venusaur", "Blastoise", "Rhydon", "Shiny Snorlax", "Shiny Venusaur", "Shiny Blastoise", "Shiny Rhydon", "Graveler", "Golem", "Shiny Golem", "Lapras"}},
}

function onUse(cid, item, frompos, item3, topos)
    
    local item2 = getTopCorpse(topos)
    if item2 == null then
        return true
    end
    
    if getItemAttribute(item2.uid, "catching") == 1 then
        return true
    end 
    
    -- if isInDuel(cid) then
    --     doPlayerSendCancel(cid, "Voc� n�o pode capturar nenhum pok�mon enquanto est� em duel.")
    --     return true
    -- end
    
    local name = string.lower(getItemAttribute(item2.uid, "poke"))
    name = string.gsub(name, "fainted ", "")
    name = string.gsub(name, "defeated ", "")
    name = doCorrectPokemonName(name)
    
    local smeargleID = 5
    if name:find("Smeargle") then
        smeargleID = string.sub(name, 9, 10)
        name = "Smeargle"
    end
    -- local x = pokecatchesMasterx[name]
    
    -- if not x then return true end
    
    local storage = newpokedexCatchXpMasterx[name].stoCatch 
    
    if type(getPlayerStorageValue(cid, storage)) ~= "string" or not string.find(getPlayerStorageValue(cid, storage), "magu") then --alterado v1.9 
        setPlayerStorageValue(cid, storage, "normal = 0, great = 0, super = 0, ultra = 0, vball = 0, saffari = 0, dark = 0, magu = 0, sora = 0, yume = 0, dusk = 0, tale = 0, moon = 0, net = 0, premier = 0, tinker = 0, fast = 0, heavy = 0;") --alterado v1.9 
    end 
    
    local owner = getItemAttribute(item2.uid, "corpseowner")
    local pOwner = getPlayerByName(owner)
    local isInParyWithPlayer = false
    if isInParty(cid) and isInParty(pOwner) then
        isInParyWithPlayer = isPartyEquals(pOwner, cid)
    end

    -- doSendMsg(cid, owner)

    if owner and isCreature(pOwner) and isPlayer(pOwner) and cid ~= pOwner and not isInParyWithPlayer then 
        doPlayerSendCancel(cid, "Desculpa. Isso n�o � possivel.")
        return true
    end
    
    local newidd = isShinyName(name) and ballcatch[item.itemid].ball[2] or ballcatch[item.itemid].ball[1] --alterado v1.9 
    local typeee = ballcatch[item.itemid].typeee
    local boost = ballcatch[item.itemid].boost  
    
    local catchBlocks = {"Moltres", "Articuno", "Zapdos", "Aerodactyl", "Kabutops", "Kabuto", "Hitmonlee", "Hitmonchan", "Hitmontop", "Omastar", "Omanyte"}
    if isInArray(catchBlocks, name) then
        doSendMsg(cid, "Voc� n�o pode capturar este pokemon.")
        return true
    end
    
    if typeee == "master" and isShinyName(name) then
        doSendMsg(cid, "Voc� n�o pode capturar pokemon shiny com a master ball.")
        return true
    end
    
    
    local catchinfo = {}
    catchinfo.rate = ballcatch[item.itemid].cr 
    catchinfo.catch = ballcatch[item.itemid].on
    catchinfo.fail = ballcatch[item.itemid].off
    catchinfo.newid = newidd 
    catchinfo.name = doCorrectPokemonName(name)
    catchinfo.topos = topos
    catchinfo.clevel = tonumber(getItemAttribute(item2.uid, "level"))
    -- catchinfo.chance = 2500
    -- catchinfo.chance = x.chance
    
    doBrokesCount(cid, newpokedexCatchXpMasterx[doCorrectPokemonName(name)].stoCatch , typeee)
    
    doSendDistanceShoot(getThingPos(cid), topos, ballcatch[item.itemid].send)
    doRemoveItem(item.uid, 1)
    
    local d = getDistanceBetween(getThingPos(cid), topos)


    if not getTopCorpse(topos) then
        return true
    end
    doItemSetAttribute(getTopCorpse(topos).uid, "catching", 1)
    
    
    setPlayerStorageValue(cid, 423512, 1)
    addEvent(function() if isCreature(cid) then setPlayerStorageValue(cid, 423512, -1) end end, 1500)
    addEvent(doSendPokeBall, d * 70 + 100 - (d * 14) , cid, catchinfo, false, false, typeee, smeargleID) 
    addEvent(doSendMagicEffect, (d * 70 + 100 - (d * 14)) - 100, topos, 3)
    return true
end
