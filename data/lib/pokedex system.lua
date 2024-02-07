function getPlayerInfoAboutPokemon(cid, poke)
	poke = doCorrectString(poke)
	local a = newpokedex[poke]
	if not isPlayer(cid) then return false end
	if not a then
		return false
	end
	local b = getPlayerStorageValue(cid, a.storage)
	
	if b == -1 then
		setPlayerStorageValue(cid, a.storage, poke..":")
	end
	
	local ret = {}
	if string.find(b, "catch,") then
		ret.catch = true
	else
		ret.catch = false
	end
	if string.find(b, "dex,") then
		ret.dex = true
	else
		ret.dex = false
	end
	if string.find(b, "use,") then
		ret.use = true
	else
		ret.use = false
	end
	return ret
end

-------------- pokedex
function getPokemonVitalityD(name)
	if not pokes[name] then return false end
	return pokes[name].vitality
end

function getPokemonAttackD(name)
	if not pokes[name] then return false end
	return pokes[name].offense
end

function getPokemonDefenseD(name)
	if not pokes[name] then return false end
	return pokes[name].defense
end

function getPokemonSpAttackD(name)
	if not pokes[name] then return false end
	return pokes[name].specialattack
end

function getPokemonLevelD(name)
	if not pokes[name] then return false end
	if pokes[name].level <= 1 then
		return 5
	end
	return pokes[name].level
end

function getPokemonPortraitD(name)
	if not pokes[name] then return false end
	return pokes[name].portrait
end



function getPokemonType1D(name)
	if not pokes[name] then return "normal" end
	return pokes[name].type
end

function getPokemonType2D(name)
	if not pokes[name] or not pokes[name].type2 then return false end
	return pokes[name].type2
end

function getPokemonHealthD(name) 
	if not pokes[name] then return false end
	return getMonsterInfo(name).healthMax
end

function getPokemonExperienceD(name)
	if not pokesMasterX[name] then
		if pokes[name] then
			pokesXD = pokes[doCorrectPokemonName(name)].exp
			-- if string.find(name, "Shiny") then
				-- pokesXD = ((pokes[doCorrectPokemonName(name)].exp)*1.5)
			-- end			
			return pokesXD
		else
			return false
		end
	end
	-- print(doCorrectPokemonName(name))
	-- print(pokesMasterX[doCorrectPokemonName(name)].exp)
	
	pokesXD = pokesMasterX[doCorrectPokemonName(name)].exp
	-- if string.find(name, "Shiny") then
		-- pokesXD = ((pokesMasterX[doCorrectPokemonName(name)].exp)*1.5)
	-- end

	return pokesXD
end

function getPokemonCatchedStorage(name)
	if not pokes[name] then return false end
	return getMonsterInfo(name).lookCorpse
end

local skills = specialabilities --alterado v1.9 \/ peguem tudo!

function doAddPokemonInDexList(cid, poke)
	if getPlayerInfoAboutPokemon(cid, poke).dex then 
		return true 
	end
	poke = doCorrectString(poke)
	local a = newpokedex[poke] 
	local b = getPlayerStorageValue(cid, a.storage)
	setPlayerStorageValue(cid, a.storage, b.." dex,")
end

function doRegisterPokemonToDex(cid, poke)
	local result = db.getResult("SELECT `"..string.lower(string.gsub(string.lower(poke), "%s+", "_")).."` FROM `player_pokedex` WHERE `player_id` = "..getPlayerGUID(cid).." LIMIT 1;")
	-- print(poke)
	local dataString = result:getDataString(string.lower(poke))
	local data = string.explode(dataString, "-")
	if data[1] == "0" then
		local setData = "1-"..data[2]
		db.executeQuery("UPDATE player_pokedex SET "..poke.."='"..setData.."' WHERE player_id ="..getPlayerGUID(cid)..";")
	end
	return true
end

function doRegisterPokemonToCatch(cid, poke)
	local result = db.getResult("SELECT `"..string.lower(string.gsub(string.lower(poke), "%s+", "_")).."` FROM `player_pokedex` WHERE `player_id` = "..getPlayerGUID(cid).." LIMIT 1;")
	local dataString = result:getDataString(string.lower(poke))
	local data = string.explode(dataString, "-")
	if data[2] == "0" then
		local setData = data[1].."-1"
		db.executeQuery("UPDATE player_pokedex SET "..poke.."='"..setData.."' WHERE player_id ="..getPlayerGUID(cid)..";")
	end
	return true
end

function getPlayerDexInfo(cid, poke)
	local result = db.getResult("SELECT `"..string.lower(poke).."` FROM `player_pokedex` WHERE `player_id` = "..getPlayerGUID(cid).." LIMIT 1;")
	local dataString = result:getDataString(string.lower(poke))
	local dataTable = string.explode(dataString, '-')
	local data = {dex = tonumber(dataTable[1]), catch = tonumber(dataTable[2])}
	return data
end

