function onSay(cid, words, param, channel)
  if getPlayerCurrentGuardian(cid) then                         
    doPlayerSendTextMessage(cid, 27, "Seu Guardian Possui (" .. math.ceil(exhaustion.get(getPlayerCurrentGuardian(cid), 11) / 60) .. ") Minutos Restantes.")
    doPlayerSetStorageValue(cid, 9005, exhaustion.get(getPlayerCurrentGuardian(cid), 11))
    doPlayerSetStorageValue(cid, 9006, getCreatureName(getPlayerCurrentGuardian(cid)))
    doSendPlayerExtendedOpcode(cid, 164, (math.ceil(exhaustion.get(getPlayerCurrentGuardian(cid), 11) / 60) .. " Minutos|" .. getPokemonXMLOutfit(getCreatureName(getCreatureGuardians(cid)[1]))) )
    -- print(exhaustion.get(getPlayerCurrentGuardian(cid), 11))
  else
    doPlayerSendTextMessage(cid, 27, "Você não tem um guardian ativo.")
  end
  return true
end  