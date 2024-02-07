local config = {
message = "Entre no teleporte, ele desapareçera em 2 minutos.",
timeToRemove = 120, -- seconds
teleportId = 1387,
bosses = {

["Ho-oh"] = { x = 1204, y = 1051, z = 9},
["Seavell Shiny Blastoise"] = { x = 1898, y = 1507, z = 6},
["Gardestriker Shiny Snorlax"] = { x = 1898, y = 1507, z = 2},
["Naturia Shiny Scyther"] = { x = 1898, y = 1507, z = 3},
["Orebound Golden Rhydon"] = { x = 1898, y = 1507, z = 1},
["Psycraft Shiny Alakazam"] = { x = 1898, y = 1507, z = 4},
["Raibolt Shiny Raichu"] = { x = 1898, y = 1505, z = 0},
["Volcanic Shiny Arcanine"] ={ x = 1898, y = 1507, z = 5},
["Wingeon Shiny Dragonite"] = { x = 918, y = 765, z = 11},
}
}

local function removal(position)
doRemoveThing(getTileItemById(position, config.teleportId).uid, 1)
return TRUE
end

function onDeath(cid, corpse, killer)
registerCreatureEvent(cid, "raikou")
local position = getCreaturePosition(cid)

for name, pos in pairs(config.bosses) do
if name == getCreatureName(cid) then
teleport = doCreateTeleport(config.teleportId, pos, position)
doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
addEvent(removal, config.timeToRemove * 1000, position)
doSendMagicEffect(position,10)
end
end
return TRUE
end