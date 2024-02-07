function onUse(cid, item, frompos, item2, topos)

	local Mixlort = math.random(1,3)

	local configboots = {
		["bota1"] = {effect = 1042, itemid = 25244},
		["bota2"] = {effect = 1046, itemid = 25246},
		["bota3"] = {effect = 1045, itemid = 25247},
	}

	if doPlayerRemoveItem(cid,25235,1) == TRUE then
		if Mixlort == 1 then
			doSendMagicEffect(getThingPos(cid), configboots["bota1"].effect)
			doPlayerAddItem(cid,configboots["bota1"].itemid,1)
		elseif Mixlort == 2 then
			doSendMagicEffect(getThingPos(cid), configboots["bota2"].effect)
			doPlayerAddItem(cid,configboots["bota2"].itemid,1)
		elseif Mixlort == 3 then
			doSendMagicEffect(getThingPos(cid), configboots["bota3"].effect)
			doPlayerAddItem(cid,configboots["bota3"].itemid,1)
		end
	end
end
