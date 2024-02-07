local focus = 0
local talk_start = true
local talkState = {}

function onCreatureSay(cid, type, msg)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
return true
end


--///////////////////////////////////////////////////////////////////////////////////////////////////////--
function doPushPoke(uid,direction,distance,time)
   if isCreature(uid) == TRUE then
    local rand = math.random(0,1)
	local a = -1
	if rand == 1 then
	    a = 1
	end
	local pos = getThingPos(uid)
	local newpos = pos
	local randd = math.random(0,1)
	if randd == 1 then 
	    newpos = {x=pos.x+a,y=pos.y,z=pos.z,stackpos=0}
	else
	    newpos = {x=pos.x,y=pos.y+a,z=pos.z,stackpos=0} 
	end
	local newpos1 = {x = newpos.x, y = newpos.y, z = newpos.z, stackpos = 1}  
    --if getTileThingByPos(newpos).uid ~= 0 and canWalkOnPos(newpos, true, false, true, true, false) then 
	    if not (getTileInfo(newpos).house) or getTileThingByPos(newpos1).itemid > 100 and getTileThingByPos(newpos1).uid > 0 and hasProperty(getTileThingByPos(newpos1).uid, 0) == true then
		    addEvent(doPushPoke,500,uid,math.random(0, 3),distance,time)
		else
            --getCreaturePathTo(uid, newpos, 12)
			doTeleportThing(uid,newpos,TRUE)
		end
	--end
	end
                                                                                                                   --alterado v1.5
end


function PokeMove(cid)
if not isCreature(cid) then return true end
doPushPoke(cid, math.random(0, 3), 1, 0)  -- essa dopush é aquela mesma função que mandei pro bixo andar, porem dentro do arquivo onde tudo acontece.
--selfSay("Good bye and keep training!")
addEvent(PokeMove, 2000, cid)
end


function onThink()
	--doSendAnimatedText(getThingPos(getThis()), getCreatureName(getThis()), 215)
	if talk_start then
		PokeMove(getThis())
		talk_start = false
	end

	if not (getTileInfo(getThingPos(getNpcCid())).house) then
		focus = 0
		--deletePokeFile(PlayerN)
		return doRemoveCreature(getNpcCid())
	end

end