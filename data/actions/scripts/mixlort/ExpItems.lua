local items = {
	[23462] = {percentExtra = 10, timeType = "hours", time = 1}, -- 1 hora
	[23463] = {percentExtra = 20, timeType = "hours", time = 1}, -- 1 hora
	
	[23464] = {percentExtra = 10, timeType = "days", time = 7}, -- 1 semana
	[23465] = {percentExtra = 20, timeType = "days", time = 7}, -- 1 semana
	
	[23466] = {percentExtra = 15, timeType = "days", time = 30}, -- 1 Mês
	[23467] = {percentExtra = 20, timeType = "days", time = 30}, -- 1 Mês


	[25331] = {percentExtra = 20, timeType = "hours", time = 1}, -- 1 hora
	[25332] = {percentExtra = 40, timeType = "hours", time = 1}, -- 1 hora
	
	[25333] = {percentExtra = 20, timeType = "days", time = 7}, -- 1 semana
	[25334] = {percentExtra = 40, timeType = "days", time = 7}, -- 1 semana
	
	[25335] = {percentExtra = 30, timeType = "days", time = 30}, -- 1 Mês
	[25336] = {percentExtra = 40, timeType = "days", time = 30}, -- 1 Mês
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
	
	if getPlayerStorageValue(cid, 45144) - os.time() > 1 then
		doPlayerSendTextMessage(cid, 20, "Você ainda tem um Experience Booster ativo de "..getPlayerStorageValue(cid, 45145).."%. Ele irá acabar em "..convertTime(getPlayerStorageValue(cid, 45144) - os.time())..".")
		return false
	end
	
	doRemoveItem(item.uid, 1)
	setPlayerStorageValue(cid, 45144, tempo + os.time())
	setPlayerStorageValue(cid, 45145, expItem.percentExtra)
	doPlayerSendTextMessage(cid, 20, "Você ativou um Experience Booster de "..expItem.percentExtra.."% a mais, que durará "..(death and "até morrer" or convertTime(tempo))..".")
	
	return true
end