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
["Naturia Seller"] = {
		clanname = 'Naturia', 
		items = {
			{id = 13783, count = 1000}, 
			{id = 12171, count = 100}, 
			{id = 11441, count = 1}, 
			{id = 11448, count = 1},
			},
		msgitens = "1000 bug gosme, 100 pot of muss bug, 1 leaf stone e 1 coccon stone",
		tradename = "net ball",
		trocar = {
					["net ball"] = {15675, 25, 1000}
				}
	},
["Seavell Seller"] = {
		clanname = 'Seavell',
		items = {{id = 12161, count = 1000}, {id = 12170, count = 100}, {id = 11454, count = 2}, {id = 11442, count = 2}},
		msgitens = "1000 water gem, 100 water pendant, 2 ice stone e 2 water stone",
		tradename = "sora ball, net ball",
		trocar = {{"sora ball", 15676, 25, 1500}, {"net ball", 15675, 25, 1500}}
	},
["Volcanic Seller"] = {
		clanname = 'Volcanic',
		items = {{id = 12162, count = 1000}, {id = 12152, count = 100}, {id = 11447, count = 2}},
		msgitens = "1000 essence of fire, 100 pot of lava e 2 fire stones",
		tradename = "magu ball",
		trocar = {{"magu ball", 15677, 25, 1000}}
	},
["Wingeon Seller"] = {
		clanname = 'Wingeon',
		items = {{id = 2694, count = 1000}, {id = 12200, count = 100}, {id = 19694, count = 2}},
		msgitens = "1000 straw, 100 feather e 2 feather stone",
		tradename = "tale ball, sora ball",
		trocar = {{"tale ball", 15673, 25, 1500}, {"sora ball", 15676, 25, 1500}}
	},
["Malefic Seller"] = {
		clanname = 'Malefic',--
		items = {{id = 12165, count = 1000}, {id = 12282, count = 100}, {id = 11443, count = 2}, {id = 11450, count = 2}},
		msgitens = "1000 bottle of poison, 100 venom pendant, 2 venom stone e 2 darkness stone",
		tradename = "moon ball",
		trocar = {{"moon ball", 15674, 25, 1000}}
	},
["Psycraft Seller"] = {
		clanname = 'Psycraft',
		items = {{id = 13785, count = 1000}, {id = 12194, count = 100}, {id = 11452, count = 2}},
		msgitens = "1000 enchanted gem, 100 future orb e 2 enigma stone",
		tradename = "yume ball",
		trocar = {{"yume ball", 15678, 25, 1000}}
	},
["Gardestrike Seller"] = {
		clanname = 'Gardestrike',
		items = {{id = 17346, count = 1000}, {id = 2345, count = 100}, {id = 11453, count = 1}, {id = 11446, count = 1}},
		msgitens = "1000 band aid, 100 martial scrolls, 1 heart stone e 1 punch stone",
		tradename = "dusk ball, yume ball",
		trocar = {{"dusk ball", 15680, 25, 1500}, {"yume ball", 15680, 25, 1500}}
	},
["Orebound Seller"] = {
		clanname = 'Orebound',
		items = {{id = 12337, count = 1000}, {id = 12196, count = 100}, {id = 11445, count = 2}, {id = 11451, count = 2}},
		msgitens = "1000 small stone, 100 stone orb, 2 rock stone e 2 earth stone",
		tradename = "dusk ball, magu ball",
		trocar = {{"dusk ball", 15680, 25, 1500}, {"magu ball", 15677, 25, 1500}}
	},
["Raibolt Seller"] = {
		clanname = 'Raibolt',
		items = {{id = 12164, count = 1000}, {id = 12176, count = 100}, {id = 11444, count = 2}},
		msgitens = "1000 screw, 100 electric box e 2 thunder stone",
		tradename = "tinker ball, fast ball",
		trocar = {{"tinker ball", 15681, 25, 1500}, {"fast ball", 15682, 25, 1500}}
	},
["Ironhard Seller"] = {
		clanname = 'Ironhard',
		items = {{id = 17347, count = 1000}, {id = 13868, count = 25}, {id = 12232, count = 1}},
		msgitens = "1000 piece of steel, 25 steel wing e 1 metal stone",
		tradename = "tinker ball, heavy ball",
		trocar = {{"tinker ball", 15681, 25, 1500}, {"heavy ball", 15672, 25, 1500}}
	}
}

