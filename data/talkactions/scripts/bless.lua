function onSay(cid, words, param)
    if getPlayerStorageValue(cid, 53502) >= 1 then
        doPlayerSendCancel(cid,'You have already got one ﻿or more blessings!')
    else
        if getPlayerItemCount(cid, 2145) >= 3 then
            --[[doPlayerAddBlessing(cid, 1)
            doPlayerAddBlessing(cid, 2) 
            doPlayerAddBlessing(cid, 3)
            doPlayerAddBlessing(cid, 4)
            doPlayerAddBlessing(cid, 5)]]
			setPlayerStorageValue(cid, 53502, 1)  
            doSendMagicEffect(getPlayerPosition(cid), 28)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE, 'You have been blessed by the gods!')
			doPlayerRemoveItem(cid, 2145, 3)
        else
            doPlayerSendCancel(cid, "You need 3 Diamonds to get blessed!")
        end
    end
return TRUE
end