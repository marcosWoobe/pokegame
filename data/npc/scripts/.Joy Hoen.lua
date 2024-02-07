local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end 

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    local msg = msg:lower()

    if msgcontains(msg, "ticket") or msgcontains(msg, "TICKET") then
        if getPlayerStorageValue(cid, 84926) == 1 then
            selfSay("Você só pode comprar 1 ticket por conta.", cid)
            talkState[talkUser] = 0
            return true
        end
        if not (getPlayerItemCount(cid, 2160) >= 100) then
            selfSay("Você precisa de 1KK para entrar aqui", cid)
            talkState[talkUser] = 0
            return true
        end
        if not (getPlayerKantoCatches(cid) >= 45) then
            selfSay("Você precisa ter capturado mais de 45 pokemons para entrar aqui", cid)
            talkState[talkUser] = 0
            return true
        end
        if not (getPlayerItemCount(cid, 12162) >= 2000) and not (getPlayerItemCount(cid, 12161) >= 2000) and not (getPlayerItemCount(cid, 12337) >= 2000) and not (getPlayerItemCount(cid, 12164) >= 2000) then
            selfSay("Você precisa de 2000 essence of fire, 2000 water gems, 2000 small stones e 2000 screws.", cid)
            talkState[talkUser] = 0
            return true
        end

        setPlayerStorageValue(cid, 84926, 1)
        doPlayerRemoveItem(cid, 2160, 100)
        doPlayerRemoveItem(cid, 12162, 2000)
        doPlayerRemoveItem(cid, 12161, 2000)
        doPlayerRemoveItem(cid, 12337, 2000)
        doPlayerRemoveItem(cid, 12164, 2000)
        doPlayerAddItem(cid, 25217, 1)
        selfSay("Você acabou de comprar seu ticket para viagens, agora poderá ir para Hoenn a hora que quiser, bastará apenas pagar o transporte de 250k caso não seja premium! Deseja {viajar} agora?", cid)

    elseif msgcontains(msg, "viajar") or msgcontains(msg, "VIAJAR") then

        if not (getPlayerItemCount(cid, 25217) >= 1) then
            selfSay("Você ainda não tem o {ticket} para viagens, compre um para viajar comigo!", cid)
            talkState[talkUser] = 0
            return true
        end

        if not isPremium(cid) then
            if (getPlayerItemCount(cid, 2160) >= 50) then
                doPlayerRemoveItem(cid, 2160, 25)
                selfSay("Você já tem o ticket mas não é premium, portante foi necessário fazer o pagamento de 250k, obrigado por viajar comigo e tenha uma boa viagem!", cid)
            else
                selfSay("Você não tem 250k para poder viajar, volte quando tiver!", cid)
                talkState[talkUser] = 0
                return true
            end
        else
            selfSay("Você já tem o ticket e é premium portanto não foi cobrado nenhum custo adicional, obrigado por viajar comigo e tenha uma boa viagem!", cid)
        end

        doTeleportThing(cid, {x = 2202, y = 2139, z = 7}, false)
        talkState[talkUser] = 0
        return true
    end

    return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())