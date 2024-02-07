local storage = 4343252

function onSay(cid, words, param, item)

	if getPlayerStorageValue(cid, storage) <= os.time() then

		if getGlobalStorageValue(655453) == 1 then
			if getPlayerLevel(cid) >= 50 then
				local items = {2392, 2393, 2391, 2394, 12344, 12343, 12345, 12346, 12347, 23418, 15644, 12339}
				local random_item = items[math.random(#items)]
				local item_name = getItemNameById(random_item) 
				local chancenada = 2

				local mixlortBag = math.random(1,10)
				if mixlortBag <= chancenada then 
					doPlayerSendTextMessage(cid,25,"Você não ganhou nada!")
					setPlayerStorageValue(cid, storage, os.time()+15)
					return true
				end

				if random_item == 2392 then
				    doPlayerAddItem(cid,2392,15)
				elseif random_item == 2393 then
				    doPlayerAddItem(cid,2393,20)
				elseif random_item == 2391 then
				    doPlayerAddItem(cid,2391,25)
				elseif random_item == 2394 then
				    doPlayerAddItem(cid,2394,30)
				elseif random_item == 12344 then
				    doPlayerAddItem(cid,12344,15)
				elseif random_item == 12343 then
				    doPlayerAddItem(cid,12343,10)   
				elseif random_item == 12345 then
				    doPlayerAddItem(cid,12345,30)   
				elseif random_item == 12346 then
				    doPlayerAddItem(cid,12346,35)          
				elseif random_item == 12347 then
				    doPlayerAddItem(cid,12347,40)
				elseif random_item == 23418 then
				    doPlayerAddItem(cid,23418,3)
				else
					doPlayerAddItem(cid,random_item,1)
				end   

				doPlayerAddItem(cid,2152,3)
				doBroadcastMessageOld("Parabens ao jogador "..getCreatureName(cid).." ganhou "..item_name.." e um premio em dinheiro!",25)
				setPlayerStorageValue(cid, storage, os.time()+15)
			else
				doPlayerSendTextMessage(cid,25,"Você precisa ser ao menos level 50 para participar do evento bag.")
			end
		else
			doPlayerSendTextMessage(cid,25,"Evento bag esta fechado!")
		end

	end

end