function onSay(cid, words, param, channel)
	
	if not param then
		doPlayerPopupFYI(cid, [[
			Escolha o numero correspondente a aura que você deseja:
					
				Verde: 9
				Laranja: 10
				Azul: 11
				Branco: 12
				Violeta: 13
				Roxo: 14
				Vermelho: 15
				Amarelo: 16
				Preto: 17
				Rosa: 18
				Cinza-Azulado: 19
				Marrom: 20
				Random: 21
				Heart: 101
				Skull: 102 - 104
				Aura Red2 - 105
			]])
		return true
	end
	
	if isInArray({"9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "101", "102", "103", "104", "105"}, param) then
		if getItemAttribute(getPlayerSlotItem(cid, 8).uid, "temparticle") then
			if getItemAttribute(getPlayerSlotItem(cid, 8).uid, "ball") == "premier" and getItemAttribute(getPlayerSlotItem(cid, 8).uid, "aura") ~= "particle" then
				doItemEraseAttribute(getPlayerSlotItem(cid, 8).uid, "aura") 
				doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "aura", "particle")
			end			

			doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "aura", ("pcolor"..param))
			if getCreatureSummons(cid)[1] then
				doCreatureSetSkullType(getPlayerPokemons(cid)[1], param)	
			else
				doCreatureSetSkullType(cid, param)
			end	
		end
	else
		doPlayerPopupFYI(cid, [[
			Escolha o numero correspondente a aura que você deseja:
					
				Verde: 9
				Laranja: 10
				Azul: 11
				Branco: 12
				Violeta: 13
				Roxo: 14
				Vermelho: 15
				Amarelo: 16
				Preto: 17
				Rosa: 18
				Cinza-Azulado: 19
				Marrom: 20
				Random: 21
				Heart: 101
				Skull: 102 - 104
				Aura Red2 - 105
			]])		
	end
	return true
end