json = require "json"
function generateList(cid)
	local str = ""
	local teste = json.decode('[{"id":"001","name":"Bulbasaur","type":["Grass","Poison"]},{"id":"002","name":"Ivysaur","type":["Grass","Poison"]},{"id":"003","name":"Venusaur","type":["Grass","Poison"]},{"id":"004","name":"Charmander","type":["Fire"]},{"id":"005","name":"Charmeleon","type":["Fire"]},{"id":"006","name":"Charizard","type":["Fire","Flying"]},{"id":"007","name":"Squirtle","type":["Water"]},{"id":"008","name":"Wartortle","type":["Water"]},{"id":"009","name":"Blastoise","type":["Water"]},{"id":"010","name":"Caterpie","type":["insect"]},{"id":"011","name":"Metapod","type":["insect"]},{"id":"012","name":"Butterfree","type":["insect","Flying"]},{"id":"013","name":"Weedle","type":["insect","Poison"]},{"id":"014","name":"Kakuna","type":["insect","Poison"]},{"id":"015","name":"Beedrill","type":["insect","Poison"]},{"id":"016","name":"Pidgey","type":["Normal","Flying"]},{"id":"017","name":"Pidgeotto","type":["Normal","Flying"]},{"id":"018","name":"Pidgeot","type":["Normal","Flying"]},{"id":"019","name":"Rattata","type":["Normal"]},{"id":"020","name":"Raticate","type":["Normal"]},{"id":"021","name":"Spearow","type":["Normal","Flying"]},{"id":"022","name":"Fearow","type":["Normal","Flying"]},{"id":"023","name":"Ekans","type":["Poison"]},{"id":"024","name":"Arbok","type":["Poison"]},{"id":"025","name":"Pikachu","type":["Electric"]},{"id":"026","name":"Raichu","type":["Electric"]},{"id":"027","name":"Sandshrew","type":["Ground"]},{"id":"028","name":"Sandslash","type":["Ground"]},{"id":"029","name":"Nidoran_f","type":["Poison"]},{"id":"030","name":"Nidorina","type":["Poison"]},{"id":"031","name":"Nidoqueen","type":["Poison","Ground"]},{"id":"032","name":"Nidoran_m","type":["Poison"]},{"id":"033","name":"Nidorino","type":["Poison"]},{"id":"034","name":"Nidoking","type":["Poison","Ground"]},{"id":"035","name":"Clefairy","type":["Fairy"]},{"id":"036","name":"Clefable","type":["Fairy"]},{"id":"037","name":"Vulpix","type":["Fire"]},{"id":"038","name":"Ninetales","type":["Fire"]},{"id":"039","name":"Jigglypuff","type":["Normal","Fairy"]},{"id":"040","name":"Wigglytuff","type":["Normal","Fairy"]},{"id":"041","name":"Zubat","type":["Poison","Flying"]},{"id":"042","name":"Golbat","type":["Poison","Flying"]},{"id":"043","name":"Oddish","type":["Grass","Poison"]},{"id":"044","name":"Gloom","type":["Grass","Poison"]},{"id":"045","name":"Vileplume","type":["Grass","Poison"]},{"id":"046","name":"Paras","type":["insect","Grass"]},{"id":"047","name":"Parasect","type":["insect","Grass"]},{"id":"048","name":"Venonat","type":["insect","Poison"]},{"id":"049","name":"Venomoth","type":["insect","Poison"]},{"id":"050","name":"Diglett","type":["Ground"]},{"id":"051","name":"Dugtrio","type":["Ground"]},{"id":"052","name":"Meowth","type":["Normal"]},{"id":"053","name":"Persian","type":["Normal"]},{"id":"054","name":"Psyduck","type":["Water"]},{"id":"055","name":"Golduck","type":["Water"]},{"id":"056","name":"Mankey","type":["Fighting"]},{"id":"057","name":"Primeape","type":["Fighting"]},{"id":"058","name":"Growlithe","type":["Fire"]},{"id":"059","name":"Arcanine","type":["Fire"]},{"id":"060","name":"Poliwag","type":["Water"]},{"id":"061","name":"Poliwhirl","type":["Water"]},{"id":"062","name":"Poliwrath","type":["Water","Fighting"]},{"id":"063","name":"Abra","type":["Psychic"]},{"id":"064","name":"Kadabra","type":["Psychic"]},{"id":"065","name":"Alakazam","type":["Psychic"]},{"id":"066","name":"Machop","type":["Fighting"]},{"id":"067","name":"Machoke","type":["Fighting"]},{"id":"068","name":"Machamp","type":["Fighting"]},{"id":"069","name":"Bellsprout","type":["Grass","Poison"]},{"id":"070","name":"Weepinbell","type":["Grass","Poison"]},{"id":"071","name":"Victreebel","type":["Grass","Poison"]},{"id":"072","name":"Tentacool","type":["Water","Poison"]},{"id":"073","name":"Tentacruel","type":["Water","Poison"]},{"id":"074","name":"Geodude","type":["Rock","Ground"]},{"id":"075","name":"Graveler","type":["Rock","Ground"]},{"id":"076","name":"Golem","type":["Rock","Ground"]},{"id":"077","name":"Ponyta","type":["Fire"]},{"id":"078","name":"Rapidash","type":["Fire"]},{"id":"079","name":"Slowpoke","type":["Water","Psychic"]},{"id":"080","name":"Slowbro","type":["Water","Psychic"]},{"id":"081","name":"Magnemite","type":["Electric","Steel"]},{"id":"082","name":"Magneton","type":["Electric","Steel"]},{"id":"083","name":"Farfetch_d","type":["Normal","Flying"]},{"id":"084","name":"Doduo","type":["Normal","Flying"]},{"id":"085","name":"Dodrio","type":["Normal","Flying"]},{"id":"086","name":"Seel","type":["Water"]},{"id":"087","name":"Dewgong","type":["Water","Ice"]},{"id":"088","name":"Grimer","type":["Poison"]},{"id":"089","name":"Muk","type":["Poison"]},{"id":"090","name":"Shellder","type":["Water"]},{"id":"091","name":"Cloyster","type":["Water","Ice"]},{"id":"092","name":"Gastly","type":["Ghost","Poison"]},{"id":"093","name":"Haunter","type":["Ghost","Poison"]},{"id":"094","name":"Gengar","type":["Ghost","Poison"]},{"id":"095","name":"Onix","type":["Rock","Ground"]},{"id":"096","name":"Drowzee","type":["Psychic"]},{"id":"097","name":"Hypno","type":["Psychic"]},{"id":"098","name":"Krabby","type":["Water"]},{"id":"099","name":"Kingler","type":["Water"]},{"id":"100","name":"Voltorb","type":["Electric"]},{"id":"101","name":"Electrode","type":["Electric"]},{"id":"102","name":"Exeggcute","type":["Grass","Psychic"]},{"id":"103","name":"Exeggutor","type":["Grass","Psychic"]},{"id":"104","name":"Cubone","type":["Ground"]},{"id":"105","name":"Marowak","type":["Ground"]},{"id":"106","name":"Hitmonlee","type":["Fighting"]},{"id":"107","name":"Hitmonchan","type":["Fighting"]},{"id":"108","name":"Lickitung","type":["Normal"]},{"id":"109","name":"Koffing","type":["Poison"]},{"id":"110","name":"Weezing","type":["Poison"]},{"id":"111","name":"Rhyhorn","type":["Ground","Rock"]},{"id":"112","name":"Rhydon","type":["Ground","Rock"]},{"id":"113","name":"Chansey","type":["Normal"]},{"id":"114","name":"Tangela","type":["Grass"]},{"id":"115","name":"Kangaskhan","type":["Normal"]},{"id":"116","name":"Horsea","type":["Water"]},{"id":"117","name":"Seadra","type":["Water"]},{"id":"118","name":"Goldeen","type":["Water"]},{"id":"119","name":"Seaking","type":["Water"]},{"id":"120","name":"Staryu","type":["Water"]},{"id":"121","name":"Starmie","type":["Water","Psychic"]},{"id":"122","name":"Mr_Mime","type":["Psychic","Fairy"]},{"id":"123","name":"Scyther","type":["insect","Flying"]},{"id":"124","name":"Jynx","type":["Ice","Psychic"]},{"id":"125","name":"Electabuzz","type":["Electric"]},{"id":"126","name":"Magmar","type":["Fire"]},{"id":"127","name":"Pinsir","type":["insect"]},{"id":"128","name":"Tauros","type":["Normal"]},{"id":"129","name":"Magikarp","type":["Water"]},{"id":"130","name":"Gyarados","type":["Water","Flying"]},{"id":"131","name":"Lapras","type":["Water","Ice"]},{"id":"132","name":"Ditto","type":["Normal"]},{"id":"133","name":"Eevee","type":["Normal"]},{"id":"134","name":"Vaporeon","type":["Water"]},{"id":"135","name":"Jolteon","type":["Electric"]},{"id":"136","name":"Flareon","type":["Fire"]},{"id":"137","name":"Porygon","type":["Normal"]},{"id":"138","name":"Omanyte","type":["Rock","Water"]},{"id":"139","name":"Omastar","type":["Rock","Water"]},{"id":"140","name":"Kabuto","type":["Rock","Water"]},{"id":"141","name":"Kabutops","type":["Rock","Water"]},{"id":"142","name":"Aerodactyl","type":["Rock","Flying"]},{"id":"143","name":"Snorlax","type":["Normal"]},{"id":"144","name":"Articuno","type":["Ice","Flying"]},{"id":"145","name":"Zapdos","type":["Electric","Flying"]},{"id":"146","name":"Moltres","type":["Fire","Flying"]},{"id":"147","name":"Dratini","type":["Dragon"]},{"id":"148","name":"Dragonair","type":["Dragon"]},{"id":"149","name":"Dragonite","type":["Dragon","Flying"]},{"id":"150","name":"Mewtwo","type":["Psychic"]},{"id":"151","name":"Mew","type":["Psychic"]},{"id":"152","name":"Chikorita","type":["Grass"]},{"id":"153","name":"Bayleef","type":["Grass"]},{"id":"154","name":"Meganium","type":["Grass"]},{"id":"155","name":"Cyndaquil","type":["Fire"]},{"id":"156","name":"Quilava","type":["Fire"]},{"id":"157","name":"Typhlosion","type":["Fire"]},{"id":"158","name":"Totodile","type":["Water"]},{"id":"159","name":"Croconaw","type":["Water"]},{"id":"160","name":"Feraligatr","type":["Water"]},{"id":"161","name":"Sentret","type":["Normal"]},{"id":"162","name":"Furret","type":["Normal"]},{"id":"163","name":"Hoothoot","type":["Normal","Flying"]},{"id":"164","name":"Noctowl","type":["Normal","Flying"]},{"id":"165","name":"Ledyba","type":["insect","Flying"]},{"id":"166","name":"Ledian","type":["insect","Flying"]},{"id":"167","name":"Spinarak","type":["insect","Poison"]},{"id":"168","name":"Ariados","type":["insect","Poison"]},{"id":"169","name":"Crobat","type":["Poison","Flying"]},{"id":"170","name":"Chinchou","type":["Water","Electric"]},{"id":"171","name":"Lanturn","type":["Water","Electric"]},{"id":"172","name":"Pichu","type":["Electric"]},{"id":"173","name":"Cleffa","type":["Fairy"]},{"id":"174","name":"Igglybuff","type":["Normal","Fairy"]},{"id":"175","name":"Togepi","type":["Fairy"]},{"id":"176","name":"Togetic","type":["Fairy","Flying"]},{"id":"177","name":"Natu","type":["Psychic","Flying"]},{"id":"178","name":"Xatu","type":["Psychic","Flying"]},{"id":"179","name":"Mareep","type":["Electric"]},{"id":"180","name":"Flaaffy","type":["Electric"]},{"id":"181","name":"Ampharos","type":["Electric"]},{"id":"182","name":"Bellossom","type":["Grass"]},{"id":"183","name":"Marill","type":["Water","Fairy"]},{"id":"184","name":"Azumarill","type":["Water","Fairy"]},{"id":"185","name":"Sudowoodo","type":["Rock"]},{"id":"186","name":"Politoed","type":["Water"]},{"id":"187","name":"Hoppip","type":["Grass","Flying"]},{"id":"188","name":"Skiploom","type":["Grass","Flying"]},{"id":"189","name":"Jumpluff","type":["Grass","Flying"]},{"id":"190","name":"Aipom","type":["Normal"]},{"id":"191","name":"Sunkern","type":["Grass"]},{"id":"192","name":"Sunflora","type":["Grass"]},{"id":"193","name":"Yanma","type":["insect","Flying"]},{"id":"194","name":"Wooper","type":["Water","Ground"]},{"id":"195","name":"Quagsire","type":["Water","Ground"]},{"id":"196","name":"Espeon","type":["Psychic"]},{"id":"197","name":"Umbreon","type":["Dark"]},{"id":"198","name":"Murkrow","type":["Dark","Flying"]},{"id":"199","name":"Slowking","type":["Water","Psychic"]},{"id":"200","name":"Misdreavus","type":["Ghost"]},{"id":"201","name":"Unown","type":["Psychic"]},{"id":"202","name":"Wobbuffet","type":["Psychic"]},{"id":"203","name":"Girafarig","type":["Normal","Psychic"]},{"id":"204","name":"Pineco","type":["insect"]},{"id":"205","name":"Forretress","type":["insect","Steel"]},{"id":"206","name":"Dunsparce","type":["Normal"]},{"id":"207","name":"Gligar","type":["Ground","Flying"]},{"id":"208","name":"Steelix","type":["Steel","Ground"]},{"id":"209","name":"Snubbull","type":["Fairy"]},{"id":"210","name":"Granbull","type":["Fairy"]},{"id":"211","name":"Qwilfish","type":["Water","Poison"]},{"id":"212","name":"Scizor","type":["insect","Steel"]},{"id":"213","name":"Shuckle","type":["insect","Rock"]},{"id":"214","name":"Heracross","type":["insect","Fighting"]},{"id":"215","name":"Sneasel","type":["Dark","Ice"]},{"id":"216","name":"Teddiursa","type":["Normal"]},{"id":"217","name":"Ursaring","type":["Normal"]},{"id":"218","name":"Slugma","type":["Fire"]},{"id":"219","name":"Magcargo","type":["Fire","Rock"]},{"id":"220","name":"Swinub","type":["Ice","Ground"]},{"id":"221","name":"Piloswine","type":["Ice","Ground"]},{"id":"222","name":"Corsola","type":["Water","Rock"]},{"id":"223","name":"Remoraid","type":["Water"]},{"id":"224","name":"Octillery","type":["Water"]},{"id":"225","name":"Delibird","type":["Ice","Flying"]},{"id":"226","name":"Mantine","type":["Water","Flying"]},{"id":"227","name":"Skarmory","type":["Steel","Flying"]},{"id":"228","name":"Houndour","type":["Dark","Fire"]},{"id":"229","name":"Houndoom","type":["Dark","Fire"]},{"id":"230","name":"Kingdra","type":["Water","Dragon"]},{"id":"231","name":"Phanpy","type":["Ground"]},{"id":"232","name":"Donphan","type":["Ground"]},{"id":"233","name":"Porygon2","type":["Normal"]},{"id":"234","name":"Stantler","type":["Normal"]},{"id":"235","name":"Smeargle","type":["Normal"]},{"id":"236","name":"Tyrogue","type":["Fighting"]},{"id":"237","name":"Hitmontop","type":["Fighting"]},{"id":"238","name":"Smoochum","type":["Ice","Psychic"]},{"id":"239","name":"Elekid","type":["Electric"]},{"id":"240","name":"Magby","type":["Fire"]},{"id":"241","name":"Miltank","type":["Normal"]},{"id":"242","name":"Blissey","type":["Normal"]},{"id":"243","name":"Raikou","type":["Electric"]},{"id":"244","name":"Entei","type":["Fire"]},{"id":"245","name":"Suicune","type":["Water"]},{"id":"246","name":"Larvitar","type":["Rock","Ground"]},{"id":"247","name":"Pupitar","type":["Rock","Ground"]},{"id":"248","name":"Tyranitar","type":["Rock","Dark"]},{"id":"249","name":"Lugia","type":["Psychic","Flying"]},{"id":"250","name":"Ho_Oh","type":["Fire","Flying"]},{"id":"251","name":"Celebi","type":["Psychic","Grass"]},{"id":"252","name":"Treecko","type":["Grass"]},{"id":"253","name":"Grovyle","type":["Grass"]},{"id":"254","name":"Sceptile","type":["Grass"]},{"id":"255","name":"Torchic","type":["Fire"]},{"id":"256","name":"Combusken","type":["Fire","Fighting"]},{"id":"257","name":"Blaziken","type":["Fire","Fighting"]},{"id":"258","name":"Mudkip","type":["Water"]},{"id":"259","name":"Marshtomp","type":["Water","Ground"]},{"id":"260","name":"Swampert","type":["Water","Ground"]},{"id":"261","name":"Poochyena","type":["Dark"]},{"id":"262","name":"Mightyena","type":["Dark"]},{"id":"263","name":"Zigzagoon","type":["Normal"]},{"id":"264","name":"Linoone","type":["Normal"]},{"id":"265","name":"Wurmple","type":["insect"]},{"id":"266","name":"Silcoon","type":["insect"]},{"id":"267","name":"Beautifly","type":["insect","Flying"]},{"id":"268","name":"Cascoon","type":["insect"]},{"id":"269","name":"Dustox","type":["insect","Poison"]},{"id":"270","name":"Lotad","type":["Water","Grass"]},{"id":"271","name":"Lombre","type":["Water","Grass"]},{"id":"272","name":"Ludicolo","type":["Water","Grass"]},{"id":"273","name":"Seedot","type":["Grass"]},{"id":"274","name":"Nuzleaf","type":["Grass","Dark"]},{"id":"275","name":"Shiftry","type":["Grass","Dark"]},{"id":"276","name":"Nincada","type":["insect","Ground"]},{"id":"277","name":"Shedinja","type":["insect","Ghost"]},{"id":"278","name":"Ninjask","type":["insect","Flying"]},{"id":"279","name":"Taillow","type":["Normal","Flying"]},{"id":"280","name":"Swellow","type":["Normal","Flying"]},{"id":"281","name":"Shroomish","type":["Grass"]},{"id":"282","name":"Breloom","type":["Grass","Fighting"]},{"id":"283","name":"Spinda","type":["Normal"]},{"id":"284","name":"Wingull","type":["Water","Flying"]},{"id":"285","name":"Pelipper","type":["Water","Flying"]},{"id":"286","name":"Surskit","type":["insect","Water"]},{"id":"287","name":"Masquerain","type":["insect","Flying"]},{"id":"288","name":"Wailmer","type":["Water"]},{"id":"289","name":"Wailord","type":["Water"]},{"id":"290","name":"Skitty","type":["Normal"]},{"id":"291","name":"Delcatty","type":["Normal"]},{"id":"292","name":"Kecleon","type":["Normal"]},{"id":"293","name":"Baltoy","type":["Ground","Psychic"]},{"id":"294","name":"Claydol","type":["Ground","Psychic"]},{"id":"295","name":"Torkoal","type":["Fire"]},{"id":"296","name":"Sableye","type":["Dark","Ghost"]},{"id":"297","name":"Barboach","type":["Water","Ground"]},{"id":"298","name":"Whiscash","type":["Water","Ground"]},{"id":"299","name":"Luvdisc","type":["Water"]},{"id":"300","name":"Corphish","type":["Water"]},{"id":"301","name":"Crawdaunt","type":["Water","Dark"]},{"id":"302","name":"Feebas","type":["Water"]},{"id":"303","name":"Milotic","type":["Water"]},{"id":"304","name":"Carvanha","type":["Water","Dark"]},{"id":"305","name":"Sharpedo","type":["Water","Dark"]},{"id":"306","name":"Trapinch","type":["Ground"]},{"id":"307","name":"Vibrava","type":["Ground","Dragon"]},{"id":"308","name":"Flygon","type":["Ground","Dragon"]},{"id":"309","name":"Makuhita","type":["Fighting"]},{"id":"310","name":"Hariyama","type":["Fighting"]},{"id":"311","name":"Electrike","type":["Electric"]},{"id":"312","name":"Manectric","type":["Electric"]},{"id":"313","name":"Numel","type":["Fire","Ground"]},{"id":"314","name":"Camerupt","type":["Fire","Ground"]},{"id":"315","name":"Spheal","type":["Ice","Water"]},{"id":"316","name":"Sealeo","type":["Ice","Water"]},{"id":"317","name":"Walrein","type":["Ice","Water"]},{"id":"318","name":"Cacnea","type":["Grass"]},{"id":"319","name":"Cacturne","type":["Grass","Dark"]},{"id":"320","name":"Snorunt","type":["Ice"]},{"id":"321","name":"Glalie","type":["Ice"]},{"id":"322","name":"Lunatone","type":["Rock","Psychic"]},{"id":"323","name":"Solrock","type":["Rock","Psychic"]},{"id":"324","name":"Azurill","type":["Normal","Fairy"]},{"id":"325","name":"Spoink","type":["Psychic"]},{"id":"326","name":"Grumpig","type":["Psychic"]},{"id":"327","name":"Plusle","type":["Electric"]},{"id":"328","name":"Minun","type":["Electric"]},{"id":"329","name":"Mawile","type":["Steel","Fairy"]},{"id":"330","name":"Medicham","type":["Fighting","Psychic"]},{"id":"331","name":"Swablu","type":["Normal","Flying"]},{"id":"332","name":"Altaria","type":["Dragon","Flying"]},{"id":"333","name":"Wynaut","type":["Psychic"]},{"id":"334","name":"Wynaut","type":["Psychic"]},{"id":"335","name":"Duskull","type":["Ghost"]},{"id":"336","name":"Dusclops","type":["Ghost"]},{"id":"337","name":"Roselia","type":["Grass","Poison"]},{"id":"338","name":"Slakoth","type":["Normal"]},{"id":"339","name":"Vigoroth","type":["Normal"]},{"id":"340","name":"Slaking","type":["Normal"]},{"id":"341","name":"Gulpin","type":["Poison"]},{"id":"342","name":"Swalot","type":["Poison"]},{"id":"343","name":"Tropius","type":["Grass","Flying"]},{"id":"344","name":"Whismur","type":["Normal"]},{"id":"345","name":"Loudred","type":["Normal"]},{"id":"346","name":"Exploud","type":["Normal"]},{"id":"347","name":"Clamperl","type":["Water"]},{"id":"348","name":"Huntail","type":["Water"]},{"id":"349","name":"Gorebyss","type":["Water"]},{"id":"350","name":"Absol","type":["Dark"]},{"id":"351","name":"Shuppet","type":["Ghost"]},{"id":"352","name":"Banette","type":["Ghost"]},{"id":"353","name":"Seviper","type":["Poison"]},{"id":"354","name":"Zangoose","type":["Normal"]},{"id":"355","name":"Relicanth","type":["Water","Rock"]},{"id":"356","name":"Aron","type":["Steel","Rock"]},{"id":"357","name":"Lairon","type":["Steel","Rock"]},{"id":"358","name":"Aggron","type":["Steel","Rock"]},{"id":"359","name":"Castform","type":["Normal"]},{"id":"360","name":"Volbeat","type":["insect"]},{"id":"361","name":"Illumise","type":["insect"]},{"id":"362","name":"Lileep","type":["Rock","Grass"]},{"id":"363","name":"Cradily","type":["Rock","Grass"]},{"id":"364","name":"Anorith","type":["Rock","insect"]},{"id":"365","name":"Armaldo","type":["Rock","insect"]},{"id":"366","name":"Ralts","type":["Psychic","Fairy"]},{"id":"367","name":"Kirlia","type":["Psychic","Fairy"]},{"id":"368","name":"Gardevoir","type":["Psychic","Fairy"]},{"id":"369","name":"Bagon","type":["Dragon"]},{"id":"370","name":"Shelgon","type":["Dragon"]},{"id":"371","name":"Salamence","type":["Dragon","Flying"]},{"id":"372","name":"Beldum","type":["Steel","Psychic"]},{"id":"373","name":"Metang","type":["Steel","Psychic"]},{"id":"374","name":"Metagross","type":["Steel","Psychic"]},{"id":"375","name":"Regirock","type":["Rock"]},{"id":"376","name":"Nosepass","type":["Rock"]},{"id":"377","name":"Meditite","type":["Fighting","Psychic"]},{"id":"378","name":"Chimecho","type":["Psychic"]},{"id":"379","name":"Regice","type":["Ice"]},{"id":"380","name":"Registeel","type":["Steel"]},{"id":"381","name":"Latias","type":["Dragon","Psychic"]},{"id":"382","name":"Latios","type":["Dragon","Psychic"]},{"id":"383","name":"Kyogre","type":["Water"]},{"id":"384","name":"Groudon","type":["Ground"]},{"id":"385","name":"Rayquaza","type":["Dragon","Flying"]},{"id":"386","name":"Jirachi","type":["Steel","Psychic"]},{"id":"387","name":"Deoxys","type":["Psychic"]},{"id":"388","name":"Turtwig","type":["Grass"]},{"id":"388","name":"Grotle","type":["Grass"]},{"id":"389","name":"Torterra","type":["Grass","Ground"]},{"id":"390","name":"Chimchar","type":["Fire"]},{"id":"391","name":"Monferno","type":["Fire","Fighting"]},{"id":"392","name":"Infernape","type":["Fire","Fighting"]},{"id":"393","name":"Piplup","type":["Water"]},{"id":"394","name":"Prinplup","type":["Water"]},{"id":"395","name":"Empoleon","type":["Water","Steel"]},{"id":"396","name":"Starly","type":["Normal","Flying"]},{"id":"397","name":"Staravia","type":["Normal","Flying"]},{"id":"398","name":"Staraptor","type":["Normal","Flying"]},{"id":"399","name":"Bidoof","type":["Normal"]},{"id":"400","name":"Bibarel","type":["Normal","Water"]},{"id":"401","name":"Kricketot","type":["insect"]},{"id":"402","name":"Kricketune","type":["insect"]},{"id":"403","name":"Shinx","type":["Electric"]},{"id":"404","name":"Luxio","type":["Electric"]},{"id":"405","name":"Luxray","type":["Electric"]},{"id":"406","name":"Budew","type":["Grass","Poison"]},{"id":"407","name":"Roserade","type":["Grass","Poison"]},{"id":"408","name":"Cranidos","type":["Rock"]},{"id":"409","name":"Rampardos","type":["Rock"]},{"id":"410","name":"Shieldon","type":["Rock","Steel"]},{"id":"411","name":"Bastiodon","type":["Rock","Steel"]},{"id":"412","name":"Burmy","type":["insect"]},{"id":"413","name":"Wormadam","type":["insect","Grass"]},{"id":"414","name":"Mothim","type":["insect","Flying"]},{"id":"415","name":"Combee","type":["insect","Flying"]},{"id":"416","name":"Vespiquen","type":["insect","Flying"]},{"id":"417","name":"Pachirisu","type":["Electric"]},{"id":"418","name":"Buizel","type":["Water"]},{"id":"419","name":"Floatzel","type":["Water"]},{"id":"420","name":"Cherubi","type":["Grass"]},{"id":"421","name":"Cherrim","type":["Grass"]},{"id":"422","name":"Shellos","type":["Water"]},{"id":"423","name":"Gastrodon","type":["Water","Ground"]},{"id":"424","name":"Ambipom","type":["Normal"]},{"id":"425","name":"Drifloon","type":["Ghost","Flying"]},{"id":"426","name":"Drifblim","type":["Ghost","Flying"]},{"id":"427","name":"Buneary","type":["Normal"]},{"id":"428","name":"Lopunny","type":["Normal"]},{"id":"429","name":"Mismagius","type":["Ghost"]},{"id":"430","name":"Honchkrow","type":["Dark","Flying"]},{"id":"431","name":"Glameow","type":["Normal"]},{"id":"432","name":"Purugly","type":["Normal"]},{"id":"433","name":"Chingling","type":["Psychic"]},{"id":"434","name":"Stunky","type":["Poison","Dark"]},{"id":"435","name":"Skuntank","type":["Poison","Dark"]},{"id":"436","name":"Bronzor","type":["Steel","Psychic"]},{"id":"437","name":"Bronzong","type":["Steel","Psychic"]},{"id":"438","name":"Bonsly","type":["Rock"]},{"id":"439","name":"Mime_Jr","type":["Psychic","Fairy"]},{"id":"440","name":"Happiny","type":["Normal"]},{"id":"441","name":"Chatot","type":["Normal","Flying"]},{"id":"442","name":"Spiritomb","type":["Ghost","Dark"]},{"id":"443","name":"Gible","type":["Dragon","Ground"]},{"id":"444","name":"Gabite","type":["Dragon","Ground"]},{"id":"445","name":"Garchomp","type":["Dragon","Ground"]},{"id":"446","name":"Munchlax","type":["Normal"]},{"id":"447","name":"Riolu","type":["Fighting"]},{"id":"448","name":"Lucario","type":["Fighting","Steel"]},{"id":"449","name":"Hippopotas","type":["Ground"]},{"id":"450","name":"Hippowdon","type":["Ground"]},{"id":"451","name":"Skorupi","type":["Poison","insect"]},{"id":"452","name":"Drapion","type":["Poison","Dark"]},{"id":"453","name":"Croagunk","type":["Poison","Fighting"]},{"id":"454","name":"Toxicroak","type":["Poison","Fighting"]},{"id":"455","name":"Carnivine","type":["Grass"]},{"id":"456","name":"Finneon","type":["Water"]},{"id":"457","name":"Lumineon","type":["Water"]},{"id":"458","name":"Mantyke","type":["Water","Flying"]},{"id":"459","name":"Snover","type":["Grass","Ice"]},{"id":"460","name":"Abomasnow","type":["Grass","Ice"]},{"id":"461","name":"Weavile","type":["Dark","Ice"]},{"id":"462","name":"Magnezone","type":["Electric","Steel"]},{"id":"463","name":"Lickilicky","type":["Normal"]},{"id":"464","name":"Rhyperior","type":["Ground","Rock"]},{"id":"465","name":"Tangrowth","type":["Grass"]},{"id":"466","name":"Electivire","type":["Electric"]},{"id":"467","name":"Magmortar","type":["Fire"]},{"id":"468","name":"Togekiss","type":["Fairy","Flying"]},{"id":"469","name":"Yanmega","type":["insect","Flying"]},{"id":"470","name":"Leafeon","type":["Grass"]},{"id":"471","name":"Glaceon","type":["Ice"]},{"id":"472","name":"Gliscor","type":["Ground","Flying"]},{"id":"473","name":"Mamoswine","type":["Ice","Ground"]},{"id":"474","name":"Porygon_Z","type":["Normal"]},{"id":"475","name":"Gallade","type":["Psychic","Fighting"]},{"id":"476","name":"Probopass","type":["Rock","Steel"]},{"id":"477","name":"Dusknoir","type":["Ghost"]},{"id":"478","name":"Froslass","type":["Ice","Ghost"]},{"id":"479","name":"Rotom","type":["Electric","Ghost"]},{"id":"480","name":"Uxie","type":["Psychic"]},{"id":"481","name":"Mesprit","type":["Psychic"]},{"id":"482","name":"Azelf","type":["Psychic"]},{"id":"483","name":"Dialga","type":["Steel","Dragon"]},{"id":"484","name":"Palkia","type":["Water","Dragon"]},{"id":"485","name":"Heatran","type":["Fire","Steel"]},{"id":"486","name":"Regigigas","type":["Normal"]},{"id":"487","name":"Giratina","type":["Ghost","Dragon"]},{"id":"488","name":"Cresselia","type":["Psychic"]},{"id":"489","name":"Phione","type":["Water"]},{"id":"490","name":"Manaphy","type":["Water"]},{"id":"491","name":"Darkrai","type":["Dark"]},{"id":"492","name":"Shaymin","type":["Grass"]},{"id":"493","name":"Arceus","type":["Normal"]},{"id":"494","name":"Victini","type":["Psychic","Fire"]},{"id":"495","name":"Snivy","type":["Grass"]},{"id":"496","name":"Servine","type":["Grass"]},{"id":"497","name":"Serperior","type":["Grass"]},{"id":"498","name":"Tepig","type":["Fire"]},{"id":"499","name":"Pignite","type":["Fire","Fighting"]},{"id":"500","name":"Emboar","type":["Fire","Fighting"]},{"id":"501","name":"Oshawott","type":["Water"]},{"id":"502","name":"Dewott","type":["Water"]},{"id":"503","name":"Samurott","type":["Water"]},{"id":"504","name":"Patrat","type":["Normal"]},{"id":"505","name":"Watchog","type":["Normal"]},{"id":"506","name":"Lillipup","type":["Normal"]},{"id":"507","name":"Herdier","type":["Normal"]},{"id":"508","name":"Stoutland","type":["Normal"]},{"id":"509","name":"Purrloin","type":["Dark"]},{"id":"510","name":"Liepard","type":["Dark"]},{"id":"511","name":"Pansage","type":["Grass"]},{"id":"512","name":"Simisage","type":["Grass"]},{"id":"513","name":"Pansear","type":["Fire"]},{"id":"514","name":"Simisear","type":["Fire"]},{"id":"515","name":"Panpour","type":["Water"]},{"id":"516","name":"Simipour","type":["Water"]},{"id":"517","name":"Munna","type":["Psychic"]},{"id":"518","name":"Musharna","type":["Psychic"]},{"id":"519","name":"Pidove","type":["Normal","Flying"]},{"id":"520","name":"Tranquill","type":["Normal","Flying"]},{"id":"521","name":"Unfezant","type":["Normal","Flying"]},{"id":"522","name":"Blitzle","type":["Electric"]},{"id":"523","name":"Zebstrika","type":["Electric"]},{"id":"524","name":"Roggenrola","type":["Rock"]},{"id":"525","name":"Boldore","type":["Rock"]},{"id":"526","name":"Gigalith","type":["Rock"]},{"id":"527","name":"Woobat","type":["Psychic","Flying"]},{"id":"528","name":"Swoobat","type":["Psychic","Flying"]},{"id":"529","name":"Drilbur","type":["Ground"]},{"id":"530","name":"Excadrill","type":["Ground","Steel"]},{"id":"531","name":"Audino","type":["Normal"]},{"id":"532","name":"Timburr","type":["Fighting"]},{"id":"533","name":"Gurdurr","type":["Fighting"]},{"id":"534","name":"Conkeldurr","type":["Fighting"]},{"id":"535","name":"Tympole","type":["Water"]},{"id":"536","name":"Palpitoad","type":["Water","Ground"]},{"id":"537","name":"Seismitoad","type":["Water","Ground"]},{"id":"538","name":"Throh","type":["Fighting"]},{"id":"539","name":"Sawk","type":["Fighting"]},{"id":"540","name":"Sewaddle","type":["insect","Grass"]},{"id":"541","name":"Swadloon","type":["insect","Grass"]},{"id":"542","name":"Leavanny","type":["insect","Grass"]},{"id":"543","name":"Venipede","type":["insect","Poison"]},{"id":"544","name":"Whirlipede","type":["insect","Poison"]},{"id":"545","name":"Scolipede","type":["insect","Poison"]},{"id":"546","name":"Cottonee","type":["Grass","Fairy"]},{"id":"547","name":"Whimsicott","type":["Grass","Fairy"]},{"id":"548","name":"Petilil","type":["Grass"]},{"id":"549","name":"Lilligant","type":["Grass"]},{"id":"550","name":"Basculin","type":["Water"]},{"id":"551","name":"Sandile","type":["Ground","Dark"]},{"id":"552","name":"Krokorok","type":["Ground","Dark"]},{"id":"553","name":"Krookodile","type":["Ground","Dark"]},{"id":"554","name":"Darumaka","type":["Fire"]},{"id":"555","name":"Darmanitan","type":["Fire"]},{"id":"556","name":"Maractus","type":["Grass"]},{"id":"557","name":"Dwebble","type":["insect","Rock"]},{"id":"558","name":"Crustle","type":["insect","Rock"]},{"id":"559","name":"Scraggy","type":["Dark","Fighting"]},{"id":"560","name":"Scrafty","type":["Dark","Fighting"]},{"id":"561","name":"Sigilyph","type":["Psychic","Flying"]},{"id":"562","name":"Yamask","type":["Ghost"]},{"id":"563","name":"Cofagrigus","type":["Ghost"]},{"id":"564","name":"Tirtouga","type":["Water","Rock"]},{"id":"565","name":"Carracosta","type":["Water","Rock"]},{"id":"566","name":"Archen","type":["Rock","Flying"]},{"id":"567","name":"Archeops","type":["Rock","Flying"]},{"id":"568","name":"Trubbish","type":["Poison"]},{"id":"569","name":"Garbodor","type":["Poison"]},{"id":"570","name":"Zorua","type":["Dark"]},{"id":"571","name":"Zoroark","type":["Dark"]},{"id":"572","name":"Minccino","type":["Normal"]},{"id":"573","name":"Cinccino","type":["Normal"]},{"id":"574","name":"Gothita","type":["Psychic"]},{"id":"575","name":"Gothorita","type":["Psychic"]},{"id":"576","name":"Gothitelle","type":["Psychic"]},{"id":"577","name":"Solosis","type":["Psychic"]},{"id":"578","name":"Duosion","type":["Psychic"]},{"id":"579","name":"Reuniclus","type":["Psychic"]},{"id":"580","name":"Ducklett","type":["Water","Flying"]},{"id":"581","name":"Swanna","type":["Water","Flying"]},{"id":"582","name":"Vanillite","type":["Ice"]},{"id":"583","name":"Vanillish","type":["Ice"]},{"id":"584","name":"Vanilluxe","type":["Ice"]},{"id":"585","name":"Deerling","type":["Normal","Grass"]},{"id":"586","name":"Sawsbuck","type":["Normal","Grass"]},{"id":"587","name":"Emolga","type":["Electric","Flying"]},{"id":"588","name":"Karrablast","type":["insect"]},{"id":"589","name":"Escavalier","type":["insect","Steel"]},{"id":"590","name":"Foongus","type":["Grass","Poison"]},{"id":"591","name":"Amoonguss","type":["Grass","Poison"]},{"id":"592","name":"Frillish","type":["Water","Ghost"]},{"id":"593","name":"Jellicent","type":["Water","Ghost"]},{"id":"594","name":"Alomomola","type":["Water"]},{"id":"595","name":"Joltik","type":["insect","Electric"]},{"id":"596","name":"Galvantula","type":["insect","Electric"]},{"id":"597","name":"Ferroseed","type":["Grass","Steel"]},{"id":"598","name":"Ferrothorn","type":["Grass","Steel"]},{"id":"599","name":"Klink","type":["Steel"]},{"id":"600","name":"Klang","type":["Steel"]},{"id":"601","name":"Klinklang","type":["Steel"]},{"id":"602","name":"Tynamo","type":["Electric"]},{"id":"603","name":"Eelektrik","type":["Electric"]},{"id":"604","name":"Eelektross","type":["Electric"]},{"id":"605","name":"Elgyem","type":["Psychic"]},{"id":"606","name":"Beheeyem","type":["Psychic"]},{"id":"607","name":"Litwick","type":["Ghost","Fire"]},{"id":"608","name":"Lampent","type":["Ghost","Fire"]},{"id":"609","name":"Chandelure","type":["Ghost","Fire"]},{"id":"610","name":"Axew","type":["Dragon"]},{"id":"611","name":"Fraxure","type":["Dragon"]},{"id":"612","name":"Haxorus","type":["Dragon"]},{"id":"613","name":"Cubchoo","type":["Ice"]},{"id":"614","name":"Beartic","type":["Ice"]},{"id":"615","name":"Cryogonal","type":["Ice"]},{"id":"616","name":"Shelmet","type":["insect"]},{"id":"617","name":"Accelgor","type":["insect"]},{"id":"618","name":"Stunfisk","type":["Ground","Electric"]},{"id":"619","name":"Mienfoo","type":["Fighting"]},{"id":"620","name":"Mienshao","type":["Fighting"]},{"id":"621","name":"Druddigon","type":["Dragon"]},{"id":"622","name":"Golett","type":["Ground","Ghost"]},{"id":"623","name":"Golurk","type":["Ground","Ghost"]},{"id":"624","name":"Pawniard","type":["Dark","Steel"]},{"id":"625","name":"Bisharp","type":["Dark","Steel"]},{"id":"626","name":"Bouffalant","type":["Normal"]},{"id":"627","name":"Rufflet","type":["Normal","Flying"]},{"id":"628","name":"Braviary","type":["Normal","Flying"]},{"id":"629","name":"Vullaby","type":["Dark","Flying"]},{"id":"630","name":"Mandibuzz","type":["Dark","Flying"]},{"id":"631","name":"Heatmor","type":["Fire"]},{"id":"632","name":"Durant","type":["insect","Steel"]},{"id":"633","name":"Deino","type":["Dark","Dragon"]},{"id":"634","name":"Zweilous","type":["Dark","Dragon"]},{"id":"635","name":"Hydreigon","type":["Dark","Dragon"]},{"id":"636","name":"Larvesta","type":["insect","Fire"]},{"id":"637","name":"Volcarona","type":["insect","Fire"]},{"id":"638","name":"Cobalion","type":["Steel","Fighting"]},{"id":"639","name":"Terrakion","type":["Rock","Fighting"]},{"id":"640","name":"Virizion","type":["Grass","Fighting"]},{"id":"641","name":"Tornadus","type":["Flying"]},{"id":"642","name":"Thundurus","type":["Electric","Flying"]},{"id":"643","name":"Reshiram","type":["Dragon","Fire"]},{"id":"644","name":"Zekrom","type":["Dragon","Electric"]},{"id":"645","name":"Landorus","type":["Ground","Flying"]},{"id":"646","name":"Kyurem","type":["Dragon","Ice"]},{"id":"647","name":"Keldeo","type":["Water","Fighting"]},{"id":"648","name":"Meloetta","type":["Normal","Psychic"]},{"id":"649","name":"Genesect","type":["insect","Steel"]},{"id":"650","name":"Chespin","type":["Grass"]},{"id":"651","name":"Quilladin","type":["Grass"]},{"id":"652","name":"Chesnaught","type":["Grass","Fighting"]},{"id":"653","name":"Fennekin","type":["Fire"]},{"id":"654","name":"Braixen","type":["Fire"]},{"id":"655","name":"Delphox","type":["Fire","Psychic"]},{"id":"656","name":"Froakie","type":["Water"]},{"id":"657","name":"Frogadier","type":["Water"]},{"id":"658","name":"Greninja","type":["Water","Dark"]},{"id":"659","name":"Bunnelby","type":["Normal"]},{"id":"660","name":"Diggersby","type":["Normal","Ground"]},{"id":"661","name":"Fletchling","type":["Normal","Flying"]},{"id":"662","name":"Fletchinder","type":["Fire","Flying"]},{"id":"663","name":"Talonflame","type":["Fire","Flying"]},{"id":"664","name":"Scatterbug","type":["insect"]},{"id":"665","name":"Spewpa","type":["insect"]},{"id":"666","name":"Vivillon","type":["insect","Flying"]},{"id":"667","name":"Litleo","type":["Fire","Normal"]},{"id":"668","name":"Pyroar","type":["Fire","Normal"]},{"id":"669","name":"Flabébé","type":["Fairy"]},{"id":"670","name":"Floette","type":["Fairy"]},{"id":"671","name":"Florges","type":["Fairy"]},{"id":"672","name":"Skiddo","type":["Grass"]},{"id":"673","name":"Gogoat","type":["Grass"]},{"id":"674","name":"Pancham","type":["Fighting"]},{"id":"675","name":"Pangoro","type":["Fighting","Dark"]},{"id":"676","name":"Furfrou","type":["Normal"]},{"id":"677","name":"Espurr","type":["Psychic"]},{"id":"678","name":"Meowstic","type":["Psychic"]},{"id":"679","name":"Honedge","type":["Steel","Ghost"]},{"id":"680","name":"Doublade","type":["Steel","Ghost"]},{"id":"681","name":"Aegislash","type":["Steel","Ghost"]},{"id":"682","name":"Spritzee","type":["Fairy"]},{"id":"683","name":"Aromatisse","type":["Fairy"]},{"id":"684","name":"Swirlix","type":["Fairy"]},{"id":"685","name":"Slurpuff","type":["Fairy"]},{"id":"686","name":"Inkay","type":["Dark","Psychic"]},{"id":"687","name":"Malamar","type":["Dark","Psychic"]},{"id":"688","name":"Binacle","type":["Rock","Water"]},{"id":"689","name":"Barbaracle","type":["Rock","Water"]},{"id":"690","name":"Skrelp","type":["Poison","Water"]},{"id":"691","name":"Dragalge","type":["Poison","Dragon"]},{"id":"692","name":"Clauncher","type":["Water"]},{"id":"693","name":"Clawitzer","type":["Water"]},{"id":"694","name":"Helioptile","type":["Electric","Normal"]},{"id":"695","name":"Heliolisk","type":["Electric","Normal"]},{"id":"696","name":"Tyrunt","type":["Rock","Dragon"]},{"id":"697","name":"Tyrantrum","type":["Rock","Dragon"]},{"id":"698","name":"Amaura","type":["Rock","Ice"]},{"id":"699","name":"Aurorus","type":["Rock","Ice"]},{"id":"700","name":"Sylveon","type":["Fairy"]},{"id":"701","name":"Hawlucha","type":["Fighting","Flying"]},{"id":"702","name":"Dedenne","type":["Electric","Fairy"]},{"id":"703","name":"Carbink","type":["Rock","Fairy"]},{"id":"704","name":"Goomy","type":["Dragon"]},{"id":"705","name":"Sliggoo","type":["Dragon"]},{"id":"706","name":"Goodra","type":["Dragon"]},{"id":"707","name":"Klefki","type":["Steel","Fairy"]},{"id":"708","name":"Phantump","type":["Ghost","Grass"]},{"id":"709","name":"Trevenant","type":["Ghost","Grass"]},{"id":"710","name":"Pumpkaboo","type":["Ghost","Grass"]},{"id":"711","name":"Gourgeist","type":["Ghost","Grass"]},{"id":"712","name":"Bergmite","type":["Ice"]},{"id":"713","name":"Avalugg","type":["Ice"]},{"id":"714","name":"Noibat","type":["Flying","Dragon"]},{"id":"715","name":"Noivern","type":["Flying","Dragon"]},{"id":"716","name":"Xerneas","type":["Fairy"]},{"id":"717","name":"Yveltal","type":["Dark","Flying"]},{"id":"718","name":"Zygarde","type":["Dragon","Ground"]},{"id":"719","name":"Diancie","type":["Rock","Fairy"]},{"id":"720","name":"Hoopa","type":["Psychic","Ghost"]},{"id":"721","name":"Volcanion","type":["Fire","Water"]}]')
	for i, v in pairs(teste) do
		if v ~= nil then
			if v.name ~= nil then
				if v.name == "Uxie" then
					break
				end
				local info = getPlayerDexInfo(cid, v.name)
				if info then	
					local d = "0"
					local c = "0"
					if info.dex == 1 then
						d = "1"
					end
					if info.catch == 1 then
						c = "1"
					end
					str = str..d.."-"..c.."|"
				end
			end
		end
	end
	return str
