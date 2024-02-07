local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onThink()                     npcHandler:onThink()                     end
function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg)  end

function greetCallback(cid)
  doSendDialogNpc(cid, getNpcId(), ("Ol� "..getCreatureName(cid)..", voc� veio atr�s do seu pok�mon inical?"), "Sim&Fechar")
  return true             
end

function creatureSayCallback(cid, type, msg)
   if not npcHandler:isFocused(cid) then
      return false
   end

   local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
   msg = msg:lower()
   ---------
   local stoFinish = 180033
   ---------
   if msgcontains(msg, 'Sim') or msgcontains(msg, 'sim') then
      if getPlayerStorageValue(cid, stoFinish) >= 1 then
         doSendDialogNpc(cid, getNpcId(), "Voc� j� escolheu seu pok�mon inicial, boa sorte em sua jornada!", "Fechar")
         talkState[talkUser] = 0
         return true
      end      
      doSendDialogNpc(cid, getNpcId(), "Voc� chegou atrasado, v�rios treinadores j� vieram e levaram a maioria dos pok�mons que tenho aqui em meu laborat�rio, mas veja o que tem em minha bancada...", "Ok&Fechar")
      talkState[talkUser] = 1
      return true 
   elseif msgcontains(msg, 'Ok') or msgcontains(msg, 'ok') and talkState[talkUser] == 1 then
      doSendDialogNpc(cid, getNpcId(), "Aperte na bancada pokemon na minha frente para exibir os pok�mons dispon�veis!", "Ja foram todos&Fechar")
      talkState[talkUser] = 2
      return true 
   elseif msgcontains(msg, 'Ja Foram Todos') or msgcontains(msg, 'ja foram todos') and talkState[talkUser] == 2 then
      if getPlayerStorageValue(cid, 18057) <= 0 then
         doSendDialogNpc(cid, getNpcId(), "Olhe direito!", "Fechar")
         talkState[talkUser] = 0
         return true
      end
      doSendDialogNpc(cid, getNpcId(), "Olha parece que j� levaram todos os pok�mons que eu tinha, lamento jovem...", "Cheguei tarde&Fechar")
      talkState[talkUser] = 3
      return true      
   elseif msgcontains(msg, 'Cheguei Tarde') or msgcontains(msg, 'cheguei tarde') and talkState[talkUser] == 3 then
      doSendDialogNpc(cid, getNpcId(), "Na verdade restou apenas um, mas n�o sei se � uma boa escolha", "Aceito&Fechar")
      talkState[talkUser] = 4
      return true    
   elseif msgcontains(msg, 'Aceito') or msgcontains(msg, 'aceito') and talkState[talkUser] == 4 then
      doSendDialogNpc(cid, getNpcId(), "Ent�o tudo bem, aqui est�, mas tome cuidado!", "Fechar")
      addPokeToPlayer(cid, "Baby Pikachu", 0, 0, 'normal', true)
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