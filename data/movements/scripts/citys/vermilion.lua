function onStepIn(cid, item, position, fromPosition)
townId = 6
doPlayerSetTown(cid, townId)
doPlayerSendTextMessage(cid,25,"Voc� agora � cidad�o de Vermilion.")

local cidade = getPlayerTown(cid)
local pos = getTownTemplePosition(cidade) 
doTeleportThing(cid, pos)
end