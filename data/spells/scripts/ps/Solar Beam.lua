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
    
            local mutiplay = 0.1

            --clã masterx
            local master = getCreatureMaster(cid)
            if isSummon(cid) then
                if getPlayerClanName(master) ~= 'No Clan!' then
                    if getPokeClan(master, getCreatureName(cid)) then
                        if isInArray({"Ironhard", "Raibolt", "Psycraft", "Volcanic"}, getPlayerClanName(master)) then
                            formula = 0.01
                        else
                            formula = 0.007
                        end
                        mutiplay = mutiplay * tonumber(getPercentClan(master) + (getPlayerSkillLevel(master, 2) * formula))
                    end
                end 
            end
            --clã masterx

            if getSpecialAttack(cid) and table.f then
                min = getSpecialAttack(cid) * table.f * mutiplay
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


		local function useSolarBeam(cid)
			if not isCreature(cid) then
				return true
			end
			if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then
				return true
			end
			if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then
				return true
			end
			local effect1 = 255
			local effect2 = 255
			local effect3 = 255
			local effect4 = 255
			local effect5 = 255
			local area = {}
			local pos1 = getThingPosWithDebug(cid)
			local pos2 = getThingPosWithDebug(cid)
			local pos3 = getThingPosWithDebug(cid)
			local pos4 = getThingPosWithDebug(cid)
			local pos5 = getThingPosWithDebug(cid)
			if getCreatureLookDir(cid) == 1 then
				
				if getSubName(cid, target) == "Mawile" then
					doFaceOpposite(cid)
					addEvent(doFaceOpposite, 748, cid)
				end			 	
				effect1 = 4
				effect2 = 10
				effect3 = 10
				effect4 = 10
				effect5 = 0
				pos1.x = pos1.x + 2
				pos1.y = pos1.y + 1
				pos2.x = pos2.x + 3
				pos2.y = pos2.y + 1
				pos3.x = pos3.x + 4
				pos3.y = pos3.y + 1
				pos4.x = pos4.x + 5
				pos4.y = pos4.y + 1
				pos5.x = pos5.x + 6
				pos5.y = pos5.y + 1
				area = solare
			elseif getCreatureLookDir(cid) == 0 then
				
				if getSubName(cid, target) == "Mawile" then
					doFaceOpposite(cid)
					addEvent(doFaceOpposite, 748, cid)
				end				
				effect1 = 36
				effect2 = 37
				effect3 = 37
				effect4 = 38
				pos1.x = pos1.x + 1
				pos1.y = pos1.y - 1
				pos2.x = pos2.x + 1
				pos2.y = pos2.y - 3
				pos3.x = pos3.x + 1
				pos3.y = pos3.y - 4
				pos4.x = pos4.x + 1
				pos4.y = pos4.y - 5
				area = solarn
			elseif getCreatureLookDir(cid) == 2 then
				
				if getSubName(cid, target) == "Mawile" then
					doFaceOpposite(cid)
					addEvent(doFaceOpposite, 748, cid)
				end				
				effect1 = 46
				effect2 = 50
				effect3 = 50
				effect4 = 59
				pos1.x = pos1.x + 1
				pos1.y = pos1.y + 2
				pos2.x = pos2.x + 1
				pos2.y = pos2.y + 3
				pos3.x = pos3.x + 1
				pos3.y = pos3.y + 4
				pos4.x = pos4.x + 1
				pos4.y = pos4.y + 5
				area = solars
			elseif getCreatureLookDir(cid) == 3 then
				
				if getSubName(cid, target) == "Mawile" then
					doFaceOpposite(cid)
					addEvent(doFaceOpposite, 748, cid)
				end				
				effect1 = 115
				effect2 = 162
				effect3 = 162
				effect4 = 162
				effect5 = 163
				pos1.x = pos1.x - 1
				pos1.y = pos1.y + 1
				pos2.x = pos2.x - 3
				pos2.y = pos2.y + 1
				pos3.x = pos3.x - 4
				pos3.y = pos3.y + 1
				pos4.x = pos4.x - 5
				pos4.y = pos4.y + 1
				pos5.x = pos5.x - 6
				pos5.y = pos5.y + 1
				area = solarw
			end
			
			if effect1 ~= 255 then
				doSendMagicEffect(pos1, effect1)
			end
			if effect2 ~= 255 then
				doSendMagicEffect(pos2, effect2)
			end
			if effect3 ~= 255 then
				doSendMagicEffect(pos3, effect3)
			end
			if effect4 ~= 255 then
				doSendMagicEffect(pos4, effect4)
			end
			if effect5 ~= 255 then
				doSendMagicEffect(pos5, effect5)
			end
			
			doAreaCombatHealth(cid, GRASSDAMAGE, getThingPosWithDebug(cid), area, -min, -max, 255)	
			doRegainSpeed(cid)
			setPlayerStorageValue(cid, 3644587, -1)
		end
		
		local function ChargingBeam(cid)
			if not isCreature(cid) then
				return true
			end
			if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then
				return true
			end
			if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then
				return true
			end
			local tab = {}
			
			for x = -2, 2 do
				for y = -2, 2 do
					local pos = getThingPosWithDebug(cid)
					pos.x = pos.x + x
					pos.y = pos.y + y
					if pos.x ~= getThingPosWithDebug(cid).x and pos.y ~= getThingPosWithDebug(cid).y then
						table.insert(tab, pos)
					end
				end
			end
			doSendDistanceShoot(tab[math.random(#tab)], getThingPosWithDebug(cid), 37)
		end
		
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		setPlayerStorageValue(cid, 3644587, 1) --alterado v1.6 n sei pq mas tava dando debug o.O
		
		doSendMagicEffect(getThingPosWithDebug(cid), 629) -- 132
		addEvent(doSendMagicEffect, 720, posC, 728)
		addEvent(useSolarBeam, 680, cid)

return true
end