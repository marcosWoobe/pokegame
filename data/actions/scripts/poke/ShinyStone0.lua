function onUse(cid, item, frompos, item2, topos)

   -- if not isCreature(item2.uid) then
	--    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sorry, isso nao e um creatura.")
	--    return false
	--end
	
	if not isMonster(item2.uid) or not isSummon(item2.uid) then
	     doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sorry, isso nao e um pokemon.")
    	return false
	end
	
	if #getCreatureSummons(cid) < 1 then
	   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sorry, nao tem um pokemon.")
   		return false
	end 
		
	if getCreatureMaster(item2.uid) ~= cid then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sorry, you can't use this addon on this pokemon.")
        return false 
    end 
	
	if not pokes["Shiny "..getCreatureName(item2.uid)] then
	    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sorry, you can't use this addon on this pokemon.")
        return false 
    end
	
	minlevel = pokes["Shiny "..getCreatureName(item2.uid)].level
	if getPlayerLevel(cid) < minlevel then
   		doPlayerSendCancel(cid, "Você não possui level necessario para evoluir esse pokemon ("..minlevel..").")
    	return false
	end
	
	local stnid = 12401
	local stnid2 = 0
	local count = 3
	if getPlayerItemCount(cid, stnid) < count then
        local str = ""
        if count >= 2 then
            str = "s"
        end
        return doPlayerSendCancel(cid, "You need at least "..count.." "..getItemNameById(stnid)..""..str.." to evolve this pokemon!")
    end
	
	local pokeball = getPlayerSlotItem(cid, 8)
	 
	if count >= 2 then
        stnid2 = stnid
    end

    doEvolvePokemon(cid, item2, "Shiny "..getCreatureName(item2.uid), stnid, stnid2)
	local ball = getPlayerSlotItem(cid, 8).uid
	doItemEraseAttribute(ball, "boost")	
    doItemSetAttribute(ball, "morta", "no")
    doItemSetAttribute(ball, "Icone", "yes")	
    doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
	print("kkk")
return true
end