function onUse(cid, item, fromPosition, itemEx, toPosition)
 
local meuovo = {
    qnt = 1,      
    maxi = 50,      
    chance = 64,  
    boost_fail = 6,  
    falhar = 5,
}

    if #getPlayerPokemons(cid) >= 1 then
        doPlayerSendCancel(cid, "Retorne seu pokemon para dar boost.")
        return true
    end
 
    local minhabola = getPlayerSlotItem(cid, 8).uid
    local boost = getItemAttribute(minhabola, "boost") or 0
 
    if minhabola <= 0 then
        return doPlayerSendCancel(cid, "Coloque um pokémon no Main Slot!")
    elseif boost >= meuovo.maxi then
        return doPlayerSendCancel(cid, "Seu pokémon já se encontra no nível máximo de boost!")
    end
    
    if boost >= meuovo.boost_fail then
        if math.random(1, 100) <= meuovo.chance then
            doItemSetAttribute(minhabola, "boost", (boost + 1))
            doSendMagicEffect(fromPosition, 173)
            doRemoveItem(item.uid, 1)
        else
            doPlayerSendCancel(cid,"Falhou!")
            -- doItemSetAttribute(minhabola, "boost", (meuovo.falhar))
            doRemoveItem(item.uid, 1)
        end
    else
        doItemSetAttribute(minhabola, "boost", (boost + meuovo.qnt))
        doSendMagicEffect(fromPosition, 173)
        doRemoveItem(item.uid, 1)
    end
    return true
end