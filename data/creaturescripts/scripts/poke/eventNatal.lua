function onKill(cid, target)

    local continue = true

    if ehMonstro(target) then
        if string.find(tostring(getCreatureName(target)), "Christmas") then
		    sendMsgToPlayer(cid, 20, "Você recebeu 1 Event Point por derrotar um Pokémon natalino.")
			setPlayerStorageValue(cid, 57085, getPlayerStorageValue(cid, 57085) + 1)
		end
    end   

    return true
end