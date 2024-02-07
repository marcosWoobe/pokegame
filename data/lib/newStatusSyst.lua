conds = {
    ["Slow"] = 3890,
    ["Confusion"] = 3891, 
    ["Burn"] = 3892,
    ["Poison"] = 3893,
    ["Fear"] = 3894,
    ["Stun"] = 3895,
    ["Paralyze"] = 3896, --alterado v1.6 \/ peguem o script todo!
    ["Leech"] = 3897,
    ["Buff1"] = 3898,
    ["Buff2"] = 3899,
    ["Buff3"] = 3900,
    ["Miss"] = 32659, 
    ["Silence"] = 32698, 
    ["Sleep"] = 98271,
}

injuries2 = {
    [1] = {n = "slow", m = 3890},
    [2] = {n = "confuse", m = 3891}, 
    [3] = {n = "burn", m = 3892},
    [4] = {n = "poison", m = 3893},
    [5] = {n = "fear", m = 3894},
    [6] = {n = "stun", m = 3895},
    [7] = {n = "paralyze", m = 3896},
    [8] = {n = "leech", m = 3897},
    [9] = {n = "Buff1", m = 3898},
    [10] = {n = "Buff2", m = 3899},
    [11] = {n = "Buff3", m = 3900},
    [12] = {n = "miss", m = 32659}, 
    [13] = {n = "silence", m = 32698}, 
    [14] = {n = "sleep", m = 98271},
}

Buffs = {
    [1] = {"Buff1", 3898},
    [2] = {"Buff2", 3899},
    [3] = {"Buff3", 3900},
}

paralizeArea2 = createConditionObject(CONDITION_PARALYZE)
setConditionParam(paralizeArea2, CONDITION_PARAM_TICKS, 50000)
setConditionFormula(paralizeArea2, -0.63, -0.63, -0.63, -0.63)

local roardirections = {
    [NORTH] = {SOUTH},
    [SOUTH] = {NORTH},
    [WEST] = {EAST}, --edited sistema de roar
[EAST] = {WEST}}

function doSendSleepEffect(cid)
    if not isCreature(cid) or not isSleeping(cid) then return true end
    doSendMagicEffect(getThingPos(cid), 32)
    addEvent(doSendSleepEffect, 1500, cid)
end

local outFurys = {
    ["Charizard"] = {outFury = 801},
    ["Shiny Charizard"] = {outFury = 1073}, 
    ["Elder Charizard"] = {outFury = 1073}, 
    ["Shiny Blastoise"] = {outFury = 1074}, 
    ["Ancient Blastoise"] = {outFury = 1074}, 
    ["Ditto"] = {outFury = null}, 
}

local outImune = {
    ["Camouflage"] = {
        [643] = 2087
    }, 
    ["Acid Armor"] = {
        [398] = 1453,
        [1283] = 1453
    },
    ["Iron Defense"] = {
        [911] = 1401,
        [2701] = 1401,
        [1892] = 2137,
        [1762] = 1828,
        [1763] = 1825
    },
    ["Minimize"] = {[1457] = 1455,[910] = 669}, -- qwilfish, forretress
    ["Future Sight"] = {[889] = 1446,[1537] = 1536}, -- xatu e shiny xatu
    ["Psychic Sight"] = {[1537] = 1536}, -- shiny xatu
    ["Predict"] = {[1537] = 1536}, -- shiny xatu
}

lengedaryPokemons = {"Shiny Salamence", "Shiny Magmortar", "Shiny Electivire", "Shiny Scizor", "Moltres", "Zapdos", "Articuno", "Mew", "Mewtwo", "Entei", "Suicune", "Raikou", "Celebi", "Lugia", "Rayquaza"}
function ehLenda(cid)
    if isCreature(cid) and isInArray(lengedaryPokemons, getCreatureName(cid)) then
        return true
    end
end

local function transBack(cid)
    if isCreature(cid) then
        if getPlayerStorageValue(cid, 974848) >= 1 then
            setPlayerStorageValue(cid, 974848, 0)
            doRemoveCondition(cid, CONDITION_OUTFIT)
        end
    end
end

function doDamageInTarget(cid, target, dMin, dMax, effect, dType) -- refeita 
    if not isCreature(cid) or not isCreature(target) then return true end 
    local dano = math.random(dMin, dMax)
    
    doCreatureAddHealth(target, -dano, effect, typeTable[dType].color)
    
end

function doDamageInTargetWithDelay(cid, target, dMin, dMax, effect, dType) -- refeita 
    if not isCreature(cid) or not isCreature(target) then return true end 
    local const_distance_delay = 56
    
    local delay = getDistanceBetween(getThingPos(cid), getThingPos(target)) * const_distance_delay
    addEvent(doDamageInTarget, delay, cid, target, dMin, dMax, effect, dType)
    
end

