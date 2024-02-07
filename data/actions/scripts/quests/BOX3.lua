function onUse (cid,item,frompos,item2,topos)
    UID_DO_BAU = 2236
    STORAGE_VALUE = 2236
    ID_DO_PREMIO = 11443
	ID_DO_PREMIO1 = 11640
    ID_DO_PREMIO2 = 2392

    if item.uid == UID_DO_BAU then
        queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
        if queststatus == -1 then
		    --doSendMagicEffect(pos, CONST_ME_TELEPORT)
            doPlayerSendTextMessage(cid,22,"Parabens voce ganhou 3x venom stone, uma box3 e 50 ultra balls.") -- Msg que ira aparecer
            doPlayerAddItem(cid,ID_DO_PREMIO,3)
			doPlayerAddItem(cid,ID_DO_PREMIO1,1)
            doPlayerAddItem(cid,ID_DO_PREMIO2,50)
            --doPlayerAddExperience(cid, 100000)  --premio
			
			setPlayerStorageValue(cid,201910,1)
            setPlayerStorageValue(cid,STORAGE_VALUE,1)
        else
            doPlayerSendTextMessage(cid,22,"Ta vazio.")
        end
    end
return 1
end