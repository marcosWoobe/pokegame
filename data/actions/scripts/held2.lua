heldAction = {
[13080] = {name = "return", tier = 4}
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