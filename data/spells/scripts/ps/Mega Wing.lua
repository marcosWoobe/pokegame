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


        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {364, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
            [1] = {361, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0}, 
            [2] = {363, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
            [3] = {362, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0}, 
        }
        qualDano = DRAGONDAMAGE
        
        if spell == "Mega Wing" then
            t = {
                [0] = {369, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5, 595, posC},
                [1] = {367, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0, 592, posC}, 
                [2] = {366, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5, 593, posC},
                [3] = {368, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0, 594, posC}, 
            }
            qualDano = STEELDAMAGE
        elseif spell == "Mach Punch" then
            t = {
                [0] = {569, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
                [1] = {568, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0}, 
                [2] = {566, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
                [3] = {567, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0}, 
            }
            qualDano = FIGHTINGDAMAGE
        elseif spell == "Shadow Sneak" then
            t = {
                [0] = {686, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
                [1] = {687, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0}, 
                [2] = {689, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
                [3] = {688, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0}, 
            }
            qualDano = GHOSTDAMAGE
        elseif spell == "Nuzzle" then
            t = {
                [0] = {589, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
                [1] = {590, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0}, 
                [2] = {588, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
                [3] = {591, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0}, 
            }
            qualDano = ELECTRICDAMAGE
        elseif spell == "Shadow Mist" then
            t = {
                [0] = {675, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
                [1] = {677, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0}, 
                [2] = {676, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
                [3] = {674, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0}, 
            }
            qualDano = GHOSTDAMAGE
        elseif spell == "Flash Kick" then
            if isInArray({"Elite Hitmonlee", "Shiny Hitmonlee"}, getSubName(cid, target)) then
                t = {
                    [0] = {648, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
                    [1] = {650, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0}, 
                    [2] = {649, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
                    [3] = {647, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0}, 
                }
            else
                t = {
                    [0] = {658, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
                    [1] = {660, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0}, 
                    [2] = {659, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
                    [3] = {657, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0}, 
                }
            end
            qualDano = FIGHTINGDAMAGE
        elseif spell == "Fenix Dash" then
            t = {
                [0] = {865, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
                [1] = {866, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0}, 
                [2] = {867, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
                [3] = {864, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0}, 
            }
            qualDano = FIREDAMAGE
        --          
        end
        
        local function doTeleportMe(cid, pos)
            if not isCreature(cid) then return true end
            if canWalkOnPos(pos, false, true, true, true, true) then 
                doTeleportThing(cid, pos)
            end
            
             if spell == "Fenix Dash" then
              addEvent(doAppear, 450, cid)
             else 
              doAppear(cid)
             end
            
            
            if getPlayerStorageValue(cid, storages.isMega) == "Mega Ampharos" then
                doPantinOutfit(cid, 0, getPlayerStorageValue(cid, storages.isMega))
            else
                
                -- if not isInArray({"Skarmory", "Plusle", "Infernape", "Altaria"}, getSubName(cid, target)) then 
                -- if getPlayerStorageValue(cid, storages.isMega) ~= -1 then
                
                if isMega(cid) then
                    doSetCreatureOutfit(cid, {lookType = megasConf[getPlayerStorageValue(cid, storages.isMega)].out}, -1)
                    checkOutfitMega(cid, getPlayerStorageValue(cid, storages.isMega))   
                end
            end
        end
        
        if spell == "Nuzzle" then
            doSendMagicEffect(posC, 355) -- efeito de portal antes de ir
            -- efeito de portal/teleportando dps q termina o attk
        end 
        
        if spell == "Shadow Sneak" then
            doSendMagicEffect(posC1, 697)
            doMoveInArea2(cid, 0, reto5, qualDano, min, max, spell) -- area do shadow sneak
            addEvent(doSendMagicEffect, 30, t[a][2], t[a][1])
        else
            doMoveInArea2(cid, 0, triplo6, qualDano, min, max, spell) -- area padrão para o resto da sspells (6 sqm de distância e 3 sqm de largura)
            doSendMagicEffect(t[a][2], t[a][1])
        end
        
        local pos = getThingPos(cid)
        doSendMagicEffect(pos, 307)
        doDisapear(cid) 
        local x, y = t[a][3], t[a][4]
        
        pos.x = pos.x + x
        pos.y = pos.y + y   
        addEvent(doTeleportMe, 300, cid, pos)   

    
return true
end