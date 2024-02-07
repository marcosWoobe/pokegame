local day = 24 * 60 * 60

local shinyCharm = {
	-- ID -------- TEMPO EM DIAS
	[23468] = {time = 3 * day},
	[23469] = {time = 7 * day},
	[23470] = {time = 30 * day},
}

function onUse(cid, item, frompos, itemEx, topos)
	local charm = shinyCharm[item.itemid]
	if not charm then
		return true
	end
	
	if getPlayerStorageValue(cid, 4125) - os.time() > 0 then
		doPlayerSendCancel(cid, "Você ainda tem um Shiny Charm ativo!")
		return true
	end

	doSendAnimatedText(getThingPos(cid), "SHINYCHARM", 215)
	doSendMagicEffect(getThingPos(cid), 29)
	doPlayerSendTextMessage(cid, 27, "Você acaba de ativar um Shiny Charm com duração de "..charm.time/day.." dias. Aproveite muito bem esse Shiny Charm!")	
	setPlayerStorageValue(cid, 4125, charm.time + os.time())
	doRemoveItem(item.uid, 1)
	return true
end