storageEffectWalk = 1802
storageBike = 5700

function effectWhenWalking(cid, effect, frompos, topos)
    if isPlayer(cid) then
        doSendMagicEffect(frompos, effect)
    end
end

function effectOnWalk(cid, effect)
    if effect == -1 then
        setPlayerStorageValue(cid, storageEffectWalk, -1)
    else
        setPlayerStorageValue(cid, storageEffectWalk, effect)
    end
end

function doPlayerAddInKantoCatchs(cid, value)
    return setPlayerStorageValue(cid, storages.playerKantoCatches, getPlayerKantoCatches(cid) + value)
end

function getPlayerKantoCatches(cid)
    return getPlayerStorageValue(cid, storages.playerKantoCatches) == -1 and 0 or getPlayerStorageValue(cid, storages.playerKantoCatches)
end

function doPlayerAddInTotalCatchs(cid, value)
    return setPlayerStorageValue(cid, storages.playerTotalCatches, getPlayerTotalCatches(cid) + value) and doOTCSendPlayerSkills(cid)
end

function getPlayerTotalCatches(cid)
    return getPlayerStorageValue(cid, storages.playerTotalCatches) == -1 and 0 or getPlayerStorageValue(cid, storages.playerTotalCatches)
end

function hasCapacityForPokeball(cid)
    if isPlayer(cid) then
        return #getPlayerPokeballs(cid) < 6
    end
    return false
end

function getNumberDay()
    return os.date("%d")
end

function isDay()
    local hour = (os.date("*t").hour)
    return hour >= 6 and hour < 18
end

function isNight()
    return not isDay()
end
function getNumberMonth()
    return os.date("%m")
end

function getNumberYear()
    return os.date("%Y")
end

function isHour()
    return os.date("%X")
end

function removeReflect(cid)
    if not isCreature(cid) then return true end
    if getPlayerStorageValue(cid, storages.reflect) >= 1 then -- reflect system
        setPlayerStorageValue(cid, storages.reflect, getPlayerStorageValue(cid, storages.reflect) -1)
    end
end

function addMixlortPokeXp(cid, target)

    local posss = getCreaturePosition(cid)
    local XPMixlort = ( (pokes[getCreatureName(target)].exp) / 10 )

    if not XPMixlort and XPMixlort then
        print("Erro level system, faltando o pokemon na tabela BrendoXp: ")
        -- print(getCreatureName(target))
        return true
    end

    local feet = getPlayerSlotItem(cid, CONST_SLOT_FEET)
    local chck = getItemAttribute(feet.uid, "exp")
    local chckc = getItemAttribute(feet.uid, "level")

    local summons = getCreatureSummons(cid)
    if #summons == 0 then
        return true
    end

    if getTileInfo(getThingPos(cid)).pvp then 
        return true
    end

    if getItemAttribute(feet.uid, "level") >= 100 then 
        return true
    end

    if getPlayerStorageValue(cid, 990) > 0 then
        return true
    end

    local pk = getCreatureSummons(cid)[1]

    if isPlayer(cid) == TRUE and isSummon(target) == true then
        doPlayerSendCancel(cid, "Your Pokemon dont gain experience in Duel")
        return TRUE
    end
    ---------------------------------------------------------------- level 1 ----------------------------------------------------------------
    if isPlayer(target) == FALSE and getItemAttribute(feet.uid, "level") == False then
        return true
    end

    local level = getItemAttribute(feet.uid, "level")
    local exp = getItemAttribute(feet.uid, "exp")
    local pk = getCreatureSummons(cid)[1]

    if isPlayer(target) == FALSE and getItemAttribute(feet.uid, "level") < 100 and getItemAttribute(feet.uid, "exp") >= 0 and ((XPMixlort*2) + exp) < (level * 20) + (20 *(level - 1)) then
        doItemSetAttribute(feet.uid, "exp", chck + (XPMixlort*2))
        doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Seu "..getPokeName(getCreatureSummons(cid)[1]).." ganhou "..(XPMixlort*2).." de experiência por derrotar "..getCreatureName(target)..".")
        doUpdatePokeInfo(cid)
        return true
    end

    if isPlayer(target) == FALSE and getItemAttribute(feet.uid, "level") < 100 and ((XPMixlort*2) + exp) >= (level * 20) + (20 *(level - 1)) then
        doPlayerSendTextMessage(cid, 27, "Seu "..getCreatureName(getCreatureSummons(cid)[1]).." avançou do nível "..level.." para o nível "..level + 1 ..".")
        doCreatureSay(cid, getPokeName(getCreatureSummons(cid)[1])..", voce esta ficando muito forte!", TALKTYPE_SAY)    
        doItemSetAttribute(feet.uid, "level", level +1) 
        doItemSetAttribute(feet.uid, "exp", 0)
        doSendAnimatedText(getCreaturePosition(getCreatureSummons(cid)[1]), "LEVEL UP!", 215) 

        local posPlayerLevel = getCreaturePosition(getCreatureSummons(cid)[1])
        doSendMagicEffect(posPlayerLevel, 132)   
        doSendMagicEffect({x=posPlayerLevel.x+1,y=posPlayerLevel.y,z=posPlayerLevel.z}, 1037) 
        doSendMagicEffect({x=posPlayerLevel.x+1,y=posPlayerLevel.y,z=posPlayerLevel.z}, 1035) 
        adjustStatus(pk, feet.uid, true, true, true)
        doUpdatePokeInfo(cid)
        return true
    end

