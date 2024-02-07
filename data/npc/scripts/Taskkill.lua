Taskstr = {}

local config = {
--------------------------------------  EASY  ------------------------------------------------
--Area Inicial
["Erick"] = { 
	pokemons = {
		["Caterpie"] = 20, 
		["Oddish"] = 10,
	}, 
	storage = 431300, 
	reward = {{2152, 2}, {12344, 10}, {12345, 15}},
	exp = 5000,
	doOnlyOne = true,
	},
["Rolland"] = {
	pokemons = {
		["Rattata"] = 20, 
		["Zubat"] = 10,
		}, 
	storage = 431301, 
	reward = {{2152, 2}, {12344, 10}, {12345, 15}},
	exp = 5000,
	doOnlyOne = true,
	},
["Pedro Pescador"] = {
	pokemons = {
		["Magikarp"] = 20, 
		["Krabby"] = 10,
		}, 
	storage = 431302, 
	reward = {{2152, 2}, {12344, 10}, {12345, 15}},
	exp = 5000,
	doOnlyOne = true,
	},
["Luciane"] = {
	pokemons = {
		["Tangela"] = 5, 
		["Bulbasaur"] = 8,
		}, 
	storage = 431303, 
	reward = {{2152, 3}, {12344, 15}, {12345, 20}},
	exp = 6000,
	doOnlyOne = true,
	},	
["Marco"] = {
	pokemons = {
		["Ekans"] = 15,
		["Geodude"] = 10, 
		}, 
	storage = 431304, 
	reward = {{2152, 3}, {12344, 15}, {12345, 20}},
	exp = 6000,
	doOnlyOne = true,
	},
["Ronaldinho"] = {
	pokemons = {
		["Diglett"] = 20,
		["Sandshrew"] = 10, 
		}, 
	storage = 431305, 
	reward = {{2152, 3}, {12344, 15}, {12345, 20}},
	exp = 6000,
	doOnlyOne = true,
	},	
--Area Inicial
["Flavia"] = {       --task 2--
	pokemons = {
		["Raichu"] = 150,
		["Elekid"] = 150,
		["Electabuzz"] = 100,
	}, 
	storage = 9659452, 
	reward = {{2152, 5}, {12344, 15}, {15644, 5}, {15644, 5}},
	exp = 24000,
	doOnlyOne = true,
	},
["Alex"] = {       --task 2--
	pokemons = {
		["Gloom"] = 45,
		["Weepinbell"] = 45,
	}, 
	storage = 431401, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 24000,
	doOnlyOne = true,
	},
["John"] = {      --task 3--
	pokemons = {
		["Magikarp"] = 100,
	},
	storage = 431402, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}}, 
	exp = 20000,
	doOnlyOne = true,
	},
["Peter"] = {       --task 4--
	pokemons = {
		["Horsea"] = 30,
		["Goldeen"] = 30,
		["Poliwag"] = 30,
	},
	storage = 431403, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}}, 
	exp = 25000,
	doOnlyOne = true,
	},
["Jeffrey"] = {    --task 5--
	pokemons = {
		["Sunkern"] = 60,
		["Sunflora"] = 30,
	},
	storage = 431404, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 25000,
	doOnlyOne = true,
	},
["Gary"] = {                                          --task 6--
	pokemons = {
		["Treecko"] = 60,
		["Bulbasaur"] = 30,
		["Grovyle"] = 15,
	},
	storage = 431405, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 25000,
	doOnlyOne = true,
	},
["Franklin"] = {                  --não add ainda
	pokemons = {
		["Paras"] = 60,
		["Parasect"] = 30,
	},
	storage = 431406, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 38000,
	doOnlyOne = true,
	},
["Niel"] = {               -- não add ainda
	pokemons = {
		["Hoothoot"] = 60,
		["Noctowl"] = 30,
	},
	storage = 431407, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 54000,
	doOnlyOne = true,
	},
["Joana"] = {                       --task 9--
	pokemons = {
		["Geodude"] = 30,
		["Machop"] = 30,
		["Graveler"] = 60,
		["Machoke"] = 60,
	},
	storage = 431408, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 60000,
	doOnlyOne = true,
	},
