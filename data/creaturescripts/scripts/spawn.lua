local shinys = {"Venusaur", "Charizard", "Blastoise", "Butterfree",  
	"Pidgeot", "Rattata", "Raticate", "Raichu", 
	-- "Zubat", "Golbat", "Oddish", "Vileplume", "Paras", "Parasect", 
	"Zubat", "Golbat", "Oddish", "Paras", "Parasect", 
	"Venonat", "Venomoth", "Growlithe", "Arcanine", "Abra", "Alakazam", 
	"Tentacool", "Tentacruel", "Farfetch'd", "Grimer", "Muk", 
	"Gengar", "Onix", "Krabby", "Kingler", "Voltorb", "Electrode", 
	"Cubone", "Marowak", "Horsea", 
	-- "Cubone", "Marowak", "Hitmonlee", "Hitmontop", "Hitmonchan", "Horsea", 
	"Seadra", "Jynx", "Electabuzz", "Pinsir", "Magikarp",  
	"Ditto", "Mr. Mime", "Ninetales", "Rhydon", 
	"Umbreon", "Espeon", "Magneton", "Politoed", "Stantler", "Dodrio", "Ariados", "Tauros", 
	"Crobat", "Magmar", "Ampharos", "Feraligatr", "Machamp", 
	"Meganium", "Larvitar", "Typhlosion", "Xatu", "Magcargo", "Sandslash", "Weezing", "Mantine"}

local raros = {"Snorlax", "Pupitar", "Dragonite", "Scyther", "Dragonair", "Dratini", "Lanturn", "Tangela", "Beedrill", "Giant Magikarp", "Gyarados"}  

local Megas = {"Beedrill", "Blaziken", "Houndoom", "Pidgeot", "Pinsir", "Sceptile", "Scizor", "Swampert"}

local function doShiny(cid)
    if isCreature(cid) then
        if isSummon(cid) then return true end
        if getPlayerStorageValue(cid, 74469) >= 1 then return true end
        if getPlayerStorageValue(cid, 22546) >= 1 then return true end 
        if isNpcSummon(cid) then return true end
        if getPlayerStorageValue(cid, 637500) >= 1 then return true end  --alterado v1.9
   
        if isInArray(shinys, getCreatureName(cid)) then  --alterado v1.9 \/
            chance = 2    --1% chance        
        elseif isInArray(raros, getCreatureName(cid)) then   --n coloquem valores menores que 0.1 !!
            chance = 1   --1% chance       
        else
            return true
        end  
		
        -- if math.random(0, 225) <= chance then
        if math.random(0, 110) <= chance then  -- evento
            doSendMagicEffect(getThingPos(cid), 18) 
			local name, pos = "Shiny "..getCreatureName(cid), getThingPos(cid)
            doRemoveCreature(cid)
            local shi = doCreateMonster(name, pos, false)
            setPlayerStorageValue(shi, 74469, 1)      
        else
            setPlayerStorageValue(cid, 74469, 1)
        end                                        --/\
    else                                                            
        return true
    end
end

local function doMega(cid)
    if isCreature(cid) then
        if isSummon(cid) then return true end
        if getPlayerStorageValue(cid, 74469) >= 1 then return true end
        if getPlayerStorageValue(cid, 22546) >= 1 then return true end 
        if isNpcSummon(cid) then return true end
        if getPlayerStorageValue(cid, 637500) >= 1 then return true end  --alterado v1.9
   
        if isInArray(Megas, getCreatureName(cid)) then  --alterado v1.9 \/
            chance = 1    --1% chance        
        -- elseif isInArray(raros, getCreatureName(cid)) then   --n coloquem valores menores que 0.1 !!
            -- chance = 1   --1% chance       
        else
            return true
        end  
		
        if math.random(1, 500) <= chance then  
            doSendMagicEffect(getThingPos(cid), 18) 
			local name, pos = "Mega "..getCreatureName(cid), getThingPos(cid)
            if getCreatureName(cid) == "Charizard" then
			    if math.random(1, 100) <= 10 then
			        name = name.." X"
				else
				    name = name.." Y"
				end
			end
            
            doRemoveCreature(cid)
            local shi = doCreateMonster(name, pos, false)
            setPlayerStorageValue(shi, 74469, 1)      
        else
            setPlayerStorageValue(cid, 74469, 1)
        end                                        --/\
    else                                                            
        return true
    end
end
    
