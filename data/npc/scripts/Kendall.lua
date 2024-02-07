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

    if msgcontains(string.lower(msg), 'task') then
        
		if getPlayerStorageValue(cid, 854162) == "" and getPlayerStorageValue(cid, 854161) > 3 and getPlayerStorageValue(cid, 854164) > 0 and getPlayerStorageValue(cid, 854164) > os.time() then 
			selfSay("Volte mais tarde.", cid)
			selfSay("Volte mais tarde. "..getPlayerStorageValue(cid, 854161), cid)
			return true
		--elseif getPlayerStorageValue(cid, 854164) > 0 and getPlayerStorageValue(cid, 854164) < os.time() or  then
		elseif getPlayerStorageValue(cid, 854164) < os.time() then
		    setPlayerStorageValue(cid, 854161, -1) ---check rank
			setPlayerStorageValue(cid, 854162, "") ---check poke
			setPlayerStorageValue(cid, 854163, 0) ---confirma poke
			setPlayerStorageValue(cid, 854164, -1) ---check time
			if getPlayerLevel(cid) < 300 then
	            selfSay("Voce precisa ser no min Nv: 300", cid)
                return true
	        end
		end
		
	  
        if getPlayerStorageValue(cid, 854161) <= 0 then --check se nao tem rak
	        local Daily_CatchNpc = Daily_Catch[getCreatureName(getNpcCid())]
		    setPlayerStorageValue(cid, 854161, 1) ---rank
		    local rank = "rank"..getPlayerStorageValue(cid, 854161)
			-- print(getCreatureName(getNpcCid()))
            local pokeCatch = Daily_CatchNpc[rank].catch[math.random(#Daily_CatchNpc[rank].catch)] 
			
		    setPlayerStorageValue(cid, 854162, pokeCatch) ---pokeCatch
            selfSay("Capture para mim um "..pokeCatch, cid)
			setPlayerStorageValue(cid, 854164, os.time() + (24*60*60))
			return true
		elseif getPlayerStorageValue(cid, 854161) == 1 then
		    if getPlayerStorageValue(cid, 854162) ~= -1 and getPlayerStorageValue(cid, 854162) == getPlayerStorageValue(cid, 854163) then
				local str = ""
				local Daily_CatchNpc = Daily_Catch[getCreatureName(getNpcCid())]
				local rank = "rank"..getPlayerStorageValue(cid, 854161)
				doPlayerAddExp(cid, Daily_CatchNpc[rank].exp)
				doPlayerAddItem(cid, Daily_CatchNpc[rank].token.id, Daily_CatchNpc[rank].token.count)
				str = Daily_CatchNpc[rank].exp/1000 .."k exp and "..Daily_CatchNpc[rank].token.count.."x "..getItemNameById(Daily_CatchNpc[rank].token.id)
				if Daily_CatchNpc[rank].token2 ~= nil then
				    doPlayerAddItem(cid, Daily_CatchNpc[rank].token2.id, Daily_CatchNpc[rank].token2.count)
					str = str.." and "..Daily_CatchNpc[rank].token2.count.."x "..getItemNameById(Daily_CatchNpc[rank].token2.id)
				end
				str = str.."."
				setPlayerStorageValue(cid, 854161, 2) ---rank
				setPlayerStorageValue(cid, 854162, "") ---reseta o pokeCatch
				setPlayerStorageValue(cid, 854163, 0) ---reseta o pokeCatch Confirmação
                selfSay("Parabéns você ganhou "..str, cid)
				selfSay("Gostaria de fazer a segunda missão?", cid)
				talkState[talkUser] = 1
			else
			    selfSay("Que decepção você ainda não capturou um "..getPlayerStorageValue(cid, 854162), cid)
			end
			--selfSay("Que decepção você ainda não capturou um "..getPlayerStorageValue(cid, 854162), cid)
            return true
		elseif getPlayerStorageValue(cid, 854161) == 2 then
		--print(type(getPlayerStorageValue(cid, 854162)))
		    if getPlayerStorageValue(cid, 854162) == "" then
			    local Daily_CatchNpc = Daily_Catch[getCreatureName(getNpcCid())]
		        local rank = "rank"..getPlayerStorageValue(cid, 854161)
                local pokeCatch = Daily_CatchNpc[rank].catch[math.random(#Daily_CatchNpc[rank].catch)] 
		        setPlayerStorageValue(cid, 854162, pokeCatch) ---pokeCatch
                selfSay("Capture para mim um "..pokeCatch, cid)
			    return true
			end
		    if getPlayerStorageValue(cid, 854162) ~= -1 and getPlayerStorageValue(cid, 854162) == getPlayerStorageValue(cid, 854163) then
				local str = ""
				local Daily_CatchNpc = Daily_Catch[getCreatureName(getNpcCid())]
				local rank = "rank"..getPlayerStorageValue(cid, 854161)
				doPlayerAddExp(cid, Daily_CatchNpc[rank].exp)
				doPlayerAddItem(cid, Daily_CatchNpc[rank].token.id, Daily_CatchNpc[rank].token.count)
				str = Daily_CatchNpc[rank].exp/1000 .."k exp and "..Daily_CatchNpc[rank].token.count.."x "..getItemNameById(Daily_CatchNpc[rank].token.id)
				if Daily_CatchNpc[rank].token2 ~= nil then
				    doPlayerAddItem(cid, Daily_CatchNpc[rank].token2.id, Daily_CatchNpc[rank].token2.count)
					str = str.." and "..Daily_CatchNpc[rank].token2.count.."x "..getItemNameById(Daily_CatchNpc[rank].token2.id)
				end
				str = str.."."
				setPlayerStorageValue(cid, 854161, 3) ---rank
				setPlayerStorageValue(cid, 854162, "") ---reseta o pokeCatch
				setPlayerStorageValue(cid, 854163, 0) ---reseta o pokeCatch Confirmação
                selfSay("Parabéns você ganhou "..str, cid)
				selfSay("Gostaria de fazer a terceira missão?", cid)
				talkState[talkUser] = 1
			else
			    selfSay("Que decepção você ainda não capturou um "..getPlayerStorageValue(cid, 854162), cid)
			end
			--selfSay("Que decepção você ainda não capturou um "..getPlayerStorageValue(cid, 854162), cid)
            return true
		elseif getPlayerStorageValue(cid, 854161) == 3 then
		--print(type(getPlayerStorageValue(cid, 854162)))
		    if getPlayerStorageValue(cid, 854162) == "" then
			    local Daily_CatchNpc = Daily_Catch[getCreatureName(getNpcCid())]
		        local rank = "rank"..getPlayerStorageValue(cid, 854161)
                local pokeCatch = Daily_CatchNpc[rank].catch[math.random(#Daily_CatchNpc[rank].catch)] 
		        setPlayerStorageValue(cid, 854162, pokeCatch) ---pokeCatch
                selfSay("Capture para mim um "..pokeCatch, cid)
			    return true
			end
		    if getPlayerStorageValue(cid, 854162) ~= -1 and getPlayerStorageValue(cid, 854162) == getPlayerStorageValue(cid, 854163) then
				local str = ""
				local Daily_CatchNpc = Daily_Catch[getCreatureName(getNpcCid())]
				local rank = "rank"..getPlayerStorageValue(cid, 854161)
				doPlayerAddExp(cid, Daily_CatchNpc[rank].exp)
				doPlayerAddItem(cid, Daily_CatchNpc[rank].token.id, Daily_CatchNpc[rank].token.count)
				str = Daily_CatchNpc[rank].exp/1000 .."k exp and "..Daily_CatchNpc[rank].token.count.."x "..getItemNameById(Daily_CatchNpc[rank].token.id)
				if Daily_CatchNpc[rank].token2 ~= nil then
				    doPlayerAddItem(cid, Daily_CatchNpc[rank].token2.id, Daily_CatchNpc[rank].token2.count)
					str = str.." and "..Daily_CatchNpc[rank].token2.count.."x "..getItemNameById(Daily_CatchNpc[rank].token2.id)
				end
				str = str.."."
				setPlayerStorageValue(cid, 854161, 4) ---rank
				setPlayerStorageValue(cid, 854162, "") ---reseta o pokeCatch
				setPlayerStorageValue(cid, 854163, 0) ---reseta o pokeCatch Confirmação
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
    elseif (msgcontains(string.lower(msg), 'yes') or msgcontains(string.lower(msg), 'sim')) and talkState[talkUser] == 1 then 
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