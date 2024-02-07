local skills = specialabilities
local surfborders = {4644, 4645, 4646, 4647, 4648, 4649, 4650, 4651, 4652, 4653, 4654, 4655, 4656, 4657, 4658, 4659, 4660, 4661, 4662, 4663}
local storages = {17000, 63215, 17001, 13008, 5700}   --alterado v1.9 \/
local unfix = {x = 1, y = 1, z = 1}

local config = {
    borders = {
        -- surfX, surfY, deSurfX, deSurfY
        [4644] = { sX = 0, sY = -1, dX = 0, dY = 1 },
        [4645] = { sX = 1, sY = 0, dX = -1, dY = 0 },
        [4646] = { sX = 0, sY = 1, dX = 0, dY = -1 },
        [4647] = { sX = -1, sY = 0, dX = 1, dY = 0 },
        [4648] = { sX = -1, sY = -1, dX = 1, dY = 1 },
        [4649] = { sX = 1, sY = -1, dX = -1, dY = 1 },
        [4650] = { sX = -1, sY = 1, dX = 1, dY = -1 },
        [4651] = { sX = 1, sY = 1, dX = -1, dY = -1 },
        [4652] = { sX = -1, sY = -1, dX = 1, dY = 1 },
        [4653] = { sX = 1, sY = -1, dX = -1, dY = 1 },
        [4654] = { sX = -1, sY = 1, dX = 1, dY = -1 },
        [4655] = { sX = 1, sY = 1, dX = -1, dY = -1 },
        -- Ice borders
        [6627] = { sX = 0, sY = -1, dX = 0, dY = 1 },
        [6628] = { sX = 1, sY = 0, dX = -1, dY = 0 },
        [6629] = { sX = 0, sY = 1, dX = 0, dY = -1 },
        [6630] = { sX = -1, sY = 0, dX = 1, dY = 0 },
        [6634] = { sX = -1, sY = -1, dX = 1, dY = 1 },
        [6633] = { sX = 1, sY = -1, dX = -1, dY = 1 },
        [6632] = { sX = -1, sY = 1, dX = 1, dY = -1 },
        [6631] = { sX = 1, sY = 1, dX = -1, dY = -1 },
        [6635] = { sX = -1, sY = -1, dX = 1, dY = 1 },
        [6636] = { sX = 1, sY = -1, dX = -1, dY = 1 },
        [6638] = { sX = -1, sY = 1, dX = 1, dY = -1 },
        [6637] = { sX = 1, sY = 1, dX = -1, dY = -1 },
        -- Ice borders 2
        [6687] = { sX = 0, sY = -1, dX = 0, dY = 1 },
        [6688] = { sX = 1, sY = 0, dX = -1, dY = 0 },
        [6689] = { sX = 0, sY = 1, dX = 0, dY = -1 },
        [6690] = { sX = -1, sY = 0, dX = 1, dY = 0 },
        -- Ice borders 3
        [6691] = { sX = 0, sY = -1, dX = 0, dY = 1 },
        [6692] = { sX = 1, sY = 0, dX = -1, dY = 0 },
        [6693] = { sX = 0, sY = 1, dX = 0, dY = -1 },
        [6694] = { sX = -1, sY = 0, dX = 1, dY = 0 },
        -- Ice borders 4
        [6675] = { sX = 0, sY = 1, dX = 0, dY = -1 },
        [6676] = { sX = 1, sY = 0, dX = -1, dY = 0 },
        [6677] = { sX = 1, sY = -1, dX = -1, dY = 1 },
        [6678] = { sX = 1, sY = 1, dX = -1, dY = -1 },
        [6679] = { sX = -1, sY = 1, dX = 1, dY = -1 },
        [6680] = { sX = 1, sY = -1, dX = -1, dY = 1 },
        [6681] = { sX = -1, sY = 1, dX = 1, dY = -1 },
        [6682] = { sX = 1, sY = 1, dX = -1, dY = -1 },
        -- Rock borders
        [6639] = { sX = 0, sY = -1, dX = 0, dY = 1 },
        [6640] = { sX = 1, sY = 0, dX = -1, dY = 0 },
        [6641] = { sX = 0, sY = 1, dX = 0, dY = -1 },
        [6642] = { sX = -1, sY = 0, dX = 1, dY = 0 },
        [6643] = { sX = -1, sY = -1, dX = 1, dY = 1 },
        [6644] = { sX = 1, sY = -1, dX = -1, dY = 1 },
        [6645] = { sX = -1, sY = 1, dX = 1, dY = -1 },
        [6646] = { sX = 1, sY = 1, dX = -1, dY = -1 },
        [6647] = { sX = -1, sY = -1, dX = 1, dY = 1 },
        [6648] = { sX = 1, sY = -1, dX = -1, dY = 1 },
        [6649] = { sX = -1, sY = 1, dX = 1, dY = -1 },
        [6650] = { sX = 1, sY = 1, dX = -1, dY = -1 },
        -- Beach
        [4632] = { sX = 0, sY = -1, dX = 0, dY = 1 },
        [4635] = { sX = 1, sY = 0, dX = -1, dY = 0 },
        [4634] = { sX = 0, sY = 1, dX = 0, dY = -1 },
        [4633] = { sX = -1, sY = 0, dX = 1, dY = 0 },
        [4639] = { sX = -1, sY = -1, dX = 1, dY = 1 },
        [4638] = { sX = 1, sY = -1, dX = -1, dY = 1 },
        [4637] = { sX = -1, sY = 1, dX = 1, dY = -1 },
        [4636] = { sX = 1, sY = 1, dX = -1, dY = -1 },
        [4643] = { sX = -1, sY = -1, dX = 1, dY = 1 },
        [4642] = { sX = 1, sY = -1, dX = -1, dY = 1 },
        [4641] = { sX = -1, sY = 1, dX = 1, dY = -1 },
        [4640] = { sX = 1, sY = 1, dX = -1, dY = -1 }
    },
    nestThree = 2707,
    holes = { 468, 481, 483, 385, 1219 }, 
    grasses = 2767,
    stones = { { itemId = 1285 }, { itemId = 1290 }, { itemId = 3615 } },
    waterfallItems = { 3569, 3570, 3571, 3572 },
    strengthItems = { 23443 },
    rockClimbItems = { 23448, 23449, 23446, 23447 },
    flyDisabledLocations = {
        { fromPosition = { x = 5374, y = 72, z = 7 }, toPosition = { x = 5658, y = 326, z = 7 } }
    }
}

