function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Absolute Zero")

return true
end