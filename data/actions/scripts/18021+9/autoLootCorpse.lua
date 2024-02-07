function onUse(cid, item, frompos, item2, topos)
if not isContainer(item.uid) then return false end
if getItemAttribute(item2.uid, "corpseowner") then
	owner = getItemAttribute(item2.uid, "corpseowner")
	if isCreature(owner) and isPlayer(owner) and cid ~= owner then
		return true
	end
end
if getPlayerStorageValue(cid, 83771) >= 1 then return false end
itens = getItensInContainer(item.uid)
itemType = getItensTypeInContainer(item.uid)
itemID = getItensIDInContainer(item.uid)
itamsID, itamsType = {}, {}

if #itens == 1 then
	doPlayerPickItem(cid, itens[1], getPlayerItemCount(cid, itemID[1]), itemID[1], itemType[1])
return true
end
if #itens >= 2 then
	for x = 1, #itens do
		table.insert(itamsID, itemID[x])
		table.insert(itamsType, itemType[x])
		doRemoveItem(itens[x], itemType[x])
	end
	for x = 1, #itamsID do
		addEvent(doPlayerPickItem2, 10 * x, cid, getPlayerItemCount(cid, itamsID[x]), itamsID[x], itamsType[x])
	end
return true
end
return false
end