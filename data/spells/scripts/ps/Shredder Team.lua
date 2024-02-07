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

    if isSummon(cid) then  

        local team = {
            ["Scyther"] = "ScytherTeam",
            ["Shiny Scyther"] = "Shiny ScytherTeam",
            ["Scizor"] = "ScizorTeam",
        }

        local function RemoveTeam(cid)
            if isCreature(cid) then
                doSendMagicEffect(getThingPosWithDebug(cid), 211)
                doRemoveCreature(cid)
            end
        end

        local function sendEff(cid, master, t)
            if isCreature(cid) and isCreature(master) and t > 0 and #getCreatureSummons(master) >= 2 then
                doSendMagicEffect(getThingPosWithDebug(cid), 86, master)
                addEvent(sendEff, 1000, cid, master, t-1)                        --alterado v1.9
            end
        end

        if getPlayerStorageValue(cid, 637500) >= 1 then
            return true
        end

        local master = getCreatureMaster(cid)
        local item = getPlayerSlotItem(master, 8)
        local life, maxLife = getCreatureHealth(cid), getCreatureMaxHealth(cid)
        local name = getItemAttribute(item.uid, "poke")
        local pos = getThingPosWithDebug(cid)
        local time = 21

        doItemSetAttribute(item.uid, "hp", (life/maxLife))

        local num = getSubName(cid, target) == "Scizor" and 4 or 3
        local pk = {}

        doTeleportThing(cid, {x=4, y=3, z=10}, false) 

        if team[name] then
            pk[1] = cid
            for b = 2, num do
                pk[b] = doSummonCreature(team[name], pos)
                doConvinceCreature(master, pk[b])
            end

            for a = 1, num do
                addEvent(doTeleportThing, math.random(0, 5), pk[a], getClosestFreeTile(pk[a], pos), false)
                addEvent(doAdjustWithDelay, 5, master, pk[a], true, true, true)
                doSendMagicEffect(getThingPosWithDebug(pk[a]), 211)
            end 
            sendEff(cid, master, time)     --alterado v1.9
            setPlayerStorageValue(master, 637501, 1)
            addEvent(setPlayerStorageValue, time * 1000, master, 637501, -2)
            -----
            setPlayerStorageValue(pk[2], 637500, 1)
            addEvent(RemoveTeam, time * 1000, pk[2])
            -----
            setPlayerStorageValue(pk[3], 637500, 1)
            addEvent(RemoveTeam, time * 1000, pk[3])
            ----
            if getSubName(cid, target) == "Scizor" then  
                setPlayerStorageValue(pk[4], 637500, 1) 
                addEvent(RemoveTeam, time * 1000, pk[4])
            end
        end
        return true
    end
    
    
    local team = {
        ["Scyther"] = "ScytherTeam",
        ["Tribal Scyther"] = "Tribal ScytherTeam",
        ["Shiny Scyther"] = "Shiny ScytherTeam",
        ["Furious Scyther"] = "Furious ScytherTeam",
        ["Scizor"] = "ScizorTeam",
        ["Metal Scizor"] = "ScizorTeam",
    }

    function adjustLife(cid, health)
        if isCreature(cid) then
            setCreatureMaxHealth(cid, (getVitality(cid) * HPperVITwild)) 
            doCreatureAddHealth(cid,  getCreatureMaxHealth(cid))
            doCreatureAddHealth(cid, -(math.abs(health)))
        end
    end   
   
    function setStorage(cid, storage)
        if isCreature(cid) then
            if getPlayerStorageValue(cid, storage) >= 1 then
                setPlayerStorageValue(cid, storage, 0)
            end
        end
    end

    function RemoveTeam(cid)
        if isCreature(cid) then
            doSendMagicEffect(getThingPos(cid), 211)
            doRemoveCreature(cid)
        end
    end

    if getPlayerStorageValue(cid, 637500) >= 1 or getPlayerStorageValue(cid, 637501) >= 1 then
        return true
    end

    local name = getCreatureName(cid)
    local pos = getThingPos(cid)
    local time = 15
    local life, maxLife = getCreatureHealth(cid), getCreatureMaxHealth(cid)
    local gender = getPokemonGender(cid)
    local num = (name == "Scizor") and 4 or 3
    local pk = {}

    doCreatureSay(cid, "Shredder Team!", TALKTYPE_MONSTER)
    if team[name] then

        pk[1] = cid
        doSendMagicEffect(getThingPos(pk[1]), 211)
        doTeleportThing(pk[1], {x=4, y=3, z=10}, false)
        addEvent(doTeleportThing, math.random(0, 5), pk[1], getClosestFreeTile(pk[1], pos), false)
   
        for i = 2, num do
            pk[i] = doSummonCreature(team[name], pos)
            if isCreature(pk[i]) then
                doConvinceCreature(pk[1], pk[i])
                ----
                doTeleportThing(pk[i], getClosestFreeTile(pk[i], pos), false)
                addEvent(setPokemonGender, 150, pk[i], gender)
                addEvent(adjustLife, 150, pk[i], life-maxLife)
                doSendMagicEffect(getThingPos(pk[i]), 211)
            end
        end
   
        setPlayerStorageValue(pk[1], 637501, 1)
        addEvent(setStorage, time * 1000, pk[1], 637501)
        ---
        setPlayerStorageValue(pk[2], 637500, 1)
        addEvent(RemoveTeam, time * 1000, pk[2])
        ---
        setPlayerStorageValue(pk[3], 637500, 1)
        addEvent(RemoveTeam, time * 1000, pk[3])
        ---
        if name == "Scizor" then
            setPlayerStorageValue(pk[4], 637500, 1)
            addEvent(RemoveTeam, time * 1000, pk[4])
       end
    end
    
return true
end