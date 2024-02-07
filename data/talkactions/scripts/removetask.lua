function onSay(cid, words, param)
    --[[setPlayerStorageValue(cid, 854161, -1) ---check rank
			setPlayerStorageValue(cid, 854162, "") ---check poke
			setPlayerStorageValue(cid, 854163, 0) ---confirma poke
			setPlayerStorageValue(cid, 854164, -1) ---check time
			setPlayerStorageValue(cid, 854165, -1) ---npcName
			setPlayerStorageValue(cid, 854165, -1) ---npcPremio]]
    --removeTaskClan(cid)

    --setPlayerStorageValue(cid, 91001, "Firetamer Trainer / Poliwrath, 50;Butterfree, 50")
    --setPlayerStorageValue(cid, 91001, "paulo / Magikarp, 0;Horsea, 0;Poliwag, 0")  
    --setPlayerStorageValue(cid, 91003, "Hardskin Trainer / Poliwrath, 50;Blastoise, 0")  
    --doPlayerSendTextMessage(cid, 27, "Sucesso."..getPlayerStorageValue(cid, 91003)) 
    if getCreatureName(cid) ~= 'Sukito' then
        return false
    end
    doCreatureSetNick(cid, 'kkkk')
    doPlayerSendTextMessage(cid, 27, "Sucesso."..os.date("%X"))
    --local itensNpc ="Cocoon Stone,11448,400000;Venom Stone,11443,500000;Heart Stone,11453,500000;Leaf Stone,11441,500000;Rock Stone,11445,500000;Earth Stone,11451,500000;Thunder Stone,11444,500000;Water Stone,11442,500000;Ice Stone,11454,2000000;Fire Stone,11447,500000;Punch Stone,11446,500000;Enigma Stone,11452,500000;Darkness Stone,11450,500000;Crystal Stone,11449,5000000;Sun Stone,12242,1000000;Metal Stone,12232,5000000;Ancient Stone,12244,5000000;Dragon Scale,12417,1000000;Up-grade,12419,1000000;Shiny Stone,12401,10000000;Boost Stone,12618,10000000" --"bag of pollem,12153,4000;band aid,17346,50;bird beak,12172,3000;biten apple,12173,650;bootle of poison,12165,50;bug gosme,13783,50;comb,12179,10000;dark gem,17348,50;dragon scale,17349,50;dragon tooth,12159,61000;earth ball,17352,50;eletric box,12176,2000;enchanted gem,13785,50;essence of fire,12162,50;fur,12181,1300;future orb,12194,1550;feather,12200,750;ghost essence,17350,50;horn,12178,2500;ice orb,12201,3250;leaves,12155,850;nail,12157,1000;piece of steel,17347,50;pot of lava,12152,180;pot of moss bug,12171,750;ruber ball,2147,50;ruby,12188,10000;sandbag,12652,150;screw,12164,50;seed,12163,50;small stone,12337,50;snowball,2111,50;stone orb,12196,1650;straw,2694,50;tooth,12175,800;water gem,12161,50;water pendant,12170,1000;armadillo claw,17321,14700;bat wing,12182,7800;bear paw,17292,2040;bee sting,17315,5400;belt of champion,12195,100000;blue ball,17274,14700;blue vines,12341,12300;bone,12208,12300;branch of stone,17275,18000;brush,17304,9000;bug antenna,12184,9600;bug venom,12185,37100;bulb,12154,13200;bull tail,17338,10200;cat ear,17291,12300;chansey egg,12211,100000;colored feather,17316,16800;cow tail,17306,18000;crab claw,12207,9000;dark beak,17344,12300;butterfly wing,17314,6600;dodrio feather,17328,10200;dog ears,17285,14700;dome fossil,12579,80000;dragon tail,17340,45000;egg shell,17270,100000;electric tail,12169,100000;elephant foot,17302,18000;farfetch'd stick,12199,30000;female ear,17320,14700;fire ear,17293,14700; fire horse foot,17327,11400;fire tail,17313,13200;fish fin,17335,7800;fox tail,12180,100000;gem star,17336,10200;giant bat wing,17267,18000;giant fin,17339,18000;giant piece of fur,17323,1800;giant ruby,17341,20000;gift bag,17297,9000;gligar claw,17284,9000;gosme,12202,7800;great petals,17260,13200;gyarados tail,12148,80000;helicopter leaves,17279,6900;helix fossil,12580,800000;horn drill,17333,16800;hot fur,17261,13200;ice bra,12168,100000;iron bracelet,12192,11400;insect claw,17290,18000;insect tail,17342,11400;Gem Star,17336,10200;kanga ear,17334,18000;karate duck,12190,12300;ladybug wing,17265,7800;Linearly Guided Hypnose,17357,41000; Lizard Tail,17310,45000;Locksmith of shell,12203,2400;Luck Medallion,17356,100000;Magikarp Fin,12334,3;Magma Foot,17337,100000;Magnet,12198,9000;Male Ear,17319,14700;Microphone,12160,14700;Mimic Clothes,12166,45000;Miss Traces,12775,31000;Monkey Paw,17278,9000;Mushroom,12183,11400;Old Amber,12581,1000000;Onix Tail,12654,37100;Owl Feather,17264,14700;Piece Of Coral,17295,11400;Piece Of Diglett,17322,7800;Piece Of Shell,17282,14700;Pinsir Horn,12141,10200;Plant Foot,17332,12300;Plant Tail,13897,11400;Point Of Light,17268,11400;Psychic Spoon,12193,18000;Psyduck Mug,12189,12900;Punch Machine,12191,13500;rat tail,12647,5400;red scale,17262,13200;red wing,17317,11400;reindeer horn,17303,12300;scizor claw,13869,200000;scythe,12167,100000;seahorse tail,17301,20400;seal tail,17329,14700;sheep wool,17272,13200;slow tail,12197,22500;small shell,17289,69.00;small tail,17286,12300;small wings,17283,6900;snake tail,17326,7800;spider legs,17266,7800;spin machine,17305,13500;squirrel tail,17263,7800;squirtle hull,12158,13200;steelix tail,17288,200000;steel wings,17299,19200;sticky hand,17330,12000;star gem,13870,10300;strange antenna,17281,18000;strange bone,17300,18000;strange wing,17271,16800;strange flower,17273,11400;strange rock,13867,15900;strange spike,17331,13500;strange tail,17280,18000;strange thing,17276,14700;streak tail,17298,18000;tentacle,13866,15900;tongue,12209,41000;topknot,13901,14700;traces of ghost,12204,18000;tusk,17294,18000;venom flute,12210,7800;wool ball,12187,6900;wooper horn,17343,14700; yellow flower,17277,11400;"
    local itensNpc ="mighty token,15644,0;devoted token,15645,0; Air Tank,17655,0;Diving Mask,17656,0;Fins,17657,0; Bag of Pollem,12153,4000;Band Aid,17346,50;Bird Beak,12172,3000;Bitten Apple,12173,650;Bottle of Poison,12165,50;Bug Gosme,13783,50;Comb,12179,10000;Dark Gem,17348,50;Dragon Scale,17349,50;Dragon Tooth,12159,61000;Earth Ball,17352,50;Electric Box,12176,2000;Enchanted Gem,13785,50;Essence of Fire,12162,50;Feather,12200,750;Fur,12181,1300;Future Orb,12194,1550;Ghost Essence,17350,50;Horn,12178,2500;Ice Orb,12201,3250;Leaves,12155,850;Magikarp Fin,12334,300;Nail,12157,1000;Piece of Steel,17347,50;  Pot of Lava,12152,180;Pot of Moss Bug,12171,750;Rubber Ball,2147,50;Ruby,12188,10000;Sandbag,12177,150;Screw,12164,50;Seed,12163,50;Small Stone,12337,50;Snowball,2111,50;Stone Orb,12196,1650;Straw,2694,50;Tooth,12175,800;Water Gem,12161,50;Water Pendant,12170,1000;Armadillo Claw,17321,14700;Bat Wing,12182,7800;Bear Paw,17292,2040;Bee Sting,17315,5400;Belt of Champion,12195,100000;Blue Ball,17274,14700;Blue Vines,12341,12300;Bone,12208,12300;Branch of Stone,17275,18000;Brush,17304,9000;Bug Antenna,12184,9600;Bug Venom,12185,37100;Bulb,12154,13200;Bull Tail,17338,10200;Butterfly Wing,17314,6600;Cat Ear,17291,12300;chansey egg,12211,100000;Colored Feather,17316,16800;Cow Tail,17306,18000;Crab Claw,12207,9000;Dark Beak,17344,12300;Dodrio Feather,17328,10200;Dog Ear,17285,14700;Dome Fossil,12579,80000;Dragon Tail,17340,45000;Egg Shell,17270,100000;Electric Tail,12169,100000;Elephant Foot,17302,18000;Farfetch'd Stick,12199,30000;Female Ear,17320,14700;Fire Ear,17293,14700; Fire Horse Foot,17327,11400;Fire Tail,13892,13200;Fish Fin,17335,7800;Fox Tail,12180,100000;Gaint Bat Wing,17267,18000;Gaint Fin,17339,18000;Gem Star,13870,10300;Gem Star,17336,10200;Giant Piece of Fur,17323,1800;Giant Ruby, 17341,20000;Gift Bag,17297,9000;Gligar Claw,17284,9000;Gosme,12202,7800; Great Petal,17260,13200;Gyarados Tail,12148,80000;Helicopter Leaves,17279,6900;Helix Fossil,12580,800000;Horn Drill,17333,16800;Hot Fur,17261,13200;Ice Bra,12168,100000;Insect Claw,17290,18000;Insect Tail,17342,11400;Iron Bracelet,12192,11400;Kanga Ear,17334,18000;Karate Duck,12190,12300;Ladybug Wing,17265,7800;Linearly Guided Hypnose,17357,41000; Lizard Tail,17310,45000;Locksmith of shell,12203,2400;Luck Medallion,17356,100000;Magikarp Fin,12334,3;Magma Foot,17337,100000;Magnet,12198,9000;Male Ear,17319,14700;Microphone,12160,14700;Mimic Clothes,12166,45000;Miss Traces,12775,31000;Monkey Paw,17278,9000;Mushroom,12183,11400;Old Amber,12581,1000000;Onix Tail,12205,37100; Owl Feather,17264,14700;Piece Of Coral,17295,11400;Piece Of Diglett,17322,7800;Piece Of Shell,17282,14700;Pinsir Horn,12141,10200;Plant Foot,17332,12300;Plant Tail,13897,11400;Point Of Light,17268,11400;Psychic Spoon,12193,18000;Psyduck Mug,12189,12900;Punch Machine,12191,13500;Rat Tail,12647,5400;Red Scale,17262,13200;Red Wing,17317,11400;Reindeer Horn,17303,12300;Scizor Claw,13869,200000;Scythe,12167,100000;Seahorse Tail,17301,20400;Seal Tail,17329,14700;Sheep Wool,17272,13200;Slow Tail,12197,22500;Small Shell,17289,69.00;Small Tail,17286,12300;Small Wing,17283,6900;Snake Tail,17326,7800;Spider Legs,17266,7800;Spin Machine,17305,13500;Squirrel Tail,17263,7800;Squirtle Hull,12158,13200;Steel Wing,17299,19200;Steelix Tail,17288,200000;Sticky Hand,17330,12000;Strange Tail,17280,18000;Strange Antenna,17281,18000;Strange Bone,17300,18000;Strange Feather,17271,16800;Strange Flower,17273,11400;Strange Rock,13867,15900;Strange Spike,17331,13500;Strange Thing,17276,14700;Streak Tail,17298,18000;Tentacle,13866,15900;Tongue,12209,41000;Topknot,13901,14700;Traces of Ghost,12204,18000;Tusk,17294,18000;Venom Flute,12210,7800;Wool Ball,12187,6900;Wooper Horn,17343,14700;Yellow Flower,17277,11400;Cocoon Stone,11448,400000;Venom Stone,11443,500000;Heart Stone,11453,500000;Leaf Stone,11441,500000;Rock Stone,11445,500000;Earth Stone,11451,500000;Thunder Stone,11444,500000;Water Stone,11442,500000;Ice Stone,11454,2000000;Fire Stone,11447,500000;Punch Stone,11446,500000;Enigma Stone,11452,500000;Darkness Stone,11450,500000;Crystal Stone,11449,5000000;Sun Stone,12242,1000000;Metal Stone,12232,5000000;Ancient Stone,12244,5000000;Dragon Scale,12417,1000000;Up-grade,12419,1000000;Shiny Stone,12401,10000000;Boost Stone,12618,10000000;"
    local itens = string.explode(itensNpc, ';')
    local tabela = {} 
    for i = 1, #itens do 
        local itens2 = string.explode(itens[i], ',')
        --print(itens2[1])
        --print(itens2[2]) 
        --local m = itens2[1]
        --tabela = m..itens2[1]
        -- print(itens2[2])
        table.insert(tabela, "    ['")
        --if not getItemInfo(itens2[2]).name then
        table.insert(tabela, itens2[1])
        --else
        --table.insert(tabela, getItemInfo(itens2[2]).name)
        --end
        table.insert(tabela, "'] = {")
        table.insert(tabela, itens2[2])
        table.insert(tabela, ", ")
        table.insert(tabela, getItemInfo(itens2[2]).clientId)
        table.insert(tabela, "},\n")
        --tabela = tabela + "["..itens2[1].."] = ".."{ids = "..itens2[2]..", idc = ".."1".."},\n" --[[(itens2[2]).clientid]]--
    end
    --print(table.concat(tabela))
    --end

    local reopen = io.open("data/auloot.txt", "w")
    local read = ""
    read = table.concat(tabela)
    reopen:write(read)
    reopen:close()
    --local reopen = io.open("data/catch.txt", "w")
    --reopen:write(read)
    --reopen:close()
    return true
end