["Bruna"] = {                   -- não add ainda --
	pokemons = {
		["Gastly"] = 30,
		["Haunter"] = 60,
	},
	storage = 431409, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 34500,
	doOnlyOne = true,
	},
["Mary"] = {                   -- task 11--
	pokemons = {
		["Pidgeot"] = 100,
		["Fearow"] = 60,
		["Snorlax"] = 70,
	},
	storage = 431500, 
	reward = {{2152, 50}, {12344, 30}, {11453, 1}, {15644, 5}}, 
	exp = 54000,
	doOnlyOne = true,
	},
["Escobar"] = {        -- task 12--
	pokemons = {
		["Ekans"] = 20,
		["Arbok"] = 40,
		["Koffing"] = 20,
		["Weezing"] = 40,
	},
	storage = 431411, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 32000,
	doOnlyOne = true,
	},
["Vitoria"] = {       -- task 13--
	pokemons = {
		["Diglett"] = 30,
		["Sandshrew"] = 30,
		["Cubone"] = 30,
	},
	storage = 431412, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 13500,
	doOnlyOne = true,
	},
["Rebecca"] = {     -- task 14 --
	pokemons = {
		["Tangela"] = 60,
	},
	storage = 431413, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 39000,
	doOnlyOne = true,
	},
["Christian"] = {     -- tNão tem ainda --
	pokemons = {
		["Pidgey"] = 30,
		["Pidgeotto"] = 60,
	},
	storage = 431414, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 18000,
	doOnlyOne = true,
	},
["Christine"] = {       -- task 16 --
	pokemons = {
		["Squirtle"] = 30,
		["Wartortle"] = 60,
	},
	storage = 431415, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 34500,
	doOnlyOne = true,
	},
["Jeff"] = {        -- não add ainda--
	pokemons = {
		["Totodile"] = 30,
		["Croconaw"] = 60,
	},
	storage = 431416, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 34500,
	doOnlyOne = true,
	},
["Javier"] = {     -- Não tem ainda --
	pokemons = {
		["Charmander"] = 30,
		["Charmeleon"] = 60,
	},
	storage = 431417, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 34500,
	doOnlyOne = true,
	},
["Deborah"] = {  -- Não tem ainda --
	pokemons = {
		["Cyndaquil"] = 40,
		["Quilava"] = 70,
	},
	storage = 431418, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 34500,
	doOnlyOne = true,
	},
["Sarah"] = { -- task 20 --
	pokemons = {
		["Bulbasaur"] = 30,
		["Ivysaur"] = 60,
	},
	storage = 431419, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 34500,
	doOnlyOne = true,
	},
["Quinn"] = { --task 21--
	pokemons = {
		["Chikorita"] = 30,
		["Bayleef"] = 60,
	},
	storage = 431420, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 34500,
	doOnlyOne = true,
	},
["Ronald"] = { --task 22 nao coloquei ainda parei aq--
	pokemons = {
		["Seel"] = 30,
		["Dewgong"] = 60,
	},
	storage = 431421, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 64500,
	doOnlyOne = true,
	},
["Sylvester"] = {  -- task 23--
	pokemons = {
		["Shellder"] = 30,
		["Cloyster"] = 60,
	},
	storage = 431422, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 61500,
	doOnlyOne = true,
	},
["Kathleen"] = {  --task 24--
	pokemons = {
		["Venonat"] = 30,
		["Venomoth"] = 60,
	},
	storage = 431423, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 30000,
	doOnlyOne = true,
	},
["Betty"] = {    -- task 25 --
	pokemons = {
		["Beedrill"] = 45,
		["Butterfree"] = 45,
	},
	storage = 431424, 
	reward = {{2152, 5}, {12344, 15}, {15644, 1}},
	exp = 22950,
	doOnlyOne = true,
	},
--------------------------------------  MEDIUM  ----------------------------------------------
["Nancy"] = {                                                       
	pokemons = {
		["Vileplume"] = 75,
		["Victreebel"] = 75,
	},
	storage = 431425, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 105000,
	doOnlyOne = true,
	},
