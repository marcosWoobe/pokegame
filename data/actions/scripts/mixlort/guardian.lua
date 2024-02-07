function onUse(cid, item, frompos, item2, topos)

	if getPlayerStorageValue(cid, 17000) >= 1 then
		doPlayerSendCancel(cid, "Proibido usar guardians em fly!!!")
	return true
	end

	if getPlayerStorageValue(cid, 564871) >= 1 then
		doPlayerSendCancel(cid, "Proibido usar guardians em pvp!!!")
	return true
	end

	-- if isPlayer(cid) and getPlayerLevel(cid) < 0 then
	-- 	doPlayerSendCancel(cid, "Just for players level 300 +.")
	-- return true
	-- end

	local guardiansT = {
		[25315] = {name = "Venusaur"},
		[25316] = {name = "Raichu"},
		[25317] = {name = "Gengar"},
		[25318] = {name = "Jynx"},
		[25319] = {name = "Magmar"},
		[25320] = {name = "Gyarados"},
		[25321] = {name = "Alakazam"},
		[25322] = {name = "Onix"},

		[25323] = {name = "Shiny Venusaur"},
		[25324] = {name = "Shiny Raichu"},
		[25325] = {name = "Shiny Gengar"},
		[25326] = {name = "Shiny Jynx"},
		[25327] = {name = "Shiny Magmar"},
		[25328] = {name = "Shiny Gyarados"},
		[25329] = {name = "Shiny Alakazam"},
		[25330] = {name = "Shiny Onix"}
	}
	
	local guardian_name = guardiansT[item.itemid].name
	 
    local guardd = GUARDIAN_CONFIGS.guardians[guardian_name].storage
    if exhaustion.get(cid, guardd) then
        doPlayerSendTextMessage(cid, 27, "Você só pode usar um guardian a cada quatro horas, ainda falta " .. math.ceil(exhaustion.get(cid, guardd) / 60) .. " minutos para voce usar outro guardian novamente.")
    	return true
    end

    if #getCreatureGuardians(cid) == 1 then
		doPlayerSendCancel(cid, "Somente um guardian por vez!!!")
	else
	    local guardian = guardiansT[item.itemid]
	    if guardian then
	        doSummonGuardian(cid, guardian.name)
	        local pk = getCreatureGuardians(cid)[1]
	        adjustGuardianPoke(pk, 1000, guardian_name, cid)
		    doCreatureSay(cid, "Me proteja "..guardian.name, TALKTYPE_SAY)
		    setPlayerStorageValue(cid, 564878, 1)
			-- doRemoveItem(item.uid, 1)
			-- addEvent(doRemoveCreature, 15*60*1000, pk)
            doPlayerSendCancel(cid, "Tempo de guardian: (40 minutos)")
		end
	end
	
return true
end