function onSay(cid, words, param, channel)

    local pk = getCreatureSummons(cid)[1]
    if pk then

	    local pb = getPlayerSlotItem(cid, 8).uid
		if not pb then
		    doPlayerSendTextMessage(cid, 27, "You need have a pokemon in slot ball.")
		    return true
		end
	    if getItemAttribute(pb, "ehditto") == "Ditto" and getItemAttribute(pb, "poke") ~= "Ditto" or getItemAttribute(pb, "ehditto") == "Shiny Ditto" and getItemAttribute(pb, "poke") ~= "Shiny Ditto" then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "Sorry, revert your "..getItemAttribute(pb, "ehditto")..".")
            return true
		end
        --print(getItemAttribute(thisball.uid, "addonNow")) 
        --print(getOutfit(cid, getCreatureName(pk))) 
        setPokeAddon(cid, pk)
    else
        doPlayerSendTextMessage(cid, 27, "You need have a pokemon.")
    end
	
    return true
end

