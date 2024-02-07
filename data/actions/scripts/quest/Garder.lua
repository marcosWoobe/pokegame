function onUse (cid,item,frompos,item2,topos)
        premio = 11453 --Heart Stone		
        premio2 = 11446 --feria		
        if item.uid == 2031 then
if getPlayerLevel(cid) <= 149 then
  doPlayerSendCancel(cid,'You need Level 150.')
return false
end
if getPlayerStorageValue(cid, 190961) == 1 then
        doPlayerSendTextMessage(cid,22,"Sorry not possible.")
return false end 
        doPlayerAddItem(cid,premio,15)
        doPlayerAddItem(cid,208,1)
        doPlayerAddItem(cid,premio2,15)
setPlayerStorageValue(cid, 190961, 1)
        doPlayerSendTextMessage(cid,22,"Quest!.")
          end
  end