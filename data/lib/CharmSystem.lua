shinyCharm = {
"Venusaur", "Charizard", "Blastoise", "Butterfree", "Pidgeot", "Rattata", "Raticate", "Raichu", "Zubat", "Golbat", "Paras", "Parasect", 
"Venonat", "Venomoth", "Growlithe", "Arcanine", "Abra", "Alakazam", "Tentacool", "Tentacruel", "Farfetch'd", "Grimer", "Muk", "Gengar", "Krabby", 
"Kingler", "Voltorb", "Electrode", "Cubone", "Marowak", "Hitmonlee", "Hitmonchan", "Horsea", "Seadra", "Jynx", "Electabuzz", "Pinsir", 
"Magikarp", "Magmar", "Typhlosion", "Xatu", "Tauros", "Crobat", "Feraligatr", "Meganium", "Ampharos", "Mr. Mime",
"Magcargo", "Machamp", "Snorlax", "Pupitar", "Dragonite", "Scyther", "Dragonair", "Dratini", "Lanturn", "Tangela", "Beedrill",
"Giant Magikarp", "Gyarados"} 

megaCharm = {"Beedrill", "Blaziken", "Houndoom", "Pidgeot", "Pinsir", "Sceptile", "Scizor", "Swampert"}

bossName = {"Magmortar", "Electivire", "Dusknoir", "Milotic", "Rhyperior", "Metagross", "Salamence", "Slaking", "Tangrowth"}

hoeenPoke = {"Treecko", "Grovily", "Sceptile", "Torchic", "Combusken", "Blaziken", "Poochyena", "Mightyena", "Wurmple", "Cascoon", "Silcoon", "Dustox", "Beautifly", "Lombre", "Ludicolo", "Seedot", "Nuzleaf", "Shiftry", "Nincada", "Ninjask", "Shedinja", "Taillow", "Swellow", "Shroomish", "Breloom", "Wingull", "Pelipper", "Masquerain", "Wailmer", "Wailord", "Skitty", "Delcatty", "Baltoy", "Claydol", "Torkoal", "Sableye", "Trapinch", "Vibrava", "Flygon", "Makuhita", "Hariyama", "Electrike", "Manectric", "Numel", "Camerupt", "Spheal", "Sealeo", "Walrein", "Cacnea", "Cacturn", "Snorunt", "Glalie", "Spoink", "Grumpig", "Mawile", "Meditite", "Medicham", "Swablu", "Altaria", "Duskull", "Dusclops", "Slakoth", "Vigoroth", "Gulpin", "Swalot", "Tropius", "Whismur", "Loudred", "Exploud", "Shuppet", "Banette", "Seviper", "Zangoose", "Aron", "Lairon", "Aggron", "Ralts", "Kirlia", "Gardevoir", "Bagon", "Shelgon", "Beldum", "Metang"}


---- // pokes shinys/megas/boss que existem no game e o shiny charm pode chamar ao ser ativado // ---

function isWild(cid)
    if not isCreature(cid) then return false end
    if not isSummon(cid) and isMonster(cid) then
        return true 
    end
    return false
end

function isShinyCharm(name)
    return isInArray(shinyCharm, doCorrectString(name))
end

function isMegaCharm(name)
    return isInArray(megaCharm, doCorrectString(name))
end

function isVirusCharm(name)
    return isInArray(virusCharm, doCorrectString(name))
end

function isPokeOutland(name)
    return isInArray(outland, doCorrectString(name))
end

function isBoss(name)
    return isInArray(bossName, doCorrectString(name))
end

function isHoenn(name)
    return isInArray(hoeenPoke, doCorrectString(name))
end
