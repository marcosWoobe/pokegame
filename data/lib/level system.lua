function adjustWildPoke(cid, optionalLevel)
    if isMonster(cid) and pokes[getCreatureName(cid)] then

	    if not isCreature(cid) then return true end
	    if isSummon(cid) then return true end

		local nick = doCorrectString(getCreatureName(cid))
        local level = getPokemonLevelByName(nick)
        local monstrinho = getCreatureName(cid)

        if not pokes[nick] then return false end
	    		
		local Stats = pokes[nick]
		local offenseStat = (Stats.offense)
		local defenseStat = (Stats.defense)
		local agilityStat = (Stats.agility)
		local vitalityStat = (Stats.vitality)
		local specialAtkStat = (Stats.specialattack) 
		
		local PokeAttack = 	(offenseStat * level) / 7
		local PokeDefense = defenseStat
		local PokeSpeed = 	agilityStat
		local HP = 			 ( ( vitalityStat   * level ) * 0.8 ) + 13
		local PokeSpAttack = ( ( specialAtkStat * level ) * 0.4 ) + 5
		-- local PokeSpAttack = ( specialAtkStat * level ) * 0.3

		if string.find(monstrinho, "Shiny") then
            ShinyMix = 2
	    else
            ShinyMix = 1
	    end

	    local BonusOffense = 1
	    local BonusDefense = 1
	    local BonusAgility = 1
	    local Bonusvitality = 1
	    local Bonusspecialattack = 1
		local Bonuslife = 1

		local spawn_arrs = {
		-- Dungeons Clans --
		    {frompos = {x = 4, y = 328, z = 12}, topos = {x = 1422, y = 1242, z = 12}, storage = 0, offense = 2.5, defense = 2.5, vitality = 2, specialattack = 2, life = 1.5},
		    {frompos = {x = 616, y = 348, z = 11}, topos = {x = 999, y = 667, z = 11}, storage = 0, offense = 2.5, defense = 2.5, vitality = 2, specialattack = 2, life = 1.5},
		    --VQuest Box 3
		    {frompos = {x = 893, y = 774, z = 9}, topos = {x = 987, y = 864, z = 9}, storage = 0, offense = 3, defense = 4, vitality = 5, specialattack = 4.4, life = 5},
		}

	    local poss = getCreaturePosition(cid)
	    for _, arr in pairs(spawn_arrs) do
	        if isInRange(poss, arr.frompos, arr.topos) and not string.find(nick, "Shiny") and not isInArray({"Aporygon", "Abporygon"}, nick) then
				BonusOffense = arr.offense
				BonusDefense = arr.defense
				Bonusvitality = arr.vitality
				Bonusspecialattack = arr.specialattack
				Bonuslife = arr.life
				setPlayerStorageValue(cid, arr.storage, 1) --alterado v1.8
				break
	        end
	    end		
		
	    setPlayerStorageValue(cid, 1000, level) 
        setPlayerStorageValue(cid, 1001, PokeAttack * BonusOffense)
	    setPlayerStorageValue(cid, 1002, PokeDefense * BonusDefense)
	    setPlayerStorageValue(cid, 1003, PokeSpeed * BonusAgility)
	    setPlayerStorageValue(cid, 1004, (HP*ShinyMix) + Bonusvitality)
	    setPlayerStorageValue(cid, 1005, (PokeSpAttack*ShinyMix) * Bonusspecialattack)

	    -- print(PokeAttack * BonusOffense)
	    -- print((HP*ShinyMix) + Bonusvitality)
	    -- print(((getVitality(cid) * HPperVITsummon) * Bonuslife))
	    -- print((PokeSpAttack*ShinyMix) * Bonusspecialattack)
	
        doRegainSpeed(cid)

        setCreatureMaxHealth(cid, ((getVitality(cid) * HPperVITsummon) * Bonuslife))
		doCreatureAddHealth(cid, getCreatureMaxHealth(cid))

        if pokesMasterX[getCreatureName(cid)] and pokesMasterX[getCreatureName(cid)].exp then
            local exp = (pokesMasterX[getCreatureName(cid)].exp/10) + level
            setPlayerStorageValue(cid, 1006, (exp * generalExpRate)*0.4)
            if getPlayerStorageValue(cid, 22546) == 1 then
                setPlayerStorageValue(cid, 1006, 750)
                doSetCreatureDropLoot(cid, false)
            end
        elseif pokes[getCreatureName(cid)] and pokes[getCreatureName(cid)].exp then
            local exp = (pokes[getCreatureName(cid)].exp/10) + level
            setPlayerStorageValue(cid, 1006, (exp * generalExpRate)*0.4)
            if getPlayerStorageValue(cid, 22546) == 1 then
                setPlayerStorageValue(cid, 1006, 750)
                doSetCreatureDropLoot(cid, false)
            end
	    end
    end