function doCondition2(ret)
    
    function doMiss2(cid, cd, eff, check, spell)
        local stg = conds["Miss"]
        if not isCreature(cid) then return true end --is creature?
        if getPlayerStorageValue(cid, 21100) >= 1 and getPlayerStorageValue(cid, stg) <= -1 then return true end --alterado v1.6 reflect
        if not canDoMiss(cid, spell) then return true end
        if getPlayerStorageValue(cid, stg) >= 1 and cd ~= -1 then 
            setPlayerStorageValue(cid, stg, cd) --allterado v1.8
            return true 
        end 
        if not check and getPlayerStorageValue(cid, stg) >= 1 then
            if ehLenda(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 4) - 1)
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 2) - 1)
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd - 1)
            end
        else
            if ehLenda(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 4))
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 2))
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd)
            end
        end
        
        local a = getPlayerStorageValue(cid, stg)
        
        if isSummon(cid) and getPlayerStorageValue(cid, 212123) <= 0 then
            local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
            doItemSetAttribute(item.uid, "miss", a)
            doItemSetAttribute(item.uid, "missEff", eff)
            doItemSetAttribute(item.uid, "missSpell", spell)
        end
        
        if a <= -1 then 
            setPlayerStorageValue(cid, stg, -1)
            return true 
        end
        
        doSendMagicEffect(getThingPos(cid), eff)
        addEvent(doMiss2, 1000, cid, -1, eff, a, spell) 
    end 
    
    function doSilence2(cid, cd, eff, check)
        local stg = conds["Silence"]
        if not isCreature(cid) then return true end --is creature?
        if getPlayerStorageValue(cid, stg) >= 1 and cd ~= -1 then 
            setPlayerStorageValue(cid, stg, cd) --allterado v1.8
            return true 
        end
        if not check and getPlayerStorageValue(cid, stg) >= 1 then
            if ehLenda(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 5) - 1)
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 2) - 1)
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd - 1)
            end
        else
            if ehLenda(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 5))
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 2))
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd)
            end
        end
        
        local a = getPlayerStorageValue(cid, stg)
        
        if isSummon(cid) and getPlayerStorageValue(cid, 212123) <= 0 then
            local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
            doItemSetAttribute(item.uid, "silence", a)
            doItemSetAttribute(item.uid, "silenceEff", eff)
        end
        
        if a <= -1 then 
            setPlayerStorageValue(cid, stg, -1)
            return true 
        end
        
        doSendMagicEffect(getThingPos(cid), eff)
        addEvent(doSilence2, 1000, cid, -1, eff, a) 
    end 
    
    function doSlow2(cid, cd, eff, check, first)
        local stg = conds["Slow"]
        if not isCreature(cid) then return true end --is creature?
        if getPlayerStorageValue(cid, stg) >= 1 and cd ~= -1 then 
            setPlayerStorageValue(cid, stg, cd) --allterado v1.8
            return true 
        end
        if not check and getPlayerStorageValue(cid, stg) >= 1 then
            if ehLenda(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 4) - 1)
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 2) - 1)
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd - 1)
            end
        else
            if ehLenda(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 4))
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 2))
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd)
            end
        end
        
        local a = getPlayerStorageValue(cid, stg)
        
        if isSummon(cid) and getPlayerStorageValue(cid, 212123) <= 0 then
            local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
            doItemSetAttribute(item.uid, "slow", a)
            doItemSetAttribute(item.uid, "slowEff", eff)
        end
        
        if a <= -1 then 
            doRemoveCondition(cid, CONDITION_PARALYZE)
            if not isSleeping(cid) and not isParalyze(cid) then
                addEvent(doRegainSpeed, 50, cid) --alterado
            end
            setPlayerStorageValue(cid, stg, -1)
            return true 
        end
        
        if first then
            doAddCondition(cid, paralizeArea2) 
        end 
        
        doSendMagicEffect(getThingPos(cid), eff)
        addEvent(doSlow2, 1000, cid, -1, eff, a) 
    end 
    
    function doConfusion2(cid, cd, check)
        local stg = conds["Confusion"]
        if not isCreature(cid) then return true end --is creature?
        if getPlayerStorageValue(cid, stg) >= 1 and cd ~= -1 then 
            setPlayerStorageValue(cid, stg, cd) --allterado v1.8
            return true 
        end
        if not check and getPlayerStorageValue(cid, stg) >= 1 then
            if ehLenda(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 3) - 1)
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 2) - 1)
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd - 1)
            end
        else
            if ehLenda(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 3))
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 2))
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd)
            end
        end
        
        local a = getPlayerStorageValue(cid, stg)
        
        if isSummon(cid) and getPlayerStorageValue(cid, 212123) <= 0 then
            local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
            doItemSetAttribute(item.uid, "confuse", a)
        end
        
        if a <= -1 then 
            if getCreatureCondition(cid, CONDITION_PARALYZE) == true then 
            end
            if not isSleeping(cid) and not isParalyze(cid) then
            end
            setPlayerStorageValue(cid, stg, -1)
            return true 
        end
        
        if math.random(1, 6) >= 4 then
            doSendMagicEffect(getThingPos(cid), 31)
        end
        
        local isTarget = isSummon(cid) and getCreatureTarget(getCreatureMaster(cid)) or getCreatureTarget(cid)
        if isCreature(isTarget) and not isSleeping(cid) and not isParalyze(cid) and getPlayerStorageValue(cid, 654878) <= 0 then --alterado v1.6
            doAddCondition(cid, confusioncondition)
        end
        
        local pos = getThingPos(cid)
        addEvent(doSendMagicEffect, math.random(0, 450), pos, 31)
        
        addEvent(doConfusion2, 1000, cid, -1, a) 
    end 
    
    function doBurn2(cid, cd, check, damage)
        local stg = conds["Burn"]
        if not isCreature(cid) then return true end --is creature?
        if getPlayerStorageValue(cid, stg) >= 1 and cd ~= -1 then 
            setPlayerStorageValue(cid, stg, cd) --allterado v1.8
            return true 
        end
        if not check and getPlayerStorageValue(cid, stg) >= 1 then
            setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd - 1)
        else
            setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd)
        end
        
        local a = getPlayerStorageValue(cid, stg)
        
        if isSummon(cid) and getPlayerStorageValue(cid, 212123) <= 0 then       
            local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
            doItemSetAttribute(item.uid, "burn", a)
            doItemSetAttribute(item.uid, "burndmg", damage)
        end
        
        if a <= -1 then 
            setPlayerStorageValue(cid, stg, -1)
            return true 
        end
        local dano = getCreatureHealth(cid)-damage <= 0 and getCreatureHealth(cid)-1 or damage 
        if isSummon(ret.attacker) then -- morrer para veneno
            local player = getCreatureMaster(ret.attacker)
            addPlayerDano(ret.im, player, dano)
        end
        
        --  addEvent(doCreatureAddHealth, 500, cid, -dano, ret.eff, ret.color and ret.color or COLOR_BURN) -- addEvent fazia o dano vir dps do dano da spell da� ficava melhor de ver mas se morrese pra poison bugava o corpo e n�o dava pra tacar ball
        
        doCreatureAddHealth(cid, -dano, ret.eff, ret.color and ret.color or COLOR_BURN) 
        doSendAnimatedText(getCreaturePosition(cid), "BURN", COLOR_RED)
        doSendCreatureEffect(cid, CREATURE_EFFECTS.BURN, 16 * 1000)
        doSendMagicEffect(getThingPos(cid), 15)
        addEvent(doBurn2, 3500, cid, -1, a, damage) 
    end 
    
    function doPoison2(cid, cd, check, damage)
        local stg = conds["Poison"]
        if not isCreature(cid) then return true end --is creature?
        ----------
        if isSummon(cid) or ehMonstro(cid) and pokes[getCreatureName(cid)] then --alterado v1.6
            local type = pokes[getCreatureName(cid)].type
            local type2 = pokes[getCreatureName(cid)].type2
            if isInArray({"poison", "steel"}, type) or isInArray({"poison", "steel"}, type2) then
                return true
            end
        end
        ---------
        if getPlayerStorageValue(cid, stg) >= 1 and cd ~= -1 then 
            setPlayerStorageValue(cid, stg, cd) --allterado v1.8
            return true 
        end
        if not check and getPlayerStorageValue(cid, stg) >= 1 then
            setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd - 1)
        else
            setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd)
        end
        
        local a = getPlayerStorageValue(cid, stg)
        
        if isSummon(cid) and getPlayerStorageValue(cid, 212123) <= 0 and not (getCreatureStorage(cid, 10) == "guardian")  then           

            local heldy = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "yHeldItem")
            if heldy then
                local heldName, heldTier = string.explode(heldy, "|")[1], string.explode(heldy, "|")[2]
                if heldName == "Y-Antipoison" then -- ANTIPOISON
                    damage = damage / 2
                end
            else
                damage = damage
            end 
            
            local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
            doItemSetAttribute(item.uid, "poison", a)
            doItemSetAttribute(item.uid, "poisondmg", damage)
        end
        
        if a <= -1 or getCreatureHealth(cid) == 1 then 
            setPlayerStorageValue(cid, stg, -1)
            return true 
        end
        
        
        
        local dano = getCreatureHealth(cid)-damage <= 0 and getCreatureHealth(cid)-1 or damage 
        if isSummon(ret.attacker) then -- morrer para veneno
            local player = getCreatureMaster(ret.attacker)
            addPlayerDano(ret.im, player, dano)
        end
        
        --      addEvent(doCreatureAddHealth, 400, cid, -dano, 8, COLOR_GRASS) -- addEvent fazia o dano vir dps do dano da spell da� ficava melhor de ver mas se morrese pra poison bugava o corpo e n�o dava pra tacar ball
        
        doCreatureAddHealth(cid, -dano, 8, COLOR_GRASS)    
        doSendAnimatedText(getCreaturePosition(cid), "POISON", COLOR_GREEN)
        doSendCreatureEffect(cid, CREATURE_EFFECTS.POISON, 16 * 1000)         
        addEvent(doPoison2, 1500, cid, -1, a, damage)
    end 
    
    function doFear2(cid, cd, check, skill)
        local stg = conds["Fear"]
        if not isCreature(cid) then return true end --is creature?
        if getPlayerStorageValue(cid, stg) >= 1 and cd ~= -1 then 
            setPlayerStorageValue(cid, stg, cd) --allterado v1.8
            return true 
        end
        if not check and getPlayerStorageValue(cid, stg) >= 1 then
            if ehLenda(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 4) - 1)
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 2) - 1)
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd - 1)
            end
        else
            if ehLenda(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 4))
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 2))
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd)
            end
        end
        
        local a = getPlayerStorageValue(cid, stg)
        
        if isSummon(cid) and getPlayerStorageValue(cid, 212123) <= 0 then
            local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
            doItemSetAttribute(item.uid, "fear", a)
            doItemSetAttribute(item.uid, "fearSkill", skill)
        end
        
        if a <= -1 then 
            if getCreatureCondition(cid, CONDITION_PARALYZE) == true then
                doRemoveCondition(cid, CONDITION_PARALYZE)
                addEvent(doAddCondition, 10, cid, paralizeArea2) 
            end
            if not isSleeping(cid) and not isParalyze(cid) then
                doRegainSpeed(cid) --alterado 
            end
            setPlayerStorageValue(cid, stg, -1)
            setCreatureTargetDistance(cid, getCreatureDefaultTargetDistance(cid))
            return true 
        end
        
        if skill == "Roar" then
            eff = 244
        else --edited Roar
            eff = 139
        end
        
        if math.random(1, 6) >= 4 then
            doSendMagicEffect(getThingPos(cid), eff)
        end
        
        local isTarget = isSummon(cid) and getCreatureTarget(getCreatureMaster(cid)) or getCreatureTarget(cid)
        if isCreature(isTarget) and not isSleeping(cid) and not isParalyze(cid) and getPlayerStorageValue(cid, 654878) <= 0 then --alterado v1.6
            local dir = getCreatureDirectionToTarget(cid, isTarget)
            setCreatureTargetDistance(cid, 6)
        end
        
        local pos = getThingPos(cid)
        addEvent(doSendMagicEffect, math.random(0, 450), pos, eff)
        
        addEvent(doFear2, 400, cid, -1, a, skill) 
    end 
    
    function doStun2(cid, cd, eff, check, spell)
        local stg = conds["Stun"]
        if not isCreature(cid) then return true end --is creature?
        if not canDoMiss(cid, spell) then return true end
        if getPlayerStorageValue(cid, stg) >= 1 and cd ~= -1 then 
            setPlayerStorageValue(cid, stg, cd) --allterado v1.8
            return true 
        end
        if not check and getPlayerStorageValue(cid, stg) >= 1 then
            if ehLenda(cid) or getCreatureName(cid) == "Banette" then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 5) - 1)
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 2) - 1)
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd - 1)
            end
        else
            if ehLenda(cid) or getCreatureName(cid) == "Banette"  then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 5))
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 2))
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd)
            end
        end
        
        local a = getPlayerStorageValue(cid, stg)
        
        if isSummon(cid) and getPlayerStorageValue(cid, 212123) <= 0 then
            local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
            doItemSetAttribute(item.uid, "stun", a)
            doItemSetAttribute(item.uid, "stunEff", eff)
            doItemSetAttribute(item.uid, "stunSpell", spell)
        end
        
        if a <= -1 then
            doRemoveCondition(cid, CONDITION_PARALYZE)
            if not isSleeping(cid) and not isParalyze(cid) then
                addEvent(doRegainSpeed, 50, cid) --alterado 
            end
            setPlayerStorageValue(cid, stg, -1)
            return true 
        end
        
        if getCreatureCondition(cid, CONDITION_PARALYZE) == false then
            doAddCondition(cid, paralizeArea2)
        end 
        doSendMagicEffect(getThingPos(cid), eff)
        addEvent(doStun2, 1000, cid, -1, eff, a, spell) 
    end 
    
    function doParalyze2(cid, cd, eff, check, first)
        local stg = conds["Paralyze"]
        if not isCreature(cid) then return true end --is creature?
        if getPlayerStorageValue(cid, stg) >= 1 and cd ~= -1 then 
            setPlayerStorageValue(cid, stg, cd) --allterado v1.8
            return true 
        end
        if not check and getPlayerStorageValue(cid, stg) >= 1 then
            if ehLenda(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 3) - 1)
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 2) - 1)
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd - 1)
            end
        else
            if ehLenda(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 3))
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 2))
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd)
            end
        end
        
        local a = getPlayerStorageValue(cid, stg)
        
        if isSummon(cid) and getPlayerStorageValue(cid, 212123) <= 0 then
            local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
            doItemSetAttribute(item.uid, "paralyze", a)
            doItemSetAttribute(item.uid, "paralyzeEff", eff)
        end
        
        if a <= -1 then 
            if isPlayer(cid) then
                if not isSleeping(cid) then --alterado
                    mayNotMove(cid, false)
                end
            else
                if getCreatureCondition(cid, CONDITION_PARALYZE) == true then
                    doRemoveCondition(cid, CONDITION_PARALYZE)
                    addEvent(doAddCondition, 10, cid, paralizeArea2) 
                end
                if not isSleeping(cid) then
                    doRegainSpeed(cid) --alterado
                end
            end 
            setPlayerStorageValue(cid, stg, -1)
            return true 
        end
        
        if isPlayer(cid) then
            mayNotMove(cid, true)
        else --alterado v1.6
            doChangeSpeed(cid, -2000)
        end 
        doSendMagicEffect(getThingPos(cid), eff)
        addEvent(doParalyze2, 1000, cid, -1, eff, a, false) 
    end 
    
    function doSleep2(cid, cd, check, first) 
        local stg = conds["Sleep"]
        if not isCreature(cid) then return true end 
        
        if not isSleeping(cid) then
            addEvent(doSendSleepEffect, 500, cid)
        end
        
        if not check and getPlayerStorageValue(cid, stg) >= 1 then
            if ehLenda(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 4) - 1)
            elseif isMega(cid) and isWild(cid) then     
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 4) - 1)
            else    
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd - 1)
            end
        else
            if ehLenda(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 4))
            elseif isMega(cid) and isWild(cid) then
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + (cd - 4))
            else
                setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd)
            end
        end
        
        local a = getPlayerStorageValue(cid, stg)
        
        if isSummon(cid) and getPlayerStorageValue(cid, 212123) <= 0 then
            local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
            doItemSetAttribute(item.uid, "sleep", a)
        end
        
        if a <= -1 then 
            if isPlayer(cid) then
                if not isParalyze(cid) then
                    doRegainSpeed(cid) --alterado
                    mayNotMove(cid, false)
                end
            else
                if getCreatureCondition(cid, CONDITION_PARALYZE) == true then
                    doRemoveCondition(cid, CONDITION_PARALYZE)
                    addEvent(doAddCondition, 10, cid, paralizeArea2) 
                end
                if not isParalyze(cid) then
                    doRegainSpeed(cid) --alterado
                end
            end
            setPlayerStorageValue(cid, stg, -1)
            if not isMega(cid) then
                if isRiderOrFlyOrSurf(cid) then
                    return false
                end
                    doRemoveCondition(cid, CONDITION_OUTFIT)
            end         
            return true 
        end
        
        if first and not isPlayer(cid) then 
            if getCreatureName(cid) == "Ursaring" and getCreatureCondition(cid, CONDITION_OUTFIT) == true then
                
            elseif not isPlayer(cid) and not isMega(cid) then
                if isInArray({604, 605, 1015, 1016, 1183, 1184}, getCreatureOutfit(cid).lookType) then
                    Info = 0 --alterado v1.6
                else         
                    Info = getMonsterInfo(getCreatureName(cid)).lookCorpse 
                end 
                local look = getCreatureOutfit(cid) 
                ---------
                local dittoStg = getPlayerStorageValue(cid, 1010) 
                if getCreatureName(cid) == "Ditto" and isSummon(cid) and tostring(dittoStg) and dittoStg ~= "Ditto" then
                    local InfoDitto = getMonsterInfo(tostring(dittoStg)).lookCorpse
                    if InfoDitto ~= 0 and look.lookType ~= 0 then 
                        doSetCreatureOutfit(cid, {lookType = 0, lookTypeEx = getMonsterInfo(tostring(dittoStg)).lookCorpse}, -1)
                    end 
                else
                    if getCreatureName(cid) == "Shiny Golem" and getCreatureOutfit(cid).lookType == 1403 then
                        doRemoveCondition(cid, CONDITION_OUTFIT) 
                    elseif Info ~= 0 and look.lookType ~= 0 then
                        doSetCreatureOutfit(cid, {lookType = 0, lookTypeEx = getMonsterInfo(getCreatureName(cid)).lookCorpse}, -1)
                    end
                end
            end
        end
        if isPlayer(cid) then
            mayNotMove(cid, true)
        else
            doChangeSpeed(cid, -getCreatureSpeed(cid))
        end
        addEvent(doSleep2, 1000, cid, -1, a, false)
    end 
    
    function doLeech2(cid, attacker, cd, check, damage)
        local stg = conds["Leech"]
        if not isCreature(cid) then return true end --is creature?
        if attacker ~= 0 and not isCreature(attacker) then return true end --is creature?
        if getPlayerStorageValue(cid, stg) >= 1 and cd ~= -1 then 
            setPlayerStorageValue(cid, stg, cd) --allterado v1.8
            return true 
        end
        if not check and getPlayerStorageValue(cid, stg) >= 1 then
            setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd - 1)
        else
            setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd)
        end
        
        local a = getPlayerStorageValue(cid, stg)
        
        if isSummon(cid) and getPlayerStorageValue(cid, 212123) <= 0 then
            local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
            doItemSetAttribute(item.uid, "leech", a)
            doItemSetAttribute(item.uid, "leechdmg", damage)
        end
        
        if a <= -1 then 
            setPlayerStorageValue(cid, stg, -1)
            return true 
        end
        
        local life = getCreatureHealth(cid)
        --damage = getCreatureHealth(cid) - damage <= 0 and getCreatureHealth(cid) - 1 or damage 
        
        if damage >= life then
            doSendAnimatedText(getThingPos(cid), "-"..damage.."", 144)
            doSendAnimatedText(getThingPos(attacker), "+"..damage.."", 32)
            doKillWildPoke(attacker, cid) -- mixlort
            -- if isCreature(cid) then
               -- if pokeHaveReflect(cid) then return true end    --alterado v1.6
               -- doCreatureAddHealth(cid, -getCreatureMaxHealth(cid))
            -- end
            return false
        end
        ------
        doCreatureAddHealth(cid, -damage)
        doSendAnimatedText(getThingPos(cid), "-"..damage.."", 144)
        doSendMagicEffect(getThingPos(cid), 45)
        ------
        local newlife = life - getCreatureHealth(cid)
        if newlife >= 1 and attacker ~= 0 then
            doSendMagicEffect(getThingPos(attacker), 14)
            doCreatureAddHealth(attacker, newlife)
            doSendAnimatedText(getThingPos(attacker), "+"..newlife.."", 32)
            local dano = getCreatureHealth(cid)-damage <= 0 and getCreatureHealth(cid)-1 or damage 
            if isSummon(attacker) then -- morrer para veneno
                local player = getCreatureMaster(attacker)
                addPlayerDano(cid, player, dano)
            end
        end 
        addEvent(doLeech2, 2000, cid, attacker, -1, a, damage) 
    end 
    
    function doBuff2(cid, cd, eff, check, buff, first, attr)
        if not isCreature(cid) then return true end --is creature?
        ---------------------
        local atributo = attr and attr or ""
        if first and atributo == "" then
            for i = 1, 3 do 
                if getPlayerStorageValue(cid, Buffs[i][2]) <= 0 then
                    atributo = Buffs[i][1]
                    break
                end
            end
        end
        if atributo == "" then return true end
        if ehMonstro(cid) then atributo = "Buff1" end
        ----------------------
        local stg = conds[atributo]
        
        if getPlayerStorageValue(cid, stg) >= 1 and cd ~= -1 then return true end --n usar 2x
        
        if not check and getPlayerStorageValue(cid, stg) >= 1 then
            setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd - 1)
        else
            setPlayerStorageValue(cid, stg, getPlayerStorageValue(cid, stg) + cd)
        end
        
        local a = getPlayerStorageValue(cid, stg)
        
        if isSummon(cid) and getPlayerStorageValue(cid, 212123) <= 0 then
            local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
            doItemSetAttribute(item.uid, atributo, a)
            doItemSetAttribute(item.uid, atributo.."eff", eff)
            doItemSetAttribute(item.uid, atributo.."skill", buff)
        end
        
        if a <= -1 then --alterado v1.6
            if isInArray({"Psychic Sight", "Heal Bell", "Future Sight", "Predict", "Camouflage", "Acid Armor", "Iron Defense", "Minimize", "Bug Fighter", "Protect", "Light Screen", "Ancient Fury"}, buff) then
                if not isSleeping(cid) then
                    if buff ~= " " then
                        doRemoveCondition(cid, CONDITION_OUTFIT)
                    end
                end
                setPlayerStorageValue(cid, 9658783, -1)
                setPlayerStorageValue(cid, 625877, -1) --alterado v1.6 
            end 
            if isInArray({"Speed Boost", "Eruption", "Elecball", "Strafe", "Agility", "Wish", "Ancient Fury", "War Dog", "Fighter Spirit", "Furious Legs", "Ultimate Champion", "Bug Fighter"}, buff) then
                setPlayerStorageValue(cid, 374896, -1) --alterado v1.6
            end 
            setPlayerStorageValue(cid, stg, -1) 
            return true 
        end
        
        if buff == "Protect" then
            local posC2 = getThingPosWithDebug(cid) posC2.x = posC2.x+1 posC2.y = posC2.y+1
            doSendMagicEffect(posC2, 486)
        else
            doSendMagicEffect(getThingPos(cid), eff) -- posi��o default para o ret.effect
        end
        
        if buff == "Magnetic Flux" then
            local posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+1 posC1.y = posC1.y+1
            doSendMagicEffect(posC1, 896)
        else
            doSendMagicEffect(getThingPos(cid), eff) -- posi��o default para o ret.effect
        end
        
        if first then
            if buff == "Strafe" or buff == "Wish" or buff == "Agility" or buff == "Speed Boost" then
                setPlayerStorageValue(cid, 374896, 1) --velo atk --alterado v1.6
                doRaiseStatus(cid, 0, 0, 100, a)
            elseif buff == "Eruption" or buff == "Elecball" then
                setPlayerStorageValue(cid, 374896, 1) --velo atk --alterado v1.6
                doRaiseStatus(cid, 2, 0, 150, a)
            elseif buff == "Tailwind" then
                doRaiseStatus(cid, 0, 0, 250, a)
            elseif buff == "Rage" then
                setPlayerStorageValue(cid, 463523, "Rage")
                addEvent(setPlayerStorageValue, a * 1000, cid, 463523, -1)
            elseif buff == "Steel Defense" then
                doRaiseStatus(cid, 0, 6, 0, a)
            elseif buff == "Harden" then
                doRaiseStatus(cid, 0, 2, 0, a)
            elseif buff == "Calm Mind" then
                doRaiseStatus(cid, 0, 2, 0, a)
            elseif buff == "Magnetic Flux" then
                doRaiseStatus(cid, 0, 4, 250, a)                    
            elseif buff == "Ancient Fury" then
                doSetCreatureOutfit(cid, {lookType = outFurys[doCorrectString(getCreatureName(cid))].outFury}, a*1000)
                setPlayerStorageValue(cid, 374896, 1) --velo atk
                if getCreatureName(cid) == "Shiny Charizard" or getCreatureName(cid) == "Elder Charizard" then 
                    doRaiseStatus(cid, 2, 0, 0, a) --atk melee --alterado v1.6
                else
                    doRaiseStatus(cid, 0, 2, 0, a) --def
                end 
                setPlayerStorageValue(cid, 625877, outFurys[doCorrectString(getCreatureName(cid))].outFury) --alterado v1.6
            elseif buff == "War Dog" or buff == "Bulk Up" or buff == "Outrage" then
                doRaiseStatus(cid, 1.5, 1.5, 0, a)
                setPlayerStorageValue(cid, 374896, 1) --velo atk
            elseif buff == "Rest" then
                doSleep2(cid, cd, getPlayerStorageValue(cid, conds["Sleep"]), true) 
                doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
                setPlayerStorageValue(cid, 42347, tonumber(cd) + os.time())
                -- print(getPlayerStorageValue(cid, 42347))
                -- print(getPlayerStorageValue(cid, 42347) - os.time())
            elseif isInArray({"Fighter Spirit", "Furious Legs", "Ultimate Champion"}, buff) then
                doRaiseStatus(cid, 1.5, 0, 0, a) --atk melee --alterado v1.6
                setPlayerStorageValue(cid, 374896, 1) --velo atk 
                addEvent(setPlayerStorageValue, a*1000, cid, 465987, -1) 
            elseif isInArray({"Psychic Sight", "Heal Bell", "Future Sight", "Predict", "Camouflage", "Acid Armor", "Iron Defense", "Protect", "Light Screen", "Minimize"}, buff) then
                setPlayerStorageValue(cid, 9658783, 1)                      
                setPlayerStorageValue(cid, 625877, outImune[buff]) --alterado v1.6                      
                if not isInArray({"Heal Bell", "Protect", "Light Screen"}, buff) then
                    setPlayerStorageValue(cid, 625877, outImune[buff]) -- Protect e Light Screen n�o mudam a outfit (storage de outfit) 
                    doSetCreatureOutfit(cid, {lookType = outImune[buff][getCreatureOutfit(cid).lookType]}, -1) -- mudar outfit caso possua o nome no array (l� em cima)
                end
                setPlayerStorageValue(cid, 9658783, 1) -- storage de imunidade(?)
            elseif buff == "Bug Fighter" then
                setPlayerStorageValue(cid, 374896, 1) --velo atk --alterado v1.6
                doRaiseStatus(cid, 1.5, 1.5, 100, a)
                doSetCreatureOutfit(cid, {lookType = 1448}, a*1000)
                setPlayerStorageValue(cid, 625877, 1448) --alterado v1.6
            end 
        end 
        addEvent(doBuff2, 1000, cid, -1, eff, a, buff, false, atributo) 
    end
    
    if ret.buff and ret.buff ~= "" then
        doBuff2(ret.id, ret.cd, ret.eff, ret.check, ret.buff, ret.first, (ret.attr and ret.attr or false))
    end
    
    if not isCreature(ret.id) then
        return true
    end
    
    if isGod(ret.id) then
        return true
    end
    
    -- if isSummon(ret.id) and getPokemonBoost(ret.id) ~= 0 and math.random(1, 100) <= getPokemonBoost(ret.id) then --sistema "pegou no boost"
    --     if ret.cond and not isInArray({"Poison", "Leech", "Fear"}, ret.cond) then 
    --             if Tier and Tier > 105 and Tier < 113 and math.random(1,100) <= Tiers[Tier].chance then
    --                 doSendAnimatedText(getThingPosWithDebug(Pkattacker), "ACCURACY", 215)
    --                 doSendCreatureEffect(cid, CREATURE_EFFECTS.HIGHCRITICALCHANCE, 30 * 1000)
    --             else
    --                 doSendMagicEffect(getThingPosWithDebug(ret.id), 114)
    --                 doSendAnimatedText(getThingPosWithDebug(ret.id), "BOOST", 215)
    --                 return false
    --             end
    --         return true
    --     end
    -- end
    
    if getCreatureStorage(ret.id, 10) == "guardian" then return true end

    if isSummon(ret.id) and getPokemonBoost(ret.id) ~= 0 and math.random(1, 100) <= getPokemonBoost(ret.id) then --sistema "pegou no boost"
        local Tiers = {
            [106] = {chance = Accuracy1},
            [107] = {chance = Accuracy2},
            [108] = {chance = Accuracy3},
            [109] = {chance = Accuracy4},
            [110] = {chance = Accuracy5},
            [111] = {chance = Accuracy6},
            [112] = {chance = Accuracy7},
        }
        if ret.cond and not isInArray({"Poison", "Leech", "Fear"}, ret.cond) then 
            if isSummon(Pkattacker) and isPlayer(getCreatureMaster(Pkattacker)) and not (getCreatureStorage(Pkattacker, 10) == "guardian") then
                local Tier = getItemAttribute(getPlayerSlotItem(getCreatureMaster(Pkattacker), 8).uid, "heldx")
                if Tier and Tier > 105 and Tier < 113 and math.random(1,100) <= Tiers[Tier].chance then
                    doSendAnimatedText(getThingPosWithDebug(Pkattacker), "ACCURACY", 215)
                    doSendCreatureEffect(cid, CREATURE_EFFECTS.HIGHCRITICALCHANCE, 30 * 1000)
                else
                    doSendMagicEffect(getThingPosWithDebug(ret.id), 114)
                    doSendAnimatedText(getThingPosWithDebug(ret.id), "BOOST", 215)
                    return false
                end
            end 
        end
    end
    
    if ret.cond and ret.cond == "Miss" then
        doMiss2(ret.id, ret.cd, ret.eff, ret.check, ret.spell)
    elseif ret.cond and ret.cond == "Silence" then
        doSilence2(ret.id, ret.cd, ret.eff, ret.check)
    elseif ret.cond and ret.cond == "Slow" then
        doSlow2(ret.id, ret.cd, ret.eff, ret.check, ret.first)
    elseif ret.cond and ret.cond == "Confusion" then
        doConfusion2(ret.id, ret.cd, ret.check)
    elseif ret.cond and ret.cond == "Burn" then
        doBurn2(ret.id, ret.cd, ret.check, ret.damage)
    elseif ret.cond and ret.cond == "Poison" then
        doPoison2(ret.id, ret.cd, ret.check, ret.damage)
    elseif ret.cond and ret.cond == "Fear" then
        doFear2(ret.id, ret.cd, ret.check, ret.skill)
    elseif ret.cond and ret.cond == "Stun" then
        doStun2(ret.id, ret.cd, ret.eff, ret.check, ret.spell)
    elseif ret.cond and ret.cond == "Paralyze" then
        doParalyze2(ret.id, ret.cd, ret.eff, ret.check, ret.first)
    elseif ret.cond and ret.cond == "Sleep" then
        doSleep2(ret.id, ret.cd, ret.check, ret.first)
    elseif ret.cond and ret.cond == "Leech" then
        doLeech2(ret.id, ret.attacker, ret.cd, ret.check, ret.damage)
    end
