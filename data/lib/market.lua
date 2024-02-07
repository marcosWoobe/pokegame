local categoria = {
["Pokeballs"] = {2394, 2392},
["Diamonds"] = {2145},

}

function conCart(merda)
    local porra = ""
    for _, s in ipairs(merda) do
        if #merda == _ then
            porra = porra..s
        else
            porra = porra..s..","
        end
    end
	return porra
end

function marketOfferCate(cid, goria, cre, v, pag, idPag)
      local msg = NetworkMessage.create()
    local vai = 0
    local list = {}
	
	local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes, time, money, stack FROM market_items WHERE time > "..os.time().." ORDER BY id DESC")
	if goria == "All" and cre ~= "search" then
	local bosta = query:getRows(true)
	--query:free()
	query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes, time, money, stack FROM market_items WHERE time > "..os.time().." ORDER BY id DESC LIMIT 50")
	
	--local bosta = query:getRows(true)
	--print(bosta)
	--doSendPlayerExtendedOpcode(cid, 156,  math.ceil(bosta/50))
	marketOffer(cid, query) 
	doSendPlayerExtendedOpcode(cid, 156,  math.ceil(bosta/50))
	return
-------------------------------------para categoria pagi-------------------------------------------------------------	
	    print(v)
		elseif cre == "decremente"then
			local msgs = NetworkMessage.create()
			local bosta = query:getRows(true)
			local list = {}
			local vai = 0
			local limit = 51
			
		    query = db.getResult("SELECT * FROM market_items WHERE id > "..v.." AND time > "..os.time().." AND itemtype IN("..conCart(categoria[goria])..")")
			if query:getID() == -1 then
                return
            end
            repeat
			limit = limit-1
            vai = vai+1
            local id = query:getDataInt("id") 
	        local player = query:getDataInt("player_id")
	        local cost = query:getDataInt("cost")
	        local item = query:getDataInt("itemtype")
	        local count = query:getDataInt("count")
	        local money = query:getDataInt("money")
	        local stack = query:getDataInt("stack")
	        
	        list[limit] = {id = id, player = player, cost = cost, item = item, count = count, money = money, stack = stack}
	
            until not query:next() or limit == 1
	        if vai > 50 then
	            vai = 50
	        end

	        msgs:addU8(vai)
            for i = 1, 50 do
		        msgs:addU16(list[i].id)
                msgs:addU16(getItemInfo(list[i].item).clientId)
		        msgs:addString(getItemIdByClientId(cid, list[i].id))
                msgs:addString(getPlayerNameByGUID(list[i].player))
                msgs:addU16(list[i].count)
                msgs:addU32(list[i].cost)
		        msgs:addString(getDesMarket(list[i].id))
		        msgs:addU8(list[i].money)
		        msgs:addU8(list[i].stack)
	        end
			doSendPlayerExtendedOpcode(cid, 152, msgs:getBuffer())
			return

		elseif cre == "incremente" and not pag then
		    --local v = msg:getU16()
			local bosta = query:getRows(true)
	        query = db.getResult("SELECT * FROM market_items WHERE id < "..v.." AND itemtype IN("..conCart(categoria[goria])..") ORDER BY id DESC LIMIT 50")
		   -- marketOffer(cid,query)
		elseif cre == "search" then
		    --local search = msg:getString()
			if v == "" then
			    local query = db.getResult("SELECT * FROM market_items WHERE itemtype IN("..conCart(categoria[goria])..") ORDER BY id DESC LIMIT 50")
                marketOffer(cid,query) 
				local check = db.getResult("SELECT `id` FROM `market_items` WHERE time > "..os.time().." ORDER BY id ")
                if(check:getID() ~= -1) then
		            local col = math.ceil(check:getRows(true)/50)
				   -- doSendPlayerExtendedOpcode(cid, 156, "1,"..col)
			    end
			else
			local bosta = query:getRows(true)
			    if goria == "Pokemons" then 
				 marketOfferSearch(cid, v, goria, true)
				else
				
			    marketOfferSearch(cid, v, goria, false, pag, idPag)--, conCart(categoria[goria]))
				end
				--return
				---doSendPlayerExtendedOpcode(cid, 156, "1,"..1)
				
			end
			return
		elseif cre == "pagLast" then
		    
			
			local check = db.getResult("SELECT `id` FROM `market_items` WHERE time > "..os.time().." AND itemtype IN("..conCart(categoria[goria])..") ORDER BY id ")
            if(check:getID() ~= -1) then
			local id = 1
			    local maxp = check:getRows(true) 
		        local col = math.ceil(maxp/50) 

				query = db.getResult("SELECT * FROM market_items WHERE itemtype IN("..conCart(categoria[goria])..") ORDER BY id LIMIT "..(50-((col*50)-maxp)).." ")
				print("xare t "..(50-((col*50)-maxp)))
				marketOffer(cid,query, (50-((col*50)-maxp))) 
				marketMyOffer(cid)
				doSendPlayerExtendedOpcode(cid, 156, col) 
			end
			return