end

function pokelevelplusfunc(cid, attacker)

    local name2 = doCorrectPokemonName(getCreatureName(cid))
    local pevo = poevo[name2]

    if not cid then
        return true
    end

    if not pevo then
        return true
    end
    if not POKELEVEL_PLUS.evolution_tab[name2] then
        return true
    end
    
    local getEvolution = POKELEVEL_PLUS.evolution_tab[getCreatureName(cid)]
    local name = getEvolution.evolution

    if getEvolution then

        setCreatureMaxHealth(cid, 5000000) 
        doCreatureAddHealth(cid, 5000000)

        if not cid then return true end
        if not isMonster(cid) then return true end

        attacker = isSummon(attacker) and getCreatureMaster(attacker) or attacker

        if (isPlayer(attacker)) then
            doPlayerSendTextMessage(attacker, 20, "Ooh não! O " .. getCreatureName(cid) .. " selvagem evoluiu.")
            doPlayerSendTextMessage(attacker, 25, "Ooh não! O " .. getCreatureName(cid) .. " selvagem evoluiu.")
        end

        addEvent(function(cid, attacker)

                local getEvolution = POKELEVEL_PLUS.evolution_tab[getCreatureName(cid)]

                local infos = {pos = getThingPos(cid), dir = getCreatureLookDirection(cid)}
                local monster = doCreateMonster(getEvolution.evolution, infos.pos)
                doCreatureSetLookDirection(monster, infos.dir)

                sendFinishEvolutionEffect(monster, true)
                addEvent(sendFinishEvolutionEffect, 350, monster, true)
                addEvent(sendFinishEvolutionEffect, 500, monster)

        end, 600, cid, getCreatureName(cid), name, getThingPos(cid))   

        sendFinishEvolutionEffect(cid, true)
        addEvent(sendFinishEvolutionEffect, 100, cid, true)
        addEvent(sendFinishEvolutionEffect, 200, cid)

        addEvent(doRemoveCreature, 800, cid)
    end
end

function hasEvolution(name)
    for _, pokeTable in pairs(evolutionss) do
        if pokeTable.from == name then
            return true
        end
    end
    return (specialEvo[name] and true or false)
end

function getPokemonEvolutionTab(name)
    if hasEvolution(name) then
        for _, pokeTable in pairs(evolutionss) do
            if pokeTable.from and pokeTable.from == name then
                return pokeTable
            end
        end
    end
    return {}
end

function getStonesToEvolve(name)
    if hasEvolution(name) then
        local t = getPokemonEvolutionTab(name).stones:explode(",")
        local str = {}
        for _, stones in pairs(t) do
            local t2 = stones:explode(" ")
            table.insert(str, {quant = t2[1], id = stoneToString[t2[2]]})
        end
        return str
    end
    return {}
end

function canEvolveWithThisStone(name, id)
    for _, tab in pairs(getStonesToEvolve(name)) do
        if tab.id == id then
            return true
        end
    end 
    return false
end

function isBiking(cid)
  return getPlayerStorageValue(cid, 5700) == 1
end

