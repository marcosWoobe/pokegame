function getCreatureLP(cid)
return getPlayerStorageValue(cid, 197)
end

function markLP(cid, dir)
setPlayerStorageValue(cid, 197, dir)
end

function markPos(sid, pos)
if not isCreature(sid) then return end
setPlayerStorageValue(sid, 145, pos.x)
setPlayerStorageValue(sid, 146, pos.y)
setPlayerStorageValue(sid, 147, pos.z)
end

function markFlyingPos(sid, pos)
if not isCreature(sid) then return end
setPlayerStorageValue(sid, 33145, pos.x)
setPlayerStorageValue(sid, 33146, pos.y)
setPlayerStorageValue(sid, 33147, pos.z)
end

function getFlyingMarkedPos(sid)
if not isCreature(sid) then return end
local xx = getPlayerStorageValue(sid, 33145)
local yy = getPlayerStorageValue(sid, 33146)
local zz = getPlayerStorageValue(sid, 33147)
return {x = xx, y = yy, z = zz, stackpos = 0}
end

function getMarkedPos(sid)
if not isCreature(sid) then return end
local xx = getPlayerStorageValue(sid, 145)
local yy = getPlayerStorageValue(sid, 146)
local zz = getPlayerStorageValue(sid, 147)
return {x = xx, y = yy, z = zz}
end

function getOwnerPos(sid)
if not isCreature(sid) then return end
local xx = getPlayerStorageValue(sid, 148)
local yy = getPlayerStorageValue(sid, 149)
local zz = getPlayerStorageValue(sid, 150)
return {x = xx, y = yy, z = zz}
end

function markOwnerPos(sid, pos)
if not isCreature(sid) then return end
setPlayerStorageValue(sid, 148, pos.x)
setPlayerStorageValue(sid, 149, pos.y)
setPlayerStorageValue(sid, 150, pos.z)
end

local dirpref = {
        [1] = {[NORTH] = {[1] = {NORTH}, [2] = {EAST, WEST}, [3] = {NORTHEAST, NORTHWEST}},
        [EAST] = {[1] = {EAST}, [2] = {NORTH, SOUTH}, [3] = {NORTHEAST, SOUTHEAST}},
        [SOUTH] = {[1] = {SOUTH}, [2] = {EAST, WEST}, [3] = {SOUTHEAST, SOUTHWEST}},
        [WEST] = {[1] = {WEST}, [2] = {SOUTH, NORTH}, [3] = {NORTHWEST, SOUTHWEST}},
        [NORTHEAST] = {[1] = {NORTH, EAST}, [2] = {NORTHEAST}, [3] = {SOUTH, WEST}},
        [SOUTHEAST] = {[1] = {SOUTH, EAST}, [2] = {SOUTHEAST}, [3] = {NORTH, WEST}},
        [SOUTHWEST] = {[1] = {SOUTH, WEST}, [2] = {SOUTHWEST}, [3] = {NORTH, EAST}},
    [NORTHWEST] = {[1] = {NORTH, WEST}, [2] = {NORTHWEST}, [3] = {EAST, SOUTH}}},
        [2] = {[NORTH] = {[1] = {NORTH}, [2] = {WEST, EAST}, [3] = {NORTHWEST, NORTHEAST}},
        [EAST] = {[1] = {EAST}, [2] = {SOUTH, NORTH}, [3] = {SOUTHEAST, NORTHEAST}},
        [SOUTH] = {[1] = {SOUTH}, [2] = {WEST, EAST}, [3] = {SOUTHWEST, SOUTHEAST}},
        [WEST] = {[1] = {WEST}, [2] = {NORTH, SOUTH}, [3] = {SOUTHWEST, NORTHWEST}},
        [NORTHEAST] = {[1] = {EAST, NORTH}, [2] = {NORTHEAST}, [3] = {WEST, SOUTH}},
        [SOUTHEAST] = {[1] = {EAST, SOUTH}, [2] = {SOUTHEAST}, [3] = {WEST, NORTH}},
        [SOUTHWEST] = {[1] = {WEST, SOUTH}, [2] = {SOUTHWEST}, [3] = {EAST, NORTH}},
    [NORTHWEST] = {[1] = {WEST, NORTH}, [2] = {NORTHWEST}, [3] = {SOUTH, EAST}}},
}

function doPushCreature(uid,direction,distance,time)
    if isCreature(uid) == TRUE then
        local rand = (2*math.random(0,1))-1
        local rand2 = math.random(-1,0)
        if direction == 0 then
            signal = {0,rand,-rand,rand,-rand,0,-1,-1,-1,0,0,0}
        elseif direction == 1 then
            signal = {1,1,1,0,0,0,0,rand,-rand,rand,-rand,0}
        elseif direction == 2 then
            signal = {0,rand,-rand,rand,-rand,0,1,1,1,0,0,0}
        elseif direction == 3 then
            signal = {-1,-1,-1,0,0,0,0,rand,-rand,rand,-rand,0}
        elseif direction == 4 then
            signal = {-1,rand2,(-rand2)-1,0,1,rand2+1,rand2,0}
        elseif direction == 5 then
            signal = {1,-rand2,-((-rand2)-1),0,1,rand2+1,rand2,0}
        elseif direction == 6 then
            signal = {-1,rand2,(-rand2)-1,0,-1,(-rand2)-1,rand2,0}
        else
            signal = {1,-rand2,-((-rand2)-1),0,-1,(-rand2)-1,rand2,0}
        end
        local pos = getThingPos(uid)
        nsig = #signal
        nvar = 0
        
        repeat
            nvar = nvar+1
            newpos = {x=pos.x+(signal[nvar]),y=pos.y+(signal[(nsig/2)+nvar]),z=pos.z}
            newtile = {x=newpos.x,y=newpos.y,z=newpos.z,stackpos=0}
        until getTileThingByPos(newtile).uid ~= 0 and hasProperty(getTileThingByPos(newtile).uid,3) == FALSE and canWalkOnPos(newtile, true, false, true, true, false) and queryTileAddThing(uid,newpos) == 1 or nvar == (nsig/2)
        --alterado v1.5
        if distance == nil or distance == 1 then
            doTeleportThing(uid,newpos,TRUE) 
        else
            distance = distance-1
            doTeleportThing(uid,newpos,TRUE)
            if time ~= nil then
                addEvent(doPushCreature,time,uid,direction,distance,time)
            else
                addEvent(doPushCreature,500,uid,direction,distance,500)
            end  
        end
    end 
end

local holes = {[468] = 469, [481] = 482, [483] = 484, [385] = 392}
local grasses = {[2767] = 6216}

local POKEMON_FAST_MOUNT_CONDITION = createConditionObject(CONDITION_HASTE, 999, -1, CONDITION_SUBID.HASTE.FAST_MOUNT)
setConditionParam(POKEMON_FAST_MOUNT_CONDITION, CONDITION_PARAM_SPEED, 120)