end

--------------------------------
function cleanBuffs2(item)
    if item ~= 0 then
        for i = 1, 3 do
            doItemEraseAttribute(item, Buffs[i][1])
            doItemEraseAttribute(item, Buffs[i][1].."eff")
            doItemEraseAttribute(item, Buffs[i][1].."skill")
        end 
    end
end 
--------------------------------
function doCureStatus(cid, type, playerballs)
    if not isCreature(cid) then return true end
    if playerballs and isPlayer(cid) then
        local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
        local mb = getPlayerSlotItem(cid, 8)
        if isPokeball(mb.itemid) then
            if not type or type == "all" then
                for b = 1, #injuries2 do
                    doItemSetAttribute(mb.uid, ""..injuries2[b].n.."", -1)
                end
            else
                doItemSetAttribute(mb.uid, ""..type.."", -1)
            end
        end
        for bname, balls in pairs (pokeballs) do
            for times = 1,3 do
                local items = getItemsInContainerById(bp.uid, balls.all[times]) 
                for _, uid in pairs(items) do
                    if not type or type == "all" then
                        for b = 1, #injuries2 do
                            doItemSetAttribute(uid, ""..injuries2[b].n.."", -1)
                        end
                    else
                        doItemSetAttribute(uid, ""..type.."", -1)
                    end
                end
            end
        end
    end
    if type == "all" then
        for a = 1, #injuries2 do
            setPlayerStorageValue(cid, injuries2[a].m, -1)
        end
        return true
    end
    for a, b in pairs (injuries2) do
        if b.n == type then
            setPlayerStorageValue(cid, b.m, -1)
        end
    end
