function onUse(cid, item, frompos, item2, topos)

	local Mixlort = math.random(1,8)

	local configboots = {
		["guard1"] = {effect = 1076, itemid = 25323},
		["guard2"] = {effect = 1076, itemid = 25324},
		["guard3"] = {effect = 1076, itemid = 25325},
		["guard4"] = {effect = 1076, itemid = 25326},
		["guard5"] = {effect = 1076, itemid = 25327},
		["guard6"] = {effect = 1076, itemid = 25328},
		["guard7"] = {effect = 1076, itemid = 25329},
		["guard8"] = {effect = 1076, itemid = 25330},
	}

	if doPlayerRemoveItem(cid, item.itemid, 1) == TRUE then
		if Mixlort == 1 then
			doSendMagicEffect(getThingPos(cid), configboots["guard1"].effect)
			doPlayerAddItem(cid,configboots["guard1"].itemid,1)
		elseif Mixlort == 2 then
			doSendMagicEffect(getThingPos(cid), configboots["guard2"].effect)
			doPlayerAddItem(cid,configboots["guard2"].itemid,1)
		elseif Mixlort == 3 then
			doSendMagicEffect(getThingPos(cid), configboots["guard3"].effect)
			doPlayerAddItem(cid,configboots["guard3"].itemid,1)
		elseif Mixlort == 4 then
			doSendMagicEffect(getThingPos(cid), configboots["guard4"].effect)
			doPlayerAddItem(cid,configboots["guard4"].itemid,1)
		elseif Mixlort == 5 then
			doSendMagicEffect(getThingPos(cid), configboots["guard5"].effect)
			doPlayerAddItem(cid,configboots["guard5"].itemid,1)
		elseif Mixlort == 6 then
			doSendMagicEffect(getThingPos(cid), configboots["guard6"].effect)
			doPlayerAddItem(cid,configboots["guard6"].itemid,1)
		elseif Mixlort == 7 then
			doSendMagicEffect(getThingPos(cid), configboots["guard7"].effect)
			doPlayerAddItem(cid,configboots["guard7"].itemid,1)
		elseif Mixlort == 8 then
			doSendMagicEffect(getThingPos(cid), configboots["guard8"].effect)
			doPlayerAddItem(cid,configboots["guard8"].itemid,1)
		end
	end
end
