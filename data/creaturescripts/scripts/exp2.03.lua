local combats = {                         --alterado v1.6 \/
    [PSYCHICDAMAGE] = {cor = COLOR_PSYCHIC},
    [GRASSDAMAGE] = {cor = COLOR_GRASS},
    [POISONEDDAMAGE] = {cor = COLOR_GRASS},
    [FIREDAMAGE] = {cor = COLOR_FIRE2},                         
    [BURNEDDAMAGE] = {cor = COLOR_BURN},
    [WATERDAMAGE] = {cor = COLOR_WATER},
    [ICEDAMAGE] = {cor = COLOR_ICE},
    [NORMALDAMAGE] = {cor = COLOR_NORMAL},
    [FLYDAMAGE] = {cor = COLOR_FLYING},           
    [GHOSTDAMAGE] = {cor = COLOR_GHOST},
    [GROUNDDAMAGE] = {cor = COLOR_GROUND},
    [ELECTRICDAMAGE] = {cor = COLOR_ELECTRIC},
    [ROCKDAMAGE] = {cor = COLOR_ROCK},
    [BUGDAMAGE] = {cor = COLOR_BUG},
    [FIGHTDAMAGE] = {cor = COLOR_FIGHTING},
    [DRAGONDAMAGE] = {cor = COLOR_DRAGON},
    [POISONDAMAGE] = {cor = COLOR_POISON},
    [DARKDAMAGE] = {cor = COLOR_DARK},               
    [STEELDAMAGE] = {cor = COLOR_STEEL},
    [MIRACLEDAMAGE] = {cor = COLOR_PSYCHIC},  
    [DARK_EYEDAMAGE] = {cor = COLOR_GHOST},
    [SEED_BOMBDAMAGE] = {cor = COLOR_GRASS},
    [SACREDDAMAGE] = {cor = COLOR_FIRE2}, 
    [MUDBOMBDAMAGE] = {cor = COLOR_GROUND}
}

--alterado v1.5  tabelas agora estao em lib/configuration.lua
local function sendPlayerDmgMsg(cid, text)
	if not isCreature(cid) then return true end
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, text)
end

local races = {
    [4] = {cor = COLOR_FIRE2},
    [6] = {cor = COLOR_WATER},
    [7] = {cor = COLOR_NORMAL},
    [8] = {cor = COLOR_FIRE2},
    [9] = {cor = COLOR_FIGHTING},
    [10] = {cor = COLOR_FLYING},
    [11] = {cor = COLOR_GRASS},
    [12] = {cor = COLOR_POISON},
    [13] = {cor = COLOR_ELECTRIC},
    [14] = {cor = COLOR_GROUND},
    [15] = {cor = COLOR_PSYCHIC},
    [16] = {cor = COLOR_ROCK},
    [17] = {cor = COLOR_ICE},
    [18] = {cor = COLOR_BUG},
    [19] = {cor = COLOR_DRAGON},
    [20] = {cor = COLOR_GHOST},
    [21] = {cor = COLOR_STEEL},
    [22] = {cor = COLOR_DARK},
    [1] = {cor = 180},
    [2] = {cor = 180},
    [3] = {cor = 180}, 
    [5] = {cor = 180},
}

local damages = {GROUNDDAMAGE, ELECTRICDAMAGE, ROCKDAMAGE, FLYDAMAGE, BUGDAMAGE, FIGHTINGDAMAGE, DRAGONDAMAGE, POISONDAMAGE, DARKDAMAGE, STEELDAMAGE}
local fixdmgs = {PSYCHICDAMAGE, COMBAT_PHYSICALDAMAGE, GRASSDAMAGE, FIREDAMAGE, WATERDAMAGE, ICEDAMAGE, NORMALDAMAGE, GHOSTDAMAGE}
local ignored = {POISONEDDAMAGE, BURNEDDAMAGE}                --alterado v1.6
local cannotkill = {BURNEDDAMAGE, POISONEDDAMAGE}