function cancelBike(cid, NotOutfit)
  if not NotOutfit then
    doRemoveCondition(cid, CONDITION_OUTFIT)
  end
  setPlayerStorageValue(cid, 5700, -1)
end

function isRiderOrFlyOrSurf(cid)
  if getPlayerStorageValue(cid, orderTalks["surf"].storage) == 1 or getPlayerStorageValue(cid, orderTalks["ride"].storage) == 1 or getPlayerStorageValue(cid, orderTalks["fly"].storage) == 1 then
    return true 
  end
  return false
end

function getPokemonCorpse(name)
  if not pokes[name] then return false end
  return getMonsterInfo(name).lookCorpse
end

function doConcatTable(itemsss, sep1, sep2)
  local str = ""
  if #itemsss > 0 then
    for i = 1, #itemsss do
      if #itemsss > 1 then
        if i ~= #itemsss then
          if i ~= 1 then
            str = str..sep1..itemsss[i]
          else
            str = str..itemsss[i]
          end
        else
          str = str..sep2..itemsss[i]
        end
      else
        str = itemsss[i]
      end
    end
  end
  return str
end

function doUpdatePokeInfo(cid)
local owner = getCreatureMaster(cid)
local port = getPlayerSlotItem(owner, 8).uid
local name = getItemAttribute(port, "nome") or "Abra"
local pokeball = getPlayerSlotItem(cid, 8)

local ret = {}
if not fotos[name] then return true end
local portraitId = fotos[name]
local foto = getItemInfo(portraitId).clientId or 2395
table.insert(ret, foto.."")

local feet = getPlayerSlotItem(owner, CONST_SLOT_FEET)
local level333 = getItemAttribute(feet.uid, "level")
if getCreatureSummons(owner)[1] then
doPokeInfoAttr(cid)
if getItemAttribute(feet.uid, "nome") then
doPlayerSendCancel(owner, "PokeInfo@"..getItemAttribute(pokeball.uid, "nome").."@"..getItemAttribute(pokeball.uid, "nome").."@"..getCreatureHealth(getCreatureSummons(cid)[1]).."@"..getCreatureMaxHealth(getCreatureSummons(cid)[1])   .."@1@0@7746@"..getItemAttribute(pokeball.uid, "exp").."@"..((level333 * 20) + (20 *(level333 - 1))).."@1,"..getItemAttribute(pokeball.uid, "nome").."@"..table.concat(ret).."")
doPlayerSendCancel(owner, "")
else
doPlayerSendCancel(owner, "PokeInfo@"..getItemAttribute(pokeball.uid, "poke").."@"..getItemAttribute(pokeball.uid, "poke").."@"..getCreatureHealth(getCreatureSummons(cid)[1]).."@"..getCreatureMaxHealth(getCreatureSummons(cid)[1])   .."@1@0@7746@"..getItemAttribute(pokeball.uid, "exp").."@"..((level333 * 20) + (20 *(level333 - 1))).."@1,"..getItemAttribute(pokeball.uid, "poke").."@"..table.concat(ret).."")
doPlayerSendCancel(owner, "")
end
else
doPlayerSendCancel(owner, "")
end

end

function doPokeInfoAttr(cid)

if not getCreatureSummons(cid)[1] then
doPlayerSendCancel(cid, "##77PIN:RMATTR")
doPlayerSendCancel(cid, "")
return true
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["Fly"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,FLY")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["Rock Smash"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,RSM")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["Light"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,LGT")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["Dig"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,DIG")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["Blink"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,BLK")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["Ride"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,RDI")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["Surf"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,SRF")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["Teleport"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,TPR")
doPlayerSendCancel(cid, "")
end

local skills = specialabilities
local mysum = getCreatureSummons(cid)[1]
if isInArray(skills["Cut"], getPokemonName(mysum)) then
doPlayerSendCancel(cid, "##77PIN,CUT")
doPlayerSendCancel(cid, "")
end
end

function doUsePokemon(cid)
if getPlayerSlotItem(cid, CONST_SLOT_FEET).uid >= 1 then
doUseItem(cid, getPlayerSlotItem(cid, 8).uid)
else
doPlayerSendCancel(cid, "")
end
end

function isExhaust(cid)
    return hasCondition(cid, CONDITION_EXHAUST)
end

function doAddExhaust(cid)
    doAddCondition(cid, delayCondition)
end

