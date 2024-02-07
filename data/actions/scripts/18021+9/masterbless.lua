function onUse(cid, item, frompos, item2, topos)
	if not isCreature(cid) then return false end
	
   if getPlayerStorageValue(cid, 53502) >= 1 then
      doPlayerSendCancel(cid, "You already have a Master Bless.")
	  return true
end		
	
	if doPlayerRemoveItem(cid, 14657, 1) then
		setPlayerStorageValue(cid, 53502, 1)
		doRemoveCreature(cid)
	return true
	end


	
	
return false
end