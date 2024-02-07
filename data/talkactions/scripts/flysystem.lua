local cfg = {
    storage = 918311,
    fly_storage = 17000,
    seconds = 20,       --Quantos segundos até o jogador "cansar". Recomendo não colocar um valor muito alto.
}
function isWalkable(pos)-- by Nord / editado por Omega
    if isCreature(getTopCreature(pos).uid) then
        return false
    elseif getTileInfo(pos).protection then
        return false
    else
        if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid ~= 0 then 
            if hasProperty(getThingFromPos(pos).uid, 3) or hasProperty(getThingFromPos(pos).uid, 7) then
                return false
            end
        end
    end
return true
end
function autoWalk(cid, id)
local a = 0
    for i = 1, (cfg.seconds * 2) do
        if getPlayerStorageValue(cid, cfg.storage) < 1 then
            break
        end
        if a == (cfg.seconds * 2) then
            setPlayerStorageValue(cid, cfg.storage, -1)
            doPlayerSendTextMessage(cid, 27, "Your character is exausted.") 
            doCreatureSay(cid, "*Puff*", TALKTYPE_MONSTER)
            break
        end
        addEvent(function()
            if not isCreature(cid) then 
                if id then
                    return db.executeQuery("UPDATE player_storage SET value = -1 WHERE key = 918311 AND player_id = "..id)
                end
            end
            local tab = {
                [0] = {x = getThingPos(cid).x, y = getThingPos(cid).y - 1, z = getThingPos(cid).z},
                [1] = {x = getThingPos(cid).x + 1, y = getThingPos(cid).y, z = getThingPos(cid).z},
                [2] = {x = getThingPos(cid).x, y = getThingPos(cid).y + 1, z = getThingPos(cid).z},
                [3] = {x = getThingPos(cid).x - 1, y = getThingPos(cid).y, z = getThingPos(cid).z},
            }
            local lookdir = getCreatureLookDir(cid)
            local topos = tab[lookdir]
            if getPlayerStorageValue(cid, cfg.storage) < 1 then
                return true
            elseif isWalkable(topos) then
                if getTileThingByPos({x = topos.x, y = topos.y, z = topos.z, stackpos = 0}).itemid == 0 then
                    doCombatAreaHealth(cid, 0, topos, 0, 0, 0, CONST_ME_NONE)
                    doCreateItem(11676, 1, topos)
                end
                doTeleportThing(cid, topos)
                a = a + 1
            else
                setPlayerStorageValue(cid, cfg.storage, -1)
                doPlayerSendTextMessage(cid, 27, "Há algum objeto à sua frente impedindo a passagem.")
                return true
            end
        end, i * 500)
    end
end
function onSay(cid, words)
    if getPlayerStorageValue(cid, cfg.fly_storage) < 1 then
        return doPlayerSendCancel(cid, "Para usar este comando, você deve estar em Fly.")
    elseif getPlayerStorageValue(cid, cfg.storage) >= 1 then
        return setPlayerStorageValue(cid, cfg.storage, -1) and doPlayerSendTextMessage(cid, 27, "Comando !fly desativado.")
    else
        doPlayerSendTextMessage(cid, 27, "Comando !fly ativado.")
        setPlayerStorageValue(cid, cfg.storage, 1)
        autoWalk(cid, getPlayerGUID(cid))
    end
    return true
end