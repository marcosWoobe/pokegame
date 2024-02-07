local base = 7500
pokemonsStorages = {
  isSleeping = base + 1,
  sleepingTick = base + 2,
  attackTick = base + 3,
  extraDefense = base + 4,
  transform = base + 5,
  accuracy = base + 6,
  isUsingSpecialSkill = base + 7,
  isUsingHealthPotion = base + 8,
  isUsingEnergyPotion = base + 9,
    bonusAtk = base + 10, -- mastery bonus
    bonusDef = base + 11, -- mastery bonus
    lastUsedMove = base + 12,
    safariCatchFactor = base + 13,
    storedDamage = base + 14,
    healthBeforeSubstitute = base + 15,
    canEvolve = base + 16, -- Wild only
    customType1 = base + 17,
    pokemonSummon = base + 18,
    heldMovePowerModifier = base + 19,
    heldMovePowerType = base + 20,
    heldMovePowerType2 = base + 21
    --[[, Isnt used
    customType2 = base + 18,]]
}

orderTalks = {
    ["ride"] = {talks = {", let's ride."}, storage = 9800},
    ["fly"] = {talks = {", let's fly."}, storage = 9801},
    ["levitate"] = {talks = {", let's levitate."}, storage = 9801},
    ["surf"] = {talks = {", let's surf."}, storage = 63215},
    ["dig"] = {talks = {", dig it."}, storage = 9803},
    ["cut"] = {talks = {", cut it."}, storage = 9804},
    ["rock"] = {talks = {", use rock smash!"}, storage = 9805},
    ["headbutt"] = {talks = {", headbutt."}, storage = 9806},
    ["move"] = {talks = {", move!"}, storage = 0},
    ["blink"] = {talks = {", blink"}, storage = 0},
    ["gopoke"] = {talks = {", i need your Help!", ", I choose you!.", ", its the battle time!" }, storage = 0},
    ["backpoke"] = {talks = {", nice work.", ", thanks.", ", that's enough come back." }, storage = 0},
    ["downability"] = {talks = {", thanks.", ", let me go down." }, storage = 0},
}

specialEvo = {
    ["Eevee"] = {
        [11444] = "Jolteon",
        [11442] = "Vaporeon",
        [11447] = "Flareon",
        [11452] = "Espeon",
        [11450] = "Umbreon"
    },
    ["Poliwhirl"] = 1,
    ["Gloom"] = 1,
    ["Slowpoke"] = 1,
    ["Tyrogue"] = 1
}

