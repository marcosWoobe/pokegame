local function BikeSpeedOn(cid, t, speed)                  
    setPlayerStorageValue(cid, t.s, speed)  
    --doChangeSpeed(cid, -getCreatureSpeed(cid)) 
    --doChangeSpeed(cid, PlayerSpeed+getPlayerLevel(cid)+speed) 
    doRegainSpeed(cid) 
end 

local function BikeSpeedOff(cid, t)
    setPlayerStorageValue(cid, t.s, -1) 
    doRegainSpeed(cid) 
end 

local t = {text='Subir, bicicleta!', dtext='Descer, bike!', s=5700, speed = 700}
local bikeSpeed = {
    [12402] = {speed = 700},
    [17871] = {speed = 400},
}
function onUse(cid, item, fromPosition, itemEx, toPosition)

    if getPlayerStorageValue(cid, 154585) >= 1 or getPlayerStorageValue(cid, 154585) >= 1 then   --alterado v1.9
        doPlayerSendCancel(cid, "Você não pode fazer isso enquanto está pescando!") 
        return true
    end 

    local pos = getThingPos(cid)  
 
    --if #getCreatureSummons(cid) >= 1 then
    --return doPlayerSendCancel(cid, "Return your pokemon.")
    --end
    if getPlayerStorageValue(cid, 17001) >= 1 or getPlayerStorageValue(cid, 63215) >= 1 or 
    getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 75846) >= 1 or
    getPlayerStorageValue(cid, 6598754) >= 1 or getPlayerStorageValue(cid, 6598755) >= 1 then   --alterado v1.9
        return doPlayerSendCancel(cid, "Você não pode fazer isso agora.")
    end
    local outfit = getCreatureOutfit(cid)
    if getPlayerStorageValue(cid, t.s) <= 0 then
        doSendMagicEffect(pos, 177) 
        doCreatureSay(cid, t.text, 19)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'Você montou em uma bicicleta.')
        BikeSpeedOn(cid, t, bikeSpeed[item.itemid].speed)
        if getPlayerSex(cid) == 1 then
            doSetCreatureOutfit(cid, {lookType = 2140, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
        else
            doSetCreatureOutfit(cid, {lookType = 2139, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
       end
    else
        doSendMagicEffect(pos, 177)
        doCreatureSay(cid, t.dtext, 19)
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'Você saiu da bicicleta.')
        BikeSpeedOff(cid, t)
        doRemoveCondition(cid, CONDITION_OUTFIT)
    end
	
    return true
end