end 

function getPokemonXMLOutfit(name)                --alterado v1.9 \/
    local path = "data/monster/pokes/Shiny/"..name..".xml"
    local tpw = io.type(io.open(path))

    if not tpw then
        path = "data/monster/pokes/geracao 2/"..name..".xml"
        tpw = io.type(io.open(path))
    end
    if not tpw then
        path = "data/monster/pokes/geracao 1/"..name..".xml"
        tpw = io.type(io.open(path))
    end
    if not tpw then
        path = "data/monster/pokes/"..name..".xml"
        tpw = io.type(io.open(path))
    end   
    if not tpw then
        return print("[getPokemonXMLOutfit] Poke with name: "..name.." ins't in any paste on monster/pokes/") and 2
    end
        local arq = io.open(path, "a+")
        local txt = arq:read("*all")
        arq:close()
        local a, b = txt:find('look type="(.-)"')
        txt = string.sub(txt, a + 11, b - 1)
    return tonumber(txt)
end 

OPCODE_LANGUAGE = 1
local function volta(cid, init)
	if getPlayerSlotItem(cid, CONST_SLOT_FEET).uid then
		if #getCreatureSummons(cid) >= 1 then
			local pokemon = getPlayerPokemons(cid)[1]
			local pokename = getPokeName(pokemon)
			local mbk = gobackmsgs[math.random(1, #gobackmsgs)].back:gsub("doka", pokename)
			local fromPosition = getCreaturePosition(cid)
			local toPosition = getCreaturePosition(pokemon)
			local pokeball = getPlayerSlotItem(cid, 8)
			doSendDistanceShoot(fromPosition, toPosition, balls["poke"].projectile)
		    addEvent(function()
		        if (isCreature(pk)) then
					doSendProjectile(toPosition, cid, balls["poke"].projectile)
				end
			end, 500)
			setPlayerStorageValue(cid, 23592, os.time() + 3)
			
			doSendCreatureEffect(pokemon, CREATURE_EFFECTS.RED_COPY_FADE_OUT)
			doTransformItem(pokeball.uid, pokeball.itemid-1)
			doItemSetAttribute(pokeball.uid, "moveBallT", "on")
			doCreatureSay(cid, mbk, TALKTYPE_MONSTER)
			doSendMagicEffect(getCreaturePosition(pokemon), pokeballs[getPokeballType(getPlayerSlotItem(cid, 8).itemid)].effect)
			doRemoveCreature(pokemon)
		end
	end
return true
end

function doEvolutionOutfit(cid, oldout, outfit)
	if not isCreature(cid) then return true end
	if getCreatureOutfit(cid).lookType == oldout then
		doSetCreatureOutfit(cid, {lookType = outfit}, -1)
	else
		doSetCreatureOutfit(cid, {lookType = oldout}, -1)
	end
end

function doSendEvolutionEffect(cid, pos, evolution, turn, ssj, evolve, f, h)
	if not isCreature(cid) then
		doSendAnimatedText(pos, "CANCEL", 215)
	    return true 
    end
	if evolve then
		doEvolvePokemon(getCreatureMaster(cid), {uid = cid}, evolution, 0, 0)
	    return true
	end
	doSendMagicEffect(pos, 18)
	if ssj then
		sendSSJEffect(evo)
	end
	doEvolutionOutfit(cid, f, h)
	addEvent(doSendEvolutionEffect, math.pow(1900, turn/20), cid, getThingPos(cid), evolution, turn - 1, turn == 19, turn == 2, f, h)
end

function sendSSJEffect(cid)
	if not isCreature(cid) then return true end
	local pos1 = getThingPos(cid)
	local pos2 = getThingPos(cid)
	pos2.x = pos2.x + math.random(-1, 1)
	pos2.y = pos2.y - math.random(1, 2)
	doSendDistanceShoot(pos1, pos2, 37)
	addEvent(sendSSJEffect, 45, cid)
end

function sendFinishEvolutionEffect(cid, alternate)
	if not isCreature(cid) then return true end
	local pos1 = getThingPos(cid)

	if alternate then
		local pos = {
		[1] = {-2, 0},
		[2] = {-1, -1},
		[3] = {0, -2},
		[4] = {1, -1},
		[5] = {2, 0},
		[6] = {1, 1},
		[7] = {0, 2},
		[8] = {-1, 1}}
		for a = 1, 8 do
			local pos2 = getThingPos(cid)
			pos2.x = pos2.x + pos[a][1]
			pos2.y = pos2.y + pos[a][2]
			local pos = getThingPos(cid)
			doSendDistanceShoot(pos2, pos, 37)
			addEvent(doSendDistanceShoot, 300, pos, pos2, 37)
		end
	else
		for a = 0, 3 do
			doSendDistanceShoot(pos1, getPosByDir(pos1, a), 37)
		end
		for a = 4, 7 do
			addEvent(doSendDistanceShoot, 600, pos1, getPosByDir(pos1, a), 37)
		end
	end
end

local function doPokemonUpdate(name, owner, position)
  if (isPlayer(owner)) then
	    local pokemon = doSummonCreature(name, position, false)

	    if(not isCreature(pokemon)) then
	      doPlayerSendDefaultCancel(owner, RETURNVALUE_NOTPOSSIBLE)

    	else
    	
		doConvinceCreature(owner, pokemon)

		sendFinishEvolutionEffect(pokemon, true)
		addEvent(sendFinishEvolutionEffect, 550, pokemon, true)
		addEvent(sendFinishEvolutionEffect, 1050, pokemon)

		local pokeball = getPlayerSlotItem(owner, 8)
		local pokemon4 = getCreatureSummons(owner)[1]
	    doAddPokemonInOwnList(owner, name)
	    adjustStatus(pokemon4, pokeball.uid, true, true, true)
	    doUpdatePokemonsBar(owner)
	    doUpdateMoves(owner)

		addEvent(doCreatureSetStorage, 1000, owner, playersStorages.isEvolving, -1)
		-- addEvent(volta, 3000, owner, true)

    end
  end
end

function doEvolvePokemon(cid, item2, theevo, stone1, stone2)

	if not isCreature(cid) then return true end
	if not getPlayerPokemons(cid)[1] then return true end

	local pokeball = getPlayerSlotItem(cid, 8)
	if getItemAttribute(pokeball.uid, "ehditto") and getItemAttribute(pokeball.uid, "ehditto") ~= "" then
	    doPlayerSendTextMessage(cid, 25, "Você não pode evoluir Ditto!")
	    return true
	end

	if not pokes[theevo] or not pokes[theevo].offense then
	    doReturnPokemon(cid, item2, getPlayerSlotItem(cid, 8), pokeballs[getPokeballType(getPlayerSlotItem(cid, 8).itemid)].effect, false, true)
	    return true
	end

	local ball = getPlayerSlotItem(cid, 8).uid
	local levelpoke = getItemAttribute(ball, 'level') or 1
	local pk = getPlayerPokemons(cid)[1]
	local poke = getThingPos(pk)

	if POKELEVEL_PLUS.evolution_tab[getCreatureName(pk)] and POKELEVEL_PLUS.evolution_tab[getCreatureName(pk)] then
		getEvolutionSystem = POKELEVEL_PLUS.evolution_tab[getCreatureName(pk)].level
		getEvolutionSystemStone = math.floor(POKELEVEL_PLUS.evolution_tab[getCreatureName(pk)].level / 3)
	else
		getEvolutionSystem = 40
		getEvolutionSystemStone = 15
	end

	if theevo then

		if levelpoke >= getEvolutionSystemStone then

		    if getPlayerLevel(cid) >= pokes[theevo].level then
		        doPlayerSendTextMessage(cid, 25, "Parabéns!\nSeu " .. getCreatureName(pk) .. " está evoluindo para (" .. theevo .. ")!")

				local ball = getPlayerSlotItem(cid, 8).uid
				local owner = getCreatureMaster(item2)
				local pokeball = getPlayerSlotItem(cid, 8)
				local description = "Contains a "..theevo.."."
				local pct = getCreatureHealth(item2) / getCreatureMaxHealth(item2)

				doItemSetAttribute(pokeball.uid, "hp", pct)
				doItemSetAttribute(pokeball.uid, "nome", theevo)
				doItemSetAttribute(pokeball.uid, "poke", theevo)
				doItemSetAttribute(pokeball.uid, "tadport", fotos[theevo])
				doItemSetAttribute(pokeball.uid, "addonNow", getOutfitPoke(theevo))
				doItemSetAttribute(pokeball.uid, "description", description)

				doTransformItem(getPlayerSlotItem(cid, 7).uid, fotos[theevo])

				doItemSetAttribute(pokeball.uid, "morta", "no")
				doItemSetAttribute(pokeball.uid, "Icone", "yes")

				local pokemonicon = getItemAttribute(pokeball.uid, "poke")

				if icons[theevo] then
					id = icons[theevo].use
				else
				    id = pokeballs["normal"].use
				end

			  	doTransformItem(pokeball.uid, id)

				if string.find(tostring(theevo), "Shiny") then 
				    doPlayerRemoveItem(cid, stone1, stone2)
				else
				    doPlayerRemoveItem(cid, stone1, 1)
				    doPlayerRemoveItem(cid, stone2, 1)
				end

				doCreatureSetStorage(cid, playersStorages.isEvolving, 1)
			    -- doPlayerAddStatistic(cid, PLAYER_STATISTIC_IDS.EVOLVE_POKEMON, 1)

				-- local pokemon2 = item2
				-- doSendCreatureEffect(pokemon2, CREATURE_EFFECTS.EVOLVE, getMonsterInfo(theevo, false).outfit.lookType) -- psoul

				local pk = getCreatureSummons(cid)[1]
				local pokemonPosition = getCreaturePosition(item2)

				-- addEvent(function(cid)
			 --        if (isCreature(cid)) then
			 --            doPlayerSendTextMessage(cid, 22, "Your Pokemon is evolving!")
			 --        end
			 --    end, 3000, cid)

				addEvent(function(cid, cidName, theevo, pokemonPosition)
			        if (isCreature(cid)) then
			            doPlayerSendTextMessage(cid, 27, "Congratulations! Your "..cidName.." evolved into a "..theevo.."!")	
			            doPlayerSendTextMessage(cid, 25, "Congratulations! Your "..cidName.." evolved into a "..theevo.."!")	
			            doPokemonUpdate(theevo, cid, pokemonPosition)
			        end
			    end, 150, cid, getCreatureName(pk), theevo, pokemonPosition)	

				sendFinishEvolutionEffect(pk, true)
				-- addEvent(sendFinishEvolutionEffect, 200, pk, true)
				-- addEvent(sendFinishEvolutionEffect, 500, pk)

				doSendMagicEffect(pokemonPosition, 18)
				doSendMagicEffect(getThingPos(cid), 173)
			    doRemoveCreature(item2)

		    else
		        doPlayerSendTextMessage(cid, 27, ("Você não tem o level necessário para evoluir esse pokémon (Level: "..pokes[pokeevolution].level..")."))
		        doPlayerSendTextMessage(cid, 25, ("Você não tem o level necessário para evoluir esse pokémon (Level: "..pokes[pokeevolution].level..")."))
		        doSendMagicEffect(getPlayerPosition(cid), 2)   
		    end 

		else
		    doPlayerSendTextMessage(cid, 27, ("O seu pokémon não tem o level necessário para evoluir (Level: "..getEvolutionSystemStone..")."))
		    doPlayerSendTextMessage(cid, 25, ("O seu pokémon não tem o level necessário para evoluir (Level: "..getEvolutionSystemStone..")."))
		    doSendMagicEffect(getPlayerPosition(cid), 2)
		end

	else
	    doPlayerSendTextMessage(cid, 27, ("O seu pokémon não tem Evolução."))
	    doPlayerSendTextMessage(cid, 25, ("O seu pokémon não tem Evolução."))
	    doSendMagicEffect(getPlayerPosition(cid), 2)  
	end

end

function doMathDecimal(number, casas)

	if math.floor(number) == number then return number end

	local c = casas and casas + 1 or 3

	for a = 0, 10 do
		if math.floor(number) < math.pow(10, a) then
			local str = string.sub(""..number.."", 1, a + c)
			return tonumber(str)	
		end
	end

    return number
end

function doAdjustWithDelay(cid, pk, health, vit, status)
    if isCreature(cid) then                                   
        adjustStatus(pk, getPlayerSlotItem(cid, 8).uid, health, vir, status)
    end
end

-- function tierF(cid)
--     if TiersPerct[Tiers[getCreatureName(cid)]] then
-- 	    return TiersPerct[Tiers[getCreatureName(cid)]]
-- 	end
-- 	return 1
-- end

function adjustStatus(pk, item, health, vite, conditions)

	if not isCreature(pk) then return true end 
	
	boostGoBack = getItemAttribute(item, "boost") or 0
    levelGoBack = getItemAttribute(item, "level") or 0
    if isSummon(pk) then
	  setPlayerStorageValue(pk, 18012, levelGoBack)
      setPlayerStorageValue(pk, 1500022, boostGoBack) -- boost?
      doCreatureSetSkullType(pk, 10)
    end

	local pokeName = getCreatureName(pk)
	-- print(pokeName)
	-- local shinyP = 1
	-- if string.find(tostring(pokeName), "Shiny") then
	-- 	pokeName = tostring(pokeName):match("Shiny (.*)")
	-- 	shinyP = 1.5
	-- end
	local Stats = pokes[pokeName]
	if not Stats then 
	    print("Está faltando o pokemon ("..pokeName..") no pokemon status.")
		local test = io.open("data/pokemonStatus.txt", "a+")
 		local read = ""
 		if test then
  			read = test:read("*all")
  			test:close()
 		end
 		read = read.." - ".."Está faltando o pokemon ("..pokeName..") no pokemon status.\n"..""
 		local reopen = io.open("data/pokemonStatus.txt", "w")
 		reopen:write(read)
 		reopen:close()
	    return true 
	end
	
	--local nameReal = getCreatureName(pk)
	--local pokeType = getOutfitPoke(nameReal)
	--if getItemAttribute(item, "addonNow") ~= pokeType then
	if not string.find(tostring(pokeName), "Mega ") and getItemAttribute(item, "addonNow") then
        if getItemAttribute(item, "color1") then
            local color1, color2, color3, color4 = getItemAttribute(item, "color1"), getItemAttribute(item, "color2"), getItemAttribute(item, "color3"), getItemAttribute(item, "color4")
            doCreatureChangeOutfit(pk, {lookType = getItemAttribute(item, "addonNow"), lookHead = color1, lookBody = color2, lookLegs = color3, lookFeet = color4})
        else
            doCreatureChangeOutfit(pk, {lookType = getItemAttribute(item, "addonNow")})
        end
	--else
	--    doCreatureChangeOutfit(pk, {lookType = pokeType})--getOutfitPoke(pokemon)
    end

	-- local gender = getItemAttribute(item, "gender") and getItemAttribute(item, "gender") or 0
	-- addEvent(doCreatureSetSkullType, 10, pk, gender)

	-- Defense -- 
	local bonusdef = 1
	local Tiers = {
		[1] = {bonus = DefBonus1},
		[2] = {bonus = DefBonus2},
		[3] = {bonus = DefBonus3},
		[4] = {bonus = DefBonus4},
		[5] = {bonus = DefBonus5},
		[6] = {bonus = DefBonus6},
		[7] = {bonus = DefBonus7},
	}  
	local Tier = getItemAttribute(item, "heldx")

	if Tier and Tier > 0 and Tier < 8 then
		bonusdef = Tiers[Tier].bonus
	end
	-- Defense --

	-- Boost -- 
	local bonusboost = 0
	local Tiers2 = {
		[36] = {bonus = BoostBonus1},
		[37] = {bonus = BoostBonus2},
		[38] = {bonus = BoostBonus3},
		[39] = {bonus = BoostBonus4},
		[40] = {bonus = BoostBonus5},
		[41] = {bonus = BoostBonus6},
		[42] = {bonus = BoostBonus7},
	}
	if Tier and Tier > 35 and Tier < 43 then
		bonusboost = Tiers2[Tier].bonus
	end
	-- Boost -- 

	-- Haste -- 
	local hastespeed = {}
	local Tiers3 = {
		[99] = {bonus = Hasteadd1},
		[100] = {bonus = Hasteadd2},
		[101] = {bonus = Hasteadd3},
		[102] = {bonus = Hasteadd4},
		[103] = {bonus = Hasteadd5},
		[104] = {bonus = Hasteadd6},
		[105] = {bonus = Hasteadd7},
	}
	if Tier and Tier > 98 and Tier < 106 then
		hastespeed = Tiers3[Tier].bonus
	else
		hastespeed = 0
	end
	-- Haste -- 
	-- Vitality -- 
	local vitapoint = {}
	local Tiers4 = {
		[92] = {bonus = Vitality1},
		[93] = {bonus = Vitality2},
		[94] = {bonus = Vitality3},
		[95] = {bonus = Vitality4},
		[96] = {bonus = Vitality5},
		[97] = {bonus = Vitality6},
		[98] = {bonus = Vitality7},
	}
	if Tier and Tier > 91 and Tier < 99 then
		vitapoint = Tiers4[Tier].bonus
	else
		vitapoint = 1
	end
	-- Vitality -- 

    -- local tierF = tierF(pk)

	local atkNatu = 1
	local atkSPNatu = 1
	local defNatu = 1
	local speedNatu = 1
	if getItemAttribute(item, "nature") then
	    if Natures[getItemAttribute(item, "nature")] then
		    atkNatu = Natures[getItemAttribute(item, "nature")].attack
			atkSPNatu = Natures[getItemAttribute(item, "nature")].SPatk
			defNatu = Natures[getItemAttribute(item, "nature")].def
			speedNatu = Natures[getItemAttribute(item, "nature")].speed
		end
	end 
	
	local IV = 1
	if getItemAttribute(item, "iv") then
	    IV = getItemAttribute(item, "iv")
    else
        IV = math.random(1, 25) -- 25 es el porcentaje de las estadísticas que pueden ser más fuertes de los Pokémon con mayor iv. ejemplo: ahora un pokemon puede tener entre un 1% y un 25% adicional de fuerza dependiendo de su iv
        setItemAttribute(item, "iv", IV)
	end
	IV = (IV / 100) + 1

	local EV = 0
	if getItemAttribute(item, "ev") then
	    EV = getItemAttribute(item, "ev")
	end
	
 	-- if getMasterLevel(pk) <= 150 then
 		-- playerLevelMix = ( ( getMasterLevel(pk) * 0.3 ) + 45 ) --   LVL 150 = 90
 	-- else
 		-- playerLevelMix = ( ( getMasterLevel(pk) * 0.1 ) + 75 ) --    LVL 149 = 89
 		-- playerLevelMix = ( ( getMasterLevel(pk) * 0.1 ) + 60 ) --    LVL 149 = 89
 	-- end

 	-- if getMasterLevel(pk) <= 2 then
 	-- else
 	-- 	levelPlayer = 2
 	-- end

  	local levelPlayer = getMasterLevel(pk) * 0.85
	local offenseStat = (Stats.offense)
	local defenseStat = (Stats.defense)
	local agilityStat = (Stats.agility)
	local vitalityStat = (Stats.vitality)
	local specialAtkStat = (Stats.specialattack)
	---------------------------------------------------------
  	local playerPoke = getCreatureMaster(pk)
	local ball = getPlayerSlotItem(playerPoke, 8).uid
	local levelPokeMix = ( getItemAttribute(ball, 'level') * 0.35 ) or 1
	
	local PokeAttack = 	 ( ( offenseStat*levelPlayer ) * atkNatu ) / 10
	local PokeDefense =  defenseStat * defNatu
	local PokeSpeed = 	 agilityStat * speedNatu
	local HP =			 ( ( ( ( vitalityStat   * levelPokeMix ) + levelPlayer ) * vitapoint ) * 3.6 ) + 20
	local PokeSpAttack = ( ( ( ( specialAtkStat * levelPokeMix ) + levelPlayer ) * atkSPNatu ) * 1.45 )

    HP = HP * IV
    PokeSpAttack = PokeSpAttack * IV

	-- print("-------------------------------")
	-- print("Hp: "..HP)
	-- print("PokeSpAttack: "..PokeSpAttack)

	if (getItemAttribute(ball, "ehditto") == 1) then
	    setPlayerStorageValue(pk, 1001, (PokeAttack) * 0.50 )
		setPlayerStorageValue(pk, 1002, ((PokeDefense * bonusdef) + (getPokemonBoost(pk)) + (bonusboost)) * 0.50 )
		setPlayerStorageValue(pk, 1003, (PokeSpeed + hastespeed) * 0.50 )
	    setPlayerStorageValue(pk, 1004, HP + (getPokemonBoost(pk)*2) + (bonusboost*2) * 0.50)
		setPlayerStorageValue(pk, 1005, PokeSpAttack * 0.50 )
	elseif (getItemAttribute(ball, "ehshinyditto") == 1) then
	    setPlayerStorageValue(pk, 1001, (PokeAttack) * 0.80 )
		setPlayerStorageValue(pk, 1002, ((PokeDefense * bonusdef) + (getPokemonBoost(pk)) + (bonusboost)) * 0.80 )
		setPlayerStorageValue(pk, 1003, (PokeSpeed + hastespeed) * 0.80 )
	    setPlayerStorageValue(pk, 1004, HP + (getPokemonBoost(pk)*2) + (bonusboost*2) * 0.80)
		setPlayerStorageValue(pk, 1005, PokeSpAttack * 0.80 )
	else
	    setPlayerStorageValue(pk, 1001, PokeAttack)
		setPlayerStorageValue(pk, 1002, (PokeDefense * bonusdef) + (getPokemonBoost(pk)) + (bonusboost))
		setPlayerStorageValue(pk, 1003, (PokeSpeed + hastespeed))
	    setPlayerStorageValue(pk, 1004, HP + (getPokemonBoost(pk)*2) + (bonusboost*2))
		setPlayerStorageValue(pk, 1005, PokeSpAttack)
		-- setPlayerStorageValue(pk, 180211, PokeSpAttackOld)
	end

	local TiersLucky = {
		[124] = {bonus = 5},
		[125] = {bonus = 10},
		[126] = {bonus = 20},
		[127] = {bonus = 30},
		[128] = {bonus = 40},
		[129] = {bonus = 50},
		[130] = {bonus = 60},
	}
	if Tier and Tier >= 124 and Tier <= 130 then
		setPlayerStorageValue(pk, 75000, TiersLucky[Tier].bonus)
	end
	
	if vite == true then
		local pct = getCreatureHealth(pk) / getCreatureMaxHealth(pk)
		local vit = getVitality(pk) * HPperVITsummon
		setCreatureMaxHealth(pk, vit)
		doCreatureAddHealth(pk, pct * vit)
	end
                                                                      
	doRegainSpeed(pk)  

	local nick = getItemAttribute(item, "poke")

    if isGhostPokemon(pk) then
       setPlayerStorageValue(pk, 8981, 1)
       updateGhostWalk(pk)
    end

	setPlayerStorageValue(pk, 1007, nick)
	
	if getItemAttribute(item, "ehditto") == 1 then
		nick = "Ditto"
	elseif getItemAttribute(item, "ehshinyditto") == 1 then
		nick = "Shiny Ditto"
	end
    	
	if getItemAttribute(item, "nick") then 
		nick = getItemAttribute(item, "nick")
	end

	-- if string.find(tostring(nick), "Shiny") then
	    -- nick = tostring(nick):match("Shiny (.*)")
    -- end
	
	-- if getItemAttribute(item, "nome") then
		-- nick = getItemAttribute(item, "nome")
	-- end

-- 
	-- boost = getItemAttribute(item, "boost") or 0
		
	-- if boost > 0 then
	-- 	nick = nick.." [+"..boost.."]"
	-- else
	-- 	nick = nick
	-- end

	if getItemAttribute(item, "level") >= 1 then
		lvl = getItemAttribute(item, "level") or 0
		nick = nick.." ["..lvl.."]"
		doCreatureSetNick(pk, nick)
	end

	setPlayerStorageValue(pk, 1008, 100)

	local hunger = getItemAttribute(item, "hunger")
	setPlayerStorageValue(pk, 1009, 100)

	if health == true then
		local mh = getVitality(pk) * HPperVITsummon
		local rd = 1 - (tonumber(getItemAttribute(item, "hp")))
		setCreatureMaxHealth(pk, mh)                                  
		doCreatureAddHealth(pk, getCreatureMaxHealth(pk))
		doCreatureAddHealth(pk, -(getCreatureMaxHealth(pk) * rd))
	end

    if isSummon(pk) and conditions then
        local burn = tonumber(getItemAttribute(item, "burn"))
        if burn and burn >= 0 then
            local ret = {id = pk, cd = burn, check = false, damage = getItemAttribute(item, "burndmg"), cond = "Burn"}
            doCondition2(ret)
        end
        
        local poison = tonumber(getItemAttribute(item, "poison"))
        if poison and poison >= 0 then
            local ret = {id = pk, cd = poison, check = false, damage = getItemAttribute(item, "poisondmg"), cond = "Poison"}
            doCondition2(ret)
        end
        
        local confuse = tonumber(getItemAttribute(item, "confuse"))
        if confuse and confuse >= 0 then
            local ret = {id = pk, cd = confuse, check = false, cond = "Confusion"}
            doCondition2(ret)
        end
        
        local sleep = tonumber(getItemAttribute(item, "sleep"))
        if sleep and sleep >= 0 then
            local ret = {id = pk, cd = sleep, check = false, first = true, cond = "Sleep"}
            doCondition2(ret)
        end
        
        local miss = tonumber(getItemAttribute(item, "miss"))
        if miss and miss >= 0 then 
            local ret = {id = pk, cd = miss, eff = getItemAttribute(item, "missEff"), check = false, spell = getItemAttribute(item, "missSpell"), cond = "Miss"}
            doCondition2(ret)
        end
        
        local fear = tonumber(getItemAttribute(item, "fear"))
        if fear and fear >= 0 then
            local ret = {id = pk, cd = fear, check = false, skill = getItemAttribute(item, "fearSkill"), cond = "Fear"}
            doCondition2(ret)
        end
        
        local silence = tonumber(getItemAttribute(item, "silence"))
        if silence and silence >= 0 then 
            local ret = {id = pk, cd = silence, eff = getItemAttribute(item, "silenceEff"), check = false, cond = "Silence"}
            doCondition2(ret)
        end 
        
        local stun = tonumber(getItemAttribute(item, "stun"))
        if stun and stun >= 0 then
            local ret = {id = pk, cd = stun, eff = getItemAttribute(item, "stunEff"), check = false, spell = getItemAttribute(item, "stunSpell"), cond = "Stun"}
            doCondition2(ret)
        end 
        
        local paralyze = tonumber(getItemAttribute(item, "paralyze"))
        if paralyze and paralyze >= 0 then
            local ret = {id = pk, cd = paralyze, eff = getItemAttribute(item, "paralyzeEff"), check = false, first = true, cond = "Paralyze"}
            doCondition2(ret)
        end 
        
        local slow = tonumber(getItemAttribute(item, "slow"))
        if slow and slow >= 0 then
            local ret = {id = pk, cd = slow, eff = getItemAttribute(item, "slowEff"), check = false, first = true, cond = "Slow"}
            doCondition2(ret)
        end 
        
        local leech = tonumber(getItemAttribute(item, "leech"))
        if leech and leech >= 0 then
            local ret = {id = pk, cd = leech, attacker = 0, check = false, damage = getItemAttribute(item, "leechdmg"), cond = "Leech"}
            doCondition2(ret)
        end 
        
        for i = 1, 3 do
            local buff = tonumber(getItemAttribute(item, "Buff"..i))
            if buff and buff >= 0 then
                local ret = {id = pk, cd = buff, eff = getItemAttribute(item, "Buff"..i.."eff"), check = false, 
                buff = getItemAttribute(item, "Buff"..i.."skill"), first = true, attr = "Buff"..i}
                doCondition2(ret)
            end
        end
        
    end
	                                                                      --alterado v1.9
    if getItemAttribute(item, "boost") and getItemAttribute(item, "boost") >= 50 and getItemAttribute(item, "aura") then
       sendAuraEffect(pk, auraSyst[getItemAttribute(item, "aura")])        
    end
    
    if getPlayerStorageValue(getCreatureMaster(pk), 6598754) >= 1 then
        setPlayerStorageValue(pk, 6598754, 1)                               
    elseif getPlayerStorageValue(getCreatureMaster(pk), 6598755) >= 1 then
        setPlayerStorageValue(pk, 6598755, 1)
    end
	
	if getPlayerStorageValue(getCreatureMaster(pk), 84929) >= 1 then--torneio viktor
        setPlayerStorageValue(pk, 84929, 1)                               
    end

	return true
end

function getOffense(cid)
	if not isCreature(cid) then return 0 end
return tonumber(getPlayerStorageValue(cid, 1001))
end

function getDefense(cid)
	if not isCreature(cid) then return 0 end
return tonumber(getPlayerStorageValue(cid, 1002))
end

function getSpeed(cid)
	if not isCreature(cid) then return 0 end
return tonumber(getPlayerStorageValue(cid, 1003))
end

function getVitality(cid)
	if not isCreature(cid) then return 0 end
return tonumber(getPlayerStorageValue(cid, 1004))
end

function getSpecialAttack(cid)
	if not isCreature(cid) then return 0 end
return tonumber(getPlayerStorageValue(cid, 1005))
end

function getHappiness(cid)
	if not isCreature(cid) then return 0 end
return tonumber(getPlayerStorageValue(cid, 1008))
end

function getSpecialDefense(cid)
	if not isCreature(cid) then return 0 end
return getSpecialAttack(cid) * 0.85 + getDefense(cid) * 0.2      
end

function getPokemonLevel(cid, dex)
    if not isCreature(cid) or not pokes[getCreatureName(cid)] then return 0 end 
    if not dex then                      --alterado v1.9
        if ehMonstro(cid) and getPlayerStorageValue(cid, 1000) > 0 then  
            return getPlayerStorageValue(cid, 1000)
        elseif ehMonstro(cid) then 
          	return pokes[getCreatureName(cid)].wildLvl             
       	end
    end   
return pokes[getCreatureName(cid)].level
end

function getPokeLevel(cid, dex)
if not isCreature(cid) then return 0 end 
    if not dex then                      --alterado v1.9
       if ehMonstro(cid) and getPlayerStorageValue(cid, 18012) > 0 then  
          return getPlayerStorageValue(cid, 18012)
       elseif ehMonstro(cid) then 
          return true            
       else
       	  return 1
       end
    end   
return true
end

function getPokemonLevelByName(name)
return pokes[name] and pokes[name].level or 0  --alterado v1.9
end

function getMasterLevel(poke)
    if not isSummon(poke) then return 0 end
return getPlayerLevel(getCreatureMaster(poke))
end

function getPokemonBoost(poke)
    if not isSummon(poke) then return 0 end
return getItemAttribute(getPlayerSlotItem(getCreatureMaster(poke), 8).uid, "boost") or 0
end

function getPokeballBoost(ball)
    if not isPokeball(ball.itemid) then return 0 end  --alterado v1.8
return getItemAttribute(ball.uid, "boost") or 0
end

function getPokeName(cid)
	if not isSummon(cid) then return getCreatureName(cid) end
	if getCreatureName(cid) == "Evolution" then return getPlayerStorageValue(cid, 1007) end
	
local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
	if getItemAttribute(item.uid, "nome") then
	   return getItemAttribute(item.uid, "nome")
	end
return getCreatureName(cid)
end

function getPokeballName(item, truename)
if not truename and getItemAttribute(item, "nome") then
return getItemAttribute(item, "nome")
end
return getItemAttribute(item, "poke")
end

function getPokemonName(cid)
return getCreatureName(cid)
end

function getPokemonGender(cid) --alterado v1.9
return getCreatureSkullType(cid)
end

function setPokemonGender(cid, gender)
-- if isCreature(cid) and gender then        --alterado v1.8
--    doCreatureSetSkullType(cid, gender) 
--    return true
-- end
-- return false
end

function getWildPokemonExp(cid)
return getPlayerStorageValue(cid, 1006)
end
