function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Mega Drain")

return true
end