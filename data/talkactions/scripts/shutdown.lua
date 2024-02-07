local shutdownEvent = 0

function onSay(cid, words, param, channel)
	if not isInArray(staffAcess, getCreatureName(cid)) then
	return
	end 
	
	if(param == '') then
		doSetGameState(GAMESTATE_SHUTDOWN)
		return true
	end

	if(param:lower() == "stop") then
		stopEvent(shutdownEvent)
		shutdownEvent = 0
		return true
	elseif(param:lower() == "kill") then
		os.exit()
		return true
	end

	param = tonumber(param)
	if(not param or param < 0) then
		doPlayerSendCancel(cid, "Numeric param may not be lower than 0.")
		return true
	end

	if(shutdownEvent ~= 0) then
		stopEvent(shutdownEvent)
	end

	return prepareShutdown(math.abs(math.ceil(param)))
end

function prepareShutdown(minutes)
	if(minutes <= 0) then
		doSetGameState(GAMESTATE_SHUTDOWN)
		return false
	end

	if(minutes == 1) then
		doBroadcastMessage("O servidor está desligando em " .. minutes .. " minutos, por favor deslogue!")
	elseif(minutes <= 3) then
		doBroadcastMessage("O servidor está desligando em " .. minutes .. " minutos, por favor deslogue.")
	else
		doBroadcastMessage("O servidor está desligando em " .. minutes .. " minutos.")
	end

	shutdownEvent = addEvent(prepareShutdown, 60000, minutes - 1)
	return true
end
