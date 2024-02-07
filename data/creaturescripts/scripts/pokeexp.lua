local function playerAddExp(cid, exp)
    if not isPlayer(cid) then
	    return
	end
	 
    -- local doublexp = 0.4
    local doublexp = 0.01
	if getPlayerStorageValue(cid, 45144) - os.time() > 1 then
		doublexp = (doublexp-1)+((100 + getPlayerStorageValue(cid, 45145))/100)
	end 
    -- print(doublexp)
    local vipexp = 1
    if isPremium(cid) then
        vipexp = 1.1 -- 10% a mais | 1.2 = 20%
    end
    local Tiers = { 
        [71] = {bonus = Exp1},  
        [72] = {bonus = Exp2},
        [73] = {bonus = Exp3},
        [74] = {bonus = Exp4},
        [75] = {bonus = Exp5},
        [76] = {bonus = Exp6},
        [77] = {bonus = Exp7},
    }
    local ball = getPlayerSlotItem(cid, 8)
	if ball then
        local Tier = getItemAttribute(ball.uid, "heldx") 
        if Tier and Tier > 70 and Tier < 78 then
		    
            doPlayerAddExp(cid, math.floor(((exp * Tiers[Tier].bonus) * vipexp)) * doublexp)
	        doSendAnimatedText(getThingPos(cid), math.floor(((exp * Tiers[Tier].bonus) * vipexp) * doublexp), 215)
            sendMsgToPlayer(cid, MESSAGE_EVENT_DEFAULT, "Você ganhou "..math.floor(((exp * Tiers[Tier].bonus) * vipexp) * doublexp).." Pontos de Experiência.")
		else
            doPlayerAddExp(cid, math.floor((exp * vipexp)) * doublexp)
            --print(math.floor((exp * vipexp)) * doublexp)
	        doSendAnimatedText(getThingPos(cid), math.floor((exp * vipexp) * doublexp), 215)
			sendMsgToPlayer(cid, MESSAGE_EVENT_DEFAULT, "Você ganhou "..math.floor((exp * vipexp) * doublexp).." Pontos de Experiência.")
        end 
	else
	    doPlayerAddExp(cid, math.floor((exp * vipexp)) * doublexp)
	    doSendAnimatedText(getThingPos(cid), math.floor((exp * vipexp) * doublexp), 215)
		sendMsgToPlayer(cid, MESSAGE_EVENT_DEFAULT, "Você ganhou "..math.floor((exp * vipexp) * doublexp).." Pontos de Experiência.")
	end
end

local Exps = { 
    {minL = 1, maxL = 25, multipler = 40}, 
    {minL = 26, maxL = 50, multipler = 33},
    {minL = 51, maxL = 75, multipler = 26},    
    {minL = 76, maxL = 100, multipler = 24},        
    {minL = 101, maxL = 125, multipler = 20},
    {minL = 126, maxL = 150, multipler = 18}, 
    {minL = 151, maxL = 175, multipler = 16},
    {minL = 176, maxL = 200, multipler = 14},
    {minL = 201, maxL = 225, multipler = 12}, 
    {minL = 226, maxL = 250, multipler = 10},
    {minL = 251, maxL = 275, multipler = 8},
    {minL = 276, maxL = 300, multipler = 6},    
    {minL = 301, maxL = 325, multipler = 4}, 
    {minL = 326, maxL = 350, multipler = 2},
    {minL = 351, maxL = 375, multipler = 1},    
    {minL = 376, maxL = 400, multipler = 0.8}, 
}

local function calculaExp(cid, expTotal)
    if not isPlayer(cid) then return 0 end
    local expFinal = expTotal
    local flag = false
    for _, TABLE in pairs(Exps) do
	    if getPlayerLevel(cid) >= TABLE.minL and getPlayerLevel(cid) <= TABLE.maxL then
		    flag = true
		    expFinal = expFinal * TABLE.multipler
		    break
	    end
    end
    if not flag then 
	    expFinal = expFinal * 0.1 
	end --lvl 400+
    return math.floor(expFinal)
end

