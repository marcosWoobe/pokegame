local a = {
[11638] = {
pokemons = {"Slowpoke", "Magnemite", "Doduo", "Seel", "Grimer", "Gastly", "Drowzee", "Voltorb",
        "Cubone", "Koffing", "Cyndaquil", "Pidgeotto", "Weepinbell", "Wooper", "Dunsparce", "Pichu", "Slugma", "Remoraid", "Ledyba", 
        "Goldeen", "Vulpix", "Tentacool", "Bulbasaur", "Charmander", "Squirtle", "Metapod", "Kakuna",
        "Teddiursa", "Chikorita", "Chinchou", "Cleffa", "Marill", "Natu", "Smoochum", "Phanpy", "Slugma",
        "Ekans", "Abra", "Mankey", "Psyduck", "Sandshrew", "Kabuto", "Beedrill", "Omanyte", "Butterfree", "Snubbul", "Togepi",
        "Zubat", "Diglett", "Venonat", "Shuckle", "Mareep",
        "Meowth", "Poliwag", "Growlithe", "Machop", "Ponyta", "Geodude", "Hoothoot", "Pineco", "Sentret",
        "Swinub", "Totodile"}},
[11639] = {pokemons = {"Skiploom", "Raticate", "Ariados", "Flaffy", "Delibird", "Fearow", "Clefairy", "Arbok",
        "Nidorino", "Nidorina", "Elekid", "Magby", "Ledian",
        "Dodrio", "Golbat", "Gloom", "Parasect", "Venomoth", "Dugtrio", "Persian",
        "Poliwhirl", "Machoke", "Quilava", "Yanma",
        "Graveler", "Slowbro", "Magneton", "Farfetch'd", "Haunter", "Kingler", "Electrode",
        "Weezing", "Seadra", "Bayleef", "Croconaw", "Qwilfish", "Tyrogue",
        "Jigglypuff", "Seaking", "Tauros", "Starmie", "Eevee", "Charmeleon",
        "Wartortle", "Ivysaur", "Pikachu"}},
[11640] = {pokemons = {"Politoed", "Magcargo", "Noctowl", "Poliwrath", "Nidoking", "Pidgeot", "Sandslash", "Ninetales", "Vileplume",
        "Primeape", "Nidoqueen", "Granbull", "Jumpluff", "Golduck", "Kadabra", "Rapidash", "Azumarill", "Murkrow",
        "Clefable", "Wigglytuff", "Dewgong", "Onix", "Cloyster", "Hypno", "Exeggutor", "Marowak",
        "Hitmonchan", "Quagsire", "Stantler", "Xatu", "Bellossom", "Lanturn", "Pupitar",
        "Lickitung", "Golem", "Tangela", "Mr. Mime", "Pinsir", "Octillery", "Sneasel"}},
[11641] = {pokemons = {"Snorlax", "Kabutops", "Omastar",
        "Lapras", "Gyarados", "Magmar", "Jynx", "Kangaskhan",
        "Venusaur", "Machamp", "Arcanine", "Charizard", "Blastoise", "Tentacruel",
        "Alakazam", "Gengar", "Rhydon", "Raichu"}},
[1233331] = {pokemons = {"Shiny Abra"}},
[12222327] = {pokemons = {"Shiny Crobat", "Shiny Magmar", "Shiny Giant Magikarp", "Shiny Venusaur", "Shiny Charizard", "Shiny Blastoise", "Shiny Arcanine", "Shiny Alakazam", "Shiny Ninetales",
        "Shiny Gengar", "Shiny Scyther", "Shiny Rhydon", "Shiny Umbreon", "Shiny Pidgeot", "Shiny Raichu", "Shiny Tentacruel", "Shiny Ampharos", "Shiny Feraligatr", "Shiny Meganium", 
        "Shiny Jynx", "Shiny Electabuzz", "Shiny Gyarados", "Shiny Snorlax", "Shiny Tangela", "Shiny Ariados", "Shiny Politoed", "Shiny Typhlosion", "Shiny Tauros", 
        "Shiny Butterfree", "Shiny Beedrill", "Shiny Venomoth", "Shiny Espeon", "Shiny Magneton", "Shiny Onix", "Shiny Larvitar", "Shiny Pupitar", "Shiny Machamp", 
        "Shiny Golbat", "Shiny Kingler", "Shiny Dodrio", "Shiny Farfetch'd", "Shiny Parasect", "Shiny Pinsir", "Shiny Zubat", "Shiny Dratini", "Shiny Venonat", 
        "Shiny Electrode", "Shiny Muk", "Shiny Stantler", "Shiny Marowak", "Shiny Seadra", "Shiny Dragonair", "Shiny Mr. Mime"}}
}     

local happy = 1000 
         
function onUse(cid, item, frompos, item2, topos)
    local b = a[item.itemid]                                    
    if not b then return true end
    local pokemon = b.pokemons[math.random(#b.pokemons)]
    if not pokes[pokemon] then return true end  
         
    doPlayerSendTextMessage(cid, 27, "You opened a pokemon prize box +"..item.itemid - (11637).."!")
    doPlayerSendTextMessage(cid, 27, "The prize pokemon was a "..pokemon..", congratulations!")
    doSendMagicEffect(getThingPos(cid), 29)
    addPokeToPlayer(cid, pokemon, 0, nil, 0, 0, 0, true)     --alterado v1.9                                                 
    doRemoveItem(item.uid, 1)
    -- if useOTClient then
    --     doCreatureExecuteTalkAction(cid, "/salvar")
    -- end
    
return true
end