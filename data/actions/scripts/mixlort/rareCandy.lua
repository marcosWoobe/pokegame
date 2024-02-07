function onUse(cid, item, frompos, item2, topos)
	local levellimite = 100
	local levelx = getItemAttribute(item2.uid, "level")
	local msgaviso = "Seu pokemon já esta com o level máximo [100]"

	if not isPokeball(item2.itemid) or #getCreatureSummons(cid) > 0 then 
		doPlayerSendCancel(cid, "Use na ball sem pokemons pra fora!")
		return true 
	end

	if string.find(tostring(getItemAttribute(item2.uid, "poke")), "Shiny") then
		doPlayerSendCancel(cid, "Você não pode usar em pokemns shinys!")
		return true 
	end

	-- if #getCreatureSummons(cid) == 1 then
		if levelx < levellimite then
			if math.random(1,100) > 15 then 
				doRemoveItem(item.uid, 1)
				doItemSetAttribute(item2.uid, "level", levelx +1)  
				doItemSetAttribute(item2.uid, "exp", 1) 
				doSendAnimatedText(getCreaturePosition(cid), "POKE LEVEL UP!", 215)
			else
				doSendAnimatedText(getCreaturePosition(cid), "Fail!", 215)
				doPlayerSendTextMessage(cid, 20, "Fail")
			end
		else
			doPlayerSendCancel(cid, msgaviso)
		end 
	-- else
		-- doPlayerSendCancel(cid, "Você precisa ta com pokemon Fora da pokebola")
	-- end

	return true
end