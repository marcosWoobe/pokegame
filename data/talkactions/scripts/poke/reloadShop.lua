local function updateStatusPontos(cid, pontos)

    db.executeQuery("INSERT INTO `shop_convert` (`account`, `player`, `count`, `date`) VALUES ("..getPlayerAccountId(cid)..", '"..getCreatureName(cid).."', "..pontos..", '"..os.date("%d-%m-%Y %H:%M:%S").."')")
    local query = db.getResult("SELECT * FROM `pagsegurotransacoes` WHERE `Referencia` = '"..getPlayerAccount(cid).."';") 
    if (query:getID() ~= -1) then  
		db.executeQuery("UPDATE `pagsegurotransacoes` SET `status` = '1' WHERE `Referencia` = '"..getPlayerAccount(cid).."';")
        query:free()
    end
	
end

function onSay(cid, words, param, channel)
    local query = db.getResult("SELECT `premium_points` FROM `accounts` WHERE `id` = "..getPlayerAccountId(cid)..";")
    local VPontos = 0 
    if (query:getID() ~= -1) then  
        VPontos = query:getDataInt("premium_points")
        query:free()
    end
	
	local pag = 1
	if tonumber(param) then
	    pag = tonumber(param)
		doSendPlayerExtendedOpcode(cid, 66, pag)
	end
	
	if pag == 1 then
	    local item = shopMarket[1]
	    local buffer = VPontos.."@"..getPlayerItemCount(cid, 2145).."@"..pag.."@"..item.name..","..item.diamonds..","..item.name..",1"
	    for i=2, #shopMarket do
		    item = shopMarket[i]
			if i == 7 then
			    buffer = buffer.."|Change Clan,?,ChangeClan,0"
			end
		    buffer = buffer.."|"..item.name..","..item.diamonds..","..item.name..","..i
		end
		doSendPlayerExtendedOpcode(cid, 66, buffer)
	    return true
	elseif pag == 2 then
	    local buffer = VPontos.."@"..getPlayerItemCount(cid, 2145).."@"..pag.."@"--..item.name..","..item.diamonds..","..item.type..",".. 1 ..",0"
		
		local bufferM = "" 
		local bufferF = ""
		local sM = 1
		local sF = 1
	    for b = 1, #shopOutfit do
		    local item = shopOutfit[b]
			local str = ""
			
			if item.sex == 1 then
			    if sF > 1 then
			        str = "|"
			    end
		    	bufferF = bufferF..str..item.name..","..item.diamonds..","..item.type..","..b..","..b
			    sF = sF+1
			else
			    if sM > 1 then
			        str = "|"
			    end
		    	bufferM = bufferM..str..item.name..","..item.diamonds..","..item.type..","..b..","..b
			    sM = sM+1
			end
		end
		
		if getPlayerSex(cid) == 1 then
		    buffer = buffer..bufferM.."#"..bufferF 
		else
		    buffer = buffer..bufferF.."#"..bufferM
		end

		doSendPlayerExtendedOpcode(cid, 66, buffer)
	    return true
	elseif pag == 3 then
	    local item = shopAddon[1]
	    local buffer = VPontos.."@"..getPlayerItemCount(cid, 2145).."@"..pag.."@"
		if #getCreatureSummons(cid) >= 1 then
		    local pk = getCreatureSummons(cid)[1]
			local comp = item.name..","..item.diamonds..","..item.type..","..item.name..",0"
			buffer = buffer..getCreatureName(pk).."#"..comp.."#"..item.name..","..item.diamonds..","..item.type..","..item.name
		else
		    buffer = buffer.."##"..item.name..","..item.diamonds..","..item.type..","..item.name
		end 
		
		for n = 2, #shopAddon do
		    item = shopAddon[n]
		    buffer = buffer.."|"..item.name..","..item.diamonds..","..item.type..","..item.name
		end
		
	    doSendPlayerExtendedOpcode(cid, 66, buffer)
		return true
	elseif pag == 4 then 
	    local item = shopItem[1]
	    local buffer = VPontos.."@"..getPlayerItemCount(cid, 2145).."@"..pag.."@"..item.name..","..item.diamonds..","..item.name..",1,"..item.desc
	    for a=2, #shopItem do
		    item = shopItem[a]
		    buffer = buffer.."|"..item.name..","..item.diamonds..","..item.name..","..a..","..item.desc
		end
		doSendPlayerExtendedOpcode(cid, 66, buffer)
	    return true
	end
	return true
end