flys = {
--["Moltres"] = {229, 3000}, -- moltres
--["Articuno"] = {230, 3000}, -- artic
--["Zapdos"] = {224, 3000}, -- zapdos
--["Mew"] = {232, 3000}, -- 1000
--["Mewtwo"] = {233, 3000},-- two

--["Shiny Salamence"] = {1301, 1301},-- nite
--["Salamence"] = {1274, 1274},-- nite
["Charizard"] = {216, 500}, -- chari
["Pidgeot"] = {222, 500}, -- geot
["Gengar"] = {1123, 500},
["Dragonite"] = {221, 500},-- nite
["Crobat"] = {652, 500}, -- crobat
["Xatu"] = {1122, 500},
["Skarmory"] = {649, 500}, -- skarmory
["Porygon2"] = {648, 500}, -- 2
["Heracross"] = {1125, 500},
["Porygon"] = {316, 400}, -- porygon
["Fearow"] = {226, 400}, -- fearow
["Farfetch'd"] = {1120, 400},
["Noctowl"] = {994, 400},
["Dragonair"] = {1112, 400},
["Venomoth"] = {1233, 400},
["Aerodactyl"] = {227, 600}, -- aero
["Tropius"] = {1292, 700}, -- 
["Shiny Gengar"] = {1124, 600},
["Shiny Charizard"] = {295, 600}, -- Shiny chari
["Shiny Pidgeot"] = {996, 600}, -- Shiny geot
["Shiny Dragonite"] = {1020, 600}, -- Shiny geot 
["Shiny Venomoth"] = {893, 600},
["Shiny Farfetch'd"] = {1121, 600},
["Shiny Dragonair"] = {1113, 600},
["Shiny Crobat"] = {1149, 1000},
["Shiny Fearow"] = {997, 500}, -- Shiny fearow  
}

rides = {
--["Absol"] = {1286, 1500}, -- absol
--["Metagross"] = {1266, 1500}, -- Metagross
--["Shiny Onix"] = {126, 100}, -- onix             --alterado v1.5
["Shiny Onix"] = {293, 550}, -- cristal onix
["Dodrio"] = {133, 550}, -- dodrio
["Shiny Venusaur"] = {1040, 550}, -- venu
["Venusaur"] = {134, 400}, -- venu
["Ponyta"] = {131, 100}, -- ponyta
["Doduo"] = {135, 100}, -- doduo
["Onix"] = {126, 150}, -- onix
["Rhyhorn"] = {132, 200}, -- rhyhorn
["Bayleef"] = {686, 350}, -- bayleef
["Meganium"] = {685, 480}, -- meganium
["Mareep"] = {688, 100}, -- marip
["Piloswine"] = {689, 200}, -- piloswine
["Steelix"] = {646, 550}, -- steelix
["Shiny Stantler"] = {1229, 550}, -- 
["Stantler"] = {687, 350}, -- stantler 
["Shiny Meganium"] = {1178, 620}, -- shiny meganium
["Ninetales"] = {129, 620}, -- kyuubi
["Arcanine"] = {12, 620}, -- arcan
["Houndoom"] = {647, 620}, -- houndoom
["Girafarig"] = {1227, 600}, -- 
["Tauros"] = {128, 600}, -- tauros
["Shiny Ninetales"] = {1136, 700}, -- Shiny Ninetales  --alterado v1.9 \/
["Shiny Dodrio"] = {1145, 700}, -- shiny dodrio
["Shiny Tauros"] = {1181, 680}, -- shiny tauros
["Shiny Arcanine"] = {1003, 700}, -- arcan
["Rapidash"] = {130, 700}, -- rapid
}

surfs = {
["Poliwag"] = {lookType=278, speed = 100},
["Poliwhirl"] = {lookType=137, speed = 450},
["Seaking"] = {lookType=269, speed = 500},
["Dewgong"] = {lookType=183, speed = 500},
["Blastoise"] = {lookType=184, speed = 700},
["Tentacruel"] = {lookType=185, speed = 600},
["Lapras"] = {lookType=186, speed = 800},
["Gyarados"] = {lookType=187, speed = 800},
["Omastar"] = {lookType=188, speed = 700},
["Kabutops"] = {lookType=189, speed = 700},
["Poliwrath"] = {lookType=190, speed = 600},
["Vaporeon"] = {lookType=191, speed = 700},
["Staryu"] = {lookType=266, speed = 100},
["Starmie"] = {lookType=267, speed = 500},
["Goldeen"] = {lookType=268, speed = 50},
["Seadra"] = {lookType=270, speed = 500},
["Golduck"] = {lookType=271, speed = 600},
["Squirtle"] = {lookType=273, speed = 100},
["Wartortle"] = {lookType=275, speed = 500},
["Tentacool"] = {lookType=277, speed = 80},
["Snorlax"] = {lookType=300, speed = 500},
----------------Shiny----------------------
["Shiny Blastoise"] = {lookType=658, speed = 800},
["Shiny Tentacruel"] = {lookType=1014, speed = 800},
["Shiny Gyarados"] = {lookType=1030, speed = 1000},
["Shiny Vaporeon"] = {lookType=1032, speed = 800},        --alterado v1.6
["Shiny Seadra"] = {lookType=1025, speed = 900},
["Shiny Tentacool"] = {lookType=1013, speed = 500},
["Shiny Snorlax"] = {lookType=1035, speed = 600},
["Shiny Feraligatr"] = {lookType=1175, speed = 600},
----------------Johto----------------------
["Mantine"] = {lookType=636, speed = 800},
["Totodile"] = {lookType=637, speed = 100},
["Croconow"] = {lookType=638, speed = 500},
["Feraligatr"] = {lookType=645, speed = 700},
["Marill"] = {lookType=639, speed = 100},
["Azumarill"] = {lookType=642, speed = 500},
["Quagsire"] = {lookType=643, speed = 600},
["Kingdra"] = {lookType=644, speed = 1000},
["Octillery"] = {lookType=641, speed = 600},
["Wooper"] = {lookType=640, speed = 100},
["Milotic"] = {lookType=1290, speed = 800},
["Wailord"] = {lookType=1305, speed = 700},
}

