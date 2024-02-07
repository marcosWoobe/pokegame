local day = 24 * 60 * 60

local shinyCharm = {
	-- ID -------- TEMPO EM DIAS
	[23471] = {time = 3 * day},
	[23472] = {time = 7 * day},
	[23473] = {time = 30 * day},
}

function onUse(cid, item, frompos, itemEx, topos)
	local charm = shinyCharm[item.itemid]
	if not charm then
		return true
	end
	
	if getPlayerStorageValue(cid, 4126) - os.time() > 0 then
		doPlayerSendCancel(cid, "Você ainda tem um Mega Charm ativo!")
		return true
	end

	doSendAnimatedText(getThingPos(cid), "MEGACHARM", 215)
	doSendMagicEffect(getThingPos(cid), 29)
	doPlayerSendTextMessage(cid, 27, "Você acaba de ativar um Mega Charm com duração de "..charm.time/day.." dias. Aproveite muito bem esse Mega Charm!")	
	setPlayerStorageValue(cid, 4126, charm.time + os.time())
	doRemoveItem(item.uid, 1)
	return true
end