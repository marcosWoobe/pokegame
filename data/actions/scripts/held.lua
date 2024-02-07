heldAction = {
[13011] = {name = "vitality", tier = 1},[13036] = {name = "vitality", tier = 2},[13061] = {name = "vitality", tier = 3},
[13086] = {name = "vitality", tier = 4},[13111] = {name = "vitality", tier = 5},[13136] = {name = "vitality", tier = 6},
[13161] = {name = "vitality", tier = 7},

[12991] = {name = "haste", tier = 1},[13016] = {name = "haste", tier = 2},[13041] = {name = "haste", tier = 3},
[13066] = {name = "haste", tier = 4},[13091] = {name = "haste", tier = 5},[13116] = {name = "haste", tier = 6},
[13141] = {name = "haste", tier = 7},

[12992] = {name = "defense", tier = 1},[13017] = {name = "defense", tier = 2},[13042] = {name = "defense", tier = 3},
[13067] = {name = "defense", tier = 4},[13092] = {name = "defense", tier = 5},[13117] = {name = "defense", tier = 6},
[13142] = {name = "defense", tier = 7},

[12993] = {name = "attack", tier = 1},[13018] = {name = "attack", tier = 2},[13043] = {name = "attack", tier = 3},
[13068] = {name = "attack", tier = 4},[13093] = {name = "attack", tier = 5},[13118] = {name = "attack", tier = 6},
[13143] = {name = "attack", tier = 7},

[13005] = {name = "return", tier = 1},[13030] = {name = "return", tier = 2},[13055] = {name = "return", tier = 3},
[13434] = {name = "return", tier = 4},[13105] = {name = "return", tier = 5},[13130] = {name = "return", tier = 6},
[13155] = {name = "return", tier = 7},

[13008] = {name = "poison", tier = 1},[13033] = {name = "poison", tier = 2},[13058] = {name = "poison", tier = 3},
[13083] = {name = "poison", tier = 4},[13103] = {name = "poison", tier = 5},[13113] = {name = "poison", tier = 6},
[13158] = {name = "poison", tier = 7},

[13000] = {name = "hellfire", tier = 1},[13020] = {name = "hellfire", tier = 2},[13045] = {name = "hellfire", tier = 3},
[13070] = {name = "hellfire", tier = 4},[13095] = {name = "hellfire", tier = 5},[13120] = {name = "hellfire", tier = 6},
[13145] = {name = "hellfire", tier = 7},

[13010] = {name = "elemental", tier = 1},[13035] = {name = "elemental", tier = 2},[13060] = {name = "elemental", tier = 3},
[13085] = {name = "elemental", tier = 4},[13110] = {name = "elemental", tier = 5},[13135] = {name = "elemental", tier = 6},
[13160] = {name = "elemental", tier = 7},

[13014] = {name = "critical", tier = 1},[13029] = {name = "critical", tier = 2},[13064] = {name = "critical", tier = 3},
[13089] = {name = "critical", tier = 4},[13114] = {name = "critical", tier = 5},[13139] = {name = "critical", tier = 6},
[13164] = {name = "critical", tier = 7},

[13175] = {name = "ghost", tier = 1},
}
function onUse(cid, item, frompos, item2, topos)
if not isCreature(cid) then return false end
if not isPokeball(item2.itemid) then return false end
if #getCreatureSummons(cid) >= 1 then return false end
if not pokes[getItemAttribute(item2.uid, "poke")] then return false end
poke = getItemAttribute(item2.uid, "poke")
if getItemAttribute(item2.uid, "nick") then
poke = getItemAttribute(item2.uid, "nick")
end
if not heldAction[item.itemid] then return false end
heldA = heldAction[item.itemid]

doItemSetAttribute(item2.uid, "heldName", heldA.name)
doItemSetAttribute(item2.uid, "heldTier", heldA.tier)
doItemSetAttribute(item2.uid, "heldId", item.itemid)
doPlayerSendTextMessage(cid, 27, "Your "..poke.." received a "..getItemInfo(item.itemid).name..".")
doRemoveItem(item.uid)
return true
end