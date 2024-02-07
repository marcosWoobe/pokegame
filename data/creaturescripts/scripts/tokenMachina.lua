function onOpenChannel(cid, channelId)
--function onJoinChannel(cid, channelId, users, isTv)	  
print(channelId)
    if channelId >= 4000 and channelId <= 4100 then
	print("foi")
	local Tokens = TokensTable[channelId]
    if not Tokens then
	    doPlayerSendCancel(cid, "listID invalid. Teport for adm.")
	    return false
	end
	
	if getPlayerItemCount(cid, Tokens.idToken) < Tokens.count then
	    doPlayerSendCancel(cid, "Sorry your not have "..Tokens.count.."X "..Tokens.name)
	    return false
	end
	local held = Tokens.helds[math.random(#Tokens.helds)]
	print(math.random(#Tokens.helds))
	doPlayerRemoveItem(cid, Tokens.idToken, Tokens.count)
	doPlayerAddItem(cid, held, 1) 
	
	return true
	end
	return true
end