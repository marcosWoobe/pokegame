function onUse (cid,item,frompos,item2,topos)
    UID_DO_BAU = 3543
    STORAGE_VALUE = 3543
    ID_DO_PREMIO = 2152
	ID_DO_PREMIO1 = 2392
	ID_DO_PREMIO2 = 12346

    if item.uid == UID_DO_BAU then
        queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
        if queststatus == -1 then
		    --doSendMagicEffect(pos, CONST_ME_TELEPORT)
            doPlayerSendTextMessage(cid,22,"Parabens voce ganhou 50 hds, 50 ultra ball e 30 ultra potion.") -- Msg que ira aparecer
            doPlayerAddItem(cid,ID_DO_PREMIO,50)
			doPlayerAddItem(cid,ID_DO_PREMIO1,50)
			doPlayerAddItem(cid,ID_DO_PREMIO2,30)
            doPlayerAddExperience(cid, 1000)  --premio
            setPlayerStorageValue(cid,STORAGE_VALUE,1)
        else
            doPlayerSendTextMessage(cid,22,"Ta vazio.")
        end
    end
return 1
end