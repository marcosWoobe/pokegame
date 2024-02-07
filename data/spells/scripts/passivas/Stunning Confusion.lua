function onCastSpell(cid, var)
    -----------------\/padrão para todos os arquivos------------
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
                min = getSpecialAttack(cid) * table.f * 0.25   --alterado v1.6
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
    ---------------------fim da padrão /\ e aparti daqui \/ é o code da spell------------------------------


--lava-counter
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

--new
    -- if getPlayerStorageValue(cid, 32623) == 1 then --proteçao pra n usar a spell 2x seguidas...
    --   return true
    -- end
    
    -- local function damage(cid)
    --   if isCreature(cid) then
    --     doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(cid), bombWee3, -min, -max, 133)
    --   end
    -- end
    
    -- setPlayerStorageValue(cid, 32623, 1) --proteçao
    
    -- for i = 1, 7 do
    --   addEvent(damage, i*500, cid)
    -- end
    
    -- addEvent(setPlayerStorageValue, 3500, cid, 32623, 0) --proteçao


--old
    -- setPlayerStorageValue(cid, 98654, 1)


      -- if getPlayerStorageValue(cid, 32623) == 1 then  --proteÃ§ao pra n usar a spell 2x seguidas...
      -- return true
      -- end
      
      -- local function damage(cid)
      -- if isCreature(cid) then
      --    doAreaCombatHealth(cid, NORMALDAMAGE, getThingPosWithDebug(cid), bombWee3, -min, -max, 136)
      -- end
      -- end
          
      -- setPlayerStorageValue(cid, 32623, 1)        --proteÃ§ao
      -- for i = 1, 2 do
      --     addEvent(damage, i*500, cid)
      -- end
      -- addEvent(setPlayerStorageValue, 3500, cid, 32623, 0)        --proteÃ§ao
      
return true
end