function onDeath(cid, corpse, deathList)

    if isSummon(cid) or not deathList or getCreatureName(cid) == "Evolution" then return true end --alterado v1.8
    -------------Edited Golden Arena-------------------------
    if getPlayerStorageValue(cid, 22546) == 1 then
	    setGlobalStorageValue(22548, getGlobalStorageValue(22548)-1)
	    if corpse.itemid ~= 0 then doItemSetAttribute(corpse.uid, "golden", 1) end --alterado v1.8
    end
    if getPlayerStorageValue(cid, 22546) == 1 and getGlobalStorageValue(22548) == 0 then
	    local wave = getGlobalStorageValue(22547)
	    for _, sid in ipairs(getPlayersOnline()) do
		    if isPlayer(sid) and getPlayerStorageValue(sid, 22545) == 1 then
		        if getGlobalStorageValue(22547) < #wavesGolden+1 then
			        doPlayerSendTextMessage(sid, 20, "Wave "..wave.." will begin in "..timeToWaves.."seconds!")
			        doPlayerSendTextMessage(sid, 28, "Wave "..wave.." will begin in "..timeToWaves.."seconds!")
			        addEvent(creaturesInGolden, 100, GoldenUpper, GoldenLower, false, true, true)
			        addEvent(doWave, timeToWaves*1000)
		        elseif getGlobalStorageValue(22547) == #wavesGolden+1 then
			        doPlayerSendTextMessage(sid, 20, "You have win the golden arena! Take your reward!")
			        doPlayerAddItem(sid, 2152, getPlayerStorageValue(sid, 22551)*2) --premio
			        setPlayerStorageValue(sid, 22545, -1)
			        doTeleportThing(sid, getClosestFreeTile(sid, posBackGolden), false)
			        setPlayerRecordWaves(sid)
		        end
		    end
	    end
	    if getGlobalStorageValue(22547) == #wavesGolden+1 then
		    endGoldenArena()
	    end
   end
--------------------------------------------------- /\/\
    local givenexp = getWildPokemonExp(cid)
    local expTotal = 0
    if givenexp > 0 then
        for a = 1, #deathList do 
            local pk = deathList[a]
            local list = getSpectators(getThingPosWithDebug(pk), 10, 10, false)
            if isCreature(pk) then
                expTotal = math.floor(playerExperienceRate * givenexp * getDamageMapPercent(pk, cid))
                expTotal = calculaExp(pk, expTotal) --* 0.30
				--------------------party------------------
				local party = getPartyMembers(pk)
				if isInParty(pk) and getPlayerStorageValue(pk, 4875498) <= -1 then
      				expTotal = math.floor(expTotal/#party)         
      				for i = 1, #party do
          				if isInArray(list, party[i]) then
            	    		playerAddExp(party[i], expTotal)
        				end
      				end
            	else
       		   	    playerAddExp(pk, expTotal)  
    			end
            end
        end
    end

    if isNpcSummon(cid) then
	    local master = getCreatureMaster(cid)
	    doSendMagicEffect(getThingPos(cid), getPlayerStorageValue(cid, 10000))
	    doCreatureSay(master, getPlayerStorageValue(cid, 10001), 1)
	    doRemoveCreature(cid)
	    return false 
    end

    if corpse.itemid ~= 0 then --alterado v1.8
    	doItemSetAttribute(corpse.uid, "level", getPokeLevel(cid))
	    --doItemSetAttribute(corpse.uid, "level", getPokemonLevel(cid))
		
	    doItemSetAttribute(corpse.uid, "gender", getPokemonGender(cid))
        if isPremium(cid) then
    		local configBonusExp = {
    		    text = "exp",
    			colorText = COLOR_POISON,
    			effect = 616,
            	time_effect = 6,
            	chance = 2
    		} 
    		if math.random(1, 100) <= configBonusExp.chance then
    			doItemSetAttribute(corpse.uid, "bonusexp", expTotal)
    			doItemSetAttribute(corpse.uid, "aid", 64700)
    			for i = 1, configBonusExp.time_effect do  
    			    addEvent(doSendMagicEffect, 1000*i, getThingPos(cid), configBonusExp.effect)
    				addEvent(doSendAnimatedText, 1000*i, getThingPos(cid), "+"..expTotal.." "..configBonusExp.text, configBonusExp.colorText)
    			end
    		end
        end
		
    end

    return true
end 