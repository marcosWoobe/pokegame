local Quests = {
-- Quest's Bau
	[16000] = {pontos = 60}, -- eu só dividi os valores por 2
	[16001] = {pontos = 60},
	[16002] = {pontos = 80},
	[16003] = {pontos = 80},
	[16004] = {pontos = 80},
	[16005] = {pontos = 60},
	[16006] = {pontos = 60},
	[16007] = {pontos = 60},
	[16008] = {pontos = 60},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if not Quests[item.actionid] then
		return true
	end
	
	if getPlayerStorageValue(cid, 2154600) ~= 1 then
		return doPlayerSendCancel(cid, "Você não está dentro da DG.")
	end
	
	local quest = Quests[item.actionid]
	local level = tonumber(getPlayerClanLevel(cid)) or 1
	local formula = tonumber(math.floor(level / 5 * quest.pontos * (getPlayerClanRank(cid) / 1.5)))
	-- local formula = tonumber(math.floor(level / 2.5 * quest.pontos * (getPlayerClanRank(cid) / 1.5))) -- old

	doTeleportFinish(cid)
	setPlayerPointsClan(cid, formula)
	setPlayerStorageValue(cid, 123124, -1)
	doPlayerSendTextMessage(cid, 20, "Você completou a DG e ganhou "..formula.." pontos.")	
	return true  
end