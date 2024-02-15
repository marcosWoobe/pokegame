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

    local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
    msg = string.lower(msg)
    ---------
    local need = {
        {id = 17337, qt = 70}, -- Magma Foots
	    {id = 12162, qt = 600}, -- Essence Of fire
	    {id = 12152, qt = 200}, -- pot of lava
    }
    local rewards = {
        {id = 2152, qt = 70}, -- money
        {id = 11447, qt = 1}, -- Fire Stone

    }
    local stoFinish = 93843
    ---------
   
    if msgcontains(msg, 'help') or msgcontains(msg, 'ajuda') then
        if getPlayerStorageValue(cid, stoFinish) >= 1 then
            selfSay("Sorry, you already had done this quest.", cid)
            talkState[talkUser] = 0
            return true
        end
        selfSay("EAI GUFFS SEU OTARIO, VC TEM QUE TRAZER: 70 Magma Foot, 600 Essence of fire, 200 Pot of Lava! SEU BURRO DO CARALEO",cid)
        talkState[talkUser] = 1
        return true 
    elseif msgcontains(msg, 'yes') or msgcontains(msg, 'sim') and talkState[talkUser] == 1 then
        if getPlayerStorageValue(cid, stoFinish) >= 1 then
            selfSay("Sorry, you already had done this quest.", cid)
            talkState[talkUser] = 0
            return true
        end
	    for i = 1, #need do 
            if getPlayerItemCount(cid, need[i].id) < need[i].qt then
                selfSay("You don't brought to me all the items what i asked for...", cid)
                selfSay("Remember, you need to bring to me 70 Magma Foot, 600 Essence 200 Pot Of Lava...", cid)
                talkState[talkUser] = 0
                return true
            end
		end
		
        for i = 1, #need do
            doPlayerRemoveItem(cid, need[i].id, need[i].qt)
        end
        for i = 1, #rewards do
            doPlayerAddItem(cid, rewards[i].id, rewards[i].qt)
		     doPlayerAddExperience(cid, 100000)
        end
	    selfSay("thanks you, bye!", cid)
        setPlayerStorageValue(cid, stoFinish, 1)
        talkState[talkUser] = 0
        return true
    end
    return true
end       
                    
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
   