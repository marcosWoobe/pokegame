
function onUse(cid, item, topos, item2, frompos)
    if playerHasTv(cid) then
        doPlayerSendCancel(cid, "Você não pode assistindo enquanto grava.")
        return false
    end
    doSendChannelsTv(cid)
	return true
end