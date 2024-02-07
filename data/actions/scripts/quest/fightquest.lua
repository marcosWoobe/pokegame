function onUse (cid,item,frompos,item2,topos)
        premio = 11446 --Punch Stone		
        premio2 = 2160 --feria		
        if item.uid == 1017 then
if getPlayerLevel(cid) <= 149 then
  doPlayerSendCancel(cid,'You need Level 150.')
return false
end
if getPlayerStorageValue(cid, 190926) == 1 then
        doPlayerSendTextMessage(cid,22,"Sorry not possible.")
return false end 
        doPlayerAddItem(cid,premio,25)
        doPlayerAddItem(cid,12618,5)
        doPlayerAddItem(cid,premio2,10)
setPlayerStorageValue(cid, 190926, 1)
        doPlayerSendTextMessage(cid,22,"Quest!.")
          end
  end