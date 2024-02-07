function onUse (cid,item,frompos,item2,topos)
    UID_DO_BAU = 3549
    STORAGE_VALUE = 3549
    -- ID_DO_PREMIO = 11442
	ID_DO_PREMIO2 = 2152

    if item.uid == UID_DO_BAU then
        queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
        if queststatus == -1 then
		    --doSendMagicEffect(pos, CONST_ME_TELEPORT)
            doPlayerSendTextMessage(cid,22,"Parabens voce ganhou 20tds.") -- Msg que ira aparecer
            -- doPlayerAddItem(cid,ID_DO_PREMIO,1)
            doPlayerAddItem(cid,ID_DO_PREMIO2,20)
            doPlayerAddExperience(cid, 10000)  --premio
            setPlayerStorageValue(cid,STORAGE_VALUE,1)
        else
            doPlayerSendTextMessage(cid,22,"Ta vazio.")
        end
    end
return 1
end