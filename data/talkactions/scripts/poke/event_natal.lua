function onSay(cid, words, param, channel)

    --[[local items = {
        
		['Charizardite Y'] = {2500, 15135},
		['Premier Ball x100'] = {350, 2828},
		['MegaPhone'] = {450, 17650},
        ['Christmas Red Table'] = {200, 17825},
        ['Christmas Green Table'] = {200, 17827},
        ['Christmas Wreath'] = {70, 17845},
        ['Christmas Boots'] = {70, 17844},
        ['Christmas Bells'] = {70, 17843},
        ['Christmas Red Chair'] = {45, 17808},
        ['Christmas Green Chair'] = {45, 17839},
        ['Experience Star'] = {125, 17629},
        ['Addon Christmas (Shiny Jolteon)'] = {300, 17862},
        ['Addon Christmas (Shiny Flareon)'] = {300, 17863},
        ['Addon Christmas (Shiny Vaporeon)'] = {300, 17864},
        ['Addon Christmas (Shiny Nidoking)'] = {300, 17865},
        ['Addon Christmas (Shiny Fearow)'] = {300, 17866},
        ['Addon Christmas (Shiny Hypno)'] = {300, 17867},
        ['Addon Christmas (Shiny Vileplume)'] = {300, 17868},
        ['Addon Christmas (Shiny Golem)'] = {300, 17869},
        ['Addon Christmas (Elite Hitmontop)'] = {300, 17870},
		
	}]]

	local items = { 
		['Charizardite X'] = {3500, 15134},
		['Premier Ball x100'] = {350, 2828},
		['V Ball x50'] = {550, 19610},
        ['Experience Star'] = {125, 17629},
        ['Pascoa Coelinho'] = {500, 201917},
        ['Pascoa Collect'] = {1000, 201918}, 
		
	}
	local outfit = {"Pascoa Coelinho", "Pascoa Collect"}
	
	local premio = items[param] 
	if premio then 
	    if getPlayerStorageValue(cid, 57086) >= premio[1] then
		    local count = 1 
			if premio[2] == 2828 then
		   		doPlayerAddItem(cid, premio[2], 100) --premio
			elseif premio[2] == 19610 then
				doPlayerAddItem(cid, premio[2], 50) --premio
			elseif isInArray(outfit, param) then
			    setPlayerStorageValue(cid, premio[2], 1)
			else
			    doPlayerAddItem(cid, premio[2], 1) --premio 
			end
			setPlayerStorageValue(cid, 57086, getPlayerStorageValue(cid, 57086) - premio[1])
			sendMsgToPlayer(cid, 20, "Parabéns você adquiriu 1x "..param..".") 
		else
		    sendMsgToPlayer(cid, 20, "Você precisa de "..premio[1].." Event Points para adquirir "..param..".")
		end
	end
	
	return true
end