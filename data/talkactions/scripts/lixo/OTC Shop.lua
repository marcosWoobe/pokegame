function onSay(cid, words, param, channel)
	if not isCreature(cid) then return true end
diamondCount = getPlayerItemCount(cid, oficialDiamond)

	if words == "#shop1#" then
		if doPlayerRemoveItem(cid, oficialDiamond, 1) then
			doPlayerAddItem(cid, 14660, 1)
			doPlayerSendTextMessage(cid, 19, "You buy a Boost Stone for 1 Diamond.")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 1 Diamonds to buy a Boost Stone!")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")	
		return true
		end
	end
	
	if words == "#shop2#" then
		if doPlayerRemoveItem(cid, oficialDiamond, 8) then
			doPlayerAddItem(cid, 14661, 1)
			doPlayerSendTextMessage(cid, 19, "You buy an Ultimate Boost Stone for 8 Diamonds.")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 8 Diamonds to buy an Ultimate Boost Stone!")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")	
		return true
		end
	end
	
	if words == "#shop3#" then
		if doPlayerRemoveItem(cid, oficialDiamond, 5) then
			doPlayerAddItem(cid, 14659, 1)
			doPlayerSendTextMessage(cid, 19, "You buy a Clan Booster for 5 Diamonds.")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 5 Diamonds to buy a Clan Booster!")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")	
		return true
		end
	end	

	if words == "#shop4#" then
		if doPlayerRemoveItem(cid, oficialDiamond, 7) then
			doPlayerAddItem(cid, 12801, 1)
			doPlayerSendTextMessage(cid, 19, "You buy a XP Booster for 7 Diamonds.")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 7 Diamonds to buy a XP Booster!")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")	
		return true
		end
	end
	
	if words == "#shop5#" then
		if doPlayerRemoveItem(cid, oficialDiamond, 10) then
			doPlayerAddItem(cid, 14662, 1)
			doPlayerSendTextMessage(cid, 19, "You buy a Master Rod for 10 Diamonds.")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 10 Diamonds to buy a Master Rod!")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")	
		return true
		end
	end

	if words == "#shop6#" then
		if doPlayerRemoveItem(cid, oficialDiamond, 25) then
			doPlayerAddItem(cid, 12805, 1)
			doPlayerSendTextMessage(cid, 19, "You buy a PM Box Surprise for 25 Diamonds.")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 25 Diamonds to buy a PM Box Surprise!")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")	
		return true
		end
	end

	if words == "#shop7#" then
		if doPlayerRemoveItem(cid, oficialDiamond, 25) then
			doPlayerAddItem(cid, 12929, 1)
			doPlayerSendTextMessage(cid, 19, "You buy a PM Box X for 25 Diamonds.")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 25 Diamonds to buy a PM Box X!")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")	
		return true
		end
	end
	
	if words == "#shop8#" then
		if doPlayerRemoveItem(cid, oficialDiamond, 5) then
			doPlayerAddItem(cid, 14663, 1)
			doPlayerSendTextMessage(cid, 19, "You buy a PM Moto Key for 5 Diamonds.")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 5 Diamonds to buy a PM Moto Key!")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")	
		return true
		end
	end
	
	if words == "#shop9#" then
		if doPlayerRemoveItem(cid, oficialDiamond, 5) then
			doPlayerAddItem(cid, 13270, 1)
			doPlayerSendTextMessage(cid, 19, "You buy a Candy of Level for 5 Diamonds.")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 5 Diamonds to buy a Candy of Level!")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")	
		return true
		end
	end
	
	if words == "#shop10#" then
		if doPlayerRemoveItem(cid, oficialDiamond, 10) then
			doPlayerAddItem(cid, 14657, 1)
			doPlayerSendTextMessage(cid, 19, "You buy a Master Bless for 10 Diamonds.")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 10 Diamonds to buy a Master Bless!")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")	
		return true
		end
	end
	
		if words == "#shop11#" then
		if doPlayerRemoveItem(cid, oficialDiamond, 50) then
			doPlayerAddItem(cid, 13458, 1)
			doPlayerSendTextMessage(cid, 19, "You buy a Box Megas for 50 Diamonds.")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 50 Diamonds to buy a Box Megas!")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")	
		return true
		end
	end
	
		if words == "#shop12#" then
		if doPlayerRemoveItem(cid, oficialDiamond, 5) then
			doPlayerAddItem(cid, 12417, 1)
			doPlayerSendTextMessage(cid, 19, "You buy a Shiny Stone for 5 Diamonds.")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 5 Diamonds to buy a Shiny Stone!")
			doCreatureExecuteTalkAction(cid, "#diamondsCount#")	
		return true
		end
	end

	
	if words == "#diamondsCount#" then
		doPlayerSendCancel(cid, "#diamonds#,"..diamondCount..",")
	return true
	end
return true
end