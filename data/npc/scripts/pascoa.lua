local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function doBuyPokemonWithCasinoCoins(cid, poke) npcHandler:onSellpokemon(cid) end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
    if(not npcHandler:isFocused(cid)) then
        return false
    end

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

   
    local items = {
		{typeT = 'item', itemId = 15134, name = 'Charizardite X', price = 3500},
		{typeT = 'item', itemId = 2828, name = 'Premier Ball x100', price = 350},
		{typeT = 'item', itemId = 19610, name = 'V Ball x50', price = 550},
        {typeT = 'item', itemId = 17629, name = 'Experience Star', price = 125},
		{typeT = 'outfit', itemId = 2252, name = 'Pascoa Coelinho', price = 500},
        {typeT = 'outfit', itemId = 2250, name = 'Pascoa Collect', price = 1000},
    }
	
	local points = getPlayerStorageValue(cid, 57086)
	if getPlayerStorageValue(cid, 57086) <= 0 then
	    points = 0
	end
	
    local buffer = points.."@"
    for i = 1, #items do
	    local count = "1;"
	    if items[i].typeT == "outfit" then
		    count = ""
		else
		    outfit = "1;"
		end
		local idItem = items[i].itemId
		if items[i].typeT == 'item' then 
		    idItem = getItemInfo(idItem).clientId 
		end
        buffer = buffer..items[i].typeT..";"..idItem..";"..count..items[i].name..";"..items[i].price
	    if i < #items then
	        buffer = buffer.."|"
	    end
    end
	
	doSendPlayerExtendedOpcode(cid, 52, buffer) 
	
    talkState[talkUser] = 0
    return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())