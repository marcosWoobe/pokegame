function onLogout(cid)

    if getPlayerStorageValue(cid, 43534) > os.time() then
		doPlayerSendTextMessage(cid, 18, "Por motivos de segurança você precisa esperar "..getPlayerStorageValue(cid, 43534) - os.time().. " segundos para poder deslogar.")
    	return false
    end

	if getPlayerStorageValue(cid, 23592) > os.time() then
		doPlayerSendCancel(cid, "Você tem que esperar ".. getPlayerStorageValue(cid, 23592) - os.time() .." segundo(s) para deslogar.")
		doSendMagicEffect(getPlayerPosition(cid), 2)
		return false
	end 

  return true
end