end 
---------------------------------
function isWithCondition(cid)
    for i = 1, #injuries2 do 
        if getPlayerStorageValue(cid, injuries2[i].m) >= 1 then
            return true
        end
    end
    return false
end
---------------------------------
function doCureBallStatus(item, type)
    if not type or type == "all" then
        for b = 1, #injuries2 do
            doItemSetAttribute(item, ""..injuries2[b].n.."", -1)
        end
    else
        doItemSetAttribute(item, ""..type.."", -1)
    end
end
---------------------------------
function isBurning(cid)
    if not isCreature(cid) then return false end
    if getPlayerStorageValue(cid, conds["Burn"]) >= 0 then return true end
    return false
end

function isPoisoned(cid)
    if not isCreature(cid) then return false end
    if getPlayerStorageValue(cid, conds["Poison"]) >= 0 then return true end
    return false
end

function isSilence(cid)
    if not isCreature(cid) then return false end
    if getPlayerStorageValue(cid, conds["Silence"]) >= 0 then return true end
    return false
end

function isParalyze(cid) 
    if not isCreature(cid) then return false end
    if getPlayerStorageValue(cid, conds["Paralyze"]) >= 0 then return true end
    return false
end

function isSleeping(cid)
    if not isCreature(cid) then return false end
    if getPlayerStorageValue(cid, conds["Sleep"]) >= 0 then return true end
    return false
