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


if (msgcontains(msg, 'Shiny') or msgcontains(msg, 'shiny')) then --alterado v1.7

selfSay("Voc� Deseja fazer seu Dark Abra, ent�o traga-me um Abra+20 e 200k!", cid)
talkState[talkUser] = 1
elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) and talkState[talkUser] == 1 then
if getPlayerSlotItem(cid, 8).uid <= 0 then
selfSay("Sorry, you don't have a pokemon in the main slot!", cid)
talkState[talkUser] = 0
return true
end 
--alterado v1.2
if #getCreatureSummons(cid) >= 1 then
selfSay("Go back your pokemon!", cid)
talkState[talkUser] = 0
return true
end

local pb = getPlayerSlotItem(cid, 8).uid

if getItemAttribute(pb, "poke") ~= "Abra" then
selfSay("Put a Abra's pokeball atleast +20 in main slot!", cid)
talkState[talkUser] = 0
return true
end

if not getItemAttribute(pb, "boost") or getItemAttribute(pb, "boost") < 50 then
selfSay("Sorry, your Abra is not boosted +20!", cid)
talkState[talkUser] = 0
return true
end
--100000 = 1k, 1000000 = 10k, 10000000 = 100k
if doPlayerRemoveMoney(cid, 60000000) == true then
selfSay("So there is it! Enjoy!", cid)
doItemSetAttribute(pb, "hp", 1)
doItemSetAttribute(pb, "poke", "Dark Abra")
doItemSetAttribute(pb, "description", "Contains a Dark Abra.")
doItemEraseAttribute(pb, "boost")
doTransformItem(getPlayerSlotItem(cid, 7).uid, fotos["Dark Abra"])
if useKpdoDlls then
doCreatureExecuteTalkAction(cid, "/pokeread")
end
talkState[talkUser] = 0
return true
else
selfSay("Voc� n�o tem dinheiro suficiente!", cid)
talkState[talkUser] = 0
return true
end

end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 