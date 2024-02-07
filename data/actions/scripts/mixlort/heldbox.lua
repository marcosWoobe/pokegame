function onUse(cid, item, frompos, item2, topos)

	local configheld = {
		["t1"] = {itemidd = 23474, heldid = {15559, 15566, 15573, 15580, 15587, 15594, 15601, 15608, 15615, 15622, 15629, 15636, 13962, 13983, 13990, 13976, 17446, 17439, 13941, 17409, 17416, 17423, 17402}},
		["t2"] = {itemidd = 23475, heldid = {15560, 15567, 15574, 15581, 15588, 15595, 15602, 15609, 15616, 15623, 15630, 15637, 13963, 13984, 13991, 13977, 17447, 17440, 13942, 17410, 17417, 17424, 17403}},
		["t3"] = {itemidd = 23476, heldid = {17404, 17425, 17418, 17411, 13943, 17441, 17448, 13978, 13992, 13985, 13964, 15638, 15631, 15624, 15617, 15610, 15603, 15596, 15589, 15582, 15575, 15568, 15561}},
		["t4"] = {itemidd = 23477, heldid = {15590, 15562, 15632, 15604, 15625, 15576, 13979, 17449, 17442, 13986, 15597, 13965, 15583, 15639, 15611, 13993, 15569, 15618, 13944, 17412, 17419, 17426, 17405, 17432, 17431, 17430, 15643, 17433, 17435, 17436, 17437}},
		["t5"] = {itemidd = 23478, heldid = {15591, 15563, 15633, 15605, 15626, 15577, 13980, 17450, 17443, 13987, 15598, 13966, 15584, 15640, 15612, 13994, 17624, 17626, 15570, 15619, 13945, 17413, 17420, 17427, 17406}},
		["t6"] = {itemidd = 23479, heldid = {15592, 15564, 15634, 15606, 15627, 15578, 13981, 17451, 17444, 13988, 15599, 13967, 15585, 15641, 15613, 13995, 15571, 15620, 13946, 17414, 17421, 17428, 17407}},
		["t7"] = {itemidd = 23480, heldid = {15593, 15565, 15635, 15607, 15628, 15579, 13982, 17452, 17445, 13989, 15600, 13968, 15586, 15642, 15614, 13996, 17625, 15572, 15621, 13947, 17415, 17422, 17429, 17408}},
	}

	heldsids1 = configheld["t1"].heldid
	heldsids2 = configheld["t2"].heldid
	heldsids3 = configheld["t3"].heldid
	heldsids4 = configheld["t4"].heldid
	heldsids5 = configheld["t5"].heldid
	heldsids6 = configheld["t6"].heldid
	heldsids7 = configheld["t7"].heldid

	if getPlayerLevel(cid) >= 30 then
		if doPlayerRemoveItem(cid,item.itemid,1) then
			if (item.itemid) == configheld["t1"].itemidd then
				print("oi")
				doPlayerSendTextMessage(cid,22,"Parabens! Você ganhou um Held T1.")
				doSendAnimatedText(getCreaturePosition(cid), 'Open Held Box!', 145)  
				doPlayerAddItem(cid, heldsids1[math.random(1, #heldsids1)], 1)
				-- doPlayerRemoveItem(cid,item.itemid,1)	

			elseif (item.itemid) == configheld["t2"].itemidd then
				doPlayerSendTextMessage(cid,22,"Parabens! Você ganhou um Held T2.")
				doSendAnimatedText(getCreaturePosition(cid), 'Open Held Box!', 145)  
				doPlayerAddItem(cid, heldsids2[math.random(1, #heldsids2)], 1)
				-- doPlayerRemoveItem(cid,item.itemid,1)	

			elseif (item.itemid) == configheld["t3"].itemidd then
				doPlayerSendTextMessage(cid,22,"Parabens! Você ganhou um Held T3.")
				doSendAnimatedText(getCreaturePosition(cid), 'Open Held Box!', 145)  
				doPlayerAddItem(cid, heldsids3[math.random(1, #heldsids3)], 1)
				-- doPlayerRemoveItem(cid,item.itemid,1)	

			elseif (item.itemid) == configheld["t4"].itemidd then
				doPlayerSendTextMessage(cid,22,"Parabens! Você ganhou um Held T4.")
				doSendAnimatedText(getCreaturePosition(cid), 'Open Held Box!', 145)  
				doPlayerAddItem(cid, heldsids4[math.random(1, #heldsids4)], 1)
				-- doPlayerRemoveItem(cid,item.itemid,1)

			elseif (item.itemid) == configheld["t5"].itemidd then
				doPlayerSendTextMessage(cid,22,"Parabens! Você ganhou um Held T5.")
				doSendAnimatedText(getCreaturePosition(cid), 'Open Held Box!', 145)  
				doPlayerAddItem(cid, heldsids5[math.random(1, #heldsids5)], 1)
				-- doPlayerRemoveItem(cid,item.itemid,1)		

			elseif (item.itemid) == configheld["t6"].itemidd then
				doPlayerSendTextMessage(cid,22,"Parabens! Você ganhou um Held T6.")
				doSendAnimatedText(getCreaturePosition(cid), 'Open Held Box!', 145)  
				doPlayerAddItem(cid, heldsids6[math.random(1, #heldsids6)], 1)
				-- doPlayerRemoveItem(cid,item.itemid,1)		

			elseif (item.itemid) == configheld["t7"].itemidd then
				doPlayerSendTextMessage(cid,22,"Parabens! Você ganhou um Held T7.")
				doSendAnimatedText(getCreaturePosition(cid), 'Open Held Box!', 145)  
				doPlayerAddItem(cid, heldsids7[math.random(1, #heldsids7)], 1)
				-- doPlayerRemoveItem(cid,item.itemid,1)	
			end
		end
	else
		doPlayerSendTextMessage(cid,22,"Você não tem o level mínimo necessário para abrir essa box (50).")
	end

end