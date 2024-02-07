local symbols = {"*", "^", "¿", "%", "&", "$"}
 

local timeBetweenQuestion = 180 * 60 --15 minutes

local timeToKick = 5 * 60 --2 minutes

local timeStorage = 65117

local codeStorage = 65118

local kickStorage = 65119

local timesStorage = 65121

 

function onThink(cid, interval)

-- if not isPlayer(cid) or getPlayerGroupId(cid) >= 3 then
if not isPlayer(cid) then

return

end

 

if getCreatureStorage(cid, timeStorage) < 1 then doCreatureSetStorage(cid, timeStorage, os.time() + timeBetweenQuestion) end

 

if getCreatureStorage(cid, kickStorage) > 0 and os.time() >= getCreatureStorage(cid, kickStorage) then

local tmp = {timeStorage, kickStorage, timesStorage, codeStorage}

for i = 1, #tmp do

doCreatureSetStorage(cid, tmp[i], 0)

end

return doRemoveCreature(cid)

end

 

if os.time() >= getCreatureStorage(cid, timeStorage) then

local code, set = "", 0

set = math.random(1, 100000)

local s, e = 1, 1

for i = 1, string.len(set) do

code = (code == "" and string.sub(set, s, e) or code .. symbols[math.random(#symbols)] .. string.sub(set, s, e))

s, e = s + 1, e + 1

end

 

doCreatureSetStorage(cid, codeStorage, set)

doCreatureSetStorage(cid, kickStorage, os.time() + timeToKick)

doCreatureSetStorage(cid, timeStorage, os.time() + timeBetweenQuestion)

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Antibot]: Please say !antibot " .. code .. " without symbols. Ex: code: 1*5^8¿6%9 -> !antibot 15869. Remember that you have " .. timeToKick / 60 .. " minutes to do that or you will be kicked.")
doPlayerPopupFYI(cid, "[Antibot]: Please say !antibot " .. code .. " without symbols. Ex: code: 1*5^8¿6%9 -> !antibot 15869. Remember that you have " .. timeToKick / 60 .. " minutes to do that or you will be kicked.")

end

return

end