["Dorothy"] = {                                                       
	pokemons = {
		["Tauros"] = 50,
		["Farfetch'd"] = 100,
	},
	storage = 431426, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 87500,
	doOnlyOne = true,
	},
["Timothy"] = {                                                       
	pokemons = {
		["Bellossom"] = 75,
		["Primeape"] = 75,
	},
	storage = 431427, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 101250,
	doOnlyOne = true,
	},
["Carlos"] = {                                                       
	pokemons = {
		["Poliwhirl"] = 75,
		["Starmie"] = 75,
	},
	storage = 431428, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 67500,
	doOnlyOne = true,
	},
["Crystal"] = {                                                       
	pokemons = {
		["Seadra"] = 75,
		["Seaking"] = 75,
	},
	storage = 431429, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 52500,
	doOnlyOne = true,
	},
["Margaret"] = {                                                       
	pokemons = {
		["Clefairy"] = 75,
		["Jigglypuff"] = 75,
	},
	storage = 431430, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 75000,
	doOnlyOne = true,
	},
["Judith"] = {                                                       
	pokemons = {
		["Magby"] = 75,
		["Elekid"] = 75,
	},
	storage = 431431, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 165000,
	doOnlyOne = true,
	},
["Samuel"] = {                                                       
	pokemons = {
		["Flaaffy"] = 75,
		["Pikachu"] = 75,
	},
	storage = 431432, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 101250,
	doOnlyOne = true,
	},
["Susan"] = {                                                       
	pokemons = {
		["Magneton"] = 75,
		["Electrode"] = 75,
	},
	storage = 431433, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 82500,
	doOnlyOne = true,
	},
["Stephanie"] = {                                                       
	pokemons = {
		["Corsola"] = 75,
		["Qwilfish"] = 75,
	},
	storage = 431434, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 105000,
	doOnlyOne = true,
	},
["Petra"] = {                                                       
	pokemons = {
		["Kingler"] = 75,
		["Slowbro"] = 75,
	},
	storage = 431435, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 52500,
	doOnlyOne = true,
	},
["Gregory"] = {                                                       
	pokemons = {
		["Stantler"] = 75,
		["Quagsire"] = 75,
	},
	storage = 431436, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 112500,
	doOnlyOne = true,
	},
["Reid"] = {                                                       
	pokemons = {
		["Houndoom"] = 75,
		["Donphan"] = 75,
	},
	storage = 431437, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 120000,
	doOnlyOne = true,
	},
["Rachel"] = {                                                       
	pokemons = {
		["Hitmonchan"] = 50,
		["Hitmonlee"] = 50,
		["Hitmontop"] = 50,
	},
	storage = 431438, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 195000,
	doOnlyOne = true,
	},
["Shirley"] = {                                                       
	pokemons = {
		["Golduck"] = 75,
		["Azumarill"] = 75,
	},
	storage = 431439, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 112500,
	doOnlyOne = true,
	},
["Robert"] = {                                                       
	pokemons = {
		["Togetic"] = 75,
		["Ariados"] = 75,
	},
	storage = 431440, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 120000,
	doOnlyOne = true,
	},
["Sandra"] = {                                                       
	pokemons = {
		["Lanturn"] = 75,
		["Murkrow"] = 75,
	},
	storage = 431441, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 97500,
	doOnlyOne = true,
	},
["Stephen"] = {                                                       
	pokemons = {
		["Dragonair"] = 75,
		["Dratini"] = 75,
	},
	storage = 431442, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 67500,
	doOnlyOne = true,
	},
["Ethel"] = {                                                       
	pokemons = {
		["Marowak"] = 75,
		["Piloswine"] = 75,
	},
	storage = 431443, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 131250,
	doOnlyOne = true,
	},
["Oliver"] = {                                                       
	pokemons = {
		["Dugtrio"] = 75,
		["Sandslash"] = 75,
	},
	storage = 431444, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 116250,
	doOnlyOne = true,
	},
