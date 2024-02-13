ballsTypesCatch = {
	["pokeball"] = 1, -- Se eu joguei pokeball, ganhará 1 point por cada
	["greatball"] = 2, -- Se eu joguei great ball, ganhará 2 points por cada
	["superball"] = 3, -- Se eu joguei superball, ganhará 3 points por cada
	["ultraball"] = 5, -- Se eu joguei ultraball, ganhará 5 points por cada
	["vball"] = 4, -- Se eu joguei vball, ganhará 5 points por cada
	["vballShiny"] = 8, -- Se eu joguei vball, ganhará 5 points por cada

	-- ["pokeball"] = 2,
	-- ["greatball"] = 3,
	-- ["superball"] = 4,
	-- ["ultraball"] = 6,
	-- ["vball"] = 5,
	-- ["vballShiny"] = 10,
	
	["saffariball"] = 3, -- Se eu joguei saffariball, ganhará 3 points por cada
	["premierball"] = 1, 
	["maguball"] = 8,
	["soraball"] = 8, 
	["yumeball"] = 8, 
	["duskball"] = 8, 
	["taleball"] = 8, 
	["moonball"] = 8, 
	["netball"] = 8, 
	["tinkerball"] = 8, 
	["fastball"] = 8, 
	["heavyball"] = 8, 
	["janguruball"] = 8, 
}	

