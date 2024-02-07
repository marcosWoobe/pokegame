local msgs = {"use ", ""}

function doAlertReady(cid, id, movename, n, cd)
if movename == "Mega Evolution" then return true end
	if not isCreature(cid) then return true end
	local myball = getPlayerSlotItem(cid, 8)
	if myball.itemid > 0 and getItemAttribute(myball.uid, cd) == "cd:"..id.."" then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, getPokeballName(myball.uid).." - "..movename.." (m"..n..") is ready!")
	return true
	end
	local p = getPokeballsInContainer(getPlayerSlotItem(cid, 3).uid)
	if not p or #p <= 0 then return true end
	for a = 1, #p do
		if getItemAttribute(p[a], cd) == "cd:"..id.."" then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, getPokeballName(p[a]).." - "..movename.." (m"..n..") is ready!")
		return true
		end
	end
end

function onSay(cid, words, param, channel)


	if param ~= "" then return true end
	if string.len(words) > 3 then return true end

	if #getCreatureSummons(cid) == 0 then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You need a pokemon to use moves.")
		return 0
	end
                      --alterado v1.5
	local mypoke = getCreatureSummons(cid)[1]

	if getCreatureCondition(cid, CONDITION_EXHAUST) then return true end
	if getCreatureName(mypoke) == "Evolution" then return true end

    if getCreatureName(mypoke) == "Ditto" or getCreatureName(mypoke) == "Shiny Ditto" then
       name = getPlayerStorageValue(mypoke, 1010)   --edited
    else
       name = getCreatureName(mypoke)
    end  
	
    --local name = getCreatureName(mypoke) == "Ditto" and getPlayerStorageValue(mypoke, 1010) or getCreatureName(mypoke)

	local it = string.sub(words, 2, 3)
	--local move = movestable[name].move1
	local idd = getPlayerSlotItem(cid, 8).uid
	local move = getCreatureName(mypoke) == "Smeargle" and getItemAttribute(idd, "skt1") and movestable[getItemAttribute(idd, "skt1")].move1 or movestable[name].move1
	if getPlayerStorageValue(mypoke, 212123) >= 1 then
    	cdzin = "cm_move"..it..""
	else
    	cdzin = "move"..it..""       --alterado v1.5
	end

	if it == "2" then
    	if getItemAttribute(idd, "skt2") then  
    		move = movestable[getItemAttribute(idd, "skt2")].move2
  		else
        	move = movestable[name].move2
        end
 	elseif it == "3" then
    	if getItemAttribute(idd, "skt3") then  
  			move = movestable[getItemAttribute(idd, "skt3")].move3
  		else
        	move = movestable[name].move3
        end  
 	elseif it == "4" then
    	if getItemAttribute(idd, "skt4") then  
  			move = movestable[getItemAttribute(idd, "skt4")].move4
  		else
        	move = movestable[name].move4
        end 
 	elseif it == "4" then
    	if getItemAttribute(idd, "skt4") then  
 			move = movestable[getItemAttribute(idd, "skt4")].move4
  		else
        	move = movestable[name].move4
        end 
 	elseif it == "5" then
    	if getItemAttribute(idd, "skt5") then  
  			move = movestable[getItemAttribute(idd, "skt5")].move5
  		else
        	move = movestable[name].move5
        end 
 	elseif it == "6" then
    	if getItemAttribute(idd, "skt6") then  
  			move = movestable[getItemAttribute(idd, "skt6")].move6
  		else
        	move = movestable[name].move6
        end 
 	elseif it == "7" then
    	if getItemAttribute(idd, "skt7") then  
 			move = movestable[getItemAttribute(idd, "skt7")].move7
  		else
        	move = movestable[name].move7
        end 
 	elseif it == "8" then
    	if getItemAttribute(idd, "skt8") then  
  			move = movestable[getItemAttribute(idd, "skt8")].move8
  		else
        	move = movestable[name].move8
        end 
 	elseif it == "9" then
 		move = movestable[name].move9
 	elseif it == "10" then
    	move = movestable[name].move10
    elseif it == "11" then
   		move = movestable[name].move11
 	elseif it == "12" then
 		move = movestable[name].move12
 	elseif it == "13" then
    	move = movestable[name].move13
	end 

	if not move then
        local isMega = false
		local isMegaAttr = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "heldy")
		if not isMegaAttr or isMegaAttr and not megaEvolutions[isMegaAttr] then
		    isMegaAttr = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "heldx")
		end
		if isMegaAttr and megaEvolutions[isMegaAttr] then
		    isMega = true
		end
        if not isMega or name:find("Mega") then 
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your pokemon doesn't recognize this move.")
            return true
        end
        -- local moveTable, index = getNewMoveTable(movestable[name]), 0
        -- for i = 1, 12 do
        --     if not moveTable[i] then
        --         index = i
        --         break
        --     end
        -- end
        -- if tonumber(it) ~= index then
        --     doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your pokemon doesn't recognize this move.")
        --     return true
        -- end
        local needCds = true                   --Coloque false se o pokÃ©mon puder mega evoluir mesmo com spells em cooldown.
        if needCds then
            for i = 1, 12 do
                if getCD(getPlayerSlotItem(cid, 8).uid, "move"..i) > 0 then
                    return doPlayerSendCancel(cid, "To mega evolve, all the spells of your pokemon need to be ready.")
                end
            end
        end
		-- local megaEvoClans = {
    	-- --[mega_stone_id] = {"clan_name", "clan_name", etc},
    	-- [14643] = {"Volcanic", "Gardestrike"},
    	-- [14654] = {"Seavell", "Orebound"},
		-- [14640] = {"Volcanic"},
		-- [14639] = {"Seavell"},
		-- [14647] = {"Naturia"},
		-- [14642] = {"Malefic"},
		-- [14638] = {"Psycraft"},
		-- [14648] = {"Orebound"},
		-- [4000] = {"Volcanic", "Gardestrike"},
    	-- --etc,
		-- }
		--[[if megaEvoClans[4000] then
    		if not isInArray(megaEvoClans[4000], getPlayerClanName(cid)) then
        		return doPlayerSendCancel(cid, "You can't mega evolve this pokemon.")
    		end
		end]]
    	move = {name = "Mega Evolution", level = 0, cd = 0, dist = 1, target = 0, f = 0, t = "?"}
    end
	
	if getPlayerLevel(cid) < move.level then
	   doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You need be atleast level "..move.level.." to use this move.")
	   return true
    end

	if getCD(getPlayerSlotItem(cid, 8).uid, cdzin) > 0 and getCD(getPlayerSlotItem(cid, 8).uid, cdzin) < (move.cd + 2) then
		-- doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You have to wait "..getCD(getPlayerSlotItem(cid, 8).uid, cdzin).." seconds to use "..move.name.." again.")
		return true
	end

	if getTileInfo(getThingPos(mypoke)).protection then
		doPlayerSendCancel(cid, "Your pokemon cannot use moves while in protection zone.")
		return true
	end
	
    if getPlayerStorageValue(mypoke, 3894) >= 1 then
        return doPlayerSendCancel(cid, "You can't attack because you is with fear") --alterado v1.3
    end
	                              --alterado v1.6                  
	if (move.name == "Team Slice" or move.name == "Team Claw") and #getCreatureSummons(cid) < 2 then       
	    doPlayerSendCancel(cid, "Your pokemon need be in a team for use this move!")
    	return true
    end
                                                                     --alterado v1.7 \/\/\/
	if isCreature(getCreatureTarget(cid)) and isInArray(specialabilities["evasion"], getCreatureName(getCreatureTarget(cid))) then 
   		local target = getCreatureTarget(cid)                                                                                       
   		if math.random(1, 100) <= passivesChances["Evasion"][getCreatureName(target)] then 
        	if isCreature(getMasterTarget(target)) then   --alterado v1.6                                                                   
         		doSendMagicEffect(getThingPos(target), 211)
        		doSendAnimatedText(getThingPos(target), "TOO BAD", 215)                                
         		doTeleportThing(target, getClosestFreeTile(target, getThingPos(mypoke)), false)
         		doSendMagicEffect(getThingPos(target), 211)
         		doFaceCreature(target, getThingPos(mypoke))    		
         		return true       --alterado v1.6
      		end
  		end
	end


	if move.target == 1 then

		if not isCreature(getCreatureTarget(cid)) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You don\'t have any targets.")
			return 0
		end

		if getCreatureCondition(getCreatureTarget(cid), CONDITION_INVISIBLE) then
			return 0
		end

		if getCreatureHealth(getCreatureTarget(cid)) <= 0 then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your have already defeated your target.")
			return 0
		end

		if not isCreature(getCreatureSummons(cid)[1]) then
			return true
		end

		if getDistanceBetween(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid))) > move.dist then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Get closer to the target to use this move.")
			return 0
		end

		if not isSightClear(getThingPos(getCreatureSummons(cid)[1]), getThingPos(getCreatureTarget(cid)), false) then
			return 0
		end
	end

	local newid = 0
	
	-- Cooldown -- 
	local Tiers = {
		[113] = {bonus = Cdown1},
		[114] = {bonus = Cdown2},
		[115] = {bonus = Cdown3},
	}
	local Tier = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "heldx")
	local cdzao = {}
	if Tier and Tier > 112 and Tier < 116 then
		cdzao = math.ceil(move.cd - (move.cd * Tiers[Tier].bonus))
	else
		cdzao = move.cd
	end
	-- Cooldown -- 

    if isSleeping(mypoke) or isSilence(mypoke) then  --alterado v1.5
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Sorry you can't do that right now.")
		return 0
	else
		-- newid = setCD(getPlayerSlotItem(cid, 8).uid, cdzin, cdzao) 
		newid = setCD(getPlayerSlotItem(cid, 8).uid, cdzin, math.floor(cdzao*0.5)) 
	end
		
	if getPlayerStorageValue(mypoke, 93828) > os.time() then
    	return doPlayerSendCancel(cid, "Your pokemon can't use moves right now.")
	end
		
	local spellMessage = msgs[math.random(#msgs)]..""..move.name.."!"
	if move.name == "Mega Evolution" then
    	spellMessage = "Mega Evolve!"
	end
	doCreatureSay(cid, getPokeName(mypoke)..", "..spellMessage, TALKTYPE_MONSTER)
	
    local summons = getCreatureSummons(cid) --alterado v1.6

	-- addEvent(doAlertReady, move.cd * 1000, cid, newid, move.name, it, cdzin)
	
	-- for i = 2, #summons do
    --     if isCreature(summons[i]) and not getPlayerStorageValue(cid, 637501) >= 1 then
    --        --docastspell(summons[i], move.name)        --alterado v1.6
	-- 		if not doAttackPokemon(summons[i], move.name) and not move.name == "Mega Evolution" then
	--     		print("Está faltando o move ("..move.name..") no spells.")
	-- 			local test = io.open("data/moves.txt", "a+")
 	-- 			local read = ""
	-- 			if test then
    -- 				read = test:read("*all")
    -- 				test:close()
 	-- 			end
 	-- 			read = read.." - ".."Está faltando o move ("..move.name..") no spells.\n"..""
 	-- 			local reopen = io.open("data/moves.txt", "w")
 	-- 			reopen:write(read)
 	-- 			reopen:close()
	-- 		end
    --     end
    -- end 
	
	--doPlayerSendTextMessage(getCreatureMaster(cid), MESSAGE_STATUS_CONSOLE_BLUE, "Your pokemon doe move.")
	if isMega and not name:find("Mega") and move.name == "Mega Evolution" then
	    local effect = 170                          --Efeito de mega evoluçao.
        if isSummon(mypoke) then
            local pid = getCreatureMaster(mypoke)
            if isPlayer(pid) then
                local ball = getPlayerSlotItem(pid, 8).uid
                if ball > 0 then
                    local attr = getItemAttribute(ball, "heldy")
					if not attr or attr and not megaEvolutions[attr] then
					    attr = getItemAttribute(ball, "heldx")
					end
                    if attr and megaEvolutions[attr] then
                        local oldPosition, oldLookdir = getThingPos(mypoke), getCreatureLookDir(mypoke)
                        doItemSetAttribute(ball, "poke", megaEvolutions[attr][2])
                        doSendMagicEffect(getThingPos(mypoke), effect)
                        doRemoveCreature(mypoke)
                        doSummonMonster(pid, megaEvolutions[attr][2])
                        mypoke = getCreatureSummons(pid)[1]
                        doTeleportThing(mypoke, oldPosition, false)
                        doCreatureSetLookDir(mypoke, oldLookdir)
                        adjustStatus(mypoke, ball, true, false)
                        if useKpdoDlls then
                            addEvent(doUpdateMoves, 5, pid)
                        end
                    end
                end
            end
        end
	end
	if not doAttackPokemon(mypoke, move.name) and not move.name == "Mega Evolution" then 
	    print("Está faltando o move ("..move.name..") no spells.")
						local test = io.open("data/moves.txt", "a+")
 		local read = ""
 		if test then
  			read = test:read("*all")
  			test:close()
 		end
 		read = read.." - ".."Está faltando o move ("..move.name..") no spells.\n"..""
 		local reopen = io.open("data/moves.txt", "w")
 		reopen:write(read)
 		reopen:close()
	end
    --docastspell(mypoke, move.name)

	doCreatureAddCondition(cid, playerexhaust)

	if useKpdoDlls then
		doUpdateCooldowns(cid)	
        doUpdateCooldownsZ(cid, tonumber(it))
		--print(it)
	end
--doUpdateCooldownsZ(cid, it)
--		print(it) 
	return 0
end
