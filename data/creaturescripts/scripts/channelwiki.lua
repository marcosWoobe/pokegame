function onJoinChannel(cid, channel, users)
    if (channel == CHANNEL_HELP) then
        addEvent(function(cid)
            if (isCreature(cid)) then
                doPlayerSendChannelMessage(cid, "", "Procurando ajuda? Acesse nosso site: http://pokenumb.ddns.net/ / Looking for help? Access our site: http://pokenumb.ddns.net/", TALKTYPE_CHANNEL_RN, channel)
                doPlayerSendChannelMessage(cid, "", "Digite /commands para visualizar os comandos. / Type /commands to view the commands.", TALKTYPE_CHANNEL_RN, channel)
                doPlayerSendChannelMessage(cid, "", "Antes de perguntar, pesquise no canal Wiki Chat! / Before asking, take a look at the Wiki Chat!", TALKTYPE_CHANNEL_RN, channel)
                
                if (not isTutor(cid)) then
                    local msg = {}
                    msg[1] = "Online tutors: "

                    for guid, _ in pairs(ONLINE_TUTORS) do
                        msg[#msg +1] = getPlayerNameByGUID(guid, false, false)
                        msg[#msg +1] = ", "
                    end

                    if (#msg == 1) then
                        msg[2] = "None."
                    else
                        msg[#msg] = "."
                    end

                    doPlayerSendChannelMessage(cid, "", table.concat(msg), TALKTYPE_CHANNEL_RN, channel)
                end
            end
        end, 1000, cid)
        return true
    end

    -- if (channel >= CHANNEL_1_POKEMON and channel <= CHANNEL_PACIFIDLOG and
            -- (channel < CHANNEL_PVP_ARENA_FIRST or channel > CHANNEL_PVP_ARENA_LAST)) then
        if (channel == CHANNEL_WIKI_CHAT) then
            addEvent(function(cid)
                if (isCreature(cid)) then
                    WikiChat.handler:greet(cid)
                end
            end, 150, cid)
            return true
        end
		-- return false
    -- end
	return true
end
