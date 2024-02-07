function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Thick Fat")

return true
end