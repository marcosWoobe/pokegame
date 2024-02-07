function onUse(cid, item, fromPosition, item2, toPosition)
local exp = 50000000 -- Quantidade de EXP que o player ganhará!
local queststatus = getPlayerStorageValue(cid, 6452)
if queststatus == -1 then
doPlayerSendTextMessage(cid, 22, "You have found a many Exeperience.")
doPlayerAddExp(cid, exp)
setPlayerStorageValue(cid, 6452, 1)
else
doPlayerSendTextMessage(cid, 23, "It is empty.")
end
return TRUE
end