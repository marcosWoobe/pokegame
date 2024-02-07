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
      {id = 17340, qt = 80}, -- Dragon Tail
	  {id = 2111, qt = 600}, -- Snowball
	  {id = 17349, qt = 600}, -- Dragon Scale
	  {id = 17349, qt = 600}, -- Ice Orb
   }
   local rewards = {
      {id = 2152, qt = 70}, -- money
      {id = 11449, qt = 1}, -- Crystal Stone
	  {id = 11454, qt = 1}, -- Ice Stone
   }
   local stoFinish = 93840
   ---------
   
   if msgcontains(msg, 'help') or msgcontains(msg, 'ajuda') then
      if getPlayerStorageValue(cid, stoFinish) >= 1 then
         selfSay("Sorry, you already had done this quest.", cid)
         talkState[talkUser] = 0
         return true
      end
      selfSay("Hello my friend, can you bring to me: 80 Dragon Tail, 600 Snowball, 600 Dragon Scale, 600 Ice Orbs ? I will reward you!",cid)
      talkState[talkUser] = 1
      return true 
   elseif msgcontains(msg, 'yes') or msgcontains(msg, 'sim') and talkState[talkUser] == 1 then
        if getPlayerStorageValue(cid, stoFinish) >= 1 then
            selfSay("Sorry, you already had done this quest.", cid)
            talkState[talkUser] = 0
            return true
        end
      if getPlayerItemCount(cid, need[1].id) < need[1].qt then
         selfSay("You don't brought to me all the items what i asked for...", cid)
         selfSay("Remember, you need to bring to me 40 Dragon Tail, 300 Snowball, 300 Dragon Scale, 100 Ice Orbs...", cid)
         talkState[talkUser] = 0
         return true
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
   