specialabilities = {
["Rock Smash"] = {"Shiny Magcargo", "Shiny Sandslash", "Shiny Rhydon", "Nidoking", "Nidoqueen", "Dragonite", "Salamence", "Shiny Salamence", "Sandshrew", "Sandslash", "Diglett", "Dugtrio", "Primeape", "Machop", "Machoke", "Machamp", "Geodude", "Graveler", "Golem" , "Onix", "Cubone", "Marowak", "Rhyhorn", "Rhydon", "Kangaskhan", "Tauros", "Snorlax", "Poliwrath", "Hitmonlee", "Hitmonchan", "Aerodactyl", "Blastoise","Shiny Nidoking", "Shiny Dragonite", "Shiny Golem", "Shiny Onix", "Shiny Cubone", "Shiny Marowak", "Shiny Snorlax", "Shiny Hitmonlee", "Shiny Hitmontop", "Shiny Hitmonchan", "Shiny Blastoise", "Typhlosion", "Feraligatr", "Furret", "Ledian", "Ampharos", "Politoed", "Quagsire", "Forretress", "Steelix", "Snubbull", "Granbull", "Sudowoodo", "Gligar", "Scizor", "Heracross", "Sneasel", "Ursaring", "Teddiursa", "Slugma", "Magcargo", "Piloswine", "Swinub", "Corsola", "Phanpy", "Donphan", "Tyrogue", "Hitmontop", "Miltank", "Blissey", "Tyranitar", "Pupitar"},
["Cut"] = {"Shiny Magcargo", "Shiny Crobat", "Shiny Weezing", "Shiny Sandslash", "Kabutops", "Raticate", "Bulbasaur", "Ivysaur", "Venusaur", "Charmeleon", "Charizard", "Sandshrew", "Sandslash", "Gloom", "Vileplume", "Paras", "Parasect", "Meowth", "Persian", "Bellsprout", "Weepinbell", "Victreebel", "Farfetch'd", "Krabby", "Kingler", "Exeggutor", "Tropius", "Cubone", "Marowak", "Tangela", "Scyther", "Pinsir", "Shiny Raticate", "Shiny Venusaur", "Shiny Charizard", "Shiny Vileplume", "Shiny Paras", "Shiny Parasect", "Shiny Farfetch'd", "Shiny Krabby", "Shiny Kingler", "Shiny Cubone", "Shiny Marowak", "Shiny Tangela", "Shiny Scyther", "Shiny Pinsir", "Chikorita", "Bayleef", "Meganium", "Croconow", "Feraligatr", "Furret", "Bellossom", "Hoppip", "Skiploom", "Jumpluff", "Sunkern", "Sunflora", "Scizor", "Heracross", "Sneasel", "Teddiursa", "Ursaring", "Gligar", "Skarmory"},
["Flash"] = {"Shiny Lanturn", "Shiny Xatu", "Shiny Magmortar", "Shiny Electivire", "Electivire", "Shiny Espeon", "Shiny Electrode", "Abra", "Kadabra", "Alakazam","Mega Alakazam", "Magnemite", "Magneton", "Magnezone", "Drowzee", "Hypno", "Voltorb", "Electrode", "Mrmime", "Electabuzz", "Jolteon", "Porygon", "Pikachu", "Raichu", "Shiny Abra", "Shiny Alakazam", "Shiny Hypno", "Shiny Voltorb", "Shiny Electrode", "Shiny Electabuzz", "Shiny Jolteon", "Shiny Raichu", "Chinchou", "Lanturn", "Pichu", "Natu", "Xatu", "Mareep", "Flaaffy", "Ampharos", "Espeon", "Porygon2", "Elekid"}, 
["Digholes"] = {"468", "481", "483", "385", "1219"},  
["Ghostwalk"] = {"Shiny Abra", "Gastly", "Haunter", "Gengar", "Shiny Gengar", "Mega Gengar", "Misdreavus"},
["Dig"] = {"Shiny Magcargo", "Shiny Lanturn", "Poliwrath", "Miltank", "Shiny Sandslash", "Shiny Dodrio", "Shiny Umbreon", "Shiny Espeon", "Shiny Ninetales", "Shiny Rhydon", "Raticate", "Sandshrew", "Sandslash", "Diglett", "Dugtrio", "Primeape", "Machop", "Machoke", "Machamp", "Geodude", "Graveler", "Golem" , "Onix", "Cubone", "Marowak", "Rhyhorn", "Rhydon", "Kangaskhan", "Tauros", "Snorlax", "Eevee", "Flareon", "Jolteon", "Vaporeon", "Vulpix", "Ninetales", "Nidorina", "Nidoqueen", "Nidorino", "Nidoking", "Persian", "Arcanine", "Shiny Raticate", "Shiny Golem" , "Shiny Onix", "Shiny Cubone", "Shiny Marowak", "Shiny Snorlax", "Shiny Flareon", "Shiny Jolteon", "Shiny Vaporeon", "Shiny Nidoking", "Shiny Arcanine", "Typhlosion", "Feraligatr", "Furret", "Espeon", "Umbreon", "Ledian", "Sudowoodo", "Politoed", "Quagsire", "Gligar", "Steelix", "Snubbull", "Granbull", "Heracross", "Dunsparce", "Sneasel", "Teddiursa", "Ursaring", "Piloswine", "Hitmontop", "Larvitar", "Pupitar", "Tyranitar"},
["Blink"] = {"Shiny Xatu", "Exeggutor", "Shiny Abra","Mega Alakazam", "Shiny Espeon", "Shiny Mr. Mime", "Jynx", "Shiny Jynx", "Hypno", "Shiny Hypno", "Slowking", "Natu", "Xatu", "Espeon", "Mew", "Mewtwo", "Abra", "Kadabra", "Alakazam", "Porygon", "Shiny Abra", "Shiny Alakazam", "Porygon2", "Mr. Mime"},
["Teleport"] = {"Shiny Xatu", "Jynx","Mega Alakazam", "Shiny Jynx", "Slowking", "Slowbro", "Exeggutor", "Shiny Mr. Mime", 'Mew', 'Mewtwo', 'Abra', 'Kadabra', 'Alakazam', 'Drowzee', 'Hypno', 'Mr. Mime', 'Porygon', 'Shiny Abra', 'Shiny Alakazam', 'Shiny Hypno', 'Porygon2'}, 
["Fly"] = {"Shiny Stantler","Venomoth", "Shiny Crobat", "Tropius", "Noctowl", "Dragonair", "Shiny Dragonair", "Porygon", "Aerodactyl", "Salamence", "Shiny Salamence", "Dragonite", "Charizard", "Pidgeot", "Fearow", "Zapdos", "Moltres", "Articuno", "Mew", "Mewtwo", "Shiny Dragonite", "Shiny Charizard", "Shiny Pidgeot", "Shiny Fearow", "Porygon2", "Skarmory", "Crobat", "Shiny Venomoth", "Gengar", "Shiny Gengar", "Heracross", "Farfetch'd", "Shiny Farfetch'd", "Xatu"},
["Ride"] = { "Shiny Meganium", "Girafarig", "Shiny Dodrio", "Absol", "Metagross", "Shiny Ninetales", "Shiny Onix", "Venusaur", "Ninetales", "Arcanine", "Ponyta", "Rapidash", "Doduo", "Dodrio", "Onix", "Rhyhorn", "Tauros", "Shiny Venusaur", "Shiny Arcanine", "Steelix", "Houndoom", "Meganium", "Bayleef", "Stantler", "Mareep", "Piloswine"},
["surf"] = {'Shiny Feraligatr', 'Poliwag', 'Poliwhirl', 'Seaking', 'Milotic', 'Dewgong', 'Wailord', 'Blastoise', 'Tentacruel', 'Lapras', 'Gyarados', 'Omastar', 'Kabutops', 'Vaporeon', 'Staryu', 'Starmie', 'Goldeen', 'Seadra', 'Golduck', 'Squirtle', 'Wartortle', 'Tentacool', 'Snorlax', 'Poliwrath', 'Shiny Blastoise', 'Shiny Tentacruel', 'Shiny Gyarados', 'Shiny Vaporeon', 'Shiny Seadra', 'Shiny Tentacool', 'Shiny Snorlax', "Mantine", "Totodile", "Croconow", "Feraligatr", "Marill", "Azumarill", "Quagsire", "Wooper", "Octillery", "Kingdra"},
["Foresight"] = {"Machamp", "Shiny Hitmonchan", "Shiny Hitmonlee", "Shiny Hitmontop", "Hitmontop", "Hitmonlee", "Hitmonchan"},
["Counter"] = {"Shiny Magcargo", "Shiny Lanturn", "Shiny Magmar", "Shiny Magmortar", "Shiny Electivire", "Machamp", "Machoke", "Hitmonchan", "Hitmonlee", "Magmar", "Electabuzz", "Scyther", "Snorlax", "Kangaskhan", "Arcanine", "Shiny Arcanine", "Shiny Snorlax", "Shiny Scyther", "Shiny Hitmonchan", "Shiny Hitmonlee", "Shiny Electabuzz", "Hitmontop", "Shiny Hitmontop"}, 
["Levitate"] = {"Gengar", "Haunter", "Gastly", "Misdreavus", "Weezing", "Koffing", "Unown", "Shiny Gengar", "Shiny Weezing"},
["Evasion"] = {"Beedrill", "Shiny Beedrill", "Scyther", "Scizor", "Hitmonlee", "Hitmonchan", "Hitmontop", "Tyrogue", "Shiny Scyther", "Shiny Hitmonchan", "Shiny Hitmonlee", "Shiny Hitmontop", "Ledian", "Ledyba", "Sneasel", "Blaziken", "Mega Blaziken"},
["Control mind"] = {'Haunter', 'Gengar', 'Tentacruel', 'Alakazam', 'Shiny Tentacruel', 'Shiny Gengar', 'Shiny Alakazam', 'Slowking'},
["Transform"] = {"Ditto", "Shiny Ditto"},
["Levitate_fly"] = {"Gengar", "Shiny Gengar"},
["Illusion"] = {"Misdreavus, Stantler, Shiny Stantler"},
["Headbutt"] = {"Charizard"}
}              --alterado v1.9 /\  novos shinys da pxg adicionados em algumas tabelas..