-------------------------------------para categoria pagi-------------------------------------------------------------	
	
	
	else
	
	
	
	
	query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes, time, money, stack FROM market_items ORDER BY id DESC")
	end
    if query:getID() == -1 then
        return
    end
    repeat
	
	local id = query:getDataInt("id")
	local item = query:getDataInt("itemtype")
    if isInArray(categoria[goria], item) or goria == "Pokemons" and pokes[getItemIdByClientId(cid, id)] then 
        local tempo = query:getDataInt("time")
	    if os.time() <= tempo then    
        vai = vai+1
        
	    local player = query:getDataInt("player_id")
	    local cost = query:getDataInt("cost")
    	
    	local count = query:getDataInt("count")
		local money = query:getDataInt("money")
		local stack = query:getDataInt("stack")
    	list[vai] = {id = id, player = player, cost = cost, item = item, count = count, money = money, stack = stack}
		end
	end
		
    until not query:next()
	local limit = vai
	if vai > 50 then
	    vai = 50
	end
	msg:addU8(vai)
    for i = 1, vai do
		msg:addU16(list[i].id)
        msg:addU16(getItemInfo(list[i].item).clientId)
        --msg:addString(getItemInfo(list[i].item).name)
		--print(getItemIdByClientId(cid, 29))
		msg:addString(tostring(getItemIdByClientId(cid, list[i].id)))
        msg:addString(getPlayerNameByGUID(list[i].player))
        msg:addU16(list[i].count)
        msg:addU32(list[i].cost)
		msg:addString(getDesMarket(list[i].id))
		msg:addU8(list[i].money)
		msg:addU8(list[i].stack)
		--print(getDesMarket(cid, list[i].id))
	end
	doSendPlayerExtendedOpcode(cid, 152, msg:getBuffer())
	if cre == "" then
	doSendPlayerExtendedOpcode(cid, 156, "1,"..math.ceil(limit/50))
	end
    query:free()
end


