function onDeath(cid)
    if ehMonstro(cid) then 
	    local strPoke = getPlayerStorageValue(cid, dungeonStr)
		local strBoss = getPlayerStorageValue(cid, dungeonBossStr)
	    if strPoke ~= -1 then
			local strBuffer = string.explode(strPoke, ',') 
			dungeon_id = strBuffer[1]
			idPos = tonumber(strBuffer[2])
			print('Boos: '..doBossInDungeon(cid, dungeon_id, idPos))
		elseif strBoss ~= -1 then 
		    local strBuffer = string.explode(strBoss, ',') 
			dungeon_id = strBuffer[1]
			idPos = tonumber(strBuffer[2])
		    getPlayersInDungeon(dungeon_id, idPos)
		end 
    end 

    return true
end 

function onExtendedOpcode(cid, opcode, buffer)
    if opcode == dungeon_Opcode then
	    local points = getPlayerStorageValue(cid, dungeonPoints)
	    local item = dungeonShop[buffer]
		if not item then
		    doPlayerSendTextMessage(cid, 27, "Sorry, contact to GM.")
		    return true
		end
		if points < item.points then
		    doPlayerSendTextMessage(cid, 27, "Sorry, you don't have the required amount of dungeon points.")
			return true
		end
		doPlayerAddItem(cid, item.serve_id, item.count)
		setPlayerStorageValue(cid, dungeonPoints, points-item.points)
	end
end