function getPokemonAbilityAvailable(cid, ability, pokemonName)
  local thisball = getPlayerSlotItem(cid, 8)

  if ability == POKEMON_ABILITIES.ROCK_SMASH then
    if (isInArray(specialabilities[ability], pokemonName) or getItemAttribute(thisball.uid, "heldy") and getItemAttribute(thisball.uid, "heldy") == 43) then 
      return true
    else
      return false
    end
  elseif ability == POKEMON_ABILITIES.CUT then
    if (isInArray(specialabilities[ability], pokemonName) or getItemAttribute(thisball.uid, "heldy") and getItemAttribute(thisball.uid, "heldy") == 44) then 
      return true
    else
      return false
    end
  elseif ability == POKEMON_ABILITIES.FLASH then
    if (isInArray(specialabilities[ability], pokemonName) or getItemAttribute(thisball.uid, "heldy") and getItemAttribute(thisball.uid, "heldy") == 40) then 
      return true
    else
      return false
    end    
  elseif ability == POKEMON_ABILITIES.DIG then
    if (isInArray(specialabilities[ability], pokemonName) or getItemAttribute(thisball.uid, "heldy") and getItemAttribute(thisball.uid, "heldy") == 42) then 
      return true
    else
      return false
    end
  end
  if (isInArray(specialabilities[ability], pokemonName)) then 
    return true
  else
    return false
  end

end

function getPokemonBlockTransform(cid, pokemonName)
    local proibidossempre = {"Ditto", "Shiny Ditto", "Mew_", "Mewtwo_", "Unown Legion", "Ho-oh", "Moltres", "Celebi", "Moltres", "Zapdos", "Suicune", "Entei", "Raikou", "Articuno", "Lugia", "Mewtwo", "Mew", "Shiny Rhydon", "Shiny Ariados", "Shiny Magneton", "Shiny Ninetales", "Shiny Politoed", "Shiny Stantler", "Shiny Dodrio", "Shiny Espeon", "Shiny Umbreon", "Shiny Fearow", "Shiny Flareon", "Shiny Vaporeon", "Shiny Jolteon", "Shiny Hypno", "Shiny Golem", "Shiny Vileplume", "Shiny Nidoking", "Shiny Hitmontop"}
    local outpokes = {"Magnet Electabuzz","Elder Tyranitar","Hard Golem","Brute Rhydon","Iron Steelix","Brave Charizard","Elder Charizard","Lava Magmar","Enraged Typhlosion","Capoeira Hitmontop","Boxer Hitmonchan","Taekwondo Hitmonlee","Dragon Machamp","Undefeated Machamp","Wardog Arcanine","Elder Arcanine","Furious Mantine","War Gyarados","Brave Blastoise","Brave Venusaur","Ancient Meganium","Tribal Feraligatr","Elder Dragonite","Elder Pinsir","Elder Raichu","Charged Raichu","Tribal Xatu","Enigmatic Girafarig","Ancient Alakazam","Master Alakazam","Furious Ampharos","Elder Electabuzz","Furious Scyther","Tribal Scyther","War Heracross","Metal Scizor","Brave Nidoking","Brave Nidoqueen","Elder Muk","Dark Crobat","Trickmaster Gengar","Elder Gengar","Banshee Misdreavus","Hungry Snorlax","Brute Ursaring","War Granbull","Singer Wigglytuff","Aviator Pidgeot","Metal Skarmory","Brave Noctowl","Elder Pidgeot","Ancient Dragonite","Milch-Miltank","Ancient Kingdra","Psy Jynx","Elder Venusaur","Elder Jynx","Evil Cloyster","Freezing Dewgong","Elder Tangela","Furious Sandslash","Roll Donphan","Bone Marowak","Octopus Octillery","Moon Clefable","Heavy Piloswine","Elder Blastoise","Elder Tentacruel","Elder Marowak","Master Stantler"}
    if (isInArray(proibidossempre, pokemonName) or isInArray(outpokes, pokemonName)) then 
      doPlayerSendCancel(cid, "Seu ditto não pode se transformar naquele pokémon.")
      return true
    elseif pokemonName == "Ditto" or pokemonName == "Shiny Ditto" then
      doPlayerSendCancel(cid, "Your ditto can't transform into another ditto.")
      return true
    elseif isInArray(proibidosboost, pokemonName) and boost < 50 then --Checa a lista
      doPlayerSendCancel(cid, "Seu ditto não pode se transformar naquele pokémon.")
      return true
    elseif getPlayerLevel(cid) < pokes[pokemonName].level then
      doPlayerSendCancel(cid, "Você não tem nível para se transformar naquele pokémon.")
      return true
    elseif (getPokemonName(getCreatureSummons(cid)[1]) == "Ditto") and pokemonName:match("Shiny (.*)") then
      doPlayerSendCancel(cid, "Seu ditto não pode se transformar naquele pokémon pois é shiny.")
      return true
    elseif (getPokemonName(getCreatureSummons(cid)[1]) == "Ditto") and pokemonName:match("Mega (.*)") then
      doPlayerSendCancel(cid, "Seu ditto não pode se transformar naquele pokémon pois é mega.")
      return true
    else
      return false
    end
