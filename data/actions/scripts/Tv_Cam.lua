
function onUse(cid, item, topos, item2, frompos)
    if playerHasTv(cid) then
        doPlayerSendCancel(cid, "Voce j� est� gravando.")
        return false
    end
	setCreateTvChanel(cid)
	return true
end