function onSay(cid, words, param, channel)
	local tid = cid
	if(param ~= '') then
		tid = getPlayerByNameWildcard(param)
		if(not tid or (isPlayerGhost(tid) and getPlayerGhostAccess(tid) > getPlayerGhostAccess(cid))) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. param .. " not found.")
			return true
		end
	end

	local pos = getPlayerTown(tid)
	local tmp = getTownName(pos)
	if(not tmp) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Home town does not exists.")
		return true
	end

	pos = getTownTemplePosition(pos)
	if(not pos or isInArray({pos.x, pos.y}, 0)) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Wrong temple position for town " .. tmp .. ".")
		return true
	end

	pos = getClosestFreeTile(tid, pos)
	if(not pos or isInArray({pos.x, pos.y}, 0)) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Destination not reachable.")
		return true
	end

	tmp = getCreaturePosition(tid)
	if(doTeleportThing(tid, pos, true) and not isPlayerGhost(tid)) then
		
		setPlayerStorageValue(tid, 201001, -1)
		setPlayerStorageValue(tid, 244787, -1)
		setPlayerStorageValue(tid, 252526, -1)
		setPlayerStorageValue(tid, 2154601, -1)	
		setPlayerStorageValue(tid, 154585, -1)
		setPlayerStorageValue(tid, 123124, -1)
		setPlayerStorageValue(tid, 141416, -1)
		setPlayerStorageValue(tid, 141417, -1)
		setPlayerStorageValue(tid, 200050, -1)
		setPlayerStorageValue(tid, 2154600, -1)
		setPlayerStorageValue(tid, 2154601, -1)
		setPlayerStorageValue(tid, 1654987, -1)	

		doSendMagicEffect(tmp, CONST_ME_POFF)
		doSendMagicEffect(pos, CONST_ME_TELEPORT)
	end

	return true
end