end

function getPlayerDexCount(cid)
	local num = 0
	local teste = json.decode('[{"id":"001","name":"Bulbasaur","type":["Grass","Poison"]},{"id":"002","name":"Ivysaur","type":["Grass","Poison"]},{"id":"003","name":"Venusaur","type":["Grass","Poison"]},{"id":"004","name":"Charmander","type":["Fire"]},{"id":"005","name":"Charmeleon","type":["Fire"]},{"id":"006","name":"Charizard","type":["Fire","Flying"]},{"id":"007","name":"Squirtle","type":["Water"]},{"id":"008","name":"Wartortle","type":["Water"]},{"id":"009","name":"Blastoise","type":["Water"]},{"id":"010","name":"Caterpie","type":["insect"]},{"id":"011","name":"Metapod","type":["insect"]},{"id":"012","name":"Butterfree","type":["insect","Flying"]},{"id":"013","name":"Weedle","type":["insect","Poison"]},{"id":"014","name":"Kakuna","type":["insect","Poison"]},{"id":"015","name":"Beedrill","type":["insect","Poison"]},{"id":"016","name":"Pidgey","type":["Normal","Flying"]},{"id":"017","name":"Pidgeotto","type":["Normal","Flying"]},{"id":"018","name":"Pidgeot","type":["Normal","Flying"]},{"id":"019","name":"Rattata","type":["Normal"]},{"id":"020","name":"Raticate","type":["Normal"]},{"id":"021","name":"Spearow","type":["Normal","Flying"]},{"id":"022","name":"Fearow","type":["Normal","Flying"]},{"id":"023","name":"Ekans","type":["Poison"]},{"id":"024","name":"Arbok","type":["Poison"]},{"id":"025","name":"Pikachu","type":["Electric"]},{"id":"026","name":"Raichu","type":["Electric"]},{"id":"027","name":"Sandshrew","type":["Ground"]},{"id":"028","name":"Sandslash","type":["Ground"]},{"id":"029","name":"Nidoran_f","type":["Poison"]},{"id":"030","name":"Nidorina","type":["Poison"]},{"id":"031","name":"Nidoqueen","type":["Poison","Ground"]},{"id":"032","name":"Nidoran_m","type":["Poison"]},{"id":"033","name":"Nidorino","type":["Poison"]},{"id":"034","name":"Nidoking","type":["Poison","Ground"]},{"id":"035","name":"Clefairy","type":["Fairy"]},{"id":"036","name":"Clefable","type":["Fairy"]},{"id":"037","name":"Vulpix","type":["Fire"]},{"id":"038","name":"Ninetales","type":["Fire"]},{"id":"039","name":"Jigglypuff","type":["Normal","Fairy"]},{"id":"040","name":"Wigglytuff","type":["Normal","Fairy"]},{"id":"041","name":"Zubat","type":["Poison","Flying"]},{"id":"042","name":"Golbat","type":["Poison","Flying"]},{"id":"043","name":"Oddish","type":["Grass","Poison"]},{"id":"044","name":"Gloom","type":["Grass","Poison"]},{"id":"045","name":"Vileplume","type":["Grass","Poison"]},{"id":"046","name":"Paras","type":["insect","Grass"]},{"id":"047","name":"Parasect","type":["insect","Grass"]},{"id":"048","name":"Venonat","type":["insect","Poison"]},{"id":"049","name":"Venomoth","type":["insect","Poison"]},{"id":"050","name":"Diglett","type":["Ground"]},{"id":"051","name":"Dugtrio","type":["Ground"]},{"id":"052","name":"Meowth","type":["Normal"]},{"id":"053","name":"Persian","type":["Normal"]},{"id":"054","name":"Psyduck","type":["Water"]},{"id":"055","name":"Golduck","type":["Water"]},{"id":"056","name":"Mankey","type":["Fighting"]},{"id":"057","name":"Primeape","type":["Fighting"]},{"id":"058","name":"Growlithe","type":["Fire"]},{"id":"059","name":"Arcanine","type":["Fire"]},{"id":"060","name":"Poliwag","type":["Water"]},{"id":"061","name":"Poliwhirl","type":["Water"]},{"id":"062","name":"Poliwrath","type":["Water","Fighting"]},{"id":"063","name":"Abra","type":["Psychic"]},{"id":"064","name":"Kadabra","type":["Psychic"]},{"id":"065","name":"Alakazam","type":["Psychic"]},{"id":"066","name":"Machop","type":["Fighting"]},{"id":"067","name":"Machoke","type":["Fighting"]},{"id":"068","name":"Machamp","type":["Fighting"]},{"id":"069","name":"Bellsprout","type":["Grass","Poison"]},{"id":"070","name":"Weepinbell","type":["Grass","Poison"]},{"id":"071","name":"Victreebel","type":["Grass","Poison"]},{"id":"072","name":"Tentacool","type":["Water","Poison"]},{"id":"073","name":"Tentacruel","type":["Water","Poison"]},{"id":"074","name":"Geodude","type":["Rock","Ground"]},{"id":"075","name":"Graveler","type":["Rock","Ground"]},{"id":"076","name":"Golem","type":["Rock","Ground"]},{"id":"077","name":"Ponyta","type":["Fire"]},{"id":"078","name":"Rapidash","type":["Fire"]},{"id":"079","name":"Slowpoke","type":["Water","Psychic"]},{"id":"080","name":"Slowbro","type":["Water","Psychic"]},{"id":"081","name":"Magnemite","type":["Electric","Steel"]},{"id":"082","name":"Magneton","type":["Electric","Steel"]},{"id":"083","name":"Farfetch_d","type":["Normal","Flying"]},{"id":"084","name":"Doduo","type":["Normal","Flying"]},{"id":"085","name":"Dodrio","type":["Normal","Flying"]},{"id":"086","name":"Seel","type":["Water"]},{"id":"087","name":"Dewgong","type":["Water","Ice"]},{"id":"088","name":"Grimer","type":["Poison"]},{"id":"089","name":"Muk","type":["Poison"]},{"id":"090","name":"Shellder","type":["Water"]},{"id":"091","name":"Cloyster","type":["Water","Ice"]},{"id":"092","name":"Gastly","type":["Ghost","Poison"]},{"id":"093","name":"Haunter","type":["Ghost","Poison"]},{"id":"094","name":"Gengar","type":["Ghost","Poison"]},{"id":"095","name":"Onix","type":["Rock","Ground"]},{"id":"096","name":"Drowzee","type":["Psychic"]},{"id":"097","name":"Hypno","type":["Psychic"]},{"id":"098","name":"Krabby","type":["Water"]},{"id":"099","name":"Kingler","type":["Water"]},{"id":"100","name":"Voltorb","type":["Electric"]},{"id":"101","name":"Electrode","type":["Electric"]},{"id":"102","name":"Exeggcute","type":["Grass","Psychic"]},{"id":"103","name":"Exeggutor","type":["Grass","Psychic"]},{"id":"104","name":"Cubone","type":["Ground"]},{"id":"105","name":"Marowak","type":["Ground"]},{"id":"106","name":"Hitmonlee","type":["Fighting"]},{"id":"107","name":"Hitmonchan","type":["Fighting"]},{"id":"108","name":"Lickitung","type":["Normal"]},{"id":"109","name":"Koffing","type":["Poison"]},{"id":"110","name":"Weezing","type":["Poison"]},{"id":"111","name":"Rhyhorn","type":["Ground","Rock"]},{"id":"112","name":"Rhydon","type":["Ground","Rock"]},{"id":"113","name":"Chansey","type":["Normal"]},{"id":"114","name":"Tangela","type":["Grass"]},{"id":"115","name":"Kangaskhan","type":["Normal"]},{"id":"116","name":"Horsea","type":["Water"]},{"id":"117","name":"Seadra","type":["Water"]},{"id":"118","name":"Goldeen","type":["Water"]},{"id":"119","name":"Seaking","type":["Water"]},{"id":"120","name":"Staryu","type":["Water"]},{"id":"121","name":"Starmie","type":["Water","Psychic"]},{"id":"122","name":"Mr_Mime","type":["Psychic","Fairy"]},{"id":"123","name":"Scyther","type":["insect","Flying"]},{"id":"124","name":"Jynx","type":["Ice","Psychic"]},{"id":"125","name":"Electabuzz","type":["Electric"]},{"id":"126","name":"Magmar","type":["Fire"]},{"id":"127","name":"Pinsir","type":["insect"]},{"id":"128","name":"Tauros","type":["Normal"]},{"id":"129","name":"Magikarp","type":["Water"]},{"id":"130","name":"Gyarados","type":["Water","Flying"]},{"id":"131","name":"Lapras","type":["Water","Ice"]},{"id":"132","name":"Ditto","type":["Normal"]},{"id":"133","name":"Eevee","type":["Normal"]},{"id":"134","name":"Vaporeon","type":["Water"]},{"id":"135","name":"Jolteon","type":["Electric"]},{"id":"136","name":"Flareon","type":["Fire"]},{"id":"137","name":"Porygon","type":["Normal"]},{"id":"138","name":"Omanyte","type":["Rock","Water"]},{"id":"139","name":"Omastar","type":["Rock","Water"]},{"id":"140","name":"Kabuto","type":["Rock","Water"]},{"id":"141","name":"Kabutops","type":["Rock","Water"]},{"id":"142","name":"Aerodactyl","type":["Rock","Flying"]},{"id":"143","name":"Snorlax","type":["Normal"]},{"id":"144","name":"Articuno","type":["Ice","Flying"]},{"id":"145","name":"Zapdos","type":["Electric","Flying"]},{"id":"146","name":"Moltres","type":["Fire","Flying"]},{"id":"147","name":"Dratini","type":["Dragon"]},{"id":"148","name":"Dragonair","type":["Dragon"]},{"id":"149","name":"Dragonite","type":["Dragon","Flying"]},{"id":"150","name":"Mewtwo","type":["Psychic"]},{"id":"151","name":"Mew","type":["Psychic"]},{"id":"152","name":"Chikorita","type":["Grass"]},{"id":"153","name":"Bayleef","type":["Grass"]},{"id":"154","name":"Meganium","type":["Grass"]},{"id":"155","name":"Cyndaquil","type":["Fire"]},{"id":"156","name":"Quilava","type":["Fire"]},{"id":"157","name":"Typhlosion","type":["Fire"]},{"id":"158","name":"Totodile","type":["Water"]},{"id":"159","name":"Croconaw","type":["Water"]},{"id":"160","name":"Feraligatr","type":["Water"]},{"id":"161","name":"Sentret","type":["Normal"]},{"id":"162","name":"Furret","type":["Normal"]},{"id":"163","name":"Hoothoot","type":["Normal","Flying"]},{"id":"164","name":"Noctowl","type":["Normal","Flying"]},{"id":"165","name":"Ledyba","type":["insect","Flying"]},{"id":"166","name":"Ledian","type":["insect","Flying"]},{"id":"167","name":"Spinarak","type":["insect","Poison"]},{"id":"168","name":"Ariados","type":["insect","Poison"]},{"id":"169","name":"Crobat","type":["Poison","Flying"]},{"id":"170","name":"Chinchou","type":["Water","Electric"]},{"id":"171","name":"Lanturn","type":["Water","Electric"]},{"id":"172","name":"Pichu","type":["Electric"]},{"id":"173","name":"Cleffa","type":["Fairy"]},{"id":"174","name":"Igglybuff","type":["Normal","Fairy"]},{"id":"175","name":"Togepi","type":["Fairy"]},{"id":"176","name":"Togetic","type":["Fairy","Flying"]},{"id":"177","name":"Natu","type":["Psychic","Flying"]},{"id":"178","name":"Xatu","type":["Psychic","Flying"]},{"id":"179","name":"Mareep","type":["Electric"]},{"id":"180","name":"Flaaffy","type":["Electric"]},{"id":"181","name":"Ampharos","type":["Electric"]},{"id":"182","name":"Bellossom","type":["Grass"]},{"id":"183","name":"Marill","type":["Water","Fairy"]},{"id":"184","name":"Azumarill","type":["Water","Fairy"]},{"id":"185","name":"Sudowoodo","type":["Rock"]},{"id":"186","name":"Politoed","type":["Water"]},{"id":"187","name":"Hoppip","type":["Grass","Flying"]},{"id":"188","name":"Skiploom","type":["Grass","Flying"]},{"id":"189","name":"Jumpluff","type":["Grass","Flying"]},{"id":"190","name":"Aipom","type":["Normal"]},{"id":"191","name":"Sunkern","type":["Grass"]},{"id":"192","name":"Sunflora","type":["Grass"]},{"id":"193","name":"Yanma","type":["insect","Flying"]},{"id":"194","name":"Wooper","type":["Water","Ground"]},{"id":"195","name":"Quagsire","type":["Water","Ground"]},{"id":"196","name":"Espeon","type":["Psychic"]},{"id":"197","name":"Umbreon","type":["Dark"]},{"id":"198","name":"Murkrow","type":["Dark","Flying"]},{"id":"199","name":"Slowking","type":["Water","Psychic"]},{"id":"200","name":"Misdreavus","type":["Ghost"]},{"id":"201","name":"Unown","type":["Psychic"]},{"id":"202","name":"Wobbuffet","type":["Psychic"]},{"id":"203","name":"Girafarig","type":["Normal","Psychic"]},{"id":"204","name":"Pineco","type":["insect"]},{"id":"205","name":"Forretress","type":["insect","Steel"]},{"id":"206","name":"Dunsparce","type":["Normal"]},{"id":"207","name":"Gligar","type":["Ground","Flying"]},{"id":"208","name":"Steelix","type":["Steel","Ground"]},{"id":"209","name":"Snubbull","type":["Fairy"]},{"id":"210","name":"Granbull","type":["Fairy"]},{"id":"211","name":"Qwilfish","type":["Water","Poison"]},{"id":"212","name":"Scizor","type":["insect","Steel"]},{"id":"213","name":"Shuckle","type":["insect","Rock"]},{"id":"214","name":"Heracross","type":["insect","Fighting"]},{"id":"215","name":"Sneasel","type":["Dark","Ice"]},{"id":"216","name":"Teddiursa","type":["Normal"]},{"id":"217","name":"Ursaring","type":["Normal"]},{"id":"218","name":"Slugma","type":["Fire"]},{"id":"219","name":"Magcargo","type":["Fire","Rock"]},{"id":"220","name":"Swinub","type":["Ice","Ground"]},{"id":"221","name":"Piloswine","type":["Ice","Ground"]},{"id":"222","name":"Corsola","type":["Water","Rock"]},{"id":"223","name":"Remoraid","type":["Water"]},{"id":"224","name":"Octillery","type":["Water"]},{"id":"225","name":"Delibird","type":["Ice","Flying"]},{"id":"226","name":"Mantine","type":["Water","Flying"]},{"id":"227","name":"Skarmory","type":["Steel","Flying"]},{"id":"228","name":"Houndour","type":["Dark","Fire"]},{"id":"229","name":"Houndoom","type":["Dark","Fire"]},{"id":"230","name":"Kingdra","type":["Water","Dragon"]},{"id":"231","name":"Phanpy","type":["Ground"]},{"id":"232","name":"Donphan","type":["Ground"]},{"id":"233","name":"Porygon2","type":["Normal"]},{"id":"234","name":"Stantler","type":["Normal"]},{"id":"235","name":"Smeargle","type":["Normal"]},{"id":"236","name":"Tyrogue","type":["Fighting"]},{"id":"237","name":"Hitmontop","type":["Fighting"]},{"id":"238","name":"Smoochum","type":["Ice","Psychic"]},{"id":"239","name":"Elekid","type":["Electric"]},{"id":"240","name":"Magby","type":["Fire"]},{"id":"241","name":"Miltank","type":["Normal"]},{"id":"242","name":"Blissey","type":["Normal"]},{"id":"243","name":"Raikou","type":["Electric"]},{"id":"244","name":"Entei","type":["Fire"]},{"id":"245","name":"Suicune","type":["Water"]},{"id":"246","name":"Larvitar","type":["Rock","Ground"]},{"id":"247","name":"Pupitar","type":["Rock","Ground"]},{"id":"248","name":"Tyranitar","type":["Rock","Dark"]},{"id":"249","name":"Lugia","type":["Psychic","Flying"]},{"id":"250","name":"Ho_Oh","type":["Fire","Flying"]},{"id":"251","name":"Celebi","type":["Psychic","Grass"]},{"id":"252","name":"Treecko","type":["Grass"]},{"id":"253","name":"Grovyle","type":["Grass"]},{"id":"254","name":"Sceptile","type":["Grass"]},{"id":"255","name":"Torchic","type":["Fire"]},{"id":"256","name":"Combusken","type":["Fire","Fighting"]},{"id":"257","name":"Blaziken","type":["Fire","Fighting"]},{"id":"258","name":"Mudkip","type":["Water"]},{"id":"259","name":"Marshtomp","type":["Water","Ground"]},{"id":"260","name":"Swampert","type":["Water","Ground"]},{"id":"261","name":"Poochyena","type":["Dark"]},{"id":"262","name":"Mightyena","type":["Dark"]},{"id":"263","name":"Zigzagoon","type":["Normal"]},{"id":"264","name":"Linoone","type":["Normal"]},{"id":"265","name":"Wurmple","type":["insect"]},{"id":"266","name":"Silcoon","type":["insect"]},{"id":"267","name":"Beautifly","type":["insect","Flying"]},{"id":"268","name":"Cascoon","type":["insect"]},{"id":"269","name":"Dustox","type":["insect","Poison"]},{"id":"270","name":"Lotad","type":["Water","Grass"]},{"id":"271","name":"Lombre","type":["Water","Grass"]},{"id":"272","name":"Ludicolo","type":["Water","Grass"]},{"id":"273","name":"Seedot","type":["Grass"]},{"id":"274","name":"Nuzleaf","type":["Grass","Dark"]},{"id":"275","name":"Shiftry","type":["Grass","Dark"]},{"id":"276","name":"Nincada","type":["insect","Ground"]},{"id":"277","name":"Shedinja","type":["insect","Ghost"]},{"id":"278","name":"Ninjask","type":["insect","Flying"]},{"id":"279","name":"Taillow","type":["Normal","Flying"]},{"id":"280","name":"Swellow","type":["Normal","Flying"]},{"id":"281","name":"Shroomish","type":["Grass"]},{"id":"282","name":"Breloom","type":["Grass","Fighting"]},{"id":"283","name":"Spinda","type":["Normal"]},{"id":"284","name":"Wingull","type":["Water","Flying"]},{"id":"285","name":"Pelipper","type":["Water","Flying"]},{"id":"286","name":"Surskit","type":["insect","Water"]},{"id":"287","name":"Masquerain","type":["insect","Flying"]},{"id":"288","name":"Wailmer","type":["Water"]},{"id":"289","name":"Wailord","type":["Water"]},{"id":"290","name":"Skitty","type":["Normal"]},{"id":"291","name":"Delcatty","type":["Normal"]},{"id":"292","name":"Kecleon","type":["Normal"]},{"id":"293","name":"Baltoy","type":["Ground","Psychic"]},{"id":"294","name":"Claydol","type":["Ground","Psychic"]},{"id":"295","name":"Torkoal","type":["Fire"]},{"id":"296","name":"Sableye","type":["Dark","Ghost"]},{"id":"297","name":"Barboach","type":["Water","Ground"]},{"id":"298","name":"Whiscash","type":["Water","Ground"]},{"id":"299","name":"Luvdisc","type":["Water"]},{"id":"300","name":"Corphish","type":["Water"]},{"id":"301","name":"Crawdaunt","type":["Water","Dark"]},{"id":"302","name":"Feebas","type":["Water"]},{"id":"303","name":"Milotic","type":["Water"]},{"id":"304","name":"Carvanha","type":["Water","Dark"]},{"id":"305","name":"Sharpedo","type":["Water","Dark"]},{"id":"306","name":"Trapinch","type":["Ground"]},{"id":"307","name":"Vibrava","type":["Ground","Dragon"]},{"id":"308","name":"Flygon","type":["Ground","Dragon"]},{"id":"309","name":"Makuhita","type":["Fighting"]},{"id":"310","name":"Hariyama","type":["Fighting"]},{"id":"311","name":"Electrike","type":["Electric"]},{"id":"312","name":"Manectric","type":["Electric"]},{"id":"313","name":"Numel","type":["Fire","Ground"]},{"id":"314","name":"Camerupt","type":["Fire","Ground"]},{"id":"315","name":"Spheal","type":["Ice","Water"]},{"id":"316","name":"Sealeo","type":["Ice","Water"]},{"id":"317","name":"Walrein","type":["Ice","Water"]},{"id":"318","name":"Cacnea","type":["Grass"]},{"id":"319","name":"Cacturne","type":["Grass","Dark"]},{"id":"320","name":"Snorunt","type":["Ice"]},{"id":"321","name":"Glalie","type":["Ice"]},{"id":"322","name":"Lunatone","type":["Rock","Psychic"]},{"id":"323","name":"Solrock","type":["Rock","Psychic"]},{"id":"324","name":"Azurill","type":["Normal","Fairy"]},{"id":"325","name":"Spoink","type":["Psychic"]},{"id":"326","name":"Grumpig","type":["Psychic"]},{"id":"327","name":"Plusle","type":["Electric"]},{"id":"328","name":"Minun","type":["Electric"]},{"id":"329","name":"Mawile","type":["Steel","Fairy"]},{"id":"330","name":"Medicham","type":["Fighting","Psychic"]},{"id":"331","name":"Swablu","type":["Normal","Flying"]},{"id":"332","name":"Altaria","type":["Dragon","Flying"]},{"id":"333","name":"Wynaut","type":["Psychic"]},{"id":"334","name":"Wynaut","type":["Psychic"]},{"id":"335","name":"Duskull","type":["Ghost"]},{"id":"336","name":"Dusclops","type":["Ghost"]},{"id":"337","name":"Roselia","type":["Grass","Poison"]},{"id":"338","name":"Slakoth","type":["Normal"]},{"id":"339","name":"Vigoroth","type":["Normal"]},{"id":"340","name":"Slaking","type":["Normal"]},{"id":"341","name":"Gulpin","type":["Poison"]},{"id":"342","name":"Swalot","type":["Poison"]},{"id":"343","name":"Tropius","type":["Grass","Flying"]},{"id":"344","name":"Whismur","type":["Normal"]},{"id":"345","name":"Loudred","type":["Normal"]},{"id":"346","name":"Exploud","type":["Normal"]},{"id":"347","name":"Clamperl","type":["Water"]},{"id":"348","name":"Huntail","type":["Water"]},{"id":"349","name":"Gorebyss","type":["Water"]},{"id":"350","name":"Absol","type":["Dark"]},{"id":"351","name":"Shuppet","type":["Ghost"]},{"id":"352","name":"Banette","type":["Ghost"]},{"id":"353","name":"Seviper","type":["Poison"]},{"id":"354","name":"Zangoose","type":["Normal"]},{"id":"355","name":"Relicanth","type":["Water","Rock"]},{"id":"356","name":"Aron","type":["Steel","Rock"]},{"id":"357","name":"Lairon","type":["Steel","Rock"]},{"id":"358","name":"Aggron","type":["Steel","Rock"]},{"id":"359","name":"Castform","type":["Normal"]},{"id":"360","name":"Volbeat","type":["insect"]},{"id":"361","name":"Illumise","type":["insect"]},{"id":"362","name":"Lileep","type":["Rock","Grass"]},{"id":"363","name":"Cradily","type":["Rock","Grass"]},{"id":"364","name":"Anorith","type":["Rock","insect"]},{"id":"365","name":"Armaldo","type":["Rock","insect"]},{"id":"366","name":"Ralts","type":["Psychic","Fairy"]},{"id":"367","name":"Kirlia","type":["Psychic","Fairy"]},{"id":"368","name":"Gardevoir","type":["Psychic","Fairy"]},{"id":"369","name":"Bagon","type":["Dragon"]},{"id":"370","name":"Shelgon","type":["Dragon"]},{"id":"371","name":"Salamence","type":["Dragon","Flying"]},{"id":"372","name":"Beldum","type":["Steel","Psychic"]},{"id":"373","name":"Metang","type":["Steel","Psychic"]},{"id":"374","name":"Metagross","type":["Steel","Psychic"]},{"id":"375","name":"Regirock","type":["Rock"]},{"id":"376","name":"Nosepass","type":["Rock"]},{"id":"377","name":"Meditite","type":["Fighting","Psychic"]},{"id":"378","name":"Chimecho","type":["Psychic"]},{"id":"379","name":"Regice","type":["Ice"]},{"id":"380","name":"Registeel","type":["Steel"]},{"id":"381","name":"Latias","type":["Dragon","Psychic"]},{"id":"382","name":"Latios","type":["Dragon","Psychic"]},{"id":"383","name":"Kyogre","type":["Water"]},{"id":"384","name":"Groudon","type":["Ground"]},{"id":"385","name":"Rayquaza","type":["Dragon","Flying"]},{"id":"386","name":"Jirachi","type":["Steel","Psychic"]},{"id":"387","name":"Deoxys","type":["Psychic"]},{"id":"388","name":"Turtwig","type":["Grass"]},{"id":"388","name":"Grotle","type":["Grass"]},{"id":"389","name":"Torterra","type":["Grass","Ground"]},{"id":"390","name":"Chimchar","type":["Fire"]},{"id":"391","name":"Monferno","type":["Fire","Fighting"]},{"id":"392","name":"Infernape","type":["Fire","Fighting"]},{"id":"393","name":"Piplup","type":["Water"]},{"id":"394","name":"Prinplup","type":["Water"]},{"id":"395","name":"Empoleon","type":["Water","Steel"]},{"id":"396","name":"Starly","type":["Normal","Flying"]},{"id":"397","name":"Staravia","type":["Normal","Flying"]},{"id":"398","name":"Staraptor","type":["Normal","Flying"]},{"id":"399","name":"Bidoof","type":["Normal"]},{"id":"400","name":"Bibarel","type":["Normal","Water"]},{"id":"401","name":"Kricketot","type":["insect"]},{"id":"402","name":"Kricketune","type":["insect"]},{"id":"403","name":"Shinx","type":["Electric"]},{"id":"404","name":"Luxio","type":["Electric"]},{"id":"405","name":"Luxray","type":["Electric"]},{"id":"406","name":"Budew","type":["Grass","Poison"]},{"id":"407","name":"Roserade","type":["Grass","Poison"]},{"id":"408","name":"Cranidos","type":["Rock"]},{"id":"409","name":"Rampardos","type":["Rock"]},{"id":"410","name":"Shieldon","type":["Rock","Steel"]},{"id":"411","name":"Bastiodon","type":["Rock","Steel"]},{"id":"412","name":"Burmy","type":["insect"]},{"id":"413","name":"Wormadam","type":["insect","Grass"]},{"id":"414","name":"Mothim","type":["insect","Flying"]},{"id":"415","name":"Combee","type":["insect","Flying"]},{"id":"416","name":"Vespiquen","type":["insect","Flying"]},{"id":"417","name":"Pachirisu","type":["Electric"]},{"id":"418","name":"Buizel","type":["Water"]},{"id":"419","name":"Floatzel","type":["Water"]},{"id":"420","name":"Cherubi","type":["Grass"]},{"id":"421","name":"Cherrim","type":["Grass"]},{"id":"422","name":"Shellos","type":["Water"]},{"id":"423","name":"Gastrodon","type":["Water","Ground"]},{"id":"424","name":"Ambipom","type":["Normal"]},{"id":"425","name":"Drifloon","type":["Ghost","Flying"]},{"id":"426","name":"Drifblim","type":["Ghost","Flying"]},{"id":"427","name":"Buneary","type":["Normal"]},{"id":"428","name":"Lopunny","type":["Normal"]},{"id":"429","name":"Mismagius","type":["Ghost"]},{"id":"430","name":"Honchkrow","type":["Dark","Flying"]},{"id":"431","name":"Glameow","type":["Normal"]},{"id":"432","name":"Purugly","type":["Normal"]},{"id":"433","name":"Chingling","type":["Psychic"]},{"id":"434","name":"Stunky","type":["Poison","Dark"]},{"id":"435","name":"Skuntank","type":["Poison","Dark"]},{"id":"436","name":"Bronzor","type":["Steel","Psychic"]},{"id":"437","name":"Bronzong","type":["Steel","Psychic"]},{"id":"438","name":"Bonsly","type":["Rock"]},{"id":"439","name":"Mime_Jr","type":["Psychic","Fairy"]},{"id":"440","name":"Happiny","type":["Normal"]},{"id":"441","name":"Chatot","type":["Normal","Flying"]},{"id":"442","name":"Spiritomb","type":["Ghost","Dark"]},{"id":"443","name":"Gible","type":["Dragon","Ground"]},{"id":"444","name":"Gabite","type":["Dragon","Ground"]},{"id":"445","name":"Garchomp","type":["Dragon","Ground"]},{"id":"446","name":"Munchlax","type":["Normal"]},{"id":"447","name":"Riolu","type":["Fighting"]},{"id":"448","name":"Lucario","type":["Fighting","Steel"]},{"id":"449","name":"Hippopotas","type":["Ground"]},{"id":"450","name":"Hippowdon","type":["Ground"]},{"id":"451","name":"Skorupi","type":["Poison","insect"]},{"id":"452","name":"Drapion","type":["Poison","Dark"]},{"id":"453","name":"Croagunk","type":["Poison","Fighting"]},{"id":"454","name":"Toxicroak","type":["Poison","Fighting"]},{"id":"455","name":"Carnivine","type":["Grass"]},{"id":"456","name":"Finneon","type":["Water"]},{"id":"457","name":"Lumineon","type":["Water"]},{"id":"458","name":"Mantyke","type":["Water","Flying"]},{"id":"459","name":"Snover","type":["Grass","Ice"]},{"id":"460","name":"Abomasnow","type":["Grass","Ice"]},{"id":"461","name":"Weavile","type":["Dark","Ice"]},{"id":"462","name":"Magnezone","type":["Electric","Steel"]},{"id":"463","name":"Lickilicky","type":["Normal"]},{"id":"464","name":"Rhyperior","type":["Ground","Rock"]},{"id":"465","name":"Tangrowth","type":["Grass"]},{"id":"466","name":"Electivire","type":["Electric"]},{"id":"467","name":"Magmortar","type":["Fire"]},{"id":"468","name":"Togekiss","type":["Fairy","Flying"]},{"id":"469","name":"Yanmega","type":["insect","Flying"]},{"id":"470","name":"Leafeon","type":["Grass"]},{"id":"471","name":"Glaceon","type":["Ice"]},{"id":"472","name":"Gliscor","type":["Ground","Flying"]},{"id":"473","name":"Mamoswine","type":["Ice","Ground"]},{"id":"474","name":"Porygon_Z","type":["Normal"]},{"id":"475","name":"Gallade","type":["Psychic","Fighting"]},{"id":"476","name":"Probopass","type":["Rock","Steel"]},{"id":"477","name":"Dusknoir","type":["Ghost"]},{"id":"478","name":"Froslass","type":["Ice","Ghost"]},{"id":"479","name":"Rotom","type":["Electric","Ghost"]},{"id":"480","name":"Uxie","type":["Psychic"]},{"id":"481","name":"Mesprit","type":["Psychic"]},{"id":"482","name":"Azelf","type":["Psychic"]},{"id":"483","name":"Dialga","type":["Steel","Dragon"]},{"id":"484","name":"Palkia","type":["Water","Dragon"]},{"id":"485","name":"Heatran","type":["Fire","Steel"]},{"id":"486","name":"Regigigas","type":["Normal"]},{"id":"487","name":"Giratina","type":["Ghost","Dragon"]},{"id":"488","name":"Cresselia","type":["Psychic"]},{"id":"489","name":"Phione","type":["Water"]},{"id":"490","name":"Manaphy","type":["Water"]},{"id":"491","name":"Darkrai","type":["Dark"]},{"id":"492","name":"Shaymin","type":["Grass"]},{"id":"493","name":"Arceus","type":["Normal"]},{"id":"494","name":"Victini","type":["Psychic","Fire"]},{"id":"495","name":"Snivy","type":["Grass"]},{"id":"496","name":"Servine","type":["Grass"]},{"id":"497","name":"Serperior","type":["Grass"]},{"id":"498","name":"Tepig","type":["Fire"]},{"id":"499","name":"Pignite","type":["Fire","Fighting"]},{"id":"500","name":"Emboar","type":["Fire","Fighting"]},{"id":"501","name":"Oshawott","type":["Water"]},{"id":"502","name":"Dewott","type":["Water"]},{"id":"503","name":"Samurott","type":["Water"]},{"id":"504","name":"Patrat","type":["Normal"]},{"id":"505","name":"Watchog","type":["Normal"]},{"id":"506","name":"Lillipup","type":["Normal"]},{"id":"507","name":"Herdier","type":["Normal"]},{"id":"508","name":"Stoutland","type":["Normal"]},{"id":"509","name":"Purrloin","type":["Dark"]},{"id":"510","name":"Liepard","type":["Dark"]},{"id":"511","name":"Pansage","type":["Grass"]},{"id":"512","name":"Simisage","type":["Grass"]},{"id":"513","name":"Pansear","type":["Fire"]},{"id":"514","name":"Simisear","type":["Fire"]},{"id":"515","name":"Panpour","type":["Water"]},{"id":"516","name":"Simipour","type":["Water"]},{"id":"517","name":"Munna","type":["Psychic"]},{"id":"518","name":"Musharna","type":["Psychic"]},{"id":"519","name":"Pidove","type":["Normal","Flying"]},{"id":"520","name":"Tranquill","type":["Normal","Flying"]},{"id":"521","name":"Unfezant","type":["Normal","Flying"]},{"id":"522","name":"Blitzle","type":["Electric"]},{"id":"523","name":"Zebstrika","type":["Electric"]},{"id":"524","name":"Roggenrola","type":["Rock"]},{"id":"525","name":"Boldore","type":["Rock"]},{"id":"526","name":"Gigalith","type":["Rock"]},{"id":"527","name":"Woobat","type":["Psychic","Flying"]},{"id":"528","name":"Swoobat","type":["Psychic","Flying"]},{"id":"529","name":"Drilbur","type":["Ground"]},{"id":"530","name":"Excadrill","type":["Ground","Steel"]},{"id":"531","name":"Audino","type":["Normal"]},{"id":"532","name":"Timburr","type":["Fighting"]},{"id":"533","name":"Gurdurr","type":["Fighting"]},{"id":"534","name":"Conkeldurr","type":["Fighting"]},{"id":"535","name":"Tympole","type":["Water"]},{"id":"536","name":"Palpitoad","type":["Water","Ground"]},{"id":"537","name":"Seismitoad","type":["Water","Ground"]},{"id":"538","name":"Throh","type":["Fighting"]},{"id":"539","name":"Sawk","type":["Fighting"]},{"id":"540","name":"Sewaddle","type":["insect","Grass"]},{"id":"541","name":"Swadloon","type":["insect","Grass"]},{"id":"542","name":"Leavanny","type":["insect","Grass"]},{"id":"543","name":"Venipede","type":["insect","Poison"]},{"id":"544","name":"Whirlipede","type":["insect","Poison"]},{"id":"545","name":"Scolipede","type":["insect","Poison"]},{"id":"546","name":"Cottonee","type":["Grass","Fairy"]},{"id":"547","name":"Whimsicott","type":["Grass","Fairy"]},{"id":"548","name":"Petilil","type":["Grass"]},{"id":"549","name":"Lilligant","type":["Grass"]},{"id":"550","name":"Basculin","type":["Water"]},{"id":"551","name":"Sandile","type":["Ground","Dark"]},{"id":"552","name":"Krokorok","type":["Ground","Dark"]},{"id":"553","name":"Krookodile","type":["Ground","Dark"]},{"id":"554","name":"Darumaka","type":["Fire"]},{"id":"555","name":"Darmanitan","type":["Fire"]},{"id":"556","name":"Maractus","type":["Grass"]},{"id":"557","name":"Dwebble","type":["insect","Rock"]},{"id":"558","name":"Crustle","type":["insect","Rock"]},{"id":"559","name":"Scraggy","type":["Dark","Fighting"]},{"id":"560","name":"Scrafty","type":["Dark","Fighting"]},{"id":"561","name":"Sigilyph","type":["Psychic","Flying"]},{"id":"562","name":"Yamask","type":["Ghost"]},{"id":"563","name":"Cofagrigus","type":["Ghost"]},{"id":"564","name":"Tirtouga","type":["Water","Rock"]},{"id":"565","name":"Carracosta","type":["Water","Rock"]},{"id":"566","name":"Archen","type":["Rock","Flying"]},{"id":"567","name":"Archeops","type":["Rock","Flying"]},{"id":"568","name":"Trubbish","type":["Poison"]},{"id":"569","name":"Garbodor","type":["Poison"]},{"id":"570","name":"Zorua","type":["Dark"]},{"id":"571","name":"Zoroark","type":["Dark"]},{"id":"572","name":"Minccino","type":["Normal"]},{"id":"573","name":"Cinccino","type":["Normal"]},{"id":"574","name":"Gothita","type":["Psychic"]},{"id":"575","name":"Gothorita","type":["Psychic"]},{"id":"576","name":"Gothitelle","type":["Psychic"]},{"id":"577","name":"Solosis","type":["Psychic"]},{"id":"578","name":"Duosion","type":["Psychic"]},{"id":"579","name":"Reuniclus","type":["Psychic"]},{"id":"580","name":"Ducklett","type":["Water","Flying"]},{"id":"581","name":"Swanna","type":["Water","Flying"]},{"id":"582","name":"Vanillite","type":["Ice"]},{"id":"583","name":"Vanillish","type":["Ice"]},{"id":"584","name":"Vanilluxe","type":["Ice"]},{"id":"585","name":"Deerling","type":["Normal","Grass"]},{"id":"586","name":"Sawsbuck","type":["Normal","Grass"]},{"id":"587","name":"Emolga","type":["Electric","Flying"]},{"id":"588","name":"Karrablast","type":["insect"]},{"id":"589","name":"Escavalier","type":["insect","Steel"]},{"id":"590","name":"Foongus","type":["Grass","Poison"]},{"id":"591","name":"Amoonguss","type":["Grass","Poison"]},{"id":"592","name":"Frillish","type":["Water","Ghost"]},{"id":"593","name":"Jellicent","type":["Water","Ghost"]},{"id":"594","name":"Alomomola","type":["Water"]},{"id":"595","name":"Joltik","type":["insect","Electric"]},{"id":"596","name":"Galvantula","type":["insect","Electric"]},{"id":"597","name":"Ferroseed","type":["Grass","Steel"]},{"id":"598","name":"Ferrothorn","type":["Grass","Steel"]},{"id":"599","name":"Klink","type":["Steel"]},{"id":"600","name":"Klang","type":["Steel"]},{"id":"601","name":"Klinklang","type":["Steel"]},{"id":"602","name":"Tynamo","type":["Electric"]},{"id":"603","name":"Eelektrik","type":["Electric"]},{"id":"604","name":"Eelektross","type":["Electric"]},{"id":"605","name":"Elgyem","type":["Psychic"]},{"id":"606","name":"Beheeyem","type":["Psychic"]},{"id":"607","name":"Litwick","type":["Ghost","Fire"]},{"id":"608","name":"Lampent","type":["Ghost","Fire"]},{"id":"609","name":"Chandelure","type":["Ghost","Fire"]},{"id":"610","name":"Axew","type":["Dragon"]},{"id":"611","name":"Fraxure","type":["Dragon"]},{"id":"612","name":"Haxorus","type":["Dragon"]},{"id":"613","name":"Cubchoo","type":["Ice"]},{"id":"614","name":"Beartic","type":["Ice"]},{"id":"615","name":"Cryogonal","type":["Ice"]},{"id":"616","name":"Shelmet","type":["insect"]},{"id":"617","name":"Accelgor","type":["insect"]},{"id":"618","name":"Stunfisk","type":["Ground","Electric"]},{"id":"619","name":"Mienfoo","type":["Fighting"]},{"id":"620","name":"Mienshao","type":["Fighting"]},{"id":"621","name":"Druddigon","type":["Dragon"]},{"id":"622","name":"Golett","type":["Ground","Ghost"]},{"id":"623","name":"Golurk","type":["Ground","Ghost"]},{"id":"624","name":"Pawniard","type":["Dark","Steel"]},{"id":"625","name":"Bisharp","type":["Dark","Steel"]},{"id":"626","name":"Bouffalant","type":["Normal"]},{"id":"627","name":"Rufflet","type":["Normal","Flying"]},{"id":"628","name":"Braviary","type":["Normal","Flying"]},{"id":"629","name":"Vullaby","type":["Dark","Flying"]},{"id":"630","name":"Mandibuzz","type":["Dark","Flying"]},{"id":"631","name":"Heatmor","type":["Fire"]},{"id":"632","name":"Durant","type":["insect","Steel"]},{"id":"633","name":"Deino","type":["Dark","Dragon"]},{"id":"634","name":"Zweilous","type":["Dark","Dragon"]},{"id":"635","name":"Hydreigon","type":["Dark","Dragon"]},{"id":"636","name":"Larvesta","type":["insect","Fire"]},{"id":"637","name":"Volcarona","type":["insect","Fire"]},{"id":"638","name":"Cobalion","type":["Steel","Fighting"]},{"id":"639","name":"Terrakion","type":["Rock","Fighting"]},{"id":"640","name":"Virizion","type":["Grass","Fighting"]},{"id":"641","name":"Tornadus","type":["Flying"]},{"id":"642","name":"Thundurus","type":["Electric","Flying"]},{"id":"643","name":"Reshiram","type":["Dragon","Fire"]},{"id":"644","name":"Zekrom","type":["Dragon","Electric"]},{"id":"645","name":"Landorus","type":["Ground","Flying"]},{"id":"646","name":"Kyurem","type":["Dragon","Ice"]},{"id":"647","name":"Keldeo","type":["Water","Fighting"]},{"id":"648","name":"Meloetta","type":["Normal","Psychic"]},{"id":"649","name":"Genesect","type":["insect","Steel"]},{"id":"650","name":"Chespin","type":["Grass"]},{"id":"651","name":"Quilladin","type":["Grass"]},{"id":"652","name":"Chesnaught","type":["Grass","Fighting"]},{"id":"653","name":"Fennekin","type":["Fire"]},{"id":"654","name":"Braixen","type":["Fire"]},{"id":"655","name":"Delphox","type":["Fire","Psychic"]},{"id":"656","name":"Froakie","type":["Water"]},{"id":"657","name":"Frogadier","type":["Water"]},{"id":"658","name":"Greninja","type":["Water","Dark"]},{"id":"659","name":"Bunnelby","type":["Normal"]},{"id":"660","name":"Diggersby","type":["Normal","Ground"]},{"id":"661","name":"Fletchling","type":["Normal","Flying"]},{"id":"662","name":"Fletchinder","type":["Fire","Flying"]},{"id":"663","name":"Talonflame","type":["Fire","Flying"]},{"id":"664","name":"Scatterbug","type":["insect"]},{"id":"665","name":"Spewpa","type":["insect"]},{"id":"666","name":"Vivillon","type":["insect","Flying"]},{"id":"667","name":"Litleo","type":["Fire","Normal"]},{"id":"668","name":"Pyroar","type":["Fire","Normal"]},{"id":"669","name":"Flabébé","type":["Fairy"]},{"id":"670","name":"Floette","type":["Fairy"]},{"id":"671","name":"Florges","type":["Fairy"]},{"id":"672","name":"Skiddo","type":["Grass"]},{"id":"673","name":"Gogoat","type":["Grass"]},{"id":"674","name":"Pancham","type":["Fighting"]},{"id":"675","name":"Pangoro","type":["Fighting","Dark"]},{"id":"676","name":"Furfrou","type":["Normal"]},{"id":"677","name":"Espurr","type":["Psychic"]},{"id":"678","name":"Meowstic","type":["Psychic"]},{"id":"679","name":"Honedge","type":["Steel","Ghost"]},{"id":"680","name":"Doublade","type":["Steel","Ghost"]},{"id":"681","name":"Aegislash","type":["Steel","Ghost"]},{"id":"682","name":"Spritzee","type":["Fairy"]},{"id":"683","name":"Aromatisse","type":["Fairy"]},{"id":"684","name":"Swirlix","type":["Fairy"]},{"id":"685","name":"Slurpuff","type":["Fairy"]},{"id":"686","name":"Inkay","type":["Dark","Psychic"]},{"id":"687","name":"Malamar","type":["Dark","Psychic"]},{"id":"688","name":"Binacle","type":["Rock","Water"]},{"id":"689","name":"Barbaracle","type":["Rock","Water"]},{"id":"690","name":"Skrelp","type":["Poison","Water"]},{"id":"691","name":"Dragalge","type":["Poison","Dragon"]},{"id":"692","name":"Clauncher","type":["Water"]},{"id":"693","name":"Clawitzer","type":["Water"]},{"id":"694","name":"Helioptile","type":["Electric","Normal"]},{"id":"695","name":"Heliolisk","type":["Electric","Normal"]},{"id":"696","name":"Tyrunt","type":["Rock","Dragon"]},{"id":"697","name":"Tyrantrum","type":["Rock","Dragon"]},{"id":"698","name":"Amaura","type":["Rock","Ice"]},{"id":"699","name":"Aurorus","type":["Rock","Ice"]},{"id":"700","name":"Sylveon","type":["Fairy"]},{"id":"701","name":"Hawlucha","type":["Fighting","Flying"]},{"id":"702","name":"Dedenne","type":["Electric","Fairy"]},{"id":"703","name":"Carbink","type":["Rock","Fairy"]},{"id":"704","name":"Goomy","type":["Dragon"]},{"id":"705","name":"Sliggoo","type":["Dragon"]},{"id":"706","name":"Goodra","type":["Dragon"]},{"id":"707","name":"Klefki","type":["Steel","Fairy"]},{"id":"708","name":"Phantump","type":["Ghost","Grass"]},{"id":"709","name":"Trevenant","type":["Ghost","Grass"]},{"id":"710","name":"Pumpkaboo","type":["Ghost","Grass"]},{"id":"711","name":"Gourgeist","type":["Ghost","Grass"]},{"id":"712","name":"Bergmite","type":["Ice"]},{"id":"713","name":"Avalugg","type":["Ice"]},{"id":"714","name":"Noibat","type":["Flying","Dragon"]},{"id":"715","name":"Noivern","type":["Flying","Dragon"]},{"id":"716","name":"Xerneas","type":["Fairy"]},{"id":"717","name":"Yveltal","type":["Dark","Flying"]},{"id":"718","name":"Zygarde","type":["Dragon","Ground"]},{"id":"719","name":"Diancie","type":["Rock","Fairy"]},{"id":"720","name":"Hoopa","type":["Psychic","Ghost"]},{"id":"721","name":"Volcanion","type":["Fire","Water"]}]')
	for i, v in pairs(teste) do
		if v ~= nil then
			if v.name ~= nil then
				if v.name == "Uxie" then
					break
				end
				local info = getPlayerDexInfo(cid, v.name)
				if info then	
					if info.dex == 1 then
						num = num + 1
					end
				end
			end
		end
	end
	return num
