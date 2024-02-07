GUARDIAN_CONFIGS = {
    exhaustion_minutes = 280,
    guardians = {
       ["Venusaur"] = {storage = 1781, minutos = 40, outfit = 373},
       ["Raichu"] = {storage = 1782, minutos = 40, outfit = 401},
       ["Gengar"] = {storage = 1783, minutos = 40, outfit = 595},
       ["Jynx"] = {storage = 1784, minutos = 40, outfit = 633},
       ["Magmar"] = {storage = 1785, minutos = 40, outfit = 427},
       ["Gyarados"] = {storage = 1786, minutos = 40, outfit = 468},
       ["Alakazam"] = {storage = 1787, minutos = 40, outfit = 569},
       ["Onix"] = {storage = 1788, minutos = 40, outfit = 599},

       ["Shiny Venusaur"] = {storage = 1789, minutos = 40, outfit = 1197},
       ["Shiny Raichu"] = {storage = 1790, minutos = 40, outfit = 1220},
       ["Shiny Gengar"] = {storage = 1791, minutos = 40, outfit = 1288},
       ["Shiny Jynx"] = {storage = 1792, minutos = 40, outfit = 1318},
       ["Shiny Magmar"] = {storage = 1793, minutos = 40, outfit = 1503},
       ["Shiny Gyarados"] = {storage = 1794, minutos = 40, outfit = 1324},
       ["Shiny Alakazam"] = {storage = 1795, minutos = 40, outfit = 1259},
       ["Shiny Onix"] = {storage = 1796, minutos = 40, outfit = 643},       
    }
}

local EFFECTS = {
    ["Venusaur"] = 496,
    ["Raichu"] = 1030,
    ["Gengar"] = 136,
    ["Jynx"] = 52,
    ["Magmar"] = 704,
    ["Gyarados"] = 154,
    ["Alakazam"] = 817,
    ["Onix"] = 782,

    ["Shiny Venusaur"] = 496,
    ["Shiny Raichu"] = 1030,
    ["Shiny Gengar"] = 136,
    ["Shiny Jynx"] = 52,
    ["Shiny Magmar"] = 704,
    ["Shiny Gyarados"] = 154,
    ["Shiny Alakazam"] = 817,
    ["Shiny Onix"] = 782
}   

function getPlayerCurrentGuardian(cid)
    if isPlayer(cid) and #getCreatureGuardians(cid) > 0 then
        for i = 1, #getCreatureGuardians(cid) do
            if isCreature(getCreatureGuardians(cid)[i]) and getCreatureStorage(getCreatureGuardians(cid)[i], 10) == "guardian" then
                return getCreatureGuardians(cid)[i]
            end
        end
    end
    return false
end

function doRemoveGuardian(cid)
    if isCreature(cid) and isPlayer(getCreatureMaster(cid)) then
        doPlayerSendTextMessage(getCreatureMaster(cid), 27, "Seu guardiao foi removido.")
        doPlayerSetStorageValue(getCreatureMaster(cid), 9005, 0)
        doPlayerSetStorageValue(getCreatureMaster(cid), 9006, 0)
        doSendPlayerExtendedOpcode(getCreatureMaster(cid), 164, "close")
        doSendMagicEffect(getThingPos(cid), 2)
        doRemoveCreature(cid, true)
    end
    return true
end

function adjustGuardianPoke(cid, optionalLevel, guardian_name, player) --Guardian
    
if isCreature(getPlayerCurrentGuardian(cid)) then
return false
end

local guardian =  GUARDIAN_CONFIGS.guardians[guardian_name]
    if isCreature(cid) and pokes[getCreatureName(cid)] then
        if guardian then
            local pk = cid
            if EFFECTS[getCreatureName(pk)] then            
                markPosEff(pk, getThingPos(pk))
                sendMovementEffect(pk, EFFECTS[getCreatureName(pk)], getThingPos(pk))  
            end

            local Stats = pokes[guardian_name]
            local offenseStat = (Stats.offense)
            local defenseStat = (Stats.defense)
            local agilityStat = (Stats.agility)
            local vitalityStat = (Stats.vitality)
            local specialAtkStat = (Stats.specialattack)
            ---------------------------------------------------------

            local levelPlayer = 75
            local levelPokeMix = 35
            
            local PokeAttack =   ( ( offenseStat*levelPlayer ) ) / 10
            local PokeDefense =  defenseStat
            local PokeSpeed =    agilityStat*2
            local HP =           3000000
            local PokeSpAttack = ( ( ( ( specialAtkStat * levelPokeMix ) + levelPlayer ) ) * 1.45 )

            setPlayerStorageValue(cid, 1001, PokeAttack)
            setPlayerStorageValue(cid, 1002, PokeDefense)
            setPlayerStorageValue(cid, 1003, PokeSpeed)
            setPlayerStorageValue(cid, 1004, HP)
            setPlayerStorageValue(cid, 1005, PokeSpAttack)

            doRegainSpeed(cid)
            setCreatureMaxHealth(cid, getVitality(cid))
            doCreatureAddHealth(cid,  getCreatureMaxHealth(cid))

            doCreatureSetStorage(cid, 10, "guardian")
            exhaustion.set(cid, 11, guardian.minutos * 60)
            if getPlayerStorageValue(player, 9005) and getPlayerStorageValue(player, 9005) > 0 then
                exhaustion.set(cid, 11, getPlayerStorageValue(player, 9005))
            end
            exhaustion.set(player, guardian.storage, GUARDIAN_CONFIGS.exhaustion_minutes * 60)
            addEvent(doRemoveGuardian, exhaustion.get(cid, 11) * 1000, cid)

            local Player = getCreatureMaster(cid)
            doPlayerSendTextMessage(Player, 27, "Seu Guardian Possui (" .. math.ceil(exhaustion.get(getPlayerCurrentGuardian(Player), 11) / 60) .. ") Minutos Restantes.")
            doPlayerSetStorageValue(Player, 9005, exhaustion.get(getPlayerCurrentGuardian(Player), 11))
            doPlayerSetStorageValue(Player, 9006, getCreatureName(getPlayerCurrentGuardian(Player)))
            doSendPlayerExtendedOpcode(Player, 164, (math.ceil(exhaustion.get(cid, 11) / 60) .. " Minutos|" .. guardian.outfit) )

            doCreatureSetNick(getPlayerCurrentGuardian(Player), ("[Guardian] "..getCreatureName(getPlayerCurrentGuardian(Player))))
        end
    end
end