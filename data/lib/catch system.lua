failmsgs = {
	"Sorry, you didn't catch that pokemon.",
	"Sorry, your pokeball broke.",
	"Sorry, the pokemon escaped.",
}

function doBrokesCount(cid, str, ball) --alterado v1.9 \/
	if not isCreature(cid) then return false end
	local tb = {
		{b = "poke", v = 0},
		{b = "great", v = 0},
		{b = "super", v = 0},
		{b = "ultra", v = 0},
		{b = "saffari", v = 0},
		{b = "dark", v = 0},
		{b = "magu", v = 0},
		{b = "sora", v = 0},
		{b = "yume", v = 0},
		{b = "dusk", v = 0},
		{b = "tale", v = 0},
		{b = "moon", v = 0},
		{b = "net", v = 0},
		{b = "premier", v = 0},
		{b = "tinker", v = 0},
		{b = "fast", v = 0},
		{b = "heavy", v = 0},
	}
	for _, e in ipairs(tb) do
		if e.b == ball then
			e.v = 1
			break
		end
	end
	local strings = getPlayerStorageValue(cid, str)
	
	local t = "normal = (.-), great = (.-), super = (.-), ultra = (.-), saffari = (.-), dark = (.-), magu = (.-), sora = (.-), yume = (.-), dusk = (.-), tale = (.-), moon = (.-), net = (.-), premier = (.-), tinker = (.-), fast = (.-), heavy = (.-);"
	local t2 = ""
	for n, g, s, u, s2, d, magu, sora, yume, dusk, tale, moon, net, premier, tinker, fast, heavy in strings:gmatch(t) do
		t2 = "normal = "..(n+tb[1].v)..", great = "..(g+tb[2].v)..", super = "..(s+tb[3].v)..", ultra = "..(u+tb[4].v)..", saffari = "..(s2+tb[5].v)..", dark = "..(d+tb[6].v)..", magu = "..(magu+tb[7].v)..", sora = "..(sora+tb[8].v)..", yume = "..(yume+tb[9].v)..", dusk = "..(dusk+tb[10].v)..", tale = "..(tale+tb[11].v)..", moon = "..(moon+tb[12].v)..", net = "..(net+tb[13].v)..", premier = "..(premier+tb[14].v)..", tinker = "..(tinker+tb[15].v)..", fast = "..(fast+tb[16].v)..", heavy = "..(heavy+tb[17].v)..";" 
	end
	
	setPlayerStorageValue(cid, str, strings:gsub(t, t2))
end

function sendBrokesMsg2(cid, name, str, catched)      

if not isCreature(cid) then return false end

local storage = getPlayerStorageValue(cid, str)

if storage == -1 then
   return sendMsgToPlayer(cid, 27, "Você ainda não gastou nenhuma ball para capturar esse pokemon!")
end

local t = "normal = (.-), great = (.-), super = (.-), ultra = (.-), vball = (.-), saffari = (.-), dark = (.-), magu = (.-), sora = (.-), yume = (.-), dusk = (.-), tale = (.-), moon = (.-), net = (.-), premier = (.-), tinker = (.-), fast = (.-), heavy = (.-);"
local msg = {}
local countN, countG, countS, countU, countV, countS2 = 0, 0, 0, 0, 0, 0
local maguCount, soraCount, yumeCount, duskCount, taleCount, moonCount, netCount, premierCount, tinkerCount, fastCount, heavyCount = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

table.insert(msg, "Você ja gastou: ")

