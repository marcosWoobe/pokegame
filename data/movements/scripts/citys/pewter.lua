function onStepIn(cid, item, position, fromPosition)
townId = 8
doPlayerSetTown(cid, townId)
doPlayerSendTextMessage(cid,25,"Voc� agora � cidad�o de Pewter.")

local cidade = getPlayerTown(cid)
local pos = getTownTemplePosition(cidade) 
doTeleportThing(cid, pos)
end