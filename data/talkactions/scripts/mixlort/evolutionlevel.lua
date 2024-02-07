function onSay(cid, words, param)
	local name = doCorrectPokemonName(param)

	local pevo = poevo[name]
   	if not pevo then
      	doPlayerSendTextMessage(cid, 27, "Este pokémon não tem Evolução, ou só evolui com pedra de evolução!")
      	return true
  	end
  	if not POKELEVEL_PLUS.evolution_tab[name] then
      	doPlayerSendTextMessage(cid, 27, "Este pokémon não tem Evolução, ou só evolui com pedra de evolução!")
      	return true
   	end

    local getEvolution = POKELEVEL_PLUS.evolution_tab[name]
    local levelEvolution = getEvolution.level
    local levelEvolutionStone = math.floor(getEvolution.level / 3)

	doPlayerSendTextMessage(cid, 27, ("O level do player necessário para evoluir este pokémon é (Level: "..pokes[name].level..")."))
	doPlayerSendTextMessage(cid, 27, ("O level do pokémon necessário para evoluir este pokémon é (Level: "..levelEvolution..")."))
	doPlayerSendTextMessage(cid, 27, ("Para evolução por stone, o level do pokémon necessário é (Level: "..levelEvolutionStone..")."))

	return true
end