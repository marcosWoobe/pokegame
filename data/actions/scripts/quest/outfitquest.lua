function onUse(cid, item, itemEx, toPosition, fromPosition)
if getPlayerStorageValue(cid, 30003) ~= 1 then
setPlayerStorageValue(cid, 30003, 1)
doPlayerAddOutfit(cid, 1163, 3)
doPlayerAddOutfit(cid, 1163, 3)
doPlayerSendTextMessage(cid, 22, "Você Ganhou Um Novo Outfit.")
else
doPlayerSendCancel(cid, "O Baú Está Vazio.")
return true
end
return true
end