evolutionss = {
    {from = "Baby Bulbasaur", to = "Bulbasaur", stones = "1 leaf"},
    {from = "Bulbasaur", to = "Ivysaur", stones = "1 leaf"},
    {from = "Ivysaur", to = "Venusaur", stones = "2 leaf"},
    
    {from = "Baby Squirtle", to = "Squirtle", stones = "1 water"},
    {from = "Squirtle", to = "Wartortle", stones = "1 water"},
    {from = "Wartortle", to = "Blastoise", stones = "2 water"},
    
    {from = "Baby Charmander", to = "Charmander", stones = "1 fire"},
    {from = "Charmander", to = "Charmeleon", stones = "1 fire"},
    {from = "Charmeleon", to = "Charizard", stones = "2 fire"},
    
    {from = "Caterpie", to = "Metapod", stones = "1 coccon"},
    {from = "Metapod", to = "Butterfree", stones = "2 coccon"}, 
    
    
    {from = "Weedle", to = "Kakuna", stones = "1 coccon"},
    {from = "Kakuna", to = "Beedrill", stones = "2 coccon"},    
    
    
    {from = "Pidgey", to = "Pidgeotto", stones = "1 feather"},
    {from = "Pidgeotto", to = "Pidgeot", stones = "2 feather"},     
    
    {from = "Rattata", to = "Raticate", stones = "2 heart"},
    
    --{from = "Shiny Rattata", to = "Shiny Raticate", stones = "1 shiny"},    
    
    {from = "Spearow", to = "Fearow", stones = "1 feather"},
    
    {from = "Ekans", to = "Arbok", stones = "2 venom"},     
    
    {from = "Pikachu", to = "Raichu", stones = "2 thunder"},
    
    {from = "Sandshrew", to = "Sandslash", stones = "2 earth"},     
    
    {from = "Nidoran Female", to = "Nidorina", stones = "1 venom"},
    {from = "Nidorina", to = "Nidoqueen", stones = "2 venom"},      
    
    {from = "Nidoran Male", to = "Nidorino", stones = "1 venom"},
    {from = "Nidorino", to = "Nidoking", stones = "2 venom"},       

    {from = "Cleffa", to = "Clefairy", stones = "1 heart"},
    
    {from = "Clefairy", to = "Clefable", stones = "2 heart"},
    
    {from = "Vulpix", to = "Ninetales", stones = "2 fire"},     
    
    {from = "Jigglypuff", to = "Wigglytuff", stones = "2 heart"},
    
    {from = "Zubat", to = "Golbat", stones = "1 venom"},
    
    --{from = "Shiny Zubat", to = "Shiny Golbat", stones = "2 shiny"},    

    --{from = "Shiny Golbat", to = "Shiny Crobat", stones = "6 shiny"},       
    
    {from = "Cubone", to = "Marowak", stones = "2 earth"},
    
    --{from = "Shiny Cubone", to = "Shiny Marowak", stones = "6 shiny"},      
    
    {from = "Koffing", to = "Weezing", stones = "2 venom"},     
    
    {from = "Rhyhorn", to = "Rhydon", stones = "2 rock"},       
    
    {from = "Horsea", to = "Seadra", stones = "1 water"},   
    
    --{from = "Shiny Horsea", to = "Shiny Seadra", stones = "2 shiny"},       
    
    {from = "Goldeen", to = "Seaking", stones = "1 water"},     
    
    {from = "Staryu", to = "Starmie", stones = "2 water"},      
    
    {from = "Magikarp", to = "Gyarados", stones = "3 water, 3 crystal"},
    
    --{from = "Shiny Magikarp", to = "Shiny Gyarados", stones = "8 shiny"},       
    
    {from = "Dratini", to = "Dragonair", stones = "1 crystal"}, 
    
    --{from = "Shiny Dratini", to = "Shiny Dragonair", stones = "6 shiny"},   
    
    {from = "Dragonair", to = "Dragonite", stones = "5 crystal"},       
    
    {from = "Tentacool", to = "Tentacruel", stones = "1 water, 1 venom"},
    
    --{from = "Shiny Tentacool", to = "Shiny Tentacruel", stones = "7 shiny"},    
    
    {from = "Geodude", to = "Graveler", stones = "1 rock"}, 
    
    {from = "Graveler", to = "Golem", stones = "2 rock"},   
    
    {from = "Ponyta", to = "Rapidash", stones = "2 fire"},  
    
    {from = "Magnemite", to = "Magneton", stones = "1 thunder"},    
    
    {from = "Doduo", to = "Dodrio", stones = "1 feather"},  
    
    {from = "Seel", to = "Dewgong", stones = "1 ice, 1 water"}, 
    
    {from = "Grimer", to = "Muk", stones = "2 venom"},
    
    --{from = "Shiny Grimer", to = "Shiny Muk", stones = "7 shiny"},  
    
    {from = "Shellder", to = "Cloyster", stones = "2 ice"}, 
    
    {from = "Gastly", to = "Haunter", stones = "1 dark"},   
    
    {from = "Haunter", to = "Gengar", stones = "2 dark"},   
    
    {from = "Drowzee", to = "Hypno", stones = "2 enigma"},  
    
    {from = "Krabby", to = "Kingler", stones = "1 water"},  
    
    --{from = "Shiny Krabby", to = "Shiny Kingler", stones = "5 shiny"},  
    
    {from = "Voltorb", to = "Electrode", stones = "1 thunder"}, 
    
    --{from = "Shiny Voltorb", to = "Shiny Electrode", stones = "2 shiny"},   
    
    {from = "Exeggcute", to = "Exeggutor", stones = "2 leaf, 2 enigma"},    
    
    {from = "Machop", to = "Machoke", stones = "1 punch"},  
    
    {from = "Machoke", to = "Machamp", stones = "2 punch"}, 
    
    {from = "Bellsprout", to = "Weepinbell", stones = "1 leaf"},    
    
    {from = "Weepinbell", to = "Victreebel", stones = "2 leaf"},    
    
    {from = "Growlithe", to = "Arcanine", stones = "5 fire, 1 ancient"},    
    
    ----{from = "Shiny Growlithe", to = "Shiny Arcanine", stones = "8 shiny"},  
    
    {from = "Poliwag", to = "Poliwhirl", stones = "1 water"},   
    
    {from = "Abra", to = "Kadabra", stones = "1 enigma"},   
    
    {from = "Kadabra", to = "Alakazam", stones = "2 enigma"},   
    
    {from = "Meowth", to = "Persian", stones = "2 heart"},  
    
    {from = "Psyduck", to = "Golduck", stones = "2 water"}, 
    
    {from = "Mankey", to = "Primeape", stones = "1 heart"}, 
    
    {from = "Venonat", to = "Venomoth", stones = "2 venom"},
    
    --{from = "Shiny Venonat", to = "Shiny Venomoth", stones = "5 shiny"},    
    
    {from = "Diglett", to = "Dugtrio", stones = "1 earth"}, 
    
    {from = "Oddish", to = "Gloom", stones = "1 leaf"},
    
    {from = "Paras", to = "Parasect", stones = "2 coccon"},
    
    --{from = "Shiny Paras", to = "Shiny Parasect", stones = "5 shiny"},  
    
    {from = "Kabuto", to = "Kabutops", stones = "3 rock, 1 ancient"},   
    
    {from = "Omanyte", to = "Omastar", stones = "3 water, 1 ancient"},  
    
    {from = "Onix", to = "Steelix", stones = "1 rock, 1 metal"},

    {from = "Scyther", to = "Scizor", stones = "2 coccon, 1 metal"},
    
    {from = "Chikorita", to = "Bayleef", stones = "1 leaf"},
    
    {from = "Bayleef", to = "Meganium", stones = "2 leaf"},

    {from = "Cyndaquil", to = "Quilava", stones = "1 fire"},    
    
    {from = "Quilava", to = "Typhlosion", stones = "2 fire"},
    
    {from = "Totodile", to = "Croconaw", stones = "1 water"},
    
    {from = "Croconaw", to = "Feraligatr", stones = "2 water"},
    
    {from = "Hoothoot", to = "Noctowl", stones = "2 feather"},
    
    {from = "Ledyba", to = "Ledian", stones = " 2 coccon"},
    
    {from = "Spinarak", to = "Ariados", stones = "2 coccon"},
    
    {from = "Golbat", to = "Crobat", stones = "1 venom, 1 ancient"},
    
    {from = "Chinchou", to = "Lanturn", stones = "1 water, 1 thunder"},
    
    {from = "Pichu", to = "Pikachu", stones = "1 thunder"},
    
    {from = "Igglybuff", to = "Jigglypuff", stones = "1 heart"},
    
    {from = "Jigglypuff", to = "Wigglytuff", stones = "2 heart"},
    
    {from = "Togepi", to = "Togetic", stones = "2 heart"},

    {from = "Natu", to = "Xatu", stones = "1 enigma, 1 feather"},

    {from = "Mareep", to = "Flaaffy", stones = "1 thunder"},
    
    {from = "Flaaffy", to = "Ampharos", stones = "2 thunder"},
    
    {from = "Marill", to = "Azumarill", stones = "2 water"},
    
    {from = "Hoppip", to = "Skiploom", stones = "1 leaf"},  
    
    {from = "Skiploom", to = "Jumpluff", stones = "1 leaf, 1 feather"},     

    {from = "Sunkern", to = "Sunflora", stones = "1 leaf"}, 

    {from = "Wooper", to = "Quagsire", stones = "1 water, 1 earth"},
    
    {from = "Pineco", to = "Forretress", stones = "2 coccon"},

    {from = "Snubull", to = "Granbull", stones = "2 heart"},    

    {from = "Teddiursa", to = "Ursaring", stones = "1 heart, 1 ancient"},

    {from = "Slugma", to = "Magcargo", stones = "1 fire, 1 rock"},

    {from = "Swinub", to = "Piloswine", stones = "1 ice, 1 earth"}, 

    {from = "Remoraid", to = "Octillery", stones = "2 water"},

    {from = "Houndour", to = "Houndoom", stones = "1 fire, 1 dark"},

    {from = "Seadra", to = "Kingdra", stones = "2 water, 1 ancient"},
    
    {from = "Porygon", to = "Porygon2", stones = "2 enigma"},   
    
    {from = "Elekid", to = "Electabuzz", stones = "2 thunder, 1 ancient"},  
    
    {from = "Magby", to = "Magmar", stones = "2 fire, 1 ancient"},  
    
    {from = "Smoochum", to = "Jynx", stones = "2 ice, 1 ancient"},      
    
    {from = "Chansey", to = "Blissey", stones = "2 heart, 1 ancient"},      
    
    {from = "Larvitar", to = "Pupitar", stones = "1 earth"},

    {from = "Pupitar", to = "Tyranitar", stones = "2 earth, 1 ancient"},    
    
    {from = "Treecko", to = "Grovyle", stones = "1 leaf"},
    {from = "Grovyle", to = "Sceptile", stones = "2 leaf"},
    
    {from = "Mudkip", to = "Marshtomp", stones = "1 water"},
    {from = "Marshtomp", to = "Swampert", stones = "2 water"},
    
    {from = "Torchic", to = "Combusken", stones = "1 fire"},
    {from = "Combusken", to = "Blaziken", stones = "2 fire"},

    {from = "Poochyena", to = "Mightyena", stones = "2 dark, 1 ancient"},
    
    {from = "Zigzagoon", to = "Linoone", stones = "2 heart"},   
    
    {from = "Lotad", to = "Lombre", stones = "1 water"},
    {from = "Lombre", to = "Ludicolo", stones = "1 water, 1 leaf"}, 
    
    {from = "Seedot", to = "Nuzleaf", stones = "1 leaf"},
    {from = "Nuzleaf", to = "Shiftry", stones = "1 leaf, 1 dark"},  
    
    {from = "Nincada", to = "Ninjask", stones = "2 coccon, 1 ancient"}, 
    
    {from = "Taillow", to = "Swellow", stones = "2 feather"},   
    
    {from = "Shroomish", to = "Breloom", stones = "2 leaf, 1 ancient"},
    
    {from = "Wingull", to = "Pelipper", stones = "1 water, 1 feather"},
    
    {from = "Surskit", to = "Masquerain", stones = "1 coccon, 1 feather"},
    
    {from = "Wailmer", to = "Wailord", stones = "2 water, 2 ancient"},
    
    {from = "Skitty", to = "Delcatty", stones = "2 heart"},
    
    {from = "Baltoy", to = "Claydol", stones = "1 earth, 1 enigma"},

    {from = "Barboach", to = "Whiscash", stones = "1 water, 1 earth"},

    {from = "Corphish", to = "Crawdaunt", stones = "1 water, 1 dark"},

    {from = "Carvanha", to = "Sharpedo", stones = "1 water, 1 dark"},
    
    {from = "Trapinch", to = "Vibrava", stones = "1 earth"},

    {from = "Vibrava", to = "Flygon", stones = "2 earth, 1 ancient"},   
    
    {from = "Makuhita", to = "Hariyama", stones = "2 punch"},   

    {from = "Electrike", to = "Manectric", stones = "2 thunder"},   

    {from = "Numel", to = "Camerupt", stones = "1 fire, 1 earth"},      
    
    {from = "Spheal", to = "Sealeo", stones = "1 water, 1 ice"},    

    {from = "Sealeo", to = "Walrein", stones = "2 water, 1 ancient"},   

    {from = "Cacnea", to = "Cacturn", stones = "2 leaf, 4 ancient"},    

    {from = "Snorunt", to = "Glalie", stones = "2 ice"},
    
    {from = "Azurill", to = "Marill", stones = "1 water"},

    {from = "Spoink", to = "Grumpig", stones = "2 enigma"}, 

    {from = "Meditite", to = "Medicham", stones = "1 enigma, 1 punch"}, 

    {from = "Swablu", to = "Altaria", stones = "2 crystal, 2 ancient"}, 

    {from = "Wynaut", to = "Wobbuffet", stones = "1 enigma, 4 ancient"},    
    
    {from = "Duskull", to = "Dusclops", stones = "2 dark"},
    
    {from = "Slakoth", to = "Vigoroth", stones = "1 heart"},    
    
    {from = "Gulpin", to = "Swalot", stones = "2 venom, 2 ancient"},

    {from = "Whismur", to = "Loudred", stones = "1 heart"}, 
    {from = "Loudred", to = "Exploud", stones = "2 heart"},     
    
    {from = "Shuppet", to = "Banette", stones = "2 dark"},

    {from = "Aron", to = "Lairon", stones = "1 rock"},  
    {from = "Lairon", to = "Aggron", stones = "2 rock, 1 metal"},   
    
    {from = "Lileep", to = "Cradily", stones = "2 leaf, 4 ancient"},    

    {from = "Anorith", to = "Armaldo", stones = "2 rock, 4 ancient"},   
    
    {from = "Ralts", to = "Kirlia", stones = "1 enigma"},   
    {from = "Kirlia", to = "Gardevoir", stones = "2 enigma, 4 ancient"},    
    
    {from = "Bagon", to = "Shelgon", stones = "1 crystal"},
    {from = "Beldum", to = "Metang", stones = "1 metal"},   
}