local function doLevelName(cid)
	lvlMixLort = 0
	if isCreature(cid) then
		local pokess = pokesMasterX
		if not pokess[getCreatureName(cid)] then
			pokess = pokes
		end
		local pokelevel = pokess[getCreatureName(cid)] and math.random((pokess[getCreatureName(cid)].level - 15), pokess[getCreatureName(cid)].level) or 1
		local pokelevelmix = pokess[getCreatureName(cid)] and math.random(40, 55) or 1
		local pokesLvl = {"Regice", "Registeel", "Regirock", "Furious Charizard", "Primal Kyogre", "Cresselia", "Regigigas", "Lugia", "Giratina", "Rayquaza",
		"Entei", "Suicune", "Raikou", "Celebi", "Celebi", "Latios", "Latias", "Shaymin", "Hoopa", "Mew", "Mewtwo", "Palkia", 
		"Articuno", "Zapdos", "Moltres", "Kyogre", "Guardian Magmar", "Dialga", "Charizard Halloween", "Giant Gengar", "Marowak Halloween", "Jirachi", "Groudon",
		"Darkrai", "Darkrai Nightmare", "Primal Dialga", "Zekrom", "Kyurem", "White Kyurem", "Black Kyurem", "Reshiram"}
		if not isInArray(pokesLvl, getCreatureName(cid)) then
			if isCreature(cid) and isMonster(cid) and not isSummon(cid) and pokess[getCreatureName(cid)] and pokess[getCreatureName(cid)].level then
				if pokess[getCreatureName(cid)] and pokess[getCreatureName(cid)].level >= 55 then
					lvlMixLort = pokelevelmix
				else
					lvlMixLort = pokelevel
				end
			else
	    		lvlMixLort = 0
	  		end
		else
			lvlMixLort = 100
		end
		if lvlMixLort <= 3 then
			lvlMixLort = math.random(2, 6)
		end
		if string.find(tostring(getCreatureName(cid)), "Shiny") then
			lvlMixLort = math.random(50, 70)
		end
		setPlayerStorageValue(cid, 18012, lvlMixLort)
		doCreatureSetSkullType(cid, 10)

		nameLvl = getCreatureName(cid).." ["..lvlMixLort.."]"
		doCreatureSetNick(cid, nameLvl)

	end
	-- return lvlMixLort
end

local function christmas(cid)
    if isCreature(cid) then
        if isSummon(cid) then return true end
        if getPlayerStorageValue(cid, 74469) >= 1 then return true end
        if getPlayerStorageValue(cid, 22546) >= 1 then return true end 
        if isNpcSummon(cid) then return true end
        if getPlayerStorageValue(cid, 637500) >= 1 then return true end
        
		if pokes[getCreatureName(cid)] then
	        local chance = math.random(1, 300)
		    if chance > 10 then
		        return true
		    end
		    if pokes[getCreatureName(cid)].level <= 50 then
		        doSendMagicEffect(getThingPos(cid), 18) 
			    local christmasList = {"Christmas Eevee", "Christmas Meowth", "Christmas Pikachu"}
                doCreateMonster(christmasList[math.random(#christmasList)], getThingPos(cid), false)		
            elseif pokes[getCreatureName(cid)].level > 50 then
                doSendMagicEffect(getThingPos(cid), 18) 
			    local christmasList = {"Christmas Snorlax", "Christmas Shiny Vaporeon", "Christmas Shiny Jolteon", "Christmas Shiny Flareon", "Christmas Shiny Pinsir", "Christmas Shiny Tauros", "Christmas Shiny Raichu", "Christmas Shiny Arcanine", "Christmas Shiny Dragonair", "Christmas Shiny Fearow", "Christmas Shiny Golem", "Christmas Shiny Hitmontop", "Christmas Shiny Hypno", "Christmas Shiny Mr. Mime", "Christmas Shiny Nidoking", "Christmas Shiny Rhydon", "Christmas Shiny Tentacruel", "Christmas Shiny Vileplume"}
                doCreateMonster(christmasList[math.random(#christmasList)], getThingPos(cid), false)	  		
		    end
	    end
	end
    return true
end

local function eventPascoa(cid)
    if isCreature(cid) then
        if isSummon(cid) then return true end
        if getPlayerStorageValue(cid, 74469) >= 1 then return true end
        if getPlayerStorageValue(cid, 22546) >= 1 then return true end 
        if isNpcSummon(cid) then return true end
        if getPlayerStorageValue(cid, 637500) >= 1 then return true end
		if getPlayerStorageValue(cid, 637501) >= 1 then return true end--pescado
        
	    local chance = math.random(1, 500)
		if chance > 10 then
		    return true
		end
		    
		doCreateItem(19627, 1, getThingPos(cid))
	end
    return true
end
function onSpawn(cid) 

    registerCreatureEvent(cid, "Experience")
	registerCreatureEvent(cid, "GeneralConfiguration")
	registerCreatureEvent(cid, "DirectionSystem")
	registerCreatureEvent(cid, "CastSystem")
	-- setPlayerStorageValue(cid, 1802, doLevelName(cid))
	  
	if isSummon(cid) then
		registerCreatureEvent(cid, "SummonDeath")
	    return true
	end
	
--	addEvent(christmas, 10, cid)
	doLevelName(cid)
	addEvent(doShiny, 10, cid)
	-- addEvent(doMega, 10, cid)
	addEvent(adjustWildPoke, 5, cid)
	--addEvent(ShinyName, 15, cid)
    --addEvent(eventPascoa, 10, cid)
return true
end