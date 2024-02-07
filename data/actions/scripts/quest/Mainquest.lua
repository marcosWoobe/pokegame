function onUse (cid,item,frompos,item2,topos)
        premio = 2160 -- money			
        if item.uid == 1030 then
if getPlayerLevel(cid) <= 149 then
  doPlayerSendCancel(cid,'You need Level 150.')
return false
end
if getPlayerStorageValue(cid, 190923) == 1 then
        doPlayerSendTextMessage(cid,22,"Sorry not possible.")
return false end 
        doPlayerAddItem(cid,premio,100)
        doPlayerAddItem(cid,12618,15)
setPlayerStorageValue(cid, 190923, 1)
        doPlayerSendTextMessage(cid,22,"Quest!.")
          end
  end