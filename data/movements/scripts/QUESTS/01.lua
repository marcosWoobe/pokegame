function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if item.actionid == 1150 and getPlayerStorageValue(cid, 65060) <= 0 then 
	    if item.itemid == 5915 then
		    if getPlayerLevel(cid) < 150 then
			    doPlayerSendTextMessage(cid, 22, "Desculpe, voc� � muito fraco!")
			    return true
			end
		    setPlayerStorageValue(cid, 65060, 1)
			doPlayerSendTextMessage(cid, 22, "Parab�ns Thrones Quest Liberada!")
			doSendMagicEffect(position, 28)
		    return true
		end
		return true
    elseif item.actionid == 65000 and getPlayerStorageValue(cid, 65000) <= 0 then
	    if item.itemid == 5916 then
		    setPlayerStorageValue(cid, 65000, 1)
			doPlayerSendTextMessage(cid, 22, "Parab�ns 1� parte concluida!")
			doSendMagicEffect(position, 28)
		    return true
		end
        doTeleportThing(cid, fromPosition, TRUE)
        doPlayerSendTextMessage(cid, 22, "Desculpe voc� precisa passar primeiro pela 1� proltrona!")
        doSendMagicEffect(position, 21)
		return true
	elseif item.actionid == 65001 and getPlayerStorageValue(cid, 65001) <= 0 then
        if item.itemid == 5915 then
		    if getPlayerStorageValue(cid, 65000) <= 0 then
			    doPlayerSendTextMessage(cid, 22, "Desculpe mais voce precisa fazer primeiro a 1� parte!")
			    return true
			end
		    setPlayerStorageValue(cid, 65001, 1)
			doPlayerSendTextMessage(cid, 22, "Parab�ns 2� parte concluida!")
			doSendMagicEffect(position, 28)
		    return true
		end
		doTeleportThing(cid, fromPosition, TRUE)
        doPlayerSendTextMessage(cid, 22, "Desculpe voc� precisa passar primeiro pela 2� proltrona!")
        doSendMagicEffect(position, 21)
		return true
    elseif item.actionid == 65002 and getPlayerStorageValue(cid, 65002) <= 0 then
        if item.itemid == 5915 then
		    if getPlayerStorageValue(cid, 65001) <= 0 then
			    doPlayerSendTextMessage(cid, 22, "Desculpe mais voce precisa fazer primeiro a 2� parte!")
			    return true
			end
		    setPlayerStorageValue(cid, 65002, 1)
			doPlayerSendTextMessage(cid, 22, "Parab�ns 3� parte concluida!")
			doSendMagicEffect(position, 28)
		    return true
		end
		doTeleportThing(cid, fromPosition, TRUE)
        doPlayerSendTextMessage(cid, 22, "Desculpe voc� precisa passar primeiro pela 3� proltrona!")
        doSendMagicEffect(position, 21)
		return true
    elseif item.actionid == 65003 and getPlayerStorageValue(cid, 65003) <= 0 then
        if item.itemid == 5916 then
		    if getPlayerStorageValue(cid, 65002) <= 0 then
			    doPlayerSendTextMessage(cid, 22, "Desculpe mais voce precisa fazer primeiro a 3� parte!")
			    return true
			end
		    setPlayerStorageValue(cid, 65003, 1)
			doPlayerSendTextMessage(cid, 22, "Parab�ns 4� parte concluida!")
			doSendMagicEffect(position, 28)
		    return true 
		end
		doTeleportThing(cid, fromPosition, TRUE) 
        doPlayerSendTextMessage(cid, 22, "Desculpe voc� precisa passar primeiro pela 4� proltrona!")
        doSendMagicEffect(position, 21)
		return true
    elseif item.actionid == 65004 and getPlayerStorageValue(cid, 65004) <= 0 then
        if item.itemid == 5916 then
		    if getPlayerStorageValue(cid, 65003) <= 0 then
			    doPlayerSendTextMessage(cid, 22, "Desculpe mais voce precisa fazer primeiro a 4� parte!")
			    return true
			end 
		    setPlayerStorageValue(cid, 65004, 1)
			doPlayerSendTextMessage(cid, 22, "Parab�ns 5� parte concluida!")
		    return true
		end
		doTeleportThing(cid, fromPosition, TRUE)
        doPlayerSendTextMessage(cid, 22, "Desculpe voc� precisa passar primeiro pela 5� proltrona!")
        doSendMagicEffect(position, 21)
		return true
    end
end