function setPlayerVulnerable(cid, vulnerable)
    local playerGroupId = getPlayerGroupId(cid)

    if (playerGroupId == 1 and not vulnerable) then -- Player vulnerable coming unvulnerable
        setPlayerGroupId(cid, 7)

    elseif (playerGroupId == 7 and vulnerable) then -- Player unvulnerable coming vulnerable
        setPlayerGroupId(cid, 1)

    -- elseif (playerGroupId == 2 and not vulnerable) then -- Tutor vulnerable coming unvulnerable
    --     setPlayerGroupId(cid, 8)

    -- elseif (playerGroupId == 8 and vulnerable) then -- Tutor unvulnerable coming vulnerable
    --     setPlayerGroupId(cid, 2)

    elseif (playerGroupId == 3 and not vulnerable) then -- Tutor vulnerable coming unvulnerable
        setPlayerGroupId(cid, 9)

    elseif (playerGroupId == 9 and vulnerable) then -- Tutor unvulnerable coming vulnerable
        setPlayerGroupId(cid, 3)
    end
end

function setFlyingStatus(cid, status)
    doCreatureSetStorage(cid, playersStorages.isFlying, (status and 1 or -1))
end

function getSamePosition(pos1, pos2)
    return pos1.x == pos2.x and pos1.y == pos2.y and pos1.z == pos2.z
end

function isUnderwater(cid)
    return getCreatureStorage(cid, playersStorages.isUnderwater) > -1
end

function setUnderwaterStatus(cid, status)
    doCreatureSetStorage(cid, playersStorages.isUnderwater, (status and 1 or -1))
end

function isWalkable22(cid, pos)
    return doTileQueryAdd(cid, pos, 0, false) == 1
end

function getPositionRandomAdjacent(pos, size, checkFunc)
  if (not checkFunc) then
    return getPositionByDirection({x = pos.x, y = pos.y, z = pos.z},
      table.random({NORTH, EAST, SOUTH, WEST, SOUTHWEST, SOUTHEAST, NORTHWEST, NORTHEAST}), size or 1)
  end

  local dirs = {NORTH, EAST, SOUTH, WEST, SOUTHWEST, SOUTHEAST, NORTHWEST, NORTHEAST}
  for i = 1, #dirs do
    local dir = table.randomRemove(dirs)
    local tmpPos = getPositionByDirection({x = pos.x, y = pos.y, z = pos.z}, dir, size or 1)
    if (checkFunc(tmpPos)) then
      return tmpPos
    end
  end
  return nil
end

function doSendProjectile(fromPosition, toCid, projectile)
    doSendDistanceShoot(fromPosition, getCreaturePosition(toCid), projectile)
end

function isTutor(cid)
    local g = getPlayerGroupId(cid)
    return g == 2 or g == 8
end

function isGod(cid)
  if isPlayer(cid) then 
    if getPlayerGroupId(cid) >= 6 then
      return true 
    end
    return false
  end
end

function isEvolving(cid)
    return getCreatureStorage(cid, playersStorages.isEvolving) > -1
end

function doPlayerRemoveFrontierBalls(cid)
    for _, item in pairs(getPlayerAllBallsWithPokemon(cid)) do
        if (ballsNames[item.itemid] == "frontier") then
            doRemoveItem(item.uid)
        end
    end
end

function getPlayerBall(cid)
    return getPlayerSlotItem(cid, CONST_SLOT_FEET)
end

function isItem(item)
    return item and item.uid ~= nil and item.itemid ~= nil and item.uid > 0 and item.itemid > 0
end

function isPokemonOnline(cid)
    return isCreature(getCreatureSummons(cid)[1])
end

function isString(v)
    return type(v) == "string"
end

