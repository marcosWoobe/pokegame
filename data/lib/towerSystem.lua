--[[ [andar] = {
		[sala] = {global = storage para não usar a sala 2 vezes, stomsg = storage para mandar msg de kill, = id da room}
	}
	]]--.
	
local embeddedTower = {
	[1] = {
			[1] = {global = 789100, revives = 15, stomsg = 252000, room = 78501, tele = {x = 1439, y = 1258, z = 15},  area = {fromx = 1341, fromy = 1127, fromz = 15, tox = 1571, toy = 1334, toz= 15}}, 										
			[2] = {global = 789101, revives = 15, stomsg = 252001, room = 78501, tele = {x = 1668, y = 1242, z = 15},  area = {fromx = 1571, fromy = 1094, fromz = 15, tox = 1807, toy = 1322, toz= 15}},
			[3] = {global = 789102, revives = 15, stomsg = 252002, room = 78501, tele = {x = 1893, y = 1235, z = 15},  area = {fromx = 1795, fromy = 1080, fromz = 15, tox = 2034, toy = 1312, toz= 15}},
			[4] = {global = 789103, revives = 15, stomsg = 252003, room = 78501, tele = {x = 2122, y = 1221, z = 15},  area = {fromx = 2031, fromy = 1068, fromz = 15, tox = 2257, toy = 1301, toz= 15}}
		},
	[2] = {
			[1] = {global = 789104, revives = 20, stomsg = 252004, room = 78502, tele = {x = 1427, y = 1903, z = 15},  area = {fromx = 1339, fromy = 1440, fromz = 15, tox = 1571, toy = 1662, toz= 15}},
			[2] = {global = 789105, revives = 20, stomsg = 252005, room = 78502, tele = {x = 1656, y = 1887, z = 15},  area = {fromx = 1571, fromy = 1434, fromz = 15, tox = 1797, toy = 1646, toz= 15}},
			[3] = {global = 789106, revives = 20, stomsg = 252006, room = 78502, tele = {x = 1881, y = 1880, z = 15},  area = {fromx = 1797, fromy = 1434, fromz = 15, tox = 2020, toy = 1642, toz= 15}},
			[4] = {global = 789107, revives = 20, stomsg = 252007, room = 78502, tele = {x = 2148, y = 1899, z = 15},  area = {fromx = 2026, fromy = 1413, fromz = 15, tox = 2262, toy = 1629, toz= 15}}
		},
	[3] = {
			[1] = {global = 789108, revives = 25, stomsg = 252008, room = 78503, tele = {x = 1449, y = 2212, z = 15},  area = {fromx = 1328, fromy = 1766, fromz = 15, tox = 1566, toy = 1985, toz= 15}},
			[2] = {global = 789109, revives = 25, stomsg = 252009, room = 78503, tele = {x = 1678, y = 2196, z = 15},  area = {fromx = 1556, fromy = 1739, fromz = 15, tox = 1786, toy = 1967, toz= 15}},
			[3] = {global = 789110, revives = 25, stomsg = 252010, room = 78503, tele = {x = 1903, y = 2189, z = 15},  area = {fromx = 1787, fromy = 1730, fromz = 15, tox = 2025, toy = 1961, toz= 15}},
			[4] = {global = 789111, revives = 25, stomsg = 252011, room = 78503, tele = {x = 2137, y = 2174, z = 15},  area = {fromx = 2053, fromy = 1751, fromz = 15, tox = 2279, toy = 1983, toz= 15}}
		},
	[4] = {
			[1] = {global = 789112, revives = 30, stomsg = 252012, room = 78504, tele = {x = 1441, y = 1586, z = 15},  area = {fromx = 1342, fromy = 2049, fromz = 15, tox = 1590, toy = 2300, toz= 15}},
			[2] = {global = 789113, revives = 30, stomsg = 252013, room = 78504, tele = {x = 1670, y = 1570, z = 15},  area = {fromx = 1574, fromy = 2040, fromz = 15, tox = 1580, toy = 2043, toz= 15}},
			[3] = {global = 789114, revives = 30, stomsg = 252014, room = 78504, tele = {x = 1895, y = 1563, z = 15},  area = {fromx = 1810, fromy = 2035, fromz = 15, tox = 2046, toy = 2275, toz= 15}},
			[4] = {global = 789115, revives = 30, stomsg = 252015, room = 78504, tele = {x = 2124, y = 1549, z = 15},  area = {fromx = 2043, fromy = 2034, fromz = 15, tox = 2272, toy = 2250, toz= 15}}
		}
	}

local storagesTower = {
	StoRoom1 = 78501,
	StoRoom2 = 78502,
	StoRoom3 = 78503,
	StoRoom4 = 78504,
	StoRoom5 = 78505,
	StoRoom6 = 78506,
	StoRoom7 = 78507,
	StoRoom8 = 78508,
	stoTower = 78500,
	stoChance = 78499,
	FlyLicense = 78497
}

