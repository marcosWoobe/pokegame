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

local config = {
["Naturia GrandMaster"] = {clanname = 'Naturia', normal = "Vileplume", shiny = "Shiny Vileplume"},
["Seavell GrandMaster"] = {clanname = 'Seavell', normal = "Vaporeon", shiny = "Shiny Vaporeon"},
["Volcanic GrandMaster"] = {clanname = 'Volcanic', normal = "Flareon", shiny = "Shiny Flareon"},
["Wingeon GrandMaster"] = {clanname = 'Wingeon', normal = "Fearow", shiny = "Shiny Fearow"},
["Malefic GrandMaster"] = {clanname = 'Malefic', normal = "Nidoking", shiny = "Shiny Nidoking"},
["Psycraft GrandMaster"] = {clanname = 'Psycraft', normal = "Hypno", shiny = "Shiny Hypno"},
["Gardestrike GrandMaster"] = {clanname = 'Gardestrike', normal = "Hitmontop", shiny = "Shiny Hitmontop"},
["Orebound GrandMaster"] = {clanname = 'Orebound', normal = "Golem", shiny = "Shiny Golem"},
["Raibolt GrandMaster"] = {clanname = 'Raibolt', normal = "Jolteon", shiny = "Shiny Jolteon"}, 
["Ironhard GrandMaster"] = {clanname = 'Ironhard', normal = "Lucario", shiny = "Shiny Lucario"}
}

local cfg = config[getNpcName()]

