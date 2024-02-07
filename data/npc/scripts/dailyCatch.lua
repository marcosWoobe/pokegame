local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onThink() npcHandler:onThink() end

function onCreatureSay(cid, type1, msg)
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	
	local today = getNumberDay().."-"..getNumberMonth().."-"..getNumberYear()
	
	if today ~= getLastDayCatch(cid) then
		resetDaily(cid)
	end	
	
	local extras = {19266, 11640, 19266, 19266} -- blue present(chance alta), yellow present(chance média), box+3(chance baixa)
    local extras2 = {19266, 11640}                     -- blue present, yellow present, box+3, chances iguais
	
	if isInArray({"hi", "oi", "ola", "olá"}, msg:lower()) and getDistanceToCreature(cid) < 4 then

		local pokeString = tostring(getPlayerStorageValue(cid, catchModes.storage2))
		
		if (hasCatched(cid) and (pokes[doCorrectString(pokeString)])) or not (isInArray({"-1", "finished"}, tostring(getPlayerStorageValue(cid, catchModes.storage2)))) then
			selfSay("Você já capturou o ".. pokeString .." que lhe pedi?", cid)
			talkState[talkUser] = 3
			return true
		end
				
		if today == getLastDayCatch(cid) and getPlayerStorageValue(cid, catchModes.storage2) == "finished" then
			selfSay("Não preciso mais de sua ajuda até mais!", cid)
			return true
		end
		
		selfSay("Olá "..getCreatureName(cid)..", preciso de aventureiros para capturar determinados pokémons, você aceita??", cid)
		talkState[talkUser] = 1
	elseif talkState[talkUser] == 1 and isInArray({"yes", "sim", "catch", "help"}, msg:lower()) then
		local taskMode = getCatchMode(cid)
		local pokemonsToCatch = getPokemonsToCatch(cid)
		selfSay("Vamos começar no modo "..catchModes[tonumber(taskMode)].name..", você prefere capturar um {"..doCorrectString(pokemonsToCatch[1]).."} ou {"..doCorrectString(pokemonsToCatch[2]).."} ?", cid)
		talkState[talkUser] = 2
	elseif talkState[talkUser] == 2 and isInArray(getPokemonsToCatch(cid), doCorrectString(msg)) then
		selfSay("Beleza, volte quando capturar seu "..doCorrectString(msg).."!", cid)
		setPlayerStorageValue(cid, catchModes.storage2, doCorrectString(msg))
	elseif talkState[talkUser] == 3 then
		if isInArray({"yes", "sim", "catch"}, msg:lower()) then
			if hasCatched(cid) then
				local mode = getCatchMode(cid)
				local expCatchs = newpokedex[doCorrectString(getPlayerStorageValue(cid, catchModes.storage2))].expCatch
				
				selfSay("Parabéns! Você capturou o "..getPlayerStorageValue(cid, catchModes.storage2).." que eu lhe pedi!", cid)			
				selfSay("Obrigado! Você terminou todas as missões por hoje!", cid)
				setPlayerStorageValue(cid, catchModes.storage2, "finished")
				doPlayerAddItem(cid, 15644, 1)
				playerAddExp(cid, expCatchs)
				
				if getPlayerStorageValue(cid, 509001) >= 1 then
					if isPremium(cid) then
						setTowerChance(cid, 2)
						doSendMsg(cid, "Você acaba de ganhar [2] Tower Chance.")
					else
						setTowerChance(cid, 1)
						doSendMsg(cid, "Você acaba de ganhar [1] Tower Chance.")
					end
				end	   
				
				if getPlayerClanName(cid) ~= 'No Clan!' then
					if isPremium(cid) then
						addChaveToClan(cid)
						addChaveToClan(cid)
					else
						addChaveToClan(cid)
					end
				end		
		
				if catchModes[mode].name == "medium" then
								
					doPlayerAddMoney(cid, (8000 * 100))
					doPlayerAddItem(cid, 15644, 2)
					doPlayerAddItem(cid, 23488, 1)		
					
					if math.random(1, 4) == 4 then -- 1, 5
						doPlayerAddItem(cid, 19266, 1) -- blue present
                    end
					
                elseif catchModes[mode].name == "hard" then
							
					doPlayerAddMoney(cid, (10000 * 100))			
					doPlayerAddItem(cid, 15645, 1)
					doPlayerAddItem(cid, 23488, 2)
					
	                if math.random(1, 3) == 3 then
					    local ext = math.random (1,#extras)
						doPlayerAddItem(cid, extras[ext], 1)
					end
					
                elseif catchModes[mode].name == "very hard" then						
					doPlayerAddMoney(cid, (12000 * 100))			
					doPlayerAddItem(cid, 23487, 1)		
					doPlayerAddItem(cid, 23488, 3)
					
	                if math.random(1, 3) == 3 then
					    local ext2 = math.random (1,#extras2)
			            doPlayerAddItem(cid, extras2[ext2], 1)
					end
					
				else
					doPlayerAddMoney(cid, (2000 * 100))
				end
			else
				selfSay("Você não pode me enganar! Você ainda não capturou nenhum "..getPlayerStorageValue(cid, catchModes.storage2).."!", cid)
			end
			
		elseif isInArray({"no", "não", "nao"}, msg:lower())	then
			selfSay("Então só volte quando capturar um "..getPlayerStorageValue(cid, catchModes.storage2).."!", cid)
		end
		talkState[talkUser] = 0
		return true		
	end
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())