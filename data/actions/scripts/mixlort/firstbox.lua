function onUse(cid, item, frompos, item2, topos)

	-- if getPlayerLevel(cid) >= 25 then
		if doPlayerRemoveItem(cid,2141,1) == TRUE then
			doSendAnimatedText(getCreaturePosition(cid), 'Open First Box!', 32)  
			doPlayerAddItem(cid,17871,1)
			doPlayerAddItem(cid,2392,100)
			doPlayerAddItem(cid,12345,100)
			doPlayerAddItem(cid,12344,50)
			doPlayerAddPremiumDays(cid, 7) 
			setPlayerStorageValue(cid, 201928, 1)
			doPlayerSendTextMessage(cid,22,"Parabéns! Você ganhou: Ultra Ball (100x), Revive (50x), Normal Bike inicial (1x), Hyper Potions (100x), Prem Days (7x) e uma outfit exclusica desta box!")
		end
	-- else
		-- doPlayerSendTextMessage(cid,22,"Você precisa ser no mínimo level 25.")
	-- end

end