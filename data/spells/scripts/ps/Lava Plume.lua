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

		local p = getThingPos(cid)
		local pa = getThingPos(cid) pa.x = pa.x+1
		
		
		
		local pos1 = {
			[1] = {{x = p.x, y = p.y+4, z = p.z}, {x = p.x+1, y = p.y+4, z = p.z}, {x = p.x+2, y = p.y+3, z = p.z}, {x = p.x+3, y = p.y+2, z = p.z}, {x = p.x+4, y = p.y+1, z = p.z}, {x = p.x+4, y = p.y, z = p.z}},
			[2] = {{x = p.x, y = p.y+3, z = p.z}, {x = p.x+1, y = p.y+3, z = p.z}, {x = p.x+2, y = p.y+2, z = p.z}, {x = p.x+3, y = p.y+1, z = p.z}, {x = p.x+3, y = p.y, z = p.z}},
			[3] = {{x = p.x, y = p.y+2, z = p.z}, {x = p.x+1, y = p.y+2, z = p.z}, {x = p.x+2, y = p.y+1, z = p.z}, {x = p.x+2, y = p.y, z = p.z}},
			[4] = {{x = p.x, y = p.y+1, z = p.z}, {x = p.x+1, y = p.y+1, z = p.z}, {x = p.x+1, y = p.y, z = p.z}},
		}
		
		local pos2 = {
			[1] = {{x = p.x, y = p.y-4, z = p.z}, {x = p.x-1, y = p.y-4, z = p.z}, {x = p.x-2, y = p.y-3, z = p.z}, {x = p.x-3, y = p.y-2, z = p.z}, {x = p.x-4, y = p.y-1, z = p.z}, {x = p.x-4, y = p.y, z = p.z}},
			[2] = {{x = p.x, y = p.y-3, z = p.z}, {x = p.x-1, y = p.y-3, z = p.z}, {x = p.x-2, y = p.y-2, z = p.z}, {x = p.x-3, y = p.y-1, z = p.z}, {x = p.x-3, y = p.y, z = p.z}},
			[3] = {{x = p.x, y = p.y-2, z = p.z}, {x = p.x-1, y = p.y-2, z = p.z}, {x = p.x-2, y = p.y-1, z = p.z}, {x = p.x-2, y = p.y, z = p.z}},
			[4] = {{x = p.x, y = p.y-1, z = p.z}, {x = p.x-1, y = p.y-1, z = p.z}, {x = p.x-1, y = p.y, z = p.z}},
		}
		
		local pos3 = {
			[1] = {{x = p.x+4, y = p.y, z = p.z}, {x = p.x+4, y = p.y-1, z = p.z}, {x = p.x+3, y = p.y-2, z = p.z}, {x = p.x+2, y = p.y-3, z = p.z}, {x = p.x+1, y = p.y-4, z = p.z}, {x = p.x, y = p.y-4, z = p.z}},
			[2] = {{x = p.x+3, y = p.y, z = p.z}, {x = p.x+3, y = p.y-1, z = p.z}, {x = p.x+2, y = p.y-2, z = p.z}, {x = p.x+1, y = p.y-3, z = p.z}, {x = p.x, y = p.y-3, z = p.z}},
			[3] = {{x = p.x+2, y = p.y, z = p.z}, {x = p.x+2, y = p.y-1, z = p.z}, {x = p.x+1, y = p.y-2, z = p.z}, {x = p.x, y = p.y-2, z = p.z}},
			[4] = {{x = p.x+1, y = p.y, z = p.z}, {x = p.x+1, y = p.y-1, z = p.z}, {x = p.x, y = p.y-1, z = p.z}},
		}
		
		local pos4 = {
			[1] = {{x = p.x-4, y = p.y, z = p.z}, {x = p.x-4, y = p.y+1, z = p.z}, {x = p.x-3, y = p.y+2, z = p.z}, {x = p.x-2, y = p.y+3, z = p.z}, {x = p.x-1, y = p.y+4, z = p.z}, {x = p.x, y = p.y+4, z = p.z}},
			[2] = {{x = p.x-3, y = p.y, z = p.z}, {x = p.x-3, y = p.y+1, z = p.z}, {x = p.x-2, y = p.y+2, z = p.z}, {x = p.x-1, y = p.y+3, z = p.z}, {x = p.x, y = p.y+3, z = p.z}},
			[3] = {{x = p.x-2, y = p.y, z = p.z}, {x = p.x-2, y = p.y+1, z = p.z}, {x = p.x-1, y = p.y+2, z = p.z}, {x = p.x, y = p.y+2, z = p.z}},
			[4] = {{x = p.x-1, y = p.y, z = p.z}, {x = p.x-1, y = p.y+1, z = p.z}, {x = p.x, y = p.y+1, z = p.z}},
		}
		
		
		
		local pos1a = {
			[1] = {{x = pa.x, y = pa.y+4, z = pa.z}, {x = pa.x+1, y = pa.y+4, z = pa.z}, {x = pa.x+2, y = pa.y+3, z = pa.z}, {x = pa.x+3, y = pa.y+2, z = pa.z}, {x = pa.x+4, y = pa.y+1, z = pa.z}, {x = pa.x+4, y = pa.y, z = pa.z}},
			[2] = {{x = pa.x, y = pa.y+3, z = pa.z}, {x = pa.x+1, y = pa.y+3, z = pa.z}, {x = pa.x+2, y = pa.y+2, z = pa.z}, {x = pa.x+3, y = pa.y+1, z = pa.z}, {x = pa.x+3, y = pa.y, z = pa.z}},
			[3] = {{x = pa.x, y = pa.y+2, z = pa.z}, {x = pa.x+1, y = pa.y+2, z = pa.z}, {x = pa.x+2, y = pa.y+1, z = pa.z}, {x = pa.x+2, y = pa.y, z = pa.z}},
			[4] = {{x = pa.x, y = pa.y+1, z = pa.z}, {x = pa.x+1, y = pa.y+1, z = pa.z}, {x = pa.x+1, y = pa.y, z = pa.z}},
		}
		
		local pos2a = {
			[1] = {{x = pa.x, y = pa.y-4, z = pa.z}, {x = pa.x-1, y = pa.y-4, z = pa.z}, {x = pa.x-2, y = pa.y-3, z = pa.z}, {x = pa.x-3, y = pa.y-2, z = pa.z}, {x = pa.x-4, y = pa.y-1, z = pa.z}, {x = pa.x-4, y = pa.y, z = pa.z}},
			[2] = {{x = pa.x, y = pa.y-3, z = pa.z}, {x = pa.x-1, y = pa.y-3, z = pa.z}, {x = pa.x-2, y = pa.y-2, z = pa.z}, {x = pa.x-3, y = pa.y-1, z = pa.z}, {x = pa.x-3, y = pa.y, z = pa.z}},
			[3] = {{x = pa.x, y = pa.y-2, z = pa.z}, {x = pa.x-1, y = pa.y-2, z = pa.z}, {x = pa.x-2, y = pa.y-1, z = pa.z}, {x = pa.x-2, y = pa.y, z = pa.z}},
			[4] = {{x = pa.x, y = pa.y-1, z = pa.z}, {x = pa.x-1, y = pa.y-1, z = pa.z}, {x = pa.x-1, y = pa.y, z = pa.z}},
		}
		
		local pos3a = {
			[1] = {{x = pa.x+4, y = pa.y, z = pa.z}, {x = pa.x+4, y = pa.y-1, z = pa.z}, {x = pa.x+3, y = pa.y-2, z = pa.z}, {x = pa.x+2, y = pa.y-3, z = pa.z}, {x = pa.x+1, y = pa.y-4, z = pa.z}, {x = pa.x, y = pa.y-4, z = pa.z}},
			[2] = {{x = pa.x+3, y = pa.y, z = pa.z}, {x = pa.x+3, y = pa.y-1, z = pa.z}, {x = pa.x+2, y = pa.y-2, z = pa.z}, {x = pa.x+1, y = pa.y-3, z = pa.z}, {x = pa.x, y = pa.y-3, z = pa.z}},
			[3] = {{x = pa.x+2, y = pa.y, z = pa.z}, {x = pa.x+2, y = pa.y-1, z = pa.z}, {x = pa.x+1, y = pa.y-2, z = pa.z}, {x = pa.x, y = pa.y-2, z = pa.z}},
			[4] = {{x = pa.x+1, y = pa.y, z = pa.z}, {x = pa.x+1, y = pa.y-1, z = pa.z}, {x = pa.x, y = pa.y-1, z = pa.z}},
		}
		
		local pos4a = {
			[1] = {{x = pa.x-4, y = pa.y, z = pa.z}, {x = pa.x-4, y = pa.y+1, z = pa.z}, {x = pa.x-3, y = pa.y+2, z = pa.z}, {x = pa.x-2, y = pa.y+3, z = pa.z}, {x = pa.x-1, y = pa.y+4, z = pa.z}, {x = pa.x, y = pa.y+4, z = pa.z}},
			[2] = {{x = pa.x-3, y = pa.y, z = pa.z}, {x = pa.x-3, y = pa.y+1, z = pa.z}, {x = pa.x-2, y = pa.y+2, z = pa.z}, {x = pa.x-1, y = pa.y+3, z = pa.z}, {x = pa.x, y = pa.y+3, z = pa.z}},
			[3] = {{x = pa.x-2, y = pa.y, z = pa.z}, {x = pa.x-2, y = pa.y+1, z = pa.z}, {x = pa.x-1, y = pa.y+2, z = pa.z}, {x = pa.x, y = pa.y+2, z = pa.z}},
			[4] = {{x = pa.x-1, y = pa.y, z = pa.z}, {x = pa.x-1, y = pa.y+1, z = pa.z}, {x = pa.x, y = pa.y+1, z = pa.z}},
		}		
		
		if isInArray({"Camerupt", "Typhlosion", "Magmar", "Magmortar", "Shiny Camerupt", "Shiny Typhlosion", "Shiny Magmar", "Shiny Magmortar", "Mega Camerupt"}) then
			atk = {
				--[atk] = {distance, eff, damage}
				["Lava Plume"] = {98, 712, FIREDAMAGE}, 
				["Rash Scald"] = {98, 715, WATERDAMAGE}, 
			}
		else
			atk = {
				-- missile 98 é nulo
				["Lava Plume"] = {98, 713, FIREDAMAGE}, 
				["Rash Scald"] = {98, 715, WATERDAMAGE}, 
				
			}
			
		end
		local function sendDist(cid, posi1, posi2, eff, delay)
			if posi1 and posi2 and isCreature(cid) then
				addEvent(sendDistanceShootWithProtect, delay, cid, posi1, posi2, eff) --alterado v1.6
			end
		end
		
		local function sendDano(cid, pos, eff, delay, min, max)			
			if pos and isCreature(cid) then
				addEvent(doDanoWithProtect, delay, cid, atk[spell][3], pos, 0, -min, -max, eff)
			end
		end
		
		local fumaaCaa = 255
		
		if spell == "Rash Scald" then
			fumaaCaa = 854
		end
		
		local function doTornado(cid)
			if isCreature(cid) then
				for j = 1, 2 do -- 4
					for i = 1, 6 do --41/207 -- 14/54
						-- addEvent(sendDist, 320, cid, pos1[j][i], pos1[j][i+1], atk[spell][1], i*310)
						addEvent(sendDano, 320, cid, pos1[j][i], atk[spell][2], i*280, min, max)
						addEvent(sendDano, 320, cid, pos1[j][i], atk[spell][2], i*290, 0, 0)
						
						---
						-- addEvent(sendDist, 320, cid, pos2[j][i], pos2[j][i+1], atk[spell][1], i*310)
						addEvent(sendDano, 320, cid, pos2[j][i], atk[spell][2], i*280, min, max)
						addEvent(sendDano, 320, cid, pos2[j][i], atk[spell][2], i*290, 0, 0)
						----
						-- addEvent(sendDist, 750, cid, pos3[j][i], pos3[j][i+1], atk[spell][1], i*310)
						addEvent(sendDano, 750, cid, pos3[j][i], atk[spell][2], i*280, min, max)
						addEvent(sendDano, 750, cid, pos3[j][i], atk[spell][2], i*290, 0, 0)
						---
						-- addEvent(sendDist, 750, cid, pos4[j][i], pos4[j][i+1], atk[spell][1], i*310)
						addEvent(sendDano, 750, cid, pos4[j][i], atk[spell][2], i*280, min, max)
						
						
						addEvent(sendDano, 280, cid, pos1a[j][i], fumaaCaa, i*280, 0, 0)
						-- addEvent(sendDano, 280, cid, pos1a[j][i], fumaaCaa, i*290, 0, 0)
						
						addEvent(sendDano, 280, cid, pos2a[j][i], fumaaCaa, i*280, 0, 0)
						-- addEvent(sendDano, 280, cid, pos2a[j][i], fumaaCaa, i*290, 0, 0)
						
						addEvent(sendDano, 700, cid, pos3a[j][i], fumaaCaa, i*280, 0, 0)			
					end
				end
			end
		end
		
		
		for b = 0, 2 do
			addEvent(doTornado, b*1250, cid) -- 1500
			doSendMagicEffect(getThingPosWithDebug(pid), 854)
		end 


    
return true
end