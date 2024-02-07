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

local OutFit = {
["Scyther"] = {out = 496, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --scyther
["Scizor"] = {out = 918, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --Scizor
["Shiny Scyther"] = {out = 849, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --Shiny Scyther
["Hitmontop"] = {out = 1193, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --Hitmontop
["Shiny Hitmontop"] = {out = 1451, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --Shiny Hitmontop    
["Pineco"] = {out = 1194, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --pineco
["Forretress"] = {out = 1192, cima = 128, direita = 129, esquerda = 130, baixo = 131}, --Forretress
["Wobbuffet"] = {out = 924, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --wobb
["Alakazam"] = {out = 569, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --alaka
["Kadabra"] = {out = 570, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --kadabra
["Shiny Abra"] = {out = 1257, cima = 128, direita = 129, esquerda = 130, baixo = 131},  --s abra
["Kangaskhan"] = {out = 549, cima = 251, direita = 253, esquerda = 254, baixo = 252},  --test
}
      
      if getPlayerStorageValue(cid, 32623) == 1 then  --proteçao pra n usar a passiva 2x seguidas...
      return true
      end
	  
      
      local nome1 = getSubName(cid, target)   --alterado v1.6.1
      local outfitt = OutFit[nome1]   --alterado v1.6.1        

      local function damage(cid, min, max)
      if isCreature(cid) then
         if isInArray({"Scyther", "Shiny Scyther", "Pineco"}, nome1) then   --alterado v1.6
            damage = BUGDAMAGE  
         elseif isInArray({"Hitmontop", "Shiny Hitmontop", "Kangaskhan"}, nome1) then               
            damage = FIGHTINGDAMAGE                --alterado v1.6.1
         else                                        
            damage = STEELDAMAGE
         end
         doAreaCombatHealth(cid, damage, getThingPosWithDebug(cid), scyther5, -min, -max, CONST_ME_NONE) --alterado v1.6.1
         ---
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe1, 0, 0, outfitt.cima) --cima
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe2, 0, 0, outfitt.baixo) --baixo
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe3, 0, 0, outfitt.direita) --direita
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe4, 0, 0, outfitt.esquerda)  --esquerda
      end
      end
      
      local function sendEff(cid)
      if isCreature(cid) then
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe1, 0, 0, outfitt.cima) --cima
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe2, 0, 0, outfitt.baixo) --baixo
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe3, 0, 0, outfitt.direita) --direita       --alterado v1.6
         doAreaCombatHealth(cid, null, getThingPos(cid), scythe4, 0, 0, outfitt.esquerda)  --esquerda
      end
      end   

      local function doChangeO(cid)
	  if not isCreature(cid) then return true end
         setPlayerStorageValue(cid, 32623, 0)      
         if isSleeping(cid) and getMonsterInfo(getCreatureName(cid)).lookCorpse ~= 0 then
            doSetCreatureOutfit(cid, {lookType = 0, lookTypeEx = getMonsterInfo(getCreatureName(cid)).lookCorpse}, -1)
         else
             doRemoveCondition(cid, CONDITION_OUTFIT)
         end
      end
      
      local delay = 200 -- não mexe
      local master = isSummon(cid) and getCreatureMaster(cid) or cid                    --alterado v1.6
      local summons = getCreatureSummons(master)                                          
      
      if (isPlayer(master) and #summons >= 2) or (ehMonstro(master) and #summons >= 1) then
         for j = 1, #summons do
             setPlayerStorageValue(summons[j], 32623, 1)      
	         doSetCreatureOutfit(summons[j], {lookType = outfitt.out}, -1)

             for i = 1, 2 do                                                                     --alterado v1.6
                 addEvent(sendEff, delay*i, summons[j])
             end
             addEvent(doChangeO, 2 * 300 + 10, summons[j])
         end
         for i = 1, 2 do
             addEvent(damage, delay*i, (isPlayer(master) and summons[1] or master), min, max)
         end
      else
         setPlayerStorageValue(cid, 32623, 1)    
   setPlayerStorageValue(cid, 98654, 1)		 
         doSetCreatureOutfit(cid, {lookType = outfitt.out}, -1)
   
         for i = 1, 2 do                                                                 --alterado v1.6
             addEvent(damage, delay*i, cid, min, max)
         end
         addEvent(doChangeO, 2 * 300 + 10, cid) 
      end
      

return true
end
