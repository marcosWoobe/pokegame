storagesDuel = {52480, 52481, 52482, 52482, 52483, 52484, 52485, 6598754}

function doTimeDuel(cid)
if not isPlayer(cid) then return true end
if getPlayerStorageValue(cid, 84911) == 1 then
return addEvent(timeDuel, 18000, cid)
end
end	
function timeDuel(cid)
if not isPlayer(cid) then return true end
if #getCreatureSummons(cid) == 0 then
return doCancelDuel(cid)
end
end	

function checkDuel(cid)
if getPoDuel(cid) == 0 then return true end
if getPoDuel(cid) >= 1 then
   setPoDuel(cid, getPoDuel(cid)-1)
   doSendAnimatedText(getThingPosWithDebug(cid), "POKE DOWN", 65)
end
if getPoDuel(cid) == 0 then
   doCancelDuel(cid)
   else
   doTimeDuel(cid)
end
return true
end
--/////////////////////////////////////////////////////////////////////////////////////////////--
