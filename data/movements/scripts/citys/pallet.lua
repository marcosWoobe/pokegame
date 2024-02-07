function onStepIn(cid, item, position, fromPosition)
townId = 7
doPlayerSetTown(cid, townId)
doPlayerSendTextMessage(cid,25,"Você agora é cidadão de Pallet.")

local cidade = getPlayerTown(cid)
local pos = getTownTemplePosition(cidade) 
doTeleportThing(cid, pos)
end