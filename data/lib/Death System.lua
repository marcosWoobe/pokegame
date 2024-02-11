local effect = 169                                   --by brun123    --alterado v1.9 \/
local stoneEffect = {
    [11453] = 1027,--Heart Stone
    [11441] = 1015,--Leaf Stone
    [11442] = 1018,--Water Stone
    [11443] = 1021, --Venom Stone
    [11444] = 1017,--Thunder Stone
    [11445] = 1023,--Rock Stone
    [11446] = 1022,--Punch Stone
    [11447] = 1016,--Fire Stone
    [11448] = 1028,--Cocoon Stone
    [11449] = 1026,--Crystal Stone
    [11450] = 1024,--Darkness Stone
    [11451] = 1022,--Earth Stone
    [11452] = 1025,--Enigma Stone
    [11454] = 1020,--Ice Stone
    [12244] = 282,--Ancient Stone
    [12232] = 281,--Metal Stone
    [19694] = 284
}

local function playerAddExp(cid, exp)
    if not isPlayer(cid) then
	    return
	end

    local doublexp = 2
	if getPlayerStorageValue(cid, 45144) - os.time() > 1 then
		doublexp = (doublexp-1)+((100 + getPlayerStorageValue(cid, 45145))/100)
	end
	-- print(doublexp)

    local vipexp = 1
    if isPremium(cid) then
        vipexp = 1.1 -- 10% a mais | 1.2 = 20%
    end

    local Tiers = {
        [71] = {bonus = Exp1},
        [72] = {bonus = Exp2},
        [73] = {bonus = Exp3},
        [74] = {bonus = Exp4},
        [75] = {bonus = Exp5},
        [76] = {bonus = Exp6},
        [77] = {bonus = Exp7},
    }
    local ball = getPlayerSlotItem(cid, 8)
	if ball then
        local Tier = getItemAttribute(ball.uid, "heldx")
        if Tier and Tier > 70 and Tier < 78 then
        	-- print(Tiers[Tier].bonus)
            doPlayerAddExp(cid, math.floor((((exp * Tiers[Tier].bonus) * vipexp)) * doublexp))
	        doSendAnimatedText(getThingPos(cid), math.floor((((exp * Tiers[Tier].bonus) * vipexp) * doublexp)), 215)
            sendMsgToPlayer(cid, MESSAGE_EVENT_DEFAULT, "Voc� ganhou "..math.floor((((exp * Tiers[Tier].bonus) * vipexp) * doublexp)).." Pontos de Experi�ncia.")
		else
            doPlayerAddExp(cid, math.floor(((exp * vipexp)) * doublexp))
            --print(math.floor((exp * vipexp)) * doublexp)
	        doSendAnimatedText(getThingPos(cid), math.floor(((exp * vipexp) * doublexp)), 215)
			sendMsgToPlayer(cid, MESSAGE_EVENT_DEFAULT, "Voc� ganhou "..math.floor(((exp * vipexp) * doublexp)).." Pontos de Experi�ncia.")
        end
	else
	    doPlayerAddExp(cid, math.floor(((exp * vipexp)) * doublexp))
	    doSendAnimatedText(getThingPos(cid), math.floor(((exp * vipexp) * doublexp)), 215)
		sendMsgToPlayer(cid, MESSAGE_EVENT_DEFAULT, "Voc� ganhou "..math.floor(((exp * vipexp) * doublexp)).." Pontos de Experi�ncia.")
	end
end

local Exps = {
	{minL = 1, maxL = 15, multipler = 1},
	{minL = 16, maxL = 20, multipler = 1},
	{minL = 21, maxL = 25, multipler = 1},
	{minL = 26, maxL = 30, multipler = 1},
	{minL = 31, maxL = 35, multipler = 1},
	{minL = 36, maxL = 40, multipler = 1},
	{minL = 41, maxL = 45, multipler = 1},
	{minL = 46, maxL = 50, multipler = 1},
	{minL = 51, maxL = 55, multipler = 1},
	{minL = 56, maxL = 60, multipler = 1},
	{minL = 61, maxL = 75, multipler = 1},
	{minL = 76, maxL = 90, multipler = 1},
	{minL = 91, maxL = 105, multipler = 1},
	{minL = 106, maxL = 120, multipler = 1},
	{minL = 121, maxL = 135, multipler = 1},
	{minL = 136, maxL = 150, multipler = 1},
	{minL = 151, maxL = 165, multipler = 1},
	{minL = 166, maxL = 180, multipler = 1},
	{minL = 181, maxL = 195, multipler = 1},
	{minL = 196, maxL = 210, multipler = 1},
	{minL = 211, maxL = 225, multipler = 1},
	{minL = 226, maxL = 250, multipler = 1},
	{minL = 251, maxL = 300, multipler = 1},
	{minL = 301, maxL = 350, multipler = 1},
}

