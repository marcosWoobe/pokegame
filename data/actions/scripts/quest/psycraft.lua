function onUse (cid,item,frompos,item2,topos)
        premio = 11452 -- money			
        if item.uid == 2038 then
if getPlayerLevel(cid) <= 149 then
  doPlayerSendCancel(cid,'You need Level 150.')
return false
end
if getPlayerStorageValue(cid, 190965) == 1 then
        doPlayerSendTextMessage(cid,22,"Sorry not possible.")
return false end 
        doPlayerAddItem(cid,premio,30)
        doPlayerAddItem(cid,207,1)
setPlayerStorageValue(cid, 190965, 1)
        doPlayerSendTextMessage(cid,22,"Quest!.")
          end
  end