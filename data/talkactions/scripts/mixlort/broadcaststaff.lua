function onSay(cid, words, param, channel)
	if(param == '') then
		return true
	end

	if (getCreatureName(cid) == "Fallcon") then
		local texto = ("   (CEO) Fallcon:   "..param.."   ")
		doBroadcastMessageMixlort(texto)
		return true
	end

	local texto = ("Staff ("..getCreatureName(cid).."):   "..param.."")
	doBroadcastMessageStaff(texto)
end