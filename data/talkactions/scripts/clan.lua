function onSay(cid, words, param, channel)

local config = {
-- Ironhard --
["ironhard40"] = {clan = "Ironhard", cost = 40, rank = 1},
["ironhard50"] = {clan = "Ironhard", cost = 50, rank = 2},
["ironhard60"] = {clan = "Ironhard", cost = 60, rank = 3},
["ironhard70"] = {clan = "Ironhard", cost = 70, rank = 4},
["ironhard80"] = {clan = "Ironhard", cost = 80, rank = 5},
-- Malefic --
["malefic40"] = {clan = "Malefic", cost = 40, rank = 1},
["malefic50"] = {clan = "Malefic", cost = 50, rank = 2},
["malefic60"] = {clan = "Malefic", cost = 60, rank = 3},
["malefic70"] = {clan = "Malefic", cost = 70, rank = 4},
["malefic80"] = {clan = "Malefic", cost = 80, rank = 5},
-- Psycraft --
["psycraft40"] = {clan = "Psycraft", cost = 40, rank = 1},
["psycraft50"] = {clan = "Psycraft", cost = 50, rank = 2},
["psycraft60"] = {clan = "Psycraft", cost = 60, rank = 3},
["psycraft70"] = {clan = "Psycraft", cost = 70, rank = 4},
["psycraft80"] = {clan = "Psycraft", cost = 80, rank = 5},
-- Volcanic --
["volcanic40"] = {clan = "Volcanic", cost = 40, rank = 1},
["volcanic50"] = {clan = "Volcanic", cost = 50, rank = 2},
["volcanic60"] = {clan = "Volcanic", cost = 60, rank = 3},
["volcanic70"] = {clan = "Volcanic", cost = 70, rank = 4},
["volcanic80"] = {clan = "Volcanic", cost = 80, rank = 5},
-- Seavell --
["seavell40"] = {clan = "Seavell", cost = 40, rank = 1},
["seavell50"] = {clan = "Seavell", cost = 50, rank = 2},
["seavell60"] = {clan = "Seavell", cost = 60, rank = 3},
["seavell70"] = {clan = "Seavell", cost = 70, rank = 4},
["seavell80"] = {clan = "Seavell", cost = 80, rank = 5},
-- Orebound --
["orebound40"] = {clan = "Orebound", cost = 40, rank = 1},
["orebound50"] = {clan = "Orebound", cost = 50, rank = 2},
["orebound60"] = {clan = "Orebound", cost = 60, rank = 3},
["orebound70"] = {clan = "Orebound", cost = 70, rank = 4},
["orebound80"] = {clan = "Orebound", cost = 80, rank = 5},
-- Naturia --
["naturia40"] = {clan = "Naturia", cost = 40, rank = 1},
["naturia50"] = {clan = "Naturia", cost = 50, rank = 2},
["naturia60"] = {clan = "Naturia", cost = 60, rank = 3},
["naturia70"] = {clan = "Naturia", cost = 70, rank = 4},
["naturia80"] = {clan = "Naturia", cost = 80, rank = 5},
-- Raibolt --
["raibolt40"] = {clan = "Raibolt", cost = 40, rank = 1},
["raibolt50"] = {clan = "Raibolt", cost = 50, rank = 2},
["raibolt60"] = {clan = "Raibolt", cost = 60, rank = 3},
["raibolt70"] = {clan = "Raibolt", cost = 70, rank = 4},
["raibolt80"] = {clan = "Raibolt", cost = 80, rank = 5},
-- Wingeon --
["wingeon40"] = {clan = "Wingeon", cost = 40, rank = 1},
["wingeon50"] = {clan = "Wingeon", cost = 50, rank = 2},
["wingeon60"] = {clan = "Wingeon", cost = 60, rank = 3},
["wingeon70"] = {clan = "Wingeon", cost = 70, rank = 4},
["wingeon80"] = {clan = "Wingeon", cost = 80, rank = 5},
-- Gardestrike --
["gardestrike40"] = {clan = "Gardestrike", cost = 40, rank = 1},
["gardestrike50"] = {clan = "Gardestrike", cost = 50, rank = 2},
["gardestrike60"] = {clan = "Gardestrike", cost = 60, rank = 3},
["gardestrike70"] = {clan = "Gardestrike", cost = 70, rank = 4},
["gardestrike80"] = {clan = "Gardestrike", cost = 80, rank = 5}
}

local cfg = config[param]

    if not cfg then return false end

    if getPlayerItemCount(cid, 2145) >= cfg.cost then
        setPlayerClan(cid, cfg.clan)        
        setPlayerClanRank(cid, cfg.rank)
        doPlayerRemoveItem(cid, 2145, cfg.cost)
        doPlayerSendTextMessage(cid, 27, "Agora você pertence ao clan "..cfg.clan..", rank: "..cfg.rank.."")
        return true
    end
    
return true
end
