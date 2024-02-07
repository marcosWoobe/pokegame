function onUse(cid, item, fromPosition, itemEx, toPosition)

	posi = getPlayerPosition(cid)

	if posi.y == 527 then
		if doPlayerRemoveItem(cid,25209,1) then 
			if posi.x == 628 and posi.y == 527 then 
				local pos = {x = 628, y = 525, z = 12}
				doTeleportThing(cid, pos)
				doSendMagicEffect(pos, 21)
			end
			if posi.x == 629 and posi.y == 527 then 
				local pos = {x = 629, y = 525, z = 12}
				doTeleportThing(cid, pos)
				doSendMagicEffect(pos, 21)
			end
		else
		    doPlayerSendTextMessage(cid,22,"Você não tem um ticket portanto não pode entrar aqui.")		
		    return true	
		end
	end

	if posi.x == 628 and posi.y == 525 then 
		local pos = {x = 628, y = 527, z = 12}
		doTeleportThing(cid, pos)
		doSendMagicEffect(pos, 21)
		doPlayerAddItem(cid,25209,1)
	end
	if posi.x == 629 and posi.y == 525 then 
		local pos = {x = 629, y = 527, z = 12}
		doTeleportThing(cid, pos)
		doSendMagicEffect(pos, 21)
		doPlayerAddItem(cid,25209,1)
	end

return true
end