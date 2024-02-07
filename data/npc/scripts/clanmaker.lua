local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)

	if (not npcHandler:isFocused(cid)) then
		return false
	end
	
local msg = string.lower(msg)

local config = {
["Naturia Maker"] = {
		clanname = "Naturia",
		tradename = "Net Ball e Naturia Backpack",
		tradeitems = {
			["net ball"] = {id = 15675, count = 25, points = 2500},
			["naturia backpack"] = {id = 15167, count = 1, points = 15000},
		}
	},
["Seavell Maker"] = {
		clanname = 'Seavell',
		tradename = "Sora Ball, Net Ball e Seavell Backpack",
		tradeitems = {
			["sora ball"] = {id = 15676, count = 25, points = 3000}, 
			["net ball"] = {id = 15675, count = 25, points = 3000},
			["seavell backpack"] = {id = 15171, count = 1, points = 15000},
		}
	},
["Volcanic Maker"] = {
		clanname = 'Volcanic',
		tradename = "Magu Ball e Volcanic Backpack",
		tradeitems = {
			["magu ball"] = {id = 15677, count = 25, points = 2500},
			["volcanic backpack"] = {id = 15170, count = 1, points = 15000},
		}
	},
["Wingeon Maker"] = {
		clanname = 'Wingeon',
		tradename = "Tale Ball, Sora Ball e Wingeon Backpack",
		tradeitems = {
			["tale ball"] = {id = 15673, count = 25, points = 3000}, 
			["sora ball"] = {id = 15676, count = 25, points = 3000},
			["wingeon backpack"] = {id = 15164, count = 1, points = 15000},
		}
	},
["Malefic Maker"] = {
		clanname = 'Malefic',--
		tradename = "Moon Ball, Malefic Backpack",
		tradeitems = {
			["moon ball"] = {id = 15674, count = 25, points = 2500},
			["malefic backpack"] = {id = 15172, count = 1, points = 15000},
		}
	},
["Psycraft Maker"] = {
		clanname = 'Psycraft',
		tradename = "Yume Ball e Psycraft Backpack",
		tradeitems = {
			["yume ball"] = {id = 15678, count = 25, points = 2500},
			["psycraft backpack"] = {id = 15165, count = 1, points = 15000},
		}
	},
["Gardestrike Maker"] = {
		clanname = 'Gardestrike',
		tradename = "Yume Ball, Dusk Ball e Gardestrike Backpack",
		tradeitems = {
			["dusk ball"] = {id = 15680, count = 25, points = 3000}, 
			["yume ball"] = {id = 15680, count = 25, points = 3000},
			["gardestrike backpack"] = {id = 15166, count = 1, points = 15000},
		}
	},
["Orebound Maker"] = {
		clanname = 'Orebound',
		tradename = "Dusk Ball, Magu Ball e Orebound Backpack",
		tradeitems = {
			["dusk ball"] = {id = 15680, count = 25, points = 3000}, 
			["magu ball"] = {id = 15677, count = 25, points = 3000},
			["orebound backpack"] = {id = 15168, count = 1, points = 15000},
		}
	},
["Raibolt Maker"] = {
		clanname = 'Raibolt',
		tradename = "Tinker Ball, Fast Ball e Raibolt Backpack",
		tradeitems = {
			["tinker ball"] = {id = 15681, count = 25, points = 3000}, 
			["fast ball"] = {id = 15682, count = 25, points = 3000},
			["raibolt backpack"] = {id = 15169, count = 1, points = 15000},
		}
	},
["Ironhard Maker"] = {
		clanname = 'Ironhard',
		tradename = "Tinker Ball, Heavy Ball e Ironhard Backpack",
		tradeitems = {
			["tinker ball"] = {id = 15681, count = 25, points = 3000}, 
			["heavy ball"] = {id = 15672, count = 25, points = 3000},
			["ironhard backpack"] = {id = 15173, count = 1, points = 15000},
		}
	}
}
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
   		
	for a, b in pairs(config) do
		if getNpcName() == a then
			if (msgcontains(msg, 'pontos') or msgcontains(msg, 'Pontos')) then    --alterado v1.7
			
			  if getPlayerClanName(cid) ~= b.clanname then       --alterado v1.7
				  selfSay("Desculpe, mas só negocio com pessoas do clan "..b.clanname..".", cid)
				  talkState[talkUser] = 0
				  return true   
			   end
			
			   selfSay("Você tem ["..getPlayerPointsClan(cid).."] points.", cid)	
			   talkState[talkUser] = 0	
			end
			if (msgcontains(msg, 'itens')) then  
				if getPlayerClanName(cid) ~= b.clanname then
					selfSay("Desculpe, mas só negocio com pessoas do clan "..b.clanname..".", cid)
					talkState[talkUser] = 0
					return true   
				end			
				selfSay("Temos os seguintes itens para trocas: "..b.tradename.." qual você deseja?", cid)	
				talkState[talkUser] = 1
			end
			if b.tradeitems[msg] and talkState[talkUser] == 1 then 
				item_trade = b.tradeitems[msg]
				selfSay("Esse "..msg.." custa "..item_trade.points.." pontos, você deseja troca-lo?", cid)	
				talkState[talkUser] = 2   	
			elseif (msgcontains(msg, 'yes') and talkState[talkUser] == 2) then 
				if getPlayerPointsClan(cid) >= item_trade.points then
					selfSay("Pronto aqui está sua "..msg..".", cid)	
					doPlayerAddItem(cid, item_trade.id, item_trade.count)
					doRemovePlayerPoints(cid, item_trade.points)
					talkState[talkUser] = 0	 
				else
					selfSay("Você precisa não tem pontos suficientes.", cid)
					talkState[talkUser] = 0
				end
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())             