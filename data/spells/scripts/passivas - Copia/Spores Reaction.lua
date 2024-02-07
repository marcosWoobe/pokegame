function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Spores Reaction")

return true
end