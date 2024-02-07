killModes = {
	storage = 24000,	
	storage2 = 24001,	
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

function getKillMode(cid)
	if isPlayer(cid) then
		if not (tostring(getPlayerStorageValue(cid, killModes.storage)) == "-1") then		
			return tonumber(tostring(getPlayerStorageValue(cid, killModes.storage)):explode("|")[1])
		end
	end
	return 1
end

function getKillCount(cid)
	if isPlayer(cid) then
		if not (tostring(getPlayerStorageValue(cid, killModes.storage)) == "-1") then
			return tonumber(getPlayerStorageValue(cid, killModes.storage):explode("|")[5])
		end
	end	
	return tonumber(0)
end	

function setKillCatched(cid, bool)
	local pokecount = tonumber(getPlayerStorageValue(cid, 24003) <= 0 and 0 or getPlayerStorageValue(cid, 24003))
	setPlayerStorageValue(cid, killModes.storage, "|"..getPlayerStorageValue(cid, killModes.storage):explode("|")[1].."|"..getPlayerStorageValue(cid, killModes.storage):explode("|")[2].."|"..getPlayerStorageValue(cid, killModes.storage):explode("|")[3].."|"..tostring(bool).."|"..pokecount)
end

function getPokemonsToKill(cid)
	if isPlayer(cid) then
		if not (tostring(getPlayerStorageValue(cid, killModes.storage)) == "-1") then
			local string = getPlayerStorageValue(cid, killModes.storage):explode("|")[3]
			return string:explode(";")
		end
	end
	return {"none1", "none2"}
end

function hasKilled(cid)
	if isPlayer(cid) then
		if not (tostring(getPlayerStorageValue(cid, killModes.storage)) == "-1") then
			return (getPlayerStorageValue(cid, killModes.storage):explode("|")[4] == "true")
		end
	end	
	return false
end

function getLastDayKill(cid)
	if isPlayer(cid) then
		if not (tostring(getPlayerStorageValue(cid, killModes.storage)) == "-1") then
			return tostring(getPlayerStorageValue(cid, killModes.storage)):explode("|")[2]
		end
	end
	return "00-00-00"
end

function resetDailyKill(cid)
	if isPlayer(cid) then
		
		local pokemons = killModes[(getCatchMode(cid))].pokemons
		local number1 = math.random(1, #pokemons)
		local number2 = number1
		local count = math.random(150, 350)	
		
		repeat
			number2 = math.random(1, #pokemons)
		until(not (number1 == number2))
		
		repeat
			count2 = math.random(150, 350)
		until(not (count == count2))
		
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
		setPlayerStorageValue(cid, killModes.storage, "|"..valor.."|"..day.."|"..pokemons[number1]..";"..pokemons[number2].."|false|"..count2)
		setPlayerStorageValue(cid, killModes.storage2, -1)
		setPlayerStorageValue(cid, 24003, 0)
	end
end

function nextDailyKill(cid)
	if isPlayer(cid) then
		if getCatchMode(cid) == #killModes then
			setKillCatched(cid, false)
			setPlayerStorageValue(cid, killModes.storage2, "finished")
			return false
		end
		
		local pokemons = killModes[(getCatchMode(cid) + 1)].pokemons
		local number1 = math.random(1, #pokemons)
		local number2 = number1
		local count = math.random(150, 350)
		
		repeat
			number2 = math.random(1, #pokemons)
		until(not (number1 == number2))
		
		repeat
			count2 = math.random(150, 350)
		until(not (count == count2))
		
		local day = tostring(""..getNumberDay().."-"..getNumberMonth().."-"..getNumberYear().."")
		local text = "|"..(getCatchMode(cid) + 1).."|"..day.."|"..pokemons[number1]..";"..pokemons[number2].."|false|"..count2
		

		setKillCatched(cid, false)
		setPlayerStorageValue(cid, killModes.storage, text)
		setPlayerStorageValue(cid, killModes.storage2, -1)
		setPlayerStorageValue(cid, 24003, 0)
	end	
	return true
end