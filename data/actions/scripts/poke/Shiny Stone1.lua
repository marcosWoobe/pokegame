local poevoshiny = {
["Shiny Rattata"] = {level = 60, evolution = "Shiny Raticate", count = 1, stoneid = 11453, stoneid2 = 12401},
["Shiny Zubat"] = {level = 60, evolution = "Shiny Golbat", count = 1, stoneid = 11443, stoneid2 = 12401},
["Shiny Golbat"] = {level = 100, evolution = "Shiny Crobat", count = 1, stoneid = 11443, stoneid2 = 12401},
["Shiny Paras"] = {level = 60, evolution = "Shiny Parasect", count = 1, stoneid = 11448, stoneid2 = 12401},
["Shiny Venonat"] = {level = 100, evolution = "Shiny Venomoth", count = 1, stoneid = 11448, stoneid2 = 12401},
["Shiny Growlithe"] = {level = 100, evolution = "Shiny Arcanine", count = 2, stoneid = 11447, stoneid2 = 12401},
["Shiny Tentacool"] = {level = 100, evolution = "Shiny Tentacruel", count = 1, stoneid = 11442, stoneid2 = 12401},
["Shiny Grimer"] = {level = 100, evolution = "Shiny Muk", count = 1, stoneid = 11443, stoneid2 = 12401},
["Shiny Krabby"] = {level = 60, evolution = "Shiny Kingler", count = 1, stoneid = 11442, stoneid2 = 12401},
["Shiny Voltorb"] = {level = 80, evolution = "Shiny Electrode", count = 1, stoneid = 11444, stoneid2 = 12401},
["Shiny Cubone"] = {level = 100, evolution = "Shiny Marowak", count = 2, stoneid = 11451, stoneid2 = 12401},
["Shiny Horsea"] = {level = 60, evolution = "Shiny Seadra", count = 1, stoneid = 11442, stoneid2 = 12401},
["Shiny Dratini"] = {level = 100, evolution = "Shiny Dragonair", count = 1, stoneid = 11449, stoneid2 = 12401},

["Shiny Larvitar"] = {level = 100, evolution = "Shiny Pupitar", count = 1, stoneid = ground, stoneid2 = 124010},
}
function onUse(cid, item, frompos, item2, topos)

    if not isCreature(item2.uid) then
	    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sorry, isso nao e um creatura.")
	    return true
	end
	
	if not isMonster(item2.uid) or not isSummon(item2.uid) then
	     doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sorry, isso nao e um pokemon.")
    	return true
	end
	
	if #getCreatureSummons(cid) > 1 then
	   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sorry, nao tem um pokemon.")
   		return true
	end 
		
	if getCreatureMaster(item2.uid) ~= cid then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sorry, you can't use this addon on this pokemon.")
        return false 
    end 
	
	if not string.find(tostring(getCreatureName(item2.uid)), "Shiny") and not pokes["Shiny "..getCreatureName(item2.uid)] then
	    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sorry, nao pode evo.")
        return false 
    end
	
	minlevel = 0
	local stnid = 12401
	local stnid2 = 0
	local count = 3
	local count2 = 20
	local nameEvo = ""
	if string.find(tostring(getCreatureName(item2.uid)), "Shiny") then
	    minlevel = pokes[poevoshiny[getCreatureName(item2.uid)].evolution].level
		if pokes[poevoshiny[getCreatureName(item2.uid)].evolution] then
		    stnid = poevo[tostring(getCreatureName(item2.uid)):match("Shiny (.*)")].stoneid
		    count = 20
		    nameEvo = poevoshiny[getCreatureName(item2.uid)].evolution
		    --stnid2 = poevo[tostring(getCreatureName(item2.uid)):match("Shiny (.*)")].stoneid
		--else
		    --stnid2 = 12401
			--count2 = 1
		end
	else
	    minlevel = pokes["Shiny "..getCreatureName(item2.uid)].level
		nameEvo = "Shiny "..getCreatureName(item2.uid)
		stnid2 = poevo[getCreatureName(item2.uid)].stoneid
		count2 = 20
	end
	
	if getPlayerLevel(cid) < minlevel then
   		doPlayerSendCancel(cid, "Você não possui level necessario para evoluir esse pokemon ("..minlevel..").")
    	return true
	end
	
	
	if getPlayerItemCount(cid, stnid) < count and getPlayerItemCount(cid, stnid2) < count2 then
        local str = ""
        if count >= 2 then
            str = "s"
        end
		if stnid2 > 0 then
		    return doPlayerSendCancel(cid, "You need at least "..count.." "..getItemNameById(stnid)..""..str.." and "..count2.." "..getItemNameById(stnid2).." to evolve this pokemon!")  
        else
		    return doPlayerSendCancel(cid, "You need at least "..count.." "..getItemNameById(stnid)..""..str.." to evolve this pokemon!")
		end
	end
	
	local pokeball = getPlayerSlotItem(cid, 8)
	 
	--if count >= 2 then
    --    stnid2 = stnid
    --end

    doEvolvePokemonShiny(cid, item2, nameEvo, stnid, stnid2, count, count2)
	local ball = getPlayerSlotItem(cid, 8).uid
	doItemEraseAttribute(ball, "boost")	
    doItemSetAttribute(ball, "morta", "no")
    doItemSetAttribute(ball, "Icone", "yes")	
    doTransformItem(ball, icons[getItemAttribute(ball, "poke")].use)
	print("kkk")
return true
end