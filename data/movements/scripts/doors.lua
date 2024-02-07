local doors = {14494, 14493, 14492, 15223}
local door_pos = {x=1026,y=1030,z=7}
local top_left = {x = door_pos.x - 3, y = door_pos.y - 2, z = door_pos.z}
local bottom_right = {x = door_pos.x, y = door_pos.y + 2, z = door_pos.z}

local function areThereCreaturesInArea(top_left, bottom_right)	
	for x = top_left.x, bottom_right.x do		
		for y = top_left.y, bottom_right.y do			
			if isCreature(getTopCreature({x=x, y=y, z=top_left.z}).uid) then				
				return true 
			end		
		end	
	end		
	return false 
end

local function open(pos, i)
	if i < #doors then	
		current = doors[i]	next_ = doors[i+1]	
		local door = getTileItemById(pos, current)	
		if door.uid > 0 then		
			doTransformItem(door.uid, next_)		
			addEvent(open, 200, pos, i+1)	
		end
	end	
end

local function close_(pos, i)
	if areThereCreaturesInArea(top_left, bottom_right) then	
		return true
	end
	
	if i <= #doors and i > 1 then	
		current = doors[i]	next_ = doors[i-1]		
		local door = getTileItemById(pos, current)	
		if door.uid > 0 then		
			doTransformItem(door.uid, next_)		
			addEvent(close_, 200, pos, i-1)	
		end
	end	
end

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)	
	for i = 1, #doors do		
		local door = getTileItemById(door_pos, doors[i])		
		if door.uid > 0 then			
			open(door_pos, i)			
			break		
		end	
	end	
	return true
end

function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)	
	close_(door_pos, #doors)	
	return true 
end