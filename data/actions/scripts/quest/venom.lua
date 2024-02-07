function onUse (cid,item,frompos,item2,item3topos)
    UID_DO_BAU = 3551
    STORAGE_VALUE = 3551
    ID_DO_PREMIO = 11443
	ID_DO_PREMIO2 = 2160
	ID_DO_PREMIO3 = 11641

    if item.uid == UID_DO_BAU then
        queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
        if queststatus == -1 then
		   -- doSendMagicEffect(pos, CONST_ME_TELEPORT)
            doPlayerSendTextMessage(cid,22,"Parabens voce ganhou 5x venom stone 300k e uma box4.") -- Msg que ira aparecer
            doPlayerAddItem(cid,ID_DO_PREMIO,5)
            doPlayerAddItem(cid,ID_DO_PREMIO2,20)
     doPlayerAddItem(cid,ID_DO_PREMIO3,1)
            doPlayerAddExperience(cid, 8000)  --premio
            setPlayerStorageValue(cid,STORAGE_VALUE,1)
        else
            doPlayerSendTextMessage(cid,22,"Ta vazio.")
        end
    end
return 1
end