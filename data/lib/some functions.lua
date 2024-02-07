function getSmeargleMoveTable(master)
  local ball = getPlayerSlotItem(master, 8).uid
  local moves = {}
  local skts = {"skt1", "skt2", "skt3", "skt4", "skt5", "skt6", "skt7", "skt8"}
  for x=1, #skts do
    moves["move"..x] = getItemAttribute(ball, skts[x]) and movestable[getItemAttribute(ball, skts[x])]["move"..x] and movestable[getItemAttribute(ball, skts[x])]["move"..x] ~= -1 and movestable[getItemAttribute(ball, skts[x])]["move"..x] or movestable["Smeargle"]["move"..x]
  end
  return moves
  end

function smeargleHaveSpell(cid, spellname)
local has = false
local moves = getSmeargleMoveTable(cid)
 local ball = getPlayerSlotItem(cid, 8).uid
local skts = {"skt1", "skt2", "skt3", "skt4", "skt5", "skt6", "skt7", "skt8"}
for x=1, #skts do
if getItemAttribute(ball, skts[x]) and moves["move"..x].name == spellname then
has = true
break
end
end
return has
end 

function levelSystem(cid)

local slot = getPlayerSlotItem(cid, 8)
local attr = getItemAttribute(slot.uid, "level")
local attr2 = getItemAttribute(slot.uid, "exp")

if not attr or not attr2 then
  doItemSetAttribute(slot.uid, "level", 1)
  doItemSetAttribute(slot.uid, "exp", 0)

end
  
if attr == 0 then
  doItemSetAttribute(slot.uid, "level", 1)
  doItemSetAttribute(slot.uid, "exp", 0)

end
end

function doDittoTransform(ditto, pokemon)

    if (getCreatureName(ditto) == "Ditto") then
        local sid = getCreatureMaster(ditto)
        local eff = 184
        local name = pokemon
        local pos = getCreaturePosition(ditto)
        local outfit = getPokemonXMLOutfit(pokemon)
        setPlayerStorageValue(ditto, 1010, getCreatureName(ditto))
        doSendMagicEffect(getThingPosWithDebug(ditto), eff)
        doSetCreatureOutfit(ditto, {lookType = outfit}, -1)
        doItemSetAttribute(getPlayerSlotItem(sid, 8).uid, "ehditto", 1)
        doItemSetAttribute(getPlayerSlotItem(sid, 8).uid, "poke", name)
        -- doItemSetAttribute(getPlayerSlotItem(sid, 8).uid, "ehditto", getCreatureName(ditto))
        doPlayerSay(sid, ""..getPokeName(ditto)..", transform into "..getArticle(pokemon).." "..pokemon.."!", 1)
        doCreatureSay(ditto, "TRANSFORM!", TALKTYPE_MONSTER)
        doRemoveCreature(ditto)
        doItemSetAttribute(getPlayerSlotItem(sid, 8).uid, "addonNow", getOutfitPoke(name))
        doSummonMonster(sid, name)
        doTeleportThing(getCreatureSummons(sid)[1], pos, false)
        adjustStatus(getCreatureSummons(sid)[1], getPlayerSlotItem(sid, 8).uid, true, false)
        doUpdateMoves(sid)
        return true
    end

    if (getCreatureName(ditto) == "Shiny Ditto") then
        local sid = getCreatureMaster(ditto)
        local eff = 184
        local name = pokemon
        local pos = getCreaturePosition(ditto)
        local outfit = getPokemonXMLOutfit(pokemon)
        setPlayerStorageValue(ditto, 1010, getCreatureName(ditto))
        doSendMagicEffect(getThingPosWithDebug(ditto), eff)
        doSetCreatureOutfit(ditto, {lookType = outfit}, -1)
        doItemSetAttribute(getPlayerSlotItem(sid, 8).uid, "ehshinyditto", 1)
        doItemSetAttribute(getPlayerSlotItem(sid, 8).uid, "poke", name)
        -- doItemSetAttribute(getPlayerSlotItem(sid, 8).uid, "ehditto", getCreatureName(ditto))
        doPlayerSay(sid, ""..getPokeName(ditto)..", transform into "..getArticle(pokemon).." "..pokemon.."!", 1)
        doCreatureSay(ditto, "TRANSFORM!", TALKTYPE_MONSTER)
        doRemoveCreature(ditto)
        doItemSetAttribute(getPlayerSlotItem(sid, 8).uid, "addonNow", getOutfitPoke(name))
        doSummonMonster(sid, name)
        doTeleportThing(getCreatureSummons(sid)[1], pos, false)
        adjustStatus(getCreatureSummons(sid)[1], getPlayerSlotItem(sid, 8).uid, true, false)
        doUpdateMoves(sid)
        return true
    end

end

function doDittoRevert(m)
    local sid = m
    local ball = getPlayerSlotItem(sid, 8).uid
    local eff = 184
    local name = getItemAttribute(ball, 'poke')
    local outfit = getPokemonXMLOutfit(name)
    if getItemAttribute(ball, "ehditto") then
        if #getCreatureSummons(sid) <= 0 then
            doItemSetAttribute(ball, "poke",  "Ditto")
            doItemSetAttribute(ball, "ehditto",  1)
            doItemSetAttribute(ball, "addonNow", getOutfitPoke(name))
        elseif #getCreatureSummons(sid) == 1 then
            local ditto = getCreatureSummons(sid)[1]
            local pos = getCreaturePosition(ditto)
            if getCreatureName(ditto) == "Ditto" then
                return true
            end
            doSendMagicEffect(getThingPosWithDebug(ditto), eff)
            doSetCreatureOutfit(ditto, {lookType = outfit}, -1)
            doItemSetAttribute(ball, "poke", "Ditto")
            doItemSetAttribute(ball, "ehditto",  1)
            doItemSetAttribute(ball, "addonNow", getOutfitPoke(name))
            doPlayerSay(sid, ""..getPokeName(ditto)..", untransfrom!", 1)
            doCreatureSay(ditto, "TRANSFORM!", TALKTYPE_MONSTER)
            doRemoveCreature(ditto)
            doSummonMonster(sid, name)
            doTeleportThing(getCreatureSummons(sid)[1], pos, false)
            adjustStatus(getCreatureSummons(sid)[1], ball, true, false)
            doUpdateMoves(sid)
        end
    elseif getItemAttribute(ball, "ehshinyditto") then
        if #getCreatureSummons(sid) <= 0 then
            doItemSetAttribute(ball, "poke", "Shiny Ditto")
            doItemSetAttribute(ball, "ehshinyditto",  1)
            doItemSetAttribute(ball, "addonNow", getOutfitPoke(name))
        elseif #getCreatureSummons(sid) == 1 then
            local ditto = getCreatureSummons(sid)[1]
            local pos = getCreaturePosition(ditto)
            if getCreatureName(ditto) == "Shiny Ditto" then
                return true
            end
            doSendMagicEffect(getThingPosWithDebug(ditto), eff)
            doSetCreatureOutfit(ditto, {lookType = outfit}, -1)
            doItemSetAttribute(ball, "poke", "Shiny Ditto")
            doItemSetAttribute(ball, "ehshinyditto",  1)
            doItemSetAttribute(ball, "addonNow", getOutfitPoke(name))
            doPlayerSay(sid, ""..getPokeName(ditto)..", untransfrom!", 1)
            doCreatureSay(ditto, "TRANSFORM!", TALKTYPE_MONSTER)
            doRemoveCreature(ditto)
            doSummonMonster(sid, name)
            doTeleportThing(getCreatureSummons(sid)[1], pos, false)
            adjustStatus(getCreatureSummons(sid)[1], ball, true, false)
            doUpdateMoves(sid)
        end
    else
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Você Não Está Usando Um Ditto ou Shiny Ditto.')
    end
end 

function doDittoTransformMemory(ditto, pokemon)
    -- local store = 23591 -- storage q salva o delay
    -- local delay = 30 -- tempo em segundos de delay

    -- if getPlayerStorageValue(cid, store) - os.time() <= 0 then
        local sid = getCreatureMaster(ditto)
        local eff = 184
        local name = pokemon
        local pos = getCreaturePosition(ditto)
        local outfit = getPokemonXMLOutfit(pokemon)
        doSendMagicEffect(getThingPosWithDebug(ditto), eff)
        doSetCreatureOutfit(ditto, {lookType = outfit}, -1)
        doItemSetAttribute(getPlayerSlotItem(sid, 8).uid, "poke", name)
        -- if not getItemAttribute(getPlayerSlotItem(sid, 8).uid, "ehditto") or getItemAttribute(getPlayerSlotItem(sid, 8).uid, "ehditto") == "" then
        --     doItemSetAttribute(getPlayerSlotItem(sid, 8).uid, "ehditto", getCreatureName(ditto))
        -- end
        doPlayerSay(sid, ""..getPokeName(ditto)..", transform into "..getArticle(pokemon).." "..pokemon.."!", 1)
        doCreatureSay(ditto, "TRANSFORM!", TALKTYPE_MONSTER)
        doRemoveCreature(ditto)
        doItemSetAttribute(getPlayerSlotItem(sid, 8).uid, "addonNow", getOutfitPoke(name))
        doSummonMonster(sid, name)
        doTeleportThing(getCreatureSummons(sid)[1], pos, false)
        adjustStatus(getCreatureSummons(sid)[1], getPlayerSlotItem(sid, 8).uid, true, false)
        doUpdateMoves(sid)
        -- setPlayerStorageValue(cid, store, os.time() + delay)
        return true
    -- else
    --     doPlayerSendCancel(cid, "Você tem que esperar ".. getPlayerStorageValue(cid, store) - os.time() .." segundo(s) para usar novamente.")
    --     doSendMagicEffect(getPlayerPosition(cid), 2)
    -- end

end

