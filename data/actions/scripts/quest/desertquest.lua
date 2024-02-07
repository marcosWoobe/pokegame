function onUse (cid,item,frompos,item2,topos)
    pos = getPlayerTown(cid)
    premio = 11452 --Enigma Stone
    -- premio2 = 2152 --hundred dollars	
    if item.uid == 1004 then
	
        if getPlayerLevel(cid) <= 39 then
            doPlayerSendCancel(cid,'You need Level 40.')
            return true
        end
		 
        if getPlayerStorageValue(cid, 190913) == 1 then
            doPlayerSendTextMessage(cid,22, "Sorry not possible.")
            return true 
	    end 
        doPlayerAddItem(cid,premio, 5)
        -- doPlayerAddItem(cid,premio2, 30)
        setPlayerStorageValue(cid, 190913, 1)
        doCreatureSetLookDir(cid, SOUTH)
		doPlayerSendTextMessage(cid,22, "Voce ganhou 5x enigma stones!")
    end
	
	return true
end