
local poke = {"Shiny Xatu", "Jynx", "Shiny Jynx", "Xatu", "Natu", "Exeggutor", "Slowking", "Slowbro", "Shiny Mr. Mime", 'Mew', 'Mewtwo', 'Abra', 'Kadabra', 'Alakazam', 'Drowzee', 'Hypno', 'Mr. Mime', 'Porygon', 'Shiny Abra', 'Shiny Alakazam', 
'Shiny Hypno', 'Porygon2'}  --alterado v1.9

local etele = 9499
local cdtele = 60

local config = {
premium = true, -- se precisa ser premium account (true or false)
battle = false	-- se precisa estar sem battle (true). Se colocar false, poderá usar teleport no meio de batalhas
}

local places = {
    [1] = {name = "Saffron", id = 1, sto = 897530},
    [2] = {name = "Cerulean", id = 2, sto = 897531},
    [3] = {name = "Vermilion", id = 3, sto = 897532},
    [4] = {name = "Pewter", id = 4, sto = 897533},
    [5] = {name = "Lavender", id = 5, sto = 897534},
    [6] = {name = "Fuchsia", id = 6, sto = 897535},
    [7] = {name = "Celadon", id = 7, sto = 897536},
    [8] = {name = "Cinnabar", id = 9, sto = 897537},
    -- [9] = {name = "Snow", id = 14, sto = 897538},
    [9] = {name = "Outland1", id = 10, sto = 897539},
    [10] = {name = "Outland2", id = 11, sto = 897540},
    [11] = {name = "Outland3", id = 12, sto = 897541},
    [12] = {name = "Pallet", id = 21, sto = 897542},
}

function onSay(cid, words, param)

	if #getCreatureSummons(cid) == 0 then
		doPlayerSendCancel(cid, "You need a pokemon to use teleport.")
		return true
	end

	if not isInArray(poke, getCreatureName(getCreatureSummons(cid)[1])) then
		return 0
	end
	
    if getPlayerStorageValue(cid, 22545) == 1 then      --golden arena
       doPlayerSendCancel(cid, "You can't do that while the golden arena!")
   	 return true
    end
    
    if getPlayerStorageValue(cid, 212124) >= 1 then         --alterado v2.6
       return doPlayerSendCancel(cid, "You can't do it with a pokemon with mind controlled!")
    end

    --[[if getPlayerStorageValue(cid, 52480) >= 1 then
       return doPlayerSendCancel(cid, "You can't do it while a duel!")  --alterado v2.6
    end]]
    
	if exhaustion.get(cid, etele) and exhaustion.get(cid, etele) > 0 then
		local tempo = tonumber(exhaustion.get(cid, etele)) or 0
		local min = math.floor(tempo)
		doPlayerSendCancel(cid, "Your pokemon is tired, wait "..getStringmytempo(tempo).." to teleport again.")
		return true
	end
	
	local ball = getPlayerSlotItem(cid, 8) 
	if #getCreatureSummons(cid) >= 1 and ball and getItemAttribute(ball.uid, "heldy") and getItemAttribute(ball.uid, "heldy") >= 22 and getItemAttribute(ball.uid, "heldy") <= 28 then
        --return true
    	local TiersTele = {
			[22] = {bonus = Tele1},
			[23] = {bonus = Tele2}, 
			[24] = {bonus = Tele3},
			[25] = {bonus = Tele4},
			[26] = {bonus = Tele5},
			[27] = {bonus = Tele6},
			[28] = {bonus = Tele7},
	    }
		cdtele = math.floor(cdtele-TiersTele[getItemAttribute(ball.uid, "heldy")].bonus)
    end

	if config.premium and not isPremium(cid) then
		doPlayerSendCancel(cid, "Only premium members are allowed to use teleport.")
		return true
	end

	if config.battle and getCreatureCondition(cid, CONDITION_INFIGHT) then
		doPlayerSendCancel(cid, "Your pokemon can't concentrate during battles.")
		return true
	end

	if (param == '') then
		local str = ""
		str = str .. "Places to go :\n\nHouse\n"
		for a = 1, #places do
			str = str..""..places[a].name.."\n"
		end
		doShowTextDialog(cid, 7416, str)
		return true
	end

	local item = getPlayerSlotItem(cid, 8)
	local nome = getPokeballName(item.uid)
	local summon = getCreatureSummons(cid)[1]
	local lastppos = getThingPos(cid)
	local lastspos = getThingPos(summon)
	local telepos = {}
	local myplace = ""
	local townid = 0

	if string.lower(param) == "house" then

		if not getHouseByPlayerGUID(getPlayerGUID(cid)) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You don't own a house.")
			return true
		end

		telepos = getHouseEntry(getHouseByPlayerGUID(getPlayerGUID(cid)))
		myplace = "our home"
	else
		for x = 1, #places do
			if string.find(string.lower(places[x].name), string.lower(param)) then
				townid = places[x].id
				myplace = places[x].name
			end
		end

		if myplace == "" then
			doPlayerSendCancel(cid, "That place doesn't exist.")
		return true
		end
	end

	if getPlayerStorageValue(cid, 123124) >= 1 then
		setPlayerStorageValue(cid, 123124, -1)
	end

	if getPlayerStorageValue(cid, 2154600) >= 1 then
		setPlayerStorageValue(cid, 2154600, -1)	
		setPlayerStorageValue(cid, 2154601, -1)	
		setPlayerStorageValue(cid, 1654987, -1)	
		setPlayerStorageValue(cid, 468703, 15 * 60 + os.time())	
		return true
	end

	if myplace ~= "" and townid > 0 then
		telepos = getTownTemplePosition(townid)
	end

	if getDistanceBetween(getThingPos(cid), telepos) <= 15 then
		doPlayerSendCancel(cid, "You are too near to the place you want to go!")
		return true
	end

	doSendMagicEffect(getThingPos(summon), 29)
	doSendMagicEffect(getThingPos(cid), 29)

	doTeleportThing(cid, telepos, false)

	local pos2 = getClosestFreeTile(cid, getPosByDir(getThingPos(cid), SOUTH))

	doTeleportThing(summon, pos2, false)
	doRegainSpeed(cid) 
	doSendMagicEffect(getThingPos(cid), 29)

	doCreatureSay(cid, ""..nome..", teleport to "..myplace.."!", 1)
	doCreatureSay(cid, ""..nome..", teleport to "..myplace.."!", 1, false, 0, lastppos)
	doCreatureSay(summon, "TELEPORT!", TALKTYPE_MONSTER)
	doCreatureSay(summon, "TELEPORT!", TALKTYPE_MONSTER, false, 0, lastspos)

	doCreatureSetLookDir(cid, SOUTH)
	doCreatureSetLookDir(summon, SOUTH)

	doSendMagicEffect(getThingPos(summon), CONST_ME_TELEPORT)
	
	if getPlayerStorageValue(cid, 84929) >= 1 then--torneio viktor
       setPlayerStorageValue(cid, 84929, -1)
    end
	
	exhaustion.set(cid, etele, cdtele)

	return true
end