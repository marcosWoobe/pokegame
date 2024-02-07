function onSay(cid, words, param, channel)

    local pk = getPlayerPokemons(cid)[1]
    if not pk then 
        doPlayerSendTextMessage(cid, 27, "Voc� precisa de um pokemon.")
        doPlayerSendTextMessage(cid, 25, "Voc� precisa de um pokemon.")
        doSendMagicEffect(getPlayerPosition(cid), 2)
        return true
    end

    local pokeball = getPlayerSlotItem(cid, 8)
    if getItemAttribute(pokeball.uid, "ehditto") and getItemAttribute(pokeball.uid, "ehditto") ~= "" then
        doPlayerSendTextMessage(cid, 25, "Voc� n�o pode evoluir Ditto!")
        return true
    end

    local poke = getThingPos(pk)
    local name = doCorrectPokemonName(getCreatureName(getPlayerPokemons(cid)[1]))
    local pevo = poevo[name]

    if not pevo then
        doPlayerSendTextMessage(cid, 27, "Este pok�mon n�o tem Evolu��o, ou s� evolui com pedra de evolu��o!")
        doSendMagicEffect(getPlayerPosition(cid), 2)  
        return true
    end
    if not POKELEVEL_PLUS.evolution_tab[name] then
        doPlayerSendTextMessage(cid, 27, "Este pok�mon n�o tem Evolu��o, ou s� evolui com pedra de evolu��o!")
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
            doPlayerSendTextMessage(cid, 25, "Parab�ns!\nSeu " .. name .. " est� evoluindo para (" .. getEvolution.evolution .. ")!")
            doEvolvePokemon(cid, pk, pokeevolution)
        else
            doPlayerSendTextMessage(cid, 27, ("Voc� n�o tem o level necess�rio para evoluir esse pok�mon (Level: "..pokes[pokeevolution].level..")."))
            doPlayerSendTextMessage(cid, 25, ("Voc� n�o tem o level necess�rio para evoluir esse pok�mon (Level: "..pokes[pokeevolution].level..")."))
            doSendMagicEffect(getPlayerPosition(cid), 2)   
        end 
    else
        doPlayerSendTextMessage(cid, 27, ("O seu pok�mon n�o tem o level necess�rio para evoluir (Level: "..levelEvolution..")."))
        doPlayerSendTextMessage(cid, 25, ("O seu pok�mon n�o tem o level necess�rio para evoluir (Level: "..levelEvolution..")."))
        doSendMagicEffect(getPlayerPosition(cid), 2)
    end

    return true
end