local function getRecorderPlayer(pos, cid)
    local ret = 0
    if cid and isPosEqual(getThingPos(cid), pos) then   
        return cid
    end
    local s = {}
    s.x = pos.x
    s.y = pos.y
    s.z = pos.z
        for a = 0, 255 do
            s.stackpos = a
            local b = getTileThingByPos(s).uid
            if b > 1 and isPlayer(b) and getCreatureOutfit(b).lookType ~= 814 then
                ret = b
            end
        end
    return ret
end
 
------------[[ Configurações. ]]------------
local cfg = {
    {1, {x = 1851, y = 1460, z = 13},  {x = 1896, y = 1510, z = 7}}, --  psycraft cla
    {2,  {x = 1850, y = 1458, z = 13},  {x = 1895, y = 1508, z = 7}}, --  wingeon cla
    {3,  {x = 1851, y = 1456, z = 13},  {x = 1915, y = 1683, z = 7}}, -- naturia cla
    {4,  {x = 1853, y = 1457, z = 13},  {x = 1896, y = 1506, z = 7}}, -- orebound cla
    {5,  {x = 1855, y = 1456, z = 13},  {x = 1900, y = 1506, z = 7}}, -- seavel cla
    {6, {x = 1856, y = 1457, z = 13},  {x = 1901, y = 1507, z = 7}}, -- cla de fogo
    {7,  {x = 1856, y = 1459, z = 13},  {x = 1901, y = 1509, z = 7}}, -- gardenstrike cla
    {8,  {x = 1855, y = 1460, z = 13},  {x = 1900, y = 1510, z = 7}}, -- raibolt cla 
    {9, {x = 1853, y = 1459, z = 13},  {x = 1898, y = 1509, z = 7}}, -- malefic cla
}
 
local rank = {
    need = true,      --Precisará estar em x rank? [true/sim] [false/não]
    what_rank = 5,    --Se colocar true acima, configure aqui o rank necessário.
}
-----------[[ Fim das configurações. ]]---------
 
function onUse(cid, item, frompos, item2, topos)
 local playerClan = {}
    for a, b in pairs(cfg) do
        local pos = getRecorderPlayer(b[2])
        if not isPlayer(pos) then
            return doPlayerSendCancel(cid, "One or more players aren't in the correct clan's place.")
        elseif rank.need == true then
            if getPlayerStorageValue(pos, 862281) <= (rank.what_rank - 1) then
                return doPlayerSendCancel(cid, "One or more players aren't at rank "..rank.what_rank..".")
            end
		elseif getPlayerClanNum(pos) ~= a then
		    return doPlayerSendCancel(cid, "One or more players aren't at clan error.")
        end
    end
	
    for c, d in pairs(cfg) do
        local pos = getRecorderPlayer(d[2])
        doTeleportThing(pos, d[3])
        doPlayerSendTextMessage(pos, 27, "Good luck!")
        doSendMagicEffect(getThingPos(pos), 14)
    end
    return true
end