local function isInStonesTable(item)
    for k, v in pairs(config.stones) do
        if (v.itemId == item.itemid and (not v.aid or v.aid == item.actionid)) then
            return true
        end
    end
    return false
end

function onUse(cid, item, frompos, item2, topos)
	local fromPosition = frompos
	local itemEx = item2
	local toPosition = topos

    if (topos.x == CONTAINER_POSITION) then
        doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
        return true
    end

    local playerPosition = getCreaturePosition(cid)
    local slotitemm = getPlayerSlotItem(cid, 8)
    local pokemonName = getItemAttribute(slotitemm.uid, "poke")

	local checkpos = topos
	checkpos.stackpos = 0
	
	if getPlayerStorageValue(cid, 75846) >= 1 then return true end --alterado v1.9

	local store = 23590 -- storage q salva o delay
	local delay = 3 -- tempo em segundos de delay
	-- if getPlayerStorageValue(cid, store) - os.time() <= 0 then

	if (doComparePositions(playerPosition, toPosition)) then

		if isInArray({460, 11675, 11676, 11677}, getTileInfo(getThingPos(cid)).itemid) then
        	doPlayerSendCancel(cid, "Você não pode parar de voar nesta altura!")
        	return true
   		end

        if (getPokemonAbilityAvailable(cid, POKEMON_ABILITIES.RIDE, pokemonName)) then
            if (isRiding(cid)) then
                deFlyRide(cid)
                -- setPlayerStorageValue(cid, store, os.time() + delay)

            elseif (isPokemonOnline(cid)) then
                if (hasCondition(cid, CONDITION_INFIGHT)) then
                    doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
                else
                    ride(cid)
                    -- setPlayerStorageValue(cid, store, os.time() + delay)
                end
            end

        elseif (getPokemonAbilityAvailable(cid, POKEMON_ABILITIES.FLY, pokemonName)) then
            if (isFlying(cid) and playerPosition.z ~= 0 and
                    getItemNameById(getTileThingByPos({ x = playerPosition.x, y = playerPosition.y, z = playerPosition.z, stackpos = 0 }).itemid) ~= "shallow water" and
                    getTileThingByPos({ x = playerPosition.x, y = playerPosition.y, z = playerPosition.z, stackpos = 0 }).itemid ~= 460) then
                deFlyRide(cid)
                -- setPlayerStorageValue(cid, store, os.time() + delay)

            elseif (getCreatureSummons(cid)[1]) then
                -- if (not isPremium(cid)) then
                    -- doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUNEEDPREMIUMACCOUNT)

                if (hasCondition(cid, CONDITION_INFIGHT)) then
                    doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
                else
                    fly(cid)
                    -- setPlayerStorageValue(cid, store, os.time() + delay)
                end
            end

        elseif (getPokemonAbilityAvailable(cid, POKEMON_ABILITIES.LEVITATE, pokemonName)) then
            if (isUnderwater(cid)) then
                doPlayerSendCancel(cid, "You can not levitate while you're underwater.")

            elseif (isLevitating(cid) and playerPosition.z ~= 0 and
                    getItemNameById(getTileThingByPos({ x = playerPosition.x, y = playerPosition.y, z = playerPosition.z, stackpos = 0 }).itemid) ~= "shallow water" and
                    getTileThingByPos({ x = playerPosition.x, y = playerPosition.y, z = playerPosition.z, stackpos = 0 }).itemid ~= VOID_TILE_ID) then
                deLevitate(cid)
                -- setPlayerStorageValue(cid, store, os.time() + delay)

            elseif (isPokemonOnline(cid)) then
                if (not isPremium(cid)) then
                    doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUNEEDPREMIUMACCOUNT)

                elseif (hasCondition(cid, CONDITION_INFIGHT) or
                        getPlayerMasteryDungeon(cid) > 0 or getPlayerFrontierIsland(cid)) then
                    doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)

                else
                    levitate(cid)
                    -- setPlayerStorageValue(cid, store, os.time() + delay)
                end
            end

        elseif (getPokemonAbilityAvailable(cid, POKEMON_ABILITIES.DIVE, pokemonName)) then
            if (isDiving(cid)) then
                deDive(cid)

            elseif (isPokemonOnline(cid) and isUnderwater(cid)) then
                if (not isPremium(cid)) then
                    doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUNEEDPREMIUMACCOUNT)

                elseif (hasCondition(cid, CONDITION_INFIGHT) or
                        getPlayerMasteryDungeon(cid) > 0 or getPlayerFrontierIsland(cid)) then
                    doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)

                else
                    dive(cid)
                	-- setPlayerStorageValue(cid, store, os.time() + delay)
                end
            end

        else
            doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
        end

    else
        local conf = config.borders[getThingFromPos({ x = toPosition.x, y = toPosition.y, z = toPosition.z, stackpos = 1 }).itemid] ~= nil and
                config.borders[getThingFromPos({ x = toPosition.x, y = toPosition.y, z = toPosition.z, stackpos = 1 }).itemid] or
                config.borders[getThingFromPos({ x = toPosition.x, y = toPosition.y, z = toPosition.z, stackpos = 0 }).itemid]

		if (conf) then
            if (not isPremium(cid) and not isSurfing(cid)) then
                doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUNEEDPREMIUMACCOUNT)

            elseif (getPokemonAbilityAvailable(cid, POKEMON_ABILITIES.SURF, pokemonName) and
                    getDistanceBetween(playerPosition, toPosition) < 2) then
                if (isSurfing(cid)) then
                    local groundName = "shallow water"
                    local nextTile = { x = toPosition.x + conf.dX, y = toPosition.y + conf.dY, z = toPosition.z }
                    local freeTile

                    while (groundName == "shallow water") do
                        freeTile = getClosestFreeTile(cid, nextTile, false, false)
                        groundName = getItemNameById(getThingFromPos(freeTile).itemid)
                        nextTile.x = nextTile.x + conf.dX
                        nextTile.y = nextTile.y + conf.dY
                    end

                    if (freeTile and getDistanceBetween(playerPosition, freeTile) < 3 and
                            isSightClear(playerPosition, freeTile, false) and isWalkable22(cid, freeTile)) then
                        deSurf(cid, freeTile)
                        -- setPlayerStorageValue(cid, store, os.time() + delay)
                    else
                        doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
                    end

                else
                    if (not isPokemonOnline(cid) or hasCondition(cid, CONDITION_INFIGHT) or not isPremium(cid)
                            or getPlayerMasteryDungeon(cid) > 0 or
                            getPlayerFrontierIsland(cid) or getPlayerPvpArena(cid)) then
                        doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
                        return true
                    end

                    local newPos = { x = toPosition.x + conf.sX, y = toPosition.y + conf.sY, z = toPosition.z }
                    local newPosTile = getTileThingByPos({
                        x = toPosition.x + conf.sX,
                        y = toPosition.y + conf.sY,
                        z = toPosition.z,
                        stackpos = STACKPOS_GROUND
                    })
                    if (not isWalkable22(cid, newPos) or (isItem(newPosTile) and
                            not table.find(WATER_IDS, newPosTile.itemid))) then
                        doPlayerSendCancel(cid, "You can't surf there.")
                        return true
                    end

                    surf(cid, newPos, toPosition)
                    -- setPlayerStorageValue(cid, store, os.time() + delay)
                end

            else
                doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
            end
        else

            if (not isPokemonOnline(cid)) then
                doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
                return true
            end
 
			-------- ABILITIES ---------
			local pokemon = getCreatureSummons(cid)[1]
			local pokemonName = getCreatureName(pokemon)

            if (isInStonesTable(itemEx)) then
			    if (getPokemonAbilityAvailable(cid, POKEMON_ABILITIES.ROCK_SMASH, pokemonName)) then
			        rockSmash(cid, itemEx, toPosition)
			        -- setPlayerStorageValue(cid, store, os.time() + delay)
			    else
			        doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
			    end
			elseif (itemEx.itemid == config.nestThree) then
				if (getPokemonAbilityAvailable(cid, POKEMON_ABILITIES.HEADBUTT, pokemonName)) then
					Headbutt.onHeadbutt(cid, itemEx, toPosition)
					-- setPlayerStorageValue(cid, store, os.time() + delay)
				else
					doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
				end
			elseif (isInArray(config.grasses, itemEx.itemid)) then
		        if (getPokemonAbilityAvailable(cid, POKEMON_ABILITIES.CUT, pokemonName)) then
		            cut(cid, itemEx, toPosition)
		            -- setPlayerStorageValue(cid, store, os.time() + delay)
		        else
		            doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		        end
            elseif (isInArray(config.holes, itemEx.itemid)) then
                if (getPokemonAbilityAvailable(cid, POKEMON_ABILITIES.DIG, pokemonName)) then
                    dig(cid, itemEx, toPosition)
                    -- setPlayerStorageValue(cid, store, os.time() + delay)
                else
                    doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
                end

			else
		        local pokemonPosition = getCreaturePosition(pokemon)
		        if (toPosition.x == pokemonPosition.x and toPosition.y == pokemonPosition.y and toPosition.z == pokemonPosition.z) then
		            if (getPokemonAbilityAvailable(cid, POKEMON_ABILITIES.FLASH, pokemonName)) then
		                if (hasCondition(pokemon, CONDITION_LIGHT)) then
		                    deLight(cid)
		                    -- setPlayerStorageValue(cid, store, os.time() + delay)
		                else
		                    light(cid)
		                end

		            else
		                doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		            end

		        elseif (getPokemonAbilityAvailable(cid, POKEMON_ABILITIES.BLINK, pokemonName) and canBlink(cid, pokemon)) then -- xblink n existe mais (configurar)
		            if (isWalkable22(pokemon, toPosition) and isSightClear(pokemonPosition, toPosition, true) and
		                not getCreatureStatus(pokemon, 4)) then
		                blink(cid, toPosition)
		                -- setPlayerStorageValue(cid, store, os.time() + delay)
		            else
		                doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		            end
                    
		        elseif (getPokemonAbilityAvailable(cid, POKEMON_ABILITIES.TRANSFORM, pokemonName) and getItemAttribute(getPlayerSlotItem(cid, 8).uid, "ehditto") ~= -1 and 
		        	isMonster(itemEx.uid)) then
		            doAbilitieTransform(cid, pokemon, itemEx.uid)
		            -- setPlayerStorageValue(cid, store, os.time() + delay)

		        elseif (getTilePzInfo(toPosition)) then -- Block send pokemon to protected zones, prevent bugs like easy fishing skill
					doPlayerSendCancel(cid, "Você não pode usar order em zona segura.")
					doSendMagicEffect(getPlayerPosition(cid), 2)

		        elseif (getPathToEx(pokemon, toPosition)) then
		            doCreatureWalkToPosition(pokemon, toPosition)
		            doCreatureSay(cid, getPokeName(pokemon)..", ".."go there!", TALKTYPE_MONSTER)
		            -- setPlayerStorageValue(cid, store, os.time() + delay)
		        else
		            doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		        end
		    end
	    end		
	end
-- else
	-- doPlayerSendCancel(cid, "Você tem que esperar ".. getPlayerStorageValue(cid, store) - os.time() .." segundo(s) para usar novamente.")
	-- doSendMagicEffect(getPlayerPosition(cid), 2)
-- end
    return true
end

-- falta sistema de SKETCH