local function calculaExp(cid, expTotal)
    if not isPlayer(cid) then return 0 end
    local expFinal = expTotal
    local flag = false
    for _, TABLE in pairs(Exps) do
	    if getPlayerLevel(cid) >= TABLE.minL and getPlayerLevel(cid) <= TABLE.maxL then
		    flag = true
		    expFinal = expFinal * TABLE.multipler
		    break
	    end
    end
    if not flag then
	    expFinal = expFinal * 0.5
	end --lvl 400+
    return math.floor(expFinal)
end

local function doCharm(pos, name, mode)
	if pos and name then
		name = "Shiny "..name

		if not pokes[name] then
			return true
		end

		doSendMagicEffect(pos, 21)
		doCreateMonster(cid, name, pos, false)
	end
end

local function doMega(pos, name, mode)
	if pos and name then
		name = "Mega "..name

		if not pokes[name] then
			return true
		end

		doSendMagicEffect(pos, 21)
		doCreateMonster(cid, name, pos, false)
	end
end

function checkTaskByDrazyn(cid, target)
	for a, b in pairs(taskStorages) do
		if getPlayerStorageValue(cid, b) ~= -1 and getPlayerStorageValue(cid, b) ~= 1 then
			local tab = string.explode(getPlayerStorageValue(cid, b), "|")

			local count = 0
			local cont = false
			local str = {}
			local str1 = {}
			local expe = {}

			for a, b in pairs(tab) do
				if b:find(target) then
					cont = true
					count = a
				end
			end

			if cont then
				cont = true
				for i = 2, #tab do
					expe = tab[i]:explode(",")
					if (tonumber(expe[2]) - 1) > 0 then
						if i == count then
							table.insert(str, {expe[1], tonumber(expe[2])- 1})
							if (tonumber(expe[2])- 1) > 0 then
								cont = false
							end
						else
							table.insert(str, {expe[1], tonumber(expe[2])})
							cont = false
						end
					end

					if i == count then
						if (expe[2] - 1) > 0 then
							table.insert(str1, (tonumber(expe[2]) - 1) .." "..expe[1]..((tonumber(expe[2]) - 1) > 1 and "s" or ""))
						end
					else
						if (expe[2] - 1) > 0 then
							table.insert(str1, expe[2].." "..expe[1]..(tonumber(expe[2]) > 1 and "s" or ""))
						end
					end
				end

				if cont then
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, tab[1]..": Parab?ns! Voc? terminou a minha task.")
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, tab[1]..": Est? faltando voc? matar "..doConcatTable(str1, ", ", " e ")..".")
				end
				local str2 = {}
				for a, b in pairs(str) do
					table.insert(str2, table.concat(b, ",").."|")
				end

				setPlayerStorageValue(cid, b, tab[1].."|"..table.concat(str2))

			end

		end
	end
end

local function func(cid, position, corpseid, effect)
    if not isCreature(cid) then
		return true
    end
    local corpse = getTileItemById(position, corpseid).uid
    if corpse <= 1 then
		return
	end
    if not isContainer(corpse) then
		return true
	end
    for slot = 0, (getContainerSize(corpse)-1) do
        local item = getContainerItem(corpse, slot)
        if item.uid <= 1 then
			return
		end
        -- if isStone(item.itemid) then
			local posPlayerLevel = position
			local pos2 = {x=posPlayerLevel.x+1,y=posPlayerLevel.y,z=posPlayerLevel.z}
		    if stoneEffect[item.itemid] then
				addEvent(doSendMagicEffect, 500, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 1000, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 1500, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 2000, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 2500, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 3000, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 3500, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 4000, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 4500, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 5000, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 5500, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 6000, pos2, stoneEffect[item.itemid])
				addEvent(doSendMagicEffect, 6500, pos2, stoneEffect[item.itemid])
			    -- doSendMagicEffect(position, stoneEffect[item.itemid] - 1)
			else
		    	doSendMagicEffect(position, 285)
			end
			-- addEvent(doSendMagicEffect, 1000, position, 285)
            doSendMagicEffect(getThingPos(cid), effect)
        -- end
    end
end