end

function getPokemonBlockTransformShiny(cid, pokemonName)
    local proibidossempre = {"Ditto", "Shiny Ditto", "Mew_", "Mewtwo_", "Unown Legion", "Ho-oh", "Moltres", "Celebi", "Moltres", "Zapdos", "Suicune", "Entei", "Raikou", "Articuno", "Lugia", "Mewtwo", "Mew", "Shiny Rhydon", "Shiny Ariados", "Shiny Magneton", "Shiny Ninetales", "Shiny Politoed", "Shiny Stantler", "Shiny Dodrio", "Shiny Espeon", "Shiny Umbreon", "Shiny Fearow", "Shiny Flareon", "Shiny Vaporeon", "Shiny Jolteon", "Shiny Hypno", "Shiny Golem", "Shiny Vileplume", "Shiny Nidoking", "Shiny Hitmontop"}
    local outpokes = {"Magnet Electabuzz","Elder Tyranitar","Hard Golem","Brute Rhydon","Iron Steelix","Brave Charizard","Elder Charizard","Lava Magmar","Enraged Typhlosion","Capoeira Hitmontop","Boxer Hitmonchan","Taekwondo Hitmonlee","Dragon Machamp","Undefeated Machamp","Wardog Arcanine","Elder Arcanine","Furious Mantine","War Gyarados","Brave Blastoise","Brave Venusaur","Ancient Meganium","Tribal Feraligatr","Elder Dragonite","Elder Pinsir","Elder Raichu","Charged Raichu","Tribal Xatu","Enigmatic Girafarig","Ancient Alakazam","Master Alakazam","Furious Ampharos","Elder Electabuzz","Furious Scyther","Tribal Scyther","War Heracross","Metal Scizor","Brave Nidoking","Brave Nidoqueen","Elder Muk","Dark Crobat","Trickmaster Gengar","Elder Gengar","Banshee Misdreavus","Hungry Snorlax","Brute Ursaring","War Granbull","Singer Wigglytuff","Aviator Pidgeot","Metal Skarmory","Brave Noctowl","Elder Pidgeot","Ancient Dragonite","Milch-Miltank","Ancient Kingdra","Psy Jynx","Elder Venusaur","Elder Jynx","Evil Cloyster","Freezing Dewgong","Elder Tangela","Furious Sandslash","Roll Donphan","Bone Marowak","Octopus Octillery","Moon Clefable","Heavy Piloswine","Elder Blastoise","Elder Tentacruel","Elder Marowak","Master Stantler"}
    if (isInArray(proibidossempre, pokemonName) or isInArray(outpokes, pokemonName)) then 
      doPlayerSendCancel(cid, "Seu ditto não pode se transformar naquele pokémon.")
      return true
    elseif pokemonName == "Ditto" or pokemonName == "Shiny Ditto" then
      doPlayerSendCancel(cid, "Your ditto can't transform into another ditto.")
      return true
    elseif isInArray(proibidosboost, pokemonName) and boost < 50 then --Checa a lista
      doPlayerSendCancel(cid, "Seu ditto não pode se transformar naquele pokémon.")
      return true
    elseif getPlayerLevel(cid) < pokes[pokemonName].level then
      doPlayerSendCancel(cid, "Você não tem nível para se transformar naquele pokémon.")
      return true
    elseif (getPokemonName(getCreatureSummons(cid)[1]) == "Ditto") and pokemonName:match("Mega (.*)") then
      doPlayerSendCancel(cid, "Seu ditto não pode se transformar naquele pokémon pois é mega.")
      return true
    else
      return false
    end
end

function rockSmash(cid, itemEx, toPosition)
  local pokemon = getCreatureSummons(cid)[1]
  local pos = getCreaturePosition(pokemon)
  local targetPos = (getDistanceBetween(pos, toPosition) <= 1 and toPosition or
  getPositionAdjacent(pokemon, toPosition, true))

  if (targetPos and isSightClear(pos, targetPos, true) and getDistanceBetween(targetPos, toPosition) <= 1 and
    getPathToEx(pokemon, targetPos)) then
    doCreatureSay(cid, getPokeName(pokemon)..", ".."rock smash!", TALKTYPE_MONSTER)
    doCreatureWalkToPosition(pokemon, targetPos)
    checkRockSmash(pokemon, itemEx, toPosition, 20)
  else
    doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
  end
end

function checkRockSmash(cid, itemEx, toPosition, ticks)
  if (isCreature(cid)) then
    if (getDistanceBetween(getCreaturePosition(cid), toPosition) < 2) then
    local a = getTileItemById(toPosition, itemEx.itemid).uid
    local createDebris = true

    while (a ~= nil and a > 0) do
      if (itemEx.itemid == 1285) or (itemEx.itemid == 1290) or (itemEx.itemid == 3615) then -- Ice Pillar
        doCreateItem(3610, 1, toPosition) -- Ice Block
        createDebris = false

        addEvent(doRemoveItemFromPos, 29000, toPosition, 3610, 1)
        addEvent(function(pos) doCreateItem(3615, 1, pos) end, 30000, toPosition)
      end

      doRemoveItem(a)
      a = getTileItemById(toPosition, itemEx.itemid).uid
    end

    local cidPos = getCreaturePosition(cid)

    doCreatureSetLookDirection(cid, getDirectionTo(cidPos, toPosition))
    doSendDistanceShoot(cidPos, toPosition, PROJECTILE_GRAVEL)
    doSendMagicEffect(toPosition, EFFECT_EARTH_EXPLOSION)

    if (createDebris) then
      doDecayItem(doCreateItem(debris, 1, toPosition))
    end

    -- PokemonAbility.afterRockSmash(getCreatureMaster(cid), cid, toPosition)

    elseif (ticks > 1) then
      addEvent(checkRockSmash, 500, cid, itemEx, toPosition, ticks - 1)
    end
  end
end

local function checkCut(cid, itemEx, toPosition, ticks)
  if (isCreature(cid)) then
    if (getDistanceBetween(getCreaturePosition(cid), toPosition) < 2) then
        doCreatureSetLookDirection(cid, getDirectionTo(getCreaturePosition(cid), toPosition))
        itemEx.uid = getTileItemById(toPosition, itemEx.itemid).uid
        doTransformItem(itemEx.uid, grasses[itemEx.itemid])
        doDecayItem(itemEx.uid)
        doSendMagicEffect(toPosition, 141)
        -- PokemonAbility.afterCut(getCreatureMaster(cid), cid, toPosition)
    elseif (ticks > 1) then
      addEvent(checkCut, 500, cid, itemEx, toPosition, ticks - 1)
    end
  end
end

