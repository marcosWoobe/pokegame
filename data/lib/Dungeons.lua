dungeonTimeStr = 53937
dungeonStr = 53938
dungeonBossStr = 53939
dungeonPoints = 53940
dungeon_Opcode = 148
msg_spawn_boss = "o boss nasceu."
msg_death_count = "ainda falta derrotar"

dungeonShop = {
    ["Shiny Cham 1"] = {serve_id = 2460, count = 1, points = 30},
    ["Shiny Boss 3"] = {serve_id = 2467, count = 1, points = 40}, 
}

dungeonList = 
{
    ["gyarados"] = 
	{
		levelMin = 50,
		levelMax = 5000,
		limite_players = 5,
		time_wait = 30 * 60,
		time_done = 30 * 60,
		boss = "Shiny gyarados",
		points = 1,
		reward = {
		},
		dungeons = {
			{From = {x = 56, y = 1042, z = 7}, To = {x = 73, y = 1054, z = 7}, Start = {x = 62, y = 1045, z = 7}, Boss = {x = 63, y = 1045, z = 7}},
			{From = {x = 1030, y = 1030, z = 7}, To = {x = 1030, y = 1030, z = 7}, Start = {x = 1040, y = 1030, z = 7}, Boss = {x = 63, y = 1045, z = 7}},
		}, 
		pokemons = {
			{
				name = "Gyarados", posis = {
						                        {x = 59, y = 1048, z = 7},
												 {x = 61, y = 1048, z = 7}
						                    }
	        },
			{
					name = "Magikarp", posis = {
												{x = 63, y = 1048, z = 7},
												{x = 63, y = 1049, z = 7}
											  }
			}
		}		
	},
	["Charizardinner"] = 
	{
		levelMin = 50,
		levelMax = 5000,
		limite_players = 5,
		time_death = 30 * 60,
		time_done = 30 * 60,
		boss = "Shiny Charizard",
		points = 1,
		reward = {
		},
		dungeons = {
			{From = {x = 56, y = 1042, z = 7}, To = {x = 73, y = 1054, z = 7}, Start = {x = 62, y = 1045, z = 7}, Boss = {x = 63, y = 1045, z = 7}},
			{From = {x = 1030, y = 1030, z = 7}, To = {x = 1030, y = 1030, z = 7}, Start = {x = 1040, y = 1030, z = 7}, Boss = {x = 63, y = 1045, z = 7}},
		}, 
		pokemons = {
			{
				name = "Charizard", posis = {
						                        {x = 59, y = 1048, z = 7},
												 {x = 61, y = 1048, z = 7}
						                    }
	        },
			{
				name = "Charmander", posis = {
												{x = 63, y = 1048, z = 7},
												{x = 63, y = 1049, z = 7}
											}
			}
		}		
	},
}

function createPokeInDungeon(dungeon_id, idPos)
    local dungeon = dungeonList[dungeon_id]
    local pokemons = dungeon.pokemons
	for p = 1, #pokemons do
	    local pokemon = pokemons[p].name
		local posis = pokemons[p].posis
		for i = 1, #posis do
		    doSendMagicEffect(posis[i], 33)
			local wild = doCreateMonster(pokemon, posis[i], false)
			setPlayerStorageValue(wild, dungeonStr, dungeon_id..","..idPos)
			registerCreatureEvent(wild, "dungeon_sys")
		end
	end
	
	return nil 
end

function doBossInDungeon(pid, dungeon_id, idPos)
    local dungeon = dungeonList[dungeon_id]
   	local fromPos = dungeon.dungeons[idPos].From
	local toPos = dungeon.dungeons[idPos].To
	local bossPos = dungeon.dungeons[idPos].Boss
	
	local count = 0
	for Z = fromPos.z, toPos.z do
	    for X = fromPos.x, toPos.x do 
	       	for Y = fromPos.y, toPos.y do
		       	newPos = {x=X, y=Y, z=Z}
			    local cid = getTopCreature(newPos).uid 
                if isCreature(cid) and ehMonstro(cid) and cid ~= pid then
					count = count+1
                end
		    end 
	    end
	end  

	if count == 0 then
    	local wild = doCreateMonster(dungeon.boss, bossPos, false)
		setPlayerStorageValue(wild, dungeonBossStr, dungeon_id..","..idPos)
		registerCreatureEvent(wild, "dungeon_sys")
		getPlayersInDungeon(dungeon_id, idPos, msg_spawn_boss)
		return count
	end
	getPlayersInDungeon(dungeon_id, idPos, msg_death_count.." "..count.." pokemons.")
	return count 
end