end

function getPokemonEvolutionDescription(name, next)
	-- print(name)
	local stt = {}
	if specialEvo[name] then
		if name == "Poliwhirl" then
			if next then
				return "\nPoliwrath or Politoed, requires level 65."
			end 
			table.insert(stt, "Evolve Stone: Water Stone and Punch Stone (Poliwrath) or King's Rock (Politoed)\n\n")
			table.insert(stt, "Evolutions:\nPoliwrath, requires level 65.\nPolitoed, requires level 65.")
		elseif name == "Gloom" then
			if next then
				return "\nVileplume or Bellossom, requires level 50."
			end
			table.insert(stt, "Evolve Stone: 1 Leaf Stone and 1 Sun Stone (Bellossom) or Leaf Stone and Venom Stone (Vileplume)\n\n")
			table.insert(stt, "Evolutions:\nVileplume, requires level 50.\nBellossom, requires level 50.")
		elseif name == "Slowpoke" then
			if next then
				return "\nSlowbro, requires level 45.\nSlowking, requires level 100."
			end
			table.insert(stt, "Evolve Stone: Enigma Stone (Slowbro) or Ancient Stone (2) (Slowking)\n\n")
			table.insert(stt, "Evolutions:\nSlowbro, requires level 45.\nSlowking, requires level 100.")
		elseif name == "Eevee" then
			if next then
				return "\nVaporeon, requires level 55.\nJolteon, requires level 55.\nFlareon, requires level 55.\nUmbreon, requires level 55.\nEspeon, requires level 55."
			end
			table.insert(stt, "Evolve Stone: Water Stone or Thunder Stone or Fire Stone or Darkness Stone or Enigma Stone\n\n")
			table.insert(stt, "Evolutions:\nVaporeon, requires level 55.\nJolteon, requires level 55.\nFlareon, requires level 55.\nUmbreon, requires level 55.\nEspeon, requires level 55.")
		elseif name == "Tyrogue" then
			if next then
				return "\nHitmonlee, requires level 60.\nHitmonchan, requires level 60.\nHitmontop, requires level 60."
			end
			table.insert(stt, "Evolve Stone: Punch Stone and 500 Spin Machines (Hitmontop), Punch Stone and 500 Kick Machines (Hitmonlee), Punch Stone and 500 Punch Machines (Hitmonchan)\n\n") 
			table.insert(stt, "Evolutions:\nHitmonlee, requires level 60.\nHitmonchan, requires level 60.\nHitmontop, requires level 60.")
		end
	elseif hasEvolution(name) and poevo[name] and POKELEVEL_PLUS.evolution_tab[name] then
		-- pokes[evoTab.to].level
		local evoTab = getPokemonEvolutionTab(name)
		if next then
			table.insert(stt, "\n"..evoTab.to..", você precisa ser level ".. pokes[evoTab.to].level ..".")
			return table.concat(stt)
		end
		local evostone = {}
		for _, b in pairs(string.explode(evoTab.stones, ",")) do
			local strings = b:explode(" ")
			local total = tonumber(strings[1])
			local stoneId = stoneToString[strings[2]]
			table.insert(evostone, getItemNameById(stoneId)..(total > 1 and " ("..total.."x)" or ""))
		end
	
	    local getEvolution = POKELEVEL_PLUS.evolution_tab[name]
	    local levelEvolution = getEvolution.level
	    local levelEvolutionStone = math.floor(getEvolution.level / 3)

		table.insert(stt, "Evolve Stone: ".. doConcatTable(evostone, ", ", " and ") .."\n\n")
		table.insert(stt, "Evolutions:\n".. evoTab.to ..", você precisa ser level ".. pokes[evoTab.to].level ..".\n")
		table.insert(stt, "Seu pokémon precisa ser level ".. levelEvolution .." para evoluir por level!\n")
		table.insert(stt, "Para evolução por Stone, seu pokémon precisa ser level ".. levelEvolutionStone ..".")
		--table.insert(stt, getPokemonEvolutionDescription(kev.evolution, true))
	elseif hasEvolution(name) then
		local evoTab = getPokemonEvolutionTab(name)
		if next then
			table.insert(stt, "\n"..evoTab.to..", você precisa ser level ".. pokes[evoTab.to].level ..".")
			return table.concat(stt)
		end
		local evostone = {}
		for _, b in pairs(string.explode(evoTab.stones, ",")) do
			local strings = b:explode(" ")
			local total = tonumber(strings[1])
			local stoneId = stoneToString[strings[2]]
			table.insert(evostone, getItemNameById(stoneId)..(total > 1 and " ("..total.."x)" or ""))
		end
	
		table.insert(stt, "Evolve Stone: ".. doConcatTable(evostone, ", ", " and ") .."\n\n")
		table.insert(stt, "Evolutions:\n".. evoTab.to ..", você precisa ser level ".. pokes[evoTab.to].level ..".\n")
	else
		if not next then
			table.insert(stt, "Evolutions:\nIt doen't evolve.")
		end
	end 
	return table.concat(stt)