["Carolina"] = {                                                       
	pokemons = {
		["Nidoking"] = 75,
		["Nidoqueen"] = 75,
	},
	storage = 431445, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 97500,
	doOnlyOne = true,
	},
["Charlene"] = {                                                       
	pokemons = {
		["Persian"] = 80,
		["Abra"] = 70,
		["Drowzee"] = 50,
	},
	storage = 431446, 
	reward = {{2152, 30}, {12344, 30}, {15644, 4}},
	exp = 67500,
	doOnlyOne = true,
	},
["Peggy"] = {                                                       
	pokemons = {
		["Rapidash"] = 75,
		["Ninetales"] = 75,
	},
	storage = 431447, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 97500,
	doOnlyOne = true,
	},
["Cora"] = {                                                       
	pokemons = {
		["Raticate"] = 100,
		["Golbat"] = 100,
	},
	storage = 431448, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 50000,
	doOnlyOne = true,
	},
["Pat"] = {                                                       --AQUI é o -Task50 --                                                       
	pokemons = {
		["Rhyhorn"] = 50,
		["Onix"] = 100,
	},
	storage = 431449, 
	reward = {{2152, 10}, {12344, 30}, {15644, 2}},
	exp = 87500,
	doOnlyOne = true,
	},	
--------------------------------------  HARD  ------------------------------------------------
["Michael"] = {                                                       
	pokemons = {
		["Charizard"] = 300,
	},
	storage = 431450, 
	reward = {{2152, 50}, {12344, 40}, {15644, 8}},
	exp = 540000,
	doOnlyOne = true,
	},
["Amanda"] = {                                                       
	pokemons = {
		["Venusaur"] = 300,
		["Vileplume"] = 150,
		["Bellossom"] = 80,
	},
	storage = 431451, 
	reward = {{2160, 1}, {12344, 40}, {11441, 2}, {15644, 10}},
	exp = 540000,
	doOnlyOne = true,
	},
["Raymond"] = {                                                       
	pokemons = {
		["Blastoise"] = 150,
		["Wartortle"] = 60,
		["Squirtle"] = 50,
	},
	storage = 431452, 
	reward = {{2152, 50}, {12344, 40}, {15644, 8}},
	exp = 540000,
	doOnlyOne = true,
	},
["Jessica"] = {                                                       
	pokemons = {
		["Crobat"] = 300,
	},
	storage = 431453, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 450000,
	doOnlyOne = true,
	},
["Loren"] = {        --É Homem viu--                                               
	pokemons = {
		["Raichu"] = 150,
		["Elekid"] = 150,
		["Electabuzz"] = 250,
	},
	storage = 431454, 
	reward = {{2160, 1}, {12344, 40}, {11444, 2}, {15644, 10}},
	exp = 450000,
	doOnlyOne = true,
	},
["Deloris"] = {       --É mulher--                                                
	pokemons = {
		["Clefable"] = 300,
	},
	storage = 431455, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 450000,
	doOnlyOne = true,
	},
["Charles"] = {                                                       
	pokemons = {
		["Poliwrath"] = 150,
		["Politoed"] = 150,
	},
	storage = 431456, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 330000,
	doOnlyOne = true,
	},
["Dolores"] = {                                                       
	pokemons = {
		["Gengar"] = 300,
		["Haunter"] = 100,
		["Misdreavus"] = 150,
	},
	storage = 431457, 
	reward = {{2160, 2}, {11450, 2}, {15644, 15}},
	exp = 330000,
	doOnlyOne = true,
	},
["Clinton"] = {                                                       
	pokemons = {
		["Misdreavus"] = 300,
	},
	storage = 431458, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 390000,
	doOnlyOne = true,
	},
["Lena"] = {                                                       
	pokemons = {
		["Arcanine"] = 300,
	},
	storage = 431459, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 330000,
	doOnlyOne = true,
	},
["Todd"] = {                                                       
	pokemons = {
		["Machamp"] = 300,
	},
	storage = 431460, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 540000,
	doOnlyOne = true,
	},
