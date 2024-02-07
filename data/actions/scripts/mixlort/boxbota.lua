function onUse(cid, item, frompos, item2, topos)

	local Mixlort = math.random(1,5)

	local configboots = {
		["bota1"] = {effect = 28, itemid = 25240},
		["bota2"] = {effect = 2, itemid = 25241},
		["bota3"] = {effect = 155, itemid = 25242},
		["bota4"] = {effect = 15, itemid = 25243},
		["bota5"] = {effect = 925, itemid = 25245},
	}

	if doPlayerRemoveItem(cid,25234,1) == TRUE then
		if Mixlort == 1 then
			doSendMagicEffect(getThingPos(cid), configboots["bota1"].effect)
			doPlayerAddItem(cid,configboots["bota1"].itemid,1)
		elseif Mixlort == 2 then
			doSendMagicEffect(getThingPos(cid), configboots["bota2"].effect)
			doPlayerAddItem(cid,configboots["bota2"].itemid,1)
		elseif Mixlort == 3 then
			doSendMagicEffect(getThingPos(cid), configboots["bota3"].effect)
			doPlayerAddItem(cid,configboots["bota3"].itemid,1)
		elseif Mixlort == 4 then
			doSendMagicEffect(getThingPos(cid), configboots["bota4"].effect)
			doPlayerAddItem(cid,configboots["bota4"].itemid,1)
		elseif Mixlort == 5 then
			doSendMagicEffect(getThingPos(cid), configboots["bota5"].effect)
			doPlayerAddItem(cid,configboots["bota5"].itemid,1)
		end
	end
end