end

local function getMoveDexDescr(name, number)
	local x = movestable[name]
	if not x then return "" end
	
	local z = "\n"
	local tables = {x.move1, x.move2, x.move3, x.move4, x.move5, x.move6, x.move7, x.move8, x.move9, x.move10, x.move11, x.move12}
	local y = tables[number]
	if not y then return "" end
	
	local txt = ""..z..""..y.name.." - m"..number.." - level "..y.level.." - "..(y.t) 
	
	if y.passive then
    txt = ""..z..""..y.name.." - passive".." - "..(y.t) 
    end	

	return txt
end 


--alterado v1.8
local skillcheck = {"fly", "ride", "surf", "teleport", "rock smash", "cut", "dig", "light", "blink", "control mind", "transform", "levitate_fly"}
local passivas = {
	["Shock Counter"] = {"Electabuzz", "Shiny Electabuzz", "Elekid", "Raikou", tpw = "electric"},
	["Lava-Counter"] = {"Magmar", "Magby", "Entei", tpw = "fire"},
	["Counter Helix"] = {"Scyther", "Shiny Scyther", tpw = "bug"},
	["Giroball"] = {"Pineco", "Forretress", tpw = "steel"},
	["Counter Claw"] = {"Scizor", tpw = "bug"},
	["Counter Spin"] = {"Hitmontop", "Shiny Hitmontop", tpw = "fighting"},
	["Demon Kicker"] = {"Hitmonlee", "Shiny Hitmonlee", tpw = "fighting"},
	["Demon Puncher"] = {"Hitmonchan", "Shiny Hitmonchan", tpw = "unknow"}, --alterado v1.6
	["Stunning Confusion"] = {"Psyduck", "Golduck", "Wobbuffet", tpw = "psychic"},
	["Groundshock"] = {"Kangaskhan", tpw = "normal"},
	["Electric Charge"] = {"Pikachu", "Raichu", "Shiny Raichu", tpw = "electric"},
	["Melody"] = {"Wigglytuff", tpw = "normal"},
	["Dragon Fury"] = {"Dratini", "Dragonair", "Dragonite", "Shiny Dratini", "Shiny Dragonair", "Shiny Dragonite", tpw = "dragon"},
	["Fury"] = {"Persian", "Raticate", "Shiny Raticate", tpw = "normal"},
	["Mega Drain"] = {"Oddish", "Gloom", "Vileplume", "Kabuto", "Kabutops", "Parasect", "Tangela", "Shiny Vileplume", "Shiny Tangela", tpw = "grass"},
	["Spores Reaction"] = {"Oddish", "Gloom", "Vileplume", "Shiny Vileplume", tpw = "grass"},
	["Amnesia"] = {"Wooper", "Quagsire", "Swinub", "Piloswine", tpw = "psychic"},
	["Zen Mind"] = {"Slowking", tpw = "psychic"}, 
	["Mirror Coat"] = {"Wobbuffet", tpw = "psychic"},
	["Lifesteal"] = {"Zubat", "Golbat", "Crobat", "Shiny Zubat", "Shiny Golbat", "Shiny Crobat", tpw = "poison"},
	["Evasion"] = {"Scyther", "Scizor", "Hitmonlee", "Hitmonchan", "Hitmontop", "Tyrogue", "Shiny Scyther", "Shiny Hitmonchan", "Shiny Hitmonlee", "Shiny Hitmontop", "Ledian", "Ledyba", "Sneasel", tpw = "normal"},
	["Foresight"] = {"Machamp", "Shiny Hitmonchan", "Shiny Hitmonlee", "Shiny Hitmontop", "Hitmontop", "Hitmonlee", "Hitmonchan", tpw = "fighting"},
	["Levitate"] = {"Gengar", "Haunter", "Gastly", "Misdreavus", "Weezing", "Koffing", "Unown", "Shiny Gengar", tpw = "ghost"},
	["Bone Spin"] = {"Cubone", "Marowak", "Shiny Cubone", "Shiny Marowak", tpw = "rock"},

	-- NEW'S PASSIVAS --
	
	["Swift Swim"] = {"Lotad", "Lombre", "Ludicolo", tpw = "water"},
	["Water Sport"] = {"Ludicolo", tpw = "water"},	
	["Thick Fat"] = {"Venusaur", tpw = "rock"},	
	["Chlorophyll"] = {"Nuzleaf", "Shiftry", tpw = "grass"},	
	["Gust"] = {"Swellow", tpw = "normal"},		
	["Shadow Counter"] = {"Shedinja", tpw = "normal"},	
	["Wonder Guard"] = {"Shedinja", tpw = "normal"},	
	["Uproar"] = {"Whismur", "Loudred", "Exploud", tpw = "normal"},		
	["Leftovers"] = {"Exploud", tpw = "normal"},		
	["Solid Rock"] = {"Camerupt", tpw = "rock"},		
	["Shed Skin"] = {"Seviper", tpw = "poison"},		
	["Viper's Fang"] = {"Seviper", tpw = "poison"},		
	["Insomnia"] = {"Banette", tpw = "ghost"},		
	["Cursed Body"] = {"Banette", tpw = "ghost"},		
	["Absolute Zero"] = {"Glalie", tpw = "ice"},			
	["Ozze Armor"] = {"Muk", "Grimer", "Shiny Muk", "Shiny Grimer", "Gulpin", "Swalot", tpw = "poison"},	
	["Contrary Confunsion"] = {"Spinda", tpw = "psychic"},	
	["Quick Feet"] = {"Zigzagoon", "Linoone", tpw = "normal"},	
	["Intimidate"] = {"Masquerain", tpw = "normal"},
	["Hyper Rage"] = {"Carvanha", "Sharpedo", tpw = "water"},	
	["Water Absorb"] = {"Cacnea", "Cacturn", tpw = "grass"},	
	["Spike Corpse"] = {"Shiny Jolteon","Jolteon","Cacnea", "Cacturn", tpw = "grass"},		
}


