function onUse (cid,item,frompos,item2,topos)
    premio = 11447 -- money			
    if item.uid == 2030 then
        if getPlayerLevel(cid) <= 149 then
            doPlayerSendCancel(cid,'You need Level 150.')
            return true 
        end
        if getPlayerStorageValue(cid, 190960) == 1 then
            doPlayerSendTextMessage(cid,22,"Sorry not possible.")
            return true 
		end 
        doPlayerAddItem(cid, premio, 30)
        doPlayerAddItem(cid, 11447, 5)
        setPlayerStorageValue(cid, 190960, 1)
        doPlayerSendTextMessage(cid,22,"Quest!.")
    end
	return true 
end