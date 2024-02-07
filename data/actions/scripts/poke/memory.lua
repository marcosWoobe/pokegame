local memory = {[12403] = {1,2},
[12404] = {3},
[12405] = {1,2,3},
}
function onUse(cid, item, frompos, item2, topos)
    --if doCorrectString(getItemAttribute(item2.uid, "ehditto")) ~= "Ditto" or doCorrectString(getItemAttribute(item2.uid, "ehditto")) ~= doCorrectString("Shiny Ditto") then
	--    doPlayerSendTextMessage(cid, 27, "Sorry, nao é um ditto ou shiny ditto."..doCorrectString(getItemAttribute(item2.uid, "ehditto"))) 
		
	--	return true 
	--end
	local namePoke = getItemAttribute(item2.uid, "poke")--doCorrectString(getItemAttribute(item2.uid, "poke")) doCorrectString("Shiny Ditto")
	if namePoke == "Shiny Ditto" or getItemAttribute(item2.uid, "ehditto") == "Shiny Ditto" 
    or namePoke == "Ditto" or getItemAttribute(item2.uid, "ehditto") == "Ditto"	then
	-- print(getItemAttribute(item2.uid, "ehditto"))
	-- print(getItemAttribute(item2.uid, "poke"))
        --doPlayerSendTextMessage(cid, 27, "Sorry, nao é um ditto ou shiny ditto."..getItemAttribute(item2.uid, "poke"))  
		
		--return true 
	--end
    if not memory[item.itemid] then
	    doPlayerSendTextMessage(cid, 27, "Sorry.")   
		return true
	end
	
	local str = " "
    --for _, memorySlot in pairs(memory[item2.itemid]) do 
	local memorySlot = memory[item.itemid]
	if #memorySlot < 3 and (namePoke == "Shiny Ditto" or getItemAttribute(item2.uid, "ehditto") == "Shiny Ditto") then
	    doPlayerSendTextMessage(cid, 27, "Sorry you need of memory shiny ditto.") 
		return true
	
	elseif #memorySlot == 3 and (namePoke == "Ditto" or getItemAttribute(item2.uid, "ehditto") == "Ditto") then
	    doPlayerSendTextMessage(cid, 27, "Sorry you need of memory ditto.") 
		return true
	end
	for i = 1, #memorySlot do
	    
	    if memorySlot[i] then
	        if getItemAttribute(item2.uid, "memoryDitto"..memorySlot[i]) then
			    doPlayerSendTextMessage(cid, 27, "sorry, you have slots")
	            return true
	        end
	        doSetItemAttribute(item2.uid, "memoryDitto"..memorySlot[i], "?")
			--if i > 1 then
			--    str = str..","
			--end
			--str = str..i
		end
		--str = str..memorySlot..","
	end
	
	doPlayerRemoveItem(cid, item.itemid, 1)
	doPlayerSendTextMessage(cid, 27, "deu certo. slots"..str.." adicionados.") 
	end
	
return true
end