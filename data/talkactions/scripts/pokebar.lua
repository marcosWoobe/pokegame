local EFFECTS = {
--[OutfitID] = {Effect}
["Clefable"] = 32,
["Shiny Clefable"] = 32,
["Snorlax"] = 32,
["Shiny Snorlax"] = 32,
["Chansey"] = 32,
["Blissey"] = 32,
["Togekiss"] = 32,
["Shiny Togekiss"] = 32,
["Black Togekiss"] = 32,
}

local GANHARHP = {
--[OutfitID] = {Effect}
["Roserade"] = 14,
["Shiny Roserade"] = 14,
["Vileplume"] = 14,
["Shiny Vileplume"] = 14,
["Bellossom"] = 14,
["Mothim"] = 14,
["Drapion"] = 14,
["Shiny Drapion"] = 14,
["Chansey"] = 14,
["Staryu"] = 14,
["Starmie"] = 14,
["Corsola"] = 14,
["Blissey"] = 14,
["Celebi"] = 14,
["Roselia"] = 14,
["Swablu"] = 14,
["Altaria"] = 14,
["Budew"] = 14,
["Happiny"] = 14,
["Shaymin"] = 14,
}

local store = 23589 -- storage q salva o delay
local delay = 2 -- tempo em segundos de delay

local function volta(cid, init)
	if getPlayerSlotItem(cid, CONST_SLOT_FEET).uid > 0 then
		local item = getPlayerSlotItem(cid, CONST_SLOT_FEET)
		-- local store = 23589 -- storage q salva o delay
		-- local delay = 1 -- tempo em segundos de delay
		
		-- if exhaustion.get(cid, 6666) and exhaustion.get(cid, 6666) > 0 then return true end

    	if item.itemid == 2219 then
       		doPlayerRemoveItem(cid, 2219, 1)
    	end  

    	if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1 or getPlayerStorageValue(cid, 63215) >= 1 
    	or getPlayerStorageValue(cid, 75846) >= 1 then--or getPlayerStorageValue(cid, 5700) >= 1  then    --alterado v1.9 <<
        	return true                                                                                                                        
   		end

    	local ballName = getItemAttribute(item.uid, "poke")
    	local btype = getPokeballType(item.itemid)

	    if btype == "none" then 
	    	btype = getPokeballTypeOld(item.itemid)
	    end

    	if btype == "none" then 
    		return true
    	end

	    if pokeballs[btype] then
	    	pokeballsAloalo = pokeballs[btype]
	    else
	    	pokeballsAloalo = pokeballsOLD[btype]
	    end

    	local usando = pokeballsAloalo.use

    	local effect = pokeballsAloalo.effect
		if not effect then
			effect = 21
		end
	
    	if not getItemAttribute(item.uid, "tadport") and ballName then
        	doItemSetAttribute(item.uid, "tadport", fotos[ballName])
    	end
	
    	unLock(item.uid) --alterado v1.8


        if item.itemid == usando then

	        if getPlayerStorageValue(cid, 990) == 1 then -- GYM
		        doPlayerSendCancel(cid, "You can't return your pokemon during gym battles.")
	            return true
	        end
		
	        if #getPlayerPokemons(cid) > 1 and getPlayerStorageValue(cid, 212124) <= 0 then     --alterado v1.6
                if getPlayerStorageValue(cid, 637501) == -2 or getPlayerStorageValue(cid, 637501) >= 1 then  
                    BackTeam(cid)       
                end
            end   
		
            if #getPlayerPokemons(cid) == 2 and getPlayerStorageValue(cid, 212124) >= 1 then
                doPlayerSendCancel(cid, "You can't do that while is controling a mind")
                return true     --alterado v1.5
            end
		
            if #getPlayerPokemons(cid) <= 0 then
		        if isInArray(pokeballsAloalo.all, item.itemid) then
			        doTransformItem(item.uid, pokeballsAloalo.off)
			        doItemSetAttribute(item.uid, "hp", 0)
			        doItemSetAttribute(item.uid, "moveBallT", "fainted")
			        doPlayerSendCancel(cid, "This pokemon is fainted.")
		            return true
		        end
	        end

            local cd = getCD(item.uid, "blink", 30)
            if cd > 0 then
                setCD(item.uid, "blink", 0)
            end
    
            --[[	if getItemAttribute(item.uid, "poke"):find("Mega") then
                local normalPoke = megaEvolutions[getItemAttribute(item.uid, "megaStone")][1]
                if normalPoke then
                    doItemSetAttribute(item.uid, "poke", normalPoke)
                end
            end]]
	
	        if getItemAttribute(item.uid, "heldy") and getItemAttribute(item.uid, "heldy") == 4000 then
	            local backMega = megaEvolutions[getItemAttribute(item.uid, "heldy")]
		        if backMega then
		            doItemSetAttribute(item.uid, "poke", backMega[1])
		        end
	        end
	
	        local z = getPlayerPokemons(cid)[1]

	        if getCreatureCondition(z, CONDITION_INVISIBLE) and not isGhostPokemon(z) then
	            return true
	        end

	        doReturnPokemon(cid, z, item, effect)
	        -- setPlayerStorageValue(cid, store, os.time() + delay)
		end
		
        if init then
            if item.itemid == pokeballsAloalo.on then

	            if item.uid ~= getPlayerSlotItem(cid, CONST_SLOT_FEET).uid then
		            doPlayerSendCancel(cid, "You must put your pokeball in the correct place!")
		            doItemSetAttribute(item.uid, "moveBallT", "fainted")
			        if getItemAttribute(item.uid, "heldy") and getItemAttribute(item.uid, "heldy") == 4000 then
	                    local backMega = megaEvolutions[getItemAttribute(item.uid, "heldy")]
		                if backMega then
		                    doItemSetAttribute(item.uid, "poke", backMega[1])
		                end
	                end
	                return true 
	            end

	            local thishp = getItemAttribute(item.uid, "hp")

	            if thishp <= 0 then
		            if isInArray(pokeballsAloalo.all, item.itemid) then
			            doTransformItem(item.uid, pokeballsAloalo.off)
			            doItemSetAttribute(item.uid, "hp", 0)
			            doPlayerSendCancel(cid, "This pokemon is fainted.")
		                return true
		            end
	            end

	            local pokemon = getItemAttribute(item.uid, "poke")

	            if not pokes[pokemon] then
	                return true
	            end

                ----------------------- Sistema de nao poder carregar mais que 3 pokes lvl baixo e + q 1 poke de lvl medio/alto ---------------------------------
                if not isInArray({5, 6}, getPlayerGroupId(cid)) then
                    local balls = getPokeballsInContainer(getPlayerSlotItem(cid, 3).uid)
                    local low = {}
                    local lowPokes = {"Rattata", "Caterpie", "Weedle", "Oddish", "Pidgey", "Paras", "Poliwag", "Bellsprout", "Magikarp", "Hoppip", "Sunkern"}
                    if #balls >= 1 then
                        for _, uid in ipairs(balls) do
                            local nome = getItemAttribute(uid, "poke")
                            if not isInArray(lowPokes, pokemon) and nome == pokemon then
                                return doPlayerSendTextMessage(cid, 27, "Sorry, but you can't carry two pokemons equals!")
                            else
                                if nome == pokemon then
                                    table.insert(low, nome)
                                end
                            end
                        end
                    end
                    if #low >= 3 then
                        return doPlayerSendTextMessage(cid, 27, "Sorry, but you can't carry more than three pokemons equals of low level!")
                    end   
                end
                ---------------------------------------------------------------------------------------------------------------------------------------------------

	            local x = pokes[pokemon]
	            local boost = getItemAttribute(item.uid, "boost") or 0
	            local level = getItemAttribute(item.uid, "level") or 0
				doItemSetAttribute(item.uid, "boost", boost)

	            if not isInArray({5, 6}, getPlayerGroupId(cid)) and getPlayerLevel(cid) < (x.level+boost) then
	                doPlayerSendCancel(cid, "You need level "..(x.level+boost).." to use this pokemon.")
	                return true
	            end
	
	            ---------------------------- Sistema pokes de clan --------------------------------------
	            local shinysClan = {
	                ["Shiny Fearow"] = {4, "Wingeon"},
	                ["Shiny Flareon"] = {1, "Volcanic"},
	                ["Shiny Vaporeon"] = {2, "Seavel"}, 
	                ["Shiny Jolteon"] = {9, "Raibolt"},
	                ["Shiny Hypno"] = {7, "Psycraft"},           
	                ["Shiny Golem"] = {3, "Orebound"},
	                ["Shiny Vileplume"] = {8, "Naturia"},
	                ["Shiny Nidoking"] = {5, "Malefic"},
	                ["Shiny Hitmontop"] = {6, "Gardestrike"},   --alterado v1.4
	            }
	
	            if shinysClan[pokemon] and (getPlayerGroupId(cid) < 4 or getPlayerGroupId(cid) > 6) then  --alterado v1.9 \/
	                if getPlayerClanNum(cid) ~= shinysClan[pokemon][1] then
	                    doPlayerSendCancel(cid, "You need be a member of the clan "..shinysClan[pokemon][2].." to use this pokemon!")
	                    return true   
                    elseif getPlayerClanRank(cid) ~= 5 then
                        doPlayerSendCancel(cid, "You need be atleast rank 5 to use this pokemon!")
	                    return true
                    end
                end
                --------------------------------------------------------------------------------------

			    local masterPosition = getCreaturePosition(cid)
			    local destPos = (getPlayerMounted(cid) and masterPosition or getPositionRandomAdjacent(masterPosition, 2,
			        function(tmpPos) return isSightClear(masterPosition, tmpPos, false, true) and isWalkable22(cid, tmpPos) end))

			    if (not destPos) then
			        destPos = masterPosition
			    end

			    local ball = getPlayerSlotItem(cid, 8)
			    local pokemonName = getItemAttribute(ball.uid, "poke")
			    local nickname = getItemAttribute(ball.uid, "nick")
			    
			    if (doSummonMonster(cid, pokemonName, nickname ~= "" and nickname or pokemonName, false, destPos) ~= RETURNVALUE_NOERROR) then -- try to summon around the player, otherwise force to summon on player position
	              doSummonMonster(cid, pokemonName, nickname ~= "" and nickname or pokemonName, true) -- forced
	            end

	            local pk = getPlayerPokemons(cid)[1]
	            
			    -- addEvent(function()
			    --     if (isCreature(pk)) then
			    --         doSendCreatureEffect(pk, CREATURE_EFFECTS.RED_FADE_IN)
			    --     end
			    -- end, 10)
			    -- local pokemonPosition = getCreaturePosition(pk)
			    -- doSendDistanceShoot(getCreaturePosition(cid), pokemonPosition, balls["poke"].projectile)
			    -- addEvent(function()
			    --     if (isCreature(pk)) then
			    -- 		doSendProjectile(pokemonPosition, cid, balls["poke"].projectile)
			    --     end
			    -- end, 500)
			    setPlayerStorageValue(cid, 23592, os.time() + 3)
			    -- setPlayerStorageValue(cid, store, os.time() + delay)

	            if not isCreature(pk) then return true end

	            -- setPlayerStorageValue(pk, 1500022, boost)
	            -- setPlayerStorageValue(pk, 1802, level)
	            -- doCreatureSetSkullType(pk, 10)
	
	            ------------------------passiva hitmonchan------------------------------
	            if isSummon(pk) then                                                  --alterado v1.8 \/
                    if pokemon == "Shiny Hitmonchan" or pokemon == "Hitmonchan" then
                        if not getItemAttribute(item.uid, "hands") then
                            doSetItemAttribute(item.uid, "hands", 0)
                        end
                        local hands = getItemAttribute(item.uid, "hands")
                        doSetCreatureOutfit(pk, {lookType = hitmonchans[pokemon][hands].out}, -1)
                    end
                end
	            -------------------------------------------------------------------------
                ---------movement magmar, jynx-------------
                if EFFECTS[getCreatureName(pk)] then             
                    markPosEff(pk, getThingPos(pk))
                    sendMovementEffect(pk, EFFECTS[getCreatureName(pk)], getThingPos(pk))  
                end
                --------------------------------------------------------------------------      


	            -- if isGhostPokemon(pk) then 
				    -- doTeleportThing(pk, getPosByDir(getThingPos(cid), math.random(0, 7)), false)
				-- end

	            doCreatureSetLookDir(pk, 2) 

	            adjustStatus(pk, item.uid, true, true, true)
	            doRegenerateWithY(getCreatureMaster(pk), pk)
	            doCureWithY(getCreatureMaster(pk), pk)

	            --doTransformItem(item.uid, item.itemid+1)
	            doTransformItem(item.uid, pokeballsAloalo.use)
	
	            doItemSetAttribute(item.uid, "moveBallT", "use")

	            -- temGhostMix(cid, (getPlayerSlotItem(cid, 8)))
	            -- temAuraMix(cid, item)

	            local pokename = getPokeName(pk) --alterado v1.7 

	            local mgo = gobackmsgs[math.random(1, #gobackmsgs)].go:gsub("doka", pokename)
	            doCreatureSay(cid, mgo, TALKTYPE_MONSTER)
    
				if getItemAttribute(item.uid, "ballorder") then
				        doPlayerSendCancel(cid, "KGT,"..getItemAttribute(item.uid, "ballorder").."|".."0")
				        doPlayerSendCancel(cid, "")
				end
    
	            doSendMagicEffect(getCreaturePosition(pk), effect) 

	            -- setPlayerStorageValue(cid, store, os.time() + delay)
				doUpdatePokeInfo(cid)
				doPokeInfoAttr(cid)
	
	            if useOTClient then
	                doPlayerSendCancel(cid, '12//,show') --alterado v1.7
                end
            end
	    end 
        if useKpdoDlls then
			doUpdateMoves(cid)
		end
        return true
	end
	
	if useKpdoDlls then
		doUpdateMoves(cid)
	end
end

function onSay(cid, words, param, channel)

		if getPlayerStorageValue(cid, store) > os.time() then
			doPlayerSendCancel(cid, "Você tem que esperar ".. getPlayerStorageValue(cid, store) - os.time() .." segundo(s) para usar novamente.")
			doSendMagicEffect(getPlayerPosition(cid), 2)
			return true
		end 

		if isEvolving(cid) then
		    doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		    return true
		end	

	    if getPlayerStorageValue(cid, 9658783) == 1 then
	        return true
	    end

		if getPlayerMounted(cid) then
		    doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		    return true
		end	

		if getPlayerSlotItem(cid, CONST_SLOT_FEET).uid > 0 then
			if getItemAttribute(getPlayerSlotItem(cid, CONST_SLOT_FEET).uid, "ballorder") == tonumber(param) then
	            doUsePokemon(cid)
	    		return true
			else
				volta(cid, false)
			end
		end

		addEvent(function()
		doMoveBar(cid, tonumber(param))
	    volta(cid, true)
		end, 400)
		setPlayerStorageValue(cid, store, os.time() + delay)

	return true
end