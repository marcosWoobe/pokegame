local fishing = {
[-1] = { segs = 5, bonus = 9, pokes = {{"Magikarp", 3}} },

[3976] = { segs = 5, bonus = 13, pokes = {{"Horsea", 3}, {"Goldeen", 3}, {"Poliwag", 3}} },  -- pega no client da pxg

[12855] = { segs = 5, bonus = 14, pokes = {{"Tentacool", 3}, {"Staryu", 3}, {"Krabby", 3}, {"Shellder", 3}, {"Omanyte", 3}} },

[12854] = { segs = 5, bonus = 15, pokes = {{"Seel", 3},  {"Slowpoke", 3}, {"Psyduck", 3}} },

[12858] = { segs = 5, bonus = 16, pokes = {{"Seaking", 3}, {"Seadra", 3}, {"Poliwhirl", 3}, {"Squirtle", 3}} },

[12857] = { segs = 5, bonus = 17, pokes = {{"Starmie", 3}, {"Kingler", 3}} },  -- pega no client da pxg

[12860] = { segs = 2, bonus = 18, pokes = { {"Dewgong", 3}, {"Slowbro", 3}} },

[12859] = { segs = 2, bonus = 19, pokes = {{"Cloyster", 3}, {"Poliwrath", 3}} },

[12856] = { segs = 2, bonus = 20, pokes = {{"Dratini", 3}, {"Dragonair", 3}, {"Omastar", 3}, {"Lapras", 3}} },

[12853] = { segs = 2, bonus = 21, pokes = {{"Gyarados", 3},  {"Tentacruel", 3}, {"Giant Magikarp", 3}, {"Blastoise", 3}} },
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
    if getPlayerSkillLevel(cid, 6) < 60 then  
	    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Voce precisar ter no min fishing 60")
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