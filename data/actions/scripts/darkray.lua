
function onUse(cid, item, topos, item2, frompos)
    

 local pos = {
		{x = 451, y = 236, z = 12},
		{x = 455, y = 236, z = 12},
		{x = 460, y = 236, z = 12},
	}
	
	local uid = doCreateNpc("Darkray", pos[math.random(#pos)], false)
	addEvent(doRemoveCreature, 30000, uid)  
end