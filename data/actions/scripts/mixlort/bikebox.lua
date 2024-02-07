function onUse(cid, item, frompos, item2, topos)

Mixlort = math.random(1,7)

local configbike = {
	["bikenormal"] = {itemm = 23454},
	["bikefire"] = {effect = 15, itemm = 23452},
	["bikewater"] = {effect = 53, itemm = 23450},
	["bikethunder"] = {effect = 48, itemm = 23455},
	["bikeleaf"] = {effect = 996, itemm = 23451},
}

	if getPlayerLevel(cid) >= 1 then

		if doPlayerRemoveItem(cid,23453,1) == TRUE then

			if Mixlort == 1 then

				doPlayerSendTextMessage(cid,22,"Parabens! Você ganhou uma Bike Nornal.")
				doSendAnimatedText(getCreaturePosition(cid), 'Open Bike Box!', 32)  
				doPlayerAddItem(cid,configbike["bikenormal"].itemm,1)

			elseif Mixlort == 2 then

				doPlayerSendTextMessage(cid,22,"Parabens! Você ganhou uma Bike Thunder.")
				doSendAnimatedText(getCreaturePosition(cid), 'Open Bike Box!', 32)  
				doSendMagicEffect(getThingPos(cid), configbike["bikethunder"].effect)
				doPlayerAddItem(cid,configbike["bikethunder"].itemm,1)

			elseif Mixlort == 3 then

				doPlayerSendTextMessage(cid,22,"Parabens! Você ganhou uma Bike Water.")
				doSendAnimatedText(getCreaturePosition(cid), 'Open Bike Box!', 32)  
				doSendMagicEffect(getThingPos(cid), configbike["bikewater"].effect)
				doPlayerAddItem(cid,configbike["bikewater"].itemm,1)

			elseif Mixlort == 4 then

				doPlayerSendTextMessage(cid,22,"Parabens! Você ganhou uma Bike Nornal.")
				doSendAnimatedText(getCreaturePosition(cid), 'Open Bike Box!', 32)  
				doPlayerAddItem(cid,configbike["bikenormal"].itemm,1)

			elseif Mixlort == 5 then

				doPlayerSendTextMessage(cid,22,"Parabens! Você ganhou uma Bike Leaf.")
				doSendAnimatedText(getCreaturePosition(cid), 'Open Bike Box!', 32)  
				doSendMagicEffect(getThingPos(cid), configbike["bikeleaf"].effect)
				doPlayerAddItem(cid,configbike["bikeleaf"].itemm,1)

			elseif Mixlort == 6 then

				doPlayerSendTextMessage(cid,22,"Parabens! Você ganhou uma Bike Fire.")
				doSendAnimatedText(getCreaturePosition(cid), 'Open Bike Box!', 32)  
				doSendMagicEffect(getThingPos(cid), configbike["bikefire"].effect)
				doPlayerAddItem(cid,configbike["bikefire"].itemm,1)

			elseif Mixlort == 7 then

				doPlayerSendTextMessage(cid,22,"Parabens! Você ganhou uma Bike Nornal.")
				doSendAnimatedText(getCreaturePosition(cid), 'Open Bike Box!', 32)  
				doPlayerAddItem(cid,configbike["bikenormal"].itemm,1)
				-- doBroadcastMessage("O jogador "..getCreatureName(cid).." acabou de abrir uma Bike Box, Parabéns!")	

			end

		end

	end

end