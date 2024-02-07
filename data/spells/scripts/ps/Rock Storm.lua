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
        
        
        -- missile 98 é nulo.
        
        local atk = {
            --[atk] = {distance, eff, damage}
            ["Electro Field"] = {41, 207, ELECTRICDAMAGE},
            ["Petal Tornado"] = {4, 728, GRASSDAMAGE}, 
            ["Rock Storm"] = {11, 234, ROCKDAMAGE}, 
            
        --  ["Flame Circlel"] = {98, 6, FIREDAMAGE}, -- retirar qnd refizer a spell
            ["Flame Circle"] = {98, 6, FIREDAMAGE}, 
            ["Flare Blitz"] = {3, 257, FIREDAMAGE}, 
            ["Waterfall"] = {98, 155, WATERDAMAGE},
            ["Venomous Gale"] = {98, 995, POISONDAMAGE},            
        }
        
        
        local atk2 = {
            ["Electro Field"] = {90, 751, ELECTRICDAMAGE}, -- Shiny Buzz e Shiny Vire (90, 40)
            ["Petal Tornado"] = {4, 728, GRASSDAMAGE}, 
            ["Rock Storm"] = {11, 234, ROCKDAMAGE}, 
            
            ["Flame Circlel"] = {98, 6, FIREDAMAGE}, -- retirar qnd refizer a spell
            ["Flame Circle"] = {98, 6, FIREDAMAGE}, 
            ["Flare Blitz"] = {57, 722, FIREDAMAGE}, -- Blue Flames Rapidash
            ["Waterfall"] = {98, 155, WATERDAMAGE},
            ["Venomous Gale"] = {98, 995, POISONDAMAGE},                
        }
        
        
        
        
        local function sendDist(cid, posi1, posi2, eff, delay)
            if posi1 and posi2 and isCreature(cid) then
                addEvent(sendDistanceShootWithProtect, delay, cid, posi1, posi2, eff) --alterado v1.6
            end
        end
        
        local function sendDano(cid, pos, eff, delay, min, max)
            if pos and isCreature(cid) then
                if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) or getPlayerStorageValue(cid, 90177) >= 1 then
                    addEvent(doDanoWithProtect, delay, cid, atk2[spell][3], pos, 0, -min, -max, eff)
                    
                else 
                    addEvent(doDanoWithProtect, delay, cid, atk[spell][3], pos, 0, -min, -max, eff) 
                end
            end
        end
        
        local function doTornado(cid)
            if isCreature(cid) then
                for j = 1, 4 do
                    for i = 1, 6 do --41/207 -- 14/54
                        if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) or getPlayerStorageValue(cid, 90177) >= 1 then
                            -- if getSubName(cid, target) == "Rapidash" and getPlayerStorageValue(cid, 90177) >= 1 or not getSubName(cid, target) == "Rapidash" then
                            addEvent(sendDist, 350, cid, pos1[j][i], pos1[j][i+1], atk2[spell][1], i*330)
                            addEvent(sendDano, 350, cid, pos1[j][i], atk2[spell][2], i*300, min, max)
                            addEvent(sendDano, 350, cid, pos1[j][i], atk2[spell][2], i*310, 0, 0)
                            ---
                            addEvent(sendDist, 350, cid, pos2[j][i], pos2[j][i+1], atk2[spell][1], i*330)
                            addEvent(sendDano, 350, cid, pos2[j][i], atk2[spell][2], i*300, min, max)
                            addEvent(sendDano, 350, cid, pos2[j][i], atk2[spell][2], i*310, 0, 0)
                            ----
                            addEvent(sendDist, 800, cid, pos3[j][i], pos3[j][i+1], atk2[spell][1], i*330)
                            addEvent(sendDano, 800, cid, pos3[j][i], atk2[spell][2], i*300, min, max)
                            addEvent(sendDano, 800, cid, pos3[j][i], atk2[spell][2], i*310, 0, 0)
                            ---
                            addEvent(sendDist, 800, cid, pos4[j][i], pos4[j][i+1], atk2[spell][1], i*330)
                            addEvent(sendDano, 800, cid, pos4[j][i], atk2[spell][2], i*300, min, max)
                            addEvent(sendDano, 800, cid, pos4[j][i], atk2[spell][2], i*310, 0, 0)    
                        else
                            addEvent(sendDist, 350, cid, pos1[j][i], pos1[j][i+1], atk[spell][1], i*330)
                            addEvent(sendDano, 350, cid, pos1[j][i], atk[spell][2], i*300, min, max)
                            addEvent(sendDano, 350, cid, pos1[j][i], atk[spell][2], i*310, 0, 0)
                            ---
                            addEvent(sendDist, 350, cid, pos2[j][i], pos2[j][i+1], atk[spell][1], i*330)
                            addEvent(sendDano, 350, cid, pos2[j][i], atk[spell][2], i*300, min, max)
                            addEvent(sendDano, 350, cid, pos2[j][i], atk[spell][2], i*310, 0, 0)
                            ----
                            addEvent(sendDist, 800, cid, pos3[j][i], pos3[j][i+1], atk[spell][1], i*330)
                            addEvent(sendDano, 800, cid, pos3[j][i], atk[spell][2], i*300, min, max)
                            addEvent(sendDano, 800, cid, pos3[j][i], atk[spell][2], i*310, 0, 0)
                            ---
                            addEvent(sendDist, 800, cid, pos4[j][i], pos4[j][i+1], atk[spell][1], i*330)
                            addEvent(sendDano, 800, cid, pos4[j][i], atk[spell][2], i*300, min, max)
                            addEvent(sendDano, 800, cid, pos4[j][i], atk[spell][2], i*310, 0, 0)
                        end
                    end
                end
            end
        end
        
        if spell == "Electro Field" then
            addEvent(doMoveInArea2, 1000, cid, 0, electro, ELECTRICDAMAGE, 0, 0, spell, ret)
        end
        
        if spell == "Rock Storm" then
            addEvent(doMoveInArea2, 1000, cid, 0, electro, ROCKDAMAGE, 0, 0, spell, ret)
        end
        
        if spell == "Waterfall" then
            addEvent(doMoveInArea2, 800, cid, 0, electro, WATERDAMAGE, 0, 0, spell, ret)
        end
        
        if spell == "Venomous Gale" then
           local config = {
                Pull = function(cid)
                    local pid = getSpectators(getThingPos(cid), 6, 6)
                    if pid and #pid > 0 then
                        for i = 1, #pid do
                            if pid[i] ~= cid and ehMonstro(pid[i]) and not isInArray({"Abporygon", "Aporygon"}, getCreatureName(pid[i])) then
                                doTeleportThing(pid[i], getClosestFreeTile(cid, getThingPos(cid)))
                            end
                        end
                    end
                end,
            }
            
            if isSummon(cid) then
                config.Pull(cid)    
            end     
            addEvent(doMoveInArea2, 50, cid, 0, dazeDano, POISONDAMAGE, 0, 0, spell, ret)           
                doSendMagicEffect(getThingPos(cid), 990)
                stopNow(cid, 3000)
                doDisapear(cid)
                addEvent(doAppear, 3000, cid)                   
                addEvent(function()
            if isCreature(cid) then
                if isSummon(cid) then
                    local oldpos = getThingPos(cid)
                    local oldlod = getCreatureLookDir(cid)
                    local poke = getCreatureName(cid)
                    master = getCreatureMaster(cid)
                    local pk = getCreatureSummons(master)[1]

                    doTeleportThing(pk, oldpos, false)
                    doCreatureSetLookDir(pk, oldlod)
                else
                    doAppear(cid)
                end
            end
        end, 4000)
        end
        
        
        if spell == "Flame Circlel" then --alterado v1.8
            doTornado(cid)
        else
            for b = 0, 2 do
            if spell == "Waterfall" then
                addEvent(doTornado, b*1200, cid)
            elseif spell == "Venomous Gale" then
                 doSendMagicEffect(getThingPos(cid), 990)
                addEvent(doTornado, b*400, cid)              
                else
                addEvent(doTornado, b*1500, cid)
                end
            end
        end
    
return true
end