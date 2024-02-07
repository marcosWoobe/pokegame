local bikeConfig = {
    [25240] = {speed = 700, effect = 28},
    [25241] = {speed = 700, effect = 2},
    [25242] = {speed = 700, effect = 855},
    [25243] = {speed = 700, effect = 15},
    [25245] = {speed = 700, effect = 925},
    
    [25244] = {speed = 700, effect = 1042},
    [25246] = {speed = 700, effect = 1046},
    [25247] = {speed = 700, effect = 1045},
}

function onEquip(cid, item, slot)

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
    effectOnWalk(cid, bikeConfig[item.itemid].effect)
    doSendMagicEffect(pos, bikeConfig[item.itemid].effect)
    setPlayerStorageValue(cid, storageBike, bikeConfig[item.itemid].speed)
    doRegainSpeed(cid)

	return true
end

function onDeEquip(cid, item, slot)

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

	return true
end
