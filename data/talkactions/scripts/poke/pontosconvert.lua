local function updateStatusPontos(cid, pontos)

    db.executeQuery("INSERT INTO `shop_convert` (`account`, `player`, `count`, `date`) VALUES ("..getPlayerAccountId(cid)..", '"..getCreatureName(cid).."', "..pontos..", '"..os.date("%d-%m-%Y %H:%M:%S").."')")
    local query = db.getResult("SELECT * FROM `pagsegurotransacoes` WHERE `Referencia` = '"..getPlayerAccount(cid).."';") 
    if (query:getID() ~= -1) then  
		db.executeQuery("UPDATE `pagsegurotransacoes` SET `status` = '1' WHERE `Referencia` = '"..getPlayerAccount(cid).."';")
        query:free()
    end
	
	--db.ex?ecuteQuery("INSERT INTO `shop_convert` (`account`, `player`, `count`, `date`) VALUES ("..getPlayerGUID(cid)..", "..getCreatureName(cid)..", "..pontos..", "..os.date("%d-%m-%Y %H:%M:%S")..")")--date('d-m-Y H:i:s', $date)
--db.executeQuery("INSERT INTO `auction_system` (`player`, `item_name`, `item_id`, `count`, `cost`, `date`) VALUES (" .. getPlayerGUID(cid) .. ", \"" .. t[2] .. "\", " .. getItemIdByName(t[2]) .. ", " .. itemcount .. ", " .. costgp ..", " .. os.time() .. ")")
end

function onSay(cid, words, param, channel)
--print("priefdzfsdfsdfsdfsdfsdfds")
    local query = db.getResult("SELECT `premium_points` FROM `accounts` WHERE `id` = "..getPlayerAccountId(cid)..";")
    local diamond = 0 
    if (query:getID() ~= -1) then  
        diamond = query:getDataInt("premium_points")
        query:free()
    end
    if diamond > 0 then
        db.executeQuery("UPDATE `accounts` SET `premium_points` = '0' WHERE `accounts`.`id` = "..getPlayerAccountId(cid)..";")
        diaDepot(cid, diamond)
		updateStatusPontos(cid, diamond)
		sendMsgToPlayer(cid, 27, "Você converteu "..diamond.." Diamonds, eles se encontram no DP.")	
        sendMsgToPlayer(cid, 25, "Você converteu "..diamond.." Diamonds, eles se encontram no DP.") 
	else
	    sendMsgToPlayer(cid, 27, "Desculpe, você não tem pontos de doador.") 
	end
	return true
end