end

function isWithFear(cid)
    if not isCreature(cid) then return false end
    if getPlayerStorageValue(cid, conds["Fear"]) >= 0 then return true end
    return false
end 
-----------------------------------
function doMoveInArea2(cid, eff, area, element, min, max, spell, ret)
    if not isCreature(cid) then return true end
    setPlayerStorageValue(cid, 21102, spell)
    local pos = getPosfromArea(cid, area) --alterado v1.8
    setPlayerStorageValue(cid, 21101, -1) 
    
    local skills = { "Skull Bash", "Gust", "Water Pulse", "Stick Throw", "Last Resort", "Ground Crusher", "Sacred Fire", "Toxic", "Take Down", "Gyro Ball"} --alterado v1.7
    local n = 0 
    local l = 0
    
    while n < #pos do
        if not isCreature(cid) then return true end 
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end 
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        n = n+1
        thing = {x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=253}
        local pid = getThingFromPosWithProtect(thing)
        
        if pid ~= cid then
            if spell and isInArray(skills, spell) then
                if spell and spell == "Gyro Ball" then --alterado v1.7
                    pos[n].x = pos[n].x+1
                    addEvent(sendEffWithProtect, l*200, cid, pos[n], eff)
                    addEvent(doMoveDano2, l*200, cid, pid, element, min, max, ret, spell) 
                else
                    addEvent(sendEffWithProtect, l*200, cid, pos[n], eff)
                    addEvent(doMoveDano2, l*200, cid, pid, element, min, max, ret, spell) --alterado v1.6 
                end
            elseif spell and spell == "Epicenter" then
                local random = math.random(50, 500) 
                addEvent(sendEffWithProtect, random, cid, pos[n], eff)
                addEvent(doDanoWithProtect, random, cid, GROUNDDAMAGE, pos[n], crusher, -min, -max, 255)
            elseif spell and spell == "Shadowave" then
                posi = {x=pos[n].x, y=pos[n].y+1, z=pos[n].z}
                sendEffWithProtect(cid, posi, eff)
                doMoveDano2(cid, pid, element, min, max, ret, spell) --alterado v1.6 
            elseif spell and spell == "Surf" then
                addEvent(sendEffWithProtect, math.random(50, 500), cid, pos[n], eff)
                addEvent(doMoveDano2, 400, cid, pid, element, min, max, ret, spell) --alterado v1.6 
            elseif spell and spell == "Sand Attack" then
                addEvent(sendEffWithProtect, n*200, cid, pos[n], eff)
                addEvent(doMoveDano2, n*200, cid, pid, element, min, max, ret, spell) --alterado v1.6 
            elseif spell and (spell == "Muddy Water" or spell == "Grass Whistle" or spell == "Venom Motion") then
                local arr = {
                    [1] = 0, [2] = 0, [3] = 0, [4] = 200, [5] = 200, [6] = 200, [7] = 400, [8] = 400, [9] = 400, [10] = 600, [11] = 600,
                    [12] = 600, [13] = 800, [14] = 800, [15] = 800
                }
                
                local time = {0, 200, 400, 600, 800}
                
                addEvent(sendEffWithProtect, arr[n], cid, pos[n], eff)
                addEvent(doMoveDano2, arr[n], cid, pid, element, min, max, ret, spell)
            elseif spell and (spell == "Inferno" or spell == "Fissure") then
                addEvent(sendEffWithProtect, math.random(0, 500), cid, pos[n], eff)
                addEvent(doMoveDano2, math.random(0, 500), cid, pid, element, min, max, ret, spell) 
            elseif spell == "Last Resort" then
                
                local pos = getThingPosWithDebug(cid)
                local areas = {rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1}
                
                for i = 0, 9 do
                    addEvent(doMoveInArea2, i*400, cid, 3, areas[i+1], NORMALDAMAGE, min, max, spell)
                    addEvent(doMoveInArea2, i*410, cid, 3, areas[i+1], NORMALDAMAGE, 0, 0, spell)
                end
            else
                sendEffWithProtect(cid, pos[n], eff)
                doMoveDano2(cid, pid, element, min, max, ret, spell) 
            end
        end
        setPlayerStorageValue(cid, 21102, spell)
        l = l+1
    end
