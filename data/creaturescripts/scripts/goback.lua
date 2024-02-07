function onLogout(cid)
  if not isCreature(cid) then return true end    

	if getPlayerCurrentGuardian(cid) then
	    doPlayerSetStorageValue(cid, 9005, exhaustion.get(getPlayerCurrentGuardian(cid), 11))
	    doPlayerSetStorageValue(cid, 9006, getCreatureName(getPlayerCurrentGuardian(cid)))
	    doRemoveCreature(getPlayerCurrentGuardian(cid))
	    return true
	end
  
	local thisitem = getPlayerSlotItem(cid, 8)
	
	if thisitem.uid <= 0 then return true end
	
	local ballName = getItemAttribute(thisitem.uid, "poke")
    local btype = getPokeballType(thisitem.itemid)
    
    ---------------------------------------------------------------
    if #getCreatureSummons(cid) > 1 and getPlayerStorageValue(cid, 212124) <= 0 then    --alterado v1.6
       if getPlayerStorageValue(cid, 637501) == -2 or getPlayerStorageValue(cid, 637501) >= 1 then  
          BackTeam(cid)       
       end
    end
	
	if getPlayerStorageValue(cid, 10000) ~= -1 then
		setPlayerStorageValue(cid, 10000, -1)
	end
    --////////////////////////////////////////////////////////////////////////////////////////--
    --[[if getPlayerStorageValue(cid, 52480) >= 1 and getPlayerStorageValue(cid, 52481) >= 0 then 
       doEndDuel(cid)
    end]]
    --////////////////////////////////////////////////////////////////////////////////////////--
    if #getCreatureSummons(cid) == 2 and getPlayerStorageValue(cid, 212124) >= 1 then
       local cmed2 = getCreatureSummons(cid)[1]
	   local poscmed = getThingPos(cmed2)
	   local cmeddir = getCreatureLookDir(cmed2)
	   local namecmed = getCreatureName(cmed2)
	   local hp, maxHp = getCreatureHealth(getCreatureSummons(cid)[1]), getCreatureMaxHealth(getCreatureSummons(cid)[1])
	   -- local gender = getPokemonGender(cmed2) 
       doRemoveCreature(getCreatureSummons(cid)[1])
	   local back = doCreateMonster(namecmed, poscmed)
	   -- addEvent(doCreatureSetSkullType, 150, back, gender)
	   doCreatureSetLookDir(back, cmeddir)
	   addEvent(doCreatureAddHealth, 100, back, hp-maxHp)
                                                                            
       -- pokemon controlador	
       local ball2 = getPlayerSlotItem(cid, 8)
       local mynewpos = getThingPos(getCreatureSummons(cid)[1])
       doRemoveCreature(getCreatureSummons(cid)[1])
       local pk2 = doSummonCreature(getItemAttribute(ball2.uid, "poke"), mynewpos) 
       doConvinceCreature(cid, pk2)
       addEvent(doAdjustWithDelay, 100, cid, pk2, true, true, false)
       setPlayerStorageValue(cid, 888, -1)    
       cleanCMcds(ball2.uid)
       doCreatureSetLookDir(getCreatureSummons(cid)[1], 2)
       registerCreatureEvent(pk2, "SummonDeath")   
    end
    
    ----------------------------------------------------------------------
    local summon = getCreatureSummons(cid)[1]      
      
	if #getCreatureSummons(cid) >= 1 and thisitem.uid > 1 then
	    if getPlayerStorageValue(cid, 212124) <= 0 then
		   doItemSetAttribute(thisitem.uid, "hp", (getCreatureHealth(summon) / getCreatureMaxHealth(summon)))
        end                                                          
        setPlayerStorageValue(cid, 212124, 0)
        doTransformItem(thisitem.uid, pokeballs[btype].on)
		doItemSetAttribute(thisitem.uid, "moveBallT", "on")
		doUpdatePokemonsBar(cid)
		doSendMagicEffect(getThingPos(summon), pokeballs[btype].effect)
		doRemoveCreature(summon)
	end

	if getCreatureOutfit(cid).lookType == 814 then
		doPlayerStopWatching(cid)
	end

	if tonumber(getPlayerStorageValue(cid, 17000)) and getPlayerStorageValue(cid, 17000) >= 1 then  
		markFlyingPos(cid, getThingPos(cid))
	end
	
	if getPlayerStorageValue(cid, 22545) == 1 then     
	   setGlobalStorageValue(22550, getGlobalStorageValue(22550)-1)
	   if getGlobalStorageValue(22550) <= 0 then
          endGoldenArena()          
       end 
    end

    if (isPokemonOnline(cid)) then
        local pokemon = getPlayerPokemon(cid)
        if (isCreature(pokemon)) then
            local ball = getPlayerBall(cid)
            if (isItem(ball)) then
                setBallPokemonLastHp(ball.uid, getCreatureHealth(pokemon))
                doTransformItem(ball.uid, balls[ballsNames[ball.itemid]].charged)
                setBallPokemonEnergy(ball.uid, getPlayerMana(cid))
            end
            doRemoveCreature(pokemon)
        end
        doCreatureSetStorage(cid, playersStorages.isPokemonOnline, 0)
    end
    doPlayerRemoveFrontierBalls(cid)

    local guid = getPlayerGUID(cid)
    -- if (isTutor(cid) and ONLINE_TUTORS[getPlayerGUID(cid)]) then
    --     ONLINE_TUTORS[guid] = nil
    -- end
	  
    for i, ball in ipairs(getPlayerAllBallsWithPokemon(cid)) do
        if (i > 6) then
            break
        end

        db.executeQuery(string.concat("INSERT INTO `player_pokemon` (`player_id`, `slot`, `pokemon_number`, `description`) VALUES('",
            guid, "', '", i, "', '", getPokemonNumberByName(getBallPokemonName(ball.uid)), "', '", getItemSpecialDescription(ball.uid), "') ON DUPLICATE KEY UPDATE `pokemon_number`='",
            getPokemonNumberByName(getBallPokemonName(ball.uid)), "', `description`='", getItemSpecialDescription(ball.uid), "' ;"))
    end

	-- local day = DailyRewards:getDay()
	-- local rewards = DailyRewards:getRewards(cid)
	  
	-- if rewards[day] == "0" then
	-- 	DailyRewards:setTimeWait(cid)
	-- end

