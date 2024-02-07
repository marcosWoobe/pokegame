-- by GodMarini for TibiaKing Fórum. --

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
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, tab[1]..": Parabéns! Você terminou a minha task.")
				else
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, tab[1]..": Está faltando você matar "..doConcatTable(str1, ", ", " e ")..".")
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

local function checkDirias(cid, nameDeath)
	
	local master = (isSummon(cid) and getCreatureMaster(cid) or isNpc(cid) and getNpcMaster(cid)) or cid
	local pokeTask1 = tostring(getPlayerStorageValue(master, 24001))
	local pokecount = tonumber(getPlayerStorageValue(master, 24003) <= 0 and 1 or getPlayerStorageValue(master, 24003))
	
	if pokeTask1 ~= -1 and pokeTask1 == nameDeath then
		setPlayerStorageValue(master, 24003, pokecount+1)
		if pokecount >= getKillCount(master) then
			doPlayerSendTextMessage(master, MESSAGE_STATUS_CONSOLE_BLUE, "[Daily Kill]: Você concluiu minha task, venha pegar sua recompensa.")
			setKillCatched(master, true)
		else
			doPlayerSendTextMessage(master, MESSAGE_STATUS_CONSOLE_BLUE, "[Daily Kill]: Faltam " .. getKillCount(master) - pokecount.. " " .. nameDeath .. (pokecount > 1 and "s" or "") .. ".")
		end
	end
	
end

function onKill(cid, target, lastHit)
    local nameDeath = doCorrectString(getCreatureName(target))--test
	local pos = getThingPos(target)
	local corpseID = getPokemonCorpse(nameDeath) -- pega essa func do master
	local master = getCreatureMaster(cid)
	local posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+5 posC1.y = posC1.y PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1 
	
	checkDirias(cid, nameDeath)
	if isNpc(cid) then
	checkTaskByDrazyn(getNpcMaster(cid), nameDeath)		
	else
	checkTaskByDrazyn(getCreatureMaster(cid), nameDeath)
	end
  
-- // Boss Charm System // -- testa
      
	return true


end