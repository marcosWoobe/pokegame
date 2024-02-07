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
	
	if today ~= getLastDayKill(cid) then
		resetDailyKill(cid)
	end	
	
	local extras = {11640} -- blue present(chance alta), yellow present(chance média), box+3(chance baixa)
    local extras2 = {11640}                     -- blue present, yellow present, box+3, chances iguais
	
	if isInArray({"hi", "oi", "ola", "olá"}, msg:lower()) and getDistanceToCreature(cid) < 4 then

		local pokeString = tostring(getPlayerStorageValue(cid, killModes.storage2))
		
		if (hasKilled(cid) and (pokes[doCorrectString(pokeString)])) or not (isInArray({"-1", "finished"}, tostring(getPlayerStorageValue(cid, killModes.storage2)))) then
			selfSay("Você já derrotou os ["..getKillCount(cid).."] ".. pokeString .." que lhe pedi?", cid)
			talkState[talkUser] = 3
			return true
		end
				
		if today == getLastDayKill(cid) and getPlayerStorageValue(cid, killModes.storage2) == "finished" then
			selfSay("Não preciso mais de sua ajuda até mais!", cid)
			return true
		end
		
		selfSay("Olá "..getCreatureName(cid)..", você é forte o suficiente para derrotar determinados pokémons??", cid)
		talkState[talkUser] = 1
	elseif talkState[talkUser] == 1 and isInArray({"yes", "sim", "catch", "help"}, msg:lower()) then
		local taskMode = getKillMode(cid)
		local pokemonsToCatch = getPokemonsToKill(cid)
		selfSay("Vamos começar no modo "..killModes[tonumber(taskMode)].name..", você prefere derrotar ["..getKillCount(cid).."] {"..doCorrectString(pokemonsToCatch[1]).."} ou {"..doCorrectString(pokemonsToCatch[2]).."} ?", cid)
		talkState[talkUser] = 2
	elseif talkState[talkUser] == 2 and isInArray(getPokemonsToKill(cid), doCorrectString(msg)) then
		selfSay("Beleza, volte quando eliminar todos os ["..getKillCount(cid).."] "..doCorrectString(msg).."!", cid)
		setPlayerStorageValue(cid, killModes.storage2, doCorrectString(msg))
	elseif talkState[talkUser] == 3 then
		if isInArray({"yes", "sim", "catch"}, msg:lower()) then
			if hasKilled(cid) then
				local mode = getKillMode(cid)
				local expCatchs = pokes[doCorrectString(getPlayerStorageValue(cid, killModes.storage2))].exp * math.floor(getKillCount(cid) * 1.20)
				
				selfSay("Parabéns! Você capturou o "..getPlayerStorageValue(cid, killModes.storage2).." que eu lhe pedi!", cid)			
				selfSay("Obrigado! Você terminou todas as missões por hoje!", cid)
				selfSay("Você acaba de ganhar "..expCatchs.." de experiencia.", cid)
				setPlayerStorageValue(cid, killModes.storage2, "finished")
				doPlayerAddItem(cid, 23487, 1)
				playerAddExp(cid, expCatchs)
				
				if getPlayerStorageValue(cid, 509001) >= 1 then
					if isPremium(cid) then
						setTowerChance(cid, 5)
						doSendMsg(cid, "Você acaba de ganhar [5] Tower Chance.")
					else
						setTowerChance(cid, 3)
						doSendMsg(cid, "Você acaba de ganhar [3] Tower Chance.")
					end
				end	   
				
				if getPlayerClanName(cid) ~= 'No Clan!' then
					if isPremium(cid) then
						addChaveToClan(cid)
						addChaveToClan(cid)
						addChaveToClan(cid)
						addChaveToClan(cid)
					else
						addChaveToClan(cid)
						addChaveToClan(cid)
					end
				end		
		
				if killModes[mode].name == "medium" then
								
					doPlayerAddMoney(cid, (8000 * 100))		
					doPlayerAddItem(cid, 23487, 1)	
					
					-- if math.random(1, 4) == 4 then -- 1, 5
						-- doPlayerAddItem(cid, 19266, 1) -- blue present
                    -- end
					
                elseif killModes[mode].name == "hard" then
							
					doPlayerAddMoney(cid, (10000 * 100))			
					doPlayerAddItem(cid, 23487, 2)		
					
	                if math.random(1, 3) == 3 then
					    local ext = math.random (1,#extras)
						doPlayerAddItem(cid, extras[ext], 1)
					end
					
                elseif killModes[mode].name == "very hard" then						
					doPlayerAddMoney(cid, (12000 * 100))			
					doPlayerAddItem(cid, 23487, 2)	
					doPlayerAddItem(cid, 15645, 2)	
					
	                if math.random(1, 3) == 3 then
					    local ext2 = math.random (1,#extras2)
			            doPlayerAddItem(cid, extras2[ext2], 1)
					end
					
				else
					doPlayerAddMoney(cid, (2000 * 100))
				end
			else
				local pokecount = tonumber(getPlayerStorageValue(cid, 24003) <= 0 and 1 or getPlayerStorageValue(cid, 24003))
				selfSay("Você não pode me enganar! ainda falta você derrotar "..tonumber(getKillCount(master) - pokecount).."!", cid)
			end
			
		elseif isInArray({"no", "não", "nao"}, msg:lower())	then
			selfSay("Então só volte quando capturar um "..getPlayerStorageValue(cid, killModes.storage2).."!", cid)
		end
		talkState[talkUser] = 0
		return true		
	end
end
	
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())