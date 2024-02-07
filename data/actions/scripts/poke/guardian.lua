function onUse(cid, item, frompos, item2, topos)

	if getPlayerStorageValue(cid, 17000) >= 1 then
		doPlayerSendCancel(cid, "Proibido usar guardians em fly!!!")
	return true
	end

	if getPlayerStorageValue(cid, 564871) >= 1 then
		doPlayerSendCancel(cid, "Proibido usar guardians em pvp!!!")
	return true
	end

	if isPlayer(cid) and getPlayerLevel(cid) < 0 then
		doPlayerSendCancel(cid, "Just for players level 300 +.")
	return true
	end

	if isCreature(getPlayerCurrentGuardian(cid)) then
	return false
	end

	 local guardiansT = {
	 [17632] = {name = "Gengar"},
	 [17635] = {name = "Shiny Gengar"},
	 }

	 local guardian_name = guardiansT[item.itemid].name

    if #getCreatureGuardians(cid) == 1 then
		doPlayerSendCancel(cid, "Somente um guardian por vez!!!")
	else
	    local guardian = guardiansT[item.itemid]
	    if guardian then
	        doSummonGuardian(cid, guardian.name)
	        local pk = getCreatureGuardians(cid)[1]
	        adjustGuardianPoke(pk, 1000, guardian_name, cid)
		    doCreatureSay(cid, "Me proteja "..guardian.name, TALKTYPE_SAY)
		    setPlayerStorageValue(cid, 564878, 1)
			doRemoveItem(item.uid, 1)
			-- addEvent(doRemoveCreature, 15*60*1000, pk)
            doPlayerSendCancel(cid, "Guardian cooldown: (".. 15 .."minutos)")
		end
	end
	
return true
end