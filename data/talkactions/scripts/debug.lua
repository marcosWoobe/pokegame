function onSay(cid, words, param)

--local pos = {x= 0, y= 0, z=0}
    local store = 23562 -- storage q salva o delay
    local delay = 120 -- tempo em segundos de delay
    local storage = 23563
    local cidade = getPlayerTown(cid)
    local pos = getTownTemplePosition(cidade) 
	
    if getPlayerStorageValue(cid, store) - os.time() >= 0 then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. (getPlayerStorageValue(cid, store) - os.time())/60 .. " minutos para usar novamente.")
        return true
    end
	
    if getCreatureCondition(cid, CONDITION_INFIGHT) then
        doPlayerSendCancel(cid, 'Voce nao pode desbugar char se estiver em battle.')
        return true
    end
	
    --doRemoveCreature(cid)
    doSendMagicEffect(getPlayerPosition(cid),53)
    doPlayerSendCancel(cid,"Desbugado !")
    doTeleportThing(cid, pos)
	
    if getPlayerStorageValue(cid, 84929) >= 1 then--torneio viktor
       setPlayerStorageValue(cid, 84929, -1)
    end
	doRegainSpeed(cid) 
	
    setPlayerStorageValue(cid, store, os.time() + delay*60)
	
return true
end
