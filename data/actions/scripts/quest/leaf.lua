function onUse (cid,item,frompos,item2,topos)
        premio = 11448 --Heart Stone		
        premio2 = 11441 --feria		
        if item.uid == 2032 then
if getPlayerLevel(cid) <= 149 then
  doPlayerSendCancel(cid,'You need Level 150.')
return false
end
if getPlayerStorageValue(cid, 190962) == 1 then
        doPlayerSendTextMessage(cid,22,"Sorry not possible.")
return false end 
        doPlayerAddItem(cid,premio,15)
        doPlayerAddItem(cid,212,1)
        doPlayerAddItem(cid,premio2,15)
setPlayerStorageValue(cid, 190962, 1)
        doPlayerSendTextMessage(cid,22,"Quest!.")
          end
  end