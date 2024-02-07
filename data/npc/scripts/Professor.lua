local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end

--//
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
local msg = string.lower(msg)

local moveis = {
["kabuto"] = {20, 100, "Kabuto"}, -- bless 20%
["omanyte"] = {50, 250, "Omanyte"}, -- bless 50%
["aerodactyl"] = {100, 1500, "Aerodactyl"}, -- bless 100%
}

	if (msgcontains(msg, 'clonar') or msgcontains(msg, 'Clonar')) then
		selfSay("Para você clonar precisará de {Kabuto} 25 Dome Fossil e 5kk, {Omanyte} 25 Helix Fossil e 5kk, {Aerodactyl} 1 Old Amber e 10kk, qual você deseja clonar?", cid)
		talkState[talkUser] = 1
		return true
	elseif moveis[msg] and talkState[talkUser] == 1 then
		TABLE = moveis[msg]
		selfSay("Você tem os itens necessário para clonar o "..msg.."?", cid)
		talkState[talkUser] = 2
		return true
	elseif (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) and talkState[talkUser] == 2 then
		if TABLE[3] == "Kabuto" and getPlayerMoney(cid) >= 500000000 and getPlayerItemCount(cid, 12579) >= 25 then
			selfSay("Parabéns você acaba de clonar um Kabuto.", cid)
			doPlayerRemoveItem(cid, 12579, 25)
			addPokeToPlayer(cid, "Kabuto", 0, nil, "poke")
			doPlayerRemoveMoney(cid, 500000000)
		elseif TABLE[3] == "Omanyte" and getPlayerMoney(cid) >= 500000000 and getPlayerItemCount(cid, 12580) >= 25 then 	
			selfSay("Parabéns você acaba de clonar um Omanyte.", cid)
			doPlayerRemoveItem(cid, 12580, 25)
			addPokeToPlayer(cid, "Omanyte", 0, nil, "poke")
			doPlayerRemoveMoney(cid, 500000000)
		elseif TABLE[3] == "Aerodactyl" and getPlayerMoney(cid) >= 1000000000 and getPlayerItemCount(cid, 12581) >= 1 then 
			selfSay("Parabéns você acaba de clonar um Aerodactyl.", cid)
			doPlayerRemoveItem(cid, 12581, 1)
			addPokeToPlayer(cid, "Aerodactyl", 0, nil, "poke")
			doPlayerRemoveMoney(cid, 1000000000)
		else
			selfSay("Você não tem dinheiro ou os itens necessários.", cid)	
			talkState[talkUser] = 0		
		end
		talkState[talkUser] = 0
		return true
	elseif msgcontains(msg, 'no') then
		selfSay("Ok então até mais.", cid)
		talkState[talkUser] = 0
		return true 
	end 
	
	return true
end       
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())         