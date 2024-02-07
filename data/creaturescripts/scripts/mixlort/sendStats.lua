function onThink(cid)
	target = getCreatureTarget(cid)
	if isCreature(target) then
		doSendPlayerExtendedOpcode(cid, 57,  getCreatureName(target):lower().."|"..getCreatureHealth(target).."|"..getCreatureMaxHealth(target))
	else
		doSendPlayerExtendedOpcode(cid, 57,  "nothing|0|0")
	end
end