function getStringOfTaskArray(array)
   if type(array) ~= 'table' or not next(array) then return "" end
   
   local result = {}
    for _, value in ipairs(array) do
	    local thing, num = (type(value[1]) == 'string' and value[1] or getItemNameById(value[1])), value[2]
		table.insert(result, (_ == 1 and "" or ", ")..num.." "..thing..(num == 1 and "" or "s"))
    end
	result[#result] = " and"..(result[#result]:sub(2,#result[#result]))
	return table.concat(result)
end

function addPokeToPlayer(cid, pokemon, ball, pokemonName, _boost, gender, ball, unique)             --alterado v1.9 \/ peguem ele todo...
  local boost = 0
  if _boost and tonumber(_boost) and tonumber(_boost) > 0 and tonumber(_boost) <= 50 then
    boost = _boost
  end

  local natureList = {"Hardy", "Lonely", "Brave", "Adamant", "Bold", "Docile", "Relaxad", "Impish", "Modest", "Mild", "Quiet", "Bashful", "Quirky", "Timid", "Hasty", "Serius", "Jolly"}
  local nature = natureList[math.random(#natureList)]

  local genders = {
  ["male"] = 4,
  ["female"] = 3,
  ["indefinido"] = 1,
  ["genderless"] = 1,
  [1] = 4,
  [0] = 3,
  [4] = 4,
  [3] = 3,
  }
  if not isCreature(cid) then return false end

  local pokemon = doCorrectString(pokemon)
  if not pokes[pokemon] then return false end

  local GENDER = (gender and genders[gender]) and genders[gender] or getRandomGenderByName(pokemon)
  -- local btype = (ball and pokeballs[ball]) and ball or isShinyName(pokemon) and "shinynormal" or "normal"
  local btype = "normal"
  local happy = 250

  if icons[pokemon] then
    id = icons[pokemon].on
  else
    id = pokeballs[btype].on
  end

  if getPlayerFreeCap(cid) >= 6 or not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then
    item = doCreateItemEx(id)
  else
    item = doCreateItemEx(id)
  end

  if not item then return false end

  doItemSetAttribute(item, "poke", pokemon)  
  doItemSetAttribute(item, "nome", pokemon)  
  doItemSetAttribute(item, "color1", 0)
  doItemSetAttribute(item, "color2", 0)
  doItemSetAttribute(item, "color3", 0) 
  doItemSetAttribute(item, "color4", 0) 
  doItemSetAttribute(item, "addonNow", getOutfitPoke(pokemon))
  doItemSetAttribute(item, "hp", 1)
  doItemSetAttribute(item, "nature", nature)
  doItemSetAttribute(item, "iv", math.random(31))
  doItemSetAttribute(item, "ev", 0)
  doItemSetAttribute(item, "10002", pokemon)

  -- setSerial(item, pokemon, "", boost, 0, 0, nature)  
  -- doItemSetAttribute(item, "gender", GENDER)

  doItemSetAttribute(item, "exp", 0)
  local PokesNames = {"Shiny Ditto", "Ditto", "Baby Charmander", "Baby Bulbasaur", "Baby Pikachu", "Baby Squirtle", "Chikorita", "Cyndaquil", "mudkip", "Torchic", "Totodile", "Treecko"}
  if isInArray(PokesNames, pokemon) then
      doItemSetAttribute(item, "level", math.random(2,6))
  else
      doItemSetAttribute(item, "level", math.random(7,14))
  end
  
  if poke == "Hitmonchan" or poke == "Shiny Hitmonchan" then    
    doItemSetAttribute(item, "hands", 0)
  end

  doItemSetAttribute(item, "tadport", fotos[pokemon])
  doItemSetAttribute(item, "moveBallT", "on") -- ativado mixlort
  doItemSetAttribute(item, "ballorder", getPlayerFreeCap(cid)+1) -- ativado mixlort

  doItemSetAttribute(item, "description", "Contains a "..pokemon..".")
  doItemSetAttribute(item, "fakedesc", "Contains a "..pokemon..".") 
  doItemSetAttribute(item, "defeated", "no")
  doItemSetAttribute(item, "ball", btype)
  doItemSetAttribute(item, "boost", boost)

  if unique then
    doItemSetAttribute(item, "unico", 1)
  end  

  doTransformItem(item, id)
                                                                   
  if getPlayerFreeCap(cid) >= 6 or not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then  
    doPlayerSendPokeCPName(getCreatureName(cid), item, 1)
    sendMsgToPlayer(cid, 27, "You are already holding six pokemons, so your new pokemon was sent to your depot.")
  else
    addPokeInFreeBag(getPlayerSlotItem(cid, 3).uid, item) 
  end

  doUpdatePokemonsBar(cid)

  return true 
end 

function addPokeInFreeBag(container, item)
    if not isContainer(container) or not item then return false end                                             
    if getContainerSize(container) < getContainerCap(container) then
        return doAddContainerItemEx(container, item)   
    else
        for slot = 0, (getContainerSize(container)-1) do
            local container2 = getContainerItem(container, slot)
            if isContainer(container2.uid) and getContainerSize(container2.uid) < getContainerCap(container2.uid) then
                return doAddContainerItemEx(container2.uid, item)
            end
        end
    end
    return false
end

function diaDepot(cid, count)
while count > 0 do
local value = math.min(100, count)
count = count-value
--doPlayerAddItem(cid, 2145, value)
local item = doCreateItemEx(2145, value)
doPlayerSendMailByName(getCreatureName(cid), item, 1)
end
end
---------------------------

function getPlayerDexList(cid)
n = 0
	if not isCreature(cid) then return n end
	for a,b in pairs(pokes) do
		if b.dex then
			if tonumber(getPlayerStorageValue(cid, b.dex)) >= 1 then
				n = n + 1
			end
		end
	end
return n
end
function getPlayerCatchList(cid)
n = 0
	if not isCreature(cid) then return n end
	for a,b in pairs(pokes) do
		if b.catch then
			if tonumber(getPlayerStorageValue(cid, b.catch.sto)) >= 1 then
				n = n + 1
			end
		end
	end
return n
end
local function getPlayerInArea(from, to)
local inarea = {}
for x=from.x, to.x do
for y=from.y, to.y do
for z=from.z, to.z do
local p = getTopCreature({x=x, y=y, z=z}).uid
if p ~= 0 and isPlayer(p) then
table.insert(inarea, p)
end
end
end
end
return inarea
end

function getPlayerInArea(fromPos, toPos) -- by jhon992
local online = getPlayersOnline()
local players = {}
for i=1, #online do
    if isInArea(getPlayerPosition(online[i]), fromPos, toPos) then
        players[#players+1] = online[i]
    end
end
return players
end

function getMonstersInArea(from, to)
local inarea = {}
for x=from.x, to.x do
for y=from.y, to.y do
for z=from.z, to.z do
local p = getTopCreature({x=x, y=y, z=z}).uid
if p ~= 0 and isMonster(p) then
if (isSummon(p) and not isPlayer(getCreatureMaster(p))) or not isSummon(p) then
table.insert(inarea, p)
end
end
end
end
end
return inarea
end

function unLock(ball)                                                             
if not ball or ball <= 0 then return false end
if getItemAttribute(ball, "lock") and getItemAttribute(ball, "lock") > 0 then
   local vipTime = getItemAttribute(ball, "lock")
   local timeNow = os.time()
   local days = math.ceil((vipTime - timeNow)/(24 * 60 * 60))
   if days <= 0 then
      doItemEraseAttribute(ball, "lock")    
      doItemEraseAttribute(ball, "unico")
      return true
   end
end
return false
end

function getGuildMembersOnline(GuildId)
local players = {}
for _, pid in pairs(getPlayersOnline()) do
    if getPlayerGuildId(pid) == tonumber(GuildId) then
       table.insert(players, pid)
    end
end                                                   --by Vodkart
return #players > 0 and players or false
end

function getGuildMembers(GuildId)
local players,query = {},db.getResult("SELECT `name` FROM `players` WHERE `rank_id` IN (SELECT `id` FROM `guild_ranks` WHERE `guild_id` = " .. GuildId .. ");")
if (query:getID() ~= -1) then  
   repeat
         table.insert(players,query:getDataString("name"))
   until not query:next()                           --by Vodkart
   query:free()
end
return #players > 0 and players or false
end 

function isLegendaryPokemon(name)
	if name == nil then return false end
	if isInArray({"Mewtwo", "Mew", "Articuno", "Zapdos", "Moltres", "Lugia", "Ho-oh", "Celebi", "Entei", "Raikou", "Suicune", "Darkrai", "Cresselia", "Heatran", "Latios", "Latias", "Manaphy", "Phione", "Uxie", "Mesprit", "Azelf", "Regice", "Registeel", "Regirock", "Regigigas", "Groudon", "Rayquaza", "Kyogre", "Jirachi", "Deoxys", "Shaymin", "Giratina", "Dialga", "Palkia", "Arceus"}, name) then
	return true
	end
return false
end

function isFossilPokemon(name)
	if name == nil then return false end
	if isInArray({"Aerodactyl", "Kabuto", "Kabutops", "Omanyte", "Omastar"}, name) then
	return true
	end
return false
end

function isMegaPokemon(name)
	if name == nil then return false end
	if isInArray({"Mega Alakazam", "Mega Blastoise", "Mega Charizardx", "Mega Blaziken", "Mega Lucario", "Mega Gengar", "Mega Aggron", "Mega Swampert", "Mega Venusaur"}, name) then
	return true
	end
return false
end

function getDirectionToWalk(p1, pos2)
	local dir = NORTH
	local pos1 = getCreaturePosition(p1)
	if(pos1.x > pos2.x) then
		dir = WEST
		if(pos1.y > pos2.y) then
			dir = NORTHWEST
		elseif(pos1.y < pos2.y) then
			dir = SOUTHWEST
		end
	elseif(pos1.x < pos2.x) then
		dir = EAST
		if(pos1.y > pos2.y) then
			dir = NORTHEAST
		elseif(pos1.y < pos2.y) then
			dir = SOUTHEAST
		end
	else
		if(pos1.y > pos2.y) then
			dir = NORTH
		elseif(pos1.y < pos2.y) then
			dir = SOUTH
		end
	end
	return dir
end

 function getNextStepDelay(cid, dir)
            return tonumber(398)
    end	  
--/////////////////////////////////////////////////////////////////////////////////---
function sendMsgToPlayer(cid, tpw, msg)      --alterado v1.7 \/\/\/
if not isCreature(cid) or not tpw or not msg then return true end
return doPlayerSendTextMessage(cid, tpw, msg)
end

function getPlayerDesc(cid, thing, TV)
if (not isCreature(cid) or not isCreature(thing)) and not TV then return "" end

local pos = getThingPos(thing)
local ocup = youAre[getPlayerGroupId(thing)]
local rank = (getPlayerStorageValue(thing, 86228) <= 0) and "a Pokemon Trainer" or lookClans[getPlayerStorageValue(thing, 86228)][getPlayerStorageValue(thing, 862281)]
local name = thing == cid and "yourself" or getCreatureName(thing)     
local art = thing == cid and "You are" or (getPlayerSex(thing) == 0 and "She is" or "He is")
   
local str = {}
table.insert(str, "You see "..name..". "..art.." ")
if youAre[getPlayerGroupId(thing)] then
   table.insert(str, (ocup).." and "..rank.." from ".. getTownName(getPlayerTown(thing))..".")       
else
   table.insert(str, (rank).." from ".. getTownName(getPlayerTown(thing))..".")
end
if getPlayerGuildId(thing) > 0 then
   table.insert(str, " "..art.." "..getPlayerGuildRank(thing).." from the "..getPlayerGuildName(thing)..".")
end
if TV then
   table.insert(str, " "..art.." watching TV.")
end
table.insert(str, ((isPlayer(cid) and youAre[getPlayerGroupId(cid)]) and "\nPosition: [X: "..pos.x.."][Y: "..pos.y.."][Z: "..pos.z.."]" or "")) 

return table.concat(str) 
end
-------------------------------------------------------------------------------------------------   /\/\
function getLivePokeballs(cid, container, duel) 
    if not isCreature(cid) then return {} end     
	if not isContainer(container) then return {} end
	local items = {}
	---
	local ballSlot = getPlayerSlotItem(cid, 8)
    if ballSlot.uid ~= 0 then
       for a, b in pairs (pokeballs) do
           if ballSlot.itemid == b.on or ballSlot.itemid == b.use then
              if duel and getPlayerLevel(cid) >= (pokes[getItemAttribute(ballSlot.uid, "poke")].level + getPokeballBoost(ballSlot)) then
                 table.insert(items, ballSlot.uid)                                                                      --alterado v1.8
              elseif not duel then
                 table.insert(items, ballSlot.uid)
              end
           end
       end
    end
    ---     
	if isContainer(container) and getContainerSize(container) > 0 then      
		for slot=0, (getContainerSize(container)-1) do
			local item = getContainerItem(container, slot)
				if isContainer(item.uid) then
					local itemsbag = getPokeballsInContainer(item.uid)
					for i=0, #itemsbag do
						if not isInArray(items, itemsbag[i]) then
                           table.insert(items, itemsbag[i])
                        end
					end
				elseif isPokeball(item.itemid) then
				    for a, b in pairs (pokeballs) do
                        if item.itemid == b.on then
                           if duel and getPlayerLevel(cid) >= (pokes[getItemAttribute(item.uid, "poke")].level + getPokeballBoost(item)) then    
					          table.insert(items, item.uid)                                            --alterado v1.8
                           elseif not duel then
                              table.insert(items, item.uid)
                           end
	                    end
                    end
				end
		end
	end
return items
end

function addItemInFreeBag(container, item, num)
    if not isContainer(container) or not item then return false end                                             
    if not num or num <= 0 then num = 1 end                                            --alterado v1.6.1
    if getContainerSize(container) < getContainerCap(container) then
        return doAddContainerItem(container, item, num)
    else
        for slot = 0, (getContainerSize(container)-1) do
            local container2 = getContainerItem(container, slot)
            if isContainer(container2.uid) and getContainerSize(container2.uid) < getContainerCap(container2.uid) then
                return doAddContainerItem(container2.uid, item, num)
            end
        end
    end
    return false
end
------------------------------------------------------------------------------------------------------
function pokeHaveReflect(cid)
    if not isCreature(cid) then return false end
    local table = getTableMove(cid, "Reflect")
    if table and table.name then     --alterado v1.6
        return true 
    end
    return false
end
------------------------------------------------------------------------------------------------------
function nextHorario(cid)
    horarioAtual = os.date("%X")
    horario = string.explode(horarioAtual, ":")
    
    for i = 1, #horas do
        horarioComparacao = horas[i]
        horarioComp = string.explode(horarioComparacao, ":")
        ---------------
        if tonumber(horarioComp[1]) > tonumber(horario[1]) then
           return horarioComparacao                                
        elseif tonumber(horarioComp[1]) == tonumber(horario[1]) and tonumber(horario[2]) < tonumber(horarioComp[2]) then
           return horarioComparacao
        end
    end 
    return horas[1]                                  
end                                                               

function getTimeDiff(timeDiff)
    local dateFormat = {
        {'hour', timeDiff / 60 / 60}, --6%
        {'min', timeDiff / 60 % 60}, 
    }
    local out = {}
    for k, t in ipairs(dateFormat) do
        local v = math.floor(t[2])
        if(v > -1) then
            table.insert(out, (k < #dateFormat and '' or ' and ') .. v .. '' .. (v <= 1 and t[1] or t[1].."s"))
        end
    end
    if tonumber(dateFormat[1][2]) == 0 and tonumber(dateFormat[2][2]) == 0 then
        return "seconds"
    end
    return table.concat(out)
end

function getTimeDiff2(timeDiff)
    local dateFormat = {
        {'hour', timeDiff / 60 / 60}, --6%
        {'min', timeDiff / 60 % 60},
        {'sec', timeDiff % 60},
    }
    local out = {}                                  
    for k, t in ipairs(dateFormat) do
        local v = math.floor(t[2])
        if(v > 0) then
            table.insert(out, (k < #dateFormat and ' ' or ' and ') .. v .. '' .. (v <= 1 and t[1] or t[1].."s"))
        end
    end
    return table.concat(out)
end 

function showTimeDiff(timeComp)
local b = string.explode(os.date("%X"), ":")
local c = string.explode(timeComp, ":")
    ---
    local d, m, y = os.date("%d"), os.date("%m"), os.date("%Y")
    local hAtual, mAtual = tonumber(b[1]), tonumber(b[2])
    local hComp, mComp = tonumber(c[1]), tonumber(c[2])
    ---
    local t = os.time{year= y, month= m, day= d, hour= hAtual, min= mAtual}
    local t1 = os.time{year= y, month= m, day= d, hour= hComp, min= mComp}
    ---                                                                       
    comparacao = t1-t
    if hComp < hAtual then
       v = os.time{year= y, month= m, day= d, hour= 24, min= 0}
       v2 = os.time{year= y, month= m, day= d, hour= 0, min= 0}
       comparacao = (v-t)+(t1-v2)
    end
return getTimeDiff(comparacao)
end
-------------------------------------------------------------------------
function cleanCMcds(item)
if item ~= 0 then
   for c = 1, 15 do              --alterado v1.5
      local str = "cm_move"..c
      setCD(item, str, 0)
   end
end
end

function ehNPC(cid)   --alterado v1.9
return isCreature(cid) and not isPlayer(cid) and not isSummon(cid) and not isMonster(cid)
end

function ehMonstro(cid)
local eh = false
    if not isSummon(cid) and not ehNPC(cid) and not isPlayer(cid) then
        eh = true
    end
    return eh
end                                                      --alterado v1.9.1 /\

function doAppear(cid) --Faz um poke q tava invisivel voltar a ser visivel...
    if not isCreature(cid) then return true end 
    setPlayerStorageValue(cid, 13459750, -1)
    doRemoveCondition(cid, CONDITION_INVISIBLE)
    doRemoveCondition(cid, CONDITION_OUTFIT)
    doCreatureSetHideHealth(cid, false)
    if isMega(cid) then
        checkOutfitMega(cid, getPlayerStorageValue(cid, storages.isMega))
    end
end

function doDisapear(cid) --Faz um pokemon ficar invisivel
    if not isCreature(cid) then return true end
    setPlayerStorageValue(cid, 13459750, 1)
    doCreatureAddCondition(cid, permanentinvisible)
    doCreatureSetHideHealth(cid, true)
    doSetCreatureOutfit(cid, {lookType = 2}, -1)
end

function hasTile(pos)    --Verifica se tem TILE na pos
pos.stackpos = 0
if getTileThingByPos(pos).itemid >= 1 then
   return true
end
return false
end

function getThingFromPosWithProtect(pos)  --Pega uma creatura numa posiçao com proteçoes
if hasTile(pos) then
   if isCreature(getRecorderCreature(pos)) then
      return getRecorderCreature(pos)
   else
      pos.stackpos = 253
      pid = getThingfromPos(pos).uid
   end
else
   pid = getThingfromPos({x=1,y=1,z=10,stackpos=253}).uid
end
return pid
end

function getTileThingWithProtect(pos)    --Pega um TILE com proteçoes
if hasTile(pos) then
pos.stackpos = 0
   pid = getTileThingByPos(pos)
else
   pid = getTileThingByPos({x=1,y=1,z=10,stackpos=0})
end
return pid
end

function canAttackOther(cid, pid)         --Function q verifica se um poke/player pode atacar outro poke/player

if not isCreature(cid) or not isCreature(pid) then return "Cant" end

local master1 = isSummon(cid) and getCreatureMaster(cid) or cid
local master2 = isSummon(pid) and getCreatureMaster(pid) or pid
   
   ----             
   if getPlayerStorageValue(master1, 6598754) >= 5 and getPlayerStorageValue(master2, 6598754) >= 5 then
      if getPlayerStorageValue(master1, 6598754) ~= getPlayerStorageValue(master2, 6598754) then
         if isDuelingAgainst(master1, master2) then   --alterado v1.8
            if isSummon(cid) and isPlayer(pid) then

               return "Cant"
            else
               return "Can"
            end
         end
      end
   end
   ----              pvp system
   if getPlayerStorageValue(master1, 6598754) >= 1 and getPlayerStorageValue(master2, 6598755) >= 1 then
      return "Can" 
   end
   if getPlayerStorageValue(master1, 6598755) >= 1 and getPlayerStorageValue(master2, 6598754) >= 1 then  ---estar em times diferentes
      return "Can"
   end
   ----
   if getTileInfo(getThingPos(cid)).pvp then
return "Can"
end
   
   if ehMonstro(cid) and ehMonstro(pid) then 
      return "Can"
   end

return "Cant"
end
 
function stopNow(cid, time)   
if not isCreature(cid) or not tonumber(time) or isSleeping(cid) then return true end
                                                        --alterado v1.9.1 \/
local function podeMover(cid)    
if not isCreature(cid) then return true end                     
if isPlayer(cid) then 
   mayNotMove(cid, false) 
elseif isCreature(cid) then 
   doRegainSpeed(cid) 
end
end

if isPlayer(cid) then mayNotMove(cid, true) else doChangeSpeed(cid, -getCreatureSpeed(cid)) end
addEvent(podeMover, time, cid)
end

function doReduceStatus(cid, off, def, agi)   --reduz os status
if not isCreature(cid) then return true end
local A = getOffense(cid)
local B = getDefense(cid)
local C = getSpeed(cid)

if off > 0 then
   setPlayerStorageValue(cid, 1001, A - off)
end
if def > 0 then
   setPlayerStorageValue(cid, 1002, B - def)
end
if agi > 0 then
   setPlayerStorageValue(cid, 1003, C - agi)
   if getCreatureSpeed(cid) ~= 0 then
      doRegainSpeed(cid)
   end                                              --alterado v1.5  functions arrumadas...
end
end

function doRaiseStatus(cid, off, def, agi, time)  
if not isCreature(cid) then return true end
local A = getOffense(cid)
local B = getDefense(cid)
local C = getSpeed(cid)

if off > 0 then
   setPlayerStorageValue(cid, 1001, A * off)
end
if def > 0 then
   setPlayerStorageValue(cid, 1002, B * def)
end
if agi > 0 then
   setPlayerStorageValue(cid, 1003, C + agi)
   if getCreatureSpeed(cid) ~= 0 then
      doRegainSpeed(cid)
   end
end

local D = getOffense(cid)
local E = getDefense(cid)
local F = getSpeed(cid)
---------------------------
local G = D - A
local H = E - B
local I = F - C

addEvent(doReduceStatus, time*1000, cid, G, H, I)
end


function BackTeam(cid)          
  if isCreature(cid) then
     local summon = getCreatureSummons(cid)   --alterado v1.6
     for i = 2, #summon do
         doSendMagicEffect(getThingPos(summon[i]), 211)
         doRemoveCreature(summon[i])
     end
     setPlayerStorageValue(cid, 637501, -1)
  end  
end
    
function choose(...) -- by mock
    local arg = {...}
    return arg[math.random(1,#arg)]
end

function AddPremium(cid, days)
local function removerPlayer(cid)
if isCreature(cid) then
   doRemoveCreature(cid)
end
end

db.executeQuery("UPDATE `accounts` SET `premdays` = '"..days.."' WHERE `accounts`.`id` = ".. getPlayerAccountId(cid) ..";")
doPlayerSendTextMessage(cid,25,"Você será kickado em 5 segundos.")    
addEvent(removerPlayer, 5*1000, cid)     
return TRUE
end

function isShiny(cid) 
return isCreature(cid) and string.find(getCreatureName(cid), "Shiny")  --alterado v1.9
end

function isShinyName(name)        
return tostring(name) and string.find(doCorrectString(name), "Shiny") --alterado v1.9
end

function isMega(cid) 
return isCreature(cid) and string.find(getCreatureName(cid), "Mega")  --alterado v1.9
end

function isMegaName(name)        
return tostring(name) and string.find(doCorrectString(name), "Mega") --alterado v1.9
end


function doConvertTypeToStone(type, string)
local t = {
["fly"] = {heart, "heart"},
["flying"] = {heart, "heart"},
["normal"] = {heart, "heart"},
["fire"] = {fire, "fire"},
["grass"] = {leaf, "leaf"},
["leaf"] = {leaf, "leaf"},
["water"] = {water, "water"},
["poison"] = {venom, "venom"},
["venom"] = {venom, "venom"},
["electric"] = {thunder, "thunder"},
["thunder"] = {thunder, "thunder"},
["rock"] = {rock, "rock"},
["fight"] = {punch, "punch"},
["fighting"] = {punch, "punch"},
["bug"] = {coccon, "coccon"},
["dragon"] = {crystal, "crystal"},
["dark"] = {dark, "dark"},
["ghost"] = {dark, "dark"},
["ground"] = {earth, "earth"},
["earth"] = {earth, "earth"},
["psychic"] = {enigma, "enigma"},
["steel"] = {metal, "metal"},
["ancient"] = {ancient, "ancient"},
["metal"] = {metal, "metal"},
["ice"] = {ice, "ice"},
["boost"] = {boostStone, "boost"},  --alterado v1.9
}

if string then
return t[type][2]
else
return t[type][1]
end
end

function doConvertStoneIdToString(stoneID)
local t = {
[11453] = "Heart Stone",
[11441] = "Leaf Stone",
[11442] = "Water Stone",
[11443] = "Venom Stone",
[11444] = "Thunder Stone",
[11445] = "Rock Stone",
[11446] = "Punch Stone", 
[11447] = "Fire Stone",               --alterado v1.6
[11448] = "Cocoon Stone", 
[11449] = "Crystal Stone",
[11450] = "Darkess Stone", 
[11451] = "Earth Stone",
[11452] = "Enigma Stone",
[11454] = "Ice Stone", 
[12244] = "Ancient Stone",
[12232] = "Metal Stone",
[12401] = "Shiny Stone",
--[12401] = "Shiny Fire Stone",
[12402] = "Shiny Water Stone",
[12403] = "Shiny Leaf Stone",
[12404] = "Shiny Heart Stone",
[12405] = "Shiny Enigma Stone",
[12406] = "Shiny Rock Stone",
[12407] = "Shiny Venom Stone", 
[12408] = "Shiny Ice Stone",
[12409] = "Shiny Thunder Stone",
[12410] = "Shiny Crystal Stone",
[12411] = "Shiny Cocoon Stone",
[12412] = "Shiny Darkness Stone",
[12413] = "Shiny Punch Stone",
[12414] = "Shiny Earth Stone",
[boostStone] = "Boost Stone",  --alterado v1.9
}
if t[stoneID] then
return t[stoneID]
else
return ""
end
end

function isStone(id)
if id >= leaf and id <= ice then
return true
end
if id == boostStone then  --alterado v1.9
return true
end
if id == 12232 or id == 12244 or id == 12244 or id == 12245 or id == 19694 then
return true                                 
end
if (id >= sfire and id <= searth) or id == 12417 or id == 12419 then
return true 
end
return false
end

function isWater(id)
return tonumber(id) and id >= 4820 and id <= 4825 --alterado v1.9
end

function getTopCorpse(position)
local pos = position
for n = 1, 255 do
    pos.stackpos = n
    local item = getTileThingByPos(pos)
    if item.itemid >= 2 and (string.find(getItemNameById(item.itemid), "fainted ") or string.find(getItemNameById(item.itemid), "defeated ")) then
       return getTileThingByPos(pos)
    end
end
return null
end

bpslot = CONST_SLOT_BACKPACK

function hasPokemon(cid)
	if not isCreature(cid) then return false end
	if getCreatureMana(cid) <= 0 then return false end
	if #getCreatureSummons(cid) >= 1 then return true end
	local item = getPlayerSlotItem(cid, CONST_SLOT_FEET)
	local bp = getPlayerSlotItem(cid, bpslot)
	for a, b in pairs (pokeballs) do
        if item.itemid == b.on or item.itemid == b.use then
        return true                              --alterado v1.4
        end
        if #getItemsInContainerById(bp.uid, b.on) >= 1 then
        return true
        end
	end
return false
end

function isNpcSummon(cid)
return isNpc(getCreatureMaster(cid))
end

function getPokemonHappinessDescription(cid)
-- 	if not isCreature(cid) then return true end
-- 	local str = {}
-- 	if getPokemonGender(cid) == SEX_MALE then
-- 		table.insert(str, "He")
-- 	elseif getPokemonGender(cid) == SEX_FEMALE then
-- 		table.insert(str, "She")
-- 	else
-- 		table.insert(str, "It")
-- 	end
-- 	local h = getPlayerStorageValue(cid, 1008)
-- 	if h >= tonumber(getConfigValue('PokemonStageVeryHappy')) then
-- 		table.insert(str, " is very happy with you!")
-- 	elseif h >= tonumber(getConfigValue('PokemonStageHappy')) then
-- 		table.insert(str, " is happy.")
-- 	elseif h >= tonumber(getConfigValue('PokemonStageOK')) then
-- 		table.insert(str, " is unhappy.")
-- 	elseif h >= tonumber(getConfigValue('PokemonStageSad')) then
-- 		table.insert(str, " is sad.")
-- 	elseif h >= tonumber(getConfigValue('PokemonStageMad')) then
-- 		table.insert(str, " is mad.")
-- 	else
-- 		table.insert(str, " is very mad at you!")
-- 	end
-- return table.concat(str)
end

function doSetItemAttribute(item, key, value)
doItemSetAttribute(item, key, value)
end

function isTransformed(cid)
return isCreature(cid) and not isInArray({-1, "Ditto", "Shiny Ditto"}, getPlayerStorageValue(cid, 1010))  --alterado v1.9
end

function doSendFlareEffect(pos)
	local random = {28, 29, 79}
	doSendMagicEffect(pos, random[math.random(1, 3)])
end

function isDay()
	local a = getWorldTime()
	if a >= 360 and a < 1080 then
	return true
	end
return false
end

function doPlayerSendTextWindow(cid, p1, p2)
	if not isCreature(cid) then return true end
	local item = 460
	local text = ""
	if type(p1) == "string" then
		doShowTextDialog(cid, item, p1)
	else
		doShowTextDialog(cid, p1, p2)
	end
end

function getClockString(tw)
	local a = getWorldTime()
	local b = a / 60
	local hours = math.floor(b)
	local minut = a - (60 * hours)

	if not tw then
		if hours < 10 then
			hours = "0"..hours..""
		end
		if minut < 10 then
			minut = "0"..minut..""
		end
	return hours..":"..minut
	else
		local sm = "a.m"
		if hours >= 12 then
			hours = hours - 12
			sm = "p.m"
		end
		if hours < 10 then
			hours = "0"..hours..""
		end
		if minut < 10 then
			minut = "0"..minut..""
		end
	return hours..":"..minut.." "..sm
	end
end

function doCorrectPokemonName(poke)
return doCorrectString(poke)
end

function doCorrectString(str)
local name = str:explode(" ")  --alterado v1.9
local final = {}
for _, s in ipairs(name) do
    table.insert(final, s:sub(1, 1):upper()..s:sub(2, #s):lower())
end
return table.concat(final, (name[2] and " " or ""))
end   

function getHappinessRate(cid)
	if not isCreature(cid) then return 1 end
	local a = getPlayerStorageValue(cid, 1008)
		if a == -1 then return 1 end
	if a >= getConfigValue('PokemonStageVeryHappy') then
		return happinessRate[5].rate
	elseif a >= getConfigValue('PokemonStageHappy') then
		return happinessRate[4].rate
	elseif a >= getConfigValue('PokemonStageOK') then
		return happinessRate[3].rate
	elseif a >= getConfigValue('PokemonStageSad') then
		return happinessRate[2].rate
	else
		return happinessRate[1].rate
	end
return 1
end

function doBodyPush(cid, target, go, pos)
	if not isCreature(cid) or not isCreature(target) then
		doRegainSpeed(cid)
		doRegainSpeed(target)
	return true
	end
		if go then
			local a = getThingPos(cid)
			doChangeSpeed(cid, -getCreatureSpeed(cid))
				if not isPlayer(target) then
					doChangeSpeed(target, -getCreatureSpeed(target))
				end
			doChangeSpeed(cid, 800)
			doTeleportThing(cid, getThingPos(target))
			doChangeSpeed(cid, -800)
			addEvent(doBodyPush, 350, cid, target, false, a)
		else
			doChangeSpeed(cid, 800)
			doTeleportThing(cid, pos)
			doRegainSpeed(cid)
			doRegainSpeed(target)
		end
end

function doReturnPokemon(cid, pokemon, pokeball, effect, hideeffects, blockevo)

    local pokemon = getCreatureSummons(cid)[1]
    
    if not isCreature(pokemon) then
        return true
    end

    if getPlayerStorageValue(cid, 55006) >= 1 then 
        doRemoveCountPokemon(cid)
    end
    
    if #getCreatureSummons(cid) > 1 and getPlayerStorageValue(cid, 212124) <= 0 then     --alterado v1.6
       if getPlayerStorageValue(cid, 637501) == -2 or getPlayerStorageValue(cid, 637501) >= 1 then  
          BackTeam(cid)       
       end
    end
	
    checkDuel(cid)                

    -----------------
	local edit = true

	if not pokeball then
		pokeball = getPlayerSlotItem(cid, 8)
	end

	if blockevo then
		edit = false
		doPlayerSendCancel(cid, "Your pokemon couldn't evolve due to server mistakes, please wait until we fix the problem.")
	end

	local happy = getPlayerStorageValue(pokemon, 1008)
	local hunger = getPlayerStorageValue(pokemon, 1009)
	local pokelife = (getCreatureHealth(pokemon) / getCreatureMaxHealth(pokemon))

	if edit then
		--doItemSetAttribute(pokeball.uid, "happy", happy)
		--doItemSetAttribute(pokeball.uid, "hunger", hunger)
		doItemSetAttribute(pokeball.uid, "hp", pokelife)
	end

    local isMegaAttr = getItemAttribute(pokeball.uid, "heldy")
	if not isMegaAttr or isMegaAttr and not megaEvolutions[isMegaAttr] then
	    isMegaAttr = getItemAttribute(pokeball.uid, "heldx")
	end
    if isMegaAttr and megaEvolutions[isMegaAttr] then
	    local backMega = megaEvolutions[isMegaAttr]
		if backMega then
		    doItemSetAttribute(pokeball.uid, "poke", backMega[1])
		end
	end

	if hideeffects then
		doRemoveCreature(pokemon)
	return true
	end

	local pokename = getPokeName(pokemon)

	local mbk = gobackmsgs[math.random(1, #gobackmsgs)].back:gsub("doka", pokename)

	-- if getCreatureCondition(cid, CONDITION_INFIGHT) then
		-- if isCreature(getCreatureTarget(cid)) then
			--doItemSetAttribute(pokeball.uid, "happy", happy - 5)
		-- else
			--doItemSetAttribute(pokeball.uid, "happy", happy - 2)
		-- end
	-- end

	local fromPosition = getCreaturePosition(cid)
	local toPosition = getCreaturePosition(pokemon)
    doSendDistanceShoot(fromPosition, toPosition, balls["poke"].projectile)

    -- addEvent(doSendProjectile, 350, toPosition, cid, balls["poke"].projectile)

    addEvent(function()
        if (isCreature(cid)) then
            doSendProjectile(toPosition, cid, balls["poke"].projectile)
        end
    end, 350)

    setPlayerStorageValue(cid, 23592, os.time() + 3)
	doSendCreatureEffect(pokemon, CREATURE_EFFECTS.RED_COPY_FADE_OUT)

	doTransformItem(pokeball.uid, pokeball.itemid-1)
	doItemSetAttribute(pokeball.uid, "moveBallT", "on")
	doCreatureSay(cid, mbk, TALKTYPE_MONSTER)
	doSendMagicEffect(getCreaturePosition(pokemon), effect)
	doRemoveCreature(pokemon)

    unLock(pokeball.uid) --alterado v1.8
    
   doPlayerSendCancel(cid, '12//,hide')  --alterado v1.7
   doUpdateStatusPoke(cid)
    
	doUpdateMoves(cid)

    -- doSendPlayerExtendedOpcode(cid, 111, "sair")
	doSendPlayerExtendedOpcode(cid, 82, "h")  
end

local EFFECTS = {
	--[OutfitID] = {Effect}
	["Magmar"] = 35,                --alterado v1.5
	["Shiny Magmar"] = 35,
	["Magby"] = 35,
	["Jynx"] = 17,   
	["Smoochum"] = 17, 
	["Shiny Jynx"] = 17,    
	["Piloswine"] = 205,  --alterado v1.8
    ["Swinub"] = 205, 
    ["Stantler"] = 205, 
    ["Shiny Stantler"] = 205, 
}

function doGoPokemon(cid, item)

	if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1 or getPlayerStorageValue(cid, 63215) >= 1 then
	return true
	end
---------------------------------------------------------------
local ballName = getItemAttribute(item.uid, "poke")

   btype = getPokeballType(item.itemid)   

if btype == "none" then 
    btype = getPokeballTypeOld(item.itemid)
end

if pokeballs[btype] then
    pokeballsAloalo = pokeballs[btype]
else
    pokeballsAloalo = pokeballsOLD[btype]
end                

	local effect = pokeballsAloalo.effect
		if not effect then
			effect = 21
		end
-----------------------------------------------------------------
	if item.uid ~= getPlayerSlotItem(cid, CONST_SLOT_FEET).uid then
		doPlayerSendCancel(cid, "You must put your pokeball in the correct place!")
	return TRUE
	end

	local thishp = getItemAttribute(item.uid, "hp")

	if thishp <= 0 then
		if isInArray(pokeballsAloalo.all, item.itemid) then
			doTransformItem(item.uid, pokeballsAloalo.off)
			doItemSetAttribute(item.uid, "hp", 0)
            doItemSetAttribute(item.uid, "moveBallT", "fainted") -- mixlort
			doPlayerSendCancel(cid, "This pokemon is fainted.")
		    return true
		end
	end

	local pokemon = getItemAttribute(item.uid, "poke")

	if not pokes[pokemon] then
	return true
	end

----------------------- Sistema de nao poder carregar mais que 3 pokes lvl baixo e + q 1 poke de lvl medio/alto ---------------------------------
if not isInArray({5, 6}, getPlayerGroupId(cid)) then
   local balls = getPokeballsInContainer(getPlayerSlotItem(cid, 3).uid)      --alterado v1.9 \/
   local low = {}
   local lowPokes = {"Rattata", "Caterpie", "Weedle", "Oddish", "Pidgey", "Paras", "Poliwag", "Bellsprout", "Magikarp", "Hoppip", "Sunkern"}
   if #balls >= 1 then
      for _, uid in ipairs(balls) do
          local nome = getItemAttribute(uid, "poke")
          if not isInArray(lowPokes, pokemon) and nome == pokemon then
             return doPlayerSendTextMessage(cid, 27, "Sorry, but you can't carry two pokemons equals!")
          else
             if nome == pokemon then
                table.insert(low, nome)
             end
          end
      end
   end
if #low >= 3 then
   return doPlayerSendTextMessage(cid, 27, "Sorry, but you can't carry more than three pokemons equals of low level!")
end   
end
---------------------------------------------------------------------------------------------------------------------------------------------------

	local x = pokes[pokemon]
	local boosts = getItemAttribute(item.uid, "boost") or 0

	if getPlayerLevel(cid) < (x.level + boosts) then   --alterado v1.8 \/
	doPlayerSendCancel(cid, "You need level "..(x.level + boosts).." to use this pokemon.")
	return true
	end
	
	--------------------------------------------------------------------------------------
	shinysClan = {
	["Shiny Fearow"] = {4, "Wingeon"},
	["Shiny Flareon"] = {1, "Volcanic"},
	["Shiny Vaporeon"] = {2, "Seavel"}, 
	["Shiny Jolteon"] = {9, "Raibolt"},
	["Shiny Hypno"] = {7, "Psycraft"},
	["Shiny Golem"] = {3, "Orebound"},         
	["Shiny Vileplume"] = {8, "Naturia"},
	["Shiny Nidoking"] = {5, "Malefic"},
	["Shiny Hitmontop"] = {6, "Gardestrike"},   
	}
	
	if shinysClan[pokemon] and (getPlayerGroupId(cid) < 4 or getPlayerGroupId(cid) > 6) then --alterado v1.9
	   if getPlayerStorageValue(cid, 86228) ~= shinysClan[pokemon][1] then
	      doPlayerSendCancel(cid, "You need be a member of the clan "..shinysClan[pokemon][2].." to use this pokemon!")
	      return true   
       elseif getPlayerStorageValue(cid, 862281) ~= 5 then
          doPlayerSendCancel(cid, "You need be atleast rank 5 to use this pokemon!")
	      return true
       end
    end
    --------------------------------------------------------------------------------------

    local masterPosition = getCreaturePosition(cid)
    local destPos = (getPlayerMounted(cid) and masterPosition or getPositionRandomAdjacent(masterPosition, 2,
        function(tmpPos) return isSightClear(masterPosition, tmpPos, false, true) and isWalkable22(cid, tmpPos) end))
    if (not destPos) then
        destPos = masterPosition
    end

    local ball = getPlayerSlotItem(cid, 8)
    local pokemonName = getItemAttribute(ball.uid, "poke")
    
    if (doSummonMonster(cid, pokemonName, false, destPos) ~= RETURNVALUE_NOERROR) then -- try to summon around the player, otherwise force to summon on player position
        doSummonMonster(cid, pokemonName, true) -- forced
    end

	local pk = getCreatureSummons(cid)[1]
	if not isCreature(pk) then return true end
	
	------------------------passiva hitmonchan------------------------------
	if isSummon(pk) then                                                  --alterado v1.8 \/
       if pokemon == "Shiny Hitmonchan" or pokemon == "Hitmonchan" then
          if not getItemAttribute(item.uid, "hands") then
             doSetItemAttribute(item.uid, "hands", 0)
          end
          local hands = getItemAttribute(item.uid, "hands")
          doSetCreatureOutfit(pk, {lookType = hitmonchans[pokemon][hands].out}, -1)
       end
    end
	-------------------------------------------------------------------------
    ---------movement magmar, jynx-------------
    if EFFECTS[getCreatureName(pk)] then     
       markPosEff(pk, getThingPos(pk))
       sendMovementEffect(pk, EFFECTS[getCreatureName(pk)], getThingPos(pk))   
    end
    --------------------------------------------------------------------------  

	if isGhostPokemon(pk) then doTeleportThing(pk, getPosByDir(getThingPos(cid), math.random(0, 7)), false) end

	doCreatureSetLookDir(pk, 2)

	adjustStatus(pk, item.uid, true, true, true)
	doAddPokemonInOwnList(cid, pokemon)

	doTransformItem(item.uid, item.itemid+1)

  -- if getItemAttribute(ball.uid, "aura") == "particle" then
  --   doCreatureSetSkullType(pk, math.random(10, 20))
  -- end 

	local pokename = getPokeName(pk) --alterado v1.7

	local mgo = gobackmsgs[math.random(1, #gobackmsgs)].go:gsub("doka", pokename)
	doCreatureSay(cid, mgo, TALKTYPE_MONSTER)

	doSendMagicEffect(getCreaturePosition(pk), effect)

    unLock(item.uid) --alterado v1.8

	if useKpdoDlls then
		doUpdateMoves(cid)
	end
end
 
function doRegainSpeed(cid)              --alterado v1.9 \/
    if not isCreature(cid) then return true end

    local speed = PlayerSpeed
    if isMonster(cid) then
        speed = getSpeed(cid)
  --  elseif isPlayer(cid) and isInArray({4, 5, 6}, getPlayerGroupId(cid)) then
   --     speed = 200*getPlayerGroupId(cid)  
	elseif isPlayer(cid) and getPlayerStorageValue(cid, 5700) > 0 then   --bike  
	    speed = getPlayerLevel(cid)+getPlayerStorageValue(cid, 5700)
	elseif isPlayer(cid) then
	    speed = PlayerSpeed+getPlayerLevel(cid) 
    end
   
    doChangeSpeed(cid, -getCreatureSpeed(cid))
    if getCreatureCondition(cid, CONDITION_PARALYZE) == true then
        doRemoveCondition(cid, CONDITION_PARALYZE)
        addEvent(doAddCondition, 10, cid, paralizeArea2)             
    end
    
    doChangeSpeed(cid, speed)
    return speed
end

function isPosEqualPos(pos1, pos2, checkstackpos)
	if pos1.x ~= pos2.x or pos1.y ~= pos2.y and pos1.z ~= pos2.z then
	return false
	end
	if checkstackpos and pos1.stackpos and pos2.stackpos and pos1.stackpos ~= pos2.stackpos then
	return false
	end
return true
end

function getRandomGenderByName(name)
local rate = newpokedex[name]
	if not rate then return 0 end
	rate = rate.gender
	if rate == 0 then
		gender = 3
	elseif rate == 1000 then
		gender = 4
	elseif rate == -1 then
		gender = 1
	elseif math.random(1, 1000) <= rate then
		gender = 4
	else
		gender = 3
	end
return gender
end

function getRecorderPlayer(pos, cid)
	local ret = 0
	if cid and isPosEqual(getThingPos(cid), pos) then   --alterado v1.9
	   return cid
	end
	local s = {}
	s.x = pos.x
	s.y = pos.y
	s.z = pos.z
		for a = 0, 255 do
			s.stackpos = a
			local b = getTileThingByPos(s).uid
			if b > 1 and isPlayer(b) and getCreatureOutfit(b).lookType ~= 814 then
				ret = b
			end
		end
return ret
end

function getRecorderCreature(pos, cid)
	local ret = 0
	if cid and isPosEqual(getThingPos(cid), pos) then   --alterado v1.9
	   return cid
	end
	local s = {}
	s.x = pos.x
	s.y = pos.y
	s.z = pos.z
		for a = 0, 255 do
			s.stackpos = a
			local b = getTileThingByPos(s).uid
			if b > 1 and isCreature(b) and getCreatureOutfit(b).lookType ~= 814 then
				ret = b
			end
		end
return ret
end

function doCreatureSetOutfit(cid, outfit, time)
	doSetCreatureOutfit(cid, outfit, time)
end

function doMagicalFlower(cid, away)
	if not isCreature(cid) then return true end
	for x = -3, 3 do
		for y = -3, 3 do
		local a = getThingPos(cid)
		a.x = a.x + x
		a.y = a.y + y
			if away then
				doSendDistanceShoot(a, getThingPos(cid), 21)
			else
				doSendDistanceShoot(getThingPos(cid), a, 21)
			end
		end
	end
end		

function isItemPokeball(item)         --alterado v1.9 \/
if not item then return false end
for a, b in pairs (pokeballs) do
	if isInArray(b.all, item) then return true end
	if item >= 12861 and item <= 13781 then
	return true
	end
	if item >= 13797 and item <= 13823 then
	return true
	end
        if item >= 10975 and item <= 10977 then
        return true
	end
	if item >= 13836 and item <= 13850 then
	return true
	end
	if item >= 13851 and item <= 13856 then
	return true
	end
	if item >= 13859 and item <= 13861 then
	return true
	end
	if item >= 13902 and item <= 13904 then
	return true
	end
	if item >= 13919 and item <= 13930 then
	return true
	end
end
return false
end

function isPokeball(item)
if not item then return false end
for a, b in pairs (pokeballs) do
	if isInArray(b.all, item) then return true end
	if item >= 12861 and item <= 13781 then
	return true
	end
	if item >= 13797 and item <= 13823 then
	return true
	end
        if item >= 10975 and item <= 10977 then
        return true
	end
	if item >= 13836 and item <= 13856 then
	return true
	end
end
return false
end
function getPokeballType(id)
	for a, b in pairs (pokeballs) do
		if isInArray(b.all, id) then
			return a
		end
	end
return "none"
end
function getPokeballTypeOld(id)
    for a, b in pairs (pokeballsOLD) do
        if isInArray(b.all, id) then
            return a
        end
    end
return "none"
end
randomdiagonaldir = {
[NORTHEAST] = {NORTH, EAST},
[SOUTHEAST] = {SOUTH, EAST},
[NORTHWEST] = {NORTH, WEST},
[SOUTHWEST] = {SOUTH, WEST}}

function doFaceOpposite(cid)
local a = getCreatureLookDir(cid)
local d = {
[NORTH] = SOUTH,
[SOUTH] = NORTH,
[EAST] = WEST,
[WEST] = EAST,
[NORTHEAST] = SOUTHWEST,
[NORTHWEST] = SOUTHEAST,
[SOUTHEAST] = NORTHWEST,
[SOUTHWEST] = NORTHEAST}
doCreatureSetLookDir(cid, d[a])
end

function doFaceRandom(cid)
local a = getCreatureLookDir(cid)
local d = {
[NORTH] = {SOUTH, WEST, EAST},
[SOUTH] = {NORTH, WEST, EAST},
[WEST] = {SOUTH, NORTH, EAST},
[EAST] = {SOUTH, WEST, NORTH}}
doChangeSpeed(cid, 1)
doCreatureSetLookDir(cid, d[a][math.random(1, 3)])
doChangeSpeed(cid, -1)
end

function getFaceOpposite(dir)
local d = {
[NORTH] = SOUTH,
[SOUTH] = NORTH,
[EAST] = WEST,
[WEST] = EAST,
[NORTHEAST] = SOUTHWEST,
[NORTHWEST] = SOUTHEAST,
[SOUTHEAST] = NORTHWEST,
[SOUTHWEST] = NORTHEAST}
return d[dir]
end

function getResistance(cid, combat)
	if isPlayer(cid) then return false end
local poketype1 = pokes[getCreatureName(cid)].type
local poketype2 = pokes[getCreatureName(cid)].type2
local multiplier = 1
	if effectiveness[combat].super and isInArray(effectiveness[combat].super, poketype1) then
		multiplier = multiplier * 2
	end
	if poketype2 and effectiveness[combat].super and isInArray(effectiveness[combat].super, poketype2) then
		multiplier = multiplier * 2
	end
	if effectiveness[combat].weak and isInArray(effectiveness[combat].weak, poketype1) then
		multiplier = multiplier * 0.5
	end
	if poketype2 and effectiveness[combat].weak and isInArray(effectiveness[combat].weak, poketype2) then
		multiplier = multiplier * 0.5
	end
	if effectiveness[combat].non and isInArray(effectiveness[combat].non, poketype1) then
		multiplier = multiplier * 0
	end
	if poketype2 and effectiveness[combat].non and isInArray(effectiveness[combat].non, poketype2) then
		multiplier = multiplier * 0
	end

	if multiplier == 0.25 then
		multiplier = 0.5
	elseif multiplier == 4 then
		multiplier = 2
	end

return multiplier
end

function getCreatureDirectionToTarget(cid, target, ranged)
	if not isCreature(cid) then return true end
	if not isCreature(target) then return getCreatureLookDir(cid) end
	local dirs = {
	[NORTHEAST] = {NORTH, EAST},
	[SOUTHEAST] = {SOUTH, EAST},
	[NORTHWEST] = {NORTH, WEST},
	[SOUTHWEST] = {SOUTH, WEST}}
	local x = getDirectionTo(getThingPos(cid), getThingPos(target), false)
		if x <= 3 then return x
		else
			local xdistance = math.abs(getThingPos(cid).x - getThingPos(target).x)
			local ydistance = math.abs(getThingPos(cid).y - getThingPos(target).y)
				if xdistance > ydistance then
					return dirs[x][2]
				elseif ydistance > xdistance then
					return dirs[x][1]
				elseif isInArray(dirs[x], getCreatureLookDir(cid)) then
					return getCreatureLookDir(cid)
				else
					return dirs[x][math.random(1, 2)]
				end
		end
end

function getSomeoneDescription(cid)
	if isPlayer(cid) then return getPlayerNameDescription(cid) end
return getMonsterInfo(getCreatureName(cid)).description
end
	

--[[function isGhostPokemon(cid)
if not isCreature(cid) then return false end
local ghosts = {"Gastly", "Haunter", "Gengar", "Shiny Gengar", "Misdreavus", "Shiny Abra"}
return isInArray(ghosts, getCreatureName(cid))
end]]
function isGhostPokemon(cid) 
	if not isCreature(cid) then return false end
	local isGhost = {}
	local ghosts = {"Gastly", "Haunter", "Gengar", "Shiny Gengar", "Misdreavus", "Shiny Abra"}
	
	if isSummon(cid) and isPlayer(getCreatureMaster(cid)) then
	    local ball = getPlayerSlotItem(getCreatureMaster(cid), 8).uid
		if not ball then
	        if isInArray(ghosts, getCreatureName(cid)) then 
			    return true
		    else
			    return false
		    end
	    end
		
		local Tier = getItemAttribute(ball, "heldy")
		if Tier and Tier == 39 or isInArray(ghosts, getCreatureName(cid)) then 
            -- doCreatureSetSkullType(cid, 5)
			return true
		else
			return false
		end
	end

	if isInArray(ghosts, getCreatureName(cid)) then 
		isGhost = true
	else
		isGhost = false
	end
	
	return isGhost
end

function updateGhostWalk(cid)
	if not isCreature(cid) then return false end
	local pos = getThingPos(cid)
	pos.x = pos.x + 1
	pos.y = pos.y + 1
	local ret = getThingPos(cid)
	doTeleportThing(cid, pos, false)
	doTeleportThing(cid, ret, false)
return true
end

function doRemoveElementFromTable(t, e)
	local ret = {}
	for a = 1, #t do
		if t[a] ~= e then
		table.insert(ret, t[a])
		end
	end
return ret
end

function doFaceCreature(sid, pos)
if not isCreature(sid) then return true end
	if getThingPos(sid).x == pos.x and getThingPos(sid).y == pos.y then return true end
	local ret = 0

	local ld = getCreatureLookDir(sid)
	local dir = getDirectionTo(getThingPos(sid), pos)
	local al = {
	[NORTHEAST] = {NORTH, EAST},
	[NORTHWEST] = {NORTH, WEST},
	[SOUTHEAST] = {SOUTH, EAST},
	[SOUTHWEST] = {SOUTH, WEST}}

	if dir >= 4 and isInArray(al[dir], ld) then return true end

	doChangeSpeed(sid, 1)
		if dir == 4 then
			ret = math.random(2, 3)
		elseif dir == 5 then
			ret = math.random(1, 2)
		elseif dir == 6 then
			local dirs = {0, 3}
			ret = dirs[math.random(1, 2)]
		elseif dir == 7 then
			ret = math.random(0, 1)
		else
			ret = getDirectionTo(getThingPos(sid), pos)
		end
doCreatureSetLookDir(sid, ret)
doChangeSpeed(sid, -1)
return true
end

function doCreatureAddCondition(cid, condition)
if not isCreature(cid) then return true end
doAddCondition(cid, condition)
end

function doCreatureRemoveCondition(cid, condition)
if not isCreature(cid) then return true end
doRemoveCondition(cid, condition)
end

function setCD(item, tipo, tempo)

	if not tempo or not tonumber(tempo) then
		doItemEraseAttribute(item, tipo)
	return true
	end

	doItemSetAttribute(item, tipo, "cd:"..(tempo + os.time()).."")
return tempo + os.time()
end

function getCD(item, tipo, limite)

	if not getItemAttribute(item, tipo) then
	return 0
	end

	local string = getItemAttribute(item, tipo):gsub("cd:", "")
	local number = tonumber(string) - os.time()

	if number <= 0 then
	return 0
	end

	if limite and limite < number then
		return 0
	end

return number
end

function doSendMoveEffect(cid, target, effect)
if not isCreature(cid) or not isCreature(target) then return true end
doSendDistanceShoot(getThingPos(cid), getThingPos(target), effect)
return true
end

function doSetItemActionId(uid, actionid)
doItemSetAttribute(uid, "aid", actionid)
return true
end

function threeNumbers(number)
	if number <= 9 then
	return "00"..number..""
	elseif number <= 99 then
	return "0"..number..""
	end
return ""..number..""
end

function isBr(cid)
if getPlayerStorageValue(cid, 105505) ~= -1 then
return true
end
return false
end

function isBeingUsed(ball)            
if not ball then return false end
for a, b in pairs (pokeballs) do           --alterado v1.9
    if b.use == ball then return true end
end
return false
end

function doRemoveTile(pos)-- Script by mock
pos.stackpos = 0
local sqm = getTileThingByPos(pos)
doRemoveItem(sqm.uid,1)
end

function doCreateTile(id,pos) -- By mock
doAreaCombatHealth(0,0,pos,0,0,0,CONST_ME_NONE)
doCreateItem(id,1,pos)
end

function hasSqm(pos)
local f = getTileThingByPos(pos)
if f.itemid ~= 0 and f.itemid ~= 1 then
return true
end
return false
end

function getPosDirs(p, dir) -- By MatheusMkalo
return dir == 1 and {x=p.x-1, y=p.y, z=p.z} or dir == 2 and {x=p.x-1, y=p.y+1, z=p.z} or dir == 3 and {x=p.x, y=p.y+1, z=p.z} or dir == 4 and {x=p.x+1, y=p.y+1, z=p.z} or dir == 5 and {x=p.x+1, y=p.y, z=p.z} or dir == 6 and {x=p.x+1, y=p.y-1, z=p.z} or dir == 7 and {x=p.x, y=p.y-1, z=p.z} or dir == 8 and {x=p.x-1, y=p.y-1, z=p.z}
end

function canWalkOnPos(pos, creature, pz, water, sqm, proj)
if not pos then return false end
if not pos.x then return false end
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid <= 1 and sqm then return false end
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 919 then return false end
if isInArray({4820, 4821, 4822, 4823, 4824, 4825}, getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid) and water then return false end
if getTopCreature(pos).uid > 0 and creature then return false end
if getTileInfo(pos).protection and pz then return false end
    local n = not proj and 3 or 2                                    --alterado v1.6
    for i = 0, 255 do
        pos.stackpos = i                           
        local tile = getTileThingByPos(pos)        
        if tile.itemid ~= 0 and i ~= 253 and not isCreature(tile.uid) then     --edited
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
    end   
return true
end

function canWalkOnPos2(pos, creature, pz, water, sqm, proj)     --alterado v1.6
if not pos then return false end
if not pos.x then return false end
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid <= 1 and sqm then return false end
if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 919 then return false end
if isInArray({4820, 4821, 4822, 4823, 4824, 4825}, getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid) and water then return false end
if getTopCreature(pos).uid > 0 and creature then return false end
if getTileInfo(pos).protection and pz then return false end
    --[[local n = not proj and 3 or 2
    for i = 0, 255 do
        pos.stackpos = i                           --edited pra retirar um bug.. ;x
        local tile = getTileThingByPos(pos)        
        if tile.itemid ~= 0 and i ~= 253 and not isCreature(tile.uid) then     --edited
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
    end ]]  
return true
end

function getFreeTile(pos, cid)
	if canWalkOnPos(pos, true, false, true, true, false) then
		return pos
	end
	local positions = {}
	for a = 0, 7 do
		if canWalkOnPos(getPosByDir(pos, a), true, false, true, true, false) then
		table.insert(positions, pos)
		end
	end
	if #positions >= 1 then
		if isCreature(cid) then
			local range = 1000
			local ret = getThingPos(cid)
			for b = 1, #positions do
				if getDistanceBetween(getThingPos(cid), positions[b]) < range then
					ret = positions[b]
					range = getDistanceBetween(getThingPos(cid), positions[b])
				end
			end
			return ret
		else
			return positions[math.random(#positions)]
		end
	end
return getThingPos(cid)
end

function isWalkable(pos, creature, proj, pz, water)-- by Nord
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
    if isWater(getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid) and water then return false end
    if getTopCreature(pos).uid > 0 and creature then return false end
    if getTileInfo(pos).protection and pz then return false, true end
    local n = not proj and 3 or 2
    for i = 0, 255 do
        pos.stackpos = i
        local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 and not isCreature(tile.uid) then
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
    end
    return true
end


function isPlayerSummon(cid, uid)
return getCreatureMaster(uid) == cid  --alterado v1.9
end

function isSummon(sid)
    return isCreature(sid) and getCreatureMaster(sid) ~= sid and isPlayer(getCreatureMaster(sid)) --alterado v1.9
end 

function getItemsInContainerById(container, itemid) -- Function By Kydrai
local items = {}
if isContainer(container) and getContainerSize(container) > 0 then
   for slot=0, (getContainerSize(container)-1) do
       local item = getContainerItem(container, slot)
       if isContainer(item.uid) then
          local itemsbag = getItemsInContainerById(item.uid, itemid)
          for i=0, #itemsbag do
              table.insert(items, itemsbag[i])
          end
       else
          if itemid == item.itemid then
             table.insert(items, item.uid)
          end
       end
   end
end
return items
end

function getPokeballsInContainer(container) -- Function By Kydrai
	if not isContainer(container) then return {} end
	local items = {}
	if isContainer(container) and getContainerSize(container) > 0 then
		for slot=0, (getContainerSize(container)-1) do
			local item = getContainerItem(container, slot)
				if isContainer(item.uid) then
					local itemsbag = getPokeballsInContainer(item.uid)
					for i=0, #itemsbag do
						table.insert(items, itemsbag[i])
					end
				elseif isPokeball(item.itemid) then
					table.insert(items, item.uid)
				end
		end
	end
return items
end

function getItensUniquesInContainer(container)    --alterado v1.6
if not isContainer(container) then return {} end
local items = {}
if isContainer(container) and getContainerSize(container) > 0 then
   for slot=0, (getContainerSize(container)-1) do
       local item = getContainerItem(container, slot)
       if isContainer(item.uid) then
          local itemsbag = getItensUniquesInContainer(item.uid)
          for i=0, #itemsbag do
	          table.insert(items, itemsbag[i])
          end
       elseif getItemAttribute(item.uid, "unico") then
          table.insert(items, item)
       end
   end
end
return items
end

function hasSpaceInContainer(container) --alterado v1.6
    if not isContainer(container) then return false end
    if getContainerSize(container) < getContainerCap(container) then return true end
    
    for slot = 0, (getContainerSize(container)-1) do
        local item = getContainerItem(container, slot)
        if isContainer(item.uid) then
            if hasSpaceInContainer(item.uid) then
                return true
            end
        end
    end
    return false
end

function getPlayerInArea(fromPos, toPos) -- by jhon992
local online = getPlayersOnline()
local players = {}
for i=1, #online do
    if isInArea(getPlayerPosition(online[i]), fromPos, toPos) then
        players[#players+1] = online[i]
    end
end
return players
end

function getMonstersInArea(from, to)
local inarea = {}
for x=from.x, to.x do
for y=from.y, to.y do
for z=from.z, to.z do
local p = getTopCreature({x=x, y=y, z=z}).uid
if p ~= 0 and isMonster(p) then
if (isSummon(p) and not isPlayer(getCreatureMaster(p))) or not isSummon(p) then
table.insert(inarea, p)
end
end
end
end
end
return inarea
end

function doPlayerRemoveEasterPoints(cid, count)
	if not isCreature(cid) then return false end
	points = getEasterPoints(cid)
	if (points - count) <= 0 then return false end
	if (points - count) > 0 then
		setPlayerStorageValue(cid, 14264, (points - count))
		return true
	end
return false
end
	

function doTruant(cid)
	if not isCreature(cid) then return false end
	doRaiseStatus(cid, 0, 1.5, 0, 5)
	doSleep2(cid, 5, 0, true)
	addEvent(doTruant, 15000, cid)
end

function getEasterPoints(cid)
	if not isCreature(cid) then return 0 end
	if getPlayerStorageValue(cid, 14264) <= 0 then return 0 end
return getPlayerStorageValue(cid, 14264)
end

function doGiveEasterPoints(cid, points)
	if not isCreature(cid) then return false end
	setPlayerStorageValue(cid, 14264, getEasterPoints(cid) + points)
return true
end

function getItensTypeInContainer(container)
	if not isContainer(container) then return {} end
	local items = {}
	if isContainer(container) and getContainerSize(container) > 0 then
		for slot=0, (getContainerSize(container)-1) do
			local item = getContainerItem(container, slot)
				if isContainer(item.uid) then
					local itemsbag = getItensInContainer(item.uid)
					for i=0, #itemsbag do
						table.insert(items, itemsbag[i])
					end
				elseif item.itemid > 0 then
					table.insert(items, item.type)
				end
		end
	end
return items
end

function getItensIDInContainer(container)
	if not isContainer(container) then return {} end
	local items = {}
	if isContainer(container) and getContainerSize(container) > 0 then
		for slot=0, (getContainerSize(container)-1) do
			local item = getContainerItem(container, slot)
				if isContainer(item.uid) then
					local itemsbag = getItensInContainer(item.uid)
					for i=0, #itemsbag do
						table.insert(items, itemsbag[i])
					end
				elseif item.itemid > 0 then
					table.insert(items, item.itemid)
				end
		end
	end
return items
end

function getItensInContainer(container) -- Function By Kydrai
	if not isContainer(container) then return {} end
	local items = {}
	if isContainer(container) and getContainerSize(container) > 0 then
		for slot=0, (getContainerSize(container)-1) do
			local item = getContainerItem(container, slot)
				if isContainer(item.uid) then
					local itemsbag = getItensInContainer(item.uid)
					for i=0, #itemsbag do
						table.insert(items, itemsbag[i])
					end
				elseif item.itemid > 0 then
					table.insert(items, item.uid)
				end
		end
	end
return items
end
function doPlayerAddItemStackable(cid, itemid, count)
	if not isPlayer(cid) then return false end
	if not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then return false end
	if itemid <= 0 then return false end
	playerCount = getPlayerItemCount(cid, itemid)
	if playerCount > 0 then
		doPlayerRemoveItem(cid, itemid, playerCount)
	end
	doPlayerAddItem(cid, itemid, playerCount + count)
return true
end
function doPlayerPickItem(cid, item, count, itemid, itemtype)
	if not isPlayer(cid) then return false end
	if not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then return false end
	if item <= 0 then return false end
	if count > 0 then
		doPlayerRemoveItem(cid, itemid, count)
	end
	doPlayerAddItem(cid, itemid, count + itemtype)
	doRemoveItem(item, itemtype)
return true
end
function doPlayerPickItem2(cid, count, itemid, itemtype)
	if not isPlayer(cid) then return false end
	if not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then return false end
	if itemid <= 0 then return false end
	if count > 0 then
		doPlayerRemoveItem(cid, itemid, count)
	end
	doPlayerAddItem(cid, itemid, count + itemtype)
return true
end

function removeHeldAttribute(item)
	if item <= 0 then return false end
	doItemEraseAttribute(item, "heldName")
	doItemEraseAttribute(item, "heldTier")
	doItemEraseAttribute(item, "heldId")
return true
end
function hasHeldItem(item)
	if item <= 0 then return false end
	if getItemAttribute(item, "heldName") and getItemAttribute(item, "heldTier") and getItemAttribute(item, "heldId") then
	return true
	end
return false
end

function getHeldId(item)
	if item <= 0 then return false end
	if getItemAttribute(item, "heldId") then
		return getItemAttribute(item, "heldId")
	end
return false
end

function getHeldName(item)
	if item <= 0 then return false end
	if getItemAttribute(item, "heldName") then
		return getItemAttribute(item, "heldName")
	end
return false
end

function getHeldTier(item)
	if item <= 0 then return false end
	if getItemAttribute(item, "heldTier") then
		return getItemAttribute(item, "heldTier")
	end
return false
end

function doStartAutomaticWalk(cid)
	if not isCreature(cid) then return false end
	if getPlayerStorageValue(cid, 9549) >= 1 then
		stopAutomaticWalk(cid)
		setPlayerStorageValue(cid, 9549, -1)
		return false
	end
	pos = getThingPos(cid)
	dir = getCreatureLookDir(cid)
	newpos = ""
	if dir == 0 then
		newpos = {x = pos.x, y = pos.y - 1, z = pos.z}
	elseif dir == 1 then
		newpos = {x = pos.x + 1, y = pos.y, z = pos.z}
	elseif dir == 2 then
		newpos = {x = pos.x, y = pos.y + 1, z = pos.z}
	elseif dir == 3 then
		newpos = {x = pos.x - 1, y = pos.y, z = pos.z}
	end
	if newpos == "" then return false end
	canAutomatic = false
	if getPlayerStorageValue(cid, 17000) >= 1 then
		canAutomatic = true
	end
	if getPlayerStorageValue(cid, 63215) >= 1 then
		canAutomatic = true
	end
	if not canAutomatic then
		stopAutomaticWalk(cid)
	return true
	end
	if getPlayerStorageValue(cid, 17000) >= 1 and getTileThingByPos(newpos).itemid == 0 then
		doCreateItem(460, 1, newpos)
	end
	if not isWalkable(newpos) then
		stopAutomaticWalk(cid)
	return false
	end
	if getTileThingByPos(newpos).itemid ~= 0 and getTileInfo(newpos).protection then
		stopAutomaticWalk(cid)
	return false
	elseif getHouseFromPos(newpos) then
		stopAutomaticWalk(cid)
	return false
	end
	if isCreature(getThingFromPosWithProtect(newpos)) then
		stopAutomaticWalk(cid)
	return false
	end
	setPlayerStorageValue(cid, 9548, 1)
	doCreatureSetNoMove(cid, true)
	doTeleportThing(cid, newpos, false)
	time = 100
	addEvent(doStartAutomaticWalk, time, cid)
return true
end

function stopAutomaticWalk(cid)
	if not isCreature(cid) then return false end
	if not isAutomaticWalking(cid) then return false end
	doCreatureSetNoMove(cid, false)
	setPlayerStorageValue(cid, 9548, -1)
	doCreatureSay(cid, ""..getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke")..", stop.", 1)
	return true
end

function isAutomaticWalking(cid)
	if not isCreature(cid) then return false end
	if getPlayerStorageValue(cid, 9548) >= 1 then return true end
	return false
end

function registerSketchName(cid, name, number)
	if not isCreature(cid) or not pokes[name] or not isInArray({1,2,3,4,5,6,7,8,9,10}, number) then return false end
	if getSketchName(cid, number) ~= false then return false end
	sketch = "sketch0name"
	sketchnumber = string.gsub(sketch, 0, number)
	item = getPlayerSlotItem(cid, 8)
	if item.itemid <= 0 then return false end
	doItemSetAttribute(item.uid, sketchnumber, name)
return true
end

function haveSketch(cid, number)
	if not isCreature(cid) or not isInArray({1,2,3,4,5,6,7,8,9,10}, number) then return false end
	if getSketchName(cid, number) == false then return false end
return true
end

function getSketchName(cid, number)
	if not isCreature(cid) or not isInArray({1,2,3,4,5,6,7,8,9,10}, number) then return false end
	sketch = "sketch0name"
	sketchname = string.gsub(sketch, 0, number)
	item = getPlayerSlotItem(cid, 8)
	if item.itemid <= 0 then return false end
	if getItemAttribute(item.uid, sketchname) then
		return getItemAttribute(item.uid, sketchname)
	end
return false
end

function isPlayerFishing(cid)
	if not isCreature(cid) then return false end
	if not isNumber(getPlayerStorageValue(cid, 30944)) then
		setPlayerStorageValue(cid, 30944, -1)
	end
	if getPlayerStorageValue(cid, 30944) >= 1 then return true end
return false
end
function isPlayerFishingOutfit(cid)
	if not isCreature(cid) then return false end
	if isInArray({1467, 1468}, getCreatureOutfit(cid).lookType) then return true end
return false
end
function isPlayerFisherOutfit(cid)
	if not isCreature(cid) then return false end
	if isInArray({521, 520}, getCreatureOutfit(cid).lookType) then return true end
return false
end

function setFisherOutfit(cid)
	if not isCreature(cid) then return false end
	outfit = getCreatureOutfit(cid)
	if outfit.lookType == 521 then
		doSetCreatureOutfit(cid, {lookType = 1467, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
	return true
	elseif outfit.lookType == 520 then
		doSetCreatureOutfit(cid, {lookType = 1468, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
	return true
	end
return false
end

function returnFisherOutfit(cid)
	if not isCreature(cid) then return false end
	outfit = getCreatureOutfit(cid)
	if outfit.lookType == 1467 then
		doSetCreatureOutfit(cid, {lookType = 521, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
	return true
	elseif outfit.lookType == 1468 then
		doSetCreatureOutfit(cid, {lookType = 520, lookHead = outfit.lookHead, lookBody = outfit.lookBody, lookLegs = outfit.lookLegs, lookFeet = outfit.lookFeet}, -1)
	return true
	end
return false
end

function getPlayerCoins(cid)
	if not isCreature(cid) then return 0 end
	if not isNumber(getPlayerStorageValue(cid, 23254)) then
		setPlayerStorageValue(cid, 23254, 0)
		return 0
	end
	if getPlayerStorageValue(cid, 23254) == -1 then
		return 0
	elseif getPlayerStorageValue(cid, 23254) < -1 then
		setPlayerStorageValue(cid, 23254, 0)
		return 0
	elseif getPlayerStorageValue(cid, 23254) >= 0 then
		return getPlayerStorageValue(cid, 23254)
	end
return 0
end

function doAddCondition2(cid, condition)
	if not isCreature(cid) then return false end
return doAddCondition(cid, condition)
end

function doPlayerSetNoMove2(cid, attribute)
	if not isCreature(cid) then return false end
return doPlayerSetNoMove(cid, attribute)
end

function getPlayerStorageValue2(cid, storage)
	if not isCreature(cid) then return false end
return getPlayerStorageValue(cid, storage)
end


function doTeleportThing2(cid, pos, string)
eff = false
	if not isCreature(cid) then return false end
	if string then
		eff = true
	end
return doTeleportThing(cid, pos, eff)
end

function doPlayerSendCancel2(cid, msg)
	if not isCreature(cid) then return false end
	if isPlayer(cid) then
	return doPlayerSendCancel(cid, msg)
	end
return false
end

function getStonePrice(id)
	if not isStone(id) then return 0 end
	comumStone = {11448, 11450, 11451, 11452, 11447, 11453, 11454, 11441, 11446, 11445, 11444, 11443, 11442}
	if isInArray(comumStone, id) then
	return 5000
	else
	return 10000
	end
return 0
end

function getPokemonPrice(item)
	if not pokes[getItemAttribute(item, "poke")] then return 0 end
stoneprice = 0
price = 0
name = getItemAttribute(item, "poke")
boost = getItemAttribute(item, "boost") or 0
	if boost >= 1 then
		stoneid = doConvertTypeToId(pokes[name].type)
		stoneprice = getStonePrice(stoneid) * boost
	end
	price = pokePrice[name] or pokes[name].level * 150
	price = stoneprice + price
return price
end

function getPokeTotalPriceInContainer(container)
balls = getPokeballsInContainer(container)
stoneprice = 0
	prices = {}
	if #balls >= 1 then
		for i = 1, #balls do
			if pokes[getItemAttribute(balls[i], "poke")] then
				name = getItemAttribute(balls[i], "poke")
				boost = getItemAttribute(balls[i], "boost") or 0

				if boost >= 1 then
					stoneid = doConvertTypeToId(pokes[name].type)
					stoneprice = getStonePrice(stoneid) * boost
				end
				price = pokePrice[name] or pokes[name].level * 150
				price = stoneprice + price
			else
				price = 0
			end
			table.insert(prices, math.floor(price))
		end
	end
price1 = 0
price2 = 0
price3 = 0
price4 = 0
price5 = 0
price6 = 0
	if #prices == 6 then
		price1 = prices[1]
		price2 = prices[2]
		price3 = prices[3]
		price4 = prices[4]
		price5 = prices[5]
		price6 = prices[6]
	elseif #prices == 5 then
		price1 = prices[1]
		price2 = prices[2]
		price3 = prices[3]
		price4 = prices[4]
		price5 = prices[5]
	elseif #prices == 4 then
		price1 = prices[1]
		price2 = prices[2]
		price3 = prices[3]
		price4 = prices[4]
	elseif #prices == 3 then
		price1 = prices[1]
		price2 = prices[2]
		price3 = prices[3]
	elseif #prices == 2 then
		price1 = prices[1]
		price2 = prices[2]
	elseif #prices == 1 then
		price1 = prices[1]
	end
pricetotal = price1 + price2 + price3 + price4 + price5 + price6
return math.floor(pricetotal)
end

function getPokeNamesInContainer(container)
balls = getPokeballsInContainer(container)
	names = {}
	if #balls >= 1 then
		for i = 1, #balls do
			local name = getItemAttribute(balls[i], "poke")
			table.insert(names, name)
		end
	end
return names
end

function doWriteArchive(txt, archive)
local test = io.open(archive, "a+")
	local read = ""
	if test then
		read = test:read("*all")
		test:close()
	end
	read = read.."\n"..txt..""
	local reopen = io.open(archive, "w")
	reopen:write(read)
	reopen:close()
return true
end




function doRegenerateWithY(cid, sid)
    if not isCreature(cid) then
		return
	end
	
	if not isCreature(sid) then
		return
	end
	
    if isPlayerOnline(cid) then
        local ball = getPlayerSlotItem(cid, 8) --or getPlayerSlotItem(getCreatureMaster(cid), 8)
        local Tiers = {
            [1] = {bonus = Regen1},
            [2] = {bonus = Regen2},
            [3] = {bonus = Regen3},
            [4] = {bonus = Regen4},
            [5] = {bonus = Regen5},
            [6] = {bonus = Regen6},
            [7] = {bonus = Regen7},
        }
        if isPlayer(cid) and #getCreatureSummons(cid) > 0 then
		    if type(getPlayerStorageValue(cid, 89142)) == "string" then--duel viktor  
                return true
            end
		    if ball then
                local Tier = getItemAttribute(ball.uid, "heldy")
                if Tier and Tier > 0 and Tier < 8 then
                    if not getCreatureCondition(cid, CONDITION_INFIGHT) then
                        if getCreatureHealth(sid) < getCreatureMaxHealth(sid) then
                            addEvent(function() doCreatureAddHealth(sid,Tiers[Tier].bonus) doSendAnimatedText(getThingPos(sid), "+ "..Tiers[Tier].bonus, 30) end, 0)
                        end
                        addEvent(doRegenerateWithY, 1000, cid, sid)  
                    else
                        addEvent(doRegenerateWithY, 1000, cid, sid)
                    end
                end   
            end
        end 
    end
end

function doCureWithY(cid, sid)
    if not isCreature(cid) then
		return
	end
	
	if not isCreature(sid) then
		return
	end
	
    if isPlayerOnline(cid) then
        local ball = getPlayerSlotItem(cid, 8) --or getPlayerSlotItem(getCreatureMaster(cid), 8)
		
        local Tiers = {
            [8] = {chance = Cure1},
            [9] = {chance = Cure2},
            [10] = {chance = Cure3},
            [11] = {chance = Cure4},
            [12] = {chance = Cure5},
            [13] = {chance = Cure6},
            [14] = {chance = Cure7},
        }
        
        if isPlayer(cid) and #getCreatureSummons(cid) > 0 then
		
		    if type(getPlayerStorageValue(cid, 89142)) == "string" then--duel viktor  
                return true
            end
			
			if ball then
			    local Tier = getItemAttribute(ball.uid, "heldy")
            	if Tier and Tier > 7 and Tier < 15 then
                	if math.random(1, 100) <= Tiers[Tier].chance then
                    	doCureStatus(sid, "all")  
                    	doSendMagicEffect(getThingPosWithDebug(sid), 14)
                	end
                	addEvent(doCureWithY, 1000, cid, sid)  
            	end
			end
        end
    end   
end

function getPokemonByName(cid, pokemon)
local arraypoke = {}
local container = getPlayerSlotItem(cid, 3).uid
local pokeballs = getPokeballsInContainer(container)
for i =1, #pokeballs do
name = getItemAttribute(pokeballs[i], "poke")
if pokemon == name then
table.insert(arraypoke, pokeballs[i])
return arraypoke[1]
end
end
return false
end
 
function tranfBallInShiny(pokeball)
doItemSetAttribute(pokeball, "shiny", "shiny")
return true
end
 
function getShinyByPokeball(pokeball)
local shiny = getItemAttribute(pokeball, "shiny")
return shiny == "shiny" and true or false
end
 
 
function getShinyNameByPokeball(pokeball)
local shiny = getItemAttribute(pokeball, "shiny")
return shiny and "Shiny "..getItemAttribute(pokeball, "poke").."" or getItemAttribute(pokeball, "poke")
end
 
 
function setStatusPokeballByStatusStr(pokeball, status)
local attr = string.explode(status, ",")
local x = {"poke", "hp", "offense", "defense", "speed", "vitality", "specialattack", "happy", "gender", "hands", "description", "fakedesc", "boost", "ball", "defeated", "shiny"}
for i =1, #attr do
doItemSetAttribute(pokeball, x[i], attr[i])
end
end
 
 
function copieAllStatusBalls(pokeball)
local x = {"poke", "hp", "offense", "defense", "speed", "vitality", "specialattack", "happy", "gender", "hands", "description", "fakedesc", "boost", "ball", "defeated", "shiny"}
str = ""
sep = ","
for i =1, #x do
local attr = getItemAttribute(pokeball, x[i]) or 0
local t = attr ..sep
str = str..t
end
 
return str
end
 
 
function atualizaPokes(cid)
local item = getPlayerSlotItem(cid, 8)
if item.uid <= 0 then return true end
if not getItemAttribute(item.uid, "poke") then
return true
end    
for i, x in pairs(fotos) do
if string.lower(getItemAttribute(item.uid, "poke")) == string.lower(i) then
doTransformItem(getPlayerSlotItem(cid, 7).uid, fotos[i])
if useOTClient then
doPlayerSendCancel(cid, '12//,show')
end
if useKpdoDlls then
doUpdateMoves(cid)
end
 
end
end
end
 
 
 
function doSendPokemon(cid, pokemon)
 
 
if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1 or getPlayerStorageValue(cid, 63215) >= 1
or getPlayerStorageValue(cid, 75846) >= 1 or getPlayerStorageValue(cid, 5700) >= 1  then    --alterado v1.9 <<
return true                                                                                                                        
end
 
if exhaustion.get(cid, 6666) and exhaustion.get(cid, 6666) > 0 then return true end
 
if #getCreatureSummons(cid) > 1 and getPlayerStorageValue(cid, 212124) <= 0 then     --alterado v1.6
if getPlayerStorageValue(cid, 637501) == -2 or getPlayerStorageValue(cid, 637501) >= 1 then  
BackTeam(cid)      
end
end  
 
if #getCreatureSummons(cid) > 0 then
t = getPlayerSlotItem(cid, 8)
local btype = getPokeballType(t.itemid)
if btype == "none" then 
    btype = getPokeballTypeOld(item.itemid)
end

if pokeballs[btype] then
    pokeballsAloalo = pokeballs[btype]
else
    pokeballsAloalo = pokeballsOLD[btype]
end

local effect = pokeballsAloalo.effect or 21   
 
doReturnPokemon(cid, getCreatureSummons(cid)[1], t,effect)
end
 
t = getPlayerSlotItem(cid, 8)
if t.uid ~= 0 then
pokeslot = getItemAttribute(t.uid, "poke")
 
 
if pokeslot == pokemon then
t = getPlayerSlotItem(cid, 8)
doGoPokemon(cid, t)
atualizaPokes(cid)
return true
end
 
if getPokemonByName(cid, pokemon) then
local poke = getPokemonByName(cid, pokemon)
local attr = copieAllStatusBalls(t.uid)
local id = t.itemid
doRemoveItem(t.uid)
local attr2 = copieAllStatusBalls(poke)
local id2 = getThing(poke).itemid
doRemoveItem(getPokemonByName(cid, pokemon))
createBallByStatus(cid, attr2, id2)
createBallByStatus(cid, attr, id)
t = getPlayerSlotItem(cid, 8)
doGoPokemon(cid, t)
atualizaPokes(cid)
return true
end
end
 
 
if getPokemonByName(cid, pokemon) then
local id = getThing(getPokemonByName(cid, pokemon)).itemid
local attr = copieAllStatusBalls(getPokemonByName(cid, pokemon))
doRemoveItem(getPokemonByName(cid, pokemon))
createBallByStatus(cid, attr, id)
t = getPlayerSlotItem(cid, 8)
doGoPokemon(cid, t)
atualizaPokes(cid)
return true
end
return false
end
 
 
function sendPokeInfo(cid)
local activeimg = true
local poke = getPlayerSlotItem(cid, 8)
local pokeslot = getItemAttribute(poke.uid, "poke")
local pokeboost = getItemAttribute(poke.uid, "boost") or 0
local pokehappy = getPlayerStorageValue(getCreatureSummons(cid)[1], 1008) or 1
doPlayerSendCancel(cid, "NewInfo/"..pokeslot.."/"..pokeboost.."/"..pokehappy.."")
if activeimg then
local img = "ShowPoke/"
doPlayerSendCancel(cid, img..pokeslot)
end
end
 
function doShowSelectChar(cid)
doPlayerSendCancel(cid, "ShowChar")
end
 
function doCloseSelectChar(cid)
doPlayerSendCancel(cid, "CloseChar")
end
 
function doShowLookPlayer(cid, target, msg)
doPlayerSendCancel(cid, "ShowLook/"..getPlayerStorageValue(target, 21121).."/"..msg.."")
end
 
function doCloseInfoPoke(cid)
local activeimg = true
doPlayerSendCancel(cid, "InfoClosed")
if activeimg then
local close = "ClosePoke"
doPlayerSendCancel(cid, close)
end
end
 
function sendAllPokemonsBarPoke(cid)
local container = getPlayerSlotItem(cid, 3).uid
local pokes = "Pokebar"
local t = getPlayerSlotItem(cid, 8)
if t.uid ~= 0 then
pokeslot = getItemAttribute(t.uid, "poke")
pokes = pokes.."/"..pokeslot..""
end
local pokeballs = getPokeballsInContainer(container)
for i =1, #pokeballs do
pokemons = getItemAttribute(pokeballs[i], "poke")
pokes = pokes.."/"..pokemons..""
end
doPlayerSendCancel(cid, pokes)
end
 
function isPlayerOnline(uid)
    return isInArray(getPlayersOnline(), uid)
end
 
function doRevivePokemon(cid, pokemon)
  if getPlayerItemCount(cid, 12344) <= 0 then return doPlayerSendCancel(cid, "Voce nao tem nenhum revive.") end
  local cooldownMoves = {
    ["Selfdestruct"] = 30,
    ["Selfdestruction"] = 30,
  }
  local balls = getPokeballsInContainerNew(getPlayerSlotItem(cid, 3).uid)
  if isPokeball(getPlayerSlotItem(cid, CONST_SLOT_FEET).itemid) then
    table.insert(balls, getPlayerSlotItem(cid, CONST_SLOT_FEET))
  end
  for i =1, #balls do
    local ball = balls[i]
    -- print("Pokemon: "..pokemon.." attrpoke> "..(getItemAttribute(ball.uid, "poke") or "sempoke").." attrnick> "..(getItemAttribute(ball.uid, "nick") or "sem nick"))
    if getItemAttribute(ball.uid, "poke") == pokemon or getItemAttribute(ball.uid, "nick") == pokemon then
      -- print("IGUAL")
      for type, index in pairs(pokeballs) do
        -- print(index.on.." / "..index.off)
        if ball.itemid == index.on or ball.itemid == index.off then
          -- print("revive")
          doTransformItem(ball.uid, index.on)
          doSetItemAttribute(ball.uid, "hp", 1)
          local name = getItemAttribute(ball.uid, "poke")
          for c = 1, 15 do
            local str = "move"..c
            local move = movestable[name][str]; move = move and cooldownMoves[move.name]
            setCD(ball.uid, str, move or 0)
          end
          setCD(ball.uid, "control", 0)
          setCD(ball.uid, "blink", 0) --alterado v1.6
          doSendMagicEffect(getThingPos(cid), 13)
          doPlayerRemoveItem(cid, 12344, 1)
          doCureBallStatus(ball.uid, "all")
          doUpdatePokemonsBar(cid)
          cleanBuffs2(ball.uid) --alterado v1.5
          return
        end
      end
    end
  end
end
 
 
function getPokeballsInContainerNew(container)
  if not isContainer(container) then return {} end
  local items = {}
  if isContainer(container) and getContainerSize(container) > 0 then
    for slot=0, (getContainerSize(container)-1) do
      local item = getContainerItem(container, slot)
      if isContainer(item.uid) then
        local itemsbag = getPokeballsInContainerNew(item.uid)
        for i=0, #itemsbag do
          table.insert(items, itemsbag[i])
        end
      elseif isPokeball(item.itemid) then
        table.insert(items, item)
      end
    end
  end
  return items
end

function getVitalityByMaster(cid)
if not isCreature(cid) then return 0 end
local ball = getPlayerSlotItem(cid, 8).uid
if not ball or ball <= 1 or not pokes[getItemAttribute(ball, 'poke')] then return true end
   return pokes[getItemAttribute(ball, 'poke')].vitality * (getPlayerLevel(cid) + (getItemAttribute(ball, 'boost') or 0))
end

function onPokeHealthChange(cid, zerar)
   if not isCreature(cid) then return true end
   if zerar then doPlayerSendCancel(cid, '#ph#,0,0') end
   local ball = getPlayerSlotItem(cid, 8).uid
   if not ball or ball <= 1 or not pokes[getItemAttribute(ball, 'poke')] then return true end
   
   if #getCreatureSummons(cid) >= 1 and getPlayerStorageValue(cid, 212124) <= 0 then   --alterado v1.6
      local pokemon = getCreatureSummons(cid)[1]
      local pokelife = (getCreatureHealth(pokemon) / getCreatureMaxHealth(pokemon))
      doItemSetAttribute(ball, "hp", pokelife)
   end
   
      local rd = 1 - (tonumber(getItemAttribute(ball, "hp")))
   local maxHp = HPperVITsummon * getVitalityByMaster(cid) 
   local hp = maxHp -(maxHp * rd)   
   doPlayerSendCancel(cid, '#ph#,'.. math.floor(hp) ..','.. math.floor(maxHp))
end

function doOTCSendPokemonHealth(cid)
    local ball = getPlayerSlotItem(cid, CONST_SLOT_FEET)
    local pokemon = getCreatureSummons(cid)
    if not ball.uid or ball.uid <= 1 then
        return doSendPlayerExtendedOpcode(cid, 122, "0|0")
    end
    if #pokemon >= 1 then
        return doSendPlayerExtendedOpcode(cid, 122, getCreatureHealth(pokemon[1]).."|"..getCreatureMaxHealth(pokemon[1]))
    end
end

function doTeleportFinish(cid)
    if not cid then return true end
    if not getPlayerStorageValue(cid, 2154600) then return true end
    if getPlayerStorageValue(cid, 2154600) >= 1 then
        setPlayerStorageValue(cid, 2154600, -1) 
        setPlayerStorageValue(cid, 2154601, -1) 
        setPlayerStorageValue(cid, 1654987, -1) 
        setPlayerStorageValue(cid, 468703, 15 * 60 + os.time()) 
        doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))     
        return true
    end
    return false
end