["Heather"] = {    --Mulher tbm--                                                   
	pokemons = {
		["Alakazam"] = 300,
		["Hypno"] = 150,
		["Kadabra"] = 100,
	},
	storage = 431461, 
	reward = {{2152, 70}, {12344, 40}, {11452, 1}, {15644, 8}},
	exp = 330000,
	doOnlyOne = true,
	},
["Eduardo"] = {                                                       
	pokemons = {
		["Tentacruel"] = 300,
	},
	storage = 431462, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 330000,
	doOnlyOne = true,
	},
["Socorro"] = {                                                       
	pokemons = {
		["Muk"] = 300,
	},
	storage = 431463, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 330000,
	doOnlyOne = true,
	},
["Booker"] = {                                                       
	pokemons = {
		["Exeggutor"] = 300,
	},
	storage = 431464, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 330000,
	doOnlyOne = true,
	},
["Melissa"] = {                                                       
	pokemons = {
		["Golem"] = 150,
		["Rhydon"] = 150,
		["Onix"] = 100,
	},
	storage = 431465, 
	reward = {{2152, 30}, {12344, 40}, {11445, 1}, {15644, 4}},
	exp = 330000,
	doOnlyOne = true,
	},
["Columbus"] = {                                                       
	pokemons = {
		["Meganium"] = 300,
	},
	storage = 431466, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 330000,
	doOnlyOne = true,
	},
["Catherine"] = {                                                       
	pokemons = {
		["Typhlosion"] = 300,
	},
	storage = 431467, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 330000,
	doOnlyOne = true,
	},
["Peter"] = {                                                       
	pokemons = {
		["Feraligatr"] = 300,
	},
	storage = 431468, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 330000,
	doOnlyOne = true,
	},
["Silvia"] = {                                                       
	pokemons = {
		["Wigglytuff"] = 300,
	},
	storage = 431469, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 330000,
	doOnlyOne = true,
	},
["Ronnie"] = {                                                       
	pokemons = {
		["Ampharos"] = 300,
	},
	storage = 431470, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 270000,
	doOnlyOne = true,
	},
["Jennifer"] = {                                                       
	pokemons = {
		["Magcargo"] = 300,
	},
	storage = 431471, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 390000,
	doOnlyOne = true,
	},
["Enrique"] = {                                                       
	pokemons = {
		["Pupitar"] = 300,
	},
	storage = 431472, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 420000,
	doOnlyOne = true,
	},
["Jan"] = {              --Mulher tbm--                                         
	pokemons = {
		["Girafarig"] = 300,
	},
	storage = 431473, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 255000,
	doOnlyOne = true,
	},
["Philip"] = {                                                       
	pokemons = {
		["Pinsir"] = 300,
	},
	storage = 431474, 
	reward = {{2152, 15}, {12344, 40}, {15644, 4}},
	exp = 195000,
	doOnlyOne = true,
	},	
--------------------------------------  EXPERT  ----------------------------------------------
["Heidi"] = {                   --é mulher----                                    
	pokemons = {
		["Camerupt"] = 300,
		["Blaziken"] = 300,
	},
	storage = 431475, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 720000,
	doOnlyOne = true,
	},
["Hollis"] = {                                                       
	pokemons = {
		["Sceptile"] = 300,
		["Shiftry"] = 300,
	},
	storage = 431476, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 1650000,
	doOnlyOne = true,
	},
["Eva"] = {                                                       
	pokemons = {
		["Ludicolo"] = 300,
		["Swampert"] = 300,
	},
	storage = 431477, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 1650000,
	doOnlyOne = true,
	},
["Bradley"] = {                                                       
	pokemons = {
		["Swellow"] = 300,
		["Scyther"] = 300,
	},
	storage = 431478, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 1620000,
	doOnlyOne = true,
	},
["Samantha"] = {                                                       
	pokemons = {
		["Mawile"] = 300,
		["Skarmory"] = 300,
	},
	storage = 431479, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 1260000,
	doOnlyOne = true,
	},
["James"] = {                                                       
	pokemons = {
		["Manectric"] = 300,
		["Electabuzz"] = 300,
	},
	storage = 431480, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 1470000,
	doOnlyOne = true,
	},