local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
       
        if (msgcontains(msg, 'clan') or msgcontains(msg, 'Clan')) then   --alterado v1.7
          
		  if getPlayerClanName(cid) == cfg.clanname then       --alterado v1.7
              selfSay("Voc� j� � do clan "..cfg.clanname..".", cid)
              talkState[talkUser] = 0
              return true
           elseif getPlayerClanNum(cid) ~= -1 then            --alterado v1.7
              selfSay("Voc� j� � de outro clan.", cid)
              talkState[talkUser] = 0
              return true    
           end
		   
              selfSay("Ol� voc� deseja se tornar um membro "..cfg.clanname.."?", cid)
              talkState[talkUser] = 2  
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) and talkState[talkUser] == 2 then
		
           if getPlayerLevel(cid) < 80 then
              selfSay("Voc� precisa ser level 80 para ingressar no clan!", cid)
              talkState[talkUser] = 0
              return true
           end
		   
           selfSay("Pronto, seja bem vindo ao clan "..cfg.clanname.." se precisar de {informacao} � s� me contatar.", cid)
           setPlayerClan(cid, cfg.clanname)  --alterado v1.7
           talkState[talkUser] = 0
		   
        elseif (msgcontains(msg, 'informacao') or msgcontains(msg, 'Informacao')) then    --alterado v1.7
		
		  if getPlayerClanName(cid) ~= cfg.clanname then       --alterado v1.7
              selfSay("Voc� n�o � do nosso clan.", cid)
              talkState[talkUser] = 0
              return true
		  end
		
           selfSay("Voc� deseja informa��es sobre, {Dungeons}, {Level}, {Pontos}, {Chaves}?", cid)	
           talkState[talkUser] = 5
		   
        elseif (msgcontains(msg, 'dungeons') or msgcontains(msg, 'Dungeons')) and talkState[talkUser] == 5 then 
		
           selfSay("Para acessar as dungeons basta entrar pela porta dimensional localizada no 3� andar da base do clan, voc� s� pode acessar as �reas do seu pr�prio cl�, � necess�rio ter a chave referente a dungeon que ir� entrar.", cid)	
           talkState[talkUser] = 0	
		   
        elseif (msgcontains(msg, 'level') or msgcontains(msg, 'Level')) and talkState[talkUser] == 5 then 
		
           selfSay("O seu level do clan impacta diretamente na sua for�a, o calculo � feito a partir do rank + level.", cid)		   
           talkState[talkUser] = 0		
		   
        elseif (msgcontains(msg, 'Pontos') or msgcontains(msg, 'pontos')) and talkState[talkUser] == 5 then 
		
           selfSay("Voc� obtem pontos acessando as dungeons, eles servem para adquirir itens exclusivos do cl�. Quanto maior o rank do player, maior � a quantidade de pontos por dungeon.", cid)	
           talkState[talkUser] = 0		
		   
        elseif (msgcontains(msg, 'Chaves') or msgcontains(msg, 'chaves')) and talkState[talkUser] == 5 then 
		
           selfSay("Voc� pode adquirir as chaves fazendo a Daily Kill, Daily Catch.", cid)	
           talkState[talkUser] = 0		   
		   
        elseif (msgcontains(msg, 'shiny') or msgcontains(msg, 'Shiny')) then    --alterado v1.7
		
           if getPlayerClanName(cid) ~= cfg.clanname then    --alterado v1.7
              selfSay("Voc� precisa ser do clan "..cfg.clanname..".", cid)
              return true
           else   
              selfSay("Para transformar seu "..cfg.normal.." em "..cfg.shiny.."? ir� custar 2kk!", cid)
              talkState[talkUser] = 4
           end
		   
        elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'Yes')) and talkState[talkUser] == 4 then
          
		  if getPlayerSlotItem(cid, 8).uid <= 0 then
              selfSay("Coloque seu pok�mon no slot principal!", cid)
              talkState[talkUser] = 0
		      return true
	       end
		   
		   if getPlayerClanRank(cid) < 3 then
	          selfSay("Voc� precisa ser do rank 3 ou mais.", cid)
              talkState[talkUser] = 0
              return true
           end
		   --alterado v1.2
	       if #getCreatureSummons(cid) >= 1 then
	          selfSay("Seu pok�mon precisa estar dentro da pok�bola!", cid)
              talkState[talkUser] = 0
              return true
           end

         if getPlayerStorageValue(cid, 451133) == 1 then
            selfSay("Voc� s� pode fazer um shiny de cl� por conta.", cid)
            talkState[talkUser] = 0
            return true
         end           
	       
	       local pb = getPlayerSlotItem(cid, 8).uid
	       
	       if getItemAttribute(pb, "poke") ~= cfg.normal then
	          selfSay("Voc� n�o tem um "..cfg.normal.." no slot principal.", cid)
              talkState[talkUser] = 0
              return true
           end
              
           if not getItemAttribute(pb, "boost") or getItemAttribute(pb, "boost") < 20 then
              selfSay("Voc� n�o tem um "..cfg.normal.." boosted +20!", cid)
              talkState[talkUser] = 0
              return true
           end

           if doPlayerRemoveMoney(cid, 200000000) == true then
			selfSay("Pronto j� est� feito, bom uso!", cid)
			doItemSetAttribute(pb, "hp", 1)
			doItemSetAttribute(pb, "poke", cfg.shiny)
         doItemSetAttribute(pb, "color1", 0)
         doItemSetAttribute(pb, "color2", 0)
         doItemSetAttribute(pb, "color3", 0) 
         doItemSetAttribute(pb, "color4", 0) 
         doItemSetAttribute(pb, "addonNow", getOutfitPoke(cfg.shiny))
			doItemSetAttribute(pb, "description", "Contains a "..cfg.shiny..".")
			doItemEraseAttribute(pb, "boost")
         doTransformItem(getPlayerSlotItem(cid, 7).uid, fotos[cfg.shiny])
         if icons[cfg.shiny] then
            idMx = icons[cfg.shiny].on
         else
             idMx = pokeballs["normal"].on
         end
         doTransformItem(pb, idMx)
         setPlayerStorageValue(cid, 451133, 1)
			  
			if useKpdoDlls then
				doCreatureExecuteTalkAction(cid, "/pokeread")
	        end
			  
			talkState[talkUser] = 0
			return true
	      else
	          selfSay("Voc� n�o tem dinheiro!", cid)
	          talkState[talkUser] = 0
	          return true
          end
        end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())             