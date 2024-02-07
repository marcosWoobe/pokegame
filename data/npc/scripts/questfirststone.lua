local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onThink()                     npcHandler:onThink()                     end
function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg)  end

function greetCallback(cid)
  doSendDialogNpc(cid, getNpcId(), "Olá jovem, está perdido??", "Professor&Sim&Fechar")
  return true             
end

function creatureSayCallback(cid, type, msg)
   if not npcHandler:isFocused(cid) then
      return false
   end

   local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
   msg = msg:lower()
   ---------
   local stoFinish = 18050
   ---------
   if msgcontains(msg, 'Professor') or msgcontains(msg, 'professor') then
      if getPlayerStorageValue(cid, stoFinish) >= 1 then
         doSendDialogNpc(cid, getNpcId(), "Você já me entregou minha pesquisa, agora volte pra casa! Aqui é perigoso!", "Fechar")
         talkState[talkUser] = 0
         return true
      end
      if not getPlayerStorageValue(cid, 18055) == 0 then
         doSendDialogNpc(cid, getNpcId(), "Você não pode me ajudar...", "Fechar")
         talkState[talkUser] = 0
         return true
      end      
      doSendDialogNpc(cid, getNpcId(), "Sim! A minha aluna Amanda andou falando com você?", "Ela Te Mandou Algo&Fechar")
      talkState[talkUser] = 1
      return true 
   elseif msgcontains(msg, 'sim') or msgcontains(msg, 'Sim') and talkState[talkUser] == 1 then
      doSendDialogNpc(cid, getNpcId(), "Tome cuidado! Esta caverna é realmente perigosa!", "Fechar")
      talkState[talkUser] = 0
      return true

   elseif msgcontains(msg, 'Ela Te Mandou Algo') or msgcontains(msg, 'ela te mandou algo') and talkState[talkUser] == 1 then
      doSendDialogNpc(cid, getNpcId(), "Minha pesquisa! Nossa estava precisando dela! Achei que ia ter que voltar ao laboratório busca-la, obrigado Jovem! Por entrar nesta caverna perigosa e me poupar o trabalho de ir até meu laboratório, por favor, escolha uma dessas recompensas. Não é muito, mas é tudo que tenho por hora...", "Fire Stone&Water Stone&Leaf Stone")
      talkState[talkUser] = 2
      return true 
   elseif msgcontains(msg, 'Fire Stone') or msgcontains(msg, 'fire stone') and talkState[talkUser] == 2 then
      doPlayerAddItem(cid,11447,1)
      doPlayerAddExperience(cid, 5000)
      doSendDialogNpc(cid, getNpcId(), "Mais uma vez obrigado, mas agora volte pra casa! Aqui é perigoso!", "Fechar")
      setPlayerStorageValue(cid, stoFinish, 1)
      talkState[talkUser] = 0
      return true      
   elseif msgcontains(msg, 'Water Stone') or msgcontains(msg, 'water stone') and talkState[talkUser] == 2 then
      doPlayerAddItem(cid,11442,1)
      doPlayerAddExperience(cid, 5000)
      doSendDialogNpc(cid, getNpcId(), "Mais uma vez obrigado, mas agora volte pra casa! Aqui é perigoso!", "Fechar")
      setPlayerStorageValue(cid, stoFinish, 1)
      talkState[talkUser] = 0
      return true     
   elseif msgcontains(msg, 'Leaf Stone') or msgcontains(msg, 'leaf stone') and talkState[talkUser] == 2 then
      doPlayerAddItem(cid,11441,1)
      doPlayerAddExperience(cid, 5000)
      doSendDialogNpc(cid, getNpcId(), "Mais uma vez obrigado, mas agora volte pra casa! Aqui é perigoso!", "Fechar")
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