function onStatsChange(cid, attacker, type, combat, value)

    if combat == FLYSYSTEMDAMAGE then return false end
    if isPlayer(cid) and getCreatureOutfit(cid).lookType == 814 then return false end -- TV
    if not isCreature(attacker) then  --alterado v1.5 cid == attacker
	    if not isInArray(fixdamages, combat) and combats[combat] then
		    --vk--doSendAnimatedText(getThingPos(cid), value, combats[combat].cor)
	    end
        return true
    end
 
	if isSummon(cid) and isSummon(attacker) and canAttackOther(cid, attacker) == "Cant" then
	    return false
	end
	
	if ehMonstro(cid) and ehMonstro(attacker) then 
		return false                                          --edited monstro nao atacar monstro
	end
	
	--[[if isPlayer(attacker) then

	    local valor = value
	    if valor > getCreatureHealth(cid) then
		    valor = getCreatureHealth(cid)
	    end

	    if combat == COMBAT_PHYSICALDAMAGE then
	        return false
	    end

	    if combat == PHYSICALDAMAGE then
	        doSendMagicEffect(getThingPos(cid), 3)
	        --vk--doSendAnimatedText(getThingPos(cid), valor, races[getMonsterInfo(getCreatureName(cid)).race].cor)
	    end

	    if combats[damageCombat] and not isInArray(fixdmgs, damageCombat) then
	        --vk--doSendAnimatedText(getThingPos(cid), valor, combats[damageCombat].cor)
	    end

	    if #getCreatureSummons(attacker) >= 1 and not isInArray({POISONEDDAMAGE, BURNEDDAMAGE}, combat) then
		    --doPlayerSendTextMessage(attacker, cid, 20, "Seu "..getPokeName(getCreatureSummons(attacker)[1]).." causou "..valor.." de dano no "..getSomeoneDescription(cid)..".")
	    end

        return true
    end]]
	
	local A = 0
	local D = 0
	if combat == COMBAT_PHYSICALDAMAGE then
		A = getOffense(attacker)
		D = getDefense(cid)
	else
		A = getSpecialAttack(attacker)
		D = getDefense(cid)--specialDefense
	end
	
	local Level = 0
	if isCreature(attacker) and pokes[getCreatureName(attacker)] then
	    Level = pokes[getCreatureName(attacker)].level 
	end
	
	local Power = 100 --é o poder do move
	
	--if 
	local damageCombat = combat
	local poketype1 = ""
	local poketype2 = "" 
	if isCreature(cid) then
        if pokes[getCreatureName(cid)] then
     	    if pokes[getCreatureName(cid)].type then
		        poketype1 = pokes[getCreatureName(cid)].type 
				if pokes[getCreatureName(cid)].type2 then
      	        	poketype2 = pokes[getCreatureName(cid)].type2
				end
			else
			    print("Sem Type, "..getCreatureName(cid))
			end
		else
		    print("Nao ta em pokes, "..getCreatureName(cid))
		end
   	end
    if not poketype1 or not poketype2 then return false end  --alterado v1.6 
		
	local Targets = 1 --caso tiver apenas um alvo é 1 se tiver mais que 1 é 0.75 fazer isso depois
	local Weather = 1 --influencia do tempo por enquanto nao vamos usar isso deixa 1
	local Bagde = 1 --pensando ainda se vai ser influenciado pela insignia ou pelo clan
	local Critical = 1 --caso for critico é 2 fazer depois
	local Random = 1--math.random(0.85, 1) 
	local STAB = 1 --se o elemento de pokemon for igual do move será 1.5 fazer isso depois
	local Type = 1 --effectiviness
	if effectiveness[damageCombat] then
		if isInArray(effectiveness[damageCombat].non, poketype1) or isInArray(effectiveness[damageCombat].non, poketype2) then
        	Type = 0
		elseif isInArray(effectiveness[damageCombat].weak, poketype1) or isInArray(effectiveness[damageCombat].weak, poketype2) then
		    Type = 0.5
		elseif isInArray(effectiveness[damageCombat].super, poketype1) or isInArray(effectiveness[damageCombat].super, poketype2) then
		    Type = 2
    	end
	end
		
	local Burn = 1 --se tiver queimado o pokemon é 0.5 e o movimento for fisico
	if isBurning(attacker) then
		Burn = 0.5
	end
	local Other = 1 -- é 1 porem se tiver influencia de ataque ou item aumenta
	local Modifier = Targets*Weather*Bagde*Critical*Random*STAB*Type*Burn*Other
		--return Modifier
	--end
	
    local valor = value
	value = ((((((2*Level)/5)+2)*Power*A/D)/50)+2)*Modifier--getModifier(cid, attacker, combat)
	print("Value "..value)
	print("A "..A)
	print("D "..D)
	print("Type "..Type)
	--valor = 1000
	doCreatureAddHealth(cid, -value, 3, 180)
	--if isSummon(attacker) then
	    --doCreatureAddHealth(cid, -valor, 3, 180)
	--	doTargetCombatHealth(getCreatureMaster(attacker), cid, damageCombat, -valor, -valor, 255)
	--end
	--[[
------------------------------------POTIONS-------------------------------------------
    if isSummon(cid) and type == STATSCHANGE_HEALTHLOSS then
        if getPlayerStorageValue(cid, 173) >= 1 then
            if damageCombat ~= BURNEDDAMAGE and damageCombat ~= POISONEDDAMAGE then
                setPlayerStorageValue(cid, 173, -1)  --alterado v1.6
                doSendAnimatedText(getThingPos(cid), "LOST HEAL", 144)
            end
       end
    end
----------------------------------------PASSIVAS------------------------------------- --alterado v1.6 \/ todas as passivas agora estao em lib/pokemon moves.lua
-------------------------------------------Counter Helix------------------------------------
    if passivesChances["Helix"][getCreatureName(cid)] and math.random(1, 100) <= passivesChances["Helix"][getCreatureName(cid)] then
        attackPoke(cid, "Counter Helix")
    end
-------------------------------------------Lava-Counter----------------------------
    if passivesChances["Lava"][getCreatureName(cid)] and math.random(1, 100) <= passivesChances["Lava"][getCreatureName(cid)] then  
		attackPoke(cid, "Lava-Counter")
    end
-------------------------------------------Shock-Counter----------------------------
    if passivesChances["Shock"][getCreatureName(cid)] and math.random(1, 100) <= passivesChances["Shock"][getCreatureName(cid)] then
        attackPoke(cid, "Static")
    end
---viktor----------------------------------------Lava-Electricity---------------------------
    if passivesChances["Lava-Electricity"][getCreatureName(cid)] and math.random(1, 100) <= passivesChances["Lava-Electricity"][getCreatureName(cid)] then
        attackPoke(cid, "Lava-Electricity")
    end
-------------------------------------------Bone Spin----------------------------
    if passivesChances["Bone"][getCreatureName(cid)] and math.random(1, 100) <= passivesChances["Bone"][getCreatureName(cid)] then
        attackPoke(cid, "Bone Spin")
    end
---------------------------------------Stunning Confusion-----------------------------------------
    if passivesChances["Stunning"][getCreatureName(cid)] and math.random(1, 100) <= passivesChances["Stunning"][getCreatureName(cid)] then  
        attackPoke(cid, "Stunning Confusion")
    end
--------------------------------------Electric Charge---------------------------------------------
    if passivesChances["Electric Charge"][getCreatureName(cid)] and math.random(1, 100) <= passivesChances["Electric Charge"][getCreatureName(cid)] then
        attackPoke(cid, "Electric Charge", 0, 0)
    end
-------------------------------------Melody------------------------------------
    if passivesChances["Melody"][getCreatureName(cid)] and math.random(1, 100) <= passivesChances["Melody"][getCreatureName(cid)] then 
        attackPoke(cid, "Melody") 
    end
------------------------------------- Dragon Fury / Fury ---------------------------------------
    if passivesChances["Dragon Fury"][getCreatureName(cid)] and math.random(1, 100) <= passivesChances["Dragon Fury"][getCreatureName(cid)] then
        attackPoke(cid, "Dragon Fury", 0, 0)
    end
------------------------------------- Mega Drain ---------------------------------------
    if passivesChances["Mega Drain"][getCreatureName(cid)] and math.random(1, 100) <= passivesChances["Mega Drain"][getCreatureName(cid)] then
        attackPoke(cid, "Mega Drain")
    end
------------------------------------- Spores Reaction ---------------------------------------
    if passivesChances["Spores Reaction"][getCreatureName(cid)] and math.random(1, 100) <= passivesChances["Spores Reaction"][getCreatureName(cid)] then
        attackPoke(cid, "Spores Reaction")
    end
------------------------------------ Amnesia ----------------------------------------   
    if passivesChances["Amnesia"][getCreatureName(cid)] and math.random(1, 100) <= passivesChances["Amnesia"][getCreatureName(cid)] then 
        attackPoke(cid, "Amnesia", 0, 0)
    end
----------------------------------- Zen Mind -----------------------------------------
    if passivesChances["Zen Mind"][getCreatureName(cid)] and isWithCondition(cid) and math.random(1, 100) <= passivesChances["Zen Mind"][getCreatureName(cid)] then
        attackPoke(cid, "Zen Mind", 0, 0)
    end
---------------------------------- Mirror Coat ---------------------------------------
    if passivesChances["Mirror Coat"][getCreatureName(cid)] and math.random(1, 80) <= passivesChances["Mirror Coat"][getCreatureName(cid)] then   
        attackPoke(cid, "Mirror Coat", 0, 0)
    end
--------------------------------- Illusion -----------------------------------------
    ]]return false
end