function getPlayersInDungeon(dungeon_id, idPos, msg)
    local dungeon = dungeonList[dungeon_id]
	local fromPos = dungeon.dungeons[idPos].From
	local toPos = dungeon.dungeons[idPos].To
	for Z = fromPos.z, toPos.z do
	    for X = fromPos.x, toPos.x do
	       	for Y = fromPos.y, toPos.y do
		       	newPos = {x=X, y=Y, z=Z}
			    local cid = getTopCreature(newPos).uid
                if cid ~= 1 and isPlayer(cid) then
				    if not msg then
				        doSendMagicEffect(newPos, 33) 
					    doPlayerSendTextMessage(cid, 27, "Parabéns você ganhou 1 ponto de dungeon por concluiu a dungeon: "..dungeon_id..".")    
                        local dungeonPointsAll = getPlayerStorageValue(cid, dungeonPoints)+dungeon.points
					    setPlayerStorageValue(cid, dungeonPoints, dungeonPointsAll)
					    doSendPlayerExtendedOpcode(cid, dungeon_Opcode, dungeonPointsAll)
					    doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)), false)
					else
					    doPlayerSendTextMessage(cid, 27, msg)
                    end						
				end
		    end
	    end
	end
		
	return nil 
end

function getDungeonFree(dungeon_id)
    local dungeon = dungeonList[dungeon_id]
	local free = 0
	for i = 1, #dungeon.dungeons do
   		local fromPos = dungeon.dungeons[i].From
		local toPos = dungeon.dungeons[i].To
		local startPos = dungeon.dungeons[i].Start
		
		for Z = fromPos.z, toPos.z do
	    	for X = fromPos.x, toPos.x do
	       		for Y = fromPos.y, toPos.y do
		       		newPos = {x=X, y=Y, z=Z}
			    	local cid = getTopCreature(newPos).uid
                	if cid ~= 1 and isPlayer(cid) then
				    	doSendMagicEffect(newPos, 33)
						free = free+1
                	end
		    	end
	    	end
		end

        if free < dungeon.limite_players then
            if free == 0 then
		        createPokeInDungeon(dungeon_id, i) 
		    end
		    return i
	    end		
	end 
		
	return nil 
end
 
function goDungeon(cid, dungeon_id)  
    local dungeon = dungeonList[dungeon_id]
	if getPlayerLevel(cid) < dungeon.levelMin or getPlayerLevel(cid) > dungeon.levelMax then
	    doPlayerSendTextMessage(cid, 27, "Sorry, you have a need to be at the level min: "..dungeon.levelMin.." and at the max: "..dungeon.levelMax..".")
	    return nil
	end
	
	--local porra = checkTimesDungeon(cid, dungeon_id)
	--print(porra)
	
	if checkTimesDungeon(cid, dungeon_id) > os.time() then
	    local timeCheck = checkTimesDungeon(cid, dungeon_id)-os.time()
	    doPlayerSendTextMessage(cid, 27, "Porfavor espere "..convertTime(timeCheck))
	    return nil
	end
	
	local idPos = getDungeonFree(dungeon_id)
	if idPos ~= nil then   
	    doTeleportThing(cid, dungeon.dungeons[idPos].Start, false) 
		setTimesDungeon(cid, dungeon_id, dungeon.time_wait+os.time())
		addEvent(doTeleportThing, dungeon.dungeons.time_done+os.time(), cid, getTownTemplePosition(getPlayerTown(cid)), false)
		return nil
	end
	
	return nil
end

function removeTimesDungeon(cid, dungeon_id)
    local key_str = getPlayerStorageValue(cid, dungeonTimeStr)
	local key_list = string.find(key_str, '@')
	if not key_list then
	    return ''
	end
	key_list = string.explode(key_str, '@')
	local key_new = ''
	for i=1, #key_list do
	    local key_buffer = string.explode(key_list[i], ',')
		if key_buffer[1] ~= dungeon_id then
		    key_new = key_new..key_buffer[1]..','..key_buffer[2]..'@'
		end
	end
	return key_new
end
function setTimesDungeon(cid, dungeon_id, new_time)
	local key_new = removeTimesDungeon(cid, dungeon_id)
	setPlayerStorageValue(cid, dungeonTimeStr, key_new..dungeon_id..','..new_time..'@')
end
function checkTimesDungeon(cid, dungeon_id)
    local key_str = getPlayerStorageValue(cid, dungeonTimeStr)
	local key_list = string.find(key_str, '@')
	if key_list == nil then
	    return 0
	end
	key_list = string.explode(key_str, '@')
	for i=1, #key_list do
	    local key_buffer = string.explode(key_list[i], ',')
		if key_buffer[1] == dungeon_id then
		    return tonumber(key_buffer[2])
		end
	end
	
    return 0
end