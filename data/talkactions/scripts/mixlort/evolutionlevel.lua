function onSay(cid, words, param)
	local name = doCorrectPokemonName(param)

	local pevo = poevo[name]
   	if not pevo then
      	doPlayerSendTextMessage(cid, 27, "Este pok�mon n�o tem Evolu��o, ou s� evolui com pedra de evolu��o!")
      	return true
  	end
  	if not POKELEVEL_PLUS.evolution_tab[name] then
      	doPlayerSendTextMessage(cid, 27, "Este pok�mon n�o tem Evolu��o, ou s� evolui com pedra de evolu��o!")
      	return true
   	end

    local getEvolution = POKELEVEL_PLUS.evolution_tab[name]
    local levelEvolution = getEvolution.level
    local levelEvolutionStone = math.floor(getEvolution.level / 3)

	doPlayerSendTextMessage(cid, 27, ("O level do player necess�rio para evoluir este pok�mon � (Level: "..pokes[name].level..")."))
	doPlayerSendTextMessage(cid, 27, ("O level do pok�mon necess�rio para evoluir este pok�mon � (Level: "..levelEvolution..")."))
	doPlayerSendTextMessage(cid, 27, ("Para evolu��o por stone, o level do pok�mon necess�rio � (Level: "..levelEvolutionStone..")."))

	return true
end