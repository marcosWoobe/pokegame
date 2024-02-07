function onUse (cid,item,frompos,item2,topos)
pos = getPlayerTown(cid)
        premio = 11447 --burning heart
        premio2 = 2160 --hundred dollars		
        if item.uid == 1006 then
if getPlayerLevel(cid) <= 79 then
  doPlayerSendCancel(cid,'You need Level 80.')
return false
end
if getPlayerStorageValue(cid, 190915) == 1 then
        doPlayerSendTextMessage(cid,22,"Sorry not possible.")
return false end 
getTownTemplePosition(townId)
        doPlayerAddItem(cid,premio,1)
doPlayerAddItem(cid,premio2,10)
setPlayerStorageValue(cid, 190915, 20)
doCreatureSetLookDir(cid, SOUTH)
        doPlayerSendTextMessage(cid,22,"Quest!.")
          end
  end