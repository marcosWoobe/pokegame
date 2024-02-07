function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Flame Rock")

return true
end