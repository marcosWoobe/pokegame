local effect = 169                                   --by brun123    --alterado v1.9 \/ 
local premio = {
[15] = {reward = {2394, 2391, 12344, 12347, 12349}, count = {100, 30, 6, 40, 15}, str = },--pokeball greatball revive potion medicine
[30] = {reward = {11638, 2152, 2392, 12344, 12348}, count = {1, 30, 50, 15, 30}, str = },--box1 money ultraball revive greatpotion 
[50] = {reward = {11639, 2152}, count = {1, 50}, str = },--box2 5k
----------------------------------------------------------
--[80] = {reward = {boostexp, 2152}, count = {1, 100}, str = }, --doubleexp 10k
[100] = {reward = {11640}, count = {1}, str = }, --box3
[120] = {reward = {12618}, count = {1}, str = },--booststone
[150] = {reward = {12401}, count = {1}, str = },--shiny stone
--[180] = {reward = {box2, 2152}, count = {1, 50}, str = },--
--[200] = {reward = {boxheld, 2152}, count = {1}, str = }--box held

--feath 285

}

if level = 20
local function func(cid, position, corpseid, effect)
    if not isCreature(cid) then 
		return true
    end
    local corpse = getTileItemById(position, corpseid).uid
    if corpse <= 1 then 
		return
	end
    if not isContainer(corpse) then 
		return true
	end
    for slot = 0, (getContainerSize(corpse)-1) do
        local item = getContainerItem(corpse, slot)
        if item.uid <= 1 then 
			return 
		end
        if isStone(item.itemid) then
		    if stoneEffect[item.itemid] then
			    doSendMagicEffect(position, stoneEffect[item.itemid] - 1)
			end
		    --doSendMagicEffect(position, 285)
			addEvent(doSendMagicEffect, 1000, position, 285)
            return doSendMagicEffect(getThingPos(cid), effect)
        end
    end
end
function onKill(cid, target, lastHit)

    if not ehMonstro(target) then return true end
    local corpse = getMonsterInfo(getCreatureName(target)).lookCorpse
    
    addEvent(func, 5, getCreatureSummons(cid)[1], getThingPos(target), corpse, effect)
return true
end