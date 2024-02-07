local items = {
	[9004] = {totalDays = 2},
	[25215] = {totalDays = 5},
	[18837] = {totalDays = 5},
	[18838] = {totalDays = 30},
	[18839] = {totalDays = 60},
	[18840] = {totalDays = 90},
	[18840] = {totalDays = 90},
	[19236] = {minDays = 1, maxDays = 3}, -- não tá funcionando esse random, vc cria 10 items e sempre saí os msm dias, sla pq.
	[19237] = {minDays = 3, maxDays = 5}, -- tem que por como unique tbm.
	[19238] = {minDays = 3, maxDays = 7},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local vipItem = items[item.itemid]
	if not vipItem then
		return true
	end
	local days = vipItem.totalDays
	if vipItem.minDays then
		days = math.random(vipItem.minDays, vipItem.maxDays)
	end
	doPlayerAddPremiumDays(cid, days)
	doRemoveItem(item.uid, 1)
	doPlayerSendTextMessage(cid, 20, "Você acaba de receber os benefícios VIP durante "..days.." dias.")
	return true
end