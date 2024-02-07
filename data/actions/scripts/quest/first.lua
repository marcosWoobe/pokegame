function onUse (cid,item,frompos,item2,topos)
    STORAGE_VALUE = 3552
	ID_DO_PREMIO2 = 2152

    --if item.uid == UID_DO_BAU then
        queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
        if queststatus == -1 then
		    --doSendMagicEffect(pos, CONST_ME_TELEPORT)
            doPlayerSendTextMessage(cid,22,"Parabens voce ganhou 2x first stone e 5k.") -- Msg que ira aparecer
            if item.uid == 1001 then
			    doPlayerAddItem(cid,11441,2)
			elseif item.uid == 1002 then
			    doPlayerAddItem(cid,11442,2)
			else 
			    doPlayerAddItem(cid,11447,2)
			end
            doPlayerAddItem(cid,ID_DO_PREMIO2,50)
            doPlayerAddExperience(cid, 10000)  --premio
            setPlayerStorageValue(cid,STORAGE_VALUE,1)
        else
            doPlayerSendTextMessage(cid,22,"Ta vazio.")
        end
    --end
return 1
end