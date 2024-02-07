local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onThink()                     npcHandler:onThink()                     end
function onCreatureAppear(cid)         npcHandler:onCreatureAppear(cid)         end
function onCreatureDisappear(cid)      npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg)  end

function greetCallback(cid)
  doSendDialogNpc(cid, getNpcId(), "Olá jovem, está querendo prticipar do evento?", "Sim&Não&Fechar")
  return true             
end

local tabelaDiamond = {
   ["Boost Catch"] = { price = 1080, itemid = 25208, count = 1 },
   ["Boost Loot"] = { price = 1260, itemid = 25207, count = 1 },
   ["Boost XP"] = { price = 900, itemid = 23463, count = 1 },
   ["Essence Shiny"] = { price = 810, itemid = 23418, count = 15 },
   ["Box Held T4"] = { price = 1440, itemid = 23477, count = 1 },
   ["Boost Stone"] = { price = 360, itemid = 12618, count = 2 },
   ["Shiny Charm"] = { price = 1440, itemid = 23468, count = 1 },
   ["Normal Bike"] = { price = 540, itemid = 17871, count = 1 },
   ["Outfit Zapdos"] = { price = 2160, storage = 201934 },
   ["Outfit Moltres"] = { price = 2160, storage = 201935 },
   ["Outfit Articuno"] = { price = 2160, storage = 201936 },
   ["Ticket Invasão"] = { price = 540, itemid = 25209, count = 1 },
}

-- -- evento
-- local tabelaDiamond = {
--    ["Boost Catch"] = { price = 540, itemid = 25208, count = 1 },
--    ["Boost Loot"] = { price = 630, itemid = 25207, count = 1 },
--    ["Boost XP"] = { price = 450, itemid = 23463, count = 1 },
--    ["Essence Shiny"] = { price = 405, itemid = 23418, count = 15 },
--    ["Box Held T4"] = { price = 720, itemid = 14186, count = 1 },
--    ["Boost Stone"] = { price = 180, itemid = 12618, count = 2 },
--    ["Shiny Charm"] = { price = 720, itemid = 23468, count = 1 },
--    ["Normal Bike"] = { price = 270, itemid = 17871, count = 1 },
--    ["Outfit Zapdos"] = { price = 1080, storage = 201934 },
--    ["Outfit Moltres"] = { price = 1080, storage = 201935 },
--    ["Outfit Articuno"] = { price = 1080, storage = 201936 },
--    ["Ticket Invasão"] = { price = 270, itemid = 25209, count = 1 },
-- }

