local items = {
	[25207] = {percentExtra = 20, timeType = "hours", time = 2}, -- 1 hora
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	local expItem = items[item.itemid]
	
	if not expItem then
		return true
	end
	
	local tempo = 0
	local death = false
	
	if expItem.timeType == "days" then
		tempo = expItem.time * 60 * 60 * 24
	else -- Hours
		tempo = expItem.time * 60 * 60
	end
	
	if getPlayerStorageValue(cid, 45344) - os.time() > 1 then
		doPlayerSendTextMessage(cid, 20, "Você ainda tem um Loot Booster ativo de "..getPlayerStorageValue(cid, 45345).."%. Ele irá acabar em "..convertTime(getPlayerStorageValue(cid, 45344) - os.time())..".")
		return false
	end
	
	doRemoveItem(item.uid, 1)
	setPlayerStorageValue(cid, 45344, tempo + os.time())
	setPlayerStorageValue(cid, 45345, expItem.percentExtra)
	doPlayerSendTextMessage(cid, 20, "Você ativou um Loot Booster de "..expItem.percentExtra.."% a mais, que durará "..(death and "até morrer" or convertTime(tempo))..".")
	
	return true
end