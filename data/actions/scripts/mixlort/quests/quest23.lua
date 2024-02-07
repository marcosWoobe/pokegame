function onUse(cid, item, fromPosition, itemEx, toPosition)

	local storage =  1872
	local levelmin =  20
	local expganha =  4000
    local items = {
        [11444] = 1,
    }

	if getPlayerLevel(cid) >= levelmin then
		if getPlayerStorageValue(cid, storage) >= 1 then
			sendMsgToPlayer(cid, 22, "Você já pegou o que tinha aqui.")
			return true 
		end
	    for item, count in pairs(items) do
	        local newItem = doCreateItemEx(item, count)
	        -- doItemSetAttribute(newItem, "unico", 1)
	        doPlayerAddItemEx(cid, newItem)
	    end
		doPlayerAddExperience(cid, expganha)
		doSendMagicEffect(getCreaturePosition(cid), 28)
		doSendMagicEffect(getCreaturePosition(cid), 27)
		setPlayerStorageValue(cid, storage, 1)
	else
		sendMsgToPlayer(cid, 22, "Você não tem level suficiente para descobrir o que tem aqui (20).")
	end

	return true
end