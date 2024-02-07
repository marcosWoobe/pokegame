function doStartAutoWalk(cid)
	if not isCreature(cid) or getPlayerStorageValue(cid, 10000) == -1 then return end

	local toPosition = getCreatureLookPosition(cid)
		toPosition.stackpos = 0
	local tileId = getTileThingByPos(toPosition).itemid

	if tileId > 0 and doTileQueryAdd(cid, toPosition) ~= RETURNVALUE_NOERROR then
		setPlayerStorageValue(cid, 10000, -1)
		return  
	end

	doMoveCreature(cid, getCreatureLookDir(cid))
	--walkToPos(cid, toPosition, false)
	--doTeleportThing(cid, toPosition, false)
	addEvent(doStartAutoWalk, 500000 / getCreatureSpeed(cid), cid)
end

function onSay(cid, words, param, channel)
	if getPlayerStorageValue(cid, 10000) ~= -1 then
		setPlayerStorageValue(cid, 10000, -1)
	else
		setPlayerStorageValue(cid, 10000, 1)
		doStartAutoWalk(cid)
	end
	return true
end