local function timeString(timeDiff)
	local dateFormat = {
		{"dia", timeDiff / 60 / 60 / 24},
		{"hora", timeDiff / 60 / 60 % 24},
		{"minuto", timeDiff / 60 % 60},
		{"segundo", timeDiff % 60}
	}

    local out = {}
	for k, t in ipairs(dateFormat) do
        local v = math.floor(t[2])
		if(v > 0) then
            table.insert(out, (k < #dateFormat and (#out > 0 and ', ' or '') or ' e ') .. v .. ' ' .. t[1] .. (v ~= 1 and 's' or ''))
        end
    end

    local ret = table.concat(out)
	if ret:len() < 16 and ret:find("segundo") then
        local a, b = ret:find(" e ")
        ret = ret:sub(b+1)
    end
return ret
end

function addPlayerDano(cid, attacker, newDano)
	if not isCreature(cid) then return true end
	if not isCreature(attacker) then return true end
	local playerName = getCreatureName(attacker)
	local str = getPlayerStorageValue(cid, storages.damageKillExp)
	if str == -1 then
		setPlayerStorageValue(cid, storages.damageKillExp, playerName .. "/" .. newDano .. "|")
		return true
	end
	local players = string.explode(str, "|")
	-- print("players: "..#players)
	local strEnd, imAre = "", false
	if players ~= nil then
		for i = 1, #players do
			local name = string.explode(players[i], "/")[1]
			local dano = string.explode(players[i], "/")[2]

			if name == playerName then
				strEnd = strEnd .. name .. "/" .. dano + newDano .. "|"
				imAre = true
			else
				strEnd = strEnd .. name .. "/" .. dano .. "|"
			end

		end
		if not imAre then
			strEnd = strEnd .. playerName .. "/" .. newDano .. "|"
		end
		setPlayerStorageValue(cid, storages.damageKillExp, strEnd)
	end
end

function getExpByMoreDano(cid)
	if not isCreature(cid) then return "" end
	local listPlayers = ""
	local life = getCreatureMaxHealth(cid)
	local str = getPlayerStorageValue(cid, storages.damageKillExp)
	if str == -1 then return true end -- self destruct
	--if isNpc(cid) then return true end -- npc
	local players = string.explode(str, "|")

	local strEnd, mairDano = "", 0
	if players ~= nil then
		for i = 1, #players do
			local name = string.explode(players[i], "/")[1]
			local dano = string.explode(players[i], "/")[2]
			listPlayers = listPlayers .. name .. "/" .. (dano * 100 / life) .. "|"
			-- print("listPlayers: "..listPlayers)
			-- print("dano: "..dano)
			-- print("life: "..life)
			-- print("name: "..name)
		end
	end
	return listPlayers
end

rareItems = {15070, 15071, 15072, 15073, 15074, 15075, 15076, 15077, 15078, 15079, 12151, 12149, 12150}

function isRare(itemid)
	return isInArray(rareItems, itemid)
end

function isToken(id)
    if id == 15644 or id == 15645 or id == 15646 then
        return true
    end
    return false
end

function isFrag(id)
    if id >= 19223 and id <= 19234 then
        return true
    end
    return false
end

function doSendLootChannel(cid, itemid, poke)
	if isStone(itemid) or isFrag(itemid) or isRare(itemid) then
		for _, oid in ipairs(getPlayersOnline()) do
			doPlayerSendChannelMessage(oid, "Loot System", "O jogador [".. getCreatureName(cid) .."] matou um "..poke.." e dropou um ".. getItemNameById(itemid) ..".", TALKTYPE_CHANNEL_W, 12)
		end
	end
end

local function doCorpseAddLoot(name, item, cid, target, corpse2) -- essa func j?? vai ajudar em um held, luck.

	if cid == target then
		doItemSetAttribute(item, "corpseowner", "as?dlkas?ldka?slkd?askd?aslkd?lsakd?kasl?")
		return true
	end

	local lootList = getMonsterLootList(name)
	local isStoneDroped = false
	name = doCorrectString(name)
	local pokeName = name
	local megaID, megaName = "", ""
	local lootListNow = {}
	local oldLootList = {}
	local oldChance = 0
	local stringLucky = ""
	local id, count, chance = 0,0,0
	local percent = 0
	local str, vir = string.format("Loot from %s: ", name), 0

	-- if isMega(target) then
	-- 	if name == "Charizard" then
	-- 		megaID = getPlayerStorageValue(target, storages.isMegaID)
	-- 	end
	-- 	megaName = "Mega " .. name .. (megaID ~= "" and " " .. megaID or "")
	-- 	str = "Loot from " .. megaName .. ": "
	-- 	pokeName = megaName
	-- 	local t = {id = megasConf[megaName].itemToDrop, count = 1, chance = 32} -- 32 oficial, 50 durante o beta. 50 = 10% ((chance*2)/10)
	-- 	table.insert(lootList, t)
	-- end

	local extraItems, luckyItems, NormalItems = {}, {}, {}

	for a, loot in pairs(lootList) do

		local Tier = getItemAttribute(getPlayerSlotItem(getCreatureMaster(cid), 8).uid, "heldx")
		local TiersLucky = {
			[124] = {bonus = 5},
			[125] = {bonus = 10},
			[126] = {bonus = 15},
			[127] = {bonus = 20},
			[128] = {bonus = 25},
			[129] = {bonus = 30},
			[130] = {bonus = 35},
		}

		itemid = loot.id
		Itemchance = loot.chance * 2

		if isStone(itemid) then
			Itemchance = Itemchance * rateStone
		-- elseif isFrag(itemid) then
			-- Itemchance = Itemchance * rateFrag
		else
			Itemchance = Itemchance * rateLoot
		end

		local chanceVipItem = 0

		if isPremium(cid) then
			chanceVipItem = chanceVipItem + 10
		end

		if getPlayerStorageValue(cid, 45344) - os.time() > 1 then
			chanceVipItem = chanceVipItem + ((tonumber(getPlayerStorageValue(cid, 45345)) / 100) * 100)
		end

		if math.random(1, 100) <= chanceVipItem then
			if chanceVipItem >= math.random(1, 1000) then
				lootCount = math.random(1, loot.count)

				if isStone(itemid) then
					isStoneDroped = true

					local corpse = getMonsterInfo(getCreatureName(target)).lookCorpse
					addEvent(func, 5, getCreatureSummons(cid)[1], getThingPos(target), corpse, effect)

					doSendLootChannel(cid, itemid, name)
				end

				if item then
					doAddContainerItem(item, itemid, lootCount)
				end

				local lootStringCount = ""

				if (lootCount > 1) then
					lootStringCount = string.format(" (%s)",lootCount)
				end

				table.insert(extraItems, string.format("%s%s", getItemNameById(itemid), lootStringCount))
			end
		end

		if Tier and Tier >= 124 and Tier <= 130 then
			local chance = TiersLucky[Tier].bonus
			if math.random(1, 100) <= chance then
				if Itemchance >= math.random(1, 1000) then
				lootCount = math.random(1, loot.count)

					if isStone(itemid) then
						isStoneDroped = true

						local corpse = getMonsterInfo(getCreatureName(target)).lookCorpse
						addEvent(func, 5, getCreatureSummons(cid)[1], getThingPos(target), corpse, effect)

						doSendLootChannel(cid, itemid, name)
					-- elseif isToken(itemid) then
					-- 	local posCorpse = getThingPos(item)
					-- 	posCorpse.x = posCorpse.x +1
					-- 	doSendMagicEffect(posCorpse, 963) -- token effect
					-- 	posCorpse.y = posCorpse.y +1
					-- 	addEvent(doSendMagicEffect, 2000, posCorpse, 285)
					-- 	doSendLootChannel(cid, itemid, name)
					-- elseif isFrag(itemid) then
					-- 	local posCorpse = getThingPos(item)
					-- 	posCorpse.x = posCorpse.x +1
					-- 	doSendMagicEffect(posCorpse, 964) -- frag effect
					-- 	posCorpse.y = posCorpse.y +1
					-- 	addEvent(doSendMagicEffect, 2000, posCorpse, 285)
					-- 	doSendLootChannel(cid, itemid, name)
					-- elseif isRare(itemid) then
					-- 	local posCorpse = getThingPos(item)
					-- 	posCorpse.x = posCorpse.x +1
					-- 	doSendMagicEffect(posCorpse, stoneEffect[getItemNameById(itemid):lower()])
					-- 	posCorpse.y = posCorpse.y +1
					-- 	addEvent(doSendMagicEffect, 2000, posCorpse, 285)
					-- 	doSendLootChannel(cid, itemid, name)
					end

					if item then
						doAddContainerItem(item, itemid, lootCount)
					end

					local lootStringCount = ""

					if (lootCount > 1) then
						lootStringCount = string.format(" (%s)",lootCount)
					end

					table.insert(luckyItems, string.format("%s%s", getItemNameById(itemid), lootStringCount))
				end
			end
		end

		if Itemchance >= math.random(1, 1000) then
			lootCount = math.random(1, loot.count)
			if isStone(itemid) then
				isStoneDroped = true

				local corpse = getMonsterInfo(getCreatureName(target)).lookCorpse
				addEvent(func, 5, getCreatureSummons(cid)[1], getThingPos(target), corpse, effect)

				doSendLootChannel(cid, itemid, name)
			-- elseif isToken(itemid) then
			-- 	local posCorpse = getThingPos(item)
			-- 	posCorpse.x = posCorpse.x +1
			-- 	posCorpse.y = posCorpse.y +1
			-- 	doSendMagicEffect(posCorpse, 963) -- token effect
			-- 	addEvent(doSendMagicEffect, 2000, posCorpse, 285)
			-- 	doSendLootChannel(cid, itemid, name)
			-- elseif isFrag(itemid) then
			-- 	local posCorpse = getThingPos(item)
			-- 	posCorpse.x = posCorpse.x +1
			-- 	doSendMagicEffect(posCorpse, 964) -- frag effect
			-- 	posCorpse.y = posCorpse.y +1
			-- 	addEvent(doSendMagicEffect, 2000, posCorpse, 285)
			-- 	doSendLootChannel(cid, itemid, name)
			-- elseif isRare(itemid) then
			-- 	local posCorpse = getThingPos(item)
			-- 	posCorpse.x = posCorpse.x +1
			-- 	doSendMagicEffect(posCorpse, stoneEffect[getItemNameById(itemid):lower()])
			-- 	posCorpse.y = posCorpse.y +1
			-- 	addEvent(doSendMagicEffect, 2000, posCorpse, 285)
			-- 	doSendLootChannel(cid, itemid, name)
			end

			if item then
				doAddContainerItem(item, itemid, lootCount)
			end

			-- if math.random(1, 1000) <= 2 then
			if math.random(1, 1000) <= 4 then -- evento
				lootCount = 1
				doSendLootChannel(cid, 6569, name)
				if item then
					doAddContainerItem(item, 6569, lootCount)
				end
				addEvent(func, 5, getCreatureSummons(cid)[1], getThingPos(target), corpse, effect)
				table.insert(NormalItems, getItemNameById(6569)..string.format(" (%s)", lootCount))
			end

			if math.random(1, 100) <= 3 then
				lootCount = math.random(1, 5)
				-- doSendLootChannel(cid, 25206, name)
				if item then
					doAddContainerItem(item, 25206, lootCount)
				end
				-- addEvent(func, 5, getCreatureSummons(cid)[1], getThingPos(target), corpse, effect)
				table.insert(NormalItems, getItemNameById(25206)..string.format(" (%s)", lootCount))
			end	

			local lootStringCount = ""

			if (lootCount > 1) then
				lootStringCount = string.format(" (%s)", lootCount)
			end

			table.insert(NormalItems, getItemNameById(itemid)..lootStringCount)
		end
	end

	if #NormalItems == 0 and #luckyItems == 0 and #extraItems == 0 then
		str = str .. "Nothing."
	else
		if #NormalItems > 0 then
			str = str.. doConcatTable(NormalItems, ", ", " and ")..". "
		end

		if #luckyItems > 0 then
			str = str.. "\nLucky Items: "..doConcatTable(luckyItems, ", ", " and ").."."
		end

		if #extraItems > 0 then
			str = str.. "\nExtra Items: "..doConcatTable(extraItems, ", ", " and ").."."
		end
	end

	-- if getExpByMoreDano(target) == true then
	-- 	return true
	-- end

	local players = string.explode(getExpByMoreDano(target), "|")
	local maiorPercent = 0
	local playerWinner = ""

	if players ~= nil then
        local givenexp = getWildPokemonExp(target)
        local expTotal = 0
        if givenexp > 0 then
            local pk = target
            if isCreature(pk) then
                expTotal = math.floor(playerExperienceRate * givenexp)
                expTotal = calculaExp(cid, expTotal)
                expTotal = math.floor(expTotal)
                for i = 1, #players do
                    local namePlayer = string.explode(players[i], "/")[1] or ""
                    local percent = tonumber(string.explode(players[i], "/")[2]) or ""
                    if percent > maiorPercent then
                        playerWinner = namePlayer
                        maiorPercent = percent
                    end
                    if #players == 1 then
                        percent = 100
                    end
                    local player = getPlayerByName(namePlayer)
                    expMixx = math.ceil(percent * (expTotal) / 100)
                    playerAddExp(player, expTotal)
                end
            end
        end
	end

	local pWinnerLoot = getPlayerByName(playerWinner)
	if isCreature(pWinnerLoot) then
		--checkDirias(pWinnerLoot, pokeName)


		doItemSetAttribute(corpse2, "poke", getCreatureName(target))
		doItemSetAttribute(corpse2, "corpseowner", playerWinner)
		doItemSetAttribute(corpse2, "aid", 43242)

		local loot = str .. (str == "Loot from ".. name .. ": " and "Nothing." or "")
		doPlayerSendTextMessage(pWinnerLoot, MESSAGE_INFO_DESCR, loot)
		if isStoneDroped then
			doSendMagicEffect(getThingPos(pWinnerLoot), 173, pWinnerLoot)
		end
	end
end

local function checkDirias(cid, nameDeath)

	local master = (isSummon(cid) and getCreatureMaster(cid) or isNpc(cid) and getNpcMaster(cid)) or cid
	local pokeTask1 = tostring(getPlayerStorageValue(master, 24001))
	local pokecount = tonumber(getPlayerStorageValue(master, 24003) <= 0 and 1 or getPlayerStorageValue(master, 24003))

	if pokeTask1 ~= -1 and pokeTask1 == nameDeath then
		setPlayerStorageValue(master, 24003, pokecount+1)
		if pokecount >= getKillCount(master) then
			doPlayerSendTextMessage(master, 20, "[Daily Kill]: Voc? concluiu minha task, venha pegar sua recompensa.")
			setKillCatched(master, true)
		else
			doPlayerSendTextMessage(master, 20, "[Daily Kill]: Faltam " .. getKillCount(master) - pokecount.. " " .. nameDeath .. (pokecount > 1 and "s" or "") .. ".")
		end
	end

end

function doKillPlayerPokemon(cid)
	local deathtexts = {"Oh no! POKENAME, come back!", "Come back, POKENAME!", "That's enough, POKENAME!", "You did well, POKENAME!", "You need to rest, POKENAME!", "Nice job, POKENAME!", "POKENAME, you are too hurt!"}
	local master = getCreatureMaster(cid)
	local thisball = getPlayerSlotItem(master, 8)
	local ballName = getItemAttribute(thisball.uid, "poke")

	if isShredTEAM(cid) then -- sherdder team
		doRemoveCreature(cid)
		return true
	end

	if not isCreature(cid) or not isCreature(master) then return true end

	if isInArray({"Castform Water", "Castform Ice", "Castform Fire"}, ballName) then
		doSetItemAttribute(thisball.uid, "poke", "Castform")
		return true
	end

	if #getCreatureSummons(master) > 1 then
		BackTeam(master, getCreatureSummons(master))
	end

	if getPlayerStorageValue(master, 55006) >= 1 then
		doRemoveCountPokemon(master)
	end

	local btypeMsa = getPokeballType(thisball.itemid)

    if btypeMsa == "none" then 
    	btypeMsa = getPokeballTypeOld(thisball.itemid)
    end

	doSendMagicEffect(getThingPos(cid), pokeballs[btypeMsa].effect) -- rever isso aqui
	doTransformItem(thisball.uid, pokeballs[btypeMsa].off)
	doItemSetAttribute(thisball.uid, "moveBallT", "fainted")
	doItemSetAttribute(thisball.uid, "hp", 0)
	doUpdatePokemonsBar(master)

	local say = deathtexts[math.random(#deathtexts)]
	say = string.gsub(say, "POKENAME", getCreatureName(cid))
	doCreatureSay(master, say, TALKTYPE_ORANGE_1)

	doItemSetAttribute(thisball.uid, "hpToDraw", 0)

	doUpdateMoves(master)
    doSendPlayerExtendedOpcode(master, 111, "sair")
	doSendPlayerExtendedOpcode(master, 82, "h")
end

function doKillWildPoke(cid, target)
	if isSummon(target) and isPlayer(getCreatureMaster(target)) then
		doSendPlayerExtendedOpcode(getCreatureMaster(target), 95, '12//,hide')
		doUpdateMoves(getCreatureMaster(target))
		doKillPlayerPokemon(target)
		doSendPlayerExtendedOpcode(getCreatureMaster(target), opcodes.OPCODE_POKEMON_HEALTH, "0|0")
		doRemoveCreature(target)

	elseif isWild(target) then

	local Pokeboss = {
		["Milotic"] = {storage = 27201},
		["Magmortar"] = {storage = 27202},
		["Electivire"] = {storage = 27203},
		["Dusknoir"] = {storage = 27204},
		["Milotic"] = {storage = 27205},
		["Rhyperior"] = {storage = 27206},
		["Metagross"] = {storage = 27207},
		["Salamence"] = {storage = 27208},
		["Slaking"] = {storage = 27209},
		["Tangrowth"] = {storage = 27210}
	}

		if getPlayerStorageValue(target, 637500) >= 1 then -- sherdder team
			doRemoveCreature(target)
			return true
		end

		local nameDeath = doCorrectString(getCreatureName(target))
		local pos = getThingPos(target)
		local corpseID = getPokemonCorpse(nameDeath)
		-- local bossName = Pokeboss[nameDeath]
		local posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+5 posC1.y = posC1.y PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1
		if not isWalkable(posC1) then
			posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+1 posC1.y = posC1.y PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1
		else
			posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+5 posC1.y = posC1.y PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1
		end

		if corpseID ~= 0 then
			local corpse = doCreateItem(corpseID, 1, pos)
			if isNpc(getCreatureMaster(target)) then
				doRemoveItem(corpse, 1)
				corpse = nil
			end

			if isSummon(cid) or isNpc(cid) then
				checkDirias(cid, nameDeath)
			end

			-- if isSummon(cid) then
			-- 	if isWild(target) and bossName then
			-- 		local contagem = getPlayerStorageValue(getCreatureMaster(cid), bossName.storage) <= 0 and 1 or getPlayerStorageValue(getCreatureMaster(cid), bossName.storage)
			-- 		setPlayerStorageValue(getCreatureMaster(cid), bossName.storage, contagem + 1)
			-- 		doPlayerSendTextMessage(getCreatureMaster(cid), 20, "Voc? j? matou no total ["..contagem.."] "..getCreatureName(target)..".")
			-- 	end
			-- end

			-- if getPlayerInGolden(getCreatureMaster(cid)) then
			-- 	local goldenpoints = math.random(100)
			-- 	addSurvivalPoints(getCreatureMaster(cid), goldenpoints)
			-- 	doPlayerSendTextMessage(getCreatureMaster(cid), 20, "Voc? ganhou "..goldenpoints.." Survival Points ap?s derrotar o "..getCreatureName(target)..".")
			-- end

			if getPlayerStorageValue(getCreatureMaster(cid), 2154600) >= 1 then
				if getPlayerStorageValue(getCreatureMaster(cid), 43144) - os.time() > 0 then
					doAddExpClan(getCreatureMaster(cid), 2, math.random(1000))
				else
					doAddExpClan(getCreatureMaster(cid), 1, math.random(1000))
				end
			end

			if isNpc(cid) then
				if getPlayerStorageValue(getNpcMaster(cid), 2154600) >= 1 then
					if getPlayerStorageValue(getNpcMaster(cid), 43144) - os.time() > 0 then
						doAddExpClan(getNpcMaster(cid), 2, math.random(1000))
					else
						doAddExpClan(getNpcMaster(cid), 1, math.random(1000))
					end
				end
			end

			if isNpc(cid) then
				doKillBossTower(getNpcMaster(cid), target)
			else
				doKillBossTower(getCreatureMaster(cid), target)
			end

			local function doShiny(pos, name, mode)
				if pos and name then
					name = "Shiny "..name

					if not pokes[name] then
						return true
					end

					doSendMagicEffect(pos, 21)
					doCreateMonsterNick(cid, name, retireShinyName(name), pos, false)
				end
			end

			if isPokeTower(target) then
				if isNpc(cid) then
					doMsgKillTower(getNpcMaster(cid))
				else
					doMsgKillTower(getCreatureMaster(cid))
				end
			end

			-- doQuestMonster(target) -- MPV Quests
			-- setContractFinish(target, getCreatureMaster(cid)) -- Brotherhood

			-- // Daily Kill // --
		    if hasTaskStarted(getCreatureMaster(cid)) then
				if (getCreatureName(target):lower() == getStartedTask(getCreatureMaster(cid)):lower()) then
					if (getCurrentTaskKills(getCreatureMaster(cid)) < getTaskKillsById(getStartedTaskId(getCreatureMaster(cid)))) then
						addTaskKill(getCreatureMaster(cid), 1)
					else
						doPlayerSendTextMessage(getCreatureMaster(cid), MESSAGE_STATUS_CONSOLE_BLUE, "[Ca?a Pok?mon]: "..getStartedTask(getCreatureMaster(cid))..", Tarefa completa venha receber sua recompensa..")
					-- return true
					end

					doPlayerSendTextMessage(getCreatureMaster(cid), MESSAGE_STATUS_CONSOLE_BLUE, "[Ca?a Pok?mon]: "..getCurrentTaskKills(getCreatureMaster(cid)).." de "..getTaskKillsById(getStartedTaskId(getCreatureMaster(cid))).." "..getStartedTask(getCreatureMaster(cid)).."s.")
					doPlayerSendTextMessage(getCreatureMaster(cid), MESSAGE_STATUS_CONSOLE_BLUE, "[Tempo de Ca?a]: Voc? tem "..timeString(getTaskRemainingTime(getCreatureMaster(cid))).." para concluir esta tarefa.")
				end
			end
			-- // Daily Kill // --

			-- // Daily Kill // --
			if isNpc(cid) then
				checkTaskByDrazyn(getNpcMaster(cid), nameDeath)
			else
				checkTaskByDrazyn(getCreatureMaster(cid), nameDeath)
			end
			-- // Daily Kill // --

			-- // Charm System // --

	      	local charmchance = 60 -- 3%
	      	local charmchance2 = 15
	      	local charmchance3 = 10
			local posC1 = pos

			if isNpc(cid) and not isSummon(target) and not getCreatureName(target):find("Shiny ") and isShinyCharm(getCreatureName(target)) then
				if getPlayerStorageValue(getNpcMaster(cid), 4125) - os.time() > 0 then
					if math.random(1, 2000) <= charmchance or isGod(getNpcMaster(cid)) then
						addEvent(doCharm, 5 * 1000, posC1, nameDeath)
						doPlayerSendTextMessage(getNpcMaster(cid), 20, "[Shiny Charm]: Ira nascer em 5 segundos um Shiny "..getCreatureName(target)..".")
					end
				end
			end

			if isWild(target) and not getCreatureName(target):find("Shiny ") and isShinyCharm(getCreatureName(target)) then
				if getPlayerStorageValue(getCreatureMaster(cid), 4125) - os.time() > 0 then
				  	if math.random(1, 2000) <= charmchance or isGod(getCreatureMaster(cid)) then
				    	addEvent(doCharm, 5 * 1000, posC1, nameDeath)
				    	doPlayerSendTextMessage(getCreatureMaster(cid), 20, "[Shiny Charm]: Ira nascer em 5 segundos um Shiny "..getCreatureName(target)..".")
				  end
				end
			end

			if isNpc(cid) and not isSummon(target) and not getCreatureName(target):find("Mega ") and isMegaCharm(getCreatureName(target)) then
				if getPlayerStorageValue(getNpcMaster(cid), 4126) - os.time() > 0 then
				  	if math.random(1, 2000) <= charmchance2 or isGod(getNpcMaster(cid)) then
				    	addEvent(doMega, 5 * 1000, posC1, nameDeath)
				    	doPlayerSendTextMessage(getNpcMaster(cid), 20, "[Mega Charm]: Ira nascer em 5 segundos um Mega "..getCreatureName(target)..".")
				  	end
				end
			end

			if isWild(target) and not getCreatureName(target):find("Mega ") and isMegaCharm(getCreatureName(target)) then
				if getPlayerStorageValue(getCreatureMaster(cid), 4126) - os.time() > 0 then
				  	if math.random(1, 2000) <= charmchance2 or isGod(getCreatureMaster(cid)) then
				    	addEvent(doMega, 5 * 1000, posC1, nameDeath)
				    	doPlayerSendTextMessage(getCreatureMaster(cid), 20, "[Mega Charm]: Ira nascer em 5 segundos um Mega "..getCreatureName(target)..".")
				  	end
				end
			end

			-- // Charm System // --

			if corpse and not isSummon(target) then

				doItemSetAttribute(corpse, "poke", "fainted " .. nameDeath:lower())

				if nameDeath:find("Smeargle") then
					doItemSetAttribute(corpse, "smeargleID", getPlayerStorageValue(target, storages.SmeargleID))
				end

				doDecayItem(corpse)

				local name = getCreatureName(getCreatureMaster(cid))

				-- if isNpc(cid) then
				-- 	doCorpseAddLoot(getCreatureName(target), getPlayerSlotItem(getCreatureMaster(cid), 3).uid, getNpcMaster(cid), target)
				-- else
				if isPremium(getCreatureMaster(cid)) and isCollectAll(getCreatureMaster(cid)) then
					if getContainerSlotsFree(getPlayerSlotItem(getCreatureMaster(cid), 3).uid) >= 1 and getContainerSlotsFree(getPlayerSlotItem(getCreatureMaster(cid), 3).uid) ~= 333 then
						doCorpseAddLoot(getCreatureName(target), getPlayerSlotItem(getCreatureMaster(cid), 3).uid, getCreatureMaster(cid), target, corpse)
					else
						doCorpseAddLoot(getCreatureName(target), corpse, getCreatureMaster(cid), target, corpse)
					end
				else
					doCorpseAddLoot(getCreatureName(target), corpse, getCreatureMaster(cid), target, corpse)
				end

    			doItemSetAttribute(corpse, "level", getPokeLevel(target))
	    		doItemSetAttribute(corpse, "gender", getPokemonGender(target))
			end


		end

		if getCreatureMaster(cid) then
			addMixlortPokeXp(getCreatureMaster(cid), target)
		end

		if isSummon(cid) then
			doSendPlayerExtendedOpcode(getCreatureMaster(cid), 57,  "nothing|0|0")
		end

		doRemoveCreature(target)
	end
end
