function onEquip (cid, item, slot)

	if not cid then return true end
	if item.uid <= 0 or not item then return true end

	if not getItemAttribute(item.uid, "poke") then
	return true
	end
    
	for i, x in pairs(fotos) do
		if string.lower(getItemAttribute(item.uid, "poke")) == string.lower(i) then
		    if getItemAttribute(item.uid, "ehditto") and (getItemAttribute(item.uid, "ehditto") == "Ditto" or getItemAttribute(item.uid, "ehditto") == "Shiny Ditto") then
				doTransformItem(getPlayerSlotItem(cid, 7).uid, 12120)
			else
			    doTransformItem(getPlayerSlotItem(cid, 7).uid, fotos[i])
				-- doUpdatePokeInfo(cid)
				-- doPokeInfoAttr(cid)
			end
		--doUpdateStatusPoke(cid)
		return true
		end
	end
end

function onDeEquip(cid, item, slot)

	if not cid then return true end
	if item.uid <= 0 or not item then return true end

	if not getItemAttribute(item.uid, "poke") then
	return true
	end
	--doUpdateStatusPoke(cid)
	doTransformItem(getPlayerSlotItem(cid, CONST_SLOT_LEGS).uid, 2395)
end