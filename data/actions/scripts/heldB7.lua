local card_id = {15593, 15565, 15635, 15607, 15628, 15579, 15600, 15586, 15642} -- joga os id dos card aqui
function onUse(cid, item, frompos, item2, topos)
local level = 50 -- level 
if item.itemid == 14187 then -- id da box
if getPlayerLevel(cid) >= level then
local w = math.random (1,#card_id)
doPlayerAddItem(cid, card_id[w])
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,"Vc Abriu um Held Box T7 e ganhou  >>> ["..getItemNameById(card_id[w]).."] <<<")
doRemoveItem(item.uid, 1)
else
doPlayerSendCancel(cid,"You must be at least level "..level.."")
end return true end  end