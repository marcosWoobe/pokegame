local EFFECTS = {
--[OutfitID] = {Effect}
["Clefable"] = 32,
["Shiny Clefable"] = 32,
["Snorlax"] = 32,
["Shiny Snorlax"] = 32,
["Chansey"] = 32,
["Blissey"] = 32,
["Togekiss"] = 32,
["Shiny Togekiss"] = 32,
["Black Togekiss"] = 32,
}

local GANHARHP = {
--[OutfitID] = {Effect}
["Roserade"] = 14,
["Shiny Roserade"] = 14,
["Vileplume"] = 14,
["Shiny Vileplume"] = 14,
["Bellossom"] = 14,
["Mothim"] = 14,
["Drapion"] = 14,
["Shiny Drapion"] = 14,
["Chansey"] = 14,
["Staryu"] = 14,
["Starmie"] = 14,
["Corsola"] = 14,
["Blissey"] = 14,
["Celebi"] = 14,
["Roselia"] = 14,
["Swablu"] = 14,
["Altaria"] = 14,
["Budew"] = 14,
["Happiny"] = 14,
["Shaymin"] = 14,
}

local function volta(cid, init)
	if getPlayerSlotItem(cid, CONST_SLOT_FEET).uid > 0 then
		local item = getPlayerSlotItem(cid, CONST_SLOT_FEET)
		
		if exhaustion.get(cid, 6666) and exhaustion.get(cid, 6666) > 0 then return true end




if getPlayerStorageValue(cid, 17000) >= 1 or getPlayerStorageValue(cid, 17001) >= 1 or getPlayerStorageValue(cid, 63215) >= 1 
or getPlayerStorageValue(cid, 75846) >= 1 then--or getPlayerStorageValue(cid, 5700) >= 1  then    --alterado v1.9 <<
   return true                                                                                                                        
end

local ballName = getItemAttribute(item.uid, "poke")
local btype = getPokeballType(item.itemid)
local usando = pokeballs[btype].use

local effect = pokeballs[btype].effect
	if not effect then
		effect = 21
	end
	
unLock(item.uid) --alterado v1.8

if item.itemid == usando then                           

	if getPlayerStorageValue(cid, 990) == 1 then -- GYM
		doPlayerSendCancel(cid, "You can't return your pokemon during gym battles.")
	return true
	end
	if #getCreatureSummons(cid) > 1 and getPlayerStorageValue(cid, 212124) <= 0 then     --alterado v1.6
       if getPlayerStorageValue(cid, 637501) == -2 or getPlayerStorageValue(cid, 637501) >= 1 then  
          BackTeam(cid)       
       end
    end   
    if #getCreatureSummons(cid) == 2 and getPlayerStorageValue(cid, 212124) >= 1 then
       doPlayerSendCancel(cid, "You can't do that while is controling a mind")
       return true     --alterado v1.5
    end
    if #getCreatureSummons(cid) <= 0 then
		if isInArray(pokeballs[btype].all, item.itemid) then
			doTransformItem(item.uid, pokeballs[btype].off)
			doItemSetAttribute(item.uid, "hp", 0)
			doItemSetAttribute(item.uid, "moveBallT", "fainted")
			doPlayerSendCancel(cid, "This pokemon is fainted.")
		    return true
		end
	end

    local cd = getCD(item.uid, "blink", 30)
    if cd > 0 then
       setCD(item.uid, "blink", 0)
    end
    