end
-------------------------------------------
function doMoveDano2(cid, pid, element, min, max, ret, spell) -- add para n�o receber dano em �rea se o atacado for boss or shiny.
    
    if isCreature(pid) and isCreature(cid) and cid ~= pid then
        
        if isNpcSummon(pid) and getCreatureTarget(pid) ~= cid then
            return true --alterado v1.6
        end
        
        if ehNPC(pid) then return true end
        
        setPlayerStorageValue(cid, 21102, spell)
        
        local canAtk = true --alterado v1.6
        
        if getPlayerStorageValue(pid, 21099) >= 1 then
            doSendMagicEffect(getThingPosWithDebug(pid), 135)
            doSendAnimatedText(getThingPosWithDebug(pid), "REFLECT", COLOR_GRASS)
            addEvent(docastspell, 100, pid, spell)
            
            -- if getCreatureName(pid) == "Wobbuffet" or getCreatureName(pid) == "Reflector Wobbuffet" or getCreatureName(pid) == "Wowofet" then
                -- doRemoveCondition(pid, CONDITION_OUTFIT) 
            -- end
            
            canAtk = false
            setPlayerStorageValue(pid, 21099, -1)
            setPlayerStorageValue(pid, 21100, 1)
            setPlayerStorageValue(pid, 21101, cid)
            setPlayerStorageValue(pid, 21103, getTableMove(cid, getPlayerStorageValue(cid, 21102)).f)
        end
        --- 
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
                
        if isSummon(cid) and (ehMonstro(pid) or (isSummon(pid) and canAttackOther(cid, pid) == "Can") or (isPlayer(pid) and canAttackOther(cid, pid) == "Can" and #getCreatureSummons(pid) <= 0)) and pid ~= cid then

            if canAtk then --alterado v1.6
                if ret and ret.cond then
                    ret.id = pid
                    ret.check = getPlayerStorageValue(pid, conds[ret.cond])
                    doCondition2(ret)
                end
                doTargetCombatHealth(cid, pid, element, -(math.abs(min)), -(math.abs(max)), 255)
            end
            
        elseif ehMonstro(cid) and (isSummon(pid) or (isPlayer(pid) and #getCreatureSummons(pid) <= 0)) and pid ~= cid then
            
            if canAtk then --alterado v1.6
                if ret and ret.cond then
                    ret.id = pid
                    ret.check = getPlayerStorageValue(pid, conds[ret.cond])
                    doCondition2(ret)
                end
                doTargetCombatHealth(cid, pid, element, -(math.abs(min)), -(math.abs(max)), 255)
            end
            
        elseif isPlayer(cid) and ehMonstro(pid) and pid ~= cid then
            
            if canAtk then --alterado v1.6
                if ret and ret.cond then
                    ret.id = pid
                    ret.check = getPlayerStorageValue(pid, conds[ret.cond])
                    doCondition2(ret)
                end
                
                doTargetCombatHealth(cid, pid, element, -(math.abs(min)), -(math.abs(max)), 255)
            end
        end
    end
end
--------------------------------------------------------------------------------
function sendEffWithProtect(cid, pos, eff) --Manda algum magic effect com prote�oes 
    if not isCreature(cid) then return true end
    if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
    if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
    local checkpos = pos
    checkpos.stackpos = 0
    if not hasTile(checkpos) then
        return true
    end
    if not canWalkOnPos2(pos, false, true, false, true, false) then --alterado v1.6
        return true
    end
    
    doSendMagicEffect(pos, eff)
end
---------------------------------------------------------------------------------
function getThingPosWithDebug(what)
    if not isCreature(what) or getCreatureHealth(what) <= 0 then
        return {x = 1, y = 1, z = 10}
    end
    return getThingPos(what)
end
---------------------------------------------------------------------------------
function doDanoWithProtect(cid, element, pos, area, min, max, eff) --Da dano com prote�oes
    if not isCreature(cid) then return true end
    if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
    if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end        
    doAreaCombatHealth(cid, element, pos, area, -(math.abs(min)), -(math.abs(max)), eff)
end
---------------------------------------------------------------------------------
function doDano(cid, element, pos, area, min, max, eff) --Da dano com prote�oes
    if not isCreature(cid) then return true end
    doAreaCombatHealth(cid, element, pos, area, -(math.abs(min)), -(math.abs(max)), eff)
end
---------------------------------------------------------------------------------
function doDanoWithProtectWithDelay(cid, target, element, min, max, eff, area)
    const_distance_delay = 56
    if not isCreature(cid) then return true end
    if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
    if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
    if target ~= 0 and isCreature(target) and not area then
        delay = getDistanceBetween(getThingPosWithDebug(cid), getThingPosWithDebug(target)) * const_distance_delay
        addEvent(doDanoWithProtect, delay, cid, element, getThingPosWithDebug(target), 0, min, max, eff)
        return true
    end
    addEvent(doDanoWithProtect, 200, cid, element, getThingPosWithDebug(target), area, min, max, eff)
end 
--------------------------------------------------------------------------------
function sendDistanceShootWithProtect(cid, frompos, topos, eff) --Manda um efeito de distancia com prote�oes
    if not isCreature(cid) then return true end
    if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
    if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
    doSendDistanceShoot(frompos, topos, eff)
end
---------------------------------------------------------------------------------
function sendMoveBack(cid, pos, eff, min, max) --Manda o Atk do farfetchd de volta...
    local m = #pos+1
    for i = 1, #pos do
        if not isCreature(cid) then return true end
        ---
        m = m-1
        thing = {x=pos[m].x,y=pos[m].y,z=pos[m].z,stackpos=253}
        local pid = getThingFromPosWithProtect(thing)
        addEvent(doMoveDano2, i*200, cid, pid, FLYINGDAMAGE, min/4, max/4) 
        addEvent(sendEffWithProtect, i*200, cid, pos[m], eff) --alterado v1.3
        -- 
    end
end 
---------------------------------------------------------------------------------
function upEffect(cid, effDis)
    if not isCreature(cid) then return true end
    if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
    if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
    pos = getThingPos(cid)
    frompos = {x = pos.x+1, y = pos.y, z = pos.z}
    frompos.x = pos.x - math.random(4, 7)
    frompos.y = pos.y - math.random(5, 8)
    doSendDistanceShoot(getThingPos(cid), frompos, effDis)
end
---------------------------------------------------------------------------------
function fall(cid, master, element, effDis, effArea) --Function pra jogar efeitos pra cima e cair depois... tpw falling rocks e blizzard
    if isCreature(cid) then
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        pos = getThingPos(cid)
        pos.x = pos.x + math.random(-4,4)
        pos.y = pos.y + math.random(-4,4)
        if isMonster(cid) or isPlayer(cid) then
            frompos = {x = pos.x+1, y = pos.y, z = pos.z}
        elseif isSummon(cid) then
            frompos = getThingPos(master)
        end
        frompos.x = pos.x - 7
        frompos.y = pos.y - 6
        if effDis ~= -1 then --alterado!
            doSendDistanceShoot(frompos, pos, effDis)
        end
        doAreaCombatHealth(cid, element, pos, 0, 0, 0, effArea)
    end
end
---------------------------------------------------------------------------------
function canDoMiss(cid, nameAtk) --alterado v1.5
    local atkTerra = {"Sand Attack", "Mud Bomb", "Stomp", "Crusher Stomp", "Sand Tomb"} --alterado v1.7 -- "Mud Shot", "Mud Slap",
    local atkElectric = {"Electric Storm", "Thunder Wave", "Thunder", "Electricity", "Wild Charge"} --alterado v1.7
    if not isCreature(cid) then return false end
    if isPlayer(cid) then return true end
    if not pokes[getCreatureName(cid)] then return true end
    
    if isInArray(atkTerra, nameAtk) then
        if (pokes[getCreatureName(cid)].type == "flying") or (pokes[getCreatureName(cid)].type2 == "flying") or isInArray(specialabilities["levitate"], getCreatureName(cid)) then
            return false 
        end
    elseif isInArray(atkElectric, nameAtk) then
        if (pokes[getCreatureName(cid)].type == "ground") or (pokes[getCreatureName(cid)].type2 == "ground") then
            return false 
        end
    end
    
    return true
end
---------------------------------------------------------------------------------
function doMoveInAreaMulti(cid, effDis, effMagic, areaEff, areaDano, element, min, max, ret) --alterado v1.7
    if not isCreature(cid) then return true end 
    local pos = getPosfromArea(cid, areaEff)
    local pos2 = getPosfromArea(cid, areaDano)
    local n = 0
    
    while n < #pos2 do
        if not isCreature(cid) then return true end
        if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
        
        n = n+1
        thing = {x=pos2[n].x,y=pos2[n].y,z=pos2[n].z,stackpos=253}
        if n < #pos then
            addEvent(sendDistanceShootWithProtect, n*60, cid, getThingPos(cid), pos[n], effDis) --39
            addEvent(sendEffWithProtect, n*55, cid, pos[n], effMagic) -- 112 -- 100
            --- --alterado v1.6.1
            if math.random(1, 2) == 2 then
                addEvent(sendDistanceShootWithProtect, 450, cid, getThingPos(cid), pos[n], effDis) --550
                addEvent(sendEffWithProtect, 550, cid, pos[n], effMagic) -- 650
            end
        end 
        local pid = getThingFromPosWithProtect(thing)
        if isCreature(pid) then
            if ret and ret.id == 0 then --alterado v1.8
                ret.id = pid
                ret.check = getPlayerStorageValue(pid, conds[ret.cond])
            end
            if not ret then ret = {} end --alterado v1.7
            doMoveDano2(cid, pid, element, min, max, ret, getPlayerStorageValue(cid, 21102))
        end
    end 
end 
---------------------------------------------------------------------------------------
function doDoubleHit(cid, pid, valor, races) --alterado v1.6
    if isCreature(cid) and isCreature(pid) then
        if getPlayerStorageValue(cid, 374896) >= 1 then
            if getMasterTarget(cid) == pid then
                if isInArray({"Kadabra", "Alakazam", "Mew", "Shiny Abra", "Shiny Alakazam"}, getCreatureName(cid)) then
                    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(pid), 39)
                end
                if isSummon(cid) then
                    doTargetCombatHealth(getCreatureMaster(cid), pid, PHYSICALDAMAGE, -math.abs(valor), -math.abs(valor), 255)
                else
                    doCreatureAddHealth(pid, -math.abs(valor), 3, races[getMonsterInfo(getCreatureName(pid)).race].cor)
                end
            end
        end
    end
end
---------------------------------------------------------------------------------------
function doDanoInTarget(cid, target, combat, min, max, eff) --alterado v1.7
    if not isCreature(cid) or not isCreature(target) then return true end
    if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
    if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
    doTargetCombatHealth(cid, target, combat, -math.abs(min), -math.abs(max), eff)
end 
-----------------------------------------------------------------------------------------
function doDanoInTargetWithDelay(cid, target, combat, min, max, eff) --alterado v1.7
    const_distance_delay = 56
    if not isCreature(cid) or not isCreature(target) then return true end
    if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
    if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
    local delay = getDistanceBetween(getThingPosWithDebug(cid), getThingPosWithDebug(target)) * const_distance_delay
    addEvent(doDanoInTarget, delay, cid, target, combat, min, max, eff)
end
