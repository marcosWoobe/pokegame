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


	
return true
end