function onUse (cid,item,frompos,item2,topos)
    UID_DO_BAU = 2238
    STORAGE_VALUE = 2238
    ID_DO_PREMIO = 11442
    -- ID_DO_PREMIO2 = 2160

    if item.uid == UID_DO_BAU then
        queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
        if queststatus == -1 then
		    --doSendMagicEffect(pos, CONST_ME_TELEPORT) 
            doPlayerSendTextMessage(cid,22,"Parabens voce ganhou 3x Watter Stone.") -- Msg que ira aparecer
            doPlayerAddItem(cid,ID_DO_PREMIO,3)
            -- doPlayerAddItem(cid,ID_DO_PREMIO2,5)
            doPlayerAddExperience(cid, 10000)			
            setPlayerStorageValue(cid,STORAGE_VALUE,1)
        else
            doPlayerSendTextMessage(cid,22,"Ta vazio.")
        end
    end
return 1
end