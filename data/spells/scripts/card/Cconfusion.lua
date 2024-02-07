function onCastSpell(cid, var)

	local min, max = -1500, -3500		
	
	formaCertadeusarADDEVENT(cid, PSYCHICDAMAGE, getThingPosWithDebug(cid), selfArea1C, min, max, 430)		
    return true
end


function formaCertadeusarADDEVENT(cid, type, pos, area, min, max, effect)
	if isCreature(cid) then
		doAreaCombatHealth(cid, type, pos, area, min, max, effect)
	end
end	

selfArea1C = createCombatArea{
	{0, 0, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 2, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 0, 0}
}