function cut(cid, itemEx, toPosition)
    local pokemon = getCreatureSummons(cid)[1]
    local pos = getCreaturePosition(pokemon)
    local targetPos = (getDistanceBetween(pos, toPosition) <= 1 and toPosition or
    getPositionAdjacent(pokemon, toPosition, true))
    if (targetPos and isSightClear(pos, targetPos, true) and getDistanceBetween(targetPos, toPosition) <= 1 and
        getPathToEx(pokemon, targetPos)) then
        doCreatureSay(cid, getPokeName(pokemon)..", ".."cut it!", TALKTYPE_MONSTER)
        doCreatureWalkToPosition(pokemon, targetPos)
        checkCut(pokemon, itemEx, toPosition, 20)
    else
        doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
    end
end

local TRANSFORM_EXHAUST_CONDITION = createConditionObject(CONDITION_EXHAUST, 20 * 60 * 1000 + 1, false, CONDITION_SUBID.EXHAUST.ABILITYTRANSFORM)

function doAbilitieTransform(cid, pokemon, target, targetName, afterDismount)
  if (getCreatureCondition(pokemon, CONDITION_EXHAUST, 6)) then
    doPlayerSendCancel(cid, "Your Pokemon is exhaust.")

  else

        if (not targetName) then
            targetName = getPokeName(target)
        end

        if (getPokeName(pokemon) == "Ditto") then
            if (not afterDismount) then
                if (getPokemonBlockTransform(cid, targetName)) then
                    return
                end
            end
        elseif (getPokeName(pokemon) == "Shiny Ditto") then
            if (not afterDismount) then
                if (getPokemonBlockTransformShiny(cid, targetName)) then
                    return
                end
            end  
        end          

        local x = pokes[getPokeName(pokemon)]
        if getPlayerLevel(cid) < x.level then   --alterado v1.8 \/
            doPlayerSendCancel(cid, "You need level "..(x.level + boosts).." to use this pokemon.")
            return 
        end

        local ball = getPlayerSlotItem(cid, 8)

        doCreatureSetStorage(pokemon, 7505, targetName)
        doFaceCreature(pokemon, getThingPos(target))
        doDittoTransform(pokemon, getPokeName(target))
  end
end

function light(cid)
  local pokemon = getCreatureSummons(cid)[1]
  doCreatureSay(cid, getPokeName(pokemon)..", ".."turn on the lights!", TALKTYPE_MONSTER)
  doAddCondition(pokemon, lightCondition)
  doSendMagicEffect(getCreaturePosition(pokemon), 14)
end

function deLight(cid)
  local pokemon = getCreatureSummons(cid)[1]

  doCreatureSay(cid, getPokeName(pokemon)..", ".."turn off the lights!", TALKTYPE_MONSTER)
  doRemoveCondition(pokemon, CONDITION_LIGHT)
  doSendMagicEffect(getCreaturePosition(pokemon), 14)
end

local function checkDig(cid, itemEx, toPosition, ticks)
  if (isCreature(cid)) then
    if (getDistanceBetween(getCreaturePosition(cid), toPosition) < 2) then
      local cidPos = getCreaturePosition(cid)

      doCreatureSetLookDirection(cid, getDirectionTo(cidPos, toPosition))
      itemEx.uid = getTileItemById(toPosition, itemEx.itemid).uid
      doTransformItem(itemEx.uid, holes[itemEx.itemid])
      addEvent(doTransformItem, 10000, holes[itemEx.itemid], itemEx.uid)
      -- doDecayItem(itemEx.uid)
      doSendDistanceShoot(cidPos, toPosition, 30)
      doSendMagicEffect(toPosition, 25)
      doCreatureWalkToPosition(cid, getCreaturePosition(cid)) -- Stop Walk

    elseif (ticks > 1) then
      addEvent(checkDig, 500, cid, itemEx, toPosition, ticks - 1)
    end
  end
end

function dig(cid, itemEx, toPosition)
  local pokemon = getCreatureSummons(cid)[1]
    local pos = getCreaturePosition(pokemon)
    local targetPos = (getDistanceBetween(pos, toPosition) <= 1 and toPosition or
            getPositionAdjacent(pokemon, toPosition, true))

    if (targetPos and isSightClear(pos, targetPos, true) and getDistanceBetween(targetPos, toPosition) <= 1 and
      getPathToEx(pokemon, targetPos)) then
      doCreatureSay(cid, getPokeName(pokemon)..", ".."dig it!", TALKTYPE_MONSTER)
      doCreatureWalkToPosition(pokemon, targetPos)
      checkDig(pokemon, itemEx, toPosition, 20)
    else
      doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
    end
end

function canBlink(cid, pokemon)
    local thisball = getPlayerSlotItem(cid, 8)
    local time = {}
    local Tiers = {
      [116] = {bonus = Blink1},
    }
    local Tier = getItemAttribute(thisball.uid, "heldx")
    if Tier and Tier == 116 then
      time = math.ceil((isShinyName(getCreatureName(pokemon)) and 15 or 20) - (isShinyName(getCreatureName(pokemon)) and 15 or 20) * Tiers[Tier].bonus)
    else
      time = isShinyName(getCreatureName(pokemon)) and 15 or 20
    end

    return getCreatureStorage(cid, playersStorages.blink) == -1 or
            (os.time() - getCreatureStorage(cid, playersStorages.blink)) >= time
end

function blink(cid, toPosition)
  local pokemon = getCreatureSummons(cid)[1]
  local pokemonPosition = getThingPos(pokemon)

  doCreatureSay(cid, getPokeName(pokemon)..", ".."blink!", TALKTYPE_MONSTER)
  doTeleportThing(pokemon, toPosition, false)
  doSendMagicEffect(pokemonPosition, 134)
  doSendMagicEffect(toPosition, 134)
  doCreatureSetStorage(cid, playersStorages.blink, os.time())

  local thisball = getPlayerSlotItem(cid, 8)
  local time = {}
  local Tiers = {
    [116] = {bonus = Blink1},
  }
  local Tier = getItemAttribute(thisball.uid, "heldx")
  if Tier and Tier == 116 then
    time = math.ceil((isShinyName(getCreatureName(pokemon)) and 15 or 20) - (isShinyName(getCreatureName(pokemon)) and 15 or 20) * Tiers[Tier].bonus)
  else
    time = isShinyName(getCreatureName(pokemon)) and 15 or 20
  end

  doPlayerSendPokemonStatusAdd(cid, 19776, time)
end

