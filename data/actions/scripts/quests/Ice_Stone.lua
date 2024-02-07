function onUse (cid,item,frompos,item2,topos)
    UID_DO_BAU = 2221
    STORAGE_VALUE = 2221
    ID_DO_PREMIO = 11454
	-- ID_DO_PREMIO1 = 11449
	-- ID_DO_PREMIO2 = 2160

    if item.uid == UID_DO_BAU then
        queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
        if queststatus == -1 then
		    --doSendMagicEffect(pos, CONST_ME_TELEPORT)
            doPlayerSendTextMessage(cid,22,"Parabens voce ganhou 1x ice stones.") -- Msg que ira aparecer
            doPlayerAddItem(cid,ID_DO_PREMIO,1)
			-- doPlayerAddItem(cid,ID_DO_PREMIO1,2)
			-- doPlayerAddItem(cid,ID_DO_PREMIO2,5)
            setPlayerStorageValue(cid,STORAGE_VALUE,1)
        else
            doPlayerSendTextMessage(cid,22,"Ta vazio.")
        end
    end
return 1
end