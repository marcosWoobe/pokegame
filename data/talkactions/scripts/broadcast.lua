function onSay(cid, words, param, channel)
	if(param == '') then
		return true
	end
	
	-- if getPlayerGroupId(cid) > 1 and getPlayerGroupId(cid) < 7 then
 --        doPlayerBroadcastMessage(cid, param)
	--     --setPlayerStorageValue(cid, 57085, 100000)
	-- 	return true
	-- end
	
	if getPlayerLevel(cid) >= 30 then

		if doPlayerRemoveItem(cid,2160,10) then 

			if getPlayerItemCount(cid, 17650) >= 1 then
				doBroadcastMessage("(Megaphone) "..getCreatureName(cid)..": "..param, MESSAGE_EVENT_ADVANCE)
		    else
		        doPlayerSendTextMessage(cid,22,"Voc� precisa de um megaphone.")
		    end

		else
		        doPlayerSendTextMessage(cid,22,"Voc� n�o tem dinheiro suficiente para mandar uma mensagem.")			
		end

	else
		doPlayerSendTextMessage(cid,22,"Voc� n�o tem o level m�nimo necess�rio para usar o MegaPhone (100).")
	end

	return true
end
