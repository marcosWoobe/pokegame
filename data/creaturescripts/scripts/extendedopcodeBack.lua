OPCODE_LANGUAGE = 1


local function volta(cid, init)
	if getPlayerSlotItem(cid, CONST_SLOT_FEET).uid then
		local back_messages = {"Muito bom, ",    "Foi impecável, ",    "Volte, ", "Chega, ", "Grande, "}
		local go_messages = {"Hora do duelo, ", "Vai, ",    "Faça seu trabalho, ", "Prepare-se, ", "Chegou sua hora, "}
 
		local item = getPlayerSlotItem(cid, CONST_SLOT_FEET)
		local msg_back = back_messages[math.random(#back_messages)]
		local msg_go = go_messages[math.random(#go_messages)]
 if #getCreatureSummons(cid) >= 1 then
		if isPokeBallUse(item.itemid) then
			if #getCreatureSummons(cid) >= 1 then
				local pokemon = getPlayerPokemon(cid)
				local ball = getPlayerSlotItem(cid, 8).uid
				local pokename = getPokeballInfo(item.uid).name
				local Hp = getCreatureHealth(pokemon)
	            	--local maxHp = getPokeballInfo(item.uid).maxHp
				local SpeedP = getPokeballInfo(item.uid).speed
				local pokeNick = getPokeballInfo(item.uid).nick
				local perct = getCreatureHealth(pokemon) / getCreatureMaxHealth(pokemon)--(Hp/maxHp)
				setPokeballInfo(item.uid, pokename, pokeNick, perct, SpeedP, "normal")
				doCreatureSay(cid, msg_back..""..pokeNick.."!", TALKTYPE_ORANGE_1)
				doTransformItem(item.uid, getPokeballOn(item.itemid))
				doSendMagicEffect(getThingPos(pokemon), getPokeballEffect(item.itemid))
				doRemoveCreature(pokemon)
				return true
			end
		end
		end
		
		if init then
		if isPokeBallOn(item.itemid) then
			local pokename = getPokeballInfo(item.uid).name
			if getPlayerLevel(cid) < (pokemons(pokename).level) then
				doPlayerSendCancel(cid, "You need level "..(pokemons(pokename).level).." to use this pokemon.")
				return true
			end
        	doSummonMonster(cid, pokename)
        	local pokemon = getPlayerPokemon(cid)
        	local pokeNick = getPokeballInfo(item.uid).name
       
        	if getPokeballInfo(item.uid).nick then
				pokeNick = getPokeballInfo(item.uid).nick
			end
       
			doConvinceCreature(cid, pokemon)
    	   	doCreatureSay(cid, msg_go..""..pokeNick.."!", TALKTYPE_ORANGE_1)
     	    doSendMagicEffect(getThingPos(pokemon), getPokeballEffect(item.itemid))
			updateStatusPokemon(pokemon, true, false)
			doTransformItem(item.uid, getPokeballUse(item.itemid))
			return true
		end
		end
		
		if isPokeBallOff(item.itemid) then
			doPlayerSendCancel(cid, "Seu Pokemon esta Morto!")
			return true
		end
	end
end


function onExtendedOpcode(cid, opcode, buffer)
	if opcode == OPCODE_LANGUAGE then
		 -- otclient language
		if buffer == 'en' or buffer == 'pt' then
			-- example, setting player language, because otclient is multi-language...
			--doCreatureSetStorage(cid, CREATURE_STORAGE_LANGUAGE, buffer)
		end	
	elseif opcode == 204 then
	    local t = buffer:explode(",")
        --table.remove(t, 1)   
        --local t2 = t[i]:explode("|") 
	    if t[1] == "market" then
		    if buyItem[tonumber(t[2])] then
			    if buyItem[tonumber(t[2])].type == "Vip" then
				    if getPlayerItemCount(cid, 2145) >= buyItem[tonumber(t[2])].diamonds then
					    doPlayerRemoveItem(cid, 2145, buyItem[tonumber(t[2])].diamonds)
						doPlayerAddPremiumDays(cid, buyItem[tonumber(t[2])].count) 
					else 
					    doPlayerSendTextMessage(cid, 27, "You not have a "..buyItem[tonumber(t[2])].diamonds.." Diamonds.")
					    return true	
					end
			    elseif buyItem[tonumber(t[2])].type == "Item" then
				    if getPlayerItemCount(cid, 2145) >= buyItem[tonumber(t[2])].diamonds then
					    doPlayerRemoveItem(cid, 2145, buyItem[tonumber(t[2])].diamonds)
					    doPlayerAddItem(cid, buyItem[tonumber(t[2])].itemId, buyItem[tonumber(t[2])].count)
					else 
					    doPlayerSendTextMessage(cid, 27, "You not have a "..buyItem[tonumber(t[2])].diamonds.." Diamonds.")
					    return true	
					end
			    elseif buyItem[tonumber(t[2])].type == "Pokemon" then
				    if getPlayerItemCount(cid, 2145) >= buyItem[tonumber(t[2])].diamonds then
					    doPlayerRemoveItem(cid, 2145, buyItem[tonumber(t[2])].diamonds)
					    addPokeToPlayer(cid, doCorrectString(buyItem[tonumber(t[2])].name), 0, nil, "normal")	
					else 
					    doPlayerSendTextMessage(cid, 27, "You not have a "..buyItem[tonumber(t[2])].diamonds.." Diamonds.")
					    return true	
					end
				elseif buyItem[tonumber(t[2])].type == "Sex" then
				    if getPlayerItemCount(cid, 2145) >= buyItem[tonumber(t[2])].diamonds then
					    doPlayerRemoveItem(cid, 2145, buyItem[tonumber(t[2])].diamonds)
					    if getPlayerSex(cid) == 1 then
						    doPlayerSetSex(cid, 0)
						else
						    doPlayerSetSex(cid, 1)
                        end
                    else 
					    doPlayerSendTextMessage(cid, 27, "You not have a "..buyItem[tonumber(t[2])].diamonds.." Diamonds.")
					    return true						
					end
			    end 
			end
		elseif t[1] == "outfit" then  
		    if buyOutfit[tonumber(t[2])] then
			    if getPlayerSex(cid) == buyOutfit[tonumber(t[2])].sex then
				    doPlayerSendTextMessage(cid, 27, "Outfit for "..buyOutfit[tonumber(t[2])].sex..".")
					return true
				end
			    if getPlayerItemCount(cid, 2145) >= buyOutfit[tonumber(t[2])].diamonds then
					if getPlayerStorageValue(cid, buyOutfit[tonumber(t[2])].storage) == 1 then
					    doPlayerSendTextMessage(cid, 27, "You, have this outfit.")
					    return true
					end
					doPlayerRemoveItem(cid, 2145, buyOutfit[tonumber(t[2])].diamonds)
					--doPlayerAddOutfit(cid, buyOutfit[tonumber(t[2])].type, 3) 
                    setPlayerStorageValue(cid, buyOutfit[tonumber(t[2])].storage, 1)
					doPlayerSendTextMessage(cid, 27, "Obrigado por adiquir a outfit "..buyOutfit[tonumber(t[2])].name.." de nossa loja por "..buyOutfit[tonumber(t[2])].diamonds.." Dimaonds.")
                else 
					doPlayerSendTextMessage(cid, 27, "You not have a "..buyItem[tonumber(t[2])].diamonds.." Diamonds.")
					return true						
				end
			end
		   
		end
		
		
		
		
		
		
		
		
		
		
		if t[1] == "Vmarket" then
		    if shopMarket[tonumber(t[2])] then
			    if shopMarket[tonumber(t[2])].type == "Vip" then
				    if getPlayerItemCount(cid, 2145) >= shopMarket[tonumber(t[2])].diamonds then
					    doPlayerRemoveItem(cid, 2145, shopMarket[tonumber(t[2])].diamonds)
						doPlayerAddPremiumDays(cid, shopMarket[tonumber(t[2])].count) 
					else 
					    doPlayerSendTextMessage(cid, 27, "You not have a "..shopMarket[tonumber(t[2])].diamonds.." Diamonds.")
					    return true	
					end
			    elseif shopMarket[tonumber(t[2])].type == "Item" then
				    if getPlayerItemCount(cid, 2145) >= shopMarket[tonumber(t[2])].diamonds then
					    doPlayerRemoveItem(cid, 2145, shopMarket[tonumber(t[2])].diamonds)
					    doPlayerAddItem(cid, shopMarket[tonumber(t[2])].itemId, shopMarket[tonumber(t[2])].count)
					else 
					    doPlayerSendTextMessage(cid, 27, "You not have a "..shopMarket[tonumber(t[2])].diamonds.." Diamonds.")
					    return true	
					end
				elseif shopMarket[tonumber(t[2])].type == "Bless" then
				    if getPlayerItemCount(cid, 2145) >= shopMarket[tonumber(t[2])].diamonds then
					    if getPlayerStorageValue(cid, 53502) >= 1 then
                            doPlayerSendCancel(cid,'You have already got one ﻿or more blessings!')
							return true
                        end
					    doPlayerRemoveItem(cid, 2145, shopMarket[tonumber(t[2])].diamonds)
					    setPlayerStorageValue(cid, 53502, 1)  
                        doSendMagicEffect(getPlayerPosition(cid), 28)
                        doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'You have been blessed by the gods!')
					else 
					    doPlayerSendTextMessage(cid, 27, "You not have a "..shopMarket[tonumber(t[2])].diamonds.." Diamonds.")
					    return true	
					end
			    elseif shopMarket[tonumber(t[2])].type == "Pokemon" then
				    if getPlayerItemCount(cid, 2145) >= shopMarket[tonumber(t[2])].diamonds then
					    doPlayerRemoveItem(cid, 2145, shopMarket[tonumber(t[2])].diamonds)
					    addPokeToPlayer(cid, doCorrectString(shopMarket[tonumber(t[2])].name), 0, nil, "normal")	
					else 
					    doPlayerSendTextMessage(cid, 27, "You not have a "..shopMarket[tonumber(t[2])].diamonds.." Diamonds.")
					    return true	
					end
				elseif shopMarket[tonumber(t[2])].type == "Sex" then
				    if getPlayerItemCount(cid, 2145) >= shopMarket[tonumber(t[2])].diamonds then
					    doPlayerRemoveItem(cid, 2145, shopMarket[tonumber(t[2])].diamonds)
					    if getPlayerSex(cid) == 1 then
						    doPlayerSetSex(cid, 0)
						else
						    doPlayerSetSex(cid, 1)
                        end
                    else 
					    doPlayerSendTextMessage(cid, 27, "You not have a "..shopMarket[tonumber(t[2])].diamonds.." Diamonds.")
					    return true						
					end
			    end 
			end
		elseif t[1] == "Voutfit" then
		    if shopOutfit[tonumber(t[2])] then
			    if getPlayerSex(cid) == shopOutfit[tonumber(t[2])].sex then
				    doPlayerSendTextMessage(cid, 27, "Outfit for "..shopOutfit[tonumber(t[2])].sex..".")
					return true
				end
			    if getPlayerItemCount(cid, 2145) >= shopOutfit[tonumber(t[2])].diamonds then
					if getPlayerStorageValue(cid, shopOutfit[tonumber(t[2])].storage) == 1 then
					    doPlayerSendTextMessage(cid, 27, "You, have this outfit.")
					    return true
					end
					doPlayerRemoveItem(cid, 2145, shopOutfit[tonumber(t[2])].diamonds)
					--doPlayerAddOutfit(cid, buyOutfit[tonumber(t[2])].type, 3) 
                    setPlayerStorageValue(cid, shopOutfit[tonumber(t[2])].storage, 1)
					doPlayerSendTextMessage(cid, 27, "Obrigado por adiquir a outfit "..shopOutfit[tonumber(t[2])].name.." de nossa loja por "..shopOutfit[tonumber(t[2])].diamonds.." Dimaonds.")
                else 
					doPlayerSendTextMessage(cid, 27, "You not have a "..shopOutfit[tonumber(t[2])].diamonds.." Diamonds.")
					return true						
				end
			end
		elseif t[1] == "Vaddon" then
		    
    	elseif t[1] == "Vbuy" then
		    if shopItem[tonumber(t[2])] then
			    if shopItem[tonumber(t[2])].type == "Item" then
				    if getPlayerItemCount(cid, 2145) >= shopItem[tonumber(t[2])].diamonds then
					    doPlayerRemoveItem(cid, 2145, shopItem[tonumber(t[2])].diamonds)
					    doPlayerAddItem(cid, shopItem[tonumber(t[2])].itemId, shopItem[tonumber(t[2])].count)
					else 
					    doPlayerSendTextMessage(cid, 27, "You not have a "..shopItem[tonumber(t[2])].diamonds.." Diamonds.")
					    return true	
					end
				end
			end
		end
	
	
	
    elseif opcode == 159 then
	    setPlayerStorageValue(cid, 90996, buffer)
		--print(buffer)
		
	elseif opcode == 156 then--nome,alguns atributos
	    local msg = NetworkMessage.create()
		msg:setBuffer(buffer)
	    local cre = msg:getString()
		if cre == "decremente" then
		    local v = msg:getU16()
		    query = db.getResult("SELECT * FROM market_items WHERE id > "..v)
	        marketOffer(cid,query, 50)
			--print("text....."..v)
			return
		elseif cre == "incremente" then
		    local v = msg:getU16()
	        local query = db.getResult("SELECT * FROM market_items WHERE id < "..v.." ORDER BY id DESC LIMIT 50")
            marketOffer(cid,query)
			--print(v)
		elseif cre == "search" then
		    local search = msg:getString()
			--local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes FROM market_items WHERE id == "..search.." ORDER BY id DESC LIMIT 50")
			--marketOffer(cid,query)
			if search == "" then
			    local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes, time, money, stack FROM market_items ORDER BY id DESC LIMIT 50")
                marketOffer(cid,query) 
				local check = db.getResult("SELECT `id` FROM `market_items` WHERE time > "..os.time().." ORDER BY id ")
                if(check:getID() ~= -1) then
		            local col = math.ceil(check:getRows(true)/50)
				    doSendPlayerExtendedOpcode(cid, 156, "1,"..col)
			    end
			else
			    marketOfferSearch(cid, search)
				--doSendPlayerExtendedOpcode(cid, 156, "1,"..1)
				
			end
		elseif cre == "pagLast" then
		    
			
			local check = db.getResult("SELECT `id` FROM `market_items` WHERE time > "..os.time().." ORDER BY id ")
            if(check:getID() ~= -1) then
			local id = 1
			    local maxp = check:getRows(true) 
		        local col = math.ceil(maxp/50) 
				
				
				--[[local querys = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes FROM market_items ORDER BY id LIMIT "..(50-((col*50)-maxp)).."")
				if querys:getID() == -1 then
				    return
				end 
				repeat 
				id = querys:getDataInt("id")
				until not querys:next()
				querys:free()]]  
				--local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes FROM market_items WHERE id <= "..id.." ORDER BY id DESC LIMIT "..(50-((col*50)-maxp)).." ")
				local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes, time, money, stack FROM market_items ORDER BY id LIMIT "..(50-((col*50)-maxp)).." ")
				--print(id.." "..maxp.." "..col.." "..(50-((col*50)-maxp)))
           		--marketOfferLast(cid,query, (50-((col*50)-maxp))) 
				marketOffer(cid,query, (50-((col*50)-maxp))) 
				marketMyOffer(cid)
				doSendPlayerExtendedOpcode(cid, 156, col) 
			end
			
		elseif cre == "categoria" then
		    local categoria = msg:getString()
			local pagCart = msg:getString()--para categoria pagi
			--local v = ""
			--local pag v = ""
			--idPag v = ""
			if pagCart == "search" then
				local text = msg:getString()--para categoria pagi
				local pag = msg:getString()
			    local idPag = msg:getU16()
				--print("priguito "..categoria.." "..pagCart.." "..text.. " " ..pag .." "..idPag) 
				marketOfferCate(cid, categoria, pagCart, text, pag, idPag)--, pag, idPag)
			else
				local v = msg:getU16()--para categoria pagi
				marketOfferCate(cid, categoria, pagCart, v)
			end
			--print("viado "..v)
			--print("viado G "..goria)
		    
			
		--[[elseif cre == "pagFirst" then
		    local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes FROM market_items ORDER BY id DESC LIMIT 50")
            marketOffer(cid,query)
			marketMyOffer(cid)
			
			local check = db.getResult("SELECT `id` FROM `market_items` ORDER BY id ")
            if(check:getID() ~= -1) then
		        local col = math.ceil(check:getRows(true)/50)
				doSendPlayerExtendedOpcode(cid, 156, col)
			end]]
		else
		    local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes, time, money, stack FROM market_items ORDER BY id DESC LIMIT 50")
            marketOffer(cid,query)
			marketMyOffer(cid)
			
			local check = db.getResult("SELECT `id` FROM `market_items` WHERE time > "..os.time().." ORDER BY id ")
            if(check:getID() ~= -1) then
		        local col = math.ceil(check:getRows(true)/50)
				doSendPlayerExtendedOpcode(cid, 156, "1,"..col)
				--print("atualiza "..col)
			end
		end
	elseif opcode == 155 then
	    doCancelMarket(cid, tonumber(buffer))
            marketMyOffer(cid)
	elseif opcode == 152 then --remove o item e adiciona/100%
	    local msg = NetworkMessage.create()
		msg:setBuffer(buffer)
		if msg:getString() == "cancel" then
		    doEraseMarket(cid)
			return
		else
		    local check = db.getResult("SELECT `id` FROM `market_items` WHERE `player_id` = " .. getPlayerGUID(cid) .. ";")
            if(check:getID() ~= -1) then
		        if (check:getRows(true) >= 50) then
                    doSendPlayerExtendedOpcode(cid, 155, "Sorry you can't add more offers (max. " .. 50 .. ")")
                    return
				end
            end
		    local count = msg:getU16()
			local price = msg:getU64()
			local money = msg:getU8()
			local stack = msg:getU8()
			--print(money)
			--[[if money == "true" then
			   money = true
			   else
			   money = false
			end]]
			if price < 1 then
			    doSendPlayerExtendedOpcode(cid, 155, "venda falhou")
			    return
			end
			if count > 0 and doSellMarket(cid, count, price, money, stack) then
			    --print("venda concluida")
			    doSendPlayerExtendedOpcode(cid, 155, "venda concluida")
				local query = db.getResult("SELECT * FROM players WHERE id = "..getPlayerGUID(cid)..";")
				if query:getID() ~= -1 then
		
				    msg = NetworkMessage.create()
					msg:addU8(2)
					msg:addU64(query:getDataLong("market_p"))
					msg:addU64(query:getDataLong("market_d"))
    				doSendPlayerExtendedOpcode(cid, 151, msg:getBuffer())
					query:free()
				end
				marketMyOffer(cid)
                
			    return
		    end
		end
		
		doSendPlayerExtendedOpcode(cid, 155, "Desculpe mas sua venda não foi")
				
	elseif opcode == 154 then-- compra o item/ 100%
		local msg = NetworkMessage.create()
		msg:setBuffer(buffer)
		local itemid = msg:getU16()
		local count = msg:getU16()
		local price = (msg:getU64())
		--print(itemid)
		--[[local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes FROM market_items ORDER BY id DESC LIMIT 50")
		local playerid = query:getDataString("player_id")
		query:free()
		if(getPlayerName(cid) == getPlayerNameByGUID(playerid)) then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, you can't buy your own items.")
            return
        end]]
		if doBuyMarket(cid, itemid, count) then
		local query = db.getResult("SELECT * FROM players WHERE id = "..getPlayerGUID(cid)..";")
				if query:getID() ~= -1 then
		
				    msg = NetworkMessage.create()
					msg:addU8(2)
					msg:addU64(query:getDataLong("market_p"))
					msg:addU64(query:getDataLong("market_d"))
    				doSendPlayerExtendedOpcode(cid, 151, msg:getBuffer())
					query:free()
				end
		end
		--[[if(getPlayerMoney(cid) < price) then
            doSendPlayerExtendedOpcode(cid, 155, "You don't have enoguh Money.")
            return
        end
		if doBuyMarket(cid, itemid, count) then
		    doPlayerRemoveMoney(cid, price)
		    doSendPlayerExtendedOpcode(cid, 155, "Compra concluida")
		end]]
		--else
		 --   doSendPlayerExtendedOpcode(cid, 155, "Wrong ID.")
		--end
		local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes, time, money, stack FROM market_items ORDER BY id DESC LIMIT 50")
		marketOffer(cid, query)
    elseif opcode == 153 then --seleciona o item pra adicionar/99.99%
	 	local proibido = {2148, 2152, 2160, 12416}  
	    doEraseMarket(cid)
		local msg = NetworkMessage.create()
		msg:setBuffer(buffer)
		local pos = msg:getPosition()
		local stackpos = msg:getU16()
		local item = msg:getU16()
		local count = msg:getU16()
		
		local namer = doAutoLoot(cid, stackpos, pos)
		if namer ~= "" then--precisa retorna o nome
		    local msg = NetworkMessage.create()
			--print("buceta--- "..(namer))
			if pokes[namer] then
			    msg:addU16(item)
			else
			    if isInArray(proibido, getItemIdByName(namer)) then
		    		doSendPlayerExtendedOpcode(cid, 155, "You don't Item.")
		    		return
				end  
                msg:addU16(getItemInfo(getItemIdByName(namer)).clientId)
			end
            if not pokes[namer] and getItemIdByName(namer) == 12327 then	
            msg:addU16(count)			
		    
			elseif item == getItemInfo(12327).clientId and getItemIdByName(namer) ~= 12327 then
			
			msg:addU16(getPlayerItemCount(cid,getItemIdByName(namer)))
			else
			msg:addU16(count)
			end
			msg:addString(namer)
            doSendPlayerExtendedOpcode(cid, 153, msg:getBuffer())
			return
		end
		--[[for x=0, (getContainerSize(getPlayerSlotItem(cid, 3).uid)) do
            local itens = getContainerItem(getPlayerSlotItem(cid, 3).uid, x)
		    if itens.uid == doAutoLoot(cid, stackpos, pos).uid then
			    doItemSetAttribute(doAutoLoot(cid, stackpos, pos).uid, "market", "1")
                local msg = NetworkMessage.create()
                msg:addU16(item) 
				msg:addU8(count)
                doSendPlayerExtendedOpcode(cid, 153, msg:getBuffer())
		       return
		    end
		end]]
		doSendPlayerExtendedOpcode(cid, 155, "você não pode selecionar esse item")	
    elseif opcode == 151 then--pontos de market
	    local msg = NetworkMessage.create()
		msg:setBuffer(buffer)
		local typeM = msg:getU8()
		local value = msg:getU64()
		
		local query = db.getResult("SELECT `id`, `market_d`, `market_p` FROM players WHERE id = "..getPlayerGUID(cid)..";")
		local aValor = 0
	    if query:getID() ~= -1 then
			if typeM == 4 or typeM == 1 then
				aValor = query:getDataLong("market_d")
			else
				aValor = query:getDataLong("market_p")
			end
        	query:free()
        end
		
		msg:reset()
		msg:addU8(typeM)
		--print(typeM)
		if typeM == 4 then 
			if value <= aValor then
				--doPlayerAddItem(cid, 2145, value)
				diaDepot(cid, value)
				db.executeQuery("UPDATE `players` SET `market_d` = '"..aValor-value.."' WHERE `id` = ".. getPlayerGUID(cid) ..";")
				msg:addU64(aValor-value)
				doSendPlayerExtendedOpcode(cid, 151, msg:getBuffer())
			end
		elseif typeM == 3 then
			if value <= aValor then
				db.executeQuery("UPDATE `players` SET `market_p` = '"..aValor-value.."' WHERE `id` = ".. getPlayerGUID(cid) ..";")
				doPlayerAddMoney(cid, value*100, true)
				msg:addU64(aValor-value)
				doSendPlayerExtendedOpcode(cid, 151, msg:getBuffer())
			end
		elseif typeM == 1 then
			if getPlayerItemCount(cid, 2145) >= value then
				db.executeQuery("UPDATE `players` SET `market_d` = '"..aValor+value.."' WHERE `id` = ".. getPlayerGUID(cid) ..";")
				doPlayerRemoveItem(cid, 2145, value)
				msg:addU64(aValor+value)
				doSendPlayerExtendedOpcode(cid, 151, msg:getBuffer())
			end
		else
		--print(getPlayerMoney(cid))
			if getPlayerMoney(cid) >= (value*100) then
				db.executeQuery("UPDATE `players` SET `market_p` = '"..aValor+(math.floor(value*0.95)).."' WHERE `id` = ".. getPlayerGUID(cid) ..";")
				doPlayerRemoveMoney(cid, value*100, true)
				msg:addU64(aValor+(math.floor(value*0.95)))
				doSendPlayerExtendedOpcode(cid, 151, msg:getBuffer())
			end
		end
		
		--msg:addU64(aValor+value)
        
	elseif opcode == 203 then
		--print(buffer)
		if getPlayerSlotItem(cid, CONST_SLOT_FEET).uid > 0 then
		--print(getPlayerSlotItem(cid, CONST_SLOT_FEET).uid) 
		
			if getItemAttribute(getPlayerSlotItem(cid, CONST_SLOT_FEET).uid, "ballorder") == tonumber(buffer) then
                volta(cid, true)
    			return true
			else
				volta(cid, false)
			end
		end
		   -- volta(cid, false)
			doMoveBar(cid, buffer)
            volta(cid, true)			
		--end
	
	--[[local back_messages = {"Muito bom, ",    "Foi impecável, ",    "Volte, ", "Chega, ", "Grande, "}
		local go_messages = {"Hora do duelo, ", "Vai, ",    "Faça seu trabalho, ", "Prepare-se, ", "Chegou sua hora, "}
  local msg_back = back_messages[math.random(#back_messages)]
      local msg_go = go_messages[math.random(#go_messages)]
		
 local item = getPlayerSlotItem(cid, CONST_SLOT_FEET)
		if isPokeBallOn(item.itemid) then
			local pokename = getPokeballInfo(item.uid).name
			if getPlayerLevel(cid) < (pokemons(pokename).level) then
				doPlayerSendCancel(cid, "You need level "..(pokemons(pokename).level).." to use this pokemon.")
				return true
			end
        	doSummonMonster(cid, pokename)
        	local pokemon = getPlayerPokemon(cid)
        	local pokeNick = getPokeballInfo(item.uid).name
       
        	if getPokeballInfo(item.uid).nick then
				pokeNick = getPokeballInfo(item.uid).nick
			end
       
			doConvinceCreature(cid, pokemon)
    	   	doCreatureSay(cid, msg_go..""..pokeNick.."!", TALKTYPE_ORANGE_1)
     	    doSendMagicEffect(getThingPos(pokemon), getPokeballEffect(item.itemid))
			updateStatusPokemon(pokemon, true, false)
			doTransformItem(item.uid, getPokeballUse(item.itemid))
			return true
		end
			
		if isPokeBallOff(item.itemid) then
			doPlayerSendCancel(cid, "Seu Pokemon esta Morto!")
			return true
		end]]
	

	
		
		  -- other opcodes can be ignored, and the server will just work fine...
		  
		  
	elseif opcode == 111 then 
        local item = getPlayerSlotItem(cid, 8)
        if item.uid == 0 then 
		    doPlayerSendTextMessage(cid, 27, "Coloque seu shiny ditto no slot correto.")
			return true
		end
		local summons = getCreatureSummons(cid)
        if #summons < 1 then 
			doPlayerSendTextMessage(cid, 27, "Coloque seu ditto para fora da pokeball.") 
			return true 
		end
        local pokeName = getItemAttribute(item.uid, "ehditto")
		--local pokeNameS = getItemAttribute(item.uid, "poke")
        --if pokeName ~= "Shiny Ditto" or pokeNameS ~= "Shiny Ditto" then  
		--    doPlayerSendTextMessage(cid, 27, "vc precisa transformar o ditto primeiro.")
		--    return true 
		--end   
        if isInArray({"saveMemory1", "saveMemory2", "saveMemory3"}, buffer) then
            local copyName = getItemAttribute(item.uid, "poke")
            if pokeName ~= "Shiny Ditto" and pokeName ~= "Ditto" or pokeName == copyName then
			    doPlayerSendTextMessage(cid, 27, "Transforme seu ditto primeiro.")
				return true
			end
            if not pokes[doCorrectString(copyName)] then return true end
			----------------------------------------------------------------------------
            --[[if isPokeInSlots(getItemAttribute(item.uid, "memoryDitto"), doCorrectString(copyName)) then
			    doPlayerSendTextMessage(cid, 27, "Esta copia já está salva em um slot.") 
			    return true
			end]]
            
			if buffer == "saveMemory1" then
			    if getItemAttribute(item.uid, "memoryDitto1") == "?" then
                    doItemSetAttribute(item.uid, "memoryDitto1", doCorrectString(copyName))
					doPlayerSendTextMessage(cid, 27, "salva no slot 1.")
			    end
			elseif buffer == "saveMemory2" then
				if getItemAttribute(item.uid, "memoryDitto2") == "?" then
                    doItemSetAttribute(item.uid, "memoryDitto2", doCorrectString(copyName))
					doPlayerSendTextMessage(cid, 27, "salva no slot 2.")
				end
            elseif buffer == "saveMemory3" then
				if getItemAttribute(item.uid, "memoryDitto3") == "?" then
                    doItemSetAttribute(item.uid, "memoryDitto3", doCorrectString(copyName))
					doPlayerSendTextMessage(cid, 27, "salva no slot 3.")
				end
            end
        elseif isInArray({"clearSlot1", "clearSlot2", "clearSlot3"}, buffer) then
            if buffer == "clearSlot1" then
			    if getItemAttribute(item.uid, "memoryDitto1") and getItemAttribute(item.uid, "memoryDitto1") ~= "?" then
                    doItemSetAttribute(item.uid, "memoryDitto1", "?")
					doPlayerSendTextMessage(cid, 27, "removido no slot 1.")
				end
            elseif buffer == "clearSlot2" then
			    if getItemAttribute(item.uid, "memoryDitto2") and getItemAttribute(item.uid, "memoryDitto2") ~= "?" then
                    doItemSetAttribute(item.uid, "memoryDitto2", "?")
					doPlayerSendTextMessage(cid, 27, "removido no slot 2.")
				end
            elseif buffer == "clearSlot3" then
			    if getItemAttribute(item.uid, "memoryDitto3") and getItemAttribute(item.uid, "memoryDitto3") ~= "?" then
                    doItemSetAttribute(item.uid, "memoryDitto3", "?")
					doPlayerSendTextMessage(cid, 27, "removido no slot 3.")
				end
			end
        elseif isInArray({"use1", "use2", "use3"}, buffer) then
            local pokeToTransform = getItemAttribute(item.uid, "memoryDitto"..tonumber(buffer:explode("use")[1]))
		    if not pokeToTransform or pokeToTransform == "?" then 
			    doPlayerSendTextMessage(cid, 27, "esse slot não tem transformações salvas.")
			    return true
			end
			--if getItemAttribute(item.uid, "ehditto") and getItemAttribute(item.uid, "ehditto") ~= "" then
        		--doDittoRevert(cid)
    		--end
			doDittoTransformMemory(summons[1], pokeToTransform)
			--addEvent(doDittoTransform, 2000, summons[1], pokeToTransform)
			--print(pokeToTransform)
        end
               
               
        local memory1 = getItemAttribute(item.uid, "memoryDitto1")
		local memory2 = getItemAttribute(item.uid, "memoryDitto2") 
		local memory3 = getItemAttribute(item.uid, "memoryDitto3")
        local memoryOne, memoryTwo, memoryTree = "?", "?", "?"
			
		if memory1 and fotos[memory1] then
		    memoryOne = getItemInfo(fotos[memory1]).clientId--.."|"
		end
		if memory2 and fotos[memory2] then
		    memoryTwo = getItemInfo(fotos[memory2]).clientId--.."|"
		end
		if memory3 and fotos[memory3] then
		    memoryTree = getItemInfo(fotos[memory3]).clientId
		end
			
            
        local str = memoryOne .. "-".. memoryTwo .."-" .. memoryTree
        doSendPlayerExtendedOpcode(cid, 111, str)
	end
end
