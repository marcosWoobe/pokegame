function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Evasion")

return true
end