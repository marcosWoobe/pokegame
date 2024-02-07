function onCastSpell(cid, var)
    if isNpc(cid) then
        if #getCreatureSummons(getNpcMaster(cid)) > 0 then
            doTargetCombatHealth(getCreatureSummons(getNpcMaster(cid))[1], getCreatureTarget(cid), PSYCHICDAMAGE, -1000, -3500, 429)
            return true
        end
    end
    doTargetCombatHealth(cid, getCreatureTarget(cid), PSYCHICDAMAGE, -1000, -3500, 429)
    return true
end