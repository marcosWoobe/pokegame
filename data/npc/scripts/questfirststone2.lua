local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

function onThink()                     npcHandler:onThink()                     end
function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg)  end

function greetCallback(cid)
  doSendDialogNpc(cid, getNpcId(), "Ol� jovem, voc� pode me ajudar?", "Sim&N�o&Fechar")
  talkState[talkUser] = 0
  return true             
end

function creatureSayCallback(cid, type, msg)
   if not npcHandler:isFocused(cid) then
      return false
   end

   msg = msg:lower()
   ---------
   local stoFinish = 18055
   ---------
   if msgcontains(msg, 'Sim') or msgcontains(msg, 'sim') and talkState[talkUser] == 0 then
      if getPlayerStorageValue(cid, stoFinish) == 1 then
         doSendDialogNpc(cid, getNpcId(), "Voc� j� falou comigo!", "Fechar")
         talkState[talkUser] = 0
         return true
      end
      doSendDialogNpc(cid, getNpcId(), "Meu professor esqueceu uma pesquisa em seu laborat�rio e precisa dela, mas esta caverna � muito perigosa e eu n�o entraria a�, tem como voc� levar a pesquisa at� ele pra mim?", "Sim&N�o&Fechar")
      talkState[talkUser] = 1
      return true 
   elseif msgcontains(msg, 'n�o') or msgcontains(msg, 'N�o') then
      doSendDialogNpc(cid, getNpcId(), "Ah entendo, mas de qualquer jeito obrigado!", "Fechar")
      talkState[talkUser] = 0
      return true      
   elseif msgcontains(msg, 'sim') or msgcontains(msg, 'Sim') and talkState[talkUser] == 1 then
      doSendDialogNpc(cid, getNpcId(), "Obrigado! Ele vai te agradecer muito por isso. Mas lembre-se de tomar cuidado, essa caverna � perigosa!", "Fechar")
      setPlayerStorageValue(cid, stoFinish, 1)
      talkState[talkUser] = 0
      return true
   elseif msgcontains(msg:lower(), "fechar") or msgcontains(msg:lower(), "Fechar") then
      doSendDialogNpcClose(cid)
      npcHandler:unGreet(cid)
   end
   return true
end       
                    
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())