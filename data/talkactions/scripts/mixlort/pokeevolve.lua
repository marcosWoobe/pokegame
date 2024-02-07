function onSay(cid, words, param, channel)

    local pk = getPlayerPokemons(cid)[1]
    if not pk then 
        doPlayerSendTextMessage(cid, 27, "Você precisa de um pokemon.")
        doPlayerSendTextMessage(cid, 25, "Você precisa de um pokemon.")
        doSendMagicEffect(getPlayerPosition(cid), 2)
        return true
    end

    local pokeball = getPlayerSlotItem(cid, 8)
    if getItemAttribute(pokeball.uid, "ehditto") and getItemAttribute(pokeball.uid, "ehditto") ~= "" then
        doPlayerSendTextMessage(cid, 25, "Você não pode evoluir Ditto!")
        return true
    end

    local poke = getThingPos(pk)
    local name = doCorrectPokemonName(getCreatureName(getPlayerPokemons(cid)[1]))
    local pevo = poevo[name]

    if not pevo then
        doPlayerSendTextMessage(cid, 27, "Este pokémon não tem Evolução, ou só evolui com pedra de evolução!")
        doSendMagicEffect(getPlayerPosition(cid), 2)  
        return true
    end
    if not POKELEVEL_PLUS.evolution_tab[name] then
        doPlayerSendTextMessage(cid, 27, "Este pokémon não tem Evolução, ou só evolui com pedra de evolução!")
        doSendMagicEffect(getPlayerPosition(cid), 2)  
        return true
    end

    local ball = getPlayerSlotItem(cid, 8).uid
    local levelpoke = getItemAttribute(ball, 'level') or 1

    local getEvolution = POKELEVEL_PLUS.evolution_tab[name]
    local levelEvolution = getEvolution.level

    local pokeevolution = poevo[name].evolution
    if levelpoke >= levelEvolution then
        if getPlayerLevel(cid) >= pokes[pokeevolution].level then
            doPlayerSendTextMessage(cid, 25, "Parabéns!\nSeu " .. name .. " está evoluindo para (" .. getEvolution.evolution .. ")!")
            doEvolvePokemon(cid, pk, pokeevolution)
        else
            doPlayerSendTextMessage(cid, 27, ("Você não tem o level necessário para evoluir esse pokémon (Level: "..pokes[pokeevolution].level..")."))
            doPlayerSendTextMessage(cid, 25, ("Você não tem o level necessário para evoluir esse pokémon (Level: "..pokes[pokeevolution].level..")."))
            doSendMagicEffect(getPlayerPosition(cid), 2)   
        end 
    else
        doPlayerSendTextMessage(cid, 27, ("O seu pokémon não tem o level necessário para evoluir (Level: "..levelEvolution..")."))
        doPlayerSendTextMessage(cid, 25, ("O seu pokémon não tem o level necessário para evoluir (Level: "..levelEvolution..")."))
        doSendMagicEffect(getPlayerPosition(cid), 2)
    end

    return true
end