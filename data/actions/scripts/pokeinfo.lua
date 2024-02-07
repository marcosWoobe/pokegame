Helds = {

}

--[[TokensTable = {
[1] = {nameToken = "Devoted Token", count = 20, minTier = 1, maxTier = 2, helds = {2160, 4050}},
[2] = {nameToken = "Devoted Token", count = 50, minTier = 2, maxTier = 4, helds = {2160, 4050}},
[3] = {nameToken = "Mighty Token", count = 60, minTier = 1, maxTier = 3, helds = {2160, 4050}},
[4] = {nameToken = "Mighty Token", count = 150, minTier = 2, maxTier = 5, helds = {2160, 4050}},
[5] = {nameToken = "Mighty Token", count = 300, minTier = 3, maxTier = 6, helds = {2160, 4050}},
[6] = {nameToken = "Honored Token", count = 30, minTier = 1, maxTier = 3, helds = {2160, 4050}},
[7] = {nameToken = "Honored Token", count = 75, minTier = 2, maxTier = 4, helds = {2160, 4050}},
[8] = {nameToken = "Honored Token", count = 150, minTier = 2, maxTier = 6, helds = {2160, 4050}},
[9] = {nameToken = "Conqueror Token", count = 150, minTier = 3, maxTier = 7, helds = {2160, 4050}},
}]]

--[[TokensTable = {
[4001] = {name = "Devoted Token", idToken = 10, count = 20, minTier = 1, maxTier = 2, helds = {2160, 4050}},
[4002] = {name = "Devoted Token", idToken = 10, count = 50, minTier = 2, maxTier = 4, helds = {2160, 4050}},
[4003] = {name = "Mighty Token", idToken = 10, count = 60, minTier = 1, maxTier = 3, helds = {2160, 4050}},
[4004] = {name = "Mighty Token", idToken = 10, count = 150, minTier = 2, maxTier = 5, helds = {2160, 4050}},
[4005] = {name = "Mighty Token", idToken = 10, count = 300, minTier = 3, maxTier = 6, helds = {2160, 4050}},
[4006] = {name = "Honored Token", idToken = 10, count = 30, minTier = 1, maxTier = 3, helds = {2160, 4050}},
[4007] = {name = "Honored Token", idToken = 10, count = 75, minTier = 2, maxTier = 4, helds = {2160, 4050}},
[4008] = {name = "Honored Token", idToken = 10, count = 150, minTier = 2, maxTier = 6, helds = {2160, 4050}},
[4009] = {name = "Conqueror Token", idToken = 10, count = 150, minTier = 3, maxTier = 7, helds = {2160, 4050}},
}]]

TokensTae = {
["devoted"] = 1,
["devote"] = 1,
}


function onUse(cid, item, fromPos, item2, toPos)

    local TokensList = {}
    for i=4001, 4009 do
	    local Tokens = TokensTable[i]
		if not Tokens then
		    break;
		end
		table.insert(TokensList, Tokens.count.." "..Tokens.name.." (Tier "..Tokens.minTier.."-"..Tokens.maxTier..")")        
   end	
   doPlayerSendCustomChannelList(TokensList, cid)  




























--[[if getPlayerStorageValue(cid, 54843) == -1 then
setPlayerStorageValue(cid, 54843, 0)
end

if getPlayerStorageValue(cid, 54844) == -1 then
setPlayerStorageValue(cid, 54844, 0)
end

		local stt = {}                                               --alterado v1.9 \/

		table.insert(stt, "• Attempts to catch: "..getPlayerStorageValue(cid, 54843).."\n")
		table.insert(stt, "• Successful catches: "..getPlayerSoul(cid).."\n")
		table.insert(stt, "• Failed catches: "..getPlayerStorageValue(cid, 54843) - getPlayerSoul(cid).."\n\n")
		
		table.insert(stt, "Caught Pokemon Species:\n")

local t = getCatchList(cid)

if #t <= 0 then
	table.insert(stt, "\nNone.")
	doShowTextDialog(cid, 7385, table.concat(stt))
return true
end

for b = 1, #oldpokedex do
	for a = 1, #t do
		if t[a] == oldpokedex[b][1] then
            table.insert(stt, "\n["..threeNumbers(b).."] - "..t[a].."")
		end
	end
end
		
	doShowTextDialog(cid, 7385, table.concat(stt))

]]
return true
end
