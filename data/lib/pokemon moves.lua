const_distance_delay = 56

RollOuts = {
    ["Voltorb"] = {lookType = 2329},
    ["Electrode"] = {lookType = 2330},
    ["Sandshrew"] = {lookType = 2326},
    ["Sandslash"] = {lookType = 2327}, -- por 638
    ["Phanpy"] = {lookType = 2331},
    ["Donphan"] = {lookType = 2333},
    ["Miltank"] = {lookType = 2332}, 
    ["Golem"] = {lookType = 2328},
    ["Blastoise"] = {lookType = 2344},
    ["Omastar"] = {lookType = 2339},
    ["Shiny Voltorb"] = {lookType = 2335},
    ["Shiny Electrode"] = {lookType = 2336},
    ["Shiny Golem"] = {lookType = 2337},
    ["Shiny Sandslash"] = {lookType = 2338}
}

function doForceDanoSpeel(cid, moveName)
    local name = doCorrectString(getCreatureName(cid))
    local masterLevel = (isSummon(cid) and getPlayerLevel(getCreatureMaster(cid)) or getPokemonLevelByName(name))
     min = (getMoveForce(name, moveName) / 2) + (masterLevel * 1.5) --alterado v1.6
        max = getMoveForce(name, moveName) + (masterLevel * 1.5) --getMoveForce(name, moveName) + (masterLevel * 1.5) --min + (isSummon(cid) and getMasterLevel(cid) or getPokemonLevel(cid))
    return math.random(min, max)
end

function doForceDano(cid)
    local name = doCorrectString(getCreatureName(cid))
    local masterLevel = (isSummon(cid) and getPlayerLevel(getCreatureMaster(cid)) or getPokemonLevelByName(name))
    min = (getMoveForce(name, moveName) / 2) + (masterLevel * 1.5) --alterado v1.6
        max = getMoveForce(name, moveName) + (masterLevel * 1.5) -- min -- getMoveForce(name, moveName) + (masterLevel * 1.5) --min + (isSummon(cid) and getMasterLevel(cid) or getPokemonLevel(cid))
    return math.random(min, max)
end

function isShredTEAM(cid)
    if getPlayerStorageValue(cid, 637500) >= 1 then
       return true 
    end
    return false
end

--//////////////////////////////////////////////////////////////////////////////////////////////////////////--
function getSubName(cid, target)
if not isCreature(cid) then return "" end
if getCreatureName(cid) == "Ditto" and pokes[getPlayerStorageValue(cid, 1010)] and getPlayerStorageValue(cid, 1010) ~= "Ditto" then
   return getPlayerStorageValue(cid, 1010)
elseif pokeHaveReflect(cid) and isCreature(target) then
   return getCreatureName(target)
else                                                                --alterado v1.6.1
   return getCreatureName(cid)
end
end

function getThingName(cid)
if not isCreature(cid) then return "" end   --alterado v1.6
return getCreatureName(cid)
end

function getTableMove(cid, move)               --alterado v1.6
    local backup = {f = 0, t = ""}
    if getThingName(cid) == "Ditto" and pokes[getPlayerStorageValue(cid, 1010)] and getPlayerStorageValue(cid, 1010) ~= "Ditto" then
        name = getPlayerStorageValue(cid, 1010)
    else
        name = getThingName(cid) 
    end
    
    if not isCreature(cid) or name == "" or not move then 
        return backup
    end
    
    local x = movestable[name]
    if not x then 
        return ""
    end   
    
    local z = {x.move1, x.move2, x.move3, x.move4, x.move5, x.move6, x.move7, x.move8, x.move9, x.move10, x.move11, x.move12, x.passive1, x.passive2, x.passive3}
    if getPlayerStorageValue(cid, 21103) ~= -1 then
        local sto = getPlayerStorageValue(cid, 21103) 
        setPlayerStorageValue(cid, 21103, -1) 
        return {f = sto, t = ""} 
    end
    
    for j = 1, 15 do
        if z[j] and z[j].name == move then
            return z[j]
        end
    end
    return movesinfo[move]
end

function getMasterTarget(cid)
if isCreature(cid) and getPlayerStorageValue(cid, 21101) ~= -1 then
   return getPlayerStorageValue(cid, 21101)     --alterado v1.6
end
    if isSummon(cid) then
        return getCreatureTarget(getCreatureMaster(cid))
    else
        return getCreatureTarget(cid)
    end
end
--////////////////////////////////////////////////////////////////////////////////////////////////////////--

function docastspell(cid, spell, mina, maxa)
Pkattacker = cid

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
    
if mina and maxa then
min = math.abs(mina)
max = math.abs(maxa)
elseif not isPlayer(cid) then
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

        -- min = getSpecialAttack(cid) * (table and table.f or 0) * 0.1   --antes do clã
        min = getSpecialAttack(cid) * (table and table.f or 0) * mutiplay
        max = min + (isSummon(cid) and getMasterLevel(cid) or getPokemonLevel(cid))
    
        if spell == "Selfdestruct" then
           min = getCreatureHealth(cid)  --alterado v1.6
           max = getCreatureHealth(cid)
        end

        if not isSummon(cid) and not isInArray({"Demon Puncher", "Demon Kicker", "Blaze Kicker"}, spell) then --alterado v1.7
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
   if not isInArray({"Shock-Counter", "Lava-Counter", "Counter Helix", "Demon Puncher", "Blaze Kicker", "Demon Kicker", "Stunning Confusion", "Electric Charge", "Melody", "Mirror Coat", "Mega Drain", 
"Aromateraphy", "Heal Bell", "Emergency Call", "Magical Leaf", "Sunny Day", "Taunt", "Skull Bash", "Safeguard", "Rain Dance", "Spores Reaction", "Giroball", "Counter Claw", "Counter Spin", "Dragon Fury", 
"Amnesia", "Zen Mind", "Bone Spin"}, spell) and getPlayerStorageValue(cid, 21100) <= -1 then
      if math.random(1, 100) > 30 then                                                                               --alterado v1.6
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
if not isInArray({"Psybeam", "Sand Attack", "Flamethrower", "Heal Bell"}, spell) then  --alterado v1.8
   setPlayerStorageValue(cid, 21101, -1)
end
setPlayerStorageValue(cid, 21102, spell)
---------------------------------------------------
-----------
     --Posições--
    ---------------\/---------------------\/----------------------\/---------------------------------------------------------
    posC = getThingPosWithDebug(cid) PosC = posC PosCid = posC posCid = posC
    posT = getThingPosWithDebug(target) PosT = posT PosTarget = posT posTarget = posT 
    posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+1 posC1.y = posC1.y+1 PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1 
    posT1 = getThingPosWithDebug(target) posT1.x = posT1.x+1 posT1.y = posT1.y+1 PosT1 = posT1 posTarget1 = posT1 PosTarget1 = posT1
    --------------------------------------------------------------------------------------------------------------------------
    

if spell == "Reflect" or spell == "Mimic" or spell == "Magic Coat" then
        
        if spell == "Magic Coat" then
            eff = 616 -- 617
        elseif spell == "Reflect" then
            eff = 399 --135 -- 399
        else
            eff = 135
        end

        doSendMagicEffect(posC, eff)
        setPlayerStorageValue(cid, 21099, 1) 
        
    elseif spell == "Quick Attack" then
        
        if getSubName(cid, target) == "Blaziken" then 
            
            doSendMagicEffect(getThingPosWithDebug(cid), 211) -- 111
            doSendDistanceShoot(getThingPosWithDebug(cid), posT, 10)
            doDisapear(cid)      
            addEvent(doAppear, 150, cid) 
            local x = getClosestFreeTile(cid, getThingPosWithDebug(target))
            doTeleportThing(cid, x, false)
            doFaceCreature(cid, getThingPosWithDebug(cid))
            --doCombatAreaHealth(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 3)
            doTargetCombatHealth(cid, target or 0, NORMALDAMAGE, -min, -max, 3)
        else
            doSendMagicEffect(getThingPosWithDebug(cid), 211) -- 111
            local x = getClosestFreeTile(cid, getThingPosWithDebug(target))
            doTeleportThing(cid, x, false)
            doFaceCreature(cid, getThingPosWithDebug(cid))
            doTargetCombatHealth(cid, target or 0, NORMALDAMAGE, -min, -max, 3)
        end
        
    elseif spell == "Razor Leaf" or spell == "Magical Leaf" then 
        
        local eff = spell == "Razor Leaf" and 8 or 21
        
        local function throw(cid, target)
            if not isCreature(cid) or not isCreature(target) then return false end
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), eff)
            doDanoInTargetWithDelay(cid, target, GRASSDAMAGE, min, max, 245) --alterado v1.7
        end
        
        addEvent(throw, 0, cid, target)
        addEvent(throw, 100, cid, target) --alterado v1.7
        
    elseif spell == "Fire Fist" then 
        
        local function throw(cid, target)
            if not isCreature(cid) or not isCreature(target) then return false end
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 92)
            doDanoInTargetWithDelay(cid, target, GRASSDAMAGE, min, max, 355) --alterado v1.7
            pos = getThingPos(target)
            pos.x = pos.x +1
            doSendMagicEffect(pos, 357)
        end
        
        local function voltar(cid, target)
            if not isCreature(cid) then return true end
            doRemoveCondition(cid, CONDITION_OUTFIT)
            doRegainSpeed(cid)
            doRegainSpeed(target)
            doPantinOutfit(cid, 0, getPlayerStorageValue(cid, storages.isMega))
        end
        
        doSetCreatureOutfit(cid, {lookType = 1875}, -1) 
        doChangeSpeed(cid, -getCreatureSpeed(cid))
        doChangeSpeed(target, -getCreatureSpeed(target))
        addEvent(throw, 200, cid, target)
        addEvent(throw, 800, cid, target) --alterado v1.7
        addEvent(throw, 1200, cid, target) --alterado v1.7
        addEvent(voltar, 1501, cid, target)
        
        
    elseif spell == "Vine Whip" then
        
        local area = getThingPosWithDebug(cid)
        local dano = {}
        local effect = 255
        
        if mydir == 0 then
            area.x = area.x + 1
            area.y = area.y - 1
            dano = whipn
            effect = 80
            effectTangrowth = 454
            effectTangela = 522
        elseif mydir == 1 then
            area.x = area.x + 2
            area.y = area.y + 1
            dano = whipe
            effect = 83
            effectTangrowth = 453
            effectTangela = 521
        elseif mydir == 2 then
            area.x = area.x + 1
            area.y = area.y + 2     
            dano = whips
            effect = 81
            effectTangrowth = 451
            effectTangela = 519
        elseif mydir == 3 then
            area.x = area.x - 1
            area.y = area.y + 1
            dano = whipw
            effect = 82
            effectTangrowth = 452
            effectTangela = 520
        end
        if getSubName(cid, target) == "Tangrowth" then
            doSendMagicEffect(area, effectTangrowth)
        elseif getSubName(cid, target) == "Tangela" then
            doSendMagicEffect(area, effectTangela)
        else
            doSendMagicEffect(area, effect)
        end
        doAreaCombatHealth(cid, GRASSDAMAGE, getThingPosWithDebug(cid), dano, -min, -max, 255)
        
    elseif spell == "Headbutt" then
        
        doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 111) -- 118

    elseif spell == "Pound" then
        
        doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 111) -- 118
        
    elseif spell == "Leech Seed" then
        
        local ret = {}
        ret.id = target
        ret.attacker = cid
        ret.cd = 5
        ret.check = getPlayerStorageValue(target, conds["Leech"])
        ret.damage = isSummon(cid) and getMasterLevel(cid)+getPokemonBoost(cid) or getPokemonLevelD(doCorrectString(getCreatureName(cid)))
        ret.cond = "Leech"
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 1)
        addEvent(doMoveDano2, 1000, cid, target, GRASSDAMAGE, 0, 0, ret, spell)
        
    elseif spell == "Protection" then
        
        local pos = getPosfromArea(cid, heal)
        local n = 0
        
        while n < #pos do
            n = n+1
            thing = {x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=253}
            local pid = getThingFromPosWithProtect(thing)
            local pospid = getThingPosWithDebug(pid)
            local poscid = getThingPosWithDebug(cid)
            
            doSendMagicEffect(pos[n], 12)
            for i = 0, 9 do
                if isCreature(pid) then
                    if isSummon(cid) and (isSummon(pid) or isPlayer(pid)) then
                        if canAttackOther(cid, pid) == "Cant" then
                            doCreatureSetNoMove(pid, true)
                            doCreatureSetNoMove(cid, true)
                            setPlayerStorageValue(pid, 9658783, 1)
                            setPlayerStorageValue(cid, 9658783, 1)
                            addEvent(doSendMagicEffect, i*800, pospid, 117)
                            addEvent(doSendMagicEffect, i*800, poscid, 117)
                            addEvent(setPlayerStorageValue, 8000, pid, 9658783, -1)
                            addEvent(setPlayerStorageValue, 8000, cid, 9658783, -1)
                            addEvent(doCreatureSetNoMove, 8000, pid, false)
                            addEvent(doCreatureSetNoMove, 8000, cid, false)
                        end
                    elseif ehMonstro(cid) and ehMonstro(pid) then
                        doCreatureSetNoMove(pid, true)
                        doCreatureSetNoMove(cid, true)
                        setPlayerStorageValue(pid, 9658783, 1)
                        setPlayerStorageValue(cid, 9658783, 1)
                        addEvent(doSendMagicEffect, i*800, pospid, 117)
                        addEvent(doSendMagicEffect, i*800, poscid, 117)
                        addEvent(setPlayerStorageValue, 8000, pid, 9658783, -1)
                        addEvent(setPlayerStorageValue, 8000, cid, 9658783, -1)
                        addEvent(doCreatureSetNoMove, 8000, pid, false)
                        addEvent(doCreatureSetNoMove, 8000, cid, false)
                    end
                end
            end
        end
        
    elseif spell == "Solar Beam" then
        
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
        
    elseif spell == "Sleep Powder" then
        
        local ret = {}
        ret.id = 0
        ret.cd = math.random(5, 9)
        ret.check = 0
        ret.first = true --alterado v1.6
        ret.cond = "Sleep"
        
        doMoveInArea2(cid, 27, confusion, NORMALDAMAGE, 0, 0, spell, ret)
        
    elseif spell == "Stun Spore" then
        
        local ret = {}
        ret.id = 0
        ret.cd = math.random(6, 9)
        ret.eff = 0
        ret.check = 0
        ret.spell = spell
        ret.cond = "Stun"
        
        doMoveInArea2(cid, 85, confusion, GRASSDAMAGE, 0, 0, spell, ret)
        
    elseif spell == "Poison Powder" then 
        local name = doCorrectString(getCreatureName(cid))
        local ret = {}
        ret.id = 0
        ret.cd = math.random(6, 15) --alterado v1.6
        ret.check = 0
        local lvl = isSummon(cid) and getMasterLevel(cid) or getPokemonLevelD(name)
        local heldPercent = 1
        local dano = math.floor((getPokemonLevelD(name)+lvl * 3)/2)     
        
        if isSummon(cid) then
            local heldx = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "xHeldItem")
            if heldx then
                local heldName, heldTier = string.explode(heldx, "|")[1] or "", string.explode(heldx, "|")[2] or "0"
                if heldName == "X-Poison" then 
                    heldPercent = heldPoisonBurn[tonumber(heldTier)]
                end
            end
        end
    
        if isSummon(target) then
            local heldy = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "yHeldItem")
            if heldy then
                local heldName, heldTier = string.explode(heldy, "|")[1] or "", string.explode(heldy, "|")[2] or "0"
                if heldName == "Y-Antipoison" then -- ANTIPoison
                    dano = dano / 2
                end
            else
                dano = dano
            end 
        end
        
        ret.damage = dano + (heldPercent * dano / 100)
        ret.cond = "Poison" 
        ret.im = target
        ret.attacker = cid  
        doMoveInArea2(cid, 84, confusion, NORMALDAMAGE, 0, 0, spell, ret)   
    elseif spell == "Seed Blast" then -- antigo Bullet Seed
        --cid, effDist, effDano, areaEff, areaDano, element, min, max
        doMoveInAreaMulti(cid, 1, 45, bullet, bulletDano, GRASSDAMAGE, min, max)
        
    elseif spell == "Body Slam" then
    
        addEvent(doSendMagicEffect, 1, PosTarget, 857)
        addEvent(doAreaCombatHealth, 120, cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 118)
        
    elseif spell == "Leaves Fury" or tonumber(spell) == 73 then -- trocar o nome pra Fúria de Folhas(ou Leaves Fury) e fazer uma spell diferente pra Leaf Storm
        
        --  addEvent(doDanoWithProtect, 150, cid, GRASSDAMAGE, getThingPosWithDebug(cid), grassarea, -min, -max, 0)
        addEvent(doCombatAreaHealth, 140, cid, GRASSDAMAGE, getThingPosWithDebug(cid), grassarea, -min, -max, 0)
        
        local pos = getThingPosWithDebug(cid)
        
        local function doSendLeafStorm(cid, pos) --alterado!!
            if not isCreature(cid) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), pos, 8)
        end
        
        for a = 1, 100 do
            local lugar = {x = pos.x + math.random(-6, 6), y = pos.y + math.random(-5, 5), z = pos.z}
            addEvent(doSendLeafStorm, a * 2, cid, lugar)
        end
        
    elseif spell == "Scratch" then
        
        doDanoWithProtect(cid, NORMALDAMAGE, getThingPos(target), 0, -min, -max, 142)

    elseif spell == "Heal Block" then
        
        doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, 0, 0, 0)
        setPlayerStorageValue(target, 5000002, 1)
        addEvent(setPlayerStorageValue, 1*60*1000, target, 5000002, -1)
        
    elseif spell == "Guard Split" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 174)   
        doReduceStatus(cid, 0, 10, 0, 60)       
        doSendMagicEffect(getThingPosWithDebug(cid), 989)
        doSendMagicEffect(getThingPosWithDebug(target), 989)        
        
    elseif spell == "Ember" then
        
        if getSubName(cid, target) == "Rapidash" and getPlayerStorageValue(cid, 90177) >= 1 then
            
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 57)
            doDanoInTargetWithDelay(cid, target, FIREDAMAGE, min, max, 302) 
            
            addEvent(doSendMagicEffect, 60, PosTarget1, 420)
        else
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), (isMega(cid) and getMegaID(cid) == "X") and 57 or 3)
            doDanoInTargetWithDelay(cid, target, FIREDAMAGE, min, max, (isMega(cid) and getMegaID(cid) == "X") and 302 or 15) 
            
            addEvent(doSendMagicEffect, 60, PosTarget1, (isMega(cid) and getMegaID(cid) == "X") and 420 or 291)     
        end     
        
        doBurnPoke(cid, target)
        
        
    elseif spell == "Flamethrower" then
        
        local flamepos = getThingPosWithDebug(cid)
        local effect = 255
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        if a == 0 then
            flamepos.x = flamepos.x+1
            flamepos.y = flamepos.y-1
            effect = (isMega(cid) and getMegaID(cid) == "X") and 292 or 106
            if getSubName(cid, target) == "Rapidash" and getPlayerStorageValue(cid, 90177) >= 1 then
                effect = 292
            end
        elseif a == 1 then
            flamepos.x = flamepos.x+3
            flamepos.y = flamepos.y+1
            effect = (isMega(cid) and getMegaID(cid) == "X") and 295 or 109
            if getSubName(cid, target) == "Rapidash" and getPlayerStorageValue(cid, 90177) >= 1 then
                effect = 295
            end
        elseif a == 2 then
            flamepos.x = flamepos.x+1
            flamepos.y = flamepos.y+3
            effect = (isMega(cid) and getMegaID(cid) == "X") and 293 or 107
            if getSubName(cid, target) == "Rapidash" and getPlayerStorageValue(cid, 90177) >= 1 then
                effect = 293
            end
        elseif a == 3 then
            flamepos.x = flamepos.x-1
            flamepos.y = flamepos.y+1
            effect = (isMega(cid) and getMegaID(cid) == "X") and 294 or 108
            if getSubName(cid, target) == "Rapidash" and getPlayerStorageValue(cid, 90177) >= 1 then
                effect = 294
            end
            
            
        end
        
        doMoveInArea2(cid, 0, flamek, FIREDAMAGE, min, max, spell)
        doSendMagicEffect(flamepos, effect) 
        
        
    elseif spell == "Fireball" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), (isMega(cid) and getMegaID(cid) == "X") and 57 or 29)--3
        if isInArray({"Shiny Magmar", "Shiny Magmortar"}, getSubName(cid, target)) then
            addEvent(doDanoWithProtect, 200, cid, FIREDAMAGE, getThingPosWithDebug(target), waba, min, max, 498) -- 
        else
            addEvent(doDanoWithProtect, 200, cid, FIREDAMAGE, getThingPosWithDebug(target), waba, min, max, (isMega(cid) and getMegaID(cid) == "X") and 302 or 5) -- 302
        end
        
    elseif spell == "Fire Fang" then
        
        doSendMagicEffect(getThingPosWithDebug(target), 138) 
        doDanoInTargetWithDelay(cid, target, FIREDAMAGE, min, max, (isMega(cid) and getMegaID(cid) == "X") and 302 or 15) --alterado v1.7
        
        addEvent(doSendMagicEffect, 140, PosTarget1, (isMega(cid) and getMegaID(cid) == "X") and 609 or 415)
        --  addEvent(doSendMagicEffect, 140, PosTarget1, 415)
        
    elseif spell == "Fire Blast" then
        
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area, eff)
            if isCreature(cid) then
                ----if not isSightClear(p, area, false) then return true end 
                doAreaCombatHealth(cid, FIREDAMAGE, area, 0, 0, 0, eff)
                doAreaCombatHealth(cid, FIREDAMAGE, area, whirl3, -min, -max, (isMega(cid) and getMegaID(cid) == "X") and 419 or 35)
            end
        end
        
        for a = 0, 4 do
            
            local t = {
                [0] = {60, {x=p.x, y=p.y-(a+1), z=p.z}}, --alterado v1.4
                [1] = {61, {x=p.x+(a+1), y=p.y, z=p.z}},
                [2] = {62, {x=p.x, y=p.y+(a+1), z=p.z}},
                [3] = {63, {x=p.x-(a+1), y=p.y, z=p.z}}
            } 
            if (isMega(cid) and getMegaID(cid) == "X") then
                t = {
                    [0] = {303, {x=p.x, y=p.y-(a+1), z=p.z}}, --alterado v1.4
                    [1] = {304, {x=p.x+(a+1), y=p.y, z=p.z}},
                    [2] = {305, {x=p.x, y=p.y+(a+1), z=p.z}},
                    [3] = {306, {x=p.x-(a+1), y=p.y, z=p.z}}
                } 
            end 
            addEvent(sendAtk, 300*a, cid, t[d][2], t[d][1])
        end
        
    elseif spell == "Rage" then
        
        local ret = {}
        ret.id = cid
        ret.cd = 15
        ret.eff = 13
        ret.check = 0
        ret.buff = spell
        ret.first = true
        
        doCondition2(ret)
        
    elseif spell == "Raging Blast" then
        
        --cid, effDist, effDano, areaEff, areaDano, element, min, max
        doMoveInAreaMulti(cid, (isMega(cid) and getMegaID(cid) == "X") and 57 or 3, (isMega(cid) and getMegaID(cid) == "X") and 302 or 6, bullet, bulletDano, FIREDAMAGE, min, max) 
    
    elseif spell == "Gastro Acid" then
    
        doMoveInAreaMulti(cid, 107, 993, bullet, bulletDano, POISONDAMAGE, min, max)
    
    elseif spell == "Dragon Claw" then
            
        doDanoWithProtect(cid, DRAGONDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 0) -- 141
        doSendMagicEffect(posT1, 365) -- 365 novo spr
        
    elseif spell == "Wing Attack" or spell == "Wing Blade" then
        
        local effectpos = getThingPosWithDebug(cid)
        local effect = 255
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        if a == 0 then
            effect = spell == "Wing Blade" and 251 or 128
            effectpos.x = effectpos.x + 1
            effectpos.y = effectpos.y - 1 --alterado v1.4
        elseif a == 1 then
            effectpos.x = effectpos.x + 2
            effectpos.y = effectpos.y + 1
            effect = spell == "Wing Blade" and 253 or 129
        elseif a == 2 then
            effectpos.x = effectpos.x + 1
            effectpos.y = effectpos.y + 2
            effect = spell == "Wing Blade" and 252 or 131
        elseif a == 3 then
            effectpos.x = effectpos.x - 1
            effectpos.y = effectpos.y + 1
            effect = spell == "Wing Blade" and 254 or 130
        end
        
        doSendMagicEffect(effectpos, effect)
        doMoveInArea2(cid, 0, wingatk, FLYINGDAMAGE, min, max, spell)
        
    elseif spell == "Magma Storm" then
        
        
        eff2 = {498, 35, 498, 35}
        
        local eff = (isMega(cid) and getMegaID(cid) == "X") and {302, 419, 302, 419} or {6, 35, 6, 35}
        
        
        local area = {flames1, flames2, flames3, flames4}
        
        addEvent(doMoveInArea2, 2*450, cid, 2, flames0, FIREDAMAGE, min, max, spell)
        for i = 0, 3 do
            if isInArray({"Shiny Magmar", "Shiny Magmortar"}, getSubName(cid, target)) then
                addEvent(doMoveInArea2, i*450, cid, eff2[i+1], area[i+1], FIREDAMAGE, min, max, spell)
            else
                addEvent(doMoveInArea2, i*450, cid, eff[i+1], area[i+1], FIREDAMAGE, min, max, spell)
            end
        end 
        
    elseif spell == "Bubbles" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 139) -- 2 -- 128
        doDanoInTargetWithDelay(cid, target, WATERDAMAGE, min, max, 735) -- 68
        
    elseif spell == "Clamp" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 2)
        doDanoInTargetWithDelay(cid, target, WATERDAMAGE, min, max, 53) --alterado v1.7
        
    elseif spell == "Water Gun" then 
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {69, {x=p.x, y=p.y-1, z=p.z}},
            [1] = {70, {x=p.x+6, y=p.y, z=p.z}}, --alterado v1.8
            [2] = {71, {x=p.x, y=p.y+6, z=p.z}},
            [3] = {72, {x=p.x-1, y=p.y, z=p.z}},
        }
        local area = reto4
    
--[[    
        if (isMega(cid)) then
            t = {
                [0] = {299, {x=p.x+1, y=p.y-2, z=p.z}},
                [1] = {296, {x=p.x+5, y=p.y+1, z=p.z}}, --alterado v1.8
                [2] = {298, {x=p.x+1, y=p.y+5, z=p.z}},
                [3] = {297, {x=p.x-1, y=p.y, z=p.z}},
                [3] = {297, {x=p.x-1, y=p.y+1, z=p.z}},
            }
            area = triplo6
        end 
        --]]
        
        
        doMoveInArea2(cid, 0, area, WATERDAMAGE, min, max, spell)
        doSendMagicEffect(t[a][2], t[a][1])
        
        
        
        
        
    elseif spell == "Waterball" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 2)
        doDanoWithProtectWithDelay(cid, target, WATERDAMAGE, min, max, 68, waba)
        addEvent(doDanoWithProtectWithDelay, 50, cid, target, WATERDAMAGE, 0, 0, 53, 0)
        
    elseif spell == "Aqua Tail" then
        
        local function rebackSpd(cid, sss)
            if not isCreature(cid) then return true end
            doChangeSpeed(cid, sss)
            setPlayerStorageValue(cid, 446, -1)
        end
        
        local x = getCreatureSpeed(cid)
        doFaceOpposite(cid)
        doChangeSpeed(cid, -x)
        addEvent(rebackSpd, 400, cid, x)
        setPlayerStorageValue(cid, 446, 1)
        doAreaCombatHealth(cid, WATERDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 68)
        addEvent(doSendMagicEffect, 125, posT, 738)
        
    elseif spell == "Dragon Tail" then
        
        local function rebackSpd(cid, sss)
            if not isCreature(cid) then return true end
            doChangeSpeed(cid, sss)
            setPlayerStorageValue(cid, 446, -1)
        end
        
        local x = getCreatureSpeed(cid)
        doFaceOpposite(cid)
        doChangeSpeed(cid, -x)
        addEvent(rebackSpd, 400, cid, x)
        setPlayerStorageValue(cid, 446, 1)
        pos = getThingPos(target)
        pos.x = pos.x +1
        doSendMagicEffect(posT, 492) -- aquela pos ali ta errada(era pra outro effect)
    --  doAreaCombatHealth(cid, DRAGONDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 0)
        doDanoWithProtect(cid, DRAGONDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 0)
    elseif spell == "Hydro Cannon" then
        
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area, eff)
            if isCreature(cid) then
                --if not isSightClear(p, area, false) then return true end
                doAreaCombatHealth(cid, WATERDAMAGE, area, 0, 0, 0, eff)
                doAreaCombatHealth(cid, WATERDAMAGE, area, whirl3, -min, -max, 68)
            end
        end
        
        for a = 0, 4 do
            
            local t = { --alterado v1.4
                [0] = {64, {x=p.x, y=p.y-(a+1), z=p.z}},
                [1] = {65, {x=p.x+(a+1), y=p.y, z=p.z}},
                [2] = {66, {x=p.x, y=p.y+(a+1), z=p.z}},
                [3] = {67, {x=p.x-(a+1), y=p.y, z=p.z}}
            } 
            addEvent(sendAtk, 300*a, cid, t[d][2], t[d][1])
        end
        
    elseif spell == "Harden" or spell == "Calm Mind" or spell == "Defense Curl" or spell == "Charm" then    
        
        --alterado v1.4
        if spell == "Calm Mind" then
            eff = 133
        elseif spell == "Charm" then
            eff = 147 --efeito n eh esse.. e n sei se eh soh bonus de def, ou sp.def tb.. ;x
        else 
            eff = 144
        end
        
        local ret = {}
        ret.id = cid
        ret.cd = 8
        ret.eff = eff
        ret.check = 0
        ret.buff = spell
        ret.first = true
        
        doCondition2(ret)
        
    elseif spell == "Bubble Blast" then
        
        --cid, effDist, effDano, areaEff, areaDano, element, min, max
        doMoveInAreaMulti(cid, 139, 735, bullet, bulletDano, WATERDAMAGE, min, max)
        -- 2, 68
        
    elseif spell == "Skull Bash" then
        local ret = {}
        ret.id = 0
        ret.cd = 6 
        ret.eff = 182
        ret.check = 0
        ret.first = true
        ret.cond = "Paralyze"
        
        addEvent(doMoveInArea2, 350, cid, 118, reto5, NORMALDAMAGE, 0, 0, spell) 
        doMoveInArea2(cid, 182, reto5, NORMALDAMAGE, min, max, spell, ret) 
        
    elseif spell == "Hydropump" then
        
        local pos = getThingPosWithDebug(cid)
        
        local function doSendBubble(cid, pos)
            if not isCreature(cid) then return true end
            if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
            if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
            addEvent(doSendDistanceShoot, 120, getThingPosWithDebug(cid), pos, 2)   
            
        end
        --alterado!!
        for a = 1, 20 do
            local lugar = {x = pos.x + math.random(-4, 4), y = pos.y + math.random(-3, 3), z = pos.z}
            addEvent(doSendBubble, a * 25, cid, lugar)
        end
        doSendMagicEffect(posC, 53)
        addEvent(doDanoWithProtect, 150, cid, WATERDAMAGE, pos, waterarea, -min, -max, 0)
        
        
    elseif spell == "Giga Impact" then
        
        local tempo = 3 --Tempo, em segundos.
        local a = {}
        local ret1 = {}
        ret1.id = 0
        ret1.cd = 5
        ret1.eff = 0
        ret1.check = 0
        ret1.first = true
        ret1.cond = "Slow"
        local ret2 = {}
        ret2.id = 0
        ret2.cd = 5 
        ret2.eff = 0
        ret2.check = 0
        ret2.first = true
        ret2.cond = "Miss"
        a.speed = getCreatureSpeed(cid)
        doChangeSpeed(cid, -getCreatureSpeed(cid))
        doChangeSpeed(cid, a.speed*2)
        addEvent(function()
            if not isCreature(cid) then return true end
            doRegainSpeed(cid)
            doMoveInArea2(cid, 118, quake, NORMALDAMAGE, min, max, spell, ret1)
            doMoveInArea2(cid, 118, quake, NORMALDAMAGE, 0, 0, spell, ret2)
        end, tempo*1000)
        
    elseif spell == "String Shot" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 23)
        
        local ret = {}
        ret.id = target
        ret.cd = 6
        ret.eff = 137
        ret.check = getPlayerStorageValue(target, conds["Stun"])
        ret.spell = spell
        ret.cond = "Stun"
        
        addEvent(doMoveDano2, 100, cid, target, BUGDAMAGE, 0, 0, ret, spell)
        
    elseif spell == "Bug Bite" then
        
        doSendMagicEffect(getThingPosWithDebug(target), 244)
        doDanoInTargetWithDelay(cid, target, BUGDAMAGE, min, max, 8) --alterado v1.7
        
    elseif spell == "Super Sonic" then
        
        local rounds = math.random(4, 7)
        rounds = rounds + math.floor(getPokemonLevel(cid) / 35)
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 32)
        local ret = {}
        ret.id = target
        ret.cd = rounds
        ret.check = getPlayerStorageValue(target, conds["Confusion"])
        ret.cond = "Confusion"
        
        addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)
        
    elseif spell == "Whirlwind" then
        
--[[        
            local function sendFireEff(cid, dir)
            if not isCreature(cid) then return true end
        
                doDanoWithProtect(cid, STEELDAMAGE, getPosByDir(posC1, dir), 0, 0, 0, 894) -- effect
                doDanoWithProtect(cid, STEELDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 0) -- dano

        end
        
        local function doWheel(cid)
            if not isCreature(cid) then return true end
            local t = {
                [1] = SOUTH,
                [2] = SOUTHEAST,
                [3] = EAST,
                [4] = NORTHEAST,
                [5] = NORTH, --alterado v1.5
                [6] = NORTHWEST,
                [7] = WEST,
                [8] = SOUTHWEST,
            }
            for a = 1, 8 do
                addEvent(sendFireEff, a * 200, cid, t[a])
            end
        end
        
        doWheel(cid, false, cid)
        
    --]]    
        
        
--      doMoveInAreaMulti(cid, 9, 966, bulletFly, bulletFlyDano, FLYINGDAMAGE, min, max) -- effect e dano Bug
--      doMoveInAreaMulti(cid, 98, 967, bulletFly, bulletFlyDano, FLYINGDAMAGE, min, max) -- effect e dano Bug
        
        
        
    
    if isMega(cid) then
        area = {SLL1, SLL2, SLL3, SLL4} 
        for i = 0, 3 do 
    -- 167 (fucazãozinho), 507 (pofff), 929 (cortes), 490 (twist), 800 (corte circ), 894 (areia), 931 azul pof, 933 fura blue
    --      addEvent(doMoveInArea2, i*400, cid, 967, area[i+1], FLYINGDAMAGE, min, max, spell) 
            addEvent(doMoveInArea2, i*300, cid, 42, area[i+1], FLYINGDAMAGE, min, max, spell) 
        end
    else
        area = {SL1, SL2, SL3, SL4}
        for i = 0, 3 do
            addEvent(doMoveInArea2, i*300, cid, 42, area[i+1], FLYINGDAMAGE, min, max, spell) -- 42
        end 
    end
    
        
    elseif spell == "Razor Wind" then 
    
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        areaDano = {DanoSL1, DanoSL2, DanoSL3, DanoSL4}
        if d == 0 or d == 3 then
            areaEff = {EffSL1, EffSL2, EffSL3, EffSL4}
        else
            areaEff = {Eff2SL1, Eff2SL2, Eff2SL3, Eff2SL4}
        end
        
        for i = 0, 3 do
            
            local t = {
                [0] = {466, {x=p.x+1, y=p.y-(i), z=p.z}}, --250 --alterado v1.4
                [1] = {464, {x=p.x+(i+2), y=p.y+1, z=p.z}},
                [2] = {463, {x=p.x+1, y=p.y+(i+2), z=p.z}},
                [3] = {465, {x=p.x-(i), y=p.y+2, z=p.z}}
            } 
            addEvent(doMoveInArea2, i*300, cid, t[d][1], areaEff[i+1], NORMALDAMAGE, 0, 0, spell) -- só o effect
            addEvent(doMoveInArea2, i*300, cid, 0, areaDano[i+1], NORMALDAMAGE, min, max, spell) -- só o dano
        end
        
    elseif spell == "Psybeam" then
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local t = {
            [0] = 58, 
            [1] = 56,
            [2] = 58,
            [3] = 56,
        }
        
        doMoveInArea2(cid, t[a], reto4, psyDmg, min, max, spell)
        
    elseif spell == "PsybeamD" then
        
        doMoveInArea2(cid, 56, retoD, ROCKDAMAGE, min, max, spell)
        
    elseif spell == "PsybeamB" then
        
        doMoveInArea2(cid, 58, retoB, ROCKDAMAGE, min, max, spell)
                
    elseif spell == "Sand Attack" then
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local t = {
            [0] = 120,
            [1] = 121,
            [2] = 122,
            [3] = 119,
        }
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 34
        ret.check = 0
        ret.spell = spell
        ret.cond = "Miss"
        
        doCreatureSetLookDir(cid, a) --sera? '-'
        stopNow(cid, 900) 
        doMoveInArea2(cid, t[a], reto5, GROUNDDAMAGE, 0, 0, spell, ret) 
        
    elseif spell == "Confusion" or spell == "Night Shade" then
        
        local rounds = math.random(4, 7) --rever area...
        rounds = rounds + math.floor(getPokemonLevel(cid) / 35)
        
        if spell == "Confusion" then
            dano = psyDmg 
            eff = 430 
        else
            dano = ghostDmg
            eff = 136
        end
        
        local ret = {}
        ret.id = 0
        ret.check = 0
        ret.cd = rounds
        ret.cond = "Confusion"
        
        -- if spell == "Confusion" then
            -- doMoveInArea2(cid, eff, selfArea1, dano, min, max, spell, ret)
        -- else
            -- addEvent(doSendMagicEffect, 1, PosCid1, 395)
            -- addEvent(doMoveInArea2, 110, cid, eff, selfArea1, dano, min, max, spell, ret)
        -- end -- mixlort
    
    elseif spell == "Contrary Confusion" then
        
        snowP = getThingPosWithDebug(cid)
        
        local ret = {}
        ret.id = 0
        ret.cd = 4
        ret.check = 0
        ret.eff = 0
        ret.spell = spell
        ret.cond = "Confusion" 
        
        doMoveInArea2(cid, 136, selfArea1, DARKDAMAGE, min, max, spell, ret)
                
        
    elseif spell == "Horn Attack" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 15)
        doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 3) --alterado v1.7
        
    elseif spell == "Poison Sting" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 15)
        doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 8) --alterado v1.7
        
        
    elseif isInArray({"Fury Cutter", "Steel Wing", "Cutting Sheet",}, spell) then
        
        local effectpos = getThingPosWithDebug(cid)
        local effect = 255
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)       
        local dano = BUGDAMAGE
        
        if spell == "Cutting Sheet" then
            dano = GRASSDAMAGE
        else
            dano = BUGDAMAGE
        end
        
        if a == 0 then
            if spell == "Steel Wing" then 
                effect = 251
            elseif spell == "Fury Cutter" then
                effect = 527
            else 
                effect = 470 -- Cutting Sheet
            end
            effectpos.x = effectpos.x + 1
            effectpos.y = effectpos.y - 1
        elseif a == 1 then
            effectpos.x = effectpos.x + 2
            effectpos.y = effectpos.y + 1
            if spell == "Steel Wing" then 
                effect = 253
            elseif spell == "Fury Cutter" then 
                effect = 528
            else
                effect = 468
            end
        elseif a == 2 then
            effectpos.x = effectpos.x + 1
            effectpos.y = effectpos.y + 2
            if spell == "Steel Wing" then 
                effect = 252
            elseif spell == "Fury Cutter" then
                effect = 530
            else
                effect = 469
            end
        elseif a == 3 then
            effectpos.x = effectpos.x - 1
            effectpos.y = effectpos.y + 1
            if spell == "Steel Wing" then 
                effect = 254
            elseif spell == "Fury Cutter" then
                effect = 529
            else
                effect = 467 
            end
        end
        
        local function doFury(cid, effect)
            if not isCreature(cid) then return true end
            doSendMagicEffect(effectpos, effect)
            doMoveInArea2(cid, 0, wingatk, dano, min, max, spell)
        end 
        
        addEvent(doFury, 0, cid, effect)
        addEvent(doFury, 350, cid, effect) -- 350   
        
    elseif spell == "Pin Missile" then

        doMoveInAreaMulti(cid, 13, 7, bullet, bulletDano, BUGDAMAGE, min, max)  
        addEvent(doDanoWithProtect, 150, cid, POISONDAMAGE, getThingPosWithDebug(cid), grassarea, -min, -max, 0)        
        
    elseif spell == "Strafe" or spell == "Agility" or spell == "Speed Boost" then
        
        if spell ~= "Speed Boost" then
            local ret = {}
            ret.id = cid
            ret.cd = 15
            ret.eff = 14
            ret.check = 0
            ret.buff = spell
            ret.first = true
            
            doCondition2(ret)
            
        else
            local ret = {}
            ret.id = cid
            ret.cd = 15
            ret.eff = 782
            ret.check = 0
            ret.buff = spell
            ret.first = true
            
            doCondition2(ret)
            
            doSendMagicEffect(posC, 29)
            
            --  faster = getCreatureSpeed(cid) + 400
            doChangeSpeed(cid, getCreatureSpeed(cid))
            addEvent(doRegainSpeed, 6450, cid)
            
        end 
        
    elseif spell == "Gust" then
        
        doMoveInArea2(cid, 42, reto5, FLYINGDAMAGE, min, max, spell) 
        
    elseif spell == "Drill Peck" then
        
        addEvent(doDanoWithProtect, 20, cid, FLYINGDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 968) -- 148
        
    elseif spell == "Tornado" or spell == "Aeroblast" then
        
        local pos = getThingPosWithDebug(cid)
        
        local function doSendTornado(cid, pos)
            if not isCreature(cid) then return true end
            if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
            if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), pos, 36) -- 22
            doSendMagicEffect(pos, 967) -- 42
        end
        
        for b = 1, 3 do
            for a = 1, 20 do
                local lugar = {x = pos.x + math.random(-4, 4), y = pos.y + math.random(-3, 3), z = pos.z}
                addEvent(doSendTornado, a * 75, cid, lugar)
            end
        end
        doDanoWithProtect(cid, FLYINGDAMAGE, pos, waterarea, -min, -max, 0)
        
    elseif spell == "Bite" or tonumber(spell) == 5 then
        
        doDanoWithProtect(cid, DARKDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 146)
        
    elseif spell == "Super Fang" then
        
        doDanoWithProtect(cid, NORMALDAMAGE, PosT, 0, -min, -max, 517)
        
    elseif spell == "Poison Fang" then
        
        doSendMagicEffect(getThingPosWithDebug(target), 244)
        doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 114) --alterado v1.7
        
    elseif spell == "Sting Gun" then
        
        local function doGun(cid, target)
            if not isCreature(cid) or not isCreature(target) then return true end --alterado v1.7
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 13)
            doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 8) --alterado v1.7
        end
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 200, cid, 3644587, 1)
        for i = 0, 2 do
            addEvent(doGun, i*100, cid, target)
        end 
        
    elseif spell == "Acid" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 14) -- 107
        doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 20) --alterado v1.7
        
    elseif spell == "Fear" or spell == "Roar" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 5
        ret.check = 0
        ret.skill = spell
        ret.cond = "Fear"
        
        doMoveInArea2(cid, 0, confusion, DARKDAMAGE, 0, 0, spell, ret)
        
    elseif spell == "Uproar" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 8
        ret.check = 0
        ret.skill = spell
        ret.cond = "Fear"
        
        local ret2 = {}
        ret2.id = 0
        ret2.cd = 5
        ret2.eff = 0
        ret2.check = 0
        ret2.skill = spell
        ret2.cond = "Slow"      
        
        doMoveInArea2(cid, 0, confusion, DARKDAMAGE, min, max, spell)       
        doMoveInArea2(cid, 0, confusion, DARKDAMAGE, 0, 0, spell, ret)  
        doMoveInArea2(cid, 0, confusion, DARKDAMAGE, 0, 0, spell, ret2)         
        
    elseif spell == "Iron Tail" then
        
        local function rebackSpd(cid, sss)
            if not isCreature(cid) then return true end
            doChangeSpeed(cid, sss)
            setPlayerStorageValue(cid, 446, -1)
        end
        
        local x = getCreatureSpeed(cid)
        doFaceOpposite(cid)
        doChangeSpeed(cid, -x)
        addEvent(rebackSpd, 400, cid, x)
        setPlayerStorageValue(cid, 446, 1)
        doDanoWithProtect(cid, STEELDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 160)
        
        
    elseif spell == "Thunder Shock" then  
        
        if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) then
            shooT = 121
            eff = 641
        elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, getSubName(cid, target)) then 
            shooT = 171
            eff = 979       
        else
            shooT = 40
            eff = 48
        end 
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), shooT)
        doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, eff) --alterado v1.7
        
        
    elseif spell == "Thunder Bolt" then
        
        eff1 = 413
        eff2 = 48
        eff3 = 207
        shoot1 = 41
        
        if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) then
            eff1 = 639 -- 413 azul (electric storm)
            eff2 = 641
            eff3 = 40 -- 207 azul (aura)
            shoot1 = 90 -- 41 azul (raio normal)
        elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, getSubName(cid, target)) then 
            eff1 = 977 
            eff2 = 979
            eff3 = 207 -- (aura)
            shoot1 = 170
        end
        
        local function doThunderFall(cid, frompos, target)
            if not isCreature(target) or not isCreature(cid) then return true end
            local pos = getThingPosWithDebug(target)
            local ry = math.abs(frompos.y - pos.y)
            doSendDistanceShoot(frompos, getThingPosWithDebug(target), shoot1)
            addEvent(doDanoInTarget, ry * 11, cid, target, ELECTRICDAMAGE, min, max, 0) --48
            addEvent(doSendMagicEffect, ry * 30, PosTarget, eff2)
            local tpos1 = getThingPosWithDebug(target) 
            addEvent(doSendMagicEffect, ry * 7, {x=tpos1.x+1, y=tpos1.y+1, z=tpos1.z}, eff1)
        end
        
        local function doThunderUp(cid, target)
            if not isCreature(target) or not isCreature(cid) then return true end
            local pos = getThingPosWithDebug(cid)
            local xrg = math.floor((pos.x-1 - pos.x-6)) -- -7
            local topos = pos
            topos.x = topos.x + xrg
            local rd = 8
            topos.y = topos.y - rd
            doSendDistanceShoot(getThingPosWithDebug(cid), topos, shoot1)
            addEvent(doThunderFall, rd * 49, cid, topos, target)
        end     
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 350, cid, 3644587, -1)
        for thnds = 1, 2 do     
            addEvent(doThunderUp, thnds * 155, cid, target)
            doSendMagicEffect(getThingPosWithDebug(cid), 207)           
            addEvent(doSendMagicEffect, 30, getThingPosWithDebug(cid), eff3)        
            addEvent(doSendMagicEffect, 5, getThingPosWithDebug(cid), 728) -- tirar talvez
            addEvent(doSendMagicEffect, 15, getThingPosWithDebug(cid), 728)
            addEvent(doSendMagicEffect, 28, getThingPosWithDebug(cid), 728)
        end
        
        
        
        
    elseif spell == "Thunder Wave" then 
        
        eff2 = 48
        if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) then
            eff2 = 641
        elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, getSubName(cid, target)) then 
            eff2 = 979
        end
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) then
            ret.eff = 641
        elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, getSubName(cid, target)) then 
            ret.eff = 979
        else
            ret.eff = 48
        end
        ret.spell = spell
        ret.cond = "Stun"
        
        doMoveInArea2(cid, eff2, db1, ELECTRICDAMAGE, min, max, spell, ret) 
        
    elseif spell == "Thunder" then
        
        eff0 = 409
        eff2 = 48
        if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) then
            eff0 = 640
            eff2 = 641
        elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, getSubName(cid, target)) then 
            eff0 = 978
            eff2 = 979
        end
        
        local pos = getThingPosWithDebug(cid)       
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) then
            ret.eff = 641
        elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, getSubName(cid, target)) then 
            ret.eff = 979
        else
            ret.eff = 48
        end
        ret.spell = spell
        ret.cond = "Stun"
        
        addEvent(doSendMagicEffect, 55, {x = pos.x + 1, y = pos.y, z = pos.z}, eff0)
        doMoveInArea2(cid, eff2, thunderr, ELECTRICDAMAGE, min, max, spell, ret)
        
    elseif spell == "Web Shot" then -- rever ?
        
        local ret = {}
        ret.id = target
        ret.cd = 7
        ret.eff = 402
        ret.check = 0
        ret.spell = spell
        local sorte = math.random(1, 3)
        if sorte == 1 then
            ret.cond = "Paralyze"
        end
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 23)
        addEvent(doMoveDano2, 100, cid, target, BUGDAMAGE, -min, -max, ret, spell)
        
    elseif spell == "Mega Kick" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        if isInArray({"Elite Hitmonlee", "Shiny Hitmonlee"}, getSubName(cid, target)) then  
            addEvent(doDanoInTargetWithDelay, 25, cid, target, FIGHTINGDAMAGE, 0, 0, 651) 
            doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 495)
        elseif isInArray({"Hitmonlee"}, getSubName(cid, target)) then   
            addEvent(doDanoInTargetWithDelay, 25, cid, target, FIGHTINGDAMAGE, 0, 0, 652) 
            doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 495)
        else
            doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, 0, 0, 113) 
            doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 495)
        end 
        
    elseif spell == "Thunder Punch" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) then
            doSendMagicEffect(posT1, 709)
            doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 641)
        elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, getSubName(cid, target)) then 
            doSendMagicEffect(posT1, 976)
            doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 979)     
        else
            doSendMagicEffect(posT1, 626)
            doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 48) 
        end
        
        
    elseif spell == "Comet Punch" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        doSendMagicEffect(getThingPosWithDebug(target), 112)
        doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 118) --alterado v1.7
        
    elseif spell == "Electric Storm" then 
        
        eff1 = 413
        shoot1 = 41
        if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) then
            eff1 = 639
            shoot1 = 90
        elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, getSubName(cid, target)) then 
            eff1 = 977
            shoot1 = 170
        end
        
        local master = isSummon(cid) and getCreatureMaster(cid) or cid
        
        local function doFall(cid)
            for rocks = 1, 42 do
                addEvent(fall, rocks*35, cid, master, ELECTRICDAMAGE, shoot1, eff1) --48
            end
        end
        
        for up = 1, 10 do
            addEvent(upEffect, up*75, cid, shoot1)
        end
        addEvent(doFall, 450, cid)
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        if isInArray({"Shiny Electabuzz", "Shiny Electvire"}, getSubName(cid, target)) then
            ret.eff = 641
        elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, getSubName(cid, target)) then
            ret.eff = 979
        else
            ret.eff = 48
        end
        ret.spell = spell
        ret.cond = "Stun"
        
        addEvent(doMoveInArea2, 1400, cid, 0, BigArea2, ELECTRICDAMAGE, min, max, spell, ret)
        
    elseif spell == "Frenzy Plant" then 
        
        local master = isSummon(cid) and getCreatureMaster(cid) or cid
        
        local function doFall(cid)
            for rocks = 1, 42 do
                addEvent(fall, rocks*35, cid, master, ELECTRICDAMAGE, 1, 259)
            end
        end
        
        for up = 1, 10 do
            addEvent(upEffect, up*75, cid, 1)
        end
        
        addEvent(doFall, 450, cid)
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 220
        ret.spell = spell
        ret.cond = "Stun"
        
        addEvent(doMoveInArea2, 1400, cid, 0, BigArea2, GRASSDAMAGE, min, max, spell, ret)
        
    elseif spell == "Web Rain" then 
        
        local master = isSummon(cid) and getCreatureMaster(cid) or cid
        
        local function doFall(cid)
            for rocks = 1, 42 do
                addEvent(fall, rocks*35, cid, master, BUGDAMAGE, 23)
            end
        end
        
        for up = 1, 10 do
            addEvent(upEffect, up*75, cid, 23)
        end
        addEvent(doFall, 450, cid)
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 26
        ret.spell = spell
        ret.cond = "Silence"
        
        addEvent(doMoveInArea2, 1400, cid, 0, BigArea2, BUGDAMAGE, min, max, spell, ret)
        
    elseif spell == "Spider Web" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 26
        ret.cond = "Silence"
        
        doMoveInAreaMulti(cid, 23, 26, multi, multiDano, BUGDAMAGE, min, max)
        doMoveInArea2(cid, 0, multiDano, BUGDAMAGE, 0, 0, spell, ret)
        
        
    elseif spell == "Mud Shot" or spell == "Mud Slap" then
    
    doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 138) -- 2 -- 128
        doDanoInTargetWithDelay(cid, target, GROUNDDAMAGE, min, max, 34) -- 68
    
--[[    
        if isCreature(target) then --alterado v1.8
            local contudion = spell == "Mud Shot" and "Miss" or "Stun" 
            local ret = {}
            ret.id = target
            ret.cd = 9
            ret.eff = 34 -- 34
            ret.check = getPlayerStorageValue(target, conds[contudion])
            ret.spell = spell
            ret.cond = contudion
            
            if spell == "Mud Shot" then
                ret.eff = 733
                doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 138)
                addEvent(doMoveDano2, 100, cid, target, GROUNDDAMAGE, -min, -max, ret, spell)   
            else
                doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 6)
                addEvent(doMoveDano2, 100, cid, target, GROUNDDAMAGE, -min, -max, ret, spell)
            end 
        end
    --]]    
    elseif spell == "Meetal Burstttt" then
        
        if isCreature(target) then --alterado v1.8
            local contudion = "Stun" 
            local ret = {}
            ret.id = target
            ret.cd = 2
            ret.eff = 349
            ret.check = getPlayerStorageValue(target, conds[contudion])
            ret.spell = spell
            ret.cond = contudion
            
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 9)
            addEvent(doMoveDano2, 255, cid, target, GROUNDDAMAGE, -min, -max, ret, spell)
        end
        
    elseif spell == "Rollout" then

        local function setOutfit(cid, outfit)
            if isCreature(cid) and getCreatureCondition(cid, CONDITION_OUTFIT) == true then
                if getCreatureOutfit(cid).lookType == outfit then
                    doRemoveCondition(cid, CONDITION_OUTFIT)
                    if getCreatureName(cid) == "Ditto" and pokes[getPlayerStorageValue(cid, 1010)] and getPlayerStorageValue(cid, 1010) ~= "Ditto" then
                        if isSummon(cid) then
                            local item = getPlayerSlotItem(getCreatureMaster(cid), 8)
                            doSetCreatureOutfit(cid, {lookType = getItemAttribute(item.uid, "transOutfit")}, -1) --alterado v1.8
                        end
                    end 
                end
            end
        end
        
        local name = doCorrectString(getCreatureName(cid))
        
        if RollOuts[name] then
            doSetCreatureOutfit(cid, RollOuts[name], -1) --alterado v1.6.1
        end 
        
        local outfit = getCreatureOutfit(cid).lookType
        
        local function roll(cid, outfit)
            if not isCreature(cid) then return true end
            if isSleeping(cid) then return true end
            if RollOuts[name] then
                doSetCreatureOutfit(cid, RollOuts[name], -1) 
            end
            doDanoWithProtect(cid, ROCKDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 0)
        end
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 9000, cid, 3644587, -1)
        for r = 1, 11 do --8
            addEvent(roll, 750 * r, cid, outfit)
        end
        addEvent(setOutfit, 9050, cid, outfit)
        
    elseif spell == "Shockwave" or spell == "Bulldoze" then
        
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area, areaEff, eff)
            if isCreature(cid) then
                --if not isSightClear(p, area, false) then return true end --testar o atk!!
                doAreaCombatHealth(cid, GROUNDDAMAGE, areaEff, 0, 0, 0, eff) 
                doAreaCombatHealth(cid, GROUNDDAMAGE, area, whirl3, -min, -max, 255) 
            end
        end
        
        for a = 0, 5 do
            
            local t = {
                [0] = {126, {x=p.x, y=p.y-(a+1), z=p.z}, {x=p.x+1, y=p.y-(a+1), z=p.z}}, 
                [1] = {124, {x=p.x+(a+1), y=p.y, z=p.z}, {x=p.x+(a+1), y=p.y+1, z=p.z}},
                [2] = {125, {x=p.x, y=p.y+(a+1), z=p.z}, {x=p.x+1, y=p.y+(a+1), z=p.z}},
                [3] = {123, {x=p.x-(a+1), y=p.y, z=p.z}, {x=p.x-(a+1), y=p.y+1, z=p.z}}
            } 
            addEvent(sendAtk, 325*a, cid, t[d][2], t[d][3], t[d][1])
        end 
        
    elseif isInArray({"Earthshock", "Earth Power", "Frost Power", "Iceshock"}, spell) then -- fazer recolor, groundshock do crystal onix está igual o iceshock
        
        if spell == "Earthshock" or spell == "Earth Power" then
            
            dano = GROUNDDAMAGE
            
            if getSubName(cid, target) == "Crystal Onix" then
                eff = 179
            else
                eff = 127
            end 
            
        else
            --if isInArray({"Frost Power", "Iceshock"}, spell) then
            dano = ICEDAMAGE
            eff = 179
        end
        
        doAreaCombatHealth(cid, dano, getThingPosWithDebug(cid), splash, -min, -max, 255)
        doSendMagicEffect(posC1, eff)
        
        
    elseif spell == "Earthquake" then
        
        local eff = getSubName(cid, target) == "Crystal Onix" and 175 or 754 -- 118 
        
        local function doQuake(cid)
            if not isCreature(cid) then return false end
            if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
            if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
            doMoveInArea2(cid, eff, confusion, GROUNDDAMAGE, min, max, spell)
        end
        
        times = {0, 500, 1000, 1500, 2300, 2800, 3300, 3800, 4600, 5100, 5600, 6100, 6900, 7400, 7900, 8400, 9200, 10000}
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 10000, cid, 3644587, -1)
        for i = 1, #times do --alterado v1.4
            addEvent(doQuake, times[i], cid)
        end
        
        
    elseif spell == "Stomp" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 34
        ret.spell = spell
        ret.cond = "Stun" 
        
        doMoveInArea2(cid, 118, stomp, GROUNDDAMAGE, min, max, spell, ret)
        
        
        
    elseif spell == "Toxic Spikes" then
        
        addEvent(doDanoWithProtect, 150, cid, POISONDAMAGE, getThingPosWithDebug(cid), grassarea, -min, -max, 0)
        
        local pos = getThingPosWithDebug(cid)
        
        local function doSendLeafStorm(cid, pos) --alterado!!
            if not isCreature(cid) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), pos, 15)
        end
        
        for a = 1, 100 do
            local lugar = {x = pos.x + math.random(-6, 6), y = pos.y + math.random(-5, 5), z = pos.z}
            addEvent(doSendLeafStorm, a * 2, cid, lugar)
            --  doSendMagicEffect(a, 114)
            roleta = math.random(1, 3)
            if roleta == 1 then
                addEvent(doSendMagicEffect, a * 2, lugar, 114)
            end
            
        end     
        
    elseif spell == "Horn Drill" then
        
        TposT = getThingPosWithDebug(target)    
        
        Cpos0 = getThingPosWithDebug(cid)   
        Cpos1 = getThingPosWithDebug(cid)   
        Cpos2 = getThingPosWithDebug(cid)   
        Cpos3 = getThingPosWithDebug(cid)   
        Cpos4 = getThingPosWithDebug(cid)   
        Cpos5 = getThingPosWithDebug(cid)   
        Cpos6 = getThingPosWithDebug(cid)   
        Cpos7 = getThingPosWithDebug(cid)   
        
        Cpos0.x = Cpos0.x
        Cpos0.y = Cpos0.y-1 -- cima
        Cpos1.x = Cpos1.x+1
        Cpos1.y = Cpos1.y -- direita
        Cpos2.x = Cpos2.x
        Cpos2.y = Cpos2.y+1 -- baixo
        Cpos3.x = Cpos3.x-1
        Cpos3.y = Cpos3.y -- esquerda
        Cpos4.x = Cpos4.x-1 
        Cpos4.y = Cpos4.y+1 -- sudoeste <-\/
        Cpos5.x = Cpos5.x+1 
        Cpos5.y = Cpos5.y+1 -- sudeste ->\/
        Cpos6.x = Cpos6.x-1 
        Cpos6.y = Cpos6.y-1 -- noroeste <-/\
        Cpos7.x = Cpos7.x+1
        Cpos7.y = Cpos7.y-1 -- nordeste -> /\
        
        if Cpos0.x == TposT.x and Cpos0.y == TposT.y then
            doSendMagicEffect(posTarget, 791)
            doSendMagicEffect(posT1, 807)
        elseif Cpos1.x == TposT.x and Cpos1.y == TposT.y then 
            doSendMagicEffect(posTarget, 790)
            posT1.x=posT1.x-1
            doSendMagicEffect(posT1, 808)
        elseif Cpos2.x == TposT.x and Cpos2.y == TposT.y then
            doSendMagicEffect(posTarget, 789)
            posT1.y=posT1.y-1
            doSendMagicEffect(posT1, 806)
        elseif Cpos3.x == TposT.x and Cpos3.y == TposT.y then
            doSendMagicEffect(posTarget, 788)
            doSendMagicEffect(posT1, 809)
        elseif Cpos4.x == TposT.x and Cpos4.y == TposT.y then --
            doSendMagicEffect(posTarget, 910) -- 795
        elseif Cpos5.x == TposT.x and Cpos5.y == TposT.y then --
            doSendMagicEffect(posTarget, 909) -- 794
        elseif Cpos6.x == TposT.x and Cpos6.y == TposT.y then
            doSendMagicEffect(posTarget, 908) -- 793
        elseif Cpos7.x == TposT.x and Cpos7.y == TposT.y then
            doSendMagicEffect(posTarget, 907) -- 792
        end
        
        doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 0) 
        
    elseif spell == "Doubleslap" then
        
        doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 148) 
        
    elseif spell == "Double Kick" then
        
        doAreaCombatHealth(cid, FIGHTINGDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 148)       
        addEvent(doSendMagicEffect, 3, PosTarget, 857)
        addEvent(doSendMagicEffect, 5, PosTarget, 857)  
        
    elseif spell == "Lovely Kiss" then 
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 16)
        
        local ret = {}
        ret.id = target
        ret.cd = 9
        ret.check = getPlayerStorageValue(target, conds["Stun"])
        ret.eff = 147
        ret.spell = spell
        ret.cond = "Stun" 
        
        addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)
        
    elseif spell == "Sing" then
        
        local ret = {}
        ret.id = 0
        ret.cd = math.random(5, 10)
        ret.check = 0
        ret.first = true
        ret.cond = "Sleep" --alterado v1.6
        
        doMoveInArea2(cid, 33, selfArea1, NORMALDAMAGE, 0, 0, spell, ret) 
        
    elseif spell == "Multislap" then
        
        --posUp = getThingPosWithDebug(cid) posUp.x = posUp.x +1 posUp.y = posUp.y + 1 posUp.z = posUp.z - 1 -- fazer de outra maneira
        
        doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 3)
        -- doAreaCombatHealth(cid, NORMALDAMAGE, posUp, splash, 0, 0, 3)
        
    elseif spell == "Metronome" then
        
        local spells = {"Shadow Storm", "Electric Storm", "Magma Storm", "Blizzard", "Leaf Storm", "Hydropump", "Sludge Rain", "Falling Rocks"}
        
        local random = math.random(1, #spells)
        
        local randommove = spells[random]
        local pos = getThingPosWithDebug(cid)
        pos.y = pos.y - 1
        
        doSendMagicEffect(pos, 161)
        
        addEvent(docastspell, 200, cid, spells[random])
        addEvent(doMoveInArea2, 215, cid, 0, BigArea2, NORMALDAMAGE, min, max, spell, ret) 
        
    elseif spell == "Focus" or spell == "Focus Energy" or spell == "Focus Punch" or spell == "Charge" or spell == "Swords Dance" then -- renomear focus pra focus energy(bonus no prox atk)
        --alterado v1.4
        if spell == "Charge" then
            doSendAnimatedText(getThingPosWithDebug(cid), "CHARGE", 168)
            doSendMagicEffect(getThingPosWithDebug(cid), 177)
        elseif spell == "Swords Dance" then -- deve dobrar o dano fisico por 15 segundos e ter bonus no proximo ataque
            doSendMagicEffect(PosCid1, 408) --132
        elseif spell == "Bulk Up" then
            doSendMagicEffect(getThingPosWithDebug(cid), 91)
        else
            doSendAnimatedText(getThingPosWithDebug(cid), "FOCUS", 144)
            doSendMagicEffect(getThingPosWithDebug(cid), 132)
        end
        setPlayerStorageValue(cid, 253, 1)
        
    elseif spell == "Growth" then
        --alterado v1.4
        if spell == "Growth" then
            doSendAnimatedText(getThingPosWithDebug(cid), "Growth", 168)
            doSendMagicEffect(getThingPosWithDebug(cid), 177)
        end
        
        setPlayerStorageValue(cid, 253, 1)
                
    elseif spell == "Hyper Voice" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 22
        ret.spell = spell
        ret.cond = "Stun" 
        
        doMoveInArea2(cid, 22, tw1, NORMALDAMAGE, min, max, spell, ret)
        
    elseif isInArray({"Restore", "Selfheal", "Recover", "Softboiled",}, spell) then -- ver sunny day, rain dance e outros com bônus de cura
        -- deixar Softboiled como passiva
        local min = (getCreatureMaxHealth(cid) * 65) / 100 -- rever, essa cura
        local max = (getCreatureMaxHealth(cid) * 85) / 100
        
        local function doHealArea(cid, min, max)
            local amount = math.random(min, max)
            if (getCreatureHealth(cid) + amount) >= getCreatureMaxHealth(cid) then
                amount = -(getCreatureHealth(cid)-getCreatureMaxHealth(cid))
            end
            if getCreatureHealth(cid) ~= getCreatureMaxHealth(cid) then
                
                if spell == "Recover" then -- testar essa parte
                    amountRecover = math.floor(amount/3)
                    doCreatureAddHealth(cid, amountRecover)
                    doSendAnimatedText(getThingPosWithDebug(cid), "+"..amountRecover.."", 65) -- mudar effect, fazer sky attack verde (effect)
                    
                    addEvent(doCreatureAddHealth, 1000, cid, amountRecover)
                    addEvent(doSendAnimatedText, 1000, getThingPosWithDebug(cid), "+"..amountRecover.."", 65)
                    addEvent(doSendMagicEffect, 1000, posC1, 132) 
                    
                    addEvent(doCreatureAddHealth, 2100, cid, amountRecover)
                    addEvent(doSendAnimatedText, 2100, getThingPosWithDebug(cid), "+"..amountRecover.."", 65)
                    addEvent(doSendMagicEffect, 2100, posC1, 132) 
                    
                else

                    doCreatureAddHealth(cid, amount)
                    doSendAnimatedText(getThingPosWithDebug(cid), "+"..amount.."", 65)
                end
            end
        end
        if spell == "Restore" then
            doSendMagicEffect(posC1, 621) 
        else
            doSendMagicEffect(posC, 132)
        end
        doHealArea(cid, min, max)
        
    elseif spell == "Aqua Ring" then -- colocar cura progressivamente
        
        local min = (getCreatureMaxHealth(cid) * 75) / 100
        local max = (getCreatureMaxHealth(cid) * 85) / 100
        
        local function doHealArea(cid, min, max)
            local amount = math.random(min, max)
            if (getCreatureHealth(cid) + amount) >= getCreatureMaxHealth(cid) then
                amount = -(getCreatureHealth(cid)-getCreatureMaxHealth(cid))
            end
            if getCreatureHealth(cid) ~= getCreatureMaxHealth(cid) then
                doCreatureAddHealth(cid, amount)
                doSendAnimatedText(getThingPosWithDebug(cid), "+"..amount.."", 65)
            end
        end
        
        doSendMagicEffect(getThingPosWithDebug(cid), 574) -- 132
        doHealArea(cid, min, max)
        
        
    elseif spell == "Healarea" then
        
        local min = (getCreatureMaxHealth(cid) * 40) / 100
        local max = (getCreatureMaxHealth(cid) * 65) / 100
        
        local function doHealArea(cid, min, max)
            local amount = math.random(min, max)
            if (getCreatureHealth(cid) + amount) >= getCreatureMaxHealth(cid) then
                amount = -(getCreatureHealth(cid)-getCreatureMaxHealth(cid))
            end
            if getCreatureHealth(cid) ~= getCreatureMaxHealth(cid) then
                doCreatureAddHealth(cid, amount)
                doSendAnimatedText(getThingPosWithDebug(cid), "+"..amount.."", 65)
            end
        end
        
        local pos = getPosfromArea(cid, heal)
        local n = 0
        doHealArea(cid, min, max)
        
        while n < #pos do
            n = n+1
            thing = {x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=253}
            local pid = getThingFromPosWithProtect(thing)
            doSendMagicEffect(pos[n], 12)
            if isCreature(pid) then
                if isSummon(cid) and (isSummon(pid) or isPlayer(pid)) then
                    if canAttackOther(cid, pid) == "Cant" then
                        doHealArea(pid, min, max)
                    end 
                elseif ehMonstro(cid) and ehMonstro(pid) then
                        doHealArea(pid, min, max)
                end
            end 
        end
        
    elseif spell == "Milk Drink" then
        
        local min = (getCreatureMaxHealth(cid) * 50) / 100
        local max = (getCreatureMaxHealth(cid) * 60) / 100
        
        local function doHealArea(cid, min, max)
            local amount = math.random(min, max)
            if (getCreatureHealth(cid) + amount) >= getCreatureMaxHealth(cid) then
                amount = -(getCreatureHealth(cid)-getCreatureMaxHealth(cid))
            end
            if getCreatureHealth(cid) ~= getCreatureMaxHealth(cid) then
                doCreatureAddHealth(cid, amount)
                doSendAnimatedText(getThingPosWithDebug(cid), "+"..amount.."", 65)
            end
        end
        
        local pos = getPosfromArea(cid, heal)
        local n = 0
        doHealArea(cid, min, max)
        
        while n < #pos do
            n = n+1
            thing = {x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=253}
            local pid = getThingFromPosWithProtect(thing)
            
            doSendMagicEffect(pos[n], 12)
            if isCreature(pid) then
                if isSummon(cid) and (isSummon(pid) or isPlayer(pid)) then
                    if canAttackOther(cid, pid) == "Cant" then
                        doHealArea(pid, min, max)
                    end 
                elseif ehMonstro(cid) and ehMonstro(pid) then
                    doHealArea(pid, min, max)
                end
            end 
        end
        
    

    
--  elseif spell == "Toxicc" then -- antigo
        
--      doMoveInArea2(cid, 114, reto5, POISONDAMAGE, min, max, spell)
        
        
        
    elseif spell == "Absorb" then
        local function getCreatureHealthSecurity(cid)
            if not isCreature(cid) then return 0 end
            return getCreatureHealth(cid) or 0
        end
        local life = getCreatureHealthSecurity(target)
        
        doAreaCombatHealth(cid, GRASSDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 14)
        
        local newlife = life - getCreatureHealthSecurity(target)
        
        doSendMagicEffect(getThingPosWithDebug(cid), 14)
        if newlife >= 1 then
            if isCreature(cid) then
                doCreatureAddHealth(cid, newlife)
            end
            doSendAnimatedText(getThingPosWithDebug(cid), "+"..newlife.."", 32)
        end 
        
        
    elseif spell == "Toxic" then -- colocar um pouco de transparência no effect 114 (ou add outro igual pra por (só pro tóxic))
            
        if isInArray({"Zubat", "Shiny Zubat", "Golbat", "Shiny Golbat"}, getSubName(cid, target)) then
            
            doMoveInArea2(cid, 784, reto5, POISONDAMAGE, min, max, spell)
            addEvent(doMoveInArea2, 10, cid, 114, reto5, POISONDAMAGE, 0, 0, spell)
            
        elseif isInArray({"Crobat", "Shiny Crobat"}, getSubName(cid, target)) then
            
            doMoveInArea2(cid, 784, wish, POISONDAMAGE, min, max, spell, ret) 
            doMoveInArea2(cid, 114, wish, POISONDAMAGE, 0, 0, spell, ret) 
            addEvent(doMoveInArea2, 200, cid, 784, rock1, POISONDAMAGE, min, max, spell, ret) 
            addEvent(doMoveInArea2, 200, cid, 114, rock1, POISONDAMAGE, 0, 0, spell, ret) 
            
        elseif isInArray({"Koffing", "Weezing"}, getSubName(cid, target)) then 
            
            doMoveInArea2(cid, 784, wish, POISONDAMAGE, min, max, spell, ret) 
            doMoveInArea2(cid, 114, wish, POISONDAMAGE, 0, 0, spell, ret) 
            
            addEvent(doMoveInArea2, 200, cid, 784, rock1, POISONDAMAGE, min, max, spell, ret) 
            addEvent(doMoveInArea2, 200, cid, 114, rock1, POISONDAMAGE, 0, 0, spell, ret) 
            
        else
            
            local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
            local p = getThingPosWithDebug(cid)
            local t = {
                [0] = {382, {x=p.x, y=p.y-1, z=p.z}},
                [1] = {383, {x=p.x+5, y=p.y+1, z=p.z}}, 
                [2] = {384, {x=p.x, y=p.y+6, z=p.z}},
                [3] = {385, {x=p.x-1, y=p.y, z=p.z}},
            }
            
            local areaT = reto5
            
            doMoveInArea2(cid, 0, areaT, POISONDAMAGE, min, max, spell)
            doSendMagicEffect(t[a][2], t[a][1]) 
            
        end
        
        
        
    elseif spell == "Poison Gas" then 
        
        local dmg = isSummon(cid) and getMasterLevel(cid)+getPokemonBoost(cid) or getPokemonLevel(cid)
        
        local ret = {id = 0, cd = 2, eff = 770, check = 0, spell = spell, cond = "Miss"} -- 770
        -- local ret2 = {id = 0, cd = 13, check = 0, damage = dmg, cond = "Poison"} -- funciona o poison se o poke estiver no target, sem target não funciona --rever isso ainda!!
        
        local function gas(cid)
            doMoveInArea2(cid, 770, confusion, POISONDAMAGE, 0, 0, spell, ret) -- 114
            doMoveInArea2(cid, 0, confusion, POISONDAMAGE, min, max, spell)
        end
        
        times = {0, 500, 1000, 1500, 2300, 2800, 3300, 3800, 4600, 5100, 5600, 6100, 6900, 7400, 7900, 8400} -- , 9200, 10000
        
        for i = 1, #times do
            addEvent(gas, times[i], cid) 
        end
        
        
        
    elseif spell == "Petal Dance" then
        
        doMoveInAreaMulti(cid, 129, 245, bullet, bulletDano, GRASSDAMAGE, min, max)
        
        
    elseif spell == "Dynamic Punch" then -- chance de causar stun
        
        local ret = {}
        ret.id = 0
        ret.cd = 5
        ret.check = 0
        ret.eff = 88
        ret.spell = spell
        stunChance = math.random(1,5)
        
        if stunChance >= 3 then
            ret.cond = "Stun" 
        else
            ret.cond = nil
        end
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39) 
        local posTx1 = posT posTx1.x = posTx1.x+1
        doSendMagicEffect(posT1, 572) -- efeito
        doDanoWithProtectWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 39) -- dano
        addEvent(doMoveDano2, 50, cid, target, FIGHTINGDAMAGE, 0, 0, ret, spell) -- condição(stun)
        
        
        --[[
        local pos = getThingPosWithDebug(cid)
        local areas = {rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1}
        
        for i = 0, 9 do
            addEvent(doMoveInArea2, i*400, cid, 112, areas[i+1], FIGHTINGDAMAGE, min, max, spell)
            addEvent(doMoveInArea2, i*410, cid, 112, areas[i+1], FIGHTINGDAMAGE, 0, 0, spell)
        end
        --]]
        
    elseif spell == "Revenge" then -- Refeito igual PxG, Sam. ( tentar fazer o código de outra forma, com for 0,4 do eff+1 )
        
        stopNow(cid, 700)
        doCreatureSetNoMove(cid, true)
        setPlayerStorageValue(cid, 32698, 1) -- storage do silence
        addEvent(setPlayerStorageValue, 700, cid, 32698, -1) -- storage do silence
        addEvent(doCreatureSetNoMove, 920, cid, false)
        
        addEvent(doSendMagicEffect, 80, posC1, 92)
        addEvent(doSendMagicEffect, 400, posC1, 93)
        addEvent(doSendMagicEffect, 775, posC1, 573) -- soco
        addEvent(doSendMagicEffect, 1150, posC1, 94)
        addEvent(doSendMagicEffect, 1420, posC1, 95)
        
        addEvent(doMoveInArea2, 60, cid, 0, bomb, FIGHTINGDAMAGE, min, max, spell)
        addEvent(doMoveInArea2, 380, cid, 0, bomb, FIGHTINGDAMAGE, min, max, spell)
        addEvent(doMoveInArea2, 720, cid, 0, bomb, FIGHTINGDAMAGE, min, max, spell)
        addEvent(doMoveInArea2, 1000, cid, 0, bomb, FIGHTINGDAMAGE, min, max, spell)
        addEvent(doMoveInArea2, 1300, cid, 0, bomb, FIGHTINGDAMAGE, min, max, spell)
        
        
    elseif spell == "Close Combat" then
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 26)
        doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, -min, -max, 237) --alterado v1.7 
        doSendAnimatedText(getThingPosWithDebug(cid), "FOCUS", 144) 
        setPlayerStorageValue(cid, 253, 1)
        
    elseif spell == "Sand Storm" then
        
        local master = isSummon(cid) and getCreatureMaster(cid) or cid
        ------------
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 34
        ret.cond = "Silence"
        ---
        local function doFall(cid)
            for rocks = 1, 42 do --62
                addEvent(fall, rocks*35, cid, master, GROUNDDAMAGE, 22, 158) -- 22, 158
            end
        end
        ---
        local function doRain(cid)
            if isSummon(cid) then 
                doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
            end --cura status
            doCureStatus(cid, "all")
            ---
            setPlayerStorageValue(cid, 253, 1) --focus
            doSendMagicEffect(getThingPosWithDebug(cid), 132)
            ---
            doMoveInArea2(cid, 0, confusion, GROUNDDAMAGE, 0, 0, spell, ret)
        end
        ---
        addEvent(doFall, 200, cid)
        addEvent(doRain, 1000, cid)
        
    elseif spell == "Powder Snow" then
        
        snowP = getThingPosWithDebug(cid)
        
        local ret = {}
        ret.id = 0
        ret.cd = 10
        ret.check = 0
        ret.eff = 43
        ret.spell = spell
        ret.cond = "Slow" 
        
        doMoveInArea2(cid, 0, check, ICEDAMAGE, min, max, spell, ret)
        doSendMagicEffect({x = snowP.x + 1, y = snowP.y, z = snowP.z}, 206)

    elseif spell == "Absolute Zero" then
        
        snowP = getThingPosWithDebug(cid)
        
        local ret = {}
        ret.id = 0
        ret.cd = 4
        ret.check = 0
        ret.eff = 43
        ret.spell = spell
        ret.cond = "Slow" 
        
        doMoveInArea2(cid, 578, check, ICEDAMAGE, min, max, spell, ret)
        
    elseif spell == "Slash" then
        
        doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 159)
        
    elseif spell == "X-Scissor" or spell == "Cross Poison" then
        
        
        local a = getThingPosWithDebug(cid)
        
        local X = { -- pos, X-Scissor, Cross Poison
            {{x = a.x+1, y = a.y, z = a.z}, 437, 663}, --norte
            {{x = a.x+2, y = a.y+1, z = a.z}, 438, 664}, --leste
            {{x = a.x+1, y = a.y+2, z = a.z}, 436, 662}, --sul
            {{x = a.x, y = a.y+1, z = a.z}, 435, 661}, --oeste
        }
        
        local pos = X[mydir+1]
        
        for b = 1, 3 do
            if spell == "X-Scissor" then
                addEvent(doSendMagicEffect, b * 70, pos[1], pos[2])
            else
                addEvent(doSendMagicEffect, b * 70, pos[1], pos[3])
            end 
        end
        
        
        if spell == "X-Scissor" then    
            doMoveInArea2(cid, 2, xScissor, BUGDAMAGE, min, max, spell)
        else
            doMoveInArea2(cid, 2, xScissor, POISONDAMAGE, max, min, spell)
        end
        
        
        
    elseif spell == "Psychic" then
        
        addEvent(doSendMagicEffect, 1, PosCid1, 397)         
        addEvent(doDanoWithProtect, 110,cid, psyDmg, getThingPosWithDebug(cid), selfArea2, min, max, 429) 

    elseif spell == "Ominous Wind" then
                
        addEvent(doSendMagicEffect, 1, PosCid1, 988)            
        doMoveInArea2(cid, 0, stomp2, GHOSTDAMAGE, min, max, spell)                     
        
    elseif spell == "Pay Day" then
        
        --alterado v1.7
        local function doThunderFall(cid, frompos, target)
            if not isCreature(target) or not isCreature(cid) then return true end
            local pos = getThingPosWithDebug(target)
            local ry = math.abs(frompos.y - pos.y)
            doSendDistanceShoot(frompos, getThingPosWithDebug(target), 39)
            addEvent(doDanoInTarget, ry * 11, cid, target, NORMALDAMAGE, min, max, 28) --alterado v1.7
        end
        
        local function doThunderUp(cid, target)
            if not isCreature(target) or not isCreature(cid) then return true end
            local pos = getThingPosWithDebug(target)
            local mps = getThingPosWithDebug(cid)
            local xrg = math.floor((pos.x - mps.x) / 2)
            local topos = mps
            topos.x = topos.x + xrg
            local rd = 7
            topos.y = topos.y - rd
            doSendDistanceShoot(getThingPosWithDebug(cid), topos, 39)
            addEvent(doThunderFall, rd * 49, cid, topos, target)
        end     
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 350, cid, 3644587, -1) 
        for thnds = 1, 2 do
            addEvent(doThunderUp, thnds * 155, cid, target)
        end 
        
    elseif spell == "Psywave" then
        
        doMoveInArea2(cid, 133, db1, psyDmg, min, max, spell) 
        
    elseif spell == "Triple Kick" or spell == "Triple Kick Lee" then
        
        doDanoWithProtect(cid, FIGHTINGDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 975) -- 110
        
    elseif spell == "Karate Chop" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, -min, -max, 772) --alterado v1.7
        
    elseif spell == "Ground Chop" then
        
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area, area2, eff) --alterado v1.6
            if isCreature(cid) then
                --if not isSightClear(p, area, false) then return true end
                doAreaCombatHealth(cid, FIGHTINGDAMAGE, area, 0, 0, 0, eff) 
                doAreaCombatHealth(cid, FIGHTINGDAMAGE, area2, whirl3, -min, -max, 255) --alterado v1.6 
            end
        end
        
        for a = 0, 4 do
            
            local t = {
                [0] = {99, {x=p.x+1, y=p.y-(a+1), z=p.z}, {x=p.x, y=p.y-(a+1), z=p.z}}, --alterado v1.6
                [1] = {99, {x=p.x+(a+2), y=p.y+1, z=p.z}, {x=p.x+(a+1), y=p.y, z=p.z}},
                [2] = {99, {x=p.x+1, y=p.y+(a+2), z=p.z}, {x=p.x, y=p.y+(a+1), z=p.z}},
                [3] = {99, {x=p.x-(a+1), y=p.y+1, z=p.z}, {x=p.x-(a+1), y=p.y, z=p.z}}
            } 
            addEvent(sendAtk, 270*a, cid, t[d][2], t[d][3], t[d][1]) --alterado v1.6
        end 
        
    elseif spell == "Mega Punch" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 112) 
                
    elseif spell == "Tri Flames" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 39
        ret.cond = "Silence"
        
        doMoveInArea2(cid, 6, triflames, FIREDAMAGE, 0, 0, spell, ret) -- 
        doMoveInArea2(cid, 356, triflames, FIREDAMAGE, min, max, spell, ret) -- 
        
    elseif spell == "War Dog" then
        
        local ret = {}
        ret.id = cid
        ret.cd = 15
        ret.eff = 28
        ret.check = 0
        ret.buff = spell
        ret.first = true
        
        doCondition2(ret)
        
    elseif spell == "Bulk Up" then -- or spell == "Outrage" then
        
        local ret = {}
        ret.id = cid
        ret.cd = 10
        ret.eff = 356 -- spell == "Outrage" and 358 or 356
        ret.check = 0
        ret.buff = spell
        ret.first = true
        
        doCondition2(ret)
        
    elseif spell == "Hypnosis" then
        
        local ret = {}
        
        if isInArray({"Hypno", "Shiny Hypno", "Poliwag", "Poliwhirl", "Poliwrath"}, getSubName(cid, target)) then
            ret.id = 0
        else
            ret.id = target
        end
        
        ret.cd = math.random(7, 8) -- math.random(6, 9)
        ret.check = getPlayerStorageValue(target, conds["Sleep"])
        ret.first = true --alterado v1.6
        ret.cond = "Sleep"
        
        if isInArray({"Hypno", "Shiny Hypno", "Poliwag", "Poliwhirl", "Poliwrath"}, getSubName(cid, target)) then
        addEvent(doSendMagicEffect, 20, posC1, 684) -- 684, 906
        doSendMagicEffect(posC1, 906) -- colocar qnd tiver com novo spr
        addEvent(doMoveInArea2, 20, cid, 0, bombWee1, PSYCHICDAMAGE, 0, 0, spell, ret)
        else
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 24)
        addEvent(doMoveDano2, 150, cid, target, PSYCHICDAMAGE, 0, 0, ret, spell)
        end
        
        
    elseif spell == "Dizzy Punch" then
        
        local rounds = getPokemonLevel(cid) / 12
        rounds = rounds + 2
        
        local ret = {}
        ret.id = target
        ret.check = getPlayerStorageValue(target, conds["Confusion"])
        ret.cd = rounds
        ret.cond = "Confusion"
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 26)
        doDanoWithProtect(cid, FIGHTINGDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 112)    
        addEvent(doMoveDano2, 50, cid, target, NORMALDAMAGE, 0, 0, ret, spell)
        
    elseif spell == "Ice Punch" then
        
        local ret = {}
        ret.id = target
        ret.cd = 9
        ret.eff = 43
        ret.check = getPlayerStorageValue(target, conds["Slow"])
        ret.first = true
        ret.cond = "Slow"
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 28)
        doSendMagicEffect(posT1, 625)
        doDanoWithProtectWithDelay(cid, target, ICEDAMAGE, min, max, 43)
        addEvent(doMoveDano2, 50, cid, target, ICEDAMAGE, 0, 0, ret, spell)
        
        
        
        
        
    elseif spell == "Ice Beam" then
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {97, {x=p.x+1, y=p.y-1, z=p.z}},
            [1] = {96, {x=p.x+6, y=p.y+1, z=p.z}}, 
            [2] = {97, {x=p.x+1, y=p.y+6, z=p.z}},
            [3] = {96, {x=p.x-1, y=p.y+1, z=p.z}},
        }
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 43
        ret.check = 0
        ret.first = true
        ret.cond = "Slow"
        
        doMoveInArea2(cid, 0, triplo6, ICEDAMAGE, min, max, spell, ret)
        doSendMagicEffect(t[a][2], t[a][1])
        
        -- antigo Dark Pulse, mudei o nome e fiz uma nova spell chamada Dark Pulse.
    elseif spell == "Psy Pulse" or spell == "Cyber Pulse" or spell == "Dark Ball" then -- conforme o anime /\
        
        damage = skill == "Dark Ball" and DARKDAMAGE or psyDmg
        
        if spell == "Cyber Pulse" then
            eff = 11
            shooT = 3
        elseif spell == "Dark Ball" then
            eff = 718 
            if isInArray({"Absol", "Mega Absol"}, getSubName(cid, target)) then 
                shooT = 109 -- 109
            else
                shooT = 100 -- 112
            end
        else
            eff = 133
            shooT = 3
        end 
        
        local function doPulse(cid, eff)
            if not isCreature(cid) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), shooT)
            doDanoInTargetWithDelay(cid, target, damage, min, max, eff) --alterado v1.7
        end
            
        addEvent(doPulse, 0, cid, eff) 
        --if not isInArray({"Absol", "Mega Absol"}, getSubName(cid, target)) then -- colocar só para o MEGA (pegando mega id)
        if isInArray({"Psy Pulse", "Cyber Pulse"}, spell) then 
            addEvent(doPulse, 250, cid, eff)
        end 
    elseif spell == "Psyusion" then
        
        local rounds = math.random(4, 7)
        rounds = rounds + math.floor(getPokemonLevel(cid) / 35)
        local eff = {429, 585, 133, 430, 133} -- 430, 429, 430, 429, 133
        local area = {psy1, psy2, psy3, psy4, psy5}
        
        local ret = {}
        ret.id = 0
        ret.check = 0
        ret.cd = rounds
        ret.cond = "Confusion"
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 4*400, cid, 3644587, -1)
        addEvent(doSendMagicEffect, 20, posC1, 892) -- 893
        for i = 0, 4 do
            addEvent(doMoveInArea2, i*400, cid, eff[i+1], area[i+1], psyDmg, min, max, spell, ret)
        end
        
        -- fazer dano em pid igual no moon blast (effect azul losango)
        
    elseif spell == "Triple Punch" then
        
        doDanoWithProtect(cid, FIGHTINGDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 110)
        
    elseif spell == "Fist Machine" or spell == "Bullet Punch" then
        
        local mpos = getThingPosWithDebug(cid)
        local b = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local effect = 0
        local xvar = 0
        local yvar = 0
        
        if getSubName(cid, target) == "Lucario" then
            if b == SOUTH then
                effect = 448
                yvar = 2
            elseif b == NORTH then
                effect = 447
            elseif b == WEST then
                effect = 446
            elseif b == EAST then -- direita
                effect = 445
                xvar = 2
            end 
        elseif getSubName(cid, target) == "Shiny Lucario" then
            if b == SOUTH then
                effect = 444
                yvar = 2
            elseif b == NORTH then
                effect = 443
            elseif b == WEST then
                effect = 442
            elseif b == EAST then
                effect = 441
                xvar = 2
            end 
        else
            if b == SOUTH then
                effect = spell == "Bullet Punch" and 373 or 218
                yvar = 2
            elseif b == NORTH then
                effect = spell == "Bullet Punch" and 372 or 217
            elseif b == WEST then
                effect = spell == "Bullet Punch" and 371 or 216
            elseif b == EAST then
                effect = spell == "Bullet Punch" and 370 or 215
                xvar = 2
            end
        end
        mpos.x = mpos.x + xvar
        mpos.y = mpos.y + yvar 
        
        doSendMagicEffect(mpos, effect)
        doMoveInArea2(cid, 0, machine, FIGHTINGDAMAGE, min, max, spell)
        
    elseif spell == "Destroyer Hand" then
        
        doMoveInAreaMulti(cid, 26, 111, bullet, bulletDano, FIGHTINGDAMAGE, min, max)
        
    elseif spell == "Rock Throw" then -- editar, colocar pequena chance de burn se for pedra de fogo, fazer passiva pra isso
        
        local atk = { -- missile, effect
            ["Rock Throw"] = {11, 44, 0, 176, 70, 716}, -- padrão, crystal, lava
        }
        
        if isInArray({"Numel", "Shiny Numel", "Camerupt", "Shiny Camerupt", "Mega Camerupt", "Magcargo", "Shiny Magcargo", "Slugma", "Shiny Slugma"}, getSubName(cid, target)) then
            effD = atk[spell][5]
            eff = atk[spell][6]
        elseif isInArray({"Crystal Onix", "Crystal Steelix"}, getSubName(cid, target)) then
            effD = atk[spell][3]
            eff = atk[spell][4]
        else
            effD = atk[spell][1]
            eff = atk[spell][2]
        end
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), effD)
        doDanoInTargetWithDelay(cid, target, ROCKDAMAGE, min, max, eff) --alterado v1.7
                
    elseif spell == "Rock Slide" then -- editar, colocar pequena chance de burn se for pedra de fogo, fazer passiva pra isso
        -- EDITAR atk = para local atk = (tava dando bug aqui, tem várias spells que não ta como local...)
        
        local atk = { -- missile, effect
            ["Rock Slide"] = {11, 44, 0, 176, 70, 716}, -- padrão, crystal, lava
            --Stone Edge"] = {11, 239}
        } 
        if isInArray({"Numel", "Shiny Numel", "Camerupt", "Shiny Camerupt", "Mega Camerupt", "Magcargo", "Shiny Magcargo", "Slugma", "Shiny Slugma"}, getSubName(cid, target)) then
            effD = atk[spell][5]
            eff = atk[spell][6]
        elseif isInArray({"Crystal Onix", "Crystal Steelix"}, getSubName(cid, target)) then
            effD = atk[spell][3]
            eff = atk[spell][4]
        else
            effD = atk[spell][1]
            eff = atk[spell][2]
        end
        
        --alterado v1.7
        local function doRockFall(cid, frompos, target)
            if not isCreature(target) or not isCreature(cid) then return true end
            local pos = getThingPosWithDebug(target)
            local ry = math.abs(frompos.y - pos.y)
            doSendDistanceShoot(frompos, getThingPosWithDebug(target), effD)
            --  doSendMagicEffect(frompos, 132) -- testando
            addEvent(doDanoInTarget, ry * 15, cid, target, ROCKDAMAGE, min, max, eff) --alterado v1.7
        end
        
        local function doRockUp(cid, target)
            if not isCreature(target) or not isCreature(cid) then return true end
            local pos = getThingPosWithDebug(cid)
            local xrg = math.floor((pos.x-1 - pos.x-6))
            local topos = pos
            topos.x = topos.x + xrg
            local rd = 8
            topos.y = topos.y - rd
            doSendDistanceShoot(getThingPosWithDebug(cid), topos, effD)
            addEvent(doRockFall, rd * 49, cid, topos, target)
        end     
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 350, cid, 3644587, -1)
        for thnds = 1, 2 do
            addEvent(doRockUp, thnds * 155, cid, target)
        end 
        
        
        
    elseif spell == "Falling Rocks" then -- mesma coisa do rock slide?
        
        local effD = getSubName(cid, target) == "Crystal Onix" and 0 or 11
        local eff = getSubName(cid, target) == "Crystal Onix" and 176 or 44 --alterado v1.6.1
        
        local master = isSummon(cid) and getCreatureMaster(cid) or cid
        ------------
        
        local function doFall(cid)
            for rocks = 1, 62 do
                addEvent(fall, rocks*35, cid, master, ROCKDAMAGE, effD, eff)
            end
        end
        
        for up = 1, 10 do 
            addEvent(upEffect, up*75, cid, effD)
        end
        addEvent(doFall, 450, cid)
        addEvent(doDanoWithProtect, 1400, cid, ROCKDAMAGE, getThingPosWithDebug(cid), waterarea, -min, -max, 0)
        
        
        
    elseif spell == "Selfdestruct" then 
        local posi = getThingPos(cid)    
        doSendMagicEffect(posC, 823)     
        addEvent(doSendMagicEffect, 800, getThingPosWithDebug(cid), 823)
        addEvent(doSendMagicEffect, 1600, getThingPosWithDebug(cid), 823)
        addEvent(stopNow, 1000, cid, 1300) -- 980
        -- addEvent(doSendMagicEffect, 1200, posC, 824)
            
        function doSelfDestructionNow(cid)
            
            doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(cid), selfArea2, -min, -max, 503)
            doKillWildPoke(cid, cid)
        end 
        
        addEvent(doSelfDestructionNow, 2200, cid)   
        
    elseif spell == "Crusher Stomp" then
        
        local pL = getThingPosWithDebug(cid)
        pL.x = pL.x+5
        pL.y = pL.y+1 
        -----------------
        local pO = getThingPosWithDebug(cid)
        pO.x = pO.x-3
        pO.y = pO.y+1 
        ------------------
        local pN = getThingPosWithDebug(cid)
        pN.x = pN.x+1
        pN.y = pN.y+5 
        -----------------
        local pS = getThingPosWithDebug(cid)
        pS.x = pS.x+1
        pS.y = pS.y-3 
        
        local po = {pL, pO, pN, pS}
        local po2 = {
            {x = pL.x, y = pL.y-1, z = pL.z},
            {x = pO.x, y = pO.y-1, z = pO.z},
            {x = pN.x-1, y = pN.y, z = pN.z},
            {x = pS.x-1, y = pS.y, z = pS.z},
        }
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 34
        ret.spell = spell
        ret.cond = "Stun"
        
        for i = 1, 4 do
            doSendMagicEffect(po[i], 127)
            doAreaCombatHealth(cid, GROUNDDAMAGE, po2[i], crusher, -min, -max, 255)
        end
        doMoveInArea2(cid, 118, stomp, GROUNDDAMAGE, min, max, spell, ret) 
        
        
        -- Rising Water
    elseif spell == "Water Pulse" then -- mudar o nome(water rise ou water ascend), criar outra spell diferente com esse nome water pulse
        -- Elevação d'água ou Water Rise 
        doDanoWithProtect(cid, WATERDAMAGE, getThingPosWithDebug(cid), selfArea2, min, max, 155) 
        
        setPlayerStorageValue(cid, 2956317, 1)
        
    elseif spell == "W4ter Pulse2" then 
        
        doDanoWithProtect(cid, WATERDAMAGE, getThingPosWithDebug(cid), waterPulse1, min, max, 68) 
        addEvent(doDanoWithProtect, 280, cid, WATERDAMAGE, getThingPosWithDebug(cid), waterPulse2, min, max, 68) 
        addEvent(doDanoWithProtect, 560, cid, WATERDAMAGE, getThingPosWithDebug(cid), waterPulse3, min, max, 68) 
        addEvent(doDanoWithProtect, 840, cid, WATERDAMAGE, getThingPosWithDebug(cid), waterPulse4, min, max, 68)    
        
        
        
    elseif spell == "Sonicboom" then
        
        local function doBoom(cid)
            if not isCreature(cid) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 33)
            doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 355) --alterado v1.7
        end
        
        addEvent(doBoom, 0, cid)
        addEvent(doBoom, 250, cid)
        
    elseif spell == "Stickmerang" then 
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 34)
        doDanoInTargetWithDelay(cid, target, FLYINGDAMAGE, min, max, 212) --alterado v1.7
        
    elseif spell == "Stickslash" then
        
        local function sendStickEff(cid, dir)
            if not isCreature(cid) then return true end
            doAreaCombatHealth(cid, FLYINGDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 212)
        end
        
        local function doStick(cid)
            if not isCreature(cid) then return true end
            local t = {
                [1] = SOUTHWEST,
                [2] = SOUTH,
                [3] = SOUTHEAST,
                [4] = EAST,
                [5] = NORTHEAST,
                [6] = NORTH,
                [7] = NORTHWEST,
                [8] = WEST,
                [9] = SOUTHWEST,
            }
            for a = 1, 9 do
                addEvent(sendStickEff, a * 140, cid, t[a])
            end
        end
        
        doStick(cid, false, cid)
        
        
        
        --elseif spell == "Cannon OLD Balll" then -- pode ser muito util, editar
        
        -- local area = {Throw01, Throw02, Throw03, Throw04, Throw03, Throw02, Throw01}
        -- for i = 0, 6 do
        -- addEvent(doMoveInArea2, i*400, cid, 100, area[i+1], GROUNDDAMAGE, min, max, spell)
        -- end  
        
        
    elseif spell == "Pluck" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        doDanoInTargetWithDelay(cid, target, FLYINGDAMAGE, min, max, 111) --alterado v1.7
        
    elseif spell == "Tri-Attack" then
        
        --alterado v1.7
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 600, cid, 3644587, -1) 
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 42) --alterado v1.6
        for i = 0, 2 do
            addEvent(doDanoInTargetWithDelay, i*300, cid, target, NORMALDAMAGE, min, max, 238) --alterado v1.7
        end 
        
    elseif spell == "Fury Attack" then
        
        --alterado v1.7
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 600, cid, 3644587, -1) 
        for i = 0, 2 do
            addEvent(doDanoInTargetWithDelay, i*300, cid, target, NORMALDAMAGE, min, max, 975) -- 110
        end 
    
    elseif spell == "Icy Wind" then 
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 43
        ret.check = 0
        ret.first = true
        ret.cond = "Slow"
        
        doMoveInArea2(cid, 388, db1, ICEDAMAGE, min, max, spell, ret)
        
    elseif spell == "Aurora Beam" then
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {186, {x=p.x+1, y=p.y-1, z=p.z}},
            [1] = {57, {x=p.x+6, y=p.y+1, z=p.z}}, --alterado v1.6
            [2] = {186, {x=p.x+1, y=p.y+6, z=p.z}},
            [3] = {57, {x=p.x-1, y=p.y+1, z=p.z}}, --alterado v1.6
        }
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 43
        ret.check = 0
        ret.first = true
        ret.cond = "Slow"
        
        doMoveInArea2(cid, 0, triplo6, ICEDAMAGE, min, max, spell, ret)
        doSendMagicEffect(t[a][2], t[a][1])
        
    elseif spell == "Rest" then -- criar aquela passiva do slaking que faz dormir só que não cura a vida (newStatusSyst lá pela linha 671)
        
        local ret = {}
        ret.id = cid
        ret.cd = 6
        ret.eff = 0
        ret.check = 0
        ret.buff = spell
        ret.first = true
        
        doCondition2(ret)
        
    elseif spell == "Sludge" then 
        
        --alterado v1.7
        local function doSludgeFall(cid, frompos, target)
            if not isCreature(target) or not isCreature(cid) then return true end
            local pos = getThingPosWithDebug(target)
            local ry = math.abs(frompos.y - pos.y)
            doSendDistanceShoot(frompos, getThingPosWithDebug(target), 6)
            addEvent(doDanoInTargetWithDelay, ry * 11, cid, target, POISONDAMAGE, min, max, 845) -- 116 -- SLUDGEDAMAGE
        end
        
        local function doSludgeUp(cid, target)
            if not isCreature(target) or not isCreature(cid) then return true end
            local pos = getThingPosWithDebug(target)
            local mps = getThingPosWithDebug(cid)
            local xrg = math.floor((pos.x - mps.x) / 2)
            local topos = mps
            topos.x = topos.x + xrg
            local rd = 7
            topos.y = topos.y - rd
            doSendDistanceShoot(getThingPosWithDebug(cid), topos, 6)
            addEvent(doSludgeFall, rd * 49, cid, topos, target)
        end     
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 350, cid, 3644587, -1) 
        for thnds = 1, 2 do
            addEvent(doSludgeUp, thnds * 155, cid, target)
        end --alterado v1.5
        
        
    elseif spell == "Mortal Gas" then
        
        local pos = getThingPosWithDebug(cid)
        
        local function doSendAcid(cid, pos)
            if not isCreature(cid) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), pos, 14)
            doSendMagicEffect(pos, 114)
        end
        
        for b = 1, 3 do
            for a = 1, 20 do
                local lugar = {x = pos.x + math.random(-4, 4), y = pos.y + math.random(-3, 3), z = pos.z}
                addEvent(doSendAcid, a * 75, cid, lugar)
            end
        end
        doDanoWithProtect(cid, POISONDAMAGE, pos, waterarea, -min, -max, 0) 
        
        
        
        
        
    elseif spell == "Rock Drill" or spell == "Megahorn" or spell == "Drill Run" then
        
        if isInArray({"Rapidash", "Shiny Rapidash", "Seaking"}, getSubName(cid, target)) and spell == "Megahorn" then
            doMoveInAreaMulti(cid, 25, 118, bullet, bulletDano, NORMALDAMAGE, min, max) -- effect e dano Normal 
        else
            
            if spell == "Megahorn" then
                doMoveInAreaMulti(cid, 25, 8, bullet, bulletDano, BUGDAMAGE, min, max) -- effect e dano Bug
            elseif spell == "Drill Run" or spell == "Rock Drill" then
                doMoveInAreaMulti(cid, 159, 118, bullet, bulletDano, EARTHDAMAGE, min, max) 
                addEvent(doMoveInAreaMulti, 25, cid, 98, 754, bullet, bulletDano, EARTHDAMAGE, 0, 0) 
            end
        end     
        
    elseif spell == "Rock Blast" then
        
        doMoveInAreaMulti(cid, 11, 44, bullet, bulletDano, damage, min, max)
        
        
    elseif spell == "Egg Bomb" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 12)
        doDanoWithProtectWithDelay(cid, target, NORMALDAMAGE, min, max, 5, crusher)
        
        
    elseif spell == "Super Vines" or spell == "Power Whipe" then
        
        stopNow(cid, 200)
        doCreatureSetLookDir(cid, 2)
        
        local effect = 0
        local pos = getThingPosWithDebug(cid)
        pos.x = pos.x + 1
        pos.y = pos.y + 1
        
        if getSubName(cid, target) == "Tangrowth" then
            effect = 504
        elseif getSubName(cid, target) == "Shiny Tangrowth" then
            effect = 505
        elseif getSubName(cid, target) == "Shiny Tangela" then
            effect = 229        
        else
            effect = 213 -- Tangela
        end
        
        doSendMagicEffect(pos, effect)
        if getSubName(cid, target) == "Tangrowth" then
            doDanoWithProtect(cid, SEED_BOMBDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 0)
        else
            doDanoWithProtect(cid, GRASSDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 0)
        end
        
    elseif spell == "Epicenter" then
        
        doMoveInArea2(cid, 127, epicenter, GROUNDDAMAGE, min, max, spell)
        
    elseif spell == "Bubblebeam" then
        
        local function sendBubbles(cid)
            if not isCreature(cid) or not isCreature(target) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 139) -- 2 -- 128
            doDanoInTargetWithDelay(cid, target, WATERDAMAGE, min, max, 735) -- 68 
        end
        
        sendBubbles(cid)
        addEvent(sendBubbles, 200, cid) -- 250
        addEvent(sendBubbles, 360, cid) 
        addEvent(sendBubbles, 520, cid) 
        
    elseif spell == "Swift" then
        
        local function sendSwift(cid, target)
            if not isCreature(cid) or not isCreature(target) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 32)
            doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 3) --alterado v1.7
        end
        
        addEvent(sendSwift, 100, cid, target)
        addEvent(sendSwift, 200, cid, target) 
        
    elseif spell == "Spark" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 32)
        doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 48) --alterado v1.7
        
        
    elseif spell == "Mimic Wall" then
        
        local p = getThingPosWithDebug(cid)
        local dirr = getCreatureLookDir(cid)
        
        if dirr == 0 or dirr == 2 then
            item = 11439
        else
            item = 11440
        end
        
        local wall = {
            [0] = {{x = p.x, y = p.y-1, z = p.z}, {x = p.x+1, y = p.y-1, z = p.z}, {x = p.x-1, y = p.y-1, z = p.z}},
            [2] = {{x = p.x, y = p.y+1, z = p.z}, {x = p.x+1, y = p.y+1, z = p.z}, {x = p.x-1, y = p.y+1, z = p.z}},
            [1] = {{x = p.x+1, y = p.y, z = p.z}, {x = p.x+1, y = p.y+1, z = p.z}, {x = p.x+1, y = p.y-1, z = p.z}},
            [3] = {{x = p.x-1, y = p.y, z = p.z}, {x = p.x-1, y = p.y+1, z = p.z}, {x = p.x-1, y = p.y-1, z = p.z}},
        }
        
        for i = 1, 3 do
            if wall[dirr] then
                local t = wall[dirr]
                if hasTile(t[i]) and canWalkOnPos2(t[i], true, true, true, true, false) then --alterado v1.6
                    local walls = doCreateItem(item, 1, t[i])
                    doDecayItem(walls)
                end
            end
        end 
        
    elseif spell == "Bullet Punch" then
        
        
        
    elseif spell == "Compass Slash" then
        
        pos = getThingPos(cid)
        pos.x = pos.x +2
        pos.y = pos.y +2
        doSendMagicEffect(pos, 374)
        doDanoWithProtect(cid, BUGDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 0)
        
    elseif spell == "Shredder Team" or spell == "Double Team" or spell == "Substitute" then --alterado v1.8 \/
        
        local team = {
            ["Scyther"] = 3,
            ["Shiny Scyther"] = 3,
            ["Scizor"] = 4,
            ["Xatu"] = 2,
            ["Shiny Xatu"] = 3,
            ["Yanma"] = 2,
            ["Torchic"] = 2,
            ["Ludicolo"] = 2,
            ["Shiftry"] = 2,
            ["Altaria"] = 2,
            ["Snorunt"] = 2,
            ["Glalie"] = 2,
            ["Ninjask"] = 2,
            ["Gallade"] = 2,
            ["Pikachu"] = 2,
            ["Shiny Rattata"] = 2,
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
                addEvent(sendEff, 1000, cid, master, t-1) --alterado v1.9
            end
        end
        
        if #getCreatureSummons(getCreatureMaster(cid)) > 1 then
            return true
        end
        
        if getPlayerStorageValue(cid, 637500) >= 1 then
            return true
        end
        
        local master = getCreatureMaster(cid)
        local item = getPlayerSlotItem(master, 8)
        local life, maxLife = getCreatureHealth(cid), getCreatureMaxHealth(cid)
        local name = doCorrectString(getCreatureName(cid))
        local pos = getThingPosWithDebug(cid)
        local time = 21
        
        doItemSetAttribute(item.uid, "hp", (life/maxLife))
        
        local num = team[name]
        local pk = {}
        local function doCreatureAddHealthWithSecurity(cid, heal)
            if not isCreature(cid) then return true end
            doCreatureAddHealth(cid, heal)
        end
        local function setStorage(cid)
            if not isCreature(cid) then return true end
            setPlayerStorageValue(cid, 63012, 1)
            addEvent(setStorage, 1000, cid)
        end
        --doTeleportThing(cid, {x=4, y=3, z=10}, false) 
        
        if team[name] then
            pk[1] = cid
            for b = 2, num do
                local pokeSourceCode = doSummonMonster(master, name)--doCreateMonsterNick(master, name,retireShinyName(name), getThingPos(master), true)
                
                if pokeSourceCode == "Nao" then
                    doSendMsg(master, "Não há espaço para seu pokemon.")
                    return true 
                end  
                
                pk[b] = getCreatureSummons(master)[b]
                setPlayerStorageValue(pk[b], 510, name)
                setStorage(pk[b])
                adjustStatus(pk[b], getPlayerSlotItem(master, 8).uid, true, true, true, true)
                doCreatureAddHealthWithSecurity(pk[b], -(maxLife-life))
            end
            
            for a = 1, num do
                addEvent(doTeleportThing, math.random(0, 5), pk[a], getClosestFreeTile(pk[a], pos), false)
                --addEvent(doAdjustWithDelay, 5, master, pk[a], true, true, true)
                doSendMagicEffect(getThingPosWithDebug(pk[a]), 211)
                setPlayerStorageValue(pk[2], 637500, 1)
                doCreatureSetSkullType(pk[a], getCreatureSkullType(pk[1]))
                if a ~= 1 then
                    addEvent(RemoveTeam, time * 1000, pk[a])
                end
            end 
            sendEff(cid, master, time) --alterado v1.9
            setPlayerStorageValue(master, 637501, 1)
            addEvent(setPlayerStorageValue, time * 1000, master, 637501, -2)
            
        end
        
        
    elseif spell == "Team Slice" or spell == "Team Claw" then
        
        local master = getCreatureMaster(cid)
        if #getCreatureSummons(master) < 2 or not isCreature(target) then return true end
        
        local summons = getCreatureSummons(master)
        local posis = {[1] = pos1, [2] = pos2, [3] = pos3, [4] = pos4}
        
        if getSubName(cid, target) == "Scyther" then 
            eff = 163 -- 39
        elseif getSubName(cid, target) == "Shiny Scyther" then 
            eff = 164
        else
            eff = 42 
        end
        
        if #getCreatureSummons(master) >= 2 and isCreature(target) then
            if isCreature(cid) then
                addEvent(doDanoInTarget, 500, cid, target, BUGDAMAGE, -min, -max, 0) --alterado v1.7
                for i = 1, #summons do
                    posis[i] = getThingPosWithDebug(summons[i])
                    doDisapear(summons[i])
                    stopNow(summons[i], 670)
                    addEvent(doSendMagicEffect, 300, posis[i], 211)
                    addEvent(doSendDistanceShoot, 350, posis[i], getThingPosWithDebug(target), eff)
                    addEvent(doSendDistanceShoot, 450, getThingPosWithDebug(target), posis[i], eff)
                    addEvent(doSendDistanceShoot, 600, posis[i], getThingPosWithDebug(target), eff)
                    addEvent(doSendDistanceShoot, 650, getThingPosWithDebug(target), posis[i], eff)
                    addEvent(doAppear, 670, summons[i])
                end
            end
        end
        
    elseif spell == "Blizzard" then
        
        local master = isSummon(cid) and getCreatureMaster(cid) or cid
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 43
        ret.check = 0
        ret.first = true
        ret.cond = "Slow"
        
        local function doFall(cid)
            for rocks = 1, 42 do
                addEvent(fall, rocks*35, cid, master, ICEDAMAGE, 28, 52)
            end
        end
        
        if getCreatureName(cid) == "Castform" then
            addEvent(doTransformCastform, 1350, cid, "Ice")
            setPlayerStorageValue(getCreatureMaster(cid), 141410, 1)
            addEvent(setPlayerStorageValue, 2200, getCreatureMaster(cid), 141410, -1)   
        end         
        
        for up = 1, 10 do
            addEvent(upEffect, up*75, cid, 28)
        end --alterado v1.4
        
        addEvent(doFall, 450, cid)
        addEvent(doMoveInArea2, 1400, cid, 0, BigArea2, ICEDAMAGE, min, max, spell, ret)
        
        
    elseif spell == "Meteor Smash" then -- melhorar dps
        
        local pos = getThingPos(cid)
        pos.x = pos.x + 1
        pos.y = pos.y + 1
        
        doSendMagicEffect(posT, 848)
        
        doDanoInTargetWithDelay(cid, target, STEELDAMAGE, min, max, 0) 
        addEvent(doDanoWithProtect, 60, cid, STEELDAMAGE, getThingPosWithDebug(target), Smash1, -min, -max, 849) -- meteorMash1
        addEvent(doDanoWithProtect, 100, cid, STEELDAMAGE, getThingPosWithDebug(target), Smash2, -min, -max, 849) -- meteorMash2
        addEvent(doDanoWithProtect, 200, cid, STEELDAMAGE, getThingPosWithDebug(target), Smash3, -min, -max, 849) 
        addEvent(doDanoWithProtect, 265, cid, STEELDAMAGE, getThingPosWithDebug(target), Smash4, -min, -max, 849) 
        
        
    elseif spell == "Great Love" then
        
        local master = getCreatureMaster(cid) or 0
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 147
        ret.check = 0
        ret.spell = spell
        ret.cond = "Stun"
        
        for rocks = 1, 62 do
            addEvent(fall, rocks*35, cid, master, NORMALDAMAGE, -1, 147)
        end
        addEvent(doSendMagicEffect, 150, posC1, 633)
        addEvent(doMoveInArea2, 500, cid, 0, BigArea2, NORMALDAMAGE, min, max, spell, ret) 
        
    elseif spell == "Fire Punch" then 
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        doSendMagicEffect(posT1, 624) -- 112
        addEvent(doDanoInTargetWithDelay, 30, cid, target, FIREDAMAGE, min, max, 35) --alterado v1.7
        
    elseif spell == "Guillotine" then -- editar/refazer effect, usar pinsir skill outfit pra pegar animação dos chifres dele 
        
        if getSubName(cid, target) == "Pinsir" then
            doSetCreatureOutfit(cid, {lookType = 2175}, 400)
        elseif getSubName(cid, target) == "Shiny Pinsir" then
            doSetCreatureOutfit(cid, {lookType = 2173}, 200)
        end
        addEvent(doDanoWithProtect, 100, cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 146)
        
    elseif spell == "Hyper Beam" then --alterado v1.7 \/
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {149, {x=p.x+1, y=p.y-1, z=p.z}},
            [1] = {150, {x=p.x+6, y=p.y+1, z=p.z}}, 
            [2] = {149, {x=p.x+1, y=p.y+6, z=p.z}},
            [3] = {150, {x=p.x-1, y=p.y+1, z=p.z}}, 
        }
        
        doSendMagicEffect(posC, 628)
        addEvent(doSendMagicEffect, 700, posC, 627)
        addEvent(doMoveInArea2, 420, cid, 0, triplo6, NORMALDAMAGE, min, max, spell)
        addEvent(doSendMagicEffect, 420, t[a][2], t[a][1])
        
    elseif spell == "Flash Cannon" then 
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {354, {x=p.x+1, y=p.y-1, z=p.z}},
            [1] = {353, {x=p.x+6, y=p.y+1, z=p.z}}, 
            [2] = {354, {x=p.x+1, y=p.y+6, z=p.z}},
            [3] = {353, {x=p.x-1, y=p.y+1, z=p.z}}, 
        }
        
        doMoveInArea2(cid, 0, triplo6, STEELDAMAGE, min, max, spell)
        doSendMagicEffect(t[a][2], t[a][1])
        
        
    elseif isInArray({"Dragon Mist", "Mega Wing", "Mach Punch", "Nuzzle", "Shadow Sneak", "Shadow Mist", "Flash Kick", "Fenix Dash"}, spell) then 
        
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
        
        
    elseif spell == "Signal Beam" then --alterado v1.7 \/
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {455, {x=p.x+1, y=p.y-1, z=p.z}},
            [1] = {456, {x=p.x+5, y=p.y+1, z=p.z}}, 
            [2] = {457, {x=p.x+1, y=p.y+5, z=p.z}},
            [3] = {458, {x=p.x-1, y=p.y+1, z=p.z}}, 
        }
        
        doMoveInArea2(cid, 0, triplo6, BUGDAMAGE, min, max, spell)
        doSendMagicEffect(t[a][2], t[a][1])
        
    elseif spell == "Thrash" then
        
        --cid, effDist, effDano, areaEff, areaDano, element, min, max
        doMoveInAreaMulti(cid, 157, 111, bullet, bulletDano, NORMALDAMAGE, min, max) -- 10, 111 08
        
    elseif spell == "Splash" or spell == "Shadow Counter" or tonumber(spell) == 7 then
        
        if spell == "Shadow Counter" then 
                doAreaCombatHealth(cid, WATERDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 111)
        end
        
        doAreaCombatHealth(cid, WATERDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 255)
        doSendMagicEffect(getThingPosWithDebug(cid), 53)    
        
    elseif spell == "Dragon Breath" then 
        
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {605, {x=p.x, y=p.y-1, z=p.z}},
            [1] = {606, {x=p.x+5, y=p.y, z=p.z}}, --alterado v1.8
            [2] = {608, {x=p.x, y=p.y+5, z=p.z}},
            [3] = {607, {x=p.x-1, y=p.y, z=p.z}},
        }
        local area = reto4
        doMoveInArea2(cid, 0, area, DRAGONDAMAGE, min, max, spell)
        doSendMagicEffect(t[a][2], t[a][1])
        
        
        
        --[[ -- dragon breathe com efeito do flamethrower(verde)
        local flamepos = getThingPosWithDebug(cid)
        local effect = 255
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        if a == 0 then
            flamepos.x = flamepos.x+1
            flamepos.y = flamepos.y-1
            effect = 523
        elseif a == 1 then
            flamepos.x = flamepos.x+3
            flamepos.y = flamepos.y+1
            effect = 526
        elseif a == 2 then
            flamepos.x = flamepos.x+1
            flamepos.y = flamepos.y+3
            effect = 524
        elseif a == 3 then
            flamepos.x = flamepos.x-1
            flamepos.y = flamepos.y+1
            effect = 525
        end
        
        doMoveInArea2(cid, 0, flamek, DRAGONDAMAGE, min, max, spell) -- 143
        doSendMagicEffect(flamepos, effect)
        
        --]]
        
        
    elseif spell == "Muddy Water" then 
        
        if isInArray({"Quagsire", "Swampert", "Whiscash"}, getSubName(cid, target)) then
            
            local eff = {55, 502}
            for rocks = 1, 32 do
                addEvent(fall, rocks*22, cid, master, GROUNDDAMAGE, -1, eff[math.random(1, 2)])
            end
            doMoveInArea2(cid, 0, doSurf1, GROUNDDAMAGE, 0, 0, spell) -- eff[math.random(1, 2)]
            addEvent(doDanoWithProtect, math.random(100, 400), cid, GROUNDDAMAGE, posC, doSurf2, -min, -max, 0)
            
        else
            
            local ret = {} 
            ret.id = 0
            ret.cd = 6
            ret.eff = 733
            ret.check = 0
            ret.spell = spell
            ret.cond = "Miss"
            
            doMoveInArea2(cid, 844, muddy, GROUNDDAMAGE, min, max, spell, ret) -- colocar transparência (116), fazer um parecido marrom
        end 
        
    elseif spell == "Venom Motion" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 770
        ret.check = 0
        ret.spell = spell
        ret.cond = "Miss"
        
        doMoveInArea2(cid, 784, muddy, POISONDAMAGE, 0, 0, spell, ret)
        doMoveInArea2(cid, 770, muddy, POISONDAMAGE, min, max, spell, ret)
        doSendMagicEffect(getThingPosWithDebug(pid), 854)
        
    elseif spell == "Thunder Fang" then
        
        doSendMagicEffect(getThingPosWithDebug(target), 146)
        doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, 48) --alterado v1.7
        addEvent(doSendMagicEffect, 100, PosTarget1, 410)   
        
    elseif isInArray({"Cannon Ball", "Mega Steel Wing", "Rapid Spin"}, spell) then
            
        cannonBalls2 = {
            ["Skarmory"] = {eup=595, edown=593, eright=592, eleft=594, efdmg1=253, efdmg2=254, efdmg3=251, efdmg4=252, damage=STEELDAMAGE},
            ["Forretress"] = {eup=846, edown=846, eright=846, eleft=846, efdmg1=3, efdmg2=3, efdmg3=3, efdmg4=3, damage=NORMALDAMAGE},
        }
        
        cannonBalls = {
            ["Skarmory"] = {eup=595, edown=593, eright=592, eleft=594, efdmg1=253, efdmg2=254, efdmg3=251, efdmg4=252, damage=STEELDAMAGE},
            ["Shiny Skarmory"] = {eup=595, edown=593, eright=592, eleft=594, efdmg1=253, efdmg2=254, efdmg3=251, efdmg4=252, damage=STEELDAMAGE},
            ["Metal Skarmory"] = {eup=595, edown=593, eright=592, eleft=594, efdmg1=253, efdmg2=254, efdmg3=251, efdmg4=252, damage=STEELDAMAGE},
            ["Miltank"] = {eup=597, edown=598, eright=599, eleft=600, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=GROUNDDAMAGE},
            ["Milch Miltank"] = {eup=597, edown=598, eright=599, eleft=600, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=GROUNDDAMAGE},
            ["Shiny Miltank"] = {eup=597, edown=598, eright=599, eleft=600, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=GROUNDDAMAGE},
            ["Donphan"] = {eup=601, edown=603, eright=602, eleft=596, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=GROUNDDAMAGE},
            ["Roll Donphan"] = {eup=601, edown=603, eright=602, eleft=596, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=GROUNDDAMAGE},
            ["Forretress"] = {eup=826, edown=826, eright=826, eleft=826, efdmg1=3, efdmg2=3, efdmg3=3, efdmg4=3, damage=NORMALDAMAGE},
            ["Blastoise"] = {eup=736, edown=736, eright=736, eleft=736, efdmg1=3, efdmg2=3, efdmg3=3, efdmg4=3, damage=NORMALDAMAGE},
            ["Shiny Blastoise"] = {eup=736, edown=736, eright=736, eleft=736, efdmg1=3, efdmg2=3, efdmg3=3, efdmg4=3, damage=NORMALDAMAGE},
            ["Starmie"] = {eup=850, edown=850, eright=850, eleft=850, efdmg1=154, efdmg2=154, efdmg3=154, efdmg4=154, damage=WATERDAMAGE},
        }   
        
        local dmg = cannonBalls[getCreatureName(cid)].damage
        local function doBack(cid)
            if not isCreature(cid) then return true end
            setPlayerStorageValue(cid,9658783,-1)
            doAppear(cid)
        end
        
        local function doStartHit(cid, n, dir, pos,rote)
            if not isCreature(cid) then return true end
            if n==9 then return true end
            -------------------------------
            if dir == 0 then
                if n>=5 then
                    pos.y = pos.y + 1
                    -- if getSubName(cid, target) == "Forretress" and getPlayerStorageValue(cid, 925177) >= 1 then
                    --eff = cannonBalls2[getCreatureName(cid)].edown
                    -- else
                    eff = cannonBalls[getCreatureName(cid)].edown
                    -- end
                else
                    pos.y = pos.y - 1
                    -- if getSubName(cid, target) == "Forretress" and getPlayerStorageValue(cid, 925177) >= 1 then
                    --eff = cannonBalls2[getCreatureName(cid)].eup
                    -- else
                    eff = cannonBalls[getCreatureName(cid)].eup
                    -- end
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x+1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x-1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)
                if rote==1 then
                    rote=0
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg1
                else
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg2
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x+1,y=pos.y,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x-1,y=pos.y,z=pos.z}, eff2)
                
            elseif dir == 1 then
                if n>=5 then
                    pos.x = pos.x - 1
                    -- if getSubName(cid, target) == "Forretress" and getPlayerStorageValue(cid, 925177) >= 1 then
                    --eff = cannonBalls2[getCreatureName(cid)].eleft
                    -- else
                    eff = cannonBalls[getCreatureName(cid)].eleft
                    -- end
                else
                    pos.x = pos.x + 1
                    -- if getSubName(cid, target) == "Forretress" and getPlayerStorageValue(cid, 925177) >= 1 then
                    --eff = cannonBalls2[getCreatureName(cid)].eright
                    -- else
                    eff = cannonBalls[getCreatureName(cid)].eright
                    -- end
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y+1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y-1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)
                if rote==1 then
                    rote=0
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg3
                else
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg4
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y-1,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y+1,z=pos.z}, eff2)
                
            elseif dir == 2 then
                if n>=5 then
                    pos.y = pos.y - 1
                    eff = cannonBalls[getCreatureName(cid)].eup
                else
                    pos.y = pos.y + 1
                    eff = cannonBalls[getCreatureName(cid)].edown
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x+1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x-1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)
                if rote==1 then
                    rote=0
                    eff2=cannonBalls[getCreatureName(cid)].efdmg1
                else
                    eff2=cannonBalls[getCreatureName(cid)].efdmg2
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x+1,y=pos.y,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x-1,y=pos.y,z=pos.z}, eff2)
                
            elseif dir == 3 then
                if n>=5 then
                    pos.x = pos.x + 1
                    eff = cannonBalls[getCreatureName(cid)].eright
                else
                    pos.x = pos.x - 1
                    eff = cannonBalls[getCreatureName(cid)].eleft
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y+1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y-1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)
                if rote==1 then
                    rote=0
                    eff2=cannonBalls[getCreatureName(cid)].efdmg3
                else
                    eff2=cannonBalls[getCreatureName(cid)].efdmg4
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y-1,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y+1,z=pos.z}, eff2)
                
            end
            -------------------------------
            addEvent(doStartHit,150,cid,n+1, dir, pos,rote)
        end
        
        doCreatureSetHideHealth(cid, true)
        doSetCreatureOutfit(cid, {lookType = 2}, -1)
        setPlayerStorageValue(cid,9658783,1)
        doStartHit(cid, 0, getCreatureLookDir(cid), getThingPos(cid), 1)
        addEvent(doBack,1400,cid)
                
    elseif spell == "Zap Cannon" then
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        
    if isInArray({"Shiny Magneton"}, getSubName(cid, target)) then  
        
        local t = {
            [0] = {981, {x=p.x, y=p.y-1, z=p.z}},
            [1] = {982, {x=p.x+6, y=p.y, z=p.z}}, --alterado v1.8
            [2] = {983, {x=p.x, y=p.y+6, z=p.z}},
            [3] = {984, {x=p.x-1, y=p.y, z=p.z}},
        }
        
        doMoveInArea2(cid, 0, triplo6, ELECTRICDAMAGE, min, max, spell)
        doMoveInArea2(cid, 208, reto6, ELECTRICDAMAGE, 0, 0, "Zap Cannon Eff")
        doSendMagicEffect(t[a][2], t[a][1])
        
    else
        
        local t = {
            [0] = {73, {x=p.x, y=p.y-1, z=p.z}},
            [1] = {74, {x=p.x+6, y=p.y, z=p.z}}, --alterado v1.8
            [2] = {75, {x=p.x, y=p.y+6, z=p.z}},
            [3] = {76, {x=p.x-1, y=p.y, z=p.z}},
        }
        
        doMoveInArea2(cid, 0, triplo6, ELECTRICDAMAGE, min, max, spell)
        doMoveInArea2(cid, 177, reto6, ELECTRICDAMAGE, 0, 0, "Zap Cannon Eff")
        doSendMagicEffect(t[a][2], t[a][1]) 
    end
        
    elseif spell == "Charge Beam" then
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {73, {x=p.x, y=p.y-1, z=p.z}},
            [1] = {74, {x=p.x+6, y=p.y, z=p.z}}, --alterado v1.8
            [2] = {75, {x=p.x, y=p.y+6, z=p.z}},
            [3] = {76, {x=p.x-1, y=p.y, z=p.z}},
        }
        
        doMoveInArea2(cid, 0, triplo6, ELECTRICDAMAGE, min, max, spell)
        doSendMagicEffect(t[a][2], t[a][1])
        
    elseif spell == "Sacred Fire" then
        
        local pos = getThingPosWithDebug(cid)
        local areas = {rock1, rock2, rock3, rock1, rock2, rock3}
        local effarea = {514,515,513,514,515,513} -- 5 e 491
        
        for i = 0, 5 do
            addEvent(doMoveInArea2, i*320, cid, effarea[i+1], areas[i+1], FIREDAMAGE, min, max, spell, ret)
        end
                
    elseif spell == "Blaze Kick" then
        
        local eff = 113
        
        if getSubName(cid, target) == "Shiny Hitmonlee" then
        eff = 651
        elseif getSubName(cid, target) == "Hitmonlee" then
        eff = 652
        end
        
        doMoveInArea2(cid, 6, blaze, FIREDAMAGE, min, max, spell)
        doMoveInArea2(cid, eff, blaze, FIREDAMAGE, 0, 0, spell)
        addEvent(doMoveInArea2, 36, cid, 6, blaze, FIGHTINGDAMAGE, 0, 0, spell) 
        addEvent(doMoveInArea2, 36, cid, eff, blaze, FIGHTINGDAMAGE, 0, 0, spell) 
        doSendMagicEffect(posT, eff) 
        addEvent(doMoveInArea2, 200, cid, 6, kick, FIREDAMAGE, min, max, spell) 
        addEvent(doMoveInArea2, 200, cid, eff, kick, FIREDAMAGE, 0, 0, spell) 
            
    elseif spell == "Cross Shop" then
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        if a == 0 then
            area = crossChopEfeito
        elseif a == 1 then
            area = crossChopEfeito2
        elseif a == 2 then
            area = crossChopEfeito2
        elseif a == 3 then
            area = crossChopEfeito
        end
        
        doMoveInArea2(cid, 0, crossChop, FIGHTINGDAMAGE, min, max, spell) -- dano
        doMoveInArea2(cid, 665, area, FIGHTINGDAMAGE, 0, 0, spell) -- efeito
        if a == 0 or a == 3 then
            doSendMagicEffect(posC, 665)
            --addEvent(doSendMagicEffect, 125, posC, 237)
        end
        addEvent(doMoveInArea2, 110, cid, 237, crossChop, FIGHTINGDAMAGE, 0, 0, spell) -- efeito
        addEvent(doMoveInArea2, 180, cid, 237, crossChop, FIGHTINGDAMAGE, 0, 0, spell) -- efeito    
        
    elseif spell == "Overheat" then -- refazer, usar effect q vai ser o Dragon Breath
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {509, {x=p.x, y=p.y-1, z=p.z}},
            [1] = {510, {x=p.x+5, y=p.y, z=p.z}}, --alterado v1.8
            [2] = {512, {x=p.x, y=p.y+5, z=p.z}},
            [3] = {511, {x=p.x-1, y=p.y, z=p.z}},
        }
        
        local area = reto4
        doMoveInArea2(cid, 0, area, FIREDAMAGE, min, max, spell)
        doSendMagicEffect(t[a][2], t[a][1])
        
    elseif spell == "Ancient Power" then
        
        local p = getThingPosWithDebug(cid)
        
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area, eff)
            if isCreature(cid) then
                --if not isSightClear(p, area, false) then return true end
                doAreaCombatHealth(cid, ROCKDAMAGE, area, 0, 0, 0, eff)
                doAreaCombatHealth(cid, ROCKDAMAGE, area, whirl3, -min, -max, 18) -- 137
            end
        end
        
        for a = 0, 4 do
            
            local t = {
                [0] = {730, {x=p.x, y=p.y-(a+1), z=p.z}}, -- 18
                [1] = {730, {x=p.x+(a+1), y=p.y, z=p.z}},
                [2] = {730, {x=p.x, y=p.y+(a+1), z=p.z}},
                [3] = {730, {x=p.x-(a+1), y=p.y, z=p.z}}
            } 
            addEvent(sendAtk, 300*a, cid, t[d][2], 255)
            addEvent(doSendMagicEffect, 328*a, t[d][2], t[d][1])
        end
        
    elseif spell == "Twister" then
                        -- 166, eff,  bulletTwister
        doMoveInAreaMulti(cid, 166, 490, bulletTwister, bulletDano, DRAGONDAMAGE, min, max)
        
    elseif spell == "Multi-Kick" then
        
        if isInArray({"Elite Hitmonlee", "Shiny Hitmonlee"}, getSubName(cid, target)) then  
            doMoveInAreaMulti(cid, 27, 651, multi, multiDano, FIGHTINGDAMAGE, min, max) -- 39, 133
        elseif isInArray({"Hitmonlee"}, getSubName(cid, target)) then   
            doMoveInAreaMulti(cid, 27, 652, multi, multiDano, FIGHTINGDAMAGE, min, max) 
        else
            doMoveInAreaMulti(cid, 39, 113, multi, multiDano, FIGHTINGDAMAGE, min, max) -- 133
        end
        
        
    elseif spell == "Sky Uppercut" then
        doCreatureSay(cid, "Up", 20) 
        local function sendEffect(cid)
            if not isCreature(cid) or not isCreature(target) then return true end
            local pos = getThingPos(target)
            local lado = getCreatureLookDir(cid)
            local effes = {
                [0] = {effe1 = 261, effe2 = 265},
                [1] = {effe1 = 263, effe2 = 266},
                [2] = {effe1 = 262, effe2 = 264},
                [3] = {effe1 = 260, effe2 = 267}
            }
            if lado == 0 then
                local pos2 = pos
                pos2.y = pos2.y +1
                doSendMagicEffect(pos2, effes[lado].effe1)
                pos.y = pos.y -2
                pos.x = pos.x +1
            elseif lado == 1 then
                doSendMagicEffect(pos, effes[lado].effe1)
                pos.y = pos.y +2
                pos.x = pos.x +2
            elseif lado == 2 then
                local pos2 = pos
                pos2.x = pos2.x +1
                doSendMagicEffect(pos2, effes[lado].effe1)
                pos.y = pos.y +2
                pos.x = pos.x +1
            elseif lado == 3 then
                local pos2 = pos
                pos2.x = pos2.x +1
                doSendMagicEffect(pos2, effes[lado].effe1)
                pos.y = pos.y +2
                pos.x = pos.x -2
            end 
            addEvent(doSendMagicEffect, 100, pos, effes[lado].effe2)
            addEvent(doDanoWithProtectWithDelay, 50, cid, target, SACREDDAMAGE, min, max, 255, sacred) --alterado v1.6
        end
        sendEffect(cid)
    elseif spell == "Hi Jump Kick" then -- olhar essa function
        
        doMoveInAreaMulti(cid, 39, 113, multi, multiDano, FIGHTINGDAMAGE, min, max)
        
    elseif spell == "Multi-Punch" then      
    
    local hands = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "hands")
    if hands then
    local eff = 112
        if hands == 0 then
        eff = 112
        elseif hands == 1 then
        eff =356
        elseif hands == 2 then
        eff = 48
        elseif hands == 3 then
        eff = 43
        elseif hands == 4 then
        eff = 136
        end
    doMoveInAreaMulti(cid, 98, eff, multi, multiDano, FIGHTINGDAMAGE, 0, 0) 
    end
        
        addEvent(doMoveInAreaMulti, 100, cid, 39, 112, multi, multiDano, FIGHTINGDAMAGE, min, max) -- estudar essa function e lembrar de usa-la
        
    elseif spell == "Squisky Licking" then 
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 0
        ret.spell = spell
        ret.cond = "Stun"
        
        local areas = {SL1, SL2, SL3, SL4}
        
        for i = 0, 3 do
            addEvent(doMoveInArea2, i*200, cid, 145, areas[i+1], NORMALDAMAGE, min, max, spell, ret)
        end
        
    elseif spell == "Lick" then
        
        local ret = {}
        ret.id = target
        ret.cd = 9
        ret.check = getPlayerStorageValue(target, conds["Stun"])
        ret.eff = 0
        ret.spell = spell
        ret.cond = "Stun"
        
        doSendMagicEffect(getThingPosWithDebug(target), 145) --alterado v1.4!
        addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)
        
    elseif spell == "Bonemerang" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 7)
        doDanoInTargetWithDelay(cid, target, GROUNDDAMAGE, min, max, 227) --alterado v1.7
        addEvent(doSendDistanceShoot, 250, getThingPosWithDebug(target), getThingPosWithDebug(cid), 7)
        
    elseif spell == "Bone Club" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 7)
        doDanoInTargetWithDelay(cid, target, GROUNDDAMAGE, min, max, 118) --alterado v1.7
        
    elseif spell == "Bone Slash" then
        
        local function sendStickEff(cid, dir)
            if not isCreature(cid) then return true end
            doAreaCombatHealth(cid, GROUNDDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 227)
        end
        
        local function doStick(cid)
            if not isCreature(cid) then return true end
            local t = {
                [1] = SOUTHWEST,
                [2] = SOUTH,
                [3] = SOUTHEAST,
                [4] = EAST,
                [5] = NORTHEAST,
                [6] = NORTH,
                [7] = NORTHWEST,
                [8] = WEST,
                [9] = SOUTHWEST,
            }
            for a = 1, 9 do
                addEvent(sendStickEff, a * 140, cid, t[a])
            end
        end
        
        doStick(cid, false, cid)
        --alterado v1.4
    elseif spell == "Furious Legs" or spell == "Ultimate Champion" or spell == "Fighter Spirit" then
        
        local ret = {}
        ret.id = cid
        ret.cd = 15
        ret.eff = 13
        ret.check = 0
        ret.buff = spell
        ret.first = true
        
        doCondition2(ret) 
        
    elseif spell == "Sludge Wave" then 
        
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        local master = isSummon(cid) and getCreatureMaster(cid) or cid
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 731 -- 34
        ret.check = 0
        ret.spell = spell
        ret.cond = "Miss" 
        
        function sendAtk(cid, area, eff)
            if isCreature(cid) then
                --if not isSightClear(p, area, false) then return true end 
                doAreaCombatHealth(cid, POISONDAMAGE, area, 0, 0, 0, eff) -- SLUDGEDAMAGE
                doAreaCombatHealth(cid, POISONDAMAGE, area, whirl3, -min, -max, 845) -- 114 -- SLUDGEDAMAGE
                -- addEvent(doAreaCombatHealth, 60, cid, POISONDAMAGE, area, whirl3, 0, 0, 845) -- SLUDGEDAMAGE
            end
        end
        
        for a = 0, 4 do
            
            local t = {
                [0] = {114, {x=p.x, y=p.y-(a+1), z=p.z}}, --alterado v1.4
                [1] = {114, {x=p.x+(a+1), y=p.y, z=p.z}},
                [2] = {114, {x=p.x, y=p.y+(a+1), z=p.z}},
                [3] = {114, {x=p.x-(a+1), y=p.y, z=p.z}}
            } 
            addEvent(sendAtk, 300*a, cid, t[d][2], t[d][1])
        end
        
    elseif spell == "Sludge Rain" or spell == "Venoshock" then
        
        local master = isSummon(cid) and getCreatureMaster(cid) or cid
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 731 -- 34
        ret.check = 0
        ret.spell = spell
        ret.cond = "Miss"
        
        local function doFall(cid)
            for rocks = 1, 42 do
                if spell == "Venoshock" then
                    addEvent(fall, rocks*35, cid, master, POISONDAMAGE, 6, 994) -- 116 -- SLUDGEDAMAGE
                else
                    addEvent(fall, rocks*35, cid, master, POISONDAMAGE, 6, 845) -- 116 -- SLUDGEDAMAGE
                end 
            end
        end
        
        for up = 1, 10 do
            addEvent(upEffect, up*75, cid, 6)
        end 
        
        addEvent(doFall, 450, cid)
        addEvent(doMoveInArea2, 1400, cid, 0, BigArea2, POISONDAMAGE, min, max, spell, ret)  -- SLUDGEDAMAGE
        
    elseif spell == "Shadow Ball" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 18)
        
        local function doDamageWithDelay(cid, target)
            if not isCreature(cid) or not isCreature(target) then return true end
            if isSleeping(cid) then return false end
            if getPlayerStorageValue(cid, conds["Fear"]) >= 1 then return true end
            doAreaCombatHealth(cid, ghostDmg, getThingPosWithDebug(target), 0, -min, -max, 255)
            local pos = getThingPosWithDebug(target)
            pos.x = pos.x + 1
            addEvent(doSendMagicEffect, 50, pos, 140)
        end
        
        addEvent(doDamageWithDelay, 100, cid, target)
        
    elseif spell == "Shadow Punch" then
        
        doSendMagicEffect(posT1, 534) 
        local function doPunch(cid, target)
            if not isCreature(cid) or not isCreature(target) then return true end
            doAreaCombatHealth(cid, ghostDmg, getThingPosWithDebug(target), 0, -min, -max, 255)
            -- addEvent(doSendMagicEffect, 120, posT, 140)
        end
        addEvent(doPunch, 200, cid, target)
        
        
    elseif spell == "Brick Break" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 2 
        ret.eff = 88
        ret.check = 0
        ret.first = true
        ret.cond = "Paralyze"
        
        local ret2 = {}
        ret2.id = 0
        ret2.cd = 4 
        ret2.eff = 88
        ret2.check = 0
        ret2.first = true
        ret2.cond = "Silence"
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {732, {x=p.x+1, y=p.y-1, z=p.z}},
            [1] = {732, {x=p.x+2, y=p.y+1, z=p.z}}, 
            [2] = {732, {x=p.x+1, y=p.y+2, z=p.z}},
            [3] = {732, {x=p.x-1, y=p.y+1, z=p.z}}, 
        }
        
        doMoveInArea2(cid, 0, BrickBeak, FIGHTINGDAMAGE, min, max, spell, ret)
        doMoveInArea2(cid, 0, BrickBeak, FIGHTINGDAMAGE, 0, 0, spell, ret2)
        doSendMagicEffect(t[a][2], t[a][1])
        
        
    elseif spell == "Shadow Storm" then 
        
        local master = isSummon(cid) and getCreatureMaster(cid) or cid
        
        local function doFall(cid)
            for rocks = 1, 42 do --62 -- 140
                addEvent(fall, rocks*35, cid, master, ghostDmg, 18, 411)
                -- addEvent(fall, rocks*35, cid, master, 0, 98, 140)
            end -- 98 é missile nulo /\
        end
        
        for up = 1, 10 do
            addEvent(upEffect, up*75, cid, 18)
        end
        addEvent(doFall, 450, cid)
        addEvent(doMoveInArea2, 1400, cid, 2, BigArea2, ghostDmg, min, max, spell)
        
    elseif spell == "Invisible" or spell == "Instant Teleportation" then
        
        doDisapear(cid)
        addEvent(doAppear, 4000, cid)
        
        setPlayerStorageValue(cid, 9658783, 1) -- não levar dano

        if spell == "Instant Teleportation" then
            doSendMagicEffect(getThingPosWithDebug(cid), 134)       
        else    
            doSendMagicEffect(getThingPosWithDebug(cid), 134) -- 386 no spr do dxp esp (conferir qual eff é)
        end
            
        addEvent(function()
            if isCreature(cid) then
                setPlayerStorageValue(cid, 9658783, -1)
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
        
    elseif spell == "Nightmare" then
        
        if not isSleeping(target) then
            doSendMagicEffect(getThingPosWithDebug(target), 3)
            doSendAnimatedText(getThingPosWithDebug(target), "FAIL", 155)
            return true
        end
        
        doDanoWithProtectWithDelay(cid, target, ghostDmg, -min, -max, 138) 
        
    elseif spell == "Dream Eater" then
        
        if not isSleeping(target) then
            doSendMagicEffect(getThingPosWithDebug(target), 3)
            doSendAnimatedText(getThingPosWithDebug(target), "FAIL", 155)
            return true
        end
        --alterado v1.6
        setPlayerStorageValue(cid, 95487, 1)
        doSendMagicEffect(getThingPosWithDebug(cid), 132)
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        doDanoWithProtectWithDelay(cid, target, psyDmg, -min, -max, 138)
        
elseif spell == "Dark Eye" or spell == "Miracle Eye" or spell == "Dark Accurate" then -- fazer/editar dark accurate eff 725

        if spell == "Dark Eye" or spell == "Dark Accurate" then
        doSendMagicEffect(getThingPosWithDebug(cid), 725)
        else
        doSendMagicEffect(getThingPosWithDebug(cid), 47)
        end
        setPlayerStorageValue(cid, 999457, 1) 
        
    elseif spell == "Elemental Hands" then
        
        if getCreatureOutfit(cid).lookType == 1301 then
            print("Error occurred with move 'Elemental Hands', outfit of hitmonchan is wrong")
            doPlayerSendTextMessage(getCreatureMaster(cid), MESSAGE_STATUS_CONSOLE_BLUE, "A error are ocurred... A msg is sent to gamemasters!") 
            return true
        end --proteçao pra n usar o move com o shiny hitmonchan com outfit diferente da do elite monchan do PO...
        
        local e = getCreatureMaster(cid)
        local name = getItemAttribute(getPlayerSlotItem(e, 8).uid, "poke")
        local hands = getItemAttribute(getPlayerSlotItem(e, 8).uid, "hands")
        
        local posGhost = getThingPosWithDebug(cid) posGhost.x = posGhost.x+1
        
        if hands == 4 then
            doItemSetAttribute(getPlayerSlotItem(e, 8).uid, "hands", 0)
            doSendMagicEffect(getThingPosWithDebug(cid), hitmonchans[name][0].eff)
            doSetCreatureOutfit(cid, {lookType = hitmonchans[name][0].out}, -1)
        else
            doItemSetAttribute(getPlayerSlotItem(e, 8).uid, "hands", hands+1)       
            if hitmonchans[name][hands+1].eff == 140 then
            doSendMagicEffect(posGhost, hitmonchans[name][hands+1].eff)
            else
            doSendMagicEffect(getThingPosWithDebug(cid), hitmonchans[name][hands+1].eff)
            end
            doSetCreatureOutfit(cid, {lookType = hitmonchans[name][hands+1].out}, -1)
        end
        
    elseif spell == "Crabhammer" then
        
        if getSubName(cid, target) == "Shiny Kingler" then
            doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 432)
        else
            doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 225)
        end
    elseif spell == "Ancient Fury" then
        
        local ret = {}
        ret.id = cid
        ret.cd = 15
        ret.eff = 0
        ret.check = 0
        ret.buff = spell
        ret.first = true
        
        doCondition2(ret)
        
    elseif spell == "Divine Punishment" then
        
        local roardirections = { 
            [NORTH] = {SOUTH},
            [SOUTH] = {NORTH},
            [WEST] = {EAST},
        [EAST] = {WEST}}
        
        local function divineBack(cid)
            if not isCreature(cid) then return true end
            local uid = checkAreaUid(getCreaturePosition(cid), check, 1, 1)
            for _,pid in pairs(uid) do
                dirrr = getCreatureDirectionToTarget(pid, cid)
                -- delay = getNextStepDelay(pid, 0)
                if isSummon(cid) and (isMonster(pid) or (isSummon(pid) and canAttackOther(cid, pid) == "Can") or (isPlayer(pid) and canAttackOther(cid, pid) == "Can")) and pid ~= cid then
                    setPlayerStorageValue(pid, 654878, 1)
                    doChangeSpeed(pid, -getCreatureSpeed(pid))
                    doChangeSpeed(pid, 100)
                    doPushCreature(pid, roardirections[dirrr][1], 1, 0)
                    doChangeSpeed(pid, -getCreatureSpeed(pid))
                    addEvent(setPlayerStorageValue, 6450, pid, 654878, -1)
                    addEvent(doRegainSpeed, 6450, pid)
                elseif isMonster(cid) and (isSummon(pid) or (isPlayer(pid) and #getCreatureSummons(pid) <= 0)) and pid ~= cid then
                    setPlayerStorageValue(pid, 654878, 1)
                    doChangeSpeed(pid, -getCreatureSpeed(pid))
                    doChangeSpeed(pid, 100)
                    doPushCreature(pid, roardirections[dirrr][1], 1, 0)
                    doChangeSpeed(pid, -getCreatureSpeed(pid))
                    addEvent(doRegainSpeed, 6450, pid)
                    addEvent(setPlayerStorageValue, 6450, pid, 654878, -1)
                end
            end 
        end
        
        local function doDivine(cid, min, max, spell, rounds, area)
            if not isCreature(cid) then return true end
            local ret = {}
            ret.id = 0
            ret.check = 0
            ret.cd = rounds
            ret.cond = "Confusion"
            
            for i = 1, 9 do
                addEvent(doMoveInArea2, i*500, cid, 137, area[i], psyDmg, min, max, spell, ret)
            end
        end
        
        local rounds = math.random(9, 12)
        local area = {punish1, punish2, punish3, punish1, punish2, punish3, punish1, punish2, punish3}
        
        local posi = getThingPosWithDebug(cid) 
        posi.x = posi.x+1
        posi.y = posi.y+1
        
        setPlayerStorageValue(cid, 2365487, 1)
        addEvent(setPlayerStorageValue, 6450, cid, 2365487, -1) --alterado v1.4
        doDisapear(cid)
        doChangeSpeed(cid, -getCreatureSpeed(cid))
        doSendMagicEffect(posi, 247) 
        addEvent(doAppear, 4450, cid)
        addEvent(doRegainSpeed, 6450, cid)
        
        local uid = checkAreaUid(getCreaturePosition(cid), check, 1, 1)
        for _,pid in pairs(uid) do
            if isSummon(cid) and (isMonster(pid) or (isSummon(pid) and canAttackOther(cid, pid) == "Can" ) or (isPlayer(pid) and canAttackOther(cid, pid) == "Can")) and pid ~= cid then
                doChangeSpeed(pid, -getCreatureSpeed(pid))
            elseif isMonster(cid) and (isSummon(pid) or (isPlayer(pid) and #getCreatureSummons(pid) <= 0)) and pid ~= cid then
                doChangeSpeed(pid, -getCreatureSpeed(pid)) 
            end
        end
        
        addEvent(divineBack, 2100, cid)
        addEvent(doDivine, 2200, cid, min, max, spell, rounds, area)
        
    elseif isInArray({"Magnetic Flux", "Psychic Sight", "Future Sight", "Predict", "Camouflage", "Acid Armor", "Iron Defense", "Steel Defense", "Minimize", "Protect", "Light Screen"}, spell) then
        
        --[[
        if spell == "Minimize" and getSubName(cid, target) == "Forretress" then
            if getPlayerStorageValue(cid, 9129312) >= 1 then
                setPlayerStorageValue(cid, 9129312, -1)
            end
            doCreatureSay(cid, "Minimize", 20)
            setPlayerStorageValue(cid, 9129312, 1)
            addEvent(setPlayerStorageValue, 7900, cid, 9129312, -1)
            addEvent(doCreatureSay, 7800, cid, "Done", 20)
        end
        --]]
        
        if spell == "Light Screen" then
            
            stopNow(cid, 2700)
            
            doCreatureSetNoMove(cid, true)
            setPlayerStorageValue(cid, 32698, 1) -- storage do silence
            addEvent(setPlayerStorageValue, 2800, cid, 32698, -1) -- storage do silence
            addEvent(doCreatureSetNoMove, 2800, cid, false)
            
            doSendMagicEffect(posC1, 773) -- 774
            addEvent(doSendMagicEffect, 494, posC1, 773) -- testar 490 -- fazer nova img cdbar cross chop
            addEvent(doSendMagicEffect, 986, posC1, 773)
            addEvent(doSendMagicEffect, 1480, posC1, 773)
            addEvent(doSendMagicEffect, 1974, posC1, 773)
            addEvent(doSendMagicEffect, 2468, posC1, 773)
            addEvent(doSendMagicEffect, 2963, posC1, 773)
        end
        
        if spell == "Acid Armor" then
            doSendMagicEffect(posC1, 853) -- 853
        end
        
        if spell == "Protect" then
            
            local ret = {} -- ficar ivuneravel por 5 segundos com efeito
            ret.id = cid
            ret.cd = 5
            ret.eff = 0 -- arrumado em newStatusSyt o eff em pos x+1 e y+1 
            ret.check = 0
            ret.buff = spell
            ret.first = true
            
            doCondition2(ret) 
            
        elseif spell == "Magnetic Flux" then
            
            local ret = {} 
            ret.id = cid
            ret.cd = 20
            ret.eff = 890
            ret.check = 0
            ret.buff = spell
            ret.first = true    

            doCondition2(ret) 
            
        elseif spell == "Light Screen" then
            local ret = {}
            ret.id = cid
            ret.cd = 3
            ret.eff = 0
            ret.check = 0
            ret.buff = spell
            ret.first = true
            
            doCondition2(ret) 
        else
            local ret = {}
            ret.id = cid
            ret.cd = 8
            ret.eff = 0
            ret.check = 0
            ret.buff = spell
            ret.first = true
            
            doCondition2(ret) 
        end
            
    elseif spell == "Confuse Ray" then
        
        local rounds = math.random(4, 7)
        rounds = rounds + math.floor(getPokemonLevel(cid) / 35)
        
        local ret = {}
        ret.id = target
        ret.cd = rounds
        ret.check = getPlayerStorageValue(target, conds["Confusion"])
        ret.cond = "Confusion"
        
        posi = getThingPosWithDebug(target)
        posi.y = posi.y+1
        ---
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        addEvent(doSendMagicEffect, 100, posi, 222)
        addEvent(doMoveDano2, 100, cid, target, GHOSTDAMAGE, -min, -max, ret, spell)
        
    elseif spell == "Leaf Blade" then
        
        local a = getThingPosWithDebug(target)
        posi = {x = a.x+1, y = a.y+1, z = a.z}
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        addEvent(doSendMagicEffect, 200, posi, 240)
        doDanoWithProtectWithDelay(cid, target, GRASSDAMAGE, -min, -max, 0, LeafBlade)
        
    elseif spell == "Elecball" then
        
        local ret = {}
        ret.id = cid
        ret.cd = 15
        ret.eff = 14
        ret.check = 0
        ret.buff = spell
        ret.first = true
        
        doCondition2(ret)
        
        pos = getThingPosWithDebug(cid)
        pos.x = pos.x+1
        pos.y = pos.y+1
        
        atk = {
            ["Elecball"] = {171, ELECTRICDAMAGE},
            --["Eruption"] = {241, FIREDAMAGE}
        }
        
        stopNow(cid, 1000)
        doSendMagicEffect(pos, atk[spell][1])
        doMoveInArea2(cid, 0, bombWee1, atk[spell][2], min, max, spell) 
        
        
    elseif spell == "Eruption" then -- rever mathpercent
        
        local pos = getThingPosWithDebug(cid)
                        
        local function doSendBubble(cid, pos)
            if not isCreature(cid) then return true end
            if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
            if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
            addEvent(doSendDistanceShoot, 250, getThingPosWithDebug(cid), pos, 29) -- 3 ver aki
            addEvent(doSendMagicEffect, 250, pos, 15)--53
        end
        

       local config = {
            Pull = function(cid)
                local pid = getSpectators(getThingPos(cid), 5, 5)
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
        
        stopNow(cid, 1000)
        doSendMagicEffect(posC1, 241)
        doMoveInArea2(cid, 0, bombWee1, FIREDAMAGE, min, max, spell) 
        for a = 2, 20 do
            local lugar = {x = pos.x + math.random(-5, 5), y = pos.y + math.random(-4, 4), z = pos.z}
            addEvent(doSendBubble, a * 30, cid, lugar)
        end
        addEvent(doDanoWithProtect, 150, cid, FIREDAMAGE, pos, waterarea, -min, -max, 0)    
        
    elseif spell == "Dazzling Gleam" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 16)
        addEvent(doSendDistanceShoot, 80, getThingPosWithDebug(cid), getThingPosWithDebug(target), 16)
        doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, -min, -max, 242) --alterado v1.7
        
    elseif spell == "Draco Meteor" then
        
        local effD = 5
        local eff = 248
        local master = isSummon(cid) and getCreatureMaster(cid) or cid
        
        local function doFall(cid)
            for rocks = 5, 42 do
                addEvent(fall, rocks*35, cid, master, DRAGONDAMAGE, effD, eff)
            end
        end
        
        for up = 1, 10 do
            addEvent(upEffect, up*75, cid, effD)
        end
        addEvent(doFall, 450, cid)
        addEvent(doDanoWithProtect, 1400, cid, DRAGONDAMAGE, getThingPosWithDebug(cid), waterarea, -min, -max, 0)
        
        
    elseif spell == "Dragon Pulse" then
        
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area)
            if isCreature(cid) then
                --if not isSightClear(p, area, false) then return true end
                doAreaCombatHealth(cid, DRAGONDAMAGE, area, pulse2, -min, -max, 255)
            end
        end
        
        for a = 0, 3 do
            
            local t = {
                [0] = {249, {x=p.x, y=p.y-(a+1), z=p.z}},
                [1] = {249, {x=p.x+(a+1), y=p.y, z=p.z}},
                [2] = {249, {x=p.x, y=p.y+(a+1), z=p.z}},
                [3] = {249, {x=p.x-(a+1), y=p.y, z=p.z}}
            } 
            addEvent(sendAtk, 300*a, cid, t[d][2])
            addEvent(doDanoWithProtect, 400*a, cid, DRAGONDAMAGE, t[d][2], pulse2, 0, 0, 177)
            addEvent(doDanoWithProtect, 400*a, cid, DRAGONDAMAGE, t[d][2], pulse1, 0, 0, t[d][1])
        end
        
    elseif spell == "Psy Ball" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 3)
        doDanoInTargetWithDelay(cid, target, psyDmg, min, max, 250) --alterado v1.7
        
    elseif spell == "SmokeScreen" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 501 --34
        ret.check = 0
        ret.spell = spell
        ret.cond = "Miss"
        
        local function smoke(cid)
            if not isCreature(cid) then return true end
            if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
            if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
            doMoveInArea2(cid, 501, confusion, NORMALDAMAGE, 0, 0, spell, ret) 
        end
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 1000, cid, 3644587, -1) 
        for i = 0, 3 do
            addEvent(smoke, i*500, cid) 
        end
                
    elseif spell == "Sucker Punch" then --alterado v1.5
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        doDanoInTargetWithDelay(cid, target, DARKDAMAGE, min, max, 237) --alterado v1.7
        
    elseif spell == "Assurance" then
        
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area1, area2, eff)
            if isCreature(cid) then
                --if not isSightClear(p, area1, false) then return true end
                --if not isSightClear(p, area2, false) then return true end
                doAreaCombatHealth(cid, DARKDAMAGE, area1, 0, 0, 0, eff)
                doAreaCombatHealth(cid, DARKDAMAGE, area2, whirl3, -min, -max, 0)
            end
        end
        
        for a = 0, 3 do
            
            local t = {
                [0] = {230, {x=p.x+1, y=p.y-(a+1), z=p.z}, {x=p.x, y=p.y-(a+1), z=p.z}},
                [1] = {226, {x=p.x+(a+2), y=p.y+1, z=p.z}, {x=p.x+(a+1), y=p.y, z=p.z}},
                [2] = {235, {x=p.x+1, y=p.y+(a+1), z=p.z}, {x=p.x, y=p.y+(a+1), z=p.z}},
                [3] = {231, {x=p.x-(a+1), y=p.y+1, z=p.z}, {x=p.x-(a+1), y=p.y, z=p.z}}
            } 
            addEvent(sendAtk, 300*a, cid, t[d][2], t[d][3], t[d][1])
        end
        
    elseif spell == "Scary Face" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 0
        ret.spell = spell
        ret.cond = "Stun"
        
        if isInArray({"Shiny Gengar", "Tyranitar", "Gyarados"}, getSubName(cid, target)) then
            doSendMagicEffect(posC1, 542)
        else
            doSendMagicEffect(posC1, 228)
        end
        doMoveInArea2(cid, 0, electro, NORMALDAMAGE, 0, 0, spell, ret)
        
        
    elseif spell == "Surf" then
        
        local pos = getThingPosWithDebug(cid)
        
        doMoveInArea2(cid, 246, doSurf1, WATERDAMAGE, 0, 0, spell)
        addEvent(doDanoWithProtect, math.random(100, 400), cid, WATERDAMAGE, pos, doSurf2, -min, -max, 0)
        
    elseif spell == "Sunny Day" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 6 -- 9
        ret.check = 0
        ret.eff = 513 -- 39
        ret.cond = "Silence"
        ----
        local p = getThingPosWithDebug(cid)
        doSendMagicEffect({x=p.x+1, y=p.y, z=p.z}, 828) -- 181
        ---
        if isSummon(cid) then 
            doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
        end
        
    local cloro = {"Nuzleaf","Shiftry"} 
        
        if isInArray(cloro, getCreatureName(cid)) then
            doRaiseStatus(cid, 0, 0, 300, 5) 
        end     
        
        if getCreatureName(cid) == "Castform" then
            addEvent(doTransformCastform, 1350, cid, "Fire")
            setPlayerStorageValue(cid, 253, -1) --focus
            setPlayerStorageValue(getCreatureMaster(cid), 141410, 1)
            addEvent(setPlayerStorageValue, 2200, getCreatureMaster(cid), 141410, -1)           
        end         
        
        doCureStatus(cid, "all")
        setPlayerStorageValue(cid, 253, 1) --focus
        doMoveInArea2(cid, 0, electro, NORMALDAMAGE, 0, 0, spell, ret)
        
        
    elseif spell == "Taunt" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 6
        ret.check = 0
        ret.eff = 136
        ret.cond = "Silence"
        
        local ret2 = {}
        ret2.id = 0
        ret2.cd = 6
        ret2.check = 0
        ret2.eff = 0
        ret2.spell = spell
        ret2.cond = "Slow"
        
        ----
        local p = getThingPosWithDebug(cid)
        
        ---
        if isSummon(cid) then 
            doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
        end
        doCureStatus(cid, "all")
        setPlayerStorageValue(cid, 253, 1) --focus
        --doMoveInArea2(cid, 0, electro, NORMALDAMAGE, 0, 0, spell, ret)
        
        local areas = {rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1} 
        
        for i = 0, 14 do
            addEvent(doMoveInArea2, i*320, cid, 678, areas[i+1], NORMALDAMAGE, 0, 0, spell, ret) --48
            addEvent(doMoveInArea2, i*330, cid, 678, areas[i+1], NORMALDAMAGE, 0, 0, spell, ret2)
            doSendMagicEffect({x=p.x, y=p.y-1, z=p.z}, 669)
        end
        
        
        
        
    elseif isInArray({"Pursuit", "ExtremeSpeed", "U-Turn", "Shell Attack"}, spell) then -- fazer passiva Teleport (abra)
        
        
        
        local atk = {
            ["Pursuit"] = {17, DARKDAMAGE, 105},
            ["ExtremeSpeed"] = {50, NORMALDAMAGE, 51},
            ["U-Turn"] = {19, BUGDAMAGE},
            ["Shell Attack"] = {45, BUGDAMAGE} --alterado v1.5
        }
        
        local pos = getThingPosWithDebug(cid)
        local p = getThingPosWithDebug(target)
        local newPos = getClosestFreeTile(target, p)
        
        if getSubName(cid, target) == "Murkrow" then
            eff = 105
        else
            eff = getSubName(cid, target) == "Shiny Arcanine" and atk[spell][3] or atk[spell][1]
        end 
        
        local damage = atk[spell][2]
        -----------
        
        addEvent(doDisapear, 100, cid)
        doChangeSpeed(cid, -getCreatureSpeed(cid))
        
        addEvent(doAppear, 800, cid)  -- adicionei essa linha
        
        -----------
        addEvent(doSendMagicEffect, 300, pos, 211)
        addEvent(doSendDistanceShoot, 380, pos, p, eff)
        addEvent(doSendDistanceShoot, 380, newPos, p, eff)
        addEvent(doDanoInTarget, 380, cid, target, damage, -min, -max, 0) --alterado v1.7
        addEvent(doSendDistanceShoot, 760, p, pos, eff)
        addEvent(doSendMagicEffect, 810, pos, 211)
        addEvent(doRegainSpeed, 950, cid)
        
        addEvent(function()  
        
            if isCreature(cid) then
                --setPlayerStorageValue(cid, 9658783, -1)
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
    
        end, 950)
        
        
        
    elseif spell == "Egg Rain" then
        
        local effD = 12
        local eff = 5
        local master = isSummon(cid) and getCreatureMaster(cid) or cid
        ------------
        
        local function doFall(cid)
            for rocks = 1, 62 do
                addEvent(fall, rocks*35, cid, master, ROCKDAMAGE, effD, eff)
            end
        end
        
        for up = 1, 10 do
            addEvent(upEffect, up*75, cid, effD)
        end
        addEvent(doFall, 450, cid)
        addEvent(doDanoWithProtect, 1400, cid, NORMALDAMAGE, getThingPosWithDebug(cid), waterarea, -min, -max, 0)
        
        
    elseif spell == "Stampade" or spell == "Stampede" or spell == "Crow Swarm" then -- se o nome for outro pra spell(Murkrow) elseif spell == "OutaSpell" then docastspell(cid, "Stampade")
        
        local master = getCreatureMaster(cid) or 0
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 0
        ret.check = 0
        ret.spell = spell
        ret.cond = "Stun"
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        if a == 0 then
            efeito = 187 -- tauros -- trocar efeito
            efeito2 = 586 -- shiny tauros
            efeito3 = 552 -- murkrow
        elseif a == 1 then
            efeito = 187
            efeit2 = 586
            efeit3 = 552
        elseif a == 2 then
            efeito = 187
            efeito2 = 587
            efeito3 = 553
        elseif a == 3 then
            efeito = 187
            efeito2 = 587
            efeito3 = 553
        end 
        
        
        for rocks = 1, 42 do
            if getSubName(cid, target) == "Tauros" then -- não tem o effect no client, usando do shiny tauros
                addEvent(fall, rocks*35, cid, master, NORMALDAMAGE, -1, efeito2)    
            elseif getSubName(cid, target) == "Shiny Tauros" then
                addEvent(fall, rocks*35, cid, master, NORMALDAMAGE, -1, efeito2)
            elseif getSubName(cid, target) == "Murkrow" then
                addEvent(fall, rocks*35, cid, master, NORMALDAMAGE, -1, efeito3)
            else
                addEvent(fall, rocks*35, cid, master, NORMALDAMAGE, -1, 187) -- Stantler
            end
        end
        
        addEvent(doMoveInArea2, 500, cid, 0, BigArea2, NORMALDAMAGE, min, max, spell, ret) 
        
        --[[
    elseif spell == "Stampage" then
        
        local master = getCreatureMaster(cid) or 0
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 0
        ret.check = 0
        ret.spell = spell
        ret.cond = "Stun"
        
        for rocks = 1, 42 do
            addEvent(fall, rocks*35, cid, master, NORMALDAMAGE, -1, 194)
        end
        
        addEvent(doMoveInArea2, 500, cid, 0, BigArea2, NORMALDAMAGE, min, max, spell, ret)
        --]]
        
        
    elseif spell == "Barrier" then
        if not isCreature(getCreatureTarget(cid)) then
            local function sendAtk(cid)
                if not isCreature(cid) then return true end
                setPlayerStorageValue(cid, 9658783, -1) 
                setPlayerStorageValue(cid, 734276, -1) 
            end
            setPlayerStorageValue(cid, 734276, 1) 
            setPlayerStorageValue(cid, 9658783, 1)
            pos = getThingPosWithDebug(cid)
            
            local function doSendEff(cid)
                if not isCreature(cid) then return true end
                doSendMagicEffect({x = pos.x + 1, y = pos.y + 1, z = pos.z}, 172)
            end
            for i = 0, 7 do
                addEvent(doSendEff, i*1000, cid)
            end
            addEvent(sendAtk, 8000, cid) 
            stopNow(cid, 8 * 800) 
        else
            local ret = {}
            ret.id = target
            ret.cd = math.random(8, 9) -- 10
            ret.check = getPlayerStorageValue(target, conds["Sleep"])
            ret.eff = 0
            ret.cond = "Sleep"
            
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 24)
            pos = getThingPosWithDebug(target)
            addEvent(doMoveDano2, 150, cid, target, PSYCHICDAMAGE, 0, 0, ret, spell)
            local function doSendEff(cid)
                if not isCreature(cid) then return true end
                doSendMagicEffect({x = pos.x + 1, y = pos.y + 1, z = pos.z}, 172)
            end
            for i = 0, 7 do
                addEvent(doSendEff, i*1000, cid)
            end
            stopNow(target, 8 * 800)
        end
        
    elseif spell == "Air Cutter" then -- lembrar do atk do mega absol do pxg com os cortes brancos mais rapidos
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area)
            if isCreature(cid) then
                --if not isSightClear(p, area, false) then return true end
        --      doAreaCombatHealth(cid, FLYINGDAMAGE, area, whirl3, -min, -max, 255)        
                addEvent(doAreaCombatHealth, 6, cid, FLYINGDAMAGE, area, whirl3, -min, -max, 966)
                addEvent(doAreaCombatHealth, 200, cid, FLYINGDAMAGE, area, whirl3, 0, 0, 931)
                addEvent(doAreaCombatHealth, 360, cid, FLYINGDAMAGE, area, whirl3, 0, 0, 931)

            end
        end 
        for a = 0, 5 do
            
            local t = {  -- Effect corte em direção Desativado
                [0] = {128, {x=p.x, y=p.y-(a+1), z=p.z}, {x=p.x+1, y=p.y-(a+1), z=p.z}},
                [1] = {129, {x=p.x+(a+1), y=p.y, z=p.z}, {x=p.x+(a+2), y=p.y+1, z=p.z}},
                [2] = {131, {x=p.x, y=p.y+(a+1), z=p.z}, {x=p.x+1, y=p.y+(a+2), z=p.z}},
                [3] = {130, {x=p.x-(a+1), y=p.y, z=p.z}, {x=p.x-(a+1), y=p.y+1, z=p.z}}
            } 
    --      addEvent(doSendMagicEffect, 300*a, t[d][3], t[d][1]) 
            addEvent(sendAtk, 300*a, cid, t[d][2])
        end
        
    elseif spell == "Venom Fangs" then -- mudar o nome pra Venom Fangs (antigo Venom Gale)
        
        local area = {gale1, gale2, gale3, gale4, gale3, gale2, gale1}
        
        for i = 0, 6 do
            addEvent(doMoveInArea2, i*400, cid, 138, area[i+1], POISONDAMAGE, min, max, spell) 
        end 
        
    elseif spell == "Crunch" then
        
        doDanoInTargetWithDelay(cid, target, DARKDAMAGE, 0, -min, -max, 535)
        addEvent(doDanoWithProtect, 10, cid, DARKDAMAGE, posT1, 0, 0, 0, 536) -- só effect
        addEvent(doDanoWithProtect, 10, cid, DARKDAMAGE, posT1, 0, 0, 0, 535) -- só effect
        addEvent(doDanoWithProtect, 10, cid, DARKDAMAGE, posT1, 0, 0, 0, 536) -- só effect
        
    elseif spell == "Ice Fang" then
        
        doTargetCombatHealth(cid, target, ICEDAMAGE, 0, 0, 146)
        addEvent(doDanoWithProtect, 250, cid, ICEDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 17)
        addEvent(doSendMagicEffect, 110, PosTarget1, 386)
        
    elseif spell == "Psyshock" then 
        
    local p = getThingPosWithDebug(cid)
    local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)

    function sendAtk(cid, area, eff)
    if isCreature(cid) then 
        if not isSightClear(p, area, false) then return true end
        doAreaCombatHealth(cid, psyDmg, area, 0, 0, 0, eff)    --alterado v1.4
        doAreaCombatHealth(cid, psyDmg, area, whirl3, -min, -max, 255)     --alterado v1.4
    end
    end

    for a = 0, 4 do

    local t = {
    [0] = {250, {x=p.x, y=p.y-(a+1), z=p.z}},           --alterado v1.4
    [1] = {250, {x=p.x+(a+1), y=p.y, z=p.z}},
    [2] = {250, {x=p.x, y=p.y+(a+1), z=p.z}},
    [3] = {250, {x=p.x-(a+1), y=p.y, z=p.z}}
    }   
    addEvent(sendAtk, 370*a, cid, t[d][2], t[d][1])
    end
        
    elseif spell == "Hurricane" then
        
        local function hurricane(cid)
            if not isCreature(cid) then return true end
            if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
            if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
            doMoveInArea2(cid, 42, bombWee1, FLYINGDAMAGE, min, max, spell)
        end
        
        doSetCreatureOutfit(cid, {lookType = 1398}, 10000)
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 17*600, cid, 3644587, -1)   
        for i = 1, 17 do
            addEvent(hurricane, i*600, cid) --alterado v1.4
        end
        
    elseif spell == "Aromateraphy" or spell == "Emergency Call" then
        
        eff = spell == "Aromateraphy" and 14 or 13
        
        doAreaCombatHealth(cid, GRASSDAMAGE, getThingPosWithDebug(cid), bombWee3, 0, 0, eff)
        if isSummon(cid) then 
            doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
        end
        doCureStatus(cid, "all") 
        
        local uid = checkAreaUid(getThingPosWithDebug(cid), confusion, 1, 1)
        for _,pid in pairs(uid) do
            if isCreature(pid) then
                if ehMonstro(cid) and ehMonstro(pid) and pid ~= cid then
                    doCureStatus(pid, "all")
                elseif isSummon(cid) and ((isSummon(pid) and canAttackOther(cid, pid) == "Can") or (isPlayer(pid) and not canAttackOther(cid, pid) == "Can")) and pid ~= cid then
                    if isSummon(pid) then 
                        doCureBallStatus(getPlayerSlotItem(getCreatureMaster(pid), 8).uid, "all")
                    end
                    doCureStatus(pid, "all")
                end
            end
        end
        
    elseif spell == "Synthesis" or spell == "Roost" then
        
        local min = (getCreatureMaxHealth(cid) * 45) / 100
        local max = (getCreatureMaxHealth(cid) * 60) / 100
        
        local function doHealArea(cid, min, max)
            local amount = math.random(min, max)
            if (getCreatureHealth(cid) + amount) >= getCreatureMaxHealth(cid) then
                amount = -(getCreatureHealth(cid)-getCreatureMaxHealth(cid))
            end
            if getCreatureHealth(cid) ~= getCreatureMaxHealth(cid) then
                doCreatureAddHealth(cid, amount)
                doSendAnimatedText(getThingPosWithDebug(cid), "+"..amount.."", 65)
            end
        end
        
        doSendMagicEffect(getThingPosWithDebug(cid), 103)
        doHealArea(cid, min, max) 
        
    elseif spell == "Cotton Spore" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 0
        ret.check = 0
        ret.spell = spell
        ret.cond = "Stun"
        
        doMoveInArea2(cid, 85, confusion, GRASSDAMAGE, 0, 0, spell, ret)
        
    elseif spell == "Peck" then
        
        sendDistanceShootWithProtect(cid, getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        doDanoInTargetWithDelay(cid, target, FLYINGDAMAGE, min, max, 3) --alterado v1.7
        doSendMagicEffect(posT1, 969)
        addEvent(doSendMagicEffect, 200, posT, 3)
        
    elseif spell == "Night Daze" then
        
        local pos = getThingPosWithDebug(cid)
        local eff = spell == "Night Daze" and 222 or 113
        local dmg = spell == "Night Daze" and DARKDAMAGE or FIGHTINGDAMAGE
        
        local out = getSubName(cid, target) == "Hitmontop" and 1193 or 1451 --alterado v1.6.1
        
        local function doSendBubble(cid, pos)
            if not isCreature(cid) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), pos, 39)
            doSendMagicEffect(pos, eff)
        end
        --alterado!!
        for a = 1, 20 do
            local r1 = math.random(-4, 4)
            local r2 = r1 == 0 and choose(-3, -2, -1, 2, 3) or math.random(-3, 3)
            --
            local lugar = {x = pos.x + r1, y = pos.y + r2, z = pos.z}
            addEvent(doSendBubble, a * 25, cid, lugar)
        end
        if isInArray({"Hitmontop", "Shiny Hitmontop"}, getSubName(cid, target)) then --alterado v1.6.1
            doSetCreatureOutfit(cid, {lookType = out}, 400)
        end 
        addEvent(doDanoWithProtect, 150, cid, dmg, pos, waterarea, -min, -max, 0)
        
    elseif spell == "Rolling Kick" then
        
        local pos = getThingPosWithDebug(cid)
        local eff = spell == "Night Daze" and 222 or 113
        local dmg = spell == "Night Daze" and DARKDAMAGE or FIGHTINGDAMAGE
        
        local out = getSubName(cid, target) == "Hitmontop" and 1193 or 1451 --alterado v1.6.1
        
        local function doSendBubble(cid, pos)
            if not isCreature(cid) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), pos, 27)
            doSendMagicEffect(pos, eff)
        end
        --alterado!!
        for a = 1, 20 do
            local r1 = math.random(-4, 4)
            local r2 = r1 == 0 and choose(-3, -2, -1, 2, 3) or math.random(-3, 3)
            --
            local lugar = {x = pos.x + r1, y = pos.y + r2, z = pos.z}
            addEvent(doSendBubble, a * 25, cid, lugar)
        end
        if isInArray({"Hitmontop", "Shiny Hitmontop"}, getSubName(cid, target)) then --alterado v1.6.1
            doSetCreatureOutfit(cid, {lookType = out}, 400)
        end 
        addEvent(doDanoWithProtect, 150, cid, dmg, pos, waterarea, -min, -max, 0)
        
    elseif spell == "Safeguard" then
        
        doSendMagicEffect(getThingPosWithDebug(cid), 1) 
        if isSummon(cid) then 
            doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
        end
        doCureStatus(cid, "all") 
        
    elseif spell == "Air Slash" then
        
        local p = getThingPosWithDebug(cid)
        
        local t = {
            {{128, {x = p.x+1, y = p.y-1, z = p.z}}, {16, {x = p.x+1, y = p.y-1, z = p.z}}},
            {{129, {x = p.x+2, y = p.y+1, z = p.z}}, {221, {x = p.x+3, y = p.y+1, z = p.z}}},
            {{131, {x = p.x+1, y = p.y+2, z = p.z}}, {223, {x = p.x+1, y = p.y+3, z = p.z}}},
            {{130, {x = p.x-1, y = p.y+1, z = p.z}}, {243, {x = p.x-1, y = p.y+1, z = p.z}}},
        }
        
        for i = 1, 4 do
            doSendMagicEffect(t[i][2][2], t[i][2][1])
        end
        doDanoWithProtect(cid, FLYINGDAMAGE, getThingPosWithDebug(cid), airSlash, -min, -max, 0) 
        
        for i = 1, 4 do
            addEvent(doSendMagicEffect, 400, t[i][1][2], t[i][1][1])
        end
        addEvent(doDanoWithProtect, 400, cid, FLYINGDAMAGE, getThingPosWithDebug(cid), bombWee2, -min, -max, 0)
        
    elseif spell == "Feather Dance" then
            
        
        local function doPulse(cid, eff)
            if not isCreature(cid) or not isCreature(target) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 9)
            doDanoInTargetWithDelay(cid, target, FLYINGDAMAGE, -min, -max, eff) --alterado v1.7
            addEvent(doSendMagicEffect, 32, posT, 307) -- 359
        end
        
        addEvent(doPulse, 0, cid, 137) -- 137
        addEvent(doPulse, 220, cid, 137)
        
        
    elseif spell == "Tailwind" then
        
        local ret = {}
        ret.id = cid
        ret.cd = 10
        ret.eff = 137
        ret.check = 0
        ret.buff = spell
        ret.first = true
        
        doCondition2(ret)
        
    elseif spell == "Giga Drain" then
        
        local life = getCreatureHealth(target) or 0
        
        doDanoWithProtect(cid, GRASSDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 258)
        
        local newlife = life - (getCreatureHealth(target) or 0)
        
        doSendMagicEffect(getThingPosWithDebug(cid), 14)
        if newlife >= 1 then
            doCreatureAddHealth(cid, newlife)
            doSendAnimatedText(getThingPosWithDebug(cid), "+"..newlife.."", 32)
        end 
        
        
    elseif spell == "Leech Life" then --refazer, não ta curando. Fazer um effect de "sugar" do target
        
        local life = getCreatureHealth(target)
        
        --doSendDistanceShoot(PosC, PosT, 19)
        addEvent(doDanoWithProtect, 70, cid, BUGDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 14)
        
        local newlife = life - getCreatureHealth(target)
        
        addEvent(doSendMagicEffect, 70, getThingPosWithDebug(target), 7)
        addEvent(doSendMagicEffect, 80, getThingPosWithDebug(cid), 637) -- 14   
        if newlife >= 1 then
            addEvent(doCreatureAddHealth, 79, cid, newlife)
            addEvent(doSendAnimatedText, 80, getThingPosWithDebug(cid), "+"..newlife.."", 32)
        end 
        
    elseif spell == "Bug Fighter" then
        
        local ret = {}
        ret.id = cid
        ret.cd = 10
        ret.eff = 0
        ret.check = 0
        ret.buff = spell
        ret.first = true
        
        doCondition2(ret)   
                
    elseif spell == "Tackle" then
        doDanoWithProtect(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 111)  

    elseif spell == "Dual Chop" then
        
        local ret = {}
        ret.id = target
        ret.cd = 8
        ret.eff = 43
        ret.check = getPlayerStorageValue(target, conds["Slow"])
        ret.first = true
        ret.cond = "Slow"
        
        posT1.y = posT1.y
        
        doDanoWithProtect(cid, DRAGONDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 0)    
            doSendMagicEffect(posT1, 475)
        addEvent(doDanoWithProtect, 1500, cid, DRAGONDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 0)    
            addEvent(doSendMagicEffect, 1500, posT1, 476)
        addEvent(doMoveDano2, 1, cid, target, DRAGONDAMAGE, 0, 0, ret, spell)   
                
    elseif spell == "Metal Claw" then
        
        posT1.y = posT1.y-1 -- somente x = x+1 (padrão do posT1 é x+1 e y+1)
        
        if isInArray({"Lucario", "Shiny Lucario", "Sneasel"}, getSubName(cid, target)) then
            doDanoWithProtect(cid, STEELDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 394)
            
        elseif isInArray({"Aggron", "Scizor", "Zangoose"}, getSubName(cid, target)) then -- aqui causa dano 2 vezes, por isso tem q por um valor Menor(metade) p/ o dano dessa spell Nesses pokes
            doDanoWithProtect(cid, STEELDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 0) 
            addEvent(doDanoWithProtect, 150, cid, STEELDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 0)  
            doSendMagicEffect(posT1, 779)
            
        else 
            
            local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
            
            if a == 0 then
                efeito = 781 
            elseif a == 1 then
                efeito = 780
            elseif a == 2 then
                efeito = 780
            elseif a == 3 then
                efeito = 781
            end 
            
            doDanoWithProtect(cid, STEELDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 0) 
            doSendMagicEffect(posT1, efeito)
        end 
        
        
        
    elseif spell == "Power Gem" then
        
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area)
            if isCreature(cid) then
                --if not isSightClear(p, area, false) then return true end
                doAreaCombatHealth(cid, ROCKDAMAGE, area, pulse2, -min, -max, 255)
            end
        end
        
        for a = 0, 3 do
            
            local t = {
                [0] = {29, {x=p.x, y=p.y-(a+1), z=p.z}}, 
                [1] = {29, {x=p.x+(a+1), y=p.y, z=p.z}},
                [2] = {29, {x=p.x, y=p.y+(a+1), z=p.z}},
                [3] = {29, {x=p.x-(a+1), y=p.y, z=p.z}} 
            } 
            addEvent(sendAtk, 400*a, cid, t[d][2])
            addEvent(doAreaCombatHealth, 400*a, cid, ROCKDAMAGE, t[d][2], pulse1, 0, 0, t[d][1])
            addEvent(doAreaCombatHealth, 400*a, cid, ROCKDAMAGE, t[d][2], pulse1, 0, 0, 103)
        end 
        
    elseif spell == "Octazooka" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 34
        ret.cond = "Silence"
        
        doMoveInAreaMulti(cid, 6, 116, multi, multiDano, WATERDAMAGE, min, max)
        doMoveInArea2(cid, 0, multiDano, WATERDAMAGE, 0, 0, spell, ret)
        
        
    elseif spell == "Take Down" then
        
        
        addEvent(doMoveInArea2, 100, cid, 111, reto5, NORMALDAMAGE, min, max, spell)
        
    elseif spell == "Yawn" then
        
        local ret = {}
        ret.id = target
        ret.cd = math.random(5, 8)  -- math.random(6, 9)
        ret.check = getPlayerStorageValue(target, conds["Sleep"])
        ret.first = true
        ret.cond = "Sleep"
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 160)
        addEvent(doMoveDano2, 1500, cid, target, NORMALDAMAGE, 0, 0, ret, spell)
        addEvent(doSentMagicEffect, 150, posC, 787)
        
        
    elseif isInArray({"Croak Hook", "Tongue Hook", "Vine Hook"}, spell) then -- Sam
        
        local Shoot = 38 -- effect vermelho(padrão dos sapos)
        
        if spell == "Vine Hook" then
            if getSubName(cid, target) == "Tangrowth" then
                local Shoot = 38 -- missiles
            elseif getSubName(cid, target) == "Tangela" then
                local Shoot = 38
            else
                local Shoot = 38 -- effect verde(padrão vine hook)
            end 
        end
        
        
        
        sendDistanceShootWithProtect(cid, posC, posT, Shoot)
        addEvent(doTeleportThing, 200, target, getClosestFreeTile(cid, posC), true)
        addEvent(sendDistanceShootWithProtect, 200, cid, posT, posC, Shoot)
        
        
        
        --[[
        
    elseif spell == "Tongue Grap" then -- old (troquei pelo do DxP esp)
        
        local function distEff(cid, target)
            if not isCreature(cid) or not isCreature(target) or not isSilence(target) then return true end --alterado v1.6
            sendDistanceShootWithProtect(cid, getThingPosWithDebug(target), getThingPosWithDebug(cid), 38)
        end
        
        local ret = {}
        ret.id = target
        ret.cd = 10
        ret.check = getPlayerStorageValue(target, conds["Silence"])
        ret.eff = 185
        ret.cond = "Silence"
        
        sendDistanceShootWithProtect(cid, getThingPosWithDebug(cid), getThingPosWithDebug(target), 38)
        addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)
        
        for i = 1, 10 do
            addEvent(distEff, i*930, cid, target)
        end 
        
        --]]
        
    elseif spell == "Tongue Grap" then
        
        local function distEff(cid, target)
            if not isCreature(cid) or not isCreature(target) or not isSilence(target) then return true end --alterado v1.6
            sendDistanceShootWithProtect(cid, getThingPosWithDebug(target), getThingPosWithDebug(cid), 38)
        end
        local function doPulse(cid, eff)
            if not isCreature(cid) then return true end
            doDanoInTargetWithDelay(cid, target, damage, min, max, 0) --alterado v1.7
        end
        local function voltar(cid, target)
            if not isCreature(cid) then return true end
            doRegainSpeed(cid)
            doRegainSpeed(target)
        end
        
        local ret = {}
        ret.id = target
        ret.cd = 4
        ret.check = getPlayerStorageValue(target, conds["Silence"])
        ret.eff = 185
        ret.cond = "Silence"
        
        sendDistanceShootWithProtect(cid, getThingPosWithDebug(cid), getThingPosWithDebug(target), 38)
        addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)
        
        for i = 1, 15 do
            addEvent(distEff, i*250, cid, target)
            addEvent(doPulse, i*250, cid, eff) 
            doChangeSpeed(cid, -getCreatureSpeed(cid))
            doChangeSpeed(target, -getCreatureSpeed(target))
            addEvent(voltar, 3700, cid, target)
        end 
        
        
        
        
        
    elseif spell == "Struggle Bug" or spell == "Iron Spiner" then
        
        local function sendFireEff(cid, dir)
            if not isCreature(cid) then return true end
            if spell == "Struggle Bug" then
                doDanoWithProtect(cid, BUGDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 105)
            else
                doDanoWithProtect(cid, STEELDAMAGE, getPosByDir(posC1, dir), 0, 0, 0, 537) -- effect
                doDanoWithProtect(cid, STEELDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 0) -- dano
            end 
        end
        
        local function doWheel(cid)
            if not isCreature(cid) then return true end
            local t = {
                [1] = SOUTH,
                [2] = SOUTHEAST,
                [3] = EAST,
                [4] = NORTHEAST,
                [5] = NORTH, --alterado v1.5
                [6] = NORTHWEST,
                [7] = WEST,
                [8] = SOUTHWEST,
            }
            for a = 1, 8 do
                addEvent(sendFireEff, a * 200, cid, t[a])
            end
        end
        
        doWheel(cid, false, cid)
        
    elseif spell == "Low Kick" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 113) --alterado v1.7
        
    elseif spell == "Present" then
        
        local function sendHeal(cid)
            if isCreature(cid) and isCreature(target) then 
                doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(target), crusher, min, max, 5)
                doSendAnimatedText(getThingPosWithDebug(target), "HEALTH!", 65)
            end
        end
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 31)
        if math.random(1, 100) >= 10 then
            doDanoWithProtectWithDelay(cid, target, NORMALDAMAGE, min, max, 5, crusher) 
        else
            addEvent(sendHeal, 100, cid) 
        end
        
    elseif isInArray({"Inferno", "Fissure"}, spell) then
        
        local pos = getThingPosWithDebug(cid)
        
        atk = { 
            ["Inferno"] = {391, FIREDAMAGE},
            ["Fissure"] = {102, GROUNDDAMAGE}
        }
        
        doMoveInArea2(cid, atk[spell][1], inferno1, atk[spell][2], 0, 0, spell)
        addEvent(doDanoWithProtect, math.random(100, 400), cid, atk[spell][2], pos, inferno2, -min, -max, 0)
        
    elseif spell == "Boomburst" then

    doMoveInArea2(cid, 985, Boomburst, NORMALDAMAGE, -min, -max, spell) 
        addEvent(doMoveInArea2, 1500, cid, 985, Boomburst1, NORMALDAMAGE, -min, -max, spell) 
            addEvent(doMoveInArea2, 2500, cid, 985, Boomburst2, NORMALDAMAGE, -min, -max, spell) 
    
    elseif spell == "Wrap" then
        
        local ret = {}
        ret.id = target
        ret.cd = 10
        ret.check = getPlayerStorageValue(target, conds["Silence"])
        if getSubName(cid, target) == "Tangrowth" then
            ret.eff = 493
        elseif getSubName(cid, target) == "Tangela" then
            ret.eff = 518
        else
            ret.eff = 104
        end
        ret.cond = "Silence"
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        addEvent(doMoveDano2, 100, cid, target, NORMALDAMAGE, 0, 0, ret, spell)
        
    elseif spell == "Rock n'Roll" then
        
        local pos = getThingPosWithDebug(cid)
        local areas = {rock1, rock2, rock3, rock4, rock5, rock4, rock3, rock2, rock1}
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 1
        ret.check = 0
        ret.spell = spell
        ret.cond = "Miss"
        
        for i = 0, 8 do
            addEvent(doMoveInArea2, i*400, cid, 1, areas[i+1], NORMALDAMAGE, min, max, spell, ret)
            addEvent(doMoveInArea2, i*410, cid, 1, areas[i+1], NORMALDAMAGE, 0, 0, spell)
        end
        
    elseif spell == "Power Wave" then
        
        local pos = getThingPosWithDebug(cid)
        local areas = {rock1, rock2, rock3, rock4, rock5}
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 103
        ret.check = 0
        ret.first = true
        ret.cond = "Paralyze"
        
        
        
        local function sendAtk(cid)
            if isCreature(cid) then 
                doRemoveCondition(cid, CONDITION_OUTFIT)
                setPlayerStorageValue(cid, 9658783, -1) 
                for i = 0, 4 do
                    addEvent(doMoveInArea2, i*400, cid, 103, areas[i+1], psyDmg, min, max, spell, ret)
                    addEvent(doMoveInArea2, i*410, cid, 103, areas[i+1], psyDmg, 0, 0, spell)
                end
            end
        end
        
        doSetCreatureOutfit(cid, {lookType = 1001}, -1)
        setPlayerStorageValue(cid, 9658783, 1)
        addEvent(sendAtk, 2000, cid) 
        
        
    elseif spell == "Heal Bell" then
        
        if isSummon(cid) then 
            doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
        end
        doCureStatus(cid, "all") 
        
        local areas = {rock1, rock2, rock3, rock4, rock5, rock1, rock2, rock3, rock4, rock5, rock1, rock2, rock3, rock4, rock5, rock1, rock2, rock3, rock4, rock5, rock1, rock2, rock3, rock4, rock5}
        local ret = {}
        ret.id = cid
        ret.cd = 10
        ret.eff = 0
        ret.check = 0
        ret.buff = spell
        ret.first = true
        
        doCondition2(ret) 
        
        for i = 0, 22 do
            addEvent(doMoveInArea2, i*400, cid, 33, areas[i+1], NORMALDAMAGE, 0, 0, spell)
        end
        
    elseif spell == "Ground Crusher" or spell == "Magnitude" then
        
        local pos = getThingPosWithDebug(cid)
        local areas = {rock1, rock2, rock3, rock4, rock5}
        local ret = {}
        ret.id = 0
        ret.cd = 12
        ret.eff = 0
        ret.check = 0
        ret.spell = spell
        ret.cond = "Stun"
        
        local function endMove(cid)
            if isCreature(cid) then
                doRemoveCondition(cid, CONDITION_OUTFIT) 
            end
        end
        
        doSetCreatureOutfit(cid, {lookType = 1449}, -1)
        stopNow(cid, 16*360)
        addEvent(endMove, 16*360, cid)
        ----
        for i = 0, 4 do
            addEvent(doMoveInArea2, i*350, cid, 100, areas[i+1], GROUNDDAMAGE, min, max, spell, ret)
            addEvent(doMoveInArea2, i*360, cid, 100, areas[i+1], GROUNDDAMAGE, 0, 0, spell, ret)
        end
        for i = 4, 8 do
            local a = i-3
            addEvent(doMoveInArea2, i*350, cid, 100, areas[a], GROUNDDAMAGE, min, max, spell, ret)
            addEvent(doMoveInArea2, i*360, cid, 100, areas[a], GROUNDDAMAGE, 0, 0, spell, ret)
        end
        for i = 8, 12 do
            local a = i-7
            addEvent(doMoveInArea2, i*350, cid, 100, areas[a], GROUNDDAMAGE, min, max, spell, ret)
            addEvent(doMoveInArea2, i*360, cid, 100, areas[a], GROUNDDAMAGE, 0, 0, spell, ret)
        end
        for i = 12, 16 do
            local a = i-11
            addEvent(doMoveInArea2, i*350, cid, 100, areas[a], GROUNDDAMAGE, min, max, spell, ret)
            addEvent(doMoveInArea2, i*360, cid, 100, areas[a], GROUNDDAMAGE, 0, 0, spell, ret)
        end
        for i = 16, 20 do
            local a = i-15
            addEvent(doMoveInArea2, i*350, cid, 100, areas[a], GROUNDDAMAGE, min, max, spell, ret)
            addEvent(doMoveInArea2, i*360, cid, 100, areas[a], GROUNDDAMAGE, 0, 0, spell, ret)
        end
        
        
        
    elseif isInArray({"Last Resort", "Poisonous Progression"}, spell) then
        
        local pos = getThingPosWithDebug(cid)
        local areas = {rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1}
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 0
        ret.check = 0
        ret.spell = spell
        ret.cond = nil 
        
        if spell == "Poisonous Progression" then
            dano = POISONDAMAGE --alterado v1.4
            eff = 479
            --  ret.cond = "Poison" -- nn sei se tem poison cond
            -- ret.eff = 0
        elseif spell == "kkk" then
            dano = FLYINGDAMAGE
            eff = 307
        else
            dano = NORMALDAMAGE
            eff = 3 -- eff last resort
        end
        
        for i = 0, 9 do
            addEvent(doMoveInArea2, i*400, cid, eff, areas[i+1], dano, min, max, spell, ret)
            addEvent(doMoveInArea2, i*410, cid, eff, areas[i+1], dano, 0, 0, spell, ret)
        end
        
    elseif spell == "Stored Pwer" then
    
            doMoveInArea2(cid, 728, HealWish, PSYCHICDAMAGE, min, max, spell)
                addEvent(doMoveInArea2, 1, cid, 13, HealWish, PSYCHICDAMAGE, 0, 0, spell)
        
    elseif isInArray({"Psy Impact", "Sky Attack", "Discharge", "Ice Spikes", "Eruption Terrain", "Fairy Burst", "Mega Discharge", "Poison Burst", "Ground Elevation", "Flames", "Storm Leaves", "Lava Pool", "Heart Stamp", "Sand Power", "Cold Storm"}, spell) then
        -- fazer área menor pra Discharge,
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
            eff = 420   -- effect da discharge um pouco diferente e roxo
            ret.cond = "Miss"
            ret.eff = 640 -- editar
        elseif spell == "Flames" then
            dano = FIREDAMAGE
            eff = 505
            --  ret.cond = "Burn" -- Burn (ainda não funciona)
            --  ret.eff = 0 -- eff de burn
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
            eff = 417       -- effect do Heart Stamp
        end
        
        for rocks = 1, 20 do --1, 42
            
            if  spell == "Storm Leaves" then
                addEvent(fall, rocks*35, cid, master, dano, -1, eff2)
            elseif spell == "Eruption Terrain" then
                addEvent(fall, rocks*30, cid, master, 0, -1, eff0) 
                
                addEvent(fall, rocks*40, cid, master, dano, -1, eff) 
            end
            
            addEvent(fall, rocks*35, cid, master, dano, -1, eff) --*35
        end
        
        if  spell == "Storm Leaves" then
            addEvent(doMoveInArea2, 500, cid, 0, BigArea2, dano2, 0, 0, spell, ret) -- essa tem 2 effects, caso queira 2 danos editar nesse 0, 0 e no dano2
            addEvent(doMoveInArea2, 500, cid, 0, BigArea2, dano, min, max, spell, ret) 
        elseif spell == "Ground Elevation" then
            addEvent(doMoveInArea2, 500, cid, 0, BigArea2, dano, min, max, spell, ret)
            addEvent(doMoveInArea2, 1600, cid, 0, BigArea2, dano, min, max, spell, ret)
        elseif spell == "Ground Elevation" then
            addEvent(doMoveInArea2, 500, cid, 0, BigArea1, dano, min, max, spell, ret)  --Area menor criada p/ essa spell (BigArea1)
            
        else
            addEvent(doMoveInArea2, 500, cid, 0, BigArea2, dano, min, max, spell, ret) -- padrão
        end 
            
    elseif spell == "Two Face Shock" then
        
        local atk = {
            [1] = {179, ICEDAMAGE},
            [2] = {127, GROUNDDAMAGE}
        }
        
        local rand = math.random(1, 2)
        
        doAreaCombatHealth(cid, atk[rand][2], getThingPosWithDebug(cid), splash, -min, -max, 255)
        
        local sps = getThingPosWithDebug(cid)
        sps.x = sps.x+1
        sps.y = sps.y+1
        doSendMagicEffect(sps, atk[rand][1])
        
        
    elseif spell == "Aerial Ace" then
        
        local eff = {16, 221, 223, 243}
        
        for rocks = 1, 32 do
            addEvent(fall, rocks*22, cid, master, FLYINGDAMAGE, -1, eff[math.random(1, 4)])
        end
        
        addEvent(doMoveInArea2, 500, cid, 0, BigArea2, FLYINGDAMAGE, min, max, spell) 
        
    elseif spell == "Echoed Voice" then
        
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area)
            if isCreature(cid) then
                --if not isSightClear(p, area, false) then return true end
                doAreaCombatHealth(cid, NORMALDAMAGE, area, pulse2, -min, -max, 255)
            end
        end
        
        for a = 0, 5 do
            
            local t = {
                [0] = {39, {x=p.x, y=p.y-(a+1), z=p.z}}, 
                [1] = {39, {x=p.x+(a+1), y=p.y, z=p.z}},
                [2] = {39, {x=p.x, y=p.y+(a+1), z=p.z}},
                [3] = {39, {x=p.x-(a+1), y=p.y, z=p.z}} 
            } 
            addEvent(sendAtk, 400*a, cid, t[d][2])
            addEvent(doAreaCombatHealth, 400*a, cid, ROCKDAMAGE, t[d][2], pulse1, 0, 0, t[d][1])
        end 
        
    elseif spell == "Electro Field" or spell == "Venomous Gale" or spell == "Petal Tornado" or spell == "Rock Storm" or spell == "Waterfall" or spell == "Flame Circlel" or spell == "Flame Circle" or spell == "Flare Blitz" then 
        
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
        
    elseif spell == "Seed Bomb" then --alterado v1.6
        
    local master = isSummon(cid) and getCreatureMaster(cid) or cid

    local function doFall(cid)
    for rocks = 1, 42 do   --62
        addEvent(fall, rocks*35, cid, master, SEED_BOMBDAMAGE, 1, 503)
    end
    end

    for up = 1, 10 do
        addEvent(upEffect, up*75, cid, 1)
    end
    addEvent(doFall, 450, cid)
    addEvent(doMoveInArea2, 1400, cid, 2, BigArea2, SEED_BOMBDAMAGE, min, max, spell)

    elseif spell == "Reverse Earthshock" then
        
        local p = getThingPosWithDebug(cid)
        p.x = p.x+1
        p.y = p.y+1
        
        sendEffWithProtect(cid, p, 151) --send eff
        
        local function doDano(cid)
            local pos = getThingPosWithDebug(cid)
            
            local function doSendBubble(cid, pos)
                if not isCreature(cid) then return true end
                doSendDistanceShoot(getThingPosWithDebug(cid), pos, 39)
                doSendMagicEffect(pos, 239)
            end
            --alterado!!
            for a = 1, 20 do
                local r1 = math.random(-4, 4)
                local r2 = r1 == 0 and choose(-3, -2, -1, 2, 3) or math.random(-3, 3)
                --
                local lugar = {x = pos.x + r1, y = pos.y + r2, z = pos.z}
                addEvent(doSendBubble, a * 25, cid, lugar)
            end
            
            addEvent(doDanoWithProtect, 150, cid, ROCKDAMAGE, pos, waterarea, -min, -max, 0)
        end
        
        addEvent(doDano, 1250, cid)
        
        
    elseif spell == "Fury Swipes" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 23)
        doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 152) 
        
        
    elseif spell == "Poison Jab" then
        
        if isInArray({"Nidoking", "Shiny Nidoking", "Toxicroak", "Shiny Toxicroak"}, getSubName(cid, target)) then
            
            local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
            local p = getThingPosWithDebug(cid)
            
            local t = {
                [0] = {673, {x=p.x+1, y=p.y-1, z=p.z}},
                [1] = {670, {x=p.x+2, y=p.y+1, z=p.z}}, 
                [2] = {671, {x=p.x+1, y=p.y+2, z=p.z}},
                [3] = {672, {x=p.x, y=p.y, z=p.z}}, 
            }
            
            --[[
            if a == 0 then
                p.x = p.x+1
                p.y = p.y-1     
                effect = 673
            elseif a == 1 then
                p.x = p.x+2
                p.y = p.y+1 
                effect = 670
            elseif a == 2 then
                p.x = p.x+1
                p.y = p.y+2 
                effect = 671
            elseif a == 3 then
                p.x = p.x
                p.y = p.y
                effect = 672
            end
            --]]
            
            doMoveInArea2(cid, 0, BrickBeak, POISONDAMAGE, min, max, spell)
            doSendMagicEffect(t[a][2], t[a][1]) 
        --  doPoisonPoke(cid, target)
            
        else
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 15)
            doDanoInTargetWithDelay(cid, target, POISONDAMAGE, min, max, 153) 
        end      
        
    elseif spell == "Hydro Dance" then
        
        local eff = {155, 154, 53, 155, 53}
        local area = {psy1, psy2, psy3, psy4, psy5}
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 4*400, cid, 3644587, -1)
        for i = 0, 4 do
            addEvent(doMoveInArea2, i*400, cid, eff[i+1], area[i+1], WATERDAMAGE, min, max, spell)
        end
        
    elseif spell == "Stick Throw" then
        
        local area = {Throw01, Throw02, Throw03, Throw04, Throw03, Throw02, Throw01}
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 0
        ret.spell = spell
        ret.cond = "Stun"
        
        stopNow(cid, 2000)
        doMoveInArea2(cid, 212, reto5, NORMALDAMAGE, min, max, spell, ret) 
        
    elseif spell == "Bamboo Spikes" then
        
        local area = {Spikes01, Spikes02, Spikes03, Spikes04, Spikes05}
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 0
        ret.spell = spell
        ret.cond = "Stun"
        stopNow(cid, 2000)
        
         for i = 1, 5 do
             addEvent(doMoveInArea2, i*400, cid, 412, area[i], GRASSDAMAGE, min, max, spell, ret)
         end    

    elseif spell == "Curse" then    
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 0
        ret.spell = spell
        ret.cond = "Stun"
        
        doSendMagicEffect(getThingPos(cid), 222)
        stopNow(cid, 2000)
        
         for i = 0, 6 do                    
            --if getPlayerStorageValue(cid, 5000005) <= 0 then
                addEvent(doMoveInArea2, i*400, cid, 0, airSlash1, GHOSTDAMAGE, min, max, spell, ret)        
            --else
            --  addEvent(doMoveInArea2, i*400, cid, 0, airSlash1, DARKDAMAGE, min, max, spell, ret)
            --  setPlayerStorageValue(cid, 5000005, -1)     
            --  return true
            --end
         end    
         
        
    elseif spell == "Rock Tomb" then
        
        local ret = {}
        ret.id = target
        ret.cd = 9
        ret.eff = 0
        ret.check = getPlayerStorageValue(target, conds["Slow"])
        ret.first = true
        ret.cond = "Slow"
        
        local function doRockFall(cid, frompos, target)
            if not isCreature(target) or not isCreature(cid) then return true end
            local pos = getThingPosWithDebug(target)
            local ry = math.abs(frompos.y - pos.y)
            doSendDistanceShoot(frompos, pos, 125) -- 39
            addEvent(doMoveDano2, ry * 11, cid, target, ROCKDAMAGE, min, max, ret, spell)
            addEvent(sendEffWithProtect, ry*11, cid, pos, 157)
        end
        
        local function doRockUp(cid, target)
            if not isCreature(target) or not isCreature(cid) then return true end
            local pos = getThingPosWithDebug(target)
            local mps = getThingPosWithDebug(cid)
            local xrg = math.floor((pos.x - mps.x) / 2)
            local topos = mps
            topos.x = topos.x + xrg
            local rd = 7
            topos.y = topos.y - rd
            doSendDistanceShoot(getThingPosWithDebug(cid), topos, 125) -- 39
            addEvent(doRockFall, rd * 49, cid, topos, target)
        end     
        addEvent(doRockUp, 155, cid, target)
        
    elseif spell == "Sand Tomb" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 34
        ret.check = 0
        ret.spell = spell
        ret.cond = "Miss"
        
        doMoveInAreaMulti(cid, 22, 158, bullet, bulletDano, GROUNDDAMAGE, min, max, ret)
        
    elseif spell == "Magnet Bomb" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 48
        ret.check = 0
        ret.spell = spell
        ret.cond = "Miss"
        
        doMoveInAreaMulti(cid, 22, 171, bullet, bulletDano, ELECTRICDAMAGE, min, max, ret)
    
    elseif spell == "White Smoke" then  
    
        local function gas(cid)
            doMoveInArea2(cid, 396, confusion, FIREDAMAGE, min, max, spell)
        end
        
        times = {0, 500, 1000, 1500, 2300, 2800}
        
        for i = 1, #times do
            addEvent(gas, times[i], cid) 
        end
        
    elseif spell == "Healing Wish" then
        
        local min = (getCreatureMaxHealth(cid) * 40) / 100
        local max = (getCreatureMaxHealth(cid) * 65) / 100
        
        local function doHealArea(cid, min, max)
            local amount = math.random(min, max)
            if (getCreatureHealth(cid) + amount) >= getCreatureMaxHealth(cid) then
                amount = -(getCreatureHealth(cid)-getCreatureMaxHealth(cid))
            end
            if getCreatureHealth(cid) ~= getCreatureMaxHealth(cid) then
                doCreatureAddHealth(cid, amount)
                doSendAnimatedText(getThingPosWithDebug(cid), "+"..amount.."", 65)
            end
        end
    
        local function doCure(cid)
            if not isCreature(cid) then return true end
            if isSummon(cid) then 
                doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
            end
            doCureStatus(cid, "all")
        end

    
        local pos = getPosfromArea(cid, HealWish)
        local n = 0
        doHealArea(cid, min, max)
        doCure(cid)
        
        while n < #pos do
            n = n+1
            thing = {x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=253}
            local pid = getThingFromPosWithProtect(thing)
            doSendMagicEffect(pos[n], 13)
            addEvent(doSendMagicEffect, 200, pos[n], 14)            
            if isCreature(pid) then
                if isSummon(cid) and (isSummon(pid) or isPlayer(pid)) then
                    if canAttackOther(cid, pid) == "Cant" then
                        doHealArea(pid, min, max)
                    --  doCure(pid)                     
                    end 
                elseif ehMonstro(cid) and ehMonstro(pid) then
                    doHealArea(pid, min, max)
                    -- doCure(pid)  
                end
            end 
        end
        
    elseif spell == "Rain Dance" then
        
        local master = isSummon(cid) and getCreatureMaster(cid) or cid
        ------------
        local ret = {}
        ret.id = 0
        ret.cd = 6 -- 9
        ret.check = 0
        ret.eff = 1
        ret.cond = "Silence"
        ---
        local function doFall(cid)
            for rocks = 1, 42 do --62
                -- addEvent(fall, rocks*35, cid, master, WATERDAMAGE, 52, 1)
                addEvent(fall, rocks*35, cid, master, WATERDAMAGE, 98, 488)
                addEvent(fall, rocks*43, cid, master, WATERDAMAGE, 98, 1) -- 98 em branco 
            end
        end
        ---
        local function doRain(cid)
            if isSummon(cid) then 
                doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
            end --cura status
            doCureStatus(cid, "all")
            ---
            setPlayerStorageValue(cid, 253, 1) --focus
            doSendMagicEffect(getThingPosWithDebug(cid), 132)
            ---
            doMoveInArea2(cid, 0, confusion, WATERDAMAGE, 0, 0, spell, ret)
        end
        
        if getCreatureName(cid) == "Ludicolo" then
            doRaiseStatus(cid, 0, 0, 300, 5) 
        end 
        
        if getCreatureName(cid) == "Castform" then
            addEvent(doTransformCastform, 1350, cid, "Water")
            setPlayerStorageValue(getCreatureMaster(cid), 141410, 1)
            addEvent(setPlayerStorageValue, 2200, getCreatureMaster(cid), 141410, -1)   
        end         
        
        ---
        addEvent(doFall, 200, cid)
        addEvent(doRain, 1000, cid)
        
        
    elseif spell == "Night Slash" then
        
        local p = getThingPosWithDebug(cid)
        --[[
        local t = {
            {251, {x = p.x+1, y = p.y-1, z = p.z}},
            {253, {x = p.x+2, y = p.y+1, z = p.z}},
            {252, {x = p.x+1, y = p.y+2, z = p.z}},
            {254, {x = p.x-1, y = p.y+1, z = p.z}},
        }
        --]]
        local t = {
            {462, {x = p.x+1, y = p.y-1, z = p.z}},
            {460, {x = p.x+2, y = p.y+1, z = p.z}},
            {459, {x = p.x+1, y = p.y+2, z = p.z}},
            {461, {x = p.x-1, y = p.y+1, z = p.z}},
        }
        doAreaCombatHealth(cid, DARKDAMAGE, p, scyther5, -min, -max, 165) 
        for a = 0, 1 do
            for i = 1, 4 do
                addEvent(doSendMagicEffect, a*400, t[i][2], t[i][1]) --alterado v1.8
            end
        end
        addEvent(doAreaCombatHealth, 400, cid, DARKDAMAGE, p, scyther5, -min, -max, 165) 
        
    elseif spell == "Wild Charge" then -- fazer um ataque dark igual esse só q com effect 679
        
        eff2 = 48
        if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) then
            eff2 = 641
        elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, getSubName(cid, target)) then 
            eff2 = 979 -- fazer um ataque dark igual esse só q com effect 679
        end 
        
        local ret = {} 
        ret.id = 0
        ret.cd = 9
        if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) then
            ret.eff = 641
        elseif isInArray({"Shiny Lanturn", "Shiny Magneton"}, getSubName(cid, target)) then 
           ret.eff = 979
        else
            ret.eff = 48
        end
        ret.check = 0
        ret.spell = spell
        ret.cond = "Stun"
        
        local pos = getThingPosWithDebug(cid)
        local areas = {rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1}
        
        for i = 0, 14 do
            addEvent(doMoveInArea2, i*320, cid, eff2, areas[i+1], ELECTRICDAMAGE, min, max, spell, ret)
            addEvent(doMoveInArea2, i*330, cid, eff2, areas[i+1], ELECTRICDAMAGE, 0, 0, spell)
        end
        
    elseif spell == "Focus Blast" then -- refazer, no anime lançam uma bola azul, exceto machoke, lança um kamehamehá amarelo
        
        local ret = {} 
        ret.id = 0
        ret.cd = 9
        ret.eff = 136
        ret.check = 0
        ret.spell = spell
        ret.cond = "Confusion"
        
        local pos = getThingPosWithDebug(cid)
        local areas = {rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1}
        
        for i = 0, 14 do
            addEvent(doMoveInArea2, i*320, cid, 112, areas[i+1], FIGHTINGDAMAGE, min, max, spell, ret)
            addEvent(doMoveInArea2, i*330, cid, 112, areas[i+1], FIGHTINGDAMAGE, 0, 0, spell)
        end
        
    elseif spell == "Jump Kick" then --ver essa
        
        if isInArray({"Elite Hitmonlee", "Shiny Hitmonlee"}, getSubName(cid, target)) then  
            doMoveInAreaMulti(cid, 42, 651, bullet, bulletDano, FIGHTINGDAMAGE, min, max)
        elseif isInArray({"Elite Hitmonlee", "Shiny Hitmonlee"}, getSubName(cid, target)) then  
            doMoveInAreaMulti(cid, 42, 652, bullet, bulletDano, FIGHTINGDAMAGE, min, max)
        else
            doMoveInAreaMulti(cid, 42, 113, bullet, bulletDano, FIGHTINGDAMAGE, min, max)
        end
        
        --elseif spell == "Lava Plume" then --alterado v1.8 \/\/\/
        
        --doMoveInArea2(cid, 5, cross, FIREDAMAGE, -min, -max, spell)
        --doMoveInArea2(cid, 87, cross, FIREDAMAGE, 0, 0, spell)
        
    elseif spell == "Silver Wind" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        doDanoWithProtectWithDelay(cid, target, BUGDAMAGE, min, max, 78, SilverWing)
        
    elseif spell == "Bug Buzz" then 
        
        local ret = {}
        ret.id = target
        ret.cd = 9
        ret.eff = 34
        ret.check = 0
        ret.spell = spell
        ret.cond = "Stun" 
        
        doMoveInArea2(cid, 86, db1, BUGDAMAGE, min, max, spell, ret)
        addEvent(doMoveInArea2, 250, cid, 86, db1, BUGDAMAGE, 0, 0, spell)
        
    elseif spell == "Whirlpool" then -- refazer
        
        local function setSto(cid)
            if isCreature(cid) then
                setPlayerStorageValue(cid, 3644587, -1)
            end
        end
        
        local function doDano(cid)
            if isSleeping(cid) then return true end
            doDanoWithProtect(cid, WATERDAMAGE, getThingPosWithDebug(cid), splash, min, max, 89)
        end
        
        setPlayerStorageValue(cid, 3644587, 1)
        for r = 0, 10 do 
            addEvent(doDano, 600 * r, cid)
        end
        addEvent(setSto, 600*10, cid)
        
        
    elseif spell == "GroundshockK" then 
        
        local function setSto(cid)
            if isCreature(cid) then
                setPlayerStorageValue(cid, 3644587, -1)
            end
        end
        
        local function doDano(cid)
            if isSleeping(cid) then return true end
            doDanoWithProtect(cid, GROUNDDAMAGE, getThingPosWithDebug(cid), splash, min, max, 118)
        end
        
        setPlayerStorageValue(cid, 3644587, 1)
        for r = 0, 1 do 
            addEvent(doDano, 600 * r, cid)
        end
        addEvent(setSto, 600*10, cid)
        
    elseif spell == "Iron Head" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        doDanoInTargetWithDelay(cid, target, STEELDAMAGE, -min, -max, 77) 
        
        
    elseif spell == "Volcano Burst" then
        
        local pos = getThingPosWithDebug(cid)
        
        doMoveInArea2(cid, 91, inferno1, FIREDAMAGE, 0, 0, spell)
        addEvent(doDanoWithProtect, math.random(100, 400), cid, FIREDAMAGE, pos, inferno2, -min, -max, 0)
        
    elseif spell == "Bone Rush" then
        
        local area = {gale1, gale2, gale3, gale4, gale3, gale2, gale1}
        
        for i = 0, 6 do
            addEvent(doMoveInArea2, i*400, cid, 227, area[i+1], ROCKDAMAGE, min, max, spell)
        end 
        
    elseif spell == "Hammer Arm" then
        
        
        local ret = {}
        ret.id = 0
        ret.cd = 6
        ret.eff = 88
        ret.check = getPlayerStorageValue(target, conds["Stun"])
        ret.spell = spell
        ret.cond = "Stun"
        
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {92, {x=p.x, y=p.y, z=p.z}},
            [1] = {94, {x=p.x+2, y=p.y, z=p.z}}, 
            [2] = {95, {x=p.x+1, y=p.y+2, z=p.z}},
            [3] = {93, {x=p.x, y=p.y, z=p.z}}, 
        }
        
        doMoveInArea2(cid, 0, HammerArm, FIGHTINGDAMAGE, min, max, spell, ret) -- BrickBeak
        doSendMagicEffect(t[a][2], t[a][1])
        
        
        
        
        --/////////////////////// Criando novas spells, Sam /////////////////////////--
        
        
    elseif spell == "Fury Punches" then
        
        addEvent(doDanoWithProtect, 150, cid, FIGHTINGDAMAGE, getThingPosWithDebug(cid), grassarea, -min, -max, 0)
        
        local pos = getThingPosWithDebug(cid)
        
        local function doSendLeafStorm(cid, pos) --alterado!!
            if not isCreature(cid) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), pos, 26)
        end
        
        for a = 1, 100 do
            local lugar = {x = pos.x + math.random(-6, 6), y = pos.y + math.random(-5, 5), z = pos.z}
            addEvent(doSendLeafStorm, a * 2, cid, lugar)
        end
        
        
    elseif spell == "Dragon Flight" then 
        
        sendEffWithProtect(cid, getThingPosWithDebug(cid), 211)
        local function doSkyUpper(cid, target)
            if not isCreature(cid) or not isCreature(target) then return false end
    --  local newPos = getClosestFreeTile(target, p)        
    --      local x = getClosestFreeTile(cid, getThingPosWithDebug(target))
            doTeleportThing(cid, getPosByDir(getClosestFreeTile(cid, getThingPosWithDebug(target)), math.random(0, 12)), false)
    --      doTeleportThing(cid, getPosByDir(getThingPosWithDebug(target), math.random(0, 11)), false)
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 5) --20
            doDanoInTargetWithDelay(cid, target, DRAGONDAMAGE, min, max, 141)       --111
            return true
        end
        addEvent(doSkyUpper, 200, cid, target)
        addEvent(sendEffWithProtect, 300, cid, getThingPosWithDebug(cid), 211)
        addEvent(doSkyUpper, 500, cid, target)
        addEvent(sendEffWithProtect, 700, cid, getThingPosWithDebug(cid), 211)
        addEvent(doSkyUpper, 1000, cid, target)
        addEvent(sendEffWithProtect, 1050, cid, getThingPosWithDebug(cid), 211)
        addEvent(doSkyUpper, 1400, cid, target)
        
        
    elseif spell == "Shadow Impact" then
        
        local pos = getThingPosWithDebug(cid)
        local areas = {rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1}
        
        for i = 0, 9 do
            addEvent(doMoveInArea2, i*400, cid, 140, areas[i+1], GHOSTDAMAGE, min, max, spell)
        end
        
        
    elseif spell == "Leaf Blades" then
        
        local eff = {240, 240, 240, 240}
        
        for rocks = 1, 32 do
            addEvent(fall, rocks*22, cid, master, GRASSDAMAGE, -1, eff[math.random(1, 4)])
        end
        addEvent(doMoveInArea2, 500, cid, 0, BigArea2, GRASSDAMAGE, min, max, spell) 
        
        
    elseif spell == "Grass Knot" then
        
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area, eff, area2)
            if isCreature(cid) then 
                --if not isSightClear(p, area, false) then return true end
                if not isWalkable(area) then return true end
                if isInArray(waters, getTileInfo(area).itemid) then return true end
                
                doAreaCombatHealth(cid, GRASSDAMAGE, area, whirl3, -min, -max, 728)
                doAreaCombatHealth(cid, GRASSDAMAGE, area, whirl3, 0, 0, 497)
                doTeleportThing(cid, area)
                
            end
        end
        
        for a = 0, 5 do
            
            local t = {
                [0] = {0, {x=p.x, y=p.y-(a+1), z=p.z}, {x=p.x + 1,y=p.y-(a+1), z=p.z}},
                [1] = {0, {x=p.x+(a+1), y=p.y, z=p.z}, {x=p.x+(a+1) + 1, y=p.y + 1, z=p.z}},
                [2] = {0, {x=p.x, y=p.y+(a+1), z=p.z}, {x=p.x + 1, y=p.y+(a+1) + 1, z=p.z}},
                [3] = {0, {x=p.x-(a+1), y=p.y, z=p.z}, {x=p.x-(a+1), y=p.y + 1, z=p.z}}
            } 
            doCreatureSetNoMove(cid, true)
            addEvent(sendAtk, 120*a, cid, t[d][2], t[d][1], t[d][3])
            addEvent(doCreatureSetNoMove, 1000, cid, false)
        end
        
        
    elseif spell == "Silver Gale" then -- tempestade de prata
        
        local function hurricane(cid, areaDmg)
            if not isCreature(cid) then return true end
            if isSleeping(cid) and getPlayerStorageValue2(cid, 3644587) >= 1 then return false end
            if isWithFear(cid) and getPlayerStorageValue2(cid, 3644587) >= 1 then return true end
            doMoveInArea2(cid, 78, areaDmg, FLYINGDAMAGE, min, max, spell)
        end 
        areas1 = {Wheel1, Wheel2, Wheel3, Wheel4, Wheel5, Wheel6, Wheel7, Wheel8, Wheel1}
        for i = 0, 8 do
            addEvent(hurricane, i*350, cid, areas1[i+1]) --alterado v1.4
        end
        
    elseif spell == "Frost Breath" then
        
        local flamepos = getThingPosWithDebug(cid)
        local effect = 255
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        if a == 0 then
            flamepos.x = flamepos.x+1
            flamepos.y = flamepos.y-1
            effect = 425
        elseif a == 1 then
            flamepos.x = flamepos.x+3
            flamepos.y = flamepos.y+1
            effect = 426
        elseif a == 2 then
            flamepos.x = flamepos.x+1
            flamepos.y = flamepos.y+3
            effect = 427
        elseif a == 3 then
            flamepos.x = flamepos.x-1
            flamepos.y = flamepos.y+1
            effect = 428
        end
        
        doMoveInArea2(cid, 17, flamek, ICEDAMAGE, min, max, spell)
        doSendMagicEffect(flamepos, effect) 
        
        
    elseif spell == "Dig" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 0
        ret.spell = spell
        ret.cond = "Slow"
        
        doDisapear(cid)
        doCreatureSetNoMove(cid, true)
        setPlayerStorageValue(cid, 32698, 1) -- storage do silence
        addEvent(setPlayerStorageValue, 4001, cid, 32698, -1) -- storage do silence
        addEvent(doCreatureSetNoMove, 4000, cid, false)
        p = getThingPosWithDebug(cid)
        doSendMagicEffect({x = p.x, y = p.y, z = p.z}, 531) -- 102
        if isMonster(cid) then
            local pos = getThingPosWithDebug(cid)
            doTeleportThing(cid, {x=4, y=3, z=10}, false) --
            doTeleportThing(cid, pos, false)
        end
        local function doDig(cid)
            if not isCreature(cid) then return false end
            doSendMagicEffect(getThingPos(cid), 531) -- 102
            --  addEvent(doMoveInArea2, 300, cid, 118, confusion, GROUNDDAMAGE, 0, 0) -- 118
            addEvent(doMoveInArea2, 300, cid, 698, confusion, GROUNDDAMAGE, min, max, spell, ret) -- 118
            return true
        end
        addEvent(doAppear, 4000, cid)
        addEvent(doDig, 4100, cid)
        
        --[[
    elseif spell == "Vine Hook" then 
        
        if getSubName(cid, target) == "Tangrowth" then
            local eff = 493
        else
            local eff = 104
        end
        sendDistanceShootWithProtect(cid, getThingPosWithDebug(cid), getThingPosWithDebug(target), 14)
        sendEffWithProtect(cid, getThingPosWithDebug(target), eff)
        addEvent(doTeleportThing, 200, target, getClosestFreeTile(cid, getThingPosWithDebug(cid)), true)
        addEvent(sendDistanceShootWithProtect, 200, cid, getThingPosWithDebug(target), getThingPosWithDebug(cid), 14)
        addEvent(sendEffWithProtect, 200, cid, getThingPosWithDebug(target), eff)
        
        --]]
        
    elseif spell == "Constrict Wave" then
        local ret = {}
        ret.id = 0
        ret.cd = 5 --alterado v1.6
        ret.eff = 104
        ret.check = 0
        ret.first = true
        ret.cond = "Paralyze"
        
        if getSubName(cid, target) == "Tangrowth" then
            ret.eff = 493
            doMoveInArea2(cid, 493, reto5, SEED_BOMBDAMAGE, min, max, spell, ret)
        elseif getSubName(cid, target) == "Tangela" then
            ret.eff = 518
            doMoveInArea2(cid, 518, reto5, SEED_BOMBDAMAGE, min, max, spell, ret)        
        else
            doMoveInArea2(cid, 104, reto5, SEED_BOMBDAMAGE, min, max, spell, ret)
        end
        
        
        
    elseif spell == "Constrict Prison" then
        
        local ret = {}
        ret.id = 0
        ret.check = 0
        ret.cd = 5
        ret.eff = 104
        ret.first = true
        ret.cond = "Paralyze"
        
        --addEvent(doMoveInArea2, i * 1000, cid, 104, selfArea1, SEED_BOMBDAMAGE, min, max, spell, ret)
        for i = 0, 2 do
            if getSubName(cid, target) == "Tangrowth" then
                ret.eff = 493
                addEvent(doMoveInArea2, i * 1000, cid, 493, selfArea1, SEED_BOMBDAMAGE, min, max, spell, ret)
            elseif getSubName(cid, target) == "Tangela" then
                ret.eff = 518
                addEvent(doMoveInArea2, i * 1000, cid, 518, selfArea1, SEED_BOMBDAMAGE, min, max, spell, ret)   
            else
                addEvent(doMoveInArea2, i * 1000, cid, 104, selfArea1, SEED_BOMBDAMAGE, min, max, spell, ret)
            end
        end
        
        
    elseif spell == "Extrasensory" then
        
        local master = getCreatureMaster(cid) or 0
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 0
        ret.check = 0
        ret.spell = spell
        ret.cond = "Miss"
        
        for rocks = 1, 42 do
            addEvent(fall, rocks*35, cid, master, psyDmg, -1, 238)
        end
        
        addEvent(doMoveInArea2, 500, cid, 0, BigArea2, psyDmg, min, max, spell, ret)
        
        
    elseif spell == "Aura Sphere" then
        
        doSendDistanceShoot(getThingPosWithDebug(cid), posT1, 111) -- 113
        doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 355) -- 21
        
    elseif spell == "Aura Storm" then
        
        local effD = 57 --55 vermelho
        local eff = 400 
        local master = isSummon(cid) and getCreatureMaster(cid) or cid
        
        local function doFall(cid)
            for rocks = 5, 42 do
                addEvent(fall, rocks*35, cid, master, FIGHTHINGDAMAGE, effD, eff)
            end
        end
        
        for up = 1, 10 do
            addEvent(upEffect, up*75, cid, effD)
        end
        addEvent(doFall, 450, cid)
        addEvent(doDanoWithProtect, 1400, cid, FIGHTHINGDAMAGE, getThingPosWithDebug(cid), waterarea, -min, -max, 0)
        
        --[[ -- Olhar essa spell e aproveitar(ideias) para outras \|/ (lista de efeitos random, olhar tbm o psyusion)
    elseif spell == "Zangoose Fury" then V
        
        local eff = {236, 232, 233, 224} --local eff = {16, 221, 223, 243}
        
        for rocks = 1, 32 do
            addEvent(fall, rocks*22, cid, master, NORMALDAMAGE, -1, eff[math.random(1, 4)])
        end
        
        addEvent(doMoveInArea2, 500, cid, 0, BigArea2, NORMALDAMAGE, min, max, spell) 
        --]]
        
    elseif spell == "Elemental" then

        local types = {
            ["dark"] = {efct = 87, dmg = DARKDAMAGE},
            ["ghost"] = {efct = 138, dmg = GHOSTDAMAGE},
            ["poison"] = {efct = 114, dmg = POISONDAMAGE},
            ["grass"] = {efct = 45, dmg = GRASSDAMAGE},
            ["bug"] = {efct = 105, dmg = BUGDAMAGE},
            ["rock"] = {efct = 44, dmg = ROCKDAMAGE},
            ["ground"] = {efct = 100, dmg = GROUNDDAMAGE},
            ["steel"] = {efct = 77, dmg = STEELDAMAGE},
            ["ice"] = {efct = 43, dmg = ICEDAMAGE},
            ["water"] = {efct = 154, dmg = WATERDAMAGE},
            ["electric"] = {efct = 48, dmg = ELECTRICDAMAGE},
            ["fire"] = {efct = 35, dmg = FIREDAMAGE},
            ["psychic"] = {efct = 133, dmg = PSYCHICDAMAGE},
            ["flying"] = {efct = 41, dmg = FLYINGDAMAGE},
            ["dragon"] = {efct = 143, dmg = DRAGONDAMAGE},
            ["normal"] = {efct = 111, dmg = NORMALDAMAGE},
            ["fighting"] = {efct = 112, dmg = FIGHTINGDAMAGE},
        }

        local ptype = pokes[getCreatureName(cid)].type
        local ptype2 = pokes[getCreatureName(cid)].type2
        local eff = {}
        local damag = {}

        if ptype2 ~= "no type" then
            local math = math.random(1,100)
            if math <= 50 then
                eff = types[ptype].efct
                damag = types[ptype].dmg
            else
                eff = types[ptype2].efct
                damag = types[ptype2].dmg
            end
        else
            eff = types[ptype].efct
            damag = types[ptype].dmg
        end

        local function sendStickEff(cid, dir)
            if not isCreature(cid) then return true end
           doAreaCombatHealth(cid, damag, getPosByDir(getThingPosWithDebug(cid), dir), 0, -5000, -5000, eff)
        end

        local function doStick(cid)
            if not isCreature(cid) then return true end
            local t = {
                  [1] = SOUTHWEST,
                  [2] = SOUTH,
                  [3] = SOUTHEAST,
                  [4] = EAST,
                  [5] = NORTHEAST,
                  [6] = NORTH,
                  [7] = NORTHWEST,
                  [8] = WEST,
                  [9] = SOUTHWEST,
            }
            for a = 1, 9 do
                addEvent(sendStickEff, a * 200, cid, t[a])
            end
        end
        
        stopNow(cid, 1800)
        doStick(cid, false, cid)
   
    -- X elemental --   

        
    elseif spell == "Water Fury" then -- Usar como um ataque dragon, talvez com outro nome, Dragon Rage/Fury, Elemental Fury sla
        
        local pos = getThingPosWithDebug(cid)
        local poss = getThingPosWithDebug(cid)
        poss.x = poss.x+1
        poss.y = poss.y+1
        
        local function doSendBubble(cid, pos)
            if not isCreature(cid) then return true end
            if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
            if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
            doSendMagicEffect(poss, 241) 
            doSendMagicEffect(pos, 53)
            doSendMagicEffect(pos, 154)
            doSendMagicEffect(pos, 1)
            doSendMagicEffect(pos, 68)
            addEvent(doSendDistanceShoot, 950, getThingPosWithDebug(cid), pos, 2)    -- doSendDistanceShoot(getThingPosWithDebug(cid), pos, 2)
            
            addEvent(doSendMagicEffect, 1100, pos, 248) --  doSendMagicEffect(pos, 53)
            addEvent(doSendMagicEffect, 1200, pos, 53)
            addEvent(doSendMagicEffect, 1210, pos, pos, 154)
            addEvent(doSendMagicEffect, 1220, pos, pos, 1)
            addEvent(doDanoWithProtect, 40, cid, DRAGONDAMAGE, pos, waterarea, -min, -max, 0)   -- mudar a area (em volta pequena)
        end
        --alterado!!
        for a = 1, 20 do
            local lugar = {x = pos.x + math.random(-4, 4), y = pos.y + math.random(-3, 3), z = pos.z}
            addEvent(doSendBubble, a * 25, cid, lugar)
        end
        addEvent(doDanoWithProtect, 280, cid, WATERDAMAGE, pos, waterarea, -min, -max, 0)
        
        
        -- Estudar a function usada em Multi-Punch / Hi Jump Kick
        
    elseif spell == "Scald" then 
        
        local flamepos = getThingPosWithDebug(cid)
        local effect = 255
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        if a == 0 then -- /\
            flamepos.x = flamepos.x+1
            flamepos.y = flamepos.y-1
            effect = 292
        elseif a == 1 then -- leste(east) ->
            flamepos.x = flamepos.x+3
            flamepos.y = flamepos.y+1
            effect = 295
        elseif a == 2 then -- \/
            flamepos.x = flamepos.x+1
            flamepos.y = flamepos.y+3
            effect = 293
        elseif a == 3 then -- oeste <-
            flamepos.x = flamepos.x-1
            flamepos.y = flamepos.y+1
            effect = 294
        end
        
        doMoveInArea2(cid, 396, flamek, WATERDAMAGE, min, max, spell) -- fumaça do scald
        doSendMagicEffect(flamepos, effect) 
        doBurnPoke(cid, target)
        
        
    elseif spell == "Song Burst" then
        
        local ret = {} 
        ret.id = 0
        ret.cd = 9
        ret.eff = 39
        ret.check = 0
        ret.spell = spell
        ret.cond = "Miss"
        
        local pos = getThingPosWithDebug(cid)
        --local areas = {rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1, rock5, rock4, rock3, rock2, rock1} -- invertido, igual wild charge.
        local areas = {rock1, rock2, rock3, rock4, rock5, rock1, rock2, rock3, rock4, rock5} -- fiz ao contrário do wild charge
        
        
        for i = 0, 14 do
            addEvent(doMoveInArea2, i*320, cid, 39, areas[i+1], NORMALDAMAGE, min, max, spell, ret) --48
            addEvent(doMoveInArea2, i*330, cid, 22, areas[i+1], NORMALDAMAGE, min, max, spell, ret)
        end
        
        
    elseif spell == "Metal Sound" then
        
        local areas = {rock1, rock2, rock3, rock4, rock5, rock4, rock3, rock2, rock1}
        for i = 0, 8 do
            addEvent(doMoveInArea2, i*400, cid, 499, areas[i+1], STEELDAMAGE, min, max, spell)
            doMoveInArea2(cid, 499, selfArea1, STEELDAMAGE, min, max, spell, ret) 
            addEvent(doMoveInArea2, i*410, cid, 499, areas[i+1], STEELDAMAGE, min, max, spell)
        end
        
    elseif spell == "Energy Ball" then -- doDanoInTargetWithDelay, comparar essa spell com o aura sphere, testar essa function.
        
        -- mudar effect e fazer um missile (recolor)
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 19)
        doDanoInTargetWithDelay(cid, target, GRASSDAMAGE, min, max, 105)
        
        
        -- testar ainda \/ -- tem q fazer a venom shock
    elseif spell == "Poison Shock" then --dano em reta3, arrumar, criar outra. usar de base pra varias spells, plantas e pedras saindo do chão
        
        local p = getThingPosWithDebug(cid) -- Criar PSYCHO CUT com recolor do efeito 489, e soltar mais rapido o effect 
        -- fazer uma outfit pro absol com chifre brilhando rosa quando suar Psycho Cut
        
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area, areaEff, eff)
            
            if isCreature(cid) then
                
                --if not isSightClear(p, area, false) then return true end
                doAreaCombatHealth(cid, POISONDAMAGE, areaEff, 0, 0, 0, eff)
                
                doAreaCombatHealth(cid, POISONDAMAGE, area, whirl3, -min, -max, 105) --542(plight) nn sei se esse é o effect nem se a spell é assim no PxG 
                doAreaCombatHealth(cid, POISONDAMAGE, area, whirl3, 0, 0, 20) --(nem se existe) 
            end
            
        end
        
        for a = 0, 5 do
            
            local t = {
                
                [0] = {489, {x=p.x, y=p.y-(a+1), z=p.z}, {x=p.x+1, y=p.y-(a+1), z=p.z}},
                
                [1] = {489, {x=p.x+(a+1), y=p.y, z=p.z}, {x=p.x+(a+1), y=p.y+1, z=p.z}}, --152
                
                [2] = {489, {x=p.x, y=p.y+(a+1), z=p.z}, {x=p.x+1, y=p.y+(a+1), z=p.z}},
                
                [3] = {489, {x=p.x-(a+1), y=p.y, z=p.z}, {x=p.x-(a+1), y=p.y+1, z=p.z}}
            }
            
            addEvent(sendAtk, 325*a, cid, t[d][2], t[d][3], t[d][1])
            
        end 
        
        
        -- Fazer Spells de Vento sem usar furacões...
        
    elseif spell == "Astonish" then             
        doDanoWithProtect(cid, GHOSTDAMAGE, PosCid1, selfArea2, min, max, 411)      
        
    elseif spell == "Shadow Sphere" then
        local pos = getThingPosWithDebug(target)
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 106) 
        addEvent(doDanoWithProtect, 200, cid, GHOSTDAMAGE, getThingPosWithDebug(target), waba, min, max, 0) 
        addEvent(doSendMagicEffect, 195, {x = pos.x + 2, y = pos.y + 2, z = pos.z}, 401)        
        
    elseif spell == "Ice Ball" then -- Pxg só falta deixar o Paralyze funcionando. Vou fazer um missile(bola de gelo tbm) , melhor fazer uma pequena chance de congelar, tentar usar outro effect menor de congelado
        
        local ret = {}
        ret.id = target
        ret.cd = 3 
        ret.eff = 0
        ret.check = 0
        ret.first = true
        ret.cond = "Paralyze"   
        local ret2 = {}
        ret2.id = target
        ret2.cd = 3
        ret2.check = 0
        ret2.eff = 255
        ret2.spell = spell
        ret2.cond = "Silence"   
        
        
        doSendDistanceShoot(posC, posT, 95) 
        addEvent(doDanoInTargetWithDelay, 200, cid, target, ICEDAMAGE, min, max)
        addEvent(doSendMagicEffect, 220, posT1, 576)    
        
        addEvent(doMoveDano2, 195, cid, target, NORMALDAMAGE, 0, 0, ret, spell) -- só pra aplicar o paralyze (sem dano nem efeito)
        addEvent(doMoveDano2, 195, cid, target, NORMALDAMAGE, 0, 0, ret2, spell) 
        
        
        
        --[[ addEvent(doSendMagicEffect, 615, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 563)   
        addEvent(doSendMagicEffect, 1025, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 563)   
        addEvent(doSendMagicEffect, 1432, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 563)   
        addEvent(doSendMagicEffect, 1845, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 563)   
        addEvent(doSendMagicEffect, 2260, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 563)   
        addEvent(doSendMagicEffect, 2665, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 563)   
        addEvent(doSendMagicEffect, 3071, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 563)   
        addEvent(doSendMagicEffect, 3485, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 563)   
        addEvent(doSendMagicEffect, 3897, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 563)   
        addEvent(doSendMagicEffect, 4305, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 563)   
        addEvent(doSendMagicEffect, 4715, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 563)   
        addEvent(doSendMagicEffect, 5130, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 563)   
        addEvent(doSendMagicEffect, 5545, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 563)   
        ]]  
        
    elseif spell == "Wood Hammer" then
        local pos = getThingPosWithDebug(target)
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)    
        addEvent(doDanoInTargetWithDelay, 100, cid, target, GRASSDAMAGE, min, max)
        addEvent(doSendMagicEffect, 75, pos, 418)
        
        
    elseif spell == "Lightning Horn" then -- Deixei com dano em area, não tenho ctz 
        local pos = getThingPosWithDebug(target)
        addEvent(doDanoWithProtect, 200, cid, ELECTRICDAMAGE, getThingPosWithDebug(target), waba, min, max, 0)  
        addEvent(doSendMagicEffect, 199, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 393)    
        
        
    elseif spell == "Incinerate" then
        local pos = getThingPosWithDebug(target)
        
        if getSubName(cid, target) == "Rapidash" and getPlayerStorageValue(cid, 90177) >= 1 then        
            eff = 721
        else
            eff = 389
        end
        
        addEvent(doDanoInTargetWithDelay, 50, cid, target, FIREDAMAGE, min, max)
        addEvent(doSendMagicEffect, 20, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, eff) 
        
        
        
    elseif spell == "Bullet Seed" then
        
        local function doIce(cid, target)
            if not isCreature(cid) or not isCreature(target) then return false end
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 1)
            doDanoInTargetWithDelay(cid, target, GRASSDAMAGE, min, max, 403) 
            return true
        end
        
        local Sparks = math.random(2, 9) -- Giro aleatorio entre 2 e 9  
        
        if Sparks >= 7 then -- caso giro caia em 7, 8 ou 9:
            local Sparks = math.random(4, 9) -- ele gira dnv entre 4 e 9, diminuindo a chance de cair numeros altos (7, 8 e 9)
            
            if Sparks == 9 then
                local Sparks = math.random(8, 9)
            end
        end
        
        for i = 1, Sparks do -- solta de 2 a 9 shots. ("for i =1, 2 do" = 2shots) jay sempre será no Mínimo 2
            
            addEvent(doIce, i*350, cid, target) --300 
        end
        
        
        -- já tem o missile no spr do plight, trocar dps.
    elseif spell == "Ice Sparks" then -- vou criar um missile(fagulhas de gelo) p/ a spell. Falta arrumar o effect nos types
        -- condição do effect padrão do ICEDAMAGE
        local function doIce(cid, target) 
            if not isCreature(cid) or not isCreature(target) then return false end
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 93) -- fazer fagulhas de gelo
            doDanoInTargetWithDelay(cid, target, ICEDAMAGE, min, max, 388) --43
            return true
        end
        
        local Sparks = math.random(2, 5) 
        
        if Sparks >= 5 then -- caso giro caia em 5
            local Sparks = math.random(4, 5) -- ele gira dnv entre 4 e 5, diminuindo a chance de cair 5.
        end
        
        for i = 1, Sparks do 
            addEvent(doIce, i*350, cid, target) --300 
        end 
        
        
    elseif spell == "Ice Shards" then -- SPELL BASE, solta 2 shoots
        
        local function doIce(cid, target)
            if not isCreature(cid) or not isCreature(target) then return false end
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 28)
            doDanoInTargetWithDelay(cid, target, ICEDAMAGE, min, max) --43
            local pos = getThingPosWithDebug(target)
            addEvent(doSendMagicEffect, 200, {x = pos.x + 1, y = pos.y + 1, z = pos.z}, 387)    
            return true
        end
        
        for i = 1, 2 do     
            addEvent(doIce, i*350, cid, target) --300 
        end 
        
        
        -- refazer, usar overheat maneiro com esse effect de fumaça
    elseif spell == "Smog" then -- Causa Slow e Poison, porém poison ainda não funciona(ret) e não sei por 2 debuff(ret)
        
        local eff = 731 -- 316 plight
        
        local function doQuake(cid)
            if not isCreature(cid) then return false end
            if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
            if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
            
            local ret = {}
            ret.id = 0
            ret.cd = 9
            ret.eff = 731
            ret.check = 0
            ret.first = true
            ret.cond = "Slow"
            
            doMoveInArea2(cid, eff, selfArea1, POISONDAMAGE, min, max, spell, ret)
            
            local ret2 = {} -- improvisei, não testei ainda, coloquei outra function e outro "ret2" sem dano nem eff, só pra dar poison
            ret.id = 0
            ret.cd = 9
            ret.eff = 0
            ret.check = 0
            ret.first = true
            ret.cond = "Poison"
            doMoveInArea2(cid, 0, selfArea1, POISONDAMAGE, 0, 0, spell, ret2)
            
        end
        
        --times = {0, 500, 1000, 1500, 2300, 2800, 3300, 3800, 4600, 5100, 5600, 6100, 6900, 7400, 7900, 8200, 9000, 9800}
        times = {0, 700, 1400, 2100, 2800, 3500, 4200, 4900} 
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 10000, cid, 3644587, -1)
        for i = 1, #times do --alterado v1.4
            addEvent(doQuake, times[i], cid)
        end 
        
        
    elseif spell == "Static Shot" then -- sparkline
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local t = {
            [0] = 421, -- /\ -- 58 
            [1] = 423, -- --> x+3 (reto0004)
            [2] = 422, -- \/ y+3 (reto0004)
            [3] = 424, -- <--
        }
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 103
        ret.check = 0
        ret.first = true
        local sorte = math.random(1, 5)
        if sorte >= 3 then
            ret.cond = "Paralyze"
        end
        
        doMoveInArea2(cid, 0, reto2, ELECTRICDAMAGE, min, max, spell, ret) -- reto 2 = tile 1 e 2 (dano)
        addEvent(doMoveInArea2, 60, cid, 0, reto0034, ELECTRICDAMAGE, min, max, spell, ret) --reto0034 = tile 3e4(dano)(tile 1 e 2 nulos(0))
        if a == 1 or a == 2 then
            doMoveInArea2(cid, t[a], reto0004, ELECTRICDAMAGE, 0, 0, spell) -- reto0004 = pos.x+3(direita) e pos.y+3(baixo)
        else
            doMoveInArea2(cid, t[a], reto1, ELECTRICDAMAGE, 0, 0, spell) -- só o effect 
        end
        
        
        
    elseif spell == "Fast Claws" then 
        
        sendEffWithProtect(cid, getThingPosWithDebug(cid), 211)
        local function doSkyUpper(cid, target)
            if not isCreature(cid) or not isCreature(target) then return false end
            doTeleportThing(cid, getPosByDir(getThingPosWithDebug(target), math.random(0, 7)), false)
            --  doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 5) --20
            doDanoInTargetWithDelay(cid, target, STEELDAMAGE, min, max, 431)        --111
            return true
        end
        local function doSkyUpper2(cid, target)
            if not isCreature(cid) or not isCreature(target) then return false end
            doTeleportThing(cid, getPosByDir(getThingPosWithDebug(target), math.random(0, 7)), false)
            --  doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 5) --20
            doDanoInTargetWithDelay(cid, target, STEELDAMAGE, min, max, 0)      --111
            return true
        end 
        local function doSkyUpper3(cid, target)
            if not isCreature(cid) or not isCreature(target) then return false end
            doTeleportThing(cid, getPosByDir(getThingPosWithDebug(target), math.random(0, 7)), false)
            --  doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 5) --20
            doDanoInTargetWithDelay(cid, target, STEELDAMAGE, 0, 0, 0)      --111
            return true
        end     
        addEvent(doSkyUpper, 120, cid, target) -- 200
        addEvent(sendEffWithProtect, 180, cid, getThingPosWithDebug(cid), 211) --300
        addEvent(doSkyUpper2, 240, cid, target) --500
        addEvent(sendEffWithProtect, 300, cid, getThingPosWithDebug(cid), 211) -- 700
        addEvent(doSkyUpper2, 360, cid, target) --1000
        addEvent(sendEffWithProtect, 420, cid, getThingPosWithDebug(cid), 211)
        addEvent(doSkyUpper3, 480, cid, target)
        addEvent(sendEffWithProtect, 540, cid, getThingPosWithDebug(cid), 211)
        addEvent(doSkyUpper3, 600, cid, target)
        addEvent(sendEffWithProtect, 675, cid, getThingPosWithDebug(cid), 211)
        addEvent(doSkyUpper3, 750, cid, target)
        
        
    elseif spell == "Cutting Thrust" then
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {364, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
            [1] = {361, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0}, 
            [2] = {363, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
            [3] = {362, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0}, 
        }
        
        local tzZ = {
            [0] = {30, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
            [1] = {49, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0}, 
            [2] = {9, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
            [3] = {51, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0}, 
        }
        
        local function doTeleportMe(cid, pos)
            if not isCreature(cid) then return true end
            if canWalkOnPos(pos, false, true, true, true, true) then 
                doTeleportThing(cid, pos)
            end
            doAppear(cid)
        end
        
        doMoveInArea2(cid, 0, lucarioDash, NORMALDAMAGE, min, max, spell)
        --doSendMagicEffect(t[a][2], t[a][1])
        doSendMagicEffect(PosC, tzZ[a][1])
        
        local pos = getThingPos(cid)
        doSendMagicEffect(pos, 307)
        doDisapear(cid)
        local x, y = t[a][3], t[a][4]
        pos.x = pos.x + x
        pos.y = pos.y + y   
        --
        addEvent(doSendMagicEffect, 280, PosC, 211)
        --
        addEvent(doTeleportMe, 300, cid, pos)   
        
        local azZ = getThingPosWithDebug(cid)
        local XzZ = {
            {{x = azZ.x+1, y = azZ.y-4, z = azZ.z}, 16}, --norte
            {{x = azZ.x+6, y = azZ.y+1, z = azZ.z}, 221}, --leste
            {{x = azZ.x+1, y = azZ.y+6, z = azZ.z}, 223}, --sul
            {{x = azZ.x-4, y = azZ.y+1, z = azZ.z}, 243}, --oeste
        }
        local poszZ = XzZ[mydir+1]
        for bzZ = 1, 3 do
            addEvent(doSendMagicEffect, bzZ * 70, poszZ[1], poszZ[2])
        end 
        addEvent(doSendMagicEffect, 280, PosC, 211)
        
        
        
        
    elseif spell == "Meditate" then -- fica imune e imóvel por 3 segundos, no fim da execução ele remove status negativos

        function doCure(cid)
            if not isCreature(cid) then return true end
            if isSummon(cid) then 
                doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
            end
            doCureStatus(cid, "all")
        end

    if getCreatureName(cid) == "Meditite" or getCreatureName(cid) == "Charizard" then
        doSetCreatureOutfit(cid, {lookType = 2173}, 3000)
    elseif getCreatureName(cid) == "Medicham" then
        doSetCreatureOutfit(cid, {lookType = 2173}, 3000)
    end
    
        doCure(cid)
        stopNow(cid, 3000)
        setPlayerStorageValue(cid, 5000001, 1)
        addEvent(setPlayerStorageValue, 3000, cid, 5000001, -1) 
        
    elseif spell == "Shed Skin" then -- Faz com que o pokémon cure os status negativos

        function doCure(cid)
            if not isCreature(cid) then return true end
            if isSummon(cid) then 
                doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
            end
            doCureStatus(cid, "all")
        end
    
        doCure(cid) 
        doSendMagicEffect(getThingPosWithDebug(cid), 991)
        
    elseif spell == "Hex" then -- fica imune e imóvel por 3 segundos, no fim da execução ele remove status negativos

        if getCreatureName(cid) == "Dusclops" then
            doSetCreatureOutfit(cid, {lookType = 1845}, 3000)
        elseif getCreatureName(cid) == "Dusknoir" then
            doSetCreatureOutfit(cid, {lookType = 1834}, 3000)   
        end

        doRaiseStatus(cid, 0, 0, 300, 3)    
        setPlayerStorageValue(cid, 5000001, 1)
        addEvent(setPlayerStorageValue, 3000, cid, 5000001, -1)         
        addEvent(doMoveInArea2, 2500, cid, 0, BigArea2, GHOSTDAMAGE, min, max, spell) 
        
    elseif spell == "Static Field" then -- impedir que durmam caso estejam na area eletrizada, e caso estejam dormindo serão acordados
        -- antigo Electric Terrain
        local ret = {}
        ret.id = 0
        ret.cd = 2
        ret.eff = 207 --34
        ret.check = 0
        ret.spell = spell
        ret.cond = "Paralyze"
        
        local function smoke(cid)
            if not isCreature(cid) then return true end
            if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
            if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
            doMoveInArea2(cid, 433, electricTerrain3, ELECTRICDAMAGE, 0, 0) -- corresponde à area confusion, SÓ PARA O EFFECT
            doMoveInArea2(cid, 0, confusion, ELECTRICDAMAGE, 0, 0, spell, ret) -- só para o Paralyze(ret)
        end
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 1000, cid, 3644587, -1) 
        for i = 0, 8 do
            addEvent(smoke, i*650, cid) 
        end
        
        
        
    elseif spell == "Electro Ball" then -- fazer dano em area com chance de paralyze 
        
        if isInArray({"Shiny Lanturn", "Shiny Magneton"}, getSubName(cid, target)) then 
         eff = 980
         distEff = 172
        else
         eff = 541
         distEff = 117
        end
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), distEff) 
        doDanoInTargetWithDelay(cid, target, ELECTRICDAMAGE, min, max, eff)         
        
    elseif spell == "Play Rough" then 
        
        local ret = {}
        ret.id = target
        ret.cd = 1 
        ret.eff = 440
        ret.check = 0
        ret.first = true
        ret.cond = "Paralyze"   
        local ret2 = {}
        ret2.id = target
        ret2.cd = 1
        ret2.check = 0
        ret2.eff = 440
        ret2.spell = spell
        ret2.cond = "Silence"
        
        doSendMagicEffect(getThingPosWithDebug(cid), 211)
        doMoveDano2(cid, target, NORMALDAMAGE, min, max, ret, spell)
        addEvent(doDanoInTargetWithDelay, 200, cid, target, NORMALDAMAGE, min, max, 0)  
        --addEvent(doMoveDano2, 900, cid, target, NORMALDAMAGE, min, max, ret, spell) 
        doMoveDano2(cid, target, NORMALDAMAGE, 0, 0, ret2, spell) -- silence 
        local xx = getClosestFreeTile(cid, getThingPosWithDebug(target))
        doTeleportThing(cid, xx, false)
        doFaceCreature(cid, getThingPosWithDebug(cid))  
        setPlayerStorageValue(cid, 32698, 1) -- storage do silence
        addEvent(setPlayerStorageValue, 1200, cid, 32698, -1) -- storage do silence     
        addEvent(stopNow, 20, cid, 1100)    
        addEvent(doDisapear, 30, cid)    
        addEvent(doAppear, 1040, cid) 
        doSendMagicEffect(posT, 3)  
        doSendMagicEffect(posT, 507) doSendMagicEffect(posT, 142) doSendMagicEffect(posT, 440) doSendMagicEffect(posT, 148)
        addEvent(doSendMagicEffect, 50, posT, 440) -- addEvent(doSendMagicEffect, 70, posT, 440)    
        
    elseif spell == "Shadow Claw" then
        
        doSendMagicEffect(posT1, 478)   
        doDanoInTarget(cid, target, GHOSTDAMAGE, min, max, 0)   
        
    elseif spell == "Drain Punch" then
        
        -- doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        -- doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, -min, -max, 112)
        
        local function getCreatureHealthSecurity(cid)
            if not isCreature(cid) then return 0 end
            return getCreatureHealth(cid) or 0
        end
        local life = getCreatureHealthSecurity(target)
        doSendDistanceShoot(posCid, posTarget, 39) -- coloquei de test (tem no mega punch)
        doAreaCombatHealth(cid, FIGHTINGDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 584) -- trocar p/ o punho azul
        
        local newlife = life - getCreatureHealthSecurity(target) -- Vida "total"(na verdade, vida antes de levar o ataque) - Vida atual(dps de levar o ataque)
        -- ou seja, quantidade de dano causado
        addEvent(doSendMagicEffect, 40, getThingPosWithDebug(cid), 286)
        if newlife >= 1 then
            if isCreature(cid) then
                doCreatureAddHealth(cid, newlife) -- cura na quantidade de dano causada no target
            end
            doSendAnimatedText(getThingPosWithDebug(cid), "+"..newlife.."", 32)
        end 
        
        
        -- fazer passiva Illusion , shredder team passivo, usar número aleatório de clones, misdreavus tem a passiva e mais alguns ai.
        
        -- refazer e Whirlpool
        
        -- fazer Softboiled (cura)
        
        
        
    elseif spell == "Seed Burst" then -- antigo Bullet Seed
        --cid, effDist, effDano, areaEff, areaDano, element, min, max
        doMoveInAreaMulti(cid, 1, 503, bullet, bulletDano, GRASSDAMAGE, min, max)
        
        
    elseif spell == "Leaf Storm" then
        local eff = {245, 497, 507, 245, 496, 165} --245 497 480 307(fumaça)
        local eff2 = {167, 245, 168, 245} -- 167(aura furacão) 168(aura folha) 165(aura cinza)
        local eff3 = {307, 245, 496}
        --local eff4 = {245, 497, 245}
        
        for rocks = 1, 32 do
            addEvent(fall, rocks*22, cid, master, GRASSDAMAGE, -1, eff[math.random(1, 6)])
            addEvent(fall, rocks*23, cid, master, GRASSDAMAGE, -1, eff2[math.random(1, 4)])
            addEvent(fall, rocks*24, cid, master, GRASSDAMAGE, -1, eff3[math.random(1, 3)])
            -- addEvent(fall, rocks*25, cid, master, GRASSDAMAGE, -1, eff4[math.random(1, 3)])
        end
        
        addEvent(doMoveInArea2, 490, cid, 0, BigArea2, GRASSDAMAGE, min, max, spell) 
        
        
    elseif spell == "Psycho Cut" then -- Psycho Cut
        -- cor absol: rosa / cor gallade: aleatorio, ou verde ou rosa. pode ser de perto ou de longe
        local ret = {}
        ret.id = 0
        ret.cd = 1
        ret.eff = 429
        ret.check = 0
        ret.spell = spell
        ret.cond = 0
        
        if getSubName(cid, target) == "Absol" then
            doSetCreatureOutfit(cid, {lookType = 2159}, 4000)
            addEvent(doMoveInAreaMulti, 30, cid, 60, 0, bullet, bulletDano, PSYCHICDAMAGE, min, max)
            addEvent(doMoveInAreaMulti, 50, cid, 98, 585, bullet, bulletDano, PSYCHICDAMAGE, 0, 0, ret) -- 98 533
            
        elseif getSubName(cid, target) == "Gallade" then
            -- if tem storage da Swords Dance then eff de corte else then
            doMoveInAreaMulti(cid, 62, 0, bullet, bulletDano, PSYCHICDAMAGE, min, max)
            addEvent(doMoveInAreaMulti, 22, cid, 98, 532, bullet, bulletDano, PSYCHICDAMAGE, 0, 0, ret)
            
        else
            --cid, effDist, effDano, areaEff, areaDano, element, min, max        
            doMoveInAreaMulti(cid, 60, 0, bullet, bulletDano, PSYCHICDAMAGE, min, max, ret)
            addEvent(doMoveInAreaMulti, 22, cid, 98, 429, bullet, bulletDano, PSYCHICDAMAGE, 0, 0, ret)
        end  
        -- /\ esse 98 é nulo, pq se eu colocar "0" ele pega o missile de nº 1
        
    elseif spell == "Dark Pulse" then
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {544, {x=p.x, y=p.y-1, z=p.z}},
            [1] = {543, {x=p.x+4, y=p.y, z=p.z}}, 
            [2] = {544, {x=p.x, y=p.y+4, z=p.z}},
            [3] = {543, {x=p.x-1, y=p.y, z=p.z}},
        }
        local area = reto4
        
        doSendMagicEffect(posC1, 685)
        addEvent(doMoveInArea2, 70, cid, 0, area, DARKDAMAGE, min, max, spell)
        addEvent(doSendMagicEffect, 70, t[a][2], t[a][1])       

    elseif spell == "Perish Song" then
        
        local ret = {}
        ret.id = 0
        ret.cd = math.random(3, 4)
        ret.check = 0
        ret.first = true
        ret.cond = "Sleep" 
        
        local areas = {rock1, rock2, rock3, rock4, rock5, rock4, rock3, rock2, rock1}
        
        for i = 0, 8 do
            doMoveInArea2(cid, 570, selfArea1, NORMALDAMAGE, 0, 0, spell, ret) 
            doMoveInArea2(cid, 549, selfArea1, NORMALDAMAGE, 0, 0, spell) 
            addEvent(doMoveInArea2, i*400, cid, 549, areas[i+1], NORMALDAMAGE, 0, 0, spell, ret)
            addEvent(doMoveInArea2, i*410, cid, 571, areas[i+1], NORMALDAMAGE, 0, 0, spell)
        end
            
        
    elseif spell == "Slicing Wind" then 
        
        
        --doMoveInArea2(cid, 307, Crunch2, FLYINGDAMAGE, 0, 0, spell)
        --doMoveInArea2(cid, 0, Crunch3, FLYINGDAMAGE, min, max, spell)
        
        
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area, eff)
            if isCreature(cid) then 
                --if not isSightClear(p, area, false) then return true end
                doAreaCombatHealth(cid, psyDmg, area, 0, 0, 0, eff) --alterado v1.4
                doAreaCombatHealth(cid, psyDmg, area, Crunch3, -min, -max, 255) --255 --alterado v1.4
            end
        end
        
        for a = 0, 4 do
            
            --[[ local t = {
                [0] = {426, {x=p.x, y=p.y-(a+1), z=p.z}}, --250 --alterado v1.4
                [1] = {426, {x=p.x+(a+1), y=p.y, z=p.z}},
                [2] = {426, {x=p.x, y=p.y+(a+1), z=p.z}},
                [3] = {426, {x=p.x-(a+1), y=p.y, z=p.z}}
            } 
            --]]
            local t = {
                [0] = {307, {x=p.x+1, y=p.y-(a), z=p.z}}, --250 --alterado v1.4
                [1] = {307, {x=p.x+(a+2), y=p.y+1, z=p.z}},
                [2] = {307, {x=p.x+1, y=p.y+(a+2), z=p.z}},
                [3] = {307, {x=p.x-(a), y=p.y+1, z=p.z}}
            } 
            addEvent(sendAtk, 370*a, cid, t[d][2], t[d][1])
        end
        
        --[[ 
        local p = getThingPosWithDebug(cid) 
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area, areaEff, eff) -- 307
            
            if isCreature(cid) then
                
                --if not isSightClear(p, area, false) then return true end
                doAreaCombatHealth(cid, FLYINGDAMAGE, areaEff, 0, 0, 0, eff)
                
                doAreaCombatHealth(cid, FLYINGDAMAGE, area, Crunch3, -min, -max, 0) -- whirl3 
                addEvent(doAreaCombatHealth, 350, cid, FLYINGDAMAGE, area, Crunch2, 0, 0, 307) 
                
                
            end
        end
        
        for a = 0, 5 do
            
            local t = {
                
            [0] = {489, p}, -- {x=p.x, y=p.y-(a+1), z=p.z}, {x=p.x+1, y=p.y-(a+1), z=p.z}},
            
        [1] = {489, p}, -- {x=p.x+(a+1), y=p.y, z=p.z}, {x=p.x+(a+1), y=p.y+1, z=p.z}}, 
        
    [2] = {489, p}, -- {x=p.x, y=p.y+(a+1), z=p.z}, {x=p.x+1, y=p.y+(a+1), z=p.z}},
    
[3] = {489, p} -- {x=p.x-(a+1), y=p.y, z=p.z}, {x=p.x-(a+1), y=p.y+1, z=p.z}}
}

addEvent(sendAtk, 270*a, cid, t[d][2], t[d][3], t[d][1]) --325

end  


--]] 
        
    elseif spell == "Magma Fist" then 
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {561, {x=p.x+1, y=p.y-1, z=p.z}},
            [1] = {559, {x=p.x+3, y=p.y+1, z=p.z}}, 
            [2] = {558, {x=p.x+1, y=p.y+4, z=p.z}}, 
            [3] = {560, {x=p.x-1, y=p.y+1, z=p.z}}, 
        }
        
        doMoveInArea2(cid, 0, triplo4, FIREDAMAGE, min, max, spell)
        doSendMagicEffect(t[a][2], t[a][1]) 
        doBurnPoke(cid, target) 
        
        
    elseif spell == "Sweet Kiss" then 
        
        local rounds = math.random(4, 7) --rever area...
        rounds = rounds + math.floor(getPokemonLevel(cid) / 35)
        
        --[[ 
        if spell == "???" then 
            eff = 430
        else
            eff = 136
        end
        --]]
        
        local ret = {}
        ret.id = 0
        ret.check = 0
        ret.cd = rounds
        ret.cond = "Confusion"
        
        doMoveInArea2(cid, 0, selfArea1, dano, 0, 0, spell, ret)
        addEvent(doSendMagicEffect, 1, PosCid1, 580)
        
        
        
    elseif spell == "Wish" then 
        
        local min = (getCreatureMaxHealth(cid) * 40) / 100
        local max = (getCreatureMaxHealth(cid) * 65) / 100
        
        local function doHealArea(cid, min, max)
            local amount = math.random(min, max)
            if (getCreatureHealth(cid) + amount) >= getCreatureMaxHealth(cid) then
                amount = -(getCreatureHealth(cid)-getCreatureMaxHealth(cid))
            end
            if getCreatureHealth(cid) ~= getCreatureMaxHealth(cid) then
                doCreatureAddHealth(cid, amount)
                doSendAnimatedText(getThingPosWithDebug(cid), "+"..amount.."", 65)
            end
        end
        
        local pos = getPosfromArea(cid, wish)
        local n = 0
        doHealArea(cid, min, max)
        doRaiseStatus(cid, 0, 0, 300, 10) 
                            
        while n < #pos do
            n = n+1
            thing = {x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=253}
            local pid = getThingFromPosWithProtect(thing)
            
            -- doSendMagicEffect(pos[n], 579) -- eff
            doSendMagicEffect(posC1, 579) -- eff
            if isCreature(pid) then
                if isSummon(cid) and (isSummon(pid) or isPlayer(pid)) then
                    if canAttackOther(cid, pid) == "Cant" then
                        doHealArea(pid, min, max)
                            doRaiseStatus(pid, 0, 0, 300, 10)                           
                    end 
                elseif ehMonstro(cid) and ehMonstro(pid) then
                    doHealArea(pid, min, max)
                            doRaiseStatus(pid, 0, 0, 300, 10) 
                end
            end 
        end
        
elseif spell == "Fake Tears" then 
            
        local pos = getPosfromArea(cid, wish)
        local n = 0
        
        doRaiseStatus(cid, 0, 20, 300, 10) 
                            
        while n < #pos do
            n = n+1
            thing = {x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=253}
            local pid = getThingFromPosWithProtect(thing)
            
            doSendMagicEffect(getThingPos(cid), 987) -- eff
            doSendMagicEffect(getThingPos(getCreatureMaster(cid)), 987)
            
            if isCreature(pid) then
                if isSummon(cid) and (isSummon(pid) or isPlayer(pid)) then
                    if canAttackOther(cid, pid) == "Cant" then
                            doRaiseStatus(pid, 0, 20, 300, 10)                          
                    end 
            elseif ehMonstro(cid) and ehMonstro(pid) then
                            doRaiseStatus(pid, 0, 20, 300, 10)          
                end
            end 
        end 

elseif spell == "Helping Hand" then 
            
        local pos = getPosfromArea(cid, wish)
        local n = 0
        
        doRaiseStatus(cid, 5, 5, 300, 20) 
        setPlayerStorageValue(cid, 253, 1)
        
        while n < #pos do
            n = n+1
            thing = {x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=253}
            local pid = getThingFromPosWithProtect(thing) or getThingFromPosWithProtect(target) 
            
            doSendMagicEffect(getThingPos(cid), 986) -- eff
            doSendMagicEffect(getThingPos(getCreatureMaster(cid)), 816)
            
            if isCreature(pid) then
                if isSummon(cid) and (isSummon(pid) or isPlayer(pid)) then
                    if canAttackOther(cid, pid) == "Cant" then
                            doRaiseStatus(pid, 5, 5, 30, 20) 
                        setPlayerStorageValue(cid, 253, 1)
                    end 
            elseif ehMonstro(cid) and ehMonstro(pid) then
                            doRaiseStatus(pid, 5, 5, 30, 20)
                        setPlayerStorageValue(cid, 253, 1)
                end
            end 
        end         
        
    elseif spell == "Draining Kiss" then -- effect kiss, dps effect de buff vermelho(rage?) causa dano em grande area e cura conforme o dano e numero de pokemons acertados(essa parte ainda não sei fazer)
        
        doSendMagicEffect(posC1, 290)
        addEvent(doMoveInArea2, 210, cid, 0, heal, NORMALDAMAGE, min, max, spell) -- 13
        doSendMagicEffect(getThingPosWithDebug(pid), 855)
        
    elseif spell == "Sheer Cold" then 
        
        doSendMagicEffect(posC1, 577)
        stopNow(cid, 1550)  
        setPlayerStorageValue(cid, 5000001, 1)  
        addEvent(setPlayerStorageValue, 1210, cid, 32698, 1)    
        addEvent(setPlayerStorageValue, 3001, cid, 5000001, -1)     
        addEvent(setPlayerStorageValue, 1220, cid, 32698, -1) -- storage do silence     
        
        local ret = {}
        ret.id = cid
        ret.cd = 2
        ret.eff = 0 
        ret.check = 0
        ret.buff = spell
        ret.first = true
        
        doCondition2(ret)       
        
        doMoveInArea2(cid, 578, confusion, ICEDAMAGE, min, max, spell)  

        addEvent(doMoveInArea2, 10, cid, 578, rock1, ICEDAMAGE, -min, -max, spell, ret2) --48
        addEvent(doDanoWithProtectWithDelay, 10, cid, rock1, ICEDAMAGE, min, max, 578)
            
        addEvent(doMoveInArea2, 310, cid, 578, rock2, ICEDAMAGE, -min, -max, spell, ret2) --48
        addEvent(doDanoWithProtectWithDelay, 10, cid, rock2, ICEDAMAGE, min, max, 578)
            
        addEvent(doMoveInArea2, 610, cid, 578, rock3, ICEDAMAGE, -min, -max, spell, ret2) --48
        addEvent(doDanoWithProtectWithDelay, 10, cid, rock3, ICEDAMAGE, min, max, 578)
            
        addEvent(doMoveInArea2, 910, cid, 578, rock4, ICEDAMAGE, -min, -max, spell, ret2) --48
        addEvent(doDanoWithProtectWithDelay, 10, cid, rock4, ICEDAMAGE, min, max, 578)
            
        addEvent(doMoveInArea2, 1210, cid, 578, rock5, ICEDAMAGE, -min, -max, spell, ret2) --48
        addEvent(doDanoWithProtectWithDelay, 10, cid, rock5, ICEDAMAGE, min, max, 578)
        
    --  addEvent(doCreatureSetNoMove, 4000, cid, false)
    
    elseif spell == "Moon Blast" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.check = 0
        ret.eff = 0
        ret.spell = spell
        ret.cond = "Silence"
        
        
        doSendMagicEffect(posC1, 620)
        addEvent(doMoveInArea2, 1000, cid, 0, moonBlast, NORMALDAMAGE, min, max, spell, ret)
        addEvent(doMoveInArea2, 1000, cid, 0, moonBlast, NORMALDAMAGE, 0, 0, spell, ret2) -- sem dano, nem ret
        
    elseif spell == "Cursed Body" then
        
        local ret = {}
        ret.id = 0
        ret.cd = 5
        ret.check = 0
        ret.eff = 0
        ret.spell = spell
        ret.cond = "Silence"
        
        setPlayerStorageValue(cid, 5000005, 1)
        doMoveInArea2(cid, 0, moonBlast, NORMALDAMAGE, 0, 0, spell, ret)    
        
        
    elseif spell == "Swamp Mist" then -- falta deixar poison (fazer cond poison)
        
        local eff = 622 
        
        times = {0, 700, 1400, 2100, 2800, 3500, 4200} 
        
        local function doQuake(cid)
            
            local ret = {}
            ret.id = 0
            ret.cd = 9
            ret.eff = 34
            ret.check = 0
            ret.first = true
            ret.cond = "Slow"
            
            doMoveInArea2(cid, eff, swampMist, POISONDAMAGE, min, max, spell, ret) 
            addEvent(doMoveInArea2, 400, cid, eff, swampMist2, POISONDAMAGE, min, max, spell, ret) 
        end 
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 10000, cid, 3644587, -1)
        for i = 1, #times do 
            addEvent(doQuake, times[i], cid)
        end 
        
    elseif spell == "Static Beam" then -- falta impedir que o poke se mexa e ataque (usuario da magia)
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {405, {x=p.x, y=p.y-1, z=p.z}},
            [1] = {407, {x=p.x+3, y=p.y, z=p.z}}, --alterado v1.8
            [2] = {404, {x=p.x, y=p.y+3, z=p.z}},
            [3] = {406, {x=p.x-1, y=p.y, z=p.z}},
        }
        local area = reto4
        
        local ret = {}
        ret.id = 0
        ret.cd = 9
        ret.eff = 103
        ret.check = 0
        ret.first = true
        local sorte = math.random(1, 5)
        if sorte >= 3 then
            ret.cond = "Paralyze"
        end
        
        doCreatureSetNoMove(cid, true)
        setPlayerStorageValue(cid, 32698, 1) -- storage do silence
        addEvent(setPlayerStorageValue, 2000, cid, 32698, -1) -- storage do silence
        addEvent(doCreatureSetNoMove, 2020, cid, false)
        
        doMoveInArea2(cid, 0, area, ELECTRICDAMAGE, min, max, spell, ret)
        addEvent(doMoveInArea2, 290, cid, 0, area, ELECTRICDAMAGE, min, max, spell, ret)
        doSendMagicEffect(t[a][2], t[a][1])
        addEvent(doSendMagicEffect, 315, t[a][2], t[a][1]) -- colocar um paralyze quando usar a magia
        addEvent(doSendMagicEffect, 630, t[a][2], t[a][1])
        addEvent(doSendMagicEffect, 900, t[a][2], t[a][1]) 
        
        
    elseif spell == "Dark Wave" then 
        
        doMoveInArea2(cid, 719, db1, DARKDAMAGE, 0, 0, spell) -- 681
        doMoveInArea2(cid, 696, db1, DARKDAMAGE, min, max, spell) 
        
        
    elseif spell == "Shadow Wave" then
        
        doMoveInArea2(cid, 678, db1, DARKDAMAGE, 0, 0, spell) 
        addEvent(doMoveInArea2, 60, cid, 678, db1, DARKDAMAGE, 0, 0, spell) 
        addEvent(doMoveInArea2, 310, cid, 678, db1, DARKDAMAGE, 0, 0, spell) 
        
        doMoveInArea2(cid, 680, db1, DARKDAMAGE, min, max, spell) 
        
        --[[
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        local t = {
            [0] = {782, {x=p.x+1, y=p.y-(a+1), z=p.z}}, -- 686, 687, 689. 688
            [1] = {783, {x=p.x+(a+5), y=p.y+1, z=p.z}},
            [2] = {785, {x=p.x+1, y=p.y+(a+4), z=p.z}},
            [3] = {784, {x=p.x-(a-1), y=p.y+1, z=p.z}} 
        }
        
        doSendMagicEffect(posC1, 697)
        addEvent(doMoveInArea2, 70, cid, 0, reto4, GHOSTDAMAGE, min, max, spell)
        addEvent(doMoveInArea2, 335, cid, 0, reto0034, GHOSTDAMAGE, min, max, spell)
        addEvent(doMoveInArea2, 435, cid, 0, reto000056, GHOSTDAMAGE, min, max, spell)
        addEvent(doSendMagicEffect, 80, t[a][2], t[a][1])   
        --]]
        
    elseif spell == "Acid Bomb" then
        
        -- doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 14)
        -- doDanoWithProtectWithDelay(cid, target, POISONDAMAGE, min, max, 20, bombWee2)
        
        local function doAcidBomb(cid, areaDMG, target)
            if not isCreature(cid) or not isCreature(target) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 107)
            doDanoWithProtectWithDelay(cid, target, POISONDAMAGE, min, max, 614, areaDMG) -- 20
            return true
        end
        areas = {poisonBomb1, poisonBomb2, poisonBomb3}
        for i = 0, 2 do
            addEvent(doAcidBomb, 200 * i, cid, areas[i+1], target)
        end
        
        
    elseif spell == "Poison Bomb" then
        
        
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 122) -- 119
        --  addEvent(doSendMagicEffect, 92, PosT1, 694)
        addEvent(doDanoWithProtectWithDelay, 92, cid, target, POISONDAMAGE, 0, 0, 784, bombWee2)
        addEvent(doDanoWithProtectWithDelay, 92, cid, target, POISONDAMAGE, min, max, 683, bombWee2) -- 695
        
        --  doDanoWithProtectWithDelay(cid, target, POISONDAMAGE, min, max, 683, bombWee2) -- 695 -- rever, testar sem add event, tava sem dano
        
        
        
        
        
        --[[
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 14)
        doDanoWithProtectWithDelay(cid, target, POISONDAMAGE, min, max, 0, bomb) -- 695
        addEvent(doSendMagicEffect, 95, PosT, 694)
        --]]
        
    elseif spell == "Sludge Bomb" then
        
        local contudion = "Miss"
        local ret = {}
        ret.id = target
        ret.cd = 5
        ret.eff = 731 -- 34
        ret.check = getPlayerStorageValue(target, conds[contudion])
        ret.spell = spell
        ret.cond = contudion
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 6) 
        doDanoWithProtectWithDelay(cid, target, POISONDAMAGE, min, max, 845, bombWee2) -- 116 -- SLUDGEDAMAGE
        
        local sorte = math.random(1, 5)
        if sorte == 5 then
            addEvent(doMoveDano2, 200, cid, target, POISONDAMAGE, 0, 0, ret, spell) -- SLUDGEDAMAGE
        end
        
        
    elseif spell == "Mud Bomb" then
        
        local ret = {}
        ret.id = target
        ret.cd = 5
        ret.eff = 734 -- 34
        ret.check = getPlayerStorageValue(target, conds["Miss"])
        ret.spell = spell
        local sorte = math.random(1, 10)
        if sorte <= 3 then
            ret.cond = "Miss"
        else
            ret.cond = nil
        end
        
        local ret2 = {}
        ret2.id = 0
        ret2.cd = 9
        ret2.eff = 34
        ret2.check = 0
        ret2.spell = spell
        ret2.cond = "Miss"
        
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 64) 
        doDanoWithProtectWithDelay(cid, target, MUDBOMBDAMAGE, min, max, 734, bombWee2) -- 698
        addEvent(doMoveDano2, 200, cid, target, MUDBOMBDAMAGE, 0, 0, ret, spell)    
        
        
    elseif spell == "Meteor Strike" then 
        
        local master = isSummon(cid) and getCreatureMaster(cid) or cid
        
        local function doFall(cid)
            
            for rocks = 1, 42 do --62 -- 140
                addEvent(fall, rocks*35, cid, master, FIREDAMAGE, 98, 538) -- 702 é um pouco mais vermelho/escuro
                addEvent(fall, rocks*35, cid, master, 0, 98, 708) 
            end -- 98 é missile nulo /\
        end
        
        --for up = 1, 10 do
        -- addEvent(upEffect, up*75, cid, 18)
        --end
        addEvent(doFall, 450, cid)
        addEvent(doMoveInArea2, 1400, cid, 2, BigArea2, FIREDAMAGE, min, max, spell)
        
        
    elseif spell == "Volcano Shot" then
    
        stopNow(target, 110) 
        doSendMagicEffect(posT, 102)
        addEvent(doAreaCombatHealth, 70, cid, FIREDAMAGE, posT, 0, -min, -max, 707) 
            
    elseif spell == "Rage of Punches" then -- antigo revenge
        
        local function doRevenge(cid)
            if not isCreature(cid) then return false end
            if isSleeping(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return false end
            if isWithFear(cid) and getPlayerStorageValue(cid, 3644587) >= 1 then return true end
            local rev = getThingPosWithDebug(cid)
            rev.x = rev.x+1
            rev.y = rev.y+1
            if isInArray({"Shiny Heracross", "Shiny Machamp"}, getSubName(cid, target)) then
                doSendMagicEffect(rev, 90)
            else
                doSendMagicEffect(rev, 99)
            end
            doAreaCombatHealth(cid, FIGHTINGDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 255)
            
        end
        
        times = {0, 500, 1000, 1500, 2300}
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 10000, cid, 3644587, -1)
        for i = 1, #times do --alterado v1.4
            addEvent(doRevenge, times[i], cid)
        end 
        
        
    elseif spell == "Low Sweep" then
        
        local ret = {} 
        ret.id = 0
        ret.cd = 9
        ret.eff = 88
        ret.check = 0
        ret.spell = spell
        ret.cond = "Confusion"
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local p = getThingPosWithDebug(cid)
        
        if isInArray({"Elite Hitmonlee", "Shiny Hitmonlee"}, getSubName(cid, target)) then
            t = {
                [0] = {643, {x=p.x+1, y=p.y, z=p.z}},
                [1] = {644, {x=p.x+2, y=p.y+1, z=p.z}}, 
                [2] = {645, {x=p.x+1, y=p.y+2, z=p.z}},
                [3] = {646, {x=p.x, y=p.y, z=p.z}}, 
            }
        else
            t = {
                [0] = {653, {x=p.x+1, y=p.y, z=p.z}},
                [1] = {654, {x=p.x+2, y=p.y+1, z=p.z}}, 
                [2] = {655, {x=p.x+1, y=p.y+2, z=p.z}},
                [3] = {656, {x=p.x, y=p.y, z=p.z}}, 
            }
        end
        
        doMoveInArea2(cid, 0, HammerArm, FIGHTINGDAMAGE, min, max, spell, ret) -- BrickBeak
        doSendMagicEffect(t[a][2], t[a][1]) 
        
        
        
        
        
        
        
    elseif spell == "Aqua Jet" then
        
        
        local pp = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area, eff)
            if isCreature(cid) then
                -- --if not isSightClear(p, area, false) then return true end
                doAreaCombatHealth(cid, WATERDAMAGE, area, 0, 0, 0, eff)
                doAreaCombatHealth(cid, WATERDAMAGE, area, whirl3, -min, -max, 68)
            end
        end
        
        for a = 0, 4 do
            
            --[[]]
            local t = { --alterado v1.4
                [0] = {64, {x=pp.x, y=pp.y-(a+1), z=pp.z}},
                [1] = {65, {x=pp.x+(a+1), y=pp.y, z=pp.z}},
                [2] = {66, {x=pp.x, y=pp.y+(a+1), z=pp.z}},
                [3] = {67, {x=pp.x-(a+1), y=pp.y, z=pp.z}}
            } 
            addEvent(sendAtk, 300*a, cid, t[d][2], t[d][1])
        end
        
        
        
        
        
        
        
        
        -- local p = getThingPosWithDebug(cid)
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        local t = {
            [0] = {0, -5},
            [1] = {5, 0}, 
            [2] = {0, 5},
            [3] = {-5, 0}, 
        }
        
        
        --[[
        t = {
            [0] = {658, {x=p.x+1, y=p.y-1, z=p.z}, 0, -5},
            [1] = {660, {x=p.x+5, y=p.y+1, z=p.z}, 5, 0}, 
            [2] = {659, {x=p.x+1, y=p.y+5, z=p.z}, 0, 5},
            [3] = {657, {x=p.x-1, y=p.y+1, z=p.z}, -5, 0}, 
        }
        --]]
        
        local function doTeleportMe(cid, pos)
            if not isCreature(cid) then return true end
            if canWalkOnPos(pos, false, true, true, true, true) then 
                doTeleportThing(cid, pos)
            end
            --addEvent(doAppear, 500, cid)
            
            --if getPlayerStorageValue(cid, storages.isMega) == "Mega Ampharos" then
            --   doPantinOutfit(cid, 0, getPlayerStorageValue(cid, storages.isMega))
            --  else
            -- if not isInArray({"Skarmory", "Plusle", "Infernape", "Altaria"}, getSubName(cid, target)) then
            --if getPlayerStorageValue(cid, storages.isMega) >= 1 then
            --  doSetCreatureOutfit(cid, {lookType = megasConf[getPlayerStorageValue(cid, storages.isMega)].out}, -1)
            --  checkOutfitMega(cid, getPlayerStorageValue(cid, storages.isMega))   
            -- end
            --end
        end
        
        
        --ddEvent(doSendMagicEffect, 900, getThingPosWithDebug(cid), 53) -- splash
        
        
        
--      setPlayerStorageValue(cid, 32698, 1) -- storage do silence    -- tava tirando o dano da spell
--      addEvent(setPlayerStorageValue, 1400, cid, 32698, -1) -- storage do silence
        
        doMoveInArea2(cid, 0, triplo6, WATERDAMAGE, min, max, spell)
        
        --addEvent(doMoveInArea2, 10, cid, 0, aquaJet1, WATERDAMAGE, min, max, spell)
        --addEvent(doMoveInArea2, 350, cid, 0, aquaJet2, WATERDAMAGE, min, max, spell)
        --addEvent(doMoveInArea2, 650, cid, 0, aquaJet3, WATERDAMAGE, min, max, spell)
        
        
        local ppos = getThingPosWithDebug(cid)
        
        for i = 0, 5 do
            
            local tj = {
                [0] = {611, {x=ppos.x+1, y=ppos.y-(i+1), z=ppos.z}, {x=ppos.x + 1,y=ppos.y-(i+1), z=ppos.z}},
                [1] = {613, {x=ppos.x+(i+1), y=ppos.y+1, z=ppos.z}, {x=ppos.x+(i+1) + 1, y=ppos.y + 1, z=ppos.z}},
                [2] = {610, {x=ppos.x+1, y=ppos.y+(i+1), z=ppos.z}, {x=ppos.x + 1, y=ppos.y+(i+1) + 1, z=ppos.z}},
                [3] = {612, {x=ppos.x-(i+1), y=ppos.y+1, z=ppos.z}, {x=ppos.x-(i+1), y=ppos.y + 1, z=ppos.z}}
            } 
            addEvent(doSendMagicEffect, i*250, tj[a][2], tj[a][1])
        end
        
        local pos = getThingPos(cid)
        doSendMagicEffect(pos, 307)
        doDisapear(cid)
        local x, y = t[a][1], t[a][2]
        pos.x = pos.x + x
        pos.y = pos.y + y   
        addEvent(doTeleportMe, 900, cid, pos)   -- 300
        addEvent(doAppear, 1400, cid)
        --
        --]]
        
        
        
        
        
        
        
        --[[
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area, eff, area2)
            if isCreature(cid) then 
                --if not isSightClear(p, area, false) then return true end
                if not isWalkable(area) then return true end
                if isInArray(waters, getTileInfo(area).itemid) then return true end
                
                doAreaCombatHealth(cid, WATERDAMAGE, area, whirl3, -min, -max, 0)
                doAreaCombatHealth(cid, WATERDAMAGE, area, whirl3, 0, 0, 0)
                doTeleportThing(cid, area)
                
                doDisapear(cid)
                setPlayerStorageValue(cid, 32698, 1) -- storage do silence
                addEvent(setPlayerStorageValue, 1501, cid, 32698, -1) -- storage do silence             
                addEvent(doAppear, 1250, cid)
                
            end
        end
        
        for a = 0, 5 do
            
            t = {
                [0] = {611, {x=p.x+1, y=p.y-(a+1), z=p.z}, {x=p.x + 1,y=p.y-(a+1), z=p.z}},
                [1] = {613, {x=p.x+(a+1), y=p.y+1, z=p.z}, {x=p.x+(a+1) + 1, y=p.y + 1, z=p.z}},
                [2] = {610, {x=p.x+1, y=p.y+(a+1), z=p.z}, {x=p.x + 1, y=p.y+(a+1) + 1, z=p.z}},
                [3] = {612, {x=p.x-(a+1), y=p.y+1, z=p.z}, {x=p.x-(a+1), y=p.y + 1, z=p.z}}
            } 
            doCreatureSetNoMove(cid, true)
            addEvent(doSendMagicEffect, a*200, t[d][2], t[d][1])
            -- addEvent(doMoveInArea2, 1000, cid, 0, aquaJet, WATERDAMAGE, min, max, spell)
            addEvent(sendAtk, 100*a, cid, t[d][2], t[d][1], t[d][3])
            addEvent(doCreatureSetNoMove, 1000, cid, false)
        end 
        addEvent(doSendMagicEffect, 1240, getThingPosWithDebug(cid), 53) -- effect splash   
        
        addEvent(doMoveInArea2, 10, cid, 0, aquaJet1, WATERDAMAGE, min, max, spell)
        addEvent(doMoveInArea2, 350, cid, 0, aquaJet2, WATERDAMAGE, min, max, spell)
        addEvent(doMoveInArea2, 650, cid, 0, aquaJet3, WATERDAMAGE, min, max, spell)
        
        ]]
        
        
        
        
        
    elseif spell == "Lava Plume" or spell == "Rash Scald" then --alterado v1.8
        
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
        
        
        
    elseif spell == "Water Spout" then
        
        local eff = {155, 154, 53, 155, 53}
        local area = {psy1, psy2, psy3, psy4, psy5}
        
        setPlayerStorageValue(cid, 3644587, 1)
        addEvent(setPlayerStorageValue, 4*400, cid, 3644587, -1)
        addEvent(doSendMagicEffect, 10, posC1, 714)
        for i = 0, 4 do
            addEvent(doMoveInArea2, i*400, cid, eff[i+1], area[i+1], WATERDAMAGE, min, max, spell)
        end 
        
    elseif spell == "Stone Edge" then
        
        atk = { -- missile, effect
            ["Stone Edge"] = {124, 44}, -- padrão, crystal, lava
        }
        
        effD = atk[spell][1]
        eff = atk[spell][2]
        
        
        local function doPulseEffect(cid, eff)
            if not isCreature(cid) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), effD)
        end
        
        local function doPulseDamage(cid, eff)
            if not isCreature(cid) then return true end
            doDanoInTargetWithDelay(cid, target, ROCKDAMAGE, min, max, eff)
            
        end 
        
        for i = 0, 3 do
            addEvent(doPulseEffect, i*91, cid, eff) 
        end 
        for i = 1, 2 do
            addEvent(doPulseDamage, i*91, cid, eff)
        end 
        
        
        
    elseif spell == "Grass Whistle" then 
        
        local ret = {}
        ret.id = 0
        ret.cd = math.random(4, 9)
        ret.check = 0
        ret.first = true
        ret.cond = "Sleep" 
        
        
        local pos = getThingPosWithDebug(cid)
        
        local eff = {500, 547}
        local eff2 = {255, 496, 255, 255, 500, 255}
        for rocks = 1, 32 do
            addEvent(fall, rocks*22, cid, master, GRASSDAMAGE, -1, eff[math.random(1, 2)])
            addEvent(fall, rocks*22, cid, master, GRASSDAMAGE, -1, eff2[math.random(1, 6)])
        end
        doMoveInArea2(cid, 0, doSurf3, GRASSDAMAGE, 0, 0, spell, ret) -- eff[math.random(1, 2)]
        addEvent(doDanoWithProtect, math.random(100, 400), cid, GRASSDAMAGE, pos, doSurf2, 0, 0, 0)
                
    elseif spell == "old bola de canhão" then 
        
        cannonBalls = {
            ["Skarmory"] = {eup=595, edown=593, eright=592, eleft=594, efdmg1=253, efdmg2=254, efdmg3=251, efdmg4=252, damage=STEELDAMAGE},
            ["Shiny Skarmory"] = {eup=595, edown=593, eright=592, eleft=594, efdmg1=253, efdmg2=254, efdmg3=251, efdmg4=252, damage=STEELDAMAGE},
            ["Metal Skarmory"] = {eup=595, edown=593, eright=592, eleft=594, efdmg1=253, efdmg2=254, efdmg3=251, efdmg4=252, damage=STEELDAMAGE},
            ["Miltank"] = {eup=597, edown=598, eright=599, eleft=600, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=STEELDAMAGE},
            ["Milch Miltank"] = {eup=597, edown=598, eright=599, eleft=600, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=GROUNDDAMAGE},
            ["Shiny Miltank"] = {eup=597, edown=598, eright=599, eleft=600, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=GROUNDDAMAGE},
            ["Donphan"] = {eup=601, edown=603, eright=602, eleft=596, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=GROUNDDAMAGE},
            ["Roll Donphan"] = {eup=601, edown=603, eright=602, eleft=596, efdmg1=100, efdmg2=100, efdmg3=100, efdmg4=100, damage=GROUNDDAMAGE},
            --["Blastoise"] = {eup=736, edown=736, eright=736, eleft=736, efdmg1=3, efdmg2=3, efdmg3=3, efdmg4=3, damage=NORMALDAMAGE},
            -- ["Forretress"] = {eup=826, edown=826, eright=826, eleft=826, efdmg1=3, efdmg2=3, efdmg3=3, efdmg4=3, damage=NORMALDAMAGE},
        }
        
        local dmg = cannonBalls[getCreatureName(cid)].damage
        
        local function doBack(cid)
            if not isCreature(cid) then return true end
            setPlayerStorageValue(cid,9658783,-1)
            doAppear(cid)
        end
        
        local function doStartHit(cid, n, dir, pos,rote)
            if not isCreature(cid) then return true end
            if n==9 then return true end
            -------------------------------
            if dir == 0 then
                if n>=5 then
                    pos.y = pos.y + 1
                    eff = cannonBalls[getCreatureName(cid)].edown
                else
                    pos.y = pos.y - 1
                    eff = cannonBalls[getCreatureName(cid)].eup
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x+1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x-1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, 0)
                if rote==1 then
                    rote=0
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg1
                else
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg2
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x+1,y=pos.y,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x-1,y=pos.y,z=pos.z}, eff2)
                
            elseif dir == 1 then
                if n>=5 then
                    pos.x = pos.x - 1
                    eff = cannonBalls[getCreatureName(cid)].eleft
                else
                    pos.x = pos.x + 1
                    eff = cannonBalls[getCreatureName(cid)].eright
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y+1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y-1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, 0)
                if rote==1 then
                    rote=0
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg3
                else
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg4
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y-1,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y+1,z=pos.z}, eff2)
                
            elseif dir == 2 then
                if n>=5 then
                    pos.y = pos.y - 1
                    eff = cannonBalls[getCreatureName(cid)].eup
                else
                    pos.y = pos.y + 1
                    eff = cannonBalls[getCreatureName(cid)].edown
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x+1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x-1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, 0)
                if rote==1 then
                    rote=0
                    eff2=cannonBalls[getCreatureName(cid)].efdmg1
                else
                    eff2=cannonBalls[getCreatureName(cid)].efdmg2
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x+1,y=pos.y,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x-1,y=pos.y,z=pos.z}, eff2)
                
            elseif dir == 3 then
                if n>=5 then
                    pos.x = pos.x + 1
                    eff = cannonBalls[getCreatureName(cid)].eright
                else
                    pos.x = pos.x - 1
                    eff = cannonBalls[getCreatureName(cid)].eleft
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y+1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y-1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, 0)
                if rote==1 then
                    rote=0
                    eff2=cannonBalls[getCreatureName(cid)].efdmg3
                else
                    eff2=cannonBalls[getCreatureName(cid)].efdmg4
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y-1,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y+1,z=pos.z}, eff2)
                
            end
            -------------------------------
            
            addEvent(doStartHit,150,cid,n+1, dir, pos,rote) 
            doDanoWithProtect(cid, GRASSDAMAGE, getThingPosWithDebug(cid), selfArea2, min, max, 412) 
        end
        
        setPlayerStorageValue(cid, 32698, 1) -- storage do silence
        addEvent(setPlayerStorageValue, 1450, cid, 32698, -1) -- storage do silence
        
        -- doCreatureSetHideHealth(cid, true)
        doSetCreatureOutfit(cid, {lookType = 2}, -1)
        setPlayerStorageValue(cid,9658783,1)
        doStartHit(cid, 0, getCreatureLookDir(cid), getThingPos(cid), 1)
        addEvent(doBack,1400,cid)
        
        ------------------------------------------------------------------------------------------------------------------------------------------
        
        
        
        
    elseif spell == "old asão" then
        
        cannonBalls = {
            ["Skarmory"] = {eup=595, edown=593, eright=592, eleft=594, efdmg1=253, efdmg2=254, efdmg3=251, efdmg4=252, damage=STEELDAMAGE},
            ["Shiny Skarmory"] = {eup=595, edown=593, eright=592, eleft=594, efdmg1=253, efdmg2=254, efdmg3=251, efdmg4=252, damage=STEELDAMAGE},
            ["Metal Skarmory"] = {eup=595, edown=593, eright=592, eleft=594, efdmg1=253, efdmg2=254, efdmg3=251, efdmg4=252, damage=STEELDAMAGE},
        }
        
        local dmg = cannonBalls[getCreatureName(cid)].damage
        
        local function doBack(cid)
            if not isCreature(cid) then return true end
            setPlayerStorageValue(cid,9658783,-1)
            doAppear(cid)
        end
        
        local function doStartHit(cid, n, dir, pos,rote)
            if not isCreature(cid) then return true end
            if n==9 then return true end
            -------------------------------
            if dir == 0 then
                if n>=5 then
                    pos.y = pos.y + 1
                    eff = cannonBalls[getCreatureName(cid)].edown
                else
                    pos.y = pos.y - 1
                    eff = cannonBalls[getCreatureName(cid)].eup
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x+1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x-1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, 0)
                if rote==1 then
                    rote=0
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg1
                else
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg2
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x+1,y=pos.y,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x-1,y=pos.y,z=pos.z}, eff2)
                
            elseif dir == 1 then
                if n>=5 then
                    pos.x = pos.x - 1
                    eff = cannonBalls[getCreatureName(cid)].eleft
                else
                    pos.x = pos.x + 1
                    eff = cannonBalls[getCreatureName(cid)].eright
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y+1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y-1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, 0)
                if rote==1 then
                    rote=0
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg3
                else
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg4
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y-1,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y+1,z=pos.z}, eff2)
                
            elseif dir == 2 then
                if n>=5 then
                    pos.y = pos.y - 1
                    eff = cannonBalls[getCreatureName(cid)].eup
                else
                    pos.y = pos.y + 1
                    eff = cannonBalls[getCreatureName(cid)].edown
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x+1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x-1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, 0)
                if rote==1 then
                    rote=0
                    eff2=cannonBalls[getCreatureName(cid)].efdmg1
                else
                    eff2=cannonBalls[getCreatureName(cid)].efdmg2
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x+1,y=pos.y,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x-1,y=pos.y,z=pos.z}, eff2)
                
            elseif dir == 3 then
                if n>=5 then
                    pos.x = pos.x + 1
                    eff = cannonBalls[getCreatureName(cid)].eright
                else
                    pos.x = pos.x - 1
                    eff = cannonBalls[getCreatureName(cid)].eleft
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y+1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y-1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, 0)
                if rote==1 then
                    rote=0
                    eff2=cannonBalls[getCreatureName(cid)].efdmg3
                else
                    eff2=cannonBalls[getCreatureName(cid)].efdmg4
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y-1,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y+1,z=pos.z}, eff2)
                
            end
            -------------------------------
            
            addEvent(doStartHit,150,cid,n+1, dir, pos,rote) 
        end
        
        setPlayerStorageValue(cid, 32698, 1) -- storage do silence
        addEvent(setPlayerStorageValue, 1450, cid, 32698, -1) -- storage do silence
        
        doCreatureSetHideHealth(cid, true)
        doSetCreatureOutfit(cid, {lookType = 2}, -1)
        setPlayerStorageValue(cid,9658783,1)
        doStartHit(cid, 0, getCreatureLookDir(cid), getThingPos(cid), 1)
        addEvent(doBack,1400,cid)
        
        ------------------------------------------------------------------------------------
        
        
    elseif spell == "Faint Attack" then 
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
        doDanoInTargetWithDelay(cid, target, DARKDAMAGE, min, max, 723) 
        
        
        
    elseif spell == "Will-O-Wisp" then
        
        
        
        local name = doCorrectString(getCreatureName(cid))
        local ret = {}
        ret.id = 0
        ret.cd = 6 
        ret.check = 0
        ret.eff = 749       
        ret.cond = "Slow" 
        ret.im = target
        ret.attacker = cid 
        addEvent(doMoveDano2, 100, cid, target, FIREDAMAGE, 0, 0, ret, spell)
        doBurnPoke(cid, target) 
        
        doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 142)
        addEvent(doSendDistanceShoot, 42, getThingPosWithDebug(cid), getThingPosWithDebug(target), 142)
        doDanoInTargetWithDelay(cid, target, FIREDAMAGE, min, max, 749) 
        

        
    elseif spell == "Grassy Terrain" then 
        
        doDanoWithProtect(cid, GRASSDAMAGE, getThingPosWithDebug(cid), selfArea2, min, max, 412)    
        
    elseif spell == "Blue Flames" then
        
        
        
        pos = getThingPosWithDebug(cid)
        pos.x = pos.x + 1
        pos.y = pos.y + 1   
        
        doSendMagicEffect(pos, 390)
        
        addEvent(doSetCreatureOutfit, 20, cid, {lookType = 2178}, 10000)
        setPlayerStorageValue(cid, 90177, 1) 
        addEvent(setPlayerStorageValue, 9995, cid, 90177, -1) 
        
        -- addEvent(doSendMagicEffect, 9995, posC1, 391)
        
        
    elseif spell == "Mud Sport" then -- vários danso consecutivos e blind (math.random)
        
        if isCreature(target) then --alterado v1.8
            local contudion = spell == "Mud Shot" and "Miss" or "Stun" 
            local ret = {}
            ret.id = target
            ret.cd = 9
            ret.eff = 34 -- 34
            ret.check = getPlayerStorageValue(target, conds[contudion])
            ret.spell = spell
            ret.cond = contudion
            
            if spell == "Mud Shot" then
                ret.eff = 733
                doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 138)
                addEvent(doMoveDano2, 100, cid, target, GROUNDDAMAGE, -min, -max, ret, spell)   
            else
                doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 6)
                addEvent(doMoveDano2, 100, cid, target, GROUNDDAMAGE, -min, -max, ret, spell)
            end 
        end
        
        
    elseif spell == "Hunter Mark" then
        
        doSendMagicEffect(getThingPosWithDebug(cid), 307)
        local x = getClosestFreeTile(cid, getThingPosWithDebug(target))
        doSendDistanceShoot(getThingPosWithDebug(cid), x, 101) 
        doTeleportThing(cid, x, false)
        doFaceCreature(cid, getThingPosWithDebug(cid))      
        --  doCombatAreaHealth(cid, NORMALDAMAGE, getThingPosWithDebug(target), 0, -min, -max, 3)       
        addEvent(doSendMagicEffect, 80, posT1, 474) 
        doDanoInTargetWithDelay(cid, target, NORMALDAMAGE, min, max, 0) 
        
        
    elseif spell == "Red Fury" then
        
        doSendMagicEffect(posT1, 483)   
        doDanoInTargetWithDelay(cid, target, BUGDAMAGE, min, max, 0)
        
        
    elseif spell == "Gunk Shot" then
        
        --cid, effDist, effDano, areaEff, areaDano, element, min, max
        doMoveInAreaMulti(cid, 14, 785, bullet, bulletDano, POISONDAMAGE, min, max)     
        
        
        
    elseif spell == "Force Palm" then
        
        local function sendEffect(cid)
            if not isCreature(cid) or not isCreature(target) then return true end
            local pos = getThingPos(target)
            -- local lado = getCreatureLookDir(cid)
            local lado = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
            local effes = {
                [0] = {effe1 = 261, effe2 = 797},
                [1] = {effe1 = 263, effe2 = 798},
                [2] = {effe1 = 262, effe2 = 796},
                [3] = {effe1 = 260, effe2 = 799}
            }
            
            TposT = getThingPosWithDebug(target)    
            
            Cpos4 = getThingPosWithDebug(cid)   
            Cpos5 = getThingPosWithDebug(cid)   
            Cpos6 = getThingPosWithDebug(cid)   
            Cpos7 = getThingPosWithDebug(cid)   
            
            Cpos4.x = Cpos4.x-1 
            Cpos4.y = Cpos4.y+1 -- sudoeste <-\/
            Cpos5.x = Cpos5.x+1 
            Cpos5.y = Cpos5.y+1 -- sudeste ->\/
            Cpos6.x = Cpos6.x-1 
            Cpos6.y = Cpos6.y-1 -- noroeste <-/\
            Cpos7.x = Cpos7.x+1
            Cpos7.y = Cpos7.y-1 -- nordeste -> /\
            
            --local areaFP = forcePalm
            
            if Cpos4.x == TposT.x and Cpos4.y == TposT.y then 
                areaFP = forcePalm4
            elseif Cpos5.x == TposT.x and Cpos5.y == TposT.y then 
                areaFP = forcePalm5
            elseif Cpos6.x == TposT.x and Cpos6.y == TposT.y then
                areaFP = forcePalm6
            elseif Cpos7.x == TposT.x and Cpos7.y == TposT.y then
                areaFP = forcePalm7
            else
                areaFP = forcePalm
            end     
            
            if lado == 0 then
                pos.y = pos.y
                pos.x = pos.x +2
            elseif lado == 1 then
                pos.y = pos.y +2
                pos.x = pos.x +2
            elseif lado == 2 then
                pos.y = pos.y +2
                pos.x = pos.x +2
            elseif lado == 3 then
                pos.y = pos.y +2
                pos.x = pos.x 
            end 
            -- doDanoInTargetWithDelay(cid, target, FIGHTINGDAMAGE, min, max, 786)  
            doSendMagicEffect(posT, 786) 
            addEvent(doSendMagicEffect, 160, pos, effes[lado].effe2)
            addEvent(doDanoWithProtectWithDelay, 10, cid, target, FIGHTINGDAMAGE, min, max, 255, areaFP) --alterado v1.6
        end
        sendEffect(cid)
        
        
    elseif spell == "Heavy Slam" then
        
        if getSubName(cid, target) == "Golem" then
            addEvent(doSetCreatureOutfit, 40, cid, {lookType = 639}, 850)
        elseif getSubName(cid, target) == "Shiny Golem" then
            addEvent(doSetCreatureOutfit, 40, cid, {lookType = 1403}, 850)  
        end
        
        stopNow(cid, 400) 
        addEvent(doSendMagicEffect, 380, posC1, 825)
        addEvent(doMoveInArea2, 750, cid, 3, confusion, NORMALDAMAGE, min, max, spell)
        
        
    elseif spell == "Fire Spin" then
        
    if isInArray({"Arcanine", "Shiny Arcanine", "Moltres"}, getSubName(cid, target)) then

    local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area, eff)
            if isCreature(cid) then
                --if not isSightClear(p, area, false) then return true end 
                doAreaCombatHealth(cid, FIREDAMAGE, area, 0, 0, 0, eff)
                doAreaCombatHealth(cid, FIREDAMAGE, area, whirl3, -min, -max, 35) -- 863
            end
        end
        
        for a = 0, 4 do
            
            local t = {
                [0] = {862, {x=p.x, y=p.y-(a+1), z=p.z}}, --alterado v1.4
                [1] = {862, {x=p.x+(a+1), y=p.y, z=p.z}},
                [2] = {862, {x=p.x, y=p.y+(a+1), z=p.z}},
                [3] = {862, {x=p.x-(a+1), y=p.y, z=p.z}}
            } 
            addEvent(sendAtk, 300*a, cid, t[d][2], t[d][1])
        end
    
    
    else
        
        setPlayerStorageValue(cid, 94379, 1) -- storage do fire spin
        addEvent(setPlayerStorageValue, 9000, cid, 94379, -1)
        
        local eff = 416
        
        if getPlayerStorageValue(cid, 90177) >= 1 then -- blue flames
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 161)
            eff = 827
        else
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 96)
        end
        
        local ret = {}
        ret.id = target
        ret.cd = 5
        ret.eff = eff -- 416
        ret.check = getPlayerStorageValue(target, conds["Stun"])
        ret.spell = spell
        ret.cond = "Stun"
        
        addEvent(doMoveDano2, 100, cid, target, FIREDAMAGE, min, max, ret, spell)
        addEvent(doBurnPoke, 100, cid, target)
        
        
        end
        
    elseif spell == "Gyro Ball" then
        
        doMoveInArea2(cid, 0, confusion, STEELDAMAGE, min, max, spell)
        addEvent(doMoveInArea2, 395, cid, 0, confusion, STEELDAMAGE, min, max, spell)
        
        local p = getThingPosWithDebug(cid)
        
        local t1 = {
            {128, {x = p.x+1, y = p.y-1, z = p.z}},
            {129, {x = p.x+2, y = p.y+1, z = p.z}},
            {131, {x = p.x+1, y = p.y+2, z = p.z}},
            {130, {x = p.x-1, y = p.y+1, z = p.z}},
        }
        
        local t = {
            {128, {x = p.x+1, y = p.y-1, z = p.z}},
            {129, {x = p.x+2, y = p.y+1, z = p.z}},
            {131, {x = p.x+1, y = p.y+2, z = p.z}},
            {130, {x = p.x-1, y = p.y+1, z = p.z}},
        }
        
        if getSubName(cid, target) == "Forretress" then
            -- if getPlayerStorageValue(cid, 925177) >= 1 then      
            -- doSetCreatureOutfit(cid, {lookType = 1196}, 640) 
            -- else
            doSetCreatureOutfit(cid, {lookType = 1195}, 640) 
            -- end
        elseif getSubName(cid, target) == "Pineco" then
            doSetCreatureOutfit(cid, {lookType = 1194}, 635)
        end
        
        for a = 0, 1 do
            for i = 1, 4 do
                if getSubName(cid, target) == "Pineco" then
                    addEvent(doSendMagicEffect, a*400, t1[i][2], t1[i][1])
                else        
                    addEvent(doSendMagicEffect, a*400, t[i][2], t[i][1])
                end     
            end
        end
        
        
    elseif spell == "Fairy Wind" then
        
        doSendMagicEffect(posC1, 836)
        local eff = {819, 837, 507, 167, 819, 165} 
        local eff2 = {167, 819, 819, 307} 
        local eff3 = {307, 819, 819}
        
        function doFairyWind(cid)
            for rocks = 1, 32 do
                addEvent(fall, rocks*22, cid, master, GRASSGDAMAGE, -1, eff[math.random(1, 6)])
                addEvent(fall, rocks*23, cid, master, GRASSGDAMAGE, -1, eff2[math.random(1, 4)])
                addEvent(fall, rocks*24, cid, master, GRASSGDAMAGE, -1, eff3[math.random(1, 3)])
            end
        end
        
        addEvent(doFairyWind, 200, cid)
        addEvent(doMoveInArea2, 490, cid, 0, BigArea1, NORMALDAMAGE, min, max, spell) 
        
        
        
    elseif spell == "Metal Burst" then
        
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        doSendMagicEffect(posC, 349) -- carregando o ataque
        -- addEvent(doSendMagicEffect, 100, posC, 349) -- carregando o ataque
        
        function sendAtk(cid, area, eff) -- effect
            if isCreature(cid) then
                --if not isSightClear(p, area, false) then return true end
                doAreaCombatHealth(cid, STELLDAMAGE, area, 0, 0, 0, eff)
                doAreaCombatHealth(cid, STELLDAMAGE, area, whirl3, 0, 0, 0)
            end
        end
        
        function sendAtk2(cid, area, eff) -- dano
            if isCreature(cid) then
                --if not isSightClear(p, area, false) then return true end
                doAreaCombatHealth(cid, STELLDAMAGE, area, 0, 0, 0, eff)
                addEvent(doAreaCombatHealth, 210, cid, STELLDAMAGE, area, sand1, 0, 0, 838)
                doAreaCombatHealth(cid, STELLDAMAGE, area, sand1, -min, -max, 0)
            end
        end
        
        function doStartBurst(cid)
            
            for a = 0, 4 do
                
                local t = { -- effect 
                    [0] = {537, {x=p.x+1, y=p.y-(a), z=p.z}}, 
                    [1] = {537, {x=p.x+(a+2), y=p.y+1, z=p.z}},
                    [2] = {537, {x=p.x+1, y=p.y+(a+2), z=p.z}},
                    [3] = {537, {x=p.x-(a), y=p.y+1, z=p.z}}
                } 
                local t2 = { -- dano
                    [0] = {255, {x=p.x, y=p.y-(a+1), z=p.z}}, 
                    [1] = {255, {x=p.x+(a+1), y=p.y, z=p.z}},
                    [2] = {255, {x=p.x, y=p.y+(a+1), z=p.z}},
                    [3] = {255, {x=p.x-(a+1), y=p.y, z=p.z}}
                } 
                
                addEvent(sendAtk, 300*a, cid, t[d][2], t[d][1])
                addEvent(sendAtk2, 300*a, cid, t2[d][2], 0)
            end
        end
        
        addEvent(doCreatureSetLookDir, 20, cid, d) 
        addEvent(stopNow, 6, cid, 860) 
        addEvent(doStartBurst, 350, cid)
        
        
    elseif spell == "Mirror Shot" then -- sparkline
        
        local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        local t = {
            [0] = 840, -- /\ 
            [1] = 841, -- -->
            [2] = 839, -- \/ 
            [3] = 842, -- <--
        }
        
        local ret = {}
        ret.id = 0
        ret.cd = 4
        ret.eff = 843
        ret.check = 0
        ret.first = true
        local sorte = math.random(1, 5)
        if sorte >= 3 then
            ret.cond = "Paralyze"
        end
        
        doMoveInArea2(cid, 0, reto2, STEELDAMAGE, min, max, spell, ret) -- Dano. reto 2 = tile 1 e 2 (dano)
        addEvent(doMoveInArea2, 60, cid, 0, reto0034, STEELDAMAGE, min, max, spell, ret) --Dano. reto0034 = tile 3e4(dano)(tile 1 e 2 nulos(0)) 
        addEvent(doMoveInArea2, 120, cid, 0, reto000056, STEELDAMAGE, min, max, spell, ret) --Dano. reto000056 = tile 5 e 6(dano), outros anteriores(nulo) 
        if a == 0 or a == 3 then
            doMoveInArea2(cid, t[a], mirrorShot1, STEELDAMAGE, 0, 0, spell) -- só effect
        else
            doMoveInArea2(cid, t[a], mirrorShot2, STEELDAMAGE, 0, 0, spell) -- só effect 
        end
        
        
    elseif spell == "Elemental Claw" then
        
        elementalRandom = math.random(1, 3)
        
        if elementalRandom == 1 then
            elementalEffect = 480
            elementalDano = ICEDAMAGE
            elementalSay = "Ice Claw"
        elseif elementalRandom == 2 then
            elementalEffect = 481
            elementalDano = ELECTRICDAMAGE
            elementalSay = "Thunder Claw"
        else
            elementalEffect = 482
            elementalDano = FIREDAMAGE
            elementalSay = "Fire Claw"
        end
        
        doSendMagicEffect(posT1, elementalEffect)   
        doDanoInTargetWithDelay(cid, target, elementalDano, min, max, 0)    
        doCreatureSay(cid, elementalSay, 20) 
        
        
        
    elseif spell == "Withdraw" then 
        
        if getSubName(cid, target) == "Shuckle" then
            doSetCreatureOutfit(cid, {lookType = 435}, 3000)
        elseif getSubName(cid, target) == "Cloyster" then
            doSetCreatureOutfit(cid, {lookType = 436}, 3000)
        elseif getSubName(cid, target) == "Torkoal" then
            doSetCreatureOutfit(cid, {lookType = 1836}, 3000)           
        end
        
        stopNow(cid, 3000)
        setPlayerStorageValue(cid, 5000001, 1)
        addEvent(setPlayerStorageValue, 3000, cid, 5000001, -1) 

elseif spell == "Dragon Dance" then

        if getSubName(cid, target) == "Kingdra" then
            doSetCreatureOutfit(cid, {lookType = 1085}, 4000)
        end 

        setPlayerStorageValue(cid, 253, 1)
        setPlayerStorageValue(cid, 5000001, 1)
        addEvent(setPlayerStorageValue, 4000, cid, 5000001, -1)         
        doSendMagicEffect(posC1, 852)   
        
elseif spell == "Flame Wheel" then


if isInArray({"Arcanine", "Shiny Arcanine"}, getSubName(cid, target)) then
doSetCreatureOutfit(cid, {lookType = 1587}, 5800)   -- 1587
elseif isInArray({"Ninetales", "Shiny Ninetales"}, getSubName(cid, target)) then
doSetCreatureOutfit(cid, {lookType = 1586}, 5800)   -- 1586
else
doSetCreatureOutfit(cid, {lookType = 1581}, 5800)   -- 1581
end
        
    --  setPlayerStorageValue(cid, 3644587, 1)
    --  addEvent(setPlayerStorageValue, 6100, cid, 3644587, -1)
        for r = 1, 8 do --8
            addEvent(doDanoWithProtect, 725 * r, cid, FIREDAMAGE, getThingPosWithDebug(cid), splash, -min, -max, 0)
        end

elseif spell == "Outrage" then

--[[            
    local function doOutRage(cid)
        if not isCreature(cid) then return false end
        doMoveInArea2(cid, 581, selfArea1, DRAGONDAMAGE, min, max, spell)  
        doMoveInArea2(cid, 248, outRage, DRAGONDAMAGE, min, max, spell) 
    return true
    end
    

    local function doReturnOutRage(cid)
        if not isCreature(cid) then return false end
        setPlayerStorageValue(cid, 49872, -1)
        doCreatureSetNoMove(cid, false)
    return true
    end

    
    ---- Mega, Outfit

    if isMega(cid) and getMegaID(cid) == "X" then   
    doRemoveCondition(cid, CONDITION_OUTFIT)
    addEvent(doSetCreatureOutfit, 1, cid, {lookType = 1856}, 4000)  
    end

function doChangeMegaOutfit(cid)
local name = doCorrectString(getCreatureName(cid))
local megaID = ""
    if isSummon(cid) then
        local master = getCreatureMaster(cid)
        if getItemAttribute(getPlayerSlotItem(master, 8).uid, "megaID") and getItemAttribute(getPlayerSlotItem(master, 8).uid, "megaID") ~= "" then
           megaID = getItemAttribute(getPlayerSlotItem(master, 8).uid, "megaID")
        end
    else 
       megaID = getPlayerStorageValue(cid, storages.isMegaID)
    end

local megaName = "Mega " .. name .. (megaID ~= "" and " " .. megaID or "")
        if isInArray({"Charizard", "Blaziken", "Ampharos"}, getSubName(cid, target)) then
           doPantinOutfit(cid, 0, megaName)
        else
           doSetCreatureOutfit(cid, {lookType = megasConf[megaName].out}, -1)
           checkOutfitMega(cid, megaName)
    end
end

addEvent(doChangeMegaOutfit, 4000, cid)
    --]]
    
    
    
    
    -- fire fist, ver como trocar outfit de mega certo
--  doPantinOutfit(cid, 0, getPlayerStorageValue(cid, storages.isMega)) 
    
    addEvent(doMoveInArea2, 2000, cid, 581, selfArea1, DRAGONDAMAGE, min, max, spell)
    addEvent(doMoveInArea2, 2000, cid, 248, outRage, DRAGONDAMAGE, min, max, spell)
    addEvent(doMoveInArea2, 4000, cid, 581, selfArea1, DRAGONDAMAGE, min, max, spell)
    addEvent(doMoveInArea2, 4000, cid, 248, outRage, DRAGONDAMAGE, min, max, spell)
    
    for i = 1, 13 do
        addEvent(sendEffWithProtect, i * 300, cid, getThingPos(cid), 818) -- 13
    end
    
    stopNow(cid, 4000)
    
-- se tiver com storage de silence, não causa dano a spell, tipo, essa causa dano 2 vezes, ent, tem q setar -1 antes do doMoveInArea2 , dps seta silence dnv e antes do prox dano seta -1 novamente
    addEvent(setPlayerStorageValue, 50, cid, 32698, 1) -- storage do silence
    addEvent(setPlayerStorageValue, 1950, cid, 32698, -1) -- storage do silence
    addEvent(setPlayerStorageValue, 2150, cid, 32698, 1) -- storage do silence
    addEvent(setPlayerStorageValue, 3950, cid, 32698, -1) -- storage do silence
    
    --  doCreatureSetNoMove(cid, true)

    
--  for i = 1, 2 do
--      addEvent(doOutRage, i * 2000, cid)
--  end
    
--  addEvent(doConfusion2, 4100, cid, 5, getPlayerStorageValue(cid, conds["Confusion"]))        
    
            
 elseif spell == "Hand Water Gun" then

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local p = getThingPosWithDebug(cid)

eff = 69
if a == 0 then
doSendMagicEffect({x=p.x, y=p.y-1, z=p.z}, 69)
doSendMagicEffect({x=p.x-1, y=p.y-1, z=p.z}, 69)
--doSendMagicEffect({x=p.x-1, y=p.y-1, z=p.z}, 69)
--doSendMagicEffect({x=p.x+1, y=p.y-1, z=p.z}, 69)
eff = 69
elseif a == 1 then
eff = 70
doSendMagicEffect({x=p.x+6, y=p.y, z=p.z}, 70)
doSendMagicEffect({x=p.x+6, y=p.y-1, z=p.z}, 70)
--doSendMagicEffect({x=p.x+6, y=p.y+1, z=p.z}, 70)
--doSendMagicEffect({x=p.x+6, y=p.y-1, z=p.z}, 70)
elseif a == 2 then
eff = 71
doSendMagicEffect({x=p.x-1, y=p.y+6, z=p.z}, 71)
doSendMagicEffect({x=p.x, y=p.y+6, z=p.z}, 71)
--doSendMagicEffect({x=p.x+1, y=p.y+6, z=p.z}, 71)
--doSendMagicEffect({x=p.x-1, y=p.y+6, z=p.z}, 71)
elseif a == 3 then
eff = 70
doSendMagicEffect({x=p.x-1, y=p.y, z=p.z}, 70)
doSendMagicEffect({x=p.x-1, y=p.y-1, z=p.z}, 70)
--doSendMagicEffect({x=p.x-1, y=p.y+1, z=p.z}, 70)
--doSendMagicEffect({x=p.x-1, y=p.y-1, z=p.z}, 70)
end

    -- reto 4

if a == 1 or a == 2 then
doMoveInArea2(cid, 0, handWaterGun2, WATERDAMAGE, min, max, spell)
else            
doMoveInArea2(cid, 0, handWaterGun, WATERDAMAGE, min, max, spell)
end         
    


elseif spell == "Giant Water Gun" then

local a = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
local p = getThingPosWithDebug(cid)

eff = 64
if a == 0 then -- affastar o effects pra lá << um pouco
doSendMagicEffect({x=p.x+1, y=p.y-1, z=p.z}, 299)
eff = 64
elseif a == 1 then
eff = 65
doSendMagicEffect({x=p.x+5, y=p.y+1, z=p.z}, 296)
elseif a == 2 then  -- affastar o effects pra lá << um pouco
eff = 66
doSendMagicEffect({x=p.x+1, y=p.y+5, z=p.z}, 298)
elseif a == 3 then
eff = 67
doSendMagicEffect({x=p.x-1, y=p.y+1, z=p.z}, 297)
end
doMoveInArea2(cid, 0, triplo6, WATERDAMAGE, min, max, spell)
    
elseif spell == "Kinesis" then

        doSendMagicEffect(posC, 874) -- 855 
        
elseif spell == "Fast Kicks Lee" then
        
        addEvent(doDanoWithProtect, 150, cid, POISONDAMAGE, getThingPosWithDebug(cid), grassarea, -min, -max, 0)
        
        local pos = getThingPosWithDebug(cid)
        
        local function doSendLeafStorm(cid, pos) --alterado!!
            if not isCreature(cid) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), pos, 27)
        end
        
        for a = 1, 40 do
            local lugar = {x = pos.x + math.random(-6, 6), y = pos.y + math.random(-5, 5), z = pos.z}
            addEvent(doSendLeafStorm, a * 3, cid, lugar)
            --  doSendMagicEffect(a, 114)
            roleta = math.random(1, 3)
            if roleta == 1 then
                addEvent(doSendMagicEffect, a * 2, lugar, 651)
            end
            
        end 
    
    
elseif spell == "Hidden Power" then 

        doSendMagicEffect(posC, 164)
        doSendMagicEffect(posC, 868)
        addEvent(doMoveInAreaMulti, 300, cid, 167, 8, bullet, bulletDano, NORMALDAMAGE, min, max) 
                                
elseif spell == "Air Vortex" then
 
  --[[
    local function hurricane(cid)
            if not isCreature(cid) then return true end
            if isSleeping(cid) and getPlayerStorageValue(cid, 3744486) >= 1 then return false end
            if isWithFear(cid) and getPlayerStorageValue(cid, 3744486) >= 1 then return true end
            doMoveInArea2(cid, 42, bombWee1, FLYINGDAMAGE, min, max, spell)
        end
        
        doSetCreatureOutfit(cid, {lookType = 1406}, 10000)
        
        setPlayerStorageValue(cid, 3744486, 1)
        addEvent(setPlayerStorageValue, 17*600, cid, 3744486, -1)   
        for i = 1, 17 do
            addEvent(hurricane, i*600, cid)
        end
 --]]
 

local pos = getThingPosWithDebug(cid)
local areas = {rock1, rock2, rock3, rock4, rock5}
local ret = {}

ret.id = 0
ret.cd = 3 -- 9
ret.eff = 3
ret.check = 0
ret.first = true
ret.cond = "Stun"

local function removeOut(cid)
if isCreature(cid) then
       doRemoveCondition(cid, CONDITION_OUTFIT)
end
end


   local config = {
        hurricane = function(cid)
            doMoveInArea2(cid, 974, bombWee1, FLYINGDAMAGE, min, max, spell, ret)  
        end,
        Pull = function(cid)
            local pid = getSpectators(getThingPos(cid), 6, 6)
            if pid and #pid > 0 then
                for i = 1, #pid do
                    if pid[i] ~= cid and ehMonstro(pid[i]) then
                        doTeleportThing(pid[i], getClosestFreeTile(cid, getThingPos(cid)))
                    end
                end
            end
        end,
    }
    config.Pull(cid)
    doSetCreatureOutfit(cid, {lookType = 1406}, 10000)   
    for i = 1, 17 do
        addEvent(config.hurricane, i * 600, cid) -- 600
        addEvent(sendDistanceShootWithProtect, 200, cid, getThingPosWithDebug(target), getThingPosWithDebug(cid), 36) -- 38
        stopNow(cid, 9 * 1000) 
    end 
    
elseif spell == "Cutting Winds" then    
        doMoveInAreaMulti(cid, 9, 966, bulletzin, bulletzinDano, FLYINGDAMAGE, min, max) -- effect e dano Bug
        doMoveInAreaMulti(cid, 98, 967, bulletzin, bulletzinDano, FLYINGDAMAGE, min, max) -- effect e dano Bug  
    
    
elseif spell == "Brave Bird" then   
        
        cannonBalls = { -- 86
            ["Pidgeot"] = {eup=973, edown=971, eright=970, eleft=972, efdmg1=86, efdmg2=86, efdmg3=86, efdmg4=86, damage=FLYINGDAMAGE},
            ["Shiny Pidgeot"] = {eup=973, edown=971, eright=970, eleft=972, efdmg1=86, efdmg2=86, efdmg3=86, efdmg4=86, damage=FLYINGDAMAGE},
            ["Mega Pidgeot"] = {eup=973, edown=971, eright=970, eleft=972, efdmg1=86, efdmg2=86, efdmg3=86, efdmg4=86, damage=FLYINGDAMAGE},
        }
            
        local dmg = cannonBalls[getCreatureName(cid)].damage
        
        local function doBack(cid)
            if not isCreature(cid) then return true end
            setPlayerStorageValue(cid,9658783,-1)
            doAppear(cid)
        end
        
        local function doStartHit(cid, n, dir, pos,rote)
            if not isCreature(cid) then return true end
            if n==9 then return true end
            -------------------------------
            if dir == 0 then
                if n>=5 then
                    pos.y = pos.y + 1
                    -- if getSubName(cid, target) == "Forretress" and getPlayerStorageValue(cid, 925177) >= 1 then
                    --eff = cannonBalls2[getCreatureName(cid)].edown
                    -- else
                    eff = cannonBalls[getCreatureName(cid)].edown
                    -- end
                else
                    pos.y = pos.y - 1
                    -- if getSubName(cid, target) == "Forretress" and getPlayerStorageValue(cid, 925177) >= 1 then
                    --eff = cannonBalls2[getCreatureName(cid)].eup
                    -- else
                    eff = cannonBalls[getCreatureName(cid)].eup
                    -- end
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x+1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x-1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)
                if rote==1 then
                    rote=0
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg1
                else
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg2
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x+1,y=pos.y,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x-1,y=pos.y,z=pos.z}, eff2)
                
            elseif dir == 1 then
                if n>=5 then
                    pos.x = pos.x - 1
                    -- if getSubName(cid, target) == "Forretress" and getPlayerStorageValue(cid, 925177) >= 1 then
                    --eff = cannonBalls2[getCreatureName(cid)].eleft
                    -- else
                    eff = cannonBalls[getCreatureName(cid)].eleft
                    -- end
                else
                    pos.x = pos.x + 1
                    -- if getSubName(cid, target) == "Forretress" and getPlayerStorageValue(cid, 925177) >= 1 then
                    --eff = cannonBalls2[getCreatureName(cid)].eright
                    -- else
                    eff = cannonBalls[getCreatureName(cid)].eright
                    -- end
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y+1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y-1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)
                if rote==1 then
                    rote=0
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg3
                else
                    eff2 = cannonBalls[getCreatureName(cid)].efdmg4
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y-1,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y+1,z=pos.z}, eff2)
                
            elseif dir == 2 then
                if n>=5 then
                    pos.y = pos.y - 1
                    eff = cannonBalls[getCreatureName(cid)].eup
                else
                    pos.y = pos.y + 1
                    eff = cannonBalls[getCreatureName(cid)].edown
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x+1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x-1,y=pos.y,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)
                if rote==1 then
                    rote=0
                    eff2=cannonBalls[getCreatureName(cid)].efdmg1
                else
                    eff2=cannonBalls[getCreatureName(cid)].efdmg2
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x+1,y=pos.y,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x-1,y=pos.y,z=pos.z}, eff2)
                
            elseif dir == 3 then
                if n>=5 then
                    pos.x = pos.x + 1
                    eff = cannonBalls[getCreatureName(cid)].eright
                else
                    pos.x = pos.x - 1
                    eff = cannonBalls[getCreatureName(cid)].eleft
                end
                doSendMagicEffect(pos, eff)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y+1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, {x=pos.x,y=pos.y-1,z=pos.z}, stwing, -min, -max, 0)
                doDanoWithProtect(cid, dmg, pos, stwing, -min, -max, m, 0)
                if rote==1 then
                    rote=0
                    eff2=cannonBalls[getCreatureName(cid)].efdmg3
                else
                    eff2=cannonBalls[getCreatureName(cid)].efdmg4
                    rote=1
                end
                doSendMagicEffect(pos, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y-1,z=pos.z}, eff2)
                doSendMagicEffect({x=pos.x,y=pos.y+1,z=pos.z}, eff2)
                
            end
            -------------------------------
            addEvent(doStartHit,100,cid,n+1, dir, pos,rote) -- 150
        end

        doCreatureSetHideHealth(cid, true)
        doSetCreatureOutfit(cid, {lookType = 2}, -1)
        setPlayerStorageValue(cid,9658783,1)
        doStartHit(cid, 0, getCreatureLookDir(cid), getThingPos(cid), 1)
        addEvent(doBack,900,cid) -- 1400
    
    
elseif spell == "Twineedle" then
        
        local function sendSwift(cid, target)
            if not isCreature(cid) or not isCreature(target) then return true end
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 162)
            doDanoInTargetWithDelay(cid, target, BUGDAMAGE, min, max, 8) 
            addEvent(doSendMagicEffect, 50, posT, 7)
            addEvent(doSendMagicEffect, 60, posT, 8)
        end
        
        addEvent(sendSwift, 50, cid, target)
        addEvent(sendSwift, 200, cid, target) 
        

elseif spell == "Air Twister" then 
        local p = getThingPosWithDebug(cid)
        local d = isCreature(target) and getCreatureDirectionToTarget(cid, target) or getCreatureLookDir(cid)
        
        function sendAtk(cid, area)
            if isCreature(cid) then
                --if not isSightClear(p, area, false) then return true end
                doAreaCombatHealth(cid, FLYINGDAMAGE, area, whirl3, -min, -max, 255)
            end
        end
        
        for a = 0, 5 do
            
            local t = {
                [0] = {128, {x=p.x, y=p.y-(a+1), z=p.z}, {x=p.x+1, y=p.y-(a+1), z=p.z}},
                [1] = {129, {x=p.x+(a+1), y=p.y, z=p.z}, {x=p.x+(a+2), y=p.y+1, z=p.z}},
                [2] = {131, {x=p.x, y=p.y+(a+1), z=p.z}, {x=p.x+1, y=p.y+(a+2), z=p.z}},
                [3] = {130, {x=p.x-(a+1), y=p.y, z=p.z}, {x=p.x-(a+1), y=p.y+1, z=p.z}}
            } 
            addEvent(doSendMagicEffect, 300*a, t[d][3], t[d][1])
            addEvent(doSendMagicEffect, 300*a, t[d][3], 965)
            addEvent(sendAtk, 300*a, cid, t[d][2])
        end 
                
        --/////////////////////// PASSIVAS /////////////////////////--
        
        
        
    elseif spell == "Counter Helix" or spell == "Counter Claw" or spell == "Counter Spin" or spell == "Groundshock" then
        -- [nome] = {out = outfit girando, efeitos}
        local OutFit = {
            ["Scyther"] = {out = 496, cima = 128, direita = 129, esquerda = 130, baixo = 131, cima2 = 527, direita2 = 528, esquerda2 = 529, baixo2 = 530}, -- Scyther
            ["Scizor"] = {out = 918, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --Scizor
            ["Shiny Scyther"] = {out = 849, cima = 128, direita = 129, esquerda = 130, baixo = 131, cima2 = 527, direita2 = 528, esquerda2 = 529, baixo2 = 530}, -- Shiny Scyther
            ["Hitmontop"] = {out = 1193, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --Hitmontop
            ["Shiny Hitmontop"] = {out = 1451, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --Shiny Hitmontop 
            ["Pineco"] = {out = 1194, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --pineco
            ["Forretress"] = {out = 910, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --Forretress
            ["Wobbuffet"] = {out = 924, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --wobb
            ["Alakazam"] = {out = 569, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --alaka
            ["Kadabra"] = {out = 570, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --kadabra
            ["Shiny Abra"] = {out = 1257, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --s abra
            ["Kangaskhan"] = {out = 549, cima = 255, direita = 255, esquerda = 255, baixo = 255}, --test
            ["Shiny Scizor"] = {out = 2265, cima = 527, direita = 528, esquerda = 529, baixo = 530}, --test     
        }
        
        if isMega(cid) then return true end
        
        if getPlayerStorageValue(cid, 32623) == 1 then --proteçao pra n usar a passiva 2x seguidas...
            setPlayerStorageValue(cid, 32623, 0) 
            return true
        end
        
        
        local nome1 = doCorrectString(getCreatureName(cid)) --alterado v1.6.1
        local outfitt = OutFit[nome1] --alterado v1.6.1 
        
        local sortTypeScyther = math.random(1,5)
        
        local function doDamage(cid, min, max)
            if isCreature(cid) then
                if isInArray({"Pineco"}, nome1) then --alterado v1.6
                    damage = BUGDAMAGE 
                elseif isInArray({"Scyther", "Shiny Scyther"}, nome1) then -- alterado Sam. Agora a passiva pode ser bug ou fly(dano e effect). 
                    -- mais acima /\
                    if sortTypeScyther <= 3 then
                        damage = BUGDAMAGE 
                    else
                        damage = FLYINGDAMAGE
                    end
                elseif isInArray({"Hitmontop", "Shiny Hitmontop"}, nome1) then 
                    damage = FIGHTINGDAMAGE --alterado v1.6.1
                elseif isInArray({"Kangaskhan"}, nome1) then 
                    damage = GROUNDDAMAGE
                else 
                    damage = STEELDAMAGE
                end
                doAreaCombatHealth(cid, damage, getThingPosWithDebug(cid), scyther5, -min, -max, CONST_ME_NONE) --alterado v1.6.1
                ---
                if isInArray({"Scyther", "Shiny Scyther"}, nome1) and sortTypeScyther <= 3 then
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe1, 0, 0, outfitt.cima2) --cima
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe2, 0, 0, outfitt.baixo2) --baixo
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe3, 0, 0, outfitt.direita2) --direita
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe4, 0, 0, outfitt.esquerda2) --esquerda
                else
                    if isInArray({"Kangaskhan"}, nome1) then 
                        doSendMagicEffect(posC1, 127)
                    end
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe1, 0, 0, outfitt.cima) --cima
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe2, 0, 0, outfitt.baixo) --baixo
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe3, 0, 0, outfitt.direita) --direita
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe4, 0, 0, outfitt.esquerda) --esquerda
                end
            end
        end
        
        local function sendEff(cid)
            if isCreature(cid) then
                if isInArray({"Scyther", "Shiny Scyther"}, nome1) and sortTypeScyther <= 3 then
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe1, 0, 0, outfitt.cima2) --cima
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe2, 0, 0, outfitt.baixo2) --baixo
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe3, 0, 0, outfitt.direita2) --direita --alterado v1.6
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe4, 0, 0, outfitt.esquerda2) --esquerda
                else
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe1, 0, 0, outfitt.cima) --cima
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe2, 0, 0, outfitt.baixo) --baixo
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe3, 0, 0, outfitt.direita) --direita --alterado v1.6
                    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPos(cid), scythe4, 0, 0, outfitt.esquerda) --esquerda
                end      
            end
        end 
        
        local function doChangeO(cid)
            if not isCreature(cid) then return true end
            setPlayerStorageValue(cid, 32623, 0) 
            if isSleeping(cid) and getMonsterInfo(getCreatureName(cid)).lookCorpse ~= 0 and not isMega(cid) then
                doSetCreatureOutfit(cid, {lookType = 0, lookTypeEx = getMonsterInfo(getCreatureName(cid)).lookCorpse}, -1)
            else
                if not isMega(cid) then
                doRemoveCondition(cid, CONDITION_OUTFIT)
                end
            end
        end
        
        local delay = 200 -- não mexe
        local master = isSummon(cid) and getCreatureMaster(cid) or cid --alterado v1.6
        local summons = getCreatureSummons(master) 
        
        if (isPlayer(master) and #summons >= 2) or (ehMonstro(master) and #summons >= 1) then
            for j = 1, #summons do
                setPlayerStorageValue(summons[j], 32623, 1) 
                doSetCreatureOutfit(summons[j], {lookType = outfitt.out}, -1)
                
                for i = 1, 2 do --alterado v1.6
                    addEvent(sendEff, delay*i, summons[j])
                end
                addEvent(doChangeO, 2 * 300 + 10, summons[j])
                for i = 1, 2 do
                    addEvent(doDamage, delay*i, summons[j], min, max)
                end
            end
        else
            setPlayerStorageValue(cid, 32623, 1) 
            setPlayerStorageValue(cid, 98654, 1)         
            doSetCreatureOutfit(cid, {lookType = outfitt.out}, -1)
            
            for i = 1, 2 do --alterado v1.6
                addEvent(doDamage, delay*i, cid, min, max)
            end
            addEvent(doChangeO, 2 * 300 + 10, cid) 
        end
        
    elseif spell == "Lava-Counter" then
        
        local function sendStickEff(cid, dir)
            if not isCreature(cid) then return true end
            doAreaCombatHealth(cid, FIREDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 5)
        end
        
        local function doStick(cid)
            if not isCreature(cid) then return true end
            local t = {
                [1] = SOUTHWEST,
                [2] = SOUTH,
                [3] = SOUTHEAST,
                [4] = EAST,
                [5] = NORTHEAST,
                [6] = NORTH,
                [7] = NORTHWEST,
                [8] = WEST,
                [9] = SOUTHWEST,
            }
            for a = 1, 9 do
                addEvent(sendStickEff, a * 140, cid, t[a])
            end
        end
        
        doStick(cid, false, cid)
        setPlayerStorageValue(cid, 98654, 1)
        
    elseif spell == "Mega Drain" then
        
        local function getCreatureHealthSecurity(cid)
            if not isCreature(cid) then return 0 end
            return getCreatureHealth(cid) or 0
        end
        
        local uid = checkAreaUid(getThingPos(cid), check, 1, 1)
        for _,pid in pairs(uid) do
            if isCreature(cid) and isCreature(pid) and pid ~= cid then
                if isPlayer(pid) and #getCreatureSummons(pid) >= 1 then return false end
                
                local life = getCreatureHealthSecurity(pid)
                
                doAreaCombatHealth(cid, GRASSDAMAGE, getThingPos(pid), 0, -min, -max, 14)
                
                local newlife = life - getCreatureHealthSecurity(pid)
                
                doSendMagicEffect(getThingPos(cid), 14)
                setPlayerStorageValue(cid, 98654, 1)
                
                if newlife >= 1 then
                    doCreatureAddHealth(cid, newlife)
                    doSendAnimatedText(getThingPos(cid), "+"..newlife.."", 32)
                end 
                
            end
        end
        
    elseif spell == "Spores Reaction" then
        
        local random = math.random(1, 3)
        
        if random == 1 then
            local ret = {}
            ret.id = 0
            ret.cd = math.random(2, 3)
            ret.check = 0 --alterado v1.6
            ret.first = true
            ret.cond = "Sleep"
            
            doMoveInArea2(cid, 27, confusion, GRASSDAMAGE, 0, 0, "Spores Reaction", ret)
            setPlayerStorageValue(cid, 98654, 1)
        elseif random == 2 then 
            local ret = {}
            ret.id = 0
            ret.cd = math.random(3, 7)
            ret.eff = 0
            ret.check = 0
            ret.spell = spell
            ret.cond = "Stun"
            
            doMoveInArea2(cid, 85, confusion, GRASSDAMAGE, 0, 0, "Spores Reaction", ret) 
            setPlayerStorageValue(cid, 98654, 1)     
        else
            local ret = {}
            ret.id = 0
            ret.cd = math.random(6, 10)
            ret.check = 0
            local lvl = isSummon(cid) and getMasterLevel(cid) or getPokemonLevel(cid) --alterado v1.6
            local heldPercent = 1
            local dano = (getPokemonLevel(cid)+lvl * 3)/2 

            if isSummon(cid) then
                local heldx = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "xHeldItem")
                if heldx then
                    local heldName, heldTier = string.explode(heldx, "|")[1], string.explode(heldx, "|")[2]
                    if heldName == "X-Poison" then -- dar mais experiencia
                        heldPercent = heldPoisonBurn[tonumber(heldTier)]
                    end
                end
            end         
    
            if isSummon(target) then
                local heldy = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "yHeldItem")
                if heldy then
                    local heldName, heldTier = string.explode(heldy, "|")[1], string.explode(heldy, "|")[2]
                    if heldName == "Y-Antipoison" then -- ANTIPoison
                        dano = dano / 2
                    end
                else
                    dano = dano
                end 
            end
                    
            ret.damage = math.floor(dano + (heldPercent * dano / 100))
            ret.cond = "Poison"         
            doMoveInArea2(cid, 84, confusion, POISONDAMAGE, 0, 0, "Spores Reaction", ret) 
            setPlayerStorageValue(cid, 98654, 1)
        end
        
    elseif spell == "Stunning Confusion" then
        
        -- if getPlayerStorageValue(cid, 32623) == 1 then --proteçao pra n usar a spell 2x seguidas...
        --     return true
        -- end
        
        -- local function damage(cid)
        --     if isCreature(cid) then
        --         doAreaCombatHealth(cid, PSYCHICDAMAGE, getThingPosWithDebug(cid), bombWee3, -min, -max, 133)
        --     end
        -- end
        
        -- setPlayerStorageValue(cid, 32623, 1) --proteçao
        
        -- for i = 1, 7 do
        --     addEvent(damage, i*500, cid)
        -- end
        
        -- addEvent(setPlayerStorageValue, 3500, cid, 32623, 0) --proteçao
        -- setPlayerStorageValue(cid, 98654, 1)

        local function sendStickEff(cid, dir)
            if not isCreature(cid) then return true end
            doAreaCombatHealth(cid, NORMALDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 133)
        end
        
        local function doStick(cid)
            if not isCreature(cid) then return true end
            local t = {
                [1] = SOUTHWEST,
                [2] = SOUTH,
                [3] = SOUTHEAST,
                [4] = EAST,
                [5] = NORTHEAST,
                [6] = NORTH,
                [7] = NORTHWEST,
                [8] = WEST,
                [9] = SOUTHWEST,
            }
            for a = 1, 9 do
                addEvent(sendStickEff, a * 140, cid, t[a])
            end
        end
        
        doStick(cid, false, cid)
        setPlayerStorageValue(cid, 98654, 1) 
        
    elseif spell == "Bone-Spin" then
        
        local function sendStickEff(cid, dir)
            if not isCreature(cid) then return true end
            doAreaCombatHealth(cid, GROUNDDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 227)
        end
        
        local function doStick(cid)
            if not isCreature(cid) then return true end
            local t = {
                [1] = SOUTHWEST,
                [2] = SOUTH,
                [3] = SOUTHEAST,
                [4] = EAST,
                [5] = NORTHEAST,
                [6] = NORTH,
                [7] = NORTHWEST,
                [8] = WEST,
                [9] = SOUTHWEST,
            }
            for a = 1, 9 do
                addEvent(sendStickEff, a * 140, cid, t[a])
            end
        end
        
        doStick(cid, false, cid)
        setPlayerStorageValue(cid, 98654, 1)
        --alterado v1.4
    elseif spell == "Amnesia" then
        
        if getPlayerStorageValue(cid, 253) >= 1 then return true end
        
        doCreatureSay(cid, "????", 20) 
        doSendMagicEffect(getThingPosWithDebug(cid), 132)
        setPlayerStorageValue(cid, 253, 1)
        setPlayerStorageValue(cid, 98654, 1)
        
    elseif spell == "Dragon Fury" or spell == "Dragon Rage" then
        
        if getPlayerStorageValue(cid, 32623) == 1 then
            return true
        end
        
        setPlayerStorageValue(cid, 32623, 1)
        setPlayerStorageValue(cid, 98654, 1)
        
        if isInArray({"Persian", "Raticate", "Shiny Raticate"}, getSubName(cid, target)) then --alterado v1.6.1
            doRaiseStatus(cid, 1.5, 0, 0, 10)
        else --alterado v1.5 
            doRaiseStatus(cid, 1.5, 1.5, 0, 10) --ver isso
        end
        
        for t = 1, 7 do --alterado v1.5
            addEvent(sendMoveEffect, t*1500, cid, 818)
        end
        addEvent(setPlayerStorageValue, 10500, cid, 32623, 0) --alterado v1.8
        
    elseif spell == "Electric Charge" then
        
        if getPlayerStorageValue(cid, 253) >= 1 then
            return true
        end
        
        setPlayerStorageValue(cid, 253, 1)
        setPlayerStorageValue(cid, 98654, 1)
        doSendMagicEffect(getThingPosWithDebug(cid), 207)
        doSendAnimatedText(getThingPosWithDebug(cid), "FOCUS", 144)

    elseif spell == "Stockpile" then
    
        if getPlayerStorageValue(cid, 5000004) <= 0 then
            setPlayerStorageValue(cid, 5000004, 1)
                doSetCreatureOutfit(cid, {lookType = 1837}, 1000000)
        elseif getPlayerStorageValue(cid, 5000004) == 1 then
            doSetCreatureOutfit(cid, {lookType = 1838}, 1000000)
                setPlayerStorageValue(cid, 5000004, 2)
        elseif getPlayerStorageValue(cid, 5000004) == 2 then
            doSetCreatureOutfit(cid, {lookType = 1839}, 1000000)
                setPlayerStorageValue(cid, 5000004, 3)
        elseif getPlayerStorageValue(cid, 5000004) == 3 then
            doSendAnimatedText(getThingPosWithDebug(cid), "MAXIMUM!", 144)      
            return true
        end

    elseif spell == "Spit Up" then
    
        if getPlayerStorageValue(cid, 5000004) == 1 then
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
            doDanoInTargetWithDelay(cid, target, STEELDAMAGE, -min*1, -max*1, 77) 
            setPlayerStorageValue(cid, 5000004, 0)              
            doSetCreatureOutfit(cid, {lookType = 1735}, -1)             
        elseif getPlayerStorageValue(cid, 5000004) == 2 then
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
            doDanoInTargetWithDelay(cid, target, STEELDAMAGE, -min*2, -max*2, 77) 
            setPlayerStorageValue(cid, 5000004, 0)              
            doSetCreatureOutfit(cid, {lookType = 1735}, -1)             
        elseif getPlayerStorageValue(cid, 5000004) == 3 then
            doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
            doDanoInTargetWithDelay(cid, target, STEELDAMAGE, -min*3, -max*3, 77)
            setPlayerStorageValue(cid, 5000004, 0)  
            doSetCreatureOutfit(cid, {lookType = 1735}, -1)             
            return true
        end 
        
    elseif spell == "Swallow" then
    
    local newlife = getCreatureMaxHealth(cid)
    
        if getPlayerStorageValue(cid, 5000004) == 1 then
            doCreatureAddHealth(cid, getCreatureMaxHealth(cid) / 2.5)
                setPlayerStorageValue(cid, 5000004, 0)  
                    doSetCreatureOutfit(cid, {lookType = 1735}, -1)
            doSendAnimatedText(getThingPosWithDebug(cid), "+"..(newlife/2.5).."", 32)                           
        elseif getPlayerStorageValue(cid, 5000004) == 2 then
            doCreatureAddHealth(cid, getCreatureMaxHealth(cid) / 2)     
                setPlayerStorageValue(cid, 5000004, 0)  
                    doSetCreatureOutfit(cid, {lookType = 1735}, -1)     
            doSendAnimatedText(getThingPosWithDebug(cid), "+"..(newlife/2).."", 32)                         
        elseif getPlayerStorageValue(cid, 5000004) == 3 then
            doCreatureAddHealth(cid, getCreatureMaxHealth(cid))     
                setPlayerStorageValue(cid, 5000004, 0)  
                    doSetCreatureOutfit(cid, {lookType = 1735}, -1)
            doSendAnimatedText(getThingPosWithDebug(cid), "+"..newlife.."", 32)                 
            return true
        end
        
    elseif spell == "Shock-Counter" then
        
        local function sendStickEff(cid, dir)
            if not isCreature(cid) then return true end
            doAreaCombatHealth(cid, ELECTRICDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 207)
        end
        
        local function doStick(cid)
            if not isCreature(cid) then return true end
            local t = {
                [1] = SOUTHWEST,
                [2] = SOUTH,
                [3] = SOUTHEAST,
                [4] = EAST,
                [5] = NORTHEAST,
                [6] = NORTH,
                [7] = NORTHWEST,
                [8] = WEST,
                [9] = SOUTHWEST,
            }
            for a = 1, 9 do
                addEvent(sendStickEff, a * 140, cid, t[a])
            end
        end
        
        doStick(cid, false, cid)
        setPlayerStorageValue(cid, 98654, 1)
        
    elseif spell == "Static" then
        
        local function sendStickEff(cid, dir)
            if not isCreature(cid) then return true end
            doAreaCombatHealth(cid, ELECTRICDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 0)
        end
        
        local function doStick(cid)
            if not isCreature(cid) then return true end
            local t = {
                [1] = SOUTHWEST,
                [2] = SOUTH,
                [3] = SOUTHEAST,
                [4] = EAST,
                [5] = NORTHEAST,
                [6] = NORTH,
                [7] = NORTHWEST,
                [8] = WEST,
                [9] = SOUTHWEST,
            }
            for a = 1, 9 do
                addEvent(sendStickEff, a * 1, cid, t[a])
            end
            local posC2 = posC1
            posC2.x = posC2.x+1
            if isInArray({"Shiny Electabuzz", "Shiny Electivire"}, getSubName(cid, target)) then
                eff = 539 -- azul. Tem o 642 q é preto com azul
            else
                eff = 540 -- preto com amarelo. 
            end
            doSendMagicEffect(posC2, eff)   
        end
        
        doStick(cid, false, cid)
        setPlayerStorageValue(cid, 98654, 1)
        
    elseif spell == "Superpower" then
        
        local function sendStickEff(cid, dir)
            if not isCreature(cid) then return true end
            doAreaCombatHealth(cid, FIGHTINGDAMAGE, getPosByDir(getThingPosWithDebug(cid), dir), 0, -min, -max, 0)
        end
        
        local function doStick(cid)
            if not isCreature(cid) then return true end
            local t = {
                [1] = SOUTHWEST,
                [2] = SOUTH,
                [3] = SOUTHEAST,
                [4] = EAST,
                [5] = NORTHEAST,
                [6] = NORTH,
                [7] = NORTHWEST,
                [8] = WEST,
                [9] = SOUTHWEST,
            }
            for a = 1, 9 do
                addEvent(sendStickEff, a * 1, cid, t[a])
            end
            --  local posC2 = posC1
            --  posC2.x = posC2.x+1
            if isInArray({"Shiny Lucario"}, getSubName(cid, target)) then
                eff = 450 
            else
                eff = 449 
            end
            doSendMagicEffect(posC1, eff)   
        end
        
        doStick(cid, false, cid)
        setPlayerStorageValue(cid, 98654, 1)
        
        
    elseif spell == "Mirror Coat" then
        
        if spell == "Magic Coat" then
            eff = 11
        else
            eff = 135
        end
        
        doSendMagicEffect(getThingPosWithDebug(cid), eff)
        setPlayerStorageValue(cid, 21099, 2) 
        setPlayerStorageValue(cid, 98654, 1)    
        
    elseif spell == "Zen Mind" then
        
        function doCure(cid)
            if not isCreature(cid) then return true end
            if isSummon(cid) then 
                doCureBallStatus(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "all")
            end
            doCureStatus(cid, "all")
        end
        
        addEvent(doCure, 1000, cid)
        doSetCreatureOutfit(cid, {lookType = 1001}, 2000)
        setPlayerStorageValue(cid, 98654, 1)
        
    elseif spell == "Detect" then
        local function retireStatus(cid)
            if not isCreature(cid) then return true end
            setPlayerStorageValue(cid, 9658783, -1)
        end
        
        local function doRemoveEffect(cid)
            if not isCreature(cid) then return true end
            doRegainSpeed(cid)
            setPlayerStorageValue(cid, 9658783, 1) -- nao velar dano
            addEvent(retireStatus, 5000, cid)
        end
        
        doChangeSpeed(cid, -getCreatureSpeed(cid))
        addEvent(doRemoveEffect, 1000, cid)
        pos = getThingPos(cid)
        pos.x = pos.x + 2
        pos.y = pos.y +2
        doSendMagicEffect(pos, 375)
        
    elseif spell == "Sturdy" then
        
        local function doKillWildPokeWhiteSecuirty(cid)
            if not isCreature(cid) then return true end
            doKillWildPoke(cid, cid)
        end 
        
        local outfit = 2121
        if isMega(cid) then 
            outfit = 1865
        elseif getCreatureName(cid) == "Sudowoodo" or getCreatureName(cid) == "Shiny Sudowoodo" then
            outfit = 2122
        end
        
        doSetCreatureOutfit(cid, {lookType = outfit}, -1)
        setPlayerStorageValue(cid, 9658783, 1) -- nao velar dano
        addEvent(doKillWildPokeWhiteSecuirty, 6000, cid)

elseif spell == "Demon Kicker" then

--[outfit] = outfit chutando,
local hitmonlees = {
["Hitmonlee"] =  652,      --hitmonlee
["Shiny Hitmonlee"] = 878,  --shiny hitmonlee
}
   
   local nome = getCreatureName(cid)  
                                                --alterado v1.6                                        --alterado v1.7
if (not hitmonlees[nome] and isCreature(target)) or (isCreature(target) and math.random(1, 100) <= passivesChances["Demon Kicker"][nome]) then
                                                         
      if getDistanceBetween(getThingPos(cid), getThingPos(target)) > 1 then
      return true
      end
      if getPlayerStorageValue(cid, 32623) == 1 then  --proteçao pra n usar a passiva 2x seguidas...
      return true
      end
      
      if not isSummon(cid) then       --alterado v1.7
         doCreatureSay(cid, string.upper(spell).."!", TALKTYPE_MONSTER)
      end
      
      local function doChangeHitmon(cid)
      if not isCreature(cid) then return true end
         setPlayerStorageValue(cid, 32623, 0)         --proteçao
         if isSleeping(cid) and getMonsterInfo(getCreatureName(cid)).lookCorpse ~= 0 and not isMega(cid) then
            doSetCreatureOutfit(cid, {lookType = 0, lookTypeEx = getMonsterInfo(getCreatureName(cid)).lookCorpse}, -1)
         else
            if not isMega(cid) then
            doRemoveCondition(cid, CONDITION_OUTFIT)
            end
         end
      end            
       
         setPlayerStorageValue(cid, 32623, 1)       --proteçao
         setPlayerStorageValue(cid, 98654, 1)
         
         local look = hitmonlees[nome] or getPlayerStorageValue(cid, 21104)  --alterado v1.6
   
         doCreatureSetLookDir(cid, getCreatureDirectionToTarget(cid, target))
         doSetCreatureOutfit(cid, {lookType = look}, -1)   --alterado v1.6
         doTargetCombatHealth(cid, target, FIGHTINGDAMAGE, -min, -max, 255)
         
         addEvent(doChangeHitmon, 700, cid)          
end

elseif spell == "Illusion" then

local team = {
["Misdreavus"] = "MisdreavusTeam",
["Shiny Stantler"] = "Shiny StantlerTeam",
["Stantler"] = "StantlerTeam",
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
local time = 5

doItemSetAttribute(item.uid, "hp", (life/maxLife))

local num = getSubName(cid, target) == "Misdreavus" and 3 or 2
local pk = {}

doTeleportThing(cid, {x=4, y=3, z=10}, true) 

if team[name] then
   pk[1] = cid
   for b = 2, num do
       pk[b] = doSummonCreature(team[name], pos)
       doConvinceCreature(master, pk[b])
   end

   for a = 1, num do
      addEvent(doTeleportThing, math.random(0, 5), pk[a], getClosestFreeTile(pk[a], pos), true)
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


elseif spell == "Demon Puncher" then

   local name = getCreatureName(cid)
                                                                                                             --alterado v1.7
if (not hitmonchans[name] and isCreature(target)) or (isCreature(target) and math.random(1, 100) <= passivesChances["Demon Puncher"][name]) then 
                                                        
       if getDistanceBetween(getThingPosWithDebug(cid), getThingPosWithDebug(target)) > 1 then
       return true
       end
       
       if not isSummon(cid) then       --alterado v1.7
         doCreatureSay(cid, string.upper(spell).."!", TALKTYPE_MONSTER)
       end                                 
         
         if ehMonstro(cid) or not hitmonchans[name] then
            hands = 0
         else
            hands = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "hands")
         end
         
         if not hitmonchans[name] then
            tabela = hitmonchans[getCreatureName(target)][hands]
         else
            tabela = hitmonchans[name][hands]
         end
          
         doSendDistanceShoot(getThingPosWithDebug(cid), getThingPosWithDebug(target), 39)
         doTargetCombatHealth(cid, target, tabela.type, -min, -max, 255)
         
         local alvo = getThingPosWithDebug(target)
         alvo.x = alvo.x + 1                           ---alterado v1.7
         
         if hands == 4 then
            doSendMagicEffect(alvo, tabela.eff)
         else
            doSendMagicEffect(getThingPosWithDebug(target), tabela.eff)
         end
         
         if hands == 3 then
            local ret = {}
            ret.id = target
            ret.cd = 9                     --alterado v1.6
            ret.eff = 43
            ret.check = getPlayerStorageValue(target, conds["Slow"])
            ret.first = true
            ret.cond = "Slow"
         
            doMoveDano2(cid, target, FIGHTINGDAMAGE, 0, 0, ret, spell)
            setPlayerStorageValue(cid, 98654, 1)
         end  
end

elseif string.find(spell:lower(), "mega -") then
        doTransformMega(cid)
end

return true 
end

function doPoisonPoke(cid, target)

local name = doCorrectString(getCreatureName(cid))

local ret = {}

        local lvl = isSummon(cid) and getMasterLevel(cid) or getPokemonLevelD(name)
        
        ret.id = target
        ret.cd = isMega(cid) and math.random(12, 20) or math.random(6, 15)  
        ret.color = (isMega(cid) and getMegaID(cid) == "X") and 28 or 12
        ret.check = 0
    
        local dan = math.floor((getPokemonLevelD(name)+lvl * 1.4)/15)
        local dano = math.floor((getPokemonLevelD(name)+lvl * 1.6) - dan)
        
        ret.damage = dano
        ret.cond = "Poison"  
        ret.im = target
        ret.attacker = cid   
   
        doCondition2(ret)
end

function doBurnPoke(cid, target)

local heldPercent = 1           
local name = doCorrectString(getCreatureName(cid))
local lvl = isSummon(cid) and getMasterLevel(cid) or getPokemonLevelD(name)
local dan = math.floor((getPokemonLevelD(name)+lvl * 1.4)/15)
local dano = math.floor((getPokemonLevelD(name)+lvl * 1.6)/3 - dan) 

local ret = {}
        ret.id = target
        ret.cd = isMega(cid) and math.random(12, 20) or math.random(6, 15)
        
        if isInArray({"Magmar"}, getSubName(cid, target)) then
            ret.cd = math.random(4, 10)
        end
        
        if isInArray({"Dusclops", "Dusknoir", "Banette"}, getSubName(cid, target)) then
            ret.eff = 749
        elseif isInArray({"Ninetales", "Shiny Ninetales", "Rapidash"}, getSubName(cid, target)) and getPlayerStorageValue(cid, 94379) >= 1 then -- storage do fire spin 
            if getPlayerStorageValue(cid, 90177) >= 1 then -- storage do blue flames (fire spin)
                ret.eff = 827
            else
                ret.eff = 416
            end
            ret.cd = 6
        elseif isMega(cid) and getMegaID(cid) == "X" then
            ret.eff = 302   
        else
            if getPlayerStorageValue(cid, 90177) >= 1 then  -- blue flames?
                ret.eff = 302
            else
                ret.eff = 15
            end 
        end
    
        ret.color = (isMega(cid) and getMegaID(cid) == "X") and 28 or COLOR_BURN
        ret.check = 0
        
            -- if getCreatureMaster(cid) then

            --     if isSummon(cid) then
            --         local heldx = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "xHeldItem") or ""
            --         if heldx then
            --             local heldName, heldTier = string.explode(heldx, "|")[1] or "", string.explode(heldx, "|")[2] or ""
            --             if heldName == "X-Hellfire" then -- dar mais experiencia
            --                 heldPercent = heldPoisonBurn[tonumber(heldTier)]
            --             end
            --         end
            --     end
                
            --     if isSummon(target) then
            --         local heldy = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "yHeldItem") or ""
            --         if heldy then
            --             local heldName, heldTier = string.explode(heldy, "|")[1] or "", string.explode(heldy, "|")[2] or ""
            --             if heldName == "Y-Antiburn" then -- ANTIBURN
            --                 dano = dano / 2
            --             end
            --         else
            --             dano = dano
            --         end 
            --     end

            -- end

        ret.damage = dano + (heldPercent * dano / 100)
        ret.cond = "Burn"  
        ret.im = target
        ret.attacker = cid      
        doCondition2(ret)
end

function isMega(cid) 
    if getPlayerStorageValue(cid, storages.isMega) ~= -1 then
        return true
    end
    return false
end

function doTransformMega(cid)
    local name = doCorrectString(getCreatureName(cid))
    local wildMult = 1.8
    local megaID = ""
    if isSummon(cid) then
        local master = getCreatureMaster(cid)
        if getItemAttribute(getPlayerSlotItem(master, 8).uid, "megaID") and getItemAttribute(getPlayerSlotItem(master, 8).uid, "megaID") ~= "" then
           megaID = getItemAttribute(getPlayerSlotItem(master, 8).uid, "megaID")
        end
    else 
       megaID = getPlayerStorageValue(cid, storages.isMegaID)
    end
    local megaName = "Mega " .. name .. (megaID ~= "" and " " .. megaID or "")
    if megasConf[megaName] then
        setPlayerStorageValue(cid, storages.isMega, megaName)
        
        
        doRegainSpeed(cid)       --alterado!
        local pos = getThingPos(cid)
              pos.x = pos.x + 1
              pos.y = pos.y +1
        doSendMagicEffect(pos, 287)
        
        if isSummon(cid) then
           local master = getCreatureMaster(cid)
           doUpdateMoves(master)
           wildMult = 1
           setPlayerStorageValue(cid, storages.isMegaID, megaID)
        end
        
        setPlayerStorageValue(cid, 1001, megasConf[megaName].offense * wildMult)
        setPlayerStorageValue(cid, 1002, megasConf[megaName].defense) -- * wildMult
        setPlayerStorageValue(cid, 1003, megasConf[megaName].agility)           
        setPlayerStorageValue(cid, 1005, megasConf[megaName].specialattack * wildMult)
        
        if wildMult == 1.8 then
            local life = megasConf[megaName].wildVity * math.random(7500, 8500) -- 4000, 4500
            local lifeNow = getCreatureMaxHealth(cid) - getCreatureHealth(cid)
                  setCreatureMaxHealth(cid, life) -- perfeita formula, os pokemons "ruins" só precisam de ajustes no pokemonStatus, tabela vitality.
                  doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
                  doCreatureAddHealth(cid, -lifeNow)
                  
        end
        if isInArray({"Charizard", "Blaziken", "Ampharos"}, name) then
           doPantinOutfit(cid, 0, megaName)
        else
           doSetCreatureOutfit(cid, {lookType = megasConf[megaName].out}, -1)
           checkOutfitMega(cid, megaName)
        end
    end
end

function checkChenceToMega(cid)
    local name, chance = doCorrectString(getCreatureName(cid)), math.random(1, 3600) -- 3500
    local megaID = ""
    local percent = 100
    if percent >= 80 then
        if name == "Charizard" then
            megaID = math.random(1, 100) < 61 and "Y" or "X"
        end
        local megaName = "Mega " .. name .. (megaID ~= "" and " " .. megaID or "")
        if megasConf[megaName] and not isMega(cid) then
            if chance <= megasConf[megaName].wildChance then    -- 7
                setPlayerStorageValue(cid, storages.isMegaID, megaID)
                doTransformMega(cid)    
            end
        end
    end
end

function getMegaID(cid)
    return getPlayerStorageValue(cid, storages.isMegaID) ~= -1 and getPlayerStorageValue(cid, storages.isMegaID) or ""
end

function checkOutfitMega(cid, megaName)
    if not isCreature(cid) or not isMega(cid) then return true end
    local name = doCorrectString(getCreatureName(cid))
    if not megasConf[megaName] then return true end
    if getCreatureOutfit(cid).lookType ~= megasConf[megaName].out then
       doSetCreatureOutfit(cid, {lookType = megasConf[megaName].out}, -1)
    end
    addEvent(checkOutfitMega, 50, cid)
end

function doPantinOutfit(cid, times, megaName)
    if not isCreature(cid) or not isMega(cid) then return true end
    if getCreatureOutfit(cid).lookType == 1875 or getCreatureOutfit(cid).lookType == 2 then return true end
    local name = doCorrectString(getCreatureName(cid))
    if not megasConf[megaName] then return true end
    local outfitIndex = 1
    if times <= 500 then
        outfitIndex = 1
    elseif times > 500 and times <= 1000 then 
       outfitIndex = 2
    elseif times > 1000 and times <= 1500 then 
       outfitIndex = 3
    end
    doSetCreatureOutfit(cid, {lookType = megasConf[megaName].out[outfitIndex]}, -1)
    times = times + 50
    if times > 1500 then
       times = 0
    end
    addEvent(doPantinOutfit, 50, cid, times, megaName)
end