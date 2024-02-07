local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function AutoLootinit(cid)
	if getPlayerStorageValue (cid, storages.AutoLootCollectAll) == -1 then
		setPlayerStorageValue(cid, storages.AutoLootCollectAll, "no")
	end
	return true 
end


                          --alterado v1.6 tabelas soh em configuration.lua;
function onLogin(cid)

	setPlayerStorageValue(cid, 43534, os.time() + 10)

	-- if ( DailyRewards:getTimeWait(cid) >= DailyRewards.config.timerWait ) then
	-- 	DailyRewards:setTime(cid)
	-- end -- daily desativado

    --[[ if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) <= 149 then
       doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, 0)
    else     
       doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, 30)
	end
	doPlayerSetLossPercent(cid, PLAYERLOSS_SKILLS, 0)]]
	if getPlayerStorageValue(cid, 53502) >= 1 then 
		--doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, 0)
		doPlayerSendTextMessage(cid, 27, "You have a Bless.")
	else
	    doPlayerSendTextMessage(cid, 27, "you have not Bless.")
	end

	if not isFlying(cid) then
		if type(getPlayerStorageValue(cid, 9006)) == "string" or getPlayerStorageValue(cid, 9005) > 0 then
			doSummonGuardian(cid, getPlayerStorageValue(cid, 9006))
			local pk = getCreatureGuardians(cid)[1]
			adjustGuardianPoke(pk, 1000, getPlayerStorageValue(cid, 9006), cid)
			-- doPlayerSendTextMessage(cid, 27, "Seu Guardian Possui (" .. math.ceil(exhaustion.get(getPlayerCurrentGuardian(cid), 11) / 60) .. ") Minutos Restantes.")
		end
	end

  if getPlayerCurrentGuardian(cid) then                         
    doPlayerSendTextMessage(cid, 27, "Seu Guardian Possui (" .. math.ceil(exhaustion.get(getPlayerCurrentGuardian(cid), 11) / 60) .. ") Minutos Restantes.")
    doPlayerSetStorageValue(cid, 9005, exhaustion.get(getPlayerCurrentGuardian(cid), 11))
    doPlayerSetStorageValue(cid, 9006, getCreatureName(getPlayerCurrentGuardian(cid)))
    doSendPlayerExtendedOpcode(cid, 164, (math.ceil(exhaustion.get(getPlayerCurrentGuardian(cid), 11) / 60) .. " Minutos|" .. getPokemonXMLOutfit(getCreatureName(getCreatureGuardians(cid)[1]))) )
  end

	if isFlying(cid) then
		doSendPlayerExtendedOpcode(cid, 166, "dive")
		doSendPlayerExtendedOpcode(cid, 168, "diveUp")
	end
	
	if getPlayerStorageValue(cid, 45144) - os.time() > 1 then
		sendMsgToPlayer(cid, 27, "Você ainda tem um Experience Booster ativo de "..getPlayerStorageValue(cid, 45145).."%. Ele irá acabar em "..convertTime(getPlayerStorageValue(cid, 45144) - os.time())..".")
	end

  if getPlayerStorageValue(cid, 4125) - os.time() > 0 then
    doPlayerSendTextMessage(cid, 27, "[Shiny Charm]: "..convertTime(getPlayerStorageValue(cid, 4125) - os.time()).." restantes.")
  end

  if getPlayerStorageValue(cid, 4126) - os.time() > 0 then
    doPlayerSendTextMessage(cid, 27, "[Mega Charm]: "..convertTime(getPlayerStorageValue(cid, 4126) - os.time()).." restantes.")
  end
	
	-- doCreatureSetDropLoot(cid, false) 

	if not getPlayerGroupId(cid) == 6 then
		doPlayerOpenChannel(cid, 5)---Game-Chat
		doPlayerOpenChannel(cid, 6)---Trade
		doPlayerOpenChannel(cid, 9)---Help
	end
	
	-- if getPlayerStorageValue(cid, 5700) > 0 and getPlayerItemCount(cid, 12402) < 1 then
	--     setPlayerStorageValue(cid, 5700, -1) 
	--     doRegainSpeed(cid)  
	-- 	doRemoveCondition(cid, CONDITION_OUTFIT)
	-- 	doPlayerSendTextMessage(cid, 27, "Sorry, you got dismounted from the bike for not having one in the bag.")
	-- end

	if getPlayerStorageValue(cid, 5700) > 0 then
		if getPlayerItemCount(cid, 12402) >= 1 or getPlayerItemCount(cid, 23452) >= 1 or getPlayerItemCount(cid, 17871) >= 1 or getPlayerItemCount(cid, 23454) >= 1 or getPlayerItemCount(cid, 23450) >= 1 or getPlayerItemCount(cid, 23455) >= 1 or getPlayerItemCount(cid, 23451) >= 1 or getPlayerItemCount(cid, 23481) >= 1 then
		else
	   		setPlayerStorageValue(cid, 5700, -1) 
	    	doRegainSpeed(cid)  
			doRemoveCondition(cid, CONDITION_OUTFIT)
			doPlayerSendTextMessage(cid, 27, "Sorry, you got dismounted from the bike for not having one in the bag.")
		end
	end
	
	if isPremium(cid) then 
	    doPlayerSendTextMessage(cid, 27, "Obrigado por ser vip, voce tem 10% de bonus no Catch e Exp.")
        doCreatureSetSkullType(cid, 2)
	else
	    doPlayerSendTextMessage(cid, 27, "Seja vip e tenha 10% de bonus no Catch e Exp.")
	end

	-- if not isPremium(cid) then
	-- 	doPlayerAddPremiumDays(cid,2)
	--    doPlayerSendTextMessage(cid, 27, "Você acabou de ganhar 2 dias de vip pelo evento!!.")
	-- end

	doPlayerSendTextMessage(cid, 27, "Digite !autoloot on para ativar o autoloot, e !autoloot off para desativar.")
	
	if getPlayerStorageValue(cid, dungeonPoints) == -1 then
		setPlayerStorageValue(cid, dungeonPoints, 0)
	end
	
	doSendPlayerExtendedOpcode(cid, dungeon_Opcode, getPlayerStorageValue(cid, dungeonPoints))
		
	local accountManager = getPlayerAccountManager(cid)

	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Sua ultima visita foi " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
			-- str = "Seu Personagem sera salvo a cada 3 minutos para evitar rollbacks"
		else
			str = str
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)

	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, it appears that your character has been namelocked, what would you like as your new name?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to manage your account and if you want to start over then type 'cancel'.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to create an account or type 'recover' to recover an account.")
	end

	if getCreatureName(cid) == "Account Manager" then
		local outfit = {}
		if accountManagerRandomPokemonOutfit then
			outfit = {lookType = getPokemonXMLOutfit(oldpokedex[math.random(151)][1])}
		else
			outfit = accountManagerOutfit
		end
	
		doSetCreatureOutfit(cid, outfit, -1)
	    return true
	end

	if(not isPlayerGhost(cid)) then
		local posPlayerLevel = getThingPosWithDebug(cid)
		--doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		doSendMagicEffect({x=posPlayerLevel.x+1,y=posPlayerLevel.y+1,z=posPlayerLevel.z}, 1036)
	end

	local outfit = {}

	   if getPlayerStorageValue(cid, 58769) == -1 then
        setPlayerStorageValue(cid, 58769, 1)
        doPlayerSetMaxCapacity(cid, 0)
		doPlayerSetVocation(cid, 1) 
		setCreatureMaxMana(cid, 6)
		doPlayerAddSoul(cid, -getPlayerSoul(cid))
		setPlayerStorageValue(cid, 19898, 0)
		if getPlayerSex(cid) == 1 then
			outfit = {lookType = 289, lookHead = math.random(0, 132), lookBody = math.random(0, 132), lookLegs = math.random(0, 132), lookFeet = math.random(0, 132)}
		else
			outfit = {lookType = 511, lookHead = math.random(0, 132), lookBody = math.random(0, 132), lookLegs = math.random(0, 132), lookFeet = math.random(0, 132)}
		end
		doCreatureChangeOutfit(cid, outfit)

		-- first items --
		if getPlayerSlotItem(cid, CONST_SLOT_ARMOR).itemid > 0 then
			return true
		end

		doPlayerAddItem(cid, 1988, 1)
		doPlayerAddItem(cid, 1987, 1)
		doPlayerAddItem(cid, 2382, 1)
		doPlayerAddItem(cid, 2120, 1)
		doPlayerAddItem(cid, 2550, 1)
		doPlayerAddItem(cid, 2580, 1)
		doPlayerAddItem(cid, 2395, 1)
		
		local bag = getPlayerItemById(cid, false, 1988).uid
		doAddContainerItem(bag, 12267, 1)
		doAddContainerItem(bag, 12266, 1)
		doAddContainerItem(bag, 12264, 1)
		doAddContainerItem(bag, 12265, 1)
		doAddContainerItem(bag, 12263, 1)
		doAddContainerItem(bag, 12262, 1)
		doAddContainerItem(bag, 12261, 1)
		doAddContainerItem(bag, 12260, 1)

		-- first items --		

		local item1 = doCreateItemEx(2152, 3)
		local item2 = doCreateItemEx(2394, 30)
		local item3 = doCreateItemEx(12346, 25)
		local item4 = doCreateItemEx(12344, 15)
		local item6 = doCreateItemEx(12349, 35)	
	    doItemSetAttribute(item1, "unico", 1)
		doItemSetAttribute(item2, "unico", 1)
		doItemSetAttribute(item3, "unico", 1)
		doItemSetAttribute(item4, "unico", 1)
		doItemSetAttribute(item6, "unico", 1)
		doPlayerAddItemEx(cid, item1, true)
		doPlayerAddItemEx(cid, item2, true)
		doPlayerAddItemEx(cid, item3, true)
		doPlayerAddItemEx(cid, item4, true)
		doPlayerAddItemEx(cid, item6, true)
		setCreatureMaxHealth(cid, 500)
		doCreatureAddHealth(cid, 500)
		setPlayerStorageValue(cid, 7222702, getPlayerStorageValue(cid, 7222702) + 1)

		setPlayerStorageValue(cid, 20025, "all") -- autoloot
		setPlayerStorageValue(cid, 20026, 1) -- autoloot
		doSendMsg(cid, "Autoloot ativado!") -- autoloot
        
        addPokeToPlayer(cid, "Baby Bulbasaur", 0, nil, 0, 0, 0, true)
        addPokeToPlayer(cid, "Baby Charmander", 0, nil, 0, 0, 0, true)
        addPokeToPlayer(cid, "Baby Squirtle", 0, nil, 0, 0, 0, true)
    end
    

    if getPlayerStorageValue(cid, 1000000) == 1 and getPlayerLevel(cid) == 10 then 
		setPlayerStorageValue(cid, 1000000, -1)
		addPokeToPlayer(cid, "Baby Bulbasaur", 0, nil, 0, 0, 0, true)
    end

    if getPlayerStorageValue(cid, 1000001) == 1 and getPlayerLevel(cid) == 10 then 
	   setPlayerStorageValue(cid, 1000001, -1)
		addPokeToPlayer(cid, "Baby Charmander", 0, nil, 0, 0, 0, true)
    end

    if getPlayerStorageValue(cid, 1000002) == 1 and getPlayerLevel(cid) == 10 then 
	    setPlayerStorageValue(cid, 1000002, -1)
		addPokeToPlayer(cid, "Baby Squirtle", 0, nil, 0, 0, 0, true)
    end


	if getPlayerStorageValue(cid, 76001) ~= 1 then
		setPlayerStorageValue(cid, 76001, 1)
		db.executeQuery(string.format('INSERT INTO `player_pokedex` (player_id) VALUES (%s)', db.escapeString(getPlayerGUID(cid))))
	end


	registerCreatureEvent(cid, "dropStone")
    registerCreatureEvent(cid, "ShowPokedex") --alterado v1.6
    registerCreatureEvent(cid, "ClosePokedex") --alterado v1.6 
	-- registerCreatureEvent(cid, "WatchTv")
	-- registerCreatureEvent(cid, "StopWatchingTv")
	-- registerCreatureEvent(cid, "WalkTv")
	-- registerCreatureEvent(cid, "RecordTv")
	registerCreatureEvent(cid, "DuelOn")
	registerCreatureEvent(cid, "PlayerLogout")
	registerCreatureEvent(cid, "WildAttack")
	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "PokemonIdle")
	registerCreatureEvent(cid, "EffectOnAdvance")
	registerCreatureEvent(cid, "GeneralConfiguration")
	registerCreatureEvent(cid, "ReportBug")
	registerCreatureEvent(cid, "LookSystem")
	registerCreatureEvent(cid, "T1")
	registerCreatureEvent(cid, "T2")
	registerCreatureEvent(cid, "task_count")
	registerCreatureEvent(cid, "pokemons")
    registerCreatureEvent(cid, "ExtendedOpcode")
	registerCreatureEvent(cid, "ArenaPVP")
    registerCreatureEvent(cid, "tokenMachina")
	registerCreatureEvent(cid, "event_natal")
	registerCreatureEvent(cid, "PokeLevel")
	-- registerCreatureEvent(cid, "InfoPokesPsoul")
	registerCreatureEvent(cid, "PlayerCrown")
	registerCreatureEvent(cid, "channelWiki")
	registerCreatureEvent(cid, "channelWikiLeave")	
	registerCreatureEvent(cid, "talkchannel")		
	registerCreatureEvent(cid, "charmSystem") 
	registerCreatureEvent(cid, "pokemonTask") 
	registerCreatureEvent(cid, "dailyKill") 
	registerCreatureEvent(cid, "GuardianReturn2") 
	-- registerCreatureEvent(cid, "sendStats") 
	registerCreatureEvent(cid, "timeGuardian") 
	registerCreatureEvent(cid, "pLoot")	
	registerCreatureEvent(cid, "EffectWalk")	
	
	
	-- registerCreatureEvent(cid, "selecttv") --TV Viktor 
	-- registerCreatureEvent(cid, "newTv") --TV Viktor 
	
	registerCreatureEvent(cid, "dungeon_sys") 	

	if (not isPlayerGhost(cid)) then
		addEvent(doSendAnimatedText, 500, getThingPosWithDebug(cid), "Bem Vindo!!", COLOR_BURN)
	end

	if getPlayerStorageValue(cid, 99284) == 1 then
		setPlayerStorageValue(cid, 99284, -1)
	end

    if getPlayerStorageValue(cid, 6598754) >= 1 or getPlayerStorageValue(cid, 6598755) >= 1 then
       setPlayerStorageValue(cid, 6598754, -1)
       setPlayerStorageValue(cid, 6598755, -1)
       doRemoveCondition(cid, CONDITION_OUTFIT)             --alterado v1.9 \/
       doTeleportThing(cid, posBackPVP, false)
       doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
    end
	
	if getPlayerStorageValue(cid, 84929) >= 1 then--torneio viktor
       setPlayerStorageValue(cid, 84929, -1)
       doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
       doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
    end
    
	doChangeSpeed(cid, -(getCreatureSpeed(cid)))
	
	--///////////////////////////////////////////////////////////////////////////--
    local storages = {17000, 63215, 17001, 13008, 5700}
    for s = 1, #storages do
        if not tonumber(getPlayerStorageValue(cid, storages[s])) then
           if s == 3 then
              setPlayerStorageValue(cid, storages[s], 1)
           elseif s == 4 then
              setPlayerStorageValue(cid, storages[s], -1)
           else   
              if isBeingUsed(getPlayerSlotItem(cid, 8).itemid) then
                 setPlayerStorageValue(cid, storages[s], 1)                 
              else
                 setPlayerStorageValue(cid, storages[s], -1) 
              end
           end
           doPlayerSendTextMessage(cid, 27, "Sorry, but a problem occurred on the server, but now it's alright")
        end
    end
    --/////////////////////////////////////////////////////////////////////////--
	if getPlayerStorageValue(cid, 17000) >= 1 then -- fly
        
		local item = getPlayerSlotItem(cid, 8)
		local poke = getItemAttribute(item.uid, "poke")
		doChangeSpeed(cid, getPlayerStorageValue(cid, 54844))
		doRemoveCondition(cid, CONDITION_OUTFIT)
		if flys[poke] then
		    doSetCreatureOutfit(cid, {lookType = flys[poke][1] + 351}, -1)
		end

	    local apos = getFlyingMarkedPos(cid)
        apos.stackpos = 0
		
	    if getTileThingByPos(apos).itemid <= 2 then
			doCombatAreaHealth(cid, FIREDAMAGE, getFlyingMarkedPos(cid), 0, 0, 0, CONST_ME_NONE)
			if doCreateItem(460, 1, getFlyingMarkedPos(cid)) then
				doCreateItem(460, 1, getFlyingMarkedPos(cid))
			end
		end 

	    doTeleportThing(cid, apos, false)
	    if getItemAttribute(item.uid, "boost") and getItemAttribute(item.uid, "boost") >= 50 and getPlayerStorageValue(cid, 42368) >= 1 then   
            sendAuraEffect(cid, auraSyst[getItemAttribute(item.uid, "aura")])                     --alterado v1.8
        end  
 
        local posicao = getTownTemplePosition(getPlayerTown(cid))
        markFlyingPos(cid, posicao)
    
	elseif getPlayerStorageValue(cid, 63215) >= 1 then -- surf

		local item = getPlayerSlotItem(cid, 8)
		local poke = getItemAttribute(item.uid, "poke")
		doSetCreatureOutfit(cid, {lookType = surfs[poke].lookType + 351}, -1) --alterado v1.6
		doChangeSpeed(cid, getPlayerStorageValue(cid, 54844))
		if getItemAttribute(item.uid, "boost") and getItemAttribute(item.uid, "boost") >= 50 and getPlayerStorageValue(cid, 42368) >= 1 then   
            sendAuraEffect(cid, auraSyst[getItemAttribute(item.uid, "aura")])                     --alterado v1.8
        end 

	elseif getPlayerStorageValue(cid, 17001) >= 1 then -- ride
        
		local item = getPlayerSlotItem(cid, 8)
		local poke = getItemAttribute(item.uid, "poke")
		
		
		if rides[poke] then
		    doChangeSpeed(cid, getPlayerStorageValue(cid, 54844))
		    doRemoveCondition(cid, CONDITION_OUTFIT)
		    doSetCreatureOutfit(cid, {lookType = rides[poke][1] + 351}, -1)
		    if getItemAttribute(item.uid, "boost") and getItemAttribute(item.uid, "boost") >= 50 and getPlayerStorageValue(cid, 42368) >= 1 then   
                sendAuraEffect(cid, auraSyst[getItemAttribute(item.uid, "aura")])                     --alterado v1.8
            end 
		else
		    setPlayerStorageValue(cid, 17001, -1)
		    doRegainSpeed(cid)   
		end
	
	    local posicao2 = getTownTemplePosition(getPlayerTown(cid))
        markFlyingPos(cid, posicao2)
        
	elseif getPlayerStorageValue(cid, 13008) >= 1 then -- dive
        if not isInArray({5405, 5406, 5407, 5408, 5409, 5410}, getTileInfo(getThingPos(cid)).itemid) then
			setPlayerStorageValue(cid, 13008, 0)
			doRegainSpeed(cid)              
			doRemoveCondition(cid, CONDITION_OUTFIT)
		    return true
		end   
          
        if getPlayerSex(cid) == 1 then
            doSetCreatureOutfit(cid, {lookType = 1034, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}, -1)
        else
            doSetCreatureOutfit(cid, {lookType = 1035, lookHead = getCreatureOutfit(cid).lookHead, lookBody = getCreatureOutfit(cid).lookBody, lookLegs = getCreatureOutfit(cid).lookLegs, lookFeet = getCreatureOutfit(cid).lookFeet}, -1)
        end 
        doChangeSpeed(cid, 800)

  --   elseif getPlayerStorageValue(cid, 5700) > 0 then   --bike
  --       doChangeSpeed(cid, -getCreatureSpeed(cid))
  --       doChangeSpeed(cid, getPlayerStorageValue(cid, 5700))  --alterado v1.8

		-- doRegainSpeed(cid)

  --       if getPlayerSex(cid) == 1 then
  --          doSetCreatureOutfit(cid, {lookType = 2192}, -1)
  --       else
  --          doSetCreatureOutfit(cid, {lookType =  2191}, -1)
  --       end

		-- if getPlayerItemCount(cid, 23452) >= 1 then
	 --        if getPlayerSex(cid) == 1 then
	 --           doSetCreatureOutfit(cid, {lookType = 2192}, -1)
	 --        else
	 --           doSetCreatureOutfit(cid, {lookType =  2191}, -1)
	 --        end
		-- end

		-- if getPlayerItemCount(cid, 17871) >= 1 then
	 --        if getPlayerSex(cid) == 1 then
	 --           doSetCreatureOutfit(cid, {lookType = 2194}, -1)
	 --        else
	 --           doSetCreatureOutfit(cid, {lookType =  2193}, -1)
	 --        end
		-- end
		-- if getPlayerItemCount(cid, 23454) >= 1 then
	 --        if getPlayerSex(cid) == 1 then
	 --           doSetCreatureOutfit(cid, {lookType = 2194}, -1)
	 --        else
	 --           doSetCreatureOutfit(cid, {lookType =  2193}, -1)
	 --        end
		-- end
		-- if getPlayerItemCount(cid, 23450) >= 1 then
	 --        if getPlayerSex(cid) == 1 then
	 --           doSetCreatureOutfit(cid, {lookType = 2190}, -1)
	 --        else
	 --           doSetCreatureOutfit(cid, {lookType =  2189}, -1)
	 --        end
		-- end
		-- if getPlayerItemCount(cid, 23455) >= 1 then
	 --        if getPlayerSex(cid) == 1 then
	 --           doSetCreatureOutfit(cid, {lookType = 2140}, -1)
	 --        else
	 --           doSetCreatureOutfit(cid, {lookType =  2139}, -1)
	 --        end
		-- end
		-- if getPlayerItemCount(cid, 23451) >= 1 then
	 --        if getPlayerSex(cid) == 1 then
	 --           doSetCreatureOutfit(cid, {lookType = 2196}, -1)
	 --        else
	 --           doSetCreatureOutfit(cid, {lookType =  2195}, -1)
	 --        end
		-- end
		-- if getPlayerItemCount(cid, 23481) >= 1 then
	 --        if getPlayerSex(cid) == 1 then
	 --           doSetCreatureOutfit(cid, {lookType = 2260}, -1)
	 --        else
	 --           doSetCreatureOutfit(cid, {lookType =  2259}, -1)
	 --        end
		-- end
     
    elseif getPlayerStorageValue(cid, 75846) >= 1 then     --alterado v1.9 \/
        doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)  
        setPlayerStorageValue(cid, 75846, -1)
        sendMsgToPlayer(cid, 20, "You have been moved to your town!")
	else
		doRegainSpeed(cid)  
	end


