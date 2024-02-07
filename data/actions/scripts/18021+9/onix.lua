function onUse(cid, item, fromPosition, item2, toPosition)

local teleport = {x=1315, y=918, z=8} -- Coordenadas para onde o player irá ser teleportado.
local item_id = 2160 -- ID do item que o player precisa para ser teleportado.

if getPlayerItemCount(cid,item_id) >= 1 then
doTeleportThing(cid, teleport)
doSendMagicEffect(getPlayerPosition(cid), 0)
doPlayerSendTextMessage(cid, 22, "")
else
doPlayerSendTextMessage(cid, 23, "")
end
return TRUE
end