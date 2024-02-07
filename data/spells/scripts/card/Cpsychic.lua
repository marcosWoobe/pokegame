function onCastSpell(cid, var)

local min, max = -150000, -350000	

    posC = getThingPosWithDebug(cid) PosC = posC PosCid = posC posCid = posC
    posC1 = getThingPosWithDebug(cid) posC1.x = posC1.x+1 posC1.y = posC1.y+1 PosC1 = posC1 posCid1 = posC1 PosCid1 = posC1

	addEvent(doSendMagicEffect, 1, PosCid1, 397)
	addEvent(formaCertadeusarADDEVENT, 110 ,cid, PSYCHICDAMAGE, getThingPosWithDebug(cid), selfArea2, min, max, 429)
    return true
end

function formaCertadeusarADDEVENT(cid, type, pos, area, min, max, effect)
	if isCreature(cid) then
		doAreaCombatHealth(cid, type, pos, area, min, max, effect)
	end
end	

