local pokemons = {
    "Charmander",
	"Charizard",
	"Blastoise",
	"Venusaur",
	"Scyther",
	"Magmar",
	"Gyarados",
	"Misdreavus",
	"togepi",
	"Gengar",
	-- "Shiny Blastoise",
	-- "Shiny Alakazam",
	"Alakazam",
	-- "Shiny Electabuzz",
	"Electabuzz",
	"Weezing",
	"Arcanine",
	"Flareon",
	"Ninetales",
	"Vulpix",
	"Growlithe",
	"Arbok",

}
local function removeWild(cid)
    if isCreature(cid) then
        doRemoveCreature(cid)
    end
end
local function invasao(from, to)
local inarea = {}
local i = 0
    for x=from.x, to.x do
        for y=from.y, to.y do
            for z=from.z, to.z do
			    local oX = math.random(-4, 4)
				local oY = math.random(-4, 4)
			    local newpos = {x = x+oX, y = y+oY, z = z}
			    if getTileThingByPos(newpos) and getTileThingByPos(newpos).itemid ~= 0 then
				    if not (getTileInfo(newpos).house) then
					    if getTilePzInfo(newpos) == false and canWalkOnPos(newpos, true, true, false, false, true) then
					        local on = math.random(1, 10)
						    if on == 3 then 
							   -- doBroadcastMessage(i.."sdsd"..newpos.x..","..newpos.y, 19)
					   		    local wild = doCreateMonster(pokemons[math.random(#pokemons)], newpos, false)
								setPlayerStorageValue(wild, 19850, 1)
								addEvent(removeWild, 5*60*1000, wild)
								
							    table.insert(inarea, newpos)
							    i=i+1
						    end
							
							
							x=x+5
							--y=y 
							
							-- if i == 35 then
							if i == 20 then
							    return true
							end
							
						end
					end
				end 
			end
		end
	end
end

local function invasaoNow(i)
    local posFrom = 
	{
		{x = 171, y = 1137, z = 7},
		{x = 72, y = 1137, z = 7},
		-- {x = 975, y = 1054, z = 7},
	}
	local posTo = 
	{
		{x = 195, y = 1161, z = 7},
		{x = 96, y = 1161, z = 7},
		-- {x = 1083, y = 1110, z = 7},
	}
	local posN = i-- math.random(1, 3)
    invasao(posFrom[posN], posTo[posN])
    if i == 1 then
		doBroadcastMessage("Evento invasão ativo! Vá ajudar as pessoas a enfrentar todos aqueles pokémons!") 
		addEvent(doBroadcastMessage, 1000, "- Socorro! Salvem nossas vidas!")
	end
    if i == 2 then
		doBroadcastMessage("Evento invasão Premium ativo! Para entrar no invasão premium é necessário um ticket! Vá ajudar as pessoas a enfrentar todos aqueles pokémons!") 
		addEvent(doBroadcastMessage, 1000, "- Socorro! Salvem nossas vidas!")
	end	
end
local data = {"Monday", "Wednesday", "Friday"}
local dataSpecial = {"Tuesday", "Thursday"}
function onTimer()
    if isInArray(data, os.date("%A")) then
        -- for i = 1, 3 do
            invasaoNow(1)
	    -- end
	end
    if isInArray(dataSpecial, os.date("%A")) then
        -- for i = 1, 3 do
            invasaoNow(2)
	    -- end
	end
    return true
end