function getContainerItems(uid, recursive)
    recursive = recursive ~= nil and recursive or false
    local containerItems = {}
    for i = 0, getContainerSize(uid) - 1 do
        local tmpItem = getContainerItem(uid, i)
        containerItems[#containerItems + 1] = tmpItem
        if (recursive and isContainer(tmpItem.uid)) then
            containerItems = table_concat(containerItems, getContainerItems(tmpItem.uid, recursive))
        end
    end
    return containerItems
end

function getPlayerMounted(cid)
    return isSurfing(cid) or isFlying(cid) or isRiding(cid) or isDiving(cid) or isLevitating(cid)
end

function isSurfing(cid)
    return getCreatureStorage(cid, 63215) > -1
end

function isRiding(cid)
    return getCreatureStorage(cid, 17001) > -1
end

function isFlying(cid)
    return getCreatureStorage(cid, 17000) > -1
end

function isLevitating(cid)
    return getCreatureStorage(cid, playersStorages.isLevitating) > -1
end
function isDiving(cid)
    return getCreatureStorage(cid, playersStorages.isDiving) > -1
end

function getPositionAdjacent(cid, targetPos, checkPath)
    local dirs = { NORTH, EAST, SOUTH, WEST, SOUTHWEST, SOUTHEAST, NORTHWEST, NORTHEAST }
    for k, v in ipairs(dirs) do
        local pos = { x = targetPos.x, y = targetPos.y, z = targetPos.z }
        pos = getPositionByDirection(pos, v, 1)
        if (isWalkable22(cid, pos) and (not checkPath or getPathToEx(cid, pos))) then
            return pos
        end
    end
    return nil
end

function getPlayerAllBallsWithPokemon(cid)
    local ballsWithPokemon = {}

    local ballSlotItem = getPlayerSlotItem(cid, 8)
    if (isItem(ballSlotItem) and isBallWithPokemon(ballSlotItem.uid)) then
        table.insert(ballsWithPokemon, ballSlotItem)
    end
    -- print(#isBallWithPokemon)

    local playerBackpack = getPlayerSlotItem(cid, 3)
    if (isItem(playerBackpack) and isContainer(playerBackpack.uid)) then
        local items = getContainerItems(playerBackpack.uid)
        local i = #items
        local currentItem

        while (i > 0) do
            currentItem = items[i]

            if (isContainer(currentItem.uid)) then
                items = table_concat(items, getContainerItems(currentItem.uid))
            elseif (isBallWithPokemon(currentItem.uid)) then
                table.insert(ballsWithPokemon, currentItem)
            end

            table.remove(items, i)
            i = #items
        end
    end

    -- print(isBallWithPokemon)
    -- print(#ballsWithPokemon)
    return ballsWithPokemon
end

function getAllItemsFromContainer(container)
    local containers = {}
    local items = {}
 
    local sitem = container
    if sitem.uid > 0 then
        if isContainer(sitem.uid) then
            table.insert(containers, sitem.uid)
        elseif not(id) or id == sitem.itemid then
            table.insert(items, sitem)
        end
    end
 
    while #containers > 0 do
        for k = (getContainerSize(containers[1]) - 1), 0, -1 do
            local tmp = getContainerItem(containers[1], k)
            if isContainer(tmp.uid) then
                table.insert(containers, tmp.uid)
            elseif not(id) or id == tmp.itemid then
                table.insert(items, tmp)
            end
        end
        table.remove(containers, 1)
    end
 
    return items
end

function doPlayerBroadcastMessage(cid, text, class, checkFlag, ghost)
    local checkFlag, ghost, class = checkFlag or true, ghost or false, class or TALKTYPE_BROADCAST
    if(checkFlag and not getPlayerFlagValue(cid, PLAYERFLAG_CANBROADCAST)) then
        return false
    end

    if(type(class) == 'string') then
        local className = TALKTYPE_TYPES[class]
        if(className == nil) then
            return false
        end

        class = className
    elseif(class < TALKTYPE_FIRST or class > TALKTYPE_LAST) then
        return false
    end

    local players = getPlayersOnline()
    for _, pid in ipairs(players) do
        doCreatureSay(cid, text, class, ghost, pid)
    end

    print("> " .. getCreatureName(cid) .. " broadcasted message: \"" .. text .. "\".")
    return true
end

function doBroadcastMessageOld(text, class)
    local class = class or MESSAGE_STATUS_WARNING
    if(type(class) == 'string') then
        local className = MESSAGE_TYPES[class]
        if(className == nil) then
            return false
        end

        class = className
    elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
        return false
    end

    local players = getPlayersOnline()
    for _, pid in ipairs(players) do
        doPlayerSendTextMessage(pid, class, text)
    end

    print("> Broadcasted message: \"" .. text .. "\".")
    return true
end

function doBroadcastMessage(text, class)
    -- local class = class or MESSAGE_STATUS_WARNING
    local class = 20
    if(type(class) == 'string') then
        local className = MESSAGE_TYPES[class]
        if(className == nil) then
            return false
        end

        class = className
    elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
        return false
    end

    local infoToSend = {
        action = "showBroadcastNotification",
        background_color = "#ffffff",
        opacity = 0.8,
        icon = "images/broadcast/megaphone",
        time = 5500,
        text = text,
    }

    local players = getPlayersOnline()
    for _, pid in ipairs(players) do
        doSendPlayerExtendedOpcode(pid, 90, json.encode(infoToSend))
        doPlayerSendTextMessage(pid, class, text)
    end

    print("> Broadcasted message: \"" .. text .. "\".")
    return true
end

function doSendCustomBroadcastMessage(str, color, icon, time, opacity)
    local infoToSend = {
        action = "showBroadcastNotification",
        background_color = color,
        opacity = opacity,
        icon = icon,
        time = time,
        text = str,
    }

    local players = getPlayersOnline()
    for _, pid in ipairs(players) do
        doSendPlayerExtendedOpcode(pid, 90, json.encode(infoToSend))
        doPlayerSendTextMessage(pid, 20, text)
    end
end

function doBroadcastMessageMegaphone(text)

    -- local class = class or MESSAGE_STATUS_WARNING
    local class = 20
    if(type(class) == 'string') then
        local className = MESSAGE_TYPES[class]
        if(className == nil) then
            return false
        end

        class = className
    elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
        return false
    end

    local infoToSend = {
        action = "showBroadcastNotification",
        background_color = "#ffffff",
        opacity = 0.8,
        icon = "images/broadcast/megaphone",
        time = 5500,
        text = text,
    }

    local players = getPlayersOnline()
    for _, pid in ipairs(players) do
        doPlayerSendTextMessage(pid, 20, text)  
    end

    doSendCustomBroadcastMessage(text, "#ffffff", "images/broadcast/megaphone", 5500, 0.8)
    print("> Broadcasted message: \"" .. text .. "\".")
    return true
end

function doBroadcastMessageXp(text)

    local class = 20
    if(type(class) == 'string') then
        local className = MESSAGE_TYPES[class]
        if(className == nil) then
            return false
        end

        class = className
    elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
        return false
    end

    local infoToSend = {
        action = "showBroadcastNotification",
        background_color = "#ffffff",
        opacity = 0.8,
        icon = "images/broadcast/megaphone",
        time = 5500,
        text = text,
    }

    local players = getPlayersOnline()
    for _, pid in ipairs(players) do
        doPlayerSendTextMessage(pid, 20, text)  
    end

    doSendCustomBroadcastMessage(text, "#f7f43e", "images/broadcast/xpboost", 5500, 0.8)
    print("> Broadcasted message: \"" .. text .. "\".")
    return true
end

function doBroadcastMessageMewtwo(text)

    local class = 20
    if(type(class) == 'string') then
        local className = MESSAGE_TYPES[class]
        if(className == nil) then
            return false
        end

        class = className
    elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
        return false
    end

    local infoToSend = {
        action = "showBroadcastNotification",
        background_color = "#ffffff",
        opacity = 0.8,
        icon = "images/broadcast/megaphone",
        time = 5500,
        text = text,
    }

    local players = getPlayersOnline()
    for _, pid in ipairs(players) do
        doPlayerSendTextMessage(pid, 20, text)  
    end

    doSendCustomBroadcastMessage(text, "#ffffff", "images/broadcast/mewtwo", 5500, 0.8)
    print("> Broadcasted message: \"" .. text .. "\".")
    return true
end

function doBroadcastMessageWorld(text)

    local class = 20
    if(type(class) == 'string') then
        local className = MESSAGE_TYPES[class]
        if(className == nil) then
            return false
        end

        class = className
    elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
        return false
    end

    local infoToSend = {
        action = "showBroadcastNotification",
        background_color = "#ffffff",
        opacity = 0.8,
        icon = "images/broadcast/megaphone",
        time = 5500,
        text = text,
    }

    local players = getPlayersOnline()
    for _, pid in ipairs(players) do
        doPlayerSendTextMessage(pid, 20, text)  
    end

    doSendCustomBroadcastMessage(text, "#ffffff", "images/broadcast/world", 5500, 0.8)
    print("> Broadcasted message: \"" .. text .. "\".")
    return true
end

function doBroadcastMessageDeltaball(text)

    local class = 20
    if(type(class) == 'string') then
        local className = MESSAGE_TYPES[class]
        if(className == nil) then
            return false
        end

        class = className
    elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
        return false
    end

    local infoToSend = {
        action = "showBroadcastNotification",
        background_color = "#ffffff",
        opacity = 0.8,
        icon = "images/broadcast/megaphone",
        time = 5500,
        text = text,
    }

    local players = getPlayersOnline()
    for _, pid in ipairs(players) do
       doPlayerSendTextMessage(pid, 20, text)  
    end

    doSendCustomBroadcastMessage(text, "#ffffff", "images/broadcast/deltaball", 5500, 0.8)
    print("> Broadcasted message: \"" .. text .. "\".")
    return true
end

function doBroadcastMessageFacebook(text)

    local class = 20
    if(type(class) == 'string') then
        local className = MESSAGE_TYPES[class]
        if(className == nil) then
            return false
        end

        class = className
    elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
        return false
    end

    local infoToSend = {
        action = "showBroadcastNotification",
        background_color = "#ffffff",
        opacity = 0.8,
        icon = "images/broadcast/megaphone",
        time = 5500,
        text = text,
    }

    local players = getPlayersOnline()
    for _, pid in ipairs(players) do
       doPlayerSendTextMessage(pid, 20, text)  
    end

    doSendCustomBroadcastMessage(text, "#0077ff", "images/broadcast/face", 5500, 0.8)
    print("> Broadcasted message: \"" .. text .. "\".")
    return true
end

function doBroadcastMessageMs(text)
    
    local class = 20
    if(type(class) == 'string') then
        local className = MESSAGE_TYPES[class]
        if(className == nil) then
            return false
        end

        class = className
    elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
        return false
    end

    local infoToSend = {
        action = "showBroadcastNotification",
        background_color = "#ffffff",
        opacity = 0.8,
        icon = "images/broadcast/megaphone",
        time = 5500,
        text = text,
    }

    local players = getPlayersOnline()
    for _, pid in ipairs(players) do
        doPlayerSendTextMessage(pid, 20, text)  
    end

    doSendCustomBroadcastMessage(text, "#5efaff", "images/broadcast/logo", 5500, 0.8)
    print("> Broadcasted message: \"" .. text .. "\".")
    return true
end

function doBroadcastMessageStaff(text)
    
    local class = 20
    if(type(class) == 'string') then
        local className = MESSAGE_TYPES[class]
        if(className == nil) then
            return false
        end

        class = className
    elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
        return false
    end

    local infoToSend = {
        action = "showBroadcastNotification",
        background_color = "#ffffff",
        opacity = 0.8,
        icon = "images/broadcast/megaphone",
        time = 5500,
        text = text,
    }

    local players = getPlayersOnline()
    for _, pid in ipairs(players) do
        doPlayerSendTextMessage(pid, 20, text)  
    end

    doSendCustomBroadcastMessage(text, "#5efaff", "images/broadcast/staff", 5500, 0.8)
    print("> Broadcasted message: \"" .. text .. "\".")
    return true
end

function doBroadcastMessageMixlort(text)

    local class = 20
    if(type(class) == 'string') then
        local className = MESSAGE_TYPES[class]
        if(className == nil) then
            return false
        end

        class = className
    elseif(class < MESSAGE_FIRST or class > MESSAGE_LAST) then
        return false
    end

    local infoToSend = {
        action = "showBroadcastNotification",
        background_color = "#ffffff",
        opacity = 0.8,
        icon = "images/broadcast/megaphone",
        time = 5500,
        text = text,
    }

    local players = getPlayersOnline()
    for _, pid in ipairs(players) do
        doPlayerSendTextMessage(pid, 20, text)  
    end
    
    doSendCustomBroadcastMessage(text, "#cc0000", "images/broadcast/staff", 5500, 0.8)
    print("> Broadcasted message: \"" .. text .. "\".")
    return true
end

function getPlayerTotalItem(cid)
  local count = 0
  for i = CONST_SLOT_FIRST, CONST_SLOT_LAST do
    local slotsItem = getPlayerSlotItem(cid, i)
    if slotsItem.uid > 0 then
      if isContainer(slotsItem.uid) then
        count = count + #getAllItemsFromContainer(slotsItem)
      else
        count = count + 1
      end
    end
  end
  return count
end

local storages = {  -- Todas as storages usadas em quaisquer scripts terão q ser armazenadas aqui
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
    AutoLootCollectAll = 20025,
    AutoLootList = 20007,
    UsingAutoLoot = 20008,
}

function isCollectAll(cid)
if getPlayerStorageValue(cid, 20026) >= 1 then
   return getPlayerStorageValue(cid, storages.AutoLootCollectAll):find("all") and true or false
else
  return false
end
end

-- function isCollectAll(cid)
--    return getPlayerStorageValue(cid, storages.AutoLootCollectAll):find("all") and true or false
-- end

function doSendMsg(cid, msg)
  if not isPlayer(cid) then return true end
  doPlayerSendTextMessage(cid, 27, msg)
end

function getPlayerPokemons(cid)
  local ret = {}
  if isPlayer(cid) and #getCreatureSummons(cid) > 0 then
    for i = 1, #getCreatureSummons(cid) do
      if isCreature(getCreatureSummons(cid)[i]) and getCreatureStorage(getCreatureSummons(cid)[i], 10) ~= "guardian" then
        table.insert(ret, getCreatureSummons(cid)[i])
      end
    end
  end
  return ret
end

function getContainerSlotsFree(container) -- by vodka
    local freeSlots = getContainerCap(container)-getContainerSize(container)
    if freeSlots == 0 then
        freeSlots = 333
    end
    return freeSlots
end

function temGhostMix(cid, item)

  -- if getCreatureSummons(cid)[1] or getCreatureSummons(cid)[1] then
  --   pk = getCreatureSummons(cid)[1]
  -- else
  --   pk = cid
  -- end

  -- local ball = getPlayerSlotItem(cid, 8).uid
  -- local Tier = getItemAttribute(ball, "heldy")
  -- if Tier and Tier == 39 then 
  --   doCreatureSetSkullType(pk, 5)
  -- end

end

function temAuraMix(cid, item)

  -- if getCreatureSummons(cid)[1] or getCreatureSummons(cid)[1] then
  --   pk = getCreatureSummons(cid)[1]
  -- else
  --   pk = cid
  -- end

  -- if getItemAttribute(item.uid, "aura") == "pcolor9" then
  --   doCreatureSetSkullType(pk, 9)
  -- end

  -- if getItemAttribute(item.uid, "aura") == "pcolor10" then
  --   doCreatureSetSkullType(pk, 10)
  -- end

  -- if getItemAttribute(item.uid, "aura") == "pcolor11" then
  --   doCreatureSetSkullType(pk, 11)
  -- end

  -- if getItemAttribute(item.uid, "aura") == "pcolor12" then
  --   doCreatureSetSkullType(pk, 12)
  -- end

  -- if getItemAttribute(item.uid, "aura") == "pcolor13" then
  --   doCreatureSetSkullType(pk, 13)
  -- end

  -- if getItemAttribute(item.uid, "aura") == "pcolor14" then
  --   doCreatureSetSkullType(pk, 14)
  -- end

  -- if getItemAttribute(item.uid, "aura") == "pcolor15" then
  --   doCreatureSetSkullType(pk, 15)
  -- end

  -- if getItemAttribute(item.uid, "aura") == "pcolor16" then
  --   doCreatureSetSkullType(pk, 16)
  -- end

  -- if getItemAttribute(item.uid, "aura") == "pcolor17" then
  --   doCreatureSetSkullType(pk, 17)
  -- end

  -- if getItemAttribute(item.uid, "aura") == "pcolor18" then
  --   doCreatureSetSkullType(pk, 18)
  -- end

  -- if getItemAttribute(item.uid, "aura") == "pcolor19" then
  --   doCreatureSetSkullType(pk, 19)
  -- end

  -- if getItemAttribute(item.uid, "aura") == "pcolor20" then
  --   doCreatureSetSkullType(pk, 20)
  -- end

  -- if getItemAttribute(item.uid, "aura") == "pcolor21" then
  --   doCreatureSetSkullType(pk, 21)
  -- end

  -- if getItemAttribute(item.uid, "aura") == "pcolor22" then
  --   doCreatureSetSkullType(pk, 22)
  -- end

end