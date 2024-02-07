local fishing = {
[-1] = { segs = 5, bonus = 80, pokes = {{"Magikarp", 2}} },

[3976] = { segs = 5, bonus = 200, pokes = {{"Horsea", 2}, {"Goldeen", 2}, {"Poliwag", 2}} },  -- pega no client da pxg

[12855] = { segs = 5, bonus = 250, pokes = {{"Tentacool", 2}, {"Staryu", 2}, {"Krabby", 2}, {"Shellder", 2}} },

[12854] = { segs = 5, bonus = 300, pokes = {{"Seel", 2},  {"Slowpoke", 2}, {"Psyduck", 2}} },

[12858] = { segs = 5, bonus = 350, pokes = {{"Seaking", 2}, {"Seadra", 2}, {"Poliwhirl", 2}, {"Squirtle", 2}} },

[12857] = { segs = 5, bonus = 400, pokes = {{"Starmie", 2}, {"Kingler", 2}} },  -- pega no client da pxg

[12860] = { segs = 2, bonus = 550, pokes = { {"Dewgong", 2}, {"Slowbro", 2}} },

[12859] = { segs = 2, bonus = 600, pokes = {{"Cloyster", 2}, {"Poliwrath", 2}} },

[12856] = { segs = 2, bonus = 650, pokes = {{"Dratini", 2}, {"Dragonair", 2}, {"Lapras", 1}} },

[12853] = { segs = 2, bonus = 700, pokes = {{"Gyarados", 2},  {"Giant Magikarp", 2}} },
}

local storageP = 154585
local sto_iscas = 5648454 --muda aki pra sto q ta no script da isca
local bonus = 3000
local limite = 100


local function doFish(cid, pos, ppos, interval)
    if not isCreature(cid) then return false end
    --if getThingPos(cid).x ~= ppos.x or getThingPos(cid).y ~= ppos.y then
	local posR = {x = ppos.x, y = ppos.y, z = ppos.z}
	if getDistanceBetween(getThingPos(cid), posR) >= 4 then
	    setPlayerStorageValue(cid, storageP, -1)  
        doRemoveCondition(cid, CONDITION_OUTFIT)
        return false
    end
      
    doSendMagicEffect(pos, CONST_ME_LOSEENERGY)
      
    if interval > 0 then
        addEvent(doFish, 1000, cid, pos, ppos, interval-1)
        return true
     end   

    local peixe = 0
    local playerpos = getClosestFreeTile(cid, getThingPos(cid))
    local fishes = fishing[getPlayerStorageValue(cid, sto_iscas)]
    local random = {}   

    
	  
	     --[[if math.random(1, 100) <= chance then
		if getPlayerSkillLevel(cid, 6) < limite then
		doPlayerAddSkillTry(cid, 6, bonus * 5)
		end]]
	  
    random = fishes.pokes[math.random(#fishes.pokes)]
	local countFish = math.random(random[2])
	
	--if getPlayerSkillLevel(cid, 6) < 20 then 
	if getPlayerSkillLevel(cid, 6) < limite then  
	 if getPlayerSkillLevel(cid, 6) > 44 then  
	    doPlayerAddSkillTry(cid, 6, ((bonus * countFish * 1.5) + (fishes.bonus * countFish * 1.5)) * 10)
	else
        doPlayerAddSkillTry(cid, 6, ((bonus * countFish) + (fishes.bonus * countFish)) * 1.5)
		end
	--[[elseif getPlayerSkillLevel(cid, 6) >= 20 and getPlayerSkillLevel(cid, 6) <= 50 then 
	    doPlayerAddSkillTry(cid, 6, bonus * 10)
	elseif getPlayerSkillLevel(cid, 6) > 50 then 
	    doPlayerAddSkillTry(cid, 6, bonus * 20)]]
    end
	
    for i = 1, countFish do
        peixe = doSummonCreature(random[1], playerpos)
        if not isCreature(peixe) then
            setPlayerStorageValue(cid, storageP, -1)
            doRemoveCondition(cid, CONDITION_OUTFIT)
            return true
        end
        doSetMonsterPassive(peixe)
        doWildAttackPlayer(peixe, cid)
        doCreatureSetLookDir(cid, getDirectionTo(getThingPos(cid), getThingPos(peixe)))  --alterado ver depois
	    if #getCreatureSummons(cid) >= 1 then
            doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 0)
	        doChallengeCreature(getCreatureSummons(cid)[1], peixe)
        else	
            doSendMagicEffect(getThingPos(cid), 0)
		    doChallengeCreature(cid, peixe)
        end
    end
    setPlayerStorageValue(cid, storageP, -1)
    doRemoveCondition(cid, CONDITION_OUTFIT)
    return true
end

local waters = {4614, 4615, 4616, 4617, 4618, 4619, 4608, 4609, 4610, 4611, 4612, 4613, 7236, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 4665, 4666, 4820, 4821, 4822, 4823, 4824, 4825}
 
function onUse(cid, item, fromPos, itemEx, toPos)
--if exhaustion.check(cid, 23585) then
--doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, 23585)/60 .. " minutos para usar novamente.")
--return true
--end
    if getPlayerSkillLevel(cid, 6) < 40 then  
	    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce precisar ter no min fishing 40")
	    return true
	end
	
    if getPlayerGroupId(cid) == 11 then
        return true
    end

    local checkPos = toPos
    checkPos.stackpos = 0

    if getTileThingByPos(checkPos).itemid <= 0 then
       doPlayerSendCancel(cid, '!')
       return true
    end

    if not isInArray(waters, getTileInfo(toPos).itemid) then
        return true
    end

    if (getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 63215) >= 1) and not canFishWhileSurfingOrFlying then
        doPlayerSendCancel(cid, "You can't fish while surfing/flying.")
        return true
    end

    if isInArray(waters, getTileInfo(getThingPos(cid)).itemid) then
        doPlayerSendCancel(cid, "You can\'t fish while surfing neither flying above water.")
        return true
    end

    if getTileInfo(getThingPos(getCreatureSummons(cid)[1] or cid)).protection then
	    doPlayerSendCancel(cid, "You can't fish pokémons if you or your pokémon is in protection zone.")
        return true
    end


    if not isInArray({520, 521}, getCreatureOutfit(cid).lookType) then
	--if not isInArray({1467, 1468}, getCreatureOutfit(cid).lookType) then
        return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You need fisher outfit for fishing.")
    end

    local delay = fishing[getPlayerStorageValue(cid, sto_iscas)].segs

    if getPlayerStorageValue(cid, sto_iscas) ~= -1 then
        if getPlayerItemCount(cid, getPlayerStorageValue(cid, sto_iscas)) >= 1 then
            doPlayerRemoveItem(cid, getPlayerStorageValue(cid, sto_iscas), 1)
        else
            setPlayerStorageValue(cid, sto_iscas, -1)
        end
    end

    local outfit = getCreatureOutfit(cid)
    local out = getPlayerSex(cid) == 0 and 1467 or 1468

    doSetCreatureOutfit(cid, {lookType = out, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
    setPlayerStorageValue(cid, storageP, 1)     --alterei looktype
    doCreatureSetNoMove(cid, false)

    doFish(cid, toPos, getThingPos(cid), math.random(5, delay))
	--exhaustion.set(cid, 23585, 30)

    return true
end