local function checkFly(cid, pokemon, playerPosition, ticks)
local Tiers = {
  [15] = {speed = Wing1},
  [16] = {speed = Wing2},
  [17] = {speed = Wing3},
  [18] = {speed = Wing4},
  [19] = {speed = Wing5},
  [20] = {speed = Wing6},
  [21] = {speed = Wing7},
}
local Tier = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "heldy")
local Wingspeed = {}

  if (isCreature(cid) and isCreature(pokemon)) then
      local toPosition = getCreaturePosition(cid)
      if (getSamePosition(toPosition, playerPosition)) then -- If the player moves, we cannot secure that this is a mountable position

        if getPlayerStorageValue(cid, 6598754) == 1 or getPlayerStorageValue(cid, 6598755) == 1 then 
          return doPlayerSendCancel(cid, "Você não pode fazer isso enquanto estiver na Zona PVP!")   --alterado v1.7
        end

        if #getCreatureSummons(cid) > 1 then         --alterado v1.9
          return doPlayerSendCancel(cid, "Você não pode fazer isso agora!")
        end

        if getPlayerStorageValue(cid, 5700) >= 1 then   --alterado v1.9
          doPlayerSendCancel(cid, "Você não pode fazer isso enquanto está montado em uma bicicleta!") 
          return true
        end    

        local outfit = getCreatureOutfit(cid)
        local outHabil = {1035, 1034}
        if isInArray(outHabil, outfit.lookType) then 
          doPlayerSendCancel(cid, "Desculpe, mas você não pode voar nesta área.")
          return true
        end

        if getPlayerStorageValue(cid, 154585) >= 1 or getPlayerStorageValue(cid, 154585) >= 1 then   --alterado v1.9
          doPlayerSendCancel(cid, "Você não pode fazer isso enquanto está pescando!") 
          return true
        end   

        if getPlayerStorageValue(cid, 22545) >= 1 and (isInArray(skills["fly"], getPokemonName(mysum)) or isInArray(skills["levitate_fly"], getPokemonName(mysum))) then       
          return doPlayerSendCancel(cid, "Você não pode fazer isso enquanto estiver na Golden Arena!")                          --alterado v1.8
        end

        -- if not isPremium(cid) then
            -- doPlayerSendCancel(cid, "Você precisa de premium para subir no fly") 
            -- return true
        -- end   

        if (getDistanceBetween(getCreaturePosition(pokemon), toPosition) < 2) then
            local pokemon = getCreatureSummons(cid)[1]
            local name = getPokemonName(pokemon)

            local outfit = getCreatureOutfit(cid)
            local outHabil = {1035, 1034}
            if isInArray(outHabil, outfit.lookType) then 
              doPlayerSendCancel(cid, "Sorry, but you can't fly this area.")
                return true
            end

            local pokemonfly = flys[getCreatureName(pokemon)]
            doPlayerSendTextMessage(cid, 27, "Type \"up\" or \"h1\" to fly/levitate higher and \"down\" or \"h2\" to fly/levitate lower.") --alterado v1.8
            doChangeSpeed(cid, -getCreatureSpeed(cid))
            if Tier and Tier > 14 and Tier < 22 then
               Wingspeed = Tiers[Tier].speed
            else
               Wingspeed = 0
            end
            local speed = (pokemonfly[2] + (PlayerSpeed * 0.5) + Wingspeed)
            doChangeSpeed(cid, speed)
            setPlayerStorageValue(cid, 54844, speed)
            doSetCreatureOutfit(cid, {lookType = pokemonfly[1] + 351}, -1)
            doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "hp", getCreatureHealth(getCreatureSummons(cid)[1]) / getCreatureMaxHealth(getCreatureSummons(cid)[1]))
            doRemoveCreature(getCreatureSummons(cid)[1])
            setPlayerStorageValue(cid, 17000, 1)

            if #getCreatureSummons(cid) > 1 and getPlayerStorageValue(cid, 212124) <= 0 then --alterado v1.6
                if getPlayerStorageValue(cid, 637501) == -2 or getPlayerStorageValue(cid, 637501) >= 1 then 
                    BackTeam(cid) 
                end
            end

            -- temGhostMix(cid, (getPlayerSlotItem(cid, 8)))
            -- temAuraMix(cid, (getPlayerSlotItem(cid, 8)))

            if getCreatureOutfit(cid).lookType == 667 or getCreatureOutfit(cid).lookType == 999 then
              markPosEff(cid, getThingPos(cid))
              sendMovementEffect(cid, 136, getThingPos(cid))     --edited efeito quando anda com o porygon
            end
            local item = getPlayerSlotItem(cid, 8)
            if getItemAttribute(item.uid, "boost") and getItemAttribute(item.uid, "boost") >= 50 and getPlayerStorageValue(cid, 42368) <= 0 then  
              sendAuraEffect(cid, auraSyst[getItemAttribute(item.uid, "aura")])              --alterado v1.8
            end
            if useOTClient then
              doPlayerSendCancel(cid, '12//,hide') --alterado v1.8
            end

            if (name == "Porygon") then
                doSendMagicEffect(getCreaturePosition(cid), 672)
            end

          elseif (ticks > 1) then
              doAddCondition(pokemon, POKEMON_FAST_MOUNT_CONDITION) -- Speed up Pokemon reaching player
              addEvent(checkFly, 500, cid, pokemon, playerPosition, ticks - 1)
          end
      end   
  end
end

function fly(cid)
  local toPosition = getCreaturePosition(cid)
  local pokemon = getCreatureSummons(cid)[1]
  local targetPos = getPositionAdjacent(pokemon, toPosition, true)
  local pos = getCreaturePosition(pokemon)

  if ((not targetPos and getDistanceBetween(pos, toPosition) <= 1) or
          (targetPos and isSightClear(pos, targetPos, true) and getDistanceBetween(targetPos, toPosition) <= 1 and
                  getPathToEx(pokemon, targetPos))) then
    doCreatureSay(cid, getPokeName(pokemon)..", ".."let's fly!", TALKTYPE_MONSTER)

        -- Guardian
    if getPlayerCurrentGuardian(cid) then
        doPlayerSendTextMessage(cid, 27, "Seu Guardian Possui (" .. math.ceil(exhaustion.get(getPlayerCurrentGuardian(cid), 11) / 60) .. ") Minutos Restantes.")
        doPlayerSetStorageValue(cid, 9005, exhaustion.get(getPlayerCurrentGuardian(cid), 11))
        doPlayerSetStorageValue(cid, 9006, getCreatureName(getPlayerCurrentGuardian(cid)))
        doRemoveCreature(getPlayerCurrentGuardian(cid))
    end
        --
    if (targetPos) then
        doCreatureWalkToPosition(pokemon, targetPos)
    end
    checkFly(cid, pokemon, toPosition, 20)
    doSendPlayerExtendedOpcode(cid, 166, "dive")
    doSendPlayerExtendedOpcode(cid, 168, "diveUp")
  else
        doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
  end
end

