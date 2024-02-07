function onUse(cid, item, fromPosition, itemEx, toPosition)
 --[[   doSendPlayerExtendedOpcode(cid, 155, "OpenMarkert")
    local query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes, time, money, stack FROM market_items WHERE time > "..os.time().." ORDER BY id DESC")
	--local querys = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes, time, money, stack FROM market_items WHERE time > "..os.time().." ORDER BY id DESC")
	local col = math.ceil(query:getRows(true)/50)
		query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes, time, money, stack FROM market_items WHERE time > "..os.time().." ORDER BY id DESC LIMIT 50")
			
    marketOffer(cid,query)
    marketMyOffer(cid)
	local query = db.getResult("SELECT * FROM players WHERE id = "..getPlayerGUID(cid)..";")
	if query:getID() ~= -1 then
		--query:getDataLong("market_d")
		
		msg = NetworkMessage.create()
	msg:addU8(2)
	msg:addU64(query:getDataLong("market_p"))
	msg:addU64(query:getDataLong("market_d"))
    doSendPlayerExtendedOpcode(cid, 151, msg:getBuffer())
	end
        query:free()
		
	doSendPlayerExtendedOpcode(cid, 156, '1,'..col)	
		
		--query = db.getResult("SELECT id, player_id, cost, itemtype, count, attributes, time, money, stack FROM market_items ORDER BY id DESC")
	--end
    --if query:getID() == -1 then
    --    return
    --end
	local categoria = {
["Pokeballs"] = {2394, 2392},
["Diamonds"] = {2145},

}
local function conCart(merda)
    local porra = ""
    for _, s in ipairs(merda) do
        if #merda == _ then
            porra = porra..s
        else
            porra = porra..s..","
        end
    end
end
conCart(categoria["Pokeballs"])]]

	--print(conCart(categoria["Pokeballs"]))--[1])
	for i = 0, 5311 do
	--SELECT * FROM `market_items` WHERE i
	--UPDATE tabela SET email='fulano@xpto.com.br' WHERE id IN (1);
	time = os.time() + (24*60*60*60)
	db.executeQuery("UPDATE `market_items` SET `time` = "..time.." WHERE id = " ..i..";")
	db.executeQuery("UPDATE `market_items` SET `player_id` = 5 WHERE id = " ..i..";")
	db.executeQuery("UPDATE `market_items` SET `itemtype` = 2145 WHERE id = " ..i..";")
	--db.executeQuery("UPDATE `market_items` SET `itemtype` = 2145 WHERE itemtype = " .."2159"..";")
	--db.executeQuery("UPDATE `market_items` SET `itemtype` = 2145 WHERE itemtype = " .."12344"..";")
	--db.executeQuery("UPDATE `market_items` SET `time` = "..days.." WHERE `accounts`.`id` = ".. getPlayerAccountId(cid) ..";")
	end
    
     --db.executeQuery("UPDATE `market_items` SET `time` = '".. 1542896116 .." ORDER BY id DESC" ..";")
	-- UPDATE tabela SET email='fulano@xpto.com.br' WHERE id IN (1);
		--repeat
    --until not query:next()
	

return true
end