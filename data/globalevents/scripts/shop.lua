function onThink(interval, lastExecution, thinkInterval)
 
local result = db.getResult("SELECT * FROM shop_history WHERE `processed` = 0;")
 
if(result:getID() ~= -1) then
while(true) do
cid = getCreatureByName(tostring(result:getDataString("player")))
product = tonumber(result:getDataInt("product"))
itemr = db.getResult("SELECT * FROM shop_offer WHERE `id` = "..product..";")
if isPlayer(cid) then
local id = tonumber(itemr:getDataInt("item"))
local tid = tonumber(result:getDataInt("id"))
local count = tonumber(itemr:getDataInt("count"))
local tipe = tonumber(itemr:getDataInt("type"))
local productn = tostring(itemr:getDataString("name"))
if isInArray({5,8},tipe) then
if getPlayerFreeCap(cid) >= getItemWeightById(id, count) then
if isContainer(getPlayerSlotItem(cid, 3).uid) then
received = doAddContainerItem(getPlayerSlotItem(cid, 3).uid, id,count)
if received then
doPlayerSendTextMessage(cid,19, "You recived >> "..productn.." << from Dream Shop")
db.executeQuery("UPDATE `shop_history` SET `processed`='1' WHERE id = " .. tid .. ";")
else
doPlayerSendTextMessage(cid,19, "Desculpe, voc� n�o tem espa�o suficiente no recipiente para receber >> "..productn.." <<")
end
else
doPlayerSendTextMessage(cid,19, "Desculpe, voc� n�o tem um recipiente para receber >> "..productn.." <<")
end
else
doPlayerSendTextMessage(cid,19, "Desculpe, voc� n�o tem capacidade suficiente para receber >> "..productn.." << (You need: "..getItemWeightById(id, count).." Capacity)")
end
elseif isInArray({6,7},tipe) then
if tipe == 6 then
bcap = 8
bid = 1987
elseif tipe == 7 then
bcap = 20
bid = 1988
end
if isItemRune(id) then
count = 1
end
if getPlayerFreeCap(cid) >= (getItemWeightById(1987, 1) + getItemWeightById(id,count * bcap)) then
local bag = doCreateItemEx(bid, 1)
for i = 1,bcap do
doAddContainerItem(bag, id, count)
end
received = doPlayerAddItemEx(getPlayerSlotItem(cid, 3).uid, bag)
if received == RETURNVALUE_NOERROR then
doPlayerSendTextMessage(cid,19, "You reicived  >> "..productn.." << from shop")
db.executeQuery("UPDATE `shop_history` SET `processed`='1' WHERE id = " .. tid .. ";")
else
doPlayerSendTextMessage(cid,19, "Desculpe, voc� n�o tem espa�o suficiente para receber >> "..productn.." <<")
end
else
doPlayerSendTextMessage(cid,19, "Desculpe, voc� n�o tem capacidade suficiente para receber >> "..productn.." << (You need: "..getItemWeightById(id, count).." Capacity)")
end
end
end
itemr:free()
if not(result:next()) then
break
end
end
result:free()
end
return true
end