POKELEVEL_PLUS = {
    exprate = 1,
    maxlevel = 80,
    wild_evolve = {
        chance = 1,
        life = 0.30,
        enable = true,
    },

    evolution_tab = {
        ---1 GEN
        ["Baby Bulbasaur"] = {level = 10, evolution = "Bulbasaur"},
            ["Bulbasaur"] = {level = 16, evolution = "Ivysaur"},
            ["Ivysaur"] = {level = 55, evolution = "Venusaur"},
        ["Baby Charmander"] = {level = 10, evolution = "Charmander"},
            ["Charmander"] = {level = 16, evolution = "Charmeleon"},
            ["Charmeleon"] = {level = 55, evolution = "Charizard"},
        ["Baby Squirtle"] = {level = 10, evolution = "Squirtle"},
            ["Squirtle"] = {level = 16, evolution = "Wartortle"},
            ["Wartortle"] = {level = 55, evolution = "Blastoise"},
        ["Baby Pikachu"] = {level = 10, evolution = "Pikachu"},
            ["Pikachu"] = {level = 35, evolution = "Raichu"},
        ["Caterpie"] = {level = 7, evolution = "Metapod"},
            ["Metapod"] = {level = 15, evolution = "Butterfree"},
        ["Weedle"] = {level = 7, evolution = "Kakuna"},
            ["Kakuna"] = {level = 10, evolution = "Beedrill"},
        ["Pidgey"] = {level = 18, evolution = "Pidgeotto"},
            ["Pidgeotto"] = {level = 36, evolution = "Pidgeot"},
        ["Rattata"] = {level = 20, evolution = "Raticate"},
            ["Spearow"] = {level = 20, evolution = "Fearow"},
        ["Ekans"] = {level = 22, evolution = "Arbok"},
            ["Sandshrew"] = {level = 22, evolution = "Sandslash"},
        ["NidoranFE"] = {level = 16, evolution = "Nidorina"},
            ["NidoranMA"] = {level = 12, evolution = "Nidorino"},
        ["Zubat"] = {level = 22, evolution = "Golbat"},
                ["Golbat"] = {level = 55, evolution = "Crobat"},
            ["Oddish"] = {level = 21, evolution = "Gloom"},
        ["Paras"] = {level = 24, evolution = "Parasect"},
            ["Venonat"] = {level = 31, evolution = "Venomoth"},
        ["Diglett"] = {level = 26, evolution = "Dugtrio"},
            ["Meowth"] = {level = 28, evolution = "Persian"},
        ["Psyduck"] = {level = 33, evolution = "Golduck"},
            ["Mankey"] = {level = 28, evolution = "Primeape"},
        ["Poliwag"] = {level = 25, evolution = "Poliwhirl"},
            ["Abra"] = {level = 16, evolution = "Kadabra"},
        ["Machop"] = {level = 28, evolution = "Machoke"},
            ["Bellsprout"] = {level = 21, evolution = "Weepinbell"},
        ["Tentacool"] = {level = 30, evolution = "Tentacruel"},
            ["Geodude"] = {level = 25, evolution = "Graveler"}, 
        ["Ponyta"] = {level = 40, evolution = "Rapidash"},
            ["Slowpoke"] = {level = 37, evolution = "Slowbro"},
        ["Magnemite"] = {level = 30, evolution = "Magneton"},
            ["Doduo"] = {level = 31, evolution = "Dodrio"},
        ["Seel"] = {level = 34, evolution = "Dewgong"},
            ["Grimer"] = {level = 38, evolution = "Muk"},
        ["Gastly"] = {level = 25, evolution = "Haunter"},
            ["Drowzee"] = {level = 26, evolution = "Hypno"},
        ["Krabby"] = {level = 28, evolution = "Kingler"},
            ["Voltorb"] = {level = 30, evolution = "Electrode"},
        ["Cubone"] = {level = 28, evolution = "Marowak"},
            ["Koffing"] = {level = 35, evolution = "Weezing"},
        ["Rhyhorn"] = {level = 42, evolution = "Rhydon"},
            ["Horsea"] = {level = 32, evolution = "Seadra"},
        ["Goldeen"] = {level = 33, evolution = "Seaking"},
            ["Magikarp"] = {level = 20, evolution = "Gyarados"},
        ["Omanyte"] = {level = 40, evolution = "Omastar"},
            ["Kabuto"] = {level = 40, evolution = "Kabutops"},
        ["Dratini"] = {level = 30, evolution = "Dragonair"},
            ["Dragonair"] = {level = 55, evolution = "Dragonite"},
        ---- 2 GEN  -----
        ["Chikorita"] = {level = 16, evolution = "Bayleef"},
            ["Bayleef"] = {level = 32, evolution = "Meganium"},
        ["Cyndaquil"] = {level = 14, evolution = "Quilava"},
            ["Quilava"] = {level = 36, evolution = "Typhlosion"},
        ["Totodile"] = {level = 18, evolution = "Croconaw"},
            ["Croconaw"] = {level = 38, evolution = "Feraligatr"},
        ["Sentret"] = {level = 15, evolution = "Furret"},
            ["Hoothoot"] = {level = 20, evolution = "Noctowl"},
        ["Ledyba"] = {level = 18, evolution = "Ledian"},
            ["Spinarak"] = {level = 22, evolution = "Ariados"},
        ["Chinchou"] = {level = 27, evolution = "Lanturn"},
            ["Natu"] = {level = 25, evolution = "Xatu"},
        ["Mareep"] = {level = 15, evolution = "Flaaffy"},
            ["Flaaffy"] = {level = 30, evolution = "Ampharos"},     
        ["Marill"] = {level = 18, evolution = "Azumarill"},
            ["Hoppip"] = {level = 18, evolution = "Skiploom"},
        ["Skiploom"] = {level = 27, evolution = "Jumpluff"}, 
            ["Wooper"] = {level = 20, evolution = "Quagsire"},
        ["Wynaut"] = {level = 15, evolution = "Wobbuffet"},
            ["Pineco"] = {level = 31, evolution = "Forretress"},
        ["Snubbull"] = {level = 23, evolution = "Granbull"},
            ["Teddiursa"] = {level = 30, evolution = "Ursaring"},
        ["Slugma"] = {level = 38, evolution = "Magcargo"},
            ["Swinub"] = {level = 33, evolution = "Piloswine"},
        ["Remoraid"] = {level = 25, evolution = "Octillery"},
            ["Houndour"] = {level = 24, evolution = "Houndoom"},
        ["Phanpy"] = {level = 25, evolution = "Donphan"},
            ["Larvitar"] = {level = 30, evolution = "Pupitar"},
        ["Pupitar"] = {level = 55, evolution = "Tyranitar"},

    }
}

