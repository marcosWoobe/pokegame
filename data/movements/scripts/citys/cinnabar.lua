function onStepIn(cid, item, position, fromPosition)
townId = 11
doPlayerSetTown(cid, townId)
doPlayerSendTextMessage(cid,25,"Voc� agora � cidad�o de Cinnabar.")

local cidade = getPlayerTown(cid)
local pos = getTownTemplePosition(cidade) 
doTeleportThing(cid, pos)
end