--[[	if getItemAttribute(item.uid, "poke"):find("Mega") then
    local normalPoke = megaEvolutions[getItemAttribute(item.uid, "megaStone")][1]
    if normalPoke then
        doItemSetAttribute(item.uid, "poke", normalPoke)
    end
end]]
	
	local z = getCreatureSummons(cid)[1]

	if getCreatureCondition(z, CONDITION_INVISIBLE) and not isGhostPokemon(z) then
	   return true
	end
	doReturnPokemon(cid, z, item, effect)
		end
		
        if init then
            if item.itemid == pokeballs[btype].on then

	if item.uid ~= getPlayerSlotItem(cid, CONST_SLOT_FEET).uid then
		doPlayerSendCancel(cid, "You must put your pokeball in the correct place!")
		doItemSetAttribute(item.uid, "moveBallT", "fainted")
	return TRUE
	end

	local thishp = getItemAttribute(item.uid, "hp")

	if thishp <= 0 then
		if isInArray(pokeballs[btype].all, item.itemid) then
			doTransformItem(item.uid, pokeballs[btype].off)
			doItemSetAttribute(item.uid, "hp", 0)
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
   local balls = getPokeballsInContainer(getPlayerSlotItem(cid, 3).uid)
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
	local boost = getItemAttribute(item.uid, "boost") or 0

	if getPlayerLevel(cid) < (x.level+boost) then
	   doPlayerSendCancel(cid, "You need level "..(x.level+boost).." to use this pokemon.")
	   return true
	end
	
	---------------------------- Sistema pokes de clan --------------------------------------
	local shinysClan = {
	["Shiny Fearow"] = {4, "Wingeon"},
	["Shiny Flareon"] = {1, "Volcanic"},
	["Shiny Vaporeon"] = {2, "Seavel"}, 
	["Shiny Jolteon"] = {9, "Raibolt"},
	["Shiny Hypno"] = {7, "Psycraft"},           
	["Shiny Golem"] = {3, "Orebound"},
	["Shiny Vileplume"] = {8, "Naturia"},
	["Shiny Nidoking"] = {5, "Malefic"},
	["Shiny Hitmontop"] = {6, "Gardestrike"},   --alterado v1.4
	}
	
	if shinysClan[pokemon] and (getPlayerGroupId(cid) < 4 or getPlayerGroupId(cid) > 6) then  --alterado v1.9 \/
	   if getPlayerClanNum(cid) ~= shinysClan[pokemon][1] then
	      doPlayerSendCancel(cid, "You need be a member of the clan "..shinysClan[pokemon][2].." to use this pokemon!")
	      return true   
       elseif getPlayerClanRank(cid) ~= 5 then
          doPlayerSendCancel(cid, "You need be atleast rank 5 to use this pokemon!")
	      return true
       end
    end
    --------------------------------------------------------------------------------------

	doSummonMonster(cid, pokemon)

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

	---if getCreatureName(pk) == "Ditto" or getCreatureName(pk) == "Shiny Ditto" then --edited

	--	local left = getItemAttribute(item.uid, "transLeft")
	--	local name = getItemAttribute(item.uid, "transName")

	--	if left and left > 0 then
	--		setPlayerStorageValue(pk, 1010, name)
		--	doSetCreatureOutfit(pk, {lookType = getItemAttribute(item.uid, "transOutfit")}, -1)
		--	addEvent(deTransform, left * 1000, pk, getItemAttribute(item.uid, "transTurn"))
		--	doItemSetAttribute(item.uid, "transBegin", os.clock())
	--	else
	--		setPlayerStorageValue(pk, 1010, getCreatureName(pk) == "Ditto" and "Ditto" or "Shiny Ditto")     --edited
	--	end
--	end

	if isGhostPokemon(pk) then doTeleportThing(pk, getPosByDir(getThingPos(cid), math.random(0, 7)), false) end

	doCreatureSetLookDir(pk, 2)

	adjustStatus(pk, item.uid, true, true, true)
	doRegenerateWithY(getCreatureMaster(pk), pk)
	doCureWithY(getCreatureMaster(pk), pk)

	--doTransformItem(item.uid, item.itemid+1)
	doTransformItem(item.uid, pokeballs[btype].use)
	
	doItemSetAttribute(item.uid, "moveBallT", "use")

	local pokename = getPokeName(pk) --alterado v1.7 

	local mgo = gobackmsgs[math.random(1, #gobackmsgs)].go:gsub("doka", pokename)
	doCreatureSay(cid, mgo, TALKTYPE_MONSTER)
    
	doSendMagicEffect(getCreaturePosition(pk), effect)
	
	if useOTClient then
	   doPlayerSendCancel(cid, '12//,show') --alterado v1.7
    end

if useKpdoDlls then
		doUpdateMoves(cid)
	end
		end
    end
	end

return true
end





function onSay(cid, words, param, channel)
	if exhaustion.check(cid, 23589) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, 23589)/60 .. " minutos para usar novamente.")
		return true
	end
	if getPlayerSlotItem(cid, CONST_SLOT_FEET).uid > 0 then
	--print(tonumber(param))
		if getItemAttribute(getPlayerSlotItem(cid, CONST_SLOT_FEET).uid, "orderball") == tonumber(param) then
            volta(cid, true)
    		return true
		else
			volta(cid, false)
		end
	--else
	 --  return true
	end
	--print(tonumber(param))
	doMoveBar(cid, tonumber(param))
    volta(cid, true)
	exhaustion.set(cid, 23589, 5)
	return true
end