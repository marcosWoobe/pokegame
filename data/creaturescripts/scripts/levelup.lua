local configuracao = {
efeito = {28, 29}, 		-- Efeito que vai mandar ao avançar de level.
texto = "Level up!", 	-- Texto que vai aparecer ao avançar de level.
cortexto = 215		-- Cor do texto, sendo o número entre 1 e 254.
}

-- PREMIO POR LEVEL
local premio = { 
    [20] = {reward = {2394, 2391, 12344, 12347, 12349}, count = {150, 45, 15, 40, 25}, str = 65001},--pokeball greatball revive potion medicine
    [30] = {reward = {11638, 2152, 2392, 12344, 12348}, count = {1, 3, 35, 15, 30}, str = 65002},--box1 money ultraball revive greatpotion 
    [40] = {reward = {2392, 12344, 2152, 2393}, count = {45, 20, 10, 35}, str = 65003},--ultraball revive money Super Ball
    [50] = {reward = {11638, 2392, 12344, 2152}, count = {1, 75, 30, 25}, str = 65009},--Box 1 Ultra Ball Revive Money
    [80] = {reward = {2160, 23418, 11447, 23462}, count = {1, 3, 1, 1}, str = 65004},--Money Azul Essence Shiny Fire Stone Boost xp 10% 1h
    [100] = {reward = {11639, 11442, 12344}, count = {1, 2, 30}, str = 65005},--box 2 Water Stone Revives
    [120] = {reward = {23418, 11441, 12618}, count = {6, 2, 2}, str = 65006},--Essence Shiny Leaf Stone Boost Stone
    [140] = {reward = {15644, 23418, 12618}, count = {20, 10, 2}, str = 65007},--Mighty Tokens Essence Shiny Boost Stone
    [160] = {reward = {15644, 23418, 12618}, count = {30, 12, 2}, str = 65008},-- Mighty Tokens Essence Shiny Boost stone
    [170] = {reward = {15644, 23418, 12618}, count = {40, 15, 2}, str = 65010},-- Mighty Tokens Essence Shiny Boost stone
    [180] = {reward = {15644, 23418, 25208}, count = {50, 15, 2}, str = 65010}-- Mighty Tokens Essence Shiny Boost Catch
}

function onAdvance(cid, skill, oldLevel, newLevel)
    if skill ~= 8 then return true end
    if newLevel >= 11 and newLevel <= 200 then doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, math.floor(newLevel/2)) end   --alterado v1.8

    doRegainSpeed(cid)
    doSendMagicEffect(getThingPos(cid), configuracao.efeito[math.random(#configuracao.efeito)])

    local color = 0

    if configuracao.texto then
        if configuracao.cortexto ~= 0 then
            color = configuracao.cortexto
        else
            color = math.random(1, 254)
        end
        doSendAnimatedText(getThingPos(cid), configuracao.texto, color)
    end
	
    local s = getCreatureSummons(cid)
    if #s >= 1 then
        for i = 1, #s do
            doCreatureAddHealth(s[i], getCreatureMaxHealth(s[i]))     
            doSendMagicEffect(getThingPos(s[i]), 132)
        end                                                  --alterado v1.8
    end
    doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
    doSendMagicEffect(getThingPos(cid), 132)   

    local posPlayerLevel = getThingPosWithDebug(cid)
    doSendMagicEffect({x=posPlayerLevel.x+1,y=posPlayerLevel.y+1,z=posPlayerLevel.z}, 1035)

    if premio[newLevel] then
	    if getPlayerStorageValue(cid, premio[newLevel].str) >= 1 then
		    return true
		end
		for i, r in pairs (premio[newLevel].reward) do
		    local item = doCreateItemEx(r, premio[newLevel].count[i])
			-- if r ~= 2152 then
				doItemSetAttribute(item, "unico", 1)
		    -- end
			if not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then
            -- local cidade = getPlayerTown(cid)
            local cidade = 1
				doPlayerSendPokeCPName(getCreatureName(cid), item, cidade)
			else
				doPlayerAddItemEx(cid, item, true)
			end
			setPlayerStorageValue(cid, premio[newLevel].str, 1)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Parabéns, você atingiu o level "..newLevel.." e ganhou "..premio[newLevel].count[i].." "..getItemNameById(r)..".")
		end
    end 

    if #getCreatureSummons(cid) >= 1 then
        local item = getPlayerSlotItem(cid, 8)
        doPlayerSendCancel(cid, "KGT,"..getItemAttribute(item.uid, "ballorder").."|".."0")
        doPlayerSendCancel(cid, "")
    end
return true
end