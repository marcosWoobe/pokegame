function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Insomnia")

return true
end