function marketOffer(cid, query, limit)

  local msg = NetworkMessage.create()
	
    local vai = 0
	if limit then
	vai = limit+1
	end
    local list = {}
    --local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes FROM market_items ORDER BY id DESC LIMIT 50")
    if query:getID() == -1 then
        return
    end
    repeat
	--   if vai == 50 then
	--break
	--end 
	local tempo = query:getDataInt("time")
	if os.time() <= tempo then

		
	if limit then
    vai = vai-1
	else
	vai = vai+1
	end
	 -- isso vai ser testado
    local id = query:getDataInt("id") 
	local player = query:getDataInt("player_id")
	local cost = query:getDataInt("cost")
	local item = query:getDataInt("itemtype")
	local count = query:getDataInt("count")
	local money = query:getDataInt("money")
	local stack = query:getDataInt("stack")
	
	list[vai] = {id = id, player = player, cost = cost, item = item, count = count, money = money, stack = stack}
	end
	
    until not query:next()
	if not limit then
	limit = vai
	
	end
	if limit > 50 then
	limit = 50
	end
	msg:addU8(limit)
    for i = 1, limit do
		msg:addU16(list[i].id)
        msg:addU16(getItemInfo(list[i].item).clientId)
        --msg:addString(getItemInfo(list[i].item).name)
		--print(getItemIdByClientId(cid, 29))
		if getItemIdByClientId(cid, list[i].id) then
		msg:addString(getItemIdByClientId(cid, list[i].id))
		else
		msg:addString("Not Descript.") 
		print("Markert Des VIktor")
		end
        msg:addString(getPlayerNameByGUID(list[i].player))
        msg:addU16(list[i].count)
        msg:addU32(list[i].cost)
		msg:addString(getDesMarket(list[i].id))
		msg:addU8(list[i].money)
		msg:addU8(list[i].stack)
	end
	doSendPlayerExtendedOpcode(cid, 152, msg:getBuffer())
	--doSendPlayerExtendedOpcode(cid, 156, limit)
    query:free()






   --[[ local msg = NetworkMessage.create()
    local vai = 0
    local list = {}
    --local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes FROM market_items ORDER BY id DESC LIMIT 50")
    if query:getID() == -1 then
        return
    end
    repeat
	    
    vai = vai+1
    local id = query:getDataInt("id")
	local player = query:getDataInt("player_id")
	local cost = query:getDataInt("cost")
	local item = query:getDataInt("itemtype")
	local count = query:getDataInt("count")
	list[vai] = {id = id, player = player, cost = cost, item = item, count = count}
		
    until not query:next()
	msg:addU8(vai)
    for i = 1, vai do
		msg:addU16(list[i].id)
        msg:addU16(getItemInfo(list[i].item).clientId)
        --msg:addString(getItemInfo(list[i].item).name)
		--print(getItemIdByClientId(cid, 29))
		msg:addString(getItemIdByClientId(cid, list[i].id))
        msg:addString(getPlayerNameByGUID(list[i].player))
        msg:addU8(list[i].count)
        msg:addU32(list[i].cost)
	end
	doSendPlayerExtendedOpcode(cid, 152, msg:getBuffer())
    query:free()]]
end

function marketMyOffer(cid)
    local msg = NetworkMessage.create()
    local vai = 0
    local list = {}
    --local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes FROM market_items ORDER BY id DESC LIMIT 50")
	local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes, time, money, stack FROM market_items WHERE player_id = "..getPlayerGUID(cid).." ORDER BY id DESC LIMIT 50")
    --local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes FROM market_items WHERE id < v ORDER BY id DESC LIMIT 50")
	if query:getID() == -1 then
        return
    end
    repeat
	
    --local tempo = query:getDataInt("time")
	--if os.time() <= tempo then    
    vai = vai+1
    local id = query:getDataInt("id")
	local cost = query:getDataInt("cost")
	local item = query:getDataInt("itemtype")
	local count = query:getDataInt("count")
	local temp =  query:getDataInt("time")
	local money = query:getDataInt("money")
	local stack = query:getDataInt("stack")
	list[vai] = {id = id, cost = cost, item = item, count = count, tempo = temp, stack = stack, money = money}
	--end
		
    until not query:next()
	msg:addU8(vai)
    for i = 1, vai do
		msg:addU16(list[i].id)
        msg:addU16(getItemInfo(list[i].item).clientId)
        msg:addString(getItemIdByClientId(cid, list[i].id))
        msg:addU16(list[i].count)
        msg:addU32(list[i].cost)
		msg:addString(getDesMarket(list[i].id)) 
		--msg:addString((((os.time()-tempo)/60)/1000)..":"..)
		local minuT = (((list[i].tempo-os.time())/60))
		local hour = math.floor((minuT/60))
		--local hour = math.floor((minuT/60))
		local minu = math.floor(minuT-(hour*60)) --2879,9765
		--print("Time >> "..(((list[i].tempo-os.time())/60)/60).." >> "..list[i].tempo.."/n")
		--print(hour..":"..minu.." >>>>> "..list[i].tempo)
		--local tempo = query:getDataInt("time")
	    if os.time() <= list[i].tempo then
			msg:addString(hour..":"..minu)
		else
			msg:addString("expired")
		end
		msg:addU8(list[i].money)
		msg:addU8(list[i].stack)
	end
	
		
	
	doSendPlayerExtendedOpcode(cid, 157, msg:getBuffer())
    query:free()
	
end




















