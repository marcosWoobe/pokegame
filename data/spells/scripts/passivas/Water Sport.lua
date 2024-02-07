function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Water Sport")

return true
end