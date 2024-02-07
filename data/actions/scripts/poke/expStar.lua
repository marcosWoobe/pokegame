local items = {
	[17629] = {percentExtra = 10, timeType = "hours", time = 2}, -- 2 hora
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

	local expItem = items[item.itemid]
	
	if not expItem then
		return true
	end
	
	local tempo = 0
	if expItem.timeType == "days" then
		tempo = expItem.time * 60 * 60 * 24
	else -- Hours
		tempo = expItem.time * 60 * 60
	end
	
	if getPlayerStorageValue(cid, 45144) - os.time() > 1 then
		sendMsgToPlayer(cid, 20, "Você ainda tem um Experience Booster ativo de "..getPlayerStorageValue(cid, 45145).."%. Ele irá acabar em "..convertTime(getPlayerStorageValue(cid, 45144) - os.time())..".")
		return false
	end
	
	doRemoveItem(item.uid, 1)
	setPlayerStorageValue(cid, 45144, tempo + os.time())
	setPlayerStorageValue(cid, 45145, expItem.percentExtra)
	sendMsgToPlayer(cid, 20, "Você ativou um Experience Booster de "..expItem.percentExtra.."% a mais, que durará "..(death and "até morrer" or convertTime(tempo))..".")
	
	return true
end