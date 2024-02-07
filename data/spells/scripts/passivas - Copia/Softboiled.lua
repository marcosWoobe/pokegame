function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Softboiled")

return true
end