function onCastSpell(cid, var)

	local min, max = -1500, -3500	

    posC = getThingPosWithDebug(cid) PosC = posC PosCid = posC posCid = posC
    posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+1 posC1.y = posC1.y+1 PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1 
	local eff = {429, 585, 133, 430, 133}
	local area = {psy1C, psy2C, psy3C, psy4C, psy5C}	
	
	addEvent(doSendMagicEffect, 20, posC1, 892)		
	for i = 0, 4 do
		addEvent(formaCertadeusarADDEVENT, i*400, cid, PSYCHICDAMAGE, getThingPosWithDebug(cid), area[i+1], min, max, eff[i+1])			
	end		
	
    return true
end

function formaCertadeusarADDEVENT(cid, type, pos, area, min, max, effect)
	if isCreature(cid) then
		doAreaCombatHealth(cid, type, pos, area, min, max, effect)
	end
end	


psy1C = createCombatArea{        --roxo
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0}, 
{0, 0, 0, 1, 2, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
}

psy2C = createCombatArea{      --verde
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 0, 0}, 
{0, 0, 1, 0, 2, 0, 1, 0, 0},
{0, 0, 0, 1, 0, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
}

psy3C = createCombatArea{    --roxo
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0}, 
{1, 1, 1, 1, 0, 2, 0, 1, 1, 1, 1},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},     --alterado v1.7
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0}, 
}

psy4C = createCombatArea{        --verde
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 1, 0, 1, 0, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 0, 0, 0}, 
{0, 1, 1, 1, 2, 1, 1, 1, 0},
{0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 0, 1, 0, 1, 0, 0},
{0, 0, 0, 0, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
}

psy5C = createCombatArea{            --branco
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{1, 1, 1, 0, 0, 0, 1, 1, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
{0, 0, 0, 0, 2, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 1, 1, 0, 0, 0, 1, 1, 1},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}, 
}

	