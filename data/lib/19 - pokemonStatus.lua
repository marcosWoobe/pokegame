-- offense = offense que ganha por level
-- level = level min pra usar o poke / offense base
-- defense = defense por level
-- agility = speed base dos pokes
-- specialattack = special attack que ganha por level
-- exp = exp que dá a cada level que tem (somada a exp base, no xml do poke)                 
-- vitality = vida que o poke ganha pra cada vitality que tem

pokes = {           --alterado v1.8 \/\/ toda a tabela, recebeu um novo 'atributo', wildLvl... 
["Mega Charizard Y"] = {offense = 25.2, defense = 23.4, specialattack = 32.7, vitality = 23.4, agility = 300, exp = 960, level = 80, wildLvl = 80, type = "fire", type2 = "flying"},
["Mega Charizard X"] = {offense = 31.5, defense = 29.25, specialattack = 27.8, vitality = 23.4, agility = 300, exp = 960, level = 80, wildLvl = 80, type = "fire", type2 = "dragon"},
["Mega Beedrill"] = {offense = 27, defense = 12, specialattack = 13.5, vitality = 13.5, agility = 300, exp = 712, level = 100, wildLvl = 100, type = "bug", type2 = "poison"},
["Mega Blaziken"] = {offense = 36, defense = 21, specialattack = 33, vitality = 24, agility = 300, exp = 956, level = 80, wildLvl = 80, type = "fire", type2 = "fighting"},
["Mega Houndoom"] = {offense = 27, defense = 15, specialattack = 33, vitality = 22.5, agility = 300, exp = 700, level = 100, wildLvl = 100, type = "dark", type2 = "fire"},
["Mega Pidgeot"] = {offense = 24, defense = 22.5, specialattack = 21, vitality = 24.9, agility = 350, exp = 864, level = 100, wildLvl = 100, type = "flying", type2 = "normal"},
["Mega Pinsir"] = {offense = 37.5, defense = 30, specialattack = 16.5, vitality = 13.5, agility = 300, exp = 700, level = 100, wildLvl = 100, type = "bug", type2 = "flying"},
["Mega Sceptile"] = {offense = 25.5, defense = 13.5, specialattack = 31.5, vitality = 21, agility = 300, exp = 956, level = 100, wildLvl = 100, type = "grass", type2 = "dragon"},
["Mega Scizor"] = {offense = 39, defense = 30, specialattack = 16.5, vitality = 21, agility = 310, exp = 700, level = 100, wildLvl = 100, type = "bug", type2 = "steel"},
["Mega Swampert"] = {offense = 33, defense = 27, specialattack = 25.5, vitality = 30, agility = 300, exp = 964, level = 100, wildLvl = 100, type = "water", type2 = "ground"},

--["Mega Charizard X"] = {offense = 37.8, defense = 35.1, specialattack = 49.05, vitality = 35.1, agility = 300, exp = 240, level = 80, wildLvl = 80, type = "fire", type2 = "flying"},

 
["Christmas Eevee"] = {offense = 11, defense = 10, specialattack = 9, vitality = 11, agility = 300, exp = 65, level = 20, wildLvl = 30, type = "normal", type2 = "no type"},
["Christmas Snorlax"] = {offense = 22, defense = 13, specialattack = 13, vitality = 32, agility = 200, exp = 189, level = 100, wildLvl = 100, type = "normal", type2 = "no type"},
["Christmas Meowth"] = {offense = 9, defense = 7, specialattack = 8, vitality = 8, agility = 300, exp = 58, level = 20, wildLvl = 30, type = "normal", type2 = "no type"},
["Christmas Pikachu"] = {offense = 11, defense = 8, specialattack = 10, vitality = 7, agility = 300, exp = 112, level = 50, wildLvl = 50, type = "electric", type2 = "no type"},

["Christmas Shiny Vaporeon"] = {offense = 19.5, defense = 18, specialattack = 33, vitality = 39, agility = 300, exp = 184, level = 60, wildLvl = 70, type = "water", type2 = "no type"},
["Christmas Shiny Jolteon"] = {offense = 19.5, defense = 18, specialattack = 33, vitality = 19.5, agility = 300, exp = 184, level = 60, wildLvl = 70, type = "electric", type2 = "no type"},
["Christmas Shiny Flareon"] = {offense = 39, defense = 18, specialattack = 28.5, vitality = 19.5, agility = 300, exp = 184, level = 60, wildLvl = 70, type = "fire", type2 = "no type"},
["Christmas Shiny Pinsir"] = {offense = 37.5, defense = 30, specialattack = 16.5, vitality = 19.5, agility = 300, exp = 175, level = 100, wildLvl = 60, type = "bug", type2 = "no type"},
["Christmas Shiny Tauros"] = {offense = 30, defense = 28.5, specialattack = 12, vitality = 22.5, agility = 300, exp = 172, level = 50, wildLvl = 60, type = "normal", type2 = "no type"},
["Christmas Shiny Raichu"] = {offense = 27, defense = 16.5, specialattack = 27, vitality = 16, agility = 350, exp = 218, level = 80, wildLvl = 90, type = "electric", type2 = "no type"},
["Christmas Shiny Arcanine"] = {offense = 33, defense = 24, specialattack = 30, vitality = 27, agility = 350, exp = 194, level = 100, wildLvl = 100, type = "fire", type2 = "no type"},
["Christmas Shiny Dragonair"] = {offense = 25.2, defense = 19.5, specialattack = 21, vitality = 18.3, agility = 300, exp = 147, level = 60, wildLvl = 70, type = "dragon", type2 = "no type"},
["Christmas Shiny Fearow"] = {offense = 27, defense = 19.5, specialattack = 18.3, vitality = 19.5, agility = 300, exp = 155, level = 50, wildLvl = 60, type = "flying", type2 = "normal"},
["Christmas Shiny Golem"] = {offense = 36, defense = 39, specialattack = 16.5, vitality = 24, agility = 300, exp = 223, level = 70, wildLvl = 80, type = "ground", type2 = "rock"},
["Christmas Shiny Hitmontop"] = {offense = 28.5, defense = 28.5, specialattack = 10.5, vitality = 15, agility = 200, exp = 159, level = 60, wildLvl = 70, type = "fighting", type2 = "no type"},
["Christmas Shiny Hypno"] = {offense = 21.9, defense = 21, specialattack = 21.9, vitality = 25.5, agility = 300, exp = 169, level = 50, wildLvl = 60, type = "psychic", type2 = "no type"},
["Christmas Shiny Mr. Mime"] = {offense = 13.5, defense = 19.5, specialattack = 30, vitality = 12, agility = 300, exp = 161, level = 70, wildLvl = 70, type = "psychic", type2 = "no type"},
["Christmas Shiny Nidoking"] = {offense = 30.6, defense = 23.1, specialattack = 25.5, vitality = 24.3, agility = 300, exp = 227, level = 70, wildLvl = 80, type = "poison", type2 = "ground"},
["Christmas Shiny Rhydon"] = {offense = 39, defense = 36, specialattack = 13.5, vitality = 31.5, agility = 300, exp = 170, level = 80, wildLvl = 90, type = "ground", type2 = "rock"},
["Christmas Shiny Tentacruel"] = {offense = 21, defense = 19.5, specialattack = 24, vitality = 24, agility = 300, exp = 180, level = 80, wildLvl = 90, type = "water", type2 = "poison"},
["Christmas Shiny Vileplume"] = {offense = 24, defense = 25.5, specialattack = 33, vitality = 22.5, agility = 300, exp = 221, level = 50, wildLvl = 60, type = "grass", type2 = "poison"},

["Torrent"] = {offense = 20.26, defense = 20.3, specialattack = 20.3, vitality = 100.4, agility = 0, exp = 0, level = 500, wildLvl = 500, type = "psychic", type2 = "no type"},
 
------------------------------------------------------------------Statos Pokemon Kanto------------------------------------------------------------------
["Baby Bulbasaur"] = {offense = 3.27, defense = 3.27, specialattack = 3.34, vitality = 3, agility = 300, exp = 64, level = 10, wildLvl = 30, type = "grass", type2 = "poison"},
["Baby Charmander"] = {offense = 3.47, defense = 2.87, specialattack = 4, vitality = 2.6, agility = 300, exp = 62, level = 10, wildLvl = 30, type = "fire", type2 = "no type"},
["Baby Squirtle"] = {offense = 3.2, defense = 4.34, specialattack = 3.34, vitality = 2.94, agility = 300, exp = 66, level = 10, wildLvl = 30, type = "water", type2 = "no type"},


["Bulbasaur"] = {offense = 4.9, defense = 4.9, specialattack = 6.5, vitality = 4.5, agility = 300, exp = 64, level = 20, wildLvl = 30, type = "grass", type2 = "poison"},

["Ivysaur"] = {offense = 6.2, defense = 6.3, specialattack = 8, vitality = 6, agility = 300, exp = 142, level = 40, wildLvl = 50, type = "grass", type2 = "poison"},

["Venusaur"] = {offense = 8.2, defense = 8.3, specialattack = 10, vitality = 8, agility = 300, exp = 236, level = 80, wildLvl = 90, type = "grass", type2 = "poison"},

["Charmander"] = {offense = 5.2, defense = 4.3, specialattack = 6, vitality = 3.9, agility = 300, exp = 62, level = 20, wildLvl = 30, type = "fire", type2 = "no type"},

["Charmeleon"] = {offense = 6.4, defense = 5.8, specialattack = 8, vitality = 5.8, agility = 300, exp = 142, level = 40, wildLvl = 50, type = "fire", type2 = "no type"},

["Charizard"] = {offense = 8.4, defense = 7.8, specialattack = 10.9, vitality = 7.8, agility = 300, exp = 240, level = 85, wildLvl = 90, type = "fire", type2 = "flying"},

["Squirtle"] = {offense = 4.8, defense = 6.5, specialattack = 5, vitality = 4.4, agility = 300, exp = 63, level = 20, wildLvl = 30, type = "water", type2 = "no type"},

["Wartortle"] = {offense = 6.3, defense = 8, specialattack = 6.5, vitality = 5.9, agility = 300, exp = 142, level = 40, wildLvl = 50, type = "water", type2 = "no type"},

["Blastoise"] = {offense = 8.3, defense = 10, specialattack = 8.5, vitality = 7.9, agility = 300, exp = 239, level = 80, wildLvl = 90, type = "water", type2 = "no type"},

["Caterpie"] = {offense = 3, defense = 3.5, specialattack = 2, vitality = 4.5, agility = 300, exp = 39, level = 7, wildLvl = 10, type = "bug", type2 = "no type"},

["Metapod"] = {offense = 2, defense = 5.5, specialattack = 2.5, vitality = 5, agility = 300, exp = 72, level = 10, wildLvl = 20, type = "bug", type2 = "no type"},

["Butterfree"] = {offense = 4.5, defense = 5, specialattack = 9, vitality = 6, agility = 300, exp = 178, level = 30, wildLvl = 40, type = "bug", type2 = "flying"},

["Weedle"] = {offense = 3.5, defense = 3, specialattack = 2, vitality = 4, agility = 300, exp = 39, level = 7, wildLvl = 10, type = "bug", type2 = "poison"},

["Kakuna"] = {offense = 2.5, defense = 5, specialattack = 2.5, vitality = 4.5, agility = 300, exp = 72, level = 10, wildLvl = 20, type = "bug", type2 = "poison"},

["Beedrill"] = {offense = 9, defense = 4, specialattack = 4.5, vitality = 4.5, agility = 300, exp = 178, level = 30, wildLvl = 40, type = "bug", type2 = "poison"},

["Pidgey"] = {offense = 4.5, defense = 4, specialattack = 3.5, vitality = 4, agility = 300, exp = 50, level = 10, wildLvl = 10, type = "flying", type2 = "normal"},

["Pidgeotto"] = {offense = 6, defense = 5.5, specialattack = 5, vitality = 6.3, agility = 300, exp = 122, level = 20, wildLvl = 30, type = "flying", type2 = "normal"},

["Pidgeot"] = {offense = 8, defense = 7.5, specialattack = 7, vitality = 8.3, agility = 350, exp = 216, level = 80, wildLvl = 90, type = "flying", type2 = "normal"},

["Rattata"] = {offense = 5.6, defense = 3.5, specialattack = 2.5, vitality = 3, agility = 300, exp = 51, level = 7, wildLvl = 10, type = "normal", type2 = "no type"},

["Raticate"] = {offense = 8.1, defense = 6, specialattack = 5, vitality = 5.5, agility = 300, exp = 145, level = 30, wildLvl = 40, type = "normal", type2 = "no type"},

["Spearow"] = {offense = 6, defense = 3, specialattack = 3.1, vitality = 4, agility = 300, exp = 52, level = 10, wildLvl = 20, type = "flying", type2 = "normal"},

["Fearow"] = {offense = 9, defense = 6.5, specialattack = 6.1, vitality = 6.5, agility = 300, exp = 155, level = 50, wildLvl = 60, type = "flying", type2 = "normal"},

["Ekans"] = {offense = 6, defense = 4.4, specialattack = 4, vitality = 3.5, agility = 300, exp = 58, level = 10, wildLvl = 20, type = "poison", type2 = "no type"},

["Arbok"] = {offense = 8.5, defense = 6.9, specialattack = 6.5, vitality = 6, agility = 300, exp = 157, level = 40, wildLvl = 50, type = "poison", type2 = "no type"},

["Pikachu"] = {offense = 5.5, defense = 4, specialattack = 5, vitality = 3.5, agility = 300, exp = 112, level = 20, wildLvl = 50, type = "electric", type2 = "no type"},

["Baby Pikachu"] = {offense = 4.1, defense = 3, specialattack = 3.7, vitality = 2.6, agility = 300, exp = 112, level = 10, wildLvl = 50, type = "electric", type2 = "no type"},

["Raichu"] = {offense = 9, defense = 5.5, specialattack = 9, vitality = 6, agility = 350, exp = 150, level = 80, wildLvl = 90, type = "electric", type2 = "no type"},

["Sandshrew"] = {offense = 7.5, defense = 8.5, specialattack = 2, vitality = 5, agility = 300, exp = 60, level = 20, wildLvl = 30, type = "ground", type2 = "no type"},

["Sandslash"] = {offense = 10, defense = 11, specialattack = 4.5, vitality = 7.5, agility = 300, exp = 158, level = 70, wildLvl = 80, type = "ground", type2 = "no type"},

["Nidoran Female"] = {offense = 4.7, defense = 5.2, specialattack = 4, vitality = 5.5, agility = 300, exp = 55, level = 10, wildLvl = 20, type = "poison", type2 = "no type"},

["Nidorina"] = {offense = 6.2, defense = 6.7, specialattack = 5.5, vitality = 7, agility = 300, exp = 128, level = 30, wildLvl = 40, type = "poison", type2 = "no type"},

["Nidoqueen"] = {offense = 9.2, defense = 8.7, specialattack = 7.5, vitality = 9, agility = 300, exp = 227, level = 70, wildLvl = 80, type = "poison", type2 = "ground"},

["Nidoran Male"] = {offense = 5.7, defense = 4, specialattack = 4, vitality = 4.6, agility = 300, exp = 55, level = 10, wildLvl = 20, type = "poison", type2 = "no type"},

["Nidorino"] = {offense = 7.2, defense = 5.7, specialattack = 5.5, vitality = 6.1, agility = 300, exp = 128, level = 30, wildLvl = 40, type = "poison", type2 = "no type"},

["Nidoking"] = {offense = 10.2, defense = 7.7, specialattack = 8.5, vitality = 8.1, agility = 300, exp = 227, level = 70, wildLvl = 80, type = "poison", type2 = "ground"},

["Clefairy"] = {offense = 4.5, defense = 4.8, specialattack = 6, vitality = 7, agility = 300, exp = 113, level = 40, wildLvl = 50, type = "normal", type2 = "no type"},

["Clefable"] = {offense = 7, defense = 7.3, specialattack = 9.5, vitality = 9.5, agility = 300, exp = 217, level = 70, wildLvl = 80, type = "normal", type2 = "no type"},

["Vulpix"] = {offense = 4.1, defense = 4, specialattack = 5, vitality = 3.8, agility = 300, exp = 60, level = 20, wildLvl = 30, type = "fire", type2 = "no type"},

["Ninetales"] = {offense = 7.6, defense = 7.5, specialattack = 8.1, vitality = 7.3, agility = 300, exp = 177, level = 80, wildLvl = 80, type = "fire", type2 = "no type"},

["Jigglypuff"] = {offense = 4.5, defense = 2, specialattack = 4.5, vitality = 11.5, agility = 300, exp = 95, level = 40, wildLvl = 50, type = "normal", type2 = "no type"},

["Wigglytuff"] = {offense = 7, defense = 4.5, specialattack = 8.5, vitality = 14, agility = 300, exp = 196, level = 70, wildLvl = 80, type = "normal", type2 = "no type"},

["Zubat"] = {offense = 4.5, defense = 3.5, specialattack = 3, vitality = 4, agility = 300, exp = 49, level = 10, wildLvl = 20, type = "poison", type2 = "flying"},

["Golbat"] = {offense = 8, defense = 7, specialattack = 6.5, vitality = 7.5, agility = 300, exp = 159, level = 40, wildLvl = 50, type = "poison", type2 = "flying"},

-- -30% Mixlort 
-- ["Oddish"] = {offense = 3.5, defense = 3.8, specialattack = 5.2, vitality = 3.1, agility = 300, exp = 64, level = 7, wildLvl = 10, type = "grass", type2 = "poison"},

-- ["Gloom"] = {offense = 4.5, defense = 4.9, specialattack = 5.9, vitality = 4.2, agility = 300, exp = 138, level = 30, wildLvl = 40, type = "grass", type2 = "poison"},

-- ["Vileplume"] = {offense = 5.6, defense = 5.9, specialattack = 7.7, vitality = 5.2, agility = 300, exp = 221, level = 50, wildLvl = 60, type = "grass", type2 = "poison"},
-- -30% Mixlort 

["Oddish"] = {offense = 5, defense = 5.5, specialattack = 7.5, vitality = 4.5, agility = 300, exp = 64, level = 7, wildLvl = 10, type = "grass", type2 = "poison"},

["Gloom"] = {offense = 6.5, defense = 7, specialattack = 8.5, vitality = 4.8, agility = 300, exp = 138, level = 30, wildLvl = 40, type = "grass", type2 = "poison"},

["Vileplume"] = {offense = 8, defense = 8.5, specialattack = 9, vitality = 7.5, agility = 300, exp = 221, level = 50, wildLvl = 60, type = "grass", type2 = "poison"},



["Paras"] = {offense = 7, defense = 5.5, specialattack = 4.5, vitality = 3.5, agility = 300, exp = 57, level = 7, wildLvl = 10, type = "bug", type2 = "grass"},

["Parasect"] = {offense = 9.5, defense = 8, specialattack = 6, vitality = 6, agility = 300, exp = 142, level = 50, wildLvl = 60, type = "bug", type2 = "grass"},

["Venonat"] = {offense = 5.5, defense = 5, specialattack = 4, vitality = 6, agility = 300, exp = 61, level = 20, wildLvl = 30, type = "bug", type2 = "poison"},

["Venomoth"] = {offense = 6.5, defense = 6, specialattack = 9, vitality = 7, agility = 300, exp = 158, level = 50, wildLvl = 60, type = "bug", type2 = "poison"},

["Diglett"] = {offense = 55, defense = 2.5, specialattack = 3.5, vitality = 1, agility = 300, exp = 53, level = 10, wildLvl = 20, type = "ground", type2 = "no type"},

["Dugtrio"] = {offense = 8, defense = 5, specialattack = 5, vitality = 3.5, agility = 300, exp = 149, level = 40, wildLvl = 50, type = "ground", type2 = "no type"},

["Meowth"] = {offense = 4.5, defense = 3.5, specialattack = 4, vitality = 4, agility = 300, exp = 58, level = 20, wildLvl = 30, type = "normal", type2 = "no type"},

["Persian"] = {offense = 7, defense = 6, specialattack = 6.5, vitality = 6.5, agility = 300, exp = 154, level = 50, wildLvl = 60, type = "normal", type2 = "no type"},

["Psyduck"] = {offense = 5.2, defense = 4.8, specialattack = 6.5, vitality = 5, agility = 300, exp = 64, level = 20, wildLvl = 30, type = "water", type2 = "no type"},

["Golduck"] = {offense = 8.2, defense = 7.8, specialattack = 9.5, vitality = 8, agility = 300, exp = 175, level = 70, wildLvl = 80, type = "water", type2 = "no type"},

["Mankey"] = {offense = 8, defense = 3.5, specialattack = 3.5, vitality = 4, agility = 300, exp = 61, level = 10, wildLvl = 20, type = "fight", type2 = "no type"},

["Primeape"] = {offense = 10.5, defense = 6, specialattack = 6, vitality = 6.5, agility = 300, exp = 159, level = 50, wildLvl = 60, type = "fight", type2 = "no type"},

["Growlithe"] = {offense = 7, defense = 4.5, specialattack = 7, vitality = 5.5, agility = 300, exp = 70, level = 30, wildLvl = 40, type = "fire", type2 = "no type"},

["Arcanine"] = {offense = 11, defense = 8, specialattack = 10, vitality = 9, agility = 350, exp = 194, level = 100, wildLvl = 100, type = "fire", type2 = "no type"},

["Poliwag"] = {offense = 5, defense = 4, specialattack = 4, vitality = 4, agility = 300, exp = 60, level = 7, wildLvl = 10, type = "water", type2 = "no type"},

["Poliwhirl"] = {offense = 6.5, defense = 6.5, specialattack = 5, vitality = 6.5, agility = 300, exp = 135, level = 30, wildLvl = 40, type = "water", type2 = "no type"},

["Poliwrath"] = {offense = 9.5, defense = 9.5, specialattack = 7, vitality = 9, agility = 300, exp = 230, level = 80, wildLvl = 80, type = "water", type2 = "fight"},

["Abra"] = {offense = 2, defense = 1.5, specialattack = 10.5, vitality = 2.5, agility = 300, exp = 62, level = 10, wildLvl = 20, type = "psychic", type2 = "no type"},

["Kadabra"] = {offense = 3.5, defense = 3, specialattack = 12, vitality = 4, agility = 300, exp = 140, level = 40, wildLvl = 50, type = "psychic", type2 = "no type"},

["Alakazam"] = {offense = 5, defense = 4.5, specialattack = 13.5, vitality = 5.5, agility = 300, exp = 225, level = 80, wildLvl = 90, type = "psychic", type2 = "no type"},

["Machop"] = {offense = 8, defense = 5, specialattack = 3.5, vitality = 7, agility = 300, exp = 61, level = 20, wildLvl = 30, type = "fight", type2 = "no type"},

["Machoke"] = {offense = 10, defense = 7, specialattack = 5, vitality = 8, agility = 300, exp = 142, level = 40, wildLvl = 50, type = "fight", type2 = "no type"},

["Machamp"] = {offense = 13, defense = 8, specialattack = 6.5, vitality = 9, agility = 300, exp = 227, level = 80, wildLvl = 90, type = "fight", type2 = "no type"},

["Bellsprout"] = {offense = 7.5, defense = 3.5, specialattack = 7, vitality = 5, agility = 300, exp = 60, level = 10, wildLvl = 10, type = "grass", type2 = "poison"},

["Weepinbell"] = {offense = 9, defense = 5, specialattack = 8.5, vitality = 6.5, agility = 300, exp = 137, level = 30, wildLvl = 40, type = "grass", type2 = "poison"},

["Victreebel"] = {offense = 10.5, defense = 6.5, specialattack = 10, vitality = 8, agility = 300, exp = 221, level = 70, wildLvl = 60, type = "grass", type2 = "poison"},

["Tentacool"] = {offense = 4, defense = 3.5, specialattack = 5, vitality = 4, agility = 300, exp = 67, level = 10, wildLvl = 20, type = "water", type2 = "poison"},

["Tentacruel"] = {offense = 7, defense = 6.5, specialattack = 8, vitality = 8, agility = 300, exp = 180, level = 80, wildLvl = 90, type = "water", type2 = "poison"},

["Geodude"] = {offense = 8, defense = 10, specialattack = 3, vitality = 4, agility = 300, exp = 60, level = 10, wildLvl = 20, type = "ground", type2 = "rock"},

["Graveler"] = {offense = 9.5, defense = 11.5, specialattack = 4.5, vitality = 5.5, agility = 300, exp = 137, level = 40, wildLvl = 50, type = "ground", type2 = "rock"},

["Golem"] = {offense = 12, defense = 13, specialattack = 5.5, vitality = 8, agility = 300, exp = 223, level = 70, wildLvl = 80, type = "ground", type2 = "rock"},

["Ponyta"] = {offense = 8.5, defense = 5.5, specialattack = 6.5, vitality = 5, agility = 300, exp = 82, level = 20, wildLvl = 30, type = "fire", type2 = "no type"},

["Rapidash"] = {offense = 10, defense = 7, specialattack = 8, vitality = 6.5, agility = 300, exp = 175, level = 100, wildLvl = 80, type = "fire", type2 = "no type"},

["Slowpoke"] = {offense = 6.5, defense = 6.5, specialattack = 4, vitality = 9, agility = 300, exp = 63, level = 10, wildLvl = 20, type = "water", type2 = "psychic"},

["Slowbro"] = {offense = 7.5, defense = 11, specialattack = 10, vitality = 9.5, agility = 300, exp = 172, level = 50, wildLvl = 60, type = "water", type2 = "psychic"},

["Magnemite"] = {offense = 3.5, defense = 7, specialattack = 9.5, vitality = 2.5, agility = 300, exp = 65, level = 10, wildLvl = 20, type = "electric", type2 = "steel"},

["Magneton"] = {offense = 6, defense = 9.5, specialattack = 12, vitality = 5, agility = 300, exp = 163, level = 80, wildLvl = 90, type = "electric", type2 = "steel"},

["Farfetch'd"] = {offense = 6.5, defense = 5.5, specialattack = 5.8, vitality = 5.2, agility = 300, exp = 132, level = 45, wildLvl = 60, type = "flying", type2 = "normal"},

["Doduo"] = {offense = 8.5, defense = 4.5, specialattack = 3.5, vitality = 3.5, agility = 300, exp = 62, level = 10, wildLvl = 20, type = "flying", type2 = "normal"},

["Dodrio"] = {offense = 11, defense = 7, specialattack = 6, vitality = 6, agility = 300, exp = 165, level = 50, wildLvl = 60, type = "flying", type2 = "normal"},

["Seel"] = {offense = 4.5, defense = 5.5, specialattack = 4.5, vitality = 6.5, agility = 300, exp = 65, level = 20, wildLvl = 30, type = "water", type2 = "no type"},

["Dewgong"] = {offense = 7, defense = 8, specialattack = 7, vitality = 9, agility = 300, exp = 166, level = 60, wildLvl = 80, type = "water", type2 = "ice"},

["Grimer"] = {offense = 8, defense = 5, specialattack = 4, vitality = 8, agility = 300, exp = 65, level = 10, wildLvl = 20, type = "poison", type2 = "no type"},

["Muk"] = {offense = 10.5, defense = 7.5, specialattack = 6.5, vitality = 10.5, agility = 300, exp = 175, level = 80, wildLvl = 90, type = "poison", type2 = "no type"},

["Shellder"] = {offense = 6.5, defense = 10, specialattack = 4.5, vitality = 3, agility = 300, exp = 61, level = 10, wildLvl = 20, type = "water", type2 = "no type"},

["Cloyster"] = {offense = 9.5, defense = 18, specialattack = 8.5, vitality = 5, agility = 300, exp = 184, level = 60, wildLvl = 70, type = "water", type2 = "ice"},

["Gastly"] = {offense = 3.5, defense = 3, specialattack = 10, vitality = 3, agility = 300, exp = 62, level = 20, wildLvl = 30, type = "ghost", type2 = "poison"},

["Haunter"] = {offense = 5, defense = 4.5, specialattack = 11.5, vitality = 4.5, agility = 300, exp = 142, level = 40, wildLvl = 50, type = "ghost", type2 = "poison"},

["Gengar"] = {offense = 6.5, defense = 6, specialattack = 13.0, vitality = 6, agility = 300, exp = 225, level = 80, wildLvl = 90, type = "ghost", type2 = "poison"},

["Onix"] = {offense = 4.5, defense = 16, specialattack = 3, vitality = 3.5, agility = 300, exp = 77, level = 50, wildLvl = 60, type = "rock", type2 = "ground"},

["Drowzee"] = {offense = 4.8, defense = 4.5, specialattack = 4.3, vitality = 6, agility = 300, exp = 66, level = 30, wildLvl = 40, type = "psychic", type2 = "no type"},

["Hypno"] = {offense = 7.3, defense = 7, specialattack = 7.3, vitality = 8.5, agility = 300, exp = 169, level = 50, wildLvl = 60, type = "psychic", type2 = "no type"},

["Krabby"] = {offense = 10.5, defense = 9, specialattack = 2.5, vitality = 3, agility = 300, exp = 65, level = 10, wildLvl = 20, type = "water", type2 = "no type"},

["Kingler"] = {offense = 13, defense = 11.5, specialattack = 5, vitality = 5.5, agility = 300, exp = 166, level = 40, wildLvl = 50, type = "water", type2 = "no type"},

["Voltorb"] = {offense = 3, defense = 5, specialattack = 5.5, vitality = 4, agility = 300, exp = 66, level = 10, wildLvl = 20, type = "electric", type2 = "no type"},

["Electrode"] = {offense = 5, defense = 7, specialattack = 8, vitality = 6, agility = 300, exp = 172, level = 35, wildLvl = 50, type = "electric", type2 = "no type"},

["Exeggcute"] = {offense = 4, defense = 8, specialattack = 6, vitality = 6, agility = 300, exp = 65, level = 10, wildLvl = 20, type = "psychic", type2 = "grass"},

["Exeggutor"] = {offense = 9.5, defense = 8.5, specialattack = 12.5, vitality = 9.5, agility = 300, exp = 186, level = 100, wildLvl = 90, type = "psychic", type2 = "grass"},

["Cubone"] = {offense = 5, defense = 9.5, specialattack = 4, vitality = 5, agility = 300, exp = 64, level = 20, wildLvl = 30, type = "ground", type2 = "no type"},

["Marowak"] = {offense = 6.4, defense = 11, specialattack = 4, vitality = 6, agility = 300, exp = 149, level = 50, wildLvl = 60, type = "ground", type2 = "no type"},

["Hitmonlee"] = {offense = 12, defense = 5.3, specialattack = 3.5, vitality = 5, agility = 300, exp = 159, level = 60, wildLvl = 70, type = "fight", type2 = "no type"},

["Hitmonchan"] = {offense = 10.5, defense = 7.9, specialattack = 3.5, vitality = 5, agility = 300, exp = 159, level = 60, wildLvl = 70, type = "fight", type2 = "no type"},

["Lickitung"] = {offense = 5.5, defense = 7.5, specialattack = 6, vitality = 9, agility = 300, exp = 77, level = 60, wildLvl = 70, type = "normal", type2 = "no type"},

["Koffing"] = {offense = 6.5, defense = 6.3, specialattack = 6, vitality = 4, agility = 300, exp = 68, level = 10, wildLvl = 20, type = "poison", type2 = "no type"},

["Weezing"] = {offense = 9, defense = 12, specialattack = 8.5, vitality = 6.5, agility = 300, exp = 172, level = 50, wildLvl = 60, type = "poison", type2 = "no type"},

["Rhyhorn"] = {offense = 8.5, defense = 9.5, specialattack = 3, vitality = 8, agility = 300, exp = 69, level = 30, wildLvl = 40, type = "ground", type2 = "rock"},

["Rhydon"] = {offense = 13, defense = 12, specialattack = 4.5, vitality = 10.5, agility = 300, exp = 170, level = 80, wildLvl = 90, type = "ground", type2 = "rock"},

["Chansey"] = {offense = 5, defense = 5, specialattack = 3.5, vitality = 25, agility = 300, exp = 395, level = 60, wildLvl = 70, type = "normal", type2 = "no type"},

["Tangela"] = {offense = 5.5, defense = 11.5, specialattack = 10, vitality = 6.5, agility = 300, exp = 87, level = 50, wildLvl = 60, type = "grass", type2 = "no type"},

["Kangaskhan"] = {offense = 9.5, defense = 8, specialattack = 4, vitality = 10.5, agility = 300, exp = 172, level = 80, wildLvl = 90, type = "normal", type2 = "no type"},

["Horsea"] = {offense = 4, defense = 7, specialattack = 7, vitality = 3, agility = 300, exp = 59, level = 10, wildLvl = 20, type = "water", type2 = "no type"},

["Seadra"] = {offense = 6.5, defense = 9.5, specialattack = 9.5, vitality = 5.5, agility = 300, exp = 154, level = 40, wildLvl = 50, type = "water", type2 = "no type"},

["Goldeen"] = {offense = 6.7, defense = 6, specialattack = 3.5, vitality = 4.5, agility = 300, exp = 64, level = 10, wildLvl = 20, type = "water", type2 = "no type"},

["Seaking"] = {offense = 9.2, defense = 6.5, specialattack = 6.5, vitality = 8, agility = 300, exp = 158, level = 40, wildLvl = 50, type = "water", type2 = "no type"},

["Staryu"] = {offense = 4.5, defense = 5.5, specialattack = 7, vitality = 3, agility = 300, exp = 68, level = 20, wildLvl = 30, type = "water", type2 = "no type"},

["Starmie"] = {offense = 7.5, defense = 8.5, specialattack = 10, vitality = 6, agility = 350, exp = 182, level = 80, wildLvl = 90, type = "water", type2 = "psychic"},

["Mr. Mime"] = {offense = 4.5, defense = 6.5, specialattack = 10, vitality = 4, agility = 300, exp = 161, level = 70, wildLvl = 70, type = "psychic", type2 = "no type"},

["Scyther"] = {offense = 11, defense = 8, specialattack = 5.5, vitality = 7, agility = 350, exp = 100, level = 100, wildLvl = 90, type = "bug", type2 = "flying"},

["Jynx"] = {offense = 5, defense = 3.5, specialattack = 11.5, vitality = 6.5, agility = 300, exp = 159, level = 80, wildLvl = 90, type = "psychic", type2 = "ice"},

["Electabuzz"] = {offense = 8.3, defense = 5.7, specialattack = 9.5, vitality = 6.5, agility = 300, exp = 120, level = 100, wildLvl = 100, type = "electric", type2 = "no type"},

["Magmar"] = {offense = 9.5, defense = 5.7, specialattack = 10, vitality = 6.5, agility = 300, exp = 173, level = 100, wildLvl = 100, type = "fire", type2 = "no type"},

["Pinsir"] = {offense = 12.5, defense = 10, specialattack = 5.5, vitality = 6.5, agility = 300, exp = 175, level = 100, wildLvl = 60, type = "bug", type2 = "no type"},

["Tauros"] = {offense = 10, defense = 9.5, specialattack = 4, vitality = 7.5, agility = 300, exp = 172, level = 50, wildLvl = 60, type = "normal", type2 = "no type"},

["Magikarp"] = {offense = 1, defense = 5.5, specialattack = 1.5, vitality = 2, agility = 300, exp = 20, level = 7, wildLvl = 10, type = "water", type2 = "no type"},

["Gyarados"] = {offense = 12.5, defense = 7.9, specialattack = 6, vitality = 9.5, agility = 300, exp = 189, level = 100, wildLvl = 100, type = "water", type2 = "flying"},

["Lapras"] = {offense = 8.5, defense = 8, specialattack = 8.5, vitality = 13, agility = 300, exp = 187, level = 100, wildLvl = 90, type = "water", type2 = "ice"},

["Ditto"] = {offense = 4.8, defense = 4.8, specialattack = 4.8, vitality = 4.8, agility = 180, exp = 101, level = 10, wildLvl = 50, type = "normal", type2 = "no type"},

["Eevee"] = {offense = 5.5, defense = 5, specialattack = 4.5, vitality = 5.5, agility = 300, exp = 65, level = 20, wildLvl = 30, type = "normal", type2 = "no type"},

["Vaporeon"] = {offense = 6.5, defense = 6, specialattack = 11, vitality = 13, agility = 300, exp = 184, level = 60, wildLvl = 70, type = "water", type2 = "no type"},

["Jolteon"] = {offense = 6.5, defense = 6, specialattack = 11, vitality = 6.5, agility = 300, exp = 184, level = 60, wildLvl = 70, type = "electric", type2 = "no type"},

["Flareon"] = {offense = 13, defense = 6, specialattack = 9.5, vitality = 6.5, agility = 300, exp = 184, level = 60, wildLvl = 70, type = "fire", type2 = "no type"},

["Porygon"] = {offense = 6, defense = 7, specialattack = 8.5, vitality = 6.5, agility = 300, exp = 79, level = 40, wildLvl = 50, type = "normal", type2 = "no type"},

["Omanyte"] = {offense = 4, defense = 10, specialattack = 9, vitality = 3.5, agility = 300, exp = 71, level = 20, wildLvl = 30, type = "rock", type2 = "water"},

["Omastar"] = {offense = 6, defense = 12.5, specialattack = 11.5, vitality = 7, agility = 300, exp = 173, level = 80, wildLvl = 90, type = "rock", type2 = "water"},

["Kabuto"] = {offense = 8, defense = 9, specialattack = 5.5, vitality = 3, agility = 300, exp = 71, level = 20, wildLvl = 30, type = "rock", type2 = "water"},

["Kabutops"] = {offense = 11.5, defense = 10.5, specialattack = 6.5, vitality = 6, agility = 300, exp = 173, level = 80, wildLvl = 90, type = "rock", type2 = "water"},

["Aerodactyl"] = {offense = 10.5, defense = 9.7, specialattack = 9, vitality = 12, agility = 300, exp = 180, level = 150, wildLvl = 600, type = "rock", type2 = "flying"},
 
["Snorlax"] = {offense = 11, defense = 6.5, specialattack = 5.5, vitality = 16, agility = 200, exp = 189, level = 100, wildLvl = 100, type = "normal", type2 = "no type"},

["Articuno"] = {offense = 8.5, defense = 10, specialattack = 9.5, vitality = 9, agility = 300, exp = 261, level = 1000, wildLvl = 750, type = "ice", type2 = "no type"},
  
["Zapdos"] = {offense = 9, defense = 8.5, specialattack = 12.5, vitality = 9, agility = 300, exp = 261, level = 1000, wildLvl = 750, type = "electric", type2 = "flying"},

["Moltres"] = {offense = 10, defense = 9, specialattack = 12.5, vitality = 9, agility = 300, exp = 261, level = 1000, wildLvl = 750, type = "fire", type2 = "flying"},

["Dratini"] = {offense = 6.4, defense = 4.5, specialattack = 5, vitality = 4.1, agility = 300, exp = 60, level = 20, wildLvl = 30, type = "dragon", type2 = "no type"},

["Dragonair"] = {offense = 8.4, defense = 6.5, specialattack = 7, vitality = 6.1, agility = 300, exp = 147, level = 60, wildLvl = 70, type = "dragon", type2 = "no type"},

["Dragonite"] = {offense = 13.4, defense = 9.5, specialattack = 10, vitality = 9.1, agility = 300, exp = 270, level = 100, wildLvl = 82, type = "dragon", type2 = "flying"},

["Mewtwo"] = {offense = 11, defense = 9, specialattack = 15.4, vitality = 10.6, agility = 300, exp = 306, level = 150, wildLvl = 225, type = "psychic", type2 = "no type"},

["Mew"] = {offense = 10, defense = 10, specialattack = 10, vitality = 10, agility = 300, exp = 270, level = 150, wildLvl = 225, type = "psychic", type2 = "no type"},

---------------------modos---------------------------------------------------------------------------------------------------------------------------------------------
["Giant Magikarp"] = {offense = 1.5, defense = 8.25, specialattack = 2.25, vitality = 3, agility = 400, exp = 80, level = 40, wildLvl = 47, type = "water", type2 = "no type"},

------------------------------------------------------------------ Rank 5 ------------------------------------------------------------------
["Seavell Blastoise"] = {offense = 16.6, defense = 20, specialattack = 19, vitality = 15.8, agility = 450, exp = 480, level = 350, wildLvl = 350, type = "water", type2 = "no type"},

["Seavell Tentacruel"] = {offense = 14, defense = 13, specialattack = 16, vitality = 16, agility = 450, exp = 320, level = 350, wildLvl = 350, type = "water", type2 = "poison"},

["Seavell Lapras"] = {offense = 17, defense = 16, specialattack = 17, vitality = 26, agility = 450, exp = 380, level = 350, wildLvl = 350, type = "water", type2 = "ice"},

["Seavell Jynx"] = {offense = 10, defense = 7, specialattack = 23, vitality = 13, agility = 450, exp = 320, level = 350, wildLvl = 350, type = "psychic", type2 = "ice"},

["Volcanic Charizard"] = {offense = 16.8, defense = 15.6, specialattack = 21.8, vitality = 15.6, agility = 450, exp = 480, level = 350, wildLvl = 350, type = "fire", type2 = "flying"},

["Volcanic Magmar"] = {offense = 19, defense = 11.4, specialattack = 20, vitality = 13, agility = 450, exp = 360, level = 350, wildLvl = 350, type = "fire", type2 = "no type"},

["Volcanic Arcanine"] = {offense = 22, defense = 16, specialattack = 20, vitality = 18, agility = 525, exp = 400, level = 350, wildLvl = 350, type = "fire", type2 = "no type"},

["Volcanic Typhlosion"] = {offense = 16.8, defense = 15.6, specialattack = 21.8, vitality = 15.6, agility = 300, exp = 480, level = 350, wildLvl = 350, type = "fire", type2 = "no type"},

["Naturia Scyther"] = {offense = 22, defense = 16, specialattack = 11, vitality = 14, agility = 525, exp = 200, level = 350, wildLvl = 350, type = "bug", type2 = "flying"},

["Naturia Venusaur"] = {offense = 16.4, defense = 16.6, specialattack = 20, vitality = 16, agility = 450, exp = 480, level = 350, wildLvl = 350, type = "grass", type2 = "poison"},

["Malefic Misdreavus"] = {offense = 12, defense = 12, specialattack = 17, vitality = 12, agility = 300, exp = 180, level = 350, wildLvl = 350, type = "ghost", type2 = "no type"},

["Malefic Umbreon"] = {offense = 13, defense = 22, specialattack = 12, vitality = 19, agility = 345, exp = 380, level = 350, wildLvl = 350, type = "dark", type2 = "no type"},

["Malefic Gengar"] = {offense = 13, defense = 12, specialattack = 26, vitality = 12, agility = 450, exp = 460, level = 350, wildLvl = 350, type = "ghost", type2 = "poison"},

["Raibolt Raichu"] = {offense = 18, defense = 11, specialattack = 18, vitality = 12, agility = 525, exp = 440, level = 350, wildLvl = 350, type = "electric", type2 = "no type"},

["Psycraft Slowking"] = {offense = 15, defense = 16, specialattack = 20, vitality = 19, agility = 330, exp = 360, level = 350, wildLvl = 350, type = "water", type2 = "psychic"},

["Psycraft Alakazam"] = {offense = 10, defense = 9, specialattack = 27, vitality = 11, agility = 450, exp = 460, level = 350, wildLvl = 350, type = "psychic", type2 = "no type"},

["Orebound Aerodactyl"] = {offense = 21, defense = 13, specialattack = 12, vitality = 16, agility = 450, exp = 360, level = 350, wildLvl = 350, type = "rock", type2 = "flying"},
 
["Orebound Golem"] = {offense = 24, defense = 26, specialattack = 11, vitality = 16, agility = 450, exp = 460, level = 350, wildLvl = 350, type = "ground", type2 = "rock"},

["Wingeon Dragonite"] = {offense = 26.8, defense = 19, specialattack = 20, vitality = 18.2, agility = 300, exp = 540, level = 350, wildLvl = 350, type = "dragon", type2 = "flying"},

["Gardestriker Ursaring"] = {offense = 26, defense = 15, specialattack = 15, vitality = 18, agility = 300, exp = 360, level = 350, wildLvl = 350, type = "normal", type2 = "no type"},

["Raibolt Electabuzz"] = {offense = 16.6, defense = 11.4, specialattack = 19, vitality = 13, agility = 450, exp = 360, level = 350, wildLvl = 350, type = "electric", type2 = "no type"},

------------------------------------------------------------------ Rank 5 Shiny ------------------------------------------------------------------
["Orebound Golden Rhydon"] = {offense = 39, defense = 36, specialattack = 13.5, vitality = 31.5, agility = 450, exp = 460, level = 400, wildLvl = 400, type = "ground", type2 = "rock"},
  
["Volcanic Shiny Arcanine"] = {offense = 33, defense = 24, specialattack = 30, vitality = 27, agility = 525, exp = 600, level = 400, wildLvl = 400, type = "fire", type2 = "no type"},

["Volcanic Shiny Charizard"] = {offense = 25.2, defense = 23.2, specialattack = 32.3, vitality = 23.1, agility = 720, exp = 150, level = 400, wildLvl = 400, type = "fire", type2 = "flying"},

["Malefic Shiny Gengar"] = {offense = 19.5, defense = 18, specialattack = 39, vitality = 16, agility = 450, exp = 690, level = 400, wildLvl = 400, type = "ghost", type2 = "poison"},

["Raibolt Shiny Electabuzz"] = {offense = 24.9, defense = 17.1, specialattack = 27, vitality = 19.5, agility = 450, exp = 540, level = 400, wildLvl = 400, type = "electric", type2 = "no type"},

["Raibolt Shiny Raichu"] = {offense = 27, defense = 16.5, specialattack = 27, vitality = 18, agility = 525, exp = 660, level = 400, wildLvl = 400, type = "electric", type2 = "no type"},

["Psycraft Shiny Alakazam"] = {offense = 15, defense = 13.5, specialattack = 40.5, vitality = 16.5, agility = 450, exp = 690, level = 400, wildLvl = 400, type = "psychic", type2 = "no type"},

["Orebound Shiny Golem"] = {offense = 36, defense = 39, specialattack = 16.5, vitality = 25, agility = 450, exp = 690, level = 400, wildLvl = 400, type = "ground", type2 = "rock"},

["Wingeon Shiny Dragonite"] = {offense = 40.2, defense = 28.5, specialattack = 30, vitality = 27.3, agility = 300, exp = 810, level = 400, wildLvl = 400, type = "dragon", type2 = "flying"},

["Naturia Shiny Scyther"] = {offense = 33, defense = 24, specialattack = 16.5, vitality = 21, agility = 525, exp = 300, level = 400, wildLvl = 400, type = "bug", type2 = "flying"},

["Naturia Shiny Venusaur"] = {offense = 24.6, defense = 24.9, specialattack = 30, vitality = 24, agility = 450, exp = 720, level = 400, wildLvl = 400, type = "grass", type2 = "poison"},

["Seavell Shiny Tentacruel"] = {offense = 21, defense = 19.5, specialattack = 24, vitality = 24, agility = 450, exp = 540, level = 400, wildLvl = 400, type = "water", type2 = "poison"},

["Seavell Shiny Blastoise"] = {offense = 24.9, defense = 30, specialattack = 28.5, vitality = 23.7, agility = 450, exp = 720, level = 400, wildLvl = 400, type = "water", type2 = "no type"},

["Malefic Shiny Muk"] = {offense = 31.5, defense = 22.5, specialattack = 19.5, vitality = 31.5, agility = 450, exp = 540, level = 400, wildLvl = 400, type = "poison", type2 = "no type"},

["Raibolt Shiny Jolteon"] = {offense = 19.5, defense = 18, specialattack = 33, vitality = 19.5, agility = 4500, exp = 570, level = 400, wildLvl = 400, type = "electric", type2 = "no type"},

["Psycraft Shiny Hypno"] = {offense = 21.9, defense = 21, specialattack = 21.9, vitality = 25.5, agility = 450, exp = 510, level = 400, wildLvl = 400, type = "psychic", type2 = "no type"},

["Psycraft Shiny Abra"] = {offense = 6, defense = 4.5, specialattack = 31.5, vitality = 7.5, agility = 450, exp = 210, level = 400, wildLvl = 400, type = "psychic", type2 = "no type"},

["Orebound Shiny Marowak"] = {offense = 24, defense = 33, specialattack = 15, vitality = 18, agility = 450, exp = 450, level = 400, wildLvl = 400, type = "ground", type2 = "no type"},

["Wingeon Shiny Fearow"] = {offense = 27, defense = 19.5, specialattack = 18.3, vitality = 19.5, agility = 450, exp = 480, level = 400, wildLvl = 400, type = "flying", type2 = "normal"},

["Wingeon Shiny Farfetch'd"] = {offense = 19.5, defense = 16.5, specialattack = 17.4, vitality = 15.6, agility = 450, exp = 420, level = 400, wildLvl = 400, type = "flying", type2 = "normal"},

["Wingeon Shiny Pidgeot"] = {offense = 24, defense = 22.5, specialattack = 21, vitality = 24.9, agility = 525, exp = 660, level = 400, wildLvl = 400, type = "flying", type2 = "normal"},

["Gardestriker Shiny Hitmontop"] = {offense = 28.5, defense = 28.5, specialattack = 10.5, vitality = 15, agility = 300, exp = 480, level = 400, wildLvl = 400, type = "fighting", type2 = "no type"},

["Gardestriker Shiny Hitmonlee"] = {offense = 36, defense = 15.9, specialattack = 10.5, vitality = 15, agility = 450, exp = 480, level = 400, wildLvl = 400, type = "fight", type2 = "no type"},

["Gardestriker Shiny Hitmonchan"] = {offense = 31.5, defense = 23.7, specialattack = 10.5, vitality = 15, agility = 450, exp = 480, level = 400, wildLvl = 400, type = "fight", type2 = "no type"},

["Gardestriker Shiny Snorlax"] = {offense = 33, defense = 19.5, specialattack = 19.5, vitality = 48, agility = 300, exp = 570, level = 400, wildLvl = 400, type = "normal", type2 = "no type"},

["Naturia Shiny Tangela"] = {offense = 16.5, defense = 34.5, specialattack = 30, vitality = 19.5, agility = 450, exp = 270, level = 400, wildLvl = 400, type = "grass", type2 = "no type"},

["Seavell Shiny Seadra"] = {offense = 19.5, defense = 28.5, specialattack = 28.5, vitality = 16.5, agility = 450, exp = 480, level = 400, wildLvl = 400, type = "water", type2 = "no type"},


-------------------------------------------------------------Statos  Pokemon Shiny Kanto-------------------------------------------------------------

["Shiny Venusaur"] = {offense = 2.3, defense = 10, specialattack = 11, vitality = 14, agility = 210, exp = 1050, level = 100, wildLvl = 250, type = "grass", type2 = "poison"},

["Shiny Charizard"] = {offense = 2.3, defense = 9, specialattack = 11, vitality = 14, agility = 210, exp = 1050, level = 100, wildLvl = 250, type = "fire", type2 = "flying"},

["Shiny Blastoise"] = {offense = 2.3, defense = 11, specialattack = 11, vitality = 14, agility = 210, exp = 1050, level = 100, wildLvl = 250, type = "water", type2 = "no type"},

["Shiny Butterfree"] = {offense = 1.9, defense = 12, specialattack = 6, vitality = 12, agility = 200, exp = 700, level = 60, wildLvl = 180, type = "bug", type2 = "flying"},

["Shiny Beedrill"] = {offense = 1.7, defense = 10, specialattack = 6, vitality = 9, agility = 210, exp = 800, level = 60, wildLvl = 180, type = "bug", type2 = "poison"},

["Shiny Pidgeot"] = {offense = 2.1, defense = 10, specialattack = 11, vitality = 14, agility = 340, exp = 800, level = 100, wildLvl = 250, type = "normal", type2 = "flying"},

["Shiny Rattata"] = {offense = 0.9, defense = 6, specialattack = 2.75, vitality = 3.3, agility = 190, exp = 62.7, level = 10, wildLvl = 40, type = "normal", type2 = "no type"},

["Shiny Raticate"] = {offense = 1.8, defense = 9, specialattack = 6, vitality = 6.05, agility = 200, exp = 127.6, level = 60, wildLvl = 90, type = "normal", type2 = "no type"},

["Shiny Fearow"] = {offense = 2.1, defense = 9, specialattack = 11, vitality = 13, agility = 240, exp = 178.2, level = 120, wildLvl = 250, type = "normal", type2 = "flying"},
  
["Shiny Raichu"] = {offense = 2, defense = 9, specialattack = 11, vitality = 13, agility = 270, exp = 800, level = 100, wildLvl = 250, type = "electric", type2 = "no type"},

["Shiny Nidoking"] = {offense = 2.1, defense = 12, specialattack = 11, vitality = 14, agility = 200, exp = 214.5, level = 100, wildLvl = 250, type = "poison", type2 = "ground"},

["Shiny Zubat"] = {offense = 0.9, defense = 8, specialattack = 4.3, vitality = 5.4, agility = 190, exp = 59.4, level = 20, wildLvl = 60, type = "poison", type2 = "flying"},

["Shiny Golbat"] = {offense = 1.2, defense = 8, specialattack = 6, vitality = 10.25, agility = 230, exp = 188.1, level = 60, wildLvl = 180, type = "poison", type2 = "flying"},

["Shiny Oddish"] = {offense = 0.9, defense = 4, specialattack = 4.25, vitality = 4.95, agility = 180, exp = 85.8, level = 10, wildLvl = 60, type = "grass", type2 = "poison"},

["Shiny Vileplume"] = {offense = 2.1, defense = 10, specialattack = 11, vitality = 13.1, agility = 210, exp = 1000, level = 120, wildLvl = 250, type = "grass", type2 = "poison"},

["Shiny Paras"] = {offense = 0.9, defense = 8, specialattack = 4.95, vitality = 3.85, agility = 180, exp = 77, level = 10, wildLvl = 60, type = "bug", type2 = "grass"},

["Shiny Parasect"] = {offense = 1.7, defense = 10, specialattack = 6, vitality = 13.6, agility = 200, exp = 140.8, level = 60, wildLvl = 180, type = "bug", type2 = "grass"},
 
["Shiny Venonat"] = {offense = 0.9, defense = 8, specialattack = 4.4, vitality = 8.6, agility = 190, exp = 82.5, level = 20, wildLvl = 60, type = "bug", type2 = "poison"},

["Shiny Venomoth"] = {offense = 2.2, defense = 11, specialattack = 11, vitality = 13.15, agility = 200, exp = 151.8, level = 100, wildLvl = 250, type = "bug", type2 = "poison"},

["Shiny Growlithe"] = {offense = 0.9, defense = 4.95, specialattack = 4.7, vitality = 8.05, agility = 200, exp = 100.1, level = 30, wildLvl = 90, type = "fire", type2 = "no type"},

["Shiny Arcanine"] = {offense = 2.1, defense = 8.8, specialattack = 11, vitality = 14.7, agility = 450, exp = 900, level = 100, wildLvl = 250, type = "fire", type2 = "no type"},

["Shiny Abra"] = {offense = 1.2, defense = 8, specialattack = 11, vitality = 13, agility = 130, exp = 82.5, level = 80, wildLvl = 200, type = "psychic", type2 = "ghost"},

["Shiny Alakazam"] = {offense = 2.2, defense = 9, specialattack = 12, vitality = 13, agility = 125, exp = 204.6, level = 100, wildLvl = 250, type = "psychic", type2 = "no type"},

["Shiny Tentacool"] = {offense = 0.9, defense = 3.85, specialattack = 4.5, vitality = 5.4, agility = 180, exp = 115.5, level = 20, wildLvl = 60, type = "water", type2 = "poison"},

["Shiny Tentacruel"] = {offense = 1.9, defense = 9, specialattack = 11, vitality = 14.2, agility = 200, exp = 225.5, level = 100, wildLvl = 250, type = "water", type2 = "poison"},

["Shiny Golem"] = {offense = 1.9, defense = 14.3, specialattack = 11, vitality = 8.9, agility = 200, exp = 194.7, level = 100, wildLvl = 250, type = "rock", type2 = "ground"},

["Shiny Farfetch'd"] = {offense = 2.2, defense = 9, specialattack = 11, vitality = 13.5, agility = 310, exp = 103.4, level = 100, wildLvl = 250, type = "normal", type2 = "flying"},

["Shiny Grimer"] = {offense = 0.9, defense = 5.5, specialattack = 4.4, vitality = 9.8, agility = 180, exp = 99, level = 20, wildLvl = 60, type = "poison", type2 = "no type"},

["Shiny Muk"] = {offense = 2.2, defense = 9.1, specialattack = 11, vitality = 15.2, agility = 200, exp = 172.7, level = 100, wildLvl = 250, type = "poison", type2 = "no type"},

["Shiny Gengar"] = {offense = 2.2, defense = 9.6, specialattack = 13.2, vitality = 12.9, agility = 200, exp = 209, level = 100, wildLvl = 250, type = "ghost", type2 = "poison"},

["Shiny Onix"] = {offense = 2.2, defense = 8.6, specialattack = 11, vitality = 15.1, agility = 200, exp = 800, level = 100, wildLvl = 250, type = "rock", type2 = "ground"},

["Crystal Onix"] = {offense = 6.5, defense = 18, specialattack = 5, vitality = 6.5, agility = 300, exp = 540, level = 100, wildLvl = 60, type = "rock", type2 = "ice"},

["Shiny Hypno"] = {offense = 2.2, defense = 8.7, specialattack = 11, vitality = 13.35, agility = 200, exp = 181.5, level = 100, wildLvl = 250, type = "psychic", type2 = "no type"},

["Shiny Krabby"] = {offense = 0.9, defense = 9.9, specialattack = 4.75, vitality = 3.3, agility = 180, exp = 126.5, level = 10, wildLvl = 60, type = "water", type2 = "no type"},

["Shiny Kingler"] = {offense = 1.2, defense = 12.65, specialattack = 6.5, vitality = 10.05, agility = 200, exp = 226.6, level = 60, wildLvl = 180, type = "water", type2 = "no type"},

["Shiny Voltorb"] = {offense = 0.9, defense = 5.5, specialattack = 4.05, vitality = 4.4, agility = 180, exp = 113.3, level = 10, wildLvl = 60, type = "electric", type2 = "no type"},

["Shiny Electrode"] = {offense = 1.2, defense = 7.7, specialattack = 8.8, vitality = 12.6, agility = 190, exp = 165, level = 80, wildLvl = 180, type = "electric", type2 = "no type"},

["Shiny Cubone"] = {offense = 0.9, defense = 8, specialattack = 4.4, vitality = 8.5, agility = 190, exp = 95.7, level = 20, wildLvl = 90, type = "ground", type2 = "no type"},

["Shiny Marowak"] = {offense = 2.2, defense = 10, specialattack = 8.8, vitality = 15.6, agility = 200, exp = 136.4, level = 100, wildLvl = 250, type = "ground", type2 = "no type"},

["Shiny Hitmonlee"] = {offense = 2.2, defense = 8, specialattack = 11.85, vitality = 13.1, agility = 200, exp = 1000, level = 120, wildLvl = 250, type = "fighting", type2 = "no type"},

["Shiny Hitmontop"] = {offense = 2.2, defense = 8, specialattack = 11.85, vitality = 13.1, agility = 200, exp = 1000, level = 120, wildLvl = 250, type = "fighting", type2 = "no type"},

["Shiny Hitmonchan"] = {offense = 2.2, defense = 8, specialattack = 11.85, vitality = 13.1, agility = 200, exp = 1000, level = 120, wildLvl = 250, type = "fighting", type2 = "no type"},

["Shiny Tangela"] = {offense = 2.2, defense = 10.1, specialattack = 11, vitality = 14, agility = 200, exp = 800, level = 100, wildLvl = 250, type = "grass", type2 = "no type"},

["Shiny Horsea"] = {offense = 0.9, defense = 7.7, specialattack = 4.5, vitality = 4.3, agility = 190, exp = 91.3, level = 10, wildLvl = 60, type = "water", type2 = "no type"},

["Shiny Seadra"] = {offense = 1.9, defense = 7, specialattack = 7, vitality = 12, agility = 200, exp = 400, level = 60, wildLvl = 110, type = "water", type2 = "no type"},

["Shiny Scyther"] = {offense = 2.2, defense = 13.8, specialattack = 14, vitality = 14, agility = 410, exp = 800, level = 100, wildLvl = 250, type = "bug", type2 = "flying"},

["Shiny Jynx"] = {offense = 2.2, defense = 10, specialattack = 11, vitality = 14.5, agility = 230, exp = 800, level = 100, wildLvl = 250, type = "ice", type2 = "psychic"},

["Shiny Electabuzz"] = {offense = 2.2, defense = 9, specialattack = 13, vitality = 14.5, agility = 210, exp = 800, level = 100, wildLvl = 250, type = "electric", type2 = "no type"},

["Shiny Pinsir"] = {offense = 2.2, defense = 12, specialattack = 10, vitality = 16, agility = 210, exp = 220, level = 100, wildLvl = 250, type = "bug", type2 = "no type"},

["Shiny Magikarp"] = {offense = 0.9, defense = 6.05, specialattack = 3.65, vitality = 2.2, agility = 130, exp = 22, level = 30, wildLvl = 60, type = "water", type2 = "no type"},

["Shiny Gyarados"] = {offense = 4, defense = 8, specialattack = 14, vitality = 15.45, agility = 210, exp = 2900, level = 120, wildLvl = 250, type = "water", type2 = "flying"},

["Shiny Ditto"] = {offense = 0.9, defense = 5.28, specialattack = 5.28, vitality = 5.28, agility = 200, exp = 67.1, level = 8, wildLvl = 60, type = "normal", type2 = "no type"},

["Shiny Vaporeon"] = {offense = 1.9, defense = 9, specialattack = 11, vitality = 13.2, agility = 230, exp = 215.6, level = 100, wildLvl = 250, type = "water", type2 = "no type"},

["Shiny Jolteon"] = {offense = 1.9, defense = 9, specialattack = 11, vitality = 13.2, agility = 230, exp = 216.7, level = 100, wildLvl = 250, type = "electric", type2 = "no type"},
 
["Shiny Flareon"] = {offense = 1.9, defense = 9, specialattack = 11, vitality = 13.2, agility = 230, exp = 217.8, level = 100, wildLvl = 250, type = "fire", type2 = "no type"},

["Shiny Snorlax"] = {offense = 8.2, defense = 8, specialattack = 15, vitality = 19, agility = 240, exp = 6500, level = 150, wildLvl = 250, type = "normal", type2 = "no type"},

["Shiny Dratini"] = {offense = 1.2, defense = 8, specialattack = 4.5, vitality = 8, agility = 190, exp = 73.7, level = 40, wildLvl = 110, type = "dragon", type2 = "no type"},

["Shiny Dragonair"] = {offense = 2.9, defense = 10, specialattack = 11, vitality = 14.2, agility = 200, exp = 2555, level = 90, wildLvl = 250, type = "dragon", type2 = "no type"},

["Shiny Dragonite"] = {offense = 13.4, defense = 9.5, specialattack = 10, vitality = 9.1, agility = 300, exp = 270, level = 150, wildLvl = 300, type = "dragon", type2 = "flying"},

["Shiny Mr. Mime"] = {offense = 2.1, defense = 12, specialattack = 12, vitality = 13.2, agility = 200, exp = 2150, level = 100, wildLvl = 250, type = "psychic", type2 = "no type"},

["Shiny Ninetales"] = {offense = 5, defense = 8, specialattack = 11, vitality = 13.6, agility = 280, exp = 3000, level = 150, wildLvl = 300, type = "fire", type2 = "no type"},

["Shiny Rhydon"] = {offense = 5, defense = 10, specialattack = 11, vitality = 16.2, agility = 210, exp = 3205, level = 150, wildLvl = 300, type = "ground", type2 = "rock"},

["Shiny Umbreon"] = {offense = 4, defense = 9, specialattack = 11, vitality = 14, agility = 280, exp = 2340, level = 150, wildLvl = 300, type = "dark", type2 = "no type"},

["Shiny Espeon"] = {offense = 4, defense = 9, specialattack = 11, vitality = 13.2, agility = 270, exp = 2340, level = 150, wildLvl = 300, type = "psychic", type2 = "no type"},

["Shiny Magneton"] = {offense = 3, defense = 9, specialattack = 11, vitality = 14, agility = 200, exp = 2125, level = 150, wildLvl = 300, type = "electric", type2 = "steel"},

["Shiny Politoed"] = {offense = 4, defense = 8, specialattack = 11, vitality = 14.8, agility = 230, exp = 3185, level = 150, wildLvl = 300, type = "water", type2 = "no type"},

["Shiny Stantler"] = {offense = 1.9, defense = 9, specialattack = 11, vitality = 14.2, agility = 230, exp = 216.7, level = 100, wildLvl = 250, type = "normal", type2 = "no type"},

["Shiny Dodrio"] = {offense = 4, defense = 9, specialattack = 11, vitality = 14, agility = 280, exp = 2340, level = 150, wildLvl = 300, type = "normal", type2 = "flying"},

["Shiny Ariados"] = {offense = 2.2, defense = 10, specialattack = 11, vitality = 13.6, agility = 200, exp = 136.4, level = 100, wildLvl = 300, type = "bug", type2 = "poison"},

["Shiny Tauros"] = {offense = 2.1, defense = 12, specialattack = 11, vitality = 15.2, agility = 200, exp = 2150, level = 100, wildLvl = 250, type = "normal", type2 = "no type"},

["Shiny Crobat"] = {offense = 2.9, defense = 10, specialattack = 11, vitality = 14.2, agility = 200, exp = 2555, level = 100, wildLvl = 250, type = "poison", type2 = "flying"},

["Shiny Magmar"] = {offense = 2.1, defense = 11, specialattack = 11, vitality = 14.2, agility = 200, exp = 2150, level = 100, wildLvl = 250, type = "fire", type2 = "no type"},

["Shiny Magmortar"] = {offense = 2.1, defense = 14, specialattack = 11, vitality = 18.2, agility = 200, exp = 2150, level = 150, wildLvl = 450, type = "fire", type2 = "no type"},

["Shiny Electivire"] = {offense = 2.2, defense = 14, specialattack = 11, vitality = 18.5, agility = 210, exp = 800, level = 150, wildLvl = 450, type = "electric", type2 = "no type"},

["Magmortar"] = {offense = 2.1, defense = 8, specialattack = 8, vitality = 11.2, agility = 200, exp = 2150, level = 100, wildLvl = 450, type = "fire", type2 = "no type"},

["Electivire"] = {offense = 2.2, defense = 8, specialattack = 8, vitality = 11.5, agility = 210, exp = 800, level = 100, wildLvl = 450, type = "electric", type2 = "no type"},

["Shiny Ampharos"] = {offense = 3, defense = 9, specialattack = 11, vitality = 14, agility = 200, exp = 2125, level = 100, wildLvl = 250, type = "electric", type2 = "steel"},

["Shiny Feraligatr"] = {offense = 4, defense = 8, specialattack = 11, vitality = 14.8, agility = 230, exp = 3185, level = 100, wildLvl = 250, type = "water", type2 = "no type"},
 
["Shiny Giant Magikarp"] = {offense = 4, defense = 8, specialattack = 7, vitality = 12.8, agility = 230, exp = 3185, level = 100, wildLvl = 250, type = "water", type2 = "no type"},

["Shiny Machamp"] = {offense = 5, defense = 10, specialattack = 11, vitality = 15.2, agility = 210, exp = 3205, level = 100, wildLvl = 250, type = "fighting", type2 = "no type"},

["Shiny Meganium"] = {offense = 5, defense = 8, specialattack = 11, vitality = 14.6, agility = 280, exp = 3000, level = 100, wildLvl = 520, type = "grass", type2 = "no type"},

["Shiny Larvitar"] = {offense = 1.2, defense = 8, specialattack = 5.5, vitality = 8, agility = 190, exp = 73.7, level = 40, wildLvl = 90, type = "ground", type2 = "rock"},

["Shiny Pupitar"] = {offense = 2.9, defense = 10, specialattack = 11, vitality = 14.2, agility = 200, exp = 2555, level = 90, wildLvl = 250, type = "ground", type2 = "rock"},

["Shiny Typhlosion"] = {offense = 1.9, defense = 9, specialattack = 11, vitality = 14.2, agility = 230, exp = 217.8, level = 100, wildLvl = 250, type = "fire", type2 = "no type"},

["Shiny Xatu"] = {offense = 4, defense = 9, specialattack = 11, vitality = 14.2, agility = 270, exp = 2340, level = 100, wildLvl = 250, type = "psychic", type2 = "flying"},

["Shiny Magcargo"] = {offense = 2.1, defense = 12, specialattack = 11, vitality = 14.2, agility = 200, exp = 2150, level = 100, wildLvl = 250, type = "fire", type2 = "rock"},

["Shiny Lanturn"] = {offense = 3, defense = 9, specialattack = 11, vitality = 14, agility = 200, exp = 2125, level = 100, wildLvl = 250, type = "water", type2 = "electric"},

["Shiny Sandslash"] = {offense = 2.1, defense = 13, specialattack = 11, vitality = 14.2, agility = 200, exp = 2150, level = 100, wildLvl = 250, type = "ground", type2 = "rock"},

["Shiny Weezing"] = {offense = 3, defense = 10, specialattack = 11, vitality = 13, agility = 200, exp = 2125, level = 100, wildLvl = 250, type = "poison", type2 = "no type"},

["Shiny Mantine"] = {offense = 1.9, defense = 9, specialattack = 11, vitality = 15.1, agility = 200, exp = 200, level = 150, wildLvl = 450, type = "water", type2 = "flying"},

-----------------------------------------------------------Startos Pokemon Johto-----------------------------------------------------------

["Chikorita"] = {offense = 4.9, defense = 6.5, specialattack = 4.9, vitality = 4.5 , agility = 200, exp = 64, level = 20, wildLvl = 30, type = "grass", type2 = "no type"},

["Bayleef"] = {offense = 6.2, defense = 8, specialattack = 6.3, vitality = 6, agility = 200, exp = 142, level = 40, wildLvl = 50, type = "grass", type2 = "no type"},
                                        --10
["Meganium"] = {offense = 8.2, defense = 10, specialattack = 8.3, vitality = 8, agility = 200, exp = 236, level = 85, wildLvl = 95, type = "grass", type2 = "no type"},

["Cyndaquil"] = {offense = 5.2, defense = 4.3, specialattack = 6, vitality = 3.9, agility = 200, exp = 62, level = 20, wildLvl = 30, type = "fire", type2 = "no type"},

["Quilava"] = {offense = 6.4, defense = 5.8, specialattack = 8, vitality = 5.8, agility = 200, exp = 142, level = 40, wildLvl = 50, type = "fire", type2 = "no type"},

["Typhlosion"] = {offense = 8.4, defense = 7.8, specialattack = 10.9, vitality = 7.8, agility = 200, exp = 240, level = 85, wildLvl = 95, type = "fire", type2 = "no type"},

["Totodile"] = {offense = 6.5, defense = 6.5, specialattack = 4.4, vitality = 5, agility = 200, exp = 63, level = 20, wildLvl = 30, type = "water", type2 = "no type"},

["Croconaw"] = {offense = 8.0, defense = 8, specialattack = 5.9, vitality = 6.5, agility = 200, exp = 142, level = 40, wildLvl = 50, type = "water", type2 = "no type"},

["Feraligatr"] = {offense = 10.5, defense = 10, specialattack = 7.9, vitality = 8.5, agility = 200, exp = 239, level = 85, wildLvl = 95, type = "water", type2 = "no type"},

["Sentret"] = {offense = 4.6, defense = 3.4, specialattack = 3.5, vitality = 3.5, agility = 200, exp = 43, level = 15, wildLvl = 15, type = "normal", type2 = "no type"},

["Furret"] = {offense = 7.6, defense = 6.4, specialattack = 4.5, vitality = 8.5, agility = 200, exp = 145, level = 35, wildLvl = 45, type = "normal", type2 = "no type"},

["Hoothoot"] = {offense = 3, defense = 3, specialattack = 3.6, vitality = 6, agility = 200, exp = 52, level = 20, wildLvl = 30, type = "normal", type2 = "flying"},

["Noctowl"] = {offense = 5, defense = 5, specialattack = 7.6, vitality = 10, agility = 280, exp = 158, level = 65, wildLvl = 75, type = "normal", type2 = "flying"},

["Ledyba"] = {offense = 2, defense = 3, specialattack = 4, vitality = 4, agility = 200, exp = 53, level = 15, wildLvl = 15, type = "bug", type2 = "flying"},

["Ledian"] = {offense = 3.5, defense = 5, specialattack = 5.5, vitality = 5.5, agility = 200, exp = 137, level = 35, wildLvl = 45, type = "bug", type2 = "flying"},

["Spinarak"] = {offense = 6, defense = 4, specialattack = 4, vitality = 4, agility = 200, exp = 50, level = 10, wildLvl = 10, type = "bug", type2 = "poison"},

["Ariados"] = {offense = 9, defense = 7, specialattack = 6, vitality = 7, agility = 250, exp = 140, level = 40, wildLvl = 50, type = "bug", type2 = "poison"},

["Crobat"] = {offense = 9, defense = 8, specialattack = 7, vitality = 8.5, agility = 300, exp = 241, level = 80, wildLvl = 90, type = "poison", type2 = "flying"},

["Chinchou"] = {offense = 3.8, defense = 3.8, specialattack = 5.6, vitality = 7.5, agility = 190, exp = 66, level = 15, wildLvl = 15, type = "water", type2 = "electric"},

["Lanturn"] = {offense = 5.8, defense = 5.8, specialattack = 7.6, vitality = 12.5, agility = 200, exp = 161, level = 50, wildLvl = 60, type = "water", type2 = "electric"},

["Pichu"] = {offense = 4, defense = 1.5, specialattack = 3.5, vitality = 2, agility = 200, exp = 41, level = 20, wildLvl = 30, type = "electric", type2 = "no type"},

["Cleffa"] = {offense = 2.5, defense = 2.8, specialattack = 4.5, vitality = 5, agility = 200, exp = 44, level = 20, wildLvl = 30, type = "normal", type2 = "no type"},

["Igglybuff"] = {offense = 3, defense = 1.5, specialattack = 4, vitality = 9, agility = 200, exp = 42, level = 20, wildLvl = 30, type = "normal", type2 = "no type"},

["Togepi"] = {offense = 2, defense = 6.5, specialattack = 4, vitality = 3.5, agility = 200, exp = 49, level = 10, wildLvl = 5, type = "normal", type2 = "no type"},

["Togetic"] = {offense = 4, defense = 8.5, specialattack = 8, vitality = 5.5, agility = 230, exp = 142, level = 60, wildLvl = 70, type = "normal", type2 = "flying"},

["Natu"] = {offense = 5, defense = 4.5, specialattack = 7, vitality = 4, agility = 250, exp = 64, level = 25, wildLvl = 35, type = "psychic", type2 = "flying"},

["Xatu"] = {offense = 7.5, defense = 7, specialattack = 9.5, vitality = 6.5, agility = 300, exp = 165, level = 80, wildLvl = 90, type = "psychic", type2 = "flying"},

["Mareep"] = {offense = 4, defense = 4, specialattack = 6.5, vitality = 5.5, agility = 200, exp = 56, level = 20, wildLvl = 30, type = "electric", type2 = "no type"},

["Flaaffy"] = {offense = 5.5, defense = 5.5, specialattack = 8, vitality = 7, agility = 200, exp = 128, level = 40, wildLvl = 50, type = "electric", type2 = "no type"},

["Ampharos"] = {offense = 7.5, defense = 8.5, specialattack = 11.5, vitality = 9, agility = 200, exp = 230, level = 85, wildLvl = 95, type = "electric", type2 = "no type"},

["Bellossom"] = {offense = 8, defense = 9.5, specialattack = 9, vitality = 7.5, agility = 200, exp = 221, level = 50, wildLvl = 60, type = "grass", type2 = "no type"},

["Marill"] = {offense = 2, defense = 5, specialattack = 2, vitality = 7, agility = 200, exp = 88, level = 20, wildLvl = 30, type = "water", type2 = "no type"},

["Azumarill"] ={offense = 5, defense = 8, specialattack = 6, vitality = 10, agility = 200, exp = 189, level = 65, wildLvl = 75, type = "water", type2 = "no type"},

["Sudowoodo"] = {offense = 10, defense = 11.5, specialattack = 3, vitality = 7, agility = 200, exp = 144, level = 80, wildLvl = 90, type = "rock", type2 = "no type"},
 
["Politoed"] = {offense = 7.5, defense = 7.5, specialattack = 9, vitality = 9, agility = 200, exp = 225, level = 65, wildLvl = 75, type = "water", type2 = "no type"},

["Hoppip"] = {offense = 3.5, defense = 4, specialattack = 3.5, vitality = 3.5, agility = 180, exp = 50, level = 10, wildLvl = 5, type = "grass", type2 = "flying"},

["Skiploom"] = {offense = 4.5, defense = 5, specialattack = 4.5, vitality = 5.5, agility = 200, exp = 119, level = 25, wildLvl = 35, type = "grass", type2 = "flying"},

["Jumpluff"] = {offense = 5.5, defense = 7, specialattack = 5.5, vitality = 7.5, agility = 200, exp = 207, level = 50, wildLvl = 60, type = "grass", type2 = "flying"},

["Aipom"] = {offense = 7, defense = 5.5, specialattack = 4, vitality = 5.5, agility = 200, exp = 72, level = 40, wildLvl = 50, type = "normal", type2 = "no type"},

["Sunkern"] = {offense = 3, defense = 3, specialattack = 3, vitality = 3, agility = 160, exp = 36, level = 10, wildLvl = 5, type = "grass", type2 = "no type"},

["Sunflora"] = {offense = 7.5, defense = 5.5, specialattack = 10.5, vitality = 7.5, agility = 200, exp = 149, level = 30, wildLvl = 40, type = "grass", type2 = "no type"},

["Yanma"] = {offense = 6.5, defense = 4.5, specialattack = 7.5, vitality = 6.5, agility = 230, exp = 78, level = 50, wildLvl = 60, type = "bug", type2 = "flying"},

["Wooper"] = {offense = 4.5, defense = 4.5, specialattack = 2.5, vitality = 5.5, agility = 200, exp = 42, level = 20, wildLvl = 30, type = "water", type2 = "ground"},

["Quagsire"] = {offense = 8.5, defense = 8.5, specialattack = 6.5, vitality = 9.5, agility = 200, exp = 151, level = 65, wildLvl = 75, type = "water", type2 = "ground"},

["Espeon"] = {offense = 6.5, defense = 6, specialattack = 13, vitality = 6.5, agility = 230, exp = 184, level = 55, wildLvl = 65, type = "psychic", type2 = "no type"},

["Umbreon"] = {offense = 6.5, defense = 11, specialattack = 6, vitality = 9.5, agility = 230, exp = 184, level = 55, wildLvl = 65, type = "dark", type2 = "no type"},

["Murkrow"] = {offense = 8.5, defense = 4.2, specialattack = 8.5, vitality = 6, agility = 280, exp = 81, level = 55, wildLvl = 65, type = "dark", type2 = "flying"},

["Slowking"] = {offense = 7.5, defense = 8, specialattack = 10, vitality = 9.5, agility = 220, exp = 172, level = 100, wildLvl = 110, type = "water", type2 = "psychic"},

["Misdreavus"] = {offense = 6, defense = 6, specialattack = 8.5, vitality = 6, agility = 200, exp = 87, level = 80, wildLvl = 90, type = "ghost", type2 = "no type"},

["Unown"] = {offense = 7.2, defense = 4.8, specialattack = 7.2, vitality = 4.8, agility = 200, exp = 118, level = 100, wildLvl = 110, type = "psychic", type2 = "no type"},

["Wobbuffet"] = {offense = 3.3, defense = 5.8, specialattack = 3.3, vitality = 19, agility = 200, exp = 142, level = 80, wildLvl = 90, type = "psychic", type2 = "no type"},

["Girafarig"] = {offense = 8, defense = 6.5, specialattack = 9, vitality = 7, agility = 300, exp = 159, level = 80, wildLvl = 90, type = "normal", type2 = "psychic"},

["Pineco"] = {offense = 6.5, defense = 9, specialattack = 3.5, vitality = 5, agility = 190, exp = 58, level = 15, wildLvl = 15, type = "bug", type2 = "no type"},

["Forretress"] = {offense = 9, defense = 14, specialattack = 6, vitality = 7.5, agility = 200, exp = 163, level = 65, wildLvl = 75, type = "bug", type2 = "steel"},

["Dunsparce"] = {offense = 7, defense = 7, specialattack = 6.5, vitality = 10, agility = 180, exp = 145, level = 30, wildLvl = 40, type = "normal", type2 = "no type"},

["Gligar"] = {offense = 7.5, defense = 10.5, specialattack = 3.5, vitality = 6.5, agility = 200, exp = 86, level = 40, wildLvl = 50, type = "ground", type2 = "flying"},

["Steelix"] = {offense = 9.5, defense = 22, specialattack = 6, vitality = 8.3, agility = 220, exp = 179, level = 100, wildLvl = 110, type = "steel", type2 = "ground"},

["Snubbull"] = {offense = 8, defense = 5, specialattack = 4, vitality = 6, agility = 200, exp = 60, level = 30, wildLvl = 40, type = "normal", type2 = "no type"},

["Granbull"] = {offense = 12, defense = 7.5, specialattack = 6, vitality = 9, agility = 200, exp = 158, level = 65, wildLvl = 75, type = "normal", type2 = "no type"},

["Qwilfish"] = {offense = 9.5, defense = 7.5, specialattack = 5.5, vitality = 6.5, agility = 200, exp = 88, level = 55, wildLvl = 65, type = "water", type2 = "poison"},
                                                                    
["Scizor"] = {offense = 13, defense = 10, specialattack = 5.5, vitality = 7, agility = 310, exp = 175, level = 100, wildLvl = 110, type = "bug", type2 = "steel"},

["Shuckle"] = {offense = 1, defense = 23, specialattack = 1, vitality = 2, agility = 200, exp = 177, level = 30, wildLvl = 40, type = "bug", type2 = "rock"},

["Heracross"] = {offense = 12.5, defense = 7.5, specialattack = 4, vitality = 8, agility = 200, exp = 175, level = 80, wildLvl = 90, type = "bug", type2 = "fighting"},

["Sneasel"] = {offense = 9.5, defense = 5.5, specialattack = 3.5, vitality = 5.5, agility = 270, exp = 86, level = 55, wildLvl = 65, type = "dark", type2 = "ice"},

["Teddiursa"] = {offense = 8, defense = 5, specialattack = 5, vitality = 6, agility = 200, exp = 66, level = 20, wildLvl = 30, type = "normal", type2 = "no type"},

["Ursaring"] = {offense = 13, defense = 7.5, specialattack = 7.5, vitality = 9, agility = 200, exp = 175, level = 90, wildLvl = 100, type = "normal", type2 = "no type"},

["Slugma"] = {offense = 4, defense = 4, specialattack = 7, vitality = 4, agility = 200, exp = 50, level = 15, wildLvl = 15, type = "fire", type2 = "no type"},

["Magcargo"] = {offense = 5, defense = 12, specialattack = 8, vitality = 5, agility = 200, exp = 151, level = 80, wildLvl = 90, type = "fire", type2 = "rock"},

["Swinub"] = {offense = 5, defense = 4, specialattack = 3, vitality = 5, agility = 180, exp = 50, level = 15, wildLvl = 15, type = "ice", type2 = "ground"},

["Piloswine"] = {offense = 10, defense = 8, specialattack = 6, vitality = 10, agility = 200, exp = 158, level = 80, wildLvl = 90, type = "ice", type2 = "ground"},

["Corsola"] = {offense = 5.5, defense = 8.5, specialattack = 6.5, vitality = 5.5, agility = 200, exp = 144, level = 50, wildLvl = 60, type = "water", type2 = "rock"},

["Remoraid"] = {offense = 6.5, defense = 3.5, specialattack = 6.5, vitality = 3.5, agility = 200, exp = 60, level = 10, wildLvl = 10, type = "water", type2 = "no type"},

["Octillery"] = {offense = 10.5, defense = 7.5, specialattack = 10.5, vitality = 7.5, agility = 200, exp = 168, level = 70, wildLvl = 80, type = "water", type2 = "no type"},

["Delibird"] = {offense = 5.5, defense = 4.5, specialattack = 6.5, vitality = 4.5, agility = 200, exp = 116, level = 40, wildLvl = 50, type = "ice", type2 = "flying"},

["Mantine"] = {offense = 4, defense = 7, specialattack = 8, vitality = 6.5, agility = 200, exp = 170, level = 80, wildLvl = 90, type = "water", type2 = "flying"},

["Skarmory"] = {offense = 8, defense = 14, specialattack = 4, vitality = 6.5, agility = 300, exp = 163, level = 85, wildLvl = 95, type = "steel", type2 = "flying"},

["Houndour"] = {offense = 6, defense = 3, specialattack = 8, vitality = 4.5, agility = 270, exp = 66, level = 20, wildLvl = 30, type = "dark", type2 = "fire"},

["Houndoom"] = {offense = 9, defense = 5, specialattack = 11, vitality = 7.5, agility = 300, exp = 175, level = 80, wildLvl = 90, type = "dark", type2 = "fire"},

["Kingdra"] = {offense = 9.5, defense = 9.5, specialattack = 9.5, vitality = 7.5, agility = 210, exp = 243, level = 90, wildLvl = 100, type = "water", type2 = "dragon"},

["Phanpy"] = {offense = 6, defense = 6, specialattack = 4, vitality = 9, agility = 200, exp = 66, level = 20, wildLvl = 30, type = "ground", type2 = "no type"},

["Donphan"] = {offense = 12, defense = 12, specialattack = 6, vitality = 9, agility = 200, exp = 175, level = 80, wildLvl = 90, type = "ground", type2 = "no type"},

["Porygon2"] = {offense = 8, defense = 9, specialattack = 10.5, vitality = 8.5, agility = 200, exp = 180, level = 75, wildLvl = 85, type = "normal", type2 = "no type"},

["Stantler"] = {offense = 9.5, defense = 6.2, specialattack = 8.5, vitality = 7.3, agility = 200, exp = 163, level = 55, wildLvl = 65, type = "normal", type2 = "no type"},

["Smeargle"] = {offense = 2, defense = 3.5, specialattack = 2, vitality = 5.5, agility = 310, exp = 88, level = 100, wildLvl = 110, type = "normal", type2 = "no type"},

["Tyrogue"] = {offense = 3.5, defense = 3.5, specialattack = 3.5, vitality = 3.5, agility = 200, exp = 42, level = 30, wildLvl = 40, type = "fighting", type2 = "no type"},

["Hitmontop"] = {offense = 9.5, defense = 9.5, specialattack = 3.5, vitality = 5, agility = 200, exp = 159, level = 60, wildLvl = 70, type = "fighting", type2 = "no type"},

["Smoochum"] = {offense = 3, defense = 1.5, specialattack = 8.5, vitality = 4.5, agility = 200, exp = 61, level = 30, wildLvl = 40, type = "ice", type2 = "psychic"},

["Elekid"] = {offense = 6.3, defense = 3.7, specialattack = 6.5, vitality = 4.5, agility = 200, exp = 72, level = 30, wildLvl = 40, type = "electric", type2 = "no type"},

["Magby"] = {offense = 7.5, defense = 3.7, specialattack = 7, vitality = 4.5, agility = 200, exp = 73, level = 30, wildLvl = 40, type = "fire", type2 = "no type"},

["Miltank"] = {offense = 8, defense = 10.5, specialattack = 4, vitality = 9.5, agility = 200, exp = 172, level = 80, wildLvl = 90, type = "normal", type2 = "no type"},

["Blissey"] = {offense = 1, defense = 1, specialattack = 7.5, vitality = 25.5, agility = 200, exp = 608, level = 100, wildLvl = 110, type = "normal", type2 = "no type"},

["Raikou"] = {offense = 8.5, defense = 7.5, specialattack = 11.5, vitality = 9, agility = 300, exp = 261, level = 1000, wildLvl = 1000, type = "electric", type2 = "no type"},

["Entei"] = {offense = 11.5, defense = 8.5, specialattack = 9, vitality = 11.5, agility = 300, exp = 261, level = 1000, wildLvl = 1000, type = "fire", type2 = "no type"},

["Suicune"] = {offense = 7.5, defense = 11.5, specialattack = 9, vitality = 10, agility = 300, exp = 261, level = 1000, wildLvl = 1000, type = "water", type2 = "no type"},

["Larvitar"] = {offense = 6.4, defense = 5, specialattack = 4.5, vitality = 5, agility = 200, exp = 60, level = 20, wildLvl = 30, type = "rock", type2 = "ground"},

["Pupitar"] = {offense = 8.4, defense = 7, specialattack = 6.5, vitality = 7, agility = 200, exp = 144, level = 65, wildLvl = 75, type = "rock", type2 = "ground"},

["Tyranitar"] = {offense = 13.4, defense = 11, specialattack = 9.5, vitality = 10, agility = 200, exp = 270, level = 100, wildLvl = 110, type = "rock", type2 = "dark"},

["Lugia"] = {offense = 9, defense = 13, specialattack = 9, vitality = 10.6, agility = 300, exp = 306, level = 1000, wildLvl = 1000, type = "psychic", type2 = "flying"},

["Ho-oh"] = {offense = 13, defense = 9, specialattack = 11, vitality = 10.6, agility = 300, exp = 306, level = 1000, wildLvl = 1000, type = "fire", type2 = "flying"},

["Celebi"] = {offense = 10, defense = 10, specialattack = 10, vitality = 10, agility = 300, exp = 270, level = 1000, wildLvl = 1000, type = "psychic", type2 = "grass"},
 
 -----------------------------------------------------------Startos Pokemon Hoen-----------------------------------------------------------
["Treecko"] = {offense = 4.5, defense = 3.5, specialattack = 6.5, vitality = 4, agility = 300, exp = 62, level = 20, wildLvl = 300, type = "grass", type2 = "no type"},
["Grovyle"] = {offense = 6.5, defense = 4.5, specialattack = 8.5, vitality = 5, agility = 300, exp = 142, level = 40, wildLvl = 300, type = "grass", type2 = "no type"},
["Sceptile"] = {offense = 8.5, defense = 6.5, specialattack = 10.5, vitality = 7, agility = 300, exp = 239, level = 80, wildLvl = 300, type = "grass", type2 = "no type"},
["Torchic"] = {offense = 6, defense = 4, specialattack = 7, vitality = 4.5, agility = 300, exp = 62, level = 20, wildLvl = 300, type = "fire", type2 = "no type"},
["Combusken"] = {offense = 8.5, defense = 6, specialattack = 8.5, vitality = 6, agility = 300, exp = 142, level = 40, wildLvl = 300, type = "fire", type2 = "fighting"},
["Blaziken"] = {offense = 12, defense = 7, specialattack = 11, vitality = 8, agility = 300, exp = 239, level = 80, wildLvl = 300, type = "fire", type2 = "fighting"},
["Mudkip"] = {offense = 7, defense = 5, specialattack = 5, vitality = 5, agility = 300, exp = 62, level = 20, wildLvl = 300, type = "water", type2 = "no type"},
["Marshtomp"] = {offense = 8.5, defense = 7, specialattack = 6, vitality = 7, agility = 300, exp = 142, level = 40, wildLvl = 300, type = "water", type2 = "ground"},
["Swampert"] = {offense = 11, defense = 9, specialattack = 8.5, vitality = 10, agility = 300, exp = 241, level = 80, wildLvl = 300, type = "water", type2 = "ground"},
["Poochyena"] = {offense = 5.5, defense = 3.4, specialattack = 3, vitality = 3.5, agility = 300, exp = 56, level = 30, wildLvl = 300, type = "dark", type2 = "no type"},
["Mightyena"] = {offense = 9, defense = 7, specialattack = 6, vitality = 7, agility = 300, exp = 147, level = 80, wildLvl = 300, type = "dark", type2 = "no type"},
["Zigzagoon"] = {offense = 3, defense = 4.1, specialattack = 3, vitality = 3.8, agility = 300, exp = 56, level = 10, wildLvl = 300, type = "normal", type2 = "no type"},
["Linoone"] = {offense = 7, defense = 6.1, specialattack = 5, vitality = 7.8, agility = 300, exp = 147, level = 40, wildLvl = 300, type = "normal", type2 = "no type"},
["Wurmple"] = {offense = 4.5, defense = 3.5, specialattack = 2, vitality = 4.5, agility = 300, exp = 56, level = 10, wildLvl = 300, type = "bug", type2 = "no type"},
["Silcoon"] = {offense = 3.5, defense = 5.5, specialattack = 2.5, vitality = 5, agility = 300, exp = 72, level = 10, wildLvl = 300, type = "bug", type2 = "no type"},
["Beautifly"] = {offense = 7, defense = 5, specialattack = 10, vitality = 6, agility = 300, exp = 178, level = 50, wildLvl = 300, type = "bug", type2 = "flying"},
["Cascoon"] = {offense = 3.5, defense = 5.5, specialattack = 2.5, vitality = 5, agility = 300, exp = 72, level = 10, wildLvl = 300, type = "bug", type2 = "no type"},
["Dustox"] = {offense = 5, defense = 7, specialattack = 5, vitality = 6, agility = 300, exp = 73, level = 50, wildLvl = 300, type = "bug", type2 = "poison"},
["Lotad"] = {offense = 3, defense = 3, specialattack = 4, vitality = 5, agility = 300, exp = 44, level = 20, wildLvl = 300, type = "water", type2 = "grass"},
["Lombre"] = {offense = 5, defense = 5, specialattack = 6, vitality = 6, agility = 300, exp = 119, level = 50, wildLvl = 300, type = "water", type2 = "grass"},
["Ludicolo"] = {offense = 7, defense = 7, specialattack = 9, vitality = 8, agility = 300, exp = 216, level = 100, wildLvl = 300, type = "water", type2 = "grass"},
["Seedot"] = {offense = 4, defense = 5, specialattack = 3, vitality = 4, agility = 300, exp = 44, level = 10, wildLvl = 300, type = "grass", type2 = "no type"},
["Nuzleaf"] = {offense = 7, defense = 4, specialattack = 6, vitality = 7, agility = 300, exp = 119, level = 30, wildLvl = 300, type = "grass", type2 = "dark"},
["Shiftry"] = {offense = 10, defense = 6, specialattack = 9, vitality = 9, agility = 300, exp = 216, level = 80, wildLvl = 300, type = "grass", type2 = "dark"},
["Taillow"] = {offense = 5.5, defense = 3, specialattack = 3, vitality = 4, agility = 300, exp = 54, level = 30, wildLvl = 300, type = "normal", type2 = "flying"},
["Swellow"] = {offense = 8.5, defense = 6, specialattack = 5, vitality = 6, agility = 300, exp = 159, level = 80, wildLvl = 300, type = "normal", type2 = "flying"},
["Wingull"] = {offense = 3, defense = 3, specialattack = 5.5, vitality = 4, agility = 300, exp = 54, level = 30, wildLvl = 300, type = "water", type2 = "flying"},
["Pelipper"] = {offense = 5, defense = 10, specialattack = 8.5, vitality = 6, agility = 300, exp = 154, level = 80, wildLvl = 300, type = "water", type2 = "flying"},
["Ralts"] = {offense = 2.5, defense = 2.5, specialattack = 4.5, vitality = 2.8, agility = 300, exp = 40, level = 30, wildLvl = 300, type = "psychic", type2 = "fairy"},
["Kirlia"] = {offense = 3.5, defense = 3.5, specialattack = 6.5, vitality = 3.8, agility = 300, exp = 97, level = 60, wildLvl = 300, type = "psychic", type2 = "fairy"},
["Gardevoir"] = {offense = 6.5, defense = 6.5, specialattack = 12.5, vitality = 6.8, agility = 300, exp = 233, level = 100, wildLvl = 300, type = "psychic", type2 = "fairy"},
["Surskit"] = {offense = 3, defense = 3.2, specialattack = 5, vitality = 4, agility = 300, exp = 54, level = 20, wildLvl = 300, type = "bug", type2 = "water"},
["Masquerain"] = {offense = 6, defense = 6.2, specialattack = 8, vitality = 7, agility = 300, exp = 159, level = 50, wildLvl = 300, type = "bug", type2 = "flying"},
["Shroomish"] = {offense = 4, defense = 6, specialattack = 4, vitality = 6, agility = 300, exp = 59, level = 20, wildLvl = 300, type = "grass", type2 = "no type"},
["Breloom"] = {offense = 13, defense = 8, specialattack = 6, vitality = 6, agility = 300, exp = 161, level = 80, wildLvl = 300, type = "grass", type2 = "fighting"},
["Slakoth"] = {offense = 6, defense = 6, specialattack = 3.5, vitality = 6, agility = 300, exp = 56, level = 40, wildLvl = 300, type = "normal", type2 = "no type"},
["Vigoroth"] = {offense = 8, defense = 8, specialattack = 5.5, vitality = 8, agility = 300, exp = 154, level = 70, wildLvl = 300, type = "normal", type2 = "no type"},
["Slaking"] = {offense = 16, defense = 10, specialattack = 9.5, vitality = 15, agility = 300, exp = 252, level = 100, wildLvl = 300, type = "normal", type2 = "no type"},
["Nincada"] = {offense = 4.5, defense = 9, specialattack = 3, vitality = 3.1, agility = 300, exp = 53, level = 10, wildLvl = 300, type = "bug", type2 = "ground"},
["Ninjask"] = {offense = 9, defense = 4.5, specialattack = 5, vitality = 6.1, agility = 300, exp = 160, level = 80, wildLvl = 300, type = "bug", type2 = "flying"},
["Shedinja"] = {offense = 9, defense = 4.5, specialattack = 3, vitality = 0.1, agility = 300, exp = 83, level = 60, wildLvl = 300, type = "bug", type2 = "ghost"},
["Whismur"] = {offense = 5.1, defense = 2.3, specialattack = 5.1, vitality = 6.4, agility = 300, exp = 48, level = 20, wildLvl = 300, type = "normal", type2 = "no type"},
["Loudred"] = {offense = 7.1, defense = 4.3, specialattack = 7.1, vitality = 8.4, agility = 300, exp = 126, level = 50, wildLvl = 300, type = "normal", type2 = "no type"},
["Exploud"] = {offense = 9.1, defense = 6.3, specialattack = 9.1, vitality = 10.4, agility = 300, exp = 221, level = 80, wildLvl = 300, type = "normal", type2 = "no type"},
["Makuhita"] = {offense = 6, defense = 3, specialattack = 2, vitality = 7.2, agility = 300, exp = 47, level = 40, wildLvl = 300, type = "fighting", type2 = "no type"},
["Hariyama"] = {offense = 12, defense = 6, specialattack = 4, vitality = 14.4, agility = 300, exp = 166, level = 100, wildLvl = 300, type = "fighting", type2 = "no type"},
["Azurill"] = {offense = 2, defense = 4, specialattack = 2, vitality = 5, agility = 300, exp = 38, level = 100, wildLvl = 300, type = "normal", type2 = "fairy"},
["Nosepass"] = {offense = 4.5, defense = 13.5, specialattack = 4.5, vitality = 3, agility = 300, exp = 75, level = 40, wildLvl = 300, type = "rock", type2 = "no type"},
["Skitty"] = {offense = 4.5, defense = 4.5, specialattack = 3.5, vitality = 5, agility = 300, exp = 52, level = 100, wildLvl = 300, type = "normal", type2 = "no type"},
["Delcatty"] = {offense = 6.5, defense = 6.5, specialattack = 5.5, vitality = 7, agility = 300, exp = 140, level = 100, wildLvl = 300, type = "normal", type2 = "no type"},
["Sableye"] = {offense = 7.5, defense = 7.5, specialattack = 6.5, vitality = 5, agility = 300, exp = 133, level = 60, wildLvl = 300, type = "dark", type2 = "ghost"},
["Mawile"] = {offense = 8.5, defense = 8.5, specialattack = 5.5, vitality = 5, agility = 300, exp = 133, level = 80, wildLvl = 300, type = "steel", type2 = "fairy"},
["Aron"] = {offense = 7, defense = 10, specialattack = 4, vitality = 5, agility = 300, exp = 66, level = 30, wildLvl = 300, type = "steel", type2 = "rock"},
["Lairon"] = {offense = 9, defense = 14, specialattack = 5, vitality = 6, agility = 300, exp = 151, level = 60, wildLvl = 300, type = "steel", type2 = "rock"},
["Aggron"] = {offense = 11, defense = 18, specialattack = 6, vitality = 7, agility = 300, exp = 239, level = 100, wildLvl = 300, type = "steel", type2 = "no type"},
["Meditite"] = {offense = 4, defense = 5.5, specialattack = 4, vitality = 3, agility = 300, exp = 56, level = 30, wildLvl = 300, type = "fighting", type2 = "psychic"},
["Medicham"] = {offense = 6, defense = 7.5, specialattack = 6, vitality = 6, agility = 300, exp = 144, level = 80, wildLvl = 300, type = "fighting", type2 = "psychic"},
["Electrike"] = {offense = 4.5, defense = 4, specialattack = 6.5, vitality = 4, agility = 300, exp = 59, level = 30, wildLvl = 300, type = "electric", type2 = "no type"},
["Manectric"] = {offense = 7.5, defense = 6, specialattack = 10.5, vitality = 7, agility = 300, exp = 166, level = 80, wildLvl = 300, type = "electric", type2 = "no type"},
["Plusle"] = {offense = 5, defense = 4, specialattack = 8.5, vitality = 6, agility = 300, exp = 142, level = 30, wildLvl = 300, type = "electric", type2 = "no type"},
["Minun"] = {offense = 4, defense = 5, specialattack = 7.5, vitality = 6, agility = 300, exp = 142, level = 30, wildLvl = 300, type = "electric", type2 = "no type"},
["Volbeat"] = {offense = 7.3, defense = 5.5, specialattack = 4.7, vitality = 6.5, agility = 300, exp = 151, level = 100, wildLvl = 300, type = "bug", type2 = "no type"},
["Illumise"] = {offense = 4.7, defense = 5.5, specialattack = 7.3, vitality = 6.5, agility = 300, exp = 151, level = 100, wildLvl = 300, type = "bug", type2 = "no type"},
["Roselia"] = {offense = 6, defense = 4.5, specialattack = 10, vitality = 5, agility = 300, exp = 140, level = 70, wildLvl = 300, type = "grass", type2 = "poison"},
["Gulpin"] = {offense = 4.3, defense = 5.3, specialattack = 4.3, vitality = 7, agility = 300, exp = 60, level = 100, wildLvl = 300, type = "poison", type2 = "no type"},
["Swalot"] = {offense = 7.3, defense = 8.3, specialattack = 7.3, vitality = 10, agility = 300, exp = 163, level = 100, wildLvl = 300, type = "poison", type2 = "no type"},
["Carvanha"] = {offense = 9, defense = 2, specialattack = 6.5, vitality = 4.5, agility = 300, exp = 61, level = 20, wildLvl = 300, type = "water", type2 = "dark"},
["Sharpedo"] = {offense = 12, defense = 4, specialattack = 9.5, vitality = 7, agility = 300, exp = 161, level = 80, wildLvl = 300, type = "water", type2 = "dark"},
["Wailmer"] = {offense = 7, defense = 3.5, specialattack = 7, vitality = 13, agility = 300, exp = 80, level = 100, wildLvl = 300, type = "water", type2 = "no type"},
["Wailord"] = {offense = 9, defense = 4.5, specialattack = 9, vitality = 17, agility = 300, exp = 175, level = 100, wildLvl = 300, type = "water", type2 = "no type"},
["Numel"] = {offense = 6, defense = 4, specialattack = 6.5, vitality = 6, agility = 300, exp = 61, level = 30, wildLvl = 300, type = "fire", type2 = "ground"},
["Camerupt"] = {offense = 10, defense = 7, specialattack = 10.5, vitality = 7, agility = 300, exp = 161, level = 40, wildLvl = 300, type = "fire", type2 = "ground"},
["Torkoal"] = {offense = 8.5, defense = 14, specialattack = 8.5, vitality = 7, agility = 300, exp = 165, level = 100, wildLvl = 300, type = "fire", type2 = "no type"},
["Spoink"] = {offense = 2.5, defense = 3.5, specialattack = 7, vitality = 6, agility = 300, exp = 66, level = 30, wildLvl = 300, type = "psychic", type2 = "no type"},
["Grumpig"] = {offense = 4.5, defense = 6.5, specialattack = 9, vitality = 8, agility = 300, exp = 165, level = 80, wildLvl = 300, type = "psychic", type2 = "no type"},
["Spinda"] = {offense = 6, defense = 6, specialattack = 6, vitality = 6, agility = 300, exp = 126, level = 100, wildLvl = 300, type = "normal", type2 = "no type"},
["Trapinch"] = {offense = 10, defense = 4.5, specialattack = 4.5, vitality = 4.5, agility = 300, exp = 58, level = 20, wildLvl = 300, type = "ground", type2 = "no type"},
["Vibrava"] = {offense = 7, defense = 5, specialattack = 5, vitality = 5, agility = 300, exp = 119, level = 50, wildLvl = 300, type = "ground", type2 = "dragon"},
["Flygon"] = {offense = 10, defense = 8, specialattack = 8, vitality = 8, agility = 300, exp = 234, level = 80, wildLvl = 300, type = "ground", type2 = "dragon"},
["Cacnea"] = {offense = 8.5, defense = 4, specialattack = 8.5, vitality = 5, agility = 300, exp = 67, level = 100, wildLvl = 300, type = "grass", type2 = "no type"},
["Cacturn"] = {offense = 11.5, defense = 6, specialattack = 11.5, vitality = 7, agility = 300, exp = 166, level = 100, wildLvl = 300, type = "grass", type2 = "dark"},
["Swablu"] = {offense = 4, defense = 6, specialattack = 4, vitality = 4.5, agility = 300, exp = 62, level = 30, wildLvl = 300, type = "normal", type2 = "flying"},
["Altaria"] = {offense = 7, defense = 9, specialattack = 7, vitality = 7.5, agility = 300, exp = 172, level = 80, wildLvl = 300, type = "dragon", type2 = "flying"},
["Zangoose"] = {offense = 11.5, defense = 6, specialattack = 6, vitality = 7.3, agility = 300, exp = 160, level = 80, wildLvl = 300, type = "normal", type2 = "no type"},
["Seviper"] = {offense = 10, defense = 6, specialattack = 10, vitality = 7.3, agility = 300, exp = 160, level = 80, wildLvl = 300, type = "poison", type2 = "no type"},
["Lunatone"] = {offense = 5.5, defense = 6.5, specialattack = 9.5, vitality = 7, agility = 300, exp = 161, level = 60, wildLvl = 300, type = "rock", type2 = "psychic"},
["Solrock"] = {offense = 9.5, defense = 8.5, specialattack = 5.5, vitality = 7, agility = 300, exp = 161, level = 60, wildLvl = 300, type = "rock", type2 = "psychic"},
["Barboach"] = {offense = 4.8, defense = 4.3, specialattack = 4.6, vitality = 5, agility = 300, exp = 58, level = 40, wildLvl = 300, type = "water", type2 = "ground"},
["Whiscash"] = {offense = 7.8, defense = 7.3, specialattack = 7.6, vitality = 11, agility = 300, exp = 164, level = 80, wildLvl = 300, type = "water", type2 = "ground"},
["Corphish"] = {offense = 8, defense = 6.5, specialattack = 5, vitality = 4.3, agility = 300, exp = 62, level = 30, wildLvl = 300, type = "water", type2 = "no type"},
["Crawdaunt"] = {offense = 12, defense = 8.5, specialattack = 9, vitality = 6.3, agility = 300, exp = 164, level = 80, wildLvl = 300, type = "water", type2 = "dark"},
["Baltoy"] = {offense = 4, defense = 5.5, specialattack = 4, vitality = 4, agility = 300, exp = 60, level = 30, wildLvl = 300, type = "ground", type2 = "psychic"},
["Claydol"] = {offense = 7, defense = 10.5, specialattack = 7, vitality = 6, agility = 300, exp = 175, level = 80, wildLvl = 300, type = "ground", type2 = "psychic"},
["Lileep"] = {offense = 4.1, defense = 7.7, specialattack = 6.1, vitality = 6.6, agility = 300, exp = 71, level = 20, wildLvl = 300, type = "rock", type2 = "grass"},
["Cradily"] = {offense = 8.1, defense = 9.7, specialattack = 8.1, vitality = 8.6, agility = 300, exp = 173, level = 100, wildLvl = 300, type = "rock", type2 = "grass"},
["Anorith"] = {offense = 9.5, defense = 5, specialattack = 4, vitality = 4.5, agility = 300, exp = 71, level = 20, wildLvl = 300, type = "rock", type2 = "bug"},
["Armaldo"] = {offense = 12.5, defense = 10, specialattack = 7, vitality = 7.5, agility = 300, exp = 173, level = 100, wildLvl = 300, type = "rock", type2 = "bug"},
["Feebas"] = {offense = 1.5, defense = 2, specialattack = 1, vitality = 2, agility = 300, exp = 40, level = 10, wildLvl = 300, type = "water", type2 = "no type"},
["Milotic"] = {offense = 6, defense = 79, specialattack = 10, vitality = 6, agility = 300, exp = 189, level = 100, wildLvl = 300, type = "water", type2 = "no type"},
["Castform"] = {offense = 7, defense = 7, specialattack = 7, vitality = 4.4, agility = 300, exp = 147, level = 100, wildLvl = 300, type = "normal", type2 = "no type"},
["Kecleon"] = {offense = 9, defense = 7, specialattack = 6, vitality = 6, agility = 300, exp = 154, level = 80, wildLvl = 300, type = "normal", type2 = "no type"},
["Shuppet"] = {offense = 7.5, defense = 3.5, specialattack = 6.3, vitality = 4.4, agility = 300, exp = 59, level = 30, wildLvl = 300, type = "ghost", type2 = "no type"},
["Banette"] = {offense = 11.5, defense = 6.5, specialattack = 8.3, vitality = 6.4, agility = 300, exp = 159, level = 80, wildLvl = 300, type = "ghost", type2 = "no type"},
["Duskull"] = {offense = 4, defense = 9, specialattack = 3, vitality = 2, agility = 300, exp = 59, level = 40, wildLvl = 300, type = "ghost", type2 = "no type"},
["Dusclops"] = {offense = 7, defense = 13, specialattack = 6, vitality = 4, agility = 300, exp = 159, level = 70, wildLvl = 300, type = "ghost", type2 = "no type"},
["Tropius"] = {offense = 6.8, defense = 8.3, specialattack = 7.2, vitality = 9.9, agility = 300, exp = 161, level = 100, wildLvl = 300, type = "grass", type2 = "flying"},
["Chimecho"] = {offense = 5, defense = 7, specialattack = 9.5, vitality = 6.5, agility = 300, exp = 159, level = 100, wildLvl = 300, type = "psychic", type2 = "no type"},
["Absol"] = {offense = 13, defense = 6, specialattack = 7.5, vitality = 6.5, agility = 300, exp = 163, level = 100, wildLvl = 300, type = "dark", type2 = "no type"},
["Wynaut"] = {offense = 2.3, defense = 4.8, specialattack = 2.3, vitality = 9.5, agility = 300, exp = 52, level = 70, wildLvl = 300, type = "psychic", type2 = "no type"},
["Snorunt"] = {offense = 5, defense = 5, specialattack = 5, vitality = 5, agility = 300, exp = 60, level = 30, wildLvl = 300, type = "ice", type2 = "no type"},
["Glalie"] = {offense = 8, defense = 8, specialattack = 8, vitality = 8, agility = 300, exp = 168, level = 80, wildLvl = 300, type = "ice", type2 = "no type"},
["Spheal"] = {offense = 4, defense = 5, specialattack = 5.5, vitality = 7, agility = 300, exp = 58, level = 30, wildLvl = 300, type = "ice", type2 = "water"},
["Sealeo"] = {offense = 6, defense = 7, specialattack = 7.5, vitality = 9, agility = 300, exp = 144, level = 60, wildLvl = 300, type = "ice", type2 = "water"},
["Walrein"] = {offense = 8, defense = 9, specialattack = 9.5, vitality = 11, agility = 300, exp = 239, level = 100, wildLvl = 300, type = "ice", type2 = "water"},
["Clamperl"] = {offense = 6.4, defense = 8.5, specialattack = 7.4, vitality = 3.5, agility = 300, exp = 69, level = 100, wildLvl = 300, type = "water", type2 = "no type"},
["Huntail"] = {offense = 10.4, defense = 10.5, specialattack = 9.4, vitality = 5.5, agility = 300, exp = 170, level = 100, wildLvl = 300, type = "water", type2 = "no type"},
["Gorebyss"] = {offense = 8.4, defense = 10.5, specialattack = 11.4, vitality = 5.5, agility = 300, exp = 170, level = 100, wildLvl = 300, type = "water", type2 = "no type"},
["Relicanth"] = {offense = 9, defense = 13, specialattack = 4.5, vitality = 10, agility = 300, exp = 170, level = 100, wildLvl = 300, type = "water", type2 = "rock"},
["Luvdisc"] = {offense = 3, defense = 5.5, specialattack = 4, vitality = 4.3, agility = 300, exp = 116, level = 100, wildLvl = 300, type = "water", type2 = "no type"},
["Bagon"] = {offense = 7.5, defense = 6, specialattack = 4, vitality = 4.5, agility = 300, exp = 60, level = 40, wildLvl = 300, type = "dragon", type2 = "no type"},
["Shelgon"] = {offense = 9.5, defense = 10, specialattack = 6, vitality = 6.5, agility = 300, exp = 40, level = 70, wildLvl = 300, type = "dragon", type2 = "no type"},
["Salamence"] = {offense = 13.5, defense = 8, specialattack = 11, vitality = 9.5, agility = 300, exp = 270, level = 100, wildLvl = 300, type = "dragon", type2 = "flying"},
["Beldum"] = {offense = 5.5, defense = 8, specialattack = 3.5, vitality = 4, agility = 300, exp = 60, level = 50, wildLvl = 300, type = "steel", type2 = "psychic"},
["Metang"] = {offense = 7.5, defense = 10, specialattack = 5.5, vitality = 6, agility = 300, exp = 147, level = 80, wildLvl = 300, type = "steel", type2 = "psychic"},
["Metagross"] = {offense = 13.5, defense = 13, specialattack = 9.5, vitality = 8, agility = 300, exp = 270, level = 100, wildLvl = 300, type = "steel", type2 = "psychic"},
["Regirock"] = {offense = 10, defense = 20, specialattack = 5, vitality = 8, agility = 300, exp = 261, level = 1000, wildLvl = 300, type = "rock", type2 = "no type"},
["Regice"] = {offense = 5, defense = 10, specialattack = 10, vitality = 8, agility = 300, exp = 261, level = 1000, wildLvl = 300, type = "ice", type2 = "no type"},
["Registeel"] = {offense = 7.5, defense = 15, specialattack = 7.5, vitality = 8, agility = 300, exp = 261, level = 1000, wildLvl = 300, type = "steel", type2 = "no type"},
["Latias"] = {offense = 8, defense = 9, specialattack = 11, vitality = 8, agility = 300, exp = 270, level = 1000, wildLvl = 300, type = "dragon", type2 = "psychic"},
["Latios"] = {offense = 9, defense = 8, specialattack = 13, vitality = 8, agility = 300, exp = 270, level = 1000, wildLvl = 300, type = "dragon", type2 = "psychic"},
["Kyogre"] = {offense = 10, defense = 9, specialattack = 15, vitality = 10, agility = 300, exp = 302, level = 1000, wildLvl = 300, type = "water", type2 = "no type"},
["Groudon"] = {offense = 15, defense = 14, specialattack = 10, vitality = 10, agility = 300, exp = 302, level = 1000, wildLvl = 300, type = "ground", type2 = "fire"},
["Rayquaza"] = {offense = 15, defense = 9, specialattack = 15, vitality = 10.5, agility = 300, exp = 306, level = 1000, wildLvl = 300, type = "dragon", type2 = "flying"},
["Jirachi"] = {offense = 10, defense = 10, specialattack = 10, vitality = 10, agility = 300, exp = 270, level = 1000, wildLvl = 300, type = "steel", type2 = "psychic"},
["Deoxys"] = {offense = 15, defense = 5, specialattack = 15, vitality = 5, agility = 300, exp = 270, level = 1000, wildLvl = 300, type = "psychic", type2 = "no type"},

['Lucario'] = {offense = 3, defense = 7, specialattack = 8.5, life = 1800, vitality = 7.5, agility = 200, exp = 245, level = 60, wildLvl = 2, type = 'fighting', type2 = 'steel'},
['Shiny Lucario'] = {offense = 3, defense = 11, specialattack = 8.5, life = 1800, vitality = 7.5, agility = 200, exp = 245, level = 60, wildLvl = 5, type = 'fighting', type2 = 'steel'},
 
-- Venom Quests 
["V.Shiny Muk"] = {offense = 5, defense = 10, specialattack = 9, vitality = 18, agility = 300, exp = 93, level = 100, wildLvl = 600, type = "poison", type2 = "no type"},
["V.Shiny Grimer"] = {offense = 5.3, defense = 8, specialattack = 8, vitality = 17, agility = 300, exp = 42, level = 100, wildLvl = 500, type = "poison", type2 = "no type"},

-- <!-- Mixlort Balanceamento Novo -->
["V.Koffing"] = {offense = 4.3, defense = 7, specialattack = 7, vitality = 15, agility = 300, exp = 42, level = 100, wildLvl = 400, type = "poison", type2 = "no type"},
["V.Weezing"] = {offense = 6, defense = 7.5, specialattack = 7.5, vitality = 15, agility = 300, exp = 100, level = 100, wildLvl = 400, type = "poison", type2 = "no type"},
["V.Arbok"] = {offense = 5.6, defense = 7.5, specialattack = 7.5, vitality = 15, agility = 300, exp = 100, level = 100, wildLvl = 400, type = "poison", type2 = "no type"},
["V.Grimer"] = {offense = 5.3, defense = 7, specialattack = 7, vitality = 15, agility = 300, exp = 42, level = 100, wildLvl = 400, type = "poison", type2 = "no type"},

-- ["V.Koffing"] = {offense = 2.2, defense = 7, specialattack = 3.5, vitality =15, agility = 300, exp = 42, level = 100, wildLvl = 400, type = "poison", type2 = "no type"},
-- ["V.Weezing"] = {offense = 3, defense = 7.5, specialattack = 3.7, vitality = 15, agility = 300, exp = 100, level = 100, wildLvl = 400, type = "poison", type2 = "no type"},
-- ["V.Arbok"] = {offense = 2.8, defense = 7.5, specialattack = 3.7, vitality = 15, agility = 300, exp = 100, level = 100, wildLvl = 400, type = "poison", type2 = "no type"},
-- ["V.Grimer"] = {offense = 2.6, defense = 7, specialattack = 3.5, vitality = 15, agility = 300, exp = 42, level = 100, wildLvl = 400, type = "poison", type2 = "no type"},

-- Thrones Quest
["T.Abra"] = {offense = 2, defense = 1.5, specialattack = 10.5, vitality = 2.5, agility = 300, exp = 62, level = 500, wildLvl = 500, type = "psychic", type2 = "no type"},
["T.Kadabra"] = {offense = 3.5, defense = 3, specialattack = 12, vitality = 4, agility = 300, exp = 140, level = 500, wildLvl = 500, type = "psychic", type2 = "no type"},
["T.Alakazam"] = {offense = 5, defense = 4.5, specialattack = 13.5, vitality = 5.5, agility = 300, exp = 225, level = 500, wildLvl = 500, type = "psychic", type2 = "no type"},
["T.Hypno"] = {offense = 7.3, defense = 7, specialattack = 7.3, vitality = 8.5, agility = 300, exp = 169, level = 500, wildLvl = 500, type = "psychic", type2 = "no type"},
["T.Arcanine"] = {offense = 11, defense = 8, specialattack = 10, vitality = 9, agility = 350, exp = 194, level = 500, wildLvl = 500, type = "fire", type2 = "no type"},
["T.Ariados"] = {offense = 9, defense = 7, specialattack = 6, vitality = 7, agility = 250, exp = 140, level = 500, wildLvl = 500, type = "bug", type2 = "poison"},
["T.Gastly"] = {offense = 3.5, defense = 3, specialattack = 10, vitality = 3, agility = 300, exp = 62, level = 500, wildLvl = 500, type = "ghost", type2 = "poison"},
["T.Haunter"] = {offense = 5, defense = 4.5, specialattack = 11.5, vitality = 4.5, agility = 300, exp = 142, level = 500, wildLvl = 500, type = "ghost", type2 = "poison"},
["T.Gengar"] = {offense = 6.5, defense = 6, specialattack = 13.0, vitality = 6, agility = 300, exp = 225, level = 500, wildLvl = 500, type = "ghost", type2 = "poison"},
["T.Misdreavus"] = {offense = 6, defense = 6, specialattack = 8.5, vitality = 6, agility = 200, exp = 87, level = 500, wildLvl = 500, type = "ghost", type2 = "no type"},
["T.Umbreon"] = {offense = 6.5, defense = 11, specialattack = 6, vitality = 9.5, agility = 230, exp = 184, level = 500, wildLvl = 500, type = "dark", type2 = "no type"},
["T.Larvitar"] = {offense = 0.9, defense = 5, specialattack = 4.5, vitality = 5, agility = 200, exp = 67, level = 500, wildLvl = 500, type = "rock", type2 = "ground"},
["T.Sudowoodo"] = {offense = 1.9, defense = 10, specialattack = 7.5, vitality = 8.8, agility = 200, exp = 500, level = 500, wildLvl = 500, type = "rock", type2 = "no type"},
["T.Tyranitar"] = {offense = 2.1, defense = 10, specialattack = 7.5, vitality = 10.2, agility = 200, exp = 500, level = 500, wildLvl = 500, type = "rock", type2 = "dark"},
["T.Rhydon"] = {offense = 8.6, defense = 8, specialattack = 6.5, vitality = 9, agility = 300, exp = 150, level = 500, wildLvl = 500, type = "ground", type2 = "rock"},
["T.Rhyhorn"] = {offense = 5.6, defense = 6.3, specialattack = 2, vitality = 4.4, agility = 300, exp = 83, level = 500, wildLvl = 500, type = "ground", type2 = "rock"},
["T.Marowak"] = {offense = 5.3, defense = 7.3, specialattack = 6.3, vitality = 7.5, agility = 300, exp = 100, level = 500, wildLvl = 500, type = "ground", type2 = "no type"},
["T.Onix"] = {offense = 3, defense = 7.6, specialattack = 5, vitality = 6, agility = 300, exp = 107, level = 500, wildLvl = 500, type = "rock", type2 = "ground"},
["T.Golem"] = {offense = 7.3, defense = 8.6, specialattack = 3.6, vitality = 8.4, agility = 300, exp = 150, level = 500, wildLvl = 500, type = "ground", type2 = "rock"},
["T.Steelix"] = {offense = 2.1, defense = 10, specialattack = 7.5, vitality = 9.9, agility = 220, exp = 500, level = 500, wildLvl = 500, type = "steel", type2 = "ground"},
["T.Houndoom"] = {offense = 1.9, defense = 6, specialattack = 7.5, vitality = 8.5, agility = 300, exp = 204, level = 500, wildLvl = 500, type = "dark", type2 = "fire"},
["T.Typhlosion"] = {offense = 1.9, defense = 9, specialattack = 7.5, vitality = 10.9, agility = 200, exp = 210, level = 500, wildLvl = 500, type = "fire", type2 = "no type"},
["T.Magcargo"] = {offense = 1.2, defense = 12, specialattack = 7.5, vitality = 5, agility = 200, exp = 154, level = 500, wildLvl = 500, type = "fire", type2 = "rock"},
["T.Crobat"] = {offense = 1.9, defense = 8, specialattack = 7, vitality = 8.5, agility = 300, exp = 204, level = 500, wildLvl = 500, type = "poison", type2 = "flying"},
["T.Meganium"] = {offense = 1.9, defense = 10, specialattack = 7.5, vitality = 10.5, agility = 200, exp = 210, level = 500, wildLvl = 500, type = "grass", type2 = "no type"},
["T.Muk"] = {offense = 7, defense = 6.6, specialattack = 4.3, vitality = 8, agility = 300, exp = 150, level = 500, wildLvl = 500, type = "poison", type2 = "no type"},
["T.Vileplume"] = {offense = 5.3, defense = 6, specialattack = 6.6, vitality = 7.7, agility = 300, exp = 100, level = 500, wildLvl = 500, type = "grass", type2 = "poison"},

------

["T.Shiny Marowak"] = {offense = 2.2, defense = 10, specialattack = 11, vitality = 15.6, agility = 200, exp = 136.4, level = 900, wildLvl = 900, type = "ground", type2 = "no type"},
["T.Shiny Cubone"] = {offense = 0.9, defense = 8, specialattack = 4.4, vitality = 8.5, agility = 190, exp = 95.7, level = 900, wildLvl = 900, type = "ground", type2 = "no type"},
["T.Shiny Onix"] = {offense = 2.2, defense = 8.6, specialattack = 11, vitality = 15.1, agility = 200, exp = 800, level = 900, wildLvl = 900, type = "rock", type2 = "ground"},
["T.Shiny Golem"] = {offense = 1.9, defense = 14.3, specialattack = 11, vitality = 8.9, agility = 200, exp = 194.7, level = 900, wildLvl = 900, type = "rock", type2 = "ground"},
["T.Shiny Typhlosion"] = {offense = 1.9, defense = 9, specialattack = 11, vitality = 14.2, agility = 230, exp = 217.8, level = 900, wildLvl = 900, type = "fire", type2 = "no type"},
["T.Shiny Magmar"] = {offense = 2.1, defense = 11, specialattack = 11, vitality = 14.2, agility = 200, exp = 2150, level = 900, wildLvl = 900, type = "fire", type2 = "no type"},
["T.Shiny Arcanine"] = {offense = 2.1, defense = 8.8, specialattack = 11, vitality = 14.7, agility = 450, exp = 900, level = 900, wildLvl = 900, type = "fire", type2 = "no type"},
--["T.Shiny Charizard"] = {offense = 2.3, defense = 9, specialattack = 11, vitality = 14, agility = 210, exp = 1050, level = 900, wildLvl = 900, type = "fire", type2 = "flying"},
["T.Shiny Charizard"] = {offense = 2.3, defense = 9, specialattack = 11, vitality = 14, agility = 210, exp = 1050, level = 900, wildLvl = 900, type = "fire", type2 = "flying"},
["T.Magmar"] = {offense = 3.3, defense = 5.6, specialattack = 6.6, vitality = 9.2, agility = 300, exp = 150, level = 900, wildLvl = 900, type = "fire", type2 = "no type"},
["T.Charizard"] = {offense = 5.6, defense = 5.6, specialattack = 5.26, vitality = 8.1, agility = 300, exp = 150, level = 900, wildLvl = 900, type = "fire", type2 = "flying"},
["T.Charmeleon"] = {offense = 4.26, defense = 4.3, specialattack = 5.3, vitality = 6.2, agility = 300, exp = 100, level = 900, wildLvl = 900, type = "fire", type2 = "no type"},
-------
["T.Shiny Crobat"] = {offense = 2.9, defense = 10, specialattack = 11, vitality = 14.2, agility = 200, exp = 2555, level = 900, wildLvl = 900, type = "poison", type2 = "flying"},
["T.Shiny Vileplume"] = {offense = 2.1, defense = 10, specialattack = 11, vitality = 13.1, agility = 210, exp = 1000, level = 900, wildLvl = 900, type = "grass", type2 = "poison"},
["T.Shiny Meganium"] = {offense = 5, defense = 8, specialattack = 11, vitality = 14.6, agility = 280, exp = 3000, level = 900, wildLvl = 900, type = "grass", type2 = "no type"},
--["T.Shiny Crobat"] = {offense = 2.9, defense = 10, specialattack = 11, vitality = 14.2, agility = 200, exp = 2555, level = 900, wildLvl = 900, type = "poison", type2 = "flying"},
["T.Shiny Pinsir"] = {offense = 2.2, defense = 12, specialattack = 10, vitality = 16, agility = 210, exp = 220, level = 900, wildLvl = 900, type = "bug", type2 = "no type"},
["T.Shiny Muk"] = {offense = 2.2, defense = 9.1, specialattack = 11, vitality = 15.2, agility = 200, exp = 172.7, level = 900, wildLvl = 900, type = "poison", type2 = "no type"},
["T.Shiny Golbat"] = {offense = 1.2, defense = 8, specialattack = 6, vitality = 10.25, agility = 230, exp = 188.1, level = 900, wildLvl = 900, type = "poison", type2 = "flying"},
["T.Shiny Pinsir"] = {offense = 2.2, defense = 12, specialattack = 10, vitality = 16, agility = 210, exp = 220, level = 900, wildLvl = 900, type = "bug", type2 = "no type"},
["T.Shiny Umbreon"] = {offense = 6.5, defense = 11, specialattack = 6, vitality = 9.5, agility = 230, exp = 184, level = 900, wildLvl = 900, type = "dark", type2 = "no type"},
["T.Shiny Xatu"] = {offense = 4, defense = 9, specialattack = 11, vitality = 14.2, agility = 270, exp = 2340, level = 900, wildLvl = 900, type = "psychic", type2 = "flying"},
["T.Shiny Alakazam"] = {offense = 5, defense = 4.5, specialattack = 13.5, vitality = 5.5, agility = 300, exp = 225, level = 900, wildLvl = 900, type = "psychic", type2 = "no type"},
["T.Shiny Mr. Mime"] = {offense = 4.5, defense = 6.5, specialattack = 10, vitality = 4, agility = 300, exp = 161, level = 900, wildLvl = 900, type = "psychic", type2 = "no type"},
["T.Shiny Ariados"] = {offense = 9, defense = 7, specialattack = 6, vitality = 7, agility = 250, exp = 140, level = 900, wildLvl = 900, type = "bug", type2 = "poison"},
["T.Shiny Gengar"] = {offense = 6.5, defense = 6, specialattack = 13.0, vitality = 6, agility = 300, exp = 225, level = 900, wildLvl = 900, type = "ghost", type2 = "poison"},

-------
-- Castle Quest
["C.Mantine"] = {offense = 1.9, defense = 7, specialattack = 7.5, vitality = 10.1, agility = 200, exp = 200, level = 80, wildLvl = 90, type = "water", type2 = "flying"},
["C.Feraligatr"] = {offense = 1.9, defense = 10, specialattack = 7.5, vitality = 10.5, agility = 200, exp = 210, level = 85, wildLvl = 95, type = "water", type2 = "no type"},
["C.Gyarados"] = {offense = 8.3, defense = 6.6, specialattack = 7.5, vitality = 10, agility = 300, exp = 150, level = 100, wildLvl = 100, type = "water", type2 = "flying"},
["C.Tentacruel"] = {offense = 4.6, defense = 8, specialattack = 5.3, vitality = 8.4, agility = 300, exp = 150, level = 80, wildLvl = 90, type = "water", type2 = "poison"},
["C.Blastoise"] = {offense = 5.53, defense = 7, specialattack = 5.6, vitality = 8.2, agility = 300, exp = 150, level = 80, wildLvl = 90, type = "water", type2 = "no type"},
---
["C.Charizard"] = {offense = 5.6, defense = 5.6, specialattack = 5.26, vitality = 8.1, agility = 300, exp = 150, level = 80, wildLvl = 90, type = "fire", type2 = "flying"},
["C.Arcanine"] = {offense = 7.3, defense = 5.3, specialattack = 6.6, vitality = 8.8, agility = 350, exp = 150, level = 100, wildLvl = 100, type = "fire", type2 = "no type"},
["C.Magmar"] = {offense = 3.3, defense = 5.6, specialattack = 6.6, vitality = 9.2, agility = 300, exp = 150, level = 100, wildLvl = 100, type = "fire", type2 = "no type"},
["C.Rapidash"] = {offense = 6.6, defense = 5.3, specialattack = 5.3, vitality = 6.2, agility = 300, exp = 100, level = 100, wildLvl = 80, type = "fire", type2 = "no type"},
["C.Typhlosion"] = {offense = 1.9, defense = 9, specialattack = 7.5, vitality = 10.9, agility = 200, exp = 210, level = 85, wildLvl = 95, type = "fire", type2 = "no type"},
---
["C.Steelix"] = {offense = 2.1, defense = 10, specialattack = 7.5, vitality = 9.9, agility = 220, exp = 500, level = 100, wildLvl = 110, type = "steel", type2 = "ground"},
["C.Rhydon"] = {offense = 8.6, defense = 8, specialattack = 6.5, vitality = 9, agility = 300, exp = 150, level = 80, wildLvl = 90, type = "ground", type2 = "rock"},
["C.Onix"] = {offense = 3, defense = 7.6, specialattack = 5, vitality = 6, agility = 300, exp = 107, level = 50, wildLvl = 60, type = "rock", type2 = "ground"},
["C.Golem"] = {offense = 7.3, defense = 8.6, specialattack = 3.6, vitality = 8.4, agility = 300, exp = 150, level = 70, wildLvl = 80, type = "ground", type2 = "rock"},
["C.Sudowoodo"] = {offense = 1.9, defense = 10, specialattack = 7.5, vitality = 8.8, agility = 200, exp = 500, level = 80, wildLvl = 90, type = "rock", type2 = "no type"},
---
["C.Ampharos"] = {offense = 1.9, defense = 7.5, specialattack = 7.5, vitality = 9, agility = 200, exp = 194, level = 85, wildLvl = 95, type = "electric", type2 = "no type"},
["C.Raichu"] = {offense = 6, defense = 5.3, specialattack = 6, vitality = 8, agility = 350, exp = 150, level = 80, wildLvl = 90, type = "electric", type2 = "no type"},
["C.Magneton"] = {offense = 4, defense = 6.3, specialattack = 8, vitality = 7.5, agility = 300, exp = 150, level = 80, wildLvl = 90, type = "electric", type2 = "steel"},
["C.Electabuzz"] = {offense = 3.5, defense = 5.6, specialattack = 6.6, vitality = 8.7, agility = 300, exp = 150, level = 100, wildLvl = 100, type = "electric", type2 = "no type"},
["C.Ampharos"] = {offense = 1.9, defense = 7.5, specialattack = 7.5, vitality = 9, agility = 200, exp = 194, level = 85, wildLvl = 95, type = "electric", type2 = "no type"},

-- First Quest -- 
["F.Charizard"] = {offense = 5.6, defense = 5.6, specialattack = 5.26, vitality = 8.1, agility = 300, exp = 150, level = 80, wildLvl = 90, type = "fire", type2 = "flying"},
["F.Blastoise"] = {offense = 5.53, defense = 7, specialattack = 5.6, vitality = 8.2, agility = 300, exp = 150, level = 80, wildLvl = 90, type = "water", type2 = "no type"},
["F.Venusaur"] = {offense = 5.4, defense = 6.6, specialattack = 6.6, vitality = 8.4, agility = 300, exp = 150, level = 80, wildLvl = 90, type = "grass", type2 = "poison"},

--StatusPokémonOutland
["Elder Electabuzz"] = {offense = 24.9, defense = 17.1, specialattack = 28.5, vitality = 18.5, agility = 450, exp = 540, level = 300, wildLvl = 300, type = "electric", type2 = "no type"},
["Elder Tyranitar"] = {offense = 40.2, defense = 33, specialattack = 28.5, vitality = 30, agility = 300, exp = 810, level = 300, wildLvl = 300, type = "rock", type2 = "dark"},
["Elder Charizard"] = {offense = 25.2, defense = 23.4, specialattack = 32.7, vitality = 23.4, agility = 450, exp = 720, level = 300, wildLvl = 300, type = "fire", type2 = "flying"},
["Undefeated Machamp"] = {offense = 39, defense = 24, specialattack = 19.5, vitality = 27, agility = 4500, exp = 690, level = 300, wildLvl = 300, type = "fight", type2 = "no type"},
["Elder Arcanine"] = {offense = 33, defense = 24, specialattack = 30, vitality = 27, agility = 525, exp = 600, level = 300, wildLvl = 300, type = "fire", type2 = "no type"},
["Elder Dragonite"] = {offense = 40.2, defense = 28.5, specialattack = 30, vitality = 27.3, agility = 450, exp = 810, level = 300, wildLvl = 300, type = "dragon", type2 = "flying"},
["Master Alakazam"] = {offense = 15, defense = 13.5, specialattack = 40.5, vitality = 16.5, agility = 450, exp = 690, level = 300, wildLvl = 300, type = "psychic", type2 = "no type"},
["Elder Pinsir"] = {offense = 37.5, defense = 30, specialattack = 16.5, vitality = 19.5, agility = 500, exp = 540, level = 300, wildLvl = 300, type = "bug", type2 = "no type"},
["Elder Raichu"] = {offense = 27, defense = 16.5, specialattack = 27, vitality = 18, agility = 5250, exp = 660, level = 300, wildLvl = 300, type = "electric", type2 = "no type"},
["Tribal Scyther"] = {offense = 33, defense = 24, specialattack = 16.5, vitality = 21, agility = 525, exp = 300, level = 300, wildLvl = 300, type = "bug", type2 = "flying"},
["Elder Muk"] = {offense = 31.5, defense = 22.5, specialattack = 19.5, vitality = 31.5, agility = 450, exp = 540, level = 300, wildLvl = 300, type = "poison", type2 = "no type"},
["Elder Gengar"] = {offense = 19.5, defense = 18, specialattack = 29.0, vitality = 18, agility = 450, exp = 690, level = 300, wildLvl = 300, type = "ghost", type2 = "poison"},
["Elder Pidgeot"] = {offense = 24, defense = 22.5, specialattack = 21, vitality = 24.9, agility = 525, exp = 660, level = 300, wildLvl = 300, type = "flying", type2 = "normal"},
["Elder Venusaur"] = {offense = 24.3, defense = 24.9, specialattack = 30, vitality = 24, agility = 450, exp = 720, level = 300, wildLvl = 300, type = "grass", type2 = "poison"},
["Elder Jynx"] = {offense = 15, defense = 10.5, specialattack = 34.5, vitality = 19.5, agility = 450, exp = 480, level = 300, wildLvl = 300, type = "psychic", type2 = "ice"},
["Elder Tangela"] = {offense = 16.5, defense = 34.5, specialattack = 30, vitality = 19.5, agility = 450, exp = 270, level = 300, wildLvl = 300, type = "grass", type2 = "no type"},
["Elder Blastoise"] = {offense = 24.9, defense = 30, specialattack = 25.5, vitality = 23.7, agility = 450, exp = 720, level = 300, wildLvl = 300, type = "water", type2 = "no type"},
["Elder Tentacruel"] = {offense = 21, defense = 19.5, specialattack = 24, vitality = 24, agility = 450, exp = 540, level = 300, wildLvl = 300, type = "water", type2 = "poison"},
["Elder Marowak"] = {offense = 24, defense = 33, specialattack = 15, vitality = 18, agility = 450, exp = 450, level = 300, wildLvl = 300, type = "ground", type2 = "no type"},
["Tribal Feraligatr"] = {offense = 31.5, defense = 30, specialattack = 23.7, vitality = 25.5, agility = 300, exp = 720, level = 300, wildLvl = 300, type = "water", type2 = "no type"},
["Tribal Xatu"] = {offense = 22.5, defense = 21, specialattack = 28.5, vitality = 16.5, agility = 450, exp = 510, level = 300, wildLvl = 300, type = "psychic", type2 = "flying"},

------------
["Magnet Electabuzz"] = {offense = 16.6, defense = 11.4, specialattack = 19, vitality = 13, agility = 450, exp = 7200, level = 250, wildLvl = 250, type = "electric", type2 = "no type"},
["Hard Golem"] = {offense = 24, defense = 26, specialattack = 11, vitality = 16, agility = 450, exp = 2600, level = 250, wildLvl = 250, type = "ground", type2 = "rock"},
["Brute Rhydon"] = {offense = 26, defense = 24, specialattack = 9, vitality = 21, agility = 450, exp = 4400, level = 250, wildLvl = 250, type = "ground", type2 = "rock"},
["Iron Steelix"] = {offense = 17, defense = 40, specialattack = 11, vitality = 15, agility = 330, exp = 5600, level = 250, wildLvl = 250, type = "steel", type2 = "ground"},
["Brave Charizard"] = {offense = 16.8, defense = 15.6, specialattack = 21.8, vitality = 15.6, agility = 450, exp = 7200, level = 250, wildLvl = 250, type = "fire", type2 = "flying"},
["Lava Magmar"] = {offense = 19, defense = 11.4, specialattack = 20, vitality = 13, agility = 450, exp = 7200, level = 250, wildLvl = 250, type = "fire", type2 = "no type"},
["Enraged Typhlosion"] = {offense = 16.8, defense = 15.6, specialattack = 21.8, vitality = 15.6, agility = 300, exp = 8000, level = 250, wildLvl = 250, type = "fire", type2 = "no type"},
["Capoeira Hitmontop"] = {offense = 19, defense = 19, specialattack = 7, vitality = 10, agility = 300, exp = 5200, level = 250, wildLvl = 250, type = "fighting", type2 = "no type"},
["Boxer Hitmonchan"] = {offense = 21, defense = 15.8, specialattack = 10, vitality = 10, agility = 350, exp = 5200, level = 250, wildLvl = 250, type = "fight", type2 = "no type"},
["Taekwondo Hitmonlee"] = {offense = 24, defense = 10.6, specialattack = 10, vitality = 10, agility = 450, exp = 5200, level = 250, wildLvl = 250, type = "fight", type2 = "no type"},
["Dragon Machamp"] = {offense = 26, defense = 16, specialattack = 13, vitality = 18, agility = 450, exp = 7200, level = 250, wildLvl = 250, type = "fight", type2 = "no type"},
["Wardog Arcanine"] = {offense = 22, defense = 16, specialattack = 20, vitality = 18, agility = 525, exp = 4400, level = 250, wildLvl = 250, type = "fire", type2 = "no type"},
["Furious Mantine"] = {offense = 8, defense = 14, specialattack = 16, vitality = 13, agility = 300, exp = 5200, level = 250, wildLvl = 250, type = "water", type2 = "flying"},
["War Gyarados"] = {offense = 25, defense = 15.8, specialattack = 12, vitality = 19, agility = 450, exp = 7200, level = 250, wildLvl = 250, type = "water", type2 = "flying"},
["Brave Blastoise"] = {offense = 16.6, defense = 20, specialattack = 17, vitality = 15.8, agility = 450, exp = 7200, level = 250, wildLvl = 250, type = "water", type2 = "no type"},
["Brave Venusaur"] = {offense = 16.4, defense = 16.6, specialattack = 20, vitality = 16, agility = 450, exp = 7200, level = 250, wildLvl = 250, type = "grass", type2 = "poison"},
["Ancient Meganium"] = {offense = 16.4, defense = 20, specialattack = 16.6, vitality = 16, agility = 300, exp = 8000, level = 250, wildLvl = 250, type = "grass", type2 = "no type"},
["Charged Raichu"] = {offense = 18, defense = 11, specialattack = 18, vitality = 12, agility = 525, exp = 6000, level = 250, wildLvl = 250, type = "electric", type2 = "no type"},
["Enigmatic Girafarig"] = {offense = 16, defense = 13, specialattack = 18, vitality = 14, agility = 450, exp = 3400, level = 250, wildLvl = 250, type = "normal", type2 = "psychic"},
["Ancient Alakazam"] = {offense = 10, defense = 9, specialattack = 27, vitality = 11, agility = 450, exp = 4400, level = 250, wildLvl = 250, type = "psychic", type2 = "no type"},
["Furious Ampharos"] = {offense = 15, defense = 17, specialattack = 23, vitality = 18, agility = 300, exp = 3600, level = 250, wildLvl = 250, type = "electric", type2 = "no type"},
["Furious Scyther"] = {offense = 22, defense = 16, specialattack = 11, vitality = 14, agility = 525, exp = 7200, level = 250, wildLvl = 250, type = "bug", type2 = "flying"},
["War Heracross"] = {offense = 25, defense = 15, specialattack = 8, vitality = 16, agility = 300, exp = 7200, level = 250, wildLvl = 250, type = "bug", type2 = "fighting"},
["Metal Scizor"] = {offense = 26, defense = 20, specialattack = 11, vitality = 14, agility = 455, exp = 5800, level = 250, wildLvl = 250, type = "bug", type2 = "steel"},
["Brave Nidoking"] = {offense = 20.4, defense = 15.4, specialattack = 17, vitality = 16.2, agility = 450, exp = 2600, level = 250, wildLvl = 250, type = "poison", type2 = "ground"},
["Brave Nidoqueen"] = {offense = 18.4, defense = 17.4, specialattack = 15, vitality = 18, agility = 450, exp = 2600, level = 250, wildLvl = 250, type = "poison", type2 = "ground"},
["Dark Crobat"] = {offense = 18, defense = 16, specialattack = 14, vitality = 17, agility = 450, exp = 6000, level = 250, wildLvl = 250, type = "poison", type2 = "flying"},
["Trickmaster Gengar"] = {offense = 13, defense = 12, specialattack = 26, vitality = 12, agility = 450, exp = 4400, level = 250, wildLvl = 250, type = "ghost", type2 = "poison"},
["Banshee Misdreavus"] = {offense = 12, defense = 12, specialattack = 17, vitality = 12, agility = 300, exp = 5200, level = 250, wildLvl = 250, type = "ghost", type2 = "no type"},
["Hungry Snorlax"] = {offense = 22, defense = 13, specialattack = 13, vitality = 32, agility = 300, exp = 4400, level = 250, wildLvl = 250, type = "normal", type2 = "no type"},
["Brute Ursaring"] = {offense = 26, defense = 15, specialattack = 15, vitality = 18, agility = 300, exp = 5600, level = 250, wildLvl = 250, type = "normal", type2 = "no type"},
["War Granbull"] = {offense = 24, defense = 15, specialattack = 12, vitality = 18, agility = 300, exp = 3400, level = 250, wildLvl = 250, type = "normal", type2 = "no type"},
["Singer Wigglytuff"] = {offense = 14, defense = 9, specialattack = 17, vitality = 28, agility = 450, exp = 4400, level = 250, wildLvl = 250, type = "normal", type2 = "no type"},
["Aviator Pidgeot"] = {offense = 16, defense = 15, specialattack = 14, vitality = 16.6, agility = 525, exp = 4400, level = 250, wildLvl = 250, type = "flying", type2 = "normal"},
["Metal Skarmory"] = {offense = 16, defense = 28, specialattack = 8, vitality = 13, agility = 450, exp = 5600, level = 250, wildLvl = 250, type = "steel", type2 = "flying"},
["Brave Noctowl"] = {offense = 10, defense = 10, specialattack = 15.2, vitality = 20, agility = 420, exp = 4800, level = 250, wildLvl = 250, type = "normal", type2 = "flying"},
["Ancient Dragonite"] = {offense = 26.8, defense = 19, specialattack = 20, vitality = 18.2, agility = 450, exp = 6000, level = 250, wildLvl = 250, type = "dragon", type2 = "flying"},
["Milch-Miltank"] = {offense = 16, defense = 21, specialattack = 8, vitality = 19, agility = 300, exp = 5600, level = 250, wildLvl = 250, type = "normal", type2 = "no type"},
["Ancient Kingdra"] = {offense = 19, defense = 19, specialattack = 19, vitality = 15, agility = 305, exp = 5200, level = 250, wildLvl = 250, type = "water", type2 = "dragon"},
["Psy Jynx"] = {offense = 10, defense = 7, specialattack = 23, vitality = 13, agility = 400, exp = 4400, level = 250, wildLvl = 250, type = "psychic", type2 = "ice"},
["Evil Cloyster"] = {offense = 19, defense = 36, specialattack = 17, vitality = 10, agility = 400, exp = 3600, level = 250, wildLvl = 250, type = "water", type2 = "ice"},
["Freezing Dewgong"] = {offense = 14, defense = 16, specialattack = 14, vitality = 18, agility = 450, exp = 3600, level = 250, wildLvl = 250, type = "water", type2 = "ice"},
["Furious Sandslash"] = {offense = 20, defense = 22, specialattack = 9, vitality = 15, agility = 450, exp = 4400, level = 250, wildLvl = 250, type = "ground", type2 = "no type"},
["Roll Donphan"] = {offense = 24, defense = 24, specialattack = 12, vitality = 18, agility = 300, exp = 3000, level = 250, wildLvl = 250, type = "ground", type2 = "no type"},
["Bone Marowak"] = {offense = 16, defense = 22, specialattack = 10, vitality = 12, agility = 450, exp = 2600, level = 250, wildLvl = 250, type = "ground", type2 = "no type"},
["Octopus Octillery"] = {offense = 21, defense = 15, specialattack = 21, vitality = 15, agility = 300, exp = 1000, level = 250, wildLvl = 250, type = "water", type2 = "no type"},
["Moon Clefable"] = {offense = 14, defense = 14.6, specialattack = 19, vitality = 19, agility = 450, exp = 6000, level = 250, wildLvl = 250, type = "normal", type2 = "no type"},
["Heavy Piloswine"] = {offense = 20, defense = 16, specialattack = 12, vitality = 20, agility = 300, exp = 5200, level = 250, wildLvl = 250, type = "ice", type2 = "ground"},

}