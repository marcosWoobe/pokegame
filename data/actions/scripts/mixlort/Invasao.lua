function onUse(cid, item, fromPosition, itemEx, toPosition)

	posi = getPlayerPosition(cid)

	if posi.x == 620 and posi.y == 527 then 
		local pos = {x = 620, y = 525, z = 12}
		doTeleportThing(cid, pos)
		doSendMagicEffect(pos, 21)
	end
	if posi.x == 621 and posi.y == 527 then 
		local pos = {x = 621, y = 525, z = 12}
		doTeleportThing(cid, pos)
		doSendMagicEffect(pos, 21)
	end
	if posi.x == 620 and posi.y == 525 then 
		local pos = {x = 620, y = 527, z = 12}
		doTeleportThing(cid, pos)
		doSendMagicEffect(pos, 21)
	end
	if posi.x == 621 and posi.y == 525 then 
		local pos = {x = 621, y = 527, z = 12}
		doTeleportThing(cid, pos)
		doSendMagicEffect(pos, 21)
	end

	if posi.x == 546 and posi.y == 589 then 
		local pos = {x = 546, y = 591, z = 12}
		doTeleportThing(cid, pos)
		doSendMagicEffect(pos, 21)
	end
	if posi.x == 547 and posi.y == 589 then 
		local pos = {x = 547, y = 591, z = 12}
		doTeleportThing(cid, pos)
		doSendMagicEffect(pos, 21)
	end
	if posi.x == 548 and posi.y == 589 then 
		local pos = {x = 548, y = 591, z = 12}
		doTeleportThing(cid, pos)
		doSendMagicEffect(pos, 21)
	end
	if posi.x == 549 and posi.y == 589 then 
		local pos = {x = 549, y = 591, z = 12}
		doTeleportThing(cid, pos)
		doSendMagicEffect(pos, 21)
	end	

return true
end