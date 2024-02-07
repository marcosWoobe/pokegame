function onCastSpell(cid, var)
	
		local min, max = -1000, -25000
		local function doFall(cid)
			for rocks = 5, 42 do
				addEvent(fall, rocks*35, cid, cid, DRAGONDAMAGE, 5, 248)
			end
		end
		
		for up = 1, 10 do 
			addEvent(upEffect, up*75, cid, 5)
		end
		
		addEvent(doFall, 450, cid)
		addEvent(formaCertadeusarADDEVENT, 1400, cid, DRAGONDAMAGE, getThingPosWithDebug(cid), waterarea, min, max, 0)			
    return true
end


function formaCertadeusarADDEVENT(cid, type, pos, area, min, max, effect)
	if isCreature(cid) then
		doAreaCombatHealth(cid, type, pos, area, min, max, effect)
	end
end	