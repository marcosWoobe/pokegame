local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function doBuyPokemonWithCasinoCoins(cid, poke) npcHandler:onSellpokemon(cid) end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    if msgcontains(string.lower(msg), 'task') and getDistanceToCreature(cid) < 4 then
        selfSay("Olá "..getCreatureName(cid)..", preciso de aventureiros para capturar determinados pokémons, você aceita??", cid)
		talkState[talkUser] = 1		
    elseif msgcontains(string.lower(msg), 'yes') and talkState[talkUser] == 1 then	
		if getPlayerLevel(cid) < 80 or getPlayerLevel(cid) > 149 then
	        if getPlayerStorageValue(cid, 854165) ~= -1 then
	            if getPlayerStorageValue(cid, 854165) ~= getCreatureName(getNpcCid()) then
	                selfSay("Termine primeiro a task do "..getPlayerStorageValue(cid, 854165), cid)
				    talkState[talkUser] = 0
                    return true
				end
			else
			    --setPlayerStorageValue(cid, 854164, '00:10:00')
			    --if getPlayerStorageValue(cid, 854164) < os.date("%X.%d.%m.%Y") then
				--selfSay(os.date("%X.%d.%m.%Y"), cid)
				--end
				
		
				--[[local hora = os.date("%H")
				local minu = os.date("%M")
				local sec = os.date("%S")
				
				local dia = os.date("%d")
				local mes = os.date("%m")
				local ano = os.date("%Y")
				
				local horaAtual = hora ..':'..minu..':'..sec
				local dataAtual = dia+1 ..mes..ano
				
				setPlayerStorageValue(cid, 854164, "Faltam "..horaAtual)
				setPlayerStorageValue(cid, 854170, dataAtual)
				
				local horasSTR = tostring(getPlayerStorageValue(cid, 854164)):match("Faltam (.*)")
				local datasSTR = tonumber(getPlayerStorageValue(cid, 854170))
				selfSay("volte as "..datasSTR..' '..tonumber(os.date("%d%m%Y")), cid)
				if tonumber(os.date("%d%m%Y")) < datasSTR then
				selfSay("volte as "..horasSTR..' do dia '..os.date("%d.%m.%Y"), cid)
				end]]
				
				selfSay("Voce precisa ser no min Nv: 80 e no max Nv: 149.", cid)
				talkState[talkUser] = 0
               	return true
			end
		else
			if getPlayerStorageValue(cid, 854164) > os.time() and getPlayerStorageValue(cid, 854161) > 3 then 
			    selfSay("Não tenho task para você agora. Volte mais tarde.", cid)
				talkState[talkUser] = 0
			    return true
		    end
		end

		if getPlayerStorageValue(cid, 854164) <= os.time() then 
		    setPlayerStorageValue(cid, 854161, -1) ---rank
			setPlayerStorageValue(cid, 854162, -1) ---reseta o pokeCatch
			setPlayerStorageValue(cid, 854163, -1) ---reseta o pokeCatch Confirmação
			setPlayerStorageValue(cid, 854165, -1)--npcName
		end
	  
        if getPlayerStorageValue(cid, 854161) <= 0 and getPlayerStorageValue(cid, 854162) == -1 then --check se nao tem rak
	        local Daily_CatchNpc = Daily_Catch[getCreatureName(getNpcCid())]
		    setPlayerStorageValue(cid, 854161, 1) ---rank
		    local rank = "rank"..getPlayerStorageValue(cid, 854161)
            local pokeCatch = Daily_CatchNpc[rank].catch[math.random(#Daily_CatchNpc[rank].catch)] 
		    setPlayerStorageValue(cid, 854162, pokeCatch) ---pokeCatch
            selfSay("Capture para mim um "..pokeCatch, cid)
			setPlayerStorageValue(cid, 854164, os.time() + (24*60*60))--Time
			setPlayerStorageValue(cid, 854165, getCreatureName(getNpcCid()))--npcName
			talkState[talkUser] = 0
			return true
		elseif getPlayerStorageValue(cid, 854161) == 1 then
		    if getPlayerStorageValue(cid, 854162) ~= -1 and getPlayerStorageValue(cid, 854162) == getPlayerStorageValue(cid, 854163) then
				local str = ""
				local Daily_CatchNpc = Daily_Catch[getCreatureName(getNpcCid())]
				local rank = "rank"..getPlayerStorageValue(cid, 854161)
				doPlayerAddExp(cid, Daily_CatchNpc[rank].exp)
				----------
				local Dailyitem = doCreateItemEx(Daily_CatchNpc[rank].token.id, Daily_CatchNpc[rank].token.count)
				doItemSetAttribute(Dailyitem, "unico", 1)
				doPlayerAddItemEx(cid, Dailyitem, true)
				-------------
				--doPlayerAddItem(cid, Daily_CatchNpc[rank].token.id, Daily_CatchNpc[rank].token.count)
				str = Daily_CatchNpc[rank].exp/1000 .."k exp and "..Daily_CatchNpc[rank].token.count.."x "..getItemNameById(Daily_CatchNpc[rank].token.id)
				if Daily_CatchNpc[rank].token2 ~= nil then
				----------
				    local Dailyitem2 = doCreateItemEx(Daily_CatchNpc[rank].token2.id, Daily_CatchNpc[rank].token2.count)
				    doItemSetAttribute(Dailyitem2, "unico", 1)
				    doPlayerAddItemEx(cid, Dailyitem2, true)
				-------------
				    --doPlayerAddItem(cid, Daily_CatchNpc[rank].token2.id, Daily_CatchNpc[rank].token2.count)
					str = str.." and "..Daily_CatchNpc[rank].token2.count.."x "..getItemNameById(Daily_CatchNpc[rank].token2.id)
				end
				str = str.."."
				setPlayerStorageValue(cid, 854161, 2) ---rank
				setPlayerStorageValue(cid, 854162, -1) ---reseta o pokeCatch
				setPlayerStorageValue(cid, 854163, -1) ---reseta o pokeCatch Confirmação
                selfSay("Parabéns você ganhou "..str, cid)
				selfSay("Gostaria de fazer a segunda missão?", cid)
				talkState[talkUser] = 2
			else
			    selfSay("Que decepção você ainda não capturou um "..getPlayerStorageValue(cid, 854162), cid)
			end
            return true
		elseif getPlayerStorageValue(cid, 854161) == 2 then
		    if getPlayerStorageValue(cid, 854162) == -1 then
			    local Daily_CatchNpc = Daily_Catch[getCreatureName(getNpcCid())]
		        local rank = "rank"..getPlayerStorageValue(cid, 854161)
                local pokeCatch = Daily_CatchNpc[rank].catch[math.random(#Daily_CatchNpc[rank].catch)] 
		        setPlayerStorageValue(cid, 854162, pokeCatch) ---pokeCatch
                selfSay("Capture para mim um "..pokeCatch, cid)
				talkState[talkUser] = 0
			    return true
			end
		    if getPlayerStorageValue(cid, 854162) ~= -1 and getPlayerStorageValue(cid, 854162) == getPlayerStorageValue(cid, 854163) then
				local str = ""
				local Daily_CatchNpc = Daily_Catch[getCreatureName(getNpcCid())]
				local rank = "rank"..getPlayerStorageValue(cid, 854161)
				doPlayerAddExp(cid, Daily_CatchNpc[rank].exp)
				----------
				local Dailyitem = doCreateItemEx(Daily_CatchNpc[rank].token.id, Daily_CatchNpc[rank].token.count)
				doItemSetAttribute(Dailyitem, "unico", 1)
				doPlayerAddItemEx(cid, Dailyitem, true)
				-------------
				--doPlayerAddItem(cid, Daily_CatchNpc[rank].token.id, Daily_CatchNpc[rank].token.count)
				str = Daily_CatchNpc[rank].exp/1000 .."k exp and "..Daily_CatchNpc[rank].token.count.."x "..getItemNameById(Daily_CatchNpc[rank].token.id)
				if Daily_CatchNpc[rank].token2 ~= nil then
				----------
				    local Dailyitem2 = doCreateItemEx(Daily_CatchNpc[rank].token2.id, Daily_CatchNpc[rank].token2.count)
				    doItemSetAttribute(Dailyitem2, "unico", 1)
				    doPlayerAddItemEx(cid, Dailyitem2, true)
				-------------
				    --doPlayerAddItem(cid, Daily_CatchNpc[rank].token2.id, Daily_CatchNpc[rank].token2.count)
					str = str.." and "..Daily_CatchNpc[rank].token2.count.."x "..getItemNameById(Daily_CatchNpc[rank].token2.id)
				end
				str = str.."."
				setPlayerStorageValue(cid, 854161, 3) ---rank
				setPlayerStorageValue(cid, 854162, -1) ---reseta o pokeCatch
				setPlayerStorageValue(cid, 854163, -1) ---reseta o pokeCatch Confirmação
                selfSay("Parabéns você ganhou "..str, cid)
				selfSay("Gostaria de fazer a terceira missão?", cid)
				talkState[talkUser] = 2
			else
			    selfSay("Que decepção você ainda não capturou um "..getPlayerStorageValue(cid, 854162), cid)
			end
            return true
		elseif getPlayerStorageValue(cid, 854161) == 3 then
		    if getPlayerStorageValue(cid, 854162) == -1 then
			    local Daily_CatchNpc = Daily_Catch[getCreatureName(getNpcCid())]
		        local rank = "rank"..getPlayerStorageValue(cid, 854161)
                local pokeCatch = Daily_CatchNpc[rank].catch[math.random(#Daily_CatchNpc[rank].catch)] 
		        setPlayerStorageValue(cid, 854162, pokeCatch) ---pokeCatch
                selfSay("Capture para mim um "..pokeCatch, cid)
				talkState[talkUser] = 0
			    return true
			end
		    if getPlayerStorageValue(cid, 854162) ~= -1 and getPlayerStorageValue(cid, 854162) == getPlayerStorageValue(cid, 854163) then
				local str = ""
				local Daily_CatchNpc = Daily_Catch[getCreatureName(getNpcCid())]
				local rank = "rank"..getPlayerStorageValue(cid, 854161)
				doPlayerAddExp(cid, Daily_CatchNpc[rank].exp)
				----------
				local Dailyitem = doCreateItemEx(Daily_CatchNpc[rank].token.id, Daily_CatchNpc[rank].token.count)
				doItemSetAttribute(Dailyitem, "unico", 1)
				doPlayerAddItemEx(cid, Dailyitem, true)
				-------------
				--doPlayerAddItem(cid, Daily_CatchNpc[rank].token.id, Daily_CatchNpc[rank].token.count)
				str = Daily_CatchNpc[rank].exp/1000 .."k exp and "..Daily_CatchNpc[rank].token.count.."x "..getItemNameById(Daily_CatchNpc[rank].token.id)
				if Daily_CatchNpc[rank].token2 ~= nil then
				    --doPlayerAddItem(cid, Daily_CatchNpc[rank].token2.id, Daily_CatchNpc[rank].token2.count)
					----------
				    local Dailyitem2 = doCreateItemEx(Daily_CatchNpc[rank].token2.id, Daily_CatchNpc[rank].token2.count)
				    doItemSetAttribute(Dailyitem2, "unico", 1)
				    doPlayerAddItemEx(cid, Dailyitem2, true)
				-------------
					str = str.." and "..Daily_CatchNpc[rank].token2.count.."x "..getItemNameById(Daily_CatchNpc[rank].token2.id)
				end
				str = str.."."
				setPlayerStorageValue(cid, 854161, 4) ---rank
				setPlayerStorageValue(cid, 854162, -1) ---reseta o pokeCatch
				setPlayerStorageValue(cid, 854163, -1) ---reseta o pokeCatch Confirmação
				setPlayerStorageValue(cid, 854165, -1)--npcName
                selfSay("Parabéns você ganhou "..str, cid)
				selfSay("Thanks so much for talk with my son!", cid)
            	return true
			else
			    selfSay("Que decepção você ainda não capturou um "..getPlayerStorageValue(cid, 854162), cid)
			end
			
            return true
        else
            selfSay("Thanks so much for talk with my son!", cid)
            return true
        end
    elseif (msgcontains(string.lower(msg), 'yes') or msgcontains(string.lower(msg), 'sim')) and talkState[talkUser] == 2 then 
        local Daily_CatchNpc = Daily_Catch[getCreatureName(getNpcCid())]
		local rank = "rank"..getPlayerStorageValue(cid, 854161)
        local pokeCatch = Daily_CatchNpc[rank].catch[math.random(#Daily_CatchNpc[rank].catch)] 
		setPlayerStorageValue(cid, 854162, pokeCatch) ---pokeCatch
        selfSay("Capture para mim um "..pokeCatch, cid)
        talkState[talkUser] = 0
    end

return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())