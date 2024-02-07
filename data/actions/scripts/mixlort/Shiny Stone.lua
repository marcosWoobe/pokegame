function onUse(cid, item, fromPosition, itemEx, toPosition)

	PokemonShinys = 
	{
		["Rhyperior"] = {name = "Shiny Rhyperior", quant = 14},		
		["Beedrill"] = {name = "Shiny Beedrill", quant = 5},
		["Nidoking"] = {name = "Shiny Nidoking", quant = 8},
		["Golem"] = {name = "Shiny Golem", quant = 7},
		["Grimer"] = {name = "Shiny Grimer", quant = 1},
		["Hypno"] = {name = "Shiny Hypno", quant = 6},
		["Krabby"] = {name = "Shiny Krabby", quant = 1},
		["Vaporeon"] = {name = "Shiny Vaporeon", quant = 5},
		["Flareon"] = {name = "Shiny Flareon", quant = 6},
		["Jolteon"] = {name = "Shiny Jolteon", quant = 7},
		["Mr. Mime"] = {name = "Shiny Mr. Mime", quant = 7},
		["Rhydon"] = {name = "Shiny Rhydon", quant = 6},
		["Umbreon"] = {name = "Shiny Umbreon", quant = 7},
		["Espeon"] = {name = "Shiny Espeon", quant = 7},
		["Magneton"] = {name = "Shiny Magneton", quant = 6},
		["Politoed"] = {name = "Shiny Politoed", quant = 8},
		["Stantler"] = {name = "Shiny Stantler", quant = 6},
		["Dodrio"] = {name = "Shiny Dodrio", quant = 7},
		["Ariados"] = {name = "Shiny Ariados", quant = 6},
		["Tauros"] = {name = "Shiny Tauros", quant = 6},
		["Crobat"] = {name = "Shiny Crobat", quant = 8},
		["Ampharos"] = {name = "Shiny Ampharos", quant = 8},
		["Feraligatr"] = {name = "Shiny Feraligatr", quant = 7},
		["Machamp"] = {name = "Shiny Machamp", quant = 6},
		["Meganium"] = {name = "Shiny Meganium", quant = 6},
		["Larvitar"] = {name = "Shiny Larvitar", quant = 1},
		["Pupitar"] = {name = "Shiny Pupitar", quant = 4},
		["Xatu"] = {name = "Shiny Xatu", quant = 6},
		["Magcargo"] = {name = "Shiny Magcargo", quant = 4},
		["Lanturn"] = {name = "Shiny Lanturn", quant = 7},
		["Sandslash"] = {name = "Shiny Sandslash", quant = 5},
		["Weezing"] = {name = "Shiny Weezing", quant = 7},
		["Mantine"] = {name = "Shiny Mantine", quant = 7},		

		["Venusaur"] = {name = "Shiny Venusaur", quant = 7},
		["Charizard"] = {name = "Shiny Charizard", quant = 7},
		["Blastoise"] = {name = "Shiny Blastoise", quant = 7},
		["Butterfree"] = {name = "Shiny Butterfree", quant = 3},
		["Pidgeot"] = {name = "Shiny Pidgeot", quant = 5},
	    ["Rattata"] = {name = "Shiny Rattata", quant = 1},
	    ["Raticate"] = {name = "Shiny Raticate", quant = 3},
	    ["Fearow"] = {name = "Shiny Fearow", quant = 5},
		["Raichu"] = {name = "Shiny Raichu", quant = 4},
	    ["Zubat"] = {name = "Shiny Zubat", quant = 3},
	    ["Golbat"] = {name = "Shiny Golbat", quant = 6},
		["Oddish"] = {name = "Shiny Oddish", quant = 1},
		["Vileplume"] = {name = "Shiny Vileplume", quant = 7},
	    ["Paras"] = {name = "Shiny Paras", quant = 1},
	    ["Parasect"] = {name = "Shiny Parasect", quant = 3},
	    ["Venonat"] = {name = "Shiny Venonat", quant = 2},
	    ["Venomoth"] = {name = "Shiny Venomoth", quant = 6},
	    ["Growlithe"] = {name = "Shiny Growlithe", quant = 1},
	    ["Arcanine"] = {name = "Shiny Arcanine", quant = 6},
		["Abra"] = {name = "Shiny Abra", quant = 1},
		["Alakazam"] = {name = "Shiny Alakazam", quant = 9},
		["Tentacool"] = {name = "Shiny Tentacool", quant = 1},
	    ["Tentacruel"] = {name = "Shiny Tentacruel", quant = 6},
	    ["Farfetch'd"] = {name = "Shiny Farfetch'd", quant = 1},
	    ["Muk"] = {name = "Shiny Muk", quant = 5},
		["Gengar"] = {name = "Shiny Gengar", quant = 9},
	    ["Onix"] = {name = "Shiny Onix", quant =  4},
	    ["Kingler"] = {name = "Shiny Kingler", quant = 5},
	    ["Voltorb"] = {name = "Shiny Voltorb", quant = 2},
	    ["Electrode"] = {name = "Shiny Electrode", quant = 3},
	    ["Cubone"] = {name = "Shiny Cubone", quant = 2},
	    ["Marowak"] = {name = "Shiny Marowak", quant = 4},
	    ["Hitmonlee"] = {name = "Shiny Hitmonlee", quant = 5},
	    ["Hitmonchan"] = {name = "Shiny Hitmonchan", quant = 5},
	    ["Tangela"] = {name = "Shiny Tangela", quant = 3},
	    ["Horsea"] = {name = "Shiny Horsea", quant = 1},
	    ["Seadra"] = {name = "Shiny Seadra", quant = 3},
	    ["Scyther"] = {name = "Shiny Scyther", quant = 6},
	    ["Jynx"] = {name = "Shiny Jynx", quant = 7},
		["Electabuzz"] = {name = "Shiny Electabuzz", quant = 9},
		["Pinsir"] = {name = "Shiny Pinsir", quant = 4},
	    ["Magikarp"] = {name = "Shiny Magikarp", quant = 1},
	    ["Gyarados"] = {name = "Shiny Gyarados", quant = 7},
		["Snorlax"] = {name = "Shiny Snorlax", quant = 7},
	    ["Dratini"] = {name = "Shiny Dratini", 1},
	    ["Dragonair"] = {name = "Shiny Dragonair", quant = 5},
	    ["Dragonite"] = {name = "Shiny Dragonite", quant = 7},
		["Ninetales"] = {name = "Shiny Ninetales", quant = 7},
		["Magmar"] = {name = "Shiny Magmar", quant = 10},
		["Magmortar"] = {name = "Shiny Magmortar", quant = 12},
		["Electivire"] = {name = "Shiny Electivire", quant = 12},
		["Typhlosion"] = {name = "Shiny Typhlosion", quant = 6},

		-- ["Ludicolo"] = {name = "Shiny Ludicolo", quant = 5},
		-- ["Aggron"] = {name = "Shiny Aggron", quant = 9},
		-- ["Metagross"] = {name = "Shiny Metagross", quant = 10},
		-- ["Tropius"] = {name = "Shiny Tropius", quant = 10},
		-- ["Togekiss"] = {name = "Shiny Togekiss", quant = 8},
		-- ["Steelix"] = {name = "Shiny Steelix", quant = 9},
		-- ["Lapras"] = {name = "Shiny Lapras", quant =7},
		-- ["Salamence"] = {name = "Shiny Salamence", quant = 8},
		-- ["Flygon"] = {name = "Shiny Flygon", quant = 7},
		-- ["Tangrowth"] = {name = "Shiny Tangrowth", quant = 9},
		-- ["Blissey"] = {name = "Shiny Blissey", quant = 8},
		-- ["Miltank"] = {name = "Shiny Miltank", quant = 7},
		-- ["Sceptile"] = {name = "Shiny Sceptile", quant = 7},
		-- ["Wigglytuff"] = {name = "Shiny Wigglytuff", quant = 7},
		-- ["Slaking"] = {name = "Shiny Slaking", quant = 7},
		-- ["Blaziken"] = {name = "Shiny Blaziken", quant = 5},
		-- ["Zoroark"] = {name = "Shiny Zoroark", quant = 15},
		-- ["Hydreigon"] = {name = "Shiny Hydreigon", quant = 10},
		-- ["Wobbuffet"] = {name = "Shiny Wobbuffet", quant = 8},
		-- ["Gardevoir"] = {name = "Shiny Gardevoir", quant = 8},
		-- ["Zeraora"] = {name = "Shiny Zeraora", quant = 14},		
	}

	if isEvolving(cid) then
	    doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
	    doSendMagicEffect(getPlayerPosition(cid), 2)   
	    return true
	end

	-- if not getCreatureName(cid) == "Mixlort" then return true end 

    if not isCreature(itemEx.uid) then
	    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Isto nao é uma criatura.")
	    return true
	end
	
	if not isMonster(itemEx.uid) or not isSummon(itemEx.uid) then
	     doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Isto não é um pokemon.")
    	return true
	end
	
	if #getCreatureSummons(cid) > 1 then
	   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você não tem um pokemon.")
   		return true
	end 

	if string.find(tostring(getCreatureName(itemEx.uid)), "Shiny") then
	    doPlayerSendTextMessage(cid, 27, "Este pokemon não pode evoluir.")
	    doSendMagicEffect(getPlayerPosition(cid), 2)   
	return true
	end
		
	-- if getCreatureMaster(itemEx.uid) ~= cid then
 --        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sorry, you can't use this on this pokemon.")
 --        return false 
 --    end 
	
	-- if not pokes["Shiny "..getCreatureName(itemEx.uid)] then
	--     doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sorry, you can't use this on this pokemon.")
 --        return false 
 --    end
	
	local ball = getPlayerSlotItem(cid, 8).uid
	local pokename = doCorrectString(getItemAttribute(ball, "nome"))
	local newpoke = PokemonShinys[pokename].name

	if pokes[newpoke] and pokes[newpoke].level then
		minlevel = pokes[newpoke].level
	end

	if getPlayerLevel(cid) < minlevel then
   		doPlayerSendCancel(cid, "Você não possui level necessario para evoluir esse pokemon ("..minlevel..").")
   		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Você não possui level necessario para evoluir esse pokemon ("..minlevel..").")
    	return true
	end
	
	-- local stnid2 = 0
	-- local count = 3

	-- if getPlayerItemCount(cid, stnid) < count then
 --        local str = ""
 --        if count >= 2 then
 --            str = "s"
 --        end
 --        return doPlayerSendCancel(cid, "You need at least "..count.." "..getItemNameById(stnid)..""..str.." to evolve this pokemon!")
 --    end
		 
	-- if count >= 2 then
 --        stnid2 = stnid
 --    end
 
	if PokemonShinys[pokename] and PokemonShinys[pokename].quant then
		local stnid = 12401
		local quant = PokemonShinys[pokename].quant
		if getPlayerItemCount(cid, item.itemid) >= quant then
			doEvolvePokemon(cid, (itemEx.uid), newpoke, stnid, quant)
			doItemSetAttribute(ball, "boost", 0)
			-- doPlayerRemoveItem(cid, item.itemid, quant)
			-- doItemEraseAttribute(ball, "boost")	
			-- doItemSetAttribute(ball, "morta", "no")
			-- doItemSetAttribute(ball, "Icone", "yes")	
			-- doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
			-- doUpdatePokemonsBar(cid)
		else
			doPlayerSendCancel(cid,  "You don't have "..quant.." shiny stones to evolve this ".. pokename .."!")
		end
	end


return true
end