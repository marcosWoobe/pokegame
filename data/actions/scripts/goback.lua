local EFFECTS = {
	--[OutfitID] = {Effect}
	["Magmar"] = 35,   
	["Shiny Magmar"] = 35,
    ["Shiny Magmortar"] = 35,
    ["Shiny Electivire"] = 48,
    ["Magmortar"] = 35,
    ["Electivire"] = 48,	
	["Jynx"] = 17,          --alterado v1.5
	["Shiny Jynx"] = 17, 
    ["Piloswine"] = 205,  --alterado v1.8
    ["Swinub"] = 205,    
}

function onUse(cid, item, frompos, item2, topos)
local store = 23589 -- storage q salva o delay
local delay = 2 -- tempo em segundos de delay
-- if getPlayerStorageValue(cid, store) - os.time() <= 0 then

    if exhaustion.get(cid, 6666) and exhaustion.get(cid, 6666) > 0 then return true end
	
	if isEvolving(cid) then
	    doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
	    return true
	end	

	if getPlayerMounted(cid) then
	    doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
	    return true
	end	

    if getPlayerStorageValue(cid, 9658783) == 1 then
        return true
    end

	local natureList = {"Hardy", "Lonely", "Brave", "Adamant", "Bold", "Docile", "Relaxad", "Impish", "Modest", "Mild", "Quiet", "Bashful", "Quirky", "Timid", "Hasty", "Serius", "Jolly"}
	local nature = natureList[math.random(#natureList)]
	if not getItemAttribute(item.uid, "nature") then
	    doSetItemAttribute(item.uid, "nature", nature)
	end
	
	if not getItemAttribute(item.uid, "iv") then
	    doSetItemAttribute(item.uid, "iv", math.random(31))
	end
	
	if not getItemAttribute(item.uid, "ev") then
	    doSetItemAttribute(item.uid, "ev", 0)
	end
	
	-- if getCreatureName(cid) == "Mixlort" then
	--     for i=1, 100 do
	-- 	    doSetItemAttribute(item.uid, "viktor"..i.."lin"..i, 1)
	-- 	end
	-- 	doPlayerSendTextMessage(cid, 27, "gostosao")
	-- end
	
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
	
	local boost = getItemAttribute(item.uid, "boost") or 0
	local heldx = getItemAttribute(item.uid, "heldx") or 0
	local heldy = getItemAttribute(item.uid, "heldy") or 0
	-- if not getItemAttribute(item.uid, "serial") or getSerialInvalid(item.uid) then
	--     if pokes[ballName] then
	--         setSerial(item.uid, ballName, "", boost, heldx, heldy, nature)
	-- 	end
	-- end
	
    unLock(item.uid) --alterado v1.8

    if item.itemid == usando then

	    if getPlayerStorageValue(cid, 990) == 1 then -- GYM
		    doPlayerSendCancel(cid, "You can't return your pokemon during gym battles.")
	        return true
	    end
		
	    if #getCreatureSummons(cid) > 1 and getPlayerStorageValue(cid, 212124) <= 0 then     --alterado v1.6
            if getPlayerStorageValue(cid, 637501) == -2 or getPlayerStorageValue(cid, 637501) >= 1 then  
                BackTeam(cid)       
            end
        end   
		
        if #getCreatureSummons(cid) == 2 and getPlayerStorageValue(cid, 212124) >= 1 then
            doPlayerSendCancel(cid, "You can't do that while is controling a mind")
            return true     --alterado v1.5
        end
		
        if #getCreatureSummons(cid) <= 0 then
		    if isInArray(pokeballsAloalo.all, item.itemid) then
			    doTransformItem(item.uid, pokeballsAloalo.off)
			    doItemSetAttribute(item.uid, "moveBallT", "fainted")
			    doPlayerSendCancel(cid, "This pokemon is fainted.")

			    doItemSetAttribute(item.uid, "hp", 0)
			    doUpdatePokemonsBar(cid)
			    
			    -- doPlayerSendCancel(cid, "teste1")

			 --   	if getItemAttribute(thisball.uid, "ballorder") then
			 --   		doPlayerSendCancel(owner, "pGS,".."0".."|"..getItemAttribute(thisball.uid, "ballorder").."|"..getPokeName(cid))
				-- end
			 --   	doPlayerSendCancel(owner, '12//,hide')      --alterado v1.7
				-- doSendPlayerExtendedOpcode(cid, 111, "sair")
				-- doSendPlayerExtendedOpcode(cid, 82, "h")
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
	    
		local isMegaAttr = getItemAttribute(item.uid, "heldy")
		if not isMegaAttr or isMegaAttr and not megaEvolutions[isMegaAttr] then
		    isMegaAttr = getItemAttribute(item.uid, "heldx")
		end
	    if isMegaAttr and megaEvolutions[isMegaAttr] then
	        local backMega = megaEvolutions[isMegaAttr]
		    if backMega then
		        doItemSetAttribute(item.uid, "poke", backMega[1])
		    end
	    end
	
	    local z = getCreatureSummons(cid)[1]
	    if getCreatureSummons(cid)[2] then
	    	doReturnPokemon(cid, getCreatureSummons(cid)[2], item, effect)
	    end

	    if getCreatureCondition(z, CONDITION_INVISIBLE) and not isGhostPokemon(z) then
	        return true
	    end
	    if not z then return true end

	    if getPlayerStorageValue(cid, store) - os.time() <= 0 then 
	    	doReturnPokemon(cid, z, item, effect)
	    	setPlayerStorageValue(cid, store, os.time() + delay)
	    else
			doPlayerSendCancel(cid, "Você tem que esperar ".. getPlayerStorageValue(cid, store) - os.time() .." segundo(s) para usar novamente.")
			doSendMagicEffect(getPlayerPosition(cid), 2)
		end
	

    elseif item.itemid == pokeballsAloalo.on then

	    if item.uid ~= getPlayerSlotItem(cid, CONST_SLOT_FEET).uid then
		    doPlayerSendCancel(cid, "You must put your pokeball in the correct place!")
		    doItemSetAttribute(item.uid, "moveBallT", "fainted")
			local isMegaAttr = getItemAttribute(item.uid, "heldy")
			if not isMegaAttr or isMegaAttr and not megaEvolutions[isMegaAttr] then
			    isMegaAttr = getItemAttribute(item.uid, "heldx")
			end
			if isMegaAttr and megaEvolutions[isMegaAttr] then
	            local backMega = megaEvolutions[isMegaAttr]
		        if backMega then
		            doItemSetAttribute(item.uid, "poke", backMega[1])
		        end
	        end
	        return true 
	    end

	    local thishp = getItemAttribute(item.uid, "hp")

	    --if thishp <= 0 then mixlort
	    if thishp <= 0 then
		    if isInArray(pokeballsAloalo.all, item.itemid) then
			    doTransformItem(item.uid, pokeballsAloalo.off)
			    doItemSetAttribute(item.uid, "hp", 0)
			    doUpdatePokemonsBar(cid)
			    doPlayerSendCancel(cid, "This pokemon is fainted.")
			    -- doPlayerSendCancel(cid, "teste2")
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

	-- MIXLORT ATIVAR
	-- if pokemon == "Haunter" then
	-- 	doPlayerSendCancel(cid, "Desativado temporariamente.")
	-- 	return true 
	-- end
	
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
			["Shiny Hitmontop"] = {6, "Gardestrike"}, --alterado v1.4
			["Shiny Hitmonlee"] = {6, "Gardestrike"}, --alterado v1.4
			["Shiny Hitmonchan"] = {6, "Gardestrike"}, --alterado v1.4
		}

		if shinysClan[pokemon] and getPlayerGroupId(cid) < 4 then --alterado v1.9 \/
			if getPlayerClanNum(cid) ~= shinysClan[pokemon][1] then
				doPlayerSendCancel(cid, "Você precisa ser membro do clan "..shinysClan[pokemon][2].." para usar esse pokémon!")
				return true 
			elseif getPlayerClanRank(cid) < 2 then
				doPlayerSendCancel(cid, "Você precisa ser rank 2 para usar esse pokémon.")
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
	-- local pokeGender = getItemAttribute(ball.uid, "gender") or 1
	local boostGoBack = getItemAttribute(ball.uid, "boost") or 0
	local levelGoBack = getItemAttribute(ball.uid, "level") or 0


	if (doSummonMonster(cid, pokemonName, nickname ~= "" and nickname or pokemonName, false, destPos) ~= RETURNVALUE_NOERROR) then -- try to summon around the player, otherwise force to summon on player position
	  doSummonMonster(cid, pokemonName, nickname ~= "" and nickname or pokemonName, true) -- forced
	end

	local pk = getCreatureSummons(cid)[1]
	if not isCreature(pk) then return true end

	-- setPlayerStorageValue(pk, 1500022, boostGoBack)
	-- setPlayerStorageValue(pk, 1802, levelGoBack)
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

	-- if isGhostPokemon(pk) then doTeleportThing(pk, getPosByDir(getThingPos(cid), math.random(0, 7)), false) end

	doCreatureSetLookDir(pk, 2) 

	adjustStatus(pk, item.uid, true, true, true)
	doRegenerateWithY(getCreatureMaster(pk), pk)
	doCureWithY(getCreatureMaster(pk), pk)

	--doTransformItem(item.uid, item.itemid+1)
	doTransformItem(item.uid, pokeballsAloalo.use)
	
	doItemSetAttribute(item.uid, "moveBallT", "use")

	local pokename = getPokeName(pk) --alterado v1.7 

	local mgo = gobackmsgs[math.random(1, #gobackmsgs)].go:gsub("doka", pokename)
	doCreatureSay(cid, mgo, TALKTYPE_MONSTER)

	temAuraMix(cid, item)
    
	if getItemAttribute(item.uid, "ballorder") then
	        doPlayerSendCancel(cid, "KGT,"..getItemAttribute(item.uid, "ballorder").."|".."0")
	        doPlayerSendCancel(cid, "")
	end

	--local pokemon = getPlayerPokemon(cid)

    addEvent(function()
        if (isCreature(pk)) then
            doSendCreatureEffect(pk, CREATURE_EFFECTS.RED_FADE_IN)
        end
    end, 10)
    local pokemonPosition = getCreaturePosition(pk)
    doSendDistanceShoot(getCreaturePosition(cid), pokemonPosition, balls["poke"].projectile)

    addEvent(function()
        if (isCreature(pk)) then
    		doSendProjectile(pokemonPosition, cid, balls["poke"].projectile)
        end
    end, 500)

    setPlayerStorageValue(cid, 23592, os.time() + 3)

	doSendMagicEffect(getCreaturePosition(pk), effect) 

	doUpdatePokeInfo(cid)
	doPokeInfoAttr(cid)
	-- setPlayerStorageValue(cid, store, os.time() + delay)

	if useOTClient then
	   doPlayerSendCancel(cid, '12//,show') --alterado v1.7
    end

    local owner = getCreatureMaster(cid)
    doOTCSendPokemonHealth(owner)

    -- doPlayerSendTextMessage(cid, 20, ("sp.atk old: "..getPlayerStorageValue(pk,180211)))
    -- doPlayerSendTextMessage(cid, 20, ("sp.atk: "..getPlayerStorageValue(pk,1005)))

	--doCreatureSetSkullType(pk, 10)
    --doItemSetAttribute(item.uid, "unico", 1)
else

    doPlayerSendCancel(cid, "This pokemon is fainted.")
	doItemSetAttribute(item.uid, "moveBallT", "fainted")
	doItemSetAttribute(item.uid, "hp", 0)
	doUpdatePokemonsBar(cid)
	-- doPlayerSendCancel(cid, "teste3")

end

doUpdateMoves(cid)

-- else
		
-- doPlayerSendCancel(cid, "Você tem que esperar ".. getPlayerStorageValue(cid, store) - os.time() .." segundo(s) para usar novamente.")
-- doSendMagicEffect(getPlayerPosition(cid), 2)
-- end
return true
end