taskStorages = {
    431300,
    431301,
    431302,
    431303,
    431304,
    431305,
    432415,
    431400, 
    431401,
    431402,
    431403,
    431404,
    431405,
    431406,
    431407,
    431408,
    431409,
    431410,
    431411,
    431412,
    431413,
    431414,
    431415,
    431416,
    431417,
    431418,
    431419,
    431420,
    431421,
    431422,
    431423,
    431424,
    431425,
    431426,
    431427,
    431428,
    431429,
    431430,
    431431, 
    431432, 
    431433, 
    431434, 
    431435, 
    431436, 
    431437, 
    431438, 
    431439, 
    431440, 
    431441, 
    431442, 
    431443, 
    431444, 
    431445, 
    431446, 
    431447, 
    431448, 
    431449, 
    431450, 
    431451, 
    431452, 
    431453, 
    431454, 
    431455, 
    431456, 
    431457, 
    431458, 
    431459, 
    431460, 
    431461, 
    431462, 
    431463, 
    431464, 
    431465, 
    431466, 
    431467, 
    431468, 
    431469, 
    431470, 
    431471, 
    431472, 
    431473, 
    431474, 
    431475, 
    431476, 
    431477, 
    431478, 
    431479, 
    431480, 
    431481, 
    431482, 
    431483, 
    431484, 
    431485, 
    431486, 
    431487, 
    431488, 
    431489, 
    431490, 
    431491, 
    431492, 
    431493, 
    431494, 
    431495, 
    431496, 
    431497, 
    431498, 
    431499, 
}

