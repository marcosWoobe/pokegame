function onCastSpell(cid, var)
	
		local min, max = -1000, -25000
		local function doFall(cid)
			for rocks = 1, 62 do
				addEvent(fall, rocks*35, cid, cid, ROCKDAMAGE, 11, 44)
			end
		end
		
		for up = 1, 10 do 
			addEvent(upEffect, up*75, cid, 11)
		end
		
		addEvent(doFall, 450, cid)
		addEvent(formaCertadeusarADDEVENT, 1400, cid, ROCKDAMAGE, getThingPosWithDebug(cid), waterarea, min, max, 0)			
    return true
end


function formaCertadeusarADDEVENT(cid, type, pos, area, min, max, effect)
	if isCreature(cid) then
		doAreaCombatHealth(cid, type, pos, area, min, max, effect)
	end
end	