
function onUse(cid, item, topos, item2, frompos)
--[[   local myball = getDepotItem(item.uid, 1, cid)--getContainerItem(item.uid, 1) 
print(myball.itemid)
print(myball.uid)
if isContainer(item.uid) then
print('é container gay')
print(getPlayerDepotItems(cid, 1)) ]

if item.itemid == 12355 then
doItemSetAttribute(item.uid, "depotid", 3) 
end
if item.itemid == 12354 then
doItemSetAttribute(item.uid, "depotid", 2) 
end
end]]
--print(getItemAttribute(myball.uid, "poke"))
--doItemSetAttribute(myball.uid, "boost", 100)   
--addEvent(doItemSetAttribute, 500, myball.uid, "boost", 100) 
--return true 
--doSetItemAttribute(myball.uid, "boost", boost + boosts)
end