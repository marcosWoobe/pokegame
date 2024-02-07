function onThink(cid)

    if (#getCreatureGuardians(cid) == 1) then
        if type(getPlayerStorageValue(cid, 9006)) == "string" or getPlayerStorageValue(cid, 9005) > 0 then
            local guardian =  GUARDIAN_CONFIGS.guardians[getCreatureName(getCreatureGuardians(cid)[1])]
            doSendPlayerExtendedOpcode(cid, 164, (math.ceil(exhaustion.get(getPlayerCurrentGuardian(cid), 11) / 60) .. " Minutos|" .. guardian.outfit) )
        end
    end

return true
end