function deFlyRide(cid)

  if isInArray({460, 11675, 11676, 11677}, getTileInfo(getThingPos(cid)).itemid) then
    doPlayerSendCancel(cid, "Você não pode parar de voar nesta altura!")
    return true
  end

    local item = getPlayerSlotItem(cid, 8)
    local pokemon = getItemAttribute(item.uid, "poke")
    local x = pokes[pokemon]

    if getTileInfo(getThingPos(cid)).itemid >= 4820 and getTileInfo(getThingPos(cid)).itemid <= 4825 then
      doPlayerSendCancel(cid, "Você não pode parar de voar acima da água!")
      return true
    end

    if getPlayerStorageValue(cid, 9005) > 0 then
      doSummonGuardian(cid, getPlayerStorageValue(cid, 9006))
      local pk = getCreatureGuardians(cid)[1]
      adjustGuardianPoke(pk, 1000, getPlayerStorageValue(cid, 9006), cid)
    end

    doSummonMonster(cid, pokemon)

    local pk = getCreatureSummons(cid)[1]

    if not isCreature(pk) then
      pk = doCreateMonster(pokemon, backupPos)
      if not isCreature(pk) then
        doPlayerSendCancel(cid, "Você não pode parar de voar / andar aqui.")
        return true
      end
      doConvinceCreature(cid, pk)
    end

    doTeleportThing(pk, getThingPos(cid), false)
    doCreatureSetLookDir(pk, getCreatureLookDir(cid))

    adjustStatus(pk, item.uid, true, false, true)

    doCreatureSay(cid, pokemon..", ".."deixe-me descer!", TALKTYPE_MONSTER)
  
    doRegainSpeed(cid)

    doSendPlayerExtendedOpcode(cid, 167, "dive")
    doSendPlayerExtendedOpcode(cid, 169, "diveUp")
    
    doRemoveCondition(cid, CONDITION_OUTFIT)
    setPlayerStorageValue(cid, 17000, -1)
    setPlayerStorageValue(cid, 17001, -1)

    if isPremium(cid) then
        doCreatureSetSkullType(cid, 2)
    else
        doCreatureSetSkullType(cid, 0)
    end

    -- temGhostMix(cid, (getPlayerSlotItem(cid, 8)))
    -- temAuraMix(cid, (getPlayerSlotItem(cid, 8)))
  
    if useOTClient then
        doUpdateMoves(cid)
        doPlayerSendCancel(cid, '12//,show') --alterado aki
    end

end


local function checkRide(cid, pokemon, playerPosition, ticks)
    if (isCreature(cid) and isCreature(pokemon)) then
        local toPosition = getCreaturePosition(cid)
        if (getSamePosition(toPosition, playerPosition)) then -- If the player moves, we cannot secure that this is a mountable position
            if (getDistanceBetween(getCreaturePosition(pokemon), toPosition) < 2) then

                if getPlayerStorageValue(cid, 6598754) == 1 or getPlayerStorageValue(cid, 6598755) == 1 then 
                    return doPlayerSendCancel(cid, "Você não pode fazer isso enquanto estiver na Zona PVP!")   --alterado v1.7
                end

                if #getCreatureSummons(cid) > 1 then         --alterado v1.9
                    return doPlayerSendCancel(cid, "Você não pode fazer isso agora!")
                end

                if getPlayerStorageValue(cid, 5700) >= 1 then   --alterado v1.9
                    doPlayerSendCancel(cid, "Você não pode fazer isso enquanto está montado em uma bicicleta!") 
                    return true
                end 

                if getPlayerStorageValue(cid, 154585) >= 1 or getPlayerStorageValue(cid, 154585) >= 1 then   --alterado v1.9
                    doPlayerSendCancel(cid, "Você não pode fazer isso enquanto está pescando!") 
                    return true
                end   

                local pct = getCreatureHealth(getCreatureSummons(cid)[1]) / getCreatureMaxHealth(getCreatureSummons(cid)[1])
                doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "hp", 1 - pct)

                local pokemon = rides[getPokemonName(getCreatureSummons(cid)[1])]
                doChangeSpeed(cid, -getCreatureSpeed(cid))
                local speed = pokemon[2] + PlayerSpeed + getSpeed(sid)
                doChangeSpeed(cid, speed)
                setPlayerStorageValue(cid, 54844, speed)
                doSetCreatureOutfit(cid, {lookType = pokemon[1] + 351}, -1)
                doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "hp", getCreatureHealth(getCreatureSummons(cid)[1]) / getCreatureMaxHealth(getCreatureSummons(cid)[1]))
                doRemoveCreature(getCreatureSummons(cid)[1])
                setPlayerStorageValue(cid, 17001, 1)


                -- Guardian
                if getPlayerCurrentGuardian(cid) then
                  doPlayerSendTextMessage(cid, 27, "Seu Guardian Possui (" .. math.ceil(exhaustion.get(getPlayerCurrentGuardian(cid), 11) / 60) .. ") Minutos Restantes.")
                  doPlayerSetStorageValue(cid, 9005, exhaustion.get(getPlayerCurrentGuardian(cid), 11))
                  doPlayerSetStorageValue(cid, 9006, getCreatureName(getPlayerCurrentGuardian(cid)))
                  doRemoveCreature(getPlayerCurrentGuardian(cid))
                end
                --
              
                -- temGhostMix(cid, (getPlayerSlotItem(cid, 8)))
                -- temAuraMix(cid, (getPlayerSlotItem(cid, 8)))

                local item = getPlayerSlotItem(cid, 8)
                if getItemAttribute(item.uid, "boost") and getItemAttribute(item.uid, "boost") >= 50 and getPlayerStorageValue(cid, 42368) <= 0 then   
                  sendAuraEffect(cid, auraSyst[getItemAttribute(item.uid, "aura")])                     --alterado v1.8
                end

                if useOTClient then
                  doPlayerSendCancel(cid, '12//,hide') --alterado v1.8
                end

            elseif (ticks > 1) then
                doAddCondition(pokemon, POKEMON_FAST_MOUNT_CONDITION) -- Speed up Pokemon reaching player
                addEvent(checkRide, 500, cid, pokemon, playerPosition, ticks - 1)
            end
        end
    end
end

function ride(cid)
    local toPosition = getCreaturePosition(cid)
    local pokemon = getCreatureSummons(cid)[1]
    local targetPos = getPositionAdjacent(pokemon, toPosition, true)
    local pos = getCreaturePosition(pokemon)

    if ((not targetPos and getDistanceBetween(pos, toPosition) <= 1) or
            (targetPos and isSightClear(pos, targetPos, true) and getDistanceBetween(targetPos, toPosition) <= 1 and
                    getPathToEx(pokemon, targetPos))) then
        doCreatureSay(cid, getPokeName(pokemon)..", ".."let's ride!", TALKTYPE_MONSTER)
        -- Guardian
        if getPlayerCurrentGuardian(cid) then                 
            doPlayerSendTextMessage(cid, 27, "Seu Guardian Possui (" .. math.ceil(exhaustion.get(getPlayerCurrentGuardian(cid), 11) / 60) .. ") Minutos Restantes.")
            doPlayerSetStorageValue(cid, 9005, exhaustion.get(getPlayerCurrentGuardian(cid), 11))
            doPlayerSetStorageValue(cid, 9006, getCreatureName(getPlayerCurrentGuardian(cid)))
            doRemoveCreature(getPlayerCurrentGuardian(cid))
        end
        --
        if (targetPos) then
            doCreatureWalkToPosition(pokemon, targetPos)
        end
        checkRide(cid, pokemon, toPosition, 20)
    else
        doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
    end
end
