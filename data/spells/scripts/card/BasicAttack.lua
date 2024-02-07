function onCastSpell(cid, var)

local min, max = -750, -2500

	doTargetCombatHealth(cid, getCreatureTarget(cid), PSYCHICDAMAGE, min, max, 2)		
    return true
end