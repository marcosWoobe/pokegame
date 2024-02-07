catchModes = {
	storage = 725, -- Variáveis
	storage2 = 5123, -- Pokémon Escolhido!
	[1] = {
		name = "easy",
		experience = 70000, -- 70000
		items = {
			{15645, 1}, -- devoted token
			{2392, 20}, -- ultra ball
		},
		pokemons = {"Swinub", "Phanpy", "Lavitar", "Elekid", "Magby", "Smoochum", "Houndour", "Remoraid", "Slugma", "Teddiursa", "Wooper", "Mareep", "Natu", "Togepi", "Pichu", "Cleffa", "Igglybuff", "Chinchou", "Ledyba", "Spinarak", "Sentret", "Totodile", "Cyndaquil", "Chikorita", "Electrode", "Charmander", "Gastly", "Squirtle", "Bulbasaur", "Nidorina", "Nidorino", "Clefairy", "Jigglypuff", "Gloom", "Poliwhirl", "Machoke", "Graveler", "Slowbro", "Dodrio", "Drowzee", "Lickitung", "Seadra", "Butterfree", "Beedrill", "Kadabra",  "Haunter", "Tauros", "Venomoth", "Persian", "Tangela", "Pikachu", "Fearow", "Weezing", "Parasect", "Primeape", "Golbat", "Dugtrio", "Arbok"}, 
	},
	[2] = {
		name = "medium",
		experience = 150000, -- 150000
		items = {
			{23488, 1}, -- catcher token
			{15645, 2}, -- devoted token
		},
		pokemons = {"Stantler", "Pupitar", "Octillery", "Delibird", "Qwilfish", "Dunsparce", "Shuckle", "Gligar", "Murkrow", "Quagsire", "Sunflora", "Skiploom", "Azumarill", "Bellossom", "Flaaffy", "Togetic", "Lanturn", "Ariados", "Noctowl", "Ledian", "Furret", "Bayleef", "Quilava", "Croconaw", "Magneton", "Kingler", "Chansey", "Pinsir", "Fearow", "Weezing", "Lickitung", "Ivysaur", "Charmeleon", "Wartortle", "Dratini", "Hypno", "Venomoth", "Onix", "Marowak", "Sandslash", "Golduck", "Clefable", "Wigglytuff", "Victreebel", "Vileplume", "Poliwrath", "Dewgong", "Cloyster"},
	},
	[3] = {
		name = "hard",
		experience = 250000, -- 200000
		items = {    
			{23488, 1}, -- catcher token
			{15645, 3}, -- devoted token
		},
		pokemons = { "Meganium", "Typhlosion", "Feraligatr", "Houndoom", "Donphan", "Piloswine", "Magcargo", "Granbull", "Girafarig", "Forretress", "Jumpluff", "Politoed", "Ampharos", "Xatu", "Alakazam", "Sandslash", "Nidoking", "Nidoqueen", "Starmie", "Wigglytuff", "Ninetales", "Golduck", "Machamp", "Victreebel", "Rapidash", "Magneton", "Pinsir", "Dragonair", "Muk", "Gengar", "Pidgeot", "Raichu", "Charizard", "Rhydon", "Venusaur", "Blastoise", "Golem", "Tentacruel", "Poliwrath"},
	},
	[4] = {
		name = "very hard",
		experience = 320000, -- 280000
		items = {
			{23488, 1}, -- catcher token
			{15645, 3}, -- devoted token
		},
		pokemons = {"Dustox", "Ludicolo", "Shiftry", "Swellow", "Breloom", "Delcatty", "Walrein", "Cacturn", "Glalie", "Mawile", "Dusclops", "Exploud", "Banette", "Grumpig", "Claydol", "Torkoal", "Crawdaunt", "Flygon", "Hariyama", "Manectric", "Camerupt", "Beautifly", "Sceptile", "Blaziken", "Swampert", "Mightyena", "Tyranitar", "Mantine", "Skarmory", "Kingdra", "Heracross", "Steelix", "Wobbuffet", "Misdreavus", "Sudowoodo", "Crobat", "Magmar", "Tentacruel", "Exeggutor", "Giant Magikarp", "Arcanine", "Electabuzz", "Lapras", "Jynx", "Dragonite", "Scyther", "Kangaskhan", "Gyarados", "Snorlax", "Alakazam", "Gengar", "Charizard", "Venusaur", "Blastoise"},
	},
}

