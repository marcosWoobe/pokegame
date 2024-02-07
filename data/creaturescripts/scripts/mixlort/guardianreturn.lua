function onPrepareDeath(cid, deathList)
	 if getPlayerCurrentGuardian(cid) then                         
		doPlayerSetStorageValue(cid, 9005, exhaustion.get(getPlayerCurrentGuardian(cid), 11))
		doPlayerSetStorageValue(cid, 9006, getCreatureName(getPlayerCurrentGuardian(cid)))
		doRemoveCreature(getPlayerCurrentGuardian(cid))
	end
	return true
end
