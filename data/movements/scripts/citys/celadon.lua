function onStepIn(cid, item, position, fromPosition)
townId = 10
doPlayerSetTown(cid, townId)
doPlayerSendTextMessage(cid,25,"Voc� agora � cidad�o de Celadon.")

local cidade = getPlayerTown(cid)
local pos = getTownTemplePosition(cidade) 
doTeleportThing(cid, pos)
end