local s = {
--[action id] = {pos de volta}
[33691] = {x=453,y=1392,z=6}, -- Cinnabar
[33692] = {x=487,y=849,z=7}, -- pewter
[33693] = {x=1019,y=772,z=7}, -- cerulean
[33694] = {x=1023,y=1027,z=7}, -- saffron
[33695] = {x=1063,y=1273,z=7}, -- vermillion
[33696] = {x=1104,y=1471,z=6}, -- fuchsia
[33697] = {x=403,y=1143,z=7}, -- viridian
[33698] = {x=800,y=1037,z=6}, -- celadon
[33699] = {x=1250,y=1019,z=7}, -- Lavender
[33700] = {x=1429,y=1599,z=6}, -- Snow City
[33701] = {x=838,y=226,z=7}, -- Mandarin
[33711] = {x=269,y=1167,z=7}, -- Hammlin
[33712] = {x=246,y=1033,z=7}, -- Shamouti
[33713] = {x=257,y=1263,z=6}, -- Ascordbia
[33714] = {x=2566,y=448,z=5}, -- Vip 1
[33715] = {x=2680,y=679,z=7}, -- Vip 2
[33716] = {x=2613,y=989,z=7}, -- Vip 3
}

local b = {
--[action id] = {{pos para onde ir}, {pos de volta}},
[33702] = {{x = 149, y = 25, z = 14}, {x=1232,y=201,z=11}}, -- Clan Raibolt
[33703] = {{x = 134, y = 25, z = 14}, {x=1232,y=201,z=11}}, -- Clan Seavel
[33704] = {{x = 143, y = 25, z = 14}, {x=1232,y=201,z=11}}, -- Clan Psic --
[33705] = {{x = 155, y = 25, z = 14}, {x=1232,y=201,z=11}}, -- Clan Orebound --
[33706] = {{x = 137, y = 25, z = 14}, {x=1232,y=201,z=11}}, -- Clan Naturia
[33707] = {{x = 131, y = 25, z = 14}, {x=1232,y=201,z=11}}, -- Clan volcanic
[33708] = {{x = 146, y = 25, z = 14}, {x=1232,y=201,z=11}}, -- Clan Garden
[33709] = {{x = 152, y = 25, z = 14}, {x=1232,y=201,z=11}}, -- Clan Wingeon
[33710] = {{x = 140, y = 25, z = 14}, {x=1232,y=201,z=11}}, -- Clan Malefic
}

function onStepIn(cid, item, pos)
    if isSummon(cid) then
        return false
    end
    --
    local posi = {x=1236, y=217, z=11} --posiçao do Trade Center...
    local pos = s[item.actionid]
    local storage = 171877 
    --
    if b[item.actionid] then
        pos = b[item.actionid][2]
        posi = b[item.actionid][1] 
        storage = 171878
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