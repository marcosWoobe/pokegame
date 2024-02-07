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
	
function onKill(cid, target, lastHit)
    if hasTaskStarted(cid) then
		if (getCreatureName(target):lower() == getStartedTask(cid):lower()) then
			if (getCurrentTaskKills(cid) < getTaskKillsById(getStartedTaskId(cid))) then
				addTaskKill(cid, 1)
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Caça Pokémon]: "..getStartedTask(cid)..", Tarefa completa venha receber sua recompensa..")
			return true
			end
			
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Caça Pokémon]: "..getCurrentTaskKills(cid).." de "..getTaskKillsById(getStartedTaskId(cid)).." "..getStartedTask(cid).."s.")
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[Tempo de Caça]: Você tem "..timeString(getTaskRemainingTime(cid)).." para concluir esta tarefa.")
		end
	end
return true
end