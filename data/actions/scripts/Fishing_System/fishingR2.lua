local fishing = {
[-1] = { segs = 5, bonus = 8, pokes = {{"Magikarp", 6}} },

[3976] = { segs = 5, bonus = 11, pokes = {{"Horsea", 6}, {"Goldeen", 6}, {"Poliwag", 6}} },  -- pega no client da pxg

[12855] = { segs = 5, bonus = 12, pokes = {{"Tentacool", 6}, {"Staryu", 6}, {"Krabby", 6}, {"Shellder", 6}, {"Omanyte", 1}} },

[12854] = { segs = 5, bonus = 13, pokes = {{"Seel", 6},  {"Slowpoke", 6}, {"Psyduck", 5}} },

[12858] = { segs = 5, bonus = 14, pokes = {{"Seaking", 5}, {"Seadra", 5}, {"Poliwhirl", 5}, {"Squirtle", 5}} },

[12857] = { segs = 5, bonus = 15, pokes = {{"Starmie", 5}, {"Kingler", 5}} },  -- pega no client da pxg

[12860] = { segs = 2, bonus = 16, pokes = { {"Dewgong", 5}, {"Slowbro", 5}} },

[12859] = { segs = 2, bonus = 17, pokes = {{"Cloyster", 5}, {"Poliwrath", 5}} },

[12856] = { segs = 2, bonus = 18, pokes = {{"Dratini", 4}, {"Dragonair", 4}, {"Omastar", 1}, {"Lapras", 3}} },

[12853] = { segs = 2, bonus = 19, pokes = {{"Gyarados", 3},  {"Tentacruel", 3}, {"Giant Magikarp", 3}, {"Blastoise", 3}} },
}

local storageP = 154585
local sto_iscas = 5648454 --muda aki pra sto q ta no script da isca
local bonus = 10
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
        doPlayerAddSkillTry(cid, 6, (bonus * countFish) + fishes.bonus)
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
    if getPlayerSkillLevel(cid, 6) < 80 then  
	    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce precisar ter no min fishing 10")
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