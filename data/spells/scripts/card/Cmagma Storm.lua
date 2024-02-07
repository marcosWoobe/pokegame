function onCastSpell(cid, var)
	local min, max = -150000, -350000	
	
	local eff = {6, 35, 6, 35}
	local area = {flamesC1, flamesC2, flamesC3, flamesC4}

	addEvent(formaCertadeusarADDEVENT, 2*450, cid, FIREDAMAGE, getThingPosWithDebug(cid), flamesC0, min, max, 2)	
	
	for i = 0, 3 do
		addEvent(formaCertadeusarADDEVENT, i*450, cid, FIREDAMAGE, getThingPosWithDebug(cid), area[i+1], min, max, eff[i+1])				
	end				
	
    return true
end

function formaCertadeusarADDEVENT(cid, type, pos, area, min, max, effect)
	if isCreature(cid) then
		doAreaCombatHealth(cid, type, pos, area, min, max, effect)
	end
end	

flamesC0 = createCombatArea{        --explosao
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 0, 0}, 
{0, 0, 0, 0, 2, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
}

flamesC1 = createCombatArea{        --explosao
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 0, 0, 0}, 
{0, 0, 1, 1, 2, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
}

flamesC2 = createCombatArea{        --flames
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 1, 0, 1, 0, 0}, 
{0, 0, 0, 0, 2, 0, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
}

flamesC3 = createCombatArea{        --flame
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 1, 0, 0}, 
{0, 1, 0, 0, 2, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
}

flamesC4 = createCombatArea{        --explosao
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 1, 1, 0, 0, 0, 1, 1, 0}, 
{1, 1, 0, 0, 2, 0, 0, 1, 1},
{0, 1, 1, 0, 0, 0, 1, 1, 0},
{0, 0, 1, 1, 0, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
}