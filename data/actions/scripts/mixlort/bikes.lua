local function BikeSpeedOn(cid, t, speed)                  
    setPlayerStorageValue(cid, t.s, speed)  
    doRegainSpeed(cid) 
end 

local function BikeSpeedOff(cid, t)
    setPlayerStorageValue(cid, t.s, -1) 
    doRegainSpeed(cid) 
end 

local t = {text='Subir, bicicleta!', dtext='Descer, bike!', s=5700, speed = 700}
local bikeConfig = {
    [17871] = {speed = 500, looktypeM = 2194, looktypeF = 2193}, -- normal
    [23454] = {speed = 800, looktypeM = 2194, looktypeF = 2193}, -- normal 
    [23452] = {speed = 800, looktypeM = 2192, looktypeF = 2191}, -- fire
    [23450] = {speed = 800, looktypeM = 2190, looktypeF = 2189}, -- water
    [23455] = {speed = 800, looktypeM = 2140, looktypeF = 2139}, -- thunder
    [23451] = {speed = 800, looktypeM = 2196, looktypeF = 2195}, -- leaf
    [23481] = {speed = 900, looktypeM = 2260, looktypeF = 2259}, -- hoverboard
}
function onUse(cid, item, fromPosition, itemEx, toPosition)

    if getPlayerStorageValue(cid, 154585) >= 1 or getPlayerStorageValue(cid, 154585) >= 1 then   --alterado v1.9
        doPlayerSendCancel(cid, "Você não pode fazer isso enquanto está pescando!") 
        return true
    end 

	if item.uid ~= getPlayerSlotItem(cid, CONST_SLOT_RING).uid then
		doPlayerSendCancel(cid, "Você deve colocar sua bike no local correto.") -- Mensagem que da ao tentar usar a bike fora do slot (by: Lukas)
		return true
	end

    local pos = getThingPos(cid)  
 
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
        BikeSpeedOn(cid, t, bikeConfig[item.itemid].speed)
        if getPlayerSex(cid) == 1 then
            doSetCreatureOutfit(cid, {lookType = bikeConfig[item.itemid].looktypeM, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
        else
            doSetCreatureOutfit(cid, {lookType = bikeConfig[item.itemid].looktypeM, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
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