stoneToString = {
    ["venom"] = 11443,
    ["leaf"] = 11441,
    ["water"] = 11442,
    ["thunder"] = 11444,
    ["rock"] = 11445,
    ["punch"] = 11446,
    ["fire"] = 11447,
    ["coccon"] = 11448,
    ["crystal"] = 11449, -- antiga crystal
    ["dark"] = 11450,
    ["earth"] = 11451,
    ["enigma"] = 11452,
    ["heart"] = 11453,
    ["ice"] = 11454,
    ["metal"] = 12232,
    ["ancient"] = 12244,
    ["sun"] = 12242,
    ["shiny"] = 19203,
    ["feather"] = 19202,
}

opcodes = {
        OPCODE_POKEDEX = 100,
        OPCODE_CREATE_POKEMONS = 101,
        OPCODE_SKILL_BAR = 102,
        OPCODE_EMERALD_SHOP = 103,
        OPCODE_POKEMON_HEALTH = 104,
        OPCODE_CATCH = 105,
        OPCODE_BATTLE_POKEMON = 106,
        OPCODE_FIGHT_MODE = 107,
        OPCODE_REQUEST_DUEL = 108,
        OPCODE_ACCEPT_DUEL = 109,
        OPCODE_YOU_ARE_DEAD = 110,
        OPCODE_DITTO_MEMORY = 111,
        OPCODE_TV_CAM = 125,
        OPCODE_TV_BLOCK_CLIENT = 126,
        OPCODE_PLAYER_DEAD_WINDOW = 130,
        OPCODE_PLAYER_SHOW_AUTOLOOT = 135,
        OPCODE_PLAYER_SHOW_ONLINE = 136,
        OPCODE_PLAYER_SHOW_TRADE_HELD = 137,
}

