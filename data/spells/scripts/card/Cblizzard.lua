function onCastSpell(cid, var)

	local min, max = -150000, -350000	
	local function doFall(cid)
		for rocks = 1, 42 do
			addEvent(fall, rocks*35, cid, cid, ICEDAMAGE, 28, 52)
		end
	end	
		
	for up = 1, 10 do
		addEvent(upEffect, up*75, cid, 28)
	end --alterado v1.4
		
	addEvent(doFall, 450, cid)
	addEvent(formaCertadeusarADDEVENT, 1400, cid, ICEDAMAGE, getThingPosWithDebug(cid), BigArea2C, min, max, 0)	
		
    return true
end


function formaCertadeusarADDEVENT(cid, type, pos, area, min, max, effect)
	if isCreature(cid) then
		doAreaCombatHealth(cid, type, pos, area, min, max, effect)
	end
end	

BigArea2C = createCombatArea{
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}



		
	