function creatureSayCallback(cid, type, msg)
   if not npcHandler:isFocused(cid) then
      return false
   end

   local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
   msg = msg:lower()
   ---------
   if msgcontains(msg, 'Sim') or msgcontains(msg, 'sim') then
      doSendDialogNpc(cid, getNpcId(), "O evento funciona da seguinte maneira, todos os pokémons do servidor estão dropando Green Diamonds Event por tempo limitado, você pode usar isso para trocar por diversos items.", "Items&Fechar")
      talkState[talkUser] = 1
      return true 
   elseif msgcontains(msg, 'não') or msgcontains(msg, 'Não') and talkState[talkUser] == 1 then
      doSendDialogNpc(cid, getNpcId(), "Ok, volte quando quiser!", "Fechar")
      talkState[talkUser] = 0
      return true
   elseif msgcontains(msg, 'Items') or msgcontains(msg, 'items') and talkState[talkUser] == 1 then
      doSendDialogNpc(cid, getNpcId(), ("Tenho os seguintes itens para vender: \n Boost Catch 20% (2h) ["..tabelaDiamond["Boost Catch"].price.." Diamonds] \n Boost Loot 20% (2h) ["..tabelaDiamond["Boost Loot"].price.." Diamonds] \n Boost XP 20% (1h) ["..tabelaDiamond["Boost XP"].price.." Diamonds] \n Essence Shiny (15x) ["..tabelaDiamond["Essence Shiny"].price.." Diamonds] \n Box Held T4 (1x) ["..tabelaDiamond["Box Held T4"].price.." Diamonds] \n Boost Stone (2x) ["..tabelaDiamond["Boost Stone"].price.." Diamonds] \n Shiny Charm 3d (1x) ["..tabelaDiamond["Shiny Charm"].price.." Diamonds] \n Normal Bike inicial (1x) ["..tabelaDiamond["Normal Bike"].price.." Diamonds] \n Outfit Zapdos Event (1x) ["..tabelaDiamond["Outfit Zapdos"].price.." Diamonds] \n Outfit Moltres Event (1x) ["..tabelaDiamond["Outfit Moltres"].price.." Diamonds] \n Outfit Articuno Event (1x) ["..tabelaDiamond["Outfit Articuno"].price.." Diamonds] \n Ticket Invasão Premium (1x) ["..tabelaDiamond["Ticket Invasão"].price.." Diamonds] "), "Boost Catch&Boost Loot&Boost XP&Essence Shiny&Box Held T4&Boost Stone&Shiny Charm&Normal Bike&Outfit Zapdos&Outfit Moltres&Outfit Articuno&Ticket Invasão")
      talkState[talkUser] = 2
      return true 
   elseif msgcontains(msg, 'Boost Catch') or msgcontains(msg, 'boost catch') and talkState[talkUser] == 2 then
      if doPlayerRemoveItem(cid,25206,tabelaDiamond["Boost Catch"].price) then 
         doPlayerAddItem(cid,tabelaDiamond["Boost Catch"].itemid,tabelaDiamond["Boost Catch"].count)
         doSendDialogNpc(cid, getNpcId(), "Obrigado por participar do evento, tome aqui seu item!!", "Fechar")
         talkState[talkUser] = 0
         return true    
      else
         doSendDialogNpc(cid, getNpcId(), "Você não tem os green diamonds necessários para comprar esse item!", "Fechar")
         talkState[talkUser] = 0
         return true    
      end
   elseif msgcontains(msg, 'Boost Loot') or msgcontains(msg, 'boost loot') and talkState[talkUser] == 2 then
      if doPlayerRemoveItem(cid,25206,tabelaDiamond["Boost Loot"].price) then 
         doPlayerAddItem(cid,tabelaDiamond["Boost Loot"].itemid,tabelaDiamond["Boost Loot"].count)
         doSendDialogNpc(cid, getNpcId(), "Obrigado por participar do evento, tome aqui seu item!!", "Fechar")
         talkState[talkUser] = 0
         return true    
      else
         doSendDialogNpc(cid, getNpcId(), "Você não tem os green diamonds necessários para comprar esse item!", "Fechar")
         talkState[talkUser] = 0
         return true    
      end  
   elseif msgcontains(msg, 'Boost XP') or msgcontains(msg, 'boost xp') and talkState[talkUser] == 2 then
      if doPlayerRemoveItem(cid,25206,tabelaDiamond["Boost XP"].price) then 
         doPlayerAddItem(cid,tabelaDiamond["Boost XP"].itemid,tabelaDiamond["Boost XP"].count)
         doSendDialogNpc(cid, getNpcId(), "Obrigado por participar do evento, tome aqui seu item!!", "Fechar")
         talkState[talkUser] = 0
         return true    
      else
         doSendDialogNpc(cid, getNpcId(), "Você não tem os green diamonds necessários para comprar esse item!", "Fechar")
         talkState[talkUser] = 0
         return true    
      end
   elseif msgcontains(msg, 'Essence Shiny') or msgcontains(msg, 'essence shiny') and talkState[talkUser] == 2 then
      if doPlayerRemoveItem(cid,25206,tabelaDiamond["Essence Shiny"].price) then 
         doPlayerAddItem(cid,tabelaDiamond["Essence Shiny"].itemid,tabelaDiamond["Essence Shiny"].count)
         doSendDialogNpc(cid, getNpcId(), "Obrigado por participar do evento, tome aqui seu item!!", "Fechar")
         talkState[talkUser] = 0
         return true    
      else
         doSendDialogNpc(cid, getNpcId(), "Você não tem os green diamonds necessários para comprar esse item!", "Fechar")
         talkState[talkUser] = 0
         return true    
      end
   elseif msgcontains(msg, 'Box Held T4') or msgcontains(msg, 'box held t4') and talkState[talkUser] == 2 then
      if doPlayerRemoveItem(cid,25206,tabelaDiamond["Box Held T4"].price) then 
         doPlayerAddItem(cid,tabelaDiamond["Box Held T4"].itemid,tabelaDiamond["Box Held T4"].count)
         doSendDialogNpc(cid, getNpcId(), "Obrigado por participar do evento, tome aqui seu item!!", "Fechar")
         talkState[talkUser] = 0
         return true    
      else
         doSendDialogNpc(cid, getNpcId(), "Você não tem os green diamonds necessários para comprar esse item!", "Fechar")
         talkState[talkUser] = 0
         return true    
      end
   elseif msgcontains(msg, 'Boost Stone') or msgcontains(msg, 'boost stone') and talkState[talkUser] == 2 then
      if doPlayerRemoveItem(cid,25206,tabelaDiamond["Boost Stone"].price) then 
         doPlayerAddItem(cid,tabelaDiamond["Boost Stone"].itemid,tabelaDiamond["Boost Stone"].count)
         doSendDialogNpc(cid, getNpcId(), "Obrigado por participar do evento, tome aqui seu item!!", "Fechar")
         talkState[talkUser] = 0
         return true    
      else
         doSendDialogNpc(cid, getNpcId(), "Você não tem os green diamonds necessários para comprar esse item!", "Fechar")
         talkState[talkUser] = 0
         return true    
      end
   elseif msgcontains(msg, 'Shiny Charm') or msgcontains(msg, 'shiny charm') and talkState[talkUser] == 2 then
      if doPlayerRemoveItem(cid,25206,tabelaDiamond["Shiny Charm"].price) then 
         doPlayerAddItem(cid,tabelaDiamond["Shiny Charm"].itemid,tabelaDiamond["Shiny Charm"].count)
         doSendDialogNpc(cid, getNpcId(), "Obrigado por participar do evento, tome aqui seu item!!", "Fechar")
         talkState[talkUser] = 0
         return true    
      else
         doSendDialogNpc(cid, getNpcId(), "Você não tem os green diamonds necessários para comprar esse item!", "Fechar")
         talkState[talkUser] = 0
         return true    
      end
   elseif msgcontains(msg, 'Normal Bike') or msgcontains(msg, 'normal bike') and talkState[talkUser] == 2 then
      if doPlayerRemoveItem(cid,25206,tabelaDiamond["Normal Bike"].price) then 
         doPlayerAddItem(cid,tabelaDiamond["Normal Bike"].itemid,tabelaDiamond["Normal Bike"].count)
         doSendDialogNpc(cid, getNpcId(), "Obrigado por participar do evento, tome aqui seu item!!", "Fechar")
         talkState[talkUser] = 0
         return true    
      else
         doSendDialogNpc(cid, getNpcId(), "Você não tem os green diamonds necessários para comprar esse item!", "Fechar")
         talkState[talkUser] = 0
         return true    
      end   
   elseif msgcontains(msg, 'Ticket Invasão') or msgcontains(msg, 'ticket invasão') and talkState[talkUser] == 2 then
      if doPlayerRemoveItem(cid,25206,tabelaDiamond["Ticket Invasão"].price) then 
         doPlayerAddItem(cid,tabelaDiamond["Ticket Invasão"].itemid,tabelaDiamond["Ticket Invasão"].count)
         doSendDialogNpc(cid, getNpcId(), "Obrigado por participar do evento, tome aqui seu item!!", "Fechar")
         talkState[talkUser] = 0
         return true    
      else
         doSendDialogNpc(cid, getNpcId(), "Você não tem os green diamonds necessários para comprar esse item!", "Fechar")
         talkState[talkUser] = 0
         return true    
      end         
   elseif msgcontains(msg, 'Outfit Zapdos') or msgcontains(msg, 'outfit zapdos') and talkState[talkUser] == 2 then
      if doPlayerRemoveItem(cid,25206,tabelaDiamond["Outfit Zapdos"].price) then
         setPlayerStorageValue(cid, tabelaDiamond["Outfit Zapdos"].storage, 1)
         doSendDialogNpc(cid, getNpcId(), "Obrigado por participar do evento, pegue sua outfit!!", "Fechar")
         talkState[talkUser] = 0
         return true    
      else
         doSendDialogNpc(cid, getNpcId(), "Você não tem os green diamonds necessários para comprar esse item!", "Fechar")
         talkState[talkUser] = 0
         return true    
      end  
   elseif msgcontains(msg, 'Outfit Moltres') or msgcontains(msg, 'outfit moltres') and talkState[talkUser] == 2 then
      if doPlayerRemoveItem(cid,25206,tabelaDiamond["Outfit Moltres"].price) then
         setPlayerStorageValue(cid, tabelaDiamond["Outfit Moltres"].storage, 1)
         doSendDialogNpc(cid, getNpcId(), "Obrigado por participar do evento, pegue sua outfit!!", "Fechar")
         talkState[talkUser] = 0
         return true    
      else
         doSendDialogNpc(cid, getNpcId(), "Você não tem os green diamonds necessários para comprar esse item!", "Fechar")
         talkState[talkUser] = 0
         return true    
      end           
   elseif msgcontains(msg, 'Outfit Articuno') or msgcontains(msg, 'outfit articuno') and talkState[talkUser] == 2 then
      if doPlayerRemoveItem(cid,25206,tabelaDiamond["Outfit Articuno"].price) then
         setPlayerStorageValue(cid, tabelaDiamond["Outfit Articuno"].storage, 1)
         doSendDialogNpc(cid, getNpcId(), "Obrigado por participar do evento, pegue sua outfit!!", "Fechar")
         talkState[talkUser] = 0
         return true    
      else
         doSendDialogNpc(cid, getNpcId(), "Você não tem os green diamonds necessários para comprar esse item!", "Fechar")
         talkState[talkUser] = 0
         return true    
      end                        
   elseif msgcontains(msg:lower(), "fechar") or msgcontains(msg:lower(), "Fechar") then
      doSendDialogNpcClose(cid)
      npcHandler:unGreet(cid)
   end
   return true
end       
                    
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())