["Kelly"] = {                                                       
	pokemons = {
		["Walrein"] = 300,
		["Glalie"] = 300,
	},
	storage = 431481, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 2160000,
	doOnlyOne = true,
	},
["Daniel"] = {                                                       
	pokemons = {
		["Banette"] = 300,
		["Dusclops"] = 300,
	},
	storage = 431482, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 780000,
	doOnlyOne = true,
	},
["Michelle"] = {                                                      
	pokemons = {
		["Zangoose"] = 300,
		["Seviper"] = 300,
	},
	storage = 431483, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 1620000,
	doOnlyOne = true,
	},
["Lynn"] = {                  --Homem também--                                      
	pokemons = {
		["Grumpig"] = 300,
		["Claydol"] = 300,
	},
	storage = 431484, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 2070000,
	doOnlyOne = true,
	},
["Janey"] = {            --mulher--                                           
	pokemons = {
		["Flygon"] = 300,
		["Dragonite"] = 300,
	},
	storage = 431485, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 1410000,
	doOnlyOne = true,
	},
["Micheal"] = {                                                       
	pokemons = {
		["Hariyama"] = 300,
		["Exploud"] = 300,
	},
	storage = 431486, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 1800000,
	doOnlyOne = true,
	},
["Leona"] = {                                                       
	pokemons = {
		["Breloom"] = 300,
		["Cacturn"] = 300,
	},
	storage = 431487, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 1770000,
	doOnlyOne = true,
	},
["Christopher"] = {                                                       
	pokemons = {
		["Crawdaunt"] = 300,
		["Lucario"] = 300,
	},
	storage = 431488, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 2055000,
	doOnlyOne = true,
	},
["Diane"] = {                                                       
	pokemons = {
		["Magmar"] = 300,
		["Gyarados"] = 300,
	},
	storage = 431489, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 1080000,
	doOnlyOne = true,
	},
["Dennis"] = {                                                       
	pokemons = {
		["Heracross"] = 300,
		["Mr. Mime"] = 300,
	},
	storage = 431490, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 735000,
	doOnlyOne = true,
	},
["Patricia"] = {                                                       
	pokemons = {
		["Kangaskhan"] = 300,
		["Miltank"] = 300,
	},
	storage = 431491, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 750000,
	doOnlyOne = true,
	},
["Milton"] = {                                                       
	pokemons = {
		["Snorlax"] = 300,
		["Ursaring"] = 300,
	},
	storage = 431492, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 750000,
	doOnlyOne = true,
	},
["Jeanette"] = {                                                       
	pokemons = {
		["Kingdra"] = 300,
		["Mantine"] = 300,
	},
	storage = 431493, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 780000,
	doOnlyOne = true,
	},
["Justin"] = {                                                       
	pokemons = {
		["Jynx"] = 300,
		["Sudowoodo"] = 300,
	},
	storage = 431494, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 720000,
	doOnlyOne = true,
	},
["Lavon"] = {        --mulher--                                               
	pokemons = {
		["Steelix"] = 300,
		["Tyranitar"] = 300,
	},
	storage = 431495, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 915000,
	doOnlyOne = true,
	},
["Homer"] = {                                                       
	pokemons = {
		["Magmortar"] = 150,
		["Electivire"] = 150,
	},
	storage = 431496, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 2250000,
	doOnlyOne = true,
	},
["Ann"] = {                                                       
	pokemons = {
		["Milotic"] = 150,
		["Metagross"] = 150,
	},
	storage = 431497, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 2250000,
	doOnlyOne = true,
	},
["Jason"] = {                                                       
	pokemons = {
		["Tangrowth"] = 150,
		["Rhyperior"] = 150,
	},
	storage = 431498, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 2250000,
	doOnlyOne = true,
	},
["Olga"] = {                                                       
	pokemons = {
		["Salamence"] = 100,
		["Dusknoir"] = 100,
		["Slaking"] = 100,
	},
	storage = 431499, 
	reward = {{2152, 17}, {12344, 60}, {15644, 5}},
	exp = 2250000,
	doOnlyOne = true,
	}	
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onThink() npcHandler:onThink() end

