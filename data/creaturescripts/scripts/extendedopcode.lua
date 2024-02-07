OPCODE_LANGUAGE = 1

local op_crea = {
	OPCODE_SKILL_BAR = opcodes.OPCODE_SKILL_BAR,
	OPCODE_POKEMON_HEALTH = opcodes.OPCODE_POKEMON_HEALTH,
	OPCODE_BATTLE_POKEMON = opcodes.OPCODE_BATTLE_POKEMON,
	OPCODE_FIGHT_MODE = opcodes.OPCODE_FIGHT_MODE,
	OPCODE_WILD_POKEMON_STATS = opcodes.OPCODE_WILD_POKEMON_STATS,
	OPCODE_REQUEST_DUEL = opcodes.OPCODE_REQUEST_DUEL,
	OPCODE_ACCEPT_DUEL = opcodes.OPCODE_ACCEPT_DUEL,
	OPCODE_YOU_ARE_DEAD = opcodes.OPCODE_YOU_ARE_DEAD,
	OPCODE_DITTO_MEMORY = opcodes.OPCODE_DITTO_MEMORY,
}

function doCollectAll(cid, col)
	setPlayerStorageValue(cid, storages.AutoLootCollectAll, col == true and "all" or "no")
end

local rate = 200

local PosByPoke = {
	['Charizard'] = {{x=1081, y=981, z=7, imagem="20", description = "teste"}, {x=1091, y=991, z=7, imagem="10", description = "teste"}}
}

local moveDescDex = {
	["Ember"] = "Magia que causa dano!",
	["Magia Name"] = "Magia que causa dano!"
}
local STORAGEMARCAMAPA = 66698
local STORAGEVERLOOT = 66699

function haveLocation(cid, name)
	if getPlayerStorageValue(cid, STORAGEMARCAMAPA) < 1 then
		return "false"
	end
	if PosByPoke[name] then
		return "true"
	else
		return "false"
	end
end

function haveLoot(cid, name)
	if getPlayerStorageValue(cid, STORAGEVERLOOT) < 1 then
		return "false"
	end
	return print_table(getMonsterLootSpriteId(name))
end

function print_table(self) -- by vyctor17
        local str = "{"

        for i, v in pairs(self) do
                local index = type(i) == "string" and "[\"".. i .. "\"]" or "[".. i .. "]"
                local value = type(v) == "table" and print_table(v) or type(v) == "string" and "\"".. v .. "\"" or tostring(v)

                str = str .. index .. " = ".. value .. ", "
        end

        return (#str > 1 and str:sub(1, #str - 2)) .. "}"
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

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
	if opcode == opcodes.OPCODE_PLAYER_SHOW_AUTOLOOT then -- Autoloot
		if buffer:find("load/") then
			--local itens = getAllItensAutoLoot()	
			doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_PLAYER_SHOW_AUTOLOOT, (isCollectAll(cid) and "yes" or "no") .. "|0|0")
		elseif buffer:find("all") then
			doCollectAll(cid, true)
			doSendMsg(cid, "AutoLoot: Coletar tudo foi ativado.")
		elseif buffer:find("no") then
			doCollectAll(cid, false)
			doSendMsg(cid, "AutoLoot: Coletar tudo foi desativado.")
		end	

	elseif opcode == opcodes.OPCODE_PLAYER_SHOW_ONLINE then -- Janela de onlines do ADM
		local players = getPlayersOnline()
		local str = "online/"
		if #players > 0 then
			for _, pid in ipairs(players) do
				str = str .. getCreatureName(pid) .. "," .. getPlayerLevel(pid) .. "/"
			end
		end
		doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_PLAYER_SHOW_ONLINE, str)


	elseif opcode == 53 then-- open nova dex
			local UID = tonumber(buffer)
			if isMonster(UID) then
				if getDistanceBetween(getCreaturePosition(cid), getCreaturePosition(UID)) <= 5 then
					local name = getCreatureName(UID)
						if string.lower(name) == "farfetch'd" then
							name = "farfetch_d"
						end
						if string.lower(name) == "cacturn" then
							name = "cacturne"
						end
						if string.lower(name) == "nidoran male" then
							name = "nidoran_m"
						end
						if string.lower(name) == "nidoran female" then
							name = "nidoran_f"
						end
						if string.lower(name) == "shiny farfetch'd" then
							name = "shiny farfetch_d"
						end
						
						if string.find(name, "shiny") then 
							local name2 = string.explode(name, " ") 
							name = name2[2] 
						end
					
					if isInArray({"Aporygon", "Abporygon", "Big Porygon", "Tangrowth", "Magmortar", "Electivire", "Dusknoir"}, name) then
						doPlayerSendCancel(cid, "Você não pode dar dex nesse pokémon.")
						return false
					end
					
					-- print(getPlayerDexInfo(cid, name).dex)
					if getPlayerDexInfo(cid, name).dex == 0 and not isShiny(UID) then
						local exp = math.random(1500, 5000)
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have unlocked ".. name.." in your pokedex!")
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have gained "..exp.." experience points.")
						doPlayerAddExperience(cid, exp)
						doRegisterPokemonToDex(cid, name)
					end
				else
					doPlayerSendCancel(cid, "You are too far away to scan this pokemon")
				end
			end
			doSendPlayerExtendedOpcode(cid, 60, generateList(cid))
	elseif opcode == 55 then
			if isPlayer(cid) then
				local data = string.explode(buffer, "*")
				-- print(#data[2])
				if data[2] == "false" then
					doSendPlayerExtendedOpcode(cid, 62, haveLoot(cid, data[1]).."*"..haveLocation(cid, data[1]).."*"..getPokemonEvolutionDescription(firstToUpper(data[1])))
				else
					doSendPlayerExtendedOpcode(cid, 62, haveLoot(cid, "Shiny "..data[1]).."*"..haveLocation(cid, data[1]).."*"..getPokemonEvolutionDescription(data[1]))
				end
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
			    	local poke = doCorrectString(shopMarket[tonumber(t[2])].name)
				    if getPlayerItemCount(cid, 2145) >= shopMarket[tonumber(t[2])].diamonds then
					    doPlayerRemoveItem(cid, 2145, shopMarket[tonumber(t[2])].diamonds)
					    addPokeToPlayer(cid, poke, 0, 0, 'normal', true)
					    doUpdatePokemonsBar(cid)
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
		  
 --   elseif opcode == DailyRewards.opcode then
	-- DailyRewards:action(cid, tonumber(buffer))

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
        local pokeName = getItemAttribute(item.uid, "poke")
		--local pokeNameS = getItemAttribute(item.uid, "poke")
        --if pokeName ~= "Shiny Ditto" or pokeNameS ~= "Shiny Ditto" then  
		--    doPlayerSendTextMessage(cid, 27, "vc precisa transformar o ditto primeiro.")
		--    return true 
		--end   
        if isInArray({"saveMemory1", "saveMemory2", "saveMemory3"}, buffer) then
            local copyName = getItemAttribute(item.uid, "poke")
            if pokeName == "Shiny Ditto" or pokeName == "Ditto" then
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