function doShowPokedexRegistration(cid, pokemon)
	
	local myball = ball
	local name = pokemon 
	
	local v = fotos[name]
	local stt = {}
	
	table.insert(stt, "Name: "..name.."\n")
	
	if pokes[name].type2 and pokes[name].type2 ~= "no type" then
		table.insert(stt, "Type: "..pokes[name].type.."/"..pokes[name].type2)
	else
		table.insert(stt, "Type: "..pokes[name].type)
	end
	
	if virtual then
		table.insert(stt, "\nRequired level: "..pokes[name].level.."\n")
	else
		table.insert(stt, "\nRequired level: ".. getPokemonLevelD(name) .."\n") --alterado v1.9
	end
	
	table.insert(stt, "\n"..getPokemonEvolutionDescription(name).."\n")
	
	table.insert(stt, "\nMoves:")
	
	if name == "Ditto" then
		table.insert(stt, "\nIt doesn't use any moves until transformed.")
	else
		for a = 1, 15 do
			table.insert(stt, getMoveDexDescr(name, a))
		end
	end

--[[	
	for e, f in pairs(passivas) do
		if isInArray(passivas[e], name) then
			local tpw = passivas[e].tpw
			if name == "Pineco" and passivas[e] == "Giroball" then
				tpw = "bug"
			end
			table.insert(stt, "\n"..e.." - passive - "..tpw)
		end
	end
--]]
	
	table.insert(stt, "\n\nAbility:\n") 
	local abilityNONE = true --alterado v1.8 \/
	
	for b, c in pairs(skills) do
		if isInArray(skillcheck, b) then
			if isInArray(c, name) then
				table.insert(stt, (b == "levitate_fly" and "Levitate" or doCorrectString(b)).."\n")
				abilityNONE = false
			end
		end
	end
	if abilityNONE then
		table.insert(stt, "None")
	end
	
	if string.len(table.concat(stt)) > 8192 then
		print("Error while making pokedex info with pokemon named "..name..".\n Pokedex registration has more than 8192 letters (it has "..string.len(stt).." letters), it has been blocked to prevent fatal error.")
		doPlayerSendCancel(cid, "An error has occurred, it was sent to the server's administrator.") 
		return true
	end	
	
	doShowTextDialog(cid, v, table.concat(stt))
