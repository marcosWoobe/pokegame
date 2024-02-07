function onUse(cid, item, fromPosition, item2, toPosition)
	
	if #getPlayerPokemons(cid) >= 1 then
		doPlayerSendCancel(cid, "Retorne o pokémon para usar a particle aura.")
		return true
	end

	if getItemAttribute(item2.uid, "temparticle") then
		doPlayerSendCancel(cid, "Seu pokémon já tem aura.")
		return true
	end
	
	if getItemAttribute(item2.uid, "poke") then
		doSetItemAttribute(item2.uid, "temparticle", 0)
		doRemoveItem(item.uid, 1)
		doPlayerSendTextMessage(cid, 20, "Agora seu pokémon tem Particle Aura! Digite !particle para escolher a cor.")
		doItemSetAttribute(item2.uid, "aura", ("pcolor15"))
	else
		doPlayerSendCancel(cid, "Você só pode usar a partice aura em uma pokéball.")
		return true
	end

    if #getCreatureSummons(cid) >= 1 then
		local item = getPlayerSlotItem(cid, 8)
		doPlayerSendCancel(cid, "KGT,"..getItemAttribute(item.uid, "ballorder").."|".."0")
		doPlayerSendCancel(cid, "")
	end

return true
end