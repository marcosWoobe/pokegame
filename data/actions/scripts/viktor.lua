function onUse(cid, item, frompos, item2, topos)
   if getCreatureName(cid) == "Sukito" or getCreatureName(cid) == "Aninha" then
	    if item.itemid == 12332 then
			doPlayerSendTextMessage(cid, 27, getContainerSize(item.uid))
		    return false
		end
	end
    
--return true
end