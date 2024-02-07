function onSay(cid, words, param, channel)
local param = doCorrectString(param)
local houseid = getHouseFromPos(getCreaturePosition(cid))
if param == "" then
doPlayerSendTextMessage(cid, 20, "Invalid param. The correct params are [list], [playername], [remove] or [clean]")
return true
end
if houseid and getHouseOwner(houseid) ~= getPlayerGUID(cid) then
doPlayerSendTextMessage(cid, 20, "You're not in your house")
return true
end
local house = getHouseByPlayerGUID(getPlayerGUID(cid))
local list = getHouseAccessList(house, 0x100)
if param == "List" then
local str = "Invited in your house:\n"
str = str..getHouseAccessList(house, 0x100)
if string.len(str) > 0 then
doPlayerPopupFYI(cid, str)
else
doPlayerSendTextMessage(cid, 20, "You don't have invites.")
end
elseif param == "Clean" then
setHouseAccessList(house, 0x100, "")
doPlayerSendTextMessage(cid, 20, "House invites cleaned.")
elseif (getPlayerByNameWildcard(param)) then
local t = string.explode(getHouseAccessList(house, 0x100), "\n")
if isInArray(t, param) then
doPlayerSendTextMessage(cid, 20, "This player is already invited.")
return true
end
if isPlayer(getPlayerByNameWildcard(param)) then
setHouseAccessList(house, 0x100, list.."\n"..param)
doPlayerSendTextMessage(cid, 20, param.." invited.")
else
doPlayerSendTextMessage(cid, 20, param.." isn't player or isn't online.")
end
elseif string.explode(param, ",") and string.explode(param, ",")[1] == "Remove" and isPlayer(getPlayerByNameWildcard(string.explode(param, ",")[2])) then
local ptr = getPlayerByNameWildcard(string.explode(param, ",")[2])
local invites = string.explode(getHouseAccessList(house, 0x100), "\n")
if isInArray(invites, getCreatureName(ptr)) then
for z=1, #invites do
if invites[z] == getCreatureName(ptr) then
table.remove(invites, z)
setHouseAccessList(house, 0x100, table.concat(invites, "\n"))
doPlayerSendTextMessage(cid, 20, getCreatureName(ptr).." removed from invites.")
break
end
end
else
doPlayerSendTextMessage(cid, 20, table.concat(invites, "-").." -- "..getCreatureName(ptr))
doPlayerSendTextMessage(cid, 20, "This player isn't invited.")
end
else
doPlayerSendTextMessage(cid, 20, "Invalid param. The correct params are [list], [playername], [remove] or [clean]")
end
return true
end