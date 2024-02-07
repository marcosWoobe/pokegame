function onStepIn(cid, item, position, fromPosition)
townId = 5
doPlayerSetTown(cid, townId)
doPlayerSendTextMessage(cid,25,"Você agora é cidadão de Fuchsia.")

local cidade = getPlayerTown(cid)
local pos = getTownTemplePosition(cidade) 
doTeleportThing(cid, pos)
end