pokeChance = {

	-- 1 GENERATION	
	
	["Bulbasaur"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"}, 
	["Ivysaur"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},
	["Venusaur"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},
	["Charmander"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Charmeleon"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"}, 
	["Charizard"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},
	["Squirtle"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Wartortle"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},
	["Blastoise"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},
	["Caterpie"] = {media = 0.5, balltype = "ultraball", minBallType = "pokeball"},
	["Metapod"] = {media = 3, balltype = "ultraball", minBallType = "pokeball"}, -- 8 ub = 20 ultraball
	["Butterfree"] = {media = 30, balltype = "ultraball", minBallType = "pokeball"}, -- 47 sb = 28 ub
	["Weedle"] = {media = 0.5, balltype = "ultraball", minBallType = "pokeball"},
	["Kakuna"] = {media = 2, balltype = "ultraball", minBallType = "pokeball"},
	["Beedrill"] = {media = 30, balltype = "ultraball", minBallType = "pokeball"},
	["Pidgey"] = {media = 0.5, balltype = "ultraball", minBallType = "pokeball"},
	["Pidgeotto"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Pidgeot"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},
	["Rattata"] = {media = 0.5, balltype = "ultraball", minBallType = "pokeball"},
	["Raticate"] = {media = 30, balltype = "ultraball", minBallType = "pokeball"},
	["Spearow"] = {media = 1, balltype = "ultraball", minBallType = "pokeball"},
	["Fearow"] = {media = 78, balltype = "ultraball", minBallType = "pokeball"},
	["Ekans"] = {media = 3, balltype = "ultraball", minBallType = "pokeball"},
	["Arbok"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Pikachu"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},
	["Raichu"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},
	["Sandshrew"] = {media = 16, balltype = "ultraball", minBallType = "pokeball"},
	["Sandslash"] = {media = 126, balltype = "ultraball", minBallType = "pokeball"},
	["Nidoran Female"] = {media = 3, balltype = "saffariball", minBallType = "pokeball"},
	["Nidorina"] = {media = 33, balltype = "saffariball", minBallType = "pokeball"},
	["Nidoqueen"] = {media = 200, balltype = "saffariball", minBallType = "pokeball"},
	["Nidoran Male"] = {media = 3, balltype = "saffariball", minBallType = "pokeball"},
	["Nidorino"] = {media = 33, balltype = "saffariball", minBallType = "pokeball"},
	["Nidoking"] = {media = 200, balltype = "saffariball", minBallType = "pokeball"},
	["Clefairy"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},
	["Clefable"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},
	["Vulpix"] = {media = 16, balltype = "ultraball", minBallType = "pokeball"},
	["Ninetales"] = {media = 165, balltype = "ultraball", minBallType = "pokeball"},
	["Jigglypuff"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},
	["Wigglytuff"] = {media = 260, balltype = "ultraball", minBallType = "pokeball"},
	["Zubat"] = {media = 2, balltype = "ultraball", minBallType = "pokeball"},
	["Golbat"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Oddish"] = {media = 1, balltype = "ultraball", minBallType = "pokeball"},
	["Gloom"] = {media = 33, balltype = "ultraball", minBallType = "pokeball"},
	["Vileplume"] = {media = 172, balltype = "ultraball", minBallType = "pokeball"},
	["Paras"] = {media = 1, balltype = "ultraball", minBallType = "pokeball"},
	["Parasect"] = {media = 113, balltype = "ultraball", minBallType = "pokeball"},
	["Venonat"] = {media = 23, balltype = "ultraball", minBallType = "pokeball"},
	["Venomoth"] = {media = 113, balltype = "ultraball", minBallType = "pokeball"},
	["Diglett"] = {media = 3, balltype = "ultraball", minBallType = "pokeball"},
	["Dugtrio"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Meowth"] = {media = 3, balltype = "ultraball", minBallType = "pokeball"},
	["Persian"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Psyduck"] = {media = 23, balltype = "ultraball", minBallType = "pokeball"},
	["Golduck"] = {media = 172, balltype = "ultraball", minBallType = "pokeball"},
	["Mankey"] = {media = 3, balltype = "saffariball", minBallType = "pokeball"},
	["Primeape"] = {media = 113, balltype = "saffariball", minBallType = "pokeball"},
	["Growlithe"] = {media = 42, balltype = "ultraball", minBallType = "pokeball"},
	["Arcanine"] = {media = 303, balltype = "ultraball", minBallType = "pokeball"},
	["Poliwag"] = {media = 2, balltype = "ultraball", minBallType = "pokeball"},
	["Poliwhirl"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Poliwrath"] = {media = 190, balltype = "ultraball", minBallType = "pokeball"},
	["Abra"] = {media = 13, balltype = "ultraball", minBallType = "pokeball"},
	["Kadabra"] = {media = 47, balltype = "ultraball", minBallType = "pokeball"},
	["Alakazam"] = {media = 234, balltype = "ultraball", minBallType = "pokeball"},
	["Machop"] = {media = 31, balltype = "ultraball", minBallType = "pokeball"},
	["Machoke"] = {media = 104, balltype = "ultraball", minBallType = "pokeball"},
	["Machamp"] = {media = 303, balltype = "ultraball", minBallType = "pokeball"},
	["Bellsprout"] = {media = 2, balltype = "ultraball", minBallType = "pokeball"},
	["Weepinbell"] = {media = 33, balltype = "ultraball", minBallType = "pokeball"},
	["Victreebel"] = {media = 172, balltype = "ultraball", minBallType = "pokeball"},
	["Tentacool"] = {media = 3, balltype = "ultraball", minBallType = "pokeball"},
	["Tentacruel"] = {media = 217, balltype = "ultraball", minBallType = "pokeball"},
	["Geodude"] = {media = 3, balltype = "ultraball", minBallType = "pokeball"},
	["Graveler"] = {media = 78, balltype = "ultraball", minBallType = "pokeball"},
	["Golem"] = {media = 217, balltype = "ultraball", minBallType = "pokeball"},
	["Ponyta"] = {media = 23, balltype = "ultraball", minBallType = "pokeball"},
	["Rapidash"] = {media = 156, balltype = "ultraball", minBallType = "pokeball"},
	["Slowpoke"] = {media = 6, balltype = "ultraball", minBallType = "pokeball"},
	["Slowbro"] = {media = 126, balltype = "saffariball", minBallType = "pokeball"},
	["Slowking"] = {media = 750, balltype = "saffariball", minBallType = "pokeball"},
	["Magnemite"] = {media = 6, balltype = "ultraball", minBallType = "pokeball"},
	["Magneton"] = {media = 78, balltype = "ultraball", minBallType = "pokeball"},
	["Farfetch'd"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},
	["Chansey"] = {media = 165, balltype = "saffariball", minBallType = "pokeball"},
	["Doduo"] = {media = 9, balltype = "saffariball", minBallType = "pokeball"},
	["Dodrio"] = {media = 86, balltype = "saffariball", minBallType = "pokeball"},
	["Seel"] = {media = 31, balltype = "ultraball", minBallType = "pokeball"},
	["Dewgong"] = {media = 173, balltype = "ultraball", minBallType = "pokeball"},
	["Grimer"] = {media = 5, balltype = "ultraball", minBallType = "pokeball"},
	["Muk"] = {media = 171, balltype = "ultraball", minBallType = "pokeball"},
	["Shellder"] = {media = 4, balltype = "ultraball", minBallType = "pokeball"},
	["Cloyster"] = {media = 148, balltype = "ultraball", minBallType = "pokeball"},
	["Gastly"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Haunter"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},
	["Gengar"] = {media = 173, balltype = "ultraball", minBallType = "pokeball"},
	["Onix"] = {media = 86, balltype = "ultraball", minBallType = "pokeball"},
	["Drowzee"] = {media = 16, balltype = "ultraball", minBallType = "pokeball"},
	["Hypno"] = {media = 86, balltype = "ultraball", minBallType = "pokeball"},
	["Eevee"] = {media = 86, balltype = "saffariball", minBallType = "pokeball"},
	["Krabby"] = {media = 2, balltype = "ultraball", minBallType = "pokeball"},
	["Kingler"] = {media = 78, balltype = "ultraball", minBallType = "pokeball"},
	["Voltorb"] = {media = 5, balltype = "ultraball", minBallType = "pokeball"},
	["Electrode"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Exeggcute"] = {media = 4, balltype = "ultraball", minBallType = "pokeball"},
	["Exeggutor"] = {media = 217, balltype = "ultraball", minBallType = "pokeball"},
	["Cubone"] = {media = 16, balltype = "ultraball", minBallType = "pokeball"},
	["Marowak"] = {media = 171, balltype = "ultraball", minBallType = "pokeball"},
	["Lickitung"] = {media = 800, balltype = "saffariball", minBallType = "pokeball"},
	["Kangaskhan"] = {media = 800, balltype = "saffariball", minBallType = "pokeball"},
	["Koffing"] = {media = 5, balltype = "ultraball", minBallType = "pokeball"},
	["Weezing"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Rhyhorn"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Rhydon"] = {media = 190, balltype = "ultraball", minBallType = "pokeball"},
	["Tangela"] = {media = 148, balltype = "ultraball", minBallType = "pokeball"},
	["Horsea"] = {media = 2, balltype = "ultraball", minBallType = "pokeball"},
	["Seadra"] = {media = 86, balltype = "ultraball", minBallType = "pokeball"},
	["Goldeen"] = {media = 2, balltype = "ultraball", minBallType = "pokeball"},
	["Seaking"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Staryu"] = {media = 6, balltype = "ultraball", minBallType = "pokeball"},
	["Starmie"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Jynx"] = {media = 600, balltype = "ultraball", minBallType = "pokeball"},
	["Electabuzz"] = {media = 609, balltype = "ultraball", minBallType = "pokeball"},
	["Mr. Mime"] = {media = 665, balltype = "saffariball", minBallType = "pokeball"},
	["Scyther"] = {media = 465, balltype = "saffariball", minBallType = "pokeball"},	
	["Magmar"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	["Pinsir"] = {media = 598, balltype = "ultraball", minBallType = "pokeball"},
	["Tauros"] = {media = 78, balltype = "ultraball", minBallType = "pokeball"},
	["Magikarp"] = {media = 1, balltype = "ultraball", minBallType = "pokeball"},
	["Gyarados"] = {media = 600, balltype = "ultraball", minBallType = "pokeball"},
	["Lapras"] = {media = 800, balltype = "ultraball", minBallType = "pokeball"},
	["Snorlax"] = {media = 600, balltype = "ultraball", minBallType = "pokeball"},
	["Vaporeon"] = {media = 259, balltype = "ultraball", minBallType = "pokeball"},
	["Flareon"] = {media = 259, balltype = "ultraball", minBallType = "pokeball"},
	["Jolteon"] = {media = 259, balltype = "ultraball", minBallType = "pokeball"},
	["Umbreon"] = {media = 259, balltype = "ultraball", minBallType = "pokeball"},
	["Espeon"] = {media = 259, balltype = "ultraball", minBallType = "pokeball"},
	["Dratini"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},
	["Dragonair"] = {media = 332, balltype = "ultraball", minBallType = "pokeball"},
	["Dragonite"] = {media = 600, balltype = "ultraball", minBallType = "pokeball"},

	-- 2 GENERATION	
	
	["Chikorita"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"}, 
	["Bayleef"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},
	["Meganium"] = {media = 259, balltype = "ultraball", minBallType = "pokeball"},
	["Cyndaquil"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Quilava"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"}, 
	["Typhlosion"] = {media = 259, balltype = "ultraball", minBallType = "pokeball"},
	["Totodile"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Croconaw"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},
	["Feraligatr"] = {media = 259, balltype = "ultraball", minBallType = "pokeball"},
	["Sentret"] = {media = 5, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Furret"] = {media = 60, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Hoothoot"] = {media = 23, balltype = "ultraball", minBallType = "pokeball"}, 		
	["Noctowl"] = {media = 223, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Ledyba"] = {media = 5, balltype = "ultraball", minBallType = "pokeball"}, 
	["Ledian"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"}, 
	["Spinarak"] = {media = 5, balltype = "ultraball", minBallType = "pokeball"}, 
	["Ariados"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"}, 
	["Crobat"] = {media = 600, balltype = "ultraball", minBallType = "pokeball"}, 
	["Chinchou"] = {media = 16, balltype = "ultraball", minBallType = "pokeball"}, 
	["Lanturn"] = {media = 173, balltype = "ultraball", minBallType = "pokeball"}, 
	["Pichu"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"}, 
	["Cleffa"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"}, 
	["Igglybuff"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"}, 
	["Togepi"] = {media = 217, balltype = "ultraball", minBallType = "pokeball"}, 
	["Togetic"] = {media = 363, balltype = "ultraball", minBallType = "pokeball"}, 
	["Blissey"] = {media = 363, balltype = "saffariball", minBallType = "pokeball"}, 
	["Natu"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"}, 
	["Xatu"] = {media = 190, balltype = "ultraball", minBallType = "pokeball"}, 
	["Mareep"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"}, 
	["Flaaffy"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"}, 
	["Ampharos"] = {media = 259, balltype = "ultraball", minBallType = "pokeball"}, 
	["Bellossom"] = {media = 173, balltype = "ultraball", minBallType = "pokeball"}, 
	["Maril"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"}, 
	["Azumarill"] = {media = 190, balltype = "ultraball", minBallType = "pokeball"}, 
	["Politoed"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"}, 
	["Hoppip"] = {media = 3, balltype = "ultraball", minBallType = "pokeball"}, 
	["Skiploom"] = {media = 33, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Jumpluff"] = {media = 173, balltype = "ultraball", minBallType = "pokeball"}, 
	["Aipom"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Sunkern"] = {media = 2, balltype = "ultraball", minBallType = "pokeball"}, 
	["Sunflora"] = {media = 80, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Yanma"] = {media = 118, balltype = "ultraball", minBallType = "pokeball"}, 
	["Wooper"] = {media = 31, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Quagsire"] = {media = 173, balltype = "ultraball", minBallType = "pokeball"}, 
	["Murkrow"] = {media = 148, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Girafarig"] = {media =  600, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Pineco"] = {media = 5, balltype = "ultraball", minBallType = "pokeball"}, 
	["Forretress"] = {media = 148, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Dunsparce"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"}, 
	["Gligar"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Steelix"] = {media = 600, balltype = "ultraball", minBallType = "pokeball"}, 
	["Wobbuffet"] = {media = 800, balltype = "ultraball", minBallType = "pokeball"}, 
	["Snubbull"] = {media = 38, balltype = "ultraball", minBallType = "pokeball"}, 
	["Granbull"] = {media = 182, balltype = "ultraball", minBallType = "pokeball"}, 
	["Qwilfish"] = {media = 148, balltype = "ultraball", minBallType = "pokeball"}, 
	["Shuckle"] = {media = 42, balltype = "ultraball", minBallType = "pokeball"}, 
	["Heracross"] = {media = 800, balltype = "ultraball", minBallType = "pokeball"}, 
	["Scizor"] = {media = 800, balltype = "saffariball", minBallType = "pokeball"}, 
	["Misdreavus"] = {media = 800, balltype = "ultraball", minBallType = "pokeball"}, 
	["Sneasel"] = {media = 148, balltype = "ultraball", minBallType = "pokeball"}, 
	["Teddiursa"] = {media = 94, balltype = "ultraball", minBallType = "pokeball"}, 
	["Slugma"] = {media = 16, balltype = "ultraball", minBallType = "pokeball"}, 
	["Magcargo"] = {media = 161, balltype = "ultraball", minBallType = "pokeball"}, 
	["Swinub"] = {media = 16, balltype = "ultraball", minBallType = "pokeball"}, 
	["Piloswine"] = {media = 161, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Corsola"] = {media = 128, balltype = "ultraball", minBallType = "pokeball"}, 
	["Remoraid"] = {media = 4, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Octillery"] = {media = 148, balltype = "ultraball", minBallType = "pokeball"}, 
	["Delibird"] = {media = 148, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Mantine"] = {media = 400, balltype = "ultraball", minBallType = "pokeball"}, 
	["Skarmory"] = {media = 400, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Houndour"] = {media = 53, balltype = "ultraball", minBallType = "pokeball"}, 
	["Houndoom"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Kingdra"] = {media = 864, balltype = "ultraball", minBallType = "pokeball"}, 
	["Phanpy"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Donphan"] = {media = 213, balltype = "ultraball", minBallType = "pokeball"}, 
	["Stantler"] = {media = 148, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Smoochum"] = {media = 69, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Elekid"] = {media = 128, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Magby"] = {media = 128, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Miltank"] = {media = 532, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Larvitar"] = {media = 217, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Pupitar"] = {media = 465, balltype = "ultraball", minBallType = "pokeball"}, 	
	["Tyranitar"] = {media = 532, balltype = "ultraball", minBallType = "pokeball"}, 
	["Sudowoodo"] = {media = 525, balltype = "saffariball", minBallType = "pokeball"}, 
	["Ursaring"] = {media = 525, balltype = "ultraball", minBallType = "pokeball"}, 
	["Smeargle"] = {media = 280, balltype = "saffariball", minBallType = "pokeball"}, 
	["Smeargle 1"] = {media = 280, balltype = "saffariball", minBallType = "pokeball"}, 
	["Smeargle 2"] = {media = 280, balltype = "saffariball", minBallType = "pokeball"}, 
	["Smeargle 3"] = {media = 280, balltype = "saffariball", minBallType = "pokeball"}, 
	["Smeargle 4"] = {media = 280, balltype = "saffariball", minBallType = "pokeball"}, 
	["Smeargle 5"] = {media = 280, balltype = "saffariball", minBallType = "pokeball"}, 
	["Smeargle 6"] = {media = 280, balltype = "saffariball", minBallType = "pokeball"}, 
	["Smeargle 7"] = {media = 280, balltype = "saffariball", minBallType = "pokeball"}, 			
	["Smeargle 8"] = {media = 280, balltype = "saffariball", minBallType = "pokeball"}, 
	
	-- 3 GENERATION	
	
	["Treecko"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"}, 
	["Grovyle"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},
	["Sceptile"] = {media = 259, balltype = "ultraball", minBallType = "pokeball"},
	["Torchic"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Combusken"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"}, 
	["Blaziken"] = {media = 259, balltype = "ultraball", minBallType = "pokeball"},
	["Mudkip"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},
	["Marshtomp"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},
	["Swampert"] = {media = 259, balltype = "ultraball", minBallType = "pokeball"},
	["Poochyena"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},	
	["Mightyena"] = {media = 259, balltype = "ultraball", minBallType = "pokeball"},	
	["Zigzagoon"] = {media = 66, balltype = "ultraball", minBallType = "pokeball"},	
	["Linoone"] = {media = 120, balltype = "ultraball", minBallType = "pokeball"},	
	["Wurmple"] = {media = 20, balltype = "ultraball", minBallType = "pokeball"},	
	["Silcoon"] = {media = 66, balltype = "ultraball", minBallType = "pokeball"},	
	["Cascoon"] = {media = 66, balltype = "ultraball", minBallType = "pokeball"},
	["Beautifly"] = {media = 226, balltype = "ultraball", minBallType = "pokeball"},	
	["Dustox"] = {media = 226, balltype = "ultraball", minBallType = "pokeball"},	
	["Lotad"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},	
	["Lombre"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},	
	["Ludicolo"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Seedot"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},	
	["Nuzleaf"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},	
	["Shiftry"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Taillow"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},	
	["Swellow"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Wingull"] = {media = 47, balltype = "ultraball", minBallType = "pokeball"},	
	["Pelipper"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Surskit"] = {media = 47, balltype = "ultraball", minBallType = "pokeball"},	
	["Masquerain"] = {media = 226, balltype = "ultraball", minBallType = "pokeball"},	
	["Skitty"] = {media = 47, balltype = "ultraball", minBallType = "pokeball"},	
	["Delcatty"] = {media = 120, balltype = "ultraball", minBallType = "pokeball"},
	["Ralts"] = {media = 47, balltype = "ultraball", minBallType = "pokeball"},	
	["Kirlia"] = {media = 120, balltype = "ultraball", minBallType = "pokeball"},	
	["Gardevoir"] = {media = 665, balltype = "ultraball", minBallType = "pokeball"},	
	["Shroomish"] = {media = 66, balltype = "ultraball", minBallType = "pokeball"},	
	["Breloom"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},
	["Spinda"] = {media = 47, balltype = "ultraball", minBallType = "pokeball"},	
	["Slakoth"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},	
	["Vigoroth"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Nincada"] = {media = 5, balltype = "ultraball", minBallType = "pokeball"},	
	["Whismur"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},	
	["Loudred"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},	
	["Exploud"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Makuhita"] = {media = 86, balltype = "ultraball", minBallType = "pokeball"},	
	["Hariyama"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Sableye"] = {media = 321, balltype = "ultraball", minBallType = "pokeball"},
	["Barboach"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},	
	["Whiscash"] = {media = 113, balltype = "ultraball", minBallType = "pokeball"},	
	["Luvdisc"] = {media = 53, balltype = "ultraball", minBallType = "pokeball"},		
	["Mawile"] = {media = 465, balltype = "ultraball", minBallType = "pokeball"},	
	["Aron"] = {media = 217, balltype = "ultraball", minBallType = "pokeball"},	
	["Lairon"] = {media = 294, balltype = "ultraball", minBallType = "pokeball"},	
	["Aggron"] = {media = 479, balltype = "ultraball", minBallType = "pokeball"},	
	["Meditite"] = {media = 52, balltype = "ultraball", minBallType = "pokeball"},	
	["Medicham"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Electrike"] = {media = 52, balltype = "ultraball", minBallType = "pokeball"},	
	["Manectric"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Plusle"] = {media = 69, balltype = "ultraball", minBallType = "pokeball"},	
	["Minun"] = {media = 69, balltype = "ultraball", minBallType = "pokeball"},	
	["Numel"] = {media = 52, balltype = "ultraball", minBallType = "pokeball"},	
	["Camerupt"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Spoink"] = {media = 52, balltype = "ultraball", minBallType = "pokeball"},	
	["Grumpig"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},
	["Carvanha"] = {media = 65, balltype = "ultraball", minBallType = "pokeball"},	
	["Sharpedo"] = {media = 233, balltype = "ultraball", minBallType = "pokeball"},		
	["Trapinch"] = {media = 43, balltype = "ultraball", minBallType = "pokeball"},	
	["Vibrava"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},	
	["Flygon"] = {media = 840, balltype = "ultraball", minBallType = "pokeball"},	
	["Swablu"] = {media = 79, balltype = "ultraball", minBallType = "pokeball"},	
	["Altaria"] = {media = 600, balltype = "ultraball", minBallType = "pokeball"},	
	["Zangoose"] = {media = 319, balltype = "ultraball", minBallType = "pokeball"},	
	["Seviper"] = {media = 500, balltype = "ultraball", minBallType = "pokeball"},	
	["Corphish"] = {media = 52, balltype = "ultraball", minBallType = "pokeball"},	
	["Crawdaunt"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Baltoy"] = {media = 52, balltype = "ultraball", minBallType = "pokeball"},	
	["Claydol"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Feebas"] = {media = 77, balltype = "ultraball", minBallType = "pokeball"},	
	["Castform"] = {media = 800, balltype = "ultraball", minBallType = "pokeball"},	
	["Castform Fire"] = {media = 800, balltype = "ultraball", minBallType = "pokeball"},	
	["Castform Water"] = {media = 800, balltype = "ultraball", minBallType = "pokeball"},
	["Castform Ice"] = {media = 800, balltype = "ultraball", minBallType = "pokeball"},	
	["Kecleon"] = {media = 500, balltype = "ultraball", minBallType = "pokeball"},	
	["Shuppet"] = {media = 52, balltype = "ultraball", minBallType = "pokeball"},	
	["Banette"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Duskull"] = {media = 121, balltype = "ultraball", minBallType = "pokeball"},	
	["Dusclops"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Snorunt"] = {media = 52, balltype = "ultraball", minBallType = "pokeball"},	
	["Glalie"] = {media = 200, balltype = "ultraball", minBallType = "pokeball"},	
	["Spheal"] = {media = 86, balltype = "ultraball", minBallType = "pokeball"},	
	["Sealeo"] = {media = 161, balltype = "ultraball", minBallType = "pokeball"},	
	["Walrein"] = {media = 665, balltype = "ultraball", minBallType = "pokeball"},	
	["Cacnea"] = {media = 80, balltype = "ultraball", minBallType = "pokeball"},	
	["Cacturn"] = {media = 665, balltype = "ultraball", minBallType = "pokeball"},	
	["Wynaut"] = {media = 65, balltype = "ultraball", minBallType = "pokeball"},	
	["Gulpin"] = {media = 153, balltype = "ultraball", minBallType = "pokeball"},
	["Swalot"] = {media = 800, balltype = "ultraball", minBallType = "pokeball"},	
	["Tropius"] = {media = 800, balltype = "ultraball", minBallType = "pokeball"},
	["Clamperl"] = {media = 47, balltype = "ultraball", minBallType = "pokeball"},	
	["Huntail"] = {media = 126, balltype = "ultraball", minBallType = "pokeball"},	
	["Gorebyss"] = {media = 126, balltype = "ultraball", minBallType = "pokeball"},	
	["Relicath"] = {media = 126, balltype = "ultraball", minBallType = "pokeball"},
	["Volbeat"] = {media = 66, balltype = "ultraball", minBallType = "pokeball"},	
	["Illumise"] = {media = 66, balltype = "ultraball", minBallType = "pokeball"},		
	["Bagon"] = {media = 433, balltype = "ultraball", minBallType = "pokeball"},	
	["Shelgon"] = {media = 718, balltype = "ultraball", minBallType = "pokeball"},	
	["Beldum"] = {media = 217, balltype = "ultraball", minBallType = "pokeball"},	
	["Metang"] = {media = 718, balltype = "ultraball", minBallType = "pokeball"},	
	["Torkoal"] = {media = 465, balltype = "ultraball", minBallType = "pokeball"},	
	["Lucario"] = {media = 731, balltype = "ultraball", minBallType = "pokeball"},
	
-- Shinys
	["Shiny Abra"] = {media = 100, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Alakazam"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Venusaur"] = {media = 325, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Charizard"] = {media = 325, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Blastoise"] = {media = 325, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Butterfree"] = {media = 80, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Beedrill"] = {media = 80, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Pidgeot"] = {media = 280, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Rattata"] = {media = 65, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Raticate"] = {media = 150, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Raichu"] = {media = 325, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Zubat"] = {media = 65, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Golbat"] = {media = 110, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Oddish"] = {media = 65, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Paras"] = {media = 65, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Parasect"] = {media = 150, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Venonat"] = {media = 65, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Venomoth"] = {media = 250, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Growlithe"] = {media = 150, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Arcanine"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Tentacool"] = {media = 35, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Tentacruel"] = {media = 325, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Farfetch'd"] = {media = 175, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Grimer"] = {media = 65, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Muk"] = {media = 250, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Gengar"] = {media = 325, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Tauros"] = {media = 325, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Krabby"] = {media = 40, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Kingler"] = {media = 230, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Voltorb"] = {media = 35, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Electrode"] = {media = 150, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Cubone"] = {media = 78, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Marowak"] = {media = 250, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Tangela"] = {media = 250, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Horsea"] = {media = 58, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Seadra"] = {media = 90, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Scyther"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Jynx"] = {media = 425, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Electabuzz"] = {media = 425, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Pinsir"] = {media = 425, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Magikarp"] = {media = 45, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Giant Magikarp"] = {media = 150, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Gyarados"] = {media = 425, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Snorlax"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Dratini"] = {media = 95, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Dragonair"] = {media = 150, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Dragonite"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Mr. Mime"] = {media = 425, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Weezing"] = {media = 170, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Sandslash"] = {media = 170, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Magmar"] = {media = 425, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Machamp"] = {media = 325, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Skarmory"] = {media = 425, balltype = "ultraball", minBallType = "pokeball"},	
	["Shiny Steelix"] = {media = 425, balltype = "ultraball", minBallType = "pokeball"},	
	["Shiny Tyranitar"] = {media = 425, balltype = "ultraball", minBallType = "pokeball"},	
	["Shiny Sudowoodo"] = {media = 425, balltype = "ultraball", minBallType = "pokeball"},	
	-- Shinys Cyber --
	["Shiny Rhydon"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Onix"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Ninetales"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Magneton"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Dodrio"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Ariados"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Espeon"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Umbreon"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},	
	["Shiny Stantler"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Politoed"] = {media = 450, balltype = "ultraball", minBallType = "pokeball"},
	-- Shinys 2 GENRATION
	["Shiny Meganium"] = {media = 325, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Feraligatr"] = {media = 325, balltype = "ultraball", minBallType = "pokeball"},
	["Shiny Typhlosion"] = {media = 325, balltype = "ultraball", minBallType = "pokeball"},		
	["Shiny Ampharos"] = {media = 325, balltype = "ultraball", minBallType = "pokeball"},	
	["Shiny Crobat"] = {media = 325, balltype = "ultraball", minBallType = "pokeball"},		
	["Shiny Lanturn"] = {media = 170, balltype = "ultraball", minBallType = "pokeball"},	
	["Shiny Larvitar"] = {media = 75, balltype = "ultraball", minBallType = "pokeball"},	
	["Shiny Pupitar"] = {media = 180, balltype = "ultraball", minBallType = "pokeball"},		
	["Shiny Mantine"] = {media = 225, balltype = "ultraball", minBallType = "pokeball"},		
	["Shiny Magcargo"] = {media = 246, balltype = "ultraball", minBallType = "pokeball"},	
	["Shiny Xatu"] = {media = 190, balltype = "ultraball", minBallType = "pokeball"},	
} 

pokesMasterX = {

-- [[* Balanceamento em relação a diferença de status entre a 1 e 2º geração com excessão dos iniciais será de 0.5 a 2.0 de stats ]] --
-- [[* Agility: Min = 190, Max = 450]] --
-- [[* Explicação para não bugar sua mente, Primeiro é o pokemon base dos status ou seja aquele que foi baseado a alteração do segundo, vamos supor o chikorita foi baseado no status do bulbasaur ]] --
-- [[* OBS: A LISTA ESTÁ PELA ORDEM DE BASE DE BALANCEAMENTO NÃO DA POKEDEX.]] --
	
	['Bulbasaur'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 190, exp = 250, level = 20, wildLvl = 1, type = 'grass', type2 = 'poison'},

	['Ivysaur'] = {offense = 0.9, defense = 5.5, specialattack = 7.8, life = 1200, vitality = 6.8, agility = 200, exp = 450, level = 40, wildLvl = 1, type = 'grass', type2 = 'poison'},	
	
	['Venusaur'] = {offense = 1, defense = 8.7, specialattack = 8.8, life = 1800, vitality = 8, agility = 300, exp = 1800, level = 80, wildLvl = 1, type = 'grass', type2 = 'poison'},
	
	['Shiny Venusaur'] = {offense = 1, defense = 10, specialattack = 8, life = 1800, vitality = 8, agility = 300, exp = 1800, level = 100, wildLvl = 5, type = 'grass', type2 = 'poison'},

	['Charmander'] = {offense = 1, defense = 3, specialattack = 4, life = 700, vitality = 2.5, agility = 200, exp = 250, level = 20, wildLvl = 1, type = 'fire', type2 = 'no type'},

	['Charmeleon'] = {offense = 1.2, defense = 5, specialattack = 8.3, life = 1000, vitality = 6.8, agility = 200, exp = 450, level = 40, wildLvl = 1, type = 'fire', type2 = 'no type'},
	
	['Charizard'] = {offense = 1.5, defense = 8.5, specialattack = 9.3, life = 1600, vitality = 8, agility = 300, exp = 1800, level = 80, wildLvl = 1, type = 'fire', type2 = 'flying'},
	
	['Shiny Charizard'] = {offense = 1.5, defense = 8.5, specialattack = 9.3, life = 1600, vitality = 8, agility = 300, exp = 1800, level = 100, wildLvl = 5, type = 'fire', type2 = 'flying'},
	
	['Squirtle'] = {offense = 0.5, defense = 4, specialattack = 3, life = 900, vitality = 2.5, agility = 190, exp = 250, level = 20, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Wartortle'] = {offense = 0.7, defense = 6.5, specialattack = 7.3, life = 1400, vitality = 6.8, agility = 200, exp = 450, level = 40, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Blastoise'] = {offense = 0.9, defense = 9.2, specialattack = 8, life = 2000, vitality = 8, agility = 300, exp = 1800, level = 80, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Shiny Blastoise'] = {offense = 0.9, defense = 9.2, specialattack = 12, life = 2000, vitality = 8, agility = 300, exp = 1800, level = 100, wildLvl = 5, type = 'water', type2 = 'no type'},
	
	['Oddish'] = {offense = 0.4, defense = 2, specialattack = 1.8, life = 400, vitality = 3, agility = 200, exp = 100, level = 5, wildLvl = 1, type = 'grass', type2 = 'poison'},
	
	['Shiny Oddish'] = {offense = 0.4, defense = 2, specialattack = 1.8, life = 400, vitality = 3, agility = 200, exp = 100, level = 20, wildLvl = 5, type = 'grass', type2 = 'poison'},
	
	['Gloom'] = {offense = 0.5, defense = 5.9, specialattack = 4.2, life = 900, vitality = 5.5, agility = 115, exp = 250, level = 30, wildLvl = 1, type = 'grass', type2 = 'poison'},
		
	['Vileplume'] = {offense = 1, defense = 6.5, specialattack = 6.5, life = 1100, vitality = 7, agility = 200, exp = 750, level = 50, wildLvl = 1, type = 'grass', type2 = 'poison'},
		
	['Shiny Vileplume'] = {offense = 1, defense = 6, specialattack = 6.5, life = 1100, vitality = 5, agility = 200, exp = 750, level = 80, wildLvl = 5, type = 'grass', type2 = 'poison'},
	
	['Bellossom'] = {offense = 1, defense = 6.8, specialattack = 8.1, life = 1400, vitality = 7, agility = 200, exp = 900, level = 50, wildLvl = 1, type = 'grass', type2 = 'poison'},

	['Seel'] = {offense = 0.7, defense = 6, specialattack = 1.5, life = 1050, vitality = 3, agility = 200, exp = 350, level = 20, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Dewgong'] = {offense = 1.2, defense = 7, specialattack = 7, life = 1800, vitality = 5.5, agility = 200, exp = 900, level = 60, wildLvl = 1, type = 'water', type2 = 'ice'},

	['Spearow'] = {offense = 0.7, defense = 5, specialattack = 1.5, life = 650, vitality = 2.4, agility = 200, exp = 100, level = 10, wildLvl = 1, type = 'normal', type2 = 'flying'},
	
	['Fearow'] = {offense = 1.3, defense = 8, specialattack = 6.8, life = 1600, vitality = 4.5, agility = 220, exp = 850, level = 50, wildLvl = 1.7, type = 'normal', type2 = 'flying'},
	
	['Shiny Fearow'] = {offense = 1.3, defense = 8, specialattack = 6.8, life = 1600, vitality = 4.5, agility = 220, exp = 850, level = 80, wildLvl = 5, type = 'normal', type2 = 'flying'},

	['Weedle'] = {offense = 0.5, defense = 3, specialattack = 1, life = 210, vitality = 3, agility = 150, exp = 100, level = 1, wildLvl = 1, type = 'bug', type2 = 'poison'},
	
	['Kakuna'] = {offense = 1, defense = 4.5, specialattack = 2.5, life = 900, vitality = 4, agility = 200, exp = 130, level = 12, wildLvl = 1, type = 'bug', type2 = 'poison'},
	
	['Beedrill'] = {offense = 1.3, defense = 5.5, specialattack = 6, life = 1170, vitality = 4.5, agility = 240, exp = 255, level = 30, wildLvl = 1, type = 'bug', type2 = 'poison'},
	
	['Shiny Beedrill'] = {offense = 1.3, defense = 5.5, specialattack = 6, life = 1170, vitality = 4.5, agility = 240, exp = 255, level = 50, wildLvl = 5, type = 'bug', type2 = 'poison'},

	['Caterpie'] = {offense = 0.5, defense = 3, specialattack = 1, life = 210, vitality = 3, agility = 180, exp = 100, level = 1, wildLvl = 1, type = 'bug', type2 = 'no type'},
	
	['Metapod'] = {offense = 1, defense = 4.5, specialattack = 2.5, life = 900, vitality = 3.9, agility = 170, exp = 120, level = 12, wildLvl = 1, type = 'bug', type2 = 'no type'},
	
	['Butterfree'] = {offense = 1.3, defense = 5.5, specialattack = 6, life = 1170, vitality = 4.5, agility = 240, exp = 255, level = 30, wildLvl = 1, type = 'bug', type2 = 'no type'},
		
	['Shiny Butterfree'] = {offense = 1.3, defense = 5.5, specialattack = 6, life = 1170, vitality = 4.5, agility = 240, exp = 255, level = 50, wildLvl = 5, type = 'bug', type2 = 'no type'},
	
	['Zubat'] = {offense = 0.5, defense = 3.5, specialattack = 1.5, life = 650, vitality = 4, agility = 200, exp = 80, level = 10, wildLvl = 1, type = 'poison', type2 = 'flying'},
	
	['Golbat'] = {offense = 1, defense = 6, specialattack = 6.4, life = 1150, vitality = 5, agility = 220, exp = 250, level = 35, wildLvl = 1, type = 'poison', type2 = 'flying'},

	['Crobat'] = {offense = 2.5, defense = 8, specialattack = 7.6, life = 1900, vitality = 7, agility = 250, exp = 1500, level = 80, wildLvl = 1, type = 'poison', type2 = 'flying'},
	
	['Shiny Zubat'] = {offense = 0.5, defense = 3.5, specialattack = 1.5, life = 650, vitality = 4, agility = 200, exp = 80, level = 30, wildLvl = 5, type = 'poison', type2 = 'flying'},
	
	['Shiny Golbat'] = {offense = 1, defense = 6, specialattack = 6.4, life = 1150, vitality = 5, agility = 220, exp = 250, level = 50, wildLvl = 5, type = 'poison', type2 = 'flying'},

	['Shiny Crobat'] = {offense = 2.5, defense = 8, specialattack = 7.6, life = 1900, vitality = 7, agility = 250, exp = 1500, level = 80, wildLvl = 5, type = 'poison', type2 = 'flying'},

	['Goldeen'] = {offense = 0.7, defense = 6, specialattack = 1.5, life = 450, vitality = 3, agility = 200, exp = 150, level = 10, wildLvl = 1, type = 'water', type2 = 'no type'},
		
	['Seaking'] = {offense = 1.3, defense = 7, specialattack = 6, life = 2000, vitality = 6.3, agility = 200, exp = 350, level = 35, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Pichu'] = {offense = 0.5, defense = 2.5, specialattack = 1.8, life = 700, vitality = 1.4, agility = 200, exp = 250, level = 10, wildLvl = 1, type = 'electric', type2 = 'no type'},
	
	['Pikachu'] = {offense = 0.7, defense = 5.4, specialattack = 3.2, life = 1400, vitality = 3.4, agility = 200, exp = 450, level = 35, wildLvl = 1, type = 'electric', type2 = 'no type'},
	
	['Raichu'] = {offense = 1.5, defense = 8, specialattack = 8.5, life = 2200, vitality = 7.7, agility = 220, exp = 10, level = 75, wildLvl = 1, type = 'electric', type2 = 'no type'},
	
	['Shiny Raichu'] = {offense = 1.5, defense = 8, specialattack = 10, life = 2200, vitality = 7.7, agility = 220, exp = 1500, level = 100, wildLvl = 5, type = 'electric', type2 = 'no type'},

	['Cleffa'] = {offense = 0.5, defense = 4, specialattack = 3, life = 1200, vitality = 3.3, agility = 200, exp = 250, level = 15, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Clefairy'] = {offense = 0.9, defense = 6, specialattack = 6, life = 1550, vitality = 4.3, agility = 200, exp = 400, level = 40, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Clefable'] = {offense = 1, defense = 8, specialattack = 7, life = 3800, vitality = 7, agility = 200, exp = 1500, level = 70, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Pidgey'] = {offense = 0.7, defense = 4, specialattack = 3, life = 400, vitality = 2.4, agility = 200, exp = 100, level = 1, wildLvl = 1, type = 'normal', type2 = 'flying'},

	['Pidgeotto'] = {offense = 0.9, defense = 5.2, specialattack = 5, life = 1050, vitality = 3.5, agility = 350, exp = 250, level = 20, wildLvl = 1, type = 'normal', type2 = 'flying'},
	
	['Pidgeot'] = {offense = 1.6, defense = 7, specialattack = 9, life = 2100, vitality = 9, agility = 350, exp = 1100, level = 80, wildLvl = 1, type = 'normal', type2 = 'flying'},
	
	['Shiny Pidgeot'] = {offense = 1.6, defense = 9, specialattack = 9, life = 2100, vitality = 9, agility = 350, exp = 1100, level = 100, wildLvl = 5, type = 'normal', type2 = 'flying'},

	['Staryu'] = {offense = 0.9, defense = 4, specialattack = 1.5, life = 1400, vitality = 4, agility = 200, exp = 250, level = 20, wildLvl = 1, type = 'water', type2 = 'psychic'},

	['Starmie'] = {offense = 1.2, defense = 8, specialattack = 7, life = 2300, vitality = 6.7, agility = 200, exp = 650, level = 80, wildLvl = 1, type = 'water', type2 = 'psychic'},

	['Poliwag'] = {offense = 0.7, defense = 4, specialattack = 1.8, life = 300, vitality = 2, agility = 200, exp = 150, level = 5, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Poliwhirl'] = {offense = 0.9, defense = 8, specialattack = 5, life = 900, vitality = 4.5, agility = 200, exp = 250, level = 25, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Poliwrath'] = {offense = 8, defense = 7.5, specialattack = 6.5, life = 2300, vitality = 8, agility = 200, exp = 1100, level = 80, wildLvl = 1, type = 'water', type2 = 'fighting'},

	['Politoed'] = {offense = 4, defense = 8, specialattack = 9, life = 1700, vitality = 5, agility = 200, exp = 1100, level = 70, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Shiny Politoed'] = {offense = 4, defense = 8, specialattack = 9, life = 1700, vitality = 5, agility = 200, exp = 1100, level = 70, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Mankey'] = {offense = 1.2, defense = 6, specialattack = 3.5, life = 550, vitality = 2.1, agility = 200, exp = 100, level = 10, wildLvl = 1, type = 'fighting', type2 = 'no type'},
	
	['Primeape'] = {offense = 5, defense = 7, specialattack = 7, life = 1950, vitality = 5, agility = 200, exp = 450, level = 50, wildLvl = 1, type = 'fighting', type2 = 'no type'},

	['Paras'] = {offense = 0.7, defense = 6, specialattack = 4.5, life = 500, vitality = 1.5, agility = 125, exp = 40, level = 1, wildLvl = 1, type = 'bug', type2 = 'grass'},
		
	['Parasect'] = {offense = 1.5, defense = 7, specialattack = 5, life = 1400, vitality = 4.3, agility = 200, exp = 250, level = 50, wildLvl = 1, type = 'bug', type2 = 'grass'},
	
	['Shiny Paras'] = {offense = 0.7, defense = 6, specialattack = 4.5, life = 500, vitality = 1.5, agility = 125, exp = 40, level = 20, wildLvl = 5, type = 'bug', type2 = 'grass'},
		
	['Shiny Parasect'] = {offense = 1.5, defense = 7, specialattack = 5, life = 1400, vitality = 4.3, agility = 200, exp = 250, level = 80, wildLvl = 5, type = 'bug', type2 = 'grass'},
	
	['Eevee'] = {offense = 0.9, defense = 8, specialattack = 2, life = 650, vitality = 4.5, agility = 200, exp = 450, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Flareon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 60, wildLvl = 1, type = 'fire', type2 = 'no type'},
	
	['Jolteon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 60, wildLvl = 1, type = 'electric', type2 = 'no type'},
	
	['Vaporeon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 60, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Espeon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 60, wildLvl = 1, type = 'psychic', type2 = 'no type'},

	['Umbreon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 60, wildLvl = 1, type = 'dark', type2 = 'no type'},

	['Shiny Flareon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 80, wildLvl = 5, type = 'fire', type2 = 'no type'},
	
	['Shiny Jolteon'] = {offense = 3, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 80, wildLvl = 5, type = 'electric', type2 = 'no type'},
	
	['Shiny Vaporeon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 80, wildLvl = 5, type = 'water', type2 = 'no type'},

	['Shiny Espeon'] = {offense = 2, defense = 8, specialattack = 10, life = 1800, vitality = 7, agility = 230, exp = 650, level = 80, wildLvl = 5, type = 'psychic', type2 = 'no type'},

	['Shiny Umbreon'] = {offense = 2, defense = 8, specialattack = 7, life = 1800, vitality = 7, agility = 230, exp = 650, level = 80, wildLvl = 5, type = 'dark', type2 = 'no type'},

	['Slowpoke'] = {offense = 0.7, defense = 4, specialattack = 3, life = 400, vitality = 2.6, agility = 180, exp = 100, level = 15, wildLvl = 1, type = 'water', type2 = 'psychic'},

	['Slowbro'] = {offense = 1.5, defense = 11, specialattack = 7, life = 2700, vitality = 4.5, agility = 200, exp = 250, level = 45, wildLvl = 1, type = 'water', type2 = 'psychic'},

--// ALL'S POKÉMONS FOSSEIS \\--
	
	['Omanyte'] = {offense = 0.9, defense = 7, specialattack = 3, life = 1050, vitality = 4.5, agility = 190, exp = 100, level = 20, wildLvl = 1, type = 'rock', type2 = 'water'},
	
	['Omastar'] = {offense = 2.1, defense = 9, specialattack = 8, life = 2500, vitality = 9.8, agility = 120, exp = 1100, level = 80, wildLvl = 1, type = 'rock', type2 = 'water'},
	
	['Kabuto'] = {offense = 0.9, defense = 7, specialattack = 3, life = 650, vitality = 4.2, agility = 190, exp = 100, level = 20, wildLvl = 1, type = 'rock', type2 = 'water'},
	
	['Kabutops'] = {offense = 2.1, defense = 9, specialattack = 8, life = 2500, vitality = 9.8, agility = 210, exp = 1100, level = 80, wildLvl = 1, type = 'rock', type2 = 'water'},	

	['Aerodactyl'] = {offense = 3, defense = 14, specialattack = 12, life = 4200, vitality = 22, agility = 330, exp = 2500, level = 120, wildLvl = 1, type = 'rock', type2 = 'flying'},

--// ALL'S POKÉMONS HIGH LEVEL \\--
	['Magmar'] = {offense = 1.5, defense = 8.3, specialattack = 8.7, life = 2500, vitality = 10, agility = 200, exp = 1800, level = 90, wildLvl = 1, type = 'fire', type2 = 'no type'},
	
	['Electabuzz'] = {offense = 1.5, defense = 8.3, specialattack = 8.7, life = 2500, vitality = 10, agility = 200, exp = 25, level = 90, wildLvl = 1, type = 'electric', type2 = 'no type'},
	
	['Scyther'] = {offense = 2.1, defense = 8.2, specialattack = 7, life = 2500, vitality = 10.4, agility = 250, exp = 1800, level = 90, wildLvl = 1, type = 'bug', type2 = 'flying'},

	['Shiny Magmar'] = {offense = 1.5, defense = 8.3, specialattack = 8.7, life = 2500, vitality = 10, agility = 200, exp = 1800, level = 120, wildLvl = 5, type = 'fire', type2 = 'no type'},
	
	['Shiny Electabuzz'] = {offense = 1.5, defense = 8.3, specialattack = 8.7, life = 2500, vitality = 10, agility = 200, exp = 1800, level = 120, wildLvl = 5, type = 'electric', type2 = 'no type'},
	
	['Shiny Scyther'] = {offense = 2.1, defense = 9.5, specialattack = 7, life = 2500, vitality = 10.4, agility = 250, exp = 1800, level = 120, wildLvl = 5, type = 'bug', type2 = 'flying'},

	['Heracross'] = {offense = 2.1, defense = 6.5, specialattack = 9, life = 2700, vitality = 8.4, agility = 250, exp = 1800, level = 90, wildLvl = 1, type = 'bug', type2 = 'fighting'},	

	['Gyarados'] = {offense = 1.8, defense = 8.4, specialattack = 7.5, life = 2800, vitality = 11, agility = 200, exp = 1800, level = 100, wildLvl = 1, type = 'water', type2 = 'dragon'},
	
	['Shiny Gyarados'] = {offense = 1.8, defense = 8.4, specialattack = 7.5, life = 2800, vitality = 11, agility = 200, exp = 1800, level = 120, wildLvl = 5, type = 'water', type2 = 'dragon'},
	
	['Kangaskhan'] = {offense = 2.1, defense = 9, specialattack = 7.7, life = 2500, vitality = 9.7, agility = 195, exp = 1100, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Pinsir'] = {offense = 2, defense = 10, specialattack = 8, life = 2500, vitality = 8.1, agility = 200, exp = 650, level = 75, wildLvl = 1, type = 'bug', type2 = 'no type'},
	
	['Shiny Pinsir'] = {offense = 2, defense = 10, specialattack = 8, life = 2500, vitality = 8.1, agility = 200, exp = 650, level = 100, wildLvl = 5, type = 'bug', type2 = 'no type'},
	
	['Mr. Mime'] = {offense = 1.4, defense = 7.7, specialattack = 8.6, life = 3200, vitality = 8.7, agility = 200, exp = 650, level = 70, wildLvl = 1, type = 'psychic', type2 = 'no type'},	
		
	['Shiny Mr. Mime'] = {offense = 1.4, defense = 7.7, specialattack = 8.6, life = 3200, vitality = 8.7, agility = 200, exp = 650, level = 100, wildLvl = 5, type = 'psychic', type2 = 'no type'},	
	
	['Scizor'] = {offense = 1, defense = 12, specialattack = 9, life = 2800, vitality = 10, agility = 250, exp = 1450, level = 100, wildLvl = 1, type = 'bug', type2 = 'steel'},
		
	['Jynx'] = {offense = 1.3, defense = 8.2, specialattack = 8.2, life = 3200, vitality = 9.8, agility = 200, exp = 1100, level = 80, wildLvl = 1, type = 'ice', type2 = 'psychic'},	
		
	['Shiny Jynx'] = {offense = 1.3, defense = 8.2, specialattack = 8.2, life = 3200, vitality = 9.8, agility = 200, exp = 1100, level = 120, wildLvl = 5, type = 'ice', type2 = 'psychic'},	

	['Mantine'] = {offense = 1.5, defense = 11, specialattack = 7, life = 2500, vitality = 7.5, agility = 200, exp = 1300, level = 80, wildLvl = 1, type = 'water', type2 = 'flying'},
	
	['Kingdra'] = {offense = 3, defense = 8, specialattack = 8, life = 2000, vitality = 8, agility = 250, exp = 1300, level = 80, wildLvl = 1, type = 'water', type2 = 'dragon'},
		
	['Slowking'] = {offense = 1, defense = 8, specialattack = 11, life = 2500, vitality = 7, agility = 200, exp = 1300, level = 80, wildLvl = 1, type = 'water', type2 = 'psychic'},

	['Wobbuffet'] = {offense = 1, defense = 10, specialattack = 8, life = 2500, vitality = 8, agility = 200, exp = 1300, level = 80, wildLvl = 1, type = 'psychic', type2 = 'no type'},

	['Tyranitar'] = {offense = 2, defense = 9, specialattack = 7, life = 2800, vitality = 10, agility = 200, exp = 1650, level = 100, wildLvl = 1, type = 'ground', type2 = 'dark'},	

	['Steelix'] = {offense = 1.7, defense = 13, specialattack = 10, life = 2800, vitality = 10, agility = 200, exp = 1400, level = 100, wildLvl = 1, type = 'ground', type2 = 'steel'},
	
	['Shiny Tyranitar'] = {offense = 2, defense = 9, specialattack = 7, life = 2800, vitality = 10, agility = 200, exp = 1650, level = 120, wildLvl = 5, type = 'ground', type2 = 'dark'},	

	['Shiny Steelix'] = {offense = 1.7, defense = 13, specialattack = 10, life = 2800, vitality = 10, agility = 200, exp = 1400, level = 120, wildLvl = 5, type = 'ground', type2 = 'steel'},
	
	['Lapras'] = {offense = 1.2, defense = 9, specialattack = 8.8, life = 2500, vitality = 10, agility = 200, exp = 1100, level = 90, wildLvl = 1, type = 'water', type2 = 'ice'},
	
	['Snorlax'] = {offense = 1.5, defense = 10, specialattack = 6.5, life = 3000, vitality = 10, agility = 200, exp = 1100, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Shiny Snorlax'] = {offense = 1.5, defense = 10, specialattack = 6.5, life = 3000, vitality = 10, agility = 200, exp = 1100, level = 120, wildLvl = 5, type = 'normal', type2 = 'no type'},

	['Ursaring'] = {offense = 3, defense = 8, specialattack = 9.5, life = 3000, vitality = 7, agility = 200, exp = 1400, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Miltank'] = {offense = 1, defense = 12, specialattack = 7, life = 2500, vitality = 8, agility = 250, exp = 1400, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Dragonite'] = {offense = 2.2, defense = 9, specialattack = 9.5, life = 4000, vitality = 12, agility = 200, exp = 1500, level = 100, wildLvl = 1, type = 'dragon', type2 = 'flying'},
		
	['Shiny Dragonite'] = {offense = 2.2, defense = 9, specialattack = 9.5, life = 4000, vitality = 12, agility = 200, exp = 1500, level = 120, wildLvl = 5, type = 'dragon', type2 = 'flying'},
	
	['Hitmonchan'] = {offense = 3, defense = 8, specialattack = 7, life = 3000, vitality = 9, agility = 250, exp = 1300, level = 60, wildLvl = 1, type = 'fighting', type2 = 'no type'},
	
	['Hitmonlee'] = {offense = 3, defense = 8, specialattack = 7, life = 3000, vitality = 9, agility = 250, exp = 1300, level = 60, wildLvl = 1, type = 'fighting', type2 = 'no type'},

	['Hitmontop'] = {offense = 3, defense = 8, specialattack = 7, life = 3000, vitality = 9, agility = 250, exp = 1300, level = 60, wildLvl = 1, type = 'fighting', type2 = 'no type'},	
	
	['Shiny Hitmonchan'] = {offense = 5, defense = 8, specialattack = 7, life = 3000, vitality = 9, agility = 250, exp = 1300, level = 80, wildLvl = 5, type = 'fighting', type2 = 'no type'},
	
	['Shiny Hitmonlee'] = {offense = 5, defense = 8, specialattack = 7, life = 3000, vitality = 9, agility = 250, exp = 1300, level = 80, wildLvl = 5, type = 'fighting', type2 = 'no type'},

	['Shiny Hitmontop'] = {offense = 5, defense = 8, specialattack = 7, life = 3000, vitality = 9, agility = 250, exp = 1300, level = 80, wildLvl = 5, type = 'fighting', type2 = 'no type'},	

	['Skarmory'] = {offense = 2, defense = 10, specialattack = 8.5, life = 2200, vitality = 9, agility = 350, exp = 1400, level = 90, wildLvl = 1, type = 'steel', type2 = 'flying'},
	
	['Sudowoodo'] = {offense = 1.8, defense = 10, specialattack = 15, life = 3000, vitality = 13, agility = 250, exp = 1300, level = 120, wildLvl = 1, type = 'rock', type2 = 'no type'},

	['Shiny Skarmory'] = {offense = 2, defense = 10, specialattack = 12, life = 2200, vitality = 9, agility = 350, exp = 1400, level = 100, wildLvl = 5, type = 'steel', type2 = 'flying'},
	
	['Shiny Sudowoodo'] = {offense = 1.8, defense = 12, specialattack = 15, life = 3000, vitality = 13, agility = 250, exp = 1300, level = 120, wildLvl = 5, type = 'rock', type2 = 'no type'},

	['Misdreavus'] = {offense = 1, defense = 7, specialattack = 11, life = 2500, vitality = 9, agility = 200, exp = 1300, level = 90, wildLvl = 1, type = 'ghost', type2 = 'no type'},	

	['Girafarig'] = {offense = 1.5, defense = 6, specialattack = 11, life = 3200, vitality = 7, agility = 250, exp = 850, level = 80, wildLvl = 1, type = 'normal', type2 = 'psychic'},

	['Blissey'] = {offense = 1.5, defense = 9, specialattack = 9, life = 3500, vitality = 9, agility = 200, exp = 450, level = 100, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Zapdos'] = {offense = 3, defense = 150, specialattack = 10, life = 30000, vitality = 13, agility = 500, exp = 1300, level = 200, wildLvl = 1, type = 'electric', type2 = 'no type'},

	['Moltres'] = {offense = 3, defense = 150, specialattack = 11, life = 30000, vitality = 9, agility = 500, exp = 1300, level = 200, wildLvl = 1, type = 'fire', type2 = 'no type'},	

	['Articuno'] = {offense = 3, defense = 150, specialattack = 11, life = 30000, vitality = 7, agility = 500, exp = 850, level = 200, wildLvl = 1, type = 'ice', type2 = 'no type'},
	
	['Mew'] = {offense = 3, defense = 150, specialattack = 11, life = 30000, vitality = 7, agility = 500, exp = 850, level = 200, wildLvl = 1, type = 'psychic', type2 = 'no type'},
	
	['Mewtwo'] = {offense = 3, defense = 150, specialattack = 11, life = 30000, vitality = 7, agility = 500, exp = 850, level = 200, wildLvl = 1, type = 'psychic', type2 = 'no type'},
	
--// FINALE THE ALL'S POKÉMONS HIGH LEVEL \\ --

	['Gastly'] = {offense = 0.9, defense = 4, specialattack = 2, life = 800, vitality = 3, agility = 200, exp = 250, level = 20, wildLvl = 1, type = 'ghost', type2 = 'poison'},
	
	['Haunter'] = {offense = 1.3, defense = 6, specialattack = 3, life = 1200, vitality = 5, agility = 200, exp = 450, level = 40, wildLvl = 1, type = 'ghost', type2 = 'poison'},
	
	['Gengar'] = {offense = 1.5, defense = 9, specialattack = 8, life = 2000, vitality = 7, agility = 200, exp = 1100, level = 80, wildLvl = 1, type = 'ghost', type2 = 'poison'},	
	
	['Shiny Gengar'] = {offense = 1.5, defense = 13, specialattack = 10, life = 2000, vitality = 7, agility = 200, exp = 1100, level = 100, wildLvl = 5, type = 'ghost', type2 = 'poison'},	

	['Tauros'] = {offense = 1.2, defense = 9, specialattack = 5, life = 1500, vitality = 6, agility = 250, exp = 450, level = 50, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Shiny Tauros'] = {offense = 3, defense = 9, specialattack = 8, life = 1500, vitality = 6, agility = 250, exp = 450, level = 100, wildLvl = 5, type = 'normal', type2 = 'no type'},

	['Venonat'] = {offense = 0.8, defense = 6, specialattack = 4, life = 650, vitality = 2.3, agility = 200, exp = 100, level = 20, wildLvl = 1, type = 'bug', type2 = 'poison'},

	['Venomoth'] = {offense = 1.2, defense = 8, specialattack = 9, life = 1800, vitality = 6.5, agility = 200, exp = 450, level = 50, wildLvl = 1, type = 'bug', type2 = 'poison'},
	
	['Shiny Venonat'] = {offense = 0.8, defense = 6, specialattack = 4, life = 650, vitality = 2.3, agility = 200, exp = 100, level = 20, wildLvl = 5, type = 'bug', type2 = 'poison'},

	['Shiny Venomoth'] = {offense = 3, defense = 8, specialattack = 7, life = 1800, vitality = 9, agility = 200, exp = 450, level = 80, wildLvl = 5, type = 'bug', type2 = 'poison'},
	
	['Porygon'] = {offense = 1.7, defense = 8, specialattack = 7, life = 1200, vitality = 5.3, agility = 200, exp = 1100, level = 40, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Porygon2'] = {offense = 2, defense = 7, specialattack = 10, life = 2500, vitality = 7, agility = 250, exp = 1400, level = 80, wildLvl = 1, type = 'normal', type2 = 'psychic'},
	
	['Rattata'] = {offense = 0.2, defense = 6, specialattack = 2.5, life = 350, vitality = 3, agility = 190, exp = 35, level = 1, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Raticate'] = {offense = 1.5, defense = 7, specialattack = 3.5, life = 1950, vitality = 3.5, agility = 190, exp = 250, level = 30, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Shiny Rattata'] = {offense = 0.2, defense = 6, specialattack = 2.5, life = 350, vitality = 3, agility = 190, exp = 35, level = 20, wildLvl = 5, type = 'normal', type2 = 'no type'},

	['Shiny Raticate'] = {offense = 1.5, defense = 7, specialattack = 3.5, life = 1950, vitality = 3.5, agility = 190, exp = 250, level = 50, wildLvl = 5, type = 'normal', type2 = 'no type'},

	['Onix'] = {offense = 1.2, defense = 9, specialattack = 6.3, life = 2980, vitality = 7.2, agility = 200, exp = 750, level = 50, wildLvl = 1, type = 'rock', type2 = 'ground'},
	
	['Shiny Onix'] = {offense = 1.2, defense = 9, specialattack = 6.3, life = 2980, vitality = 7.2, agility = 200, exp = 750, level = 80, wildLvl = 5, type = 'rock', type2 = 'ground'},
	
	['Chansey'] = {offense = 1.5, defense = 9, specialattack = 7.8, life = 2500, vitality = 8.7, agility = 200, exp = 450, level = 60, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Psyduck'] = {offense = 0.7, defense = 6, specialattack = 2.5, life = 700, vitality = 2.6, agility = 200, exp = 100, level = 20, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Golduck'] = {offense = 1.2, defense = 8.4, specialattack = 6.8, life = 1700, vitality = 6, agility = 210, exp = 650, level = 70, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Shellder'] = {offense = 0.9, defense = 4, specialattack = 1.2, life = 250, vitality = 2.3, agility = 175, exp = 250, level = 10, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Cloyster'] = {offense = 1.2, defense = 9, specialattack = 5.5, life = 2400, vitality = 5.5, agility = 200, exp = 900, level = 60, wildLvl = 1, type = 'water', type2 = 'ice'},
	
	['Growlithe'] = {offense = 1, defense = 4.5, specialattack = 7, life = 1950, vitality = 5.5, agility = 200, exp = 250, level = 25, wildLvl = 1, type = 'fire', type2 = 'no type'},

	['Arcanine'] = {offense = 3, defense = 9, specialattack = 9.5, life = 3450, vitality = 8.6, agility = 200, exp = 1100, level = 90, wildLvl = 1, type = 'fire', type2 = 'no type'},
	
	['Shiny Growlithe'] = {offense = 1, defense = 4.5, specialattack = 7, life = 1950, vitality = 5.5, agility = 200, exp = 250, level = 30, wildLvl = 5, type = 'fire', type2 = 'no type'},

	['Shiny Arcanine'] = {offense = 3, defense = 9, specialattack = 9.5, life = 3450, vitality = 8.6, agility = 200, exp = 1100, level = 100, wildLvl = 5, type = 'fire', type2 = 'no type'},

	['Horsea'] = {offense = 0.7, defense = 7, specialattack = 1.5, life = 350, vitality = 3, agility = 200, exp = 100, level = 10, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Seadra'] = {offense = 1.2, defense = 6.5, specialattack = 8, life = 1100, vitality = 6.5, agility = 200, exp = 350, level = 40, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Shiny Horsea'] = {offense = 0.7, defense = 7, specialattack = 1.5, life = 350, vitality = 3, agility = 200, exp = 100, level = 20, wildLvl = 5, type = 'water', type2 = 'no type'},
	
	['Shiny Seadra'] = {offense = 1.2, defense = 6.5, specialattack = 8, life = 1100, vitality = 6.5, agility = 200, exp = 350, level = 60, wildLvl = 5, type = 'water', type2 = 'no type'},

	['Vulpix'] = {offense = 0.9, defense = 4, specialattack = 5, life = 1050, vitality = 2.9, agility = 200, exp = 100, level = 20, wildLvl = 1, type = 'fire', type2 = 'no type'},

	['Ninetales'] = {offense = 1.2, defense = 8, specialattack = 8.1, life = 2500, vitality = 5.6, agility = 250, exp = 650, level = 70, wildLvl = 1, type = 'fire', type2 = 'no type'},	

	['Shiny Ninetales'] = {offense = 1.2, defense = 8, specialattack = 8.1, life = 2500, vitality = 5.6, agility = 250, exp = 650, level = 80, wildLvl = 5, type = 'fire', type2 = 'no type'},	

	['Diglett'] = {offense = 0.8, defense = 6, specialattack = 3.5, life = 550, vitality = 2.5, agility = 180, exp = 100, level = 10, wildLvl = 1, type = 'ground', type2 = 'no type'},
	
	['Dugtrio'] = {offense = 1.2, defense = 8, specialattack = 5, life = 2200, vitality = 3.5, agility = 180, exp = 450, level = 35, wildLvl = 1, type = 'ground', type2 = 'no type'},

	['Machop'] = {offense = 1.5, defense = 5, specialattack = 3.5, life = 950, vitality = 3.4, agility = 190, exp = 100, level = 20, wildLvl = 1, type = 'fighting', type2 = 'no type'},
	
	['Machoke'] = {offense = 3, defense = 7.2, specialattack = 5, life = 1800, vitality = 6.9, agility = 190, exp = 450, level = 45, wildLvl = 1, type = 'fighting', type2 = 'no type'},	
	
	['Machamp'] = {offense = 4, defense = 7.8, specialattack = 8, life = 2400, vitality = 9.8, agility = 200, exp = 400, level = 80, wildLvl = 1, type = 'fighting', type2 = 'no type'},
	
	['Shiny Machamp'] = {offense = 3, defense = 7.8, specialattack = 8, life = 2400, vitality = 9.8, agility = 200, exp = 1800, level = 100, wildLvl = 5, type = 'fighting', type2 = 'no type'},

	['Sandshrew'] = {offense = 0.9, defense = 8, specialattack = 2, life = 650, vitality = 2.9, agility = 180, exp = 100, level = 20, wildLvl = 1, type = 'ground', type2 = 'no type'},
	
	['Sandslash'] = {offense = 1.7, defense = 8.4, specialattack = 6.2, life = 2400, vitality = 5.7, agility = 230, exp = 1100, level = 70, wildLvl = 1, type = 'ground', type2 = 'no type'},
	
	['Shiny Sandslash'] = {offense = 1.7, defense = 8.4, specialattack = 6.2, life = 2400, vitality = 5.7, agility = 230, exp = 1100, level = 100, wildLvl = 5, type = 'ground', type2 = 'no type'},

-- Other Pokemons Not Base Balanceament --

	['Ekans'] = {offense = 0.9, defense = 6, specialattack = 4, life = 400, vitality = 2.5, agility = 180, exp = 100, level = 10, wildLvl = 1, type = 'poison', type2 = 'no type'},

	['Arbok'] = {offense = 1.2, defense = 8, specialattack = 6.5, life = 1700, vitality = 4.6, agility = 190, exp = 450, level = 35, wildLvl = 1, type = 'poison', type2 = 'no type'},
	
	['Nidoran Male'] = {offense = 0.8, defense = 4, specialattack = 4, life = 450, vitality = 2.2, agility = 180, exp = 100, level = 10, wildLvl = 1, type = 'poison', type2 = 'no type'},
	
	['Nidoran Female'] = {offense = 0.7, defense = 4, specialattack = 4, life = 550, vitality = 2.1, agility = 180, exp = 100, level = 10, wildLvl = 1, type = 'poison', type2 = 'no type'},

	['Nidorino'] = {offense = 1.3, defense = 6, specialattack = 5.5, life = 1150, vitality = 3.1, agility = 182, exp = 250, level = 30, wildLvl = 1, type = 'poison', type2 = 'no type'},
	
	['Nidorina'] = {offense = 0.9, defense = 5.9, specialattack = 5.6, life = 1280, vitality = 3.4, agility = 180, exp = 250, level = 30, wildLvl = 1, type = 'poison', type2 = 'no type'},
	
	['Nidoking'] = {offense = 1.9, defense = 10, specialattack = 8.5, life = 2700, vitality = 8, agility = 200, exp = 650, level = 70, wildLvl = 1, type = 'poison', type2 = 'ground'},
	
	['Shiny Nidoking'] = {offense = 1.9, defense = 10, specialattack = 8.5, life = 2700, vitality = 8, agility = 200, exp = 650, level = 100, wildLvl = 5, type = 'poison', type2 = 'ground'},
	
	['Nidoqueen'] = {offense = 1.2, defense = 10, specialattack = 8.5, life = 2700, vitality = 8, agility = 200, exp = 650, level = 70, wildLvl = 1, type = 'poison', type2 = 'ground'},
--
	['Meowth'] = {offense = 0.8, defense = 6, specialattack = 4, life = 600, vitality = 2.1, agility = 180, exp = 100, level = 15, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Persian'] = {offense = 1.3, defense = 7.8, specialattack = 6.7, life = 2700, vitality = 3.7, agility = 200, exp = 250, level = 50, wildLvl = 1, type = 'normal', type2 = 'no type'},
--
	
	['Abra'] = {offense = 0.7, defense = 1.5, specialattack = 4, life = 1000, vitality = 3.0, agility = 120, exp = 250, level = 15, wildLvl = 1, type = 'psychic', type2 = 'no type'},
	
	['Shiny Abra'] = {offense = 0.7, defense = 1.5, specialattack = 4, life = 1000, vitality = 3.0, agility = 120, exp = 250, level = 30, wildLvl = 5, type = 'psychic', type2 = 'no type'},

	['Kadabra'] = {offense = 0.9, defense = 3, specialattack = 6, life = 1600, vitality = 6.5, agility = 130, exp = 450, level = 45, wildLvl = 1, type = 'psychic', type2 = 'no type'},
	
	['Alakazam'] = {offense = 1.8, defense = 4, specialattack = 10, life = 2000, vitality = 9, agility = 130, exp = 1100, level = 80, wildLvl = 1, type = 'psychic', type2 = 'no type'},
	
	['Shiny Alakazam'] = {offense = 1.8, defense = 4, specialattack = 13, life = 2000, vitality = 9, agility = 130, exp = 1100, level = 100, wildLvl = 5, type = 'psychic', type2 = 'no type'},
--	
	['Bellsprout'] = {offense = 0.9, defense = 2.8, specialattack = 1.8, life = 300, vitality = 3.2, agility = 112, exp = 100, level = 5, wildLvl = 1, type = 'grass', type2 = 'poison'},
	
	['Weepinbell'] = {offense = 1.2, defense = 6.2, specialattack = 5, life = 1100, vitality = 5.2, agility = 120, exp = 250, level = 30, wildLvl = 1, type = 'grass', type2 = 'poison'},
	
	['Victreebel'] = {offense = 1.8, defense = 8.4, specialattack = 7, life = 2200, vitality = 7.7, agility = 200, exp = 650, level = 70, wildLvl = 1, type = 'grass', type2 = 'poison'},
--
	['Tentacool'] = {offense = 1, defense = 2.5, specialattack = 1.5, life = 600, vitality = 3.5, agility = 170, exp = 350, level = 15, wildLvl = 1, type = 'water', type2 = 'poison'},
	
	['Tentacruel'] = {offense = 1.7, defense = 8, specialattack = 8, life = 2600, vitality = 9, agility = 200, exp = 1100, level = 80, wildLvl = 1, type = 'water', type2 = 'poison'},

	['Shiny Tentacool'] = {offense = 1, defense = 2.5, specialattack = 1.5, life = 600, vitality = 3.5, agility = 170, exp = 350, level = 20, wildLvl = 5, type = 'water', type2 = 'poison'},
	
	['Shiny Tentacruel'] = {offense = 1.7, defense = 8, specialattack = 8, life = 2600, vitality = 9, agility = 200, exp = 1100, level = 100, wildLvl = 5, type = 'water', type2 = 'poison'},
--	
	['Geodude'] = {offense = 0.7, defense = 5, specialattack = 3, life = 600, vitality = 3.6, agility = 180, exp = 100, level = 15, wildLvl = 1, type = 'rock', type2 = 'ground'},
	
	['Graveler'] = {offense = 0.9, defense = 8, specialattack = 4.5, life = 1550, vitality = 6.3, agility = 190, exp = 450, level = 40, wildLvl = 1, type = 'rock', type2 = 'ground'},
	
	['Golem'] = {offense = 1.2, defense = 10, specialattack = 8, life = 2300, vitality = 8.5, agility = 200, exp = 650, level = 70, wildLvl = 1, type = 'rock', type2 = 'ground'},
	
	['Shiny Golem'] = {offense = 1.2, defense = 10, specialattack = 8, life = 2300, vitality = 8.5, agility = 200, exp = 650, level = 80, wildLvl = 5, type = 'rock', type2 = 'ground'},
--
	['Ponyta'] = {offense = 0.7, defense = 6, specialattack = 3, life = 650, vitality = 2.4, agility = 190, exp = 100, level = 20, wildLvl = 1, type = 'fire', type2 = 'no type'},
	
	['Rapidash'] = {offense = 1.2, defense = 9, specialattack = 8, life = 2000, vitality = 7.5, agility = 320, exp = 650, level = 70, wildLvl = 1, type = 'fire', type2 = 'no type'},
--
	['Grimer'] = {offense = 0.7, defense = 5, specialattack = 3, life = 800, vitality = 2.7, agility = 150, exp = 100, level = 15, wildLvl = 1, type = 'poison', type2 = 'no type'},
		
	['Muk'] = {offense = 1.2, defense = 8, specialattack = 7, life = 2800, vitality = 8.7, agility = 190, exp = 1100, level = 90, wildLvl = 1, type = 'poison', type2 = 'no type'},

	['Shiny Grimer'] = {offense = 0.7, defense = 5, specialattack = 3, life = 800, vitality = 2.7, agility = 150, exp = 100, level = 30, wildLvl = 5, type = 'poison', type2 = 'no type'},
		
	['Shiny Muk'] = {offense = 1.2, defense = 11, specialattack = 7, life = 2800, vitality = 8.7, agility = 190, exp = 1100, level = 100, wildLvl = 5, type = 'poison', type2 = 'no type'},
--	
	['Magnemite'] = {offense = 0.9, defense = 4, specialattack = 3, life = 1200, vitality = 2.5, agility = 200, exp = 100, level = 15, wildLvl = 1, type = 'electric', type2 = 'steel'},
	
	['Magneton'] = {offense = 1.2, defense = 9, specialattack = 7, life = 1800, vitality = 4.5, agility = 170, exp = 650, level = 75, wildLvl = 1, type = 'electric', type2 = 'steel'},
	
	['Shiny Magneton'] = {offense = 1.2, defense = 11, specialattack = 8.5, life = 1800, vitality = 4.5, agility = 170, exp = 650, level = 80, wildLvl = 5, type = 'electric', type2 = 'steel'},
--
	["Farfetch'd"] = {offense = 1.6, defense = 8.6, specialattack = 7.2, life = 1800, vitality = 2.4, agility = 220, exp = 650, level = 45, wildLvl = 1, type = 'normal', type2 = 'flying'},

	["Shiny Farfetch'd"] = {offense = 1.6, defense = 8.6, specialattack = 7.2, life = 1800, vitality = 2.4, agility = 220, exp = 650, level = 80, wildLvl = 5, type = 'normal', type2 = 'flying'},
--
	['Doduo'] = {offense = 0.7, defense = 4, specialattack = 3, life = 600, vitality = 2.9, agility = 200, exp = 250, level = 15, wildLvl = 1, type = 'normal', type2 = 'flying'},
	
	['Dodrio'] = {offense = 0.6, defense = 8, specialattack = 6.3, life = 1500, vitality = 4.5, agility = 240, exp = 450, level = 50, wildLvl = 1, type = 'normal', type2 = 'flying'},
	
	['Shiny Dodrio'] = {offense = 2, defense = 8, specialattack = 6.3, life = 1500, vitality = 4.5, agility = 240, exp = 450, level = 80, wildLvl = 5, type = 'normal', type2 = 'flying'},
--
	['Drowzee'] = {offense = 0.9, defense = 4, specialattack = 3.1, life = 900, vitality = 2.7, agility = 180, exp = 250, level = 30, wildLvl = 1, type = 'psychic', type2 = 'no type'},
		
	['Hypno'] = {offense = 1.2, defense = 9, specialattack = 9, life = 1500, vitality = 6, agility = 200, exp = 650, level = 55, wildLvl = 1, type = 'psychic', type2 = 'no type'},
		
	['Shiny Hypno'] = {offense = 1.2, defense = 9, specialattack = 9, life = 1500, vitality = 6, agility = 200, exp = 650, level = 80, wildLvl = 5, type = 'psychic', type2 = 'no type'},
--
	['Krabby'] = {offense = 0.7, defense = 5, specialattack = 1.2, life = 550, vitality = 2.1, agility = 170, exp = 200, level = 10, wildLvl = 1, type = 'water', type2 = 'no type'},
		
	['Kingler'] = {offense = 1, defense = 9, specialattack = 6.2, life = 1500, vitality = 4.7, agility = 210, exp = 450, level = 50, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Shiny Krabby'] = {offense = 0.7, defense = 5, specialattack = 1.2, life = 550, vitality = 2.1, agility = 170, exp = 200, level = 30, wildLvl = 5, type = 'water', type2 = 'no type'},
		
	['Shiny Kingler'] = {offense = 1, defense = 9, specialattack = 6.2, life = 1500, vitality = 4.7, agility = 210, exp = 450, level = 80, wildLvl = 5, type = 'water', type2 = 'no type'},
--			
	['Voltorb'] = {offense = 0.7, defense = 5, specialattack = 2, life = 435, vitality = 2.1, agility = 180, exp = 100, level = 10, wildLvl = 1, type = 'electric', type2 = 'no type'},
	
	['Electrode'] = {offense = 1.2, defense = 8, specialattack = 7, life = 1300, vitality = 4.6, agility = 190, exp = 450, level = 35, wildLvl = 1, type = 'electric', type2 = 'no type'},
		
	['Shiny Voltorb'] = {offense = 0.7, defense = 5, specialattack = 2, life = 435, vitality = 2.1, agility = 180, exp = 100, level = 30, wildLvl = 5, type = 'electric', type2 = 'no type'},
	
	['Shiny Electrode'] = {offense = 1.2, defense = 8, specialattack = 7, life = 1300, vitality = 4.6, agility = 190, exp = 450, level = 50, wildLvl = 5, type = 'electric', type2 = 'no type'},
--	
	['Exeggcute'] = {offense = 0.7, defense = 8, specialattack = 2, life = 550, vitality = 3.2, agility = 130, exp = 100, level = 10, wildLvl = 1, type = 'grass', type2 = 'psychic'},
		
	['Exeggutor'] = {offense = 1.2, defense = 8, specialattack = 10, life = 2500, vitality = 9, agility = 200, exp = 1100, level = 90, wildLvl = 1, type = 'grass', type2 = 'psychic'},
--
	['Cubone'] = {offense = 0.9, defense = 8, specialattack = 3, life = 600, vitality = 3, agility = 200, exp = 250, level = 20, wildLvl = 1, type = 'ground', type2 = 'no type'},
	
	['Marowak'] = {offense = 1.2, defense = 9, specialattack = 6, life = 1450, vitality = 6.5, agility = 200, exp = 650, level = 50, wildLvl = 1, type = 'ground', type2 = 'no type'},
	
	['Shiny Cubone'] = {offense = 0.9, defense = 8, specialattack = 3, life = 600, vitality = 3, agility = 200, exp = 250, level = 30, wildLvl = 5, type = 'ground', type2 = 'no type'},
	
	['Shiny Marowak'] = {offense = 1.2, defense = 12, specialattack = 6, life = 1450, vitality = 6.5, agility = 200, exp = 650, level = 80, wildLvl = 5, type = 'ground', type2 = 'no type'},
--	
	['Koffing'] = {offense = 0.7, defense = 9, specialattack = 3, life = 400, vitality = 3.5, agility = 190, exp = 100, level = 15, wildLvl = 1, type = 'poison', type2 = 'no type'},
		
	['Weezing'] = {offense = 1.2, defense = 8, specialattack = 5, life = 1400, vitality = 6, agility = 195, exp = 250, level = 50, wildLvl = 1, type = 'poison', type2 = 'no type'},
		
	['Shiny Weezing'] = {offense = 1.2, defense = 8, specialattack = 5, life = 1400, vitality = 6, agility = 195, exp = 250, level = 50, wildLvl = 5, type = 'poison', type2 = 'no type'},
--	
	['Rhyhorn'] = {offense = 0.9, defense = 9.5, specialattack = 3, life = 1150, vitality = 4.5, agility = 200, exp = 250, level = 30, wildLvl = 1, type = 'ground', type2 = 'rock'},
	
	['Rhydon'] = {offense = 1.6, defense = 10, specialattack = 9, life = 1800, vitality = 8, agility = 210, exp = 1100, level = 80, wildLvl = 1, type = 'ground', type2 = 'rock'},
	
	['Shiny Rhydon'] = {offense = 1.6, defense = 10, specialattack = 9, life = 1800, vitality = 8, agility = 210, exp = 1100, level = 80, wildLvl = 5, type = 'ground', type2 = 'rock'},
--
	['Tangela'] = {offense = 1, defense = 6.5, specialattack = 7, life = 1500, vitality = 7.5, agility = 200, exp = 650, level = 50, wildLvl = 1, type = 'grass', type2 = 'no type'},

	['Shiny Tangela'] = {offense = 1, defense = 6.5, specialattack = 7, life = 1500, vitality = 7.5, agility = 200, exp = 650, level = 80, wildLvl = 5, type = 'grass', type2 = 'no type'},

	['Lickitung'] = {offense = 1.2, defense = 8.5, specialattack = 6.6, life = 2100, vitality = 9, agility = 195, exp = 650, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Ditto'] = {offense = 1.2, defense = 8, specialattack = 5, life = 4550, vitality = 6, agility = 180, exp = 450, level = 1, wildLvl = 1, type = 'normal', type2 = 'no type'},	

	['Shiny Ditto'] = {offense = 1.2, defense = 8, specialattack = 5, life = 4550, vitality = 6, agility = 180, exp = 450, level = 1, wildLvl = 5, type = 'normal', type2 = 'no type'},		
--	
	['Magikarp'] = {offense = 0.1, defense = 1, specialattack = 0.5, life = 220, vitality = 2, agility = 50, exp = 50, level = 1, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Giant Magikarp'] = {offense = 2.1, defense = 9, specialattack = 8, life = 1950, vitality = 11.3, agility = 200, exp = 1100, level = 50, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Shiny Magikarp'] = {offense = 0.1, defense = 1, specialattack = 0.5, life = 220, vitality = 2, agility = 50, exp = 50, level = 1, wildLvl = 5, type = 'water', type2 = 'no type'},
	
	['Shiny Giant Magikarp'] = {offense = 2.1, defense = 9, specialattack = 8, life = 1950, vitality = 11.3, agility = 200, exp = 1100, level = 60, wildLvl = 5, type = 'water', type2 = 'no type'},
--	
	['Dratini'] = {offense = 0.9, defense = 6, specialattack = 3, life = 1650, vitality = 5, agility = 190, exp = 250, level = 20, wildLvl = 1, type = 'dragon', type2 = 'no type'},
	
	['Dragonair'] = {offense = 2, defense = 8, specialattack = 7, life = 1400, vitality = 8.2, agility = 215, exp = 650, level = 60, wildLvl = 1, type = 'dragon', type2 = 'no type'},

	['Shiny Dratini'] = {offense = 0.9, defense = 6, specialattack = 3, life = 1650, vitality = 5, agility = 190, exp = 250, level = 40, wildLvl = 5, type = 'dragon', type2 = 'no type'},
	
	['Shiny Dragonair'] = {offense = 2, defense = 8, specialattack = 7, life = 1400, vitality = 8.2, agility = 215, exp = 650, level = 80, wildLvl = 5, type = 'dragon', type2 = 'no type'},
	
------------------ BALANCEAMENTO POKÉMONS DA 2 GENERATION ----------------

	['Chikorita'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 190, exp = 350, level = 20, wildLvl = 1, type = 'grass', type2 = 'no type'},

	['Bayleef'] = {offense = 0.9, defense = 5.5, specialattack = 7, life = 1200, vitality = 6.8, agility = 200, exp = 550, level = 40, wildLvl = 1, type = 'grass', type2 = 'no type'},	
	
	['Meganium'] = {offense = 1, defense = 8.7, specialattack = 8.8, life = 1800, vitality = 8, agility = 300, exp = 2000, level = 80, wildLvl = 1, type = 'grass', type2 = 'no type'},
	
	['Shiny Meganium'] = {offense = 1, defense = 10, specialattack = 8.5, life = 2000, vitality = 8, agility = 300, exp = 2000, level = 100, wildLvl = 5, type = 'grass', type2 = 'no type'},

	['Cyndaquil'] = {offense = 1, defense = 3, specialattack = 4, life = 700, vitality = 2.5, agility = 200, exp = 350, level = 20, wildLvl = 1, type = 'fire', type2 = 'no type'},

	['Quilava'] = {offense = 1.2, defense = 5, specialattack = 8.3, life = 1000, vitality = 6.8, agility = 200, exp = 550, level = 40, wildLvl = 1, type = 'fire', type2 = 'no type'},
	
	['Typhlosion'] = {offense = 1.5, defense = 13, specialattack = 9.5, life = 1500, vitality = 8, agility = 300, exp = 2000, level = 80, wildLvl = 1, type = 'fire', type2 = 'no type'},
		
	['Shiny Typhlosion'] = {offense = 1.5, defense = 13, specialattack = 9.5, life = 1500, vitality = 8, agility = 300, exp = 2000, level = 100, wildLvl = 5, type = 'fire', type2 = 'no type'},
	
	['Totodile'] = {offense = 0.5, defense = 4, specialattack = 3, life = 900, vitality = 2.5, agility = 190, exp = 350, level = 20, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Croconaw'] = {offense = 0.7, defense = 6.5, specialattack = 7.3, life = 1400, vitality = 6.8, agility = 200, exp = 550, level = 40, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Feraligatr'] = {offense = 0.9, defense = 8, specialattack = 7.5, life = 2000, vitality = 8, agility = 250, exp = 2000, level = 80, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Shiny Feraligatr'] = {offense = 0.9, defense = 8, specialattack = 7.5, life = 2000, vitality = 8, agility = 250, exp = 2000, level = 100, wildLvl = 5, type = 'water', type2 = 'no type'},
	
	['Sentret'] = {offense = 1.5, defense = 4, specialattack = 2, life = 450, vitality = 3.6, agility = 250, exp = 300, level = 5, wildLvl = 1, type = 'grass', type2 = 'poison'},

	['Furret'] = {offense = 1.7, defense = 7, specialattack = 5, life = 750, vitality = 6.5, agility = 150, exp = 550, level = 30, wildLvl = 1, type = 'grass', type2 = 'poison'},

	['Hoppip'] = {offense = 0.5, defense = 4, specialattack = 2.2, life = 500, vitality = 4.7, agility = 200, exp = 300, level = 10, wildLvl = 1, type = 'grass', type2 = 'flying'},	

	['Skiploom'] = {offense = 1, defense = 6, specialattack = 5.5, life = 1200, vitality = 7.5, agility = 200, exp = 550, level = 40, wildLvl = 1, type = 'grass', type2 = 'flying'},	
		
	['Jumpluff'] = {offense = 1.2, defense = 8, specialattack = 7, life = 1700, vitality = 7.5, agility = 200, exp = 900, level = 50, wildLvl = 1, type = 'grass', type2 = 'flying'},		

	['Swinub'] = {offense = 1, defense = 7, specialattack = 6, life = 750, vitality = 3, agility = 200, exp = 300, level = 20, wildLvl = 1, type = 'ice', type2 = 'ground'},	

	['Piloswine'] = {offense = 2, defense = 10, specialattack = 9, life = 2800, vitality = 7, agility = 200, exp = 1300, level = 80, wildLvl = 1, type = 'ice', type2 = 'ground'},

	['Hoothoot'] = {offense = 1, defense = 4, specialattack = 5, life = 750, vitality = 1.8, agility = 225, exp = 300, level = 20, wildLvl = 1, type = 'flying', type2 = 'psychic'},	

	['Noctowl'] = {offense = 2, defense = 6, specialattack = 8, life = 1550, vitality = 5.5, agility = 250, exp = 1200, level = 60, wildLvl = 1, type = 'flying', type2 = 'psychic'},
	
	['Spinarak'] = {offense = 1.0, defense = 6, specialattack = 2, life = 450, vitality = 6, agility = 220, exp = 400, level = 10, wildLvl = 1, type = 'bug', type2 = 'poison'},

	['Ariados'] = {offense = 2.0, defense = 8, specialattack = 4, life = 1700, vitality = 8, agility = 280, exp = 800, level = 70, wildLvl = 1, type = 'bug', type2 = 'poison'},	

	['Shiny Ariados'] = {offense = 2.0, defense = 8, specialattack = 4, life = 1700, vitality = 8, agility = 280, exp = 800, level = 80, wildLvl = 5, type = 'bug', type2 = 'poison'},	

	['Ledyba'] = {offense = 1.5, defense = 7, specialattack = 2.5, life = 450, vitality = 3, agility = 170, exp = 320, level = 20, wildLvl = 1, type = 'bug', type2 = 'flying'},

	['Ledian'] = {offense = 1.7, defense = 6.4, specialattack = 6, life = 900, vitality = 6, agility = 240, exp = 395, level = 30, wildLvl = 1, type = 'bug', type2 = 'flying'},
	
	['Yanma'] = {offense = 1.5, defense = 5.4, specialattack = 7, life = 2500, vitality = 5.5, agility = 280, exp = 650, level = 50, wildLvl = 1, type = 'bug', type2 = 'flying'},	

	['Chinchou'] = {offense = 1, defense = 6, specialattack = 2, life = 500, vitality = 4, agility = 200, exp = 450, level = 20, wildLvl = 1, type = 'water', type2 = 'electric'},

	['Lanturn'] = {offense = 1.6, defense = 7, specialattack = 7.5, life = 2100, vitality = 5, agility = 200, exp = 850, level = 80, wildLvl = 1, type = 'water', type2 = 'electric'},

	['Shiny Lanturn'] = {offense = 1.6, defense = 7, specialattack = 7.5, life = 2100, vitality = 5, agility = 200, exp = 850, level = 100, wildLvl = 5, type = 'water', type2 = 'electric'},

	['Togepi'] = {offense = 0.5, defense = 6, specialattack = 3, life = 1000, vitality = 4.3, agility = 200, exp = 250, level = 15, wildLvl = 1, type = 'normal', type2 = 'no type'},	
	
	['Togetic'] = {offense = 2, defense = 10, specialattack = 4, life = 2800, vitality = 4.3, agility = 200, exp = 800, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},	

	['Igglybuff'] = {offense = 0.8, defense = 3, specialattack = 2.5, life = 800, vitality = 3, agility = 200, exp = 300, level = 10, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Jigglypuff'] = {offense = 1.5, defense = 3, specialattack = 4.5, life = 1200, vitality = 4.5, agility = 200, exp = 600, level = 40, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Wigglytuff'] = {offense = 2, defense = 8, specialattack = 8.5, life = 1800, vitality = 6.2, agility = 200, exp = 1100, level = 70, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Natu'] = {offense = 1, defense = 5, specialattack = 4, life = 650, vitality = 3.4, agility = 200, exp = 350, level = 10, wildLvl = 1, type = 'flying', type2 = 'psychic'},
	
	['Xatu'] = {offense = 1.3, defense = 7, specialattack = 7.0, life = 1600, vitality = 7, agility = 300, exp = 900, level = 80, wildLvl = 1, type = 'flying', type2 = 'psychic'},	
	
	['Shiny Xatu'] = {offense = 1.3, defense = 7, specialattack = 7.0, life = 1600, vitality = 7, agility = 300, exp = 900, level = 100, wildLvl = 5, type = 'flying', type2 = 'psychic'},	

	['Mareep'] = {offense = 1, defense = 4, specialattack = 3, life = 750, vitality = 4.8, agility = 200, exp = 1100, level = 20, wildLvl = 1, type = 'electric', type2 = 'no type'},
	
	['Flaaffy'] = {offense = 1.3, defense = 5, specialattack = 6, life = 1250, vitality = 6, agility = 200, exp = 900, level = 40, wildLvl = 1, type = 'electric', type2 = 'no type'},	

	['Ampharos'] = {offense = 4, defense = 9, specialattack = 9, life = 2500, vitality = 7, agility = 200, exp = 900, level = 80, wildLvl = 1, type = 'electric', type2 = 'no type'},	

	['Shiny Ampharos'] = {offense = 4, defense = 9, specialattack = 11, life = 2500, vitality = 7, agility = 200, exp = 900, level = 100, wildLvl = 5, type = 'electric', type2 = 'no type'},	

	['Murkrow'] = {offense = 1.5, defense = 6, specialattack = 8, life = 1500, vitality = 6, agility = 490, exp = 450, level = 50, wildLvl = 1, type = 'dark', type2 = 'flying'},

	['Azurill'] = {offense = 0.5, defense = 4.5, specialattack = 3.5, life = 700, vitality = 3.5, agility = 200, exp = 300, level = 20, wildLvl = 1, type = 'water', type2 = 'no type'},	
	
	['Marill'] = {offense = 1, defense = 5, specialattack = 4.5, life = 1400, vitality = 3, agility = 200, exp = 300, level = 20, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Azumarill'] = {offense = 2, defense = 7, specialattack = 7.5, life = 1400, vitality = 5.7, agility = 200, exp = 850, level = 60, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Wooper'] = {offense = 0.7, defense = 7, specialattack = 2, life = 700, vitality = 5, agility = 200, exp = 300, level = 20, wildLvl = 1, type = 'water', type2 = 'ground'},	
		
	['Quagsire'] = {offense = 1.3, defense = 8, specialattack = 5, life = 2100, vitality = 6.5, agility = 200, exp = 850, level = 60, wildLvl = 1, type = 'water', type2 = 'ground'},	
		
	['Aipom'] = {offense = 1.5, defense = 8, specialattack = 6.5, life = 900, vitality = 4, agility = 200, exp = 400, level = 40, wildLvl = 1, type = 'normal', type2 = 'fighting'},

	['Sunkern'] = {offense = 0.5, defense = 6, specialattack = 2, life = 450, vitality = 2.5, agility = 200, exp = 200, level = 1, wildLvl = 1, type = 'bug', type2 = 'no type'},

	['Sunflora'] = {offense = 2, defense = 6.7, specialattack = 6, life = 1400, vitality = 7.3, agility = 200, exp = 450, level = 30, wildLvl = 1, type = 'grass', type2 = 'no type'},

	['Teddiursa'] = {offense = 1.5, defense = 6, specialattack = 4, life = 750, vitality = 5, agility = 200, exp = 450, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Stantler'] = {offense = 1.5, defense = 7, specialattack = 6, life = 1700, vitality = 7, agility = 250, exp = 750, level = 60, wildLvl = 1, type = 'normal', type2 = 'no type'},	
	
	['Shiny Stantler'] = {offense = 3.4, defense = 7, specialattack = 6, life = 1700, vitality = 7, agility = 250, exp = 650, level = 80, wildLvl = 5, type = 'normal', type2 = 'no type'},	
	
	['Pineco'] = {offense = 0.5, defense = 4, specialattack = 6, life = 750, vitality = 4, agility = 200, exp = 300, level = 20, wildLvl = 1, type = 'bug', type2 = 'no type'},

	['Forretress'] = {offense = 2, defense = 10, specialattack = 7, life = 1859, vitality = 7, agility = 200, exp = 850, level = 80, wildLvl = 1, type = 'bug', type2 = 'steel'},	

	['Dunsparce'] = {offense = 1, defense = 9, specialattack = 3, life = 750, vitality = 4, agility = 200, exp = 450, level = 30, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Gligar'] = {offense = 1, defense = 9, specialattack = 3, life = 750, vitality = 4, agility = 200, exp = 450, level = 30, wildLvl = 1, type = 'flying', type2 = 'ground'},
	
	['Shuckle'] = {offense = 3, defense = 11, specialattack = 3, life = 750, vitality = 3, agility = 200, exp = 450, level = 30, wildLvl = 1, type = 'bug', type2 = 'rock'},	
	
	['Snubbull'] = {offense = 2, defense = 4, specialattack = 3.5, life = 750, vitality = 4.5, agility = 200, exp = 350, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Granbull'] = {offense = 2, defense = 7, specialattack = 6.5, life = 1600, vitality = 6.5, agility = 200, exp = 850, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Qwilfish'] = {offense = 1, defense = 6, specialattack = 10, life = 1400, vitality = 7, agility = 210, exp = 750, level = 60, wildLvl = 1, type = 'water', type2 = 'poison'},
	
	['Corsola'] = {offense = 1, defense = 9, specialattack = 5, life = 1650, vitality = 6, agility = 200, exp = 650, level = 50, wildLvl = 1, type = 'water', type2 = 'rock'},	

	['Sneasel'] = {offense = 2, defense = 6, specialattack = 7, life = 1700, vitality = 5, agility = 200, exp = 850, level = 50, wildLvl = 1, type = 'dark', type2 = 'ice'},
	
	['Delibird'] = {offense = 1, defense = 5, specialattack = 6, life = 1500, vitality = 6, agility = 200, exp = 750, level = 40, wildLvl = 1, type = 'ice', type2 = 'no type'},	

	['Slugma'] = {offense = 1, defense = 6.5, specialattack = 8, life = 1250, vitality = 5.5, agility = 200, exp = 250, level = 25, wildLvl = 1, type = 'fire', type2 = 'no type'},	
	
	['Magcargo'] = {offense = 1.5, defense = 11, specialattack = 8.5, life = 2400, vitality = 9.5, agility = 200, exp = 1300, level = 80, wildLvl = 1, type = 'fire', type2 = 'rock'},
		
	['Shiny Magcargo'] = {offense = 1.5, defense = 14, specialattack = 8.5, life = 2400, vitality = 10, agility = 200, exp = 1300, level = 100, wildLvl = 5, type = 'fire', type2 = 'rock'},
	
	['Remoraid'] = {offense = 0.7, defense = 7, specialattack = 1.5, life = 350, vitality = 3, agility = 200, exp = 200, level = 10, wildLvl = 1, type = 'water', type2 = 'no type'},

	['Octillery'] = {offense = 1, defense = 7.5, specialattack = 9, life = 1600, vitality = 7.5, agility = 200, exp = 250, level = 70, wildLvl = 1, type = 'water', type2 = 'no type'},	
	
	['Houndour'] = {offense = 1, defense = 6, specialattack = 6.5, life = 857, vitality = 3.5, agility = 200, exp = 300, level = 20, wildLvl = 1, type = 'fire', type2 = 'dark'},	

	['Houndoom'] = {offense = 2, defense = 7, specialattack = 8.5, life = 2537, vitality = 7, agility = 350, exp = 850, level = 80, wildLvl = 1, type = 'fire', type2 = 'dark'},		
	
	['Phanpy'] = {offense = 0.5, defense = 7, specialattack = 4.5, life = 450, vitality = 3.5, agility = 200, exp = 400, level = 10, wildLvl = 1, type = 'ground', type2 = 'no type'},
	
	['Donphan'] = {offense = 1.5, defense = 10, specialattack = 6, life = 1959, vitality = 6.5, agility = 200, exp = 750, level = 80, wildLvl = 1, type = 'ground', type2 = 'no type'},

	['Tyrogue'] = {offense = 2, defense = 5, specialattack = 3.5, life = 950, vitality = 3.4, agility = 190, exp = 100, level = 20, wildLvl = 1, type = 'fighting', type2 = 'no type'},

	['Smoochum'] = {offense = 0.5, defense = 4.5, specialattack = 5.5, life = 785, vitality = 6, agility = 200, exp = 1100, level = 30, wildLvl = 1, type = 'ice', type2 = 'psychic'},

	['Wynaut'] = {offense = 0.5, defense = 4.5, specialattack = 6.5, life = 785, vitality = 6, agility = 200, exp = 1100, level = 30, wildLvl = 1, type = 'psychic', type2 = 'no type'},	
	
	['Magby'] = {offense = 0.5, defense = 4.5, specialattack = 5.5, life = 785, vitality = 6, agility = 200, exp = 1100, level = 30, wildLvl = 1, type = 'fire', type2 = 'no type'},
	
	['Elekid'] = {offense = 0.5, defense = 4.5, specialattack = 5.5, life = 785, vitality = 6, agility = 200, exp = 1100, level = 30, wildLvl = 1, type = 'electric', type2 = 'no type'},	

	['Larvitar'] = {offense = 0.5, defense = 4.5, specialattack = 5.5, life = 900, vitality = 6, agility = 200, exp = 1100, level = 30, wildLvl = 1, type = 'ground', type2 = 'dark'},

	['Pupitar'] = {offense = 1, defense = 9.5, specialattack = 5.5, life = 1300, vitality = 5, agility = 180, exp = 1400, level = 60, wildLvl = 1, type = 'ground', type2 = 'dark'},

	['Shiny Larvitar'] = {offense = 0.5, defense = 4.5, specialattack = 5.5, life = 900, vitality = 6, agility = 200, exp = 1100, level = 30, wildLvl = 5, type = 'ground', type2 = 'dark'},
	
	['Shiny Pupitar'] = {offense = 1, defense = 9.5, specialattack = 5.5, life = 1300, vitality = 5, agility = 180, exp = 1400, level = 60, wildLvl = 5, type = 'ground', type2 = 'dark'},

	['Kecleon'] = {offense = 2.5, defense = 8, specialattack = 8, life = 2856, vitality = 5.5, agility = 190, exp = 250, level = 100, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Smeargle'] = {offense = 2.5, defense = 8, specialattack = 8, life = 1500, vitality = 5.5, agility = 190, exp = 1500, level = 100, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Smeargle 1'] = {offense = 0.5, defense = 4, specialattack = 4, life = 500, vitality = 3.5, agility = 190, exp = 225, level = 10, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Smeargle 2'] = {offense = 0.7, defense = 5, specialattack = 4.5, life = 750, vitality = 4, agility = 190, exp = 450, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
		
	['Smeargle 3'] = {offense = 1.0, defense = 6, specialattack = 5, life = 1000, vitality = 4.5, agility = 190, exp = 550, level = 30, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Smeargle 4'] = {offense = 1.2, defense = 6.5, specialattack = 5.5, life = 1250, vitality = 4, agility = 190, exp = 600, level = 40, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Smeargle 5'] = {offense = 1.5, defense = 7, specialattack = 6, life = 1500, vitality = 4.5, agility = 190, exp = 750, level = 50, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Smeargle 6'] = {offense = 1.7, defense = 7.5, specialattack = 6.5, life = 1750, vitality = 5, agility = 190, exp = 850, level = 6, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Smeargle 7'] = {offense = 2, defense = 8, specialattack = 7, life = 2000, vitality = 5.5, agility = 190, exp = 1000, level = 70, wildLvl = 1, type = 'normal', type2 = 'no type'},

	['Smeargle 8'] = {offense = 2.5, defense = 11, specialattack = 13, life = 2500, vitality = 6.5, agility = 190, exp = 1000, level = 80, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
------------------ BALANCEAMENTO POKÉMONS DA 3 GENERATION ----------------
	['Treecko'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 190, exp = 550, level = 20, wildLvl = 1, type = 'grass', type2 = 'no type'},

	['Grovyle'] = {offense = 0.9, defense = 5.5, specialattack = 7, life = 1200, vitality = 6.8, agility = 200, exp = 850, level = 40, wildLvl = 1, type = 'grass', type2 = 'no type'},	
	
	['Sceptile'] = {offense = 1, defense = 8.7, specialattack = 8.8, life = 1800, vitality = 8, agility = 300, exp = 2500, level = 80, wildLvl = 1, type = 'grass', type2 = 'no type'},

	['Torchic'] = {offense = 1, defense = 3, specialattack = 4, life = 700, vitality = 2.5, agility = 200, exp = 550, level = 20, wildLvl = 1, type = 'fire', type2 = 'no type'},

	['Combusken'] = {offense = 1.2, defense = 5, specialattack = 8.3, life = 1000, vitality = 6.8, agility = 200, exp = 850, level = 40, wildLvl = 1, type = 'fire', type2 = 'fighting'},
	
	['Blaziken'] = {offense = 1.7, defense = 13, specialattack = 9.5, life = 1500, vitality = 8, agility = 300, exp = 2500, level = 80, wildLvl = 1, type = 'fire', type2 = 'fighting'},
	
	['Mudkip'] = {offense = 0.5, defense = 4, specialattack = 3, life = 900, vitality = 2.5, agility = 190, exp = 550, level = 20, wildLvl = 1, type = 'water', type2 = 'no type'},
	
	['Marshtomp'] = {offense = 0.7, defense = 6.5, specialattack = 7.3, life = 1400, vitality = 6.8, agility = 200, exp = 850, level = 40, wildLvl = 1, type = 'water', type2 = 'ground'},

	['Swampert'] = {offense = 0.9, defense = 8, specialattack = 7.5, life = 2000, vitality = 8, agility = 250, exp = 2500, level = 80, wildLvl = 1, type = 'water', type2 = 'ground'},
		
	['Poochyena'] = {offense = 1, defense = 5, specialattack = 7, life = 1500, vitality = 7, agility = 200, exp = 1000, level = 20, wildLvl = 2, type = 'dark', type2 = 'no type'},

	['Mightyena'] = {offense = 1, defense = 8, specialattack = 10, life = 3200, vitality = 9, agility = 200, exp = 2200, level = 80, wildLvl = 2, type = 'dark', type2 = 'no type'},
	
	['Zigzagoon'] = {offense = 0.8, defense = 5, specialattack = 4, life = 1200, vitality = 4.5, agility = 250, exp = 750, level = 20, wildLvl = 2, type = 'normal', type2 = 'no type'},

	['Linoone'] = {offense = 1.3, defense = 6, specialattack = 7.5, life = 1700, vitality = 7.5, agility = 400, exp = 1200, level = 40, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Wurmple'] = {offense = 0.8, defense = 6, specialattack = 4, life = 650, vitality = 2.3, agility = 200, exp = 750, level = 10, wildLvl = 2, type = 'bug', type2 = 'poison'},

	['Silcoon'] = {offense = 1, defense = 9, specialattack = 2.5, life = 900, vitality = 3.9, agility = 170, exp = 1300, level = 25, wildLvl = 2, type = 'bug', type2 = 'poison'},
	
	['Cascoon'] = {offense = 1, defense = 9, specialattack = 2.5, life = 900, vitality = 3.9, agility = 170, exp = 1300, level = 25, wildLvl = 2, type = 'bug', type2 = 'poison'},
		
	['Beautifly'] = {offense = 1.7, defense = 8, specialattack = 9, life = 2400, vitality = 6.5, agility = 300, exp = 1800, level = 60, wildLvl = 2, type = 'bug', type2 = 'poison'},

	['Dustox'] = {offense = 1, defense = 10, specialattack = 7, life = 2400, vitality = 8.5, agility = 300, exp = 1800, level = 60, wildLvl = 2, type = 'bug', type2 = 'psychic'},

	['Lotad'] = {offense = 1, defense = 4, specialattack = 5, life = 750, vitality = 3.5, agility = 300, exp = 1000, level = 20, wildLvl = 2, type = 'water', type2 = 'grass'},
	
	['Lombre'] = {offense = 1.2, defense = 7, specialattack = 8, life = 1440, vitality = 7, agility = 300, exp = 1500, level = 40, wildLvl = 2, type = 'water', type2 = 'grass'},

	['Ludicolo'] = {offense = 1.5, defense = 8.5, specialattack = 9, life = 2354, vitality = 9.5, agility = 300, exp = 2300, level = 80, wildLvl = 2, type = 'water', type2 = 'grass'},
		
	['Seedot'] = {offense = 0.5, defense = 5, specialattack = 7, life = 1000, vitality = 3.5, agility = 200, exp = 1000, level = 20, wildLvl = 2, type = 'grass', type2 = 'no type'},

	['Nuzleaf'] = {offense = 1, defense = 6, specialattack = 10, life = 1400, vitality = 7, agility = 200, exp = 1500, level = 40, wildLvl = 2, type = 'grass', type2 = 'dark'},	
	
	['Shiftry'] = {offense = 1.5, defense = 7.5, specialattack = 9, life = 1700, vitality = 8, agility = 300, exp = 2300, level = 80, wildLvl = 2, type = 'grass', type2 = 'dark'},
		
	['Nincada'] = {offense = 0.5, defense = 4, specialattack = 2, life = 350, vitality = 3, agility = 180, exp = 650, level = 20, wildLvl = 2, type = 'bug', type2 = 'poison'},
	
	['Ninjask'] = {offense = 1.7, defense = 5, specialattack = 6.5, life = 3200, vitality = 5, agility = 400, exp = 3000, level = 100, wildLvl = 2, type = 'bug', type2 = 'flying'},
	
	['Shedinja'] = {offense = 0.5, defense = 5.0, specialattack = 6, life = 2500, vitality = 5, agility = 250, exp = 1300, level = 60, wildLvl = 2, type = 'bug', type2 = 'ghost'},
	
	['Taillow'] = {offense = 1, defense = 4, specialattack = 5, life = 750, vitality = 5, agility = 250, exp = 750, level = 30, wildLvl = 2, type = 'normal', type2 = 'flying'},
	
	['Swellow'] = {offense = 1.7, defense = 8, specialattack = 9, life = 2600, vitality = 8, agility = 350, exp = 2000, level = 80, wildLvl = 2, type = 'normal', type2 = 'flying'},
	
	['Shroomish'] = {offense = 1, defense = 5, specialattack = 2, life = 850, vitality = 3.5, agility = 200, exp = 700, level = 10, wildLvl = 2, type = 'grass', type2 = 'no type'},
		
	['Breloom'] = {offense = 3, defense = 5, specialattack = 12, life = 2600, vitality = 9, agility = 250, exp = 2400, level = 80, wildLvl = 2, type = 'grass', type2 = 'fighting'},
	
	['Spinda'] = {offense = 1, defense = 9, specialattack = 3, life = 1100, vitality = 4, agility = 200, exp = 1200, level = 30, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Wingull'] = {offense = 0.7, defense = 5, specialattack = 3.1, life = 750, vitality = 6, agility = 200, exp = 650, level = 30, wildLvl = 2, type = 'water', type2 = 'flying'},
	
	['Pelipper'] = {offense = 1.3, defense = 8, specialattack = 6.1, life = 2800, vitality = 9, agility = 220, exp = 2000, level = 80, wildLvl = 2, type = 'water', type2 = 'flying'},
	
	['Surskit'] = {offense = 0.5, defense = 5, specialattack = 5, life = 650, vitality = 6, agility = 200, exp = 550, level = 20, wildLvl = 2, type = 'bug', type2 = 'water'},
	
	['Masquerain'] = {offense = 1.5, defense = 8, specialattack = 6.1, life = 1800, vitality = 8, agility = 220, exp = 1300, level = 80, wildLvl = 2, type = 'bug', type2 = 'flying'},
		
	['Wailmer'] = {offense = 1, defense = 7, specialattack = 7, life = 3500, vitality = 11, agility = 300, exp = 1700, level = 70, wildLvl = 2, type = 'water', type2 = 'no type'},

	['Wailord'] = {offense = 1, defense = 12, specialattack = 10, life = 5500, vitality = 12, agility = 300, exp = 3500, level = 100, wildLvl = 2, type = 'water', type2 = 'no type'},
		
	['Skitty'] = {offense = 1.3, defense = 6, specialattack = 6, life = 750, vitality = 5, agility = 250, exp = 750, level = 20, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Delcatty'] = {offense = 1.5, defense = 7, specialattack = 8, life = 1600, vitality = 7, agility = 250, exp = 1800, level = 60, wildLvl = 2, type = 'normal', type2 = 'no type'},

	['Baltoy'] = {offense = 0.9, defense = 8, specialattack = 4.5, life = 650, vitality = 4.5, agility = 200, exp = 1000, level = 20, wildLvl = 2, type = 'ground', type2 = 'psychic'},
	
	['Claydol'] = {offense = 1.5, defense = 7, specialattack = 9.5, life = 2200, vitality = 8.5, agility = 230, exp = 2400, level = 80, wildLvl = 2, type = 'ground', type2 = 'psychic'},

	['Torkoal'] = {offense = 1.5, defense = 11, specialattack = 7.5, life = 2800, vitality = 10.5, agility = 250, exp = 2700, level = 100, wildLvl = 2, type = 'fire', type2 = 'no type'},
		
	['Barboach'] = {offense = 0.9, defense = 6.2, specialattack = 7, life = 750, vitality = 3.5, agility = 200, exp = 1500, level = 20, wildLvl = 2, type = 'water', type2 = 'ground'},
	
	['Whiscash'] = {offense = 1, defense = 7.5, specialattack = 9.5, life = 1800, vitality = 7, agility = 300, exp = 2000, level = 60, wildLvl = 2, type = 'water', type2 = 'ground'},
		
	['Luvdisc'] = {offense = 1.5, defense = 6, specialattack = 7.5, life = 1300, vitality = 4.5, agility = 250, exp = 1200, level = 20, wildLvl = 2, type = 'water', type2 = 'no type'},		
	
	['Corphish'] = {offense = 1.5, defense = 7.2, specialattack = 5, life = 800, vitality = 3.5, agility = 200, exp = 1200, level = 20, wildLvl = 2, type = 'water', type2 = 'no type'},
	
	['Crawdaunt'] = {offense = 2, defense = 9.5, specialattack = 6.5, life = 1900, vitality = 8.5, agility = 300, exp = 2500, level = 80, wildLvl = 2, type = 'water', type2 = 'dark'},
	
	['Feebas'] = {offense = 0.1, defense = 1, specialattack = 0.4, life = 785, vitality = 2, agility = 110, exp = 100, level = 1, wildLvl = 1, type = 'water', type2 = 'no type'},
		
	['Carvanha'] = {offense = 2, defense = 6, specialattack = 5, life = 750, vitality = 4.5, agility = 250, exp = 750, level = 20, wildLvl = 2, type = 'water', type2 = 'no type'},
	
	['Sharpedo'] = {offense = 1.8, defense = 7.5, specialattack = 8.5, life = 1400, vitality = 6.5, agility = 250, exp = 1900, level = 60, wildLvl = 2, type = 'water', type2 = 'dark'},
		
	['Trapinch'] = {offense = 0.7, defense = 5, specialattack = 5, life = 850, vitality = 3.5, agility = 200, exp = 850, level = 20, wildLvl = 2, type = 'ground', type2 = 'no type'},
	
	['Vibrava'] = {offense = 1.3, defense = 7, specialattack = 6.5, life = 1250, vitality = 5.5, agility = 200, exp = 1300, level = 40, wildLvl = 2, type = 'ground', type2 = 'dragon'},

	['Flygon'] = {offense = 1.7, defense = 9.5, specialattack = 8.5, life = 1850, vitality = 8.5, agility = 300, exp = 2600, level = 80, wildLvl = 2, type = 'ground', type2 = 'dragon'},
	
	['Makuhita'] = {offense = 1.5, defense = 5, specialattack = 6.5, life = 650, vitality = 4.5, agility = 200, exp = 1300, level = 20, wildLvl = 2, type = 'fighting', type2 = 'no type'},

	['Hariyama'] = {offense = 3.5, defense = 8, specialattack = 9, life = 2800, vitality = 6.5, agility = 250, exp = 2450, level = 80, wildLvl = 2, type = 'fighting', type2 = 'no type'},	
	
	['Electrike'] = {offense = 1.5, defense = 6.5, specialattack = 8.5, life = 1200, vitality = 4.5, agility = 200, exp = 1350, level = 20, wildLvl = 2, type = 'electric', type2 = 'no type'},
	
	['Manectric'] = {offense = 2, defense = 7, specialattack = 10.5, life = 2300, vitality = 7.5, agility = 250, exp = 2500, level = 80, wildLvl = 2, type = 'electric', type2 = 'no type'},	

	['Numel'] = {offense = 1.5, defense = 6, specialattack = 5, life = 1450, vitality = 4.5, agility = 200, exp = 250, level = 25, wildLvl = 2, type = 'fire', type2 = 'rock'},	
	
	['Camerupt'] = {offense = 2.5, defense = 8.5, specialattack = 9, life = 2400, vitality = 7.5, agility = 200, exp = 2500, level = 80, wildLvl = 2, type = 'fire', type2 = 'ground'},

--- CONFIGURAÇÕES REFERENTE AO LEVEL ESTÁ CORRETO ---
	
	['Spheal'] = {offense = 1, defense = 4.5, specialattack = 3.5, life = 750, vitality = 3.5, agility = 200, exp = 1200, level = 30, wildLvl = 2, type = 'water', type2 = 'no type'},
	
	['Sealeo'] = {offense = 1.5, defense = 6.5, specialattack = 6.5, life = 1650, vitality = 5.5, agility = 200, exp = 2400, level = 60, wildLvl = 2, type = 'water', type2 = 'ice'},
	
	['Walrein'] = {offense = 1.7, defense = 9, specialattack = 10, life = 2200, vitality = 7.5, agility = 250, exp = 3600, level = 85, wildLvl = 2, type = 'water', type2 = 'ice'},
				
	['Cacnea'] = {offense = 1.5, defense = 5.5, specialattack = 5.5, life = 750, vitality = 4.5, agility = 200, exp = 1200, level = 20, wildLvl = 2, type = 'grass', type2 = 'no type'},
	
	['Cacturn'] = {offense = 1.5, defense = 7.5, specialattack = 9.5, life = 1900, vitality = 8.5, agility = 250, exp = 2400, level = 80, wildLvl = 2, type = 'grass', type2 = 'dark'},
	
	['Snorunt'] = {offense = 1, defense = 4.5, specialattack = 4.5, life = 1200, vitality = 4.5, agility = 250, exp = 1300, level = 30, wildLvl = 2, type = 'ice', type2 = 'no type'},
	
	['Glalie'] = {offense = 1.5, defense = 6.5, specialattack = 10.5, life = 2500, vitality = 7, agility = 250, exp = 2400, level = 80, wildLvl = 2, type = 'ice', type2 = 'no type'},
	
	['Spoink'] = {offense = 1, defense = 6, specialattack = 4, life = 1100, vitality = 6.5, agility = 200, exp = 1400, level = 30, wildLvl = 2, type = 'psychic', type2 = 'no type'},
		
	['Grumpig'] = {offense = 1.5, defense = 8.5, specialattack = 7.5, life = 2500, vitality = 10.5, agility = 250, exp = 3150, level = 80, wildLvl = 2, type = 'psychic', type2 = 'no type'},
	
	['Plusle'] = {offense = 0.5, defense = 5, specialattack = 5.5, life = 1350, vitality = 4.5, agility = 250, exp = 1400, level = 30, wildLvl = 2, type = 'electric', type2 = 'no type'},

	['Minun'] = {offense = 0.5, defense = 5, specialattack = 5.5, life = 1350, vitality = 4.5, agility = 250, exp = 1400, level = 30, wildLvl = 2, type = 'electric', type2 = 'no type'},
	
	['Mawile'] = {offense = 1.5, defense = 5, specialattack = 8.5, life = 2800, vitality = 8.5, agility = 250, exp = 2800, level = 80, wildLvl = 2, type = 'steel', type2 = 'no type'},

	['Meditite'] = {offense = 1.5, defense = 4, specialattack = 5, life = 1400, vitality = 4.5, agility = 250, exp = 1400, level = 30, wildLvl = 2, type = 'fighting', type2 = 'psychic'},
	
	['Medicham'] = {offense = 2.5, defense = 9, specialattack = 8.5, life = 2500, vitality = 7.5, agility = 250, exp = 2600, level = 80, wildLvl = 2, type = 'fighting', type2 = 'psychic'},
	
	['Swablu'] = {offense = 1, defense = 5, specialattack = 5, life = 580, vitality = 5.5, agility = 250, exp = 1600, level = 30, wildLvl = 2, type = 'normal', type2 = 'flying'},
		
	['Duskull'] = {offense = 0.5, defense = 4, specialattack = 4.5, life = 700, vitality = 5.5, agility = 200, exp = 750, level = 40, wildLvl = 2, type = 'ghost', type2 = 'no type'},
	
	['Dusclops'] = {offense = 1, defense = 6, specialattack = 6.5, life = 1350, vitality = 7.5, agility = 200, exp = 1600, level = 70, wildLvl = 2, type = 'ghost', type2 = 'no type'},

	['Budew'] = {offense = 0.5, defense = 3, specialattack = 4.5, life = 800, vitality = 6.5, agility = 200, exp = 2500, level = 10, wildLvl = 2, type = 'grass', type2 = 'poison'},
	
	['Roselia'] = {offense = 1, defense = 6, specialattack = 6, life = 1200, vitality = 6.5, agility = 200, exp = 2500, level = 30, wildLvl = 2, type = 'grass', type2 = 'poison'},

	['Roserade'] = {offense = 1.5, defense = 7.5, specialattack = 8, life = 1450, vitality = 7.5, agility = 200, exp = 2500, level = 80, wildLvl = 2, type = 'grass', type2 = 'poison'},
	
	['Slakoth'] = {offense = 1, defense = 4, specialattack = 3.5, life = 550, vitality = 2.1, agility = 200, exp = 850, level = 20, wildLvl = 2, type = 'fighting', type2 = 'no type'},
	
	['Vigoroth'] = {offense = 1.5, defense = 6, specialattack = 5.5, life = 1100, vitality = 2.1, agility = 200, exp = 1600, level = 50, wildLvl = 2, type = 'fighting', type2 = 'no type'},
	
	['Gulpin'] = {offense = 1, defense = 4.5, specialattack = 5.5, life = 1300, vitality = 5.5, agility = 200, exp = 1300, level = 30, wildLvl = 2, type = 'poison', type2 = 'no type'},
		
	['Swalot'] = {offense = 1.5, defense = 11, specialattack = 11, life = 2700, vitality = 8.5, agility = 250, exp = 2600, level = 80, wildLvl = 2, type = 'poison', type2 = 'no type'},

	['Whismur'] = {offense = 0.5, defense = 5.5, specialattack = 4.5, life = 1200, vitality = 4.5, agility = 200, exp = 1200, level = 20, wildLvl = 2, type = 'normal', type2 = 'no type'},

	['Loudred'] = {offense = 1, defense = 7.5, specialattack = 6, life = 1700, vitality = 5.5, agility = 200, exp = 2400, level = 50, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Exploud'] = {offense = 1.5, defense = 8.5, specialattack = 8, life = 2500, vitality = 8, agility = 200, exp = 3550, level = 80, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Clamperl'] = {offense = 2, defense = 6, specialattack = 5, life = 650, vitality = 4.5, agility = 250, exp = 1200, level = 20, wildLvl = 2, type = 'water', type2 = 'no type'},
	
	['Huntail'] = {offense = 1.5, defense = 6, specialattack = 7, life = 1750, vitality = 7.5, agility = 250, exp = 1800, level = 60, wildLvl = 2, type = 'water', type2 = 'no type'},
	
	['Gorebyss'] = {offense = 1.5, defense = 6, specialattack = 7, life = 1550, vitality = 7.5, agility = 250, exp = 1800, level = 60, wildLvl = 2, type = 'water', type2 = 'no type'},
		
	['Shuppet'] = {offense = 0.5, defense = 3, specialattack = 6.5, life = 700, vitality = 5.5, agility = 200, exp = 750, level = 30, wildLvl = 2, type = 'ghost', type2 = 'no type'},
	
	['Banette'] = {offense = 1, defense = 5.5, specialattack = 7.5, life = 1350, vitality = 7.5, agility = 200, exp = 1650, level = 70, wildLvl = 2, type = 'ghost', type2 = 'no type'},

	['Sableye'] = {offense = 1, defense = 5.5, specialattack = 8.5, life = 1350, vitality = 6, agility = 200, exp = 1700, level = 60, wildLvl = 2, type = 'ghost', type2 = 'no type'},
	
	['Seviper'] = {offense = 1, defense = 6, specialattack = 9, life = 2750, vitality = 7.5, agility = 250, exp = 2700, level = 80, wildLvl = 2, type = 'poison', type2 = 'no type'},
	
	['Zangoose'] = {offense = 2, defense = 6, specialattack = 8, life = 2500, vitality = 6.5, agility = 250, exp = 2700, level = 80, wildLvl = 2, type = 'normal', type2 = 'no type'},
	
	['Relicanth'] = {offense = 1, defense = 8, specialattack = 5, life = 1700, vitality = 8, agility = 250, exp = 2500, level = 50, wildLvl = 2, type = 'rock', type2 = 'water'},
	
	['Aron'] = {offense = 1, defense = 4, specialattack = 4.5, life = 1200, vitality = 4.5, agility = 200, exp = 1200, level = 30, wildLvl = 2, type = 'rock', type2 = 'steel'},
	
	['Lairon'] = {offense = 1.5, defense = 5.5, specialattack = 6.5, life = 1700, vitality = 6.5, agility = 200, exp = 2500, level = 60, wildLvl = 2, type = 'rock', type2 = 'steel'},
	
	['Aggron'] = {offense = 2, defense = 7.5, specialattack = 9, life = 2500, vitality = 7.5, agility = 200, exp = 3450, level = 100, wildLvl = 2, type = 'rock', type2 = 'steel'},
				
	['Volbeat'] = {offense = 2.5, defense = 4.5, specialattack = 5.5, life = 1400, vitality = 6.5, agility = 200, exp = 1400, level = 40, wildLvl = 2, type = 'bug', type2 = 'no type'},

	['Illumise'] = {offense = 1, defense = 4.5, specialattack = 7, life = 1400, vitality = 6.5, agility = 250, exp = 2450, level = 40, wildLvl = 2, type = 'bug', type2 = 'no type'},
	
	['Lileep'] = {offense = 1, defense = 5, specialattack = 5, life = 800, vitality = 4.5, agility = 200, exp = 1200, level = 20, wildLvl = 2, type = 'rock', type2 = 'grass'},
	
	['Anorith'] = {offense = 0.5, defense = 6, specialattack = 4.5, life = 1200, vitality = 4.5, agility = 200, exp = 1200, level = 20, wildLvl = 2, type = 'rock', type2 = 'bug'},
			
	['Ralts'] = {offense = 0.5, defense = 4.5, specialattack = 5, life = 1000, vitality = 3.0, agility = 200, exp = 1250, level = 20, wildLvl = 2, type = 'psychic', type2 = 'no type'},

	['Kirlia'] = {offense = 1.5, defense = 6.5, specialattack = 6.5, life = 1800, vitality = 6.5, agility = 200, exp = 2450, level = 60, wildLvl = 2, type = 'psychic', type2 = 'no type'},	
				
	['Bagon'] = {offense = 0.5, defense = 4.5, specialattack = 5, life = 1000, vitality = 3.0, agility = 200, exp = 1250, level = 20, wildLvl = 2, type = 'dragon', type2 = 'no type'},

	['Shelgon'] = {offense = 1.5, defense = 6.5, specialattack = 6.5, life = 1800, vitality = 6.5, agility = 200, exp = 2450, level = 60, wildLvl = 2, type = 'dragon', type2 = 'no type'},
				
	['Beldum'] = {offense = 0.5, defense = 4.5, specialattack = 5, life = 1000, vitality = 3.0, agility = 200, exp = 1250, level = 20, wildLvl = 2, type = 'psychic', type2 = 'steel'},

	['Metang'] = {offense = 1.5, defense = 6.5, specialattack = 6.5, life = 1800, vitality = 6.5, agility = 200, exp = 2450, level = 60, wildLvl = 2, type = 'psychic', type2 = 'steel'},

	['Lucario'] = {offense = 3, defense = 7, specialattack = 8.5, life = 1800, vitality = 7.5, agility = 200, exp = 2450, level = 60, wildLvl = 2, type = 'fighting', type2 = 'steel'},

	['Shiny Lucario'] = {offense = 3, defense = 11, specialattack = 8.5, life = 1800, vitality = 7.5, agility = 200, exp = 2450, level = 60, wildLvl = 5, type = 'fighting', type2 = 'steel'},

---------------------- // BOSS 3º GENERATION AND RARE POKÉMON // --------------	

	['Magmortar'] = {offense = 3, defense = 18, specialattack = 8, life = 3500, vitality = 14, agility = 300, exp = 20000, level = 150, wildLvl = 5, type = 'fire', type2 = 'no type'},
	
	['Electivire'] = {offense = 3, defense = 18, specialattack = 8, life = 3500, vitality = 14, agility = 300, exp = 20000, level = 150, wildLvl = 5, type = 'electric', type2 = 'no type'},
 
	['Milotic'] = {offense = 1.5, defense = 15, specialattack = 6.5, life = 4000, vitality = 16, agility = 350, exp = 20000, level = 150, wildLvl = 5, type = 'water', type2 = 'no type'},
			
 	['Absol'] = {offense = 1.5, defense = 13, specialattack = 11, life = 3000, vitality = 13, agility = 300, exp = 20000, level = 150, wildLvl = 5, type = 'dark', type2 = 'no type'},
		
	['Metagross'] = {offense = 2, defense = 18, specialattack = 10, life = 3500, vitality = 13.5, agility = 275, exp = 20000, level = 150, wildLvl = 5, type = 'psychic', type2 = 'steel'},
	
	['Salamence'] = {offense = 2, defense = 15, specialattack = 10, life = 3500, vitality = 15.5, agility = 275, exp = 20000, level = 150, wildLvl = 5, type = 'dragon', type2 = 'flying'},

	['Tangrowth'] = {offense = 2, defense = 15.5, specialattack = 9, life = 4000, vitality = 15, agility = 250, exp = 20000, level = 150, wildLvl = 5, type = 'grass', type2 = 'no type'},

	['Rhyperior'] = {offense = 2, defense = 17, specialattack = 10, life = 3500, vitality = 13, agility = 200, exp = 20000, level = 150, wildLvl = 5, type = 'rock', type2 = 'ground'},

	['Dusknoir'] = {offense = 1, defense = 12, specialattack = 13, life = 3500, vitality = 15, agility = 250, exp = 20000, level = 150, wildLvl = 5, type = 'ghost', type2 = 'no type'},
		
	['Slaking'] = {offense = 5, defense = 13, specialattack = 11, life = 3500, vitality = 15, agility = 300, exp = 20000, level = 150, wildLvl = 5, type = 'normal', type2 = 'no type'},
--
    ['Castform']	= {offense = 2.5, defense = 4.5, specialattack = 6.5, life = 4500, vitality = 6.5, agility = 200, exp = 1400, level = 80, wildLvl = 2, type = 'normal', type2 = 'no type'},

    ['Castform Fire']	= {offense = 2.5, defense = 4.5, specialattack = 6.5, life = 4500, vitality = 6.5, agility = 200, exp = 1400, level = 80, wildLvl = 2, type = 'fire', type2 = 'no type'},

    ['Castform Ice']	= {offense = 2.5, defense = 4.5, specialattack = 6.5, life = 4500, vitality = 6.5, agility = 200, exp = 1400, level = 80, wildLvl = 2, type = 'ice', type2 = 'no type'},

    ['Castform Water']	= {offense = 2.5, defense = 4.5, specialattack = 6.5, life = 4500, vitality = 6.5, agility = 200, exp = 1400, level = 80, wildLvl = 2, type = 'water', type2 = 'no type'},

 	['Kecleon'] = {offense = 1, defense = 9, specialattack = 3, life = 2300, vitality = 4, agility = 200, exp = 1800, level = 40, wildLvl = 2, type = 'normal', type2 = 'no type'},
							
--	['Lunatone'] = {offense = 2, defense = 10, specialattack = 10.5, life = 3200, vitality = 8.5, agility = 250, exp = 7000, level = 150, wildLvl = 2, type = 'ground', type2 = 'psychic'},
	
--	['Solrock'] = {offense = 2, defense = 10, specialattack = 10.5, life = 3200, vitality = 8.5, agility = 250, exp = 7000, level = 150, wildLvl = 2, type = 'ground', type2 = 'psychic'},

--	['Cradily'] = {offense = 1.5, defense = 8, specialattack = 10, life = 2500, vitality = 8.5, agility = 200, exp = 3600, level = 100, wildLvl = 2, type = 'rock', type2 = 'grass'},

 	['Altaria'] = {offense = 1.5, defense = 7.5, specialattack = 9.5, life = 2600, vitality = 9.5, agility = 250, exp = 3800, level = 80, wildLvl = 2, type = 'normal', type2 = 'dragon'},

--	['Armaldo'] = {offense = 2, defense = 10, specialattack = 8.5, life = 3000, vitality = 8.5, agility = 200, exp = 3600, level = 100, wildLvl = 2, type = 'rock', type2 = 'bug'},
		
	['Gardevoir'] = {offense = 2, defense = 8.5, specialattack = 12, life = 4000, vitality = 8.5, agility = 250, exp = 3100, level = 100, wildLvl = 2, type = 'psychic', type2 = 'no type'},
	
	['Tropius'] = {offense = 2, defense = 10, specialattack = 8.5, life = 3200, vitality = 8.5, agility = 250, exp = 4000, level = 100, wildLvl = 2, type = 'grass', type2 = 'flying'},

-- // POKEMON'S TOWER \\ --
	
	['Big Porygon'] = {offense = 5, defense = 5, specialattack = 5, life = 15000, vitality = 16.5, agility = 450, exp = 1450, level = 100, wildLvl = 2.5, type = 'psychic', type2 = 'no type'},
		
	['Shiny Scizor'] = {offense = 4, defense = 15, specialattack = 12, life = 6000, vitality = 16.5, agility = 350, exp = 1450, level = 100, wildLvl = 5, type = 'bug', type2 = 'steel'},
	
	['Shiny Salamence'] = {offense = 2, defense = 12, specialattack = 6, life = 4500, vitality = 8.5, agility = 275, exp = 7500, level = 150, wildLvl = 5, type = 'dragon', type2 = 'flying'},

	['Shiny Magmortar'] = {offense = 3, defense = 13, specialattack = 8, life = 5500, vitality = 12, agility = 300, exp = 7500, level = 150, wildLvl = 5, type = 'fire', type2 = 'no type'},
	
	['Shiny Electivire'] = {offense = 3, defense = 14, specialattack = 10, life = 5500, vitality = 14, agility = 300, exp = 7500, level = 150, wildLvl = 5, type = 'electric', type2 = 'no type'},

-- Armadilhas / Trap and SummonNpc --
	
	['Hunter'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 7500, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hunterf'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 7500, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Aporygon'] = {offense = 0.6, defense = 4.1, specialattack = 5, life = 3500, vitality = 4.6, agility = 0, exp = 92, level = 20, wildLvl = 5, type = 'rock', type2 = 'no type'},				
	
	['Abporygon'] = {offense = 0.6, defense = 4.1, specialattack = 5, life = 3500, vitality = 4.6, agility = 0, exp = 92, level = 20, wildLvl = 5, type = 'rock', type2 = 'no type'},				
	
	['Hoodeasy'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 15000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodeasyf'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 15000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodmedium'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 20000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodmediumf'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 20000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodhard'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 25000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodhardf'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 25000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodexpert'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 30000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodexpertf'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 30000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodlendary'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 50000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},
	
	['Hoodlendaryf'] = {offense = 0.7, defense = 3.5, specialattack = 3.5, life = 800, vitality = 2.5, agility = 0, exp = 50000, level = 20, wildLvl = 1, type = 'normal', type2 = 'no type'},

	
}

newpokedexCatchXpMasterx = {

["Bulbasaur"] = {gender = 875, level = 1, storage = 1001, stoCatch = 666001, expCatch = 50000},
["Ivysaur"] = {gender = 875, level = 40, storage = 1002, stoCatch = 666002, expCatch = 75000},
["Venusaur"] = {gender = 875, level = 85, storage = 1003, stoCatch = 666003, expCatch = 1000000},
["Charmander"] = {gender = 875, level = 1, storage = 1004, stoCatch = 666004, expCatch = 25000},
["Charmeleon"] = {gender = 875, level = 40, storage = 1005, stoCatch = 666005, expCatch = 75000},
["Charizard"] = {gender = 875, level = 85, storage = 1006, stoCatch = 666006, expCatch = 1000000},
["Squirtle"] = {gender = 875, level = 1, storage = 1007, stoCatch = 666007, expCatch = 50000},
["Wartortle"] = {gender = 875, level = 40, storage = 1008, stoCatch = 666008, expCatch = 75000},
["Blastoise"] = {gender = 875, level = 85, storage = 1009, stoCatch = 666009, expCatch = 1000000},
["Caterpie"] = {gender = 500, level = 5, storage = 1010, stoCatch = 666010, expCatch = 2500},
["Metapod"] = {gender = 500, level = 15, storage = 1011, stoCatch = 666011, expCatch = 25000},
["Butterfree"] = {gender = 500, level = 30, storage = 1012, stoCatch = 666012, expCatch = 50000},
["Weedle"] = {gender = 500, level = 5, storage = 1013, stoCatch = 666013, expCatch = 2500},
["Kakuna"] = {gender = 500, level = 15, storage = 1014, stoCatch = 666014, expCatch = 15000},
["Beedrill"] = {gender = 500, level = 30, storage = 1015, stoCatch = 666015, expCatch = 50000},
["Pidgey"] = {gender = 500, level = 5, storage = 1016, stoCatch = 666016, expCatch = 2500},
["Pidgeotto"] = {gender = 500, level = 20, storage = 1017, stoCatch = 666017, expCatch = 25000},
["Pidgeot"] = {gender = 500, level = 75, storage = 1018, stoCatch = 666018, expCatch = 1000000},
["Rattata"] = {gender = 500, level = 5, storage = 1019, stoCatch = 666019, expCatch = 2500},
["Raticate"] = {gender = 500, level = 60, storage = 1020, stoCatch = 666020, expCatch = 25000},
["Spearow"] = {gender = 500, level = 10, storage = 1021, stoCatch = 666021, expCatch = 25000},
["Fearow"] = {gender = 500, level = 50, storage = 1022, stoCatch = 666022, expCatch = 250000},
["Ekans"] = {gender = 500, level = 15, storage = 1023, stoCatch = 666023, expCatch = 25000},
["Arbok"] = {gender = 500, level = 35, storage = 1024, stoCatch = 666024, expCatch = 25000},
["Pikachu"] = {gender = 500, level = 40, storage = 1025, stoCatch = 666025, expCatch = 75000},
["Raichu"] = {gender = 500, level = 85, storage = 1026, stoCatch = 666026, expCatch = 1000000},
["Sandshrew"] = {gender = 500, level = 20, storage = 1027, stoCatch = 666027, expCatch = 25000},
["Sandslash"] = {gender = 500, level = 65, storage = 1028, stoCatch = 666028, expCatch = 25000},
["Nidoran Female"] = {gender = 0, level = 10, storage = 1029, stoCatch = 666029, expCatch = 25000},
["Nidorina"] = {gender = 0, level = 30, storage = 1030, stoCatch = 666030, expCatch = 50000},
["Nidoqueen"] = {gender = 0, level = 65, storage = 1031, stoCatch = 666031, expCatch = 500000},
["Nidoran Male"] = {gender = 1000, level = 10, storage = 1032, stoCatch = 666032, expCatch = 25000},
["Nidorino"] = {gender = 1000, level = 30, storage = 1033, stoCatch = 666033, expCatch = 25000},
["Nidoking"] = {gender = 1000, level = 65, storage = 1034, stoCatch = 666034, expCatch = 500000},
["Clefairy"] = {gender = 250, level = 50, storage = 1035, stoCatch = 666035, expCatch = 75000},
["Clefable"] = {gender = 250, level = 65, storage = 1036, stoCatch = 666036, expCatch = 25000},
["Vulpix"] = {gender = 250, level = 15, storage = 1037, stoCatch = 666037, expCatch = 25000},
["Ninetales"] = {gender = 250, level = 70, storage = 1038, stoCatch = 666038, expCatch = 1000000},
["Jigglypuff"] = {gender = 250, level = 40, storage = 1039, stoCatch = 666039, expCatch = 75000},
["Wigglytuff"] = {gender = 250, level = 65, storage = 1040, stoCatch = 666040, expCatch = 500000},
["Zubat"] = {gender = 500, level = 10, storage = 1041, stoCatch = 666041, expCatch = 25000},
["Golbat"] = {gender = 500, level = 35, storage = 1042, stoCatch = 666042, expCatch = 75000},
["Oddish"] = {gender = 500, level = 5, storage = 1043, stoCatch = 666043, expCatch = 2500},
["Gloom"] = {gender = 500, level = 30, storage = 1044, stoCatch = 666044, expCatch = 25000},
["Vileplume"] = {gender = 500, level = 50, storage = 1045, stoCatch = 666045, expCatch = 250000},
["Paras"] = {gender = 500, level = 5, storage = 1046, stoCatch = 666046, expCatch = 2500},
["Parasect"] = {gender = 500, level = 50, storage = 1047, stoCatch = 666047, expCatch = 250000},
["Venonat"] = {gender = 500, level = 20, storage = 1048, stoCatch = 666048, expCatch = 25000},
["Venomoth"] = {gender = 500, level = 50, storage = 1049, stoCatch = 666049, expCatch = 250000},
["Diglett"] = {gender = 500, level = 10, storage = 1050, stoCatch = 666050, expCatch = 25000},
["Dugtrio"] = {gender = 500, level = 35, storage = 1051, stoCatch = 666051, expCatch = 25000},
["Meowth"] = {gender = 500, level = 15, storage = 1052, stoCatch = 666052, expCatch = 50000},
["Persian"] = {gender = 500, level = 30, storage = 1053, stoCatch = 666053, expCatch = 250000},
["Psyduck"] = {gender = 500, level = 20, storage = 1054, stoCatch = 666054, expCatch = 25000},
["Golduck"] = {gender = 500, level = 55, storage = 1055, stoCatch = 666055, expCatch = 1000000},
["Mankey"] = {gender = 500, level = 10, storage = 1056, stoCatch = 666056, expCatch = 25000},
["Primeape"] = {gender = 500, level = 50, storage = 1057, stoCatch = 666057, expCatch = 250000},
["Growlithe"] = {gender = 750, level = 25, storage = 1058, stoCatch = 666058, expCatch = 50000},
["Arcanine"] = {gender = 750, level = 80, storage = 1059, stoCatch = 666059, expCatch = 2500000},
-- ["Arcanine lendario"] = {gender = 750, level = 80, storage = 1059, stoCatch = 666059, expCatch = 25000},
["Poliwag"] = {gender = 500, level = 5, storage = 1060, stoCatch = 666060, expCatch = 25000},
["Poliwhirl"] = {gender = 500, level = 25, storage = 1061, stoCatch = 666061, expCatch = 50000},
["Poliwrath"] = {gender = 500, level = 65, storage = 1062, stoCatch = 666062, expCatch = 25000},
["Abra"] = {gender = 750, level = 15, storage = 1063, stoCatch = 666063, expCatch = 25000},
["Kadabra"] = {gender = 750, level = 45, storage = 1064, stoCatch = 666064, expCatch = 75000},
["Alakazam"] = {gender = 750, level = 80, storage = 1065, stoCatch = 666065, expCatch = 1000000},
["Machop"] = {gender = 750, level = 20, storage = 1066, stoCatch = 666066, expCatch = 50000},
["Machoke"] = {gender = 750, level = 45, storage = 1067, stoCatch = 666067, expCatch = 75000},
["Machamp"] = {gender = 750, level = 80, storage = 1068, stoCatch = 666068, expCatch = 1000000},
["Bellsprout"] = {gender = 500, level = 5, storage = 1069, stoCatch = 666069, expCatch = 15000},
["Weepinbell"] = {gender = 500, level = 25, storage = 1070, stoCatch = 666070, expCatch = 50000},
["Victreebel"] = {gender = 500, level = 50, storage = 1071, stoCatch = 666071, expCatch = 250000},
["Tentacool"] = {gender = 500, level = 15, storage = 1072, stoCatch = 666072, expCatch = 25000},
["Tentacruel"] = {gender = 500, level = 75, storage = 1073, stoCatch = 666073, expCatch = 1000000},
["Geodude"] = {gender = 500, level = 15, storage = 1074, stoCatch = 666074, expCatch = 15000},
["Graveler"] = {gender = 500, level = 40, storage = 1075, stoCatch = 666075, expCatch = 75000},
["Golem"] = {gender = 500, level = 70, storage = 1076, stoCatch = 666076, expCatch = 500000},
["Ponyta"] = {gender = 500, level = 20, storage = 1077, stoCatch = 666077, expCatch = 50000},
["Rapidash"] = {gender = 500, level = 50, storage = 1078, stoCatch = 666078, expCatch = 250000},
["Slowpoke"] = {gender = 500, level = 15, storage = 1079, stoCatch = 666079, expCatch = 15000},
["Slowbro"] = {gender = 500, level = 45, storage = 1080, stoCatch = 666080, expCatch = 500000},
["Magnemite"] = {gender = -1, level = 15, storage = 1081, stoCatch = 666081, expCatch = 25000},
["Magneton"] = {gender = -1, level = 75, storage = 1082, stoCatch = 666082, expCatch = 75000},
["Magnezone"] = {gender = -1, level = 100, storage = 1082, stoCatch = 666082, expCatch = 25000},
["Farfetch'd"] = {gender = 500, level = 40, storage = 1083, stoCatch = 666083, expCatch = 250000},
["Doduo"] = {gender = 500, level = 15, storage = 1084, stoCatch = 666084, expCatch = 15000},
["Dodrio"] = {gender = 500, level = 45, storage = 1085, stoCatch = 666085, expCatch = 250000},
["Seel"] = {gender = 500, level = 20, storage = 1086, stoCatch = 666086, expCatch = 25000},
["Dewgong"] = {gender = 500, level = 65, storage = 1087, stoCatch = 666087, expCatch = 500000},
["Grimer"] = {gender = 500, level = 15, storage = 1088, stoCatch = 666088, expCatch = 15000},
["Muk"] = {gender = 500, level = 70, storage = 1089, stoCatch = 666089, expCatch = 25000},
["Shellder"] = {gender = 500, level = 10, storage = 1090, stoCatch = 666090, expCatch = 15000},
["Cloyster"] = {gender = 500, level = 60, storage = 1091, stoCatch = 666091, expCatch = 500000},
["Gastly"] = {gender = 500, level = 20, storage = 1092, stoCatch = 666092, expCatch = 50000},
["Haunter"] = {gender = 500, level = 45, storage = 1093, stoCatch = 666093, expCatch = 75000},
["Gengar"] = {gender = 500, level = 80, storage = 1094, stoCatch = 666094, expCatch = 25000},
["Onix"] = {gender = 500, level = 50, storage = 1095, stoCatch = 666095, expCatch = 250000},
["Drowzee"] = {gender = 500, level = 25, storage = 1096, stoCatch = 666096, expCatch = 50000},
["Hypno"] = {gender = 500, level = 55, storage = 1097, stoCatch = 666097, expCatch = 250000},
["Krabby"] = {gender = 500, level = 10, storage = 1098, stoCatch = 666098, expCatch = 15000},
["Kingler"] = {gender = 500, level = 40, storage = 1099, stoCatch = 666099, expCatch = 25000},
["Voltorb"] = {gender = -1, level = 10, storage = 1100, stoCatch = 666100, expCatch = 15000},
["Electrode"] = {gender = -1, level = 35, storage = 1101, stoCatch = 666101, expCatch = 25000},
["Exeggcute"] = {gender = 500, level = 10, storage = 1102, stoCatch = 666102, expCatch = 15000},
["Exeggutor"] = {gender = 500, level = 80, storage = 1103, stoCatch = 666103, expCatch = 250000},
["Cubone"] = {gender = 500, level = 20, storage = 1104, stoCatch = 666104, expCatch = 25000},
["Marowak"] = {gender = 500, level = 55, storage = 1105, stoCatch = 666105, expCatch = 25000},
["Hitmonlee"] = {gender = 1000, level = 60, storage = 1106, stoCatch = 666106, expCatch = 25000},
["Hitmonchan"] = {gender = 1000, level = 60, storage = 1107, stoCatch = 666107, expCatch = 25000},
["Lickitung"] = {gender = 500, level = 55, storage = 1108, stoCatch = 666108, expCatch = 2500000},
["Koffing"] = {gender = 500, level = 15, storage = 1109, stoCatch = 666109, expCatch = 15000},
["Weezing"] = {gender = 500, level = 35, storage = 1110, stoCatch = 666110, expCatch = 75000},
["Rhyhorn"] = {gender = 500, level = 30, storage = 1111, stoCatch = 666111, expCatch = 50000},
["Rhydon"] = {gender = 500, level = 75, storage = 1112, stoCatch = 666112, expCatch = 1000000},
["Chansey"] = {gender = 0, level = 60, storage = 1113, stoCatch = 666113, expCatch = 25000},
["Tangela"] = {gender = 500, level = 50, storage = 1114, stoCatch = 666114, expCatch = 250000},
["Kangaskhan"] = {gender = 0, level = 80, storage = 1115, stoCatch = 666115, expCatch = 2500000},
["Horsea"] = {gender = 500, level = 10, storage = 1116, stoCatch = 666116, expCatch = 25000},
["Seadra"] = {gender = 500, level = 45, storage = 1117, stoCatch = 666117, expCatch = 75000},
["Goldeen"] = {gender = 500, level = 10, storage = 1118, stoCatch = 666118, expCatch = 15000},
["Seaking"] = {gender = 500, level = 35, storage = 1119, stoCatch = 666119, expCatch = 75000},
["Staryu"] = {gender = -1, level = 15, storage = 1120, stoCatch = 666120, expCatch = 50000},
["Starmie"] = {gender = -1, level = 75, storage = 1121, stoCatch = 666121, expCatch = 75000},
["Mr. Mime"] = {gender = 500, level = 45, storage = 1122, stoCatch = 666122, expCatch = 2500000},
["Scyther"] = {gender = 500, level = 80, storage = 1123, stoCatch = 666123, expCatch = 3250000},
["Jynx"] = {gender = 0, level = 80, storage = 1124, stoCatch = 666124, expCatch = 2500000},
["Electabuzz"] = {gender = 750, level = 80, storage = 1125, stoCatch = 666125, expCatch = 2500000},
["Magmar"] = {gender = 750, level = 80, storage = 1126, stoCatch = 666126, expCatch = 2500000},
["Pinsir"] = {gender = 500, level = 45, storage = 1127, stoCatch = 666127, expCatch = 1000000},
["Tauros"] = {gender = 1000, level = 45, storage = 1128, stoCatch = 666128, expCatch = 250000},
["Magikarp"] = {gender = 500, level = 1, storage = 1129, stoCatch = 666129, expCatch = 2500},
["Gyarados"] = {gender = 500, level = 85, storage = 1130, stoCatch = 666130, expCatch = 2500000},
["Lapras"] = {gender = 500, level = 80, storage = 1131, stoCatch = 666131, expCatch = 2500000},
["Ditto"] = {gender = -1, level = 40, storage = 1132, stoCatch = 666132, expCatch = 25000},
["Eevee"] = {gender = 875, level = 20, storage = 1133, stoCatch = 666133, expCatch = 2000000},
["Vaporeon"] = {gender = 875, level = 55, storage = 1134, stoCatch = 666134, expCatch = 2500000},
["Jolteon"] = {gender = 875, level = 55, storage = 1135, stoCatch = 666135, expCatch = 2500000},
["Flareon"] = {gender = 875, level = 55, storage = 1136, stoCatch = 666136, expCatch = 2500000},
["Porygon"] = {gender = -1, level = 40, storage = 1137, stoCatch = 666137, expCatch = 25000},
["Omanyte"] = {gender = 875, level = 20, storage = 1138, stoCatch = 666138, expCatch = 25000},
["Omastar"] = {gender = 875, level = 80, storage = 1139, stoCatch = 666139, expCatch = 25000},
["Kabuto"] = {gender = 875, level = 20, storage = 1140, stoCatch = 666140, expCatch = 25000},
["Kabutops"] = {gender = 875, level = 80, storage = 1141, stoCatch = 666141, expCatch = 25000},
["Aerodactyl"] = {gender = 875, level = 100, storage = 1142, stoCatch = 666142, expCatch = 25000},
["Snorlax"] = {gender = 875, level = 85, storage = 1143, stoCatch = 666143, expCatch = 3250000},
["Articuno"] = {gender = 500, level = 150, storage = 1144, stoCatch = 666144, expCatch = 25000},
["Zapdos"] = {gender = 500, level = 150, storage = 1145, stoCatch = 666145, expCatch = 25000},
["Moltres"] = {gender = 500, level = 150, storage = 1146, stoCatch = 666146, expCatch = 25000},
["Dratini"] = {gender = 500, level = 20, storage = 1147, stoCatch = 666147, expCatch = 250000},
["Dragonair"] = {gender = 500, level = 60, storage = 1148, stoCatch = 666148, expCatch = 2500000},
["Dragonite"] = {gender = 500, level = 100, storage = 1149, stoCatch = 666149, expCatch = 3250000},
["Mewtwo"] = {gender = 500, level = 150, storage = 1150, stoCatch = 666150, expCatch = 25000},
["Mew"] = {gender = 500, level = 150, storage = 1151, stoCatch = 666151, expCatch = 25000},
["Giant Magikarp"] = {gender = 875, level = 10, storage = 104, stoCatch = 666152, expCatch = 10000000},


["Shiny Venusaur"] = {gender = 875, level = 100, storage = 10030, stoCatch = 666154, expCatch = 10000000},
["Shiny Charizard"] = {gender = 875, level = 100, storage = 10060, stoCatch = 666157, expCatch = 10000000},
["Shiny Blastoise"] = {gender = 875, level = 100, storage = 10090, stoCatch = 666160, expCatch = 10000000},
["Shiny Butterfree"] = {gender = 500, level = 60, storage = 10120, stoCatch = 666163, expCatch = 10000000},
["Shiny Beedrill"] = {gender = 500, level = 60, storage = 10150, stoCatch = 666166, expCatch = 1000000},
["Shiny Pidgeot"] = {gender = 500, level = 100, storage = 10180, stoCatch = 666169, expCatch = 10000000},
["Shiny Rattata"] = {gender = 500, level = 10, storage = 10190, stoCatch = 666170, expCatch = 1000000},
["Shiny Raticate"] = {gender = 500, level = 60, storage = 10200, stoCatch = 666171, expCatch = 10000000},
["Shiny Fearow"] = {gender = 500, level = 100, storage = 10220, stoCatch = 666173, expCatch = 10000000},
["Shiny Raichu"] = {gender = 500, level = 100, storage = 10260, stoCatch = 666177, expCatch = 10000000},
["Shiny Nidoking"] = {gender = 1000, level = 100, storage = 10340, stoCatch = 666185, expCatch = 10000000},
["Shiny Zubat"] = {gender = 500, level = 10, storage = 10410, stoCatch = 666192, expCatch = 1000000},
["Shiny Golbat"] = {gender = 500, level = 60, storage = 10420, stoCatch = 666193, expCatch = 10000000},
["Shiny Oddish"] = {gender = 500, level = 10, storage = 10430, stoCatch = 666194, expCatch = 1000000},
["Shiny Vileplume"] = {gender = 500, level = 100, storage = 10450, stoCatch = 666196, expCatch = 10000000},
["Shiny Paras"] = {gender = 500, level = 10, storage = 10460, stoCatch = 666197, expCatch = 1000000},
["Shiny Parasect"] = {gender = 500, level = 60, storage = 10470, stoCatch = 666198, expCatch = 10000000},
["Shiny Venonat"] = {gender = 500, level = 30, storage = 10480, stoCatch = 666199, expCatch = 1000000},
["Shiny Venomoth"] = {gender = 500, level = 80, storage = 10490, stoCatch = 666200, expCatch = 10000000},
["Shiny Growlithe"] = {gender = 750, level = 35, storage = 10580, stoCatch = 666209, expCatch = 1000000},
["Shiny Arcanine"] = {gender = 750, level = 100, storage = 10590, stoCatch = 666210, expCatch = 10000000},
["Shiny Abra"] = {gender = 750, level = 80, storage = 10630, stoCatch = 666214, expCatch = 1000000},
["Shiny Alakazam"] = {gender = 750, level = 100, storage = 10650, stoCatch = 666216, expCatch = 10000000},
["Shiny Tentacool"] = {gender = 500, level = 25, storage = 10720, stoCatch = 666223, expCatch = 1000000},
["Shiny Tentacruel"] = {gender = 500, level = 100, storage = 10730, stoCatch = 666224, expCatch = 10000000},
["Shiny Golem"] = {gender = 500, level = 100, storage = 10760, stoCatch = 666227, expCatch = 10000000},
["Shiny Farfetch'd"] = {gender = 500, level = 100, storage = 10830, stoCatch = 666234, expCatch = 10000000},
["Shiny Grimer"] = {gender = 500, level = 25, storage = 10880, stoCatch = 666239, expCatch = 1000000},
["Shiny Muk"] = {gender = 500, level = 100, storage = 10890, stoCatch = 666240, expCatch = 10000000},
["Shiny Gengar"] = {gender = 500, level = 100, storage = 10940, stoCatch = 666245, expCatch = 10000000},
["Shiny Onix"] = {gender = 500, level = 100, storage = 10950, stoCatch = 666246, expCatch = 10000000},
["Shiny Hypno"] = {gender = 500, level = 100, storage = 10970, stoCatch = 666248, expCatch = 10000000},
["Shiny Krabby"] = {gender = 500, level = 15, storage = 10980, stoCatch = 666249, expCatch = 1000000},
["Shiny Kingler"] = {gender = 500, level = 60, storage = 10990, stoCatch = 666250, expCatch = 10000000},
["Shiny Voltorb"] = {gender = -1, level = 25, storage = 11000, stoCatch = 666251, expCatch = 1000000},
["Shiny Electrode"] = {gender = -1, level = 80, storage = 11010, stoCatch = 666252, expCatch = 10000000},
["Shiny Cubone"] = {gender = 500, level = 30, storage = 11040, stoCatch = 666255, expCatch = 1000000},
["Shiny Marowak"] = {gender = 500, level = 100, storage = 11050, stoCatch = 666256, expCatch = 10000000},
["Shiny Hitmonlee"] = {gender = 1000, level = 100, storage = 11060, stoCatch = 666257, expCatch = 10000000},
["Shiny Hitmonchan"] = {gender = 1000, level = 100, storage = 11070, stoCatch = 666258, expCatch = 10000000},
["Shiny Tangela"] = {gender = 500, level = 100, storage = 11140, stoCatch = 666265, expCatch = 10000000},
["Shiny Horsea"] = {gender = 500, level = 15, storage = 11160, stoCatch = 666267, expCatch = 1000000},
["Shiny Seadra"] = {gender = 500, level = 60, storage = 11170, stoCatch = 666268, expCatch = 1000000},
["Shiny Scyther"] = {gender = 500, level = 100, storage = 11230, stoCatch = 666274, expCatch = 10000000},
["Shiny Jynx"] = {gender = 0, level = 100, storage = 11240, stoCatch = 666275, expCatch = 10000000},
["Shiny Electabuzz"] = {gender = 750, level = 100, storage = 11250, stoCatch = 666276, expCatch = 10000000},
["Shiny Pinsir"] = {gender = 500, level = 100, storage = 11270, stoCatch = 666278, expCatch = 10000000},
["Shiny Magikarp"] = {gender = 500, level = 10, storage = 11290, stoCatch = 666280, expCatch = 1000000},
["Shiny Gyarados"] = {gender = 500, level = 120, storage = 11300, stoCatch = 666281, expCatch = 10000000},
["Shiny Vaporeon"] = {gender = 875, level = 100, storage = 11340, stoCatch = 666285, expCatch = 10000000},

["Shiny Jolteon"] = {gender = 875, level = 100, storage = 11350, stoCatch = 666286, expCatch = 10000000},
["Shiny Flareon"] = {gender = 875, level = 100, storage = 11360, stoCatch = 666287, expCatch = 10000000},
["Shiny Snorlax"] = {gender = 875, level = 120, storage = 11430, stoCatch = 666294, expCatch = 10000000},
["Shiny Dratini"] = {gender = 500, level = 25, storage = 11470, stoCatch = 666298, expCatch = 1000000},
["Shiny Dragonair"] = {gender = 500, level = 100, storage = 11480, stoCatch = 666299, expCatch = 10000000},
["Shiny Dragonite"] = {gender = 500, level = 120, storage = 11490, stoCatch = 666300, expCatch = 10000000},
["Chikorita"] = {gender = 875, level = 20, storage = 1152, stoCatch = 666303, expCatch = 50000},
["Bayleef"] = {gender = 875, level = 40, storage = 1153, stoCatch = 666304, expCatch = 75000},
["Meganium"] = {gender = 875, level = 85, storage = 1154, stoCatch = 666305, expCatch = 1000000},
["Cyndaquil"] = {gender = 875, level = 20, storage = 1155, stoCatch = 666306, expCatch = 50000},
["Quilava"] = {gender = 875, level = 40, storage = 1156, stoCatch = 666307, expCatch = 75000},
["Typhlosion"] = {gender = 875, level = 85, storage = 1157, stoCatch = 666308, expCatch = 1000000},
["Totodile"] = {gender = 875, level = 20, storage = 1158, stoCatch = 666309, expCatch = 50000},
["Croconaw"] = {gender = 875, level = 40, storage = 1159, stoCatch = 666310, expCatch = 75000},
["Feraligatr"] = {gender = 875, level = 85, storage = 1160, stoCatch = 666311, expCatch = 1000000},
["Sentret"] = {gender = 500, level = 15, storage = 1161, stoCatch = 666312, expCatch = 15000},
["Furret"] = {gender = 500, level = 35, storage = 1162, stoCatch = 666313, expCatch = 75000},
["Hoothoot"] = {gender = 500, level = 20, storage = 1163, stoCatch = 666314, expCatch = 50000},
["Noctowl"] = {gender = 500, level = 65, storage = 1164, stoCatch = 666315, expCatch = 500000},
["Ledyba"] = {gender = 500, level = 15, storage = 1165, stoCatch = 666316, expCatch = 15000},
["Ledian"] = {gender = 500, level = 35, storage = 1166, stoCatch = 666317, expCatch = 250000},
["Spinarak"] = {gender = 500, level = 10, storage = 1167, stoCatch = 666318, expCatch = 15000},
["Ariados"] = {gender = 500, level = 40, storage = 1168, stoCatch = 666319, expCatch = 75000},
["Crobat"] = {gender = 500, level = 80, storage = 1169, stoCatch = 666320, expCatch = 2500000},
["Chinchou"] = {gender = 500, level = 15, storage = 1170, stoCatch = 666321, expCatch = 15000},
["Lanturn"] = {gender = 500, level = 50, storage = 1171, stoCatch = 666322, expCatch = 500000},
["Pichu"] = {gender = 500, level = 20, storage = 1172, stoCatch = 666323, expCatch = 50000},
["Cleffa"] = {gender = 500, level = 20, storage = 1173, stoCatch = 666324, expCatch = 50000},
["Igglybuff"] = {gender = 500, level = 20, storage = 1174, stoCatch = 666325, expCatch = 50000},
["Togepi"] = {gender = 500, level = 5, storage = 1175, stoCatch = 666326, expCatch = 250000},
["Togetic"] = {gender = 875, level = 60, storage = 1176, stoCatch = 666327, expCatch = 2500000},
["Natu"] = {gender = 500, level = 25, storage = 1177, stoCatch = 666328, expCatch = 75000},
["Xatu"] = {gender = 500, level = 75, storage = 1178, stoCatch = 666329, expCatch = 1000000},
["Mareep"] = {gender = 500, level = 20, storage = 1179, stoCatch = 666330, expCatch = 50000},
["Flaaffy"] = {gender = 500, level = 40, storage = 1180, stoCatch = 666331, expCatch = 75000},
["Ampharos"] = {gender = 500, level = 85, storage = 1181, stoCatch = 666332, expCatch = 1000000},
["Bellossom"] = {gender = 500, level = 50, storage = 1182, stoCatch = 666333, expCatch = 250000},
["Marill"] = {gender = 500, level = 20, storage = 1183, stoCatch = 666334, expCatch = 50000},
["Azumarill"] = {gender = 500, level = 65, storage = 1184, stoCatch = 666335, expCatch = 500000},
["Sudowoodo"] = {gender = 500, level = 80, storage = 1185, stoCatch = 666336, expCatch = 5000000},
["Politoed"] = {gender = 500, level = 65, storage = 1186, stoCatch = 666337, expCatch = 500000},
["Hoppip"] = {gender = 500, level = 5, storage = 1187, stoCatch = 666338, expCatch = 2500},
["Skiploom"] = {gender = 500, level = 25, storage = 1188, stoCatch = 666339, expCatch = 50000},
["Jumpluff"] = {gender = 500, level = 50, storage = 1189, stoCatch = 666340, expCatch = 250000},
["Aipom"] = {gender = 500, level = 40, storage = 1190, stoCatch = 666341, expCatch = 75000},
["Sunkern"] = {gender = 500, level = 5, storage = 1191, stoCatch = 666342, expCatch = 2500},
["Sunflora"] = {gender = 500, level = 30, storage = 1192, stoCatch = 666343, expCatch = 75000},
["Yanma"] = {gender = 500, level = 50, storage = 1193, stoCatch = 666344, expCatch = 250000},
["Wooper"] = {gender = 500, level = 20, storage = 1194, stoCatch = 666345, expCatch = 50000},
["Quagsire"] = {gender = 500, level = 65, storage = 1195, stoCatch = 666346, expCatch = 500000},
["Espeon"] = {gender = 875, level = 55, storage = 1196, stoCatch = 666347, expCatch = 2500000},
["Umbreon"] = {gender = 875, level = 55, storage = 1197, stoCatch = 666348, expCatch = 2500000},
["Murkrow"] = {gender = 500, level = 55, storage = 1198, stoCatch = 666349, expCatch = 250000},
["Slowking"] = {gender = 500, level = 100, storage = 1199, stoCatch = 666350, expCatch = 25000},
["Misdreavus"] = {gender = 500, level = 80, storage = 1200, stoCatch = 666351, expCatch = 5000000},
["Unown"] = {gender = 500, level = 100, storage = 1201, stoCatch = 666352, expCatch = 1000000},
["Wobbuffet"] = {gender = 500, level = 80, storage = 1202, stoCatch = 666353, expCatch = 5000000},
["Girafarig"] = {gender = 500, level = 80, storage = 1203, stoCatch = 666354, expCatch = 2500000},
["Pineco"] = {gender = 500, level = 15, storage = 1204, stoCatch = 666355, expCatch = 15000},
["Forretress"] = {gender = 500, level = 65, storage = 1205, stoCatch = 666356, expCatch = 500000},
["Dunsparce"] = {gender = 500, level = 30, storage = 1206, stoCatch = 666357, expCatch = 75000},
["Gligar"] = {gender = 500, level = 40, storage = 1207, stoCatch = 666358, expCatch = 75000},
["Steelix"] = {gender = 500, level = 100, storage = 1208, stoCatch = 666359, expCatch = 3250000},
["Snubbull"] = {gender = 250, level = 30, storage = 1209, stoCatch = 666360, expCatch = 50000},
["Granbull"] = {gender = 250, level = 65, storage = 1210, stoCatch = 666361, expCatch = 250000},
["Qwilfish"] = {gender = 500, level = 55, storage = 1211, stoCatch = 666362, expCatch = 500000},
["Scizor"] = {gender = 500, level = 100, storage = 1212, stoCatch = 666363, expCatch = 4250000},
["Shuckle"] = {gender = 500, level = 30, storage = 1213, stoCatch = 666364, expCatch = 75000},
["Heracross"] = {gender = 500, level = 80, storage = 1214, stoCatch = 666365, expCatch = 2500000},
["Sneasel"] = {gender = 500, level = 55, storage = 1215, stoCatch = 666366, expCatch = 250000},
["Teddiursa"] = {gender = 500, level = 20, storage = 1216, stoCatch = 666367, expCatch = 2500000},
["Ursaring"] = {gender = 500, level = 90, storage = 1217, stoCatch = 666368, expCatch = 3250000},
["Slugma"] = {gender = 500, level = 15, storage = 1218, stoCatch = 666369, expCatch = 15000},
["Magcargo"] = {gender = 500, level = 60, storage = 1219, stoCatch = 666370, expCatch = 500000},
["Swinub"] = {gender = 500, level = 15, storage = 1220, stoCatch = 666371, expCatch = 15000},
["Piloswine"] = {gender = 500, level = 80, storage = 1221, stoCatch = 666372, expCatch = 1000000},
["Corsola"] = {gender = 250, level = 50, storage = 1222, stoCatch = 666373, expCatch = 250000},
["Remoraid"] = {gender = 500, level = 10, storage = 1223, stoCatch = 666374, expCatch = 15000},
["Octillery"] = {gender = 500, level = 70, storage = 1224, stoCatch = 666375, expCatch = 500000},
["Delibird"] = {gender = 500, level = 40, storage = 1225, stoCatch = 666376, expCatch = 75000},
["Mantine"] = {gender = 500, level = 80, storage = 1226, stoCatch = 666377, expCatch = 2500000},
["Skarmory"] = {gender = 500, level = 85, storage = 1227, stoCatch = 666378, expCatch = 2500000},
["Houndour"] = {gender = 500, level = 50, storage = 1228, stoCatch = 666379, expCatch = 50000},
["Houndoom"] = {gender = 500, level = 80, storage = 1229, stoCatch = 666380, expCatch = 1000000},
["Kingdra"] = {gender = 500, level = 90, storage = 1230, stoCatch = 666381, expCatch = 2500000},
["Phanpy"] = {gender = 500, level = 20, storage = 1231, stoCatch = 666382, expCatch = 50000},
["Donphan"] = {gender = 500, level = 80, storage = 1232, stoCatch = 666383, expCatch = 1000000},
["Porygon2"] = {gender = -1, level = 75, storage = 1233, stoCatch = 666384, expCatch = 25000},
["Stantler"] = {gender = 500, level = 55, storage = 1234, stoCatch = 666385, expCatch = 250000},
["Tyrogue"] = {gender = 500, level = 30, storage = 1236, stoCatch = 666387, expCatch = 25000},
["Hitmontop"] = {gender = 1000, level = 60, storage = 1237, stoCatch = 666388, expCatch = 25000},
["Smoochum"] = {gender = 500, level = 30, storage = 1238, stoCatch = 666389, expCatch = 75000},
["Elekid"] = {gender = 500, level = 30, storage = 1239, stoCatch = 666390, expCatch = 75000},
["Magby"] = {gender = 500, level = 30, storage = 1240, stoCatch = 666391, expCatch = 75000},
["Miltank"] = {gender = 0, level = 80, storage = 1241, stoCatch = 666392, expCatch = 2500000},
["Blissey"] = {gender = 0, level = 100, storage = 1242, stoCatch = 666393, expCatch = 25000},
["Raikou"] = {gender = 500, level = 150, storage = 1243, stoCatch = 666394, expCatch = 25000},
["Entei"] = {gender = 500, level = 150, storage = 1244, stoCatch = 666395, expCatch = 25000},
["Suicune"] = {gender = 500, level = 150, storage = 1245, stoCatch = 666396, expCatch = 25000},
["Larvitar"] = {gender = 500, level = 20, storage = 1246, stoCatch = 666397, expCatch = 250000},
["Pupitar"] = {gender = 500, level = 65, storage = 1247, stoCatch = 666398, expCatch = 2500000},
["Tyranitar"] = {gender = 500, level = 100, storage = 1248, stoCatch = 666399, expCatch = 3250000},
["Lugia"] = {gender = 500, level = 150, storage = 1249, stoCatch = 666400, expCatch = 25000},
["Ho-oh"] = {gender = 500, level = 150, storage = 1250, stoCatch = 666401, expCatch = 25000},
["Celebi"] = {gender = 500, level = 150, storage = 1251, stoCatch = 666402, expCatch = 25000},
["Shiny Hitmontop"] = {gender = 1000, level = 100, storage = 11520, stoCatch = 666403, expCatch = 10000000},
["Shiny Mr. Mime"] = {gender = 500, level = 150, storage = 11521, stoCatch = 666404, expCatch = 10000000},
["Shiny Rhydon"] = {gender = 500, level = 150, storage = 11522, stoCatch = 666405, expCatch = 10000000},
["Shiny Ninetales"] = {gender = 250, level = 150, storage = 11523, stoCatch = 666406, expCatch = 10000000},
["Shiny Ariados"] = {gender = 500, level = 150, storage = 11524, stoCatch = 666407, expCatch = 10000000},
["Shiny Magneton"] = {gender = -1, level = 150, storage = 11525, stoCatch = 666408, expCatch = 10000000},
["Shiny Espeon"] = {gender = 875, level = 150, storage = 11526, stoCatch = 666409, expCatch = 10000000},
["Shiny Politoed"] = {gender = 500, level = 150, storage = 11527, stoCatch = 666410, expCatch = 10000000},
["Shiny Umbreon"] = {gender = 875, level = 150, storage = 11528, stoCatch = 666411, expCatch = 10000000},
["Shiny Stantler"] = {gender = 500, level = 150, storage = 11529, stoCatch = 666412, expCatch = 10000000},
["Shiny Dodrio"] = {gender = 500, level = 150, storage = 11530, stoCatch = 666413, expCatch = 10000000},


["Shiny Weezing"] = {gender = 875, level = 100, storage = 11540, stoCatch = 666006, expCatch = 10000000},
["Shiny Sandslash"] = {gender = 875, level = 100, storage = 11541, stoCatch = 666007, expCatch = 10000000},
["Shiny Crobat"] = {gender = 875, level = 100, storage = 11542, stoCatch = 666008, expCatch = 10000000},
["Shiny Magmar"] = {gender = 875, level = 100, storage = 11543, stoCatch = 666009, expCatch = 10000000},
["Shiny Giant Magikarp"] = {gender = 875, level = 100, storage = 11545, stoCatch = 666011, expCatch = 10000000},
["Shiny Ampharos"] = {gender = 875, level = 100, storage = 11531, stoCatch = 666012, expCatch = 10000000},
["Shiny Feraligatr"] = {gender = 875, level = 100, storage = 11532, stoCatch = 666013, expCatch = 10000000},
["Shiny Machamp"] = {gender = 875, level = 100, storage = 11534, stoCatch = 666015, expCatch = 10000000},
["Shiny Meganium"] = {gender = 875, level = 100, storage = 11535, stoCatch = 666016, expCatch = 10000000},
["Shiny Larvitar"] = {gender = 875, level = 60, storage = 11533, stoCatch = 666014, expCatch = 10000000},
["Shiny Pupitar"] = {gender = 875, level = 100, storage = 11536, stoCatch = 666017, expCatch = 10000000},
["Shiny Tauros"] = {gender = 875, level = 100, storage = 11537, stoCatch = 666018, expCatch = 10000000},
["Shiny Typhlosion"] = {gender = 875, level = 100, storage = 11538, stoCatch = 666019, expCatch = 10000000},
["Shiny Xatu"] = {gender = 875, level = 100, storage = 11539, stoCatch = 666020, expCatch = 10000000},

["Shiny Ditto"] = {gender = -1, level = 100, storage = 11540, stoCatch = 666428, expCatch = 10000000},

["Shiny Magcargo"] = {gender = 875, level = 100, storage = 11540, stoCatch = 666021, expCatch = 10000000},
["Shiny Lanturn"] = {gender = 875, level = 100, storage = 11541, stoCatch = 666022, expCatch = 10000000},
["Shiny Magmortar"] = {gender = 875, level = 150, storage = 11542, stoCatch = 666523, expCatch = 10000000},
["Shiny Electivire"] = {gender = 875, level = 150, storage = 11543, stoCatch = 666012, expCatch = 10000000},
["Magmortar"] = {gender = 875, level = 100, storage = 11542, stoCatch = 666533, expCatch = 10000000},
["Electivire"] = {gender = 875, level = 100, storage = 11543, stoCatch = 666012, expCatch = 10000000},
["Shiny Mantine"] = {gender = 500, level = 150, storage = 1226, stoCatch = 666013, expCatch = 10000000},
["Salamence"] = {gender = 500, level = 120, storage = 1149, stoCatch = 666148, expCatch = 10000000},
["Shiny Salamence"] = {gender = 500, level = 150, storage = 1149, stoCatch = 666149, expCatch = 10000000},
["Milotic"] = {gender = 500, level = 140, storage = 1130, stoCatch = 666013, expCatch = 10000000},
["Tropius"] = {gender = 500, level = 90, storage = 16000, stoCatch = 666016, expCatch = 10000000},
["Absol"] = {gender = 500, level = 130, storage = 16000, stoCatch = 666020, expCatch = 10000000},
["Wailord"] = {gender = 500, level = 150, storage = 16000, stoCatch = 666013, expCatch = 10000000},
["Beldum"] = {gender = 500, level = 25, storage = 16000, stoCatch = 668013, expCatch = 10000000},
["Metang"] = {gender = 500, level = 80, storage = 16000, stoCatch = 669013, expCatch = 10000000},
["Metagross"] = {gender = 500, level = 150, storage = 16000, stoCatch = 696013, expCatch = 10000000},

--mix ver se tem na lista antiga pq eu n achei nd (se não tiver é top)
["Shiny Arbok"] = {gender = 500, level = 150, storage = 16006, stoCatch = 5017, expCatch = 10000000},
["Shiny Bulbasaur"] = {gender = 500, level = 150, storage = 16007, stoCatch = 5018, expCatch = 10000000},
["Shiny Caterpie"] = {gender = 500, level = 150, storage = 16008, stoCatch = 5019, expCatch = 10000000},
["Shiny Chansey"] = {gender = 500, level = 150, storage = 16009, stoCatch = 5020, expCatch = 10000000},
["Shiny Charmander"] = {gender = 500, level = 150, storage = 16010, stoCatch = 5021, expCatch = 10000000},
["Shiny Charmeleon"] = {gender = 500, level = 150, storage = 16011, stoCatch = 5022, expCatch = 10000000},
["Shiny Clefable"] = {gender = 500, level = 150, storage = 16012, stoCatch = 5023, expCatch = 10000000},
["Shiny Clefairy"] = {gender = 500, level = 150, storage = 16013, stoCatch = 5024, expCatch = 10000000},
["Shiny Cleffa"] = {gender = 500, level = 150, storage = 16014, stoCatch = 5025, expCatch = 10000000},
["Shiny Cloyster"] = {gender = 500, level = 150, storage = 16015, stoCatch = 5026, expCatch = 10000000},
["Shiny Dewgong"] = {gender = 500, level = 150, storage = 16016, stoCatch = 5027, expCatch = 10000000},
["Shiny Diglett"] = {gender = 500, level = 150, storage = 16017, stoCatch = 5028, expCatch = 10000000},
["Shiny Doduo"] = {gender = 500, level = 150, storage = 16018, stoCatch = 5029, expCatch = 10000000},
["Shiny Drowzee"] = {gender = 500, level = 150, storage = 16019, stoCatch = 5030, expCatch = 10000000},
["Shiny Dugtrio"] = {gender = 500, level = 150, storage = 16020, stoCatch = 5031, expCatch = 10000000},
["Shiny Ekans"] = {gender = 500, level = 150, storage = 16021, stoCatch = 5032, expCatch = 10000000},
["Shiny Elekid"] = {gender = 500, level = 150, storage = 16022, stoCatch = 5033, expCatch = 10000000},
["Shiny Exeggcute"] = {gender = 500, level = 150, storage = 16023, stoCatch = 5034, expCatch = 10000000},
["Shiny Exeggutor"] = {gender = 500, level = 150, storage = 16024, stoCatch = 5035, expCatch = 10000000},
["Shiny Gastly"] = {gender = 500, level = 150, storage = 16025, stoCatch = 5036, expCatch = 10000000},
["Shiny Geodude"] = {gender = 500, level = 150, storage = 16026, stoCatch = 5037, expCatch = 10000000},
["Shiny Gloom"] = {gender = 500, level = 150, storage = 16027, stoCatch = 5038, expCatch = 10000000},
["Shiny Goldeen"] = {gender = 500, level = 150, storage = 16028, stoCatch = 5039, expCatch = 10000000},
["Shiny Golduck"] = {gender = 500, level = 150, storage = 16029, stoCatch = 5040, expCatch = 10000000},
["Shiny Graveler"] = {gender = 500, level = 150, storage = 16030, stoCatch = 5041, expCatch = 10000000},
["Shiny Haunter"] = {gender = 500, level = 150, storage = 16031, stoCatch = 5042, expCatch = 10000000},
["Shiny Igglybuff"] = {gender = 500, level = 150, storage = 16032, stoCatch = 5043, expCatch = 10000000},
["Shiny Ivysaur"] = {gender = 500, level = 150, storage = 16033, stoCatch = 5044, expCatch = 10000000},
["Shiny Jigglypuff"] = {gender = 500, level = 150, storage = 16034, stoCatch = 5045, expCatch = 10000000},
["Shiny Kakuna"] = {gender = 500, level = 150, storage = 16035, stoCatch = 5046, expCatch = 10000000},
["Shiny Koffing"] = {gender = 500, level = 150, storage = 16036, stoCatch = 5047, expCatch = 10000000},
["Shiny Lickitung"] = {gender = 500, level = 150, storage = 16037, stoCatch = 5048, expCatch = 10000000},
["Shiny Machoke"] = {gender = 500, level = 150, storage = 16038, stoCatch = 5049, expCatch = 10000000},
["Shiny Machop"] = {gender = 500, level = 150, storage = 16039, stoCatch = 5050, expCatch = 10000000},
["Shiny Magnemite"] = {gender = 500, level = 150, storage = 16040, stoCatch = 5051, expCatch = 10000000},
["Shiny Mankey"] = {gender = 500, level = 150, storage = 16041, stoCatch = 5052, expCatch = 10000000},
["Shiny Meowth"] = {gender = 500, level = 150, storage = 16042, stoCatch = 5053, expCatch = 10000000},
["Shiny Metapod"] = {gender = 500, level = 150, storage = 16043, stoCatch = 5054, expCatch = 10000000},
["Shiny Nidoran Female"] = {gender = 500, level = 150, storage = 16044, stoCatch = 5055, expCatch = 10000000},
["Shiny Nidoran Male"] = {gender = 500, level = 150, storage = 16045, stoCatch = 5056, expCatch = 10000000},
["Shiny Nidorina"] = {gender = 500, level = 150, storage = 160046, stoCatch = 5057, expCatch = 10000000},
["Shiny Nidorino"] = {gender = 500, level = 150, storage = 16047, stoCatch = 5058, expCatch = 10000000},
["Shiny Pidgeotto"] = {gender = 500, level = 150, storage = 16048, stoCatch = 5059, expCatch = 10000000},
["Shiny Pidgey"] = {gender = 500, level = 150, storage = 16049, stoCatch = 5060, expCatch = 10000000},
["Shiny Pikachu"] = {gender = 500, level = 150, storage = 16050, stoCatch = 5061, expCatch = 10000000},
["Shiny Poliwag"] = {gender = 500, level = 150, storage = 16051, stoCatch = 5062, expCatch = 10000000},
["Shiny Poliwhirl"] = {gender = 500, level = 150, storage = 16052, stoCatch = 5063, expCatch = 10000000},
["Shiny Poliwrath"] = {gender = 500, level = 150, storage = 16053, stoCatch = 5064, expCatch = 10000000},
["Shiny Ponyta"] = {gender = 500, level = 150, storage = 16054, stoCatch = 5065, expCatch = 10000000},
["Shiny Porygon"] = {gender = 500, level = 150, storage = 16055, stoCatch = 5066, expCatch = 10000000},
["Shiny Psyduck"] = {gender = 500, level = 150, storage = 16056, stoCatch = 5067, expCatch = 10000000},
["Shiny Rapidash"] = {gender = 500, level = 150, storage = 16057, stoCatch = 5068, expCatch = 10000000},
["Shiny Rhyhorn"] = {gender = 500, level = 150, storage = 16058, stoCatch = 5069, expCatch = 10000000},
["Shiny Sandshrew"] = {gender = 500, level = 150, storage = 16059, stoCatch = 5070, expCatch = 10000000},
["Shiny Sandslash"] = {gender = 500, level = 150, storage = 16060, stoCatch = 5071, expCatch = 10000000},
["Shiny Seaking"] = {gender = 500, level = 150, storage = 16061, stoCatch = 5072, expCatch = 10000000},
["Shiny Seel"] = {gender = 500, level = 150, storage = 16062, stoCatch = 5073, expCatch = 10000000},
["Shiny Shellder"] = {gender = 500, level = 150, storage = 16063, stoCatch = 5074, expCatch = 10000000},
["Shiny Slowbro"] = {gender = 500, level = 150, storage = 16064, stoCatch = 5075, expCatch = 10000000},
["Shiny Slowpoke"] = {gender = 500, level = 150, storage = 16065, stoCatch = 5076, expCatch = 10000000},
["Shiny Spearow"] = {gender = 500, level = 150, storage = 16066, stoCatch = 5077, expCatch = 10000000},
["Shiny Squirtle"] = {gender = 500, level = 150, storage = 16067, stoCatch = 5078, expCatch = 10000000},
["Shiny Starmie"] = {gender = 500, level = 150, storage = 16068, stoCatch = 5079, expCatch = 10000000},
["Shiny Staryu"] = {gender = 500, level = 150, storage = 16069, stoCatch = 5080, expCatch = 10000000},
["Shiny Victreebel"] = {gender = 500, level = 150, storage = 16070, stoCatch = 5081, expCatch = 10000000},
["Shiny Vulpix"] = {gender = 500, level = 150, storage = 16071, stoCatch = 5082, expCatch = 10000000},
["Shiny Wartortle"] = {gender = 500, level = 150, storage = 16072, stoCatch = 5083, expCatch = 10000000},
["Shiny Weedle"] = {gender = 500, level = 150, storage = 16073, stoCatch = 5084, expCatch = 10000000},
["Shiny Weepinbell"] = {gender = 500, level = 150, storage = 16074, stoCatch = 5085, expCatch = 10000000},
["Shiny Wigglytuff"] = {gender = 500, level = 150, storage = 16075, stoCatch = 5086, expCatch = 10000000},
["Shiny Scizor"] = {gender = 35, level = 200, storage = 16076, stoCatch = 5087, expCatch = 10000000},
["Shiny Kabutops"] = {gender = 400, level = 200, storage = 16077, stoCatch = 5088, expCatch = 10000000},
--mix ver se tem na lista antiga pq eu n achei nd (se não tiver é top)

-- 3 GENERATION POKEMON --
--mix
["Treecko"] = {gender = 500, level = 20, storage = 16078, stoCatch = 5089, expCatch = 50000},
["Grovyle"] = {gender = 500, level = 40, storage = 16079, stoCatch = 5090, expCatch = 250000},
["Sceptile"] = {gender = 500, level = 80, storage = 16080, stoCatch = 5091, expCatch = 1000000},
["Mudkip"] = {gender = 500, level = 20, storage = 16081, stoCatch = 5092, expCatch = 50000},
["Marshtomp"] = {gender = 500, level = 40, storage = 16082, stoCatch = 5093, expCatch = 250000},
["Swampert"] = {gender = 500, level = 80, storage = 16083, stoCatch = 5094, expCatch = 1000000},
["Torchic"] = {gender = 500, level = 20, storage = 16084, stoCatch = 5095, expCatch = 50000},
["Combusken"] = {gender = 500, level = 40, storage = 16085, stoCatch = 5096, expCatch = 250000},
["Blaziken"] = {gender = 500, level = 80, storage = 16086, stoCatch = 5097, expCatch = 1000000},
["Poochyena"] = {gender = 500, level = 20, storage = 16087, stoCatch = 5098, expCatch = 250000},
["Mightyena"] = {gender = 500, level = 80, storage = 16088, stoCatch = 5099, expCatch = 1000000},
["Zigzagoon"] = {gender = 500, level = 20, storage = 16089, stoCatch = 5100, expCatch = 50000},
["Linoone"] = {gender = 500, level = 40, storage = 16090, stoCatch = 5101, expCatch = 250000},
["Wurmple"] = {gender = 500, level = 10, storage = 16091, stoCatch = 5102, expCatch = 15000},
["Silcoon"] = {gender = 500, level = 25, storage = 16092, stoCatch = 5103, expCatch = 15000},
["Cascoon"] = {gender = 500, level = 25, storage = 16093, stoCatch = 5104, expCatch = 15000},
["Beautifly"] = {gender = 500, level = 60, storage = 16094, stoCatch = 5105, expCatch = 500000},
["Dustox"] = {gender = 500, level = 60, storage = 16095, stoCatch = 5106, expCatch = 500000},

["Lotad"] = {gender = 500, level = 20, storage = 16096, stoCatch = 5107, expCatch = 50000},
["Lombre"] = {gender = 500, level = 40, storage = 16097, stoCatch = 5108, expCatch = 250000},
["Ludicolo"] = {gender = 500, level = 80, storage = 16098, stoCatch = 5109, expCatch = 1000000},
["Seedot"] = {gender = 500, level = 20, storage = 16099, stoCatch = 5110, expCatch = 50000},
["Nuzleaf"] = {gender = 500, level = 40, storage = 16100, stoCatch = 5111, expCatch = 250000},
["Shiftry"] = {gender = 500, level = 80, storage = 16101, stoCatch = 5112, expCatch = 1000000},
["Nincada"] = {gender = 500, level = 80, storage = 16102, stoCatch = 5113, expCatch = 50000},

["Ninjask"] = {gender = 500, level = 100, storage = 16103, stoCatch = 5114, expCatch = 1000000},
["Shedinja"] = {gender = 500, level = 60, storage = 16104, stoCatch = 5115, expCatch = 1000000},
["Taillow"] = {gender = 500, level = 20, storage = 16105, stoCatch = 5116, expCatch = 50000},
["Swellow"] = {gender = 500, level = 80, storage = 16106, stoCatch = 5117, expCatch = 1000000},
["Shroomish"] = {gender = 500, level = 20, storage = 16107, stoCatch = 5118, expCatch = 250000},
["Breloom"] = {gender = 500, level = 80, storage = 16108, stoCatch = 5119, expCatch = 500000},
["Spinda"] = {gender = 500, level = 30, storage = 16109, stoCatch = 5120, expCatch = 250000},
["Wingull"] = {gender = 500, level = 20, storage = 16110, stoCatch = 5121, expCatch = 250000},
["Pelipper"] = {gender = 500, level = 80, storage = 16111, stoCatch = 5122, expCatch = 25000},
["Surskit"] = {gender = 500, level = 20, storage = 16112, stoCatch = 5123, expCatch = 75000},
["Masquerain"] = {gender = 500, level = 80, storage = 16113, stoCatch = 5124, expCatch = 1000000},
["Wailmer"] = {gender = 500, level = 80, storage = 16114, stoCatch = 5125, expCatch = 1000000},
["Skitty"] = {gender = 500, level = 20, storage = 16115, stoCatch = 5126, expCatch = 250000},
["Delcatty"] = {gender = 500, level = 80, storage = 16116, stoCatch = 5127, expCatch = 50000},
["Baltoy"] = {gender = 500, level = 20, storage = 16117, stoCatch = 5128, expCatch = 250000},
["Claydol"] = {gender = 500, level = 80, storage = 16118, stoCatch = 5129, expCatch = 250000},
["Torkoal"] = {gender = 500, level = 80, storage = 16119, stoCatch = 5130, expCatch = 2500000},
["Barboach"] = {gender = 500, level = 20, storage = 16120, stoCatch = 5131, expCatch = 250000},
["Whiscash"] = {gender = 500, level = 60, storage = 16121, stoCatch = 5132, expCatch = 1000000},
["Luvdisc"] = {gender = 500, level = 20, storage = 16122, stoCatch = 5133, expCatch = 250000},
["Corphish"] = {gender = 500, level = 20, storage = 16123, stoCatch = 5134, expCatch = 50000},
["Crawdaunt"] = {gender = 500, level = 80, storage = 16124, stoCatch = 5135, expCatch = 250000},
["Feebas"] = {gender = 500, level = 20, storage = 16125, stoCatch = 5136, expCatch = 50000},
["Carvanha"] = {gender = 500, level = 20, storage = 16126, stoCatch = 5137, expCatch = 250000},
["Sharpedo"] = {gender = 500, level = 60, storage = 16127, stoCatch = 5138, expCatch = 1000000},
["Trapinch"] = {gender = 500, level = 20, storage = 16128, stoCatch = 5139, expCatch = 50000},
["Vibrava"] = {gender = 500, level = 40, storage = 16129, stoCatch = 5140, expCatch = 250000},
["Flygon"] = {gender = 500, level = 80, storage = 16130, stoCatch = 5141, expCatch = 1000000},
["Makuhita"] = {gender = 500, level = 20, storage = 16131, stoCatch = 5142, expCatch = 500000},
["Hariyama"] = {gender = 500, level = 80, storage = 16132, stoCatch = 5143, expCatch = 1000000},
["Electrike"] = {gender = 500, level = 20, storage = 16133, stoCatch = 5144, expCatch = 250000},
["Manectric"] = {gender = 500, level = 80, storage = 16134, stoCatch = 5145, expCatch = 1000000},
["Numel"] = {gender = 500, level = 25, storage = 16135, stoCatch = 5146, expCatch = 250000},
["Camerupt"] = {gender = 500, level = 80, storage = 16136, stoCatch = 5147, expCatch = 1000000},
["Spheal"] = {gender = 500, level = 30, storage = 16137, stoCatch = 5148, expCatch = 50000},
["Sealeo"] = {gender = 500, level = 60, storage = 16138, stoCatch = 5149, expCatch = 250000},
["Walrein"] = {gender = 500, level = 85, storage = 16139, stoCatch = 5150, expCatch = 1000000},
["Cacnea"] = {gender = 500, level = 20, storage = 16140, stoCatch = 5151, expCatch = 500000},
["Cacturn"] = {gender = 500, level = 80, storage = 16141, stoCatch = 5152, expCatch = 2500000},
["Snorunt"] = {gender = 500, level = 30, storage = 16142, stoCatch = 5153, expCatch = 250000},
["Glalie"] = {gender = 500, level = 80, storage = 16143, stoCatch = 5154, expCatch = 1000000},
["Spoink"] = {gender = 500, level = 20, storage = 16144, stoCatch = 5155, expCatch = 250000},
["Grumpig"] = {gender = 500, level = 80, storage = 16145, stoCatch = 5156, expCatch = 250000},
["Plusle"] = {gender = 500, level = 30, storage = 16146, stoCatch = 5157, expCatch = 75000},
["Minun"] = {gender = 500, level = 30, storage = 16147, stoCatch = 5158, expCatch = 75000},
["Mawile"] = {gender = 500, level = 80, storage = 16148, stoCatch = 5159, expCatch = 1000000},
["Meditite"] = {gender = 500, level = 30, storage = 16149, stoCatch = 5160, expCatch = 250000},
["Medicham"] = {gender = 500, level = 80, storage = 16150, stoCatch = 5161, expCatch = 1000000},
["Swablu"] = {gender = 500, level = 30, storage = 16151, stoCatch = 5162, expCatch = 250000},
["Duskull"] = {gender = 500, level = 40, storage = 16152, stoCatch = 5163, expCatch = 250000},
["Dusclops"] = {gender = 500, level = 70, storage = 16153, stoCatch = 5164, expCatch = 500000},
["Budew"] = {gender = 500, level = 10, storage = 16154, stoCatch = 5165, expCatch = 25000},
["Roselia"] = {gender = 500, level = 30, storage = 16155, stoCatch = 5166, expCatch = 1000000},
["Roserade"] = {gender = 500, level = 80, storage = 16156, stoCatch = 5167, expCatch = 25000},
["Slakoth"] = {gender = 500, level = 20, storage = 16157, stoCatch = 5168, expCatch = 250000},
["Vigoroth"] = {gender = 500, level = 40, storage = 16158, stoCatch = 5169, expCatch = 500000},
["Gulpin"] = {gender = 500, level = 30, storage = 16159, stoCatch = 5170, expCatch = 75000},
["Swalot"] = {gender = 500, level = 80, storage = 16160, stoCatch = 5171, expCatch = 250000},
["Whismur"] = {gender = 500, level = 20, storage = 16161, stoCatch = 5172, expCatch = 250000},
["Loudred"] = {gender = 500, level = 50, storage = 16162, stoCatch = 5173, expCatch = 250000},
["Exploud"] = {gender = 500, level = 80, storage = 16163, stoCatch = 5174, expCatch = 1000000},
["Clamperl"] = {gender = 500, level = 20, storage = 16164, stoCatch = 5175, expCatch = 250000},
["Huntail"] = {gender = 500, level = 60, storage = 16165, stoCatch = 5176, expCatch = 250000},
["Gorebyss"] = {gender = 500, level = 60, storage = 16166, stoCatch = 5177, expCatch = 250000},
["Shuppet"] = {gender = 500, level = 30, storage = 16167, stoCatch = 5178, expCatch = 250000},
["Banette"] = {gender = 500, level = 70, storage = 16168, stoCatch = 5179, expCatch = 1000000},
["Seviper"] = {gender = 500, level = 80, storage = 16169, stoCatch = 5180, expCatch = 250000},
["Zangoose"] = {gender = 500, level = 80, storage = 16170, stoCatch = 5181, expCatch = 1000000},
["Relicanth"] = {gender = 500, level = 50, storage = 16171, stoCatch = 5182, expCatch = 1000000},
["Aron"] = {gender = 500, level = 30, storage = 16172, stoCatch = 5183, expCatch = 250000},
["Lairon"] = {gender = 500, level = 60, storage = 16173, stoCatch = 5184, expCatch = 1000000},
["Aggron"] = {gender = 500, level = 100, storage = 16174, stoCatch = 5185, expCatch = 3250000},
["Volbeat"] = {gender = 500, level = 40, storage = 16175, stoCatch = 5186, expCatch = 250000},
["Illumise"] = {gender = 500, level = 40, storage = 16176, stoCatch = 5187, expCatch = 500000},
["Lileep"] = {gender = 500, level = 20, storage = 16177, stoCatch = 5188, expCatch = 250000},
["Anorith"] = {gender = 500, level = 20, storage = 16178, stoCatch = 5189, expCatch = 250000},
["Ralts"] = {gender = 500, level = 20, storage = 16179, stoCatch = 5190, expCatch = 250000},
["Kirlia"] = {gender = 500, level = 60, storage = 16180, stoCatch = 5191, expCatch = 1000000},
["Bagon"] = {gender = 500, level = 20, storage = 16181, stoCatch = 5192, expCatch = 500000},
["Shelgon"] = {gender = 500, level = 60, storage = 16182, stoCatch = 5193, expCatch = 1000000},
["Beldum"] = {gender = 500, level = 20, storage = 16183, stoCatch = 5194, expCatch = 500000},
["Metang"] = {gender = 500, level = 60, storage = 16184, stoCatch = 5195, expCatch = 1000000},
["Kecleon"] = {gender = 500, level = 80, storage = 16186, stoCatch = 5197, expCatch = 3250000},
["Lunatone"] = {gender = 500, level = 150, storage = 16187, stoCatch = 5198, expCatch = 1000000},
["Solrock"] = {gender = 500, level = 150, storage = 16188, stoCatch = 5199, expCatch = 1000000},
["Castform"] = {gender = 500, level = 80, storage = 16189, stoCatch = 5200, expCatch = 5000000},
["Cradily"] = {gender = 500, level = 80, storage = 16190, stoCatch = 5201, expCatch = 2500000},
["Altaria"] = {gender = 500, level = 80, storage = 16191, stoCatch = 5202, expCatch = 1000000},
["Armaldo"] = {gender = 500, level = 80, storage = 16192, stoCatch = 5203, expCatch = 2500000},
["Gardevoir"] = {gender = 500, level = 80, storage = 16193, stoCatch = 5204, expCatch = 25000},
["Tropius"] = {gender = 500, level = 100, storage = 16194, stoCatch = 5205, expCatch = 25000},
["Slaking"] = {gender = 500, level = 150, storage = 16195, stoCatch = 5206, expCatch = 1000000},
["Absol"] = {gender = 500, level = 150, storage = 16196, stoCatch = 5207, expCatch = 25000},
["Metagross"] = {gender = 500, level = 150, storage = 16197, stoCatch = 5208, expCatch = 25000},
["Salamence"] = {gender = 500, level = 150, storage = 16198, stoCatch = 5209, expCatch = 25000},
["Marill"] = {gender = 500, level = 20, storage = 16199, stoCatch = 5210, expCatch = 25000},
["Smeargle 1"] = {gender = 500, level = 10, storage = 16200, stoCatch = 5211, expCatch = 100000},
["Smeargle 2"] = {gender = 500, level = 20, storage = 16201, stoCatch = 5212, expCatch = 100000},
["Smeargle 3"] = {gender = 500, level = 30, storage = 16202, stoCatch = 5213, expCatch = 100000},
["Smeargle 4"] = {gender = 500, level = 40, storage = 16203, stoCatch = 5214, expCatch = 100000},
["Smeargle 5"] = {gender = 500, level = 50, storage = 16204, stoCatch = 5215, expCatch = 100000},
["Smeargle 6"] = {gender = 500, level = 60, storage = 16205, stoCatch = 5216, expCatch = 100000},
["Smeargle 7"] = {gender = 500, level = 70, storage = 16206, stoCatch = 5217, expCatch = 100000},
["Smeargle 8"] = {gender = 500, level = 80, storage = 16207, stoCatch = 5218, expCatch = 100000},
["Smeargle"] = {gender = 500, level = 100, storage = 16208, stoCatch = 5219, expCatch = 100000},
["Castform Fire"] = {gender = 500, level = 80, storage = 16209, stoCatch = 5220, expCatch = 5000000},
["Castform Water"] = {gender = 500, level = 80, storage = 16210, stoCatch = 5221, expCatch = 5000000},
["Castform Ice"] = {gender = 500, level = 80, storage = 16211, stoCatch = 5222, expCatch = 5000000},
["Shiny Salamence"] = {gender = 500, level = 80, storage = 16212, stoCatch = 5223, expCatch = 25000},
["Shiny Magmortar"] = {gender = 500, level = 80, storage = 16213, stoCatch = 5224, expCatch = 25000},
["Shiny Electivire"] = {gender = 500, level = 80, storage = 16214, stoCatch = 5225, expCatch = 25000},
["Shiny Scizor"] = {gender = 500, level = 80, storage = 16215, stoCatch = 5226, expCatch = 25000},
["Wynaut"] = {gender = 500, level = 30, storage = 16216, stoCatch = 5227, expCatch = 250000},
["Sableye"] = {gender = 500, level = 50, storage = 16217, stoCatch = 5228, expCatch = 250000},
["Aporygon"] = {gender = 500, level = 50, storage = 16218, stoCatch = 5229, expCatch = 0},
["Abporygon"] = {gender = 500, level = 50, storage = 16219, stoCatch = 5230, expCatch = 0},
["Big Porygon"] = {gender = 500, level = 50, storage = 16220, stoCatch = 5231, expCatch = 0},
["Lucario"] = {gender = 500, level = 80, storage = 16221, stoCatch = 5232, expCatch = 5000000},
["Shiny Lucario"] = {gender = 500, level = 120, storage = 16222, stoCatch = 5233, expCatch = 5000000},
["Shiny Tyranitar"] = {gender = 500, level = 100, storage = 16223, stoCatch = 5234, expCatch = 5000000},
["Shiny Sudowoodo"] = {gender = 500, level = 100, storage = 16224, stoCatch = 5235, expCatch = 5000000},
["Shiny Steelix"] = {gender = 500, level = 100, storage = 16225, stoCatch = 5236, expCatch = 5000000},
["Shiny Skarmory"] = {gender = 500, level = 80, storage = 16226, stoCatch = 5237, expCatch = 5000000},

["Lance Aerodactyl"] = {gender = 875, level = 150, storage = 1142, stoCatch = 666142, expCatch = 10000000},
["Lance Dragonair"] = {gender = 500, level = 150, storage = 1148, stoCatch = 666148, expCatch = 10000000},
["Lance Dragonite"] = {gender = 500, level = 150, storage = 1149, stoCatch = 666149, expCatch = 10000000},
["Mini Dragonite"] = {gender = 500, level = 400, storage = 1149, stoCatch = 666149, expCatch = 10000000},
["Lance Charizard"] = {gender = 875, level = 150, storage = 100, stoCatch = 666006, expCatch = 10000000},
["Lance Shiny Dragonair"] = {gender = 500, level = 150, storage = 11480, stoCatch = 666299, expCatch = 10000000},
["Clan Blastoise"] = {gender = 875, level = 150, storage = 1009, stoCatch = 666009, expCatch = 10000000},
["Clan Tentacruel"] = {gender = 500, level = 150, storage = 1073, stoCatch = 666073, expCatch = 10000000},
["Clan Jynx"] = {gender = 0, level = 150, storage = 1124, stoCatch = 666124, expCatch = 10000000},
["Clan Gyarados"] = {gender = 500, level = 150, storage = 1130, stoCatch = 666130, expCatch = 10000000},
["Clan Lapras"] = {gender = 500, level = 150, storage = 1131, stoCatch = 666131, expCatch = 10000000},
["Clan Omastar"] = {gender = 875, level = 150, storage = 1139, stoCatch = 666139, expCatch = 10000000},
["Clan Kabutops"] = {gender = 875, level = 150, storage = 1141, stoCatch = 666141, expCatch = 10000000},
["Clan Shiny Blastoise"] = {gender = 875, level = 150, storage = 10090, stoCatch = 666160, expCatch = 10000000},
["Clan Shiny Tentacruel"] = {gender = 500, level = 150, storage = 10730, stoCatch = 666224, expCatch = 10000000},
["Clan Shiny Seadra"] = {gender = 500, level = 150, storage = 11170, stoCatch = 666268, expCatch = 10000000},
["Clan Shiny Gyarados"] = {gender = 500, level = 150, storage = 11300, stoCatch = 666281, expCatch = 10000000},
["Clan Shiny Vaporeon"] = {gender = 875, level = 150, storage = 11340, stoCatch = 666285, expCatch = 10000000},
["Clan Shiny Jynx"] = {gender = 0, level = 150, storage = 11240, stoCatch = 666275, expCatch = 10000000},
["Brave Nidoking"] = {gender = 1000, level = 100, storage = 1034, stoCatch = 666034, expCatch = 10000000},
["Sunny Sunflora"] = {gender = 500, level = 100, storage = 1192, stoCatch = 666343, expCatch = 10000000},
["Rage Nidoqueen"] = {gender = 0, level = 100, storage = 1031, stoCatch = 666031, expCatch = 10000000},
["Acid Muk"] = {gender = 500, level = 100, storage = 1089, stoCatch = 666089, expCatch = 10000000},
["Poison Arbok"] = {gender = 500, level = 100, storage = 1024, stoCatch = 666024, expCatch = 10000000},
["Ghost Gengar"] = {gender = 500, level = 100, storage = 1094, stoCatch = 666094, expCatch = 10000000},
["Flying Golbat"] = {gender = 500, level = 100, storage = 1042, stoCatch = 666042, expCatch = 10000000},
["Dark Abra"] = {gender = 750, level = 100, storage = 10630, stoCatch = 666214, expCatch = 10000000},
["Ancient Gengar"] = {gender = 500, level = 150, storage = 10940, stoCatch = 666245, expCatch = 10000000},
["Brave Venusaur"] = {gender = 875, level = 100, storage = 1003, stoCatch = 666003, expCatch = 10000000},
["Ancient Meganium"] = {gender = 875, level = 150, storage = 1154, stoCatch = 666305, expCatch = 10000000},
["Furios Scyther"] = {gender = 500, level = 100, storage = 1123, stoCatch = 666123, expCatch = 10000000},
["Ancient Venusaur"] = {gender = 875, level = 150, storage = 10030, stoCatch = 666154, expCatch = 10000000},
["Slicer Scizor"] = {gender = 500, level = 100, storage = 1212, stoCatch = 666363, expCatch = 10000000},
["Ancient Parasect"] = {gender = 500, level = 150, storage = 10470, stoCatch = 666198, expCatch = 10000000},
["Brave Charizard"] = {gender = 875, level = 100, storage = 100, stoCatch = 666006, expCatch = 10000000},
["Flame Typhlosion"] = {gender = 875, level = 100, storage = 1157, stoCatch = 666308, expCatch = 10000000},
["Wardog Arcanine"] = {gender = 750, level = 100, storage = 1059, stoCatch = 666059, expCatch = 10000000},
["Lava Magmar"] = {gender = 750, level = 100, storage = 1126, stoCatch = 666126, expCatch = 10000000},
["Ancient Arcanine"] = {gender = 750, level = 150, storage = 10590, stoCatch = 666210, expCatch = 10000000},
["Elder Charizard"] = {gender = 875, level = 150, storage = 10060, stoCatch = 666157, expCatch = 10000000},
["Dark Houndoom"] = {gender = 500, level = 100, storage = 1229, stoCatch = 666380, expCatch = 10000000},
["Brave Fearow"] = {gender = 500, level = 100, storage = 1022, stoCatch = 666022, expCatch = 10000000},
["Aviator Pidgeot"] = {gender = 500, level = 100, storage = 1018, stoCatch = 666018, expCatch = 10000000},
["Iron Skarmory"] = {gender = 500, level = 100, storage = 1227, stoCatch = 666378, expCatch = 10000000},
["Owl Noctowl"] = {gender = 500, level = 100, storage = 1164, stoCatch = 666315, expCatch = 10000000},
["Fury Dragonair"] = {gender = 500, level = 100, storage = 1148, stoCatch = 666148, expCatch = 10000000},
["Ancient Dragonite"] = {gender = 500, level = 150, storage = 1149, stoCatch = 666149, expCatch = 10000000},
["Ancient Dragonair"] = {gender = 500, level = 150, storage = 11480, stoCatch = 666299, expCatch = 10000000},
["Elder Pidgeot"] = {gender = 500, level = 160, storage = 10180, stoCatch = 666169, expCatch = 10000000},
["Hard Golem"] = {gender = 500, level = 100, storage = 1076, stoCatch = 666076, expCatch = 10000000},
["Brute Rhydon"] = {gender = 500, level = 100, storage = 1112, stoCatch = 666112, expCatch = 10000000},
["Sand Sandslash"] = {gender = 500, level = 100, storage = 1028, stoCatch = 666028, expCatch = 10000000},
["Earth Donphan"] = {gender = 500, level = 100, storage = 1232, stoCatch = 666383, expCatch = 10000000},
["Ancient Onix"] = {gender = 500, level = 150, storage = 10950, stoCatch = 666246, expCatch = 10000000},
["Elder Tyranitar"] = {gender = 500, level = 150, storage = 1248, stoCatch = 666399, expCatch = 10000000},
["Ancient Steelix"] = {gender = 500, level = 150, storage = 1208, stoCatch = 666359, expCatch = 10000000},
["Puncher Hitmonchan"] = {gender = 1000, level = 100, storage = 1106, stoCatch = 666106, expCatch = 10000000},
["Kicker Hitmonlee"] = {gender = 1000, level = 100, storage = 1107, stoCatch = 666107, expCatch = 10000000},
["UFC Machamp"] = {gender = 750, level = 100, storage = 1068, stoCatch = 666068, expCatch = 10000000},
["Fat Snorlax"] = {gender = 875, level = 100, storage = 1143, stoCatch = 666143, expCatch = 10000000},
["Ancient Ursaring"] = {gender = 500, level = 150, storage = 1217, stoCatch = 666368, expCatch = 10000000},
["Milk Miltank"] = {gender = 0, level = 100, storage = 1241, stoCatch = 666392, expCatch = 10000000},
["Rolling Hitmontop"] = {gender = 1000, level = 100, storage = 1237, stoCatch = 666388, expCatch = 10000000},
["Ash Snorlax"] = {gender = 875, level = 10000, storage = 1143, stoCatch = 666143, expCatch = 10000000},
["Ash Pikachu"] = {gender = 500, level = 10000, storage = 1025, stoCatch = 666025, expCatch = 10000000},
["Ash Charizard"] = {gender = 875, level = 10000, storage = 100, stoCatch = 666006, expCatch = 10000000},
["Ash Pidgeot"] = {gender = 500, level = 10000, storage = 10180, stoCatch = 666169, expCatch = 10000000},
["Ash Venusaur"] = {gender = 875, level = 10000, storage = 10030, stoCatch = 666154, expCatch = 10000000},
["Ash Blastoise"] = {gender = 875, level = 10000, storage = 1009, stoCatch = 666009, expCatch = 10000000},
["Bruno Hitmontop"] = {gender = 1000, level = 1000, storage = 11520, stoCatch = 666403, expCatch = 10000000},
["Bruno Hitmonlee"] = {gender = 1000, level = 1000, storage = 11060, stoCatch = 666257, expCatch = 10000000},
["Bruno Hitmonchan"] = {gender = 1000, level = 1000, storage = 11070, stoCatch = 666258, expCatch = 10000000},
["Bruno Onix"] = {gender = 500, level = 1000, storage = 10950, stoCatch = 666246, expCatch = 10000000},
["Bruno Machamp"] = {gender = 750, level = 1000, storage = 1068, stoCatch = 666068, expCatch = 10000000},
["Agata Gengar"] = {gender = 500, level = 500, storage = 10940, stoCatch = 666245, expCatch = 10000000},
["Agata Misdreavus"] = {gender = 500, level = 100, storage = 1200, stoCatch = 666351, expCatch = 10000000},
["Agata Abra"] = {gender = 750, level = 500, storage = 10630, stoCatch = 666214, expCatch = 10000000},
["Agata Houndoom"] = {gender = 500, level = 500, storage = 1229, stoCatch = 666380, expCatch = 10000000},
["Agata Umbreon"] = {gender = 875, level = 500, storage = 1197, stoCatch = 666348, expCatch = 10000000},
["Agata Murkrow"] = {gender = 500, level = 500, storage = 1198, stoCatch = 666349, expCatch = 10000000},
["Lorelei Lapras"] = {gender = 500, level = 500, storage = 1131, stoCatch = 666131, expCatch = 10000000},
["Lorelei Dewgong"] = {gender = 500, level = 1000, storage = 1087, stoCatch = 666087, expCatch = 10000000},
["Lorelei Piloswine"] = {gender = 500, level = 1000, storage = 1221, stoCatch = 666372, expCatch = 10000000},
["Lorelei Delibird"] = {gender = 500, level = 1000, storage = 1225, stoCatch = 666376, expCatch = 10000000},
["Lorelei Cloyster"] = {gender = 500, level = 1000, storage = 1091, stoCatch = 666091, expCatch = 10000000},
["Lorelei Jynx"] = {gender = 0, level = 1000, storage = 11240, stoCatch = 666275, expCatch = 10000000},
["Lance Gyarados"] = {gender = 500, level = 1000, storage = 11300, stoCatch = 666281, expCatch = 10000000},
["Brave Blastoise"] = {gender = 875, level = 100, storage = 1009, stoCatch = 666009, expCatch = 10000000},
["Ancient Blastoise"] = {gender = 875, level = 150, storage = 10090, stoCatch = 666160, expCatch = 10000000},
["Red Gyarados"] = {gender = 500, level = 1000, storage = 11300, stoCatch = 666281, expCatch = 10000000},
["Rage Gyarados"] = {gender = 500, level = 1000, storage = 1130, stoCatch = 666130, expCatch = 10000000},
["Ancient Jynx"] = {gender = 0, level = 150, storage = 11240, stoCatch = 666275, expCatch = 10000000},
["Frost Jynx"] = {gender = 0, level = 100, storage = 1124, stoCatch = 666124, expCatch = 10000000},
["Icy Dewgong"] = {gender = 500, level = 100, storage = 1087, stoCatch = 666087, expCatch = 10000000},
["Stupid Feraligatr"] = {gender = 875, level = 100, storage = 1160, stoCatch = 666311, expCatch = 10000000},
["Clamped Cloyster"] = {gender = 500, level = 100, storage = 1091, stoCatch = 666091, expCatch = 10000000},
["Surfing Mantine"] = {gender = 500, level = 100, storage = 1226, stoCatch = 666377, expCatch = 10000000},
["Spark Electrode"] = {gender = -1, level = 100, storage = 1101, stoCatch = 666101, expCatch = 10000000},
["Brave Electabuzz"] = {gender = 750, level = 100, storage = 1125, stoCatch = 666125, expCatch = 10000000},
["Ancient Ampharos"] = {gender = 500, level = 150, storage = 1181, stoCatch = 666332, expCatch = 10000000},
["Charged Raichu"] = {gender = 500, level = 100, storage = 1026, stoCatch = 666026, expCatch = 10000000},
["Ancient Raichu"] = {gender = 500, level = 150, storage = 10260, stoCatch = 666177, expCatch = 10000000},
["Ancient Electabuzz"] = {gender = 750, level = 150, storage = 11250, stoCatch = 666276, expCatch = 10000000},
["Brave Hypno"] = {gender = 500, level = 100, storage = 1097, stoCatch = 666097, expCatch = 10000000},
["Psyco Alakazam"] = {gender = 750, level = 100, storage = 1065, stoCatch = 666065, expCatch = 10000000},
["Ancient Alakazam"] = {gender = 750, level = 150, storage = 10650, stoCatch = 666216, expCatch = 10000000},
["Mime"] = {gender = 500, level = 280, storage = 1122, stoCatch = 666122, expCatch = 10000000},
["Ancient Mime"] = {gender = 500, level = 150, storage = 1122, stoCatch = 666122, expCatch = 10000000},
["Reflector Wobbuffet"] = {gender = 500, level = 150, storage = 1202, stoCatch = 666353, expCatch = 10000000},
["Hell's Zard"] = {gender = 875, level = 350, storage = 100, stoCatch = 666006, expCatch = 10000000},
["Super Rhydon"] = {gender = 500, level = 350, storage = 1112, stoCatch = 666112, expCatch = 10000000},
["Storm Gengar"] = {gender = 500, level = 350, storage = 10940, stoCatch = 666245, expCatch = 10000000},
["Sauron"] = {gender = 875, level = 350, storage = 1003, stoCatch = 666003, expCatch = 10000000},
["Controler-Alakazam"] = {gender = 750, level = 350, storage = 1065, stoCatch = 666065, expCatch = 10000000},
["Wowofet"] = {gender = 500, level = 350, storage = 1202, stoCatch = 666353, expCatch = 10000000},
["Miseador-Weezing"] = {gender = 500, level = 350, storage = 1110, stoCatch = 666110, expCatch = 10000000},
["Rare Magikarp"] = {gender = 500, level = 350, storage = 11290, stoCatch = 666280, expCatch = 10000000},
["Demon"] = {gender = 875, level = 100, storage = 100, stoCatch = 666006, expCatch = 10000000},
}
