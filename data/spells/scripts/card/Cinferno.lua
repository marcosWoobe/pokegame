function onCastSpell(cid, var)

	local min, max = -1500000, -3500000	

	formaCertadeusarADDEVENT(cid, FIREDAMAGE, getThingPosWithDebug(cid), infernoC1, 0, 0, 391)		
	addEvent(formaCertadeusarADDEVENT, 150, cid, FIREDAMAGE, getThingPosWithDebug(cid), inferno2, min, max, 0)			
    return true
end

function formaCertadeusarADDEVENT(cid, type, pos, area, min, max, effect)
	if isCreature(cid) then
		doAreaCombatHealth(cid, type, pos, area, min, max, effect)
	end
end

infernoC1 = createCombatArea{
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0}, 
{0, 1, 0, 0, 0, 2, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0},
{0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, 
}
