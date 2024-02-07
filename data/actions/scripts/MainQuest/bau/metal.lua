function onUse (cid,item,frompos,item2,topos)
        premio = 12232 -- money			
        if item.uid == 2046 then
if getPlayerLevel(cid) <= 149 then
  doPlayerSendCancel(cid,'You need Level 150.')
return false
end
if getPlayerStorageValue(cid, 190976) == 1 then
        doPlayerSendTextMessage(cid,22,"Sorry not possible.")
return false end 
        doPlayerAddItem(cid,premio,4)
        ---doPlayerAddItem(cid,,)
setPlayerStorageValue(cid, 190976, 1)
        doPlayerSendTextMessage(cid,22,"Quest!.")
          end
  end