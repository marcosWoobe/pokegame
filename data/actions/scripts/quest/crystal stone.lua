function onUse (cid,item,frompos,item2,topos)
    UID_DO_BAU = 3542
    STORAGE_VALUE = 3542
    ID_DO_PREMIO = 11445
	ID_DO_PREMIO1 = 11449
    ID_DO_PREMIO2 = 2160

    if item.uid == UID_DO_BAU then
        queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
        if queststatus == -1 then
		    --doSendMagicEffect(pos, CONST_ME_TELEPORT)
            doPlayerSendTextMessage(cid,22,"Parabens voce ganhou 5x rock and 1x crystal stone e 10k.") -- Msg que ira aparecer
            doPlayerAddItem(cid,ID_DO_PREMIO,5)
			doPlayerAddItem(cid,ID_DO_PREMIO1,1)
            doPlayerAddItem(cid,ID_DO_PREMIO2,1)
            doPlayerAddExperience(cid, 100000)  --premio
            setPlayerStorageValue(cid,STORAGE_VALUE,1)
        else
            doPlayerSendTextMessage(cid,22,"Ta vazio.")
        end
    end
return 1
end