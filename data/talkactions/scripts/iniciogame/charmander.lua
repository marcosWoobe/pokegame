-- TALK SISTEM ZRING SHOP ( WALOX DEV )
local inicial = {
	storage = 180033,
}

function onSay(cid, words, param,channel)

	if getPlayerStorageValue(cid, inicial.storage) >= 1 then
		-- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,"[Rowan]: Voc� j� pegou o seu Pok�mon inicial.")
		return true
	end
	 
	if getPlayerStorageValue(cid, inicial.storage) <= 1 then
		setPlayerStorageValue(cid, inicial.storage, 1)
		-- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Rowan]: Parab�ns voc� recebeu um Charmander.")
		addPokeToPlayer(cid, "Baby Charmander", 0, 0, "normal", true)
		-- doSendMagicEffect(getThingPos(cid), 742)
		doSendPlayerExtendedOpcode(cid, 196, true)
	end

	return true
end
-- TALK SISTEM ZRING SHOP ( WALOX DEV )