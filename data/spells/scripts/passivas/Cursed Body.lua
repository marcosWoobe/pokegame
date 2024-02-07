function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Cursed Body")

return true
end