function onStepIn (cid, item, pos)

local pos = {x= 683, y=1439, z=6}      --- Coordenadas do local pra onde o player ser� teleportado.
if not isPlayer(cid) then return true end
 if not isPremium(cid) then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Para poder acessar essa �rea e preciso ser Premium Account')
  doTeleportThing(cid, pos)
  doSendMagicEffect(getCreaturePosition(cid), 12)
 else
  doSendMagicEffect(getCreaturePosition(cid), 13)
 end
return true
end