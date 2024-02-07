local storage = 121212 --storage da quest

function onUse(cid, item, frompos, item2, topos)
local store = 54178 -- storage q salva o delay
local delay = 4 -- tempo em segundos de delay

    if getPlayerStorageValue(cid, store) - os.time() <= 0 then

        if getPlayerStorageValue(cid, storage) == 0 then
            doPlayerSendCancel(cid, "Você já usou o limite de revives para esta missão.")
            return true
        elseif getPlayerStorageValue(cid, 990) >= 1 then
            doPlayerSendCancel(cid, "Você não pode usar revive durante batalhas de ginásio.")
            return true
        elseif getPlayerStorageValue(cid, 84929) >= 1 then--torneio viktor
            doPlayerSendCancel(cid, "Você não pode usar revive durante o torneio pvp.")
            return true
        -- elseif type(getPlayerStorageValue(cid, 89142)) == "string" then--duel viktor  
        --     doPlayerSendCancel(cid, "Você não pode fazer isso durante um duelo.") --alterado v1.6
        --     return true
        elseif isPlayer(item2.uid) then
            doPlayerSendCancel(cid, "Por favor, use revive apenas em pokeballs.")
            return true
        end
    	
    	local btype = getPokeballType(item2.itemid)
    	local ball = pokeballs[btype]

        if not ball then 
            doPlayerSendCancel(cid, "Por favor, use reviver apenas em pokeballs.")
            return true
        end

    	if item2.itemid == ball.use then
            doPlayerSendCancel(cid, "Por favor, volte seu pokemon para usar o revive.")
            return true
        end

        if getPlayerSlotItem(cid, 8).uid == 0 then 
            doPlayerSendCancel(cid, "Por favor, coloque um pokémon no slot principal.")
            return true
        end

        if getPlayerLevel(cid) > 150 and not getPlayerGroupId(cid) == 6 then
    		if item2.itemid == ball.on then
    		    doPlayerSendCancel(cid, "Seu pokémon está vivo, e não precisa ser revivido.")
    		    return true
    		end
    	end
    	
    	if item2.itemid ~= ball.use then 

            doTransformItem(item2.uid, ball.on)
            doSetItemAttribute(item2.uid, "hp", 1)
            for c = 1, 15 do
                local str = "move"..c
                setCD(item2.uid, str, 0)
            end
            setCD(item2.uid, "control", 0)
            setCD(item2.uid, "blink", 0) --alterado v1.6
            doSendMagicEffect(getThingPos(cid), 14)
            doRemoveItem(item.uid, 1)
            doCureBallStatus(getPlayerSlotItem(cid, 8).uid, "all")
            doCureStatus(cid, "all", true)
            cleanBuffs2(item2.uid) --alterado v1.5
            setPlayerStorageValue(cid, store, os.time() + delay)
               
            if getPlayerStorageValue(cid, storage) > 0 then
                setPlayerStorageValue(cid, storage, getPlayerStorageValue(cid, storage)-1)
            end

            if #getCreatureSummons(cid) >= 1 then
    			local item = getPlayerSlotItem(cid, 8)
    			doPlayerSendCancel(cid, "KGT,"..getItemAttribute(item.uid, "ballorder").."|".."0")
    			doPlayerSendCancel(cid, "")
    		end

            return true
        end

    else
        doPlayerSendCancel(cid, "Você tem que esperar ".. getPlayerStorageValue(cid, store) - os.time() .." segundo(s) para usar novamente.")
        doSendMagicEffect(getPlayerPosition(cid), 2)
    end

    return true
end