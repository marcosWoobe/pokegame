function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Superpower")

return true
end