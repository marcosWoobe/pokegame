function onUse (cid,item,frompos,item2,topos)
        premio = 11444 -- money			
        if item.uid == 2037 then
if getPlayerLevel(cid) <= 149 then
  doPlayerSendCancel(cid,'You need Level 150.')
return false
end
if getPlayerStorageValue(cid, 190967) == 1 then
        doPlayerSendTextMessage(cid,22,"Sorry not possible.")
return false end 
        doPlayerAddItem(cid,premio,30)
        doPlayerAddItem(cid,206,1)
setPlayerStorageValue(cid, 190967, 1)
        doPlayerSendTextMessage(cid,22,"Quest!.")
          end
  end