function onCastSpell(cid, var)

	local min, max = -150000, -350000	
	local pos = getThingPosWithDebug(cid)	
	
	addEvent(doSendMagicEffect, 55, {x = pos.x + 1, y = pos.y, z = pos.z}, 409)
	formaCertadeusarADDEVENT(cid, ELECTRICDAMAGE, getThingPosWithDebug(cid), thunderrC, min, max, 48)
		
    return true
end

function formaCertadeusarADDEVENT(cid, type, pos, area, min, max, effect)
	if isCreature(cid) then
		doAreaCombatHealth(cid, type, pos, area, min, max, effect)
	end
end	

thunderrC = createCombatArea{
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0}, 
{1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, 
}


		
	