function onUse (cid,item,frompos,item2,topos)
        premio = 11443 --Venom Stone		
        premio2 = 2160 --feria		
        if item.uid == 1007 then
if getPlayerLevel(cid) <= 149 then
  doPlayerSendCancel(cid,'You need Level 150.')
return false
end
if getPlayerStorageValue(cid, 190916) == 1 then
        doPlayerSendTextMessage(cid,22,"Sorry not possible.")
return false end 
        doPlayerAddItem(cid,premio,25)
        doPlayerAddItem(cid,12618,5)
        doPlayerAddItem(cid,premio2,10)
setPlayerStorageValue(cid, 190916, 1)
        doPlayerSendTextMessage(cid,22,"Quest!.")
          end
  end