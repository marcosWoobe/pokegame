function onCastSpell(cid, var)
    -----------------\/padrão para todos os arquivos------------
    
     --Posições--
    ---------------\/---------------------\/----------------------\/---------------------------------------------------------
    posC = getThingPosWithDebug(cid) PosC = posC PosCid = posC posCid = posC
    posT = getThingPosWithDebug(target) PosT = posT PosTarget = posT posTarget = posT 
    posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+1 posC1.y = posC1.y+1 PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1 
    posT1 = getThingPosWithDebug(target) posT1.x = posT1.x+1 posT1.y = posT1.y+1 PosT1 = posT1 posTarget1 = posT1 PosTarget1 = posT1
    --------------------------------------------------------------------------------------------------------------------------

    local spell = var
    local target = 0
    local getDistDelay = 0
    if not isCreature(cid) or getCreatureHealth(cid) <= 0 then return false end  --alterado v1.6
    if isSleeping(cid) and getPlayerStorageValue(cid, 21100) <= -1 then return true end  --alterado v1.6

    if isCreature(getMasterTarget(cid)) then
	    target = getMasterTarget(cid)
	    getDistDelay = getDistanceBetween(getThingPosWithDebug(cid), getThingPosWithDebug(target)) * const_distance_delay
    end

    if isMonster(cid) and not isSummon(cid) then
	    if getCreatureCondition(cid, CONDITION_EXHAUST) then
	        return true
	    end
	    doCreatureAddCondition(cid, wildexhaust)
    end

    local mydir = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
    local table = getTableMove(cid, spell) --alterado v1.6

    local min = 0
    local max = 0                                                                                                                                                                                                                                                                     
                                                                                       --alterado v1.7 \/\/
    if ehMonstro(cid) and isCreature(getMasterTarget(cid)) and isInArray(specialabilities["evasion"], getCreatureName(getMasterTarget(cid))) then 
        local target = getMasterTarget(cid)
        if math.random(1, 100) <= passivesChances["Evasion"][getCreatureName(target)] then                                                                                      
            if isCreature(getMasterTarget(target)) then  --alterado v1.6 
                doSendMagicEffect(getThingPosWithDebug(target), 211)
                doSendAnimatedText(getThingPosWithDebug(target), "TOO BAD", 215)                                 
                doTeleportThing(target, getClosestFreeTile(target, getThingPosWithDebug(cid)), false)
                doSendMagicEffect(getThingPosWithDebug(target), 211)
                doFaceCreature(target, getThingPosWithDebug(cid)) 
                return false    --alterado v1.8
            end
        end   		 
    end

    --- FEAR / ROAR / SILENCE ---
    if (isWithFear(cid) or isSilence(cid)) and getPlayerStorageValue(cid, 21100) <= -1 then
        return true                                      --alterado v1.6!!
    end
    ----------------------------
	
    if not isPlayer(cid) then
	    if table ~= "" then   --alterado v1.6
	
            if getSpecialAttack(cid) and table.f then
                min = getSpecialAttack(cid) * table.f * 0.1   --alterado v1.6
            end
	        max = min + (isSummon(cid) and getMasterLevel(cid) or getPokemonLevel(cid))
	
	        if spell == "Selfdestruct" then
	            min = getCreatureHealth(cid)  --alterado v1.6
	            max = getCreatureHealth(cid)
            end
	
		    if not isSummon(cid) and not isInArray({"Demon Puncher", "Demon Kicker"}, spell) then --alterado v1.7
			    doCreatureSay(cid, string.upper(spell).."!", TALKTYPE_MONSTER)
		    end
		    if isNpcSummon(cid) then
			    local mnn = {" use ", " "}
			    local use = mnn[math.random(#mnn)]
			    doCreatureSay(getCreatureMaster(cid), getPlayerStorageValue(cid, 1007)..","..use..""..doCorrectString(spell).."!", 1)
		    end
	    else
	        print("Error trying to use move "..spell..", move not specified in the pokemon table.")
	    end	
    end
    --- FOCUS ----------------------------------            
    if getPlayerStorageValue(cid, 253) >= 0 and table ~= "" and table.f ~= 0 then   --alterado v1.6
	    min = min * 2
	    max = max * 2
	    setPlayerStorageValue(cid, 253, -1)
    end
    --- Shredder Team -------------------------------
    if getPlayerStorageValue(cid, 637501) >= 1 then
        if #getCreatureSummons(cid) == 1 then
            docastspell(getCreatureSummons(cid)[1], spell)
        elseif #getCreatureSummons(cid) == 2 then
            docastspell(getCreatureSummons(cid)[1], spell)
            docastspell(getCreatureSummons(cid)[2], spell)
        end    
      
    elseif getPlayerStorageValue(cid, 637500) >= 1 then
        min = 0
        max = 0                                     
    end
    ------------------Miss System--------------------------
    local cd = getPlayerStorageValue(cid, conds["Miss"])
    local cd2 = getPlayerStorageValue(cid, conds["Confusion"])      --alterado v1.5
    local cd3 = getPlayerStorageValue(cid, conds["Stun"]) 
    if cd >= 0 or cd2 >= 0 or cd3 >= 0 then                                                         --alterado v1.7
        if not isInArray({"Aromateraphy", "Emergency Call", "Magical Leaf", "Sunny Day", "Safeguard", "Rain Dance"}, spell) and getPlayerStorageValue(cid, 21100) <= -1 then
            if math.random(1, 100) > 85 then                                                                               --alterado v1.6
                doSendAnimatedText(getThingPosWithDebug(cid), "MISS", 215)
                return false
            end
        end
    end
    ---------------GHOST DAMAGE-----------------------
    ghostDmg = GHOSTDAMAGE
    psyDmg = PSYCHICDAMAGE

    if getPlayerStorageValue(cid, 999457) >= 1 and table ~= "" and table.f ~= 0 then    --alterado v1.6
        psyDmg = MIRACLEDAMAGE                                                              
        ghostDmg = DARK_EYEDAMAGE
        addEvent(setPlayerStorageValue, 50, cid, 999457, -1)
    end
    --------------------REFLECT----------------------
    setPlayerStorageValue(cid, 21100, -1)                --alterado v1.6
    if not isInArray({"Psybeam", "Sand Attack", "Flamethrower"}, spell) then  --alterado v1.8
        setPlayerStorageValue(cid, 21101, -1)
    end
    setPlayerStorageValue(cid, 21102, spell)

    -- POS

    posC = getThingPosWithDebug(cid) PosC = posC PosCid = posC posCid = posC
    posT = getThingPosWithDebug(target) PosT = posT PosTarget = posT posTarget = posT 
    posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+1 posC1.y = posC1.y+1 PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1 
    posT1 = getThingPosWithDebug(target) posT1.x = posT1.x+1 posT1.y = posT1.y+1 PosT1 = posT1 posTarget1 = posT1 PosTarget1 = posT1

    ---------------------fim da padrão /\ e aparti daqui \/ é o code da spell------------------------------

		local master = getCreatureMaster(cid) or 0
		local ret = {}
		ret.id = 0
		ret.cd = 9
		ret.eff = 0
		ret.check = 0
		ret.spell = spell
		ret.cond = nil 
		
		if spell == "Psy Impact" then
			dano = psyDmg --alterado v1.4
			eff = 98
			ret.cond = "Miss" -- nn sei o effect de miss para psy impact, dps vejo se da miss mesmo, e qual eff da cond
		elseif spell == "Sky Attack" then
			dano = FLYINGDAMAGE
			eff = 286
		elseif spell == "Discharge" then
			if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) then
				eff = 640
			else
				eff = 409
			end
			dano = ELECTRICDAMAGE
			ret.cond = "Miss"
			ret.eff = 541
		elseif spell == "Mega Discharge" then
			dano = ELECTRICDAMAGE
			eff = 420	-- effect da discharge um pouco diferente e roxo
			ret.cond = "Miss"
			ret.eff = 640 -- editar
		elseif spell == "Flames" then
			dano = FIREDAMAGE
			eff = 505
			--	ret.cond = "Burn" -- Burn (ainda não funciona)
			--	ret.eff = 0 -- eff de burn
		elseif spell == "Lava Pool" then
			dano = FIREDAMAGE
			eff = 700
		elseif spell == "Storm Leaves" then
			dano = GRASSDAMAGE
			dano2 = FLYINGDAMAGE --por enquanto só ta ativo 1 dano (não sei se existe poke de planta e voador, e o eff de flying ainda vou trocar)			
			eff = 694	
			eff2 = 643
		elseif spell == "Ground Elevation" then
			dano = GROUNDDAMAGE
			eff = 494
		elseif spell == "Sand Power" then
			dano = GROUNDDAMAGE
			eff = 631				
		elseif spell == "Poison Burst" then
			dano = POISONDAMAGE
			eff = 628	
		elseif spell == "Fairy Burst" then
			dano = NORMALDAMAGE --alterar p/ fairy 
			eff = 644
		elseif spell == "Eruption Terrain" then
			dano = FIREDAMAGE
			eff0 = 102
			eff = 699	
		elseif spell == "Ice Spikes" then
			dano = ICEDAMAGE 
			eff = 521
		elseif spell == "Cold Storm" then
			dano = ICEDAMAGE 
			eff = 882			

		else -- heart stamp \/
			dano = NORMALDAMAGE
			eff = 417		-- effect do Heart Stamp
		end
		
		for rocks = 1, 20 do --1, 42
			
			if	spell == "Storm Leaves" then
				addEvent(fall, rocks*35, cid, master, dano, -1, eff2)
			elseif spell == "Eruption Terrain" then
				addEvent(fall, rocks*30, cid, master, 0, -1, eff0) 
				
				addEvent(fall, rocks*40, cid, master, dano, -1, eff) 
			end
			
			addEvent(fall, rocks*35, cid, master, dano, -1, eff) --*35
		end
		
		if	spell == "Storm Leaves" then
			addEvent(doMoveInArea2, 500, cid, 0, BigArea2, dano2, 0, 0, spell, ret) -- essa tem 2 effects, caso queira 2 danos editar nesse 0, 0 e no dano2
			addEvent(doMoveInArea2, 500, cid, 0, BigArea2, dano, min, max, spell, ret) 
		elseif spell == "Ground Elevation" then
			addEvent(doMoveInArea2, 500, cid, 0, BigArea2, dano, min, max, spell, ret)
			addEvent(doMoveInArea2, 1600, cid, 0, BigArea2, dano, min, max, spell, ret)
		elseif spell == "Ground Elevation" then
			addEvent(doMoveInArea2, 500, cid, 0, BigArea1, dano, min, max, spell, ret) 	--Area menor criada p/ essa spell (BigArea1)
			
		else
			addEvent(doMoveInArea2, 500, cid, 0, BigArea2, dano, min, max, spell, ret) -- padrão
		end	
	
return true
end