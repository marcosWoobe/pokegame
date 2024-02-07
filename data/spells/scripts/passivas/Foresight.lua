function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Foresight")

return true
end