end

function getMonsterLootSpriteId(name)
	local list = getMonsterLootList(name)
	local newList = {}
	for i, v in pairs(list) do
		print_table(v)
		table.insert(newList, {['id'] = getItemSpriteIdById(v.id), ['chance'] = v.chance, ['count'] = v.count, ['name'] = getItemNameById(v.id)})
	end
	return newList
end

function print_table(self) -- by vyctor17
        local str = "{"

        for i, v in pairs(self) do
                local index = type(i) == "string" and "[\"".. i .. "\"]" or "[".. i .. "]"
                local value = type(v) == "table" and print_table(v) or type(v) == "string" and "\"".. v .. "\"" or tostring(v)

                str = str .. index .. " = ".. value .. ", "
        end

        -- print((#str > 1 and str:sub(1, #str - 2)) .. "}")
        return (#str > 1 and str:sub(1, #str - 2)) .. "}"
end

function getPokemonMoves(name)
	-- print(name)
	return print_table(movestable[name])
end

function getPokemonAbilityDesc(name)
	stt = {}
	local abilityNONE = true --alterado v1.8 \/
	
	for b, c in pairs(skills) do
		if isInArray(skillcheck, b) then
			if isInArray(c, name) then
				local sep = "/"
				table.insert(stt, (b == "levitate_fly" and "Levitate" or doCorrectString(b))..sep)
				abilityNONE = false
			end
		end
	end
	if abilityNONE then
		table.insert(stt, "None")
	end
	return table.concat(stt):sub(1, -2)
end