function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Counter Spin")

return true
end