for n, g, s, u, v, s2, d, magu, sora, yume, dusk, tale, moon, net, premier, tinker, fast, heavy in storage:gmatch(t) do
    if tonumber(n) and tonumber(n) > 0 then 
       table.insert(msg, tostring(n).." Poke ball".. (tonumber(n) > 1 and "s" or "")) 
	   countN = tonumber(n)
    end
    if tonumber(g) and tonumber(g) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(g).." Great ball".. (tonumber(g) > 1 and "s" or "")) 
	   countG = tonumber(g)
    end
	if tonumber(s) and tonumber(s) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(s).." Super ball".. (tonumber(s) > 1 and "s" or "")) 
	   countS = tonumber(s)
    end
    if tonumber(u) and tonumber(u) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(u).." Ultra ball".. (tonumber(u) > 1 and "s" or "")) 
	   countU = tonumber(u)
    end
    if tonumber(v) and tonumber(v) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(u).." Vball".. (tonumber(v) > 1 and "s" or "")) 
	   countV = tonumber(v)
    end
    if tonumber(s2) and tonumber(s2) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(s2).." Saffari ball".. (tonumber(s2) > 1 and "s" or "")) 
	   countS2 = tonumber(s2)
    end
	
	if tonumber(magu) and tonumber(magu) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(magu).." Magu ball".. (tonumber(magu) > 1 and "s" or "")) 
	   maguCount = tonumber(magu)
    end
	
	if tonumber(sora) and tonumber(sora) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(sora).." Sora ball".. (tonumber(sora) > 1 and "s" or "")) 
	   soraCount = tonumber(sora)
    end
	
	if tonumber(yume) and tonumber(yume) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(yume).." Yume ball".. (tonumber(yume) > 1 and "s" or "")) 
	   yumeCount = tonumber(yume)
    end
	
	if tonumber(dusk) and tonumber(dusk) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(dusk).." Dusk ball".. (tonumber(dusk) > 1 and "s" or "")) 
	   duskCount = tonumber(dusk)
    end
	
	if tonumber(tale) and tonumber(tale) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(tale).." Tale ball".. (tonumber(tale) > 1 and "s" or "")) 
	   taleCount = tonumber(tale)
    end
	
	if tonumber(moon) and tonumber(moon) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(moon).." Moon ball".. (tonumber(moon) > 1 and "s" or "")) 
	   moonCount = tonumber(moon)
    end
	
	if tonumber(net) and tonumber(net) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(net).." Net ball".. (tonumber(net) > 1 and "s" or "")) 
	   netCount = tonumber(net)
    end
	
	if tonumber(premier) and tonumber(premier) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(premier).." Premier ball".. (tonumber(premier) > 1 and "s" or "")) 
	   premierCount = tonumber(premier)
    end
	
	if tonumber(tinker) and tonumber(tinker) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(tinker).." Tinker ball".. (tonumber(tinker) > 1 and "s" or "")) 
	   tinkerCount = tonumber(tinker)
    end
	
	if tonumber(fast) and tonumber(fast) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(fast).." Fast ball".. (tonumber(fast) > 1 and "s" or "")) 
	   fastCount = tonumber(fast)
    end
	
	if tonumber(heavy) and tonumber(heavy) > 0 then 
       table.insert(msg, (#msg > 1 and ", " or "").. tostring(heavy).." Heavy ball".. (tonumber(heavy) > 1 and "s" or "")) 
	   heavyCount = tonumber(heavy)
    end
end

	if #msg == 1 then
		return doPlayerSendTextMessage(cid, 27, "Você ainda não gastou nenhuma ball para catar um "..name..".")
	end

	if string.sub(msg[#msg], 1, 1) == "," then
		msg[#msg] = " and".. string.sub(msg[#msg], 2, #msg[#msg])
	end

	table.insert(msg, " tentando capturar um "..name..".")
	return sendMsgToPlayer(cid, 27, table.concat(msg))
end

function sendBrokesMsg(cid, str, ball, poke, catched)
	if not isCreature(cid) then return true end
	local strings = getPlayerStorageValue(cid, str)
	if type(strings) == "number" or type(strings) ~= "string" or not string.find(strings, "magu") then --alterado v1.9 
		setPlayerStorageValue(cid, str, "normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, dark = 0;") 
		strings = getPlayerStorageValue(cid, str) --alterado v1.9 
	end 
	local t = "normal = (.-), great = (.-), super = (.-), ultra = (.-), saffari = (.-), dark = (.-), magu = (.-), sora = (.-), yume = (.-), dusk = (.-), tale = (.-), moon = (.-), net = (.-), premier = (.-), tinker = (.-), fast = (.-), heavy = (.-);"
	local msg = {}
	local countN, countG, countS, countU, countS2 = 0, 0, 0, 0, 0
	local maguCount, soraCount, yumeCount, duskCount, taleCount, moonCount, netCount, premierCount, tinkerCount, fastCount, heavyCount = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	table.insert(msg, "Você"..(catched == false and " já" or "").." gastou: ")
	
	for n, g, s, u, s2, d, magu, sora, yume, dusk, tale, moon, net, premier, tinker, fast, heavy in strings:gmatch(t) do
		if tonumber(n) and tonumber(n) > 0 then 
			table.insert(msg, tostring(n).." Poke ball".. (tonumber(n) > 1 and "s" or "")) 
			countN = tonumber(n)
		end
		if tonumber(g) and tonumber(g) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(g).." Great ball".. (tonumber(g) > 1 and "s" or "")) 
			countG = tonumber(g)
		end
		if tonumber(s) and tonumber(s) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(s).." Super ball".. (tonumber(s) > 1 and "s" or "")) 
			countS = tonumber(s)
		end
		if tonumber(u) and tonumber(u) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(u).." Ultra ball".. (tonumber(u) > 1 and "s" or "")) 
			countU = tonumber(u)
		end
		if tonumber(s2) and tonumber(s2) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(s2).." Saffari ball".. (tonumber(s2) > 1 and "s" or "")) 
			countS2 = tonumber(s2)
		end
		
		if tonumber(magu) and tonumber(magu) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(magu).." Magu ball".. (tonumber(magu) > 1 and "s" or "")) 
			maguCount = tonumber(magu)
		end
		
		if tonumber(sora) and tonumber(sora) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(sora).." Sora ball".. (tonumber(sora) > 1 and "s" or "")) 
			soraCount = tonumber(sora)
		end
		
		if tonumber(yume) and tonumber(yume) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(yume).." Yume ball".. (tonumber(yume) > 1 and "s" or "")) 
			yumeCount = tonumber(yume)
		end
		
		if tonumber(dusk) and tonumber(dusk) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(dusk).." Dusk ball".. (tonumber(dusk) > 1 and "s" or "")) 
			duskCount = tonumber(dusk)
		end
		
		if tonumber(tale) and tonumber(tale) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(tale).." Tale ball".. (tonumber(tale) > 1 and "s" or "")) 
			taleCount = tonumber(tale)
		end
		
		if tonumber(moon) and tonumber(moon) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(moon).." Moon ball".. (tonumber(moon) > 1 and "s" or "")) 
			moonCount = tonumber(moon)
		end
		
		if tonumber(net) and tonumber(net) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(net).." Net ball".. (tonumber(net) > 1 and "s" or "")) 
			netCount = tonumber(net)
		end
		
		if tonumber(premier) and tonumber(premier) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(premier).." Premier ball".. (tonumber(premier) > 1 and "s" or "")) 
			premierCount = tonumber(premier)
		end
		
		if tonumber(tinker) and tonumber(tinker) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(tinker).." Tinker ball".. (tonumber(tinker) > 1 and "s" or "")) 
			tinkerCount = tonumber(tinker)
		end
		
		if tonumber(fast) and tonumber(fast) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(fast).." Fast ball".. (tonumber(fast) > 1 and "s" or "")) 
			fastCount = tonumber(fast)
		end
		
		if tonumber(heavy) and tonumber(heavy) > 0 then 
			table.insert(msg, (#msg > 1 and ", " or "").. tostring(heavy).." Heavy ball".. (tonumber(heavy) > 1 and "s" or "")) 
			heavyCount = tonumber(heavy)
		end
	end
	if #msg == 1 then
		return true
	end
	if string.sub(msg[#msg], 1, 1) == "," then
		msg[#msg] = " e".. string.sub(msg[#msg], 2, #msg[#msg])
	end
	table.insert(msg, " para"..(catched == false and " tentar" or "").." captura-lo.")
	doPlayerSendTextMessage(cid, 27, table.concat(msg))
end --alterado v1.9 /\
--------------------------------------------------------------------------------
function colocarNaListaDeCapturados(cid, poke)
	setPlayerStorageValue(cid, fotos[poke], 1)
end

function getCatched(cid, poke)
	local storage = getPlayerStorageValue(cid, fotos[poke])
	if storage ~= -1 then
		return true
	end
	return false
end

function getWastedBall(cid, str)
	local storage = getPlayerStorageValue(cid, str)
	local pokeballsCount = {normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, dark = 0, magu = 0, sora = 0, yume = 0, dusk = 0, tale = 0, moon = 0, net = 0, premier = 0, tinker = 0, fast = 0, heavy = 0}
	if storage == -1 then
		return pokeballsCount
	end
	local t = "normal = (.-), great = (.-), super = (.-), ultra = (.-), saffari = (.-), dark = (.-), magu = (.-), sora = (.-), yume = (.-), dusk = (.-), tale = (.-), moon = (.-), net = (.-), premier = (.-), tinker = (.-), fast = (.-), heavy = (.-);"
	for n, g, s, u, s2, d, maguu, sora, yume, dusk, tale, moon, net, premier, tinker, fast, heavy in storage:gmatch(t) do
		if tonumber(n) and tonumber(n) > 0 then 
			pokeballsCount.normal = tonumber(n)
		end

		if tonumber(g) and tonumber(g) > 0 then 
			pokeballsCount.great = tonumber(g)
		end
		if tonumber(s) and tonumber(s) > 0 then 
			pokeballsCount.super = tonumber(s)
		end
		if tonumber(u) and tonumber(u) > 0 then 
			pokeballsCount.ultra = tonumber(u)
		end
		if tonumber(s2) and tonumber(s2) > 0 then 
			pokeballsCount.saffari = tonumber(s2)
		end
		
		if tonumber(maguu) and tonumber(maguu) > 0 then 
			pokeballsCount.magu = tonumber(maguu)
		end
		
		if tonumber(sora) and tonumber(sora) > 0 then 
			pokeballsCount.sora = tonumber(sora)
		end
		
		if tonumber(yume) and tonumber(yume) > 0 then 
			pokeballsCount.yume = tonumber(yume)
		end
		
		if tonumber(dusk) and tonumber(dusk) > 0 then 
			pokeballsCount.dusk = tonumber(dusk)
		end
		
		if tonumber(tale) and tonumber(tale) > 0 then 
			pokeballsCount.tale = tonumber(tale)
		end
		
		if tonumber(moon) and tonumber(moon) > 0 then 
			pokeballsCount.moon = tonumber(moon)
		end
		
		if tonumber(net) and tonumber(net) > 0 then 
			pokeballsCount.net = tonumber(net)
		end
		
		if tonumber(premier) and tonumber(premier) > 0 then 
			pokeballsCount.premier = tonumber(premier)
		end
		
		if tonumber(tinker) and tonumber(tinker) > 0 then 
			pokeballsCount.tinker = tonumber(tinker)
		end
		
		if tonumber(fast) and tonumber(fast) > 0 then 
			pokeballsCount.fast = tonumber(fast)
		end
		
		if tonumber(heavy) and tonumber(heavy) > 0 then 
			pokeballsCount.heavy = tonumber(heavy)
		end
	end
	return pokeballsCount
end

function doSendPokeBall(cid, catchinfo, showmsg, fullmsg, typeee) --Edited brokes count system
	
	local name = doCorrectString(catchinfo.name)
	local pos = catchinfo.topos
	local topos = {}
	topos.x = pos.x
	topos.y = pos.y
	topos.z = pos.z
	local newid = catchinfo.newid
	local catch = catchinfo.catch
	local fail = catchinfo.fail
	local sorte = catchinfo.rate
	
    if not getTopCorpse(topos) then
	    return true
	end
	
	local corpse = getTopCorpse(topos).uid
	if not isCreature(cid) then
		doSendMagicEffect(topos, CONST_ME_POFF)
		return true
	end
	
	doRemoveItem(corpse, 1)
		
	local str = newpokedexCatchXpMasterx[name].stoCatch
	local Wast = getWastedBall(cid, str)
	
	local playerPoints = 0
	
	--print("Valor da Sorte "..sorte)
	
	if Wast.normal > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["pokeball"] * Wast.normal)
	end
	
	if Wast.great > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["greatball"] * Wast.great)
	end
	
	if Wast.super > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["superball"] * Wast.super) 
	end
	
	if Wast.ultra > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["ultraball"] * Wast.ultra) 
	end
	
	if Wast.saffari > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["saffariball"] * Wast.saffari) 
	end
	
	if Wast.premier > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["premierball"] * Wast.premier) 
	end
	
    if Wast.magu > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["maguball"] * Wast.magu) 
	end
	
	if Wast.sora > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["soraball"] * Wast.sora) 
	end
	
	if Wast.yume > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["yumeball"] * Wast.yume) 
	end
	
	if Wast.dusk > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["duskball"] * Wast.dusk) 
	end
	
	if Wast.tale > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["taleball"] * Wast.tale) 
	end
	
	if Wast.moon > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["moonball"] * Wast.moon) 
	end
	
	if Wast.net > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["netball"] * Wast.net) 
	end
	
	if Wast.tinker > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["tinkerball"] * Wast.tinker) 
	end
	
	if Wast.fast > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["fastball"] * Wast.fast) 
	end
	
	if Wast.heavy > 0 then
		playerPoints = playerPoints + (ballsTypesCatch["heavyball"] * Wast.heavy)
	end
	
	playerPoints = playerPoints + sorte	
	--print("Meu playerPoints é :"..playerPoints)
		
	local doCatch = false
	
	local pokeTab = pokeChance[name]
	
	if pokeTab then
		local pokeChance = pokeTab.media * ballsTypesCatch[pokeTab.balltype]

		local tableMinBall = { --
			["pokeball"] = "Poke Ball", -- Se eu joguei pokeball, ganhará 1 point por cada
			["greatball"] = "Great Ball", -- Se eu joguei great ball, ganhará 2 points por cada
			["superball"] = "Super Ball", -- Se eu joguei superball, ganhará 3 points por cada
			["ultraball"] = "Ultra Ball", -- Se eu joguei ultraball, ganhará 4 points por cada			
			["saffariball"] = "Saffari Ball", -- Se eu joguei ultraball, ganhará 4 points por cada			
		}
		
		local tablert = { -- typeee para type normal
			["poke"] = 1,
			["great"] = 2,
			["super"] = 3,
			["ultra"] = 5,
			["premier"] = 2,
			["magu"] = 8,
			["sora"] = 8,
			["yume"] = 8,
			["dust"] = 8,
			["tale"] = 8,
			["moon"] = 8,
			["net"] = 8,
			["tinker"] = 8,
			["fast"] = 8,
			["heavy"] = 8,
			["saffari"] = 8,
		}

		if tablert[typeee] < ballsTypesCatch[pokeTab.minBallType] then --pokeTab.minBallType
			doPlayerSendTextMessage(cid, 20, "Você só pode capturar ".. name .." com ".. tableMinBall[pokeTab.minBallType] .." ou superior.")
			addEvent(doNotCapturePokemon, 3000, cid, name, typeee) 
			doSendMagicEffect(topos, fail)
			return true
		end
		
		local pokeChance = pokeTab.media * ballsTypesCatch[pokeTab.balltype]	
		--print("Meu pokeChance é :"..pokeChance)		
		
		if isGod(cid) and getPlayerStorageValue(cid, 394672) >= 1 then
			doSendMagicEffect(topos, catch)
			addEvent(doCapturePokemon, 3000, cid, name, newid, nil, typeee) 
			return true		
		end
		
		if playerPoints > pokeChance and name ~= "Vaporeon" then
			local storage = newpokedexCatchXpMasterx[name].stoCatch 	
			local XPCATCH = newpokedexCatchXpMasterx[name].expCatch
			local Wast = getWastedBall(cid, storage)
			local ballsCatchedString = tonumber(Wast.normal or 0) .. "-" .. tonumber(Wast.great or 0) .. "-" .. tonumber(Wast.super or 0) .. "-" .. tonumber(Wast.ultra or 0) .. "-" .. tonumber(Wast.saffari or 0).. "-" .. tonumber(Wast.magu or 0).. "-" .. tonumber(Wast.sora or 0)  .. "-" .. tonumber(Wast.yume or 0)  .. "-" .. tonumber(Wast.dusk or 0) .. "-" .. tonumber(Wast.tale or 0) .. "-" .. tonumber(Wast.moon or 0) .. "-" .. tonumber(Wast.net or 0) .. "-" .. tonumber(Wast.premier or 0) .. "-" .. tonumber(Wast.tinker or 0) .. "-" ..tonumber(Wast.fast or 0) .. "-" .. tonumber(Wast.heavy or 0)		
			local depot = false
		
			if getPlayerStorageValue(cid, 141417) >= 1 then
				addEvent(doNotCapturePokemon, 3000, cid, name, typeee) 
				doSendMagicEffect(topos, fail)		
				return true
			end			
			
			if not (hasCapacityForPokeball(cid) and not isInArray({2, 3, 4, 5, 6, 15}, getPlayerGroupId(cid))) or not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then 
				depot = true
			end
				
			addEvent(doPlayerSendTextMessage, 2900, cid, 27, "Congratulations, you caught a pokemon ("..name..")!")
			setPlayerStorageValue(cid, 141417, 1)	
			
			if depot == true then 
				addEvent(doPlayerSendTextMessage, 3000, cid, 27, "Since you are already holding six pokemons, this pokeball has been sent to your depot.") 
			end
			
			addEvent(function()
				if getPlayerDexInfo(cid, name).catch == 0 then
					doPlayerAddExp(cid, XPCATCH * 0.8)
					doSendPlayerExtendedOpcode(cid, opcodes.OPCODE_CATCH, getPortraitClientID(name) .. "-" .. XPCATCH .. "-" .. name .. "-" .. ballsCatchedString)
					doSendAnimatedText(getThingPos(cid), XPCATCH , 215)
					doPlayerAddInKantoCatchs(cid, 1)
					colocarNaListaDeCapturados(cid, name)	
					doRegisterPokemonToCatch(cid, name)
				end
			end, 3500)
			
			addEvent(sendBrokesMsg2, 2900, cid, name, storage, true)
			
			if name == tostring(getPlayerStorageValue(cid, catchModes.storage2)) and not hasCatched(cid) then
				setDailyCatched(cid, true)
				addEvent(doPlayerSendTextMessage, 3050, cid, 27, "Daily Catch: Você terminou a missão! Volte para pegar sua recompensa!")
			end
			
			addEvent(setPlayerStorageValue, 3100, cid, 141417, -1)		
			addEvent(setPlayerStorageValue, 3100, cid, storage, "normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, dark = 0, magu = 0, sora = 0, yume = 0, dusk = 0, tale = 0, moon = 0, net = 0, premier = 0, tinker = 0, fast = 0, heavy = 0;") --alterado v1.9 /\				
			doSendMagicEffect(topos, catch)			
			addEvent(doCapturePokemon, 3000, cid, name, newid, nil, typeee) 					
			return true		
		end
    
	end		
	
	addEvent(doNotCapturePokemon, 3000, cid, name, typeee) 
	doSendMagicEffect(topos, fail)
