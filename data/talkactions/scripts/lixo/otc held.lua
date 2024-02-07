function onSay(cid, words, param, channel)
	if not isCreature(cid) then return true end
devotedCount = getPlayerItemCount(cid, devotedToken)
mightyCount = getPlayerItemCount(cid, mightyToken)
honoredCount = getPlayerItemCount(cid, honoredToken)

	if words == "#devoted#" then
		if devotedCount >= 20 then
			if math.random(1,2) == 1 then
				tierTable = helds.tiers1
			else
				tierTable = helds.tiers2
			end
			prize = tierTable[math.random(#tierTable)]
			doPlayerAddItem(cid, prize, 1)
			doPlayerRemoveItem(cid, DevotedToken, 20)
			doPlayerSendTextMessage(cid, 19, "You received a "..getItemInfo(prize).name..".")
			doCreatureExecuteTalkAction(cid, "#heldCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 20 Devoted Tokens to pick a held item!")
			doCreatureExecuteTalkAction(cid, "#heldCount#")
		return true
		end
	return true
	end
	
	if words == "#mighty1#" then
		if mightyCount >= 50 then
			if math.random(1,3) == 1 then
				tierTable = helds.tiers1
			elseif math.random(1,3) == 2 then
				tierTable = helds.tiers2
			else
				tierTable = helds.tiers3
			end
			prize = tierTable[math.random(#tierTable)]
			doPlayerAddItem(cid, prize, 1)
			doPlayerRemoveItem(cid, mightyToken, 50)
			doPlayerSendTextMessage(cid, 19, "You received a "..getItemInfo(prize).name..".")
			doCreatureExecuteTalkAction(cid, "#heldCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 50 Mighty Tokens to pick a held item!")
			doCreatureExecuteTalkAction(cid, "#heldCount#")
		return true
		end
	end
	
	if words == "#mighty2#" then
		if mightyCount >= 100 then
			if math.random(1,3) == 1 then
				tierTable = helds.tiers2
			elseif math.random(1,3) == 2 then
				tierTable = helds.tiers3
			else
				tierTable = helds.tiers4
			end
			prize = tierTable[math.random(#tierTable)]
			doPlayerAddItem(cid, prize, 1)
			doPlayerRemoveItem(cid, mightyToken, 100)
			doPlayerSendTextMessage(cid, 19, "You received a "..getItemInfo(prize).name..".")
			doCreatureExecuteTalkAction(cid, "#heldCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 100 Mighty Tokens to pick a held item!")
			doCreatureExecuteTalkAction(cid, "#heldCount#")
		return true
		end
	end
	
	if words == "#mighty3#" then
		if mightyCount >= 200 then
			if math.random(1,4) == 1 then
				tierTable = helds.tiers3
			elseif math.random(1,4) == 2 then
				tierTable = helds.tiers4
			elseif math.random(1,4) == 3 then
				tierTable = helds.tiers5
			else
				tierTable = helds.tiers6
			end
			prize = tierTable[math.random(#tierTable)]
			doPlayerAddItem(cid, prize, 1)
			doPlayerRemoveItem(cid, mightyToken, 200)
			doPlayerSendTextMessage(cid, 19, "You received a "..getItemInfo(prize).name..".")
			doCreatureExecuteTalkAction(cid, "#heldCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 200 Mighty Tokens to pick a held item!")
			doCreatureExecuteTalkAction(cid, "#heldCount#")
		return true
		end
	end
	
	if words == "#honored1#" then
		if honoredCount >= 25 then
			if math.random(1,3) == 1 then
				tierTable = helds.tiers1
			elseif math.random(1,3) == 2 then
				tierTable = helds.tiers2
			else
				tierTable = helds.tiers3
			end
			prize = tierTable[math.random(#tierTable)]
			doPlayerAddItem(cid, prize, 1)
			doPlayerRemoveItem(cid, honoredToken, 25)
			doPlayerSendTextMessage(cid, 19, "You received a "..getItemInfo(prize).name..".")
			doCreatureExecuteTalkAction(cid, "#heldCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 25 Honored Tokens to pick a held item!")
			doCreatureExecuteTalkAction(cid, "#heldCount#")
		return true
		end
	end
	if words == "#honored2#" then
		if honoredCount >= 50 then
			if math.random(1,3) == 1 then
				tierTable = helds.tiers2
			elseif math.random(1,3) == 2 then
				tierTable = helds.tiers3
			else
				tierTable = helds.tiers4
			end
			prize = tierTable[math.random(#tierTable)]
			doPlayerAddItem(cid, prize, 1)
			doPlayerRemoveItem(cid, honoredToken, 50)
			doPlayerSendTextMessage(cid, 19, "You received a "..getItemInfo(prize).name..".")
			doCreatureExecuteTalkAction(cid, "#heldCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 50 Honored Tokens to pick a held item!")
			doCreatureExecuteTalkAction(cid, "#heldCount#")
		return true
		end
	end
	
	if words == "#honored3#" then
		if honoredCount >= 100 then
			if math.random(1,4) == 1 then
				tierTable = helds.tiers3
			elseif math.random(1,4) == 2 then
				tierTable = helds.tiers4
			elseif math.random(1,4) == 3 then
				tierTable = helds.tiers5
			else
				tierTable = helds.tiers6
			end
			prize = tierTable[math.random(#tierTable)]
			doPlayerAddItem(cid, prize, 1)
			doPlayerRemoveItem(cid, honoredToken, 100)
			doPlayerSendTextMessage(cid, 19, "You received a "..getItemInfo(prize).name..".")
			doCreatureExecuteTalkAction(cid, "#heldCount#")
		return true
		else
			doPlayerSendTextMessage(cid, 27, "You need 100 Honored Tokens to pick a held item!")
			doCreatureExecuteTalkAction(cid, "#heldCount#")
		return true
		end
	end
	if words == "#heldCount#" then
		doPlayerSendCancel(cid, "#held#,"..devotedCount..","..mightyCount..","..honoredCount..",")
	return true
	end
return true
end