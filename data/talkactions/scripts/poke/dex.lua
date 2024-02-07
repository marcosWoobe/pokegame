function onSay(cid, words, param, channel)
    if string.find(param, 'Info') then
	    local buffer = string.explode(param, ',')
		local poke = buffer[2]
		local verif = buffer[3]
		doSendPlayerExtendedOpcode(cid, 100, getNewPokemonEvolutionDescription(poke, false, verif))
		--print(param)
	elseif string.find(param, 'Moves') then
		local buffer = string.explode(param, ',')
		local poke = buffer[2]
		local verif = buffer[3]
		doSendPlayerExtendedOpcode(cid, 100, getNewMoveDex(poke, verif)) 
	elseif string.find(param, 'Stats') then
		local buffer = string.explode(param, ',')
		local poke = buffer[2]
		local verif = buffer[3]
		doSendPlayerExtendedOpcode(cid, 100, getNewStatsDex(poke, verif))
	elseif string.find(param, 'Effectiveness') then
		local buffer = string.explode(param, ',')
		local poke = buffer[2]
		local verif = buffer[3]
		doSendPlayerExtendedOpcode(cid, 100, getNewEffectivenessDex(poke, verif)) 
	end
	--print(param)
	return true
end