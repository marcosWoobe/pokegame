function onUse (cid,item,frompos,item2,topos)
        premio = 11451 --Heart Stone		
        premio2 = 11445 --feria		
        if item.uid == 2034 then
if getPlayerLevel(cid) <= 149 then
  doPlayerSendCancel(cid,'You need Level 150.')
return false
end
if getPlayerStorageValue(cid, 190964) == 1 then
        doPlayerSendTextMessage(cid,22,"Sorry not possible.")
return false end 
        doPlayerAddItem(cid,premio,15)
        doPlayerAddItem(cid,210,1)
        doPlayerAddItem(cid,premio2,10)
setPlayerStorageValue(cid, 190964, 1)
        doPlayerSendTextMessage(cid,22,"Quest!.")
          end
  end