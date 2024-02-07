function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Viper's Fang")

return true
end