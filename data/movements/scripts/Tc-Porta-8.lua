local porta = {24876, 24877} -- porta fechada, porta pouco aberta, porta meio aberta, porta aberta
local pos = {x = 1093, y = 1345, z = 6} -- local onde vai fica a porta
local delay = 200 -- ela vai demorar 0.1 segundos para fica totalmente aberta ou totalmente fechada
local action = 54552 -- action que ta no .xml, se muda la vai ter que muda aqui também
 
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    if getTileItemById(pos, porta[1]).uid > 0 then
        for i = 1, (#porta - 1) do
            addEvent(function()
				if getTileItemById(pos, porta[i]).uid ~= 0 then
					doTransformItem(getTileItemById(pos, porta[i]).uid, porta[i + 1])
				end
            end, i * delay)
        end
    end
    return true
end 
 
function onStepOut(cid, item, position, lastPosition, fromPosition, toPosition, actor)
    local tab = {}
    for _, pid in ipairs(getPlayersOnline()) do
        if getTileInfo(getCreaturePosition(pid)).actionid == action then
            table.insert(tab, pid)
        end
		if getPlayerPokemons(pid) ~= nil then
			for _, sid in pairs (getPlayerPokemons(pid)) do
				if getTileInfo(getCreaturePosition(sid)).actionid == action then
					table.insert(tab, sid)
				end
			end
		end
    end
    if #tab == 0 then
        if getTileItemById(pos, porta[#porta]).uid > 0 then
            for i = 1, (#porta - 1) do
                addEvent(function()
					if getTileItemById(pos, porta[(#porta - i) + 1]).uid ~= 0 then
						doTransformItem(getTileItemById(pos, porta[(#porta - i) + 1]).uid, porta[(#porta - i)])
					end
                end, i * delay)
            end
        end
    end
    return true
end