storages = {  -- Todas as storages usadas em quaisquer scripts terão q ser armazenadas aqui
        iconSys = 20000,
        pokedexSys = 8052,
        playerCasinoCoins = 8055,
        playerKantoCatches = 8056,
        playerTotalCatches = 8057,
        playerWins = 8058,
        playerLoses = 8059,
        playerOfficialWins = 8060,
        playerOfficialLoses = 8061,
        playerPVPScore = 8062,
        gynLeaders = {
                   ["Brock"] = 8063,
                   ["Misty"] = 8064,
                   ["Surge"] = 8065,
                   ["Erika"] = 8066,
                   ["Sabrina"] = 8067,
                   ["Koga"] = 8068,
                   ["Blaine"] = 8069,
                   ["Giovanni"] = 8070
        },
        
        markedPosPoke = 8071,
        blink = 8072,
        status = {
                   attack = 8073,
                   specialAtk = 8074,
                   defense = 8075,
                   vitality = 8076,
                   fome = 8077,
                   love = 8078,
                   check = 8079,
                   specialDef = 8080,
                   speed = 8081
            },  
        fightMode = 8082,
        potion = 8083,
        gobackDelay = 8084,
        GRRRRSto = 8085,
        moves = {
                   [1] = 8086,
                   [2] = 8087,
                   [3] = 8088,
                   [4] = 8089,
                   [5] = 8090,
                   [6] = 8091,
                   [7] = 8092,
                   [8] = 8093,
                   [9] = 8094,
                   [10] = 8095,
                   [11] = 8096,
                   [12] = 8097,
                   [13] = 8098,
                   [14] = 8099
        },
        pokedexDelay = 8100,
        focus = 8101,
        status = {
                   ["sleep"] = 8102,
                   ["stun"] = 8103,
                   ["string"] = 8104,
                   ["blind"] = 8105,
                   ["confusion"] = 8106,
                   ["poison"] = 8107,
                   ["burn"] = 8108,
                   ["leechSeed"] = 8109,
                   ["speedDown"] = 8110,
                   ["fear"] = 8111,
                   ["involved"] = 8112,
                   ["silence"] = 8113,
                   ["rage"] = 8114,
                   ["harden"] = 8115,
                   ["strafe"] = 8116,
                   ["speedUp"] = 8117
                 },
                 
        duel = {
                requestCountPlayer = 8118,
                requestCountPokemon = 8119,
                requestedPlayer = 8120,
                isInDuel = 8121,
               },
        teamRed = 8122,
        teamBlue = 8123,
        reflect = 8124,
        damageKillExp = 8125,
        catchAnuncio = 8126,
        miniQuests = {
                        tonny = {QuestStor = 8135, StatusMission = 8136},
                        mew = {QuestStor = 8155, StatusMission = 8156},
                        lend1 = {QuestStor = 8157, StatusMission = 8158},
                        storNpcTaskName = 8137,
                        storPokeNameTask1 = 8138,
                        storPokeCountTask1 = 8139,
                        storDayTask1 = 8140,
                        Paulo = 2000,
                        
                        storNpcTaskName2 = 8141,
                        storPokeNameTask2 = 8142,
                        storPokeCountTask2 = 8143,
                        storDayTask2 = 8144,
                        
                        storNpcTaskName3 = 8145,
                        storPokeNameTask3 = 8146,
                        storPokeCountTask3 = 8147,
                        storDayTask3 = 8148,
                        
                        storNpcTaskName4 = 8149,
                        storPokeNameTask4 = 8150,
                        storPokeCountTask4 = 8151,
                        storDayTask4 = 8152,
                        
                        storNpcTaskName5 = 8153,
                        storPokeNameTask5 = 8154,
                        storPokeCountTask5 = 8155,
                        storDayTask5 = 8156,
                     }, 
        isMega = 20000,
        isMegaID = 20001,
        isPokemonGhost = 20002,
        globalsTV = 52010,
        TVHoras = 52011,
        TVMins = 52012,
        TVSecs = 52013,
        playerTVName = 55014, 
        playerTVPass = 55015,
        playerListWatchs = 55016,
        playerIsTvWatching = 55017,
        playerIsTvWhosWatching = 55018,
        playerIsTvInitialPos = 55019,
        playerIsDead = 20003,
        betaStorage = 20004,
        GetClienteVersion = 20005,
        BugFishing = 20006,
        AutoLootCollectAll = 20025,
        AutoLootList = 20007,
        UsingAutoLoot = 20008,
        SmeargleID = 20009, 
}

