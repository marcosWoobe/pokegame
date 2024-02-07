function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Counter Helix")

return true
end