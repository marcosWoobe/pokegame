function onUse (cid,item,frompos,item2,topos)
pos = {x=0, y=0, z=0}

        UID_DO_BAU = 4153
        STORAGE_VALUE = 4153
		ID_DO_PREMIO1 = 12335

        if getPlayerLevel(cid) >= 0 then
  if item.uid == UID_DO_BAU then
          queststatus = getPlayerStorageValue(cid,STORAGE_VALUE)
          if queststatus == -1 then
        doTeleportThing(cid,pos)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
        doPlayerSendTextMessage(cid,22,"Boa Mlke KKKKKK safado :D") -- Msg que ira aparecer
       doPlayerAddItem(cid,ID_DO_PREMIO1,1)
              doPlayerAddExperience(cid, 9000000)
        setPlayerStorageValue(cid,STORAGE_VALUE,121215)
          else
        doPlayerSendTextMessage(cid,22,"")
          end
  end
        else
  doPlayerSendCancel(cid,'')
        end
return 1
end