function getPointsTower(cid)
	return getPlayerStorageValue(cid, storagesTower.stoTower)
end

function getTowerChance(cid)
	return getPlayerStorageValue(cid, storagesTower.stoChance)
end

function removeTowerChance(cid, count)
	return setPlayerStorageValue(cid, storagesTower.stoChance, getTowerChance(cid) - count)
end

function removeTowerPoints(cid, count)
	return setPlayerStorageValue(cid, storagesTower.stoTower, getPointsTower(cid) - count)
end
	
function setTowerChance(cid, count)
	return setPlayerStorageValue(cid, storagesTower.stoChance, getTowerChance(cid) + count)
end

function setPointsTower(cid, count)
	return setPlayerStorageValue(cid, storagesTower.stoTower, getPointsTower(cid) + count)
end

function doShowRoom(cid)
	 return doSendPlayerExtendedOpcode(cid, 32, "true|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom1)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom2)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom3)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom4)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom5)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom6)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom7)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.StoRoom8)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.stoTower)).."|"..tostring(getPlayerStorageValue(cid, storagesTower.stoChance)))
end

function getPlayerInTower(cid)
	if getPlayerStorageValue(cid, 21108) >= 1 then
		return true
	end
	return false
end

function doConditionToTower(cid, storage, teleport, revive, global)			
	removeCondTower(cid)						
	removeTowerChance(cid, 1)			
	doTeleportThing(cid, teleport)
	setRevive(cid, revive)		
	setPlayerStorageValue(cid, 20108, -1)		
	setPlayerStorageValue(cid, storage, 1) -- Checagem de monster!				
	setGlobalStorageValue(global, 1 * 60 * 60 + os.time()) -- Checagem de monster!				
	setPlayerStorageValue(cid, 252525, 1) -- proteção para não usar o fly	
	setPlayerStorageValue(cid, 21108, 1) -- checar se tá na tower.	
	doSendPlayerExtendedOpcode(cid, 32, "false") -- fechar painel
	return true
end

function doTeleportTower(cid, andar)

	for a, b in pairs(embeddedTower) do
		if tonumber(andar) == tonumber(a) then
			for i = 1, #b do
				if getTowerChance(cid) >= 1 and getPlayerStorageValue(cid, b[i].room) >= 1 then
					if #getPlayersInArea(b[i].area) < 1 and getGlobalStorageValue(b[i].global) - os.time() < 0 then
						doConditionToTower(cid, b[i].stomsg, b[i].tele, b[i].revives, b[i].global)
						break
					end
--[[				else
					doSendPlayerExtendedOpcode(cid, 31, "Tower2")	
					break]]--
				end
			end
		end
	end
	
return true
end

function removeCondTower(cid)

	for a, b in pairs(embeddedTower) do
		for c, d in pairs(b) do
			if getPlayerStorageValue(cid, d.stomsg) >= 1 then
				setPlayerStorageValue(cid, 252526, -1)
				setPlayerStorageValue(cid, 252525, -1)
				setPlayerStorageValue(cid, 21108, -1)
				setPlayerStorageValue(cid, 200050, 0)
				setPlayerStorageValue(cid, d.stomsg, -1)
				setGlobalStorageValue(d.global, 1 * 60 * 60 + os.time())	
			end
		end
	end
			
return true
end

function doMsgKillTower(cid)

	for a, b in pairs(embeddedTower) do
		for c, d in pairs(b) do
			if getPlayerStorageValue(cid, d.stomsg) >= 1 then
				doPlayerSendTextMessage(cid, 20, "[Tower]: Ainda falta você derrotar ["..(#getMonsterInArea(d.area)-5).."] pokémon's.")
			end
		end
	end
	
	return true
end

function doKillBossTower(cid, target)

local bossTower = {
	["Shiny Scizor"] = {points = 250},
	["Shiny Salamence"] = {points = 100},
	["Shiny Magmortar"] = {points = 150},
	["Shiny Electivire"] = {points = 200}	
}	

local boss = bossTower[doCorrectString(getCreatureName(target))]
	
	if getPlayerInTower(cid) then
		if boss then
			removeCondTower(cid)
			setPointsTower(cid, boss.points)
			doTeleportThing(cid, {x = 2506, y = 243, z = 7})
			doSendPlayerExtendedOpcode(getCreatureMaster(cid), 31, "Finish")
		end
	end

	return true
end
			
function isPokeTower(target)

	for i = 252520, 252536 do
		if getPlayerStorageValue(target, i) >= 1 then
			return true
		end
	end
	
return false
end

function buyToRoom(cid)

	for i = 78501, 78504 do
		if getPlayerStorageValue(cid, i) ~= 1 then
			setPlayerStorageValue(cid, i, 1)
			doSendMsg(cid, "Você acaba de desbloquear um novo andar!")
			break
		end
	end
	
return true
end		