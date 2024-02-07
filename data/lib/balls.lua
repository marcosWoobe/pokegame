local base = 10000
local ballsAttributes = {
    --canUsePokeball = base + 1,
    pokemonName = base + 2,
    pokemonLastHp = base + 3,
    --spellTick = base + 4,
    pokemonLevel = base + 5,
    pokemonExperience = base + 6,
    energy = base + 7,
    maxEnergy = base + 8,
    statsSleep = base + 9,
    statsPoison = base + 10,
    statsBurn = base + 11,
    statsConfuse = base + 12,
    statsLowAccuracy = base + 13,
    statsParalyzed = base + 14,
    nickname = base + 15,
    sex = base + 16,
    pokemonLastHpPercent = base + 17,
    extraPoints = base + 18,
    statsPoisonDamage = base + 19,
    statsBurnDamage = base + 20,
    statsBadPoison = base + 21,
    statsBadPoisonDamage = base + 22,
    specialAbility = base + 23,
    tm1 = base + 24,
    tm1Slot = base + 25,
    tm2 = base + 26,
    tm2Slot = base + 27,
    seal = base + 28,
    uniqueFromTm = base + 29, -- When the ball is unique because it has an unique tm
    sketchMoves = base + 30, -- String-table with all sketch moves "Tackle#Bubblebeam#Water Gun..."
    uniqueFromTmSlot1 = base + 31, -- When unique by TM on slot 1
    uniqueFromTmSlot2 = base + 32, -- When unique by TM on slot 2
    originalTrainer = base + 33, -- Only give to starter Pokemons, a safe way to check later if it really is of the trainer
    uniqueFromTournament = base + 34, -- When the ball is unique because the player enters the tournament
    --[[transformMemory1 = base + 35,
    transformMemory2 = base + 36,
    transformMemory3 = base + 37,
    transformMemory4 = base + 38,
    currentTransform = base + 40, THESE STORAGED HAS CHANGED TO FORCE A RESET IN ALL BALL'S TRANSFORMATIONS]]
    transformMemory1 = base + 41,
    transformMemory2 = base + 42,
    currentTransform = base + 43,
    totalVitamins = base + 44,
    vitaminHpUp = base + 45,
    vitaminProtein = base + 46,
    vitaminIron = base + 47,
    vitaminCalcium = base + 48,
    vitaminZinc = base + 49,
    vitaminCarbos = base + 50,
    vitaminPPUp = base + 51,
    vitaminPPMax = base + 52,
    eggMoveSlot = base + 53,
    eggMove = base + 54,
    held = base + 55,
    heldLevel = base + 56,
    heldExperience = base + 57,
    isNotPokemonFromEgg = base + 58,
    receivedEggMove = base + 59,
    lastEggMoveGenerationTry = base + 60,
    fromNpc = base + 61, -- Borrowed by NPC to quest execution
    lastLollipopReceived = base + 62,
    heldVariables = base + 63,
    eggMoveRegenerateEnabled = base + 64,
    lastEggMoveRegenerationTry = base + 65,
    eggMovesRegenerated = base + 66,
    lastEggMoveRegenerated = base + 67,
    addons = base + 68,
    addonLookType = base + 69,
    addonLookHead = base + 70,
    addonLookBody = base + 71,
    addonLookLegs = base + 72,
    addonLookFeet = base + 73,
}

balls = {
    ["poke"] = {
        useCounter = true,
        charged = 11826,
        discharged = 11828,
        empty = 11826,
        inUse = 11827,
        projectile = 65,
        effects = { use = EFFECT_POKEBALL_USE, catch = EFFECT_POKEBALL_CATCH_OK, catchMiss = EFFECT_POKEBALL_CATCH_FAIL }
    },
    ["great"] = {
        useCounter = true,
        charged = 12163,
        discharged = 12164,
        empty = 12161,
        inUse = 12162,
        projectile = PROJECTILE_GREATBALL,
        effects = { use = EFFECT_GREATBALL_USE, catch = EFFECT_GREATBALL_CATCH_OK, catchMiss = EFFECT_GREATBALL_CATCH_FAIL }
    },
    ["ultra"] = {
        useCounter = true,
        charged = 12167,
        discharged = 12168,
        empty = 12165,
        inUse = 12166,
        projectile = PROJECTILE_ULTRABALL,
        effects = { use = EFFECT_ULTRABALL_USE, catch = EFFECT_ULTRABALL_CATCH_OK, catchMiss = EFFECT_ULTRABALL_CATCH_FAIL }
    },
    ["safari"] = {
        useCounter = true,
        charged = 12171,
        discharged = 12172,
        empty = 12169,
        inUse = 12170,
        projectile = PROJECTILE_SAFARIBALL,
        effects = { use = EFFECT_SAFARIBALL_USE, catch = EFFECT_SAFARIBALL_CATCH_OK, catchMiss = EFFECT_SAFARIBALL_CATCH_FAIL }
    },
}

ballsNames = {}
for ballName, config in pairs(balls) do
    if (config.charged) then
        ballsNames[config.charged] = ballName
    end

    if (config.discharged) then
        ballsNames[config.discharged] = ballName
    end

    if (config.inUse) then
        ballsNames[config.inUse] = ballName
    end

    if (config.empty) then
        ballsNames[config.empty] = ballName
    end
end

local CATCH_RATE = {
    ["poke"] = 1,
    ["great"] = 2,
    ["ultra"] = 3,
    ["safari"] = 4,
    ["blue"] = 1,
    ["red"] = 1,
    ["yellow"] = 1,
    ["dark purple"] = 1,
    ["soul"] = 1,
    ["coloured"] = 2.5,
    ["avalanche"] = 4,
    ["blaze"] = 4,
    ["gaia"] = 4,
    ["heremit"] = 4,
    ["hurricane"] = 4,
    ["spectrum"] = 4,
    ["vital"] = 4,
    ["voltagic"] = 4,
    ["zen"] = 4,
    ["white easter"] = 1,
    ["xeeter"] = 3,
    ["christmas"] = 1,
    ["enchanted"] = 3,
}

function getBallPokemonName(uid)
    return getItemAttribute(uid, "poke")
end

function setBallStatsSleep(uid, stats)
    doItemSetAttribute(uid, ballsAttributes.statsSleep, (stats and 1 or -1))
end

function setBallStatsConfuse(uid, stats)
    doItemSetAttribute(uid, ballsAttributes.statsConfuse, (stats and 1 or -1))
end

function setBallStatsLowAccuracy(uid, stats)
    doItemSetAttribute(uid, ballsAttributes.statsLowAccuracy, (stats and 1 or -1))
end

function setBallStatsParalyzed(uid, stats)
    doItemSetAttribute(uid, ballsAttributes.statsParalyzed, (stats and 1 or -1))
end

function setBallStatsPoison(uid, stats)
    doItemSetAttribute(uid, ballsAttributes.statsPoison, (stats and 1 or -1))
end

function setBallStatsPoisonDamage(uid, damage)
    doItemSetAttribute(uid, ballsAttributes.statsPoisonDamage, damage)
end

function setBallStatsBurn(uid, stats)
    doItemSetAttribute(uid, ballsAttributes.statsBurn, (stats and 1 or -1))
end

function setBallPokemonLastHp(uid, pokemonLastHp)
    doItemSetAttribute(uid, ballsAttributes.pokemonLastHp, pokemonLastHp)
end

function setBallPokemonLastHpPercent(uid, lastHpPercent)
    doItemSetAttribute(uid, ballsAttributes.pokemonLastHpPercent, lastHpPercent)
end


-- Is
function isBall(itemid)
    return ballsNames[itemid] ~= nil
end

function isBallWithPokemon(uid)
    local ballPokemonName = getBallPokemonName(uid)
    return ballPokemonName ~= nil and ballPokemonName ~= -1
end

function isBallWithPokemonByBallId(itemId)
    local ballName = ballsNames[itemId]
    if (ballName) then
        return itemId ~= balls[ballName].empty -- is a ball and not is empty will return true
    end
    return false
end

function setBallPokemonName(uid, pokemonName)
    doItemSetAttribute(uid, 10002, pokemonName)
end

function getItemSpecialDescription(uid)
    if getItemDescriptions(uid).special == "Contains a Farfetch'd." then
        return "Contains a Farfetchd."
    else
        return getItemDescriptions(uid).special
    end
end

function getItemDescriptions(uid)
    local thing = getThing(uid)
    if(thing.itemid < 100) then
        return false
    end

    local item = getItemInfo(thing.itemid)
    return {
        name = getItemAttribute(uid, "name") or item.name,
        plural = getItemAttribute(uid, "pluralname") or item.plural,
        article = getItemAttribute(uid, "article") or item.article,
        special = getItemAttribute(uid, "description") or "",
        text = getItemAttribute(uid, "text") or "",
        writer = getItemAttribute(uid, "writer") or "",
        date = getItemAttribute(uid, "date") or 0
    }
end

function setBallPokemonLastHp(uid, pokemonLastHp)
    doItemSetAttribute(uid, ballsAttributes.pokemonLastHp, pokemonLastHp)
end

function setBallPokemonEnergy(uid, pokemonEnergy)
    doItemSetAttribute(uid, ballsAttributes.energy, pokemonEnergy)
end

function getPlayerPokemon(cid)
    return getCreatureStorage(cid, playersStorages.pokemonUid)
end