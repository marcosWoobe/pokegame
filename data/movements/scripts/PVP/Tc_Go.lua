local b = {
[18233] = {{x=555,y=523,z=12}, {x = 1574, y = 1523, z = 6}}, -- Tc Saffron
[18234] = {{x=555,y=523,z=12}, {x = 1964, y = 1498, z = 6}}, -- Tc Lavender
[18235] = {{x=555,y=523,z=12}, {x = 1665, y = 1795, z = 6}}, -- Tc vermilion
[18236] = {{x=555,y=523,z=12}, {x = 1653, y = 1279, z = 6}}, -- Tc Cerulean
[18237] = {{x=555,y=523,z=12}, {x = 1336, y = 1502, z = 5}}, -- Tc Celadon
[18238] = {{x=555,y=523,z=12}, {x = 1181, y = 1893, z = 6}}, -- Tc Vila Inicial
[18239] = {{x=555,y=523,z=12}, {x = 1009, y = 1639, z = 6}}, -- Tc Pallet
[18240] = {{x=555,y=523,z=12}, {x = 1093, y = 1344, z = 6}}, -- Tc Pewter
[18241] = {{x=555,y=523,z=12}, {x = 1825, y = 1974, z = 5}}, -- Tc Fuchsia 
[18242] = {{x=555,y=523,z=12}, {x = 994, y = 2204, z = 5}}, -- Tc Cinnabar
-- [18243] = {{x=555,y=523,z=12}, }, -- Tc Saffron
}

function onStepIn(cid, item, pos)
    if isSummon(cid) then
        return false
    end
    --
    local posi = {x=1236, y=217, z=11} --posiçao do Trade Center...
    local pos = b[item.actionid]
    local storage = 171880
    --
    if b[item.actionid] then
        pos = b[item.actionid][2]
        posi = b[item.actionid][1] 
        storage = 171881
    end
    setPlayerStorageValue(cid, storage, "/"..pos.x..";"..pos.y..";"..pos.z.."/")
    --
    if #getCreatureSummons(cid) >= 1 then
        for i = 1, #getCreatureSummons(cid) do
            doTeleportThing(getCreatureSummons(cid)[i], {x=posi.x - 1, y=posi.y, z=posi.z}, false)
        end
    end 
    doTeleportThing(cid, {x=posi.x, y=posi.y, z=posi.z}, false)  
    return true
end