local cfg = config[getNpcName()]
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local troca = cfg.trocar[msg]
   		 
        if (msgcontains(msg, 'rank') or msgcontains(msg, 'Rank')) then   --alterado v1.7
          
		  if getPlayerClanName(cid) ~= cfg.clanname then       --alterado v1.7
              selfSay("Desculpe, mas só negocio com pessoas do clan "..cfg.clanname..".", cid)
              talkState[talkUser] = 0
              return true   
           end
		   
		   if getPlayerClanRank(cid) >= 5 then
              selfSay("Você já está no rank máximo.", cid)
              talkState[talkUser] = 0
              return true   
           end		   
		   
              selfSay("Para subir de rank você precisa de "..tonumber(getPlayerClanRank(cid) * 12100).." pontos, você deseja prosseguir?", cid)
              talkState[talkUser] = 1  
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) and talkState[talkUser] == 1 then
			if getPlayerPointsClan(cid) >= tonumber(getPlayerClanRank(cid) * 12100) then 
				selfSay("Pronto, você agora é um "..cfg.clanname.." rank "..tonumber(getPlayerClanRank(cid) + 1)..".", cid)
				doRemovePlayerPoints(cid, tonumber(getPlayerClanRank(cid) * 12100))
				setPlayerClanRank(cid, tonumber(getPlayerClanRank(cid) + 1))
				talkState[talkUser] = 0
			else
				selfSay("Você não tem pontos suficientes para subir de rank.", cid)
				talkState[talkUser] = 0
			end
        elseif (msgcontains(msg, 'pontos') or msgcontains(msg, 'Pontos')) then    --alterado v1.7
		
		  if getPlayerClanName(cid) ~= cfg.clanname then       --alterado v1.7
              selfSay("Desculpe, mas só negocio com pessoas do clan "..cfg.clanname..".", cid)
              talkState[talkUser] = 0
              return true   
           end
		
           selfSay("Você tem ["..getPlayerPointsClan(cid).."] points.", cid)	
           talkState[talkUser] = 0
		   
        elseif (msgcontains(msg, 'chaves') or msgcontains(msg, 'Chaves')) then 

		  if getPlayerClanName(cid) ~= cfg.clanname then       --alterado v1.7
              selfSay("Desculpe, mas só negocio com pessoas do clan "..cfg.clanname..".", cid)
              talkState[talkUser] = 0
              return true   
           end			
		
           selfSay("Olá para você fazer as chaves do nosso clan, será necessário os seguintes itens: "..cfg.msgitens.." você deseja prosseguir?", cid)	
           talkState[talkUser] = 2	
		   
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) and talkState[talkUser] == 2 then 
			
			for i = 1, #cfg.items do
				if getPlayerItemCount(cid, cfg.items[i].id) < cfg.items[i].count then
					selfSay("Você não trouxe os itens necessários..", cid)
					talkState[talkUser] = 0
					return true
				end		
			end
			
			for i = 1, #cfg.items do
				doPlayerRemoveItem(cid, cfg.items[i].id, cfg.items[i].count)	
			end	
			
			addChaveToClan(cid)				
			selfSay("Pronto, aqui está sua "..getPlayerClanName(cid).." Key.", cid)		   
			talkState[talkUser] = 0	
		
        elseif (msgcontains(msg, 'itens') or msgcontains(msg, 'Itens')) then 
		 
		   if getPlayerClanName(cid) ~= cfg.clanname then       --alterado v1.7
              selfSay("Desculpe, mas só negocio com pessoas do clan "..cfg.clanname..".", cid)
              talkState[talkUser] = 0
              return true   
           end
		   
           selfSay("Temos os seguintes itens para trocas: "..cfg.tradename.." qual você deseja?", cid)	
           talkState[talkUser] = 3	
		   
		elseif troca and talkState[talkUser] == 3 then 
		
			selfSay("Esse "..msg.." custa "..troca[3].." pontos, você deseja troca-lo?", cid)	
			talkState[talkUser] = 4	   
			
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) and talkState[talkUser] == 4 then    --alterado v1.7
			local troca = cfg.trocar[msg]
			if getPlayerPointsClan(cid) >= troca[3] then
				selfSay("Pronto aqui está sua "..troca..".", cid)	
				doPlayerAddItem(cid, troca[2], troca[2])
				doRemovePlayerPoints(cid, troca[4])
				talkState[talkUser] = 0	 
			else
				selfSay("Você precisa não tem pontos suficientes.", cid)
				talkState[talkUser] = 0
			end
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())             