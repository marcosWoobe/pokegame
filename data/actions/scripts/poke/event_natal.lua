function onUse(cid, item, fromPosition, item2, toPosition)

    
    local items = {
		{typeT = 'item', itemId = 14212, name = 'Charizardite Y', price = 2500},
		{typeT = 'item', itemId =  17119, name = 'Premier Ball x100', price = 350},
		{typeT = 'item', itemId = 17149, name = 'MegaPhone', price = 450}, 
        {typeT = 'item', itemId = 17324, name = 'Christmas Red Table', price = 200},
        {typeT = 'item', itemId = 17326, name = 'Christmas Green Table', price = 200},
        {typeT = 'item', itemId = 17344, name = 'Christmas Wreath', price = 70},
        {typeT = 'item', itemId = 17343, name = 'Christmas Boots', price = 70},
        {typeT = 'item', itemId = 17342, name = 'Christmas Bells', price = 70},
        {typeT = 'item', itemId = 17307, name = 'Christmas Red Chair', price = 45},
        {typeT = 'item', itemId = 17338, name = 'Christmas Green Chair', price = 45},
        {typeT = 'item', itemId = 17128, name = 'Experience Star', price = 125},
        {typeT = 'outfit', itemId = 2157, name = 'Addon Christmas (Shiny Jolteon)', price = 300},
        {typeT = 'outfit', itemId = 2158, name = 'Addon Christmas (Shiny Flareon)', price = 300},
        {typeT = 'outfit', itemId = 2159, name = 'Addon Christmas (Shiny Vaporeon)', price = 300},
        {typeT = 'outfit', itemId = 2161, name = 'Addon Christmas (Shiny Nidoking)', price = 300},
        {typeT = 'outfit', itemId = 2162, name = 'Addon Christmas (Shiny Fearow)', price = 300},
        {typeT = 'outfit', itemId = 2164, name = 'Addon Christmas (Shiny Hypno)', price = 300},
        {typeT = 'outfit', itemId = 2165, name = 'Addon Christmas (Shiny Vileplume)', price = 300},
        {typeT = 'outfit', itemId = 2166, name = 'Addon Christmas (Shiny Golem)', price = 300},
        {typeT = 'outfit', itemId = 2167, name = 'Addon Christmas (Elite Hitmontop)', price = 300},
		
    }
	
	local points = getPlayerStorageValue(cid, 57085)
	if getPlayerStorageValue(cid, 57085) <= 0 then
	    points = 0
	end
	
    local buffer = points.."@"
    for i = 1, #items do
	    local count = "1;"
	    if items[i].typeT == "outfit" then
		    count = ""
		else
		    outfit = "1;"
		end
        buffer = buffer..items[i].typeT..";"..items[i].itemId..";"..count..items[i].name..";"..items[i].price
	    if i < #items then
	        buffer = buffer.."|"
	    end
    end
	
	doSendPlayerExtendedOpcode(cid, 52, buffer) 
    return true
end