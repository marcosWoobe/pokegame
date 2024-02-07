function onUse (cid,item,frompos,item2,topos)
    STORAGE_VALUE = 0
    ID_DO_PREMIO = 0
    Count = 0

    if item.uid == 2240 then
	    ID_DO_PREMIO = 17629
		Count = 1
		STORAGE_VALUE = 2240
	elseif item.uid == 2241 then
	    ID_DO_PREMIO = 17871
		Count = 1
		STORAGE_VALUE = 2241
	elseif item.uid == 2242 then
	    ID_DO_PREMIO = 2828
		Count = 80
		STORAGE_VALUE = 2242
	elseif item.uid == 2243 then
	    ID_DO_PREMIO = 12401
		Count = 1
		STORAGE_VALUE = 2243
	end
	
	--[[if item.uid == 1150 then
	    if getPlayerLevel(cid) < 150 then
		    doPlayerSendTextMessage(cid, 22, "Você ainda é muito fraco volte quando tiver mais forte.") -- Msg que ira aparecer
		    return true
		end
		return false
	end]]
	
    queststatus = getPlayerStorageValue(cid, STORAGE_VALUE)
    if queststatus == -1 then
        doPlayerSendTextMessage(cid,22,"Parabens voce ganhou "..Count.."x "..getItemNameById(item.itemid)..".") -- Msg que ira aparecer
        doPlayerAddItem(cid, ID_DO_PREMIO, Count)
        setPlayerStorageValue(cid, STORAGE_VALUE, 1)
    else
        doPlayerSendTextMessage(cid, 22, "Ta vazio.")
    end

    return 1
end