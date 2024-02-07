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

    if msgcontains(msg, 'torneio') or msgcontains(msg, 'enter') then

        if getPlayerItemCount(cid, torneio.revivePoke) >= 1 then
            selfSay('Voce nao Pode entrar no torneio com {revives}, por favor guarde eles e volte a falar comigo novamente.', cid)
            return true
        end

        selfSay('Voce quer Participar no torneio por 500 de Dollars?', cid)
        talkState[talkUser] = 2

    elseif talkState[talkUser] == 2 then

        if msgcontains(msg, 'yes') or msgcontains(msg, 'sim') then
            if os.date("%X") < torneio.startHour1 or os.date("%X") >= torneio.endHour1 then
                if os.date("%X") < torneio.startHour2 or os.date("%X") >= torneio.endHour2 then
                    --if os.date("%X") < torneio.startHour3 or os.date("%X") > torneio.endHour3 then
                     --   if os.date("%X") < torneio.startHour4 or os.date("%X") > torneio.endHour4 then
                    selfSay('As inscrições para o torneiro ainda não abriram, volte ás 14:50 PM, 19:50 PM todo os dias', cid)
                    talkState[talkUser] = 0
					return true
                        --end
                    --end
                end
            end
			if os.date("%X") >= torneio.startHour1 and os.date("%X") < torneio.endHour1 then
			    if getPlayerLevel(cid) < 80 or getPlayerLevel(cid) > 150 then
				    selfSay("Essa modalidade é apenas para players de Nivel: 80 até 150.", cid)
					talkState[talkUser] = 0
					return true
				end
		    elseif os.date("%X") >= torneio.startHour2 and os.date("%X") < torneio.endHour2 then
			    if getPlayerLevel(cid) < 151 or getPlayerLevel(cid) > 270 then
				    selfSay("Essa modalidade é apenas para players de Nivel: 151 até 270.", cid)
					talkState[talkUser] = 0
					return true
				end
			end
			
            if doPlayerRemoveMoney(cid, torneio.price) then
                doTeleportThing(cid, torneio.waitPlace)
                doPlayerSendTextMessage(cid, 21, "Bem vindo, esta e a sala de espera, voce espera aqui enquanto o torneio nao começa.")
            else
                selfSay('Voce não tem ('..torneio.price..') Dollars.', cid)
            end
        else
            selfSay('Certeza que voce não quer Participar? Ok, ate a Proxima', cid)
            talkState[talkUser] = 0
			return true
        end
    end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())