function marketOfferSearch(cid, sear, goria, po, pag, idPag)
    local msg = NetworkMessage.create()
    local vai = 0
    local list = {}
	
	local query = ""
	if pag and pag == "incremente" then
	query = db.getResult("SELECT * FROM market_items WHERE id < ".. idPag .." AND time > "..os.time().." ORDER BY id DESC")
	--db.getResult("SELECT * FROM market_items WHERE id < "..idPag.." AND itemtype IN("..conCart(categoria[goria])..") ORDER BY id DESC LIMIT 5")
	--query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes, time, money, stack FROM market_items ORDER BY id DESC")
     --   print("priguito "..sear.. " " ..pag .." "..idPag) 
	elseif pag and pag == "decremente" then
	query = db.getResult("SELECT * FROM market_items WHERE id > ".. idPag .." AND time > "..os.time().." ORDER BY id DESC")
	elseif pag and pag == "pagLast" then
	query = db.getResult("SELECT * FROM market_items ORDER BY id")
	else
	--query = db.getResult("SELECT * FROM market_items WHERE id < ".. idPag .." AND time > "..os.time().." ORDER BY id DESC")
	--(50-((col*50)-maxp))
	--local 
	query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes, time, money, stack FROM market_items ORDER BY id DESC")
	end
	--else
	--query = db.getResult("SELECT * FROM market_items ORDER BY id DESC")
	--db.getResult("SELECT * FROM market_items WHERE itemtype IN("..conCart(categoria[goria])..") ORDER BY id DESC LIMIT 50")
	--end
    if query:getID() == -1 then
        return
    end
	
	
    repeat
	
	local id = query:getDataInt("id")
	local item = query:getDataInt("itemtype")
	--print("itemtype: "..item)
	if pag and pag ~= "" and string.find(doCorrectString(getItemIdByClientId(cid, id)), doCorrectString(sear)) and (goria == "All" or isInArray(categoria[goria], item)) then
	local tempo = query:getDataInt("time")
	    --if os.time() <= tempo then	
        vai = vai+1
        
	    local player = query:getDataInt("player_id")
	    local cost = query:getDataInt("cost")
    	
    	local count = query:getDataInt("count")
		local stack = query:getDataInt("stack")
		local money = query:getDataInt("money")
    	list[vai] = {id = id, player = player, cost = cost, item = item, count = count, money = money, stack = stack}
	--end
	
	
	elseif goria and string.find(doCorrectString(getItemIdByClientId(cid, id)), doCorrectString(sear)) and isInArray(categoria[goria], item) or
	po and goria and goria == "Pokemons" and string.find(doCorrectString(getItemIdByClientId(cid, id)), doCorrectString(sear)) and pokes[getItemIdByClientId(cid, id)]
    or not goria and string.find(doCorrectString(getItemIdByClientId(cid, id)), doCorrectString(sear)) then  
        local tempo = query:getDataInt("time")
	    if os.time() <= tempo then	
        vai = vai+1
        
	    local player = query:getDataInt("player_id")
	    local cost = query:getDataInt("cost")
    	
    	local count = query:getDataInt("count")
		local stack = query:getDataInt("stack")
		local money = query:getDataInt("money")
    	list[vai] = {id = id, player = player, cost = cost, item = item, count = count, money = money, stack = stack}
		end
	end
		
    until not query:next()
	
	local limit = math.ceil(vai/50)
	if vai > 50 then
	    vai = 50
	end
	if vai == 0 then
	return
	end
	msg:addU8(vai)
    for i = 1, vai do
		msg:addU16(list[i].id)
        msg:addU16(getItemInfo(list[i].item).clientId)
        --msg:addString(getItemInfo(list[i].item).name)
		--print(getItemIdByClientId(cid, 29))
		msg:addString(tostring(getItemIdByClientId(cid, list[i].id)))
        msg:addString(getPlayerNameByGUID(list[i].player))
        msg:addU16(list[i].count)
        msg:addU32(list[i].cost)
		msg:addString(getDesMarket(list[i].id))
		msg:addU8(list[i].money)
		msg:addU8(list[i].stack)
		
	end
	print("gotur "..limit)
	doSendPlayerExtendedOpcode(cid, 152, msg:getBuffer())
	--local check = db.getResult("SELECT `id` FROM `market_items` WHERE time > "..os.time().." AND ORDER BY id ")
	
    query:free()
	
	if not pag then
	doSendPlayerExtendedOpcode(cid, 156, limit)
	end
	--doSendPlayerExtendedOpcode(cid, 156, 10) 
	
	
end