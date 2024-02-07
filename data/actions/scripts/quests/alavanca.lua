function onUse (cid,item,frompos,item2,topos)
    if item.uid == 65008 then
--[[	{x = 1256, y = 975, z = 9}
{x = 1256, y = 976, z = 9}
{x = 1256, y = 977, z = 9}
{x = 1256, y = 978, z = 9}
{x = 1256, y = 979, z = 9}
===  LOCAL DE IDA ===
{x = 1227, y = 832, z = 8}]]
	    local pos1 = {x = 1256, y = 975, z = 9}
		local pos2 = {x = 1256, y = 976, z = 9}
		local pos3 = {x = 1256, y = 977, z = 9}
		local pos4 = {x = 1256, y = 978, z = 9}
		local pos5 = {x = 1256, y = 979, z = 9}
		local posQuest = {x = 1227, y = 832, z = 8}
		if getThingPos(cid).x ~= pos1.x or getThingPos(cid).y ~= pos1.y or getThingPos(cid).z ~= pos1.z then
		    doPlayerSendTextMessage(cid, 22, "Porfavor vá para a primeira posição!")
		    return false
		end
	    if not isCreature(getRecorderPlayer(pos1)) then
		    doPlayerSendTextMessage(cid, 22, "Desculpe mas é necessario 5 pessoas!")
		    return false
		elseif not isCreature(getRecorderPlayer(pos2)) then
		    doPlayerSendTextMessage(cid, 22, "Desculpe mas é necessario mais 4 pessoas!")
		    return false
		elseif not isCreature(getRecorderPlayer(pos3)) then
		    doPlayerSendTextMessage(cid, 22, "Desculpe mas é necessario mais 3 pessoas!")
		    return false
		elseif not isCreature(getRecorderPlayer(pos4)) then
		    doPlayerSendTextMessage(cid, 22, "Desculpe mas é necessario mais 2 pessoas!")
		    return false
		elseif not isCreature(getRecorderPlayer(pos5)) then
		    doPlayerSendTextMessage(cid, 22, "Desculpe mas é necessario mais 1 pessoas!")
		    return false
		end
		
		doTeleportThing(getRecorderPlayer(pos1), posQuest, false)
		doTeleportThing(getRecorderPlayer(pos2), posQuest, false)
		doTeleportThing(getRecorderPlayer(pos3), posQuest, false)
		doTeleportThing(getRecorderPlayer(pos4), posQuest, false)
		doTeleportThing(getRecorderPlayer(pos5), posQuest, false) 
    end
return 1
end