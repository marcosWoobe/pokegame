function onStepIn(cid, item, position, fromPosition)
townId = 28
doPlayerSetTown(cid, townId)
doPlayerSendTextMessage(cid,25,"Voc� agora � cidad�o de Cherrygrove.")

local cidade = getPlayerTown(cid)
local pos = getTownTemplePosition(cidade) 
doTeleportThing(cid, pos)
end