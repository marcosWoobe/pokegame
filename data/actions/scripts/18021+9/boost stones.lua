ultraBoost = 14661
function onUse(cid, item, frompos, item2, topos)
boost = 5
color = 215

if item2.itemid <= 0 or not isPokeball(item2.itemid) then return false end
if #getCreatureSummons(cid) >= 1 then
doPlayerSendCancel(cid, "Return your pokemon to use this item")
return false
end

if item.itemid == ultraBoost then
boost = 50
color = COLOR_ELECTRIC
end

ballBoost = getItemAttribute(item2.uid, "boost") or 0
newBoost = ballBoost + boost
if ballBoost >= 50 then 
doPlayerSendCancel(cid, "You can't use this item with your current boost")
return false
end

if newBoost >= 50 then
	newBoost = 50
end

doPlayerSendTextMessage(cid, 27, "Your pokemon boost is now +"..newBoost..".")
doItemSetAttribute(item2.uid, "boost", newBoost)
doSendAnimatedText(getThingPos(cid), "BOOST", color)
doRemoveItem(item.uid, 1)
return true
end