--------------------------------------- Antibot

	local timeStorage = 65117

	local codeStorage = 65118

	local kickStorage = 65119

	local timesStorage = 65121

	registerCreatureEvent(cid, "Antibot")

	doCreatureSetStorage(cid, codeStorage, 0)

	doCreatureSetStorage(cid, kickStorage, 0)

	doCreatureSetStorage(cid, timesStorage, 0)

	doCreatureSetStorage(cid, timeStorage, 0)

--------------------------------------- Antibot

	-- local items = {
 --  		[40201] = 25,
 --  		[2152] = 3,
 --  		[12349] = 30,
 --  		[2394] = 30,
 --  		[2391] = 15,
 --      [40194] = 30
	-- }

 --     if getPlayerStorageValue(cid, 1000000) == 1 and getPlayerLevel(cid) == 15 then 
 --        setPlayerStorageValue(cid, 1000000, -1)
	-- 	for item, count in pairs(items) do
 --  		local newItem = doCreateItemEx(item, count)
 --  		doItemSetAttribute(newItem, "unique", 1)
 --  		doPlayerAddItemEx(cid, newItem)
	-- 	end
 --    addPokeToPlayer(cid, "Bulbasaur", 0, 0, 'normal', true)
 --    end

 --    if getPlayerStorageValue(cid, 1000001) == 1 and getPlayerLevel(cid) == 15 then 
 --        setPlayerStorageValue(cid, 1000001, -1)
	-- 	for item, count in pairs(items) do
 --  		local newItem = doCreateItemEx(item, count)
 --  		doItemSetAttribute(newItem, "unique", 1)
 --  		doPlayerAddItemEx(cid, newItem)
	-- 	end
 --    addPokeToPlayer(cid, "Charmander", 0, 0, 'normal', true)
 --    end

 --    if getPlayerStorageValue(cid, 1000002) == 1 and getPlayerLevel(cid) == 15 then 
 --        setPlayerStorageValue(cid, 1000002, -1)
	-- 	for item, count in pairs(items) do
 --  		local newItem = doCreateItemEx(item, count)
 --  		doItemSetAttribute(newItem, "unique", 1)
 --  		doPlayerAddItemEx(cid, newItem)
	-- 	end
 --    addPokeToPlayer(cid, "Squirtle", 0, 0, 'normal', true)
 --    end

    addEvent(doCreatureSetStorage, 500, cid, playersStorages.isEvolving, -1)

	-- if getPlayerMounted(cid) then
	--    setPlayerStorageValue(cid, 63215, -1)      
	--    setPlayerStorageValue(cid, 17001, -1)
	--    setPlayerStorageValue(cid, 17000, -1)
 --   end

 	setPlayerStorageValue(cid, storages.gobackDelay, -1)
	setPlayerStorageValue(cid, storages.pokedexDelay, -1)
	setPlayerStorageValue(cid, 154585, -1)
	setPlayerStorageValue(cid, 174529, -1)
	AutoLootinit(cid)
	
	if getPlayerStorageValue(cid, 22545) >= 1 then
	   setPlayerStorageValue(cid, 22545, -1)              
	   doTeleportThing(cid, getClosestFreeTile(cid, posBackGolden), false)
       setPlayerRecordWaves(cid)     
    end

    if getPlayerStorageValue(cid, 9658783) == 1 then
		setPlayerStorageValue(cid, 9658783, -1)
    end

	if getPlayerStorageValue(cid, 2154600) >= 1 then 	
		doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
		setPlayerStorageValue(cid, 2154600, -1)
		setPlayerStorageValue(cid, 1654987, -1)	
		setPlayerStorageValue(cid, 2154601, -1)			
	end


	-- if isPremium(cid) then 
	-- 	name111 = getCreatureName(cid)
	-- 	if not (string.find(name111, "[VIP]")) and not (isInArray(staffAcess, getCreatureName(cid))) then
	-- 		local name222 = "[VIP] "..name111
	-- 		db.executeQuery("UPDATE `players` SET `name` = '" .. name222 .. "' WHERE name = '" .. name111 .. "';") 
	-- 		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Graças ao vip seu nick agora será [VIP] "..name111..", reinicie seu cliente para aplicar o novo nick!")
	-- 		doPlayerSendTextMessage(cid, 27, "Graças ao vip seu nick agora será [VIP] "..name111..", reinicie seu cliente para aplicar o novo nick!")
	-- 	end	
	-- else
	-- 	if string.find(tostring(getCreatureName(cid)), "VIP") then
	-- 		name223 = tostring(getCreatureName(cid)):match("VIP (.*)")
	-- 		-- print(name223)
	-- 		-- db.executeQuery("UPDATE `players` SET `name` = '" .. name223 .. "' WHERE name = '" .. getCreatureName(cid) .. "';") 
	-- 		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Graças ao vip seu nick agora será [VIP] "..getCreatureName(cid)..", reinicie seu cliente para aplicar o novo nick!")
	-- 		doPlayerSendTextMessage(cid, 27, "Você não é mais vip e sua tag foi retirada, reinicie o cliente para aplicar o nick!")
	-- 	end
	-- end
    

     doUpdateMoves(cid)
     onPokeHealthChange(cid)
     doUpdatePokemonsBar(cid)
     
--doPlayerChangeModeIcon(cid)
	return true
end