function onCreatureSay(cid, type1, msg)

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local cfg = config[getNpcName()]
	
	if msg:lower() == "hi" and getDistanceToCreature(cid) < 4 then
		if getPlayerStorageValue(cid, cfg.storage) == -1 then
			Taskstr[talkUser] = {}
			for a, b in pairs(cfg.pokemons) do
				table.insert(Taskstr[talkUser], b.." "..a.."s")
			end
			local KAKAMESSAGE = doConcatTable(Taskstr[talkUser], ", ", " e ")
			selfSay("Preciso de sua ajuda, você poderia eliminar "..KAKAMESSAGE.."?", cid)
			talkState[talkUser] = 1
		elseif getPlayerStorageValue(cid, cfg.storage) == 1 then
			selfSay("Não preciso mais da sua ajuda, obrigado!", cid)
		else
			local tab = string.explode(getPlayerStorageValue(cid, cfg.storage), "|")
			selfSay("Você já terminou a minha task?", cid)
			talkState[talkUser] = 3				
		end
		
	elseif talkState[talkUser] == 1 and (cfg.pokemons[doCorrectString(msg)] or isInArray({"yes", "sim"}, msg:lower())) then
		pName = doCorrectString(msg)
		selfSay("Você tem certeza que pode dar conta?", cid)
		talkState[talkUser] = 2
		
	elseif talkState[talkUser] == 2 then
		if isInArray({"yes", "sim"}, msg:lower()) then
		
			Taskstr[talkUser] = {}
			
			for a, b in pairs(cfg.pokemons) do
				table.insert(Taskstr[talkUser], a..","..b)
			end
			
			setPlayerStorageValue(cid, cfg.storage, getNpcName().."|"..table.concat(Taskstr[talkUser], "|"))
			selfSay("Ok, aguardo você!", cid)
			
		elseif isInArray({"no", "não", "nao"}, msg:lower()) then
		
			selfSay("Você quem sabe.", cid)
			talkState[talkUser] = 0	
		end
	elseif talkState[talkUser] == 3 then
		if isInArray({"yes", "sim"}, msg:lower()) then
			local tab = string.explode(getPlayerStorageValue(cid, cfg.storage), "|")
			if not tab[2] then
				doPlayerAddExperience(cid, cfg.exp * 2)
				doSendAnimatedText(getThingPos(cid), cfg.exp * 2, 215)
				
				for a, b in pairs(cfg.reward) do
				if isItemStackable(b[1], b[2]) and (getPlayerItemCount(cid, b[1], b[2]) > 0) then
					doPlayerAddItem(cid, b[1], b[2])
				else
					local item = doCreateItemEx(b[1], b[2])
					doPlayerAddItemEx(cid, item, true)
				end
				end
				
				if cfg.doOnlyOne then
					setPlayerStorageValue(cid, cfg.storage, 1)
				else
					setPlayerStorageValue(cid, cfg.storage, -1)
				end
						
				selfSay("Muito obrigado pela ajuda, até mais.", cid)
				talkState[talkUser] = 0
			else
				talkState[talkUser] = 0
				local str1 = {}
				local tab = string.explode(getPlayerStorageValue(cid, cfg.storage), "|")
				
				for i = 2, #tab do
					expe = tab[i]:explode(",")				
					table.insert(str1, expe[2].." "..expe[1]..(tonumber(expe[2]) > 1 and "s" or ""))
				end			

				selfSay("Está faltando você matar ".. doConcatTable(str1, ", ", " e ") .." desta espécie!", cid)
			end
			
		elseif isInArray({"no", "não", "nao"}, msg:lower()) then
			selfSay("Ok, então vá terminar de matá-los!", cid)
			talkState[talkUser] = 0
		elseif isInArray({"left", "leave", "desistir"}, msg:lower()) then
			setPlayerStorageValue(cid, cfg.storage, -1)	
			selfSay("Ok, pedirei ajuda a alguém mais corajoso!", cid)
			talkState[talkUser] = 0			
		end
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())