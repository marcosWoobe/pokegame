local target = 0
local prevTarget = 0
local origPos = 0
local max_distance = 12
local fighting = false
local challenger = 0
local battle_turn = 1		-- don't change
local challenger_turn = 0	-- don't change
---
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
local function updateTarget()
    --if(target == 0) then
        local list = getSpectators(getNpcPos(), 5, 5, false)
        for i = 1, table.getn(list) do
            local _target = list[i]
            if(_target ~= 0) then
                if isPlayer(_target) and not getTileInfo(getThingPos(_target)).protection then --alterado v1.8
                    selfSay("You will be killed by yourself! o.O")
                    --doClone(_target, getNpcCid())
                    doNpcSetCreatureFocus(_target) 
                    target = _target
                    prevTarget = target
                    break
               end
            end
        end
    --end
end
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--		
function onCreatureAppear(cid)
end

function onCreatureDisappear(cid)
end

function onCreatureMove(creature, oldPos, newPos)
--
end
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////--
function onThink()
    if not isCreature(getNpcCid()) then return false end --alterado v1.6
    updateTarget()  
    ------------------------------------------------------
------------------------------------------------------
    if(target == 0) then
        if getPlayerStorageValue(getNpcCid(), 154788) <= 0 then
            setPlayerStorageValue(getNpcCid(), 154788, 1)
            doChangeSpeed(getNpcCid(), -getCreatureSpeed(getNpcCid()))
            addEvent(randWalk, 2000, getNpcCid(), 1000, getPlayerStorageValue(getNpcCid(), 154788))
        end
        return true
    end 
-----------------------------------------------------
    local playerPos = getThingPosWithDebug(target)   --alterado v1.6
    local myPos = getNpcPos()
-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------
    if getDistanceBetween(playerPos, myPos) >= 5 then
	    target = 0
		updateTarget() 
    end
-----------------------------------------------------
    if getDistanceBetween(playerPos, myPos) <= 5 then

        if not isCreature(target) then
            target = 0
            return true
        end

        if isCreature(target) then   
		    local pos = {x = 699, y = 1680, z = 13}
	        doTeleportThing(target, pos)
			target = 0
			updateTarget()
        end
    end
end