return TRUE
end

local deathtexts = {"Oh no! POKENAME, come back!", "Come back, POKENAME!", "That's enough, POKENAME!", "You did well, POKENAME!",
		    "You need to rest, POKENAME!", "Nice job, POKENAME!", "POKENAME, you are too hurt!"}

function onDeath(cid, deathList)

	local owner = getCreatureMaster(cid)

    if getPlayerStorageValue(cid, 637500) >= 1 then
        doSendMagicEffect(getThingPos(cid), 211)
        doRemoveCreature(cid)
        return true
    end
        
    if getPlayerStorageValue(cid, 212123) >= 1 then
        return true
    end
        
	if not isPlayer(owner) then--or isPlayer(deathList[1]) and deathList[1] == cid then
	    return true
	end
    --////////////////////////////////////////////////////////////////////////////////////////--
    checkDuel(owner)                                                                          
    --////////////////////////////////////////////////////////////////////////////////////////--
        
	local thisball = getPlayerSlotItem(owner, 8)
	local ballName = getItemAttribute(thisball.uid, "poke")
	--[[if ballName:find("Mega ") then
    	ballName = megaEvolutions[getItemAttribute(thisball.uid, "megaStone")][1]
    	doItemSetAttribute(thisball.uid, "poke", ballName)
	end]]
	local isMegaAttr = getItemAttribute(thisball.uid, "heldy")
	if not isMegaAttr or isMegaAttr and not megaEvolutions[isMegaAttr] then
	    isMegaAttr = getItemAttribute(thisball.uid, "heldx")
	end
	if isMegaAttr and megaEvolutions[isMegaAttr] then
	    local backMega = megaEvolutions[isMegaAttr]
		if backMega then
		    doItemSetAttribute(thisball.uid, "poke", backMega[1])
		end
	end
	
    btype = getPokeballType(thisball.itemid)

    if btype == "none" then 
    	btype = getPokeballTypeOld(thisball.itemid)
    end

    if #getCreatureSummons(owner) > 1 then
       BackTeam(owner, getCreatureSummons(owner))      
    end

	doSendMagicEffect(getThingPos(cid), pokeballs[btype].effect)
    doTransformItem(thisball.uid, pokeballs[btype].off)
	doItemSetAttribute(thisball.uid, "moveBallT", "fainted")
	doItemSetAttribute(thisball.uid, "hp", 0)
	doUpdatePokemonsBar(cid)

	doPlayerSendTextMessage(owner, 22, "Your pokemon fainted.")

	local say = deathtexts[math.random(#deathtexts)]
		say = string.gsub(say, "POKENAME", getCreatureName(cid))

	if getPlayerStorageValue(cid, 33) <= 0 then
		doCreatureSay(owner, say, TALKTYPE_SAY)
	end

	-- doItemSetAttribute(thisball.uid, "hp", 0)
	
	-- if ehMonstro(deathList[1]) then
	--   doItemSetAttribute(thisball.uid, "happy", getPlayerStorageValue(cid, 1008) - happyLostOnDeath)
    -- end
	--doItemSetAttribute(thisball.uid, "hunger", getPlayerStorageValue(cid, 1009))

   	if getItemAttribute(thisball.uid, "ballorder") then
   		doPlayerSendCancel(owner, "pGS,".."0".."|"..getItemAttribute(thisball.uid, "ballorder").."|"..getPokeName(cid))
	end
   	doPlayerSendCancel(owner, '12//,hide')      --alterado v1.7
   	-- doPlayerSendCancel(owner, "")
    
	doUpdateMoves(cid)
	-- doSendPlayerExtendedOpcode(cid, 111, "sair")
	doSendPlayerExtendedOpcode(cid, 82, "h")
	doRemoveCreature(cid)

return false
end