end

function doCapturePokemon(cid, poke, ballid, status, typeee) 
	
	if not isCreature(cid) then
		return true
	end
	
	if not tonumber(getPlayerStorageValue(cid, 54843)) or getPlayerStorageValue(cid, 54843) == -1 then
		setPlayerStorageValue(cid, 54843, 1)
	else
		setPlayerStorageValue(cid, 54843, getPlayerStorageValue(cid, 54843) + 1)
	end
	
	if pokeballs[poke] then
		ballid = pokeballs[poke].on
	end	
	
	local depot = false
	if not hasCapacityForPokeball(cid) or not hasSpaceInContainer(getPlayerSlotItem(cid, 3).uid) then 
		if typeee == "saffari" then
			item = doCreateItemEx(ballid)		
		else
			item = doCreateItemEx(ballid-1)
		end
		depot = true
	else
		item = addItemInFreeBag(getPlayerSlotItem(cid, 3).uid, ballid, 1) 
	end
	
	if poke == "Smeargle" then
		smeargles = {"Smeargle 1", "Smeargle 2", "Smeargle 3", "Smeargle 4", "Smeargle 5", "Smeargle 6", "Smeargle 7", "Smeargle 8"}
		poke = smeargles[math.random(#smeargles)]
	end	
	
	if poke == "Smeargle" or poke == "Smeargle 1" then
		doItemSetAttribute(item, "SmeargleID", 1)		
	elseif poke == "Smeargle 2" then
		doItemSetAttribute(item, "SmeargleID", 2)
	elseif poke == "Smeargle 3" then
		doItemSetAttribute(item, "SmeargleID", 3)
	elseif poke == "Smeargle 4" then
		doItemSetAttribute(item, "SmeargleID", 4)
	elseif poke == "Smeargle 5" then
		doItemSetAttribute(item, "SmeargleID", 5)
	elseif poke == "Smeargle 6" then
		doItemSetAttribute(item, "SmeargleID", 6)
	elseif poke == "Smeargle 7" then
		doItemSetAttribute(item, "SmeargleID", 7)
	elseif poke == "Smeargle 8" then
		doItemSetAttribute(item, "SmeargleID", 8)
	end		
	
	doItemSetAttribute(item, "poke", poke)
	doItemSetAttribute(item, "hpToDraw", 0)
	doItemSetAttribute(item, "ball", typeee)
	doSetAttributesBallsByPokeName(cid, item, poke)	

	local pokeBallNamezin = getItemAttribute(ballid, "ball")
	
	for _, oid in ipairs(getPlayersOnline()) do
		doPlayerSendChannelMessage(oid, "Catch System", "O jogador [".. getCreatureName(cid) .."] capturou um ["..poke.."] usando "..typeee.." ball.", TALKTYPE_CHANNEL_W, 10)
	end	
	
	if pokeballs[poke:lower()] then
		doTransformItem(item, pokeballs[poke:lower()].on)	
	end
	
	doItemSetAttribute(item, "ehDoChao", false)		
	
	if depot then 
		doPlayerSendMailByName(getCreatureName(cid), item, 1)	
	end
	
	if poke == tostring(getPlayerStorageValue(cid, catchModes.storage2)) and not hasCatched(cid) then
		setDailyCatched(cid, true)
	end
	
	if #getCreatureSummons(cid) >= 1 then
		doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 173) 
		if catchMakesPokemonHappier then
			setPlayerStorageValue(getCreatureSummons(cid)[1], 1008, getPlayerStorageValue(getCreatureSummons(cid)[1], 1008) + 20)
		end
	else
		doSendMagicEffect(getThingPos(cid), 173) 
	end
	
	if typeee == "master" then
		doItemSetAttribute(item, "unico", true) 
	end
	
	if typeee == "premier" then
		doItemSetAttribute(item, "aura", "particle")
	end
		
	local storage = newpokedexCatchXpMasterx[poke].stoCatch 
	setPlayerStorageValue(cid, storage, "normal = 0, great = 0, super = 0, ultra = 0, saffari = 0, dark = 0, magu = 0, sora = 0, yume = 0, dusk = 0, tale = 0, moon = 0, net = 0, premier = 0, tinker = 0, fast = 0, heavy = 0;") --alterado v1.9 /\
	doIncreaseStatistics(poke, true, true)
end

function doNotCapturePokemon(cid, poke, typeee) 
	
	if not isCreature(cid) then
		return true
	end
	
	if isInArray({"Castform Fire", "Castform Ice", "Castform Water"}, poke) then
		poke = "Castform"
	--	print(poke)
	end	
	
	if not tonumber(getPlayerStorageValue(cid, 54843)) then
		local test = io.open("data/sendtobrun123.txt", "a+")
		local read = ""
		if test then
			read = test:read("*all")
			test:close()
		end
		read = read.."\n[csystem.lua] "..getCreatureName(cid).." - "..getPlayerStorageValue(cid, 54843)..""
		local reopen = io.open("data/sendtobrun123.txt", "w")
		reopen:write(read)
		reopen:close()
		setPlayerStorageValue(cid, 54843, 1)
	end
	
	if not tonumber(getPlayerStorageValue(cid, 54843)) or getPlayerStorageValue(cid, 54843) == -1 then
		setPlayerStorageValue(cid, 54843, 1)
	else
		setPlayerStorageValue(cid, 54843, getPlayerStorageValue(cid, 54843) + 1)
	end

	doSendMsg(cid, "TESTEEEEEEE")
	
	doPlayerSendTextMessage(cid, 27, failmsgs[math.random(#failmsgs)])
	
	if #getCreatureSummons(cid) >= 1 then
		doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 166)
	else
		doSendMagicEffect(getThingPos(cid), 166)
	end
	
	local storage = newpokedexCatchXpMasterx[poke].stoCatch
	doIncreaseStatistics(poke, true, false)
	sendBrokesMsg(cid, str, ball, poke, false)
	
end

function getPlayerInfoAboutPokemon(cid, poke)
	poke = doCorrectString(poke)
	local a = newpokedex[poke]
	if not isPlayer(cid) then return false end
	if not a then
		return false
	end
	local b = getPlayerStorageValue(cid, a.storage)
	
	if b == -1 then
		setPlayerStorageValue(cid, a.storage, poke..":")
	end
	
	local ret = {}
	if string.find(b, "catch,") then
		ret.catch = true
	else
		ret.catch = false
	end
	if string.find(b, "dex,") then
		ret.dex = true
	else
		ret.dex = false
	end
	if string.find(b, "use,") then
		ret.use = true
	else
		ret.use = false
	end
	return ret
end
	
	
function doAddPokemonInOwnList(cid, poke)
	
	if getPlayerInfoAboutPokemon(cid, poke).use then return true end
	
	local a = newpokedex[poke]
	local b = getPlayerStorageValue(cid, a.storage)
	
	setPlayerStorageValue(cid, a.storage, b.." use,")
end

function isPokemonInOwnList(cid, poke)
	
	if getPlayerInfoAboutPokemon(cid, poke).use then return true end
	
	return false
end

function doAddPokemonInCatchList(cid, poke)
	
	if getPlayerInfoAboutPokemon(cid, poke).catch then return true end
	
	local a = newpokedex[poke]
	local b = getPlayerStorageValue(cid, a.storage)
	
	setPlayerStorageValue(cid, a.storage, b.." catch,")
end

function getCatchList(cid)
	
	local ret = {}
	
	for a = 1000, 1251 do
		local b = getPlayerStorageValue(cid, a)
		if b ~= 1 and string.find(b, "catch,") then
			table.insert(ret, oldpokedex[a-1000][1])
		end
	end
	
	return ret
	
end


function getStatistics(pokemon, tries, success)
	
	local ret1 = 0
	local ret2 = 0
	
	local poke = ""..string.upper(string.sub(pokemon, 1, 1))..""..string.lower(string.sub(pokemon, 2, 30))..""
	local dir = "data/Pokemon Statistics/"..poke.." Attempts.txt"
	local arq = io.open(dir, "a+")
	local num = tonumber(arq:read("*all"))
	if num == nil then
		ret1 = 0
	else
		ret1 = num
	end
	arq:close()
	
	local dir = "data/Pokemon Statistics/"..poke.." Catches.txt"
	local arq = io.open(dir, "a+")
	local num = tonumber(arq:read("*all"))
	if num == nil then
		ret2 = 0
	else
		ret2 = num
	end
	arq:close()
	
	if tries == true and success == true then
		return ret1, ret2
	elseif tries == true then
		return ret1
	else
		return ret2
	end
end

function doIncreaseStatistics(pokemon, tries, success)
	
end

function doUpdateGeneralStatistics()
	
	local dir = "data/Pokemon Statistics/Pokemon Statistics.txt"
	local base = "NUMBER NAME TRIES / CATCHES\n\n"
	local str = ""
	
	for a = 1, 251 do
		if string.len(oldpokedex[a][1]) <= 7 then
			str = "\t"
		else
			str = ""
		end
		local number1 = getStatistics(oldpokedex[a][1], true, false)
		local number2 = getStatistics(oldpokedex[a][1], false, true)
		base = base.."["..threeNumbers(a).."]\t"..oldpokedex[a][1].."\t"..str..""..number1.." / "..number2.."\n"
	end
	
	local arq = io.open(dir, "w")
	arq:write(base)
	arq:close()
end

function getGeneralStatistics()
	
	local dir = "data/Pokemon Statistics/Pokemon Statistics.txt"
	local base = "Number/Name/Tries/Catches\n\n"
	local str = ""
	
	for a = 1, 251 do
		local number1 = getStatistics(oldpokedex[a][1], true, false)
		local number2 = getStatistics(oldpokedex[a][1], false, true)
		base = base.."["..threeNumbers(a).."] "..oldpokedex[a][1].." "..str..""..number1.." / "..number2.."\n"
	end
	
	return base
end

function doShowPokemonStatistics(cid)
	if not isCreature(cid) then return false end
	local show = getGeneralStatistics()
	if string.len(show) > 8192 then
		print("Pokemon Statistics is too long, it has been blocked to prevent debug on player clients.")
		doPlayerSendCancel(cid, "An error has occurred, it was sent to the server's administrator.") 
		return false
	end
	doShowTextDialog(cid, math.random(2391, 2394), show)
end

function getFreeSpacesSmeargleBall(ball, id)
	local ret = id
	for i = 1, id do 
		if getItemAttribute(ball, "sketch" .. i) then
		   ret = ret -1
		end
	end
	return ret
end

function getSmeargleAttackNameFromSkactch(cid, name)
	if not isCreature(cid) then return true end
	local ret = ""
	local ball = getPlayerSlotItem(getCreatureMaster(cid), 8).uid
	for i = 1, 9 do 
		if getItemAttribute(ball, "sketchName" .. i) == name then
		   ret = getItemAttribute(ball, "sketch" .. i)
			break
		end
	end
	return ret
end