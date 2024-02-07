function onSay(cid, words, param, channel)
	local buffer = string.explode(param, ',')
    local slot = buffer[1]
    local new = buffer[2]
	if tonumber(new) > getPlayerFreeCap(cid) then
	    -- doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "limiti")
        if #getCreatureSummons(cid) >= 1 then
			local item = getPlayerSlotItem(cid, 8)
			doPlayerSendCancel(cid, "KGT,"..getItemAttribute(item.uid, "ballorder").."|".."0")
			doPlayerSendCancel(cid, "")
		end
		return true
	end
	if tonumber(new) < 1 or tonumber(new) > 6 then
	    -- doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "error: "..slot..' '..new)
        if #getCreatureSummons(cid) >= 1 then
			local item = getPlayerSlotItem(cid, 8)
			doPlayerSendCancel(cid, "KGT,"..getItemAttribute(item.uid, "ballorder").."|".."0")
			doPlayerSendCancel(cid, "")
		end
		return true
	end
	if tonumber(slot) < 1 or tonumber(slot) > 6 then
	    -- doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "error: "..slot..' '..new)
        if #getCreatureSummons(cid) >= 1 then
			local item = getPlayerSlotItem(cid, 8)
			doPlayerSendCancel(cid, "KGT,"..getItemAttribute(item.uid, "ballorder").."|".."0")
			doPlayerSendCancel(cid, "")
		end
		return true
	end
	if setEditMode(cid, slot, new) then
	    -- doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sucesso"..slot..' '..new)
        if #getCreatureSummons(cid) >= 1 then
			local item = getPlayerSlotItem(cid, 8)
			doPlayerSendCancel(cid, "KGT,"..getItemAttribute(item.uid, "ballorder").."|".."0")
			doPlayerSendCancel(cid, "")
		end
	end
	return true
end