megasConf = { -- charizard x mais ataque menos speed/def, charizard y mais speed/def, menos ataque
        ["Mega Beedrill"] = { out = 79, offense = 3.2, defense = 45, specialattack = 18, life = 7500, agility = 520, wildVity = 10, wildChance = 3, itemToDrop = 19230},
        ["Mega Pinsir"] = { out = 2074, offense = 3.5, defense = 55, specialattack = 25, life = 9500, agility = 370, wildVity = 10, wildChance = 5, itemToDrop = 19233},
        
        ["Mega Alakazam"] = {out = 13, offense = 2.6, defense = 50, specialattack = 25, life = 8400, agility = 320, wildVity = 10, wildChance = 5, itemToDrop = 19223},
        ["Mega Alakazam X"] = {out = 13, offense = 2.5, defense = 60, specialattack = 30, life = 10000, agility = 420, wildVity = 10, wildChance = 5, itemToDrop = 17121},
        ["Mega Charizard X"] = { out = {1879, 1880, 1881}, offense = 2.9, defense = 60, specialattack = 25, life = 10000, agility = 290, wildVity = 10, wildChance = 100, itemToDrop = 19224},
        ["Mega Charizard Y"] = { out = {1876, 1877, 1878}, offense = 2.7, defense = 50, specialattack = 20, life = 15000, agility = 320, wildVity = 10, wildChance = 3, itemToDrop = 19225},
        ["Mega Blastoise"] = {out = 1850, offense = 2.5, defense = 60, specialattack = 30, life = 8000, agility = 280, wildVity = 10, wildChance = 5, itemToDrop = 19226},
        ["Mega Blastoise X"] = {out = 2145, offense = 2.5, defense = 80, specialattack = 35, life = 18000, agility = 320, wildVity = 10, wildChance = 5, itemToDrop = 17123},
        ["Mega Gengar"] = {out = 1851, offense = 2.6, defense = 50, specialattack = 25, life = 9600, agility = 390, wildVity = 10, wildChance = 5, itemToDrop = 19227}, 
        ["Mega Gengar X"] = {out = 1867, offense = 2.8, defense = 60, specialattack = 30, life = 15000, agility = 510, wildVity = 10, wildChance = 5, itemToDrop = 17122},  
       
        ["Mega Ampharos"] = {out = {2093, 2094, 2095}, offense = 3.6, defense = 16, specialattack = 25, life = 9200, agility = 280, wildVity = 10, wildChance = 5, itemToDrop = 15794}, 
        ["Mega Ampharos X"] = {out = 2176, offense = 3.7, defense = 16, specialattack = 30, life = 11000, agility = 280, wildVity = 10, wildChance = 5, itemToDrop = 17124},    
        ["Mega Venusaur"] = {out = 1863, offense = 2.4, defense = 50, specialattack = 20, life = 12000, agility = 270, wildVity = 10, wildChance = 5, itemToDrop = 19229},  
        ["Mega Venusaur X"] = {out = 2146, offense = 2.5, defense = 60, specialattack = 25, life = 13000, agility = 320, wildVity = 10, wildChance = 5, itemToDrop = 17125},    
        ["Mega Tyranitar"] = {out = 1854, offense = 2.8, defense = 60, specialattack = 25, life = 8000, agility = 250, wildVity = 10, wildChance = 5, itemToDrop = 15781},   
        ["Mega Tyranitar X"] = {out = 2178, offense = 2.9, defense = 70, specialattack = 25, life = 19000, agility = 350, wildVity = 10, wildChance = 5, itemToDrop = 17126},    
        ["Mega Kangaskhan"] = {out = 1872, offense = 2.5, defense = 50, specialattack = 20, life = 17000, agility = 270, wildVity = 10, wildChance = 5, itemToDrop = 19234},    
        ["Mega Scizor"] = {out = 2143, offense = 3, defense = 50, specialattack = 24, life = 10000, agility = 410, wildVity = 10, wildChance = 5, itemToDrop = 15784},  
        
        ["Mega Scizor X"] = {out = 2137, offense = 2.9, defense = 18, specialattack = 25, life = 10000, agility = 530, wildVity = 10, wildChance = 5, itemToDrop = 17127},  
        ["Mega Gyarados"] = {out = 2067, offense = 2.7, defense = 30, specialattack = 25, life = 15000, agility = 310, wildVity = 10, wildChance = 4, itemToDrop = 19231},  
        ["Mega Gyarados X"] = {out = 2177, offense = 2.8, defense = 30, specialattack = 25, life = 20000, agility = 380, wildVity = 10, wildChance = 5, itemToDrop = 17129},    
        ["Mega Wobbuffet"] = {out = 85, offense = 2.6, defense = 50, specialattack = 45, life = 10000, agility = 210, wildVity = 10, wildChance = 5, itemToDrop = 17132},   
        ["Mega Steelix"] = {out = 2138, offense = 2.5, defense = 100, specialattack = 20, life = 10000, agility = 200, wildVity = 10, wildChance = 5, itemToDrop = 17133},  
        ["Mega Houndoom"] = {out = 2141, offense = 2.8, defense = 50, specialattack = 30, life = 10000, agility = 410, wildVity = 10, wildChance = 5, itemToDrop = 17134},  
        ["Mega Slowbro"] = {out = 2073, offense = 2.7, defense = 60, specialattack = 30, life = 15000, agility = 210, wildVity = 10, wildChance = 3, itemToDrop = 19232},   
        
        ["Mega Aerodactyl"] = {out = 2061, offense = 3, defense = 100, specialattack = 20, life = 15000, agility = 240, wildVity = 10, wildChance = 5, itemToDrop = 15786}, 
        ["Mega Pidgeot"] = {out = 2081, offense = 2.8, defense = 50, specialattack = 30, life = 9000, agility = 310, wildVity = 10, wildChance = 5, itemToDrop = 19228},    
        ["Mega Mawile"] = {out = 1859, offense = 3.1, defense = 40, specialattack = 15, life = 13000, agility = 210, wildVity = 10, wildChance = 5, itemToDrop = 15136},    
        ["Mega Gardevoir"] = {out = 2089, offense = 15.3, defense = 40, specialattack = 25, life = 9000, agility = 270, wildVity = 10, wildChance = 5, itemToDrop = 15136}, 
        ["Mega Absol"] = {out = 2068, offense = 15.3, defense = 40, specialattack = 25, life = 9000, agility = 270, wildVity = 10, wildChance = 5, itemToDrop = 15136}, 
        ["Mega Lucario"] = {out = 2069, offense = 15.3, defense = 40, specialattack = 25, life = 9000, agility = 270, wildVity = 10, wildChance = 5, itemToDrop = 15136},   
        ["Mega Sceptile"] = {out = 2071, offense = 15.3, defense = 40, specialattack = 25, life = 9000, agility = 270, wildVity = 10, wildChance = 5, itemToDrop = 15136},  
        ["Mega Swampert"] = {out = 2075, offense = 15.3, defense = 40, specialattack = 25, life = 9000, agility = 270, wildVity = 10, wildChance = 5, itemToDrop = 15136},  
        ["Mega Aggron"] = {out = 1864, offense = 1, defense = 999, specialattack = 999, life = 999999, agility = 999, wildVity = 10, wildChance = 5, itemToDrop = 15136},   
        ["Mega Blaziken"] = {out = {2090, 2091, 2092}, offense = 5.3, defense = 15, specialattack = 25, life = 16000, agility = 270, wildVity = 10, wildChance = 5, itemToDrop = 15136},    
                
    }
    