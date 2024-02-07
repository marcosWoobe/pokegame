function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Stunning Confusion")

return true
end