function getCatchMode(cid)
	if isPlayer(cid) then
		if not (tostring(getPlayerStorageValue(cid, catchModes.storage)) == "-1") then		
			return tonumber(tostring(getPlayerStorageValue(cid, catchModes.storage)):explode("|")[1])
		end
	end
	return 1
end

function setDailyCatched(cid, bool)
	setPlayerStorageValue(cid, catchModes.storage, "|"..getPlayerStorageValue(cid, catchModes.storage):explode("|")[1].."|"..getPlayerStorageValue(cid, catchModes.storage):explode("|")[2].."|"..getPlayerStorageValue(cid, catchModes.storage):explode("|")[3].."|"..tostring(bool))
end

function getPokemonsToCatch(cid)
	if isPlayer(cid) then
		if not (tostring(getPlayerStorageValue(cid, catchModes.storage)) == "-1") then
			local string = getPlayerStorageValue(cid, catchModes.storage):explode("|")[3]
			return string:explode(";")
		end
	end
	return {"none1", "none2"}
end

function doPlayerAddTableItems(cid, table)
	if isPlayer(cid) then
		for _, item in pairs(table) do
			doPlayerAddItem(cid, item[1], item[2])
		end
	end
end

function hasCatched(cid)
	if isPlayer(cid) then
		if not (tostring(getPlayerStorageValue(cid, catchModes.storage)) == "-1") then
			return (getPlayerStorageValue(cid, catchModes.storage):explode("|")[4] == "true")
		end
	end	
	return false
end

function getLastDayCatch(cid)
	if isPlayer(cid) then
		if not (tostring(getPlayerStorageValue(cid, catchModes.storage)) == "-1") then
			return tostring(getPlayerStorageValue(cid, catchModes.storage)):explode("|")[2]
		end
	end
	return "00-00-00"
end

function resetDaily(cid)
	if isPlayer(cid) then
		
		local pokemons = catchModes[(getCatchMode(cid))].pokemons
		local number1 = math.random(1, #pokemons)
		local number2 = number1
		repeat
			number2 = math.random(1, #pokemons)
		until(not (number1 == number2))

		if getPlayerLevel(cid) >= 1 and getPlayerLevel(cid) <= 50 then
			valor = 1
		elseif getPlayerLevel(cid) >= 51 and getPlayerLevel(cid) <= 100 then
			valor = 2
		elseif getPlayerLevel(cid) >= 101 and getPlayerLevel(cid) <= 180 then
			valor = 3
		elseif getPlayerLevel(cid) >= 180 then
			valor = 4
		end
		
		local day = tostring(""..getNumberDay().."-"..getNumberMonth().."-"..getNumberYear().."")
		setPlayerStorageValue(cid, catchModes.storage, "|"..valor.."|"..day.."|"..pokemons[number1]..";"..pokemons[number2].."|false")
		setPlayerStorageValue(cid, catchModes.storage2, -1)
	end
end

function nextDaily(cid)
	if isPlayer(cid) then
		if getCatchMode(cid) == #catchModes then
			setDailyCatched(cid, false)
			setPlayerStorageValue(cid, catchModes.storage2, "finished")
			return false
		end
		
		local pokemons = catchModes[(getCatchMode(cid) + 1)].pokemons
		local number1 = math.random(1, #pokemons)
		local number2 = number1
		repeat
			number2 = math.random(1, #pokemons)
		until(not (number1 == number2))
		
		local day = tostring(""..getNumberDay().."-"..getNumberMonth().."-"..getNumberYear().."")
		local text = "|"..(getCatchMode(cid) + 1).."|"..day.."|"..pokemons[number1]..";"..pokemons[number2].."|false"
		

		setDailyCatched(cid, false)
		setPlayerStorageValue(cid, catchModes.storage, text)
		setPlayerStorageValue(cid, catchModes.storage2, -1)
	end	
	return true
end