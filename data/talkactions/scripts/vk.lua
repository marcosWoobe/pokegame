local function onPokeBarLife(cid)
    if isSummon(cid) and isPlayer(getCreatureMaster(cid)) then
        local itemBall = getPlayerSlotItem(getCreatureMaster(cid), CONST_SLOT_FEET)
        local hp = math.ceil((getCreatureHealth(cid) * 100) / getCreatureMaxHealth(cid))
        local orde = getItemAttribute(itemBall.uid, "ballorder")
        doPlayerSendCancel(getCreatureMaster(cid), "pGS,"..hp.."|"..orde)
-- print(hp)
    end
end
 

function onSay(cid, words, param, channel)
--print(getPlayerExperience(cid))   
--print(getPlayerExperienceLevel(cid, getPlayerLevel(cid)+1))    
    if not isNumber(param) and param ~= "" then
	    doPlayerSendCancel(cid, "Sorry, use interface client.")
		return true
	end
	if words == "!autolootadd" and param ~= "" then
	    if doPlayerGetAutoLootItem(cid, param) then
            doPlayerSendCancel(cid, "You're already autolooting this item.")
            return true 
        end
		
        doPlayerAddAutoLootItem(cid, param)
		--doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You're now auto looting " .. param)
	elseif words == "!autolootremove" and param ~= "" then
	    if doPlayerGetAutoLootItem(cid, param) then
            doPlayerRemoveAutoLootItem(cid, param) 
           -- doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You're not auto looting " .. param .. " anymore.")
        else
            doPlayerSendCancel(cid, "You're not autolooting this item.") 
        end
		
       
	elseif words == "!autolootlist" then 
        local list = ""-- "You're auto looting: "
        local alist = getPlayerAutoLootList(cid)
 
        if alist then
		    list = list .. getItemInfo(getPlayerAutoLootList(cid)[1]).name
            for i = 2, #getPlayerAutoLootList(cid) do
                --list = list .. getItemInfo(getPlayerAutoLootList(cid)[i]).name .. ", "
				list = list..","..getItemInfo(getPlayerAutoLootList(cid)[i]).name
            end
        else
            doPlayerSendCancel(cid, "The list is empty.") 
            return true 
        end
        --doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, list:sub(1, -3))
		--doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, list)
		doSendPlayerExtendedOpcode(cid, 140, list)
	end
	return true
end
