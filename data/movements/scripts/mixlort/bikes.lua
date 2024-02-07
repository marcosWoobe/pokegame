local bikeConfig = {
    [17871] = {speed = 450, looktypeM = 2194, looktypeF = 2193, effect = 2}, -- normal
    [23454] = {speed = 600, looktypeM = 2194, looktypeF = 2193, effect = 2}, -- normal
    [23452] = {speed = 600, looktypeM = 2192, looktypeF = 2191, effect = 1031}, -- fire
    [23450] = {speed = 600, looktypeM = 2190, looktypeF = 2189, effect = 1032}, -- water
    [23455] = {speed = 600, looktypeM = 2140, looktypeF = 2139, effect = 1030}, -- thunder
    [23451] = {speed = 600, looktypeM = 2196, looktypeF = 2195, effect = 1029}, -- leaf
    [23481] = {speed = 650, looktypeM = 2260, looktypeF = 2259, effect = 615}, -- hoverboard
}

function onEquip(cid, item, slot)
    if not cid then return true end
    if item.uid <= 0 or not item then return true end

    if getPlayerStorageValue(cid, 154585) >= 1 or getPlayerStorageValue(cid, 154585) >= 1 then   --alterado v1.9
        doPlayerSendCancel(cid, "Você não pode fazer isso enquanto está pescando!")
        return true
    end

    if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1 then   --alterado v1.9
        doPlayerSendCancel(cid, "Você não pode fazer isso enquanto está no fly ou ride!")
        return true
    end

    if getPlayerStorageValue(cid, 63215) >= 1 then   --alterado v1.9
        doPlayerSendCancel(cid, "Você não pode fazer isso enquanto está no Surf!")
        return true
    end   

    effectOnWalk(cid, bikeConfig[item.itemid].effect)
    local outfit = getCreatureOutfit(cid)
    if getPlayerSex(cid) == 1 then
        doSetCreatureOutfit(cid, {lookType = bikeConfig[item.itemid].looktypeM, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
    else
        doSetCreatureOutfit(cid, {lookType = bikeConfig[item.itemid].looktypeM, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
    end

    local pos = getThingPos(cid)
    doSendMagicEffect(pos, bikeConfig[item.itemid].effect)
    setPlayerStorageValue(cid, storageBike, bikeConfig[item.itemid].speed)
    doRegainSpeed(cid)

	return true
end

function onDeEquip(cid, item, slot)
    if not cid then return true end
    if item.uid <= 0 or not item then return true end

    if getPlayerStorageValue(cid, 154585) >= 1 or getPlayerStorageValue(cid, 154585) >= 1 then   --alterado v1.9
        doPlayerSendCancel(cid, "Você não pode fazer isso enquanto está pescando!")
        return true
    end

    if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1 then   --alterado v1.9
        doPlayerSendCancel(cid, "Você não pode fazer isso enquanto está no fly ou ride!")
        return true
    end

    if getPlayerStorageValue(cid, 63215) >= 1 then   --alterado v1.9
        doPlayerSendCancel(cid, "Você não pode fazer isso enquanto está no Surf!")
        return true
    end    

    local pos = getThingPos(cid)
    effectOnWalk(cid, -1)
    doSendMagicEffect(pos, bikeConfig[item.itemid].effect)
    setPlayerStorageValue(cid, storageBike, -1)
    doRegainSpeed(cid)
    doRemoveCondition(cid, CONDITION_OUTFIT)

	return true
end
