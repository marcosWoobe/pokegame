function onStepIn(cid, item, position, fromPosition)
townId = 2
doPlayerSetTown(cid, townId)
doPlayerSendTextMessage(cid,25,"Você agora é cidadão da Vila de Pallet.")

local cidade = getPlayerTown(cid)
local pos = getTownTemplePosition(cidade) 
doTeleportThing(cid, pos)
end